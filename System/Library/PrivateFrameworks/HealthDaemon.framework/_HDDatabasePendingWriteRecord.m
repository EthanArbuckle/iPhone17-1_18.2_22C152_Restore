@interface _HDDatabasePendingWriteRecord
- (_HDDatabasePendingWriteRecord)init;
@end

@implementation _HDDatabasePendingWriteRecord

- (_HDDatabasePendingWriteRecord)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);

  objc_storeStrong(&self->_writeBlock, 0);
}

@end