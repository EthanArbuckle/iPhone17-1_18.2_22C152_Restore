@interface CLSEIEventsDataManager
- (BOOL)_save;
- (BOOL)save;
- (CLSEIEventsDataManager)initWithDiskCacheURL:(id)a3;
- (NSManagedObjectModel)managedObjectModel;
- (NSMutableDictionary)artistCache;
- (NSMutableDictionary)categoryCache;
- (NSMutableDictionary)venueCache;
- (NSPersistentStoreCoordinator)persistentStoreCoordinator;
- (NSURL)diskCacheURL;
- (OS_dispatch_queue)cacheQueue;
- (id)_fetchManagedObjectWithEntityName:(id)a3 name:(id)a4;
- (id)_fetchManagedObjectWithEntityName:(id)a3 uuid:(int64_t)a4;
- (id)fetchArtistForUUID:(int64_t)a3;
- (id)fetchCategoryForName:(id)a3;
- (id)fetchEventForUUID:(int64_t)a3;
- (id)fetchVenueForUUID:(int64_t)a3;
- (id)insertArtistWithUUID:(int64_t)a3 name:(id)a4;
- (id)insertCategoryWithName:(id)a3;
- (id)insertEventWithUUID:(int64_t)a3 name:(id)a4;
- (id)insertVenueWithUUID:(int64_t)a3 name:(id)a4 coordinate:(CLLocationCoordinate2D)a5;
- (id)managedObjectContext;
- (void)_resetCoreDataStack;
- (void)clear;
- (void)clearFastAccessCache;
@end

@implementation CLSEIEventsDataManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheQueue, 0);
  objc_storeStrong((id *)&self->_categoryCache, 0);
  objc_storeStrong((id *)&self->_artistCache, 0);
  objc_storeStrong((id *)&self->_venueCache, 0);
  objc_storeStrong((id *)&self->_diskCacheURL, 0);
  objc_storeStrong((id *)&self->_persistentStoreCoordinator, 0);
  objc_storeStrong((id *)&self->_managedObjectModel, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
}

- (OS_dispatch_queue)cacheQueue
{
  return self->_cacheQueue;
}

- (NSMutableDictionary)categoryCache
{
  return self->_categoryCache;
}

- (NSMutableDictionary)artistCache
{
  return self->_artistCache;
}

- (NSMutableDictionary)venueCache
{
  return self->_venueCache;
}

- (NSURL)diskCacheURL
{
  return self->_diskCacheURL;
}

- (id)_fetchManagedObjectWithEntityName:(id)a3 name:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(CLSEIEventsDataManager *)self managedObjectContext];
  v9 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:v7];

  v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"name == %@", v6];

  [v9 setPredicate:v10];
  v11 = [v8 executeFetchRequest:v9 error:0];
  v12 = [v11 firstObject];

  return v12;
}

- (id)_fetchManagedObjectWithEntityName:(id)a3 uuid:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(CLSEIEventsDataManager *)self managedObjectContext];
  v8 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:v6];

  v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"uuid == %lu", a4);
  [v8 setPredicate:v9];

  v10 = [v7 executeFetchRequest:v8 error:0];
  v11 = [v10 firstObject];

  return v11;
}

- (id)fetchCategoryForName:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__64;
  v23 = __Block_byref_object_dispose__65;
  id v24 = 0;
  v5 = [(CLSEIEventsDataManager *)self cacheQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__CLSEIEventsDataManager_fetchCategoryForName___block_invoke;
  block[3] = &unk_1E690F028;
  v18 = &v19;
  block[4] = self;
  id v6 = v4;
  id v17 = v6;
  dispatch_sync(v5, block);

  id v7 = (void *)v20[5];
  if (!v7)
  {
    uint64_t v8 = [(CLSEIEventsDataManager *)self _fetchManagedObjectWithEntityName:@"Category" name:v6];
    v9 = (void *)v20[5];
    v20[5] = v8;

    v10 = [(CLSEIEventsDataManager *)self cacheQueue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __47__CLSEIEventsDataManager_fetchCategoryForName___block_invoke_2;
    v13[3] = &unk_1E690F028;
    v13[4] = self;
    id v14 = v6;
    v15 = &v19;
    dispatch_sync(v10, v13);

    id v7 = (void *)v20[5];
  }
  id v11 = v7;

  _Block_object_dispose(&v19, 8);
  return v11;
}

void __47__CLSEIEventsDataManager_fetchCategoryForName___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) categoryCache];
  uint64_t v2 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __47__CLSEIEventsDataManager_fetchCategoryForName___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v3 = [*(id *)(a1 + 32) categoryCache];
  [v3 setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];
}

