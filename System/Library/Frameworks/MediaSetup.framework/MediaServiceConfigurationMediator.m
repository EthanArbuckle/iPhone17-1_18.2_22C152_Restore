@interface MediaServiceConfigurationMediator
- (MediaServiceConfigurationMediator)initWithServiceDelegate:(id)a3;
- (MediaServiceUpdatedServiceInterfaceDelegate)delegate;
- (void)serviceSettingDidUpdate:(id)a3 homeUserID:(id)a4;
- (void)setDelegate:(id)a3;
- (void)userDidRemoveService:(id)a3 homeUserID:(id)a4;
- (void)userDidUpdateDefaultService:(id)a3 homeUserID:(id)a4;
@end

@implementation MediaServiceConfigurationMediator

- (MediaServiceConfigurationMediator)initWithServiceDelegate:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MediaServiceConfigurationMediator;
  v5 = [(MediaServiceConfigurationMediator *)&v8 init];
  if (v5)
  {
    v6 = _MSLogingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[MediaServiceConfigurationMediator initWithServiceDelegate:]";
      _os_log_impl(&dword_225D52000, v6, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }

    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v5;
}

- (void)serviceSettingDidUpdate:(id)a3 homeUserID:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [(MediaServiceConfigurationMediator *)self delegate];

  if (v7)
  {
    objc_super v8 = [(MediaServiceConfigurationMediator *)self delegate];
    [v8 serviceSettingDidUpdate:v9 homeUserID:v6];
  }
}

- (void)userDidRemoveService:(id)a3 homeUserID:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [(MediaServiceConfigurationMediator *)self delegate];

  if (v7)
  {
    objc_super v8 = [(MediaServiceConfigurationMediator *)self delegate];
    [v8 userDidRemoveService:v9 homeUserID:v6];
  }
}

- (void)userDidUpdateDefaultService:(id)a3 homeUserID:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [(MediaServiceConfigurationMediator *)self delegate];

  if (v7)
  {
    objc_super v8 = [(MediaServiceConfigurationMediator *)self delegate];
    [v8 userDidUpdateDefaultService:v9 homeUserID:v6];
  }
}

- (MediaServiceUpdatedServiceInterfaceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MediaServiceUpdatedServiceInterfaceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end