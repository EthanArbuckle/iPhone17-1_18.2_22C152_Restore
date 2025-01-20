@interface CLSLocationShifter
+ (BOOL)isLocationShiftRequiredForCoordinate:(id)a3;
+ (id)sharedLocationShifter;
- ($F24F406B2B787EFB06265DBA3D28CBD5)shiftedCoordinateForOriginalCoordinate:(id)a3;
- (CLSLocationShifter)init;
- (GEOLocationShifter)locationShifter;
- (OS_dispatch_queue)locationShiftQueue;
@end

@implementation CLSLocationShifter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationShifter, 0);
  objc_storeStrong((id *)&self->_locationShiftQueue, 0);
}

- (GEOLocationShifter)locationShifter
{
  return self->_locationShifter;
}

- (OS_dispatch_queue)locationShiftQueue
{
  return self->_locationShiftQueue;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)shiftedCoordinateForOriginalCoordinate:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  if (objc_msgSend(MEMORY[0x1E4F64670], "isLocationShiftRequiredForCoordinate:"))
  {
    v6 = self;
    objc_sync_enter(v6);
    uint64_t v20 = 0;
    v21 = (double *)&v20;
    uint64_t v22 = 0x3010000000;
    v24[0] = 0;
    v24[1] = 0;
    v23 = &unk_1D21D0707;
    if ((-[GEOLocationShifter shiftCoordinate:accuracy:shiftedCoordinate:shiftedAccuracy:](v6->_locationShifter, "shiftCoordinate:accuracy:shiftedCoordinate:shiftedAccuracy:", v24, 0, var0, var1, 0.0) & 1) == 0)
    {
      dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
      locationShifter = v6->_locationShifter;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __61__CLSLocationShifter_shiftedCoordinateForOriginalCoordinate___block_invoke;
      v17[3] = &unk_1E690F6B8;
      v19 = &v20;
      v18 = v7;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __61__CLSLocationShifter_shiftedCoordinateForOriginalCoordinate___block_invoke_2;
      v12[3] = &unk_1E690F6E0;
      v14 = &v20;
      double v15 = var0;
      double v16 = var1;
      v9 = v18;
      v13 = v9;
      -[GEOLocationShifter shiftCoordinate:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:](locationShifter, "shiftCoordinate:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:", v17, 0, v12, v6->_locationShiftQueue, var0, var1, 0.0);
      dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
    }
    double var0 = v21[4];
    double var1 = v21[5];
    _Block_object_dispose(&v20, 8);
    objc_sync_exit(v6);
  }
  double v10 = var0;
  double v11 = var1;
  result.double var1 = v11;
  result.double var0 = v10;
  return result;
}

intptr_t __61__CLSLocationShifter_shiftedCoordinateForOriginalCoordinate___block_invoke(uint64_t a1, double a2, double a3)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  *(double *)(v3 + 32) = a2;
  *(double *)(v3 + 40) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __61__CLSLocationShifter_shiftedCoordinateForOriginalCoordinate___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = +[CLSLogging sharedLogging];
  v5 = [v4 loggingConnection];

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_error_impl(&dword_1D2150000, v5, OS_LOG_TYPE_ERROR, "Shifted location error:%@", (uint8_t *)&v6, 0xCu);
  }

  *(_OWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = *(_OWORD *)(a1 + 48);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (CLSLocationShifter)init
{
  v10.receiver = self;
  v10.super_class = (Class)CLSLocationShifter;
  v2 = [(CLSLocationShifter *)&v10 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v5 = dispatch_queue_create("Shifter queue", v4);
    locationShiftQueue = v2->_locationShiftQueue;
    v2->_locationShiftQueue = (OS_dispatch_queue *)v5;

    id v7 = (GEOLocationShifter *)objc_alloc_init(MEMORY[0x1E4F64670]);
    locationShifter = v2->_locationShifter;
    v2->_locationShifter = v7;
  }
  return v2;
}

+ (BOOL)isLocationShiftRequiredForCoordinate:(id)a3
{
  return objc_msgSend(MEMORY[0x1E4F64670], "isLocationShiftRequiredForCoordinate:", a3.var0, a3.var1);
}

+ (id)sharedLocationShifter
{
  if (sharedLocationShifter_onceToken != -1) {
    dispatch_once(&sharedLocationShifter_onceToken, &__block_literal_global_2165);
  }
  v2 = (void *)sharedLocationShifter_sharedLocationShifter;
  return v2;
}

uint64_t __43__CLSLocationShifter_sharedLocationShifter__block_invoke()
{
  sharedLocationShifter_sharedLocationShifter = objc_alloc_init(CLSLocationShifter);
  return MEMORY[0x1F41817F8]();
}

@end