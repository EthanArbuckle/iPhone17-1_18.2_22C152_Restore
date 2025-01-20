@interface HKDatabaseValidation
+ (id)clientInterface;
+ (id)serverInterface;
- (HKDatabaseValidation)initWithHealthStore:(id)a3;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)clientRemote_processIntegrityErrorString:(id)a3 errorHandlerIdentifier:(id)a4;
- (void)clientRemote_processValidationError:(id)a3 errorHandlerIdentifier:(id)a4;
- (void)clientRemote_synchronizeWithCompletion:(id)a3 success:(BOOL)a4 error:(id)a5;
- (void)connectionInvalidated;
- (void)performIntegrityCheckOnDatabase:(int64_t)a3 identifier:(id)a4 errorHandler:(id)a5 completion:(id)a6;
- (void)validateEntitiesWithIdentifier:(id)a3 errorHandler:(id)a4 completion:(id)a5;
@end

@implementation HKDatabaseValidation

- (HKDatabaseValidation)initWithHealthStore:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HKDatabaseValidation;
  v6 = [(HKDatabaseValidation *)&v18 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F29128] UUID];
    identifier = v6->_identifier;
    v6->_identifier = (NSUUID *)v7;

    objc_storeStrong((id *)&v6->_healthStore, a3);
    v9 = [[HKTaskServerProxyProvider alloc] initWithHealthStore:v6->_healthStore taskIdentifier:@"HKDatabaseValidationTaskServerIdentifier" exportedObject:v6 taskUUID:v6->_identifier];
    proxyProvider = v6->_proxyProvider;
    v6->_proxyProvider = v9;

    [(HKProxyProvider *)v6->_proxyProvider setShouldRetryOnInterruption:0];
    uint64_t v11 = HKCreateSerialDispatchQueue(v6, @"resource");
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v11;

    uint64_t v13 = objc_opt_new();
    integrityErrorHandlerDict = v6->_integrityErrorHandlerDict;
    v6->_integrityErrorHandlerDict = (NSMutableDictionary *)v13;

    uint64_t v15 = objc_opt_new();
    validationErrorHandlerDict = v6->_validationErrorHandlerDict;
    v6->_validationErrorHandlerDict = (NSMutableDictionary *)v15;
  }
  return v6;
}

- (void)performIntegrityCheckOnDatabase:(int64_t)a3 identifier:(id)a4 errorHandler:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  integrityErrorHandlerDict = self->_integrityErrorHandlerDict;
  uint64_t v13 = _Block_copy(a5);
  [(NSMutableDictionary *)integrityErrorHandlerDict setObject:v13 forKey:v10];

  proxyProvider = self->_proxyProvider;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __91__HKDatabaseValidation_performIntegrityCheckOnDatabase_identifier_errorHandler_completion___block_invoke;
  v19[3] = &unk_1E58BFA60;
  int64_t v22 = a3;
  v19[4] = self;
  id v20 = v10;
  id v21 = v11;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __91__HKDatabaseValidation_performIntegrityCheckOnDatabase_identifier_errorHandler_completion___block_invoke_3;
  v17[3] = &unk_1E58BBC48;
  v17[4] = self;
  id v18 = v21;
  id v15 = v21;
  id v16 = v10;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v19 errorHandler:v17];
}

void __91__HKDatabaseValidation_performIntegrityCheckOnDatabase_identifier_errorHandler_completion___block_invoke(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __91__HKDatabaseValidation_performIntegrityCheckOnDatabase_identifier_errorHandler_completion___block_invoke_2;
  v5[3] = &unk_1E58BBA50;
  v5[4] = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 56);
  id v6 = *(id *)(a1 + 48);
  objc_msgSend(a2, "remote_validateDatabase:clientCompletionHandler:errorHandlerIdentifier:", v4, v5, *(void *)(a1 + 40));
}

