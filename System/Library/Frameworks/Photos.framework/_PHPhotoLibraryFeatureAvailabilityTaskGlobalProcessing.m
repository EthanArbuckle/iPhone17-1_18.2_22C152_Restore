@interface _PHPhotoLibraryFeatureAvailabilityTaskGlobalProcessing
- (BOOL)addAnalysisStateToAvailabilityStatus:(id)a3 error:(id *)a4;
- (void)_addHighlightProcessingToAvailabilityStatus:(id)a3;
- (void)_updateFeatureAvailabilityForAvailabilityStatus:(id)a3;
- (void)executeWithCompletionHandler:(id)a3;
@end

@implementation _PHPhotoLibraryFeatureAvailabilityTaskGlobalProcessing

- (void)_updateFeatureAvailabilityForAvailabilityStatus:(id)a3
{
  id v18 = a3;
  v4 = [(PHPhotoLibraryFeatureAvailabilityTask *)self queue];
  dispatch_assert_queue_V2(v4);

  unsigned int v5 = [v18 photosKnowledgeGraphIsReady];
  [v18 fractionOfStillAssetsWithEmbeddingsInIndex];
  double v7 = v6;
  v8 = [(PHPhotoLibraryFeatureAvailabilityTask *)self availabilityConfig];
  [v8 fractionOfCuratedAssetsWithEmbeddingsInVectorIndexThreshold];
  double v10 = v9;

  [v18 fractionOfHighlightsEnriched];
  double v12 = v11;
  v13 = [(PHPhotoLibraryFeatureAvailabilityTask *)self availabilityConfig];
  [v13 fractionOfHighlightsEnrichedThreshold];
  double v15 = v14;

  if (v7 >= v10) {
    unsigned int v16 = v5;
  }
  else {
    unsigned int v16 = 0;
  }
  if (v12 >= v15) {
    uint64_t v17 = v16;
  }
  else {
    uint64_t v17 = 0;
  }
  [v18 setFeatureAvailability:v17];
}

- (void)_addHighlightProcessingToAvailabilityStatus:(id)a3
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  v4 = [(PHPhotoLibraryFeatureAvailabilityTask *)self queue];
  dispatch_assert_queue_V2(v4);

  PLPhotosSearchGetLog();
  unsigned int v5 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  double v7 = v5;
  v8 = v7;
  os_signpost_id_t spid = v6;
  unint64_t v9 = v6 - 1;
  if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v8, OS_SIGNPOST_INTERVAL_BEGIN, spid, "GlobalProcessingHighlighsProcessing", (const char *)&unk_19B30018E, buf, 2u);
  }

  double v10 = [(PHPhotoLibraryFeatureAvailabilityTask *)self photoLibrary];
  double v11 = [v10 librarySpecificFetchOptions];

  [v11 setShouldPrefetchCount:1];
  double v12 = +[PHAssetCollection fetchAssetCollectionsWithType:6 subtype:0x7FFFFFFFFFFFFFFFLL options:v11];
  unint64_t v13 = [v12 count];
  if (v13)
  {
    double v14 = [(PHPhotoLibraryFeatureAvailabilityTask *)self photoLibrary];
    double v15 = [v14 librarySpecificFetchOptions];

    [v15 setShouldPrefetchCount:1];
    unsigned int v16 = (void *)MEMORY[0x1E4F28BA0];
    uint64_t v17 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"enrichmentState", 4);
    v27[0] = v17;
    id v18 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %K", @"enrichmentVersion", @"highlightVersion");
    v27[1] = v18;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
    v20 = [v16 andPredicateWithSubpredicates:v19];
    [v15 setInternalPredicate:v20];

    v21 = +[PHAssetCollection fetchAssetCollectionsWithType:6 subtype:0x7FFFFFFFFFFFFFFFLL options:v15];
    objc_msgSend(v25, "setFractionOfHighlightsEnriched:", (double)(unint64_t)objc_msgSend(v21, "count") / (double)v13);
  }
  else
  {
    [v25 setFractionOfHighlightsEnriched:1.0];
  }
  v22 = v8;
  v23 = v22;
  if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v23, OS_SIGNPOST_INTERVAL_END, spid, "GlobalProcessingHighlighsProcessing", (const char *)&unk_19B30018E, buf, 2u);
  }
}

