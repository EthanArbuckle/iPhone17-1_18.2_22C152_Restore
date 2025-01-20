@interface MapsSuggestionsSelfBuildingResourceDepot
- (MapsSuggestionsSelfBuildingResourceDepot)initWithName:(id)a3;
- (NSString)uniqueName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)oneAppGuardian;
- (id)oneAppProtectionConnector;
- (id)oneBiome;
- (id)oneBiomeConnector;
- (id)oneContactActivity;
- (id)oneContacts;
- (id)oneContactsConnector;
- (id)oneEventKit;
- (id)oneEventKitConnector;
- (id)oneFavorites;
- (id)oneFavoritesStorage;
- (id)oneFavoritesSuggestor;
- (id)oneFinanceKit;
- (id)oneFinanceKitConnector;
- (id)oneFindMy;
- (id)oneFindMyConnector;
- (id)oneFlightRequester;
- (id)oneFlightUpdater;
- (id)oneInsights;
- (id)oneMapsSync;
- (id)oneMapsSyncConnector;
- (id)oneNetworkRequester;
- (id)onePortrait;
- (id)onePortraitConnector;
- (id)oneRoutine;
- (id)oneRoutineConnector;
- (id)oneSourceDelegate;
- (id)oneUser;
- (id)oneVirtualGarage;
- (id)oneVirtualGarageConnector;
- (void)setOneAppGuardian:(id)a3;
- (void)setOneAppProtectionConnector:(id)a3;
- (void)setOneBiome:(id)a3;
- (void)setOneBiomeConnector:(id)a3;
- (void)setOneContactActivity:(id)a3;
- (void)setOneContacts:(id)a3;
- (void)setOneContactsConnector:(id)a3;
- (void)setOneEventKit:(id)a3;
- (void)setOneEventKitConnector:(id)a3;
- (void)setOneFavorites:(id)a3;
- (void)setOneFindMy:(id)a3;
- (void)setOneFindMyConnector:(id)a3;
- (void)setOneFlightRequester:(id)a3;
- (void)setOneFlightUpdater:(id)a3;
- (void)setOneInsights:(id)a3;
- (void)setOneMapsSync:(id)a3;
- (void)setOneMapsSyncConnector:(id)a3;
- (void)setOneNetworkRequester:(id)a3;
- (void)setOnePortrait:(id)a3;
- (void)setOnePortraitConnector:(id)a3;
- (void)setOneRoutine:(id)a3;
- (void)setOneRoutineConnector:(id)a3;
- (void)setOneSourceDelegate:(id)a3;
- (void)setOneUser:(id)a3;
- (void)setOneVirtualGarage:(id)a3;
- (void)setOneVirtualGarageConnector:(id)a3;
@end

@implementation MapsSuggestionsSelfBuildingResourceDepot

- (id)oneFavorites
{
  v2 = self;
  objc_sync_enter(v2);
  oneFavorites = v2->_oneFavorites;
  if (!oneFavorites)
  {
    v4 = [[MapsSuggestionsShortcutManager alloc] initFromResourceDepot:v2];
    v5 = v2->_oneFavorites;
    v2->_oneFavorites = v4;

    oneFavorites = v2->_oneFavorites;
  }
  v6 = oneFavorites;
  objc_sync_exit(v2);

  return v6;
}

- (id)oneSourceDelegate
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_oneSourceDelegate;
  objc_sync_exit(v2);

  return v3;
}

- (void)setOneSourceDelegate:(id)a3
{
  v4 = (MapsSuggestionsSourceDelegate *)a3;
  obj = self;
  objc_sync_enter(obj);
  oneSourceDelegate = obj->_oneSourceDelegate;
  obj->_oneSourceDelegate = v4;

  objc_sync_exit(obj);
}

- (id)oneAppGuardian
{
  v2 = self;
  objc_sync_enter(v2);
  oneAppGuardian = v2->_oneAppGuardian;
  if (!oneAppGuardian)
  {
    v4 = [[MapsSuggestionsAppGuardian alloc] initFromResourceDepot:v2];
    v5 = v2->_oneAppGuardian;
    v2->_oneAppGuardian = v4;

    oneAppGuardian = v2->_oneAppGuardian;
  }
  v6 = oneAppGuardian;
  objc_sync_exit(v2);

  return v6;
}

- (id)oneAppProtectionConnector
{
  v2 = self;
  objc_sync_enter(v2);
  oneAppProtectionConnector = v2->_oneAppProtectionConnector;
  if (!oneAppProtectionConnector)
  {
    v4 = objc_alloc_init(MapsSuggestionsRealAppProtectionConnector);
    v5 = v2->_oneAppProtectionConnector;
    v2->_oneAppProtectionConnector = (MapsSuggestionsAppProtectionConnector *)v4;

    oneAppProtectionConnector = v2->_oneAppProtectionConnector;
  }
  v6 = oneAppProtectionConnector;
  objc_sync_exit(v2);

  return v6;
}

- (id)oneInsights
{
  v2 = self;
  objc_sync_enter(v2);
  oneInsights = v2->_oneInsights;
  if (!oneInsights)
  {
    v4 = [[MapsSuggestionsRealInsights alloc] initFromResourceDepot:v2];
    v5 = v2->_oneInsights;
    v2->_oneInsights = v4;

    oneInsights = v2->_oneInsights;
  }
  v6 = oneInsights;
  objc_sync_exit(v2);

  return v6;
}

