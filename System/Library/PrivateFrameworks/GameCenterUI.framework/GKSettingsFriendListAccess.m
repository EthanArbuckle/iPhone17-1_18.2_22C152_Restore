@interface GKSettingsFriendListAccess
- (BOOL)globalFriendListAccess;
- (BOOL)isFriendListSharingRestricted;
- (BOOL)loadingGames;
- (GKLocalPlayer)localPlayer;
- (GKSettingsFriendListAccess)init;
- (NSArray)games;
- (NSDictionary)gameSettings;
- (PSSpecifier)globalAccessSpecifier;
- (id)globalFriendListAccessSpecifier;
- (id)individualBundleIDFriendListAccessSpecifier;
- (id)loadFreshSpecifiers;
- (id)loadingSpecifier;
- (id)specifiers;
- (void)applicationWillEnterForeground:(id)a3;
- (void)dealloc;
- (void)loadAllGames;
- (void)reloadWithClearLocalCache:(BOOL)a3;
- (void)setGameSettings:(id)a3;
- (void)setGames:(id)a3;
- (void)setGlobalAccessSpecifier:(id)a3;
- (void)setGlobalFriendListAccess:(__CFBoolean *)a3 withSpecifier:(id)a4;
- (void)setLoadingGames:(BOOL)a3;
- (void)setLocalPlayer:(id)a3;
@end

@implementation GKSettingsFriendListAccess

- (GKSettingsFriendListAccess)init
{
  v9.receiver = self;
  v9.super_class = (Class)GKSettingsFriendListAccess;
  v2 = [(GKSettingsFriendListAccess *)&v9 init];
  if (v2)
  {
    v3 = GKGameCenterUIFrameworkBundle();
    v4 = GKGetLocalizedStringFromTableInBundle();
    [(GKSettingsFriendListAccess *)v2 setTitle:v4];

    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v6 = [MEMORY[0x1E4F63690] willEnterForeground];
    [v5 addObserver:v2 selector:sel_applicationWillEnterForeground_ name:v6 object:0];

    [(GKSettingsFriendListAccess *)v2 loadAllGames];
    v7 = v2;
  }

  return v2;
}

- (void)loadAllGames
{
  v3 = [(GKSettingsFriendListAccess *)self games];

  if (!v3 && ![(GKSettingsFriendListAccess *)self isFriendListSharingRestricted])
  {
    [(GKSettingsFriendListAccess *)self setLoadingGames:1];
    objc_initWeak(&location, self);
    v4 = (void *)MEMORY[0x1E4F636C8];
    v5 = [(GKSettingsFriendListAccess *)self localPlayer];
    v6 = [v4 proxyForPlayer:v5];
    v7 = [v6 gameServicePrivate];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __42__GKSettingsFriendListAccess_loadAllGames__block_invoke;
    v8[3] = &unk_1E5F634C0;
    objc_copyWeak(&v9, &location);
    [v7 getFriendListAccessForAllGames:v8];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __42__GKSettingsFriendListAccess_loadAllGames__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = objc_opt_new();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __42__GKSettingsFriendListAccess_loadAllGames__block_invoke_2;
  v15[3] = &unk_1E5F63498;
  id v8 = v7;
  id v16 = v8;
  [v5 enumerateObjectsUsingBlock:v15];
  id v9 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setGameSettings:v8];

  v11 = [v5 _gkValuesForKeyPath:@"bundleID"];
  v12 = (void *)MEMORY[0x1E4F636F0];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __42__GKSettingsFriendListAccess_loadAllGames__block_invoke_3;
  v13[3] = &unk_1E5F634C0;
  objc_copyWeak(&v14, v9);
  [v12 loadGamesWithBundleIDs:v11 withCompletionHandler:v13];
  objc_destroyWeak(&v14);
}

void __42__GKSettingsFriendListAccess_loadAllGames__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 bundleID];
  [v2 setObject:v3 forKeyedSubscript:v4];
}

void __42__GKSettingsFriendListAccess_loadAllGames__block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setLoadingGames:0];
    [v4 setGames:v5];
    [v4 reloadSpecifiers];
  }
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)GKSettingsFriendListAccess;
  [(GKSettingsFriendListAccess *)&v4 dealloc];
}

