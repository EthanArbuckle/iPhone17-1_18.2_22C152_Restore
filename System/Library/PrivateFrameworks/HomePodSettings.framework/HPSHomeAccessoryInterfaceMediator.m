@interface HPSHomeAccessoryInterfaceMediator
- (HPSHomeAccessoryInterfaceMediator)initWithInterface:(id)a3;
- (HPSHomeAccessorySettingsInterface)settingsInterface;
- (void)homekitaccessoryDidUpdateValueForEndpointIdentifier:(id)a3 keyPath:(id)a4 value:(id)a5;
@end

@implementation HPSHomeAccessoryInterfaceMediator

- (HPSHomeAccessoryInterfaceMediator)initWithInterface:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HPSHomeAccessoryInterfaceMediator;
  v5 = [(HPSHomeAccessoryInterfaceMediator *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_settingsInterface, v4);
  }

  return v6;
}

- (void)homekitaccessoryDidUpdateValueForEndpointIdentifier:(id)a3 keyPath:(id)a4 value:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_settingsInterface);
  if (WeakRetained)
  {
    v12 = _HPSLoggingFacility();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v13 = 136315906;
      v14 = "-[HPSHomeAccessoryInterfaceMediator homekitaccessoryDidUpdateValueForEndpointIdentifier:keyPath:value:]";
      __int16 v15 = 2112;
      id v16 = v8;
      __int16 v17 = 2112;
      id v18 = v9;
      __int16 v19 = 2112;
      id v20 = v10;
      _os_log_impl(&dword_23D144000, v12, OS_LOG_TYPE_INFO, "%s endpointID %@ keyPath %@ settingValue %@", (uint8_t *)&v13, 0x2Au);
    }

    [WeakRetained accessoryDidUpdateValueForEndpointIdentifier:v8 keyPath:v9 value:v10];
  }
}

- (HPSHomeAccessorySettingsInterface)settingsInterface
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_settingsInterface);
  return (HPSHomeAccessorySettingsInterface *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end