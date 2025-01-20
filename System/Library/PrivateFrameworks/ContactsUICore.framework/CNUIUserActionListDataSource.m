@interface CNUIUserActionListDataSource
+ (BOOL)isSupportedActionType:(id)a3;
+ (id)allActionTypes;
+ (id)allSupportedActionTypes;
+ (id)allSupportedActionTypesWithCapabilities:(id)a3;
+ (id)descriptorForRequiredKeys;
+ (id)displayNameForButtonForActionType:(id)a3;
+ (id)displayNameForDisambiguationForActionType:(id)a3;
+ (id)makeCacheWithCapacity:(unint64_t)a3 expirationAge:(double)a4 timeProvider:(id)a5;
+ (id)os_log;
- (BOOL)tracksChanges;
- (CNCache)delegates;
- (CNScheduler)resolutionScheduler;
- (CNSchedulerProvider)schedulerProvider;
- (CNUIUserActionDisambiguationModeler)modeler;
- (CNUIUserActionListDataSource)initWithDiscoveringEnvironment:(id)a3;
- (CNUIUserActionListModelCache)models;
- (id)actionTypesForConsumer:(id)a3;
- (id)actionTypesToUpdateForSelectedItem:(id)a3;
- (id)consumer:(id)a3 actionModelsForContact:(id)a4 actionType:(id)a5;
- (id)consumer:(id)a3 actionModelsForContact:(id)a4 actionType:(id)a5 handler:(id)a6;
- (id)consumer:(id)a3 currentActionModelForContact:(id)a4 actionType:(id)a5;
- (id)consumer:(id)a3 imageForActionType:(id)a4;
- (id)consumer:(id)a3 localizedButtonDisplayNameForActionType:(id)a4;
- (id)consumer:(id)a3 localizedDisplayNameForActionType:(id)a4;
- (id)makeCacheWithCurrentSettings;
- (id)makeModelObservableForContact:(id)a3 actionType:(id)a4 defaultActionItem:(id)a5;
- (id)modelsForContact:(id)a3 actionType:(id)a4;
- (id)thirdPartyActionsForContact:(id)a3 propertyKey:(id)a4 identifier:(id)a5;
- (id)thirdPartyActionsForContactProperty:(id)a3;
- (id)thirdPartyTargetsForActionTypes:(id)a3;
- (void)_invalidateModelsOnExternalChange:(id)a3;
- (void)_safeEmptyModels;
- (void)consumer:(id)a3 didSelectItem:(id)a4 forContact:(id)a5 actionType:(id)a6;
- (void)dealloc;
- (void)makeCacheAndTransferContents;
- (void)performFirstResolutionForEntry:(id)a3 contact:(id)a4 actionType:(id)a5;
- (void)refreshEntry:(id)a3 contact:(id)a4 actionType:(id)a5;
- (void)registerDelegate:(id)a3 withContactIdentifier:(id)a4;
- (void)resolveCacheEntry:(id)a3 contact:(id)a4 actionType:(id)a5 defaultActionItem:(id)a6 qualityOfService:(unint64_t)a7;
- (void)setCacheCapacity:(unint64_t)a3;
- (void)setCacheEntryExpirationAge:(double)a3;
- (void)setCacheEntryRefreshAge:(double)a3;
- (void)setContactStore:(id)a3;
- (void)setDelegates:(id)a3;
- (void)setModeler:(id)a3;
- (void)setModels:(id)a3;
- (void)setTracksChanges:(BOOL)a3;
- (void)unregisterDelegate:(id)a3;
@end

@implementation CNUIUserActionListDataSource

+ (id)descriptorForRequiredKeys
{
  v8[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFE9F8];
  v3 = +[CNUIUserActionDisambiguationModeler descriptorForRequiredKeys];
  v8[0] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  v5 = [NSString stringWithUTF8String:"+[CNUIUserActionListDataSource descriptorForRequiredKeys]"];
  v6 = [v2 descriptorWithKeyDescriptors:v4 description:v5];

  return v6;
}

+ (id)os_log
{
  if (os_log_cn_once_token_2 != -1) {
    dispatch_once(&os_log_cn_once_token_2, &__block_literal_global_27);
  }
  v2 = (void *)os_log_cn_once_object_2;
  return v2;
}

uint64_t __38__CNUIUserActionListDataSource_os_log__block_invoke()
{
  os_log_cn_once_object_2 = (uint64_t)os_log_create("com.apple.contactsui", "quick-actions.data-source");
  return MEMORY[0x270F9A758]();
}

