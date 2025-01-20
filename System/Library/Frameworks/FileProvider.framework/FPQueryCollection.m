@interface FPQueryCollection
+ (void)disableMountPointQueries;
+ (void)enableMountPointQueries;
+ (void)resumeAllQueries;
+ (void)suspendAllQueries;
- (FPQueryCollection)initWithQueryDescriptorClass:(Class)a3;
- (FPQueryCollection)initWithQueryDescriptorClass:(Class)a3 predicate:(id)a4;
- (FPQueryCollection)initWithQueryDescriptorClass:(Class)a3 predicate:(id)a4 paced:(BOOL)a5;
- (FPQueryEnumerationSettings)settings;
- (NSArray)allowedFileTypes;
- (NSArray)allowedProviderIdentifiers;
- (NSArray)excludedFileTypes;
- (NSArray)excludedParentOIDs;
- (NSNumber)desiredNumberOfItems;
- (NSPredicate)predicate;
- (NSString)descriptionName;
- (NSString)tagIdentifier;
- (id)_createDescriptorWithSortDescriptors:(id)a3;
- (id)_enumerationSettingsPredicate;
- (id)createDataSourceWithSortDescriptors:(id)a3;
- (id)description;
- (id)scopedSearchQuery;
- (id)underlyingQueryStringForMountPoint:(id)a3;
- (unint64_t)itemsOrigin;
- (void)dataSource:(id)a3 didChangeItemsOrigin:(unint64_t)a4;
- (void)setAllowedFileTypes:(id)a3;
- (void)setAllowedProviderIdentifiers:(id)a3;
- (void)setDescriptionName:(id)a3;
- (void)setDesiredNumberOfItems:(id)a3;
- (void)setExcludedFileTypes:(id)a3;
- (void)setExcludedParentOIDs:(id)a3;
- (void)setTagIdentifier:(id)a3;
@end

@implementation FPQueryCollection

uint64_t __50__FPQueryCollection__enumerationSettingsPredicate__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v30 = [MEMORY[0x1E4F28B00] currentHandler];
      v31 = [NSString stringWithUTF8String:"-[FPQueryCollection _enumerationSettingsPredicate]_block_invoke"];
      [v30 handleFailureInFunction:v31 file:@"FPQueryCollection.m" lineNumber:246 description:@"Only items are allowed to be evaluated."];
    }
  }
  id v4 = v3;
  v5 = *(void **)(a1 + 32);
  if (v5 && ![v5 evaluateWithObject:v4]) {
    goto LABEL_28;
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v6 = [*(id *)(a1 + 40) excludedFileTypes];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v37;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v37 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v36 + 1) + 8 * i);
        v12 = [v4 contentType];
        v13 = objc_msgSend(MEMORY[0x1E4F442D8], "fp_cachedTypeWithIdentifier:", v11);
        char v14 = [v12 conformsToType:v13];

        if (v14)
        {
          uint64_t v22 = 0;
          goto LABEL_27;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v36 objects:v41 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  uint64_t v15 = [*(id *)(a1 + 40) allowedProviders];
  if (!v15) {
    goto LABEL_16;
  }
  v16 = (void *)v15;
  v17 = [*(id *)(a1 + 40) allowedProviders];
  v18 = [v4 providerID];
  int v19 = [v17 containsObject:v18];

  if (!v19)
  {
LABEL_28:
    uint64_t v22 = 0;
  }
  else
  {
LABEL_16:
    v20 = [*(id *)(a1 + 40) allowedFileTypes];
    uint64_t v21 = [v20 count];

    if (v21)
    {
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      v6 = objc_msgSend(*(id *)(a1 + 40), "allowedFileTypes", 0);
      uint64_t v22 = [v6 countByEnumeratingWithState:&v32 objects:v40 count:16];
      if (v22)
      {
        uint64_t v23 = *(void *)v33;
        while (2)
        {
          for (uint64_t j = 0; j != v22; ++j)
          {
            if (*(void *)v33 != v23) {
              objc_enumerationMutation(v6);
            }
            uint64_t v25 = *(void *)(*((void *)&v32 + 1) + 8 * j);
            v26 = [v4 contentType];
            v27 = objc_msgSend(MEMORY[0x1E4F442D8], "fp_cachedTypeWithIdentifier:", v25);
            char v28 = [v26 conformsToType:v27];

            if (v28)
            {
              uint64_t v22 = 1;
              goto LABEL_27;
            }
          }
          uint64_t v22 = [v6 countByEnumeratingWithState:&v32 objects:v40 count:16];
          if (v22) {
            continue;
          }
          break;
        }
      }
LABEL_27:
    }
    else
    {
      uint64_t v22 = 1;
    }
  }

  return v22;
}

