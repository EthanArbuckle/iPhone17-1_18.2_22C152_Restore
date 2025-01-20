@interface PHPersistentChangeFetchResult
+ (PHPersistentChangeFetchResult)fetchResultWithToken:(id)a3 options:(id)a4 photoLibrary:(id)a5 error:(id *)a6;
- (PHPersistentChangeFetchResult)initWithTransactions:(id)a3 options:(id)a4 photoLibrary:(id)a5;
- (id)_managedObjectContext;
- (id)iteratorForPersistentChangeEnumeration;
- (id)nextPersistentChangeWithIterator:(id)a3;
- (unint64_t)changeCount;
- (void)enumerateChangesWithBlock:(void *)block;
- (void)enumeratePHChangesWithBlock:(id)a3;
@end

@implementation PHPersistentChangeFetchResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enumerationContext, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_library, 0);

  objc_storeStrong((id *)&self->_transactions, 0);
}

- (unint64_t)changeCount
{
  return self->_changeCount;
}

- (void)enumeratePHChangesWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F8AA00]);
  transactions = self->_transactions;
  v7 = [(PHPersistentChangeFetchResult *)self _managedObjectContext];
  v8 = (void *)[v5 initWithTransactions:transactions managedObjectObjectContext:v7];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__PHPersistentChangeFetchResult_enumeratePHChangesWithBlock___block_invoke;
  v11[3] = &unk_1E58435F0;
  id v12 = v8;
  v13 = self;
  id v14 = v4;
  id v9 = v4;
  id v10 = v8;
  [v10 enumerateRemainingTransactionsWithBlock:v11];
}

void __61__PHPersistentChangeFetchResult_enumeratePHChangesWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy__11023;
  v10[4] = __Block_byref_object_dispose__11024;
  id v11 = 0;
  id v4 = [*(id *)(a1 + 32) context];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__PHPersistentChangeFetchResult_enumeratePHChangesWithBlock___block_invoke_2;
  v7[3] = &unk_1E5848318;
  uint64_t v5 = *(void *)(a1 + 40);
  id v9 = v10;
  v7[4] = v5;
  id v6 = v3;
  id v8 = v6;
  [v4 performBlockAndWait:v7];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  _Block_object_dispose(v10, 8);
}

void __61__PHPersistentChangeFetchResult_enumeratePHChangesWithBlock___block_invoke_2(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _managedObjectContext];
  uint64_t v2 = +[PHChangeBuilder changeWithManagedObjectContext:v5 library:*(void *)(*(void *)(a1 + 32) + 16) options:*(void *)(*(void *)(a1 + 32) + 24) transaction:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)nextPersistentChangeWithIterator:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__11023;
  v17 = __Block_byref_object_dispose__11024;
  id v18 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__PHPersistentChangeFetchResult_nextPersistentChangeWithIterator___block_invoke;
  v9[3] = &unk_1E58435C8;
  id v5 = v4;
  id v11 = self;
  id v12 = &v13;
  id v10 = v5;
  if ([v5 enumerateOneTransactionWithBlock:v9])
  {
    id v6 = (void *)v14[5];
    v14[5] = 0;
  }
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v7;
}

void __66__PHPersistentChangeFetchResult_nextPersistentChangeWithIterator___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) context];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__PHPersistentChangeFetchResult_nextPersistentChangeWithIterator___block_invoke_2;
  v9[3] = &unk_1E58480A0;
  id v5 = *(id *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v10 = v5;
  uint64_t v11 = v7;
  id v12 = v3;
  uint64_t v13 = v6;
  id v8 = v3;
  [v4 performBlockAndWait:v9];
}

void __66__PHPersistentChangeFetchResult_nextPersistentChangeWithIterator___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) userInfo];
  id v7 = [v2 objectForKeyedSubscript:@"PHPersistentChangeEnumerationContext"];

  id v3 = [*(id *)(a1 + 40) _managedObjectContext];
  uint64_t v4 = +[PHChangeBuilder persistentChangeWithManagedObjectContext:v3 library:*(void *)(*(void *)(a1 + 40) + 16) options:*(void *)(*(void *)(a1 + 40) + 24) transaction:*(void *)(a1 + 48) enumerationContext:v7];
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)iteratorForPersistentChangeEnumeration
{
  id v3 = objc_alloc(MEMORY[0x1E4F8AA00]);
  transactions = self->_transactions;
  uint64_t v5 = [(PHPersistentChangeFetchResult *)self _managedObjectContext];
  uint64_t v6 = (void *)[v3 initWithTransactions:transactions managedObjectObjectContext:v5];

  id v7 = objc_alloc_init(PHPersistentChangeEnumerationContext);
  id v8 = [MEMORY[0x1E4F1CA60] dictionaryWithObject:v7 forKey:@"PHPersistentChangeEnumerationContext"];
  [v6 setUserInfo:v8];

  return v6;
}

