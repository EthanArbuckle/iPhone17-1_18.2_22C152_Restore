@interface HDWorkoutRouteBuilderServer
+ (id)taskIdentifier;
- (HKWorkoutRoute)route;
- (id)exportedInterface;
- (id)remoteInterface;
- (id)seriesSample;
- (void)_queue_insertRouteData:(void *)a3 completion:;
- (void)createSeriesSampleIfNeeded:(id)a3 errorHandler:(id)a4;
- (void)queue_recoverBuilder;
- (void)remote_finishRouteWithWorkout:(id)a3 metadata:(id)a4 completion:(id)a5;
- (void)remote_insertRouteData:(id)a3 completion:(id)a4;
- (void)server_insertRouteData:(id)a3 completion:(id)a4;
- (void)setRoute:(id)a3;
@end

@implementation HDWorkoutRouteBuilderServer

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x1E4F2BC78];
}

- (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F2B7A8] serverInterface];
}

- (id)remoteInterface
{
  return (id)[MEMORY[0x1E4F2B7A8] clientInterface];
}

- (void)remote_insertRouteData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HDSeriesBuilderServer *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__HDWorkoutRouteBuilderServer_remote_insertRouteData_completion___block_invoke;
  block[3] = &unk_1E62F4E40;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __65__HDWorkoutRouteBuilderServer_remote_insertRouteData_completion___block_invoke(void **a1)
{
}

- (void)_queue_insertRouteData:(void *)a3 completion:
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v30 = 0;
    char v7 = objc_msgSend(a1, "queue_canInsertDataWithError:", &v30);
    id v8 = v30;
    if (v7)
    {
      id v29 = 0;
      id v9 = v5;
      if ([v9 count])
      {
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v35 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v32;
          while (2)
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v32 != v13) {
                objc_enumerationMutation(v10);
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v16 = (void *)MEMORY[0x1E4F28C58];
                uint64_t v17 = objc_opt_class();
                objc_msgSend(v16, "hk_assignError:code:format:", &v29, 3, @"%@: Invalid data series object %@", v17, objc_opt_class());

                char v15 = 0;
                goto LABEL_17;
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v31 objects:v35 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }

        char v15 = 1;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", &v29, 3, @"%@: Route data cannot be nil or empty.", objc_opt_class());
        char v15 = 0;
      }
LABEL_17:

      id v18 = v29;
      if (v15)
      {
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __65__HDWorkoutRouteBuilderServer__queue_insertRouteData_completion___block_invoke;
        aBlock[3] = &unk_1E6300DE8;
        aBlock[4] = a1;
        id v19 = v9;
        id v27 = v19;
        id v20 = v6;
        id v28 = v20;
        v21 = _Block_copy(aBlock);
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __65__HDWorkoutRouteBuilderServer__queue_insertRouteData_completion___block_invoke_6;
        v23[3] = &unk_1E62F69F0;
        v23[4] = a1;
        id v25 = v21;
        id v24 = v19;
        id v22 = v21;
        [a1 createSeriesSampleIfNeeded:v23 errorHandler:v20];
      }
      else if (v6)
      {
        (*((void (**)(id, void, id))v6 + 2))(v6, 0, v18);
      }
      id v8 = v18;
    }
    else if (v6)
    {
      (*((void (**)(id, void, id))v6 + 2))(v6, 0, v8);
    }
  }
}

