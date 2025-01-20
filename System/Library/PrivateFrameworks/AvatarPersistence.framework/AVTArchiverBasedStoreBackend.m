@interface AVTArchiverBasedStoreBackend
+ (id)classifyRecordsByIdentifiers:(id)a3;
+ (id)rootByRemovingAvatarWithIdentifier:(id)a3 fromRoot:(id)a4;
+ (id)rootBySavingAvatarRecord:(id)a3 afterAvatarRecord:(id)a4 forDomainIdentifier:(id)a5 toRoot:(id)a6;
+ (id)storeLocationForDomainIdentifier:(id)a3 environment:(id)a4;
- (AVTArchiverBasedStoreBackend)initWithStoreLocation:(id)a3 domainIdentifier:(id)a4 environment:(id)a5;
- (AVTArchiverBasedStoreRoot)model;
- (AVTAvatarRecordChangeTracker)recordChangeTracker;
- (AVTCoreEnvironment)environment;
- (AVTStoreBackendDelegate)backendDelegate;
- (BOOL)canCreateAvatarWithError:(id *)a3;
- (BOOL)deleteAvatarWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)loadContentFromDisk:(id *)a3;
- (BOOL)loadContentFromDiskIfNeeded:(id *)a3;
- (BOOL)saveAvatar:(id)a3 error:(id *)a4;
- (BOOL)saveAvatars:(id)a3 error:(id *)a4;
- (BOOL)saveModel:(id)a3 logger:(id)a4 error:(id *)a5;
- (NSArray)sortedAvatars;
- (NSDictionary)avatarsByIdentifiers;
- (NSString)domainIdentifier;
- (NSURL)storeLocation;
- (id)allAvatars;
- (id)avatarsExcludingIdentifiers:(id)a3 error:(id *)a4;
- (id)avatarsForFetchRequest:(id)a3 error:(id *)a4;
- (id)avatarsWithIdentifiers:(id)a3 error:(id *)a4;
- (id)duplicateAvatarRecord:(id)a3 error:(id *)a4;
- (unint64_t)avatarCountWithError:(id *)a3;
- (void)loadModel:(id)a3;
- (void)setAvatarsByIdentifiers:(id)a3;
- (void)setModel:(id)a3;
- (void)setSortedAvatars:(id)a3;
@end

@implementation AVTArchiverBasedStoreBackend

+ (id)storeLocationForDomainIdentifier:(id)a3 environment:(id)a4
{
  return (id)objc_msgSend(a4, "storeLocation", a3);
}

- (AVTArchiverBasedStoreBackend)initWithStoreLocation:(id)a3 domainIdentifier:(id)a4 environment:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AVTArchiverBasedStoreBackend;
  v12 = [(AVTArchiverBasedStoreBackend *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_storeLocation, a3);
    objc_storeStrong((id *)&v13->_domainIdentifier, a4);
    objc_storeStrong((id *)&v13->_environment, a5);
  }

  return v13;
}

- (BOOL)loadContentFromDiskIfNeeded:(id *)a3
{
  v5 = [(AVTArchiverBasedStoreBackend *)self model];

  if (v5) {
    return 1;
  }

  return [(AVTArchiverBasedStoreBackend *)self loadContentFromDisk:a3];
}

- (BOOL)loadContentFromDisk:(id *)a3
{
  v5 = [(AVTArchiverBasedStoreBackend *)self environment];
  v6 = [v5 logger];

  v7 = [(AVTArchiverBasedStoreBackend *)self storeLocation];
  v8 = +[AVTArchiverBasedStorePersistence readContentFromDiskAtLocation:v7 logger:v6 error:a3];

  if (v8) {
    [(AVTArchiverBasedStoreBackend *)self loadModel:v8];
  }

  return v8 != 0;
}

- (void)loadModel:(id)a3
{
  id v4 = a3;
  id v6 = [v4 records];
  v5 = [(id)objc_opt_class() classifyRecordsByIdentifiers:v6];
  [(AVTArchiverBasedStoreBackend *)self setModel:v4];

  [(AVTArchiverBasedStoreBackend *)self setSortedAvatars:v6];
  [(AVTArchiverBasedStoreBackend *)self setAvatarsByIdentifiers:v5];
}

