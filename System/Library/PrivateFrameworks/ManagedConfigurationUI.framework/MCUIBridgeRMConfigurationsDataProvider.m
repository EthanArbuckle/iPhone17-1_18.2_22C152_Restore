@interface MCUIBridgeRMConfigurationsDataProvider
- (MCUIBridgeRMConfigurationsDataProvider)initWithProfileIdentifier:(id)a3;
- (NSString)profileIdentifier;
- (id)_rmConfigurationViewModels;
- (id)pluginSectionViewModels;
- (id)pluginViewModels;
- (id)profileViewModels;
- (void)setConfigurationActivated:(BOOL)a3 forViewModel:(id)a4 completionHandler:(id)a5;
- (void)setProfileIdentifier:(id)a3;
@end

@implementation MCUIBridgeRMConfigurationsDataProvider

- (MCUIBridgeRMConfigurationsDataProvider)initWithProfileIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MCUIBridgeRMConfigurationsDataProvider;
  v6 = [(MCUIBridgeRMConfigurationsDataProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_profileIdentifier, a3);
  }

  return v7;
}

- (id)profileViewModels
{
  v2 = [(MCUIBridgeRMConfigurationsDataProvider *)self _rmConfigurationViewModels];
  v3 = [v2 profileViewModels];
  v4 = v3;
  if (!v3) {
    v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v5 = v3;

  return v5;
}

- (id)pluginSectionViewModels
{
  v2 = [(MCUIBridgeRMConfigurationsDataProvider *)self _rmConfigurationViewModels];
  v3 = [v2 pluginSectionViewModels];
  v4 = v3;
  if (!v3) {
    v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v5 = v3;

  return v5;
}

- (id)pluginViewModels
{
  v2 = [(MCUIBridgeRMConfigurationsDataProvider *)self _rmConfigurationViewModels];
  v3 = [v2 pluginViewModels];
  v4 = v3;
  if (!v3) {
    v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v5 = v3;

  return v5;
}

- (id)_rmConfigurationViewModels
{
  v3 = +[MCUIWatchManager shared];
  v4 = [v3 cachedRMConfigurationViewModelsForIdentifier:self->_profileIdentifier];

  return v4;
}

- (void)setConfigurationActivated:(BOOL)a3 forViewModel:(id)a4 completionHandler:(id)a5
{
  BOOL v5 = a3;
  v6 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v7 = *MEMORY[0x1E4F5E6B0];
  v8 = (void (**)(id, void, void *))a5;
  objc_super v9 = DMCErrorArray();
  objc_msgSend(v6, "DMCErrorWithDomain:code:descriptionArray:errorType:", v7, 15008, v9, *MEMORY[0x1E4F5E6B8], 0);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  v10 = (void *)[objc_alloc(MEMORY[0x1E4F95DC8]) initWithError:v11 isActivating:v5];
  v8[2](v8, 0, v10);
}

- (NSString)profileIdentifier
{
  return self->_profileIdentifier;
}

- (void)setProfileIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end