@interface HPAccessorySettingServiceMediator
- (HPAccessorySettingServiceMediator)initWithInterface:(id)a3;
- (HPSAccessorySettingService)settingsInterface;
- (void)didUpdateHH2State:(BOOL)a3;
- (void)notifyDidUpdateSetting:(id)a3 forKeyPath:(id)a4;
@end

@implementation HPAccessorySettingServiceMediator

- (HPAccessorySettingServiceMediator)initWithInterface:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HPAccessorySettingServiceMediator;
  v5 = [(HPAccessorySettingServiceMediator *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_settingsInterface, v4);
  }

  return v6;
}

- (void)notifyDidUpdateSetting:(id)a3 forKeyPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HPAccessorySettingServiceMediator *)self settingsInterface];
  [v8 notifyDidUpdateSetting:v7 forKeyPath:v6];
}

- (void)didUpdateHH2State:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x263EF8340];
  v5 = _HPSLoggingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v13 = v3;
    _os_log_impl(&dword_23D144000, v5, OS_LOG_TYPE_DEFAULT, "Posting notification OptedToHH2State changed. OptedToHH2 %d", buf, 8u);
  }

  id v6 = [(HPAccessorySettingServiceMediator *)self settingsInterface];
  [v6 setMigrationToHH2Complete:v3];

  id v7 = [MEMORY[0x263F08A00] defaultCenter];
  id v8 = objc_msgSend(NSNumber, "numberWithBool:", v3, @"optedtohh2state");
  v11 = v8;
  v9 = [NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  [v7 postNotificationName:@"com.apple.homepodsettings.optedtohh2state" object:0 userInfo:v9];
}

- (HPSAccessorySettingService)settingsInterface
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_settingsInterface);
  return (HPSAccessorySettingService *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end