- (id)avatarsForFetchRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(AVTArchiverBasedStoreBackend *)self loadContentFromDiskIfNeeded:a4])
  {
    uint64_t v7 = [v6 criteria];
    v8 = (void *)MEMORY[0x263EFFA68];
    switch(v7)
    {
      case 0:
      case 4:
        v8 = [(AVTArchiverBasedStoreBackend *)self allAvatars];
        break;
      case 1:
      case 2:
        id v9 = [v6 identifiers];
        uint64_t v10 = [(AVTArchiverBasedStoreBackend *)self avatarsWithIdentifiers:v9 error:a4];
        goto LABEL_9;
      case 3:
      case 7:
        break;
      case 6:
        id v9 = [v6 excludingIdentifiers];
        uint64_t v10 = [(AVTArchiverBasedStoreBackend *)self avatarsExcludingIdentifiers:v9 error:a4];
LABEL_9:
        v8 = (void *)v10;

        break;
      default:
        if (!a4) {
          goto LABEL_7;
        }
        +[AVTError errorWithCode:999 userInfo:0];
        v8 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        break;
    }
  }
  else
  {
LABEL_7:
    v8 = 0;
  }

  return v8;
}

- (id)allAvatars
{
  v2 = [(AVTArchiverBasedStoreBackend *)self sortedAvatars];
  v3 = (void *)[v2 copy];

  return v3;
}

- (id)avatarsWithIdentifiers:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v19 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v18 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        id v11 = [(AVTArchiverBasedStoreBackend *)self sortedAvatars];
        v12 = +[AVTAvatarRecord matchingIdentifierTest:v10];
        uint64_t v13 = [v11 indexOfObjectPassingTest:v12];

        if (v13 == 0x7FFFFFFFFFFFFFFFLL)
        {
          [v18 addObject:v10];
        }
        else
        {
          v14 = [(AVTArchiverBasedStoreBackend *)self sortedAvatars];
          objc_super v15 = [v14 objectAtIndexedSubscript:v13];
          [v19 addObject:v15];
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v7);
  }

  v16 = (void *)[v19 copy];

  return v16;
}

- (id)avatarsExcludingIdentifiers:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = [(AVTArchiverBasedStoreBackend *)self sortedAvatars];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __66__AVTArchiverBasedStoreBackend_avatarsExcludingIdentifiers_error___block_invoke;
  v13[3] = &unk_2647C3DC0;
  id v14 = v5;
  id v7 = v5;
  uint64_t v8 = [v6 indexesOfObjectsPassingTest:v13];

  id v9 = [(AVTArchiverBasedStoreBackend *)self sortedAvatars];
  uint64_t v10 = [v9 objectsAtIndexes:v8];

  id v11 = (void *)[v10 copy];

  return v11;
}

BOOL __66__AVTArchiverBasedStoreBackend_avatarsExcludingIdentifiers_error___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 identifier];
  BOOL v4 = [v2 indexOfObject:v3] == 0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

- (BOOL)saveAvatars:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        if (!-[AVTArchiverBasedStoreBackend saveAvatar:error:](self, "saveAvatar:error:", *(void *)(*((void *)&v13 + 1) + 8 * i), a4, (void)v13))
        {
          BOOL v11 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 1;
LABEL_11:

  return v11;
}

- (BOOL)saveAvatar:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (![(AVTArchiverBasedStoreBackend *)self loadContentFromDiskIfNeeded:a4]) {
    goto LABEL_7;
  }
  uint64_t v7 = [(AVTArchiverBasedStoreBackend *)self sortedAvatars];
  uint64_t v8 = [v6 identifier];
  uint64_t v9 = +[AVTAvatarRecord matchingIdentifierTest:v8];
  uint64_t v10 = [v7 indexOfObjectPassingTest:v9];

  if (v10 == 0x7FFFFFFFFFFFFFFFLL
    && ![(AVTArchiverBasedStoreBackend *)self canCreateAvatarWithError:0])
  {
    if (a4)
    {
      +[AVTError errorWithCode:578 userInfo:0];
      BOOL v17 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
LABEL_7:
    BOOL v17 = 0;
    goto LABEL_8;
  }
  BOOL v11 = [(AVTArchiverBasedStoreBackend *)self environment];
  v12 = [v11 logger];

  long long v13 = objc_opt_class();
  long long v14 = [(AVTArchiverBasedStoreBackend *)self domainIdentifier];
  long long v15 = [(AVTArchiverBasedStoreBackend *)self model];
  long long v16 = [v13 rootBySavingAvatarRecord:v6 afterAvatarRecord:0 forDomainIdentifier:v14 toRoot:v15];

  BOOL v17 = [(AVTArchiverBasedStoreBackend *)self saveModel:v16 logger:v12 error:a4];
LABEL_8:

  return v17;
}

