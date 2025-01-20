@interface SHLCloudBackedOperation
- (CKDatabaseOperation)operation;
- (CKDatabaseOperation)privateOperation;
- (SHLCloudBackedOperation)initWithOperation:(id)a3;
- (void)setPrivateOperation:(id)a3;
@end

@implementation SHLCloudBackedOperation

- (SHLCloudBackedOperation)initWithOperation:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHLCloudBackedOperation;
  v6 = [(SHLCloudBackedOperation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_privateOperation, a3);
  }

  return v7;
}

- (CKDatabaseOperation)operation
{
  v3 = [(SHLCloudBackedOperation *)self privateOperation];
  v4 = [v3 configuration];
  id v5 = [v4 copy];
  v6 = v5;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = (id)objc_opt_new();
  }
  v8 = v7;

  [v8 setAutomaticallyRetryNetworkFailures:0];
  [v8 setDiscretionaryNetworkBehavior:0];
  objc_super v9 = [(SHLCloudBackedOperation *)self privateOperation];
  [v9 setConfiguration:v8];

  v10 = [(SHLCloudBackedOperation *)self privateOperation];

  return (CKDatabaseOperation *)v10;
}

- (CKDatabaseOperation)privateOperation
{
  return self->_privateOperation;
}

- (void)setPrivateOperation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end