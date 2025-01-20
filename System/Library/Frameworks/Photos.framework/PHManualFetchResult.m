@interface PHManualFetchResult
+ (id)emptyFetchResultWithPhotoLibrary:(id)a3;
+ (id)emptyFetchResultWithPhotoLibrary:(id)a3 fetchType:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFullyBackedByObjectIDs;
- (NSArray)objects;
- (NSOrderedSet)objectIDs;
- (NSString)identifier;
- (PHManualFetchResult)fetchResultWithChangeHandlingValue:(id)a3;
- (PHManualFetchResult)initWithObjects:(id)a3 photoLibrary:(id)a4 fetchType:(id)a5 fetchPropertySets:(id)a6 identifier:(id)a7 registerIfNeeded:(BOOL)a8;
- (PHManualFetchResult)initWithOids:(id)a3 photoLibrary:(id)a4 fetchType:(id)a5 fetchPropertySets:(id)a6 identifier:(id)a7 registerIfNeeded:(BOOL)a8;
- (PHManualFetchResult)initWithOids:(id)a3 photoLibrary:(id)a4 fetchType:(id)a5 fetchPropertySets:(id)a6 identifier:(id)a7 registerIfNeeded:(BOOL)a8 batchSize:(unint64_t)a9;
- (PHManualFetchResult)initWithOids:(id)a3 photoLibrary:(id)a4 fetchType:(id)a5 fetchPropertySets:(id)a6 identifier:(id)a7 registerIfNeeded:(BOOL)a8 graphQuery:(id)a9 batchSize:(unint64_t)a10;
- (PHManualFetchResult)initWithOids:(id)a3 photoLibrary:(id)a4 fetchType:(id)a5 fetchPropertySets:(id)a6 identifier:(id)a7 registerIfNeeded:(BOOL)a8 graphQuery:(id)obj;
- (PHManualFetchResult)initWithOids:(id)a3 photoLibrary:(id)a4 fetchType:(id)a5 fetchPropertySets:(id)a6 identifier:(id)a7 registerIfNeeded:(BOOL)a8 photosCount:(unint64_t)a9 videosCount:(unint64_t)a10 audiosCount:(unint64_t)a11;
- (PHManualFetchResult)initWithOids:(id)a3 photoLibrary:(id)a4 fetchType:(id)a5 fetchPropertySets:(id)a6 identifier:(id)a7 registerIfNeeded:(BOOL)a8 photosCount:(unint64_t)a9 videosCount:(unint64_t)a10 audiosCount:(unint64_t)a11 batchSize:(unint64_t)a12;
- (id)calculateMediaTypeCounts;
- (id)changeHandlingKey;
- (id)changeHandlingValueUsingSeedOids:(id)a3 withChange:(id)a4 usingManagedObjectContext:(id)a5;
- (id)containerIdentifier;
- (id)copyWithOptions:(id)a3;
- (id)description;
- (id)fetchRequest;
- (id)fetchSortDescriptors;
- (id)fetchUpdatedObjects;
- (id)fetchedObjectIDs;
- (id)fetchedObjectIDsSet;
- (id)objectIDAtIndex:(unint64_t)a3;
- (id)photoLibrary;
- (int64_t)collectionFetchType;
- (unint64_t)hash;
- (unint64_t)possibleChangesForChange:(id)a3 propertiesFetchResult:(id)a4;
- (void)prefetchObjectsAtIndexes:(id)a3;
- (void)updateRegistrationForChangeNotificationDeltas;
@end

@implementation PHManualFetchResult

- (NSArray)objects
{
  return (NSArray *)objc_getProperty(self, a2, 176, 1);
}

- (void)prefetchObjectsAtIndexes:(id)a3
{
  id v5 = a3;
  v4 = [(PHManualFetchResult *)self objects];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 prefetchObjectsAtIndexes:v5];
  }
}

