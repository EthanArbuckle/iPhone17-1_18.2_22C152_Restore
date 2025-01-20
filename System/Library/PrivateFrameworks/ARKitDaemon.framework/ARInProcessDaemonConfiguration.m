@interface ARInProcessDaemonConfiguration
- (BOOL)hasLibraryDirectoryReadWriteAccess;
- (BOOL)isInProcess;
- (BOOL)supportsWatchdog;
- (Class)controlClass;
@end

@implementation ARInProcessDaemonConfiguration

- (Class)controlClass
{
  return (Class)objc_opt_class();
}

- (BOOL)hasLibraryDirectoryReadWriteAccess
{
  return 0;
}

- (BOOL)isInProcess
{
  return 1;
}

- (BOOL)supportsWatchdog
{
  return 0;
}

@end