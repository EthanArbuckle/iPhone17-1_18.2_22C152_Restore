@interface CKDRegisterOperationInfo
- (CKDRegisterOperationInfo)initWithOptions:(unint64_t)a3;
- (unint64_t)options;
@end

@implementation CKDRegisterOperationInfo

- (CKDRegisterOperationInfo)initWithOptions:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CKDRegisterOperationInfo;
  result = [(CKDRegisterOperationInfo *)&v5 init];
  if (result) {
    result->_options = a3;
  }
  return result;
}

- (unint64_t)options
{
  return self->_options;
}

@end