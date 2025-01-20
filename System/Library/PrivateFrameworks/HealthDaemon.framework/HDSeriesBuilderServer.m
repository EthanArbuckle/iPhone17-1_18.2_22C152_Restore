@interface HDSeriesBuilderServer
+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5;
+ (Class)configurationClass;
+ (id)requiredEntitlements;
- (BOOL)canAddMetadata:(id)a3 errorOut:(id *)a4;
- (BOOL)queue_canInsertDataWithError:(id *)a3;
- (HDSeriesBuilderEntity)persistentEntity;
- (HDSeriesBuilderServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (HKSeriesBuilderConfiguration)configuration;
- (HKSeriesSample)seriesSample;
- (NSString)description;
- (OS_dispatch_queue)queue;
- (id)exportedInterface;
- (id)remoteInterface;
- (int64_t)queue_state;
- (void)_discardSeriesWithCompletion:(uint64_t)a1;
- (void)_setClientState:(void *)a3 completion:;
- (void)associateToWorkoutBuilderWithCompletion:(id)a3;
- (void)connectionInvalidated;
- (void)createSeriesSampleIfNeeded:(id)a3 errorHandler:(id)a4;
- (void)queue_freezeBuilderWithCompletion:(id)a3;
- (void)queue_recoverBuilder;
- (void)queue_setState:(int64_t)a3 completion:(id)a4;
- (void)remote_addMetadata:(id)a3 completion:(id)a4;
- (void)remote_discardWithCompletion:(id)a3;
- (void)remote_freezeWithCompletion:(id)a3;
- (void)remote_recoverWithCompletion:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setPersistentEntity:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSeriesSample:(id)a3;
@end

@implementation HDSeriesBuilderServer

- (HDSeriesBuilderServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HDSeriesBuilderServer;
  v11 = [(HDStandardTaskServer *)&v20 initWithUUID:a3 configuration:v10 client:a5 delegate:a6];
  if (v11)
  {
    uint64_t v12 = HKCreateSerialDispatchQueue();
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v12;

    uint64_t v14 = [v10 copy];
    configuration = v11->_configuration;
    v11->_configuration = (HKSeriesBuilderConfiguration *)v14;

    v11->_queue_state = 0;
    v16 = v11->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__HDSeriesBuilderServer_initWithUUID_configuration_client_delegate___block_invoke;
    block[3] = &unk_1E62F3208;
    v19 = v11;
    dispatch_async(v16, block);
  }
  return v11;
}

void __68__HDSeriesBuilderServer_initWithUUID_configuration_client_delegate___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 48));
    v2 = [(id)v1 taskUUID];
    v3 = [(id)v1 profile];
    id v17 = 0;
    uint64_t v4 = +[HDSeriesBuilderEntity persistentEntityForBuilderIdentifier:v2 profile:v3 error:&v17];
    id v5 = v17;
    v6 = *(void **)(v1 + 72);
    *(void *)(v1 + 72) = v4;

    if (v5)
    {
      _HKInitializeLogging();
      v7 = *MEMORY[0x1E4F29FB8];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
      {
LABEL_4:

        return;
      }
      *(_DWORD *)buf = 138543362;
      id v19 = v5;
      v15 = "Couldn't recover series builder with error %{public}@";
LABEL_12:
      _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, v15, buf, 0xCu);
      goto LABEL_4;
    }
    if (*(void *)(v1 + 72))
    {
      objc_msgSend((id)v1, "queue_recoverBuilder");
    }
    else
    {
      v8 = [(id)v1 taskUUID];
      v9 = [(id)v1 seriesSample];
      id v10 = [v9 sampleType];
      uint64_t v11 = *(void *)(v1 + 56);
      uint64_t v12 = [(id)v1 profile];
      id v16 = 0;
      uint64_t v13 = +[HDSeriesBuilderEntity createPersistentEntityForBuilderIdentifier:v8 seriesType:v10 state:v11 profile:v12 error:&v16];
      id v5 = v16;
      uint64_t v14 = *(void **)(v1 + 72);
      *(void *)(v1 + 72) = v13;

      if (v5)
      {
        _HKInitializeLogging();
        v7 = *MEMORY[0x1E4F29FB8];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR)) {
          goto LABEL_4;
        }
        *(_DWORD *)buf = 138543362;
        id v19 = v5;
        v15 = "Couldn't create persistent entity for series builder with error %{public}@";
        goto LABEL_12;
      }
    }
  }
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  return 1;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(HDStandardTaskServer *)self taskUUID];
  v6 = HKSeriesBuilderStateToString();
  v7 = [v3 stringWithFormat:@"<%@:%p %@ %@>", v4, self, v5, v6];

  return (NSString *)v7;
}

- (void)associateToWorkoutBuilderWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, void, id))a3;
  id v5 = [(HKSeriesBuilderConfiguration *)self->_configuration workoutBuilderID];

  if (v5)
  {
    v6 = [(HDSeriesBuilderServer *)self seriesSample];
    v7 = [(HKSeriesBuilderConfiguration *)self->_configuration workoutBuilderID];
    v8 = [(HDStandardTaskServer *)self profile];
    id v11 = 0;
    int64_t v9 = +[HDWorkoutBuilderAssociatedSeriesEntity associateSeries:v6 toWorkoutBuilderID:v7 profile:v8 error:&v11];
    id v10 = v11;

    if ((unint64_t)(v9 - 1) >= 2)
    {
      if (!v9) {
        v4[2](v4, 0, v10);
      }
    }
    else
    {
      v4[2](v4, 1, 0);
    }
  }
  else
  {
    v4[2](v4, 1, 0);
  }
}

- (void)createSeriesSampleIfNeeded:(id)a3 errorHandler:(id)a4
{
  objc_opt_class();

  NSRequestConcreteImplementation();
}

- (BOOL)canAddMetadata:(id)a3 errorOut:(id *)a4
{
  id v6 = a3;
  if (!v6
    || ([(HDStandardTaskServer *)self client],
        v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = objc_msgSend(v6, "hd_validateMetadataKeysAndValuesWithClient:error:", v7, a4),
        v7,
        v8))
  {
    LOBYTE(v8) = 1;
  }

  return v8;
}

- (BOOL)queue_canInsertDataWithError:(id *)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  unint64_t queue_state = self->_queue_state;
  if (queue_state < 2) {
    return 1;
  }
  if (queue_state - 2 > 1)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 100, @"Unknown state %ld", self->_queue_state);
  }
  else
  {
    if (queue_state == 2) {
      id v6 = @"completed";
    }
    else {
      id v6 = @"discarded";
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 3, @"Workout route is already %@.", v6);
  }
  return 0;
}

- (void)remote_addMetadata:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__HDSeriesBuilderServer_remote_addMetadata_completion___block_invoke;
  block[3] = &unk_1E62F4E40;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

void __55__HDSeriesBuilderServer_remote_addMetadata_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(dispatch_queue_t **)(a1 + 32);
  v2 = *(void **)(a1 + 48);
  id v3 = *(id *)(a1 + 40);
  id v4 = v2;
  if (v1)
  {
    dispatch_assert_queue_V2(v1[6]);
    id v10 = 0;
    char v5 = [(dispatch_queue_t *)v1 queue_canInsertDataWithError:&v10];
    id v6 = v10;
    if (v5)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __55__HDSeriesBuilderServer__queue_addMetadata_completion___block_invoke;
      v7[3] = &unk_1E62F4E40;
      v7[4] = v1;
      id v8 = v3;
      id v9 = v4;
      [(dispatch_queue_t *)v1 createSeriesSampleIfNeeded:v7 errorHandler:v9];
    }
    else
    {
      (*((void (**)(id, void, id))v4 + 2))(v4, 0, v6);
    }
  }
}

- (void)remote_discardWithCompletion:(id)a3
{
  id v5 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__HDSeriesBuilderServer_remote_discardWithCompletion___block_invoke;
  block[3] = &unk_1E62FFD00;
  void block[4] = self;
  id v9 = v5;
  SEL v10 = a2;
  id v7 = v5;
  dispatch_sync(queue, block);
}

