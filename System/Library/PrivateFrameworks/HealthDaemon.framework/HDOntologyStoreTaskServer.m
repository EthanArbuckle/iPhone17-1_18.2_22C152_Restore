@interface HDOntologyStoreTaskServer
+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7;
+ (id)taskIdentifier;
- (id)exportedInterface;
- (id)remoteInterface;
- (id)updateCoordinator;
- (void)ontologyShardDownloader:(id)a3 didStageEntry:(id)a4;
- (void)ontologyShardImporter:(id)a3 didImportEntry:(id)a4;
- (void)remote_downloadRequiredShardsWithCompletion:(id)a3;
- (void)remote_importRequiredShardsWithCompletion:(id)a3;
- (void)remote_insertEntries:(id)a3 completion:(id)a4;
- (void)remote_markShardsWithIdentifiers:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)remote_observeOntologyStoreChanges:(BOOL)a3 completion:(id)a4;
- (void)remote_ontologyServerURLWithCompletion:(id)a3;
- (void)remote_ontologyShardRegistryEntriesWithCompletion:(id)a3;
- (void)remote_pruneOntologyWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)remote_requestGatedOntologyUpdateWithCompletion:(id)a3;
- (void)remote_setOntologyServerURL:(id)a3 completion:(id)a4;
- (void)remote_shardRequirementStatusesWithCompletion:(id)a3;
- (void)remote_updateOntologyForReason:(int64_t)a3 completion:(id)a4;
- (void)remote_updateShardRegistryWithCompletion:(id)a3;
@end

@implementation HDOntologyStoreTaskServer

+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = [v13 profile];
  v16 = [v15 daemon];
  v17 = [v16 behavior];
  char v18 = [v17 supportsOntology];

  if (v18)
  {
    v19 = [(HDStandardTaskServer *)[HDOntologyStoreTaskServer alloc] initWithUUID:v11 configuration:v12 client:v13 delegate:v14];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a7, 110, @"Device does not support health ontology");
    v19 = 0;
  }

  return v19;
}

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x1E4F2A300];
}

- (id)remoteInterface
{
  return (id)[MEMORY[0x1E4F2B300] clientInterface];
}

- (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F2B300] serverInterface];
}

- (void)remote_insertEntries:(id)a3 completion:(id)a4
{
  v6 = (void (**)(id, uint64_t, id))a4;
  id v7 = a3;
  v8 = -[HDOntologyStoreTaskServer updateCoordinator](self);
  v9 = [v8 shardRegistry];
  id v12 = 0;
  uint64_t v10 = [v9 insertEntries:v7 error:&v12];

  id v11 = v12;
  v6[2](v6, v10, v11);
}

- (id)updateCoordinator
{
  if (a1)
  {
    v1 = [a1 profile];
    v2 = [v1 daemon];
    v3 = [v2 ontologyUpdateCoordinator];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)remote_ontologyShardRegistryEntriesWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *, id))a3;
  v5 = -[HDOntologyStoreTaskServer updateCoordinator](self);
  v6 = [v5 shardRegistry];
  id v9 = 0;
  id v7 = [v6 entriesWithPredicate:0 orderingTerms:0 error:&v9];
  id v8 = v9;

  v4[2](v4, v7, v8);
}

- (void)remote_ontologyServerURLWithCompletion:(id)a3
{
  v4 = (void (**)(id, id, void))a3;
  v5 = -[HDOntologyStoreTaskServer updateCoordinator](self);
  id v6 = [v5 ontologyServerURL];

  v4[2](v4, v6, 0);
}

- (void)remote_setOntologyServerURL:(id)a3 completion:(id)a4
{
  id v8 = (void (**)(id, uint64_t, void))a4;
  id v6 = a3;
  id v7 = -[HDOntologyStoreTaskServer updateCoordinator](self);
  [v7 setOntologyServerURL:v6];

  v8[2](v8, 1, 0);
}

- (void)remote_updateShardRegistryWithCompletion:(id)a3
{
  id v4 = a3;
  -[HDOntologyStoreTaskServer updateCoordinator](self);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 updateShardRegistryWithCompletion:v4];
}

- (void)remote_downloadRequiredShardsWithCompletion:(id)a3
{
  id v4 = a3;
  -[HDOntologyStoreTaskServer updateCoordinator](self);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 downloadRequiredShardsWithCompletion:v4];
}

- (void)remote_importRequiredShardsWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t, id))a3;
  id v5 = -[HDOntologyStoreTaskServer updateCoordinator](self);
  id v6 = [v5 importer];
  id v9 = 0;
  uint64_t v7 = [v6 importStagedShardFilesWithError:&v9];
  id v8 = v9;

  v4[2](v4, v7, v8);
}

- (void)remote_updateOntologyForReason:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  -[HDOntologyStoreTaskServer updateCoordinator](self);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 updateOntologyWithReason:a3 completion:v6];
}