- (CNUIUserActionListDataSource)initWithDiscoveringEnvironment:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CNUIUserActionListDataSource;
  v5 = [(CNUIUserActionListDataSource *)&v22 init];
  v6 = v5;
  if (v5)
  {
    v5->_cacheCapacity = 100;
    *(_OWORD *)&v5->_cacheEntryRefreshAge = xmmword_20B7DB470;
    v7 = [[CNUIUserActionDisambiguationModeler alloc] initWithDiscoveringEnvironment:v4];
    modeler = v6->_modeler;
    v6->_modeler = v7;

    uint64_t v9 = [(CNUIUserActionListDataSource *)v6 makeCacheWithCurrentSettings];
    models = v6->_models;
    v6->_models = (CNUIUserActionListModelCache *)v9;

    uint64_t v11 = [v4 schedulerProvider];
    schedulerProvider = v6->_schedulerProvider;
    v6->_schedulerProvider = (CNSchedulerProvider *)v11;

    if (initWithDiscoveringEnvironment__cn_once_token_3 != -1) {
      dispatch_once(&initWithDiscoveringEnvironment__cn_once_token_3, &__block_literal_global_17_2);
    }
    objc_storeStrong((id *)&v6->_resolutionScheduler, (id)initWithDiscoveringEnvironment__cn_once_object_3);
    v6->_tracksChanges = 1;
    uint64_t v13 = [MEMORY[0x263F33568] atomicCache];
    delegates = v6->_delegates;
    v6->_delegates = (CNCache *)v13;

    v15 = [MEMORY[0x263F335C8] currentEnvironment];
    v16 = [v15 notificationCenter];
    v17 = getTUCallCapabilitiesFaceTimeAvailabilityChangedNotification();
    [v16 addObserver:v6 selector:sel__invalidateModelsOnExternalChange_ name:v17 object:0];

    v18 = [MEMORY[0x263F335C8] currentEnvironment];
    v19 = [v18 distributedNotificationCenter];
    [v19 addObserver:v6 selector:sel__invalidateModelsOnExternalChange_ name:*MEMORY[0x263EFE128] object:0];

    v20 = v6;
  }

  return v6;
}

uint64_t __63__CNUIUserActionListDataSource_initWithDiscoveringEnvironment___block_invoke()
{
  initWithDiscoveringEnvironment__cn_once_object_3 = [MEMORY[0x263F33660] operationQueueSchedulerWithMaxConcurrentOperationCount:12];
  return MEMORY[0x270F9A758]();
}

- (id)makeCacheWithCurrentSettings
{
  v3 = objc_opt_class();
  unint64_t cacheCapacity = self->_cacheCapacity;
  double cacheEntryExpirationAge = self->_cacheEntryExpirationAge;
  v6 = [(CNSchedulerProvider *)self->_schedulerProvider immediateScheduler];
  v7 = [v3 makeCacheWithCapacity:cacheCapacity expirationAge:v6 timeProvider:cacheEntryExpirationAge];

  return v7;
}

+ (id)makeCacheWithCapacity:(unint64_t)a3 expirationAge:(double)a4 timeProvider:(id)a5
{
  v15[2] = *MEMORY[0x263EF8340];
  id v7 = a5;
  v8 = [CNUIUserActionListModelCache alloc];
  uint64_t v9 = [MEMORY[0x263F33568] boundingStrategyWithCapacity:a3];
  v15[0] = v9;
  v10 = [MEMORY[0x263F33568] boundingStrategyWithTTL:2 renewalOptions:v7 timeProvider:a4];

  v15[1] = v10;
  uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
  v12 = [MEMORY[0x263F33568] nonatomicCacheScheduler];
  uint64_t v13 = [(CNCache *)v8 initWithBoundingStrategies:v11 resourceScheduler:v12];

  return v13;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F335C8] currentEnvironment];
  id v4 = [v3 notificationCenter];
  v5 = getTUCallCapabilitiesFaceTimeAvailabilityChangedNotification();
  [v4 removeObserver:self name:v5 object:0];

  v6 = [MEMORY[0x263F335C8] currentEnvironment];
  id v7 = [v6 distributedNotificationCenter];
  [v7 removeObserver:self name:*MEMORY[0x263EFE128] object:0];

  [(CNUIUserActionListDataSource *)self _safeEmptyModels];
  v8.receiver = self;
  v8.super_class = (Class)CNUIUserActionListDataSource;
  [(CNUIUserActionListDataSource *)&v8 dealloc];
}

- (void)_invalidateModelsOnExternalChange:(id)a3
{
  id v4 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_20B704000, v4, OS_LOG_TYPE_DEFAULT, "Invalidating contact actions in reaction to external change (FaceTime availability or Settings Default Apps)", v6, 2u);
  }

  v5 = [(CNUIUserActionListDataSource *)self modeler];
  [v5 emptyDefaultAppsCaches];

  [(CNUIUserActionListDataSource *)self _safeEmptyModels];
}

- (void)_safeEmptyModels
{
  id v7 = [MEMORY[0x263EFF980] array];
  v3 = self;
  objc_sync_enter(v3);
  id v4 = [(CNUIUserActionListDataSource *)v3 models];
  v5 = [v4 allObjects];
  [v7 setArray:v5];

  v6 = [(CNUIUserActionListDataSource *)v3 models];
  [v6 removeAllObjects];

  objc_sync_exit(v3);
}

- (void)setCacheCapacity:(unint64_t)a3
{
  self->_unint64_t cacheCapacity = a3;
  [(CNUIUserActionListDataSource *)self makeCacheAndTransferContents];
}