void __54__HDSeriesBuilderServer_remote_discardWithCompletion___block_invoke(uint64_t a1)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  if ((v2[7] & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), *(void *)(a1 + 48), @"Cannot discard a finished or discarded series"");
    id v5 = *(void (**)(uint64_t, void))(v3 + 16);
    uint64_t v6 = v3;
LABEL_8:
    id v16 = (id)v4;
    v5(v6, 0);

    return;
  }
  id v7 = [v2 seriesSample];

  if (!v7)
  {
    uint64_t v15 = *(void *)(a1 + 40);
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Unexpected error encoutered while discarding series");
    id v5 = *(void (**)(uint64_t, void))(v15 + 16);
    uint64_t v6 = v15;
    goto LABEL_8;
  }
  id v8 = *(dispatch_queue_t **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  if (v8)
  {
    dispatch_assert_queue_V2(v8[6]);
    SEL v10 = [(dispatch_queue_t *)v8 delegate];
    id v11 = [v10 sampleSavingDelegate];
    id v12 = [(dispatch_queue_t *)v8 seriesSample];
    id v13 = [v12 sampleType];
    v21[0] = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __66__HDSeriesBuilderServer__queue_discardIfAuthorizedWithCompletion___block_invoke;
    v19[3] = &unk_1E62FFD50;
    v19[4] = v8;
    id v20 = v9;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __66__HDSeriesBuilderServer__queue_discardIfAuthorizedWithCompletion___block_invoke_2;
    v17[3] = &unk_1E62FFD78;
    id v18 = v20;
    [v11 performIfAuthorizedToDeleteObjectTypes:v14 usingBlock:v19 errorHandler:v17];
  }
}

- (void)remote_freezeWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__HDSeriesBuilderServer_remote_freezeWithCompletion___block_invoke;
  v7[3] = &unk_1E62F4928;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __53__HDSeriesBuilderServer_remote_freezeWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_freezeBuilderWithCompletion:", *(void *)(a1 + 40));
}

- (void)remote_recoverWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__HDSeriesBuilderServer_remote_recoverWithCompletion___block_invoke;
  v7[3] = &unk_1E62F4928;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __54__HDSeriesBuilderServer_remote_recoverWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = v1[7];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54__HDSeriesBuilderServer_remote_recoverWithCompletion___block_invoke_2;
  v3[3] = &unk_1E62F2F20;
  id v4 = *(id *)(a1 + 40);
  -[HDSeriesBuilderServer _setClientState:completion:](v1, v2, v3);
}

uint64_t __54__HDSeriesBuilderServer_remote_recoverWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_setClientState:(void *)a3 completion:
{
  id v5 = a3;
  id v6 = v5;
  if (a1)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __52__HDSeriesBuilderServer__setClientState_completion___block_invoke;
    aBlock[3] = &unk_1E62FFD28;
    aBlock[4] = a1;
    uint64_t v18 = a2;
    id v7 = v5;
    id v17 = v7;
    id v8 = _Block_copy(aBlock);
    id v9 = [a1 client];
    SEL v10 = [v9 connection];
    id v11 = [v10 remoteObjectProxyWithErrorHandler:v8];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __52__HDSeriesBuilderServer__setClientState_completion___block_invoke_309;
    v13[3] = &unk_1E62FB280;
    id v14 = v7;
    id v15 = v8;
    id v12 = v8;
    objc_msgSend(v11, "clientRemote_didChangeToState:completion:", a2, v13);
  }
}

void __52__HDSeriesBuilderServer__setClientState_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = a1[4];
    uint64_t v7 = a1[6];
    int v8 = 138543874;
    uint64_t v9 = v6;
    __int16 v10 = 2048;
    uint64_t v11 = v7;
    __int16 v12 = 2114;
    id v13 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to notify client of state change to %ld with error: %{public}@", (uint8_t *)&v8, 0x20u);
  }
  uint64_t v5 = a1[5];
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
}

void __52__HDSeriesBuilderServer__setClientState_completion___block_invoke_309(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if (!v6) {
      goto LABEL_6;
    }
    id v7 = v5;
    (*(void (**)(void))(v6 + 16))();
  }
  else
  {
    id v7 = v5;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  id v5 = v7;
LABEL_6:
}