void __91__HKDatabaseValidation_performIntegrityCheckOnDatabase_identifier_errorHandler_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;
  id v6 = a3;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __91__HKDatabaseValidation_performIntegrityCheckOnDatabase_identifier_errorHandler_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_ERROR)) {
    __91__HKDatabaseValidation_performIntegrityCheckOnDatabase_identifier_errorHandler_completion___block_invoke_3_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)validateEntitiesWithIdentifier:(id)a3 errorHandler:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  validationErrorHandlerDict = self->_validationErrorHandlerDict;
  id v11 = _Block_copy(a4);
  [(NSMutableDictionary *)validationErrorHandlerDict setObject:v11 forKey:v8];

  proxyProvider = self->_proxyProvider;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __79__HKDatabaseValidation_validateEntitiesWithIdentifier_errorHandler_completion___block_invoke;
  v17[3] = &unk_1E58BFA88;
  v17[4] = self;
  id v18 = v8;
  id v19 = v9;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __79__HKDatabaseValidation_validateEntitiesWithIdentifier_errorHandler_completion___block_invoke_3;
  v15[3] = &unk_1E58BBC48;
  v15[4] = self;
  id v16 = v19;
  id v13 = v19;
  id v14 = v8;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v17 errorHandler:v15];
}

void __79__HKDatabaseValidation_validateEntitiesWithIdentifier_errorHandler_completion___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __79__HKDatabaseValidation_validateEntitiesWithIdentifier_errorHandler_completion___block_invoke_2;
  v4[3] = &unk_1E58BBA50;
  v4[4] = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 48);
  objc_msgSend(a2, "remote_validateEntitiesWithClientCompletionHandler:errorHandlerIdentifier:", v4, *(void *)(a1 + 40));
}

void __79__HKDatabaseValidation_validateEntitiesWithIdentifier_errorHandler_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 48);
  *(void *)(v4 + 48) = 0;
  id v6 = a3;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __79__HKDatabaseValidation_validateEntitiesWithIdentifier_errorHandler_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_ERROR)) {
    __91__HKDatabaseValidation_performIntegrityCheckOnDatabase_identifier_errorHandler_completion___block_invoke_3_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (id)clientInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EECFAA58];
}

+ (id)serverInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED523D0];
}

- (id)exportedInterface
{
  return +[HKDatabaseValidation clientInterface];
}

- (id)remoteInterface
{
  return +[HKDatabaseValidation serverInterface];
}

- (void)connectionInvalidated
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  id v3 = HKLogDatabase;
  if (os_log_type_enabled((os_log_t)HKLogDatabase, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    id v5 = self;
    _os_log_impl(&dword_19C023000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Connection invalidated", (uint8_t *)&v4, 0xCu);
  }
}

- (void)clientRemote_processIntegrityErrorString:(id)a3 errorHandlerIdentifier:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(NSMutableDictionary *)self->_integrityErrorHandlerDict valueForKey:a4];
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __88__HKDatabaseValidation_clientRemote_processIntegrityErrorString_errorHandlerIdentifier___block_invoke;
  v11[3] = &unk_1E58BBF10;
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(queue, v11);
}

uint64_t __88__HKDatabaseValidation_clientRemote_processIntegrityErrorString_errorHandlerIdentifier___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)clientRemote_processValidationError:(id)a3 errorHandlerIdentifier:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(NSMutableDictionary *)self->_validationErrorHandlerDict valueForKey:a4];
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __83__HKDatabaseValidation_clientRemote_processValidationError_errorHandlerIdentifier___block_invoke;
  v11[3] = &unk_1E58BBF10;
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(queue, v11);
}

uint64_t __83__HKDatabaseValidation_clientRemote_processValidationError_errorHandlerIdentifier___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)clientRemote_synchronizeWithCompletion:(id)a3 success:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__HKDatabaseValidation_clientRemote_synchronizeWithCompletion_success_error___block_invoke;
  block[3] = &unk_1E58BBA28;
  BOOL v16 = a4;
  id v14 = v9;
  id v15 = v8;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync(queue, block);
}

uint64_t __77__HKDatabaseValidation_clientRemote_synchronizeWithCompletion_success_error___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validationErrorHandlerDict, 0);
  objc_storeStrong((id *)&self->_integrityErrorHandlerDict, 0);
  objc_storeStrong(&self->_validationErrorHandler, 0);
  objc_storeStrong(&self->_integrityErrorHandler, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

void __91__HKDatabaseValidation_performIntegrityCheckOnDatabase_identifier_errorHandler_completion___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "%{public}@: Failed to restart task server after connection interruption: %{public}@");
}

@end