- (void)setCacheEntryRefreshAge:(double)a3
{
  self->_cacheEntryRefreshAge = a3;
  if (self->_cacheEntryExpirationAge < a3) {
    self->_double cacheEntryExpirationAge = a3;
  }
  [(CNUIUserActionListDataSource *)self makeCacheAndTransferContents];
}

- (void)setCacheEntryExpirationAge:(double)a3
{
  self->_double cacheEntryExpirationAge = a3;
  if (self->_cacheEntryRefreshAge > a3) {
    self->_cacheEntryRefreshAge = a3;
  }
  [(CNUIUserActionListDataSource *)self makeCacheAndTransferContents];
}

- (void)makeCacheAndTransferContents
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(CNUIUserActionListDataSource *)v2 makeCacheWithCurrentSettings];
  id v4 = [(CNCache *)v2->_models allKeys];
  v5 = objc_msgSend(v4, "_cn_take:", v2->_cacheCapacity);

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v11 = -[CNCache objectForKeyedSubscript:](v2->_models, "objectForKeyedSubscript:", v10, (void)v13);
        [(CNCache *)v3 setObject:v11 forKeyedSubscript:v10];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  models = v2->_models;
  v2->_models = v3;

  objc_sync_exit(v2);
}

- (void)setContactStore:(id)a3
{
  id v4 = a3;
  id v5 = [(CNUIUserActionListDataSource *)self modeler];
  [v5 setContactStore:v4];
}

- (void)setTracksChanges:(BOOL)a3
{
  self->_tracksChanges = a3;
}

+ (id)allActionTypes
{
  if (allActionTypes_cn_once_token_5[0] != -1) {
    dispatch_once(allActionTypes_cn_once_token_5, &__block_literal_global_28);
  }
  v2 = (void *)allActionTypes_cn_once_object_5;
  return v2;
}

void __46__CNUIUserActionListDataSource_allActionTypes__block_invoke()
{
  v5[5] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263EFDEF8];
  v5[0] = *MEMORY[0x263EFDF18];
  v5[1] = v0;
  uint64_t v1 = *MEMORY[0x263EFDF10];
  v5[2] = *MEMORY[0x263EFDF38];
  v5[3] = v1;
  v5[4] = *MEMORY[0x263EFDF20];
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:5];
  uint64_t v3 = [v2 copy];
  id v4 = (void *)allActionTypes_cn_once_object_5;
  allActionTypes_cn_once_object_5 = v3;
}

+ (id)allSupportedActionTypes
{
  uint64_t v3 = objc_alloc_init(CNCapabilities);
  id v4 = [a1 allSupportedActionTypesWithCapabilities:v3];

  return v4;
}

+ (id)allSupportedActionTypesWithCapabilities:(id)a3
{
  id v4 = a3;
  id v5 = [a1 allActionTypes];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __72__CNUIUserActionListDataSource_allSupportedActionTypesWithCapabilities___block_invoke;
  v9[3] = &unk_264017358;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = objc_msgSend(v5, "_cn_filter:", v9);

  return v7;
}

uint64_t __72__CNUIUserActionListDataSource_allSupportedActionTypesWithCapabilities___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isEqualToString:*MEMORY[0x263EFDF38]])
  {
    uint64_t v4 = [*(id *)(a1 + 32) isFaceTimeVideoSupported];
  }
  else if ([v3 isEqualToString:*MEMORY[0x263EFDF08]])
  {
    uint64_t v4 = [*(id *)(a1 + 32) isExpanseSupported];
  }
  else
  {
    if (![v3 isEqualToString:*MEMORY[0x263EFDF20]])
    {
      uint64_t v5 = 1;
      goto LABEL_8;
    }
    uint64_t v4 = [*(id *)(a1 + 32) isPaySupported];
  }
  uint64_t v5 = v4;
LABEL_8:

  return v5;
}

- (id)actionTypesForConsumer:(id)a3
{
  id v3 = objc_opt_class();
  return (id)[v3 allActionTypes];
}

- (id)consumer:(id)a3 imageForActionType:(id)a4
{
  return +[_CNUIUserActionImageProvider imageForActionType:a4 imageStyle:0];
}

- (id)consumer:(id)a3 localizedDisplayNameForActionType:(id)a4
{
  id v4 = a4;
  uint64_t v5 = [(id)objc_opt_class() displayNameForDisambiguationForActionType:v4];

  return v5;
}

- (id)consumer:(id)a3 localizedButtonDisplayNameForActionType:(id)a4
{
  id v4 = a4;
  uint64_t v5 = [(id)objc_opt_class() displayNameForButtonForActionType:v4];

  return v5;
}

