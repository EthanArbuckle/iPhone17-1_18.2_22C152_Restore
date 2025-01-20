@interface HKFetchOperation
- (BOOL)highPriority;
- (HKFetchOperation)initWithOperationDescription:(id)a3;
- (HKFetchOperationDelegate)_delegate;
- (NSString)operationDescription;
- (NSUUID)UUID;
- (double)executionTime;
- (double)queueTime;
- (void)_alertDelegateDidUpdatePriority;
- (void)_setDelegate:(id)a3;
- (void)setExecutionTime:(double)a3;
- (void)setHighPriority:(BOOL)a3;
- (void)setQueueTime:(double)a3;
- (void)startOperationWithCompletion:(id)a3;
- (void)stopOperation;
@end

@implementation HKFetchOperation

- (HKFetchOperation)initWithOperationDescription:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKFetchOperation;
  v6 = [(HKFetchOperation *)&v10 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F29128] UUID];
    UUID = v6->_UUID;
    v6->_UUID = (NSUUID *)v7;

    v6->_highPriority = 0;
    objc_storeStrong((id *)&v6->_operationDescription, a3);
    v6->_queueTime = 0.0;
    v6->_executionTime = 0.0;
  }

  return v6;
}

- (void)setHighPriority:(BOOL)a3
{
  self->_highPriority = a3;
  [(HKFetchOperation *)self _alertDelegateDidUpdatePriority];
}

- (void)_alertDelegateDidUpdatePriority
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained fetchOperationDidUpdatePriority:self];
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (NSString)operationDescription
{
  return self->_operationDescription;
}

- (BOOL)highPriority
{
  return self->_highPriority;
}

- (HKFetchOperationDelegate)_delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HKFetchOperationDelegate *)WeakRetained;
}

- (void)_setDelegate:(id)a3
{
}

- (double)queueTime
{
  return self->_queueTime;
}

- (void)setQueueTime:(double)a3
{
  self->_queueTime = a3;
}

- (double)executionTime
{
  return self->_executionTime;
}

- (void)setExecutionTime:(double)a3
{
  self->_executionTime = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_operationDescription, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

- (void)startOperationWithCompletion:(id)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

- (void)stopOperation
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

@end