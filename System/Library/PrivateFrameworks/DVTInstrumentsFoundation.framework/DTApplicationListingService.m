@interface DTApplicationListingService
+ (void)registerCapabilities:(id)a3;
- (id)installedApplicationsMatching:(id)a3 registerUpdateToken:(id)a4;
- (void)_sendNotification:(id)a3 install:(BOOL)a4;
- (void)applicationInstalled:(id)a3;
- (void)applicationUninstalled:(id)a3;
- (void)unregisterUpdateToken:(id)a3;
@end

@implementation DTApplicationListingService

+ (void)registerCapabilities:(id)a3
{
}

- (void)applicationInstalled:(id)a3
{
}

- (void)applicationUninstalled:(id)a3
{
}

- (void)_sendNotification:(id)a3 install:(BOOL)a4
{
  v5 = &selRef_applicationInstalled_;
  if (!a4) {
    v5 = &selRef_applicationUninstalled_;
  }
  [MEMORY[0x263F38CA0] messageWithSelector:*v5 objectArguments:a3];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = [(DTXService *)self channel];
  [v6 sendControlAsync:v7 replyHandler:0];
}

- (id)installedApplicationsMatching:(id)a3 registerUpdateToken:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[DTApplicationWorkspaceObserver sharedInstance];
  v9 = [v8 registerNotificationToken:v6 observer:self query:v7];

  v10 = [(DTXService *)self channel];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_230912978;
  v13[3] = &unk_264B8DA70;
  id v14 = v6;
  v15 = self;
  id v11 = v6;
  [v10 registerDisconnectHandler:v13];

  return v9;
}

- (void)unregisterUpdateToken:(id)a3
{
  id v4 = a3;
  id v5 = +[DTApplicationWorkspaceObserver sharedInstance];
  [v5 unregisterNotificationToken:v4 observer:self];
}

@end