+ (id)displayNameForButtonForActionType:(id)a3
{
  id v3 = a3;
  if ([(id)*MEMORY[0x263EFDF10] isEqualToString:v3])
  {
    id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v5 = v4;
    id v6 = @"MAIL_ACTION_TYPE_BUTTON";
LABEL_15:
    uint64_t v7 = @"Localized";
    goto LABEL_16;
  }
  if ([(id)*MEMORY[0x263EFDF18] isEqualToString:v3])
  {
    id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v5 = v4;
    id v6 = @"MESSAGE_ACTION_TYPE_BUTTON";
    goto LABEL_15;
  }
  if ([(id)*MEMORY[0x263EFDF38] isEqualToString:v3])
  {
    id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v5 = v4;
    id v6 = @"VIDEOCALL_ACTION_TYPE_BUTTON";
    goto LABEL_15;
  }
  if ([(id)*MEMORY[0x263EFDEF8] isEqualToString:v3])
  {
    id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v5 = v4;
    id v6 = @"AUDIOCALL_ACTION_TYPE_BUTTON";
    goto LABEL_15;
  }
  if ([(id)*MEMORY[0x263EFDF20] isEqualToString:v3])
  {
    id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v5 = v4;
    id v6 = @"PAY_ACTION_TYPE_BUTTON";
    uint64_t v7 = @"Localized-SURF";
LABEL_16:
    uint64_t v8 = [v4 localizedStringForKey:v6 value:&stru_26BFC7668 table:v7];

    goto LABEL_17;
  }
  if ([(id)*MEMORY[0x263EFDF00] isEqualToString:v3])
  {
    id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v5 = v4;
    id v6 = @"DIRECTIONS_ACTION_TYPE_BUTTON";
    goto LABEL_15;
  }
  if ([(id)*MEMORY[0x263EFDF08] isEqualToString:v3])
  {
    id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v5 = v4;
    id v6 = @"EXPANSE_ACTION_TYPE_BUTTON";
    goto LABEL_15;
  }
  uint64_t v8 = &stru_26BFC7668;
LABEL_17:

  return v8;
}

+ (id)displayNameForDisambiguationForActionType:(id)a3
{
  id v3 = a3;
  if ([(id)*MEMORY[0x263EFDF10] isEqualToString:v3])
  {
    id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v5 = v4;
    id v6 = @"MAIL_ACTION_TYPE_DISAMBIGUATION";
LABEL_15:
    uint64_t v7 = @"Localized";
    goto LABEL_16;
  }
  if ([(id)*MEMORY[0x263EFDF18] isEqualToString:v3])
  {
    id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v5 = v4;
    id v6 = @"MESSAGE_ACTION_TYPE_DISAMBIGUATION";
    goto LABEL_15;
  }
  if ([(id)*MEMORY[0x263EFDF38] isEqualToString:v3])
  {
    id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v5 = v4;
    id v6 = @"VIDEOCALL_ACTION_TYPE_DISAMBIGUATION";
    goto LABEL_15;
  }
  if ([(id)*MEMORY[0x263EFDEF8] isEqualToString:v3])
  {
    id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v5 = v4;
    id v6 = @"AUDIOCALL_ACTION_TYPE_DISAMBIGUATION";
    goto LABEL_15;
  }
  if ([(id)*MEMORY[0x263EFDF20] isEqualToString:v3])
  {
    id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v5 = v4;
    id v6 = @"PAY_ACTION_TYPE_DISAMBIGUATION";
    uint64_t v7 = @"Localized-SURF";
LABEL_16:
    uint64_t v8 = [v4 localizedStringForKey:v6 value:&stru_26BFC7668 table:v7];

    goto LABEL_17;
  }
  if ([(id)*MEMORY[0x263EFDF00] isEqualToString:v3])
  {
    id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v5 = v4;
    id v6 = @"DIRECTIONS_ACTION_TYPE_BUTTON";
    goto LABEL_15;
  }
  if ([(id)*MEMORY[0x263EFDF08] isEqualToString:v3])
  {
    id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v5 = v4;
    id v6 = @"EXPANSE_ACTION_TYPE_BUTTON";
    goto LABEL_15;
  }
  uint64_t v8 = &stru_26BFC7668;
LABEL_17:

  return v8;
}

- (id)consumer:(id)a3 currentActionModelForContact:(id)a4 actionType:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(id)objc_opt_class() isSupportedActionType:v10])
  {
    uint64_t v11 = +[CNUIUserActionCacheKeyGenerator keyForContact:v9 actionType:v10];
    v12 = self;
    objc_sync_enter(v12);
    long long v13 = [(CNUIUserActionListDataSource *)v12 models];
    long long v14 = [v13 objectForKeyedSubscript:v11];
    long long v15 = [v14 currentValue];

    objc_sync_exit(v12);
  }
  else
  {
    long long v15 = 0;
  }

  return v15;
}

- (id)consumer:(id)a3 actionModelsForContact:(id)a4 actionType:(id)a5 handler:(id)a6
{
  id v9 = a6;
  id v10 = [(CNUIUserActionListDataSource *)self modelsForContact:a4 actionType:a5];
  uint64_t v11 = [MEMORY[0x263F33610] observerWithResultBlock:v9];

  v12 = [v10 subscribe:v11];

  return v12;
}

