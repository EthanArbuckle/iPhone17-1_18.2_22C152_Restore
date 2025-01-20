@interface ARMainDaemonConfiguration
- (ARMainDaemonConfiguration)init;
- (BOOL)hasLibraryDirectoryReadWriteAccess;
- (BOOL)isInProcess;
- (BOOL)supportsWatchdog;
- (Class)controlClass;
@end

@implementation ARMainDaemonConfiguration

- (ARMainDaemonConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)ARMainDaemonConfiguration;
  return [(ARMainDaemonConfiguration *)&v3 init];
}

- (Class)controlClass
{
  return (Class)objc_opt_class();
}

- (BOOL)hasLibraryDirectoryReadWriteAccess
{
  return 1;
}

- (BOOL)isInProcess
{
  return 0;
}

- (BOOL)supportsWatchdog
{
  return 1;
}

@end