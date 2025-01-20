@interface STStoragePluginManager
+ (id)sharedManager;
- (BOOL)applicationHasTips:(id)a3;
- (BOOL)showAllTips;
- (NSArray)allRepresentedApps;
- (NSArray)allTips;
- (NSArray)topTips;
- (NSMutableDictionary)docPluginsByID;
- (NSMutableDictionary)externDataPluginsByID;
- (NSMutableDictionary)pluginsByID;
- (NSMutableDictionary)tipsByAppID;
- (NSMutableDictionary)tipsByPluginID;
- (STStoragePluginManager)init;
- (id)docPluginsForApp:(id)a3;
- (id)docPluginsForAppIdentifier:(id)a3;
- (id)externalDataPluginsForApp:(id)a3;
- (id)externalDataPluginsForAppIdentifier:(id)a3;
- (id)loadTipsOperation:(id)a3;
- (id)showAllButtonTitle;
- (id)tipsForApp:(id)a3;
- (id)tipsWithIdentifier:(id)a3;
- (unint64_t)tipsToShow;
- (void)loadDefaults;
- (void)loadPlugins;
- (void)notifyTipsChanged;
- (void)reloadAllTips;
- (void)reloadTip:(id)a3;
- (void)reloadTipsForPlugin:(id)a3;
- (void)setAllRepresentedApps:(id)a3;
- (void)setAllTips:(id)a3;
- (void)setDocPluginsByID:(id)a3;
- (void)setExternDataPluginsByID:(id)a3;
- (void)setPluginsByID:(id)a3;
- (void)setShowAllTips:(BOOL)a3;
- (void)setTipsByAppID:(id)a3;
- (void)setTipsByPluginID:(id)a3;
- (void)setTipsToShow:(unint64_t)a3;
- (void)updateTipIndexes;
@end

@implementation STStoragePluginManager

+ (id)sharedManager
{
  if (qword_3A5B8 != -1) {
    dispatch_once(&qword_3A5B8, &stru_2D170);
  }
  v2 = (void *)qword_3A5B0;

  return v2;
}

- (STStoragePluginManager)init
{
  v16.receiver = self;
  v16.super_class = (Class)STStoragePluginManager;
  v2 = [(STStoragePluginManager *)&v16 init];
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    concurrentQueue = v2->_concurrentQueue;
    v2->_concurrentQueue = v3;

    [(NSOperationQueue *)v2->_concurrentQueue setMaxConcurrentOperationCount:2];
    v5 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = v5;

    [(NSOperationQueue *)v2->_serialQueue setMaxConcurrentOperationCount:1];
    uint64_t v7 = +[NSMutableDictionary dictionaryWithCapacity:10];
    pluginsByID = v2->_pluginsByID;
    v2->_pluginsByID = (NSMutableDictionary *)v7;

    uint64_t v9 = +[NSMutableDictionary dictionaryWithCapacity:10];
    tipsByPluginID = v2->_tipsByPluginID;
    v2->_tipsByPluginID = (NSMutableDictionary *)v9;

    uint64_t v11 = +[NSMutableDictionary dictionaryWithCapacity:4];
    docPluginsByID = v2->_docPluginsByID;
    v2->_docPluginsByID = (NSMutableDictionary *)v11;

    uint64_t v13 = +[NSMutableDictionary dictionaryWithCapacity:4];
    externDataPluginsByID = v2->_externDataPluginsByID;
    v2->_externDataPluginsByID = (NSMutableDictionary *)v13;

    [(STStoragePluginManager *)v2 loadDefaults];
    [(STStoragePluginManager *)v2 loadPlugins];
  }
  return v2;
}

- (void)notifyTipsChanged
{
  id v2 = +[STStorageDataNotifier sharedNotifier];
  [v2 postTipsChanged];
}

- (void)loadPlugins
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1B69C;
  v4[3] = &unk_2CA90;
  v4[4] = self;
  v3 = +[NSBlockOperation blockOperationWithBlock:v4];
  [(NSOperationQueue *)self->_serialQueue addOperation:v3];
}

- (id)loadTipsOperation:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1BC58;
  v7[3] = &unk_2CA28;
  id v8 = a3;
  uint64_t v9 = self;
  id v4 = v8;
  v5 = +[NSBlockOperation blockOperationWithBlock:v7];

  return v5;
}