- (id)consumer:(id)a3 actionModelsForContact:(id)a4 actionType:(id)a5
{
  return [(CNUIUserActionListDataSource *)self modelsForContact:a4 actionType:a5];
}

- (id)modelsForContact:(id)a3 actionType:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([(id)objc_opt_class() isSupportedActionType:v7])
  {
    id v8 = +[CNUIUserActionCacheKeyGenerator keyForContact:v6 actionType:v7];
    char v9 = (*(uint64_t (**)(void))(*MEMORY[0x263F334E8] + 16))();
    id v10 = objc_msgSend((id)objc_opt_class(), "os_log");
    uint64_t v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[CNUIUserActionListDataSource modelsForContact:actionType:].cold.5(v6);
      }

      v12 = objc_msgSend((id)objc_opt_class(), "os_log");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[CNUIUserActionListDataSource modelsForContact:actionType:].cold.4();
      }

      id v13 = objc_alloc_init(MEMORY[0x263F33550]);
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v43 = 0x2020000000;
      char v44 = 0;
      long long v14 = self;
      objc_sync_enter(v14);
      long long v15 = [(CNUIUserActionListDataSource *)v14 models];
      uint64_t v33 = MEMORY[0x263EF8330];
      uint64_t v34 = 3221225472;
      v35 = __60__CNUIUserActionListDataSource_modelsForContact_actionType___block_invoke;
      v36 = &unk_264018178;
      v37 = v14;
      id v38 = v8;
      id v16 = v6;
      id v39 = v16;
      p_long long buf = &buf;
      v17 = [v15 objectForKey:v38 onCacheMiss:&v33];

      objc_msgSend(v17, "addDelegate:", v13, v33, v34, v35, v36, v37);
      objc_sync_exit(v14);

      if (*(unsigned char *)(*((void *)&buf + 1) + 24))
      {
        uint64_t v18 = objc_msgSend((id)objc_opt_class(), "os_log");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
          -[CNUIUserActionListDataSource modelsForContact:actionType:]();
        }

        [(CNUIUserActionListDataSource *)v14 performFirstResolutionForEntry:v17 contact:v16 actionType:v7];
      }
      else
      {
        objc_super v22 = [(CNUIUserActionListDataSource *)v14 schedulerProvider];
        v23 = [v22 immediateScheduler];
        [v23 timestamp];
        double v25 = v24;
        [v17 timestampOfCurrentValue];
        double v27 = v26;

        v28 = objc_msgSend((id)objc_opt_class(), "os_log");
        double v29 = v25 - v27;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          v30 = [MEMORY[0x263F33688] stringForTimeInterval:v29];
          -[CNUIUserActionListDataSource modelsForContact:actionType:](v30, v41, v28);
        }

        if (v14->_tracksChanges && v29 > v14->_cacheEntryRefreshAge)
        {
          v31 = objc_msgSend((id)objc_opt_class(), "os_log");
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
            -[CNUIUserActionListDataSource modelsForContact:actionType:]();
          }

          [(CNUIUserActionListDataSource *)v14 refreshEntry:v17 contact:v16 actionType:v7];
        }
      }

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v19 = [v6 shortDebugDescription];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v19;
        _os_log_impl(&dword_20B704000, v11, OS_LOG_TYPE_INFO, "Nil or empty cache key for contact: %@", (uint8_t *)&buf, 0xCu);
      }
      v20 = (void *)MEMORY[0x263F33608];
      v21 = +[CNUIUserActionListModel emptyModel];
      id v13 = [v20 observableWithResult:v21];
    }
  }
  else
  {
    id v13 = [MEMORY[0x263F33608] emptyObservable];
  }

  return v13;
}

id __60__CNUIUserActionListDataSource_modelsForContact_actionType___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __60__CNUIUserActionListDataSource_modelsForContact_actionType___block_invoke_cold_1(a1);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  id v3 = objc_alloc(MEMORY[0x263F33548]);
  id v4 = [*(id *)(a1 + 32) schedulerProvider];
  uint64_t v5 = (void *)[v3 initWithSchedulerProvider:v4];

  return v5;
}

- (void)performFirstResolutionForEntry:(id)a3 contact:(id)a4 actionType:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 identifier];
  v12 = [(CNUIUserActionListDataSource *)self delegates];
  id v13 = [v12 objectForKeyedSubscript:v11];

  if (v13)
  {
    long long v14 = [(CNUIUserActionListDataSource *)self delegates];
    long long v15 = [v14 objectForKeyedSubscript:v11];
    id v16 = [v15 allObjects];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __82__CNUIUserActionListDataSource_performFirstResolutionForEntry_contact_actionType___block_invoke;
    v20[3] = &unk_2640181A0;
    v20[4] = self;
    id v21 = v10;
    id v22 = v11;
    objc_msgSend(v16, "_cn_each:", v20);
  }
  v17 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    uint64_t v18 = [v9 shortDebugDescription];
    *(_DWORD *)long long buf = 138543874;
    id v24 = v10;
    __int16 v25 = 2112;
    id v26 = v8;
    __int16 v27 = 2112;
    v28 = v18;
    _os_log_impl(&dword_20B704000, v17, OS_LOG_TYPE_INFO, "Will perform initial resolution of %{public}@ actions for %@ (%@)", buf, 0x20u);
  }
  v19 = [MEMORY[0x263EFF9D0] null];
  [(CNUIUserActionListDataSource *)self resolveCacheEntry:v8 contact:v9 actionType:v10 defaultActionItem:v19 qualityOfService:4];
}

