@interface DAWaiterWrapper
- (DADataclassLockWatcher)waiter;
- (DAWaiterWrapper)init;
- (id)completionHandler;
- (id)description;
- (int)waiterNum;
- (int64_t)dataclasses;
- (void)setCompletionHandler:(id)a3;
- (void)setDataclasses:(int64_t)a3;
- (void)setWaiter:(id)a3;
@end

@implementation DAWaiterWrapper

- (DAWaiterWrapper)init
{
  v4.receiver = self;
  v4.super_class = (Class)DAWaiterWrapper;
  result = [(DAWaiterWrapper *)&v4 init];
  if (result)
  {
    int v3 = init___curWaiterNum;
    result->_waiterNum = init___curWaiterNum;
    init___curWaiterNum = v3 + 1;
  }
  return result;
}

- (id)description
{
  int v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)DAWaiterWrapper;
  objc_super v4 = [(DAWaiterWrapper *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@: waiter %@ wants dataclasses %lx", v4, self->_waiter, self->_dataclasses];

  return v5;
}

- (DADataclassLockWatcher)waiter
{
  return self->_waiter;
}

- (void)setWaiter:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (int64_t)dataclasses
{
  return self->_dataclasses;
}

- (void)setDataclasses:(int64_t)a3
{
  self->_dataclasses = a3;
}

- (int)waiterNum
{
  return self->_waiterNum;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_waiter, 0);
}

@end