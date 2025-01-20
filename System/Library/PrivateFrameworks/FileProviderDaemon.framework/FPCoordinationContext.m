@interface FPCoordinationContext
- (FPCoordinationContext)initWithProgress:(id)a3 completionHandler:(id)a4;
- (NSProgress)progress;
- (id)completionHandler;
@end

@implementation FPCoordinationContext

- (FPCoordinationContext)initWithProgress:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FPCoordinationContext;
  v9 = [(FPCoordinationContext *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_progress, a3);
    uint64_t v11 = MEMORY[0x1D9471EC0](v8);
    id completionHandler = v10->_completionHandler;
    v10->_id completionHandler = (id)v11;
  }
  return v10;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_progress, 0);
}

@end