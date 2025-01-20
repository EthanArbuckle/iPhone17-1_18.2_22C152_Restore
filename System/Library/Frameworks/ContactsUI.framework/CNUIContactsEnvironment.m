@interface CNUIContactsEnvironment
+ (id)currentEnvironment;
+ (id)makeCurrentEnvironment;
- (BOOL)runningInContactsAppOniPad;
- (CNAuthorizationContext)authorizationContext;
- (CNAvatarPosterCarouselFingerprintCache)likenessCarouselFingerprintCache;
- (CNCapabilities)capabilities;
- (CNCollation)collation;
- (CNContactChangesNotifier)contactChangesNotifier;
- (CNContactStore)contactStore;
- (CNContactStore)inProcessContactStore;
- (CNContactsEnvironment)cnEnvironment;
- (CNFavorites)inProcessFavorites;
- (CNGeminiManager)geminiManager;
- (CNHealthStoreManager)healthStoreManager;
- (CNLSApplicationWorkspace)applicationWorkspace;
- (CNUIApplicationLaunchCheckin)launchCheckinRegistrar;
- (CNUIContactsEnvironment)init;
- (CNUIContactsEnvironment)initWithContactsEnvironment:(id)a3;
- (CNUICoreRecentsManager)recentsManager;
- (CNUIDefaultUserActionFetcher)defaultUserActionFetcher;
- (CNUIExternalComponentsFactory)componentsFactory;
- (CNUIIDSAvailabilityProvider)idsAvailabilityProvider;
- (CNUILikenessRendering)cachingLikenessRenderer;
- (CNUILikenessRendering)cachingMonogramRenderer;
- (CNUIMeContactMonitor)meMonitor;
- (CNUIPRLikenessResolver)cachingLikenessResolver;
- (CNUIPlaceholderProviderFactory)placeholderProviderFactory;
- (CNUISchedulerProvider)defaultSchedulerProvider;
- (CNUIUserActionDiscoveringEnvironment)actionDiscoveringEnvironment;
- (CNUIUserActivityManager)inProcessActivityManager;
- (NSString)personaId;
- (UCollator)nts_lazySortCollator;
- (UCollator)sortCollator;
- (id)nts_lazyActionDiscoveringEnvironment;
- (id)nts_lazyApplicationWorkspace;
- (id)nts_lazyCachingLikenessRenderer;
- (id)nts_lazyCachingLikenessResolver;
- (id)nts_lazyCachingMonogramRenderer;
- (id)nts_lazyCapabilities;
- (id)nts_lazyCollation;
- (id)nts_lazyComponentsFactory;
- (id)nts_lazyContactChangesNotifier;
- (id)nts_lazyContactStore;
- (id)nts_lazyDefaultSchedulerProvider;
- (id)nts_lazyDefaultUserActionFetcher;
- (id)nts_lazyGeminiManager;
- (id)nts_lazyHealthStoreManager;
- (id)nts_lazyIDSAvailabilityProvider;
- (id)nts_lazyInProcessActivityManager;
- (id)nts_lazyInProcessContactStore;
- (id)nts_lazyInProcessFavorites;
- (id)nts_lazyLikenessCarouselFingerprintCache;
- (id)nts_lazyPlaceholderProviderFactory;
- (id)nts_lazyRecentsManager;
- (id)nts_makeActionDiscoveringEnvironment;
- (id)nts_makeCachingLikenessResolver;
- (id)nts_makeContactChangesNotifier;
- (id)nts_makeRecentsManager;
- (void)dealloc;
- (void)setActionDiscoveringEnvironment:(id)a3;
- (void)setApplicationWorkspace:(id)a3;
- (void)setAuthorizationContext:(id)a3;
- (void)setCachingLikenessRenderer:(id)a3;
- (void)setCachingLikenessResolver:(id)a3;
- (void)setCachingMonogramRenderer:(id)a3;
- (void)setCapabilities:(id)a3;
- (void)setCollation:(id)a3;
- (void)setComponentsFactory:(id)a3;
- (void)setContactChangesNotifier:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setDefaultSchedulerProvider:(id)a3;
- (void)setDefaultUserActionFetcher:(id)a3;
- (void)setGeminiManager:(id)a3;
- (void)setHealthStoreManager:(id)a3;
- (void)setIdsAvailabilityProvider:(id)a3;
- (void)setInProcessActivityManager:(id)a3;
- (void)setInProcessContactStore:(id)a3;
- (void)setInProcessFavorites:(id)a3;
- (void)setLaunchCheckinRegistrar:(id)a3;
- (void)setLikenessCarouselFingerprintCache:(id)a3;
- (void)setMeMonitor:(id)a3;
- (void)setPersonaId:(id)a3;
- (void)setPlaceholderProviderFactory:(id)a3;
- (void)setRecentsManager:(id)a3;
- (void)setSortCollator:(UCollator *)a3;
@end