- (void)remote_requestGatedOntologyUpdateWithCompletion:(id)a3
{
  id v4 = a3;
  -[HDOntologyStoreTaskServer updateCoordinator](self);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 triggerGatedUpdateWithMaximumDelay:v4 completion:1.0];
}

- (void)remote_pruneOntologyWithOptions:(unint64_t)a3 completion:(id)a4
{
  id v6 = (void (**)(id, uint64_t, id))a4;
  id v7 = -[HDOntologyStoreTaskServer updateCoordinator](self);
  id v8 = [v7 pruner];
  id v11 = 0;
  uint64_t v9 = [v8 pruneOntologyWithOptions:a3 error:&v11];
  id v10 = v11;

  v6[2](v6, v9, v10);
}

- (void)remote_markShardsWithIdentifiers:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8 = (void (**)(id, uint64_t, id))a5;
  id v9 = a3;
  id v10 = -[HDOntologyStoreTaskServer updateCoordinator](self);
  id v11 = [v10 featureCoordinator];
  id v14 = 0;
  uint64_t v12 = [v11 markShardsWithIdentifiers:v9 options:a4 error:&v14];

  id v13 = v14;
  v8[2](v8, v12, v13);
}

- (void)remote_shardRequirementStatusesWithCompletion:(id)a3
{
  id v5 = a3;
  -[HDOntologyStoreTaskServer updateCoordinator](self);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [v8 featureCoordinator];
  id v7 = [v6 shardRequirementStatuses];
  (*((void (**)(id, void *, void))a3 + 2))(v5, v7, 0);
}

- (void)remote_observeOntologyStoreChanges:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(id, uint64_t, void))a4;
  id v7 = -[HDOntologyStoreTaskServer updateCoordinator](self);
  id v10 = [v7 downloader];

  id v8 = -[HDOntologyStoreTaskServer updateCoordinator](self);
  id v9 = [v8 importer];

  if (v4)
  {
    [v10 addOntologyShardDownloaderObserver:self queue:0];
    [v9 addOntologyShardImporterObserver:self queue:0];
  }
  else
  {
    [v10 removeOntologyShardDownloaderObserver:self];
    [v9 removeOntologyShardImporterObserver:self];
  }
  v6[2](v6, 1, 0);
}

- (void)ontologyShardDownloader:(id)a3 didStageEntry:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __67__HDOntologyStoreTaskServer_ontologyShardDownloader_didStageEntry___block_invoke;
  id v14 = &unk_1E62F91D0;
  v15 = self;
  id v6 = v5;
  id v16 = v6;
  id v7 = [(HDStandardTaskServer *)self remoteObjectProxyWithErrorHandler:&v11];
  _HKInitializeLogging();
  id v8 = HKLogHealthOntology();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);

  if (v9)
  {
    id v10 = HKLogHealthOntology();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      char v18 = self;
      __int16 v19 = 2114;
      id v20 = v6;
      _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_INFO, "%{public}@: Notify client for staged entry %{public}@", buf, 0x16u);
    }
  }
  objc_msgSend(v7, "client_didStageEntry:", v6, v11, v12, v13, v14, v15);
}

void __67__HDOntologyStoreTaskServer_ontologyShardDownloader_didStageEntry___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  BOOL v4 = HKLogHealthOntology();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 138543874;
    uint64_t v8 = v5;
    __int16 v9 = 2114;
    uint64_t v10 = v6;
    __int16 v11 = 2114;
    id v12 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Unable to notify client for staged entry %{public}@: %{public}@", (uint8_t *)&v7, 0x20u);
  }
}

- (void)ontologyShardImporter:(id)a3 didImportEntry:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __66__HDOntologyStoreTaskServer_ontologyShardImporter_didImportEntry___block_invoke;
  id v14 = &unk_1E62F91D0;
  v15 = self;
  id v6 = v5;
  id v16 = v6;
  int v7 = [(HDStandardTaskServer *)self remoteObjectProxyWithErrorHandler:&v11];
  _HKInitializeLogging();
  uint64_t v8 = HKLogHealthOntology();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);

  if (v9)
  {
    uint64_t v10 = HKLogHealthOntology();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      char v18 = self;
      __int16 v19 = 2114;
      id v20 = v6;
      _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_INFO, "%{public}@: Notify client for imported entry %{public}@", buf, 0x16u);
    }
  }
  objc_msgSend(v7, "client_didImportEntry:", v6, v11, v12, v13, v14, v15);
}

void __66__HDOntologyStoreTaskServer_ontologyShardImporter_didImportEntry___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  BOOL v4 = HKLogHealthOntology();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 138543874;
    uint64_t v8 = v5;
    __int16 v9 = 2114;
    uint64_t v10 = v6;
    __int16 v11 = 2114;
    id v12 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Unable to notify client for imported entry %{public}@: %{public}@", (uint8_t *)&v7, 0x20u);
  }
}

@end