- (void)updateTipIndexes
{
  v3 = +[NSMutableArray arrayWithCapacity:20];
  v23 = self;
  id v4 = [(STStoragePluginManager *)self tipsByPluginID];
  v5 = [v4 allValues];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v29;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v6);
        }
        [v3 addObjectsFromArray:*(void *)(*((void *)&v28 + 1) + 8 * i)];
      }
      id v8 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v8);
  }

  uint64_t v11 = +[NSMutableDictionary dictionaryWithCapacity:10];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v12 = v3;
  id v13 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v25;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v24 + 1) + 8 * (void)j);
        v18 = [v17 representedApp];
        if ([v18 length])
        {
          v19 = [v11 objectForKey:v18];
          v20 = v19;
          if (v19)
          {
            [v19 addObject:v17];
          }
          else
          {
            v21 = +[NSMutableArray arrayWithObject:v17];
            [v11 setObject:v21 forKey:v18];
          }
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v14);
  }

  [(STStoragePluginManager *)v23 setAllTips:v12];
  [(STStoragePluginManager *)v23 setTipsByAppID:v11];
  v22 = [v11 allKeys];
  [(STStoragePluginManager *)v23 setAllRepresentedApps:v22];
}

- (void)reloadAllTips
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1C3B8;
  v5[3] = &unk_2CA90;
  v5[4] = self;
  v3 = +[NSBlockOperation blockOperationWithBlock:v5];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1C528;
  v4[3] = &unk_2CA90;
  v4[4] = self;
  [v3 setCompletionBlock:v4];
  [(NSOperationQueue *)self->_serialQueue addOperation:v3];
}

- (void)reloadTipsForPlugin:(id)a3
{
  if (a3)
  {
    id v4 = -[STStoragePluginManager loadTipsOperation:](self, "loadTipsOperation:");
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1C624;
    v5[3] = &unk_2CA90;
    v5[4] = self;
    [v4 setCompletionBlock:v5];
    [(NSOperationQueue *)self->_serialQueue addOperation:v4];
  }
  else
  {
    [(STStoragePluginManager *)self reloadAllTips];
  }
}

- (id)docPluginsForAppIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(STStoragePluginManager *)self docPluginsByID];
  id v6 = [v5 objectForKey:v4];

  if (v6) {
    id v7 = v6;
  }
  else {
    id v7 = &__NSArray0__struct;
  }
  id v8 = v7;

  return v8;
}

- (id)docPluginsForApp:(id)a3
{
  id v4 = [a3 appIdentifier];
  v5 = [(STStoragePluginManager *)self docPluginsForAppIdentifier:v4];

  return v5;
}

- (id)externalDataPluginsForAppIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(STStoragePluginManager *)self externDataPluginsByID];
  id v6 = [v5 objectForKey:v4];

  if (v6) {
    id v7 = v6;
  }
  else {
    id v7 = &__NSArray0__struct;
  }
  id v8 = v7;

  return v8;
}

- (id)externalDataPluginsForApp:(id)a3
{
  id v4 = [a3 appIdentifier];
  v5 = [(STStoragePluginManager *)self externalDataPluginsForAppIdentifier:v4];

  return v5;
}

- (void)reloadTip:(id)a3
{
  id v4 = [a3 propertyForKey:@"_stPluginID"];
  if ([v4 length])
  {
    v5 = [(STStoragePluginManager *)self pluginsByID];
    id v6 = [v5 objectForKey:v4];
  }
  else
  {
    id v6 = 0;
  }
  [(STStoragePluginManager *)self reloadTipsForPlugin:v6];
}

- (id)tipsWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(STStoragePluginManager *)self tipsByAppID];
  id v6 = [v5 objectForKey:v4];

  id v7 = [v6 sortedArrayUsingComparator:&stru_2D1D0];
  id v8 = v7;
  if (!v7) {
    id v7 = &__NSArray0__struct;
  }
  id v9 = v7;

  return v9;
}

- (id)tipsForApp:(id)a3
{
  id v4 = [a3 appIdentifier];
  v5 = [(STStoragePluginManager *)self tipsWithIdentifier:v4];

  return v5;
}