- (BOOL)deleteAvatarWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(AVTArchiverBasedStoreBackend *)self loadContentFromDiskIfNeeded:a4])
  {
    uint64_t v7 = [(AVTArchiverBasedStoreBackend *)self environment];
    uint64_t v8 = [v7 logger];

    [v8 logDeletingRecordWithIdentifier:v6];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = [(AVTArchiverBasedStoreBackend *)self model];
    BOOL v11 = [v9 rootByRemovingAvatarWithIdentifier:v6 fromRoot:v10];

    BOOL v12 = [(AVTArchiverBasedStoreBackend *)self saveModel:v11 logger:v8 error:a4];
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)duplicateAvatarRecord:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (![(AVTArchiverBasedStoreBackend *)self loadContentFromDiskIfNeeded:a4]) {
    goto LABEL_9;
  }
  if ([(AVTArchiverBasedStoreBackend *)self canCreateAvatarWithError:0])
  {
    uint64_t v7 = [(AVTArchiverBasedStoreBackend *)self environment];
    uint64_t v8 = [v7 logger];

    uint64_t v9 = [v6 identifier];
    [v8 logDuplicatingRecordWithIdentifier:v9];

    uint64_t v10 = [AVTAvatarRecord alloc];
    BOOL v11 = [v6 avatarData];
    BOOL v12 = (void *)[v11 copy];
    long long v13 = [v6 orderDate];
    long long v14 = [v13 dateByAddingTimeInterval:0.5];
    long long v15 = [(AVTAvatarRecord *)v10 initWithAvatarData:v12 orderDate:v14];

    long long v16 = objc_opt_class();
    BOOL v17 = [(AVTArchiverBasedStoreBackend *)self domainIdentifier];
    uint64_t v18 = [(AVTArchiverBasedStoreBackend *)self model];
    v19 = [v16 rootBySavingAvatarRecord:v15 afterAvatarRecord:v6 forDomainIdentifier:v17 toRoot:v18];

    if ([(AVTArchiverBasedStoreBackend *)self saveModel:v19 logger:v8 error:a4]) {
      v20 = v15;
    }
    else {
      v20 = 0;
    }
    long long v21 = v20;

    goto LABEL_10;
  }
  if (a4)
  {
    +[AVTError errorWithCode:578 userInfo:0];
    long long v21 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_9:
    long long v21 = 0;
  }
LABEL_10:

  return v21;
}

- (BOOL)canCreateAvatarWithError:(id *)a3
{
  if ([(AVTArchiverBasedStoreBackend *)self avatarCountWithError:a3] == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  id v5 = [(AVTArchiverBasedStoreBackend *)self sortedAvatars];
  unint64_t v6 = [v5 count];
  BOOL v4 = v6 < [(id)objc_opt_class() maximumNumberOfSavableAvatars];

  return v4;
}

- (BOOL)saveModel:(id)a3 logger:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(AVTArchiverBasedStoreBackend *)self storeLocation];
  BOOL v11 = +[AVTArchiverBasedStorePersistence writeContent:v8 toDiskAtLocation:v10 logger:v9 error:a5];

  if (v11) {
    [(AVTArchiverBasedStoreBackend *)self loadModel:v8];
  }

  return v11;
}

- (unint64_t)avatarCountWithError:(id *)a3
{
  if (![(AVTArchiverBasedStoreBackend *)self loadContentFromDiskIfNeeded:a3]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  BOOL v4 = [(AVTArchiverBasedStoreBackend *)self sortedAvatars];
  unint64_t v5 = [v4 count];

  return v5;
}

+ (id)rootBySavingAvatarRecord:(id)a3 afterAvatarRecord:(id)a4 forDomainIdentifier:(id)a5 toRoot:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  long long v13 = [v12 domains];
  long long v14 = (void *)[v13 mutableCopy];

  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __102__AVTArchiverBasedStoreBackend_rootBySavingAvatarRecord_afterAvatarRecord_forDomainIdentifier_toRoot___block_invoke;
  v39[3] = &unk_2647C3E10;
  id v15 = v11;
  id v40 = v15;
  uint64_t v16 = [v14 indexOfObjectPassingTest:v39];
  v38 = v15;
  if (v16 == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v17 = [AVTArchiverBasedDomain alloc];
    uint64_t v18 = [v9 identifier];
    uint64_t v19 = [(AVTArchiverBasedDomain *)v17 initWithDomainIdentifier:v15 primaryAvatarIdentifier:v18];

    v37 = (void *)v19;
    [v14 addObject:v19];
  }
  else
  {
    uint64_t v20 = v16;
    long long v21 = [v14 objectAtIndexedSubscript:v16];
    long long v22 = [v9 identifier];
    uint64_t v23 = [v21 domainBySettingPrimaryAvatarIdentifier:v22];

    v37 = (void *)v23;
    [v14 replaceObjectAtIndex:v20 withObject:v23];
  }
  long long v24 = [v12 records];

  v25 = (void *)[v24 mutableCopy];
  uint64_t v26 = [v9 identifier];
  v27 = +[AVTAvatarRecord matchingIdentifierTest:v26];
  uint64_t v28 = [v25 indexOfObjectPassingTest:v27];

  uint64_t v29 = [v25 count];
  if (v10)
  {
    v30 = v10;
    v31 = [v10 identifier];
    v32 = +[AVTAvatarRecord matchingIdentifierTest:v31];
    uint64_t v33 = [v25 indexOfObjectPassingTest:v32];
  }
  else
  {
    v30 = 0;
    uint64_t v33 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v28 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v33 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v34 = v29;
    }
    else {
      uint64_t v34 = v33 + 1;
    }
    [v25 insertObject:v9 atIndex:v34];
  }
  else
  {
    [v25 replaceObjectAtIndex:v28 withObject:v9];
  }
  v35 = [[AVTArchiverBasedStoreRoot alloc] initWithDomains:v14 records:v25];

  return v35;
}

