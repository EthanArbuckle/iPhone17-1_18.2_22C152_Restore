@interface HDConceptStoreTaskServer
+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5;
+ (Class)configurationClass;
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)conceptIndexManagerDidChangeExecutionState:(unint64_t)a3;
- (void)connectionInvalidated;
- (void)remote_currentIndexingState:(id)a3;
- (void)remote_queryConceptByIdentifier:(id)a3 loadRelationships:(BOOL)a4 completion:(id)a5;
- (void)remote_queryCountOfConceptsAssociatedToUserRecordsWithCompletion:(id)a3;
- (void)remote_queryRelationshipsForNodeWithID:(id)a3 completion:(id)a4;
- (void)remote_startObservingConceptIndexManagerWithCompletion:(id)a3;
@end

@implementation HDConceptStoreTaskServer

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x1E4F29610];
}

+ (id)requiredEntitlements
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = *MEMORY[0x1E4F2A548];
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

- (id)remoteInterface
{
  return (id)[MEMORY[0x1E4F2AE08] clientInterface];
}

- (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F2AE08] serverInterface];
}

- (void)connectionInvalidated
{
  id v4 = [(HDStandardTaskServer *)self profile];
  v3 = [v4 conceptIndexManager];
  [v3 removeObserver:self];
}

- (void)remote_startObservingConceptIndexManagerWithCompletion:(id)a3
{
  v6 = (void (**)(id, uint64_t, void))a3;
  id v4 = [(HDStandardTaskServer *)self profile];
  v5 = [v4 conceptIndexManager];
  [v5 addObserver:self];

  v6[2](v6, 1, 0);
}

- (void)remote_currentIndexingState:(id)a3
{
  v7 = (void (**)(id, uint64_t))a3;
  id v4 = [(HDStandardTaskServer *)self profile];
  v5 = [v4 conceptIndexManager];

  if (v5) {
    uint64_t v6 = [v5 currentExecutionState];
  }
  else {
    uint64_t v6 = 0;
  }
  v7[2](v7, v6);
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  return 1;
}

- (void)remote_queryConceptByIdentifier:(id)a3 loadRelationships:(BOOL)a4 completion:(id)a5
{
  BOOL v7 = a4;
  v8 = (void (**)(id, void *, id))a5;
  id v9 = a3;
  v10 = [(HDStandardTaskServer *)self profile];
  v11 = [v10 ontologyConceptManager];

  id v14 = 0;
  v12 = [v11 conceptForIdentifier:v9 options:v7 error:&v14];

  id v13 = v14;
  v8[2](v8, v12, v13);
}

- (void)remote_queryRelationshipsForNodeWithID:(id)a3 completion:(id)a4
{
  uint64_t v6 = (void (**)(id, void *, id))a4;
  id v7 = a3;
  v8 = [(HDStandardTaskServer *)self profile];
  id v11 = 0;
  id v9 = +[HDOntologyConceptManager relationshipsForConceptWithIdentifier:v7 profile:v8 error:&v11];

  id v10 = v11;
  v6[2](v6, v9, v10);
}

- (void)remote_queryCountOfConceptsAssociatedToUserRecordsWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *, id))a3;
  v5 = [(HDStandardTaskServer *)self profile];
  id v8 = 0;
  uint64_t v6 = +[HDConceptIndexEntity numberOfIndexedConceptsWithProfile:v5 error:&v8];
  id v7 = v8;

  v4[2](v4, v6, v7);
}

- (void)conceptIndexManagerDidChangeExecutionState:(unint64_t)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __71__HDConceptStoreTaskServer_conceptIndexManagerDidChangeExecutionState___block_invoke;
  v5[3] = &unk_1E62F3170;
  v5[4] = self;
  id v4 = [(HDStandardTaskServer *)self remoteObjectProxyWithErrorHandler:v5];
  objc_msgSend(v4, "clientRemote_conceptIndexManagerDidChangeState:", a3);
}

void __71__HDConceptStoreTaskServer_conceptIndexManagerDidChangeExecutionState___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = v4;
    id v7 = HKSensitiveLogItem();
    int v8 = 138543618;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    id v11 = v7;
    _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Failed to call HKOntologyTaskServerClient clientRemote_conceptIndexManagerDidChangeState: with error: %{public}@", (uint8_t *)&v8, 0x16u);
  }
}

@end