@interface _WKWebPushDaemonConnectionConfiguration
- (NSString)bundleIdentifier;
- (NSString)machServiceName;
- (NSString)partition;
- (_WKWebPushDaemonConnectionConfiguration)init;
- (void)setBundleIdentifier:(id)a3;
- (void)setMachServiceName:(id)a3;
- (void)setPartition:(id)a3;
@end

@implementation _WKWebPushDaemonConnectionConfiguration

- (_WKWebPushDaemonConnectionConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)_WKWebPushDaemonConnectionConfiguration;
  result = [(_WKWebPushDaemonConnectionConfiguration *)&v3 init];
  if (result) {
    result->_machServiceName = (NSString *)@"com.apple.webkit.webpushd.service";
  }
  return result;
}

- (NSString)machServiceName
{
  return self->_machServiceName;
}

- (void)setMachServiceName:(id)a3
{
}

- (NSString)partition
{
  return self->_partition;
}

- (void)setPartition:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

@end