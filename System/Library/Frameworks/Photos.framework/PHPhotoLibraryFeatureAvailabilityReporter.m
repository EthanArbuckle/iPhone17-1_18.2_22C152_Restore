@interface PHPhotoLibraryFeatureAvailabilityReporter
- (PHPhotoLibraryFeatureAvailabilityReporter)initWithPhotoLibrary:(id)a3;
- (void)availabilityForFeature:(unint64_t)a3 completionHandler:(id)a4;
- (void)availabilityStatusForFeature:(unint64_t)a3 availabilityConfig:(id)a4 completionHandler:(id)a5;
- (void)availabilityStatusForFeature:(unint64_t)a3 completionHandler:(id)a4;
@end

@implementation PHPhotoLibraryFeatureAvailabilityReporter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tasks, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

- (void)availabilityForFeature:(unint64_t)a3 completionHandler:(id)a4
{
  v6 = (void (**)(id, void *, id))a4;
  v7 = objc_alloc_init(PHFeatureAvailabilityReadOptions);
  photoLibrary = self->_photoLibrary;
  id v11 = 0;
  v9 = [(PHPhotoLibrary *)photoLibrary featureAvailabilityForFeature:a3 readOptions:v7 error:&v11];
  id v10 = v11;
  v6[2](v6, v9, v10);
}

- (void)availabilityStatusForFeature:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v7 = [[PHFeatureAvailabilityConfig alloc] initWithFeature:a3];
  [(PHPhotoLibraryFeatureAvailabilityReporter *)self availabilityStatusForFeature:a3 availabilityConfig:v7 completionHandler:v6];
}

- (void)availabilityStatusForFeature:(unint64_t)a3 availabilityConfig:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  photoLibrary = self->_photoLibrary;
  id v19 = 0;
  id v10 = +[PHPhotoLibraryFeatureAvailabilityTask availabilityStatusTaskForFeature:a3 photoLibrary:photoLibrary availabilityConfig:a4 error:&v19];
  id v11 = v19;
  if (v10)
  {
    os_unfair_lock_lock(&self->_lock_tasks);
    tasks = self->_tasks;
    v13 = [v10 taskID];
    [(NSMutableDictionary *)tasks setObject:v10 forKeyedSubscript:v13];

    os_unfair_lock_unlock(&self->_lock_tasks);
    queue = self->_queue;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __111__PHPhotoLibraryFeatureAvailabilityReporter_availabilityStatusForFeature_availabilityConfig_completionHandler___block_invoke;
    v15[3] = &unk_1E58487E0;
    id v16 = v10;
    v17 = self;
    id v18 = v8;
    dispatch_async(queue, v15);
  }
  else
  {
    (*((void (**)(id, void, id))v8 + 2))(v8, 0, v11);
  }
}

void __111__PHPhotoLibraryFeatureAvailabilityReporter_availabilityStatusForFeature_availabilityConfig_completionHandler___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __111__PHPhotoLibraryFeatureAvailabilityReporter_availabilityStatusForFeature_availabilityConfig_completionHandler___block_invoke_2;
  v4[3] = &unk_1E5846808;
  int8x16_t v3 = *(int8x16_t *)(a1 + 32);
  id v2 = (id)v3.i64[0];
  int8x16_t v5 = vextq_s8(v3, v3, 8uLL);
  id v6 = *(id *)(a1 + 48);
  [v2 executeWithCompletionHandler:v4];
}

void __111__PHPhotoLibraryFeatureAvailabilityReporter_availabilityStatusForFeature_availabilityConfig_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  int8x16_t v5 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 32);
  id v6 = a3;
  id v9 = a2;
  os_unfair_lock_lock(v5);
  v7 = *(void **)(*(void *)(a1 + 32) + 24);
  id v8 = [*(id *)(a1 + 40) taskID];
  [v7 setObject:0 forKeyedSubscript:v8];

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 32));
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (PHPhotoLibraryFeatureAvailabilityReporter)initWithPhotoLibrary:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PHPhotoLibraryFeatureAvailabilityReporter;
  id v6 = [(PHPhotoLibraryFeatureAvailabilityReporter *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    id v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.photolibrary.availability-reporter", v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

    id v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    tasks = v7->_tasks;
    v7->_tasks = v11;

    v7->_lock_tasks._os_unfair_lock_opaque = 0;
    v13 = v7;
  }

  return v7;
}

@end