@interface GEOReportedProgress
+ (GEOReportedProgress)progressWithTotalUnitCount:(int64_t)a3;
- (BOOL)isCancelled;
- (GEOReportedProgress)initWithTotalUnitCount:(int64_t)a3;
- (NSProgress)progress;
- (NSString)kind;
- (id)cancellationHandler;
- (int64_t)completedUnitCount;
- (int64_t)totalUnitCount;
- (void)addChild:(id)a3 withPendingUnitCount:(int64_t)a4;
- (void)becomeCurrentWithPendingUnitCount:(int64_t)a3;
- (void)cancel;
- (void)resignCurrent;
- (void)setCancellationHandler:(id)a3;
- (void)setCompletedUnitCount:(int64_t)a3;
- (void)setKind:(id)a3;
- (void)setTotalUnitCount:(int64_t)a3;
- (void)setUserInfoObject:(id)a3 forKey:(id)a4;
@end

@implementation GEOReportedProgress

void __46__GEOReportedProgress_setCancellationHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;
}

- (void)resignCurrent
{
}

- (void)becomeCurrentWithPendingUnitCount:(int64_t)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancellationHandler, 0);
  objc_storeStrong((id *)&self->_internalProgress, 0);
  objc_storeStrong((id *)&self->_progress, 0);

  objc_storeStrong((id *)&self->_isolater, 0);
}

- (void)setUserInfoObject:(id)a3 forKey:(id)a4
{
}

- (void)setKind:(id)a3
{
}

- (int64_t)totalUnitCount
{
  return [(NSProgress *)self->_internalProgress totalUnitCount];
}

- (void)setTotalUnitCount:(int64_t)a3
{
}

- (void)setCompletedUnitCount:(int64_t)a3
{
}

- (GEOReportedProgress)initWithTotalUnitCount:(int64_t)a3
{
  v19.receiver = self;
  v19.super_class = (Class)GEOReportedProgress;
  v4 = [(GEOReportedProgress *)&v19 init];
  if (v4)
  {
    uint64_t v5 = geo_isolater_create();
    isolater = v4->_isolater;
    v4->_isolater = (geo_isolater *)v5;

    uint64_t v7 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
    progress = v4->_progress;
    v4->_progress = (NSProgress *)v7;

    uint64_t v9 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:a3];
    internalProgress = v4->_internalProgress;
    v4->_internalProgress = (NSProgress *)v9;

    objc_initWeak(&location, v4);
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __46__GEOReportedProgress_initWithTotalUnitCount___block_invoke;
    v16 = &unk_1E53D7B90;
    objc_copyWeak(&v17, &location);
    [(NSProgress *)v4->_internalProgress setCancellationHandler:&v13];
    -[NSProgress addChild:withPendingUnitCount:](v4->_progress, "addChild:withPendingUnitCount:", v4->_internalProgress, 1, v13, v14, v15, v16);
    v11 = v4;
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v4;
}

- (void)setCancellationHandler:(id)a3
{
  id v3 = a3;
  geo_assert_not_isolated();
  id v4 = v3;
  geo_isolate_sync_data();
}

+ (GEOReportedProgress)progressWithTotalUnitCount:(int64_t)a3
{
  id v3 = [[GEOReportedProgress alloc] initWithTotalUnitCount:a3];

  return v3;
}

void __46__GEOReportedProgress_initWithTotalUnitCount___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x3032000000;
    uint64_t v13 = __Block_byref_object_copy__99;
    uint64_t v14 = __Block_byref_object_dispose__99;
    id v15 = 0;
    id v9 = WeakRetained;
    geo_isolate_sync_data();
    uint64_t v8 = v11[5];
    if (v8) {
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 16))(v8, v3, v4, v5, v6, v7);
    }

    _Block_object_dispose(&v10, 8);
  }
}

void __46__GEOReportedProgress_initWithTotalUnitCount___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x18C120660](*(void *)(*(void *)(a1 + 32) + 32));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSString)kind
{
  return [(NSProgress *)self->_internalProgress kind];
}

- (int64_t)completedUnitCount
{
  return [(NSProgress *)self->_internalProgress completedUnitCount];
}

- (void)addChild:(id)a3 withPendingUnitCount:(int64_t)a4
{
}

- (id)cancellationHandler
{
  geo_assert_not_isolated();
  uint64_t v5 = self->_isolater;
  _geo_isolate_lock_data();
  uint64_t v3 = (void *)MEMORY[0x18C120660](self->_cancellationHandler);
  _geo_isolate_unlock();

  return v3;
}

- (BOOL)isCancelled
{
  return [(NSProgress *)self->_internalProgress isCancelled];
}

- (void)cancel
{
}

void __29__GEOReportedProgress_cancel__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 32);
  *(void *)(v1 + 32) = 0;
}

- (NSProgress)progress
{
  return self->_progress;
}

@end