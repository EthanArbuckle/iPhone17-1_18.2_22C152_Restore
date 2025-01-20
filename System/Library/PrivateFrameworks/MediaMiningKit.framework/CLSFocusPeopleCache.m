@interface CLSFocusPeopleCache
+ (id)_personSortDescriptors;
- (CLSFocusPeopleCache)initWithPhotoLibrary:(id)a3 maximumNumberOfPeople:(unint64_t)a4;
- (NSSet)personLocalIdentifiers;
- (PHPhotoLibrary)photoLibrary;
- (id)_collectValidPersonLocalIdentifiers;
- (unint64_t)maximumNumberOfPeople;
- (void)invalidate;
- (void)setMaximumNumberOfPeople:(unint64_t)a3;
- (void)setPhotoLibrary:(id)a3;
@end

@implementation CLSFocusPeopleCache

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_photoLibrary);
  objc_storeStrong((id *)&self->_personLocalIdentifiers, 0);
}

- (void)setPhotoLibrary:(id)a3
{
}

- (PHPhotoLibrary)photoLibrary
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  return (PHPhotoLibrary *)WeakRetained;
}

- (void)setMaximumNumberOfPeople:(unint64_t)a3
{
  self->_maximumNumberOfPeople = a3;
}

- (unint64_t)maximumNumberOfPeople
{
  return self->_maximumNumberOfPeople;
}

- (NSSet)personLocalIdentifiers
{
  return self->_personLocalIdentifiers;
}

- (id)_collectValidPersonLocalIdentifiers
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  unint64_t maximumNumberOfPeople = self->_maximumNumberOfPeople;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  v4 = [WeakRetained librarySpecificFetchOptions];

  [v4 setPersonContext:1];
  v5 = [MEMORY[0x1E4F391F0] fetchPersonsWithOptions:v4];
  v6 = v5;
  if (maximumNumberOfPeople && [v5 count] > maximumNumberOfPeople)
  {
    v7 = [v6 fetchedObjects];
    v8 = [(id)objc_opt_class() _personSortDescriptors];
    v9 = [v7 sortedArrayUsingDescriptors:v8];

    objc_msgSend(v9, "subarrayWithRange:", 0, maximumNumberOfPeople);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unint64_t maximumNumberOfPeople = [v6 count];
    id v10 = v6;
  }
  v11 = [MEMORY[0x1E4F1CA80] setWithCapacity:maximumNumberOfPeople];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "localIdentifier", (void)v19);
        if (v17) {
          [v11 addObject:v17];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  return v11;
}

- (void)invalidate
{
  obj = self;
  objc_sync_enter(obj);
  personLocalIdentifiers = obj->_personLocalIdentifiers;
  obj->_personLocalIdentifiers = 0;

  objc_sync_exit(obj);
}

- (CLSFocusPeopleCache)initWithPhotoLibrary:(id)a3 maximumNumberOfPeople:(unint64_t)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CLSFocusPeopleCache;
  v7 = [(CLSFocusPeopleCache *)&v12 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_photoLibrary, v6);
    v8->_unint64_t maximumNumberOfPeople = a4;
    uint64_t v9 = [(CLSFocusPeopleCache *)v8 _collectValidPersonLocalIdentifiers];
    personLocalIdentifiers = v8->_personLocalIdentifiers;
    v8->_personLocalIdentifiers = (NSSet *)v9;
  }
  return v8;
}

+ (id)_personSortDescriptors
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"faceCount" ascending:0];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"localIdentifier" ascending:0];
  v6[1] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

@end