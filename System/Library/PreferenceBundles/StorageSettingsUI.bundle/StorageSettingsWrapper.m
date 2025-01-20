@interface StorageSettingsWrapper
+ (id)recommendationsShared;
- (BOOL)applicationHasTips:(id)a3;
- (BOOL)recommendationsLoaded;
- (NSArray)allRepresentedApps;
- (NSArray)allTips;
- (NSDictionary)pluginsByAppID;
- (NSMutableDictionary)docPluginsByID;
- (NSMutableDictionary)externDataPluginsByID;
- (NSMutableDictionary)pluginsByID;
- (NSMutableDictionary)tipsByID;
- (NSSet)recommendations;
- (NSTimer)tipsReloadTimer;
- (STDelegate)delegate;
- (STUsageBundleRegistry)usageBundleRegistry;
- (StorageSettingsWrapper)init;
- (id)docPluginsForApp:(id)a3;
- (id)docPluginsForAppIdentifier:(id)a3;
- (id)externalDataPluginsForApp:(id)a3;
- (id)externalDataPluginsForAppIdentifier:(id)a3;
- (id)loadTipsOperation:(id)a3;
- (id)tipsForApp:(id)a3;
- (id)tipsWithIdentifier:(id)a3;
- (id)usageBundleForIdentifier:(id)a3;
- (void)_reloadAllTips;
- (void)dealloc;
- (void)enableTip:(id)a3;
- (void)loadPlugins;
- (void)notifyTipsChanged;
- (void)reloadAllTips;
- (void)reloadTip:(id)a3;
- (void)reloadTipsForPlugin:(id)a3;
- (void)setAllRepresentedApps:(id)a3;
- (void)setAllTips:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDocPluginsByID:(id)a3;
- (void)setExternDataPluginsByID:(id)a3;
- (void)setPluginsByAppID:(id)a3;
- (void)setPluginsByID:(id)a3;
- (void)setRecommendations:(id)a3;
- (void)setRecommendationsLoaded:(BOOL)a3;
- (void)setTipsByID:(id)a3;
- (void)setTipsReloadTimer:(id)a3;
- (void)setUsageBundleRegistry:(id)a3;
- (void)startMonitor;
- (void)stopMonitor;
- (void)tipDidUpdate:(id)a3;
@end

@implementation StorageSettingsWrapper

+ (id)recommendationsShared
{
  if (qword_A4B60 != -1) {
    dispatch_once(&qword_A4B60, &stru_96280);
  }
  v2 = (void *)qword_A4B68;

  return v2;
}

- (StorageSettingsWrapper)init
{
  v16.receiver = self;
  v16.super_class = (Class)StorageSettingsWrapper;
  v2 = [(StorageSettingsWrapper *)&v16 init];
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
    tipsByID = v2->_tipsByID;
    v2->_tipsByID = (NSMutableDictionary *)v9;

    uint64_t v11 = +[NSMutableDictionary dictionaryWithCapacity:4];
    docPluginsByID = v2->_docPluginsByID;
    v2->_docPluginsByID = (NSMutableDictionary *)v11;

    uint64_t v13 = +[NSMutableDictionary dictionaryWithCapacity:4];
    externDataPluginsByID = v2->_externDataPluginsByID;
    v2->_externDataPluginsByID = (NSMutableDictionary *)v13;
  }
  return v2;
}

- (void)dealloc
{
  [(StorageSettingsWrapper *)self stopMonitor];
  v3.receiver = self;
  v3.super_class = (Class)StorageSettingsWrapper;
  [(StorageSettingsWrapper *)&v3 dealloc];
}