- (PHManualFetchResult)initWithOids:(id)a3 photoLibrary:(id)a4 fetchType:(id)a5 fetchPropertySets:(id)a6 identifier:(id)a7 registerIfNeeded:(BOOL)a8
{
  return [(PHManualFetchResult *)self initWithOids:a3 photoLibrary:a4 fetchType:a5 fetchPropertySets:a6 identifier:a7 registerIfNeeded:a8 photosCount:0x7FFFFFFFFFFFFFFFLL videosCount:0x7FFFFFFFFFFFFFFFLL audiosCount:0x7FFFFFFFFFFFFFFFLL batchSize:0];
}

- (PHManualFetchResult)initWithOids:(id)a3 photoLibrary:(id)a4 fetchType:(id)a5 fetchPropertySets:(id)a6 identifier:(id)a7 registerIfNeeded:(BOOL)a8 photosCount:(unint64_t)a9 videosCount:(unint64_t)a10 audiosCount:(unint64_t)a11 batchSize:(unint64_t)a12
{
  BOOL v38 = a8;
  id v40 = a3;
  id v39 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  v20 = +[PHFetchResultMediaTypeCounts mediaTypeCountsWithPhotosCount:a9 videosCount:a10 audiosCount:a11];
  v41.receiver = self;
  v41.super_class = (Class)PHManualFetchResult;
  v21 = [(PHFetchResult *)&v41 initWithMediaTypeCounts:v20];
  if (v21)
  {
    uint64_t v22 = [v17 copy];
    fetchType = v21->super._fetchType;
    v21->super._fetchType = (NSString *)v22;

    uint64_t v24 = [v18 copy];
    fetchPropertySets = v21->super._fetchPropertySets;
    v21->super._fetchPropertySets = (NSSet *)v24;

    objc_storeStrong((id *)&v21->_photoLibrary, a4);
    if (v21->super._fetchType && [(NSSet *)v21->super._fetchPropertySets count]) {
      uint64_t v26 = [(objc_class *)+[PHPhotoLibrary classForFetchType:v21->super._fetchType] propertyFetchHintsForPropertySets:v21->super._fetchPropertySets];
    }
    else {
      uint64_t v26 = 2;
    }
    v27 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", v17);
    v28 = [NSNumber numberWithUnsignedInteger:v26];
    [v27 setObject:v28 forKeyedSubscript:@"propertyHint"];

    v29 = [NSNumber numberWithUnsignedInteger:a12];
    [v27 setObject:v29 forKeyedSubscript:@"batchSize"];

    graphQuery = v21->_graphQuery;
    if (graphQuery)
    {
      v31 = [(PHGraphQuery *)graphQuery extraBatchFetchingArrayOptions];
      [v27 addEntriesFromDictionary:v31];
    }
    v32 = v40;
    v33 = [[PHBatchFetchingArray alloc] initWithOIDs:v40 options:v27 photoLibrary:v21->_photoLibrary];
    objects = v21->_objects;
    v21->_objects = &v33->super;

    if (!v19)
    {
      v35 = [MEMORY[0x1E4F29128] UUID];
      id v19 = [v35 UUIDString];
    }
    objc_storeStrong((id *)&v21->_identifier, v19);
    id v17 = v37;
    if (v38) {
      [(PHFetchResult *)v21 setRegisteredForChangeNotificationDeltas:1];
    }
  }
  else
  {
    v32 = v40;
  }

  return v21;
}

