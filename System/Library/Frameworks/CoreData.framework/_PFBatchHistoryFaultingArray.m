@interface _PFBatchHistoryFaultingArray
+ (Class)classForKeyedUnarchiver;
- (Class)classForCoder;
- (_PFBatchHistoryFaultingArray)initWithPFBatchFaultingArray:(id)a3;
- (id)transaction;
- (void)_setTransaction:(id)a3;
@end

@implementation _PFBatchHistoryFaultingArray

- (_PFBatchHistoryFaultingArray)initWithPFBatchFaultingArray:(id)a3
{
  return [(_PFBatchFaultingArray *)self initWithPFArray:*((void *)a3 + 2) andRequest:*((void *)a3 + 5) andContext:*((void *)a3 + 4)];
}

- (id)transaction
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->super._moc, a2);
  }
  return self->_transaction;
}

- (void)_setTransaction:(id)a3
{
  if (_PF_Threading_Debugging_level) {
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)self->super._moc, a2);
  }
  self->_transaction = (NSPersistentHistoryTransaction *)a3;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

@end