@interface CNContactPosterStore
+ (int64_t)maximumContactPostersPerContact;
- (BOOL)performSaveRequest:(id)a3 error:(id *)a4;
- (BOOL)updateExistingPosters:(id)a3 withContactPoster:(id)a4;
- (BOOL)updateOrInsertNewContactPosters:(id)a3 forContactIdentifier:(id)a4 inContext:(id)a5 error:(id *)a6;
- (CNContactMetadataPersistentStoreManager)storeManager;
- (CNContactPosterStore)init;
- (CNContactPosterStore)initWithContactMetadataStoreManager:(id)a3;
- (id)managedObjectsToContactPosters:(id)a3;
- (id)performFetchRequest:(id)a3 error:(id *)a4;
- (void)ensurePosterQuotasForPosters:(id)a3 addedPostersCount:(int64_t)a4 inContext:(id)a5;
- (void)insertContactPoster:(id)a3 withContactIdentifier:(id)a4 inContext:(id)a5;
- (void)setStoreManager:(id)a3;
@end

@implementation CNContactPosterStore

+ (int64_t)maximumContactPostersPerContact
{
  return 7;
}

- (CNContactPosterStore)init
{
  v3 = objc_alloc_init(CNContactMetadataPersistentStoreManager);
  v4 = [(CNContactPosterStore *)self initWithContactMetadataStoreManager:v3];

  return v4;
}

- (CNContactPosterStore)initWithContactMetadataStoreManager:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNContactPosterStore;
  v6 = [(CNContactPosterStore *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_storeManager, a3);
    v8 = v7;
  }

  return v7;
}

- (id)performFetchRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__22;
  v31 = __Block_byref_object_dispose__22;
  id v32 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__22;
  v25 = __Block_byref_object_dispose__22;
  id v26 = 0;
  v7 = [(CNContactPosterStore *)self storeManager];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __50__CNContactPosterStore_performFetchRequest_error___block_invoke;
  v16[3] = &unk_1E56B5490;
  id v8 = v6;
  v19 = &v21;
  v20 = &v27;
  id v17 = v8;
  v18 = self;
  v9 = (id *)(v22 + 5);
  id obj = (id)v22[5];
  [v7 performWorkWithManagedObjectContext:v16 error:&obj];
  objc_storeStrong(v9, obj);

  objc_super v10 = (void *)v22[5];
  id v11 = (id)v28[5];
  v12 = v11;
  if (a4 && !v11) {
    *a4 = v10;
  }

  id v13 = (id)v28[5];
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);

  return v13;
}

void __50__CNContactPosterStore_performFetchRequest_error___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 persistentStoreRequest];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v6 + 40);
  v7 = [v4 executeFetchRequest:v5 error:&obj];

  objc_storeStrong((id *)(v6 + 40), obj);
  if (v7)
  {
    uint64_t v8 = [*(id *)(a1 + 40) managedObjectsToContactPosters:v7];
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    objc_super v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
}

- (BOOL)performSaveRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__22;
  v22 = __Block_byref_object_dispose__22;
  id v23 = 0;
  v7 = [(CNContactPosterStore *)self storeManager];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __49__CNContactPosterStore_performSaveRequest_error___block_invoke;
  v13[3] = &unk_1E56B5490;
  id v8 = v6;
  v16 = &v18;
  id v17 = &v24;
  id v14 = v8;
  v15 = self;
  uint64_t v9 = (id *)(v19 + 5);
  id obj = (id)v19[5];
  [v7 performWorkWithManagedObjectContext:v13 error:&obj];
  objc_storeStrong(v9, obj);

  int v10 = *((unsigned __int8 *)v25 + 24);
  if (a4 && !*((unsigned char *)v25 + 24)) {
    *a4 = (id) v19[5];
  }

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v10 != 0;
}

void __49__CNContactPosterStore_performSaveRequest_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) operationType];
  id v5 = *(void **)(a1 + 32);
  if (v4 == 2)
  {
    id v6 = [v5 persistentStoreRequest];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id obj = *(id *)(v7 + 40);
    id v8 = [v3 executeRequest:v6 error:&obj];
    objc_storeStrong((id *)(v7 + 40), obj);

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v8 != 0;
LABEL_5:

    goto LABEL_6;
  }
  if (![v5 operationType])
  {
    uint64_t v9 = [*(id *)(a1 + 32) contactIdentifiers];
    id v8 = [v9 firstObject];

    int v10 = [*(id *)(a1 + 32) posters];
    id v11 = objc_msgSend(v10, "_cn_takeLast:", objc_msgSend((id)objc_opt_class(), "maximumContactPostersPerContact"));

    v12 = *(void **)(a1 + 40);
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
    id v17 = *(id *)(v13 + 40);
    [v12 updateOrInsertNewContactPosters:v11 forContactIdentifier:v8 inContext:v3 error:&v17];
    objc_storeStrong((id *)(v13 + 40), v17);
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
    id v16 = *(id *)(v14 + 40);
    char v15 = [v3 save:&v16];
    objc_storeStrong((id *)(v14 + 40), v16);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v15;

    goto LABEL_5;
  }