- (id)onePortrait
{
  v2 = self;
  objc_sync_enter(v2);
  onePortrait = v2->_onePortrait;
  if (!onePortrait)
  {
    v4 = [[MapsSuggestionsPortrait alloc] initFromResourceDepot:v2];
    v5 = v2->_onePortrait;
    v2->_onePortrait = v4;

    onePortrait = v2->_onePortrait;
  }
  v6 = onePortrait;
  objc_sync_exit(v2);

  return v6;
}

- (id)oneRoutine
{
  v2 = self;
  objc_sync_enter(v2);
  oneRoutine = v2->_oneRoutine;
  if (!oneRoutine)
  {
    v4 = [[MapsSuggestionsRoutine alloc] initFromResourceDepot:v2];
    v5 = v2->_oneRoutine;
    v2->_oneRoutine = v4;

    oneRoutine = v2->_oneRoutine;
  }
  v6 = oneRoutine;
  objc_sync_exit(v2);

  return v6;
}

- (id)oneFavoritesSuggestor
{
  v2 = self;
  objc_sync_enter(v2);
  oneFavoritesSuggestor = v2->_oneFavoritesSuggestor;
  if (!oneFavoritesSuggestor)
  {
    v4 = [[MapsSuggestionsRoutineShortcutSuggestor alloc] initFromResourceDepot:v2];
    v5 = v2->_oneFavoritesSuggestor;
    v2->_oneFavoritesSuggestor = v4;

    oneFavoritesSuggestor = v2->_oneFavoritesSuggestor;
  }
  v6 = oneFavoritesSuggestor;
  objc_sync_exit(v2);

  return v6;
}

- (id)oneFavoritesStorage
{
  v2 = self;
  objc_sync_enter(v2);
  oneFavoritesStorage = v2->_oneFavoritesStorage;
  if (!oneFavoritesStorage)
  {
    v4 = objc_alloc_init(MapsSuggestionsMapsSyncShortcutStorage);
    v5 = v2->_oneFavoritesStorage;
    v2->_oneFavoritesStorage = (MapsSuggestionsShortcutStorage *)v4;

    oneFavoritesStorage = v2->_oneFavoritesStorage;
  }
  v6 = oneFavoritesStorage;
  objc_sync_exit(v2);

  return v6;
}

- (id)oneRoutineConnector
{
  v2 = self;
  objc_sync_enter(v2);
  oneRoutineConnector = v2->_oneRoutineConnector;
  if (!oneRoutineConnector)
  {
    v4 = objc_alloc_init(MapsSuggestionsRealRoutineConnector);
    v5 = v2->_oneRoutineConnector;
    v2->_oneRoutineConnector = (MapsSuggestionsRoutineConnector *)v4;

    oneRoutineConnector = v2->_oneRoutineConnector;
  }
  v6 = oneRoutineConnector;
  objc_sync_exit(v2);

  return v6;
}

- (id)oneNetworkRequester
{
  v2 = self;
  objc_sync_enter(v2);
  oneNetworkRequester = v2->_oneNetworkRequester;
  if (!oneNetworkRequester)
  {
    v4 = [[MapsSuggestionsRealNetworkRequester alloc] initFromResourceDepot:v2];
    v5 = v2->_oneNetworkRequester;
    v2->_oneNetworkRequester = v4;

    oneNetworkRequester = v2->_oneNetworkRequester;
  }
  v6 = oneNetworkRequester;
  objc_sync_exit(v2);

  return v6;
}

- (id)oneContacts
{
  v2 = self;
  objc_sync_enter(v2);
  oneContacts = v2->_oneContacts;
  if (!oneContacts)
  {
    v4 = [[MapsSuggestionsContacts alloc] initFromResourceDepot:v2];
    v5 = v2->_oneContacts;
    v2->_oneContacts = v4;

    oneContacts = v2->_oneContacts;
  }
  v6 = oneContacts;
  objc_sync_exit(v2);

  return v6;
}

- (id)onePortraitConnector
{
  v2 = self;
  objc_sync_enter(v2);
  onePortraitConnector = v2->_onePortraitConnector;
  if (!onePortraitConnector)
  {
    v4 = objc_alloc_init(MapsSuggestionsRealPortraitConnector);
    v5 = v2->_onePortraitConnector;
    v2->_onePortraitConnector = (MapsSuggestionsPortraitConnector *)v4;

    onePortraitConnector = v2->_onePortraitConnector;
  }
  v6 = onePortraitConnector;
  objc_sync_exit(v2);

  return v6;
}

- (id)oneFlightUpdater
{
  v2 = self;
  objc_sync_enter(v2);
  oneFlightUpdater = v2->_oneFlightUpdater;
  if (!oneFlightUpdater)
  {
    v4 = [[MapsSuggestionsFlightUpdater alloc] initFromResourceDepot:v2];
    v5 = v2->_oneFlightUpdater;
    v2->_oneFlightUpdater = v4;

    oneFlightUpdater = v2->_oneFlightUpdater;
  }
  v6 = oneFlightUpdater;
  objc_sync_exit(v2);

  return v6;
}

