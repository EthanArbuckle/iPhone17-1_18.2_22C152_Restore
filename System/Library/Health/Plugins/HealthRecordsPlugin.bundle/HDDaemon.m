@interface HDDaemon
- (HDHealthRecordsDaemonExtension)healthRecordsDaemonExtension;
@end

@implementation HDDaemon

- (HDHealthRecordsDaemonExtension)healthRecordsDaemonExtension
{
  v4 = [(HDDaemon *)self daemonExtensionWithIdentifier:HKHealthRecordsPluginIdentifier];
  if (!v4)
  {
    v6 = +[NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"HDHealthRecordsDaemonExtension.m" lineNumber:48 description:@"Health Records Daemon Extension should not be nil"];
  }

  return (HDHealthRecordsDaemonExtension *)v4;
}

@end