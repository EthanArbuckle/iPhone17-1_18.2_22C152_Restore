@interface HDDatabaseValidationTaskServer
+ (id)taskIdentifier;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)remote_validateDatabase:(int64_t)a3 clientCompletionHandler:(id)a4 errorHandlerIdentifier:(id)a5;
- (void)remote_validateEntitiesWithClientCompletionHandler:(id)a3 errorHandlerIdentifier:(id)a4;
@end

@implementation HDDatabaseValidationTaskServer

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x1E4F29988];
}

- (void)remote_validateDatabase:(int64_t)a3 clientCompletionHandler:(id)a4 errorHandlerIdentifier:(id)a5
{
  id v8 = a5;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __105__HDDatabaseValidationTaskServer_remote_validateDatabase_clientCompletionHandler_errorHandlerIdentifier___block_invoke;
  v23[3] = &unk_1E62F3170;
  v23[4] = self;
  id v9 = a4;
  v10 = [(HDStandardTaskServer *)self remoteObjectProxyWithErrorHandler:v23];
  v11 = [(HDStandardTaskServer *)self profile];
  v12 = [v11 database];
  v13 = +[HDDatabaseTransactionContext contextForReadingProtectedData];
  int64_t v21 = a3;
  id v22 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __105__HDDatabaseValidationTaskServer_remote_validateDatabase_clientCompletionHandler_errorHandlerIdentifier___block_invoke_278;
  v18[3] = &unk_1E62F4200;
  id v19 = v10;
  id v20 = v8;
  id v14 = v8;
  id v15 = v10;
  uint64_t v16 = [v12 performTransactionWithContext:v13 error:&v22 block:v18 inaccessibilityHandler:0];
  id v17 = v22;

  objc_msgSend(v15, "clientRemote_synchronizeWithCompletion:success:error:", v9, v16, v17);
}

void __105__HDDatabaseValidationTaskServer_remote_validateDatabase_clientCompletionHandler_errorHandlerIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x1E4F29F18];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = v4;
    v7 = HKSensitiveLogItem();
    int v8 = 138543618;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    v11 = v7;
    _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Failed to call HKDatabaseValidationClient clientRemote_processIntegrityErrorString, with error: %{public}@", (uint8_t *)&v8, 0x16u);
  }
}

uint64_t __105__HDDatabaseValidationTaskServer_remote_validateDatabase_clientCompletionHandler_errorHandlerIdentifier___block_invoke_278(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = [v5 unprotectedDatabase];
  uint64_t v7 = *MEMORY[0x1E4F2AA58];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __105__HDDatabaseValidationTaskServer_remote_validateDatabase_clientCompletionHandler_errorHandlerIdentifier___block_invoke_2;
  v15[3] = &unk_1E62F91A8;
  id v16 = *(id *)(a1 + 32);
  id v17 = *(id *)(a1 + 40);
  uint64_t v8 = [v6 performIntegrityCheckOnDatabase:v7 error:a3 integrityErrorHandler:v15];

  if (*(void *)(a1 + 48) && v8)
  {
    uint64_t v9 = [v5 protectedDatabase];
    uint64_t v10 = *MEMORY[0x1E4F2A590];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __105__HDDatabaseValidationTaskServer_remote_validateDatabase_clientCompletionHandler_errorHandlerIdentifier___block_invoke_280;
    v12[3] = &unk_1E62F91A8;
    id v13 = *(id *)(a1 + 32);
    id v14 = *(id *)(a1 + 40);
    uint64_t v8 = [v9 performIntegrityCheckOnDatabase:v10 error:a3 integrityErrorHandler:v12];
  }
  return v8;
}

void __105__HDDatabaseValidationTaskServer_remote_validateDatabase_clientCompletionHandler_errorHandlerIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E4F29F18];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "Integrity issues in unprotected database: %{public}@.", (uint8_t *)&v5, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "clientRemote_processIntegrityErrorString:errorHandlerIdentifier:", v3, *(void *)(a1 + 40));
}

void __105__HDDatabaseValidationTaskServer_remote_validateDatabase_clientCompletionHandler_errorHandlerIdentifier___block_invoke_280(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E4F29F18];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "Integrity issues in protected database: %{public}@.", (uint8_t *)&v5, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "clientRemote_processIntegrityErrorString:errorHandlerIdentifier:", v3, *(void *)(a1 + 40));
}

