@interface FMLocationShifter
- (BOOL)isLocationShiftRequiredForItem:(id)a3;
- (BOOL)isLocationShiftRequiredForItems:(id)a3;
- (FMLocationShifter)init;
- (GEOLocationShifter)locationShifter;
- (OS_dispatch_queue)queue;
- (OS_dispatch_semaphore)semaphore;
- (id)shiftLocation:(id)a3 timeout:(double)a4;
- (id)shiftLocations:(id)a3 timeout:(double)a4;
- (void)setLocationShifter:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSemaphore:(id)a3;
- (void)shiftLocation:(id)a3 withCompletionHandler:(id)a4 callbackQueue:(id)a5;
- (void)shiftLocations:(id)a3 withCompletionHandler:(id)a4 callbackQueue:(id)a5;
@end

@implementation FMLocationShifter

- (FMLocationShifter)init
{
  v7.receiver = self;
  v7.super_class = (Class)FMLocationShifter;
  v2 = [(FMLocationShifter *)&v7 init];
  if (v2)
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(1);
    [(FMLocationShifter *)v2 setSemaphore:v3];

    dispatch_queue_t v4 = dispatch_queue_create("com.apple.icloud.fmcore.shifterQueue", 0);
    [(FMLocationShifter *)v2 setQueue:v4];

    id v5 = objc_alloc_init(MEMORY[0x1E4F64670]);
    [(FMLocationShifter *)v2 setLocationShifter:v5];
  }
  return v2;
}

- (BOOL)isLocationShiftRequiredForItem:(id)a3
{
  [a3 coordinate];
  dispatch_semaphore_t v3 = (void *)MEMORY[0x1E4F64670];
  return objc_msgSend(v3, "isLocationShiftRequiredForCoordinate:");
}

- (BOOL)isLocationShiftRequiredForItems:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (-[FMLocationShifter isLocationShiftRequiredForItem:](self, "isLocationShiftRequiredForItem:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11))
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (void)shiftLocation:(id)a3 withCompletionHandler:(id)a4 callbackQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = a5;
  if ([(FMLocationShifter *)self isLocationShiftRequiredForItem:v8])
  {
    [v8 coordinate];
    uint64_t v12 = v11;
    uint64_t v14 = v13;
    [v8 accuracy];
    uint64_t v16 = v15;
    v17 = [(FMLocationShifter *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__FMLocationShifter_shiftLocation_withCompletionHandler_callbackQueue___block_invoke;
    block[3] = &unk_1E689E848;
    uint64_t v30 = v12;
    uint64_t v31 = v14;
    uint64_t v32 = v16;
    block[4] = self;
    id v27 = v8;
    v28 = v10;
    id v29 = v9;
    id v18 = v8;
    id v19 = v9;
    dispatch_async(v17, block);

    v20 = v27;
  }
  else
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __71__FMLocationShifter_shiftLocation_withCompletionHandler_callbackQueue___block_invoke_59;
    v23[3] = &unk_1E689E7D0;
    id v24 = v8;
    id v25 = v9;
    id v21 = v8;
    id v22 = v9;
    dispatch_async(v10, v23);

    v20 = v25;
  }
}

void __71__FMLocationShifter_shiftLocation_withCompletionHandler_callbackQueue___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) semaphore];
  dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);

  dispatch_semaphore_t v3 = [*(id *)(a1 + 32) locationShifter];
  double v4 = *(double *)(a1 + 80);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__FMLocationShifter_shiftLocation_withCompletionHandler_callbackQueue___block_invoke_2;
  v12[3] = &unk_1E689E7F8;
  id v13 = *(id *)(a1 + 40);
  id v14 = *(id *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v5;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__FMLocationShifter_shiftLocation_withCompletionHandler_callbackQueue___block_invoke_4;
  v9[3] = &unk_1E689E820;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 32);
  id v10 = v6;
  uint64_t v11 = v7;
  id v8 = dispatch_get_global_queue(21, 0);
  objc_msgSend(v3, "shiftCoordinate:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:", v12, 0, v9, v8, *(double *)(a1 + 64), *(double *)(a1 + 72), v4);
}

void __71__FMLocationShifter_shiftLocation_withCompletionHandler_callbackQueue___block_invoke_2(uint64_t a1, double a2, double a3, double a4)
{
  id v8 = [FMLocationShifterItem alloc];
  id v9 = [*(id *)(a1 + 32) timestamp];
  id v10 = [*(id *)(a1 + 32) context];
  uint64_t v11 = -[FMLocationShifterItem initWithCoordinate:accuracy:timestamp:context:](v8, "initWithCoordinate:accuracy:timestamp:context:", v9, v10, a2, a3, a4);

  [(FMLocationShifterItem *)v11 setShifted:1];
  uint64_t v12 = *(NSObject **)(a1 + 40);
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = __71__FMLocationShifter_shiftLocation_withCompletionHandler_callbackQueue___block_invoke_3;
  id v19 = &unk_1E689E7D0;
  id v13 = *(id *)(a1 + 56);
  v20 = v11;
  id v21 = v13;
  id v14 = v11;
  dispatch_async(v12, &v16);
  uint64_t v15 = objc_msgSend(*(id *)(a1 + 48), "semaphore", v16, v17, v18, v19);
  dispatch_semaphore_signal(v15);
}