uint64_t __82__CNUIUserActionListDataSource_performFirstResolutionForEntry_contact_actionType___block_invoke(void *a1, void *a2)
{
  return [a2 userActionListDataSource:a1[4] willResolveInitialActionsForActionType:a1[5] contactIdentifier:a1[6]];
}

- (void)refreshEntry:(id)a3 contact:(id)a4 actionType:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = [v9 shortDebugDescription];
    int v14 = 138543874;
    id v15 = v10;
    __int16 v16 = 2112;
    id v17 = v8;
    __int16 v18 = 2112;
    v19 = v12;
    _os_log_impl(&dword_20B704000, v11, OS_LOG_TYPE_INFO, "Will refresh %{public}@ actions for %@ (%@)", (uint8_t *)&v14, 0x20u);
  }
  id v13 = [MEMORY[0x263EFF9D0] null];
  [(CNUIUserActionListDataSource *)self resolveCacheEntry:v8 contact:v9 actionType:v10 defaultActionItem:v13 qualityOfService:0];
}

- (id)thirdPartyTargetsForActionTypes:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CNUIUserActionListDataSource *)self modeler];
  id v6 = [v5 thirdPartyTargetsForActionTypes:v4];

  return v6;
}

- (id)thirdPartyActionsForContactProperty:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CNUIUserActionListDataSource *)self modeler];
  id v6 = [v5 thirdPartyActionsForContactProperty:v4];

  return v6;
}

- (id)thirdPartyActionsForContact:(id)a3 propertyKey:(id)a4 identifier:(id)a5
{
  id v6 = [MEMORY[0x263EFEA30] contactPropertyWithContactNoCopy:a3 propertyKey:a4 identifier:a5];
  id v7 = [(CNUIUserActionListDataSource *)self thirdPartyActionsForContactProperty:v6];

  return v7;
}

+ (BOOL)isSupportedActionType:(id)a3
{
  id v3 = a3;
  if (([(id)*MEMORY[0x263EFDF10] isEqualToString:v3] & 1) != 0
    || ([(id)*MEMORY[0x263EFDF18] isEqualToString:v3] & 1) != 0
    || ([(id)*MEMORY[0x263EFDEF8] isEqualToString:v3] & 1) != 0
    || ([(id)*MEMORY[0x263EFDF38] isEqualToString:v3] & 1) != 0
    || ([(id)*MEMORY[0x263EFDF28] isEqualToString:v3] & 1) != 0
    || ([(id)*MEMORY[0x263EFDF30] isEqualToString:v3] & 1) != 0
    || ([(id)*MEMORY[0x263EFDF20] isEqualToString:v3] & 1) != 0
    || ([(id)*MEMORY[0x263EFDF00] isEqualToString:v3] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [(id)*MEMORY[0x263EFDF08] isEqualToString:v3];
  }

  return v4;
}

- (id)actionTypesToUpdateForSelectedItem:(id)a3
{
  v9[3] = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 shouldCurateIfPerformed])
  {
    uint64_t v4 = *MEMORY[0x263EFDEF8];
    v9[0] = *MEMORY[0x263EFDF18];
    v9[1] = v4;
    v9[2] = *MEMORY[0x263EFDF38];
    uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:3];
  }
  else
  {
    id v6 = [v3 type];
    id v8 = v6;
    uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v8 count:1];
  }
  return v5;
}

- (void)consumer:(id)a3 didSelectItem:(id)a4 forContact:(id)a5 actionType:(id)a6
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if ([(id)objc_opt_class() isSupportedActionType:v11])
  {
    id v25 = v11;
    v12 = [(CNUIUserActionListDataSource *)self actionTypesToUpdateForSelectedItem:v9];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v28 = [v12 countByEnumeratingWithState:&v29 objects:v41 count:16];
    if (v28)
    {
      uint64_t v27 = *(void *)v30;
      id v26 = self;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v30 != v27) {
            objc_enumerationMutation(v12);
          }
          uint64_t v14 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          id v15 = +[CNUIUserActionCacheKeyGenerator keyForContact:v10 actionType:v14];
          __int16 v16 = [(CNUIUserActionListDataSource *)self models];
          id v17 = [v16 objectForKey:v15];

          if (v17)
          {
            __int16 v18 = [v17 currentValue];
            id v19 = [v18 defaultAction];

            if (v19 != v9)
            {
              uint64_t v20 = objc_msgSend((id)objc_opt_class(), "os_log");
              if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
              {
                [v10 shortDebugDescription];
                id v21 = v10;
                id v22 = v12;
                id v24 = v23 = v9;
                *(_DWORD *)long long buf = 138544130;
                uint64_t v34 = v14;
                __int16 v35 = 2112;
                v36 = v17;
                __int16 v37 = 2112;
                id v38 = v24;
                __int16 v39 = 2112;
                id v40 = v23;
                _os_log_impl(&dword_20B704000, v20, OS_LOG_TYPE_INFO, "Will refresh cache of %{public}@ actions for %@ (%@) in response to user selecting %@ action", buf, 0x2Au);

                id v9 = v23;
                v12 = v22;
                id v10 = v21;
                self = v26;
              }

              [(CNUIUserActionListDataSource *)self resolveCacheEntry:v17 contact:v10 actionType:v14 defaultActionItem:v9 qualityOfService:4];
            }
          }
        }
        uint64_t v28 = [v12 countByEnumeratingWithState:&v29 objects:v41 count:16];
      }
      while (v28);
    }

    id v11 = v25;
  }
}

