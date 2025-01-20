@interface PHPhotoLibraryFeatureAvailabilityTask
+ (id)availabilityStatusTaskForFeature:(unint64_t)a3 photoLibrary:(id)a4 availabilityConfig:(id)a5 error:(id *)a6;
- (BOOL)_recordCaptionAndEmbeddingAnalysisToAvailability:(id)a3 error:(id *)a4;
- (BOOL)_recordFaceAndSceneAnalysisToAvailability:(id)a3 error:(id *)a4;
- (BOOL)addAnalysisStateToAvailabilityStatus:(id)a3 error:(id *)a4;
- (BOOL)addGraphAvailabilityToAvailabilityStatus:(id)a3 error:(id *)a4;
- (BOOL)addIndexingStateToAvailabilityStatus:(id)a3 error:(id *)a4;
- (NSString)taskID;
- (OS_dispatch_queue)queue;
- (PHFeatureAvailabilityConfig)availabilityConfig;
- (PHMediaProcessingAlgorithmVersionProvider)versionProvider;
- (PHPhotoLibrary)photoLibrary;
- (PHPhotoLibraryFeatureAvailabilityTask)initWithFeature:(unint64_t)a3 photoLibrary:(id)a4 availabilityConfig:(id)a5;
- (double)_fractionOfAssetsProcessedForPrioritiesByMediaTaskIDs:(id)a3 error:(id *)a4;
- (unint64_t)feature;
- (void)computeSearchDonationProgressForTaskID:(unint64_t)a3 libraryClient:(id)a4 completionHandler:(id)a5;
- (void)executeWithCompletionHandler:(id)a3;
@end

@implementation PHPhotoLibraryFeatureAvailabilityTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionProvider, 0);
  objc_storeStrong((id *)&self->_availabilityConfig, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);

  objc_storeStrong((id *)&self->_taskID, 0);
}

- (PHMediaProcessingAlgorithmVersionProvider)versionProvider
{
  return self->_versionProvider;
}

- (PHFeatureAvailabilityConfig)availabilityConfig
{
  return self->_availabilityConfig;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (unint64_t)feature
{
  return self->_feature;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (NSString)taskID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (double)_fractionOfAssetsProcessedForPrioritiesByMediaTaskIDs:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(PHPhotoLibraryFeatureAvailabilityTask *)self photoLibrary];
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  uint64_t v36 = 0;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__22849;
  v23 = __Block_byref_object_dispose__22850;
  id v24 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __101__PHPhotoLibraryFeatureAvailabilityTask__fractionOfAssetsProcessedForPrioritiesByMediaTaskIDs_error___block_invoke;
  v12[3] = &unk_1E5845740;
  id v8 = v7;
  v15 = &v19;
  v16 = &v25;
  id v13 = v8;
  v14 = self;
  v17 = &v33;
  v18 = &v29;
  [v6 enumerateKeysAndObjectsUsingBlock:v12];
  if (*((unsigned char *)v26 + 24))
  {
    double v9 = 0.0;
    if (a4) {
      *a4 = (id) v20[5];
    }
  }
  else
  {
    unint64_t v10 = v34[3];
    if (v10) {
      double v9 = (double)(unint64_t)v30[3] / (double)v10;
    }
    else {
      double v9 = 1.0;
    }
  }

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);

  return v9;
}

