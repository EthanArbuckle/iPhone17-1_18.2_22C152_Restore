@interface HMITask
- (HMITask)initWithTaskID:(int)a3;
- (HMITask)initWithTaskID:(int)a3 timeout:(double)a4;
- (NSDictionary)results;
- (id)progressBlock;
- (int)taskID;
- (void)main;
- (void)mainInsideAutoreleasePool;
- (void)setProgressBlock:(id)a3;
@end

@implementation HMITask

- (HMITask)initWithTaskID:(int)a3
{
  return [(HMITask *)self initWithTaskID:*(void *)&a3 timeout:0.0];
}

- (HMITask)initWithTaskID:(int)a3 timeout:(double)a4
{
  v6.receiver = self;
  v6.super_class = (Class)HMITask;
  result = [(HMFOperation *)&v6 initWithTimeout:a4];
  if (result) {
    result->_taskID = a3;
  }
  return result;
}

- (NSDictionary)results
{
  v14[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(HMFOperation *)self error];
  if (v3
    && (v4 = (void *)v3,
        [(HMFOperation *)self error],
        v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 code],
        v5,
        v4,
        v6 == 12))
  {
    v7 = @"Canceled";
  }
  else
  {
    v8 = [(HMFOperation *)self error];

    v7 = @"Error";
    if (!v8) {
      v7 = @"Success";
    }
  }
  v13 = @"resultCode";
  v14[0] = v7;
  v9 = NSDictionary;
  v10 = v7;
  v11 = [v9 dictionaryWithObjects:v14 forKeys:&v13 count:1];

  return (NSDictionary *)v11;
}

- (void)main
{
  uint64_t v3 = (void *)MEMORY[0x22A641C70](self, a2);
  [(HMITask *)self mainInsideAutoreleasePool];
}

- (void)mainInsideAutoreleasePool
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (id)progressBlock
{
  return objc_getProperty(self, a2, 320, 1);
}

- (void)setProgressBlock:(id)a3
{
}

- (int)taskID
{
  return self->_taskID;
}

- (void).cxx_destruct
{
}

@end