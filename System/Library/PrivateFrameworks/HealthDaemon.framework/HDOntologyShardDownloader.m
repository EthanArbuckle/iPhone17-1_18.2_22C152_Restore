@interface HDOntologyShardDownloader
- (HDOntologyShardDownloader)init;
- (HDOntologyShardDownloader)initWithOntologyUpdateCoordinator:(id)a3;
- (HDOntologyUpdateCoordinator)updateCoordinator;
- (id)_entriesToDownloadWithRequiredEntries:(uint64_t)a3 error:;
- (uint64_t)_persistStagedEntries:(uint64_t)a3 error:;
- (void)_downloadRequiredShardFilesWithSession:(void *)a3 requiredEntries:(void *)a4 completion:;
- (void)addOntologyShardDownloaderObserver:(id)a3 queue:(id)a4;
- (void)downloadRequiredShardFilesWithSession:(id)a3 completion:(id)a4;
- (void)downloadRequiredShardFilesWithSession:(id)a3 requiredEntries:(id)a4 completion:(id)a5;
- (void)removeOntologyShardDownloaderObserver:(id)a3;
@end

@implementation HDOntologyShardDownloader

- (HDOntologyShardDownloader)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDOntologyShardDownloader)initWithOntologyUpdateCoordinator:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HDOntologyShardDownloader;
  v5 = [(HDOntologyShardDownloader *)&v15 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_updateCoordinator, v4);
    uint64_t v7 = HKCreateSerialDispatchQueue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    id v9 = objc_alloc(MEMORY[0x1E4F2B2D0]);
    v10 = NSStringFromProtocol((Protocol *)&unk_1F183E6B8);
    v11 = HKLogHealthOntology();
    uint64_t v12 = [v9 initWithName:v10 loggingCategory:v11];
    ontologyShardDownloaderObservers = v6->_ontologyShardDownloaderObservers;
    v6->_ontologyShardDownloaderObservers = (HDOntologyShardDownloaderObserver *)v12;
  }
  return v6;
}

- (void)downloadRequiredShardFilesWithSession:(id)a3 completion:(id)a4
{
}

- (void)_downloadRequiredShardFilesWithSession:(void *)a3 requiredEntries:(void *)a4 completion:
{
  v41[3] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(void, void, void))v9;
  if (a1)
  {
    if (v8)
    {
      uint64_t v38 = 0;
      v11 = (id *)&v38;
      uint64_t v12 = -[HDOntologyShardDownloader _entriesToDownloadWithRequiredEntries:error:](a1, v8, (uint64_t)&v38);
    }
    else
    {
      v35 = (void (**)(void, void, void))v9;
      id v36 = v7;
      uint64_t v37 = 0;
      v32 = (void *)MEMORY[0x1E4F65D08];
      v34 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"desired_state" equalToValue:&unk_1F17EDD88];
      v41[0] = v34;
      v13 = [MEMORY[0x1E4F65D48] isNotNullPredicateWithProperty:@"available_url"];
      v41[1] = v13;
      v14 = (void *)MEMORY[0x1E4F65D08];
      objc_super v15 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"available_state" equalToValue:&unk_1F17EDDA0];
      v40[0] = v15;
      v16 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"available_state" equalToValue:&unk_1F17EDDB8];
      v40[1] = v16;
      v17 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"current_version" lessThanOrEqualToValue:&unk_1F17EDDD0];
      v40[2] = v17;
      v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:3];
      v19 = [v14 predicateMatchingAnyPredicates:v18];
      v41[2] = v19;
      v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:3];
      v33 = [v32 predicateMatchingAllPredicates:v20];

      v21 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:@"current_version" entityClass:objc_opt_class() ascending:1];
      v39[0] = v21;
      v22 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:@"desired_state_date" entityClass:objc_opt_class() ascending:0];
      v39[1] = v22;
      v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];

      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
      v25 = [WeakRetained shardRegistry];
      v26 = [v25 entriesWithPredicate:v33 orderingTerms:v23 error:&v37];

      if (v26)
      {
        uint64_t v12 = -[HDOntologyShardDownloader _entriesToDownloadWithRequiredEntries:error:](a1, v26, (uint64_t)&v37);
      }
      else
      {
        uint64_t v12 = 0;
      }

      v11 = (id *)&v37;
      v10 = v35;
      id v7 = v36;
    }
    id v27 = *v11;
    if (v12)
    {
      id v28 = v10;
      id v29 = v7;
      id v30 = v12;
      id v31 = [[_HDOntologyDownloadTask alloc] initForDownloader:a1 session:v29 queue:*(void *)(a1 + 8)];

      [v31 downloadShardsForEntries:v30 completion:v28];
    }
    else
    {
      ((void (**)(void, void, id))v10)[2](v10, 0, v27);
    }
  }
}

- (void)downloadRequiredShardFilesWithSession:(id)a3 requiredEntries:(id)a4 completion:(id)a5
{
}