void __55__HDSeriesBuilderServer__queue_addMetadata_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v16 = 0;
  char v4 = [v2 canAddMetadata:v3 errorOut:&v16];
  id v5 = v16;
  if (v4)
  {
    uint64_t v6 = [*(id *)(a1 + 32) profile];
    id v7 = [v6 database];
    id v15 = v5;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __55__HDSeriesBuilderServer__queue_addMetadata_completion___block_invoke_2;
    v13[3] = &unk_1E62F2AE0;
    int v8 = *(void **)(a1 + 40);
    void v13[4] = *(void *)(a1 + 32);
    id v14 = v8;
    BOOL v9 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v7 error:&v15 block:v13];
    id v10 = v15;

    (*(void (**)(void, BOOL, id, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v9, v10, v11, v12);
    id v5 = v10;
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __55__HDSeriesBuilderServer__queue_addMetadata_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 persistentEntity];
  uint64_t v8 = [v7 insertMetadata:*(void *)(a1 + 40) transaction:v6 error:a3];

  return v8;
}

- (void)queue_freezeBuilderWithCompletion:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v6 = @"No data was added to the workout route.";
  switch(self->_queue_state)
  {
    case 0:
      goto LABEL_6;
    case 1:
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __59__HDSeriesBuilderServer_queue_freezeBuilderWithCompletion___block_invoke;
      v8[3] = &unk_1E62F2F20;
      id v9 = v5;
      [(HDSeriesBuilderServer *)self queue_setState:2 completion:v8];
      id v7 = v9;
      goto LABEL_8;
    case 2:
      id v6 = @"Workout route already finished.";
      goto LABEL_6;
    case 3:
      id v6 = @"Workout route was discarded.";
LABEL_6:
      id v7 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\"", objc_opt_class(), a2, v6);
      break;
    default:
      id v7 = 0;
      break;
  }
  (*((void (**)(id, void, void *))v5 + 2))(v5, 0, v7);
LABEL_8:
}

uint64_t __59__HDSeriesBuilderServer_queue_freezeBuilderWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)queue_recoverBuilder
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  uint64_t v3 = [(HDStandardTaskServer *)self profile];
  char v4 = [v3 database];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__HDSeriesBuilderServer_queue_recoverBuilder__block_invoke;
  v7[3] = &unk_1E62F9108;
  void v7[5] = &v9;
  id v8 = 0;
  v7[4] = self;
  +[HDHealthEntity performReadTransactionWithHealthDatabase:v4 error:&v8 block:v7];
  id v5 = v8;

  if (v5)
  {
    _HKInitializeLogging();
    id v6 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v14 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "Couldn't recover state for series builder with error %{public}@", buf, 0xCu);
    }
  }
  [(HDSeriesBuilderServer *)self queue_setState:v10[3] completion:0];
  _Block_object_dispose(&v9, 8);
}

uint64_t __45__HDSeriesBuilderServer_queue_recoverBuilder__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 72) stateWithTransaction:a2 error:a3];
  return 1;
}

- (void)queue_setState:(int64_t)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  self->_unint64_t queue_state = a3;
  id v7 = [(HDStandardTaskServer *)self profile];
  id v8 = [v7 database];
  v12[5] = a3;
  id v13 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__HDSeriesBuilderServer_queue_setState_completion___block_invoke;
  v12[3] = &unk_1E62F9068;
  v12[4] = self;
  BOOL v9 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v8 error:&v13 block:v12];
  id v10 = v13;

  if (!v9)
  {
    _HKInitializeLogging();
    uint64_t v11 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v15 = self;
      __int16 v16 = 2114;
      id v17 = v10;
      _os_log_error_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_ERROR, "%{public}@: Failed to persist state change with error: %{public}@", buf, 0x16u);
    }
  }
  -[HDSeriesBuilderServer _setClientState:completion:](self, a3, v6);
}

uint64_t __51__HDSeriesBuilderServer_queue_setState_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 persistentEntity];
  uint64_t v8 = [v7 setBuilderState:*(void *)(a1 + 40) transaction:v6 error:a3];

  return v8;
}