- (id)fetchArtistForUUID:(int64_t)a3
{
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__64;
  id v24 = __Block_byref_object_dispose__65;
  id v25 = 0;
  id v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:");
  id v6 = [(CLSEIEventsDataManager *)self cacheQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__CLSEIEventsDataManager_fetchArtistForUUID___block_invoke;
  block[3] = &unk_1E690F028;
  uint64_t v19 = &v20;
  block[4] = self;
  id v7 = v5;
  id v18 = v7;
  dispatch_sync(v6, block);

  uint64_t v8 = (void *)v21[5];
  if (!v8)
  {
    uint64_t v9 = [(CLSEIEventsDataManager *)self _fetchManagedObjectWithEntityName:@"Artist" uuid:a3];
    v10 = (void *)v21[5];
    v21[5] = v9;

    id v11 = [(CLSEIEventsDataManager *)self cacheQueue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __45__CLSEIEventsDataManager_fetchArtistForUUID___block_invoke_2;
    v14[3] = &unk_1E690F028;
    v14[4] = self;
    id v15 = v7;
    v16 = &v20;
    dispatch_sync(v11, v14);

    uint64_t v8 = (void *)v21[5];
  }
  id v12 = v8;

  _Block_object_dispose(&v20, 8);
  return v12;
}

void __45__CLSEIEventsDataManager_fetchArtistForUUID___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) artistCache];
  uint64_t v2 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __45__CLSEIEventsDataManager_fetchArtistForUUID___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v3 = [*(id *)(a1 + 32) artistCache];
  [v3 setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];
}

- (id)fetchVenueForUUID:(int64_t)a3
{
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__64;
  id v24 = __Block_byref_object_dispose__65;
  id v25 = 0;
  id v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:");
  id v6 = [(CLSEIEventsDataManager *)self cacheQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__CLSEIEventsDataManager_fetchVenueForUUID___block_invoke;
  block[3] = &unk_1E690F028;
  uint64_t v19 = &v20;
  block[4] = self;
  id v7 = v5;
  id v18 = v7;
  dispatch_sync(v6, block);

  uint64_t v8 = (void *)v21[5];
  if (!v8)
  {
    uint64_t v9 = [(CLSEIEventsDataManager *)self _fetchManagedObjectWithEntityName:@"Venue" uuid:a3];
    v10 = (void *)v21[5];
    v21[5] = v9;

    id v11 = [(CLSEIEventsDataManager *)self cacheQueue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __44__CLSEIEventsDataManager_fetchVenueForUUID___block_invoke_2;
    v14[3] = &unk_1E690F028;
    v14[4] = self;
    id v15 = v7;
    v16 = &v20;
    dispatch_sync(v11, v14);

    uint64_t v8 = (void *)v21[5];
  }
  id v12 = v8;

  _Block_object_dispose(&v20, 8);
  return v12;
}

void __44__CLSEIEventsDataManager_fetchVenueForUUID___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) venueCache];
  uint64_t v2 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __44__CLSEIEventsDataManager_fetchVenueForUUID___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v3 = [*(id *)(a1 + 32) venueCache];
  [v3 setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];
}

- (id)fetchEventForUUID:(int64_t)a3
{
  return [(CLSEIEventsDataManager *)self _fetchManagedObjectWithEntityName:@"Event" uuid:a3];
}