- (id)oneFlightRequester
{
  v2 = self;
  objc_sync_enter(v2);
  oneFlightRequester = v2->_oneFlightRequester;
  if (!oneFlightRequester)
  {
    v4 = objc_alloc_init(MapsSuggestionsRealFlightRequester);
    v5 = v2->_oneFlightRequester;
    v2->_oneFlightRequester = (MapsSuggestionsFlightRequester *)v4;

    oneFlightRequester = v2->_oneFlightRequester;
  }
  v6 = oneFlightRequester;
  objc_sync_exit(v2);

  return v6;
}

- (id)oneContactsConnector
{
  v2 = self;
  objc_sync_enter(v2);
  oneContactsConnector = v2->_oneContactsConnector;
  if (!oneContactsConnector)
  {
    v4 = objc_alloc_init(MapsSuggestionsRealContactsConnector);
    v5 = v2->_oneContactsConnector;
    v2->_oneContactsConnector = (MapsSuggestionsContactsConnector *)v4;

    oneContactsConnector = v2->_oneContactsConnector;
  }
  v6 = oneContactsConnector;
  objc_sync_exit(v2);

  return v6;
}

- (id)oneVirtualGarage
{
  v2 = self;
  objc_sync_enter(v2);
  oneVirtualGarage = v2->_oneVirtualGarage;
  if (!oneVirtualGarage)
  {
    v4 = [[MapsSuggestionsVirtualGarage alloc] initFromResourceDepot:v2];
    v5 = v2->_oneVirtualGarage;
    v2->_oneVirtualGarage = v4;

    oneVirtualGarage = v2->_oneVirtualGarage;
  }
  v6 = oneVirtualGarage;
  objc_sync_exit(v2);

  return v6;
}

- (id)oneVirtualGarageConnector
{
  v2 = self;
  objc_sync_enter(v2);
  oneVirtualGarageConnector = v2->_oneVirtualGarageConnector;
  if (!oneVirtualGarageConnector)
  {
    v4 = objc_alloc_init(MapsSuggestionsRealVirtualGarageConnector);
    v5 = v2->_oneVirtualGarageConnector;
    v2->_oneVirtualGarageConnector = (MapsSuggestionsVirtualGarageConnector *)v4;

    oneVirtualGarageConnector = v2->_oneVirtualGarageConnector;
  }
  v6 = oneVirtualGarageConnector;
  objc_sync_exit(v2);

  return v6;
}

- (id)oneMapsSync
{
  v2 = self;
  objc_sync_enter(v2);
  oneMapsSync = v2->_oneMapsSync;
  if (!oneMapsSync)
  {
    v4 = [[MapsSuggestionsMapsSync alloc] initFromResourceDepot:v2];
    v5 = v2->_oneMapsSync;
    v2->_oneMapsSync = v4;

    oneMapsSync = v2->_oneMapsSync;
  }
  v6 = oneMapsSync;
  objc_sync_exit(v2);

  return v6;
}

- (MapsSuggestionsSelfBuildingResourceDepot)initWithName:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MapsSuggestionsSelfBuildingResourceDepot;
  v5 = [(MapsSuggestionsSelfBuildingResourceDepot *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    name = v5->_name;
    v5->_name = (NSString *)v6;
  }
  return v5;
}

- (id)oneMapsSyncConnector
{
  v2 = self;
  objc_sync_enter(v2);
  oneMapsSyncConnector = v2->_oneMapsSyncConnector;
  if (!oneMapsSyncConnector)
  {
    id v4 = objc_alloc_init(MapsSuggestionsRealMapsSyncConnector);
    v5 = v2->_oneMapsSyncConnector;
    v2->_oneMapsSyncConnector = (MapsSuggestionsMapsSyncConnector *)v4;

    oneMapsSyncConnector = v2->_oneMapsSyncConnector;
  }
  uint64_t v6 = oneMapsSyncConnector;
  objc_sync_exit(v2);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (id *)[(id)objc_opt_class() allocWithZone:a3];
  objc_storeStrong(v4 + 1, self->_name);
  objc_storeStrong(v4 + 3, self->_oneNetworkRequester);
  objc_storeStrong(v4 + 4, self->_oneRoutineConnector);
  objc_storeStrong(v4 + 5, self->_oneRoutine);
  objc_storeStrong(v4 + 6, self->_onePortraitConnector);
  objc_storeStrong(v4 + 7, self->_onePortrait);
  objc_storeStrong(v4 + 8, self->_oneBiomeConnector);
  objc_storeStrong(v4 + 9, self->_oneBiome);
  objc_storeStrong(v4 + 10, self->_oneContactActivity);
  objc_storeStrong(v4 + 11, self->_oneFindMyConnector);
  objc_storeStrong(v4 + 12, self->_oneFindMy);
  objc_storeStrong(v4 + 13, self->_oneEventKitConnector);
  objc_storeStrong(v4 + 14, self->_oneEventKit);
  objc_storeStrong(v4 + 15, self->_oneVirtualGarageConnector);
  objc_storeStrong(v4 + 16, self->_oneVirtualGarage);
  objc_storeStrong(v4 + 17, self->_oneMapsSyncConnector);
  objc_storeStrong(v4 + 18, self->_oneMapsSync);
  objc_storeStrong(v4 + 19, self->_oneContactsConnector);
  objc_storeStrong(v4 + 20, self->_oneContacts);
  objc_storeStrong(v4 + 21, self->_oneFavoritesStorage);
  objc_storeStrong(v4 + 22, self->_oneFavoritesSuggestor);
  objc_storeStrong(v4 + 23, self->_oneFavorites);
  objc_storeStrong(v4 + 24, self->_oneUser);
  objc_storeStrong(v4 + 25, self->_oneAppProtectionConnector);
  objc_storeStrong(v4 + 26, self->_oneAppGuardian);
  objc_storeStrong(v4 + 27, self->_oneInsights);
  objc_storeStrong(v4 + 28, self->_oneFinanceKitConnector);
  objc_storeStrong(v4 + 29, self->_oneFinanceKit);
  objc_storeStrong(v4 + 30, self->_oneFlightRequester);
  objc_storeStrong(v4 + 31, self->_oneFlightUpdater);
  return v4;
}

