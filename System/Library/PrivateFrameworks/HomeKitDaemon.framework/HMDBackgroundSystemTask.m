@interface HMDBackgroundSystemTask
- (BGSystemTask)underlyingTask;
- (HMDBackgroundSystemTask)initWithUnderlyingTask:(id)a3;
- (void)setTaskCompleted;
@end

@implementation HMDBackgroundSystemTask

- (void).cxx_destruct
{
}

- (BGSystemTask)underlyingTask
{
  return self->_underlyingTask;
}

- (void)setTaskCompleted
{
  id v2 = [(HMDBackgroundSystemTask *)self underlyingTask];
  [v2 setTaskCompleted];
}

- (HMDBackgroundSystemTask)initWithUnderlyingTask:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDBackgroundSystemTask;
  v6 = [(HMDBackgroundSystemTask *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_underlyingTask, a3);
  }

  return v7;
}

@end