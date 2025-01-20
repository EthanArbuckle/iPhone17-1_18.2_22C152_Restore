@interface CKDOperationInfoHolderOperation
- (CKDOperationInfoHolderOperation)initWithOperationInfo:(id)a3 container:(id)a4 operationType:(int)a5;
- (int)operationType;
- (void)main;
- (void)setOperationType:(int)a3;
@end

@implementation CKDOperationInfoHolderOperation

- (CKDOperationInfoHolderOperation)initWithOperationInfo:(id)a3 container:(id)a4 operationType:(int)a5
{
  v7.receiver = self;
  v7.super_class = (Class)CKDOperationInfoHolderOperation;
  result = [(CKDOperation *)&v7 initWithOperationInfo:a3 container:a4];
  if (result) {
    result->_operationType = a5;
  }
  return result;
}

- (void)main
{
}

- (int)operationType
{
  return self->_operationType;
}

- (void)setOperationType:(int)a3
{
  self->_operationType = a3;
}

@end