@implementation CNUIContactsEnvironment

uint64_t __49__CNUIContactsEnvironment_contactChangesNotifier__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nts_lazyContactChangesNotifier");
}

uint64_t __51__CNUIContactsEnvironment_defaultSchedulerProvider__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nts_lazyDefaultSchedulerProvider");
}

+ (id)currentEnvironment
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__CNUIContactsEnvironment_currentEnvironment__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (currentEnvironment_cn_once_token_7 != -1) {
    dispatch_once(&currentEnvironment_cn_once_token_7, block);
  }
  v2 = (void *)currentEnvironment_cn_once_object_7;

  return v2;
}

- (CNContactChangesNotifier)contactChangesNotifier
{
  v2 = cn_objectResultWithObjectLock();

  return (CNContactChangesNotifier *)v2;
}

- (CNUIApplicationLaunchCheckin)launchCheckinRegistrar
{
  return self->_launchCheckinRegistrar;
}

uint64_t __36__CNUIContactsEnvironment_collation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nts_lazyCollation");
}

uint64_t __39__CNUIContactsEnvironment_contactStore__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nts_lazyContactStore");
}

- (id)nts_lazyInProcessActivityManager
{
  inProcessActivityManager = self->_inProcessActivityManager;
  if (!inProcessActivityManager)
  {
    v4 = [(CNUIContactsEnvironment *)self nts_lazyInProcessContactStore];
    v5 = [(CNUIContactsEnvironment *)self nts_lazyApplicationWorkspace];
    v6 = (CNUIUserActivityManager *)[objc_alloc(MEMORY[0x1E4F5A738]) initWithContactStore:v4 applicationWorkspace:v5];
    v7 = self->_inProcessActivityManager;
    self->_inProcessActivityManager = v6;

    inProcessActivityManager = self->_inProcessActivityManager;
  }

  return inProcessActivityManager;
}

- (id)nts_lazyApplicationWorkspace
{
  applicationWorkspace = self->_applicationWorkspace;
  if (!applicationWorkspace)
  {
    v4 = +[CNUIContactsEnvironmentServicesProvider applicationWorkspace];
    v5 = self->_applicationWorkspace;
    self->_applicationWorkspace = v4;

    applicationWorkspace = self->_applicationWorkspace;
  }

  return applicationWorkspace;
}

- (id)nts_lazyContactChangesNotifier
{
  contactChangesNotifier = self->_contactChangesNotifier;
  if (!contactChangesNotifier)
  {
    v4 = [(CNUIContactsEnvironment *)self nts_makeContactChangesNotifier];
    v5 = self->_contactChangesNotifier;
    self->_contactChangesNotifier = v4;

    contactChangesNotifier = self->_contactChangesNotifier;
  }

  return contactChangesNotifier;
}

- (id)nts_makeContactChangesNotifier
{
  v3 = [(CNUIContactsEnvironment *)self nts_lazyInProcessContactStore];
  v4 = [(CNUIContactsEnvironment *)self nts_lazyDefaultSchedulerProvider];
  v5 = [v4 mainThreadScheduler];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F1B900]) initWithContactStore:v3 downstreamScheduler:v5 schedulerProvider:v4];

  return v6;
}

