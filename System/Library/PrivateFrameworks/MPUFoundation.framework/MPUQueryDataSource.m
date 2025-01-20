@interface MPUQueryDataSource
- (BOOL)_deleteHidesFromCloudForIndex:(unint64_t)a3 hidesAll:(BOOL *)a4;
- (BOOL)canEditEntityAtIndex:(unint64_t)a3;
- (BOOL)canSelectEntityAtIndex:(unint64_t)a3;
- (BOOL)ignoringInvalidationDueToBackgroundApplicationState;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)showsEntityCountFooter;
- (BOOL)showsIndexBar;
- (MPMediaQuery)query;
- (MPUQueryDataSource)initWithCoder:(id)a3;
- (MPUQueryDataSource)initWithEntityType:(int64_t)a3;
- (MPUQueryDataSource)initWithQuery:(id)a3 entityType:(int64_t)a4;
- (_NSRange)rangeOfSectionAtIndex:(unint64_t)a3;
- (id)_representativeCollection;
- (id)_sectionInfo;
- (id)entities;
- (id)localizedSectionIndexTitles;
- (id)localizedSectionTitleAtIndex:(unint64_t)a3;
- (id)queryForEntityAtIndex:(unint64_t)a3;
- (id)queryForEntityAtIndexPath:(id)a3;
- (int64_t)editingTypeForEntityAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)hash;
- (unint64_t)indexOfSectionForSectionTitleAtIndex:(unint64_t)a3;
- (unint64_t)numberOfSections;
- (void)_applicationDidEnterBackground:(id)a3;
- (void)_applicationWillEnterForeground:(id)a3;
- (void)_defaultMediaLibraryDidChangeNotification:(id)a3;
- (void)_invalidateCalculatedEntities;
- (void)_invalidateForDisplayValuesChangeIfNeeded;
- (void)_invalidateIfNeeded;
- (void)addAdditionalMediaEntityPropertiesToFetch:(id)a3;
- (void)dealloc;
- (void)deleteEntityAtIndex:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)removeAdditionalMediaEntityPropertiesToFetch:(id)a3;
- (void)setIgnoringInvalidationDueToBackgroundApplicationState:(BOOL)a3;
@end

@implementation MPUQueryDataSource

- (MPUQueryDataSource)initWithEntityType:(int64_t)a3
{
  return [(MPUQueryDataSource *)self initWithQuery:0 entityType:a3];
}

- (MPUQueryDataSource)initWithQuery:(id)a3 entityType:(int64_t)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MPUQueryDataSource;
  v8 = [(MPUDataSource *)&v12 initWithEntityType:a4];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_query, a3);
    v10 = [MEMORY[0x263F08A00] defaultCenter];
    [v10 addObserver:v9 selector:sel__applicationWillEnterForeground_ name:*MEMORY[0x263F1D0D0] object:0];
    [v10 addObserver:v9 selector:sel__applicationDidEnterBackground_ name:*MEMORY[0x263F1D050] object:0];
    [v10 addObserver:v9 selector:sel__defaultMediaLibraryDidChangeNotification_ name:*MEMORY[0x263F11410] object:0];
    [v10 addObserver:v9 selector:sel__mediaLibraryDidChangeNotification_ name:*MEMORY[0x263F11418] object:0];
    [v10 addObserver:v9 selector:sel__mediaLibraryDisplayValuesDidChangeNotification_ name:*MEMORY[0x263F11420] object:0];
    [v10 addObserver:v9 selector:sel__mediaLibraryDynamicPropertiesDidChangeNotification_ name:*MEMORY[0x263F11428] object:0];
  }
  return v9;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F1D0D0] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F1D050] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F11410] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F11418] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F11420] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F11428] object:0];

  v4.receiver = self;
  v4.super_class = (Class)MPUQueryDataSource;
  [(MPUQueryDataSource *)&v4 dealloc];
}

