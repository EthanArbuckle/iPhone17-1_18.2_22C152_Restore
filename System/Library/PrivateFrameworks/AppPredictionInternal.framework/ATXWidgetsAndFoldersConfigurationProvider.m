@interface ATXWidgetsAndFoldersConfigurationProvider
- (ATXWidgetsAndFoldersConfigurationProvider)init;
- (unint64_t)globalAllPagesFolderCount;
- (unint64_t)globalAllPagesWidgetCount;
- (unint64_t)homePageFolderCountBucket;
- (unint64_t)homePageWidgetCountBucket;
- (void)cacheHomeScreenConfigurationsIfNecessary;
@end

@implementation ATXWidgetsAndFoldersConfigurationProvider

- (ATXWidgetsAndFoldersConfigurationProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)ATXWidgetsAndFoldersConfigurationProvider;
  v2 = [(ATXWidgetsAndFoldersConfigurationProvider *)&v6 init];
  if (v2)
  {
    v3 = (ATXHomeScreenConfigCache *)objc_alloc_init(MEMORY[0x1E4F4B078]);
    cache = v2->_cache;
    v2->_cache = v3;
  }
  return v2;
}

- (void)cacheHomeScreenConfigurationsIfNecessary
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "ATXWidgetsAndFoldersConfigurations: could not fetch home page configurations with error: %@", (uint8_t *)&v2, 0xCu);
}

uint64_t __85__ATXWidgetsAndFoldersConfigurationProvider_cacheHomeScreenConfigurationsIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (unint64_t)homePageFolderCountBucket
{
  [(ATXWidgetsAndFoldersConfigurationProvider *)self cacheHomeScreenConfigurationsIfNecessary];
  if ([(NSArray *)self->_homePageFolders count] > 0xA) {
    return 10;
  }
  homePageFolders = self->_homePageFolders;
  return [(NSArray *)homePageFolders count];
}

- (unint64_t)homePageWidgetCountBucket
{
  [(ATXWidgetsAndFoldersConfigurationProvider *)self cacheHomeScreenConfigurationsIfNecessary];
  uint64_t v3 = [(NSArray *)self->_pages firstObject];
  uint64_t v4 = [v3 stacks];
  if ((unint64_t)[v4 count] > 0xA)
  {
    unint64_t v7 = 10;
  }
  else
  {
    v5 = [(NSArray *)self->_pages firstObject];
    objc_super v6 = [v5 stacks];
    unint64_t v7 = [v6 count];
  }
  return v7;
}

- (unint64_t)globalAllPagesFolderCount
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [(ATXWidgetsAndFoldersConfigurationProvider *)self cacheHomeScreenConfigurationsIfNecessary];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = self->_pages;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "leafIcons", (void)v12);
        v10 = objc_msgSend(v9, "_pas_filteredArrayWithTest:", &__block_literal_global_13_2);
        v6 += [v10 count];
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

uint64_t __70__ATXWidgetsAndFoldersConfigurationProvider_globalAllPagesFolderCount__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (unint64_t)globalAllPagesWidgetCount
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(ATXWidgetsAndFoldersConfigurationProvider *)self cacheHomeScreenConfigurationsIfNecessary];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = self->_pages;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "stacks", (void)v11);
        v6 += [v9 count];
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homePageFolders, 0);
  objc_storeStrong((id *)&self->_pages, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end