- (id)nts_lazyDefaultSchedulerProvider
{
  defaultSchedulerProvider = self->_defaultSchedulerProvider;
  if (!defaultSchedulerProvider)
  {
    v4 = objc_alloc_init(CNUISchedulerProvider);
    v5 = self->_defaultSchedulerProvider;
    self->_defaultSchedulerProvider = v4;

    [(CNUISchedulerProvider *)self->_defaultSchedulerProvider resumeBackgroundScheduler];
    defaultSchedulerProvider = self->_defaultSchedulerProvider;
  }

  return defaultSchedulerProvider;
}

- (id)nts_lazyInProcessContactStore
{
  inProcessContactStore = self->_inProcessContactStore;
  if (!inProcessContactStore)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1B990]);
    v5 = [(CNUIContactsEnvironment *)self cnEnvironment];
    [v4 setEnvironment:v5];

    [v4 setIncludeLocalContacts:1];
    [v4 setUseInProcessMapperExclusively:1];
    v6 = (CNContactStore *)[objc_alloc(MEMORY[0x1E4F1B980]) initWithConfiguration:v4];
    v7 = self->_inProcessContactStore;
    self->_inProcessContactStore = v6;

    inProcessContactStore = self->_inProcessContactStore;
  }

  return inProcessContactStore;
}

- (id)nts_lazyContactStore
{
  contactStore = self->_contactStore;
  if (!contactStore)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1B990]);
    v5 = [(CNUIContactsEnvironment *)self cnEnvironment];
    [v4 setEnvironment:v5];

    v6 = (CNContactStore *)[objc_alloc(MEMORY[0x1E4F1B980]) initWithConfiguration:v4];
    v7 = self->_contactStore;
    self->_contactStore = v6;

    contactStore = self->_contactStore;
  }

  return contactStore;
}

- (CNContactsEnvironment)cnEnvironment
{
  return self->_cnEnvironment;
}

uint64_t __51__CNUIContactsEnvironment_inProcessActivityManager__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nts_lazyInProcessActivityManager");
}

void __45__CNUIContactsEnvironment_currentEnvironment__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) makeCurrentEnvironment];
  v2 = (void *)currentEnvironment_cn_once_object_7;
  currentEnvironment_cn_once_object_7 = v1;
}

+ (id)makeCurrentEnvironment
{
  v3 = [MEMORY[0x1E4F1B9A0] currentEnvironment];
  id v4 = (void *)[objc_alloc((Class)a1) initWithContactsEnvironment:v3];

  return v4;
}

- (CNUIContactsEnvironment)initWithContactsEnvironment:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNUIContactsEnvironment;
  v6 = [(CNUIContactsEnvironment *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_cnEnvironment, a3);
    v8 = v7;
  }

  return v7;
}

- (CNUIUserActivityManager)inProcessActivityManager
{
  v2 = cn_objectResultWithObjectLock();

  return (CNUIUserActivityManager *)v2;
}

uint64_t __50__CNUIContactsEnvironment_cachingLikenessResolver__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nts_lazyCachingLikenessResolver");
}

uint64_t __50__CNUIContactsEnvironment_cachingLikenessRenderer__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nts_lazyCachingLikenessRenderer");
}

uint64_t __45__CNUIContactsEnvironment_healthStoreManager__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nts_lazyHealthStoreManager");
}

- (CNHealthStoreManager)healthStoreManager
{
  v2 = cn_objectResultWithObjectLock();

  return (CNHealthStoreManager *)v2;
}

- (id)nts_lazyCachingLikenessRenderer
{
  cachingLikenessRenderer = self->_cachingLikenessRenderer;
  if (!cachingLikenessRenderer)
  {
    id v4 = (void *)MEMORY[0x1E4F5A6C0];
    id v5 = [(CNUIContactsEnvironment *)self nts_lazyCachingLikenessResolver];
    v6 = [(CNUIContactsEnvironment *)self nts_lazyDefaultSchedulerProvider];
    v7 = [v4 cachingRendererWithLikenessResolver:v5 schedulerProvider:v6];
    v8 = self->_cachingLikenessRenderer;
    self->_cachingLikenessRenderer = v7;

    cachingLikenessRenderer = self->_cachingLikenessRenderer;
  }

  return cachingLikenessRenderer;
}

