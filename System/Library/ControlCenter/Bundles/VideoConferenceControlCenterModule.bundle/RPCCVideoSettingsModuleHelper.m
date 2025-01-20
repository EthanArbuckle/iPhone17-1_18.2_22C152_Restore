@interface RPCCVideoSettingsModuleHelper
- (RPCCVideoSettingsModuleHelper)init;
- (void)dealloc;
@end

@implementation RPCCVideoSettingsModuleHelper

- (RPCCVideoSettingsModuleHelper)init
{
  v3 = (RPCCVideoSettingsModuleHelper *)objc_opt_new();

  return v3;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)RPCCVideoSettingsModuleHelper;
  [(RPCCVideoSettingsModuleHelper *)&v2 dealloc];
}

@end