- (NSString)uniqueName
{
  return self->_name;
}

- (void)setOneNetworkRequester:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = self;
    objc_sync_enter(v6);
    objc_storeStrong((id *)&v6->_oneNetworkRequester, a3);
    objc_sync_exit(v6);
  }
  else
  {
    v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446978;
      objc_super v9 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSelfBuildingResourceDepot.m";
      __int16 v10 = 1024;
      int v11 = 295;
      __int16 v12 = 2082;
      v13 = "-[MapsSuggestionsSelfBuildingResourceDepot setOneNetworkRequester:]";
      __int16 v14 = 2082;
      v15 = "nil == (oneNetworkRequester)";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. You cannot unset the oneNetworkRequester", (uint8_t *)&v8, 0x26u);
    }
  }
}

- (void)setOneRoutineConnector:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = self;
    objc_sync_enter(v6);
    objc_storeStrong((id *)&v6->_oneRoutineConnector, a3);
    objc_sync_exit(v6);
  }
  else
  {
    v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446978;
      objc_super v9 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSelfBuildingResourceDepot.m";
      __int16 v10 = 1024;
      int v11 = 295;
      __int16 v12 = 2082;
      v13 = "-[MapsSuggestionsSelfBuildingResourceDepot setOneRoutineConnector:]";
      __int16 v14 = 2082;
      v15 = "nil == (oneRoutineConnector)";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. You cannot unset the oneRoutineConnector", (uint8_t *)&v8, 0x26u);
    }
  }
}

- (void)setOneRoutine:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = self;
    objc_sync_enter(v6);
    objc_storeStrong((id *)&v6->_oneRoutine, a3);
    objc_sync_exit(v6);
  }
  else
  {
    v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446978;
      objc_super v9 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSelfBuildingResourceDepot.m";
      __int16 v10 = 1024;
      int v11 = 295;
      __int16 v12 = 2082;
      v13 = "-[MapsSuggestionsSelfBuildingResourceDepot setOneRoutine:]";
      __int16 v14 = 2082;
      v15 = "nil == (oneRoutine)";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. You cannot unset the oneRoutine", (uint8_t *)&v8, 0x26u);
    }
  }
}

- (void)setOnePortraitConnector:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = self;
    objc_sync_enter(v6);
    objc_storeStrong((id *)&v6->_onePortraitConnector, a3);
    objc_sync_exit(v6);
  }
  else
  {
    v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446978;
      objc_super v9 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSelfBuildingResourceDepot.m";
      __int16 v10 = 1024;
      int v11 = 295;
      __int16 v12 = 2082;
      v13 = "-[MapsSuggestionsSelfBuildingResourceDepot setOnePortraitConnector:]";
      __int16 v14 = 2082;
      v15 = "nil == (onePortraitConnector)";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. You cannot unset the onePortraitConnector", (uint8_t *)&v8, 0x26u);
    }
  }
}

- (void)setOnePortrait:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = self;
    objc_sync_enter(v6);
    objc_storeStrong((id *)&v6->_onePortrait, a3);
    objc_sync_exit(v6);
  }
  else
  {
    v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446978;
      objc_super v9 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSelfBuildingResourceDepot.m";
      __int16 v10 = 1024;
      int v11 = 295;
      __int16 v12 = 2082;
      v13 = "-[MapsSuggestionsSelfBuildingResourceDepot setOnePortrait:]";
      __int16 v14 = 2082;
      v15 = "nil == (onePortrait)";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. You cannot unset the onePortrait", (uint8_t *)&v8, 0x26u);
    }
  }
}

- (void)setOneBiomeConnector:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = self;
    objc_sync_enter(v6);
    objc_storeStrong((id *)&v6->_oneBiomeConnector, a3);
    objc_sync_exit(v6);
  }
  else
  {
    v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446978;
      objc_super v9 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSelfBuildingResourceDepot.m";
      __int16 v10 = 1024;
      int v11 = 295;
      __int16 v12 = 2082;
      v13 = "-[MapsSuggestionsSelfBuildingResourceDepot setOneBiomeConnector:]";
      __int16 v14 = 2082;
      v15 = "nil == (oneBiomeConnector)";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. You cannot unset the oneBiomeConnector", (uint8_t *)&v8, 0x26u);
    }
  }
}

- (void)setOneBiome:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = self;
    objc_sync_enter(v6);
    objc_storeStrong((id *)&v6->_oneBiome, a3);
    objc_sync_exit(v6);
  }
  else
  {
    v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446978;
      objc_super v9 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSelfBuildingResourceDepot.m";
      __int16 v10 = 1024;
      int v11 = 295;
      __int16 v12 = 2082;
      v13 = "-[MapsSuggestionsSelfBuildingResourceDepot setOneBiome:]";
      __int16 v14 = 2082;
      v15 = "nil == (oneBiome)";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. You cannot unset the oneBiome", (uint8_t *)&v8, 0x26u);
    }
  }
}