- (MPUQueryDataSource)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MPUQueryDataSource;
  v5 = [(MPUDataSource *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"query"];
    query = v5->_query;
    v5->_query = (MPMediaQuery *)v6;

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"additionalUniqueItemPropertiesToFetch"];
    if ([v8 count])
    {
      uint64_t v9 = [objc_alloc(MEMORY[0x263EFF9C0]) initWithArray:v8];
      additionalUniqueItemPropertiesToFetch = v5->_additionalUniqueItemPropertiesToFetch;
      v5->_additionalUniqueItemPropertiesToFetch = (NSMutableSet *)v9;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MPUQueryDataSource;
  [(MPUDataSource *)&v6 encodeWithCoder:v4];
  [v4 encodeObject:self->_query forKey:@"query"];
  v5 = [(NSMutableSet *)self->_additionalUniqueItemPropertiesToFetch allObjects];
  if ([v5 count]) {
    [v4 encodeObject:v5 forKey:@"additionalUniqueItemPropertiesToFetch"];
  }
}

- (unint64_t)hash
{
  int64_t v3 = [(MPUDataSource *)self entityType];
  BOOL v4 = [(MPUDataSource *)self isIgnoringInvalidation];
  uint64_t v5 = 5;
  if (v4) {
    uint64_t v5 = 0;
  }
  uint64_t v6 = v5 ^ v3;
  uint64_t v7 = [(MPMediaQuery *)self->_query hash];
  uint64_t v8 = 100;
  if (self->_invalidateWhenEnteringForeground) {
    uint64_t v8 = 0;
  }
  return v6 ^ (10 * v7) ^ v8 ^ (1000 * [(NSMutableSet *)self->_additionalUniqueItemPropertiesToFetch hash]);
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = (MPUQueryDataSource *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      int64_t v6 = [(MPUDataSource *)self entityType];
      if (v6 == [(MPUDataSource *)v5 entityType]
        && (BOOL v7 = [(MPUDataSource *)self isIgnoringInvalidation],
            v7 == [(MPUDataSource *)v5 isIgnoringInvalidation])
        && ((query = self->_query, query == v5->_query) || -[MPMediaQuery isEqual:](query, "isEqual:"))
        && !self->_invalidateWhenEnteringForeground
        && !v5->_invalidateWhenEnteringForeground)
      {
        additionalUniqueItemPropertiesToFetch = self->_additionalUniqueItemPropertiesToFetch;
        if (additionalUniqueItemPropertiesToFetch == v5->_additionalUniqueItemPropertiesToFetch) {
          char v9 = 1;
        }
        else {
          char v9 = -[NSMutableSet isEqualToSet:](additionalUniqueItemPropertiesToFetch, "isEqualToSet:");
        }
      }
      else
      {
        char v9 = 0;
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (BOOL)canEditEntityAtIndex:(unint64_t)a3
{
  uint64_t v5 = [MEMORY[0x263F121E8] sharedRestrictionsMonitor];
  int v6 = [v5 allowsDeletion];

  return v6 && [(MPUQueryDataSource *)self count] > a3;
}

- (BOOL)canSelectEntityAtIndex:(unint64_t)a3
{
  if (![(MPUDataSource *)self entityType])
  {
    BOOL v7 = [(MPUDataSource *)self entityAtIndex:a3];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      char v5 = 1;
      char v6 = 1;
LABEL_19:

      return v6 & v5;
    }
    uint64_t v8 = *MEMORY[0x263F11308];
    char v9 = [v7 valueForProperty:*MEMORY[0x263F11308]];
    if (([v9 BOOLValue] & 1) == 0)
    {
      v10 = [v7 valueForProperty:*MEMORY[0x263F11328]];
      if ([v10 BOOLValue])
      {
      }
      else
      {
        uint64_t v11 = *MEMORY[0x263F11280];
        objc_super v12 = [v7 valueForProperty:*MEMORY[0x263F11280]];

        if (v12
          || ([v7 valueForProperty:*MEMORY[0x263F11360]],
              v13 = objc_claimAutoreleasedReturnValue(),
              int v14 = [v13 BOOLValue],
              v13,
              !v14))
        {
          char v6 = 1;
          goto LABEL_15;
        }
        char v9 = [v7 valueForProperty:v11];
        if ([v9 length])
        {
          char v6 = [v9 isEqualToString:@"0"];
          goto LABEL_8;
        }
      }
    }
    char v6 = 1;
LABEL_8:

LABEL_15:
    v15 = [MEMORY[0x263F11D60] sharedCloudController];
    if ([v15 hasProperNetworkConditionsToPlayMedia])
    {
      char v5 = 1;
    }
    else
    {
      v16 = [v7 valueForProperty:v8];
      char v5 = [v16 BOOLValue];
    }
    goto LABEL_19;
  }
  char v5 = 1;
  char v6 = 1;
  return v6 & v5;
}

- (unint64_t)count
{
  int64_t v3 = [(MPUDataSource *)self entityType];
  entities = self->_entities;
  if (v3)
  {
    if (!entities)
    {
      query = self->_query;
      return [(MPMediaQuery *)query _countOfCollections];
    }
    goto LABEL_7;
  }
  if (entities)
  {
LABEL_7:
    return [(NSArray *)entities count];
  }
  BOOL v7 = self->_query;

  return [(MPMediaQuery *)v7 _countOfItems];
}

- (void)deleteEntityAtIndex:(unint64_t)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  BOOL v4 = [(MPUDataSource *)self entityAtIndex:a3];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_12;
  }
  char v5 = [v4 mediaLibrary];
  char v6 = [MEMORY[0x263F11E40] deviceMediaLibrary];
  int v7 = [v5 isEqual:v6];

  if (!v7) {
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v11[0] = v4;
    uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      char v9 = 0;
      goto LABEL_9;
    }
    uint64_t v8 = [v4 items];
  }
  char v9 = (void *)v8;
