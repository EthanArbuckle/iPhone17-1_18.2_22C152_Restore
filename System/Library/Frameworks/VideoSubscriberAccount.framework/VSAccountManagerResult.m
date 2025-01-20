@interface VSAccountManagerResult
- (NSOperation)operation;
- (VSAccountManagerResult)init;
- (VSAccountManagerResult)initWithOperation:(id)a3;
- (void)cancel;
- (void)setOperation:(id)a3;
@end

@implementation VSAccountManagerResult

- (VSAccountManagerResult)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (VSAccountManagerResult)initWithOperation:(id)a3
{
  id v5 = a3;
  if (!v5) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The operation parameter must not be nil."];
  }
  v9.receiver = self;
  v9.super_class = (Class)VSAccountManagerResult;
  v6 = [(VSAccountManagerResult *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_operation, a3);
  }

  return v7;
}

- (void)cancel
{
  id v2 = [(VSAccountManagerResult *)self operation];
  [v2 cancel];
}

- (NSOperation)operation
{
  return self->_operation;
}

- (void)setOperation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end