- (id)insertArtistWithUUID:(int64_t)a3 name:(id)a4
{
  id v6 = a4;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__64;
  v29 = __Block_byref_object_dispose__65;
  id v30 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  id v7 = [(CLSEIEventsDataManager *)self managedObjectContext];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __52__CLSEIEventsDataManager_insertArtistWithUUID_name___block_invoke;
  v15[3] = &unk_1E690E858;
  id v18 = &v25;
  uint64_t v19 = &v21;
  v15[4] = self;
  int64_t v20 = a3;
  id v8 = v7;
  id v16 = v8;
  id v9 = v6;
  id v17 = v9;
  [v8 performBlockAndWait:v15];
  v10 = (void *)v26[5];
  if (!v10) {
    __assert_rtn("-[CLSEIEventsDataManager insertArtistWithUUID:name:]", "CLSEIEventsDataManager.m", 301, "artist != nil");
  }
  if (*((unsigned char *)v22 + 24))
  {
    id v11 = [(CLSEIEventsDataManager *)self cacheQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__CLSEIEventsDataManager_insertArtistWithUUID_name___block_invoke_2;
    block[3] = &unk_1E690E808;
    block[4] = self;
    void block[5] = &v25;
    block[6] = a3;
    dispatch_sync(v11, block);

    v10 = (void *)v26[5];
  }
  id v12 = v10;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v12;
}

void __52__CLSEIEventsDataManager_insertArtistWithUUID_name___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) fetchArtistForUUID:*(void *)(a1 + 72)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    uint64_t v5 = [MEMORY[0x1E4F1C0A8] insertNewObjectForEntityForName:@"Artist" inManagedObjectContext:*(void *)(a1 + 40)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setUuid:*(void *)(a1 + 72)];
    uint64_t v8 = *(void *)(a1 + 48);
    id v9 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    [v9 setName:v8];
  }
}

void __52__CLSEIEventsDataManager_insertArtistWithUUID_name___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v4 = [*(id *)(a1 + 32) artistCache];
  uint64_t v3 = [MEMORY[0x1E4F28ED0] numberWithInteger:*(void *)(a1 + 48)];
  [v4 setObject:v2 forKeyedSubscript:v3];
}

- (id)insertCategoryWithName:(id)a3
{
  id v4 = a3;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__64;
  v28 = __Block_byref_object_dispose__65;
  id v29 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  uint64_t v5 = [(CLSEIEventsDataManager *)self managedObjectContext];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __49__CLSEIEventsDataManager_insertCategoryWithName___block_invoke;
  v15[3] = &unk_1E690E830;
  id v18 = &v24;
  v15[4] = self;
  id v6 = v4;
  id v16 = v6;
  uint64_t v19 = &v20;
  id v7 = v5;
  id v17 = v7;
  [v7 performBlockAndWait:v15];
  uint64_t v8 = (void *)v25[5];
  if (!v8) {
    __assert_rtn("-[CLSEIEventsDataManager insertCategoryWithName:]", "CLSEIEventsDataManager.m", 274, "category != nil");
  }
  if (*((unsigned char *)v21 + 24))
  {
    id v9 = [(CLSEIEventsDataManager *)self cacheQueue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __49__CLSEIEventsDataManager_insertCategoryWithName___block_invoke_2;
    v12[3] = &unk_1E690F028;
    v12[4] = self;
    id v13 = v6;
    id v14 = &v24;
    dispatch_sync(v9, v12);

    uint64_t v8 = (void *)v25[5];
  }
  id v10 = v8;

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  return v10;
}

void __49__CLSEIEventsDataManager_insertCategoryWithName___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) fetchCategoryForName:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    uint64_t v5 = [MEMORY[0x1E4F1C0A8] insertNewObjectForEntityForName:@"Category" inManagedObjectContext:*(void *)(a1 + 48)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    [v9 setName:v8];
  }
}

void __49__CLSEIEventsDataManager_insertCategoryWithName___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v3 = [*(id *)(a1 + 32) categoryCache];
  [v3 setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];
}

- (id)insertEventWithUUID:(int64_t)a3 name:(id)a4
{
  id v6 = a4;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__64;
  uint64_t v22 = __Block_byref_object_dispose__65;
  id v23 = 0;
  id v7 = [(CLSEIEventsDataManager *)self managedObjectContext];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __51__CLSEIEventsDataManager_insertEventWithUUID_name___block_invoke;
  v13[3] = &unk_1E690F000;
  id v16 = &v18;
  id v8 = v7;
  id v14 = v8;
  int64_t v17 = a3;
  id v9 = v6;
  id v15 = v9;
  [v8 performBlockAndWait:v13];
  id v10 = (void *)v19[5];
  if (!v10) {
    __assert_rtn("-[CLSEIEventsDataManager insertEventWithUUID:name:]", "CLSEIEventsDataManager.m", 254, "event != nil");
  }
  id v11 = v10;

  _Block_object_dispose(&v18, 8);
  return v11;
}

