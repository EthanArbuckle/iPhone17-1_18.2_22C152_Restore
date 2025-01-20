@interface HDDiagnosticStoreServer
+ (id)taskIdentifier;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)remote_fetchDiagnosticsWithKeys:(id)a3 completion:(id)a4;
- (void)remote_fetchSQLPragma:(int64_t)a3 completion:(id)a4;
- (void)remote_fetchURLForAnalyticsFileWithName:(id)a3 completion:(id)a4;
@end

@implementation HDDiagnosticStoreServer

- (void)remote_fetchDiagnosticsWithKeys:(id)a3 completion:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F65CF8];
  id v7 = a4;
  id v8 = a3;
  id v10 = [v6 sharedDiagnosticManager];
  v9 = [v10 diagnosticsForKeys:v8];

  (*((void (**)(id, void *, void))a4 + 2))(v7, v9, 0);
}

- (void)remote_fetchURLForAnalyticsFileWithName:(id)a3 completion:(id)a4
{
  v6 = (objc_class *)MEMORY[0x1E4F65CC0];
  id v7 = (void (**)(id, void *, void))a4;
  id v8 = a3;
  id v9 = [v6 alloc];
  id v10 = [(HDStandardTaskServer *)self profile];
  id v12 = (id)[v9 initWithProfile:v10];

  v11 = [v12 URLForAnalyticsFileWithName:v8];

  v7[2](v7, v11, 0);
}

- (void)remote_fetchSQLPragma:(int64_t)a3 completion:(id)a4
{
  v6 = (void (**)(id, void, void *))a4;
  if ((unint64_t)a3 >= 3)
  {
    v13 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 3, @"Unsupported PRAGMA");
    v6[2](v6, 0, v13);
  }
  else
  {
    id v7 = off_1E6303C30[a3];
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__120;
    v29 = __Block_byref_object_dispose__120;
    id v30 = 0;
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__120;
    v23 = __Block_byref_object_dispose__120;
    id v24 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __60__HDDiagnosticStoreServer_remote_fetchSQLPragma_completion___block_invoke;
    aBlock[3] = &unk_1E6303C10;
    v16 = v7;
    v17 = &v19;
    v18 = &v25;
    id v8 = _Block_copy(aBlock);
    id v9 = [(HDStandardTaskServer *)self profile];
    id v10 = [v9 database];
    v11 = +[HDDatabaseTransactionContext contextForReadingProtectedData];
    id v12 = (id *)(v20 + 5);
    id obj = (id)v20[5];
    [v10 performTransactionWithContext:v11 error:&obj block:v8 inaccessibilityHandler:0];
    objc_storeStrong(v12, obj);

    v6[2](v6, v26[5], (void *)v20[5]);
    _Block_object_dispose(&v19, 8);

    _Block_object_dispose(&v25, 8);
  }
}

uint64_t __60__HDDiagnosticStoreServer_remote_fetchSQLPragma_completion___block_invoke(void *a1, void *a2)
{
  v3 = [a2 protectedDatabase];
  uint64_t v4 = a1[4];
  uint64_t v5 = *(void *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__HDDiagnosticStoreServer_remote_fetchSQLPragma_completion___block_invoke_3;
  v9[3] = &unk_1E62F3640;
  v9[4] = a1[6];
  id obj = v6;
  uint64_t v7 = [v3 executeSQL:v4 error:&obj bindingHandler:&__block_literal_global_142 enumerationHandler:v9];
  objc_storeStrong((id *)(v5 + 40), obj);

  return v7;
}

uint64_t __60__HDDiagnosticStoreServer_remote_fetchSQLPragma_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = MEMORY[0x1C1879F80](a2, 0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 1;
}

- (id)exportedInterface
{
  return (id)MEMORY[0x1F40E7C50](self, a2);
}

- (id)remoteInterface
{
  return (id)MEMORY[0x1F40E7C48](self, a2);
}

+ (id)taskIdentifier
{
  return (id)[MEMORY[0x1E4F2AF40] taskIdentifier];
}

@end