- (unint64_t)itemsOrigin
{
  return self->_itemsOrigin;
}

- (id)createDataSourceWithSortDescriptors:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = [(FPQueryCollection *)v5 _enumerationSettingsPredicate];
  [(FPItemCollection *)v5 setAdditionalItemFilteringPredicate:v6];

  uint64_t v7 = [(FPQueryCollection *)v5 _createDescriptorWithSortDescriptors:v4];
  uint64_t v8 = [[FPSpotlightDataSource alloc] initWithQueryDescriptor:v7 predicate:v5->_predicate];

  objc_sync_exit(v5);

  return v8;
}

- (id)_enumerationSettingsPredicate
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_settings;
  id v4 = v2->_predicate;
  v5 = (void *)MEMORY[0x1E4F28F60];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__FPQueryCollection__enumerationSettingsPredicate__block_invoke;
  v10[3] = &unk_1E5AF2068;
  v6 = v4;
  uint64_t v11 = v6;
  uint64_t v7 = v3;
  v12 = v7;
  uint64_t v8 = [v5 predicateWithBlock:v10];

  objc_sync_exit(v2);

  return v8;
}

- (id)_createDescriptorWithSortDescriptors:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)[(FPQueryEnumerationSettings *)v5->_settings copy];
  [v6 setSortDescriptors:v4];
  uint64_t v7 = (void *)[objc_alloc(v5->_descriptorClass) initWithSettings:v6];

  objc_sync_exit(v5);

  return v7;
}

- (FPQueryCollection)initWithQueryDescriptorClass:(Class)a3 predicate:(id)a4 paced:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FPQueryCollection;
  v10 = [(FPItemCollection *)&v14 initWithPacing:v5];
  if (v10)
  {
    uint64_t v11 = objc_opt_new();
    settings = v10->_settings;
    v10->_settings = (FPQueryEnumerationSettings *)v11;

    v10->_descriptorClass = a3;
    objc_storeStrong((id *)&v10->_predicate, a4);
  }

  return v10;
}

- (void)dataSource:(id)a3 didChangeItemsOrigin:(unint64_t)a4
{
  id v7 = a3;
  v6 = self;
  objc_sync_enter(v6);
  if (v6->_itemsOrigin != a4)
  {
    [(FPQueryCollection *)v6 willChangeValueForKey:@"itemsOrigin"];
    v6->_itemsOrigin = a4;
    [(FPQueryCollection *)v6 didChangeValueForKey:@"itemsOrigin"];
  }
  objc_sync_exit(v6);
}

- (void)setDesiredNumberOfItems:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(FPQueryEnumerationSettings *)v4->_settings setDesiredNumberOfItems:v5];
  objc_sync_exit(v4);
}

- (void)setExcludedParentOIDs:(id)a3
{
  id v6 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = (void *)[v6 copy];
  [(FPQueryEnumerationSettings *)v4->_settings setExcludedParentOIDs:v5];

  objc_sync_exit(v4);
}

- (void)setExcludedFileTypes:(id)a3
{
  id v6 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = (void *)[v6 copy];
  [(FPQueryEnumerationSettings *)v4->_settings setExcludedFileTypes:v5];

  objc_sync_exit(v4);
}

- (void)setAllowedFileTypes:(id)a3
{
  id v6 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = (void *)[v6 copy];
  [(FPQueryEnumerationSettings *)v4->_settings setAllowedFileTypes:v5];

  objc_sync_exit(v4);
}

- (void)setDescriptionName:(id)a3
{
}

- (FPQueryCollection)initWithQueryDescriptorClass:(Class)a3 predicate:(id)a4
{
  return [(FPQueryCollection *)self initWithQueryDescriptorClass:a3 predicate:a4 paced:1];
}

+ (void)enableMountPointQueries
{
  id v2 = +[FPSpotlightCollectorManager sharedInstance];
  [v2 enableMountPointQueries];
}