- (void)setOneContactActivity:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = self;
    objc_sync_enter(v6);
    objc_storeStrong((id *)&v6->_oneContactActivity, a3);
    objc_sync_exit(v6);
  }
  else
  {
    v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446978;
      objc_super v9 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSelfBuildingResourceDepot.m";
      __int16 v10 = 1024;
      int v11 = 295;
      __int16 v12 = 2082;
      v13 = "-[MapsSuggestionsSelfBuildingResourceDepot setOneContactActivity:]";
      __int16 v14 = 2082;
      v15 = "nil == (oneContactActivity)";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. You cannot unset the oneContactActivity", (uint8_t *)&v8, 0x26u);
    }
  }
}

- (void)setOneFindMyConnector:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = self;
    objc_sync_enter(v6);
    objc_storeStrong((id *)&v6->_oneFindMyConnector, a3);
    objc_sync_exit(v6);
  }
  else
  {
    v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446978;
      objc_super v9 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSelfBuildingResourceDepot.m";
      __int16 v10 = 1024;
      int v11 = 295;
      __int16 v12 = 2082;
      v13 = "-[MapsSuggestionsSelfBuildingResourceDepot setOneFindMyConnector:]";
      __int16 v14 = 2082;
      v15 = "nil == (oneFindMyConnector)";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. You cannot unset the oneFindMyConnector", (uint8_t *)&v8, 0x26u);
    }
  }
}

- (void)setOneFindMy:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = self;
    objc_sync_enter(v6);
    objc_storeStrong((id *)&v6->_oneFindMy, a3);
    objc_sync_exit(v6);
  }
  else
  {
    v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446978;
      objc_super v9 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSelfBuildingResourceDepot.m";
      __int16 v10 = 1024;
      int v11 = 295;
      __int16 v12 = 2082;
      v13 = "-[MapsSuggestionsSelfBuildingResourceDepot setOneFindMy:]";
      __int16 v14 = 2082;
      v15 = "nil == (oneFindMy)";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. You cannot unset the oneFindMy", (uint8_t *)&v8, 0x26u);
    }
  }
}

- (void)setOneEventKitConnector:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = self;
    objc_sync_enter(v6);
    objc_storeStrong((id *)&v6->_oneEventKitConnector, a3);
    objc_sync_exit(v6);
  }
  else
  {
    v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446978;
      objc_super v9 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSelfBuildingResourceDepot.m";
      __int16 v10 = 1024;
      int v11 = 295;
      __int16 v12 = 2082;
      v13 = "-[MapsSuggestionsSelfBuildingResourceDepot setOneEventKitConnector:]";
      __int16 v14 = 2082;
      v15 = "nil == (oneEventKitConnector)";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. You cannot unset the oneEventKitConnector", (uint8_t *)&v8, 0x26u);
    }
  }
}

- (void)setOneEventKit:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = self;
    objc_sync_enter(v6);
    objc_storeStrong((id *)&v6->_oneEventKit, a3);
    objc_sync_exit(v6);
  }
  else
  {
    v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446978;
      objc_super v9 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSelfBuildingResourceDepot.m";
      __int16 v10 = 1024;
      int v11 = 295;
      __int16 v12 = 2082;
      v13 = "-[MapsSuggestionsSelfBuildingResourceDepot setOneEventKit:]";
      __int16 v14 = 2082;
      v15 = "nil == (oneEventKit)";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. You cannot unset the oneEventKit", (uint8_t *)&v8, 0x26u);
    }
  }
}

- (void)setOneVirtualGarageConnector:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = self;
    objc_sync_enter(v6);
    objc_storeStrong((id *)&v6->_oneVirtualGarageConnector, a3);
    objc_sync_exit(v6);
  }
  else
  {
    v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446978;
      objc_super v9 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSelfBuildingResourceDepot.m";
      __int16 v10 = 1024;
      int v11 = 295;
      __int16 v12 = 2082;
      v13 = "-[MapsSuggestionsSelfBuildingResourceDepot setOneVirtualGarageConnector:]";
      __int16 v14 = 2082;
      v15 = "nil == (oneVirtualGarageConnector)";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. You cannot unset the oneVirtualGarageConnector", (uint8_t *)&v8, 0x26u);
    }
  }
}

- (void)setOneVirtualGarage:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = self;
    objc_sync_enter(v6);
    objc_storeStrong((id *)&v6->_oneVirtualGarage, a3);
    objc_sync_exit(v6);
  }
  else
  {
    v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446978;
      objc_super v9 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSelfBuildingResourceDepot.m";
      __int16 v10 = 1024;
      int v11 = 295;
      __int16 v12 = 2082;
      v13 = "-[MapsSuggestionsSelfBuildingResourceDepot setOneVirtualGarage:]";
      __int16 v14 = 2082;
      v15 = "nil == (oneVirtualGarage)";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. You cannot unset the oneVirtualGarage", (uint8_t *)&v8, 0x26u);
    }
  }
}

