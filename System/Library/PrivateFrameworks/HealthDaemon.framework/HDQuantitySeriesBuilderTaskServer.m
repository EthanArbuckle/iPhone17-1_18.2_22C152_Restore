@interface HDQuantitySeriesBuilderTaskServer
+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5;
+ (Class)configurationClass;
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (HDQuantitySeriesBuilderTaskServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (id)exportedInterface;
- (id)remoteInterface;
- (id)unitTest_saveSamplesCompletion;
- (int64_t)state;
- (uint64_t)_queue_insertQuantitySeries:(void *)a3 series:(int)a4 forceInsert:(void *)a5 error:;
- (uint64_t)_queue_isStateInAllowedStates:(void *)a3 description:(uint64_t)a4 error:;
- (void)_queue_discardWithCompletion:(uint64_t)a1;
- (void)_queue_finishSeriesWithMetadata:(void *)a3 endDate:(void *)a4 completion:;
- (void)_queue_insertQuantitySeries:(void *)a3 completion:;
- (void)remote_discardWithCompletion:(id)a3;
- (void)remote_finishSeriesWithMetadata:(id)a3 endDate:(id)a4 finalSeries:(id)a5 completion:(id)a6;
- (void)remote_insertQuantitySeries:(id)a3 completion:(id)a4;
- (void)setUnitTest_saveSamplesCompletion:(id)a3;
@end

@implementation HDQuantitySeriesBuilderTaskServer

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x1E4F2A5B0];
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (HDQuantitySeriesBuilderTaskServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v11 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HDQuantitySeriesBuilderTaskServer;
  v12 = [(HDStandardTaskServer *)&v17 initWithUUID:a3 configuration:v11 client:a5 delegate:a6];
  if (v12)
  {
    uint64_t v13 = HKCreateSerialDispatchQueue();
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v13;

    if (!v11)
    {
      v15 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v12->_configuration, a4);
    v12->_state = 0;
  }
  v15 = v12;
LABEL_6:

  return v15;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  return 1;
}

- (void)remote_insertQuantitySeries:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__HDQuantitySeriesBuilderTaskServer_remote_insertQuantitySeries_completion___block_invoke;
  block[3] = &unk_1E62F4E40;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __76__HDQuantitySeriesBuilderTaskServer_remote_insertQuantitySeries_completion___block_invoke(uint64_t a1)
{
}

- (void)_queue_insertQuantitySeries:(void *)a3 completion:
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    id v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1F17EEA18, &unk_1F17EEA30, &unk_1F17EEA48, 0);
    id v34 = 0;
    char v8 = -[HDQuantitySeriesBuilderTaskServer _queue_isStateInAllowedStates:description:error:](a1, v7, @"insert", (uint64_t)&v34);
    id v9 = v34;
    id v10 = v9;
    if (v8)
    {
      if (*(void *)(a1 + 56))
      {
        id v11 = *(void **)(a1 + 48);
        id v29 = v9;
        uint64_t v12 = -[HDQuantitySeriesBuilderTaskServer _queue_insertQuantitySeries:series:forceInsert:error:](a1, v5, v11, 0, &v29);
        id v13 = v29;

        v6[2](v6, v12, v13);
        id v10 = v13;
      }
      else
      {
        v14 = (void *)MEMORY[0x1E4F2B370];
        v15 = [*(id *)(a1 + 88) quantityType];
        v16 = [v15 canonicalUnit];
        objc_super v17 = [v5 values];
        v18 = [v17 firstObject];
        [v18 value];
        v19 = objc_msgSend(v14, "quantityWithUnit:doubleValue:", v16);

        v20 = (void *)MEMORY[0x1E4F2B388];
        v21 = [*(id *)(a1 + 88) quantityType];
        v22 = [*(id *)(a1 + 88) startDate];
        v23 = [*(id *)(a1 + 88) device];
        v24 = [v20 _unfrozenQuantitySampleWithQuantityType:v21 quantity:v19 startDate:v22 device:v23];

        objc_storeStrong((id *)(a1 + 48), v24);
        *(void *)(a1 + 56) = 1;
        v25 = [(id)a1 delegate];
        v26 = [v25 sampleSavingDelegate];
        v35[0] = v24;
        v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __76__HDQuantitySeriesBuilderTaskServer__queue_insertQuantitySeries_completion___block_invoke;
        v30[3] = &unk_1E6303E18;
        v30[4] = a1;
        v33 = v6;
        id v31 = v5;
        id v32 = v24;
        id v28 = v24;
        [v26 saveSamples:v27 withCompletion:v30];
      }
    }
    else
    {
      v6[2](v6, 0, v9);
    }
  }
}

