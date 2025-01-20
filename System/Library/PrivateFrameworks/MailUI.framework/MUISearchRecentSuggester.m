@interface MUISearchRecentSuggester
+ (OS_os_log)log;
+ (id)suggesterWithPersistentDirectory:(id)a3;
- (BOOL)shouldQueryForAsYouType;
- (EFScheduler)excludeFromBackupScheduler;
- (MUISearchRecentSuggester)initWithPersistentDirectory:(id)a3;
- (NSArray)categories;
- (NSArray)supportedCategories;
- (NSMutableSet)recentSearches;
- (NSString)logIdentifier;
- (id)generateSuggestionsUsingPhraseManager:(id)a3 handler:(id)a4;
- (unint64_t)maxRecentCount;
- (void)_excludeStorageURLFromBackup;
- (void)_removeOldSuggestions;
- (void)addSuggestion:(id)a3;
- (void)dealloc;
- (void)deleteSuggestion:(id)a3;
- (void)loadRecentSearches;
- (void)saveRecentSearches;
- (void)setExcludeFromBackupScheduler:(id)a3;
- (void)setMaxRecentCount:(unint64_t)a3;
- (void)setRecentSearches:(id)a3;
- (void)setSupportedCategories:(id)a3;
@end

@implementation MUISearchRecentSuggester

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__MUISearchRecentSuggester_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_10 != -1) {
    dispatch_once(&log_onceToken_10, block);
  }
  v2 = (void *)log_log_10;
  return (OS_os_log *)v2;
}

void __31__MUISearchRecentSuggester_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_10;
  log_log_10 = (uint64_t)v1;
}

- (MUISearchRecentSuggester)initWithPersistentDirectory:(id)a3
{
  v33[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)MUISearchRecentSuggester;
  v5 = [(MUISearchRecentSuggester *)&v30 init];
  if (v5)
  {
    id v25 = v4;
    uint64_t v6 = [v4 URLByAppendingPathComponent:@"recentSearches.plist" isDirectory:0];
    storageURL = v5->_storageURL;
    v5->_storageURL = (NSURL *)v6;

    uint64_t v8 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"com.apple.mailui.MUISearchRecentSuggester.excludeFromBackupScheduler" qualityOfService:17];
    excludeFromBackupScheduler = v5->_excludeFromBackupScheduler;
    v5->_excludeFromBackupScheduler = (EFScheduler *)v8;

    v5->_maxRecentCount = 3;
    v10 = +[MUISearchSuggestionCategory genericCategory];
    v33[0] = v10;
    v11 = +[MUISearchSuggestionCategory recentGenericCategory];
    v33[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
    supportedCategories = v5->_supportedCategories;
    v5->_supportedCategories = (NSArray *)v12;

    uint64_t v14 = [MEMORY[0x1E4F1CA80] set];
    recentSearches = v5->_recentSearches;
    v5->_recentSearches = (NSMutableSet *)v14;

    [(MUISearchRecentSuggester *)v5 loadRecentSearches];
    v5->_needSave = 0;
    uint64_t v16 = *MEMORY[0x1E4FB2740];
    v32[0] = *MEMORY[0x1E4FB2738];
    v32[1] = v16;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v27 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v23 addObserver:v5 selector:sel_saveRecentSearches name:v22 object:0];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v19);
    }

    [(MUISearchRecentSuggester *)v5 _excludeStorageURLFromBackup];
    id v4 = v25;
  }

  return v5;
}

- (void)dealloc
{
  [(MUISearchRecentSuggester *)self saveRecentSearches];
  v3.receiver = self;
  v3.super_class = (Class)MUISearchRecentSuggester;
  [(MUISearchRecentSuggester *)&v3 dealloc];
}

+ (id)suggesterWithPersistentDirectory:(id)a3
{
  id v3 = a3;
  id v4 = [[MUISearchRecentSuggester alloc] initWithPersistentDirectory:v3];

  return v4;
}

- (BOOL)shouldQueryForAsYouType
{
  return 0;
}

- (NSString)logIdentifier
{
  return (NSString *)@"Recent";
}

- (NSArray)categories
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = +[MUISearchSuggestionCategory recentGenericCategory];
  v5[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return (NSArray *)v3;
}

- (void)_excludeStorageURLFromBackup
{
  id v3 = self->_storageURL;
  excludeFromBackupScheduler = self->_excludeFromBackupScheduler;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__MUISearchRecentSuggester__excludeStorageURLFromBackup__block_invoke;
  v6[3] = &unk_1E6D11708;
  v7 = v3;
  v5 = v3;
  [(EFScheduler *)excludeFromBackupScheduler performBlock:v6];
}

void __56__MUISearchRecentSuggester__excludeStorageURLFromBackup__block_invoke(uint64_t a1)
{
  v2 = (uint64_t *)(a1 + 32);
  os_log_t v1 = *(void **)(a1 + 32);
  uint64_t v3 = *MEMORY[0x1E4F1C630];
  id v7 = 0;
  char v4 = [v1 setResourceValue:MEMORY[0x1E4F1CC38] forKey:v3 error:&v7];
  id v5 = v7;
  if ((v4 & 1) == 0)
  {
    uint64_t v6 = +[MUISearchRecentSuggester log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __56__MUISearchRecentSuggester__excludeStorageURLFromBackup__block_invoke_cold_1(v2, v6);
    }
  }
}