- (void)resolveCacheEntry:(id)a3 contact:(id)a4 actionType:(id)a5 defaultActionItem:(id)a6 qualityOfService:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  __int16 v16 = self->_resolutionScheduler;
  [(CNScheduler *)v16 timestamp];
  uint64_t v18 = v17;
  id v19 = [v13 identifier];
  resolutionScheduler = self->_resolutionScheduler;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __104__CNUIUserActionListDataSource_resolveCacheEntry_contact_actionType_defaultActionItem_qualityOfService___block_invoke;
  v27[3] = &unk_2640181F0;
  uint64_t v35 = v18;
  uint64_t v28 = v16;
  long long v29 = self;
  id v30 = v14;
  id v31 = v12;
  id v32 = v13;
  id v33 = v15;
  BOOL v36 = a7 == 4;
  id v34 = v19;
  id v21 = v19;
  id v22 = v15;
  id v23 = v13;
  id v24 = v12;
  id v25 = v14;
  id v26 = v16;
  [(CNScheduler *)resolutionScheduler performBlock:v27 qualityOfService:a7];
}

void __104__CNUIUserActionListDataSource_resolveCacheEntry_contact_actionType_defaultActionItem_qualityOfService___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) timestamp];
  double v3 = v2;
  uint64_t v4 = [MEMORY[0x263F33688] stringForTimeInterval:v2 - *(double *)(a1 + 88)];
  uint64_t v5 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 48);
    id v7 = *(void **)(a1 + 56);
    id v8 = [*(id *)(a1 + 64) shortDebugDescription];
    *(_DWORD *)long long buf = 138544130;
    uint64_t v30 = v6;
    __int16 v31 = 2112;
    id v32 = v7;
    __int16 v33 = 2112;
    id v34 = v4;
    __int16 v35 = 2112;
    BOOL v36 = v8;
    _os_log_impl(&dword_20B704000, v5, OS_LOG_TYPE_INFO, "Performing resolution of %{public}@ actions for %@ (scheduling latency %@) (%@)", buf, 0x2Au);
  }
  id v9 = [*(id *)(a1 + 40) makeModelObservableForContact:*(void *)(a1 + 64) actionType:*(void *)(a1 + 48) defaultActionItem:*(void *)(a1 + 72)];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __104__CNUIUserActionListDataSource_resolveCacheEntry_contact_actionType_defaultActionItem_qualityOfService___block_invoke_89;
  v25[3] = &unk_2640181C8;
  id v10 = *(void **)(a1 + 48);
  v25[4] = *(void *)(a1 + 40);
  id v26 = v10;
  id v27 = *(id *)(a1 + 64);
  id v28 = *(id *)(a1 + 56);
  [v9 enumerateObjectsUsingBlock:v25];
  [*(id *)(a1 + 32) timestamp];
  id v12 = [MEMORY[0x263F33688] stringForTimeInterval:v11 - v3];
  id v13 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = *(void *)(a1 + 48);
    id v15 = [*(id *)(a1 + 64) shortDebugDescription];
    *(_DWORD *)long long buf = 138543874;
    uint64_t v30 = v14;
    __int16 v31 = 2112;
    id v32 = v15;
    __int16 v33 = 2114;
    id v34 = v12;
    _os_log_impl(&dword_20B704000, v13, OS_LOG_TYPE_INFO, "%{public}@ actions discovered for %@ in %{public}@", buf, 0x20u);
  }
  if (*(unsigned char *)(a1 + 96))
  {
    __int16 v16 = [*(id *)(a1 + 40) delegates];
    uint64_t v17 = [v16 objectForKeyedSubscript:*(void *)(a1 + 80)];

    if (v17)
    {
      uint64_t v18 = [*(id *)(a1 + 40) delegates];
      id v19 = [v18 objectForKeyedSubscript:*(void *)(a1 + 80)];
      uint64_t v20 = [v19 allObjects];
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __104__CNUIUserActionListDataSource_resolveCacheEntry_contact_actionType_defaultActionItem_qualityOfService___block_invoke_91;
      v22[3] = &unk_2640181A0;
      id v21 = *(void **)(a1 + 48);
      v22[4] = *(void *)(a1 + 40);
      id v23 = v21;
      id v24 = *(id *)(a1 + 80);
      objc_msgSend(v20, "_cn_each:", v22);
    }
  }
}

