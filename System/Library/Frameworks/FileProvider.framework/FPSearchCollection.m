@interface FPSearchCollection
- (BOOL)isCollectionValidForItem:(id)a3;
- (FPSearchCollection)init;
- (NSFileProviderSearchQuery)searchQuery;
- (id)_createDescriptorWithSortDescriptors:(id)a3;
- (id)_enumerationSettingsPredicate;
- (id)createDataSourceWithSortDescriptors:(id)a3;
- (id)scopedSearchQuery;
- (void)setSearchQuery:(id)a3;
@end

@implementation FPSearchCollection

- (FPSearchCollection)init
{
  uint64_t v3 = objc_opt_class();
  v5.receiver = self;
  v5.super_class = (Class)FPSearchCollection;
  return [(FPQueryCollection *)&v5 initWithQueryDescriptorClass:v3 predicate:0 paced:0];
}

- (id)createDataSourceWithSortDescriptors:(id)a3
{
  id v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  v7 = [(FPSearchCollection *)v6 _enumerationSettingsPredicate];
  [(FPItemCollection *)v6 setAdditionalItemFilteringPredicate:v7];

  v8 = [(FPSearchCollection *)v6 _createDescriptorWithSortDescriptors:v5];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2 object:v6 file:@"FPSearchCollection.m" lineNumber:42 description:@"invalid kind of descriptor class"];
    }
  }
  v9 = [FPSearchQueryDataSource alloc];
  v10 = [(FPQueryCollection *)v6 predicate];
  v11 = [(FPSearchQueryDataSource *)v9 initWithQueryDescriptor:v8 predicate:v10];

  objc_sync_exit(v6);

  return v11;
}

- (id)_createDescriptorWithSortDescriptors:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)FPSearchCollection;
  v4 = [(FPQueryCollection *)&v14 _createDescriptorWithSortDescriptors:a3];
  id v5 = [(FPSearchCollection *)self searchQuery];
  v6 = [v4 settings];
  [v6 setSearchQuery:v5];

  v7 = [(FPSearchCollection *)self searchQuery];
  uint64_t v8 = [v7 shouldPerformSemanticSearch];
  v9 = [v4 settings];
  [v9 setAllowSemanticSearchResults:v8];

  v10 = [v4 settings];
  v11 = [v10 searchQuery];

  v12 = [v11 toSpotlightQueryString];
  [v4 setSearchQueryString:v12];

  objc_msgSend(v4, "setThirdPartySearchOnServer:", objc_msgSend(v11, "shouldPerformThirdPartyServerSearch"));
  objc_msgSend(v4, "setAvoidCoreSpotlightSearch:", objc_msgSend(v11, "avoidCoreSpotlightSearch"));

  return v4;
}

- (id)_enumerationSettingsPredicate
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id location = 0;
  objc_initWeak(&location, self);
  uint64_t v3 = (void *)MEMORY[0x1E4F28F60];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__FPSearchCollection__enumerationSettingsPredicate__block_invoke;
  v11[3] = &unk_1E5AF6380;
  objc_copyWeak(&v12, &location);
  v4 = [v3 predicateWithBlock:v11];
  id v5 = (void *)MEMORY[0x1E4F28BA0];
  v14[0] = v4;
  v10.receiver = self;
  v10.super_class = (Class)FPSearchCollection;
  v6 = [(FPQueryCollection *)&v10 _enumerationSettingsPredicate];
  v14[1] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  uint64_t v8 = [v5 andPredicateWithSubpredicates:v7];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v8;
}

uint64_t __51__FPSearchCollection__enumerationSettingsPredicate__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v4);

  if (!WeakRetained)
  {
    id v6 = objc_loadWeakRetained(v4);

    if (!v6)
    {
      id v12 = [MEMORY[0x1E4F28B00] currentHandler];
      v13 = [NSString stringWithUTF8String:"-[FPSearchCollection _enumerationSettingsPredicate]_block_invoke"];
      [v12 handleFailureInFunction:v13 file:@"FPSearchCollection.m" lineNumber:73 description:@"weakSelf is nil while evaluating isTrashedPredicate"];
    }
  }
  id v7 = objc_loadWeakRetained(v4);
  uint64_t v8 = [v7 searchQuery];

  if (v8 && [v8 trashedItemsMembership])
  {
    BOOL v9 = [v8 trashedItemsMembership] == 1;
    uint64_t v10 = [v3 isTrashed] ^ v9;
  }
  else
  {
    uint64_t v10 = 1;
  }

  return v10;
}

- (BOOL)isCollectionValidForItem:(id)a3
{
  id v4 = a3;
  BOOL v8 = [v4 enumerationOrigin] == 2
    || !self->_filterPredicate
    || ([(FPQueryCollection *)self settings],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [v5 searchQuery],
        id v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 shouldPerformThirdPartyServerSearch],
        v6,
        v5,
        (v7 & 1) != 0)
    || [(NSPredicate *)self->_filterPredicate evaluateWithObject:v4];

  return v8;
}

- (void)setSearchQuery:(id)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = (void *)MEMORY[0x1E4F28BA0];
  char v7 = [v4 filenamePredicate];
  v16[0] = v7;
  BOOL v8 = [v4 allowedContentTypesPredicate];
  v16[1] = v8;
  BOOL v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  uint64_t v10 = [v6 andPredicateWithSubpredicates:v9];
  filterPredicate = v5->_filterPredicate;
  v5->_filterPredicate = (NSPredicate *)v10;

  id v12 = [(FPQueryCollection *)v5 settings];
  [v12 setSearchQuery:v4];

  v13 = [v4 allowedContentTypes];
  objc_super v14 = [v13 allObjects];
  v15 = [(FPQueryCollection *)v5 settings];
  [v15 setAllowedFileTypes:v14];

  objc_sync_exit(v5);
}

- (NSFileProviderSearchQuery)searchQuery
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(FPQueryCollection *)v2 settings];
  id v4 = [v3 searchQuery];

  objc_sync_exit(v2);

  return (NSFileProviderSearchQuery *)v4;
}

- (id)scopedSearchQuery
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"FPSearchCollection.m" lineNumber:135 description:@"UNREACHABLE: A search collection should not provide a search query."];

  return 0;
}

- (void).cxx_destruct
{
}

@end