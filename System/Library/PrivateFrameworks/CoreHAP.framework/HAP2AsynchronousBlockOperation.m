@interface HAP2AsynchronousBlockOperation
- (HAP2AsynchronousBlockOperation)init;
- (HAP2AsynchronousBlockOperation)initWithBlock:(id)a3;
- (HAP2AsynchronousBlockOperation)initWithName:(id)a3;
- (HAP2AsynchronousBlockOperation)initWithName:(id)a3 activity:(id)a4;
- (HAP2AsynchronousBlockOperation)initWithName:(id)a3 activity:(id)a4 block:(id)a5;
- (HAP2AsynchronousBlockOperation)initWithName:(id)a3 block:(id)a4;
- (HAP2AsynchronousBlockOperation)initWithName:(id)a3 optionalActivity:(id)a4;
- (void)initWithName:(uint64_t)a3 optionalActivity:(void *)a4 block:;
- (void)main;
@end

@implementation HAP2AsynchronousBlockOperation

- (void)main
{
  if (self)
  {
    v4 = (void (**)(void))self->_block;
    objc_setProperty_nonatomic_copy(self, v3, 0, 280);
  }
  else
  {
    v4 = 0;
  }
  v4[2]();
}

- (void).cxx_destruct
{
}

- (HAP2AsynchronousBlockOperation)initWithBlock:(id)a3
{
  id v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = [(HAP2AsynchronousBlockOperation *)self initWithName:v6 block:v4];

  return v7;
}

- (void)initWithName:(uint64_t)a3 optionalActivity:(void *)a4 block:
{
  id v7 = a4;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)HAP2AsynchronousBlockOperation;
    v8 = objc_msgSendSuper2(&v12, sel_initWithName_optionalActivity_, a2, a3);
    if (v8)
    {
      uint64_t v9 = MEMORY[0x1D944E2D0](v7);
      v10 = (void *)v8[35];
      v8[35] = v9;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (HAP2AsynchronousBlockOperation)initWithName:(id)a3 block:(id)a4
{
  return (HAP2AsynchronousBlockOperation *)-[HAP2AsynchronousBlockOperation initWithName:optionalActivity:block:](self, (uint64_t)a3, 0, a4);
}

- (HAP2AsynchronousBlockOperation)initWithName:(id)a3 activity:(id)a4 block:(id)a5
{
  return (HAP2AsynchronousBlockOperation *)-[HAP2AsynchronousBlockOperation initWithName:optionalActivity:block:](self, (uint64_t)a3, (uint64_t)a4, a5);
}

- (HAP2AsynchronousBlockOperation)initWithName:(id)a3 optionalActivity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v9 = *MEMORY[0x1E4F1C3B8];
  v10 = NSString;
  v11 = NSStringFromSelector(a2);
  objc_super v12 = [v10 stringWithFormat:@"%@ is unavailable", v11];
  id v13 = [v8 exceptionWithName:v9 reason:v12 userInfo:0];

  objc_exception_throw(v13);
}

- (HAP2AsynchronousBlockOperation)initWithName:(id)a3 activity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v9 = *MEMORY[0x1E4F1C3B8];
  v10 = NSString;
  v11 = NSStringFromSelector(a2);
  objc_super v12 = [v10 stringWithFormat:@"%@ is unavailable", v11];
  id v13 = [v8 exceptionWithName:v9 reason:v12 userInfo:0];

  objc_exception_throw(v13);
}

- (HAP2AsynchronousBlockOperation)initWithName:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  id v7 = NSString;
  v8 = NSStringFromSelector(a2);
  uint64_t v9 = [v7 stringWithFormat:@"%@ is unavailable", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (HAP2AsynchronousBlockOperation)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end