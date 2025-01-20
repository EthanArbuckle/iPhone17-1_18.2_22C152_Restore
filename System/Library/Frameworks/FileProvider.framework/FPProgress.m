@interface FPProgress
- (FPProgress)initWithOperation:(id)a3;
- (void)cancel;
@end

@implementation FPProgress

- (FPProgress)initWithOperation:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"FPProgress.m", 17, @"Invalid parameter not satisfying: %@", @"operation" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)FPProgress;
  v7 = [(FPProgress *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_operation, a3);
  }

  return v8;
}

- (void)cancel
{
  [(NSOperation *)self->_operation cancel];
  v3.receiver = self;
  v3.super_class = (Class)FPProgress;
  [(FPProgress *)&v3 cancel];
}

- (void).cxx_destruct
{
}

@end