- (void)applicationWillEnterForeground:(id)a3
{
}

- (GKLocalPlayer)localPlayer
{
  localPlayer = self->_localPlayer;
  if (localPlayer)
  {
    id v3 = localPlayer;
  }
  else
  {
    id v3 = [MEMORY[0x1E4F63760] local];
  }

  return v3;
}

- (void)setGames:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  objc_super v4 = (void *)MEMORY[0x1E4F29008];
  id v5 = a3;
  id v6 = [v4 sortDescriptorWithKey:@"name" ascending:1];
  v10[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  id v8 = [v5 sortedArrayUsingDescriptors:v7];

  games = self->_games;
  self->_games = v8;
}

- (id)loadFreshSpecifiers
{
  id v3 = [(GKSettingsFriendListAccess *)self table];
  [v3 setTableHeaderView:0];

  objc_super v4 = [MEMORY[0x1E4F1CA48] array];
  id v5 = [(GKSettingsFriendListAccess *)self globalFriendListAccessSpecifier];
  [v4 addObjectsFromArray:v5];

  if ([(GKSettingsFriendListAccess *)self loadingGames])
  {
    id v6 = [(GKSettingsFriendListAccess *)self loadingSpecifier];
    [v4 addObjectsFromArray:v6];
  }
  if (![(GKSettingsFriendListAccess *)self isFriendListSharingRestricted])
  {
    if ([(GKSettingsFriendListAccess *)self globalFriendListAccess])
    {
      v7 = [(GKSettingsFriendListAccess *)self games];
      uint64_t v8 = [v7 count];

      if (v8)
      {
        id v9 = [(GKSettingsFriendListAccess *)self individualBundleIDFriendListAccessSpecifier];
        [v4 addObjectsFromArray:v9];
      }
    }
  }

  return v4;
}

- (void)setLoadingGames:(BOOL)a3
{
  if (a3)
  {
    objc_initWeak(&location, self);
    dispatch_time_t v3 = dispatch_time(0, 600000023);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __46__GKSettingsFriendListAccess_setLoadingGames___block_invoke;
    v4[3] = &unk_1E5F634E8;
    objc_copyWeak(&v5, &location);
    dispatch_after(v3, MEMORY[0x1E4F14428], v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
  else
  {
    self->_loadingGames = 0;
  }
}

void __46__GKSettingsFriendListAccess_setLoadingGames___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && !*((void *)WeakRetained + 175))
  {
    WeakRetained[1384] = 1;
    id v3 = WeakRetained;
    id v2 = (id)[WeakRetained loadFreshSpecifiers];
    [v3 reloadSpecifiers];
    id WeakRetained = v3;
  }
}

- (id)specifiers
{
  id v3 = [(GKSettingsFriendListAccess *)self loadFreshSpecifiers];
  uint64_t v4 = (int)*MEMORY[0x1E4F92F08];
  id v5 = *(Class *)((char *)&self->super.super.super.super.super.isa + v4);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v4) = v3;

  id v6 = *(Class *)((char *)&self->super.super.super.super.super.isa + v4);

  return v6;
}

- (id)globalFriendListAccessSpecifier
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = GKGameCenterUIFrameworkBundle();
  id v5 = GKGetLocalizedStringFromTableInBundle();

  id v6 = [MEMORY[0x1E4F92E70] emptyGroupSpecifier];
  [v6 setProperty:v5 forKey:*MEMORY[0x1E4F93170]];
  [v3 addObject:v6];
  v7 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:&stru_1F07B2408 target:self set:sel_setGlobalFriendListAccess_withSpecifier_ get:0 detail:0 cell:6 edit:0];
  [v7 setProperty:objc_opt_class() forKey:*MEMORY[0x1E4F930A8]];
  if ([(GKSettingsFriendListAccess *)self isFriendListSharingRestricted]) {
    [v7 setProperty:MEMORY[0x1E4F1CC28] forKey:*MEMORY[0x1E4F93130]];
  }
  [v3 addObject:v7];

  return v3;
}