- (void)startMonitor
{
  if (!self->isMonitoring)
  {
    self->isMonitoring = 1;
    objc_super v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:self selector:"reloadAllTips" name:STNotifyTipsChanged object:0];
    [v3 addObserver:self selector:"reloadAllTips" name:STStoragePluginReloadTipsNotification object:0];
    if (_os_feature_enabled_impl())
    {
      v4 = +[STFileProviderMonitor sharedMonitor];
      [v4 startMonitor];
    }
    v5 = (STUsageBundleRegistry *)objc_alloc_init((Class)STUsageBundleRegistry);
    usageBundleRegistry = self->_usageBundleRegistry;
    self->_usageBundleRegistry = v5;

    uint64_t v7 = dispatch_get_global_queue(25, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_3790;
    block[3] = &unk_962A8;
    block[4] = self;
    dispatch_async(v7, block);
  }
}

- (void)stopMonitor
{
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:STNotifyTipsChanged object:0];
  [v4 removeObserver:self name:STStoragePluginReloadTipsNotification object:0];
  if (_os_feature_enabled_impl())
  {
    objc_super v3 = +[STFileProviderMonitor sharedMonitor];
    [v3 stopMonitor];
  }
}

- (void)notifyTipsChanged
{
  v47 = +[NSMutableSet set];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  v38 = self;
  id obj = [(NSMutableDictionary *)self->_tipsByID allValues];
  id v3 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v46 = *(void *)v49;
    uint64_t v39 = STStorageTipPercentKey;
    uint64_t v45 = STStorageSizeKey;
    uint64_t v44 = STStorageTipImmediateGainKey;
    uint64_t v43 = STStorageTipEventualGainKey;
    uint64_t v42 = STStorageTipKindKey;
    uint64_t v5 = STStorageTipKindActionKey;
    uint64_t v40 = STStorageTipKindOptionKey;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v49 != v46) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        v8 = objc_alloc_init(STRecommendation);
        uint64_t v9 = [v7 title];
        [(STRecommendation *)v8 setTitle:v9];

        v10 = [v7 infoText];
        [(STRecommendation *)v8 setExplanaition:v10];

        uint64_t v11 = [v7 representedApp];
        [(STRecommendation *)v8 setBundleID:v11];

        v12 = [v7 propertyForKey:@"_stTipID"];
        [(STRecommendation *)v8 setIdentifier:v12];

        id v13 = v7;
        if (v13 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          v14 = [v13 specifier];
          v15 = [v14 propertyForKey:v39];
          [v15 floatValue];
          -[STRecommendation setProgress:](v8, "setProgress:");
        }
        objc_super v16 = [v13 specifier];
        v17 = [v16 propertyForKey:v45];
        v18 = (char *)[v17 longLongValue];

        v19 = [v13 specifier];
        v20 = [v19 propertyForKey:v44];
        v21 = (char *)[v20 longLongValue];

        v22 = [v13 specifier];
        v23 = [v22 propertyForKey:v43];
        id v24 = [v23 longLongValue];

        if (v18) {
          v25 = v18;
        }
        else {
          v25 = v21;
        }
        if ((uint64_t)v24 <= 1000) {
          id v26 = 0;
        }
        else {
          id v26 = v24;
        }
        [(STRecommendation *)v8 setGain:&v25[(void)v26]];
        v27 = [v13 specifier];
        v28 = [v27 propertyForKey:v42];

        if ([v28 isEqualToString:v5])
        {
          v29 = [v13 specifier];
          -[STRecommendation setDetailClass:](v8, "setDetailClass:", [v29 detailControllerClass]);
LABEL_22:

          goto LABEL_23;
        }
        if ([v28 isEqualToString:v40])
        {
          v30 = [v13 enableButtonTitle];

          if (v30) {
            [v13 enableButtonTitle];
          }
          else {
          v29 = STLocalizedString(@"Enable");
          }
          [(STRecommendation *)v8 setEnableButtonTitle:v29];
          goto LABEL_22;
        }