- (void)remote_finishRouteWithWorkout:(id)a3 metadata:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(HDSeriesBuilderServer *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __81__HDWorkoutRouteBuilderServer_remote_finishRouteWithWorkout_metadata_completion___block_invoke;
  v15[3] = &unk_1E62F2F48;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __81__HDWorkoutRouteBuilderServer_remote_finishRouteWithWorkout_metadata_completion___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 48);
  v3 = *(void **)(a1 + 56);
  id v4 = *(id *)(a1 + 40);
  id v5 = v2;
  id v6 = v3;
  if (v1)
  {
    char v7 = [v1 queue];
    dispatch_assert_queue_V2(v7);

    id v8 = [v1 configuration];
    id v9 = [v8 workoutBuilderID];

    if (v9)
    {
      id v10 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), sel__queue_finishRouteWithWorkout_metadata_completion_, @"This route builder is attached to a workout builder and will be finished with the workout builder"");
      v6[2](v6, 0, v10);
    }
    else
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __81__HDWorkoutRouteBuilderServer__queue_finishRouteWithWorkout_metadata_completion___block_invoke;
      v11[3] = &unk_1E6300E38;
      id v14 = v6;
      v11[4] = v1;
      id v12 = v5;
      id v13 = v4;
      char v15 = sel__queue_finishRouteWithWorkout_metadata_completion_;
      objc_msgSend(v1, "queue_freezeBuilderWithCompletion:", v11);
    }
  }
}

- (void)server_insertRouteData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HDSeriesBuilderServer *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__HDWorkoutRouteBuilderServer_server_insertRouteData_completion___block_invoke;
  block[3] = &unk_1E62F4E40;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __65__HDWorkoutRouteBuilderServer_server_insertRouteData_completion___block_invoke(void **a1)
{
}

void __65__HDWorkoutRouteBuilderServer__queue_insertRouteData_completion___block_invoke(id *a1, void *a2, void *a3)
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a1[4];
  id v7 = a3;
  id v8 = [v6 queue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = [v5 count];
  uint64_t v10 = [v7 count];

  [v5 _setCount:v10 + v9];
  uint64_t v11 = [a1[4] delegate];
  id v12 = [v11 sampleSavingDelegate];
  id v13 = [v5 sampleType];
  v23[0] = v13;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __65__HDWorkoutRouteBuilderServer__queue_insertRouteData_completion___block_invoke_2;
  v18[3] = &unk_1E62F2F48;
  id v19 = a1[5];
  id v20 = v5;
  id v21 = a1[4];
  id v22 = a1[6];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __65__HDWorkoutRouteBuilderServer__queue_insertRouteData_completion___block_invoke_5;
  v16[3] = &unk_1E62FFD78;
  id v17 = a1[6];
  id v15 = v5;
  [v12 performIfAuthorizedToSaveObjectTypes:v14 usingBlock:v18 errorHandler:v16];
}

void __65__HDWorkoutRouteBuilderServer__queue_insertRouteData_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = [*(id *)(a1 + 40) UUID];
  id v4 = [*(id *)(a1 + 48) profile];
  id v14 = 0;
  BOOL v5 = +[HDLocationSeriesSampleEntity insertLocationData:v2 seriesIdentifier:v3 profile:v4 error:&v14];
  id v6 = v14;

  id v7 = [*(id *)(a1 + 48) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__HDWorkoutRouteBuilderServer__queue_insertRouteData_completion___block_invoke_3;
  block[3] = &unk_1E6300DC0;
  id v8 = *(void **)(a1 + 56);
  block[4] = *(void *)(a1 + 48);
  BOOL v13 = v5;
  id v11 = v6;
  id v12 = v8;
  id v9 = v6;
  dispatch_async(v7, block);
}

void __65__HDWorkoutRouteBuilderServer__queue_insertRouteData_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __65__HDWorkoutRouteBuilderServer__queue_insertRouteData_completion___block_invoke_4;
  v3[3] = &unk_1E62F61A8;
  id v5 = *(id *)(a1 + 48);
  char v6 = *(unsigned char *)(a1 + 56);
  id v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "queue_setState:completion:", 1, v3);
}

void __65__HDWorkoutRouteBuilderServer__queue_insertRouteData_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  int v2 = *(unsigned __int8 *)(a1 + 48);
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v3 = 0;
LABEL_4:
    id v4 = *(void (**)(uint64_t, BOOL, uint64_t))(v1 + 16);
    uint64_t v5 = *(void *)(a1 + 40);
    v4(v5, v2 != 0, v3);
    return;
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"Unable to save series data.");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v6);
}