- (id)nts_lazyCachingLikenessResolver
{
  cachingLikenessResolver = self->_cachingLikenessResolver;
  if (!cachingLikenessResolver)
  {
    id v4 = [(CNUIContactsEnvironment *)self nts_makeCachingLikenessResolver];
    id v5 = self->_cachingLikenessResolver;
    self->_cachingLikenessResolver = v4;

    cachingLikenessResolver = self->_cachingLikenessResolver;
  }

  return cachingLikenessResolver;
}

- (id)nts_makeCachingLikenessResolver
{
  v3 = [(CNUIContactsEnvironment *)self nts_lazyDefaultSchedulerProvider];
  id v4 = [(CNUIContactsEnvironment *)self personaId];

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F5A6E0]);
    v6 = [(CNUIContactsEnvironment *)self personaId];
    uint64_t v7 = [v5 initWithPersonaId:v6 schedulerProvider:v3];
  }
  else
  {
    v6 = [(CNUIContactsEnvironment *)self nts_lazyInProcessContactStore];
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F5A6E0]) initWithContactStore:v6 schedulerProvider:v3];
  }
  v8 = (void *)v7;

  [v8 setProhibitedSources:8];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F5A6E8]) initWithLikenessResolver:v8];

  return v9;
}

- (NSString)personaId
{
  return self->_personaId;
}

- (CNUIPRLikenessResolver)cachingLikenessResolver
{
  v2 = cn_objectResultWithObjectLock();

  return (CNUIPRLikenessResolver *)v2;
}

- (CNUILikenessRendering)cachingLikenessRenderer
{
  v2 = cn_objectResultWithObjectLock();

  return (CNUILikenessRendering *)v2;
}

- (id)nts_lazyHealthStoreManager
{
  healthStoreManager = self->_healthStoreManager;
  if (!healthStoreManager)
  {
    id v4 = [[CNHealthStoreManager alloc] initWithEnvironment:self];
    id v5 = self->_healthStoreManager;
    self->_healthStoreManager = v4;

    [(CNHealthStoreManager *)self->_healthStoreManager startListeningForChanges];
    healthStoreManager = self->_healthStoreManager;
  }

  return healthStoreManager;
}

- (CNCollation)collation
{
  v2 = cn_objectResultWithObjectLock();

  return (CNCollation *)v2;
}

- (CNUISchedulerProvider)defaultSchedulerProvider
{
  v2 = cn_objectResultWithObjectLock();

  return (CNUISchedulerProvider *)v2;
}

- (CNContactStore)contactStore
{
  v2 = cn_objectResultWithObjectLock();

  return (CNContactStore *)v2;
}

- (id)nts_lazyCollation
{
  collation = self->_collation;
  if (!collation)
  {
    id v4 = [(CNUIContactsEnvironment *)self nts_lazySortCollator];
    id v5 = (CNCollation *)[objc_alloc(MEMORY[0x1E4F5A378]) initWithCollator:v4];
    v6 = self->_collation;
    self->_collation = v5;

    collation = self->_collation;
  }

  return collation;
}

- (UCollator)nts_lazySortCollator
{
  result = self->_sortCollator;
  if (!result)
  {
    id v4 = [MEMORY[0x1E4F5A378] defaultSortCollatorIdentifier];
    self->_sortCollator = (UCollator *)CNCreateCollatorWithPreferredLocale();

    return self->_sortCollator;
  }
  return result;
}