uint64_t __51__CLSEIEventsDataManager_insertEventWithUUID_name___block_invoke(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1C0A8] insertNewObjectForEntityForName:@"Event" inManagedObjectContext:a1[4]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  [*(id *)(*(void *)(a1[6] + 8) + 40) setUuid:a1[7]];
  uint64_t v5 = a1[5];
  id v6 = *(void **)(*(void *)(a1[6] + 8) + 40);
  return [v6 setName:v5];
}

- (id)insertVenueWithUUID:(int64_t)a3 name:(id)a4 coordinate:(CLLocationCoordinate2D)a5
{
  CLLocationDegrees longitude = a5.longitude;
  CLLocationDegrees latitude = a5.latitude;
  id v9 = a4;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__64;
  v34 = __Block_byref_object_dispose__65;
  id v35 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  id v10 = [(CLSEIEventsDataManager *)self managedObjectContext];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __62__CLSEIEventsDataManager_insertVenueWithUUID_name_coordinate___block_invoke;
  v18[3] = &unk_1E690E7E0;
  uint64_t v21 = &v30;
  uint64_t v22 = &v26;
  v18[4] = self;
  int64_t v23 = a3;
  id v11 = v10;
  id v19 = v11;
  id v12 = v9;
  id v20 = v12;
  CLLocationDegrees v24 = latitude;
  CLLocationDegrees v25 = longitude;
  [v11 performBlockAndWait:v18];
  id v13 = (void *)v31[5];
  if (!v13) {
    __assert_rtn("-[CLSEIEventsDataManager insertVenueWithUUID:name:coordinate:]", "CLSEIEventsDataManager.m", 233, "venue != nil");
  }
  if (*((unsigned char *)v27 + 24))
  {
    id v14 = [(CLSEIEventsDataManager *)self cacheQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__CLSEIEventsDataManager_insertVenueWithUUID_name_coordinate___block_invoke_2;
    block[3] = &unk_1E690E808;
    block[4] = self;
    void block[5] = &v30;
    block[6] = a3;
    dispatch_sync(v14, block);

    id v13 = (void *)v31[5];
  }
  id v15 = v13;

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);

  return v15;
}

void __62__CLSEIEventsDataManager_insertVenueWithUUID_name_coordinate___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) fetchVenueForUUID:*(void *)(a1 + 72)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    uint64_t v5 = [MEMORY[0x1E4F1C0A8] insertNewObjectForEntityForName:@"Venue" inManagedObjectContext:*(void *)(a1 + 40)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setUuid:*(void *)(a1 + 72)];
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setName:*(void *)(a1 + 48)];
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setLatitude:*(double *)(a1 + 80)];
    double v8 = *(double *)(a1 + 88);
    id v9 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    [v9 setLongitude:v8];
  }
}

void __62__CLSEIEventsDataManager_insertVenueWithUUID_name_coordinate___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v4 = [*(id *)(a1 + 32) venueCache];
  uint64_t v3 = [MEMORY[0x1E4F28ED0] numberWithInteger:*(void *)(a1 + 48)];
  [v4 setObject:v2 forKeyedSubscript:v3];
}

- (void)_resetCoreDataStack
{
  obj = self;
  objc_sync_enter(obj);
  persistentStoreCoordinator = obj->_persistentStoreCoordinator;
  obj->_persistentStoreCoordinator = 0;

  managedObjectContext = obj->_managedObjectContext;
  obj->_managedObjectContext = 0;

  objc_sync_exit(obj);
}

- (void)clearFastAccessCache
{
  obj = self;
  objc_sync_enter(obj);
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  categoryCache = obj->_categoryCache;
  obj->_categoryCache = (NSMutableDictionary *)v2;

  uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  venueCache = obj->_venueCache;
  obj->_venueCache = (NSMutableDictionary *)v4;

  uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
  artistCache = obj->_artistCache;
  obj->_artistCache = (NSMutableDictionary *)v6;

  objc_sync_exit(obj);
}