uint64_t __65__HDWorkoutRouteBuilderServer__queue_insertRouteData_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __65__HDWorkoutRouteBuilderServer__queue_insertRouteData_completion___block_invoke_6(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__HDWorkoutRouteBuilderServer__queue_insertRouteData_completion___block_invoke_7;
  block[3] = &unk_1E62F61D0;
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 40);
  id v8 = v3;
  block[4] = v4;
  id v7 = v5;
  dispatch_async(v2, block);
}

void __65__HDWorkoutRouteBuilderServer__queue_insertRouteData_completion___block_invoke_7(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) seriesSample];
  (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v3, *(void *)(a1 + 40));
}

void __81__HDWorkoutRouteBuilderServer__queue_finishRouteWithWorkout_metadata_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    id v24 = v5;
    char v8 = [v6 canAddMetadata:v7 errorOut:&v24];
    id v9 = v24;

    if (v8)
    {
      uint64_t v10 = [*(id *)(a1 + 32) delegate];
      id v11 = [v10 sampleSavingDelegate];
      id v12 = [*(id *)(a1 + 32) seriesSample];
      BOOL v13 = [v12 sampleType];
      v25[0] = v13;
      id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __81__HDWorkoutRouteBuilderServer__queue_finishRouteWithWorkout_metadata_completion___block_invoke_2;
      v19[3] = &unk_1E6300E10;
      v19[4] = *(void *)(a1 + 32);
      id v20 = *(id *)(a1 + 48);
      id v15 = *(id *)(a1 + 56);
      uint64_t v16 = *(void *)(a1 + 64);
      id v22 = v15;
      uint64_t v23 = v16;
      id v21 = *(id *)(a1 + 40);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __81__HDWorkoutRouteBuilderServer__queue_finishRouteWithWorkout_metadata_completion___block_invoke_3;
      v17[3] = &unk_1E62FFD78;
      id v18 = *(id *)(a1 + 56);
      [v11 performIfAuthorizedToSaveObjectTypes:v14 usingBlock:v19 errorHandler:v17];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    id v5 = v9;
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __81__HDWorkoutRouteBuilderServer__queue_finishRouteWithWorkout_metadata_completion___block_invoke_2(uint64_t a1)
{
  v31[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"Unable to finish the series data.");
  id v3 = [*(id *)(a1 + 32) profile];
  uint64_t v4 = v3;
  if (!*(void *)(a1 + 40)
    || ([v3 dataManager],
        id v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 containsDataObject:*(void *)(a1 + 40)],
        v5,
        (v6 & 1) != 0))
  {
    uint64_t v7 = [*(id *)(a1 + 32) seriesSample];
    char v8 = [v7 UUID];
    uint64_t v9 = *(void *)(a1 + 48);
    id v30 = 0;
    uint64_t v10 = +[HDSeriesBuilderEntity freezeSeriesWithIdentifier:v8 metadata:v9 profile:v4 error:&v30];
    id v11 = v30;

    if (v10)
    {
      id v12 = [*(id *)(a1 + 32) client];
      BOOL v13 = [v12 baseDataEntityEncodingOptions];

      id v29 = v11;
      id v14 = +[HDDataEntity objectWithUUID:v10 encodingOptions:v13 profile:v4 error:&v29];
      id v15 = v29;

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {

        if (v14)
        {
          v26 = [v14 UUID];
          v31[0] = v26;
          uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
          id v17 = [*(id *)(a1 + 40) UUID];
          id v28 = 0;
          id v18 = [*(id *)(a1 + 32) profile];
          id v27 = v15;
          BOOL v19 = +[HDAssociationEntity associateSampleUUIDs:v16 withSampleUUID:v17 type:0 destinationSubObjectReference:0 lastInsertedEntityID:&v28 profile:v18 error:&v27];
          id v25 = v28;
          id v24 = v27;

          if (v19)
          {
            id v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
            [v20 postNotificationName:@"HDHealthStoreServerDidAssociateWorkoutSamples" object:0];
          }
          (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

          id v15 = v24;
          goto LABEL_16;
        }
      }
      else
      {
      }
    }
    else
    {
      id v15 = v11;
    }
    if (v15) {
      id v23 = v15;
    }
    else {
      id v23 = v2;
    }
    (*(void (**)(void, void, id))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), 0, v23);
LABEL_16:

    goto LABEL_17;
  }
  uint64_t v21 = *(void *)(a1 + 56);
  id v22 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), *(void *)(a1 + 64), @"Workout has not been saved."");
  (*(void (**)(uint64_t, void, void *))(v21 + 16))(v21, 0, v22);

