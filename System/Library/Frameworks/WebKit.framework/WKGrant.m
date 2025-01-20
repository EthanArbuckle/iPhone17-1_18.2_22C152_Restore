@interface WKGrant
- (void)invalidateGrant;
@end

@implementation WKGrant

- (void)invalidateGrant
{
  v2 = qword_1EB358960;
  if (os_log_type_enabled((os_log_t)qword_1EB358960, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1985F2000, v2, OS_LOG_TYPE_FAULT, "-[WKGrant invalidateGrant] should never be called", v3, 2u);
  }
}

@end