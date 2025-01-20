@interface CKDMMCSGetOperationInfo
- (unint64_t)destination;
- (void)setDestination:(unint64_t)a3;
@end

@implementation CKDMMCSGetOperationInfo

- (unint64_t)destination
{
  return self->_destination;
}

- (void)setDestination:(unint64_t)a3
{
  self->_destination = a3;
}

@end