LABEL_17:
}

uint64_t __81__HDWorkoutRouteBuilderServer__queue_finishRouteWithWorkout_metadata_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)seriesSample
{
  route = self->_route;
  if (route)
  {
    id v3 = route;
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F2B7A0];
    char v6 = [(HDSeriesBuilderServer *)self configuration];
    uint64_t v7 = [v6 device];
    id v3 = [v5 _workoutRouteWithDevice:v7 metadata:0];

    char v8 = [(HDStandardTaskServer *)self taskUUID];
    [(HKWorkoutRoute *)v3 _setUUID:v8];
  }

  return v3;
}

- (void)createSeriesSampleIfNeeded:(id)a3 errorHandler:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void (**)(void))a3;
  id v8 = a4;
  if (self->_route)
  {
    v7[2](v7);
  }
  else
  {
    if ([(HDSeriesBuilderServer *)self queue_state])
    {
      id v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2 object:self file:@"HDWorkoutRouteBuilderServer.m" lineNumber:221 description:@"route missing."];
    }
    uint64_t v9 = [(HDWorkoutRouteBuilderServer *)self seriesSample];
    route = self->_route;
    self->_route = v9;

    id v11 = [(HDStandardTaskServer *)self delegate];
    id v12 = [v11 sampleSavingDelegate];
    BOOL v13 = [(HDWorkoutRouteBuilderServer *)self seriesSample];
    v19[0] = v13;
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __71__HDWorkoutRouteBuilderServer_createSeriesSampleIfNeeded_errorHandler___block_invoke;
    v16[3] = &unk_1E62FF6D8;
    void v16[4] = self;
    id v17 = v8;
    id v18 = v7;
    [v12 saveSamples:v14 withCompletion:v16];
  }
}

void __71__HDWorkoutRouteBuilderServer_createSeriesSampleIfNeeded_errorHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  char v6 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"Unable to save series sample.");
  if (a2)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __71__HDWorkoutRouteBuilderServer_createSeriesSampleIfNeeded_errorHandler___block_invoke_2;
    v9[3] = &unk_1E62FB280;
    id v10 = *(id *)(a1 + 48);
    id v11 = *(id *)(a1 + 40);
    [v7 associateToWorkoutBuilderWithCompletion:v9];
  }
  else
  {
    if (v5) {
      id v8 = v5;
    }
    else {
      id v8 = v6;
    }
    (*(void (**)(void, void, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, v8);
  }
}

void __71__HDWorkoutRouteBuilderServer_createSeriesSampleIfNeeded_errorHandler___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v7 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"Unable to associate series to workout builder.");
  if (a2)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    if (v7) {
      id v6 = v7;
    }
    else {
      id v6 = v5;
    }
    (*(void (**)(void, void, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, v6);
  }
}

- (void)queue_recoverBuilder
{
  id v3 = [(HDWorkoutRouteBuilderServer *)self seriesSample];
  route = self->_route;
  self->_route = v3;

  v5.receiver = self;
  v5.super_class = (Class)HDWorkoutRouteBuilderServer;
  [(HDSeriesBuilderServer *)&v5 queue_recoverBuilder];
}

- (HKWorkoutRoute)route
{
  return self->_route;
}

- (void)setRoute:(id)a3
{
}

- (void).cxx_destruct
{
}

@end