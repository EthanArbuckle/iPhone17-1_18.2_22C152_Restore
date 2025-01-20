@interface BuddySetupMethod
- (unint64_t)dataTransferMethod;
- (unint64_t)intendedDataTransferMethod;
- (unint64_t)intent;
- (void)setDataTransferMethod:(unint64_t)a3;
- (void)setDataTransferMethodIntent:(unint64_t)a3;
- (void)setIntendedDataTransferMethod:(unint64_t)a3;
- (void)setIntent:(unint64_t)a3;
@end

@implementation BuddySetupMethod

- (void)setDataTransferMethod:(unint64_t)a3
{
  self->_dataTransferMethod = a3;
  self->_intendedDataTransferMethod = 0;
}

- (void)setDataTransferMethodIntent:(unint64_t)a3
{
  self->_dataTransferMethod = 0;
  self->_intendedDataTransferMethod = a3;
}

- (unint64_t)dataTransferMethod
{
  return self->_dataTransferMethod;
}

- (unint64_t)intendedDataTransferMethod
{
  return self->_intendedDataTransferMethod;
}

- (void)setIntendedDataTransferMethod:(unint64_t)a3
{
  self->_intendedDataTransferMethod = a3;
}

- (unint64_t)intent
{
  return self->_intent;
}

- (void)setIntent:(unint64_t)a3
{
  self->_intent = a3;
}

@end