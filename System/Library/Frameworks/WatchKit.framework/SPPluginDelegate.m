@interface SPPluginDelegate
- (id)rootObjectForPlugIn:(id)a3;
@end

@implementation SPPluginDelegate

- (id)rootObjectForPlugIn:(id)a3
{
  return +[SPRemoteInterface startRemoteInterface];
}

@end