- (void)setLaunchCheckinRegistrar:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cnEnvironment, 0);
  objc_storeStrong((id *)&self->_geminiManager, 0);
  objc_storeStrong((id *)&self->_personaId, 0);
  objc_storeStrong((id *)&self->_authorizationContext, 0);
  objc_storeStrong((id *)&self->_likenessCarouselFingerprintCache, 0);
  objc_storeStrong((id *)&self->_launchCheckinRegistrar, 0);
  objc_storeStrong((id *)&self->_healthStoreManager, 0);
  objc_storeStrong((id *)&self->_collation, 0);
  objc_storeStrong((id *)&self->_componentsFactory, 0);
  objc_storeStrong((id *)&self->_recentsManager, 0);
  objc_storeStrong((id *)&self->_contactChangesNotifier, 0);
  objc_storeStrong((id *)&self->_defaultUserActionFetcher, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_applicationWorkspace, 0);
  objc_storeStrong((id *)&self->_idsAvailabilityProvider, 0);
  objc_storeStrong((id *)&self->_actionDiscoveringEnvironment, 0);
  objc_storeStrong((id *)&self->_cachingMonogramRenderer, 0);
  objc_storeStrong((id *)&self->_cachingLikenessRenderer, 0);
  objc_storeStrong((id *)&self->_cachingLikenessResolver, 0);
  objc_storeStrong((id *)&self->_meMonitor, 0);
  objc_storeStrong((id *)&self->_inProcessActivityManager, 0);
  objc_storeStrong((id *)&self->_inProcessFavorites, 0);
  objc_storeStrong((id *)&self->_inProcessContactStore, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_placeholderProviderFactory, 0);

  objc_storeStrong((id *)&self->_defaultSchedulerProvider, 0);
}

- (void)setGeminiManager:(id)a3
{
}

- (void)setAuthorizationContext:(id)a3
{
}

- (CNAuthorizationContext)authorizationContext
{
  return self->_authorizationContext;
}

- (void)setLikenessCarouselFingerprintCache:(id)a3
{
}

- (void)setHealthStoreManager:(id)a3
{
}

- (void)setCollation:(id)a3
{
}

- (void)setSortCollator:(UCollator *)a3
{
  self->_sortCollator = a3;
}

- (void)setComponentsFactory:(id)a3
{
}

- (void)setRecentsManager:(id)a3
{
}

- (void)setContactChangesNotifier:(id)a3
{
}

- (void)setDefaultUserActionFetcher:(id)a3
{
}

- (void)setCapabilities:(id)a3
{
}

- (void)setApplicationWorkspace:(id)a3
{
}

- (void)setIdsAvailabilityProvider:(id)a3
{
}

- (void)setActionDiscoveringEnvironment:(id)a3
{
}

- (void)setCachingMonogramRenderer:(id)a3
{
}

- (void)setCachingLikenessRenderer:(id)a3
{
}

- (void)setCachingLikenessResolver:(id)a3
{
}

- (void)setMeMonitor:(id)a3
{
}

- (void)setInProcessActivityManager:(id)a3
{
}

- (void)setInProcessFavorites:(id)a3
{
}

- (void)setInProcessContactStore:(id)a3
{
}

- (void)setContactStore:(id)a3
{
}

- (void)setPlaceholderProviderFactory:(id)a3
{
}

- (void)setDefaultSchedulerProvider:(id)a3
{
}

- (id)nts_lazyLikenessCarouselFingerprintCache
{
  likenessCarouselFingerprintCache = self->_likenessCarouselFingerprintCache;
  if (!likenessCarouselFingerprintCache)
  {
    id v4 = [(CNUIContactsEnvironment *)self nts_lazyInProcessContactStore];
    id v5 = +[CNAvatarPosterCarouselFingerprintCache cacheWithCapacity:100 contactStore:v4];
    v6 = self->_likenessCarouselFingerprintCache;
    self->_likenessCarouselFingerprintCache = v5;

    likenessCarouselFingerprintCache = self->_likenessCarouselFingerprintCache;
  }

  return likenessCarouselFingerprintCache;
}

- (CNAvatarPosterCarouselFingerprintCache)likenessCarouselFingerprintCache
{
  v2 = cn_objectResultWithObjectLock();

  return (CNAvatarPosterCarouselFingerprintCache *)v2;
}