void __101__PHPhotoLibraryFeatureAvailabilityTask__fractionOfAssetsProcessedForPrioritiesByMediaTaskIDs_error___block_invoke(void *a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  obuint64_t j = a3;
  uint64_t v7 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v41;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v41 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        id v13 = (void *)a1[4];
        uint64_t v14 = [v6 unsignedIntValue];
        unsigned int v15 = [v12 unsignedIntValue];
        uint64_t v16 = *(void *)(a1[6] + 8);
        id v39 = *(id *)(v16 + 40);
        uint64_t v17 = [v13 countOfAllAssetsForMediaProcessingTaskID:v14 priority:v15 sceneConfidenceThreshold:&v39 error:0.0];
        objc_storeStrong((id *)(v16 + 40), v39);
        if (*(void *)(*(void *)(a1[6] + 8) + 40))
        {
          *a4 = 1;
          *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
          v18 = obj;

          goto LABEL_25;
        }
        v9 += v17;
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v31 = obj;
  uint64_t v19 = [v31 countByEnumeratingWithState:&v35 objects:v44 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = 0;
    uint64_t v32 = *(void *)v36;
    while (2)
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v36 != v32) {
          objc_enumerationMutation(v31);
        }
        v23 = *(void **)(*((void *)&v35 + 1) + 8 * j);
        id v24 = (void *)a1[4];
        uint64_t v25 = [v6 unsignedIntValue];
        unsigned int v26 = [v23 unsignedIntValue];
        uint64_t v27 = *(void *)(a1[5] + 56);
        uint64_t v28 = *(void *)(a1[6] + 8);
        id v34 = *(id *)(v28 + 40);
        uint64_t v29 = [v24 countOfProcessedAssetsForMediaProcessingTaskID:v25 priority:v26 algorithmVersion:v27 sceneConfidenceThreshold:&v34 error:0.0];
        objc_storeStrong((id *)(v28 + 40), v34);
        if (*(void *)(*(void *)(a1[6] + 8) + 40))
        {
          *a4 = 1;
          *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;

          goto LABEL_24;
        }
        v21 += v29;
      }
      uint64_t v20 = [v31 countByEnumeratingWithState:&v35 objects:v44 count:16];
      if (v20) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v21 = 0;
  }

  *(void *)(*(void *)(a1[8] + 8) + 24) += v9;
  *(void *)(*(void *)(a1[9] + 8) + 24) += v21;
LABEL_24:
  v18 = obj;
LABEL_25:
}

- (BOOL)_recordCaptionAndEmbeddingAnalysisToAvailability:(id)a3 error:(id *)a4
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  PLPhotosSearchGetLog();
  uint64_t v7 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  uint64_t v9 = v7;
  uint64_t v10 = v9;
  unint64_t v11 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "RecordCaptionAndEmbeddingAnalysisToAvailability", (const char *)&unk_19B30018E, buf, 2u);
  }

  uint64_t v33 = &unk_1EEB25A70;
  v34[0] = &unk_1EEB26A90;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
  id v29 = 0;
  [(PHPhotoLibraryFeatureAvailabilityTask *)self _fractionOfAssetsProcessedForPrioritiesByMediaTaskIDs:v12 error:&v29];
  double v14 = v13;
  unsigned int v15 = v29;
  if (v15)
  {
    uint64_t v16 = v15;
    if (a4) {
      *a4 = v15;
    }
    uint64_t v17 = v10;
    v18 = v17;
    if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19B043000, v18, OS_SIGNPOST_INTERVAL_END, v8, "RecordCaptionAndEmbeddingAnalysisToAvailability", (const char *)&unk_19B30018E, buf, 2u);
    }

    BOOL v19 = 0;
  }
  else
  {
    v31[0] = &unk_1EEB25A88;
    v31[1] = &unk_1EEB25A70;
    v32[0] = &unk_1EEB26AA8;
    v32[1] = &unk_1EEB26AC0;
    uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];

    id v28 = 0;
    [(PHPhotoLibraryFeatureAvailabilityTask *)self _fractionOfAssetsProcessedForPrioritiesByMediaTaskIDs:v20 error:&v28];
    double v22 = v21;
    v23 = v28;
    if (v23)
    {
      uint64_t v16 = v23;
      if (a4) {
        *a4 = v23;
      }
      id v24 = v10;
      uint64_t v25 = v24;
      if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_19B043000, v25, OS_SIGNPOST_INTERVAL_END, v8, "RecordCaptionAndEmbeddingAnalysisToAvailability", (const char *)&unk_19B30018E, buf, 2u);
      }

      BOOL v19 = 0;
    }
    else
    {
      [v6 setFractionOfCuratedAssetsWithCaptions:v14];
      [v6 setFractionOfCuratedAssetsWithEmbeddings:v14];
      [v6 setFractionOfAssetsWithCaptions:v22];
      [v6 setFractionOfAssetsWithEmbeddings:v22];
      unsigned int v26 = v10;
      uint64_t v16 = v26;
      if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_19B043000, v16, OS_SIGNPOST_INTERVAL_END, v8, "RecordCaptionAndEmbeddingAnalysisToAvailability", (const char *)&unk_19B30018E, buf, 2u);
      }
      BOOL v19 = 1;
    }
    v12 = (void *)v20;
  }

  return v19;
}

