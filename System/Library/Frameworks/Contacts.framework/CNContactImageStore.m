@interface CNContactImageStore
+ (int64_t)maximumContactImagesPerContact;
- (BOOL)performSaveRequest:(id)a3 error:(id *)a4;
- (BOOL)updateExistingImages:(id)a3 withContactImage:(id)a4;
- (BOOL)updateOrInsertNewContactImages:(id)a3 forContactIdentifier:(id)a4 inContext:(id)a5 error:(id *)a6;
- (CNContactImageStore)init;
- (CNContactImageStore)initWithContactMetadataStoreManager:(id)a3;
- (CNContactMetadataPersistentStoreManager)storeManager;
- (id)managedObjectsToContactImages:(id)a3;
- (id)performFetchRequest:(id)a3 error:(id *)a4;
- (unint64_t)countForFetchRequest:(id)a3 error:(id *)a4;
- (void)ensureImageQuotasForImages:(id)a3 adddedImagesCount:(int64_t)a4 inContext:(id)a5;
- (void)insertContactImage:(id)a3 withContactIdentifier:(id)a4 inContext:(id)a5;
- (void)setStoreManager:(id)a3;
@end

@implementation CNContactImageStore

+ (int64_t)maximumContactImagesPerContact
{
  return 7;
}

- (CNContactImageStore)init
{
  v3 = objc_alloc_init(CNContactMetadataPersistentStoreManager);
  v4 = [(CNContactImageStore *)self initWithContactMetadataStoreManager:v3];

  return v4;
}

- (CNContactImageStore)initWithContactMetadataStoreManager:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNContactImageStore;
  v6 = [(CNContactImageStore *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_storeManager, a3);
    v8 = v7;
  }

  return v7;
}

- (unint64_t)countForFetchRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__12;
  v30 = __Block_byref_object_dispose__12;
  id v31 = 0;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__12;
  v24 = __Block_byref_object_dispose__12;
  id v25 = 0;
  v7 = [(CNContactImageStore *)self storeManager];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __50__CNContactImageStore_countForFetchRequest_error___block_invoke;
  v16[3] = &unk_1E56B5468;
  id v8 = v6;
  id v17 = v8;
  v18 = &v20;
  v19 = &v26;
  v9 = (id *)(v21 + 5);
  id obj = (id)v21[5];
  [v7 performWorkWithManagedObjectContext:v16 error:&obj];
  objc_storeStrong(v9, obj);

  objc_super v10 = (void *)v21[5];
  id v11 = (id)v27[5];
  v12 = v11;
  if (a4 && !v11) {
    *a4 = v10;
  }

  unint64_t v13 = [(id)v27[5] unsignedIntegerValue];
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v13;
}

void __50__CNContactImageStore_countForFetchRequest_error___block_invoke(void *a1, void *a2)
{
  v3 = (void *)a1[4];
  id v4 = a2;
  id v5 = [v3 persistentStoreRequest];
  uint64_t v6 = *(void *)(a1[5] + 8);
  id obj = *(id *)(v6 + 40);
  uint64_t v7 = [v4 countForFetchRequest:v5 error:&obj];

  objc_storeStrong((id *)(v6 + 40), obj);
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:v7];
  uint64_t v9 = *(void *)(a1[6] + 8);
  objc_super v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

- (id)performFetchRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__12;
  id v31 = __Block_byref_object_dispose__12;
  id v32 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__12;
  id v25 = __Block_byref_object_dispose__12;
  id v26 = 0;
  uint64_t v7 = [(CNContactImageStore *)self storeManager];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __49__CNContactImageStore_performFetchRequest_error___block_invoke;
  v16[3] = &unk_1E56B5490;
  id v8 = v6;
  v19 = &v21;
  uint64_t v20 = &v27;
  id v17 = v8;
  v18 = self;
  uint64_t v9 = (id *)(v22 + 5);
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

void __49__CNContactImageStore_performFetchRequest_error___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 persistentStoreRequest];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v6 + 40);
  uint64_t v7 = [v4 executeFetchRequest:v5 error:&obj];

  objc_storeStrong((id *)(v6 + 40), obj);
  if (v7)
  {
    uint64_t v8 = [*(id *)(a1 + 40) managedObjectsToContactImages:v7];
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    objc_super v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
}

- (BOOL)performSaveRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__12;
  uint64_t v22 = __Block_byref_object_dispose__12;
  id v23 = 0;
  uint64_t v7 = [(CNContactImageStore *)self storeManager];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __48__CNContactImageStore_performSaveRequest_error___block_invoke;
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

