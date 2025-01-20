@interface CATSerialOperationQueue
- (CATSerialOperationQueue)init;
- (id)debugDescription;
- (void)addOperation:(id)a3;
@end

@implementation CATSerialOperationQueue

- (CATSerialOperationQueue)init
{
  v5.receiver = self;
  v5.super_class = (Class)CATSerialOperationQueue;
  v2 = [(CATSerialOperationQueue *)&v5 init];
  v3 = v2;
  if (v2) {
    [(CATSerialOperationQueue *)v2 setMaxConcurrentOperationCount:1];
  }
  return v3;
}

- (id)debugDescription
{
  v3 = (void *)MEMORY[0x263F089D8];
  v10.receiver = self;
  v10.super_class = (Class)CATSerialOperationQueue;
  v4 = [(CATOperationQueue *)&v10 description];
  objc_super v5 = [v3 stringWithString:v4];

  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[CATSerialOperationQueue isSuspended](self, "isSuspended"));
  [v5 appendFormat:@"\nSuspended: %@", v6];

  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CATSerialOperationQueue operationCount](self, "operationCount"));
  [v5 appendFormat:@"\nOperation Count: %@", v7];

  v8 = [(CATSerialOperationQueue *)self operations];
  [v5 appendFormat:@"\nOperations: %@", v8];

  return v5;
}

- (void)addOperation:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mLastOperation);
  if (WeakRetained) {
    [v4 addDependency:WeakRetained];
  }
  objc_storeWeak((id *)&self->mLastOperation, v4);
  v6.receiver = self;
  v6.super_class = (Class)CATSerialOperationQueue;
  [(CATOperationQueue *)&v6 addOperation:v4];
}

- (void).cxx_destruct
{
}

@end