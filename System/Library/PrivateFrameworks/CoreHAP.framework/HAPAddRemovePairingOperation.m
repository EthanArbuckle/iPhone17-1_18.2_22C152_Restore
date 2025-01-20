@interface HAPAddRemovePairingOperation
- (BOOL)admin;
- (BOOL)operationExecuting;
- (HAPAddRemovePairingOperation)initWith:(int64_t)a3 identifier:(id)a4 publicKey:(id)a5 admin:(BOOL)a6 queue:(id)a7 completion:(id)a8;
- (NSData)publicKey;
- (NSString)identifier;
- (OS_dispatch_queue)queue;
- (id)completionHandler;
- (int64_t)operation;
- (void)setAdmin:(BOOL)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setOperation:(int64_t)a3;
- (void)setOperationExecuting:(BOOL)a3;
- (void)setPublicKey:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation HAPAddRemovePairingOperation

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setOperationExecuting:(BOOL)a3
{
  self->_operationExecuting = a3;
}

- (BOOL)operationExecuting
{
  return self->_operationExecuting;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setAdmin:(BOOL)a3
{
  self->_admin = a3;
}

- (BOOL)admin
{
  return self->_admin;
}

- (void)setPublicKey:(id)a3
{
}

- (NSData)publicKey
{
  return self->_publicKey;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setOperation:(int64_t)a3
{
  self->_operation = a3;
}

- (int64_t)operation
{
  return self->_operation;
}

- (HAPAddRemovePairingOperation)initWith:(int64_t)a3 identifier:(id)a4 publicKey:(id)a5 admin:(BOOL)a6 queue:(id)a7 completion:(id)a8
{
  BOOL v9 = a6;
  id v14 = a8;
  id v15 = a7;
  id v16 = a5;
  id v17 = a4;
  [(HAPAddRemovePairingOperation *)self setOperation:a3];
  [(HAPAddRemovePairingOperation *)self setIdentifier:v17];

  [(HAPAddRemovePairingOperation *)self setPublicKey:v16];
  [(HAPAddRemovePairingOperation *)self setAdmin:v9];
  [(HAPAddRemovePairingOperation *)self setQueue:v15];

  [(HAPAddRemovePairingOperation *)self setCompletionHandler:v14];
  [(HAPAddRemovePairingOperation *)self setOperationExecuting:0];
  return self;
}

@end