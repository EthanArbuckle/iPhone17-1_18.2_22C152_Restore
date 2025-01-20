@interface HPSHomeInterfaceMediator
- (HPSHomeInterface)settingsInterface;
- (HPSHomeInterfaceMediator)initWithInterface:(id)a3;
- (void)accessoryDidUpdateAttribute:(id)a3 withContext:(id)a4;
@end

@implementation HPSHomeInterfaceMediator

- (HPSHomeInterfaceMediator)initWithInterface:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HPSHomeInterfaceMediator;
  v5 = [(HPSHomeInterfaceMediator *)&v8 init];
  if (v5)
  {
    v6 = _HPSLoggingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[HPSHomeInterfaceMediator initWithInterface:]";
      _os_log_impl(&dword_23D144000, v6, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }

    objc_storeWeak((id *)&v5->_settingsInterface, v4);
  }

  return v5;
}

- (void)accessoryDidUpdateAttribute:(id)a3 withContext:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = _HPSLoggingFacility();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315650;
    uint64_t v11 = "-[HPSHomeInterfaceMediator accessoryDidUpdateAttribute:withContext:]";
    __int16 v12 = 2112;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl(&dword_23D144000, v8, OS_LOG_TYPE_INFO, "%s attribute %@ context %@", (uint8_t *)&v10, 0x20u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_settingsInterface);
  [WeakRetained _accessoryDidUpdateAttribute:v6 withContext:v7];
}

- (HPSHomeInterface)settingsInterface
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_settingsInterface);
  return (HPSHomeInterface *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end