- (void)setOneMapsSyncConnector:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = self;
    objc_sync_enter(v6);
    objc_storeStrong((id *)&v6->_oneMapsSyncConnector, a3);
    objc_sync_exit(v6);
  }
  else
  {
    v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446978;
      objc_super v9 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSelfBuildingResourceDepot.m";
      __int16 v10 = 1024;
      int v11 = 295;
      __int16 v12 = 2082;
      v13 = "-[MapsSuggestionsSelfBuildingResourceDepot setOneMapsSyncConnector:]";
      __int16 v14 = 2082;
      v15 = "nil == (oneMapsSyncConnector)";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. You cannot unset the oneMapsSyncConnector", (uint8_t *)&v8, 0x26u);
    }
  }
}

- (void)setOneMapsSync:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = self;
    objc_sync_enter(v6);
    objc_storeStrong((id *)&v6->_oneMapsSync, a3);
    objc_sync_exit(v6);
  }
  else
  {
    v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446978;
      objc_super v9 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSelfBuildingResourceDepot.m";
      __int16 v10 = 1024;
      int v11 = 295;
      __int16 v12 = 2082;
      v13 = "-[MapsSuggestionsSelfBuildingResourceDepot setOneMapsSync:]";
      __int16 v14 = 2082;
      v15 = "nil == (oneMapsSync)";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. You cannot unset the oneMapsSync", (uint8_t *)&v8, 0x26u);
    }
  }
}

- (void)setOneContactsConnector:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = self;
    objc_sync_enter(v6);
    objc_storeStrong((id *)&v6->_oneContactsConnector, a3);
    objc_sync_exit(v6);
  }
  else
  {
    v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446978;
      objc_super v9 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSelfBuildingResourceDepot.m";
      __int16 v10 = 1024;
      int v11 = 295;
      __int16 v12 = 2082;
      v13 = "-[MapsSuggestionsSelfBuildingResourceDepot setOneContactsConnector:]";
      __int16 v14 = 2082;
      v15 = "nil == (oneContactsConnector)";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. You cannot unset the oneContactsConnector", (uint8_t *)&v8, 0x26u);
    }
  }
}

- (void)setOneContacts:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = self;
    objc_sync_enter(v6);
    objc_storeStrong((id *)&v6->_oneContacts, a3);
    objc_sync_exit(v6);
  }
  else
  {
    v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446978;
      objc_super v9 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSelfBuildingResourceDepot.m";
      __int16 v10 = 1024;
      int v11 = 295;
      __int16 v12 = 2082;
      v13 = "-[MapsSuggestionsSelfBuildingResourceDepot setOneContacts:]";
      __int16 v14 = 2082;
      v15 = "nil == (oneContacts)";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. You cannot unset the oneContacts", (uint8_t *)&v8, 0x26u);
    }
  }
}

- (void)setOneFavorites:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = self;
    objc_sync_enter(v6);
    objc_storeStrong((id *)&v6->_oneFavorites, a3);
    objc_sync_exit(v6);
  }
  else
  {
    v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446978;
      objc_super v9 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSelfBuildingResourceDepot.m";
      __int16 v10 = 1024;
      int v11 = 295;
      __int16 v12 = 2082;
      v13 = "-[MapsSuggestionsSelfBuildingResourceDepot setOneFavorites:]";
      __int16 v14 = 2082;
      v15 = "nil == (oneFavorites)";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. You cannot unset the oneFavorites", (uint8_t *)&v8, 0x26u);
    }
  }
}

- (void)setOneUser:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = self;
    objc_sync_enter(v6);
    objc_storeStrong((id *)&v6->_oneUser, a3);
    objc_sync_exit(v6);
  }
  else
  {
    v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446978;
      objc_super v9 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSelfBuildingResourceDepot.m";
      __int16 v10 = 1024;
      int v11 = 295;
      __int16 v12 = 2082;
      v13 = "-[MapsSuggestionsSelfBuildingResourceDepot setOneUser:]";
      __int16 v14 = 2082;
      v15 = "nil == (oneUser)";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. You cannot unset the oneUser", (uint8_t *)&v8, 0x26u);
    }
  }
}

- (void)setOneAppProtectionConnector:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = self;
    objc_sync_enter(v6);
    objc_storeStrong((id *)&v6->_oneAppProtectionConnector, a3);
    objc_sync_exit(v6);
  }
  else
  {
    v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446978;
      objc_super v9 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSelfBuildingResourceDepot.m";
      __int16 v10 = 1024;
      int v11 = 295;
      __int16 v12 = 2082;
      v13 = "-[MapsSuggestionsSelfBuildingResourceDepot setOneAppProtectionConnector:]";
      __int16 v14 = 2082;
      v15 = "nil == (oneAppProtectionConnector)";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. You cannot unset the oneAppProtectionConnector", (uint8_t *)&v8, 0x26u);
    }
  }
}

- (void)setOneAppGuardian:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = self;
    objc_sync_enter(v6);
    objc_storeStrong((id *)&v6->_oneAppGuardian, a3);
    objc_sync_exit(v6);
  }
  else
  {
    v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446978;
      objc_super v9 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSelfBuildingResourceDepot.m";
      __int16 v10 = 1024;
      int v11 = 295;
      __int16 v12 = 2082;
      v13 = "-[MapsSuggestionsSelfBuildingResourceDepot setOneAppGuardian:]";
      __int16 v14 = 2082;
      v15 = "nil == (oneAppGuardian)";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. You cannot unset the oneAppGuardian", (uint8_t *)&v8, 0x26u);
    }
  }
}