void __48__CNContactImageStore_performSaveRequest_error___block_invoke(uint64_t a1, void *a2)
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

    int v10 = [*(id *)(a1 + 32) images];
    id v11 = objc_msgSend(v10, "_cn_takeLast:", objc_msgSend((id)objc_opt_class(), "maximumContactImagesPerContact"));

    v12 = *(void **)(a1 + 40);
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
    id v17 = *(id *)(v13 + 40);
    [v12 updateOrInsertNewContactImages:v11 forContactIdentifier:v8 inContext:v3 error:&v17];
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

- (BOOL)updateOrInsertNewContactImages:(id)a3 forContactIdentifier:(id)a4 inContext:(id)a5 error:(id *)a6
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v31[0] = v11;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
  uint64_t v14 = +[CNContactImageFetchRequest recentImagesRequestForContactIdenfitiers:v13];

  id v25 = v14;
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
        if (![(CNContactImageStore *)self updateExistingImages:v16 withContactImage:v23])
        {
          [(CNContactImageStore *)self insertContactImage:v23 withContactIdentifier:v11 inContext:v12];
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

  [(CNContactImageStore *)self ensureImageQuotasForImages:v16 adddedImagesCount:v20 inContext:v12];
  return 1;
}

- (BOOL)updateExistingImages:(id)a3 withContactImage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 pairedPoster];

  if ([v6 source])
  {
    uint64_t v8 = [v6 source];
    BOOL v9 = 0;
    if (!v7 && v8 != 2)
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __61__CNContactImageStore_updateExistingImages_withContactImage___block_invoke;
      v14[3] = &unk_1E56B54B8;
      id v10 = v6;
      id v15 = v10;
      id v11 = objc_msgSend(v5, "_cn_firstObjectPassingTest:", v14);
      id v12 = v11;
      BOOL v9 = v11 != 0;
      if (v11) {
        [v11 updateWithContactImage:v10];
      }
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

uint64_t __61__CNContactImageStore_updateExistingImages_withContactImage___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v6 = [v5 source];
  uint64_t v7 = [v6 integerValue];
  uint64_t v8 = [*(id *)(a1 + 32) source];

  BOOL v9 = [v5 sourceIdentifier];
  if (!v9)
  {
    v2 = [*(id *)(a1 + 32) sourceIdentifier];
    if (!v2)
    {
      int v11 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  id v3 = [v5 sourceIdentifier];
  id v10 = [*(id *)(a1 + 32) sourceIdentifier];
  int v11 = [v3 isEqual:v10];

  if (!v9) {
    goto LABEL_6;
  }
LABEL_7:

  id v12 = [v5 variant];
  if (v12 || ([*(id *)(a1 + 32) variant], (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v13 = [v5 variant];
    uint64_t v14 = [*(id *)(a1 + 32) variant];
    int v15 = [v13 isEqual:v14];

    if (v12) {
      goto LABEL_13;
    }
  }
  else
  {
    int v15 = 1;
  }

LABEL_13:
  id v16 = [v5 displayString];
  if (v16)
  {
    id v17 = [v5 displayString];
    uint64_t v18 = [*(id *)(a1 + 32) displayString];
    unsigned int v19 = [v17 isEqualToString:v18];
  }
  else
  {
    id v17 = [*(id *)(a1 + 32) displayString];
    unsigned int v19 = v17 == 0;
  }

  if (v7 == v8) {
    int v20 = v11;
  }
  else {
    int v20 = 0;
  }
  uint64_t v21 = v20 & v15 & v19;

  return v21;
}

- (void)ensureImageQuotasForImages:(id)a3 adddedImagesCount:(int64_t)a4 inContext:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v9 = objc_msgSend(v7, "_cn_skip:", objc_msgSend((id)objc_opt_class(), "maximumContactImagesPerContact") - a4, 0);
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

- (void)insertContactImage:(id)a3 withContactIdentifier:(id)a4 inContext:(id)a5
{
  id v13 = a3;
  id v7 = a4;
  id v8 = a5;
  BOOL v9 = [MEMORY[0x1E4F1C0A8] insertNewObjectForEntityForName:@"CNContactImage" inManagedObjectContext:v8];
  uint64_t v10 = [v13 pairedPoster];

  if (v10)
  {
    uint64_t v11 = [MEMORY[0x1E4F1C0A8] insertNewObjectForEntityForName:@"CNContactPoster" inManagedObjectContext:v8];
    uint64_t v12 = [v13 pairedPoster];
    [v11 setupWithContactPoster:v12 pairedImage:v9 contactIdentifier:v7];

    [v9 setupWithContactImage:v13 pairedPoster:v11 contactIdentifier:v7];
  }
  else
  {
    [v9 setupWithContactImage:v13 contactIdentifier:v7];
  }
}

- (id)managedObjectsToContactImages:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[CNContactImageManagedObject managedObjectToContactImageTransform];
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