- (BOOL)_recordFaceAndSceneAnalysisToAvailability:(id)a3 error:(id *)a4
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  PLPhotosSearchGetLog();
  uint64_t v7 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  uint64_t v9 = v7;
  uint64_t v10 = v9;
  unint64_t v11 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "RecordFaceAndSceneAnalysisToAvailability", (const char *)&unk_19B30018E, buf, 2u);
  }

  uint64_t v33 = &unk_1EEB25A28;
  v34[0] = &unk_1EEB26A60;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
  id v29 = 0;
  [(PHPhotoLibraryFeatureAvailabilityTask *)self _fractionOfAssetsProcessedForPrioritiesByMediaTaskIDs:v12 error:&v29];
  double v14 = v13;
  unsigned int v15 = v29;
  if (v15)
  {
    uint64_t v16 = v15;
    if (a4) {
      *a4 = v15;
    }
    uint64_t v17 = v10;
    v18 = v17;
    if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19B043000, v18, OS_SIGNPOST_INTERVAL_END, v8, "RecordFaceAndSceneAnalysisToAvailability", (const char *)&unk_19B30018E, buf, 2u);
    }

    BOOL v19 = 0;
  }
  else
  {
    id v31 = &unk_1EEB25A58;
    uint64_t v32 = &unk_1EEB26A78;
    uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];

    id v28 = 0;
    [(PHPhotoLibraryFeatureAvailabilityTask *)self _fractionOfAssetsProcessedForPrioritiesByMediaTaskIDs:v20 error:&v28];
    double v22 = v21;
    v23 = v28;
    if (v23)
    {
      uint64_t v16 = v23;
      if (a4) {
        *a4 = v23;
      }
      id v24 = v10;
      uint64_t v25 = v24;
      if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_19B043000, v25, OS_SIGNPOST_INTERVAL_END, v8, "RecordFaceAndSceneAnalysisToAvailability", (const char *)&unk_19B30018E, buf, 2u);
      }

      BOOL v19 = 0;
    }
    else
    {
      [v6 setFractionOfAssetsWithFaceAnalysis:v14];
      [v6 setFractionOfAssetsWithSceneAnalysis:v22];
      unsigned int v26 = v10;
      uint64_t v16 = v26;
      if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_19B043000, v16, OS_SIGNPOST_INTERVAL_END, v8, "RecordFaceAndSceneAnalysisToAvailability", (const char *)&unk_19B30018E, buf, 2u);
      }
      BOOL v19 = 1;
    }
    v12 = (void *)v20;
  }

  return v19;
}

