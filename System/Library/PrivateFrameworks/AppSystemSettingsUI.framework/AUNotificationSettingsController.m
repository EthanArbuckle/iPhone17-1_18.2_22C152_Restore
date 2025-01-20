@interface AUNotificationSettingsController
+ (id)sharedInstance;
- (AUNotificationSettingsController)init;
- (id)allSectionInfoIdentifiers;
- (id)sectionInfoForIdentifier:(id)a3;
- (void)dealloc;
@end

@implementation AUNotificationSettingsController

+ (id)sharedInstance
{
  if (sharedInstance___once[0] != -1) {
    dispatch_once(sharedInstance___once, &__block_literal_global_3);
  }
  v2 = (void *)sharedInstance___instance;
  return v2;
}

uint64_t __50__AUNotificationSettingsController_sharedInstance__block_invoke()
{
  sharedInstance___instance = objc_alloc_init(AUNotificationSettingsController);
  return MEMORY[0x270F9A758]();
}

- (AUNotificationSettingsController)init
{
  v8.receiver = self;
  v8.super_class = (Class)AUNotificationSettingsController;
  v2 = [(AUNotificationSettingsController *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.preferences.BBSettingsGateway", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x263F2BCC0]) initWithQueue:v2->_queue];
    gateway = v2->_gateway;
    v2->_gateway = (BBSettingsGateway *)v5;
  }
  return v2;
}

- (void)dealloc
{
  [(BBSettingsGateway *)self->_gateway invalidate];
  v3.receiver = self;
  v3.super_class = (Class)AUNotificationSettingsController;
  [(AUNotificationSettingsController *)&v3 dealloc];
}

- (id)allSectionInfoIdentifiers
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  v4 = [(BBSettingsGateway *)self->_gateway allSectionInfo];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) sectionID];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)sectionInfoForIdentifier:(id)a3
{
  return (id)[(BBSettingsGateway *)self->_gateway sectionInfoForSectionID:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionInfosByIdentifier, 0);
  objc_storeStrong((id *)&self->_gateway, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end