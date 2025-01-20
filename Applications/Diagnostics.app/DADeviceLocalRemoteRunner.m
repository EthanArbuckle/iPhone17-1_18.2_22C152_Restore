@interface DADeviceLocalRemoteRunner
- (id)_createDeviceConnection;
@end

@implementation DADeviceLocalRemoteRunner

- (id)_createDeviceConnection
{
  return +[DARemoteRunnerManager sharedInstance];
}

@end