- (void)setOneInsights:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = self;
    objc_sync_enter(v6);
    objc_storeStrong((id *)&v6->_oneInsights, a3);
    objc_sync_exit(v6);
  }
  else
  {
    v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446978;
      objc_super v9 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSelfBuildingResourceDepot.m";
      __int16 v10 = 1024;
      int v11 = 295;
      __int16 v12 = 2082;
      v13 = "-[MapsSuggestionsSelfBuildingResourceDepot setOneInsights:]";
      __int16 v14 = 2082;
      v15 = "nil == (oneInsights)";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. You cannot unset the oneInsights", (uint8_t *)&v8, 0x26u);
    }
  }
}

- (void)setOneFlightRequester:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = self;
    objc_sync_enter(v6);
    objc_storeStrong((id *)&v6->_oneFlightRequester, a3);
    objc_sync_exit(v6);
  }
  else
  {
    v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446978;
      objc_super v9 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSelfBuildingResourceDepot.m";
      __int16 v10 = 1024;
      int v11 = 295;
      __int16 v12 = 2082;
      v13 = "-[MapsSuggestionsSelfBuildingResourceDepot setOneFlightRequester:]";
      __int16 v14 = 2082;
      v15 = "nil == (oneFlightRequester)";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. You cannot unset the oneFlightRequester", (uint8_t *)&v8, 0x26u);
    }
  }
}

- (void)setOneFlightUpdater:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = self;
    objc_sync_enter(v6);
    objc_storeStrong((id *)&v6->_oneFlightUpdater, a3);
    objc_sync_exit(v6);
  }
  else
  {
    v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446978;
      objc_super v9 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSelfBuildingResourceDepot.m";
      __int16 v10 = 1024;
      int v11 = 295;
      __int16 v12 = 2082;
      v13 = "-[MapsSuggestionsSelfBuildingResourceDepot setOneFlightUpdater:]";
      __int16 v14 = 2082;
      v15 = "nil == (oneFlightUpdater)";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. You cannot unset the oneFlightUpdater", (uint8_t *)&v8, 0x26u);
    }
  }
}

- (id)oneBiomeConnector
{
  v2 = self;
  objc_sync_enter(v2);
  oneBiomeConnector = v2->_oneBiomeConnector;
  if (!oneBiomeConnector)
  {
    id v4 = objc_alloc_init(MapsSuggestionsRealBiomeConnector);
    id v5 = v2->_oneBiomeConnector;
    v2->_oneBiomeConnector = (MapsSuggestionsBiomeConnector *)v4;

    oneBiomeConnector = v2->_oneBiomeConnector;
  }
  uint64_t v6 = oneBiomeConnector;
  objc_sync_exit(v2);

  return v6;
}

- (id)oneBiome
{
  v2 = self;
  objc_sync_enter(v2);
  oneBiome = v2->_oneBiome;
  if (!oneBiome)
  {
    id v4 = [[MapsSuggestionsBiome alloc] initFromResourceDepot:v2];
    id v5 = v2->_oneBiome;
    v2->_oneBiome = v4;

    oneBiome = v2->_oneBiome;
  }
  uint64_t v6 = oneBiome;
  objc_sync_exit(v2);

  return v6;
}

- (id)oneContactActivity
{
  v2 = self;
  objc_sync_enter(v2);
  oneContactActivity = v2->_oneContactActivity;
  if (!oneContactActivity)
  {
    id v4 = [[_TtC15MapsSuggestions30MapsSuggestionsContactActivity alloc] initFromResourceDepot:v2];
    id v5 = v2->_oneContactActivity;
    v2->_oneContactActivity = v4;

    oneContactActivity = v2->_oneContactActivity;
  }
  uint64_t v6 = oneContactActivity;
  objc_sync_exit(v2);

  return v6;
}

- (id)oneFindMyConnector
{
  v2 = self;
  objc_sync_enter(v2);
  oneFindMyConnector = v2->_oneFindMyConnector;
  if (!oneFindMyConnector)
  {
    id v4 = objc_alloc_init(_TtC15MapsSuggestions34MapsSuggestionsRealFindMyConnector);
    id v5 = v2->_oneFindMyConnector;
    v2->_oneFindMyConnector = (_TtP15MapsSuggestions30MapsSuggestionsFindMyConnector_ *)v4;

    oneFindMyConnector = v2->_oneFindMyConnector;
  }
  uint64_t v6 = oneFindMyConnector;
  objc_sync_exit(v2);

  return v6;
}

- (id)oneFindMy
{
  v2 = self;
  objc_sync_enter(v2);
  oneFindMy = v2->_oneFindMy;
  if (!oneFindMy)
  {
    id v4 = [[_TtC15MapsSuggestions21MapsSuggestionsFindMy alloc] initFromResourceDepot:v2];
    id v5 = v2->_oneFindMy;
    v2->_oneFindMy = v4;

    oneFindMy = v2->_oneFindMy;
  }
  uint64_t v6 = oneFindMy;
  objc_sync_exit(v2);

  return v6;
}