LABEL_23:
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v31 = [v13 confirmationText];
          id v32 = [v31 length];

          if (v32)
          {
            -[STRecommendation setMayCauseDataLoss:](v8, "setMayCauseDataLoss:", [v13 mayCauseDataLoss]);
            v33 = [v13 confirmationText];
            [(STRecommendation *)v8 setConfirmationText:v33];

            v34 = [v13 confirmationButtonTitle];
            if (v34)
            {
              [(STRecommendation *)v8 setConfirmationButtonTitle:v34];
            }
            else
            {
              v35 = [v13 title];
              [(STRecommendation *)v8 setConfirmationButtonTitle:v35];
            }
          }
        }
        [(NSSet *)v47 addObject:v8];
      }
      id v4 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
    }
    while (v4);
  }

  recommendations = v38->_recommendations;
  v38->_recommendations = v47;

  id WeakRetained = objc_loadWeakRetained((id *)&v38->_delegate);
  [WeakRetained recommendationsDidUpdate];
}

- (void)loadPlugins
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_3E1C;
  v5[3] = &unk_962A8;
  v5[4] = self;
  id v3 = +[NSBlockOperation blockOperationWithBlock:v5];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_4434;
  v4[3] = &unk_962A8;
  v4[4] = self;
  [v3 setCompletionBlock:v4];
  [(NSOperationQueue *)self->_serialQueue addOperation:v3];
}

- (id)loadTipsOperation:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_44F4;
  v7[3] = &unk_962D0;
  id v8 = a3;
  uint64_t v9 = self;
  id v4 = v8;
  uint64_t v5 = +[NSBlockOperation blockOperationWithBlock:v7];

  return v5;
}

- (void)reloadAllTips
{
  id v3 = [(StorageSettingsWrapper *)self tipsReloadTimer];
  [v3 invalidate];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_47C0;
  v7[3] = &unk_962F8;
  void v7[4] = self;
  id v4 = +[NSTimer timerWithTimeInterval:0 repeats:v7 block:0.5];
  [(StorageSettingsWrapper *)self setTipsReloadTimer:v4];

  uint64_t v5 = +[NSRunLoop mainRunLoop];
  v6 = [(StorageSettingsWrapper *)self tipsReloadTimer];
  [v5 addTimer:v6 forMode:NSDefaultRunLoopMode];
}

- (void)_reloadAllTips
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_48B0;
  v5[3] = &unk_962A8;
  v5[4] = self;
  id v3 = +[NSBlockOperation blockOperationWithBlock:v5];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_4A20;
  v4[3] = &unk_962A8;
  v4[4] = self;
  [v3 setCompletionBlock:v4];
  [(NSOperationQueue *)self->_serialQueue addOperation:v3];
}

- (void)reloadTipsForPlugin:(id)a3
{
  if (a3)
  {
    id v4 = -[StorageSettingsWrapper loadTipsOperation:](self, "loadTipsOperation:");
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_4AE8;
    v5[3] = &unk_962A8;
    v5[4] = self;
    [v4 setCompletionBlock:v5];
    [(NSOperationQueue *)self->_serialQueue addOperation:v4];
  }
  else
  {
    [(StorageSettingsWrapper *)self reloadAllTips];
  }
}

- (id)docPluginsForAppIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(StorageSettingsWrapper *)self docPluginsByID];
  v6 = [v5 objectForKey:v4];

  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = &__NSArray0__struct;
  }
  id v8 = v7;

  return v8;
}

- (id)docPluginsForApp:(id)a3
{
  id v4 = [a3 appIdentifier];
  uint64_t v5 = [(StorageSettingsWrapper *)self docPluginsForAppIdentifier:v4];

  return v5;
}

- (id)externalDataPluginsForAppIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(StorageSettingsWrapper *)self externDataPluginsByID];
  v6 = [v5 objectForKey:v4];

  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = &__NSArray0__struct;
  }
  id v8 = v7;

  return v8;
}

- (id)externalDataPluginsForApp:(id)a3
{
  id v4 = [a3 appIdentifier];
  uint64_t v5 = [(StorageSettingsWrapper *)self externalDataPluginsForAppIdentifier:v4];

  return v5;
}