LABEL_9:
  if ([v9 count])
  {
    v10 = [v4 mediaLibrary];
    [v10 removeItems:v9];

    [(MPUQueryDataSource *)self _invalidateCalculatedEntities];
  }

LABEL_12:
}

- (int64_t)editingTypeForEntityAtIndex:(unint64_t)a3
{
  char v5 = [MEMORY[0x263F121E8] sharedRestrictionsMonitor];
  int v6 = [v5 allowsDeletion];

  if (v6 && [(MPUQueryDataSource *)self count] > a3)
  {
    int v7 = [(MPUDataSource *)self entityAtIndex:a3];
    uint64_t v8 = [v7 mediaLibrary];
    char v9 = [MEMORY[0x263F11E40] deviceMediaLibrary];
    int v10 = [v8 isEqual:v9];

    if (v10)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = v7;
        uint64_t v12 = *MEMORY[0x263F112E8];
        uint64_t v13 = *MEMORY[0x263F11310];
        int v14 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F112E8], *MEMORY[0x263F11310], 0);
        v15 = [v11 valuesForProperties:v14];

        v16 = [v15 objectForKey:v12];
        if ([v16 BOOLValue])
        {

LABEL_12:
          int64_t v17 = 1;
          goto LABEL_13;
        }
        v21 = [v15 objectForKey:v13];
        char v22 = [v21 BOOLValue];

        if ((v22 & 1) == 0) {
          goto LABEL_12;
        }
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v18 = [v7 itemsQuery];
          v19 = (void *)[v18 copy];
          uint64_t v20 = [MEMORY[0x263F11E60] predicateWithValue:MEMORY[0x263EFFA88] forProperty:*MEMORY[0x263F112E8]];
          [v19 addFilterPredicate:v20];

          LOBYTE(v20) = [v19 _hasItems];
          if (v20) {
            goto LABEL_12;
          }
        }
      }
    }
    int64_t v17 = 0;
LABEL_13:

    return v17;
  }
  return 0;
}