- (void)clear
{
  v29[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = *MEMORY[0x1E4F1BDE8];
  v28[0] = *MEMORY[0x1E4F1BE50];
  v28[1] = v3;
  v29[0] = MEMORY[0x1E4F1CC38];
  v29[1] = MEMORY[0x1E4F1CC38];
  uint64_t v18 = v2;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
  uint64_t v5 = [(CLSEIEventsDataManager *)v2 persistentStoreCoordinator];
  uint64_t v6 = v5;
  if (v5)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v7 = [v5 persistentStores];
    double v8 = 0;
    uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v22;
      uint64_t v11 = *MEMORY[0x1E4F1BF70];
      id obj = v7;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(obj);
          }
          id v13 = [*(id *)(*((void *)&v21 + 1) + 8 * i) URL];
          id v20 = v8;
          char v14 = [v6 destroyPersistentStoreAtURL:v13 withType:v11 options:v4 error:&v20];
          id v15 = v20;

          double v8 = v15;
          if ((v14 & 1) == 0)
          {
            id v16 = +[CLSEILogging sharedLogging];
            int64_t v17 = [v16 loggingConnection];

            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v26 = v8;
              _os_log_error_impl(&dword_1D2150000, v17, OS_LOG_TYPE_ERROR, "Could not destroy persistent store for DBCache, %@", buf, 0xCu);
            }
          }
        }
        id v7 = obj;
        uint64_t v9 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
      }
      while (v9);
    }

    [(CLSEIEventsDataManager *)v18 _resetCoreDataStack];
  }
  else
  {
    double v8 = 0;
  }

  objc_sync_exit(v18);
}

- (BOOL)save
{
  uint64_t v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  uint64_t v3 = [(CLSEIEventsDataManager *)self managedObjectContext];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__CLSEIEventsDataManager_save__block_invoke;
  v5[3] = &unk_1E690F0D0;
  v5[4] = v2;
  v5[5] = &v6;
  [v3 performBlockAndWait:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __30__CLSEIEventsDataManager_save__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) managedObjectContext];
  int v3 = [v2 hasChanges];

  if (v3) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) _save];
  }
}

- (BOOL)_save
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(CLSEIEventsDataManager *)self managedObjectContext];
  id v9 = 0;
  char v3 = [v2 save:&v9];
  id v4 = v9;

  if ((v3 & 1) == 0)
  {
    uint64_t v5 = +[CLSEILogging sharedLogging];
    uint64_t v6 = [v5 loggingConnection];

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = [v4 localizedDescription];
      *(_DWORD *)buf = 138412290;
      uint64_t v11 = v8;
      _os_log_error_impl(&dword_1D2150000, v6, OS_LOG_TYPE_ERROR, "An error occured saving parent context to the database: \"%@\"", buf, 0xCu);
    }
  }

  return 1;
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  v25[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  persistentStoreCoordinator = v2->_persistentStoreCoordinator;
  if (persistentStoreCoordinator)
  {
    id v4 = persistentStoreCoordinator;
  }
  else
  {
    uint64_t v5 = *MEMORY[0x1E4F1BDE8];
    v24[0] = *MEMORY[0x1E4F1BE50];
    v24[1] = v5;
    v25[0] = MEMORY[0x1E4F1CC38];
    v25[1] = MEMORY[0x1E4F1CC38];
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
    id v7 = [(CLSEIEventsDataManager *)v2 managedObjectModel];
    if (v7)
    {
      uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1C188]) initWithManagedObjectModel:v7];
      id v9 = v2->_persistentStoreCoordinator;
      v2->_persistentStoreCoordinator = (NSPersistentStoreCoordinator *)v8;

      uint64_t v10 = v2->_persistentStoreCoordinator;
      uint64_t v11 = [(CLSEIEventsDataManager *)v2 diskCacheURL];
      uint64_t v12 = *MEMORY[0x1E4F1BF70];
      id v21 = 0;
      id v13 = [(NSPersistentStoreCoordinator *)v10 addPersistentStoreWithType:v12 configuration:0 URL:v11 options:v6 error:&v21];
      id v14 = v21;

      if (v13)
      {
        id v15 = +[CLSEILogging sharedLogging];
        p_super = [v15 loggingConnection];

        if (os_log_type_enabled(p_super, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D2150000, p_super, OS_LOG_TYPE_INFO, "Core Data database successfully cleared", buf, 2u);
        }
      }
      else
      {
        uint64_t v18 = +[CLSEILogging sharedLogging];
        id v19 = [v18 loggingConnection];

        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v23 = v14;
          _os_log_error_impl(&dword_1D2150000, v19, OS_LOG_TYPE_ERROR, "Cannot clear Core Data database: \"%@\"", buf, 0xCu);
        }

        p_super = &v2->_persistentStoreCoordinator->super;
        v2->_persistentStoreCoordinator = 0;
      }

      id v4 = v2->_persistentStoreCoordinator;
    }
    else
    {
      int64_t v17 = +[CLSEILogging sharedLogging];
      id v13 = [v17 loggingConnection];

      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D2150000, v13, OS_LOG_TYPE_ERROR, "An error occured when we get the managedObjectModel", buf, 2u);
      }
      id v14 = 0;
      id v4 = 0;
    }
  }
  objc_sync_exit(v2);

  return v4;
}

