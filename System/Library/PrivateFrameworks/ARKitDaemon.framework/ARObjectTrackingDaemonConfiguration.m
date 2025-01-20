@interface ARObjectTrackingDaemonConfiguration
- (BOOL)hasLibraryDirectoryReadWriteAccess;
- (BOOL)isInProcess;
- (BOOL)supportsWatchdog;
- (Class)controlClass;
@end

@implementation ARObjectTrackingDaemonConfiguration

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
  return 0;
}

- (BOOL)supportsWatchdog
{
  return 0;
}

@end