uint64_t __102__AVTArchiverBasedStoreBackend_rootBySavingAvatarRecord_afterAvatarRecord_forDomainIdentifier_toRoot___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 domainIdentifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

+ (id)rootByRemovingAvatarWithIdentifier:(id)a3 fromRoot:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 records];
  id v8 = (void *)[v7 mutableCopy];

  id v9 = +[AVTAvatarRecord matchingIdentifierTest:v5];
  uint64_t v10 = [v8 indexOfObjectPassingTest:v9];

  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v11 = (AVTArchiverBasedStoreRoot *)v6;
  }
  else
  {
    [v8 removeObjectAtIndex:v10];
    id v12 = [v6 domains];
    long long v13 = (void *)[v12 mutableCopy];

    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __76__AVTArchiverBasedStoreBackend_rootByRemovingAvatarWithIdentifier_fromRoot___block_invoke;
    v23[3] = &unk_2647C3E10;
    id v24 = v5;
    long long v14 = [v13 indexesOfObjectsPassingTest:v23];
    uint64_t v18 = MEMORY[0x263EF8330];
    uint64_t v19 = 3221225472;
    uint64_t v20 = __76__AVTArchiverBasedStoreBackend_rootByRemovingAvatarWithIdentifier_fromRoot___block_invoke_2;
    long long v21 = &unk_2647C3E38;
    id v22 = v13;
    id v15 = v13;
    [v14 enumerateIndexesUsingBlock:&v18];
    uint64_t v16 = [AVTArchiverBasedStoreRoot alloc];
    id v11 = -[AVTArchiverBasedStoreRoot initWithDomains:records:](v16, "initWithDomains:records:", v15, v8, v18, v19, v20, v21);
  }

  return v11;
}

uint64_t __76__AVTArchiverBasedStoreBackend_rootByRemovingAvatarWithIdentifier_fromRoot___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 primaryAvatarIdentifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

void __76__AVTArchiverBasedStoreBackend_rootByRemovingAvatarWithIdentifier_fromRoot___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v7 = [*(id *)(a1 + 32) objectAtIndex:a2];
  uint64_t v4 = [AVTArchiverBasedDomain alloc];
  id v5 = [v7 domainIdentifier];
  id v6 = [(AVTArchiverBasedDomain *)v4 initWithDomainIdentifier:v5 primaryAvatarIdentifier:0];

  [*(id *)(a1 + 32) replaceObjectAtIndex:a2 withObject:v6];
}

+ (id)classifyRecordsByIdentifiers:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "identifier", (void)v14);
        [v4 setObject:v10 forKeyedSubscript:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  id v12 = (void *)[v4 copy];

  return v12;
}

- (AVTStoreBackendDelegate)backendDelegate
{
  return 0;
}

- (AVTAvatarRecordChangeTracker)recordChangeTracker
{
  return 0;
}

- (NSURL)storeLocation
{
  return self->_storeLocation;
}

- (NSString)domainIdentifier
{
  return self->_domainIdentifier;
}

- (AVTCoreEnvironment)environment
{
  return self->_environment;
}

- (AVTArchiverBasedStoreRoot)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (NSDictionary)avatarsByIdentifiers
{
  return self->_avatarsByIdentifiers;
}

- (void)setAvatarsByIdentifiers:(id)a3
{
}

- (NSArray)sortedAvatars
{
  return self->_sortedAvatars;
}

- (void)setSortedAvatars:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedAvatars, 0);
  objc_storeStrong((id *)&self->_avatarsByIdentifiers, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_domainIdentifier, 0);

  objc_storeStrong((id *)&self->_storeLocation, 0);
}

@end