uint64_t __59__CNUIContactsEnvironment_likenessCarouselFingerprintCache__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nts_lazyLikenessCarouselFingerprintCache");
}

- (id)nts_lazyGeminiManager
{
  geminiManager = self->_geminiManager;
  if (!geminiManager)
  {
    id v4 = (CNGeminiManager *)objc_alloc_init(MEMORY[0x1E4F1B9F8]);
    id v5 = self->_geminiManager;
    self->_geminiManager = v4;

    geminiManager = self->_geminiManager;
  }

  return geminiManager;
}

- (CNGeminiManager)geminiManager
{
  v2 = cn_objectResultWithObjectLock();

  return (CNGeminiManager *)v2;
}

uint64_t __40__CNUIContactsEnvironment_geminiManager__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nts_lazyGeminiManager");
}

- (BOOL)runningInContactsAppOniPad
{
  v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] == 1 && CNUIIsContacts();

  return v3;
}

- (void)dealloc
{
  CNReleaseCollator();
  v3.receiver = self;
  v3.super_class = (Class)CNUIContactsEnvironment;
  [(CNUIContactsEnvironment *)&v3 dealloc];
}

- (UCollator)sortCollator
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v7 = 0;
  cn_runWithObjectLock();
  v2 = (UCollator *)v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __39__CNUIContactsEnvironment_sortCollator__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "nts_lazySortCollator");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)nts_lazyInProcessFavorites
{
  inProcessFavorites = self->_inProcessFavorites;
  if (!inProcessFavorites)
  {
    uint64_t v4 = [(CNUIContactsEnvironment *)self nts_lazyInProcessContactStore];
    id v5 = (CNFavorites *)[objc_alloc(MEMORY[0x1E4F1B9E8]) initWithContactStore:v4];
    uint64_t v6 = self->_inProcessFavorites;
    self->_inProcessFavorites = v5;

    inProcessFavorites = self->_inProcessFavorites;
  }

  return inProcessFavorites;
}

- (CNFavorites)inProcessFavorites
{
  v2 = cn_objectResultWithObjectLock();

  return (CNFavorites *)v2;
}

uint64_t __45__CNUIContactsEnvironment_inProcessFavorites__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nts_lazyInProcessFavorites");
}

- (id)nts_lazyComponentsFactory
{
  componentsFactory = self->_componentsFactory;
  if (!componentsFactory)
  {
    uint64_t v4 = objc_alloc_init(CNUIExternalComponentsFactory);
    id v5 = self->_componentsFactory;
    self->_componentsFactory = v4;

    componentsFactory = self->_componentsFactory;
  }

  return componentsFactory;
}

- (CNUIExternalComponentsFactory)componentsFactory
{
  v2 = cn_objectResultWithObjectLock();

  return (CNUIExternalComponentsFactory *)v2;
}

uint64_t __44__CNUIContactsEnvironment_componentsFactory__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nts_lazyComponentsFactory");
}

- (id)nts_makeRecentsManager
{
  v2 = [(CNUIContactsEnvironment *)self nts_lazyDefaultSchedulerProvider];
  objc_super v3 = +[CNUIContactsEnvironmentServicesProvider recentsManagerWithSchedulerProvider:v2];

  return v3;
}

- (id)nts_lazyRecentsManager
{
  recentsManager = self->_recentsManager;
  if (!recentsManager)
  {
    uint64_t v4 = [(CNUIContactsEnvironment *)self nts_makeRecentsManager];
    id v5 = self->_recentsManager;
    self->_recentsManager = v4;

    recentsManager = self->_recentsManager;
  }

  return recentsManager;
}

- (CNUICoreRecentsManager)recentsManager
{
  v2 = cn_objectResultWithObjectLock();

  return (CNUICoreRecentsManager *)v2;
}

uint64_t __41__CNUIContactsEnvironment_recentsManager__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nts_lazyRecentsManager");
}