- (void)remote_finishSeriesWithMetadata:(id)a3 endDate:(id)a4 finalSeries:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __100__HDQuantitySeriesBuilderTaskServer_remote_finishSeriesWithMetadata_endDate_finalSeries_completion___block_invoke;
  block[3] = &unk_1E6301620;
  id v20 = v12;
  v21 = self;
  id v23 = v11;
  id v24 = v13;
  id v22 = v10;
  id v15 = v11;
  id v16 = v10;
  id v17 = v13;
  id v18 = v12;
  dispatch_async(queue, block);
}

void __100__HDQuantitySeriesBuilderTaskServer_remote_finishSeriesWithMetadata_endDate_finalSeries_completion___block_invoke(uint64_t a1)
{
  v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  if (v3)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __100__HDQuantitySeriesBuilderTaskServer_remote_finishSeriesWithMetadata_endDate_finalSeries_completion___block_invoke_2;
    v11[3] = &unk_1E62F9580;
    id v4 = *(id *)(a1 + 64);
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = *(void **)(a1 + 48);
    id v14 = v4;
    v11[4] = v5;
    id v12 = v6;
    id v13 = *(id *)(a1 + 56);
    -[HDQuantitySeriesBuilderTaskServer _queue_insertQuantitySeries:completion:](v2, v3, v11);
  }
  else
  {
    id v7 = *(void **)(a1 + 48);
    char v8 = *(void **)(a1 + 56);
    id v9 = *(void **)(a1 + 64);
    uint64_t v10 = *(void *)(a1 + 40);
    -[HDQuantitySeriesBuilderTaskServer _queue_finishSeriesWithMetadata:endDate:completion:](v10, v7, v8, v9);
  }
}

void __100__HDQuantitySeriesBuilderTaskServer_remote_finishSeriesWithMetadata_endDate_finalSeries_completion___block_invoke_2(uint64_t a1, char a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(NSObject **)(v3 + 40);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __100__HDQuantitySeriesBuilderTaskServer_remote_finishSeriesWithMetadata_endDate_finalSeries_completion___block_invoke_3;
    v6[3] = &unk_1E62F2F48;
    v6[4] = v3;
    id v7 = *(id *)(a1 + 40);
    id v8 = *(id *)(a1 + 48);
    id v9 = *(id *)(a1 + 56);
    dispatch_async(v4, v6);
  }
  else
  {
    uint64_t v5 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v5();
  }
}

void __100__HDQuantitySeriesBuilderTaskServer_remote_finishSeriesWithMetadata_endDate_finalSeries_completion___block_invoke_3(uint64_t a1)
{
}

