@interface _SFOpenURLOperationDelegate
- (_SFOpenURLOperationDelegate)initWithCompletionHandler:(id)a3;
- (void)_didFinishWithSuccess:(BOOL)a3;
- (void)openResourceOperation:(id)a3 didFailWithError:(id)a4;
- (void)openResourceOperationDidComplete:(id)a3;
@end

@implementation _SFOpenURLOperationDelegate

- (_SFOpenURLOperationDelegate)initWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (v4
    && (v9.receiver = self,
        v9.super_class = (Class)_SFOpenURLOperationDelegate,
        (self = [(_SFOpenURLOperationDelegate *)&v9 init]) != 0))
  {
    v5 = (void *)MEMORY[0x1AD0C36A0](v4);
    id completionHandler = self->_completionHandler;
    self->_id completionHandler = v5;

    self = self;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_didFinishWithSuccess:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53___SFOpenURLOperationDelegate__didFinishWithSuccess___block_invoke;
  v3[3] = &unk_1E5C72988;
  v3[4] = self;
  BOOL v4 = a3;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

- (void)openResourceOperationDidComplete:(id)a3
{
}

- (void)openResourceOperation:(id)a3 didFailWithError:(id)a4
{
}

- (void).cxx_destruct
{
}

@end