- (BOOL)addIndexingStateToAvailabilityStatus:(id)a3 error:(id *)a4
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  PLPhotosSearchGetLog();
  uint64_t v7 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  uint64_t v9 = v7;
  uint64_t v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "AddIndexingStateToAvailability", (const char *)&unk_19B30018E, buf, 2u);
  }

  photoLibrary = self->_photoLibrary;
  id v24 = 0;
  unint64_t v12 = [(PHPhotoLibrary *)photoLibrary countOfAllAssetsForMediaProcessingTaskID:17 priority:1 sceneConfidenceThreshold:&v24 error:0.0];
  id v13 = v24;
  if (v13)
  {
    if (a4)
    {
LABEL_6:
      id v13 = v13;
      BOOL v14 = 0;
      *a4 = v13;
      goto LABEL_17;
    }
LABEL_9:
    BOOL v14 = 0;
    goto LABEL_17;
  }
  [v6 setNumberOfCuratedAssets:v12];
  unsigned int v15 = self->_photoLibrary;
  versionProvider = self->_versionProvider;
  id v23 = 0;
  unint64_t v17 = [(PHPhotoLibrary *)v15 countOfProcessedAssetsForMediaProcessingTaskID:17 priority:1 algorithmVersion:versionProvider sceneConfidenceThreshold:&v23 error:0.0];
  id v13 = v23;
  if (v13)
  {
    if (a4) {
      goto LABEL_6;
    }
    goto LABEL_9;
  }
  if (v12) {
    double v18 = (double)v17 / (double)v12;
  }
  else {
    double v18 = 0.0;
  }
  double v19 = fmin(v18, 1.0);
  [v6 setFractionOfStillAssetsWithEmbeddingsInIndex:v19];
  [v6 setFractionOfStillAssetsWithCaptions:v19];
  uint64_t v20 = v10;
  double v21 = v20;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v21, OS_SIGNPOST_INTERVAL_END, v8, "AddIndexingStateToAvailability", (const char *)&unk_19B30018E, buf, 2u);
  }

  id v13 = 0;
  BOOL v14 = 1;
LABEL_17:

  return v14;
}

- (BOOL)addGraphAvailabilityToAvailabilityStatus:(id)a3 error:(id *)a4
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  PLPhotosSearchGetLog();
  uint64_t v7 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  uint64_t v9 = v7;
  uint64_t v10 = v9;
  unint64_t v11 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PhotosKnowledgeGraphAvailability", (const char *)&unk_19B30018E, buf, 2u);
  }

  unint64_t v12 = [(PHPhotoLibrary *)self->_photoLibrary photoAnalysisClient];
  id v13 = v12;
  if (v12)
  {
    BOOL v14 = [v12 requestGraphStatus:a4];
    unsigned int v15 = v14;
    BOOL v16 = v14 != 0;
    if (v14)
    {
      objc_msgSend(v6, "setPhotosKnowledgeGraphIsReady:", -[NSObject availability](v14, "availability") == 2);
      unint64_t v17 = v10;
      if (v11 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_21;
      }
      double v18 = v17;
      if (!os_signpost_enabled(v17)) {
        goto LABEL_21;
      }
      __int16 v23 = 0;
      double v19 = (uint8_t *)&v23;
    }
    else
    {
      if (a4)
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithCode:localizedDescription:", -1, @"Could not get graph status.");
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      double v21 = v10;
      if (v11 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_21;
      }
      double v18 = v21;
      if (!os_signpost_enabled(v21)) {
        goto LABEL_21;
      }
      *(_WORD *)id v24 = 0;
      double v19 = v24;
    }
    _os_signpost_emit_with_name_impl(&dword_19B043000, v18, OS_SIGNPOST_INTERVAL_END, v8, "PhotosKnowledgeGraphAvailability", (const char *)&unk_19B30018E, v19, 2u);
LABEL_21:

    goto LABEL_22;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithCode:localizedDescription:", -1, @"Could not get PhotoAnalysis client.");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v20 = v10;
  unsigned int v15 = v20;
  if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)uint64_t v25 = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v15, OS_SIGNPOST_INTERVAL_END, v8, "PhotosKnowledgeGraphAvailability", (const char *)&unk_19B30018E, v25, 2u);
  }
  BOOL v16 = 0;
LABEL_22:

  return v16;
}