void __104__CNUIUserActionListDataSource_resolveCacheEntry_contact_actionType_defaultActionItem_qualityOfService___block_invoke_89(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = [*(id *)(a1 + 48) shortDebugDescription];
    int v7 = 138543874;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_20B704000, v4, OS_LOG_TYPE_INFO, "Found %{public}@ actions for %@: %@", (uint8_t *)&v7, 0x20u);
  }
  [*(id *)(a1 + 56) updateValue:v3];
}

uint64_t __104__CNUIUserActionListDataSource_resolveCacheEntry_contact_actionType_defaultActionItem_qualityOfService___block_invoke_91(void *a1, void *a2)
{
  return [a2 userActionListDataSource:a1[4] didResolveInitialActionsForActionType:a1[5] contactIdentifier:a1[6]];
}

- (id)makeModelObservableForContact:(id)a3 actionType:(id)a4 defaultActionItem:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((*(unsigned int (**)(void))(*MEMORY[0x263F334C8] + 16))())
  {
    __int16 v11 = [(CNUIUserActionListDataSource *)self modeler];
    id v12 = [v11 modelsWithContact:v8 actionType:v9 defaultActionItem:v10];

    uint64_t v13 = (void *)MEMORY[0x263F33608];
    uint64_t v14 = +[CNUIUserActionListModel emptyModel];
    id v15 = [v13 observableWithResult:v14];
    __int16 v16 = [v12 onEmpty:v15];
  }
  else
  {
    uint64_t v17 = (void *)MEMORY[0x263F33608];
    uint64_t v14 = +[CNUIUserActionListModel emptyModel];
    __int16 v16 = [v17 observableWithResult:v14];
  }

  uint64_t v18 = [(CNUIUserActionListDataSource *)self schedulerProvider];
  id v19 = [v18 backgroundScheduler];
  uint64_t v20 = [v16 subscribeOn:v19];

  return v20;
}

- (void)registerDelegate:(id)a3 withContactIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CNUIUserActionListDataSource *)self delegates];
  id v9 = [v8 objectForKey:v6 onCacheMiss:&__block_literal_global_94];

  [v9 addObject:v7];
}

id __71__CNUIUserActionListDataSource_registerDelegate_withContactIdentifier___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F336A0]);
  return v0;
}

- (void)unregisterDelegate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CNUIUserActionListDataSource *)self delegates];
  id v6 = [v5 allObjects];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  void v8[2] = __51__CNUIUserActionListDataSource_unregisterDelegate___block_invoke;
  v8[3] = &unk_264018238;
  id v9 = v4;
  id v7 = v4;
  objc_msgSend(v6, "_cn_each:", v8);
}

uint64_t __51__CNUIUserActionListDataSource_unregisterDelegate___block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeObject:*(void *)(a1 + 32)];
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (CNScheduler)resolutionScheduler
{
  return self->_resolutionScheduler;
}

- (BOOL)tracksChanges
{
  return self->_tracksChanges;
}

- (CNUIUserActionListModelCache)models
{
  return self->_models;
}

- (void)setModels:(id)a3
{
}

- (CNUIUserActionDisambiguationModeler)modeler
{
  return self->_modeler;
}

- (void)setModeler:(id)a3
{
}

- (CNCache)delegates
{
  return self->_delegates;
}

- (void)setDelegates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_modeler, 0);
  objc_storeStrong((id *)&self->_models, 0);
  objc_storeStrong((id *)&self->_resolutionScheduler, 0);
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
}

- (void)modelsForContact:actionType:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_20B704000, v0, v1, "Will refresh actions for contact (entry: %@)", v2, v3, v4, v5, v6);
}

- (void)modelsForContact:(os_log_t)log actionType:.cold.2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)long long buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_20B704000, log, OS_LOG_TYPE_DEBUG, "Age of cache entry: %@", buf, 0xCu);
}

- (void)modelsForContact:actionType:.cold.3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_20B704000, v0, v1, "Will perform first resolution for contact (entry: %@)", v2, v3, v4, v5, v6);
}

- (void)modelsForContact:actionType:.cold.4()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_20B704000, v0, v1, "Cache key: %@", v2, v3, v4, v5, v6);
}

- (void)modelsForContact:(void *)a1 actionType:.cold.5(void *a1)
{
  uint64_t v1 = [a1 shortDebugDescription];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_20B704000, v2, v3, "New Request for %@ (data source: %@)", v4, v5, v6, v7, v8);
}

void __60__CNUIUserActionListDataSource_modelsForContact_actionType___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v7 = [*(id *)(a1 + 48) shortDebugDescription];
  OUTLINED_FUNCTION_2_0(&dword_20B704000, v1, v2, "Cache miss for %@ (%@)", v3, v4, v5, v6, 2u);
}

@end