- (void)enumerateChangesWithBlock:(void *)block
{
  uint64_t v4 = block;
  id v5 = objc_alloc(MEMORY[0x1E4F8AA00]);
  transactions = self->_transactions;
  id v7 = [(PHPersistentChangeFetchResult *)self _managedObjectContext];
  id v8 = (void *)[v5 initWithTransactions:transactions managedObjectObjectContext:v7];

  id v9 = objc_alloc_init(PHPersistentChangeEnumerationContext);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__PHPersistentChangeFetchResult_enumerateChangesWithBlock___block_invoke;
  v13[3] = &unk_1E58435A0;
  id v14 = v8;
  uint64_t v15 = self;
  v16 = v9;
  id v17 = v4;
  id v10 = v4;
  uint64_t v11 = v9;
  id v12 = v8;
  [v12 enumerateRemainingTransactionsWithBlock:v13];
}

void __59__PHPersistentChangeFetchResult_enumerateChangesWithBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__11023;
  v19 = __Block_byref_object_dispose__11024;
  id v20 = 0;
  uint64_t v6 = [*(id *)(a1 + 32) context];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__PHPersistentChangeFetchResult_enumerateChangesWithBlock___block_invoke_37;
  v11[3] = &unk_1E58480A0;
  uint64_t v7 = *(void *)(a1 + 40);
  id v14 = &v15;
  void v11[4] = v7;
  id v8 = v5;
  id v12 = v8;
  id v13 = *(id *)(a1 + 48);
  [v6 performBlockAndWait:v11];

  (*(void (**)(void, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v16[5], a3, v9, v10);
  _Block_object_dispose(&v15, 8);
}

void __59__PHPersistentChangeFetchResult_enumerateChangesWithBlock___block_invoke_37(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _managedObjectContext];
  uint64_t v2 = +[PHChangeBuilder persistentChangeWithManagedObjectContext:v5 library:*(void *)(*(void *)(a1 + 32) + 16) options:*(void *)(*(void *)(a1 + 32) + 24) transaction:*(void *)(a1 + 40) enumerationContext:*(void *)(a1 + 48)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_managedObjectContext
{
  uint64_t v2 = [(PHPhotoLibrary *)self->_library changeHandlingPhotoLibrary];
  uint64_t v3 = [v2 managedObjectContext];

  return v3;
}

- (PHPersistentChangeFetchResult)initWithTransactions:(id)a3 options:(id)a4 photoLibrary:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)PHPersistentChangeFetchResult;
  uint64_t v11 = [(PHPersistentChangeFetchResult *)&v21 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_library, a5);
    objc_storeStrong((id *)&v12->_options, a4);
    id v13 = [(PHPhotoLibrary *)v12->_library changeHandlingPhotoLibrary];
    id v14 = [v13 managedObjectContext];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __75__PHPersistentChangeFetchResult_initWithTransactions_options_photoLibrary___block_invoke;
    v18[3] = &unk_1E5848DF0;
    uint64_t v15 = v12;
    v19 = v15;
    id v20 = v8;
    [v14 performBlockAndWait:v18];

    v16 = v15;
  }

  return v12;
}

uint64_t __75__PHPersistentChangeFetchResult_initWithTransactions_options_photoLibrary___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) count];
  *(void *)(*(void *)(a1 + 32) + 40) = result;
  return result;
}

+ (PHPersistentChangeFetchResult)fetchResultWithToken:(id)a3 options:(id)a4 photoLibrary:(id)a5 error:(id *)a6
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = [a3 persistentHistoryToken];
  id v13 = [MEMORY[0x1E4F8A9F8] markerWithToken:v12];
  id v14 = [v11 changeHandlingPhotoLibrary];
  uint64_t v15 = [v14 managedObjectContext];

  if (!v15)
  {
    id v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v30 = *MEMORY[0x1E4F28228];
    v31 = @"Failed to access library";
    objc_super v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    v22 = objc_msgSend(v20, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3109, v21);

    id v23 = v22;
LABEL_15:
    if (a6)
    {
      id v23 = v23;
      id v18 = 0;
      *a6 = v23;
    }
    else
    {
      id v18 = 0;
    }
    goto LABEL_18;
  }
  id v29 = 0;
  v16 = [MEMORY[0x1E4F8AA08] fetchTransactionsSinceMarker:v13 withFetchRequest:0 batchSize:100 context:v15 error:&v29];
  id v17 = v29;
  if (v16)
  {
    id v18 = (void *)[objc_alloc((Class)a1) initWithTransactions:v16 options:v10 photoLibrary:v11];
    v19 = 0;
  }
  else
  {
    if (PLIsErrorEqualToCode())
    {
      v24 = 0;
      uint64_t v25 = 3105;
    }
    else
    {
      if (v17)
      {
        uint64_t v32 = *MEMORY[0x1E4F28A50];
        v33[0] = v17;
        v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
      }
      else
      {
        v26 = PLPhotoKitGetLog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v28 = 0;
          _os_log_impl(&dword_19B043000, v26, OS_LOG_TYPE_FAULT, "Missing fetch error in return from +[PLPersistentHistoryUtilities fetchTransactionsSinceMarker:withFetchRequest:batchSize:context:error:]", v28, 2u);
        }

        v24 = 0;
      }
      uint64_t v25 = -1;
    }
    v19 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", v25, v24);

    id v18 = 0;
  }

  id v23 = v19;
  if (!v18) {
    goto LABEL_15;
  }
LABEL_18:

  return (PHPersistentChangeFetchResult *)v18;
}

@end