- (BOOL)addAnalysisStateToAvailabilityStatus:(id)a3 error:(id *)a4
{
  id v6 = a3;
  double v7 = [(PHPhotoLibraryFeatureAvailabilityTask *)self queue];
  dispatch_assert_queue_V2(v7);

  PLPhotosSearchGetLog();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  double v10 = v8;
  double v11 = v10;
  unint64_t v12 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "GlobalProcessingAddAnalysisStateToAvailability", (const char *)&unk_19B30018E, buf, 2u);
  }

  v18.receiver = self;
  v18.super_class = (Class)_PHPhotoLibraryFeatureAvailabilityTaskGlobalProcessing;
  BOOL v13 = [(PHPhotoLibraryFeatureAvailabilityTask *)&v18 addAnalysisStateToAvailabilityStatus:v6 error:a4];
  if (v13)
  {
    [(_PHPhotoLibraryFeatureAvailabilityTaskGlobalProcessing *)self _addHighlightProcessingToAvailabilityStatus:v6];
    double v14 = v11;
    if (v12 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      double v15 = v14;
      if (os_signpost_enabled(v14))
      {
        *(_WORD *)buf = 0;
LABEL_11:
        _os_signpost_emit_with_name_impl(&dword_19B043000, v15, OS_SIGNPOST_INTERVAL_END, v9, "GlobalProcessingAddAnalysisStateToAvailability", (const char *)&unk_19B30018E, buf, 2u);
      }
    }
  }
  else
  {
    unsigned int v16 = v11;
    if (v12 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      double v15 = v16;
      if (os_signpost_enabled(v16))
      {
        *(_WORD *)buf = 0;
        goto LABEL_11;
      }
    }
  }

  return v13;
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
    _os_signpost_emit_with_name_impl(&dword_19B043000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "GlobalProcessingFeatureAvailability", (const char *)&unk_19B30018E, buf, 2u);
  }

  os_signpost_id_t v9 = objc_alloc_init(PHPhotoLibraryFeatureAvailability);
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
  double v11 = [(PHPhotoLibraryFeatureAvailabilityTask *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87___PHPhotoLibraryFeatureAvailabilityTaskGlobalProcessing_executeWithCompletionHandler___block_invoke;
  block[3] = &unk_1E5845718;
  objc_copyWeak(&v40, location);
  unint64_t v12 = v9;
  v36 = v12;
  v38 = v47;
  v39 = buf;
  BOOL v13 = v10;
  v37 = v13;
  dispatch_async(v11, block);

  dispatch_group_enter(v13);
  double v14 = [(PHPhotoLibraryFeatureAvailabilityTask *)self queue];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __87___PHPhotoLibraryFeatureAvailabilityTaskGlobalProcessing_executeWithCompletionHandler___block_invoke_2;
  v29[3] = &unk_1E5845718;
  objc_copyWeak(&v34, location);
  double v15 = v12;
  v30 = v15;
  v32 = v47;
  v33 = buf;
  unsigned int v16 = v13;
  v31 = v16;
  dispatch_async(v14, v29);

  uint64_t v17 = [(PHPhotoLibraryFeatureAvailabilityTask *)self queue];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3254779904;
  v21[2] = __87___PHPhotoLibraryFeatureAvailabilityTaskGlobalProcessing_executeWithCompletionHandler___block_invoke_3;
  v21[3] = &unk_1EEABE190;
  objc_copyWeak(&v26, location);
  v22 = v15;
  id v23 = v4;
  v24 = v47;
  id v25 = buf;
  v27 = v8;
  os_signpost_id_t v28 = v6;
  objc_super v18 = v8;
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

@end