- (id)nts_lazyDefaultUserActionFetcher
{
  defaultUserActionFetcher = self->_defaultUserActionFetcher;
  if (!defaultUserActionFetcher)
  {
    uint64_t v4 = +[CNUIContactsEnvironmentServicesProvider defaultUserActionFetcher];
    id v5 = self->_defaultUserActionFetcher;
    self->_defaultUserActionFetcher = v4;

    defaultUserActionFetcher = self->_defaultUserActionFetcher;
  }

  return defaultUserActionFetcher;
}

- (CNUIDefaultUserActionFetcher)defaultUserActionFetcher
{
  v2 = cn_objectResultWithObjectLock();

  return (CNUIDefaultUserActionFetcher *)v2;
}

uint64_t __51__CNUIContactsEnvironment_defaultUserActionFetcher__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nts_lazyDefaultUserActionFetcher");
}

- (id)nts_lazyCapabilities
{
  capabilities = self->_capabilities;
  if (!capabilities)
  {
    uint64_t v4 = +[CNUIContactsEnvironmentServicesProvider capabilities];
    id v5 = self->_capabilities;
    self->_capabilities = v4;

    capabilities = self->_capabilities;
  }

  return capabilities;
}

- (CNCapabilities)capabilities
{
  v2 = cn_objectResultWithObjectLock();

  return (CNCapabilities *)v2;
}

uint64_t __39__CNUIContactsEnvironment_capabilities__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nts_lazyCapabilities");
}

- (CNLSApplicationWorkspace)applicationWorkspace
{
  v2 = cn_objectResultWithObjectLock();

  return (CNLSApplicationWorkspace *)v2;
}

uint64_t __47__CNUIContactsEnvironment_applicationWorkspace__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nts_lazyApplicationWorkspace");
}

- (id)nts_lazyIDSAvailabilityProvider
{
  idsAvailabilityProvider = self->_idsAvailabilityProvider;
  if (!idsAvailabilityProvider)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F5A698]);
    id v5 = +[CNUIContactsEnvironmentServicesProvider idsIDQueryControllerWrapper];
    uint64_t v6 = (CNUIIDSAvailabilityProvider *)[v4 initWithQueryControllerWrapper:v5];
    uint64_t v7 = self->_idsAvailabilityProvider;
    self->_idsAvailabilityProvider = v6;

    idsAvailabilityProvider = self->_idsAvailabilityProvider;
  }

  return idsAvailabilityProvider;
}

- (CNUIIDSAvailabilityProvider)idsAvailabilityProvider
{
  v2 = cn_objectResultWithObjectLock();

  return (CNUIIDSAvailabilityProvider *)v2;
}

uint64_t __50__CNUIContactsEnvironment_idsAvailabilityProvider__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nts_lazyIDSAvailabilityProvider");
}

- (id)nts_makeActionDiscoveringEnvironment
{
  objc_super v3 = [(CNUIContactsEnvironment *)self nts_lazyIDSAvailabilityProvider];
  id v4 = [(CNUIContactsEnvironment *)self nts_lazyDefaultSchedulerProvider];
  id v5 = [(CNUIContactsEnvironment *)self nts_lazyCapabilities];
  uint64_t v6 = [(CNUIContactsEnvironment *)self nts_lazyDefaultUserActionFetcher];
  uint64_t v7 = [(CNUIContactsEnvironment *)self nts_lazyApplicationWorkspace];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F5A710]) initWithIDSAvailabilityProvider:v3 schedulerProvider:v4 capabilities:v5 defaultUserActionFetcher:v6 applicationWorkspace:v7];

  return v8;
}

- (id)nts_lazyActionDiscoveringEnvironment
{
  actionDiscoveringEnvironment = self->_actionDiscoveringEnvironment;
  if (!actionDiscoveringEnvironment)
  {
    id v4 = [(CNUIContactsEnvironment *)self nts_makeActionDiscoveringEnvironment];
    id v5 = self->_actionDiscoveringEnvironment;
    self->_actionDiscoveringEnvironment = v4;

    actionDiscoveringEnvironment = self->_actionDiscoveringEnvironment;
  }

  return actionDiscoveringEnvironment;
}