- (PHManualFetchResult)initWithObjects:(id)a3 photoLibrary:(id)a4 fetchType:(id)a5 fetchPropertySets:(id)a6 identifier:(id)a7 registerIfNeeded:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v64.receiver = self;
  v64.super_class = (Class)PHManualFetchResult;
  id v19 = [(PHFetchResult *)&v64 init];
  if (!v19) {
    goto LABEL_31;
  }
  BOOL v57 = v8;
  uint64_t v20 = [v14 copy];
  objects = v19->_objects;
  v19->_objects = (NSArray *)v20;

  uint64_t v22 = [v16 copy];
  fetchType = v19->super._fetchType;
  v19->super._fetchType = (NSString *)v22;

  uint64_t v24 = [v17 copy];
  fetchPropertySets = v19->super._fetchPropertySets;
  v19->super._fetchPropertySets = (NSSet *)v24;

  id v58 = v15;
  id v26 = v15;
  v27 = v26;
  if (!v26)
  {
    v28 = [v14 firstObject];
    v27 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:0 object:v28];
  }
  v56 = v27;
  objc_storeStrong((id *)&v19->_photoLibrary, v27);
  v29 = [v14 firstObject];
  v30 = v29;
  id v55 = v16;
  id v59 = v17;
  if (v29)
  {
    uint64_t v31 = [v29 photoLibrary];
    if ((id)v31 != v26)
    {
      v32 = (void *)v31;
      v33 = [v30 photoLibrary];
      v34 = [v33 description];
      if ([v34 containsString:@"Mock"])
      {
        v53 = [v30 photoLibrary];
        v51 = [v53 photoLibraryURL];
        v35 = [v51 path];
        v36 = [v26 photoLibraryURL];
        [v36 path];
        v52 = v33;
        BOOL v38 = v37 = v14;
        uint64_t v50 = [v35 compare:v38];

        id v14 = v37;
        id v16 = v55;

        id v17 = v59;
        if (!v50) {
          goto LABEL_13;
        }
      }
      else
      {

        id v17 = v59;
      }
      id v26 = [MEMORY[0x1E4F28B00] currentHandler];
      [v26 handleFailureInMethod:a2, v19, @"PHManualFetchResult.m", 37, @"Invalid parameter not satisfying: %@", @"firstObject == nil || firstObject.photoLibrary == photoLibrary || ([firstObject.photoLibrary.description containsString:@\"Mock\"] && [firstObject.photoLibrary.photoLibraryURL.path compare:photoLibrary.photoLibraryURL.path] == NSOrderedSame)" object file lineNumber description];
    }
  }
LABEL_13:
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [(NSArray *)v19->_objects isFullyBackedByObjectIDs])
  {
    uint64_t v39 = [(NSArray *)v19->_objects objectIDs];
    objectIDs = v19->_objectIDs;
    v19->_objectIDs = (NSOrderedSet *)v39;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F1CA70], "orderedSetWithCapacity:", -[NSArray count](v19->_objects, "count"));
    objc_super v41 = (NSOrderedSet *)objc_claimAutoreleasedReturnValue();
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    v42 = v19->_objects;
    uint64_t v43 = [(NSArray *)v42 countByEnumeratingWithState:&v60 objects:v65 count:16];
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v61;
      do
      {
        for (uint64_t i = 0; i != v44; ++i)
        {
          if (*(void *)v61 != v45) {
            objc_enumerationMutation(v42);
          }
          v47 = [*(id *)(*((void *)&v60 + 1) + 8 * i) objectID];
          if (v47) {
            [(NSOrderedSet *)v41 addObject:v47];
          }
        }
        uint64_t v44 = [(NSArray *)v42 countByEnumeratingWithState:&v60 objects:v65 count:16];
      }
      while (v44);
    }

    objectIDs = v19->_objectIDs;
    v19->_objectIDs = v41;
    id v16 = v55;
    id v17 = v59;
  }

  if (!v18)
  {
    v48 = [MEMORY[0x1E4F29128] UUID];
    id v18 = [v48 UUIDString];
  }
  objc_storeStrong((id *)&v19->_identifier, v18);
  if (v57) {
    [(PHFetchResult *)v19 setRegisteredForChangeNotificationDeltas:1];
  }

  id v15 = v58;
LABEL_31:

  return v19;
}

- (id)fetchSortDescriptors
{
  return 0;
}

- (id)photoLibrary
{
  return self->_photoLibrary;
}

