@interface IDSTransactionLogBaseTaskHandler
- (IDSTransactionLogBaseTaskHandler)initWithTask:(id)a3 delegate:(id)a4 queue:(id)a5;
- (IDSTransactionLogTask)task;
- (OS_dispatch_queue)queue;
- (void)perform;
- (void)setQueue:(id)a3;
- (void)setTask:(id)a3;
@end

@implementation IDSTransactionLogBaseTaskHandler

- (IDSTransactionLogBaseTaskHandler)initWithTask:(id)a3 delegate:(id)a4 queue:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)IDSTransactionLogBaseTaskHandler;
  v10 = [(IDSTransactionLogTaskHandler *)&v13 _init];
  v11 = (IDSTransactionLogBaseTaskHandler *)v10;
  if (v10)
  {
    objc_storeStrong(v10 + 1, a3);
    objc_storeStrong((id *)&v11->_queue, a5);
  }

  return v11;
}

- (void)perform
{
  id v3 = [(IDSTransactionLogBaseTaskHandler *)self task];
  v2 = [MEMORY[0x1E4F28C58] errorWithDomain:IDSTransactionLogErrorDomain code:-1000 userInfo:0];
  [v3 _completeWithError:v2];
}

- (IDSTransactionLogTask)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_task, 0);
}

@end