- (void)_queue_finishSeriesWithMetadata:(void *)a3 endDate:(void *)a4 completion:
{
  v53[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1F17EEA30, &unk_1F17EEA48, &unk_1F17EEA60, 0);
    id v52 = 0;
    char v11 = -[HDQuantitySeriesBuilderTaskServer _queue_isStateInAllowedStates:description:error:](a1, v10, @"finish", (uint64_t)&v52);
    id v12 = v52;
    id v13 = v52;
    id v14 = v13;
    uint64_t v15 = *(void *)(a1 + 56);
    if ((v11 & 1) == 0)
    {
      if (!v15)
      {
        *(void *)(a1 + 56) = 9;
        objc_storeStrong((id *)(a1 + 72), v12);
      }
      v9[2](v9, 0, v14);
      goto LABEL_8;
    }
    *(void *)(a1 + 56) = 8;
    if (v15 == 1)
    {
      *(void *)(a1 + 56) = 6;
      objc_initWeak(&location, (id)a1);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __88__HDQuantitySeriesBuilderTaskServer__queue_finishSeriesWithMetadata_endDate_completion___block_invoke;
      aBlock[3] = &unk_1E6303E40;
      objc_copyWeak(&v50, &location);
      id v7 = v7;
      id v47 = v7;
      id v48 = v8;
      v49 = v9;
      id v16 = _Block_copy(aBlock);
      id v17 = *(void **)(a1 + 80);
      *(void *)(a1 + 80) = v16;

      objc_destroyWeak(&v50);
      objc_destroyWeak(&location);
LABEL_8:

      goto LABEL_9;
    }
    id v45 = v13;
    id v18 = v7;
    if (!v18) {
      goto LABEL_13;
    }
    v19 = [(id)a1 client];
    id v20 = [v19 configuration];
    uint64_t v21 = [v20 applicationSDKVersionToken];

    if ((dyld_version_token_at_least() & 1) == 0)
    {
      v26 = objc_msgSend(v18, "hk_copyWithoutPrivateMetadataKeys");

      id v27 = v26;
      char v25 = 1;
      goto LABEL_17;
    }
    id v22 = [(id)a1 client];
    id v23 = [v22 entitlements];
    uint64_t v24 = [v23 hasPrivateMetadataAccess];

    if (!objc_msgSend(v18, "hk_validateMetadataKeysAndValuesAllowingPrivateMetadataKeys:applicationSDKVersionToken:error:", v24, v21, &v45))char v25 = 0; {
    else
    }
LABEL_13:
      char v25 = 1;
    id v27 = v18;
LABEL_17:

    id v7 = v27;
    id v28 = v45;

    if ((v25 & 1) == 0)
    {
      v9[2](v9, 0, v28);
      id v14 = v28;
      goto LABEL_8;
    }
    [(id)a1 profile];
    v30 = id v29 = v8;
    id v31 = [v30 dataManager];
    id v32 = [v31 quantitySeriesManager];
    uint64_t v33 = *(void *)(a1 + 48);
    id v44 = v28;
    v42 = v29;
    id v34 = [v32 freezeSeries:v33 metadata:v7 endDate:v29 error:&v44];
    id v14 = v44;

    if (v34)
    {
      v35 = v14;
      v36 = [v34 frozenIdentifier];

      if (v36)
      {
        v37 = [v34 frozenIdentifier];
        v38 = [(id)a1 profile];
        id v43 = v35;
        v39 = +[HDDataEntity objectWithUUID:v37 encodingOptions:0 profile:v38 error:&v43];
        id v14 = v43;

        if (v39)
        {
          v53[0] = v39;
          v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:1];
          ((void (**)(id, void *, id))v9)[2](v9, v40, 0);
        }
        else
        {
          v9[2](v9, 0, v14);
        }
        id v8 = v42;

        goto LABEL_28;
      }
      v41 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_protectedDataInaccessibilityError");
      v9[2](v9, 0, v41);

      id v14 = v35;
    }
    else
    {
      v9[2](v9, 0, v14);
    }
    id v8 = v42;
LABEL_28:

    goto LABEL_8;
  }
LABEL_9:
}

- (void)remote_discardWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__HDQuantitySeriesBuilderTaskServer_remote_discardWithCompletion___block_invoke;
  v7[3] = &unk_1E62F4928;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __66__HDQuantitySeriesBuilderTaskServer_remote_discardWithCompletion___block_invoke(uint64_t a1)
{
}