- (HDSeriesBuilderEntity)persistentEntity
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  persistentEntity = self->_persistentEntity;
  if (persistentEntity)
  {
    uint64_t v3 = persistentEntity;
  }
  else
  {
    id v5 = [(HDStandardTaskServer *)self taskUUID];
    id v6 = [(HDStandardTaskServer *)self profile];
    id v12 = 0;
    id v7 = +[HDSeriesBuilderEntity persistentEntityForBuilderIdentifier:v5 profile:v6 error:&v12];
    id v8 = v12;
    BOOL v9 = self->_persistentEntity;
    self->_persistentEntity = v7;

    if (v8)
    {
      _HKInitializeLogging();
      id v10 = *MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v14 = self;
        __int16 v15 = 2114;
        id v16 = v8;
        _os_log_error_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch series builer persistent entity: %{public}@", buf, 0x16u);
      }
    }
    uint64_t v3 = self->_persistentEntity;
  }

  return v3;
}

- (void)_discardSeriesWithCompletion:(uint64_t)a1
{
  id v3 = a2;
  char v4 = v3;
  if (a1)
  {
    id v5 = *(NSObject **)(a1 + 48);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __54__HDSeriesBuilderServer__discardSeriesWithCompletion___block_invoke;
    v6[3] = &unk_1E62F4928;
    v6[4] = a1;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

void __54__HDSeriesBuilderServer__discardSeriesWithCompletion___block_invoke(uint64_t a1)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(dispatch_queue_t **)(a1 + 32);
  id v2 = *(id *)(a1 + 40);
  if (v1)
  {
    dispatch_assert_queue_V2(v1[6]);
    id v3 = [(dispatch_queue_t *)v1 profile];
    char v4 = [v3 dataManager];
    id v5 = [(dispatch_queue_t *)v1 seriesSample];
    v15[0] = v5;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    id v14 = 0;
    char v7 = [v4 deleteDataObjects:v6 restrictedSourceEntities:0 failIfNotFound:1 recursiveDeleteAuthorizationBlock:0 error:&v14];
    id v8 = v14;

    int v9 = objc_msgSend(v8, "hk_isErrorInDomain:code:", *MEMORY[0x1E4F65CA8], 1);
    if ((v7 & 1) != 0 || v9)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __60__HDSeriesBuilderServer__queue_discardSeriesWithCompletion___block_invoke;
      v10[3] = &unk_1E62F61A8;
      id v12 = v2;
      char v13 = v7;
      id v11 = v8;
      [(dispatch_queue_t *)v1 queue_setState:3 completion:v10];
    }
    else
    {
      (*((void (**)(id, void, id))v2 + 2))(v2, 0, v8);
    }
  }
}

uint64_t __60__HDSeriesBuilderServer__queue_discardSeriesWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

void __66__HDSeriesBuilderServer__queue_discardIfAuthorizedWithCompletion___block_invoke(uint64_t a1)
{
}

uint64_t __66__HDSeriesBuilderServer__queue_discardIfAuthorizedWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F2B480] serverInterface];
}

- (id)remoteInterface
{
  return (id)[MEMORY[0x1E4F2B480] clientInterface];
}

- (void)connectionInvalidated
{
  id v3 = [(HKSeriesBuilderConfiguration *)self->_configuration workoutBuilderID];

  if (!v3)
  {
    -[HDSeriesBuilderServer _discardSeriesWithCompletion:]((uint64_t)self, &__block_literal_global_94);
  }
}

void __46__HDSeriesBuilderServer_connectionInvalidated__block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v5 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      int v6 = 138543362;
      id v7 = v4;
      _os_log_error_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_ERROR, "Couldn't discard invalidated series with error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (HKSeriesBuilderConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (int64_t)queue_state
{
  return self->_queue_state;
}

- (HKSeriesSample)seriesSample
{
  return self->_seriesSample;
}

- (void)setSeriesSample:(id)a3
{
}

- (void)setPersistentEntity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentEntity, 0);
  objc_storeStrong((id *)&self->_seriesSample, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end