LABEL_6:
}

- (BOOL)updateOrInsertNewContactPosters:(id)a3 forContactIdentifier:(id)a4 inContext:(id)a5 error:(id *)a6
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v31[0] = v11;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
  uint64_t v14 = +[CNContactPosterFetchRequest recentPostersRequestForContactIdenfitiers:v13];

  v25 = v14;
  char v15 = [v14 persistentStoreRequest];
  id v16 = [v12 executeFetchRequest:v15 error:a6];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v17 = v10;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = 0;
    uint64_t v21 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(v17);
        }
        uint64_t v23 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        if (![(CNContactPosterStore *)self updateExistingPosters:v16 withContactPoster:v23])
        {
          [(CNContactPosterStore *)self insertContactPoster:v23 withContactIdentifier:v11 inContext:v12];
          ++v20;
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v19);
  }
  else
  {
    uint64_t v20 = 0;
  }

  [(CNContactPosterStore *)self ensurePosterQuotasForPosters:v16 addedPostersCount:v20 inContext:v12];
  return 1;
}

- (BOOL)updateExistingPosters:(id)a3 withContactPoster:(id)a4
{
  id v5 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__CNContactPosterStore_updateExistingPosters_withContactPoster___block_invoke;
  v10[3] = &unk_1E56B7710;
  id v6 = v5;
  id v11 = v6;
  uint64_t v7 = objc_msgSend(a3, "_cn_firstObjectPassingTest:", v10);
  id v8 = v7;
  if (v7) {
    [v7 updateWithContactPoster:v6];
  }

  return v8 != 0;
}

uint64_t __64__CNContactPosterStore_updateExistingPosters_withContactPoster___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v5 = [v4 identifier];
  id v6 = [v5 UUIDString];
  if (!v6)
  {
    v2 = [*(id *)(a1 + 32) identifier];
    if (!v2)
    {
      uint64_t v10 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  uint64_t v7 = [v4 identifier];
  id v8 = [v7 UUIDString];
  uint64_t v9 = [*(id *)(a1 + 32) identifier];
  uint64_t v10 = [v8 isEqual:v9];

  if (!v6) {
    goto LABEL_6;
  }
LABEL_7:

  return v10;
}

- (void)ensurePosterQuotasForPosters:(id)a3 addedPostersCount:(int64_t)a4 inContext:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v9 = objc_msgSend(v7, "_cn_skip:", objc_msgSend((id)objc_opt_class(), "maximumContactPostersPerContact") - a4, 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [v8 deleteObject:*(void *)(*((void *)&v14 + 1) + 8 * v13++)];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (void)insertContactPoster:(id)a3 withContactIdentifier:(id)a4 inContext:(id)a5
{
  id v13 = a3;
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [MEMORY[0x1E4F1C0A8] insertNewObjectForEntityForName:@"CNContactPoster" inManagedObjectContext:v8];
  uint64_t v10 = [v13 pairedImage];

  if (v10)
  {
    uint64_t v11 = [MEMORY[0x1E4F1C0A8] insertNewObjectForEntityForName:@"CNContactImage" inManagedObjectContext:v8];
    uint64_t v12 = [v13 pairedImage];
    [v11 setupWithContactImage:v12 pairedPoster:v9 contactIdentifier:v7];

    [v9 setupWithContactPoster:v13 pairedImage:v11 contactIdentifier:v7];
  }
  else
  {
    [v9 setupWithContactPoster:v13 contactIdentifier:v7];
  }
}

- (id)managedObjectsToContactPosters:(id)a3
{
  id v3 = a3;
  id v4 = +[CNContactPosterManagedObject managedObjectToContactPosterTransform];
  id v5 = objc_msgSend(v3, "_cn_map:", v4);

  return v5;
}

- (CNContactMetadataPersistentStoreManager)storeManager
{
  return self->_storeManager;
}

- (void)setStoreManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end