- (PHManualFetchResult)initWithOids:(id)a3 photoLibrary:(id)a4 fetchType:(id)a5 fetchPropertySets:(id)a6 identifier:(id)a7 registerIfNeeded:(BOOL)a8 graphQuery:(id)obj
{
  BOOL v9 = a8;
  objc_storeStrong((id *)&self->_graphQuery, obj);
  id v16 = a7;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  v21 = [(PHManualFetchResult *)self initWithOids:v20 photoLibrary:v19 fetchType:v18 fetchPropertySets:v17 identifier:v16 registerIfNeeded:v9 batchSize:0];

  return v21;
}

- (PHManualFetchResult)initWithOids:(id)a3 photoLibrary:(id)a4 fetchType:(id)a5 fetchPropertySets:(id)a6 identifier:(id)a7 registerIfNeeded:(BOOL)a8 graphQuery:(id)a9 batchSize:(unint64_t)a10
{
  BOOL v10 = a8;
  objc_storeStrong((id *)&self->_graphQuery, a9);
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  uint64_t v22 = [(PHManualFetchResult *)self initWithOids:v21 photoLibrary:v20 fetchType:v19 fetchPropertySets:v18 identifier:v17 registerIfNeeded:v10 batchSize:a10];

  return v22;
}

- (PHManualFetchResult)initWithOids:(id)a3 photoLibrary:(id)a4 fetchType:(id)a5 fetchPropertySets:(id)a6 identifier:(id)a7 registerIfNeeded:(BOOL)a8 batchSize:(unint64_t)a9
{
  return [(PHManualFetchResult *)self initWithOids:a3 photoLibrary:a4 fetchType:a5 fetchPropertySets:a6 identifier:a7 registerIfNeeded:a8 photosCount:0x7FFFFFFFFFFFFFFFLL videosCount:0x7FFFFFFFFFFFFFFFLL audiosCount:0x7FFFFFFFFFFFFFFFLL batchSize:a9];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_graphQuery, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);

  objc_storeStrong((id *)&self->_objectIDs, 0);
}

- (PHManualFetchResult)initWithOids:(id)a3 photoLibrary:(id)a4 fetchType:(id)a5 fetchPropertySets:(id)a6 identifier:(id)a7 registerIfNeeded:(BOOL)a8 photosCount:(unint64_t)a9 videosCount:(unint64_t)a10 audiosCount:(unint64_t)a11
{
  return [(PHManualFetchResult *)self initWithOids:a3 photoLibrary:a4 fetchType:a5 fetchPropertySets:a6 identifier:a7 registerIfNeeded:a8 photosCount:a9 videosCount:a10 audiosCount:a11 batchSize:0];
}

- (unint64_t)hash
{
  v3 = [(PHManualFetchResult *)self identifier];
  v4 = v3;
  if (v3)
  {
    id v5 = (id)[v3 hash];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PHManualFetchResult;
    id v5 = [(PHManualFetchResult *)&v8 hash];
  }
  unint64_t v6 = (unint64_t)v5;

  return v6;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)PHManualFetchResult;
  v2 = [(PHFetchResult *)&v4 description];

  return v2;
}

- (PHManualFetchResult)fetchResultWithChangeHandlingValue:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v33 = v4;
  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    id v5 = [(PHManualFetchResult *)self fetchUpdatedObjects];
  }
  unint64_t v6 = v5;
  v7 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v39 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        id v14 = [v13 objectID];
        [v7 setObject:v13 forKeyedSubscript:v14];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v10);
  }

  id v15 = (void *)MEMORY[0x1E4F1CA48];
  id v16 = [(PHManualFetchResult *)self objects];
  id v17 = objc_msgSend(v15, "arrayWithCapacity:", objc_msgSend(v16, "count"));

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v18 = [(PHManualFetchResult *)self objects];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v35 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = *(void **)(*((void *)&v34 + 1) + 8 * j);
        if ([v23 isTransient])
        {
          [v17 addObject:v23];
        }
        else
        {
          uint64_t v24 = [v23 objectID];
          v25 = [v7 objectForKeyedSubscript:v24];

          if (v25) {
            [v17 addObject:v25];
          }
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v20);
  }

  id v26 = [PHManualFetchResult alloc];
  v27 = [(PHManualFetchResult *)self photoLibrary];
  v28 = [(PHFetchResult *)self fetchType];
  v29 = [(PHFetchResult *)self fetchPropertySets];
  v30 = [(PHManualFetchResult *)self identifier];
  uint64_t v31 = [(PHManualFetchResult *)v26 initWithObjects:v17 photoLibrary:v27 fetchType:v28 fetchPropertySets:v29 identifier:v30 registerIfNeeded:0];

  return v31;
}

