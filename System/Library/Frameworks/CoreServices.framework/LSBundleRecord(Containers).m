@interface LSBundleRecord(Containers)
@end

@implementation LSBundleRecord(Containers)

- (void)getDataContainerURL:()Containers error:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_182959000, log, OS_LOG_TYPE_FAULT, "Expected a container but did not have one from MobileInstallation; must call out to MCM",
    v1,
    2u);
}

@end