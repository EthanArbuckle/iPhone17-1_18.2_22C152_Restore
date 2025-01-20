@interface MPRadioLibrary
+ (id)defaultRadioLibrary;
- (BOOL)isEnabled;
- (MPRadioLibrary)init;
- (NSArray)stations;
- (id)_radioModel;
- (id)stationWithIdentifier:(int64_t)a3;
- (unint64_t)stationCount;
- (void)_radioAvailabilityDidChangeNotification:(id)a3;
- (void)_radioModelDidChangeNotification:(id)a3;
- (void)_radioRecentStationsDidChangeNotification:(id)a3;
- (void)dealloc;
- (void)getRecentStationGroupsWithCompletionHandler:(id)a3;
@end

@implementation MPRadioLibrary

- (void).cxx_destruct
{
}

- (id)_radioModel
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2050000000;
  v2 = (void *)getRadioModelClass_softClass;
  uint64_t v10 = getRadioModelClass_softClass;
  if (!getRadioModelClass_softClass)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __getRadioModelClass_block_invoke;
    v6[3] = &unk_1E57FA300;
    v6[4] = &v7;
    __getRadioModelClass_block_invoke((uint64_t)v6);
    v2 = (void *)v8[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v7, 8);
  v4 = [v3 sharedModel];

  return v4;
}

- (void)_radioModelDidChangeNotification:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 postNotificationName:@"MPRadioLibraryStationsDidChangeNotification" object:self];
}

- (void)_radioRecentStationsDidChangeNotification:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__MPRadioLibrary__radioRecentStationsDidChangeNotification___block_invoke;
  block[3] = &unk_1E57F9EA8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __60__MPRadioLibrary__radioRecentStationsDidChangeNotification___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"MPRadioLibraryStationsDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (void)_radioAvailabilityDidChangeNotification:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__MPRadioLibrary__radioAvailabilityDidChangeNotification___block_invoke;
  block[3] = &unk_1E57F9EA8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __58__MPRadioLibrary__radioAvailabilityDidChangeNotification___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"MPRadioLibraryStationsDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (id)stationWithIdentifier:(int64_t)a3
{
  id v4 = [(MPRadioLibrary *)self _radioModel];
  v5 = [v4 stationWithID:a3];

  if (v5) {
    v6 = [[MPRadioStation alloc] initWithStation:v5];
  }
  else {
    v6 = 0;
  }

  return v6;
}

- (NSArray)stations
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v2 = [(MPRadioLibrary *)self _radioModel];
  id v3 = [MEMORY[0x1E4F1CA80] set];
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v5 = [v2 stationSortOrdering];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(v2, "stationWithID:", objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * i), "longLongValue"));
        if (v10)
        {
          v11 = [[MPRadioStation alloc] initWithStation:v10];
          if (v11)
          {
            [v4 addObject:v11];
            [v3 addObject:v10];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v7);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v12 = objc_msgSend(v2, "userStations", 0);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v21 + 1) + 8 * j);
        if (([v3 containsObject:v17] & 1) == 0)
        {
          v18 = [[MPRadioStation alloc] initWithStation:v17];
          if (v18) {
            [v4 addObject:v18];
          }
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v14);
  }

  if ([v4 count]) {
    id v19 = v4;
  }
  else {
    id v19 = 0;
  }

  return (NSArray *)v19;
}

- (unint64_t)stationCount
{
  id v2 = [(MPRadioLibrary *)self _radioModel];
  id v3 = [v2 userStations];
  unint64_t v4 = [v3 count];

  return v4;
}

- (BOOL)isEnabled
{
  return [(MPRadioController *)self->_radioController isRadioAvailable];
}

- (void)getRecentStationGroupsWithCompletionHandler:(id)a3
{
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"MPRadioControllerRadioAvailabilityDidChangeNotification" object:self->_radioController];
  [v3 removeObserver:self name:@"MPRadioControllerRecentStationsDidChangeNotification" object:self->_radioController];
  unint64_t v4 = [(MPRadioLibrary *)self _radioModel];
  [v3 removeObserver:self name:@"RadioModelDidChangeNotification" object:v4];

  v5.receiver = self;
  v5.super_class = (Class)MPRadioLibrary;
  [(MPRadioLibrary *)&v5 dealloc];
}

- (MPRadioLibrary)init
{
  v8.receiver = self;
  v8.super_class = (Class)MPRadioLibrary;
  id v2 = [(MPRadioLibrary *)&v8 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MPRadioController);
    radioController = v2->_radioController;
    v2->_radioController = v3;

    objc_super v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v2 selector:sel__radioAvailabilityDidChangeNotification_ name:@"MPRadioControllerRadioAvailabilityDidChangeNotification" object:v2->_radioController];
    [v5 addObserver:v2 selector:sel__radioRecentStationsDidChangeNotification_ name:@"MPRadioControllerRecentStationsDidChangeNotification" object:v2->_radioController];
    uint64_t v6 = [(MPRadioLibrary *)v2 _radioModel];
    [v5 addObserver:v2 selector:sel__radioModelDidChangeNotification_ name:@"RadioModelDidChangeNotification" object:v6];
  }
  return v2;
}

+ (id)defaultRadioLibrary
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__MPRadioLibrary_defaultRadioLibrary__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultRadioLibrary_onceToken != -1) {
    dispatch_once(&defaultRadioLibrary_onceToken, block);
  }
  id v2 = (void *)defaultRadioLibrary_defaultLibrary;

  return v2;
}

void __37__MPRadioLibrary_defaultRadioLibrary__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  id v2 = (void *)defaultRadioLibrary_defaultLibrary;
  defaultRadioLibrary_defaultLibrary = (uint64_t)v1;
}

@end