- (id)fetchUpdatedObjects
{
  v3 = [(PHFetchResult *)self fetchPropertySets];
  id v4 = [(PHFetchResult *)self fetchType];
  id v5 = +[PHPhotoLibrary classForFetchType:v4];

  uint64_t v6 = 2;
  if ([v3 count] && v5)
  {
    v7 = [(PHFetchResult *)self fetchPropertySets];
    uint64_t v6 = [(objc_class *)v5 propertyFetchHintsForPropertySets:v7];
  }
  id v8 = [(PHManualFetchResult *)self photoLibrary];
  uint64_t v9 = [(PHManualFetchResult *)self objectIDs];
  uint64_t v10 = [v9 array];
  uint64_t v11 = [v8 fetchPHObjectsForOIDs:v10 propertyHint:v6 includeTrash:0 overrideResultsWithClass:0];

  return v11;
}

- (unint64_t)possibleChangesForChange:(id)a3 propertiesFetchResult:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  graphQuery = self->_graphQuery;
  if (graphQuery)
  {
    unint64_t v9 = [(PHGraphQuery *)graphQuery possibleChangesForChange:v6];
    if (v9 == 15) {
      goto LABEL_26;
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v10 = [v6 deletedObjectIDs];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v30;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        id v16 = [(PHManualFetchResult *)self objectIDs];
        LODWORD(v15) = [v16 containsObject:v15];

        if (v15)
        {
          v9 |= 2uLL;
          goto LABEL_15;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v17 = objc_msgSend(v6, "updatedObjectIDs", 0);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v26;
    while (2)
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v25 + 1) + 8 * j);
        v23 = [(PHManualFetchResult *)self objectIDs];
        LODWORD(v22) = [v23 containsObject:v22];

        if (v22)
        {
          v9 |= 8uLL;
          goto LABEL_25;
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v19) {
        continue;
      }
      break;
    }
  }
LABEL_25:

LABEL_26:
  return v9;
}

- (void)updateRegistrationForChangeNotificationDeltas
{
}

- (id)objectIDAtIndex:(unint64_t)a3
{
  id v4 = [(PHManualFetchResult *)self objects];
  id v5 = [v4 objectAtIndex:a3];
  id v6 = [v5 objectID];

  return v6;
}

- (id)fetchedObjectIDsSet
{
  v3 = [(PHManualFetchResult *)self objects];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [(PHManualFetchResult *)self objects];
    id v6 = [v5 oidsSet];
  }
  else if ([(PHManualFetchResult *)self isFullyBackedByObjectIDs])
  {
    id v6 = [(NSOrderedSet *)self->_objectIDs set];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)fetchedObjectIDs
{
  v3 = [(PHManualFetchResult *)self objects];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [(PHManualFetchResult *)self objects];
    id v6 = [v5 oids];
  }
  else if ([(PHManualFetchResult *)self isFullyBackedByObjectIDs])
  {
    id v6 = [(NSOrderedSet *)self->_objectIDs array];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)containerIdentifier
{
  return 0;
}

- (int64_t)collectionFetchType
{
  return 1;
}

- (id)fetchRequest
{
  return 0;
}

- (id)changeHandlingValueUsingSeedOids:(id)a3 withChange:(id)a4 usingManagedObjectContext:(id)a5
{
  if (self->_graphQuery)
  {
    id v5 = [(PHGraphQuery *)self->_graphQuery updatedQueryWithChange:a4];
    id v6 = [v5 executeQuery];
  }
  else
  {
    id v6 = -[PHManualFetchResult fetchResultWithChangeHandlingValue:](self, "fetchResultWithChangeHandlingValue:", 0, a4, a5);
  }

  return v6;
}

