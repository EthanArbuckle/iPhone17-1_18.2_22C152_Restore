@interface UNUserNotificationCenterDelegateService
+ (id)serverInterface;
+ (id)serviceNameForBundleIdentifier:(id)a3;
@end

@implementation UNUserNotificationCenterDelegateService

+ (id)serverInterface
{
  if (serverInterface_onceToken_0 != -1) {
    dispatch_once(&serverInterface_onceToken_0, &__block_literal_global_7);
  }
  v2 = (void *)serverInterface___interface_0;

  return v2;
}

void __58__UNUserNotificationCenterDelegateService_serverInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F063AD78];
  v1 = (void *)serverInterface___interface_0;
  serverInterface___interface_0 = v0;

  v2 = (void *)serverInterface___interface_0;
  v3 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v3 forSelector:sel_didReceiveNotificationResponse_forBundleIdentifier_withCompletionHandler_ argumentIndex:0 ofReply:0];

  v4 = (void *)serverInterface___interface_0;
  v5 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v4 setClasses:v5 forSelector:sel_didReceiveNotificationResponse_forBundleIdentifier_withCompletionHandler_ argumentIndex:1 ofReply:0];

  v6 = (void *)serverInterface___interface_0;
  v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v6 setClasses:v7 forSelector:sel_didChangeSettings_forBundleIdentifier_ argumentIndex:0 ofReply:0];

  v8 = (void *)serverInterface___interface_0;
  objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v8 setClasses:v9 forSelector:sel_didOpenApplicationForResponse_forBundleIdentifier_ argumentIndex:0 ofReply:0];
}

+ (id)serviceNameForBundleIdentifier:(id)a3
{
  return (id)[@"com.apple.usernotifications.delegate." stringByAppendingString:a3];
}

@end