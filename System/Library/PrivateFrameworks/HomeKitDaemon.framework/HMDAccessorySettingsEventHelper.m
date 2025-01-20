@interface HMDAccessorySettingsEventHelper
- (BOOL)remoteEventAllowedForKeyPath:(id)a3 deviceType:(unint64_t)a4 userType:(unint64_t)a5;
- (HMDAccessorySettingsEventHelper)init;
- (HMDAccessorySettingsEventHelper)initWithKeyPathMap:(id)a3 keyPathList:(id)a4;
- (id)allTopicsForHome:(id)a3 accessory:(id)a4;
- (unint64_t)remoteDeviceAccessControlForKeyPath:(uint64_t)a1;
- (unint64_t)remoteDeviceAccessControlForTopic:(id)a3;
- (unint64_t)remoteUserAccessControlForKeyPath:(uint64_t)a1;
- (unint64_t)remoteUserAccessControlForTopic:(id)a3;
@end

@implementation HMDAccessorySettingsEventHelper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyPaths, 0);
  objc_storeStrong((id *)&self->_keyPathMap, 0);
}

- (BOOL)remoteEventAllowedForKeyPath:(id)a3 deviceType:(unint64_t)a4 userType:(unint64_t)a5
{
  id v8 = a3;
  BOOL v9 = (-[HMDAccessorySettingsEventHelper remoteUserAccessControlForKeyPath:]((uint64_t)self, (uint64_t)v8) & a5) != 0
    && (-[HMDAccessorySettingsEventHelper remoteDeviceAccessControlForKeyPath:]((uint64_t)self, (uint64_t)v8) & a4) != 0;

  return v9;
}

- (unint64_t)remoteUserAccessControlForKeyPath:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  v2 = [*(id *)(a1 + 8) objectForKeyedSubscript:a2];
  v3 = [v2 objectForKeyedSubscript:@"remoteUserAccessControl"];

  if (v3) {
    unint64_t v4 = +[HMDRemoteEventRouterAccessControl remoteUserAccessControlFromNumber:v3];
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

- (unint64_t)remoteDeviceAccessControlForKeyPath:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  v2 = [*(id *)(a1 + 8) objectForKeyedSubscript:a2];
  v3 = [v2 objectForKeyedSubscript:@"remoteDeviceAccessControl"];

  if (v3) {
    unint64_t v4 = +[HMDRemoteEventRouterAccessControl remoteDeviceAccessControlFromNumber:v3];
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

- (id)allTopicsForHome:(id)a3 accessory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263EFF8C0] array];
  if (self) {
    self = (HMDAccessorySettingsEventHelper *)self->_keyPaths;
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __62__HMDAccessorySettingsEventHelper_allTopicsForHome_accessory___block_invoke;
  v13[3] = &unk_264A2E5E8;
  id v14 = v6;
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  v11 = [(HMDAccessorySettingsEventHelper *)self na_map:v13];

  return v11;
}

void __62__HMDAccessorySettingsEventHelper_allTopicsForHome_accessory___block_invoke()
{
}

- (unint64_t)remoteDeviceAccessControlForTopic:(id)a3
{
  int v4 = HMImmutableSettingChangeEventComponentsFromTopic();
  id v5 = 0;
  id v6 = 0;
  id v7 = 0;
  unint64_t v8 = 0;
  if (v4) {
    unint64_t v8 = -[HMDAccessorySettingsEventHelper remoteDeviceAccessControlForKeyPath:]((uint64_t)self, (uint64_t)v7);
  }

  return v8;
}

- (unint64_t)remoteUserAccessControlForTopic:(id)a3
{
  int v4 = HMImmutableSettingChangeEventComponentsFromTopic();
  id v5 = 0;
  id v6 = 0;
  id v7 = 0;
  unint64_t v8 = 0;
  if (v4) {
    unint64_t v8 = -[HMDAccessorySettingsEventHelper remoteUserAccessControlForKeyPath:]((uint64_t)self, (uint64_t)v7);
  }

  return v8;
}

- (HMDAccessorySettingsEventHelper)init
{
  v3 = +[HMDAccessorySettingEventsGenerated keyPathMap];
  int v4 = +[HMDAccessorySettingEventsGenerated allKeyPaths];
  id v5 = [(HMDAccessorySettingsEventHelper *)self initWithKeyPathMap:v3 keyPathList:v4];

  return v5;
}

- (HMDAccessorySettingsEventHelper)initWithKeyPathMap:(id)a3 keyPathList:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDAccessorySettingsEventHelper;
  id v9 = [(HMDAccessorySettingsEventHelper *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_keyPathMap, a3);
    objc_storeStrong((id *)&v10->_keyPaths, a4);
  }

  return v10;
}

@end