- (id)_entriesToDownloadWithRequiredEntries:(uint64_t)a3 error:
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
  id v7 = [WeakRetained shardRegistry];
  id v8 = [v7 stagedShardFileEntriesWithError:a3];

  if (v8)
  {
    uint64_t v26 = a1;
    uint64_t v27 = a3;
    id v29 = v5;
    id v9 = v5;
    id v28 = v8;
    id v10 = v8;
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v12 = v9;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (!v13) {
      goto LABEL_16;
    }
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v33;
    while (1)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v33 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __94__HDOntologyShardDownloader__entriesToDownloadForRequiredEntries_existingStagedEntries_error___block_invoke;
        v31[3] = &unk_1E62F4A08;
        v31[4] = v17;
        if (objc_msgSend(v10, "hk_containsObjectPassingTest:", v31, v26, v27))
        {
          if ([v17 availableState] == 2) {
            continue;
          }
          id v18 = (id)[v17 copyWithAvailableState:2];
          v19 = v30;
        }
        else
        {
          id v18 = v17;
          if ([v18 availableState] == 2)
          {
            id v20 = v12;
            id v21 = v11;
            uint64_t v22 = [v18 copyWithAvailableState:1];

            [v30 addObject:v22];
            id v18 = (id)v22;
            id v11 = v21;
            id v12 = v20;
          }
          v19 = v11;
        }
        [v19 addObject:v18];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (!v14)
      {
LABEL_16:

        if (-[HDOntologyShardDownloader _persistStagedEntries:error:](v26, v30, v27)) {
          id v23 = v11;
        }
        else {
          id v23 = 0;
        }
        v24 = v11;
        id v5 = v29;

        id v8 = v28;
        goto LABEL_21;
      }
    }
  }
  id v23 = 0;
LABEL_21:

  return v23;
}

- (void)addOntologyShardDownloaderObserver:(id)a3 queue:(id)a4
{
}

- (void)removeOntologyShardDownloaderObserver:(id)a3
{
}

BOOL __94__HDOntologyShardDownloader__entriesToDownloadForRequiredEntries_existingStagedEntries_error___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v7 = [*(id *)(a1 + 32) identifier];
  id v8 = [v6 identifier];
  if (v7 != v8)
  {
    uint64_t v9 = [v6 identifier];
    if (!v9)
    {
      BOOL v15 = 0;
      goto LABEL_23;
    }
    v2 = (void *)v9;
    id v10 = [*(id *)(a1 + 32) identifier];
    v3 = [v6 identifier];
    if (![v10 isEqualToString:v3])
    {
      BOOL v15 = 0;
LABEL_22:

      goto LABEL_23;
    }
    id v20 = v3;
    id v21 = v10;
  }
  id v11 = [*(id *)(a1 + 32) schemaType];
  id v12 = [v6 schemaType];
  if (v11 == v12) {
    goto LABEL_10;
  }
  uint64_t v13 = [v6 schemaType];
  if (!v13) {
    goto LABEL_16;
  }
  id v4 = (void *)v13;
  uint64_t v14 = [*(id *)(a1 + 32) schemaType];
  v3 = [v6 schemaType];
  if ([v14 isEqualToString:v3])
  {
    v19 = v14;
LABEL_10:
    uint64_t v16 = [*(id *)(a1 + 32) schemaVersion];
    if (v16 == [v6 schemaVersion])
    {
      uint64_t v17 = [*(id *)(a1 + 32) availableVersion];
      BOOL v15 = v17 == [v6 availableVersion];
      uint64_t v14 = v19;
      if (v11 == v12) {
        goto LABEL_20;
      }
      goto LABEL_18;
    }
    if (v11 == v12)
    {
      BOOL v15 = 0;
      goto LABEL_20;
    }

LABEL_16:
    BOOL v15 = 0;
    goto LABEL_21;
  }
  BOOL v15 = 0;
LABEL_18:

LABEL_20:
LABEL_21:
  v3 = v20;
  id v10 = v21;
  if (v7 != v8) {
    goto LABEL_22;
  }
LABEL_23:

  return v15;
}

- (uint64_t)_persistStagedEntries:(uint64_t)a3 error:
{
  id v5 = a2;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
    id v7 = [WeakRetained shardRegistry];
    int v8 = [v7 insertEntries:v5 error:a3];

    if (v8)
    {
      id v9 = v5;
      id v10 = *(void **)(a1 + 16);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __72__HDOntologyShardDownloader__notifyDownloadObserversAboutStagedEntries___block_invoke;
      v13[3] = &unk_1E63030D8;
      id v11 = v9;
      id v14 = v11;
      uint64_t v15 = a1;
      [v10 notifyObservers:v13];

      a1 = 1;
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

void __72__HDOntologyShardDownloader__notifyDownloadObserversAboutStagedEntries___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "ontologyShardDownloader:didStageEntry:", *(void *)(a1 + 40), *(void *)(*((void *)&v9 + 1) + 8 * v8++), (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (HDOntologyUpdateCoordinator)updateCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_updateCoordinator);

  return (HDOntologyUpdateCoordinator *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_updateCoordinator);
  objc_storeStrong((id *)&self->_ontologyShardDownloaderObservers, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end