- (NSManagedObjectModel)managedObjectModel
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  managedObjectModel = v2->_managedObjectModel;
  if (managedObjectModel)
  {
    id v4 = managedObjectModel;
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v6 = [v5 pathForResource:@"CLSEIEventsData" ofType:@"momd"];

    if (v6)
    {
      id v7 = objc_alloc(MEMORY[0x1E4F1C120]);
      uint64_t v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6];
      uint64_t v9 = [v7 initWithContentsOfURL:v8];
      uint64_t v10 = v2->_managedObjectModel;
      v2->_managedObjectModel = (NSManagedObjectModel *)v9;
    }
    else
    {
      uint64_t v11 = +[CLSEILogging sharedLogging];
      uint64_t v12 = [v11 loggingConnection];

      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v14 = 138412290;
        id v15 = @"CLSEIEventsData";
        _os_log_error_impl(&dword_1D2150000, v12, OS_LOG_TYPE_ERROR, "Failed to load a bundle containing \"%@\".", (uint8_t *)&v14, 0xCu);
      }
    }
    id v4 = v2->_managedObjectModel;
  }
  objc_sync_exit(v2);

  return v4;
}

- (id)managedObjectContext
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  managedObjectContext = v2->_managedObjectContext;
  if (managedObjectContext)
  {
    id v4 = managedObjectContext;
  }
  else
  {
    uint64_t v5 = [(CLSEIEventsDataManager *)v2 persistentStoreCoordinator];
    if (v5)
    {
      uint64_t v6 = [(CLSEIEventsDataManager *)v2 cacheQueue];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __46__CLSEIEventsDataManager_managedObjectContext__block_invoke;
      v9[3] = &unk_1E690E7B8;
      id v10 = v5;
      uint64_t v11 = v2;
      dispatch_sync(v6, v9);
    }
    id v7 = v2->_managedObjectContext;
    if (!v7) {
      __assert_rtn("-[CLSEIEventsDataManager managedObjectContext]", "CLSEIEventsDataManager.m", 73, "_managedObjectContext != nil");
    }
    id v4 = v7;
  }
  objc_sync_exit(v2);

  return v4;
}

void __46__CLSEIEventsDataManager_managedObjectContext__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C110]) initWithConcurrencyType:1];
  [v2 setUndoManager:0];
  [v2 setPersistentStoreCoordinator:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;
}

- (CLSEIEventsDataManager)initWithDiskCacheURL:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CLSEIEventsDataManager;
  uint64_t v6 = [(CLSEIEventsDataManager *)&v17 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_diskCacheURL, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    venueCache = v7->_venueCache;
    v7->_venueCache = (NSMutableDictionary *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
    artistCache = v7->_artistCache;
    v7->_artistCache = (NSMutableDictionary *)v10;

    uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
    categoryCache = v7->_categoryCache;
    v7->_categoryCache = (NSMutableDictionary *)v12;

    dispatch_queue_t v14 = dispatch_queue_create("CacheQueue", 0);
    cacheQueue = v7->_cacheQueue;
    v7->_cacheQueue = (OS_dispatch_queue *)v14;
  }
  return v7;
}

@end