uint64_t __71__FMLocationShifter_shiftLocation_withCompletionHandler_callbackQueue___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __71__FMLocationShifter_shiftLocation_withCompletionHandler_callbackQueue___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = [FMLocationShifterItem alloc];
  [*(id *)(a1 + 32) coordinate];
  double v6 = v5;
  double v8 = v7;
  [*(id *)(a1 + 32) accuracy];
  double v10 = v9;
  uint64_t v11 = [*(id *)(a1 + 32) timestamp];
  uint64_t v12 = [*(id *)(a1 + 32) context];
  id v13 = -[FMLocationShifterItem initWithCoordinate:accuracy:timestamp:context:](v4, "initWithCoordinate:accuracy:timestamp:context:", v11, v12, v6, v8, v10);

  [(FMLocationShifterItem *)v13 setError:v3];
  id v14 = LogCategory_Unspecified();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    __71__FMLocationShifter_shiftLocation_withCompletionHandler_callbackQueue___block_invoke_4_cold_1((uint64_t)v3, v14);
  }

  uint64_t v15 = [*(id *)(a1 + 40) semaphore];
  dispatch_semaphore_signal(v15);
}

uint64_t __71__FMLocationShifter_shiftLocation_withCompletionHandler_callbackQueue___block_invoke_59(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)shiftLocations:(id)a3 withCompletionHandler:(id)a4 callbackQueue:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  double v9 = a4;
  double v10 = a5;
  if ([(FMLocationShifter *)self isLocationShiftRequiredForItems:v8])
  {
    v23 = v9;
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.icloud.fmcore.multishift.shiftSerialQueue", 0);
    uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v8, "count"));
    id v13 = dispatch_group_create();
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v24 = v8;
    id obj = v8;
    uint64_t v14 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v37;
      do
      {
        uint64_t v17 = 0;
        do
        {
          id v18 = v10;
          if (*(void *)v37 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(void *)(*((void *)&v36 + 1) + 8 * v17);
          dispatch_group_enter(v13);
          v32[0] = MEMORY[0x1E4F143A8];
          v32[1] = 3221225472;
          v32[2] = __72__FMLocationShifter_shiftLocations_withCompletionHandler_callbackQueue___block_invoke;
          v32[3] = &unk_1E689E870;
          v33 = v11;
          id v34 = v12;
          v35 = v13;
          uint64_t v20 = v19;
          double v10 = v18;
          [(FMLocationShifter *)self shiftLocation:v20 withCompletionHandler:v32 callbackQueue:v18];

          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v15);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__FMLocationShifter_shiftLocations_withCompletionHandler_callbackQueue___block_invoke_3;
    block[3] = &unk_1E689E7D0;
    id v30 = v12;
    uint64_t v31 = v23;
    id v21 = v23;
    id v22 = v12;
    dispatch_group_notify(v13, v10, block);

    id v8 = v24;
  }
  else
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __72__FMLocationShifter_shiftLocations_withCompletionHandler_callbackQueue___block_invoke_4;
    v26[3] = &unk_1E689E7D0;
    v28 = v9;
    id v27 = v8;
    dispatch_queue_t v11 = v9;
    dispatch_async(v10, v26);

    id v13 = v28;
  }
}

void __72__FMLocationShifter_shiftLocations_withCompletionHandler_callbackQueue___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72__FMLocationShifter_shiftLocations_withCompletionHandler_callbackQueue___block_invoke_2;
  v6[3] = &unk_1E689E690;
  double v4 = *(NSObject **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v5 = v3;
  dispatch_sync(v4, v6);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __72__FMLocationShifter_shiftLocations_withCompletionHandler_callbackQueue___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
}

uint64_t __72__FMLocationShifter_shiftLocations_withCompletionHandler_callbackQueue___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __72__FMLocationShifter_shiftLocations_withCompletionHandler_callbackQueue___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_semaphore)semaphore
{
  return self->_semaphore;
}

- (void)setSemaphore:(id)a3
{
}

- (GEOLocationShifter)locationShifter
{
  return self->_locationShifter;
}

- (void)setLocationShifter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationShifter, 0);
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id)shiftLocation:(id)a3 timeout:(double)a4
{
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__1;
  id v22 = __Block_byref_object_dispose__1;
  id v6 = a3;
  id v23 = v6;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F61568]) initWithDescription:@"shiftLocation" andTimeout:a4];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __56__FMLocationShifter_Synchronous__shiftLocation_timeout___block_invoke;
  uint64_t v15 = &unk_1E689E960;
  uint64_t v17 = &v18;
  id v8 = v7;
  id v16 = v8;
  double v9 = dispatch_get_global_queue(21, 0);
  [(FMLocationShifter *)self shiftLocation:v6 withCompletionHandler:&v12 callbackQueue:v9];

  objc_msgSend(v8, "wait", v12, v13, v14, v15);
  id v10 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v10;
}

void __56__FMLocationShifter_Synchronous__shiftLocation_timeout___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  [*(id *)(a1 + 32) signal];
}

- (id)shiftLocations:(id)a3 timeout:(double)a4
{
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__1;
  id v22 = __Block_byref_object_dispose__1;
  id v6 = a3;
  id v23 = v6;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F61568]) initWithDescription:@"shiftLocations" andTimeout:a4];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __57__FMLocationShifter_Synchronous__shiftLocations_timeout___block_invoke;
  uint64_t v15 = &unk_1E689E988;
  uint64_t v17 = &v18;
  id v8 = v7;
  id v16 = v8;
  double v9 = dispatch_get_global_queue(21, 0);
  [(FMLocationShifter *)self shiftLocations:v6 withCompletionHandler:&v12 callbackQueue:v9];

  objc_msgSend(v8, "wait", v12, v13, v14, v15);
  id v10 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v10;
}

void __57__FMLocationShifter_Synchronous__shiftLocations_timeout___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  [*(id *)(a1 + 32) signal];
}

void __71__FMLocationShifter_shiftLocation_withCompletionHandler_callbackQueue___block_invoke_4_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0EC4000, a2, OS_LOG_TYPE_ERROR, "GEOLocationShifter error: %@", (uint8_t *)&v2, 0xCu);
}

@end