- (void)deleteSuggestion:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[MUISearchRecentSuggester log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 debugDescription];
    int v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_1DDCDB000, v5, OS_LOG_TYPE_DEFAULT, "Delete suggestion %{public}@.", (uint8_t *)&v8, 0xCu);
  }
  os_unfair_lock_lock(&self->_lock);
  id v7 = [(MUISearchRecentSuggester *)self recentSearches];
  [v7 removeObject:v4];

  self->_needSave = 1;
  os_unfair_lock_unlock(&self->_lock);
}

- (void)addSuggestion:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[MUISearchRecentSuggester log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_msgSend(v4, "ef_publicDescription");
    int v13 = 138543362;
    uint64_t v14 = v6;
    _os_log_impl(&dword_1DDCDB000, v5, OS_LOG_TYPE_DEFAULT, "Add suggestion %{public}@.", (uint8_t *)&v13, 0xCu);
  }
  os_unfair_lock_lock(&self->_lock);
  supportedCategories = self->_supportedCategories;
  int v8 = [v4 category];
  LODWORD(supportedCategories) = [(NSArray *)supportedCategories containsObject:v8];

  if (supportedCategories)
  {
    v9 = [(MUISearchRecentSuggester *)self recentSearches];
    id v10 = [v9 member:v4];

    if (!v10)
    {
      v11 = [(MUISearchRecentSuggester *)self recentSearches];
      [v11 addObject:v4];

      id v10 = v4;
    }
    uint64_t v12 = [MEMORY[0x1E4F1C9C8] date];
    [v10 setLastUsedTime:v12];

    self->_needSave = 1;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_removeOldSuggestions
{
  id v3 = [(MUISearchRecentSuggester *)self recentSearches];
  v2 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_31];
  [v3 filterUsingPredicate:v2];
}

BOOL __49__MUISearchRecentSuggester__removeOldSuggestions__block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F1C9C8];
  id v3 = a2;
  id v4 = [v2 date];
  id v5 = [v3 lastUsedTime];

  [v4 timeIntervalSinceDate:v5];
  BOOL v7 = v6 <= 604800.0;

  return v7;
}

- (void)saveRecentSearches
{
  os_log_t v1 = objc_msgSend(a1, "ef_publicDescription");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DDCDB000, v2, v3, "Failed to archive recent searches %{public}@", v4, v5, v6, v7, v8);
}

id __46__MUISearchRecentSuggester_saveRecentSearches__block_invoke(uint64_t a1, void *a2)
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"s";
  id v2 = a2;
  uint64_t v3 = [v2 spotlightSuggestion];
  v7[1] = @"l";
  v8[0] = v3;
  uint64_t v4 = [v2 lastUsedTime];

  v8[1] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (void)loadRecentSearches
{
  os_log_t v1 = objc_msgSend(a1, "ef_publicDescription");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DDCDB000, v2, v3, "Failed to read recent searches %{public}@", v4, v5, v6, v7, v8);
}

- (id)generateSuggestionsUsingPhraseManager:(id)a3 handler:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *))a4;
  if ([v6 phraseKind] == 1)
  {
    os_unfair_lock_lock(&self->_lock);
    uint8_t v8 = [(MUISearchRecentSuggester *)self recentSearches];
    v9 = [v8 allObjects];

    os_unfair_lock_unlock(&self->_lock);
    id v10 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"lastUsedTime" ascending:0];
    v19[0] = v10;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    uint64_t v12 = [v9 sortedArrayUsingDescriptors:v11];

    int v13 = objc_msgSend(v12, "ef_prefix:", -[MUISearchRecentSuggester maxRecentCount](self, "maxRecentCount"));

    uint64_t v14 = +[MUISearchRecentSuggester log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = objc_msgSend(v13, "ef_mapSelector:", sel_ef_publicDescription);
      int v17 = 138412290;
      uint64_t v18 = v15;
      _os_log_impl(&dword_1DDCDB000, v14, OS_LOG_TYPE_DEFAULT, "Found recent suggestions %@", (uint8_t *)&v17, 0xCu);
    }
    v7[2](v7, v13);
  }
  return 0;
}

- (unint64_t)maxRecentCount
{
  return self->_maxRecentCount;
}

- (void)setMaxRecentCount:(unint64_t)a3
{
  self->_maxRecentCount = a3;
}

- (NSMutableSet)recentSearches
{
  return self->_recentSearches;
}

- (void)setRecentSearches:(id)a3
{
}

- (NSArray)supportedCategories
{
  return self->_supportedCategories;
}

- (void)setSupportedCategories:(id)a3
{
}

- (EFScheduler)excludeFromBackupScheduler
{
  return self->_excludeFromBackupScheduler;
}

- (void)setExcludeFromBackupScheduler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludeFromBackupScheduler, 0);
  objc_storeStrong((id *)&self->_supportedCategories, 0);
  objc_storeStrong((id *)&self->_recentSearches, 0);
  objc_storeStrong((id *)&self->_storageURL, 0);
}

void __56__MUISearchRecentSuggester__excludeStorageURLFromBackup__block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1DDCDB000, a2, OS_LOG_TYPE_ERROR, "Failed to set NSURLIsExcludedFromBackupKey property on recent search plist at %@", (uint8_t *)&v3, 0xCu);
}

@end