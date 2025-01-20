@interface _FEWeakHelper
- (_FEWeakHelper)initWithDeallocationBlock:(id)a3;
- (id)deallocationBlock;
- (void)dealloc;
- (void)invalidate;
- (void)setDeallocationBlock:(id)a3;
@end

@implementation _FEWeakHelper

- (_FEWeakHelper)initWithDeallocationBlock:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_FEWeakHelper;
  v5 = [(_FEWeakHelper *)&v8 init];
  v6 = v5;
  if (v5) {
    [(_FEWeakHelper *)v5 setDeallocationBlock:v4];
  }

  return v6;
}

- (void)invalidate
{
  self->_deallocationBlock = 0;
  MEMORY[0x270F9A758]();
}

- (void)dealloc
{
  if (self->_deallocationBlock)
  {
    int v3 = pthread_main_np();
    deallocationBlock = (void (**)(void))self->_deallocationBlock;
    if (v3 == 1) {
      ((void (**)(id))deallocationBlock)[2](self->_deallocationBlock);
    }
    else {
      dispatch_async(MEMORY[0x263EF83A0], deallocationBlock);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)_FEWeakHelper;
  [(_FEWeakHelper *)&v5 dealloc];
}

- (id)deallocationBlock
{
  return self->_deallocationBlock;
}

- (void)setDeallocationBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end