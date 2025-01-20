@interface _PHPhotoLibraryFeatureAvailabilityTaskMemoryCreation
- (_PHPhotoLibraryFeatureAvailabilityTaskMemoryCreation)initWithFeature:(unint64_t)a3 photoLibrary:(id)a4 availabilityConfig:(id)a5;
- (void)_updateFeatureAvailabilityForAvailabilityStatus:(id)a3;
- (void)executeWithCompletionHandler:(id)a3;
@end

@implementation _PHPhotoLibraryFeatureAvailabilityTaskMemoryCreation

- (void)_updateFeatureAvailabilityForAvailabilityStatus:(id)a3
{
  id v16 = a3;
  v4 = [(PHPhotoLibraryFeatureAvailabilityTask *)self queue];
  dispatch_assert_queue_V2(v4);

  unsigned int v5 = [v16 photosKnowledgeGraphIsReady];
  [v16 fractionOfStillAssetsWithEmbeddingsInIndex];
  double v7 = v6;
  v8 = [(PHPhotoLibraryFeatureAvailabilityTask *)self availabilityConfig];
  [v8 fractionOfCuratedAssetsWithEmbeddingsInVectorIndexThreshold];
  double v10 = v9;

  unint64_t v11 = [v16 numberOfCuratedAssets];
  v12 = [(PHPhotoLibraryFeatureAvailabilityTask *)self availabilityConfig];
  unint64_t v13 = [v12 minimumNumberOfCuratedAssets];

  if (v7 >= v10) {
    unsigned int v14 = v5;
  }
  else {
    unsigned int v14 = 0;
  }
  if (v11 >= v13) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = 0;
  }
  [v16 setFeatureAvailability:v15];
  [v16 setStillAssetEmbeddingsAreIndexedEnough:v7 >= v10];
  [v16 setLibraryHasEnoughCuratedAssets:v11 >= v13];
}

- (void)executeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  PLPhotosSearchGetLog();
  unsigned int v5 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  double v7 = v5;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "MemoriesCreationFeatureAvailability", (const char *)&unk_19B30018E, buf, 2u);
  }

  double v9 = [[PHPhotoLibraryFeatureAvailability alloc] initWithFeature:[(PHPhotoLibraryFeatureAvailabilityTask *)self feature]];
  double v10 = dispatch_group_create();
  objc_initWeak(location, self);
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x2020000000;
  char v48 = 1;
  *(void *)buf = 0;
  v42 = buf;
  uint64_t v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__22849;
  v45 = __Block_byref_object_dispose__22850;
  id v46 = 0;
  dispatch_group_enter(v10);
  unint64_t v11 = [(PHPhotoLibraryFeatureAvailabilityTask *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85___PHPhotoLibraryFeatureAvailabilityTaskMemoryCreation_executeWithCompletionHandler___block_invoke;
  block[3] = &unk_1E5845718;
  objc_copyWeak(&v40, location);
  v12 = v9;
  v36 = v12;
  v38 = v47;
  v39 = buf;
  unint64_t v13 = v10;
  v37 = v13;
  dispatch_async(v11, block);

  dispatch_group_enter(v13);
  unsigned int v14 = [(PHPhotoLibraryFeatureAvailabilityTask *)self queue];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __85___PHPhotoLibraryFeatureAvailabilityTaskMemoryCreation_executeWithCompletionHandler___block_invoke_2;
  v29[3] = &unk_1E5845718;
  objc_copyWeak(&v34, location);
  uint64_t v15 = v12;
  v30 = v15;
  v32 = v47;
  v33 = buf;
  id v16 = v13;
  v31 = v16;
  dispatch_async(v14, v29);

  v17 = [(PHPhotoLibraryFeatureAvailabilityTask *)self queue];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3254779904;
  v21[2] = __85___PHPhotoLibraryFeatureAvailabilityTaskMemoryCreation_executeWithCompletionHandler___block_invoke_3;
  v21[3] = &unk_1EEABE190;
  objc_copyWeak(&v26, location);
  v22 = v15;
  id v23 = v4;
  v24 = v47;
  v25 = buf;
  v27 = v8;
  os_signpost_id_t v28 = v6;
  v18 = v8;
  id v19 = v4;
  v20 = v15;
  dispatch_group_notify(v16, v17, v21);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&v34);

  objc_destroyWeak(&v40);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(v47, 8);
  objc_destroyWeak(location);
}

- (_PHPhotoLibraryFeatureAvailabilityTaskMemoryCreation)initWithFeature:(unint64_t)a3 photoLibrary:(id)a4 availabilityConfig:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)_PHPhotoLibraryFeatureAvailabilityTaskMemoryCreation;
  unsigned int v5 = [(PHPhotoLibraryFeatureAvailabilityTask *)&v9 initWithFeature:a3 photoLibrary:a4 availabilityConfig:a5];
  os_signpost_id_t v6 = v5;
  if (v5) {
    double v7 = v5;
  }

  return v6;
}

@end