- (id)oneEventKitConnector
{
  v2 = self;
  objc_sync_enter(v2);
  oneEventKitConnector = v2->_oneEventKitConnector;
  if (!oneEventKitConnector)
  {
    id v4 = objc_alloc_init(MapsSuggestionsRealEventKitConnector);
    id v5 = v2->_oneEventKitConnector;
    v2->_oneEventKitConnector = (MapsSuggestionsEventKitConnector *)v4;

    oneEventKitConnector = v2->_oneEventKitConnector;
  }
  uint64_t v6 = oneEventKitConnector;
  objc_sync_exit(v2);

  return v6;
}

- (id)oneEventKit
{
  v2 = self;
  objc_sync_enter(v2);
  oneEventKit = v2->_oneEventKit;
  if (!oneEventKit)
  {
    id v4 = [[MapsSuggestionsEventKit alloc] initFromResourceDepot:v2];
    id v5 = v2->_oneEventKit;
    v2->_oneEventKit = v4;

    oneEventKit = v2->_oneEventKit;
  }
  uint64_t v6 = oneEventKit;
  objc_sync_exit(v2);

  return v6;
}

- (id)oneUser
{
  v2 = self;
  objc_sync_enter(v2);
  oneUser = v2->_oneUser;
  if (!oneUser)
  {
    id v4 = [MapsSuggestionsUser alloc];
    id v5 = [(MapsSuggestionsSelfBuildingResourceDepot *)v2 oneFavorites];
    uint64_t v6 = [(MapsSuggestionsSelfBuildingResourceDepot *)v2 oneRoutine];
    uint64_t v7 = [(MapsSuggestionsUser *)v4 initWithMeCardReader:v5 routine:v6];
    int v8 = v2->_oneUser;
    v2->_oneUser = (MapsSuggestionsUser *)v7;

    oneUser = v2->_oneUser;
  }
  objc_super v9 = oneUser;
  objc_sync_exit(v2);

  return v9;
}

- (id)oneFinanceKitConnector
{
  v2 = self;
  objc_sync_enter(v2);
  oneFinanceKitConnector = v2->_oneFinanceKitConnector;
  if (!oneFinanceKitConnector)
  {
    id v4 = objc_alloc_init(_TtC15MapsSuggestions38MapsSuggestionsRealFinanceKitConnector);
    id v5 = v2->_oneFinanceKitConnector;
    v2->_oneFinanceKitConnector = (_TtP15MapsSuggestions34MapsSuggestionsFinanceKitConnector_ *)v4;

    oneFinanceKitConnector = v2->_oneFinanceKitConnector;
  }
  uint64_t v6 = oneFinanceKitConnector;
  objc_sync_exit(v2);

  return v6;
}

- (id)oneFinanceKit
{
  v2 = self;
  objc_sync_enter(v2);
  oneFinanceKit = v2->_oneFinanceKit;
  if (!oneFinanceKit)
  {
    id v4 = [[_TtC15MapsSuggestions25MapsSuggestionsFinanceKit alloc] initFromResourceDepot:v2];
    id v5 = v2->_oneFinanceKit;
    v2->_oneFinanceKit = v4;

    oneFinanceKit = v2->_oneFinanceKit;
  }
  uint64_t v6 = oneFinanceKit;
  objc_sync_exit(v2);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oneFlightUpdater, 0);
  objc_storeStrong((id *)&self->_oneFlightRequester, 0);
  objc_storeStrong((id *)&self->_oneFinanceKit, 0);
  objc_storeStrong((id *)&self->_oneFinanceKitConnector, 0);
  objc_storeStrong((id *)&self->_oneInsights, 0);
  objc_storeStrong((id *)&self->_oneAppGuardian, 0);
  objc_storeStrong((id *)&self->_oneAppProtectionConnector, 0);
  objc_storeStrong((id *)&self->_oneUser, 0);
  objc_storeStrong((id *)&self->_oneFavorites, 0);
  objc_storeStrong((id *)&self->_oneFavoritesSuggestor, 0);
  objc_storeStrong((id *)&self->_oneFavoritesStorage, 0);
  objc_storeStrong((id *)&self->_oneContacts, 0);
  objc_storeStrong((id *)&self->_oneContactsConnector, 0);
  objc_storeStrong((id *)&self->_oneMapsSync, 0);
  objc_storeStrong((id *)&self->_oneMapsSyncConnector, 0);
  objc_storeStrong((id *)&self->_oneVirtualGarage, 0);
  objc_storeStrong((id *)&self->_oneVirtualGarageConnector, 0);
  objc_storeStrong((id *)&self->_oneEventKit, 0);
  objc_storeStrong((id *)&self->_oneEventKitConnector, 0);
  objc_storeStrong((id *)&self->_oneFindMy, 0);
  objc_storeStrong((id *)&self->_oneFindMyConnector, 0);
  objc_storeStrong((id *)&self->_oneContactActivity, 0);
  objc_storeStrong((id *)&self->_oneBiome, 0);
  objc_storeStrong((id *)&self->_oneBiomeConnector, 0);
  objc_storeStrong((id *)&self->_onePortrait, 0);
  objc_storeStrong((id *)&self->_onePortraitConnector, 0);
  objc_storeStrong((id *)&self->_oneRoutine, 0);
  objc_storeStrong((id *)&self->_oneRoutineConnector, 0);
  objc_storeStrong((id *)&self->_oneNetworkRequester, 0);
  objc_storeStrong((id *)&self->_oneSourceDelegate, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end