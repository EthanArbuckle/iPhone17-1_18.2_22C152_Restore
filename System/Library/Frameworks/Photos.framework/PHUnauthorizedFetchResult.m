@interface PHUnauthorizedFetchResult
- (BOOL)isEqual:(id)a3;
- (BOOL)isFullyBackedByObjectIDs;
- (NSArray)objects;
- (NSOrderedSet)objectIDs;
- (NSString)identifier;
- (PHFetchOptions)options;
- (PHUnauthorizedFetchResult)fetchResultWithChangeHandlingValue:(id)a3;
- (PHUnauthorizedFetchResult)initWithOptions:(id)a3 status:(int64_t)a4 fetchBlock:(id)a5;
- (id)calculateMediaTypeCounts;
- (id)changeHandlingKey;
- (id)changeHandlingValueUsingSeedOids:(id)a3 withChange:(id)a4 usingManagedObjectContext:(id)a5;
- (id)containerIdentifier;
- (id)description;
- (id)fetchBlock;
- (id)fetchRequest;
- (id)fetchSortDescriptors;
- (id)fetchedObjectIDs;
- (id)objectIDAtIndex:(unint64_t)a3;
- (id)photoLibrary;
- (int64_t)collectionFetchType;
- (unint64_t)hash;
- (unint64_t)possibleChangesForChange:(id)a3 propertiesFetchResult:(id)a4;
- (void)updateRegistrationForChangeNotificationDeltas;
@end

@implementation PHUnauthorizedFetchResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_objectIDs, 0);
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_options, 0);

  objc_storeStrong(&self->_fetchBlock, 0);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
}

- (NSOrderedSet)objectIDs
{
  return (NSOrderedSet *)objc_getProperty(self, a2, 176, 1);
}

- (NSArray)objects
{
  return (NSArray *)objc_getProperty(self, a2, 168, 1);
}

- (PHFetchOptions)options
{
  return (PHFetchOptions *)objc_getProperty(self, a2, 160, 1);
}

- (id)fetchBlock
{
  return objc_getProperty(self, a2, 152, 1);
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)PHUnauthorizedFetchResult;
  v2 = [(PHFetchResult *)&v4 description];

  return v2;
}

- (PHUnauthorizedFetchResult)fetchResultWithChangeHandlingValue:(id)a3
{
  if (+[PHPhotoLibrary checkAuthorizationStatusForAPIAccessLevel:2]&& (fetchBlock = (void (**)(id, PHFetchOptions *))self->_fetchBlock) != 0)
  {
    fetchBlock[2](fetchBlock, self->_options);
    v5 = (PHUnauthorizedFetchResult *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = self;
  }

  return v5;
}

- (unint64_t)possibleChangesForChange:(id)a3 propertiesFetchResult:(id)a4
{
  return 15;
}

- (void)updateRegistrationForChangeNotificationDeltas
{
}

- (id)objectIDAtIndex:(unint64_t)a3
{
  return 0;
}

- (id)fetchedObjectIDs
{
  return 0;
}

- (id)containerIdentifier
{
  return 0;
}

- (int64_t)collectionFetchType
{
  return 1;
}

- (id)fetchSortDescriptors
{
  return 0;
}

- (id)fetchRequest
{
  return 0;
}

- (id)photoLibrary
{
  return +[PHFetchOptions effectivePhotoLibraryForFetchOptions:self->_options object:0];
}

- (id)changeHandlingValueUsingSeedOids:(id)a3 withChange:(id)a4 usingManagedObjectContext:(id)a5
{
  return -[PHUnauthorizedFetchResult fetchResultWithChangeHandlingValue:](self, "fetchResultWithChangeHandlingValue:", 0, a4, a5);
}

- (id)changeHandlingKey
{
  return self->_identifier;
}

- (BOOL)isFullyBackedByObjectIDs
{
  return 0;
}

- (id)calculateMediaTypeCounts
{
  v2 = [[PHFetchResultMediaTypeCounts alloc] initWithPhotosCount:0 videosCount:0 audiosCount:0];

  return v2;
}

- (unint64_t)hash
{
  v3 = [(PHUnauthorizedFetchResult *)self identifier];
  objc_super v4 = v3;
  if (v3)
  {
    id v5 = (id)[v3 hash];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PHUnauthorizedFetchResult;
    id v5 = [(PHUnauthorizedFetchResult *)&v8 hash];
  }
  unint64_t v6 = (unint64_t)v5;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHUnauthorizedFetchResult;
  if ([(PHUnauthorizedFetchResult *)&v9 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    unint64_t v6 = [(PHUnauthorizedFetchResult *)self identifier];
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v7 = [v4 identifier];
      char v5 = [v6 isEqualToString:v7];
    }
    else
    {
      char v5 = 0;
    }
  }
  return v5;
}

- (PHUnauthorizedFetchResult)initWithOptions:(id)a3 status:(int64_t)a4 fetchBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v32.receiver = self;
  v32.super_class = (Class)PHUnauthorizedFetchResult;
  v10 = [(PHFetchResult *)&v32 init];
  if (v10)
  {
    uint64_t v11 = [MEMORY[0x1E4F1C978] array];
    objects = v10->_objects;
    v10->_objects = (NSArray *)v11;

    uint64_t v13 = [MEMORY[0x1E4F1CAA0] orderedSet];
    objectIDs = v10->_objectIDs;
    v10->_objectIDs = (NSOrderedSet *)v13;

    v15 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v16 = [v15 UUIDString];
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v16;

    uint64_t v18 = [v8 copy];
    options = v10->_options;
    v10->_options = (PHFetchOptions *)v18;

    switch(a4)
    {
      case 0:
        v20 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v21 = 5102;
        goto LABEL_6;
      case 1:
        v25 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v26 = 3310;
        goto LABEL_9;
      case 2:
        v25 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v26 = 3311;
LABEL_9:
        uint64_t v27 = [v25 errorWithDomain:@"PHPhotosErrorDomain" code:v26 userInfo:0];
        int v22 = 0;
        fetchError = v10->super._fetchError;
        v10->super._fetchError = (NSError *)v27;
        goto LABEL_10;
      case 3:
      case 4:
        v20 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v21 = -1;
LABEL_6:
        uint64_t v23 = [v20 errorWithDomain:@"PHPhotosErrorDomain" code:v21 userInfo:0];
        fetchError = v10->super._fetchError;
        v10->super._fetchError = (NSError *)v23;
        int v22 = 1;
LABEL_10:

        break;
      default:
        int v22 = 0;
        break;
    }
    v28 = v10->_options;
    if (!v28 || [(PHFetchOptions *)v28 wantsIncrementalChangeDetails])
    {
      uint64_t v29 = [v9 copy];
      id fetchBlock = v10->_fetchBlock;
      v10->_id fetchBlock = (id)v29;

      if (v22) {
        [(PHFetchResult *)v10 setRegisteredForChangeNotificationDeltas:1];
      }
    }
  }

  return v10;
}

@end