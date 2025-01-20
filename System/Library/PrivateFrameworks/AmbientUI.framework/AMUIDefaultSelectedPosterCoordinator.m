@interface AMUIDefaultSelectedPosterCoordinator
- (AMAmbientDefaults)ambientDefaults;
- (AMUIPosterSelectionCoordinatingDelegate)delegate;
- (PRSPosterConfiguration)lastSelectedPosterConfiguration;
- (id)_currentChargerIdentifier;
- (id)lastSelectedPosterConfigurationUUIDForProviderBundleIdentifier:(id)a3;
- (void)setAmbientDefaults:(id)a3;
- (void)setDelegate:(id)a3;
- (void)updateLastSelectedPosterConfiguration:(id)a3 fromUserAction:(BOOL)a4;
@end

@implementation AMUIDefaultSelectedPosterCoordinator

- (void)setAmbientDefaults:(id)a3
{
  v5 = (AMAmbientDefaults *)a3;
  p_ambientDefaults = &self->_ambientDefaults;
  if (self->_ambientDefaults != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)p_ambientDefaults, a3);
    v7 = [[AMUILastSelectedPosterStore alloc] initWithAmbientDefaults:self->_ambientDefaults];
    lastSelectedPosterStore = self->_lastSelectedPosterStore;
    self->_lastSelectedPosterStore = v7;

    v5 = v9;
  }

  MEMORY[0x270F9A758](p_ambientDefaults, v5);
}

- (PRSPosterConfiguration)lastSelectedPosterConfiguration
{
  return self->_lastSelectedPosterConfiguration;
}

- (void)updateLastSelectedPosterConfiguration:(id)a3 fromUserAction:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_lastSelectedPosterConfiguration, a3);
    if (v4)
    {
      v8 = AMUILogSwitcher();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v7;
        _os_log_impl(&dword_247837000, v8, OS_LOG_TYPE_DEFAULT, "Selected Poster Coordinator updating selection to configuration %@", buf, 0xCu);
      }

      id v9 = objc_alloc_init(MEMORY[0x263F5F388]);
      uint64_t v10 = *MEMORY[0x263F5F3A0];
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __93__AMUIDefaultSelectedPosterCoordinator_updateLastSelectedPosterConfiguration_fromUserAction___block_invoke;
      v16[3] = &unk_265224ED0;
      id v17 = v7;
      [v9 updateSelectedForRoleIdentifier:v10 newlySelectedConfiguration:v17 completion:v16];
    }
    v11 = [(AMUIDefaultSelectedPosterCoordinator *)self delegate];
    [v11 posterSelectionCoordinator:self didUpdateLastSelectedPosterConfiguration:self->_lastSelectedPosterConfiguration];
  }
  if (v4)
  {
    lastSelectedPosterStore = self->_lastSelectedPosterStore;
    v13 = [v7 serverUUID];
    v14 = [(AMUIDefaultSelectedPosterCoordinator *)self _currentChargerIdentifier];
    v15 = [v7 providerBundleIdentifier];
    [(AMUILastSelectedPosterStore *)lastSelectedPosterStore setLastSelectedConfigurationUUID:v13 forChargerIdentifier:v14 providerBundleIdentifier:v15];
  }
}

void __93__AMUIDefaultSelectedPosterCoordinator_updateLastSelectedPosterConfiguration_fromUserAction___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = AMUILogSwitcher();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __93__AMUIDefaultSelectedPosterCoordinator_updateLastSelectedPosterConfiguration_fromUserAction___block_invoke_cold_1(a1, (uint64_t)v3, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_247837000, v5, OS_LOG_TYPE_INFO, "Selected Poster Coordinator completed updating selection to configuration %@", (uint8_t *)&v7, 0xCu);
  }
}

- (id)lastSelectedPosterConfigurationUUIDForProviderBundleIdentifier:(id)a3
{
  lastSelectedPosterStore = self->_lastSelectedPosterStore;
  id v5 = a3;
  uint64_t v6 = [(AMUIDefaultSelectedPosterCoordinator *)self _currentChargerIdentifier];
  int v7 = [(AMUILastSelectedPosterStore *)lastSelectedPosterStore lastSelectedConfigurationUUIDForChargerIdentifier:v6 providerBundleIdentifier:v5];

  return v7;
}

- (id)_currentChargerIdentifier
{
  id v3 = [(AMUIDefaultSelectedPosterCoordinator *)self delegate];
  BOOL v4 = [v3 posterSelectionCoordinatorRequestsConnectedChargerId:self];
  id v5 = v4;
  if (!v4) {
    BOOL v4 = @"(none)";
  }
  uint64_t v6 = v4;

  return v6;
}

- (AMUIPosterSelectionCoordinatingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (AMUIPosterSelectionCoordinatingDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AMAmbientDefaults)ambientDefaults
{
  return self->_ambientDefaults;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_lastSelectedPosterStore, 0);
  objc_storeStrong((id *)&self->_ambientDefaults, 0);

  objc_storeStrong((id *)&self->_lastSelectedPosterConfiguration, 0);
}

void __93__AMUIDefaultSelectedPosterCoordinator_updateLastSelectedPosterConfiguration_fromUserAction___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_247837000, log, OS_LOG_TYPE_ERROR, "Selected Poster Coordinator failed updating selection to configuration %@ with error %@", (uint8_t *)&v4, 0x16u);
}

@end