- (BOOL)addAnalysisStateToAvailabilityStatus:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(PHPhotoLibraryFeatureAvailabilityTask *)self queue];
  dispatch_assert_queue_V2(v7);

  PLPhotosSearchGetLog();
  os_signpost_id_t v8 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  uint64_t v10 = v8;
  unint64_t v11 = v10;
  unint64_t v12 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "AddAnalysisStateToAvailability", (const char *)&unk_19B30018E, buf, 2u);
  }

  id v13 = [(PHPhotoLibraryFeatureAvailabilityTask *)self photoLibrary];
  BOOL v14 = [v13 photoAnalysisClient];

  if (v14)
  {
    id v31 = 0;
    BOOL v15 = [(PHPhotoLibraryFeatureAvailabilityTask *)self _recordFaceAndSceneAnalysisToAvailability:v6 error:&v31];
    BOOL v16 = v31;
    unint64_t v17 = v16;
    if (!v15)
    {
      if (a4) {
        *a4 = v16;
      }
      unsigned int v26 = v11;
      double v21 = v26;
      if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_19B043000, v21, OS_SIGNPOST_INTERVAL_END, v9, "AddAnalysisStateToAvailability", (const char *)&unk_19B30018E, buf, 2u);
      }
      BOOL v22 = 0;
      double v19 = v17;
      goto LABEL_34;
    }
    v30 = v16;
    BOOL v18 = [(PHPhotoLibraryFeatureAvailabilityTask *)self _recordCaptionAndEmbeddingAnalysisToAvailability:v6 error:&v30];
    double v19 = v30;

    if (!v18)
    {
      if (a4) {
        *a4 = v19;
      }
      uint64_t v27 = v11;
      double v21 = v27;
      if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_19B043000, v21, OS_SIGNPOST_INTERVAL_END, v9, "AddAnalysisStateToAvailability", (const char *)&unk_19B30018E, buf, 2u);
      }
      BOOL v22 = 0;
      goto LABEL_34;
    }
    uint64_t v20 = [v14 requestGraphStatus:a4];
    double v21 = v20;
    BOOL v22 = v20 != 0;
    if (v20)
    {
      objc_msgSend(v6, "setPhotosKnowledgeGraphIsReady:", -[NSObject availability](v20, "availability") == 2);
      __int16 v23 = v11;
      if (v12 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_33;
      }
      id v24 = v23;
      if (!os_signpost_enabled(v23)) {
        goto LABEL_33;
      }
      *(_WORD *)buf = 0;
    }
    else
    {
      id v28 = v11;
      if (v12 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_33;
      }
      id v24 = v28;
      if (!os_signpost_enabled(v28)) {
        goto LABEL_33;
      }
      *(_WORD *)buf = 0;
    }
    _os_signpost_emit_with_name_impl(&dword_19B043000, v24, OS_SIGNPOST_INTERVAL_END, v9, "AddAnalysisStateToAvailability", (const char *)&unk_19B30018E, buf, 2u);
LABEL_33:

LABEL_34:
    goto LABEL_35;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithCode:localizedDescription:", -1, @"Could not get PhotoAnalysis client.");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v25 = v11;
  double v19 = v25;
  if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v19, OS_SIGNPOST_INTERVAL_END, v9, "AddAnalysisStateToAvailability", (const char *)&unk_19B30018E, buf, 2u);
  }
  BOOL v22 = 0;
LABEL_35:

  return v22;
}

- (void)computeSearchDonationProgressForTaskID:(unint64_t)a3 libraryClient:(id)a4 completionHandler:(id)a5
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  PLPhotosSearchGetLog();
  uint64_t v10 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);

  unint64_t v12 = v10;
  id v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "ComputeSearchDonationProgress", (const char *)&unk_19B30018E, buf, 2u);
  }

  if (v8)
  {
    BOOL v14 = [NSNumber numberWithUnsignedInteger:a3];
    v24[0] = v14;
    BOOL v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3254779904;
    v19[2] = __112__PHPhotoLibraryFeatureAvailabilityTask_computeSearchDonationProgressForTaskID_libraryClient_completionHandler___block_invoke;
    v19[3] = &unk_1EEABE0E8;
    v19[4] = self;
    id v20 = v9;
    double v21 = v13;
    os_signpost_id_t v22 = v11;
    [v8 searchDonationProgressForTaskIDs:v15 completionHandler:v19];
  }
  else
  {
    BOOL v16 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithCode:localizedDescription:", -1, @"Library client is nil");
    (*((void (**)(id, void, void, void *))v9 + 2))(v9, 0, 0, v16);
    unint64_t v17 = v13;
    BOOL v18 = v17;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19B043000, v18, OS_SIGNPOST_INTERVAL_END, v11, "ComputeSearchDonationProgress", (const char *)&unk_19B30018E, buf, 2u);
    }
  }
}