- (id)entities
{
  entities = self->_entities;
  if (!entities)
  {
    int64_t v4 = [(MPUDataSource *)self entityType];
    query = self->_query;
    if (v4) {
      [(MPMediaQuery *)query collections];
    }
    else {
    int v6 = [(MPMediaQuery *)query items];
    }
    int v7 = self->_entities;
    self->_entities = v6;

    entities = self->_entities;
    if (!entities)
    {
      self->_entities = (NSArray *)MEMORY[0x263EFFA68];

      entities = self->_entities;
    }
  }

  return entities;
}

- (id)queryForEntityAtIndex:(unint64_t)a3
{
  int64_t v4 = [(MPUDataSource *)self entityAtIndex:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v5 = [v4 itemsQuery];
  }
  else
  {
    int v6 = [(MPUQueryDataSource *)self query];
    char v5 = (void *)[v6 copy];

    int v7 = (void *)MEMORY[0x263F11E60];
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "persistentID"));
    char v9 = [v7 predicateWithValue:v8 forProperty:*MEMORY[0x263F11200]];
    [v5 addFilterPredicate:v9];
  }

  return v5;
}

- (id)queryForEntityAtIndexPath:(id)a3
{
  unint64_t v4 = [(MPUDataSource *)self _globalIndexForIndexPath:a3];

  return [(MPUQueryDataSource *)self queryForEntityAtIndex:v4];
}

- (void)_invalidateCalculatedEntities
{
  v6.receiver = self;
  v6.super_class = (Class)MPUQueryDataSource;
  [(MPUDataSource *)&v6 _invalidateCalculatedEntities];
  self->_hasValidRepresentativeCollection = 0;
  representativeCollection = self->_representativeCollection;
  self->_representativeCollection = 0;

  sectionInfo = self->_sectionInfo;
  self->_sectionInfo = 0;

  entities = self->_entities;
  self->_entities = 0;

  self->_hasValidEmpty = 0;
}

- (BOOL)isEmpty
{
  if (self->_hasValidEmpty) {
    return self->_isEmpty;
  }
  self->_hasValidEmpty = 1;
  int64_t v4 = [(MPUDataSource *)self entityType];
  entities = self->_entities;
  if (v4)
  {
    if (!entities)
    {
      char v6 = [(MPMediaQuery *)self->_query _hasCollections];
LABEL_9:
      BOOL result = v6 ^ 1;
      goto LABEL_10;
    }
  }
  else if (!entities)
  {
    char v6 = [(MPMediaQuery *)self->_query _hasItems];
    goto LABEL_9;
  }
  BOOL result = [(NSArray *)entities count] == 0;
LABEL_10:
  self->_isEmpty = result;
  return result;
}

- (BOOL)showsIndexBar
{
  return [(MPUDataSource *)self entityType] == 1 && [(MPUQueryDataSource *)self count] > 0x32;
}

- (unint64_t)numberOfSections
{
  if (![(MPUDataSource *)self usesSections]) {
    return [(MPUQueryDataSource *)self count] != 0;
  }
  int64_t v3 = [(MPUQueryDataSource *)self _sectionInfo];
  int64_t v4 = [v3 sections];
  unint64_t v5 = [v4 count];

  return v5;
}

- (id)localizedSectionIndexTitles
{
  v2 = [(MPUQueryDataSource *)self _sectionInfo];
  int64_t v3 = [v2 sectionIndexTitles];

  return v3;
}

- (id)localizedSectionTitleAtIndex:(unint64_t)a3
{
  int64_t v4 = [(MPUQueryDataSource *)self _sectionInfo];
  unint64_t v5 = [v4 sections];
  char v6 = [v5 objectAtIndex:a3];

  int v7 = [v6 title];

  return v7;
}

- (unint64_t)indexOfSectionForSectionTitleAtIndex:(unint64_t)a3
{
  int64_t v4 = [(MPUQueryDataSource *)self _sectionInfo];
  unint64_t v5 = [v4 indexOfSectionForSectionIndexTitleAtIndex:a3];

  return v5;
}

