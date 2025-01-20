@interface FMDFMIPManager(Private)
- (void)_postWipePrefPath;
@end

@implementation FMDFMIPManager(Private)

- (void)_postWipePrefPath
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D0E93000, log, OS_LOG_TYPE_FAULT, "Post wipe pref path could not obtain mobile's home directory", v1, 2u);
}

@end