- (void)_queue_discardWithCompletion:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    id v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1F17EEA18, &unk_1F17EEA30, &unk_1F17EEA48, &unk_1F17EEA78, 0);
    id v22 = 0;
    char v5 = -[HDQuantitySeriesBuilderTaskServer _queue_isStateInAllowedStates:description:error:](a1, v4, @"discard", (uint64_t)&v22);
    id v6 = v22;
    if (v5)
    {
      uint64_t v7 = *(void *)(a1 + 56);
      *(void *)(a1 + 56) = 5;
      if (v7 == 1)
      {
        *(void *)(a1 + 56) = 3;
        objc_initWeak(&location, (id)a1);
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __66__HDQuantitySeriesBuilderTaskServer__queue_discardWithCompletion___block_invoke;
        aBlock[3] = &unk_1E62FB2F8;
        objc_copyWeak(&v20, &location);
        id v19 = v3;
        id v8 = _Block_copy(aBlock);
        id v9 = *(void **)(a1 + 80);
        *(void *)(a1 + 80) = v8;

        objc_destroyWeak(&v20);
        objc_destroyWeak(&location);
      }
      else if (v7)
      {
        uint64_t v10 = *(void **)(a1 + 48);
        *(void *)(a1 + 48) = 0;
        id v11 = v10;

        id v12 = [(id)a1 profile];
        id v13 = [v12 dataManager];
        id v14 = [v13 quantitySeriesManager];
        id v17 = v6;
        uint64_t v15 = [v14 discardSeries:v11 error:&v17];
        id v16 = v17;

        (*((void (**)(id, uint64_t, id))v3 + 2))(v3, v15, v16);
        id v6 = v16;
      }
      else
      {
        (*((void (**)(id, uint64_t, void))v3 + 2))(v3, 1, 0);
      }
    }
    else
    {
      (*((void (**)(id, void, id))v3 + 2))(v3, 0, v6);
    }
  }
}

- (int64_t)state
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 9;
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__HDQuantitySeriesBuilderTaskServer_state__block_invoke;
  v6[3] = &unk_1E62F3230;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(queue, v6);
  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __42__HDQuantitySeriesBuilderTaskServer_state__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 56);
  return result;
}

- (uint64_t)_queue_isStateInAllowedStates:(void *)a3 description:(uint64_t)a4 error:
{
  id v7 = a2;
  id v8 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
  uint64_t v9 = [NSNumber numberWithInteger:*(void *)(a1 + 56)];
  uint64_t v10 = [v7 containsObject:v9];

  if ((v10 & 1) == 0)
  {
    id v11 = objc_msgSend(v7, "hk_map:", &__block_literal_global_144);
    id v12 = NSString;
    id v13 = NSStringFromHDQuantitySeriesBuilderTaskServerState(*(void *)(a1 + 56));
    id v14 = [v12 stringWithFormat:@"Current state \"%@\" is not in allowed state(s) %@ for action %@", v13, v11, v8];

    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:underlyingError:", a4, 3, v14, *(void *)(a1 + 72));
  }

  return v10;
}

void __76__HDQuantitySeriesBuilderTaskServer__queue_insertQuantitySeries_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 96));
  id v7 = v6;
  if (v6) {
    (*((void (**)(void *, void))v6 + 2))(v6, *(void *)(a1 + 32));
  }
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(NSObject **)(v8 + 40);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__HDQuantitySeriesBuilderTaskServer__queue_insertQuantitySeries_completion___block_invoke_2;
  v11[3] = &unk_1E6303DF0;
  char v16 = a2;
  v11[4] = v8;
  id v12 = v5;
  id v15 = *(id *)(a1 + 56);
  id v13 = *(id *)(a1 + 40);
  id v14 = *(id *)(a1 + 48);
  id v10 = v5;
  dispatch_async(v9, v11);
}

void __76__HDQuantitySeriesBuilderTaskServer__queue_insertQuantitySeries_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 40));
    id v3 = *(NSObject **)(v2 + 40);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__HDQuantitySeriesBuilderTaskServer__queue_newSeriesSaveCompleted__block_invoke;
    block[3] = &unk_1E62F3208;
    void block[4] = v2;
    dispatch_async(v3, block);
    uint64_t v4 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v4 = 0;
  }
  if (*(unsigned char *)(a1 + 72))
  {
    uint64_t v5 = *(void *)(v4 + 56);
    switch(v5)
    {
      case 1:
        uint64_t v6 = 2;
        break;
      case 3:
        uint64_t v6 = 4;
        break;
      case 6:
        uint64_t v6 = 7;
        break;
      default:
LABEL_14:
        id v11 = *(void **)(a1 + 48);
        id v12 = *(void **)(a1 + 56);
        id v14 = 0;
        -[HDQuantitySeriesBuilderTaskServer _queue_insertQuantitySeries:series:forceInsert:error:](v4, v11, v12, 1, &v14);
        id v13 = v14;
        (*(void (**)(void))(*(void *)(a1 + 64) + 16))();

        return;
    }
    *(void *)(v4 + 56) = v6;
    uint64_t v4 = *(void *)(a1 + 32);
    goto LABEL_14;
  }
  *(void *)(v4 + 56) = 9;
  uint64_t v7 = [*(id *)(a1 + 40) copy];
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(v8 + 72);
  *(void *)(v8 + 72) = v7;

  id v10 = *(void (**)(void))(*(void *)(a1 + 64) + 16);

  v10();
}