- (_NSRange)rangeOfSectionAtIndex:(unint64_t)a3
{
  if ([(MPUDataSource *)self usesSections])
  {
    unint64_t v5 = [(MPUQueryDataSource *)self _sectionInfo];
    char v6 = [v5 sections];
    int v7 = [v6 objectAtIndex:a3];

    uint64_t v8 = [v7 range];
    NSUInteger v10 = v9;

    NSUInteger v11 = v8;
    NSUInteger v12 = v10;
  }
  else
  {
    NSUInteger v12 = [(MPUQueryDataSource *)self count];
    NSUInteger v11 = 0;
  }
  result.length = v12;
  result.location = v11;
  return result;
}

- (BOOL)showsEntityCountFooter
{
  return 0;
}

- (void)addAdditionalMediaEntityPropertiesToFetch:(id)a3
{
  id v7 = a3;
  if ([v7 count])
  {
    additionalUniqueItemPropertiesToFetch = self->_additionalUniqueItemPropertiesToFetch;
    if (!additionalUniqueItemPropertiesToFetch)
    {
      unint64_t v5 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithCapacity:", objc_msgSend(v7, "count") + 2);
      char v6 = self->_additionalUniqueItemPropertiesToFetch;
      self->_additionalUniqueItemPropertiesToFetch = v5;

      [(NSMutableSet *)self->_additionalUniqueItemPropertiesToFetch addObject:*MEMORY[0x263F112E8]];
      [(NSMutableSet *)self->_additionalUniqueItemPropertiesToFetch addObject:*MEMORY[0x263F11308]];
      additionalUniqueItemPropertiesToFetch = self->_additionalUniqueItemPropertiesToFetch;
    }
    [(NSMutableSet *)additionalUniqueItemPropertiesToFetch unionSet:v7];
  }
}

- (void)removeAdditionalMediaEntityPropertiesToFetch:(id)a3
{
  id v5 = a3;
  if ([v5 count])
  {
    [(NSMutableSet *)self->_additionalUniqueItemPropertiesToFetch minusSet:v5];
    if (![(NSMutableSet *)self->_additionalUniqueItemPropertiesToFetch count])
    {
      additionalUniqueItemPropertiesToFetch = self->_additionalUniqueItemPropertiesToFetch;
      self->_additionalUniqueItemPropertiesToFetch = 0;
    }
  }
}

- (void)setIgnoringInvalidationDueToBackgroundApplicationState:(BOOL)a3
{
  if (self->_ignoringInvalidationDueToBackgroundApplicationState != a3)
  {
    self->_ignoringInvalidationDueToBackgroundApplicationState = a3;
    if (self->_invalidateWhenEnteringForeground && !a3) {
      [(MPUDataSource *)self invalidate];
    }
  }
}

- (void)_invalidateIfNeeded
{
  if ([(MPUQueryDataSource *)self ignoringInvalidationDueToBackgroundApplicationState])
  {
    self->_invalidateWhenEnteringForeground = 1;
  }
  else
  {
    [(MPUDataSource *)self invalidate];
  }
}

- (id)_representativeCollection
{
  if (!self->_hasValidRepresentativeCollection)
  {
    self->_hasValidRepresentativeCollection = 1;
    int64_t v3 = [(MPMediaQuery *)self->_query _representativeCollection];
    representativeCollection = self->_representativeCollection;
    self->_representativeCollection = v3;
  }
  id v5 = self->_representativeCollection;

  return v5;
}

- (void)_applicationWillEnterForeground:(id)a3
{
}

- (void)_applicationDidEnterBackground:(id)a3
{
}

- (void)_defaultMediaLibraryDidChangeNotification:(id)a3
{
  query = self->_query;
  id v5 = objc_msgSend(MEMORY[0x263F11E40], "defaultMediaLibrary", a3);
  [(MPMediaQuery *)query setMediaLibrary:v5];

  [(MPUQueryDataSource *)self _invalidateIfNeeded];
}