- (void)remote_validateEntitiesWithClientCompletionHandler:(id)a3 errorHandlerIdentifier:(id)a4
{
  id v6 = a4;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __108__HDDatabaseValidationTaskServer_remote_validateEntitiesWithClientCompletionHandler_errorHandlerIdentifier___block_invoke;
  v20[3] = &unk_1E62F3170;
  v20[4] = self;
  id v7 = a3;
  uint64_t v8 = [(HDStandardTaskServer *)self remoteObjectProxyWithErrorHandler:v20];
  uint64_t v9 = [(HDStandardTaskServer *)self profile];
  uint64_t v10 = [v9 database];
  v11 = +[HDDatabaseTransactionContext contextForReadingProtectedData];
  id v18 = v6;
  id v19 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __108__HDDatabaseValidationTaskServer_remote_validateEntitiesWithClientCompletionHandler_errorHandlerIdentifier___block_invoke_282;
  v16[3] = &unk_1E62F5A88;
  v16[4] = self;
  id v17 = v8;
  id v12 = v6;
  id v13 = v8;
  uint64_t v14 = [v10 performTransactionWithContext:v11 error:&v19 block:v16 inaccessibilityHandler:0];
  id v15 = v19;

  objc_msgSend(v13, "clientRemote_synchronizeWithCompletion:success:error:", v7, v14, v15);
}

void __108__HDDatabaseValidationTaskServer_remote_validateEntitiesWithClientCompletionHandler_errorHandlerIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x1E4F29F18];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = v4;
    id v7 = HKSensitiveLogItem();
    int v8 = 138543618;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    v11 = v7;
    _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Failed to call HKDatabaseValidationClient clientRemote_processValidationError, with error: %{public}@", (uint8_t *)&v8, 0x16u);
  }
}

uint64_t __108__HDDatabaseValidationTaskServer_remote_validateEntitiesWithClientCompletionHandler_errorHandlerIdentifier___block_invoke_282(id *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  +[HDDatabase allCurrentAndFutureEntityClasses];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        __int16 v10 = objc_opt_class();
        if ([v10 isSubclassOfClass:objc_opt_class()])
        {
          v11 = objc_opt_class();
          uint64_t v12 = [a1[4] profile];
          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          v16[2] = __108__HDDatabaseValidationTaskServer_remote_validateEntitiesWithClientCompletionHandler_errorHandlerIdentifier___block_invoke_2;
          v16[3] = &unk_1E62F91D0;
          id v17 = a1[5];
          id v18 = a1[6];
          [v11 validateEntityWithProfile:v12 error:a3 validationErrorHandler:v16];

          uint64_t v13 = *a3;
          if (v13)
          {
            uint64_t v14 = 0;
            goto LABEL_12;
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  uint64_t v14 = 1;
LABEL_12:

  return v14;
}

void __108__HDDatabaseValidationTaskServer_remote_validateEntitiesWithClientCompletionHandler_errorHandlerIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 userInfo];
  id v5 = [v4 objectForKey:*MEMORY[0x1E4F28A50]];
  uint64_t v6 = NSString;
  uint64_t v7 = [v4 objectForKey:*MEMORY[0x1E4F29B38]];
  uint64_t v8 = [v5 localizedDescription];
  uint64_t v9 = [v4 objectForKey:*MEMORY[0x1E4F29B40]];
  __int16 v10 = [v4 objectForKey:*MEMORY[0x1E4F29B30]];
  v11 = [v4 objectForKey:*MEMORY[0x1E4F29B48]];
  uint64_t v12 = [v6 stringWithFormat:@"%@ %@ %@ %@ (%@)", v7, v8, v9, v10, v11];

  _HKInitializeLogging();
  uint64_t v13 = *MEMORY[0x1E4F29F18];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v15 = v12;
    _os_log_error_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_ERROR, "%{public}@.", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "clientRemote_processValidationError:errorHandlerIdentifier:", v3, *(void *)(a1 + 40));
}

- (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F2AED8] serverInterface];
}

- (id)remoteInterface
{
  return (id)[MEMORY[0x1E4F2AED8] clientInterface];
}

@end