- (void)reloadTip:(id)a3
{
  id v4 = [a3 propertyForKey:@"_stPluginID"];
  if ([v4 length])
  {
    uint64_t v5 = [(StorageSettingsWrapper *)self pluginsByID];
    id v6 = [v5 objectForKey:v4];
  }
  else
  {
    id v6 = 0;
  }
  [(StorageSettingsWrapper *)self reloadTipsForPlugin:v6];
}

- (id)tipsWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[NSMutableArray array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = [(NSMutableDictionary *)self->_tipsByID allValues];
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v12 = [v11 representedApp];
        unsigned int v13 = [v12 isEqualToString:v4];

        if (v13) {
          [v5 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)tipsForApp:(id)a3
{
  id v4 = [a3 appIdentifier];
  uint64_t v5 = [(StorageSettingsWrapper *)self tipsWithIdentifier:v4];

  return v5;
}

- (BOOL)applicationHasTips:(id)a3
{
  id v3 = [(StorageSettingsWrapper *)self tipsForApp:a3];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (void)enableTip:(id)a3
{
  [(NSMutableDictionary *)self->_tipsByID objectForKeyedSubscript:a3];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4FD4;
  block[3] = &unk_962A8;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)tipDidUpdate:(id)a3
{
  id v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  id v8 = sub_50F8;
  uint64_t v9 = &unk_962D0;
  v10 = self;
  id v11 = a3;
  id v4 = v11;
  id v5 = +[NSBlockOperation blockOperationWithBlock:&v6];
  -[NSOperationQueue addOperation:](self->_serialQueue, "addOperation:", v5, v6, v7, v8, v9, v10);
}

- (id)usageBundleForIdentifier:(id)a3
{
  usageBundleRegistry = self->_usageBundleRegistry;
  if (usageBundleRegistry)
  {
    usageBundleRegistry = [usageBundleRegistry usageBundleForIdentifier:a3];
  }

  return usageBundleRegistry;
}

- (STDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (STDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)recommendationsLoaded
{
  return self->_recommendationsLoaded;
}

- (void)setRecommendationsLoaded:(BOOL)a3
{
  self->_recommendationsLoaded = a3;
}

- (NSSet)recommendations
{
  return (NSSet *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRecommendations:(id)a3
{
}

- (NSDictionary)pluginsByAppID
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPluginsByAppID:(id)a3
{
}

- (NSMutableDictionary)pluginsByID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPluginsByID:(id)a3
{
}

- (NSMutableDictionary)tipsByID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setTipsByID:(id)a3
{
}

- (NSMutableDictionary)docPluginsByID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDocPluginsByID:(id)a3
{
}

- (NSMutableDictionary)externDataPluginsByID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setExternDataPluginsByID:(id)a3
{
}

- (NSArray)allTips
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setAllTips:(id)a3
{
}

- (NSArray)allRepresentedApps
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setAllRepresentedApps:(id)a3
{
}

- (STUsageBundleRegistry)usageBundleRegistry
{
  return (STUsageBundleRegistry *)objc_getProperty(self, a2, 104, 1);
}

- (void)setUsageBundleRegistry:(id)a3
{
}

- (NSTimer)tipsReloadTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 112, 1);
}

- (void)setTipsReloadTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tipsReloadTimer, 0);
  objc_storeStrong((id *)&self->_usageBundleRegistry, 0);
  objc_storeStrong((id *)&self->_allRepresentedApps, 0);
  objc_storeStrong((id *)&self->_allTips, 0);
  objc_storeStrong((id *)&self->_externDataPluginsByID, 0);
  objc_storeStrong((id *)&self->_docPluginsByID, 0);
  objc_storeStrong((id *)&self->_tipsByID, 0);
  objc_storeStrong((id *)&self->_pluginsByID, 0);
  objc_storeStrong((id *)&self->_pluginsByAppID, 0);
  objc_storeStrong((id *)&self->_recommendations, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_concurrentQueue, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end