void __112__PHPhotoLibraryFeatureAvailabilityTask_computeSearchDonationProgressForTaskID_libraryClient_completionHandler___block_invoke(uint64_t a1, char a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9 = a5;
  uint64_t v10 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3254779904;
  block[2] = __112__PHPhotoLibraryFeatureAvailabilityTask_computeSearchDonationProgressForTaskID_libraryClient_completionHandler___block_invoke_2;
  block[3] = &unk_1EEABE158;
  char v22 = a2;
  id v11 = *(id *)(a1 + 40);
  id v16 = v9;
  id v17 = v11;
  uint64_t v18 = a3;
  uint64_t v19 = a4;
  id v12 = *(id *)(a1 + 48);
  uint64_t v13 = *(void *)(a1 + 56);
  id v20 = v12;
  uint64_t v21 = v13;
  id v14 = v9;
  dispatch_async(v10, block);
}

void __112__PHPhotoLibraryFeatureAvailabilityTask_computeSearchDonationProgressForTaskID_libraryClient_completionHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(id *)(a1 + 64);
  v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 72);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v3, OS_SIGNPOST_INTERVAL_END, v4, "ComputeSearchDonationProgress", (const char *)&unk_19B30018E, v5, 2u);
  }
}

- (void)executeWithCompletionHandler:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28C58];
  os_signpost_id_t v4 = (void (**)(id, void, id))a3;
  objc_msgSend(v3, "ph_errorWithCode:localizedDescription:", -1, @"Base class execute not supported.");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v4[2](v4, 0, v5);
}

- (PHPhotoLibraryFeatureAvailabilityTask)initWithFeature:(unint64_t)a3 photoLibrary:(id)a4 availabilityConfig:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)PHPhotoLibraryFeatureAvailabilityTask;
  id v11 = [(PHPhotoLibraryFeatureAvailabilityTask *)&v22 init];
  if (v11)
  {
    uint64_t v12 = +[PHMediaProcessingAlgorithmVersionProvider providerWithCurrentVersions];
    versionProvider = v11->_versionProvider;
    v11->_versionProvider = (PHMediaProcessingAlgorithmVersionProvider *)v12;

    [(PHMediaProcessingAlgorithmVersionProvider *)v11->_versionProvider setSceneAnalysisVersion:1];
    [(PHMediaProcessingAlgorithmVersionProvider *)v11->_versionProvider setFaceAnalysisVersion:1];
    [(PHMediaProcessingAlgorithmVersionProvider *)v11->_versionProvider setMediaAnalysisVersion:66];
    [(PHMediaProcessingAlgorithmVersionProvider *)v11->_versionProvider setMediaAnalysisImageVersion:66];
    id v14 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v15 = [v14 UUIDString];
    taskID = v11->_taskID;
    v11->_taskID = (NSString *)v15;

    v11->_feature = a3;
    objc_storeStrong((id *)&v11->_photoLibrary, a4);
    v11->_lock._os_unfair_lock_opaque = 0;
    id v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.photolibrary.availability", v17);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v18;

    objc_storeStrong((id *)&v11->_availabilityConfig, a5);
    id v20 = v11;
  }

  return v11;
}

+ (id)availabilityStatusTaskForFeature:(unint64_t)a3 photoLibrary:(id)a4 availabilityConfig:(id)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  if (a3 == 6)
  {
    id v11 = [_PHPhotoLibraryFeatureAvailabilityTaskGlobalProcessing alloc];
    uint64_t v12 = 6;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    id v11 = [_PHPhotoLibraryFeatureAvailabilityTaskMemoryCreation alloc];
    uint64_t v12 = 1;
LABEL_5:
    uint64_t v13 = [(PHPhotoLibraryFeatureAvailabilityTask *)v11 initWithFeature:v12 photoLibrary:v9 availabilityConfig:v10];
    goto LABEL_9;
  }
  if (a6)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithCode:localizedDescription:", -1, @"Feature availability status for feature not yet supported.");
    uint64_t v13 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v13 = 0;
  }
LABEL_9:

  return v13;
}

@end