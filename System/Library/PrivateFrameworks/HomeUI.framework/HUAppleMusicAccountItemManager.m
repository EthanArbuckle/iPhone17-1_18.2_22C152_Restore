@interface HUAppleMusicAccountItemManager
- (BOOL)_showAppleMusicSettings;
- (BOOL)_showPrimaryUserSettings;
- (BOOL)shouldDisableUpdates;
- (HFMediaProfileContainer)mediaProfileContainer;
- (HUAppleMusicAccountItemManager)initWithMediaProfileContainer:(id)a3 delegate:(id)a4;
- (HUAppleMusicAccountModule)appleMusicAccountModule;
- (HUPrimaryUserSettingsItemModule)primaryUserSettingsItemModule;
- (id)_buildItemModulesForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (void)_moduleStateDidChangeFrom:(unint64_t)a3 to:(unint64_t)a4;
- (void)setAppleMusicAccountModule:(id)a3;
- (void)setPrimaryUserSettingsItemModule:(id)a3;
- (void)setShouldDisableUpdates:(BOOL)a3;
@end

@implementation HUAppleMusicAccountItemManager

- (HUAppleMusicAccountItemManager)initWithMediaProfileContainer:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUAppleMusicAccountItemManager;
  v8 = [(HFItemManager *)&v11 initWithDelegate:a4];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_mediaProfileContainer, a3);
  }

  return v9;
}

- (id)_buildItemModulesForHome:(id)a3
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_new();
  if ([(HUAppleMusicAccountItemManager *)self _showAppleMusicSettings])
  {
    v6 = [HUAppleMusicAccountModule alloc];
    id v7 = [(HUAppleMusicAccountItemManager *)self mediaProfileContainer];
    v8 = [(HUAppleMusicAccountModule *)v6 initWithMediaProfileContainer:v7 itemUpdater:self];
    [(HUAppleMusicAccountItemManager *)self setAppleMusicAccountModule:v8];

    objc_initWeak(location, self);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __59__HUAppleMusicAccountItemManager__buildItemModulesForHome___block_invoke;
    v19[3] = &unk_1E6391FD8;
    objc_copyWeak(&v20, location);
    v9 = [(HUAppleMusicAccountItemManager *)self appleMusicAccountModule];
    [v9 setStateChangeObserver:v19];

    v10 = [(HUAppleMusicAccountItemManager *)self appleMusicAccountModule];
    [v5 addObject:v10];

    objc_destroyWeak(&v20);
    objc_destroyWeak(location);
  }
  else
  {
    objc_super v11 = HFLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v17 = [(HUAppleMusicAccountItemManager *)self mediaProfileContainer];
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v17;
      _os_log_debug_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEBUG, "Not showing AppleMusic Module for %@", (uint8_t *)location, 0xCu);
    }
  }
  if ([(HUAppleMusicAccountItemManager *)self _showPrimaryUserSettings])
  {
    v12 = [HUPrimaryUserSettingsItemModule alloc];
    v13 = [(HUAppleMusicAccountItemManager *)self mediaProfileContainer];
    v14 = [(HUPrimaryUserSettingsItemModule *)v12 initWithItemUpdater:self home:v4 mediaProfileContainer:v13];
    [(HUAppleMusicAccountItemManager *)self setPrimaryUserSettingsItemModule:v14];

    v15 = [(HUAppleMusicAccountItemManager *)self primaryUserSettingsItemModule];
    [v5 addObject:v15];
  }
  else
  {
    v15 = HFLogForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v18 = [(HUAppleMusicAccountItemManager *)self mediaProfileContainer];
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v18;
      _os_log_debug_impl(&dword_1BE345000, v15, OS_LOG_TYPE_DEBUG, "Not showing Primary User Module for %@", (uint8_t *)location, 0xCu);
    }
  }

  return v5;
}

void __59__HUAppleMusicAccountItemManager__buildItemModulesForHome___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _moduleStateDidChangeFrom:a2 to:a3];
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v6 = [(HUAppleMusicAccountItemManager *)self primaryUserSettingsItemModule];

    if (v6)
    {
      id v7 = [(HUAppleMusicAccountItemManager *)self primaryUserSettingsItemModule];
      v8 = [v7 buildSectionsWithDisplayedItems:v4];

      [v5 addObjectsFromArray:v8];
    }
    v9 = [(HUAppleMusicAccountItemManager *)self appleMusicAccountModule];
    v10 = [v9 buildSectionsWithDisplayedItems:v4];

    [v5 addObjectsFromArray:v10];
  }
  else
  {
    id v5 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

- (void)_moduleStateDidChangeFrom:(unint64_t)a3 to:(unint64_t)a4
{
  BOOL v5 = a3 < 2 && a4 > 1;
  -[HUAppleMusicAccountItemManager setShouldDisableUpdates:](self, "setShouldDisableUpdates:", v5, a4);
}

- (void)setShouldDisableUpdates:(BOOL)a3
{
  if (self->_shouldDisableUpdates != a3)
  {
    self->_shouldDisableUpdates = a3;
    if (a3) {
      [(HFItemManager *)self disableExternalUpdatesWithReason:@"HUAppleMusicAccountItemManager_StateTransition"];
    }
    else {
      [(HFItemManager *)self endDisableExternalUpdatesWithReason:@"HUAppleMusicAccountItemManager_StateTransition"];
    }
  }
}

- (BOOL)_showPrimaryUserSettings
{
  v2 = [(HUAppleMusicAccountItemManager *)self mediaProfileContainer];
  char v3 = objc_msgSend(v2, "hf_supportsPreferredMediaUser");

  return v3;
}

- (BOOL)_showAppleMusicSettings
{
  v2 = [(HUAppleMusicAccountItemManager *)self mediaProfileContainer];
  char v3 = objc_msgSend(v2, "hf_backingAccessory");
  char v4 = objc_msgSend(v3, "hf_isSiriEndpoint") ^ 1;

  return v4;
}

- (HFMediaProfileContainer)mediaProfileContainer
{
  return self->_mediaProfileContainer;
}

- (HUAppleMusicAccountModule)appleMusicAccountModule
{
  return self->_appleMusicAccountModule;
}

- (void)setAppleMusicAccountModule:(id)a3
{
}

- (HUPrimaryUserSettingsItemModule)primaryUserSettingsItemModule
{
  return self->_primaryUserSettingsItemModule;
}

- (void)setPrimaryUserSettingsItemModule:(id)a3
{
}

- (BOOL)shouldDisableUpdates
{
  return self->_shouldDisableUpdates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryUserSettingsItemModule, 0);
  objc_storeStrong((id *)&self->_appleMusicAccountModule, 0);

  objc_storeStrong((id *)&self->_mediaProfileContainer, 0);
}

@end