- (BOOL)globalFriendListAccess
{
  if ([(GKSettingsFriendListAccess *)self isFriendListSharingRestricted]) {
    return 0;
  }
  uint64_t v4 = [(GKSettingsFriendListAccess *)self localPlayer];
  id v5 = [v4 internal];
  BOOL v3 = [v5 globalFriendListAccess] == 0;

  return v3;
}

- (void)reloadWithClearLocalCache:(BOOL)a3
{
  if (a3) {
    [(GKSettingsFriendListAccess *)self setGames:0];
  }
  [(GKSettingsFriendListAccess *)self loadAllGames];
  id v4 = [(GKSettingsFriendListAccess *)self loadFreshSpecifiers];

  [(GKSettingsFriendListAccess *)self reloadSpecifiers];
}

- (void)setGlobalFriendListAccess:(__CFBoolean *)a3 withSpecifier:(id)a4
{
  -[GKSettingsFriendListAccess reloadWithClearLocalCache:](self, "reloadWithClearLocalCache:", *MEMORY[0x1E4F1CFD0] == (void)a3, a4);
}

- (id)loadingSpecifier
{
  id v2 = [MEMORY[0x1E4F1CA48] array];
  BOOL v3 = [MEMORY[0x1E4F92E70] emptyGroupSpecifier];
  [v2 addObject:v3];
  id v4 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:15 edit:0];
  [v2 addObject:v4];

  return v2;
}

- (id)individualBundleIDFriendListAccessSpecifier
{
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [MEMORY[0x1E4F92E70] emptyGroupSpecifier];
  id v5 = GKGameCenterUIFrameworkBundle();
  id v6 = GKGetLocalizedStringFromTableInBundle();

  [v4 setProperty:v6 forKey:*MEMORY[0x1E4F93170]];
  [v3 addObject:v4];
  v7 = [(GKSettingsFriendListAccess *)self games];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__GKSettingsFriendListAccess_individualBundleIDFriendListAccessSpecifier__block_invoke;
  v12[3] = &unk_1E5F63510;
  v12[4] = self;
  id v8 = v3;
  id v13 = v8;
  [v7 enumerateObjectsUsingBlock:v12];

  id v9 = v13;
  id v10 = v8;

  return v10;
}

void __73__GKSettingsFriendListAccess_individualBundleIDFriendListAccessSpecifier__block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = (void *)MEMORY[0x1E4F92E70];
  id v4 = a2;
  id v5 = [v4 name];
  id v9 = [v3 preferenceSpecifierNamed:v5 target:0 set:0 get:0 detail:0 cell:6 edit:0];

  [v9 setProperty:objc_opt_class() forKey:*MEMORY[0x1E4F930A8]];
  [v9 setProperty:v4 forKey:@"specifier.GKGame"];
  id v6 = [*(id *)(a1 + 32) gameSettings];
  v7 = [v4 bundleIdentifier];

  id v8 = [v6 objectForKeyedSubscript:v7];
  [v9 setProperty:v8 forKey:@"specifier.GKGameSettings"];

  [v9 setProperty:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F93130]];
  [*(id *)(a1 + 40) addObject:v9];
}

- (BOOL)isFriendListSharingRestricted
{
  id v2 = [MEMORY[0x1E4F637E8] shared];
  char v3 = [v2 isFriendsSharingRestricted];

  return v3;
}

- (PSSpecifier)globalAccessSpecifier
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_globalAccessSpecifier);

  return (PSSpecifier *)WeakRetained;
}

- (void)setGlobalAccessSpecifier:(id)a3
{
}

- (NSArray)games
{
  return self->_games;
}

- (NSDictionary)gameSettings
{
  return self->_gameSettings;
}

- (void)setGameSettings:(id)a3
{
}

- (void)setLocalPlayer:(id)a3
{
}

- (BOOL)loadingGames
{
  return self->_loadingGames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localPlayer, 0);
  objc_storeStrong((id *)&self->_gameSettings, 0);
  objc_storeStrong((id *)&self->_games, 0);

  objc_destroyWeak((id *)&self->_globalAccessSpecifier);
}

@end