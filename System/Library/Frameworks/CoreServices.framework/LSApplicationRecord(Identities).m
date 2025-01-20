@interface LSApplicationRecord(Identities)
- (void)identities;
@end

@implementation LSApplicationRecord(Identities)

- (void)identities
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_182959000, log, OS_LOG_TYPE_FAULT, "bundle has no personas in database?", v1, 2u);
}

@end