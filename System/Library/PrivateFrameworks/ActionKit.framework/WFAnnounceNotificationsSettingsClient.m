@interface WFAnnounceNotificationsSettingsClient
+ (void)createClientWithCompletionHandler:(id)a3;
- (BBSettingsGateway)settingsGateway;
- (WFAnnounceNotificationsSettingsClient)initWithGateway:(id)a3;
- (void)getStateWithCompletionHandler:(id)a3;
- (void)setSettingsGateway:(id)a3;
- (void)setState:(BOOL)a3 completionHandler:(id)a4;
@end

@implementation WFAnnounceNotificationsSettingsClient

- (void).cxx_destruct
{
}

- (void)setSettingsGateway:(id)a3
{
}

- (BBSettingsGateway)settingsGateway
{
  return self->_settingsGateway;
}

- (void)setState:(BOOL)a3 completionHandler:(id)a4
{
  if (a3) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 1;
  }
  v7 = (void (**)(id, void))a4;
  v6 = [(WFAnnounceNotificationsSettingsClient *)self settingsGateway];
  [v6 setEffectiveGlobalAnnounceSetting:v5];

  v7[2](v7, 0);
}

- (void)getStateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFAnnounceNotificationsSettingsClient *)self settingsGateway];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __71__WFAnnounceNotificationsSettingsClient_getStateWithCompletionHandler___block_invoke;
  v7[3] = &unk_264E5A340;
  id v8 = v4;
  id v6 = v4;
  [v5 getEffectiveGlobalAnnounceSettingWithCompletion:v7];
}

uint64_t __71__WFAnnounceNotificationsSettingsClient_getStateWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (WFAnnounceNotificationsSettingsClient)initWithGateway:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFAnnounceNotificationsSettingsClient.m", 45, @"Invalid parameter not satisfying: %@", @"gateway" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)WFAnnounceNotificationsSettingsClient;
  v7 = [(WFAnnounceNotificationsSettingsClient *)&v12 init];
  id v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_settingsGateway, a3);
    v9 = v8;
  }

  return v8;
}

+ (void)createClientWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2050000000;
  uint64_t v5 = (void *)getBBSettingsGatewayClass_softClass;
  uint64_t v13 = getBBSettingsGatewayClass_softClass;
  if (!getBBSettingsGatewayClass_softClass)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __getBBSettingsGatewayClass_block_invoke;
    v9[3] = &unk_264E5EC88;
    v9[4] = &v10;
    __getBBSettingsGatewayClass_block_invoke((uint64_t)v9);
    uint64_t v5 = (void *)v11[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v10, 8);
  id v7 = objc_alloc_init(v6);
  id v8 = (void *)[objc_alloc((Class)a1) initWithGateway:v7];
  v4[2](v4, v8, 0);
}

@end