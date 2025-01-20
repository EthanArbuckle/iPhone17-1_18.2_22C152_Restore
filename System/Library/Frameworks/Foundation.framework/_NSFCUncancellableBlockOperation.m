@interface _NSFCUncancellableBlockOperation
- (void)cancel;
@end

@implementation _NSFCUncancellableBlockOperation

- (void)cancel
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if (qword_1EB1EDDD0 != -1) {
    dispatch_once(&qword_1EB1EDDD0, &__block_literal_global_922);
  }
  v2 = qword_1EB1EDD30;
  if (os_log_type_enabled((os_log_t)qword_1EB1EDD30, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_181795000, v2, OS_LOG_TYPE_INFO, "Refusing to cancel a File Coordination-originating operation", v3, 2u);
  }
}

@end