- (id)changeHandlingKey
{
  return self->_identifier;
}

- (BOOL)isFullyBackedByObjectIDs
{
  NSUInteger v3 = [(NSArray *)self->_objects count];
  id v4 = [(PHManualFetchResult *)self objectIDs];
  LOBYTE(v3) = v3 == [v4 count];

  return v3;
}

- (id)copyWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = [(PHManualFetchResult *)self objects];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;
  id v8 = [v4 objectForKeyedSubscript:@"invalidateCache"];

  if (v7 && [v8 BOOLValue])
  {
    unint64_t v9 = [v7 oids];
    BOOL v10 = [(PHFetchResult *)self isRegisteredForChangeNotificationDeltas];
    uint64_t v11 = [PHManualFetchResult alloc];
    uint64_t v12 = [(PHManualFetchResult *)self photoLibrary];
    uint64_t v13 = [(PHManualFetchResult *)v11 initWithOids:v9 photoLibrary:v12 fetchType:self->super._fetchType fetchPropertySets:self->super._fetchPropertySets identifier:0 registerIfNeeded:v10 batchSize:0];

    objc_storeStrong(v13 + 21, self->_graphQuery);
  }
  else
  {
    uint64_t v13 = (id *)[(PHManualFetchResult *)self copy];
  }

  return v13;
}

- (id)calculateMediaTypeCounts
{
  if ([(NSArray *)self->_objects count])
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    do
    {
      id v7 = (void *)MEMORY[0x19F389B10]();
      objc_opt_class();
      id v8 = [(NSArray *)self->_objects objectAtIndexedSubscript:v6];
      if (objc_opt_isKindOfClass()) {
        unint64_t v9 = v8;
      }
      else {
        unint64_t v9 = 0;
      }
      id v10 = v9;

      if (v10)
      {
        uint64_t v11 = [v10 mediaType];
        switch(v11)
        {
          case 3:
            ++v5;
            break;
          case 2:
            ++v4;
            break;
          case 1:
            ++v3;
            break;
        }
      }

      ++v6;
    }
    while (v6 < [(NSArray *)self->_objects count]);
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v4 = 0;
    uint64_t v3 = 0;
  }
  uint64_t v12 = [[PHFetchResultMediaTypeCounts alloc] initWithPhotosCount:v3 videosCount:v4 audiosCount:v5];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHManualFetchResult;
  if ([(PHManualFetchResult *)&v9 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    unint64_t v6 = [(PHManualFetchResult *)self identifier];
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v7 = [v4 identifier];
      char v5 = [v6 isEqualToString:v7];
    }
    else
    {
      char v5 = 0;
    }
  }
  return v5;
}

- (NSOrderedSet)objectIDs
{
  objectIDs = self->_objectIDs;
  if (!objectIDs)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2, self, @"PHManualFetchResult.m", 132, @"Invalid parameter not satisfying: %@", @"[_objects isKindOfClass:[PHBatchFetchingArray class]]" object file lineNumber description];
    }
    char v5 = self->_objects;
    unint64_t v6 = [(NSArray *)v5 oids];
    id v7 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v6];
    id v8 = self->_objectIDs;
    self->_objectIDs = v7;

    objectIDs = self->_objectIDs;
  }

  return objectIDs;
}

+ (id)emptyFetchResultWithPhotoLibrary:(id)a3 fetchType:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)a1);
  objc_super v9 = (void *)[v8 initWithObjects:MEMORY[0x1E4F1CBF0] photoLibrary:v7 fetchType:v6 fetchPropertySets:0 identifier:0 registerIfNeeded:0];

  return v9;
}

+ (id)emptyFetchResultWithPhotoLibrary:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  id v6 = (void *)[v5 initWithObjects:MEMORY[0x1E4F1CBF0] photoLibrary:v4 fetchType:0 fetchPropertySets:0 identifier:0 registerIfNeeded:0];

  return v6;
}

@end