- (uint64_t)_queue_insertQuantitySeries:(void *)a3 series:(int)a4 forceInsert:(void *)a5 error:
{
  id v9 = a2;
  id v10 = a3;
  if (!a1)
  {
    uint64_t v20 = 0;
    goto LABEL_20;
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
  uint64_t v11 = *(void *)(a1 + 56);
  if (v11 != 2)
  {
    if (v11 == 1)
    {
      id v12 = *(void **)(a1 + 64);
      if (!v12)
      {
        id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v14 = *(void **)(a1 + 64);
        *(void *)(a1 + 64) = v13;

        id v12 = *(void **)(a1 + 64);
      }
      id v15 = [v9 values];
      [v12 addObjectsFromArray:v15];

      goto LABEL_11;
    }
    if (!a4)
    {
LABEL_11:
      uint64_t v20 = 1;
      goto LABEL_20;
    }
  }
  char v16 = *(void **)(a1 + 64);
  if (v16
    && ([v9 values],
        id v17 = objc_claimAutoreleasedReturnValue(),
        [v16 addObjectsFromArray:v17],
        v17,
        (id v18 = *(void **)(a1 + 64)) != 0))
  {
    id v19 = v18;
  }
  else
  {
    id v19 = [v9 values];
  }
  uint64_t v21 = v19;
  id v22 = *(void **)(a1 + 64);
  *(void *)(a1 + 64) = 0;

  id v23 = [(id)a1 profile];
  uint64_t v24 = [v23 dataManager];
  char v25 = [v24 quantitySeriesManager];
  id v31 = 0;
  uint64_t v20 = [v25 insertValues:v21 series:v10 error:&v31];
  id v26 = v31;

  if ((v20 & 1) == 0)
  {
    *(void *)(a1 + 56) = 9;
    uint64_t v27 = [v26 copy];
    id v28 = *(void **)(a1 + 72);
    *(void *)(a1 + 72) = v27;

    id v29 = v26;
    if (v29)
    {
      if (a5) {
        *a5 = v29;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
LABEL_20:

  return v20;
}

void __66__HDQuantitySeriesBuilderTaskServer__queue_newSeriesSaveCompleted__block_invoke(uint64_t a1)
{
  v1 = (void (**)(void))_Block_copy(*(const void **)(*(void *)(a1 + 32) + 80));
  if (v1)
  {
    uint64_t v2 = v1;
    v1[2]();
    v1 = v2;
  }
}

void __88__HDQuantitySeriesBuilderTaskServer__queue_finishSeriesWithMetadata_endDate_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  -[HDQuantitySeriesBuilderTaskServer _queue_finishSeriesWithMetadata:endDate:completion:](WeakRetained, *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48));
}

void __66__HDQuantitySeriesBuilderTaskServer__queue_discardWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  -[HDQuantitySeriesBuilderTaskServer _queue_discardWithCompletion:](WeakRetained, *(void *)(a1 + 32));
}

__CFString *__85__HDQuantitySeriesBuilderTaskServer__queue_isStateInAllowedStates_description_error___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 integerValue];

  return NSStringFromHDQuantitySeriesBuilderTaskServerState(v2);
}

- (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F2B390] serverInterface];
}

- (id)remoteInterface
{
  return 0;
}

- (id)unitTest_saveSamplesCompletion
{
  return self->_unitTest_saveSamplesCompletion;
}

- (void)setUnitTest_saveSamplesCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTest_saveSamplesCompletion, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong(&self->_queue_activeHandler, 0);
  objc_storeStrong((id *)&self->_fatalError, 0);
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_series, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end