- (NSArray)topTips
{
  id v2 = [(STStoragePluginManager *)self allTips];
  v3 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v2 count]);
  v35 = +[NSMutableArray arrayWithCapacity:4];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v4 = v2;
  id v5 = [v4 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (!v5) {
    goto LABEL_32;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v41;
  id v34 = v4;
  do
  {
    for (i = 0; i != v6; i = (char *)i + 1)
    {
      if (*(void *)v41 != v7) {
        objc_enumerationMutation(v4);
      }
      id v9 = *(void **)(*((void *)&v40 + 1) + 8 * i);
      uint64_t v10 = (uint64_t)[v9 size];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = v9;
        [v11 activationPercent];
        if (v12 != 0.0)
        {
          [v11 activationPercent];
          if (v13 < 1.0)
          {
            [v11 setSortSize:0];
            [v35 addObject:v11];

            continue;
          }
        }
        if (!v10)
        {
          id v21 = [v11 immediateGain];
          uint64_t v10 = (uint64_t)v21 + (void)[v11 eventualGain];
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v22 = (objc_class *)objc_opt_class();
          v23 = NSStringFromClass(v22);
          NSLog(@"Unknown tip class in storage management: %@", v23);

          continue;
        }
        id v14 = v9;
        if (!v10)
        {
          uint64_t v15 = v3;
          objc_super v16 = [v14 significantItems];
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          id v17 = [v16 countByEnumeratingWithState:&v36 objects:v44 count:16];
          if (v17)
          {
            id v18 = v17;
            uint64_t v10 = 0;
            uint64_t v19 = *(void *)v37;
            do
            {
              for (j = 0; j != v18; j = (char *)j + 1)
              {
                if (*(void *)v37 != v19) {
                  objc_enumerationMutation(v16);
                }
                v10 += (uint64_t)[*(id *)(*((void *)&v36 + 1) + 8 * (void)j) size];
              }
              id v18 = [v16 countByEnumeratingWithState:&v36 objects:v44 count:16];
            }
            while (v18);
          }
          else
          {
            uint64_t v10 = 0;
          }

          v3 = v15;
          id v4 = v34;
        }
      }

      [v9 setSortSize:v10];
      if (v10) {
        BOOL v24 = v10 < 50000001;
      }
      else {
        BOOL v24 = 0;
      }
      if (!v24) {
        [v3 addObject:v9];
      }
    }
    id v6 = [v4 countByEnumeratingWithState:&v40 objects:v45 count:16];
  }
  while (v6);
LABEL_32:

  long long v25 = +[STStorageDiskMonitor sharedMonitor];
  long long v26 = [v25 storageSpace];

  if ((uint64_t)[v26 availableBytes] >= 1000000000) {
    long long v27 = &stru_2D1D0;
  }
  else {
    long long v27 = &stru_2D1B0;
  }
  [v3 sortUsingComparator:v27];
  [v35 sortUsingComparator:&stru_2D1F0];
  long long v28 = (char *)[v3 count];
  if (!self->_showAllTips)
  {
    unint64_t tipsToShow = self->_tipsToShow;
    long long v29 = &v28[-tipsToShow];
    if ((unint64_t)v28 > tipsToShow) {
      objc_msgSend(v3, "removeObjectsInRange:");
    }
  }
  long long v31 = objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v35, v29);

  return (NSArray *)v31;
}

- (BOOL)applicationHasTips:(id)a3
{
  id v4 = a3;
  id v5 = [(STStoragePluginManager *)self tipsByPluginID];
  id v6 = [v4 appIdentifier];

  uint64_t v7 = [v5 objectForKey:v6];
  BOOL v8 = [v7 count] != 0;

  return v8;
}

- (void)loadDefaults
{
  self->_showAllTips = 0;
  id v5 = +[UIDevice currentDevice];
  v3 = (char *)[v5 userInterfaceIdiom];
  unint64_t v4 = 2;
  if (v3 == (unsigned char *)&dword_0 + 1) {
    unint64_t v4 = 3;
  }
  self->_unint64_t tipsToShow = v4;
}

- (BOOL)showAllTips
{
  return self->_showAllTips;
}

- (void)setShowAllTips:(BOOL)a3
{
  self->_showAllTips = a3;
}

- (id)showAllButtonTitle
{
  return STStorageLocStr(@"SHOW_MORE");
}

- (NSArray)allTips
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAllTips:(id)a3
{
}

- (NSArray)allRepresentedApps
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAllRepresentedApps:(id)a3
{
}

- (unint64_t)tipsToShow
{
  return self->_tipsToShow;
}

- (void)setTipsToShow:(unint64_t)a3
{
  self->_unint64_t tipsToShow = a3;
}

- (NSMutableDictionary)pluginsByID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPluginsByID:(id)a3
{
}

- (NSMutableDictionary)tipsByPluginID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setTipsByPluginID:(id)a3
{
}

- (NSMutableDictionary)tipsByAppID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setTipsByAppID:(id)a3
{
}

- (NSMutableDictionary)docPluginsByID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDocPluginsByID:(id)a3
{
}

- (NSMutableDictionary)externDataPluginsByID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setExternDataPluginsByID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externDataPluginsByID, 0);
  objc_storeStrong((id *)&self->_docPluginsByID, 0);
  objc_storeStrong((id *)&self->_tipsByAppID, 0);
  objc_storeStrong((id *)&self->_tipsByPluginID, 0);
  objc_storeStrong((id *)&self->_pluginsByID, 0);
  objc_storeStrong((id *)&self->_allRepresentedApps, 0);
  objc_storeStrong((id *)&self->_allTips, 0);
  objc_storeStrong((id *)&self->_concurrentQueue, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end