- (BOOL)_deleteHidesFromCloudForIndex:(unint64_t)a3 hidesAll:(BOOL *)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (a4) {
    *a4 = 0;
  }
  id v5 = [(MPUDataSource *)self entityAtIndex:a3];
  char v6 = [v5 mediaLibrary];
  id v7 = [MEMORY[0x263F11E40] deviceMediaLibrary];
  int v8 = [v6 isEqual:v7];

  if (!v8) {
    goto LABEL_22;
  }
  objc_opt_class();
  uint64_t isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    int v10 = __61__MPUQueryDataSource__deleteHidesFromCloudForIndex_hidesAll___block_invoke(isKindOfClass, v5);
    BOOL v11 = v10;
    if (a4 && v10)
    {
      BOOL v11 = 1;
      *a4 = 1;
    }
    goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_22:
    BOOL v11 = 0;
    goto LABEL_23;
  }
  id v12 = v5;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v13 = objc_msgSend(v12, "items", 0);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (!v14)
  {

LABEL_21:
    goto LABEL_22;
  }
  uint64_t v15 = v14;
  uint64_t v16 = 0;
  uint64_t v17 = *(void *)v22;
  do
  {
    uint64_t v18 = 0;
    do
    {
      if (*(void *)v22 != v17) {
        objc_enumerationMutation(v13);
      }
      uint64_t v14 = __61__MPUQueryDataSource__deleteHidesFromCloudForIndex_hidesAll___block_invoke(v14, *(void **)(*((void *)&v21 + 1) + 8 * v18));
      v16 += v14;
      ++v18;
    }
    while (v15 != v18);
    uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
    uint64_t v15 = v14;
  }
  while (v14);

  if (!v16) {
    goto LABEL_21;
  }
  if (a4)
  {
    v19 = [v12 items];
    *a4 = v16 == [v19 count];
  }
  BOOL v11 = 1;
LABEL_23:

  return v11;
}

uint64_t __61__MPUQueryDataSource__deleteHidesFromCloudForIndex_hidesAll___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 valueForProperty:*MEMORY[0x263F11398]];
  uint64_t v3 = [v2 longLongValue];

  if (!v3) {
    return 0;
  }
  int64_t v4 = [MEMORY[0x263F11D60] sharedCloudController];
  uint64_t v5 = [v4 hasPurchaseHistoryAccount];

  return v5;
}

- (void)_invalidateForDisplayValuesChangeIfNeeded
{
  if ([(MPUQueryDataSource *)self ignoringInvalidationDueToBackgroundApplicationState])
  {
    self->_invalidateWhenEnteringForeground = 1;
  }
  else
  {
    id v3 = objc_alloc_init((Class)[(id)objc_opt_class() invalidationContextClass]);
    [(MPUDataSource *)self invalidateWithContext:v3];
  }
}

- (id)_sectionInfo
{
  if (!self->_sectionInfo)
  {
    int64_t v3 = [(MPUDataSource *)self entityType];
    query = self->_query;
    if (v3) {
      [(MPMediaQuery *)query collectionSectionInfo];
    }
    else {
    uint64_t v5 = [(MPMediaQuery *)query itemSectionInfo];
    }
    sectionInfo = self->_sectionInfo;
    self->_sectionInfo = v5;
  }
  id v7 = self->_sectionInfo;

  return v7;
}

- (MPMediaQuery)query
{
  return self->_query;
}

- (BOOL)ignoringInvalidationDueToBackgroundApplicationState
{
  return self->_ignoringInvalidationDueToBackgroundApplicationState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_sectionInfo, 0);
  objc_storeStrong((id *)&self->_representativeCollection, 0);
  objc_storeStrong((id *)&self->_additionalUniqueItemPropertiesToFetch, 0);

  objc_storeStrong((id *)&self->_entities, 0);
}

@end