- (CNUIUserActionDiscoveringEnvironment)actionDiscoveringEnvironment
{
  v2 = cn_objectResultWithObjectLock();

  return (CNUIUserActionDiscoveringEnvironment *)v2;
}

uint64_t __55__CNUIContactsEnvironment_actionDiscoveringEnvironment__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nts_lazyActionDiscoveringEnvironment");
}

- (CNUIMeContactMonitor)meMonitor
{
  return 0;
}

- (id)nts_lazyCachingMonogramRenderer
{
  cachingMonogramRenderer = self->_cachingMonogramRenderer;
  if (!cachingMonogramRenderer)
  {
    id v4 = [(CNUIContactsEnvironment *)self nts_lazyInProcessContactStore];
    id v5 = [(CNUIContactsEnvironment *)self nts_lazyDefaultSchedulerProvider];
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F5A6E0]) initWithContactStore:v4 schedulerProvider:v5];
    [v6 setProhibitedSources:9];
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F5A6E8]) initWithLikenessResolver:v6];
    v8 = (void *)MEMORY[0x1E4F5A6C0];
    v9 = [(CNUIContactsEnvironment *)self nts_lazyDefaultSchedulerProvider];
    objc_super v10 = [v8 cachingRendererWithLikenessResolver:v7 schedulerProvider:v9];
    v11 = self->_cachingMonogramRenderer;
    self->_cachingMonogramRenderer = v10;

    cachingMonogramRenderer = self->_cachingMonogramRenderer;
  }

  return cachingMonogramRenderer;
}

- (CNUILikenessRendering)cachingMonogramRenderer
{
  v2 = cn_objectResultWithObjectLock();

  return (CNUILikenessRendering *)v2;
}

uint64_t __50__CNUIContactsEnvironment_cachingMonogramRenderer__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nts_lazyCachingMonogramRenderer");
}

- (id)nts_lazyPlaceholderProviderFactory
{
  placeholderProviderFactory = self->_placeholderProviderFactory;
  if (!placeholderProviderFactory)
  {
    id v4 = (CNUIPlaceholderProviderFactory *)objc_alloc_init(MEMORY[0x1E4F5A6F0]);
    id v5 = self->_placeholderProviderFactory;
    self->_placeholderProviderFactory = v4;

    placeholderProviderFactory = self->_placeholderProviderFactory;
  }

  return placeholderProviderFactory;
}

- (CNUIPlaceholderProviderFactory)placeholderProviderFactory
{
  v2 = cn_objectResultWithObjectLock();

  return (CNUIPlaceholderProviderFactory *)v2;
}

uint64_t __53__CNUIContactsEnvironment_placeholderProviderFactory__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nts_lazyPlaceholderProviderFactory");
}

- (void)setPersonaId:(id)a3
{
  id v5 = (NSString *)a3;
  if (v5)
  {
    personaId = self->_personaId;
    if (personaId != v5)
    {
      objc_super v10 = v5;
      if (!personaId || (v7 = [(NSString *)personaId compare:v5], id v5 = v10, v7))
      {
        cachingLikenessResolver = self->_cachingLikenessResolver;
        self->_cachingLikenessResolver = 0;

        cachingLikenessRenderer = self->_cachingLikenessRenderer;
        self->_cachingLikenessRenderer = 0;

        objc_storeStrong((id *)&self->_personaId, a3);
        id v5 = v10;
      }
    }
  }
}

- (CNContactStore)inProcessContactStore
{
  v2 = cn_objectResultWithObjectLock();

  return (CNContactStore *)v2;
}

uint64_t __48__CNUIContactsEnvironment_inProcessContactStore__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nts_lazyInProcessContactStore");
}

- (CNUIContactsEnvironment)init
{
  objc_super v3 = [MEMORY[0x1E4F1B9A0] currentEnvironment];
  id v4 = [(CNUIContactsEnvironment *)self initWithContactsEnvironment:v3];

  return v4;
}

@end