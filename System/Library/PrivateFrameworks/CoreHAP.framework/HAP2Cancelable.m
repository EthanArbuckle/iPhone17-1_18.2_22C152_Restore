@interface HAP2Cancelable
+ (HAP2Cancelable)cancelableWithBlock:(id)a3;
+ (HAP2Cancelable)new;
+ (id)ignore;
- (HAP2Cancelable)init;
- (HAP2Cancelable)initWithBlock:(id)a3;
- (id)block;
- (void)cancelWithError:(id)a3;
- (void)setBlock:(id)a3;
@end

@implementation HAP2Cancelable

- (void).cxx_destruct
{
}

- (void)setBlock:(id)a3
{
}

- (id)block
{
  return self->_block;
}

- (void)cancelWithError:(id)a3
{
  id v4 = a3;
  if ((atomic_exchange((atomic_uchar *volatile)&self->_called, 1u) & 1) == 0)
  {
    id v6 = v4;
    v5 = [(HAP2Cancelable *)self block];
    if (v5)
    {
      [(HAP2Cancelable *)self setBlock:0];
      ((void (**)(void, id))v5)[2](v5, v6);
    }

    id v4 = v6;
  }
}

- (HAP2Cancelable)initWithBlock:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HAP2Cancelable;
  v5 = [(HAP2Cancelable *)&v10 init];
  id v6 = v5;
  if (v5)
  {
    v5->_called = 0;
    uint64_t v7 = MEMORY[0x1D944E2D0](v4);
    id block = v6->_block;
    v6->_id block = (id)v7;
  }
  return v6;
}

- (HAP2Cancelable)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)ignore
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24__HAP2Cancelable_ignore__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (ignore_onceToken != -1) {
    dispatch_once(&ignore_onceToken, block);
  }
  v2 = (void *)ignore_cancelable;

  return v2;
}

uint64_t __24__HAP2Cancelable_ignore__block_invoke()
{
  ignore_cancelable = [objc_alloc((Class)objc_opt_class()) initWithBlock:0];

  return MEMORY[0x1F41817F8]();
}

+ (HAP2Cancelable)cancelableWithBlock:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBlock:v3];

  return (HAP2Cancelable *)v4;
}

+ (HAP2Cancelable)new
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end