- (FPQueryCollection)initWithQueryDescriptorClass:(Class)a3
{
  return [(FPQueryCollection *)self initWithQueryDescriptorClass:a3 predicate:0 paced:1];
}

- (id)description
{
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = [NSString stringWithFormat:@"<%@:%p %@ %@>", objc_opt_class(), v2, v2->_descriptionName, v2->_settings];
  objc_sync_exit(v2);

  return v3;
}

- (id)scopedSearchQuery
{
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = [(FPQueryCollection *)v2 _createDescriptorWithSortDescriptors:0];
  id v4 = [[NSFileProviderSearchQuery alloc] initWithSearchScope:0];
  id v5 = [NSFileProviderDomain alloc];
  id v6 = [(FPItemCollection *)v2 domainIdentifier];
  id v7 = [(NSFileProviderDomain *)v5 initWithIdentifier:v6 displayName:&stru_1EF68D1F8 pathRelativeToDocumentStorage:&stru_1EF68D1F8];

  uint64_t v8 = [FPProviderDomain alloc];
  id v9 = [(FPItemCollection *)v2 providerIdentifier];
  v10 = [(FPProviderDomain *)v8 initWithProviderID:v9 domain:v7];

  uint64_t v11 = [(FPProviderDomain *)v10 spotlightMountPoint];
  v12 = [v3 queryStringForMountPoint:v11];
  [(NSFileProviderSearchQuery *)v4 setScopeFragment:v12];

  objc_sync_exit(v2);

  return v4;
}

+ (void)suspendAllQueries
{
  id v2 = +[FPSpotlightCollectorManager sharedInstance];
  [v2 suspendCollectors];
}

+ (void)resumeAllQueries
{
  id v2 = +[FPSpotlightCollectorManager sharedInstance];
  [v2 resumeCollectors];
}

+ (void)disableMountPointQueries
{
  id v2 = +[FPSpotlightCollectorManager sharedInstance];
  [v2 disableMountPointQueries];
}

- (NSNumber)desiredNumberOfItems
{
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = [(FPQueryEnumerationSettings *)v2->_settings desiredNumberOfItems];
  objc_sync_exit(v2);

  return (NSNumber *)v3;
}

- (NSArray)allowedFileTypes
{
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = [(FPQueryEnumerationSettings *)v2->_settings allowedFileTypes];
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (NSArray)excludedFileTypes
{
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = [(FPQueryEnumerationSettings *)v2->_settings excludedFileTypes];
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (NSArray)excludedParentOIDs
{
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = [(FPQueryEnumerationSettings *)v2->_settings excludedParentOIDs];
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (void)setAllowedProviderIdentifiers:(id)a3
{
  id v6 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = (void *)[v6 copy];
  [(FPQueryEnumerationSettings *)v4->_settings setAllowedProviders:v5];

  objc_sync_exit(v4);
}

- (NSArray)allowedProviderIdentifiers
{
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = [(FPQueryEnumerationSettings *)v2->_settings allowedProviders];
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (id)underlyingQueryStringForMountPoint:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = [(FPQueryCollection *)v5 _createDescriptorWithSortDescriptors:0];
  id v7 = [v6 queryStringForMountPoint:v4];

  objc_sync_exit(v5);

  return v7;
}

- (void)setTagIdentifier:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = (void *)[v7 copy];
  id v6 = [(FPQueryCollection *)v4 settings];
  [v6 setTagIdentifier:v5];

  objc_sync_exit(v4);
}

- (NSString)tagIdentifier
{
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = [(FPQueryCollection *)v2 settings];
  id v4 = [v3 tagIdentifier];

  objc_sync_exit(v2);

  return (NSString *)v4;
}

- (NSString)descriptionName
{
  return (NSString *)objc_getProperty(self, a2, 272, 1);
}

- (FPQueryEnumerationSettings)settings
{
  return (FPQueryEnumerationSettings *)objc_getProperty(self, a2, 232, 1);
}

- (NSPredicate)predicate
{
  return (NSPredicate *)objc_getProperty(self, a2, 248, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionName, 0);
  objc_storeStrong((id *)&self->_predicate, 0);

  objc_storeStrong((id *)&self->_settings, 0);
}

@end