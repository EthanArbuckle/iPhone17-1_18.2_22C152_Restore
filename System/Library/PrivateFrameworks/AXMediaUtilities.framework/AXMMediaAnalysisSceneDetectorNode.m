@interface AXMMediaAnalysisSceneDetectorNode
+ (BOOL)addNSFWResultToContext:(id)a3 forIdentifier:(id)a4 confidence:(double)a5 markAsSensitiveCaptionContent:(BOOL)a6;
+ (BOOL)addSignificantEventResultToContext:(id)a3 forIdentifier:(id)a4 confidence:(double)a5 markAsSensitiveCaptionContent:(BOOL)a6;
+ (BOOL)isSupported;
+ (BOOL)supportsSecureCoding;
+ (id)title;
- (AXMMediaAnalysisSceneDetectorNode)initWithCoder:(id)a3;
- (BOOL)_shouldIncludeSceneLabelForOCRDocumenTypeDetection:(id)a3;
- (BOOL)requiresVisionFramework;
- (MADVISceneClassificationRequest)_sceneClassificationRequest;
- (unsigned)taxonomyOptions;
- (void)_addNSFWClassificationObservations:(id)a3 toContext:(id)a4;
- (void)_addRecognizedObjectObservations:(id)a3 toContext:(id)a4;
- (void)_addSaliencyImageObservations:(id)a3 toContext:(id)a4;
- (void)_addSceneClassificationObservations:(id)a3 toContext:(id)a4;
- (void)_addSceneDetectorFeaturesToContext:(id)a3 fromResults:(id)a4;
- (void)_addSignificantEventClassificationObservations:(id)a3 toContext:(id)a4;
- (void)_setSceneClassificationRequest:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)evaluate:(id)a3 metrics:(id)a4;
- (void)setTaxonomyOptions:(unsigned int)a3;
@end

@implementation AXMMediaAnalysisSceneDetectorNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMMediaAnalysisSceneDetectorNode)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)AXMMediaAnalysisSceneDetectorNode;
  v5 = [(AXMEvaluationNode *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_taxonomyOptions = [v4 decodeInt32ForKey:@"taxonomyOptions"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AXMMediaAnalysisSceneDetectorNode;
  id v4 = a3;
  [(AXMEvaluationNode *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt32:forKey:", self->_taxonomyOptions, @"taxonomyOptions", v5.receiver, v5.super_class);
}

+ (BOOL)isSupported
{
  if (!AXRuntimeCheck_MediaAnalysisSupport()) {
    return 0;
  }
  v2 = [MEMORY[0x1E4F28F80] processInfo];
  BOOL v3 = (unint64_t)[v2 physicalMemory] > 0x773593FF;

  return v3;
}

- (BOOL)requiresVisionFramework
{
  return 0;
}

+ (id)title
{
  return @"AXM Media analysis - Scene Detector Node";
}

- (void)evaluate:(id)a3 metrics:(id)a4
{
  v48[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v40.receiver = self;
  v40.super_class = (Class)AXMMediaAnalysisSceneDetectorNode;
  id v30 = a4;
  -[AXMEvaluationNode evaluate:metrics:](&v40, sel_evaluate_metrics_, v6);
  objc_super v7 = [v6 sourceInput];
  v33 = [v7 phAssetLocalIdentifier];

  v8 = [v6 sourceInput];
  v34 = [v8 photoLibraryURL];

  v9 = [v6 sourceInput];
  v32 = [v9 ciImage];

  v10 = [v6 sourceInput];
  v31 = [v10 pixelBuffer];

  v11 = [(AXMMediaAnalysisSceneDetectorNode *)self _sceneClassificationRequest];
  LODWORD(v10) = v11 == 0;

  if (v10)
  {
    *(void *)buf = 0;
    v43 = buf;
    uint64_t v44 = 0x2050000000;
    v12 = (void *)getMADVISceneClassificationRequestClass_softClass;
    uint64_t v45 = getMADVISceneClassificationRequestClass_softClass;
    if (!getMADVISceneClassificationRequestClass_softClass)
    {
      location[0] = (id)MEMORY[0x1E4F143A8];
      location[1] = (id)3221225472;
      location[2] = __getMADVISceneClassificationRequestClass_block_invoke;
      location[3] = &unk_1E6116AD8;
      location[4] = buf;
      __getMADVISceneClassificationRequestClass_block_invoke((uint64_t)location);
      v12 = (void *)*((void *)v43 + 3);
    }
    v13 = v12;
    _Block_object_dispose(buf, 8);
    id v14 = objc_alloc_init(v13);
    [(AXMMediaAnalysisSceneDetectorNode *)self _setSceneClassificationRequest:v14];
  }
  v15 = [(AXMMediaAnalysisSceneDetectorNode *)self _sceneClassificationRequest];
  dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
  objc_initWeak(location, self);
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __54__AXMMediaAnalysisSceneDetectorNode_evaluate_metrics___block_invoke;
  v35[3] = &unk_1E6118560;
  objc_copyWeak(&v39, location);
  id v17 = v15;
  id v36 = v17;
  id v29 = v6;
  id v37 = v29;
  v18 = v16;
  v38 = v18;
  v19 = (void *)MEMORY[0x1BA9A1340](v35);
  v20 = +[AXMMADSService sharedInstance];
  v21 = [v20 service];

  if (v34 && v33)
  {
    v48[0] = v17;
    v22 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v48, 1, v29);
    uint64_t v23 = [v21 performRequests:v22 onAssetWithLocalIdentifier:v33 fromPhotoLibraryWithURL:v34 completionHandler:v19];
LABEL_12:
    uint64_t v24 = v23;

    goto LABEL_13;
  }
  if (v32)
  {
    id v47 = v17;
    v22 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v47, 1, v29);
    uint64_t v23 = [v21 performRequests:v22 onCIImage:v32 withOrientation:1 andIdentifier:&stru_1F0E72D10 completionHandler:v19];
    goto LABEL_12;
  }
  if (v31)
  {
    id v46 = v17;
    v22 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v46, 1, v29);
    uint64_t v23 = objc_msgSend(v21, "performRequests:onPixelBuffer:withOrientation:andIdentifier:completionHandler:", v22, objc_msgSend(v31, "pixelBuffer"), objc_msgSend(v31, "orientation"), &stru_1F0E72D10, v19);
    goto LABEL_12;
  }
  uint64_t v24 = 0xFFFFFFFFLL;
LABEL_13:
  dispatch_time_t v25 = dispatch_time(0, 100000000);
  if (dispatch_semaphore_wait(v18, v25))
  {
    unint64_t v26 = 100000000;
    do
    {
      if (v26 >= 0x2540BE401)
      {
        v27 = AXMediaLogCommon();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          -[AXMMediaAnalysisSceneDetectorNode evaluate:metrics:](buf, &buf[1], v27);
        }

        [v21 cancelRequestID:v24];
      }
      dispatch_time_t v28 = dispatch_time(0, 100000000);
      v26 += 100000000;
    }
    while (dispatch_semaphore_wait(v18, v28));
  }

  objc_destroyWeak(&v39);
  objc_destroyWeak(location);
}

void __54__AXMMediaAnalysisSceneDetectorNode_evaluate_metrics___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_super v7 = AXMediaLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v10 = [*(id *)(a1 + 32) results];
    v11[0] = 67109634;
    v11[1] = a2;
    __int16 v12 = 2112;
    id v13 = v5;
    __int16 v14 = 2112;
    v15 = v10;
    _os_log_debug_impl(&dword_1B57D5000, v7, OS_LOG_TYPE_DEBUG, "AXM Media analysis: Scene Classification results: requestID: %d error: %@ results: %@", (uint8_t *)v11, 0x1Cu);
  }
  if (v5)
  {
    v8 = AXMediaLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __54__AXMMediaAnalysisSceneDetectorNode_evaluate_metrics___block_invoke_cold_2((uint64_t)v5, v8);
    }
  }
  else if (a2 == -1)
  {
    v8 = AXMediaLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __54__AXMMediaAnalysisSceneDetectorNode_evaluate_metrics___block_invoke_cold_1(v8);
    }
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 40);
    v8 = [*(id *)(a1 + 32) results];
    [WeakRetained _addSceneDetectorFeaturesToContext:v9 fromResults:v8];
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (void)_addSceneDetectorFeaturesToContext:(id)a3 fromResults:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 count])
  {
    v8 = [v7 firstObject];
    uint64_t v23 = 0;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x2050000000;
    uint64_t v9 = (void *)getMADVISceneClassificationResultClass_softClass;
    uint64_t v26 = getMADVISceneClassificationResultClass_softClass;
    if (!getMADVISceneClassificationResultClass_softClass)
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __getMADVISceneClassificationResultClass_block_invoke;
      v22[3] = &unk_1E6116AD8;
      v22[4] = &v23;
      __getMADVISceneClassificationResultClass_block_invoke((uint64_t)v22);
      uint64_t v9 = (void *)v24[3];
    }
    id v10 = v9;
    _Block_object_dispose(&v23, 8);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      __int16 v12 = [v7 firstObject];
      id v13 = [v12 classificationObservations];
      [(AXMMediaAnalysisSceneDetectorNode *)self _addSceneClassificationObservations:v13 toContext:v6];

      __int16 v14 = [v6 analysisOptions];
      int v15 = [v14 detectMADScenesNSFW];

      if (v15)
      {
        uint64_t v16 = [v12 nsfwObservations];
        [(AXMMediaAnalysisSceneDetectorNode *)self _addNSFWClassificationObservations:v16 toContext:v6];
      }
      id v17 = [v6 analysisOptions];
      int v18 = [v17 detectMADScenesSignificantEvents];

      if (v18)
      {
        v19 = [v12 significantEventObservations];
        [(AXMMediaAnalysisSceneDetectorNode *)self _addSignificantEventClassificationObservations:v19 toContext:v6];
      }
      v20 = [v12 recognizedObjectObservations];
      [(AXMMediaAnalysisSceneDetectorNode *)self _addRecognizedObjectObservations:v20 toContext:v6];

      v21 = [v12 saliencyObservations];
      [(AXMMediaAnalysisSceneDetectorNode *)self _addSaliencyImageObservations:v21 toContext:v6];
    }
  }
}

- (void)_addSceneClassificationObservations:(id)a3 toContext:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(AXMMediaAnalysisSceneDetectorNode *)self taxonomyOptions])
  {
    id v8 = +[AXMPhotoVisionSupport processSceneClassifications:v6 withOptions:[(AXMMediaAnalysisSceneDetectorNode *)self taxonomyOptions]];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v44 objects:v50 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v45 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v44 + 1) + 8 * i);
          [v7 size];
          __int16 v14 = +[AXMVisionFeature featureWithMediaAnalysisTaxonomyNode:canvasSize:](AXMVisionFeature, "featureWithMediaAnalysisTaxonomyNode:canvasSize:", v13);
          [v7 appendFeature:v14];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v44 objects:v50 count:16];
      }
      while (v10);
    }
  }
  else
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v8 = v6;
    uint64_t v15 = [v8 countByEnumeratingWithState:&v40 objects:v49 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      id v35 = v6;
      uint64_t v17 = *(void *)v41;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v41 != v17) {
            objc_enumerationMutation(v8);
          }
          v19 = *(void **)(*((void *)&v40 + 1) + 8 * j);
          v20 = +[AXMPhotoVisionSupport localizedLabelForClassificationObservation:v19];
          v21 = [v19 identifier];
          [v19 confidence];
          int v23 = v22;
          [v7 size];
          double v25 = v24;
          LODWORD(v24) = v23;
          v27 = +[AXMVisionFeature mediaAnalysisSceneClassificationWithLabel:localizedValue:confidence:canvasSize:](AXMVisionFeature, "mediaAnalysisSceneClassificationWithLabel:localizedValue:confidence:canvasSize:", v21, v20, v24, v25, v26);
          [v7 appendFeature:v27];
        }
        uint64_t v16 = [v8 countByEnumeratingWithState:&v40 objects:v49 count:16];
      }
      while (v16);
      id v6 = v35;
    }
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v28 = v6;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v36 objects:v48 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v37;
    do
    {
      for (uint64_t k = 0; k != v30; ++k)
      {
        if (*(void *)v37 != v31) {
          objc_enumerationMutation(v28);
        }
        v33 = *(void **)(*((void *)&v36 + 1) + 8 * k);
        if ([(AXMMediaAnalysisSceneDetectorNode *)self _shouldIncludeSceneLabelForOCRDocumenTypeDetection:v33])
        {
          v34 = [v33 identifier];
          [v7 addMediaAnalysisSceneLabelForOCRDocumentTypeDetection:v34];
        }
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v36 objects:v48 count:16];
    }
    while (v30);
  }

  [v7 addEvaluatedFeatureType:26];
}

+ (BOOL)addNSFWResultToContext:(id)a3 forIdentifier:(id)a4 confidence:(double)a5 markAsSensitiveCaptionContent:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a4;
  uint64_t v21 = 0;
  int v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v11 = (void *)getVN81aedeb999c79d74e79af7f1c922cf97SymbolLoc_ptr_0;
  uint64_t v24 = getVN81aedeb999c79d74e79af7f1c922cf97SymbolLoc_ptr_0;
  if (!getVN81aedeb999c79d74e79af7f1c922cf97SymbolLoc_ptr_0)
  {
    __int16 v12 = (void *)VisionLibrary_8();
    v22[3] = (uint64_t)dlsym(v12, "VN81aedeb999c79d74e79af7f1c922cf97");
    getVN81aedeb999c79d74e79af7f1c922cf97SymbolLoc_ptr_0 = v22[3];
    uint64_t v11 = (void *)v22[3];
  }
  _Block_object_dispose(&v21, 8);
  if (!v11)
  {
    v20 = (_Unwind_Exception *)__77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    _Block_object_dispose(&v21, 8);
    _Unwind_Resume(v20);
  }
  int v13 = [v10 isEqualToString:*v11];
  if (v13)
  {
    [v9 size];
    double v16 = v15;
    float v14 = a5;
    *(float *)&double v15 = v14;
    int v18 = +[AXMVisionFeature mediaAnalysisNSFWClassificationWithCategory:@"NSFW Explicit", v15, v16, v17 confidence canvasSize];
    [v18 setCaptionMayContainSensitiveContent:v6];
    [v9 appendFeature:v18];
  }
  return v13;
}

+ (BOOL)addSignificantEventResultToContext:(id)a3 forIdentifier:(id)a4 confidence:(double)a5 markAsSensitiveCaptionContent:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a4;
  uint64_t v42 = 0;
  long long v43 = &v42;
  uint64_t v44 = 0x2020000000;
  uint64_t v11 = (void *)getVN3FNQUJVIs2puI1uPc9mxh7SymbolLoc_ptr;
  uint64_t v45 = getVN3FNQUJVIs2puI1uPc9mxh7SymbolLoc_ptr;
  if (!getVN3FNQUJVIs2puI1uPc9mxh7SymbolLoc_ptr)
  {
    __int16 v12 = (void *)VisionLibrary_8();
    v43[3] = (uint64_t)dlsym(v12, "VN3FNQUJVIs2puI1uPc9mxh7");
    getVN3FNQUJVIs2puI1uPc9mxh7SymbolLoc_ptr = v43[3];
    uint64_t v11 = (void *)v43[3];
  }
  _Block_object_dispose(&v42, 8);
  if (!v11)
  {
    __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
LABEL_44:
    __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
LABEL_45:
    __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
LABEL_46:
    __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
LABEL_47:
    __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    goto LABEL_48;
  }
  if ([v10 isEqualToString:*v11])
  {
    int v13 = AXMSignificantEventCategoryBlood;
    goto LABEL_39;
  }
  uint64_t v42 = 0;
  long long v43 = &v42;
  uint64_t v44 = 0x2020000000;
  float v14 = (void *)getVNSY8t4EoTztuqIL02g8uVA0SymbolLoc_ptr;
  uint64_t v45 = getVNSY8t4EoTztuqIL02g8uVA0SymbolLoc_ptr;
  if (!getVNSY8t4EoTztuqIL02g8uVA0SymbolLoc_ptr)
  {
    double v15 = (void *)VisionLibrary_8();
    v43[3] = (uint64_t)dlsym(v15, "VNSY8t4EoTztuqIL02g8uVA0");
    getVNSY8t4EoTztuqIL02g8uVA0SymbolLoc_ptr = v43[3];
    float v14 = (void *)v43[3];
  }
  _Block_object_dispose(&v42, 8);
  if (!v14) {
    goto LABEL_44;
  }
  if ([v10 isEqualToString:*v14])
  {
    int v13 = AXMSignificantEventCategoryDemonstration;
    goto LABEL_39;
  }
  uint64_t v42 = 0;
  long long v43 = &v42;
  uint64_t v44 = 0x2020000000;
  double v16 = (void *)getVN6XNMvaRunPpzWjGa9uUHD6SymbolLoc_ptr;
  uint64_t v45 = getVN6XNMvaRunPpzWjGa9uUHD6SymbolLoc_ptr;
  if (!getVN6XNMvaRunPpzWjGa9uUHD6SymbolLoc_ptr)
  {
    double v17 = (void *)VisionLibrary_8();
    v43[3] = (uint64_t)dlsym(v17, "VN6XNMvaRunPpzWjGa9uUHD6");
    getVN6XNMvaRunPpzWjGa9uUHD6SymbolLoc_ptr = v43[3];
    double v16 = (void *)v43[3];
  }
  _Block_object_dispose(&v42, 8);
  if (!v16) {
    goto LABEL_45;
  }
  if ([v10 isEqualToString:*v16])
  {
    int v13 = AXMSignificantEventCategoryDestruction;
    goto LABEL_39;
  }
  uint64_t v42 = 0;
  long long v43 = &v42;
  uint64_t v44 = 0x2020000000;
  int v18 = (void *)getVN4QuphG8kE4qDaDycivBkX5SymbolLoc_ptr;
  uint64_t v45 = getVN4QuphG8kE4qDaDycivBkX5SymbolLoc_ptr;
  if (!getVN4QuphG8kE4qDaDycivBkX5SymbolLoc_ptr)
  {
    v19 = (void *)VisionLibrary_8();
    v43[3] = (uint64_t)dlsym(v19, "VN4QuphG8kE4qDaDycivBkX5");
    getVN4QuphG8kE4qDaDycivBkX5SymbolLoc_ptr = v43[3];
    int v18 = (void *)v43[3];
  }
  _Block_object_dispose(&v42, 8);
  if (!v18) {
    goto LABEL_46;
  }
  if ([v10 isEqualToString:*v18])
  {
    int v13 = AXMSignificantEventCategoryFireDevastation;
    goto LABEL_39;
  }
  uint64_t v42 = 0;
  long long v43 = &v42;
  uint64_t v44 = 0x2020000000;
  v20 = (void *)getVN7gQUejje8mmnE9GSTsVBVVSymbolLoc_ptr;
  uint64_t v45 = getVN7gQUejje8mmnE9GSTsVBVVSymbolLoc_ptr;
  if (!getVN7gQUejje8mmnE9GSTsVBVVSymbolLoc_ptr)
  {
    uint64_t v21 = (void *)VisionLibrary_8();
    v43[3] = (uint64_t)dlsym(v21, "VN7gQUejje8mmnE9GSTsVBVV");
    getVN7gQUejje8mmnE9GSTsVBVVSymbolLoc_ptr = v43[3];
    v20 = (void *)v43[3];
  }
  _Block_object_dispose(&v42, 8);
  if (!v20) {
    goto LABEL_47;
  }
  if ([v10 isEqualToString:*v20])
  {
    int v13 = AXMSignificantEventCategoryFloodDevastation;
    goto LABEL_39;
  }
  uint64_t v42 = 0;
  long long v43 = &v42;
  uint64_t v44 = 0x2020000000;
  int v22 = (void *)getVNa9xpOJNvRoaW9plFGZ9Eo0SymbolLoc_ptr;
  uint64_t v45 = getVNa9xpOJNvRoaW9plFGZ9Eo0SymbolLoc_ptr;
  if (!getVNa9xpOJNvRoaW9plFGZ9Eo0SymbolLoc_ptr)
  {
    uint64_t v23 = (void *)VisionLibrary_8();
    v43[3] = (uint64_t)dlsym(v23, "VNa9xpOJNvRoaW9plFGZ9Eo0");
    getVNa9xpOJNvRoaW9plFGZ9Eo0SymbolLoc_ptr = v43[3];
    int v22 = (void *)v43[3];
  }
  _Block_object_dispose(&v42, 8);
  if (!v22)
  {
LABEL_48:
    long long v41 = (_Unwind_Exception *)__77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    _Block_object_dispose(&v42, 8);
    _Unwind_Resume(v41);
  }
  if ([v10 isEqualToString:*v22])
  {
    int v13 = AXMSignificantEventCategoryFuneral;
  }
  else
  {
    uint64_t v24 = getVN2vIWnsZbk4Su55oeWfKDq1();
    char v25 = [v10 isEqualToString:v24];

    if (v25)
    {
      int v13 = AXMSignificantEventCategoryHospital;
    }
    else
    {
      double v26 = getVNmNJnu0xlW8CZXt6hJ7Rpb0();
      char v27 = [v10 isEqualToString:v26];

      if (v27)
      {
        int v13 = AXMSignificantEventCategoryReligiousSetting;
      }
      else
      {
        id v28 = getVN35FOB1QhtSfYGRIJvTgtTq();
        char v29 = [v10 isEqualToString:v28];

        if (v29)
        {
          int v13 = AXMSignificantEventCategoryVehicleCrash;
        }
        else
        {
          uint64_t v30 = getVN6ZsEIQ9ri2eF1vhsxw5COm();
          int v31 = [v10 isEqualToString:v30];

          if (!v31)
          {
LABEL_41:
            BOOL v39 = 0;
            goto LABEL_42;
          }
          int v13 = &AXMSignificantEventCategoryWar;
        }
      }
    }
  }
LABEL_39:
  v32 = *v13;
  if (!v32) {
    goto LABEL_41;
  }
  v33 = v32;
  [v9 size];
  double v36 = v35;
  float v34 = a5;
  *(float *)&double v35 = v34;
  long long v38 = +[AXMVisionFeature mediaAnalysisSignificantEventClassificationWithCategory:confidence:canvasSize:](AXMVisionFeature, "mediaAnalysisSignificantEventClassificationWithCategory:confidence:canvasSize:", v33, v35, v36, v37);
  [v38 setCaptionMayContainSensitiveContent:v6];
  [v9 appendFeature:v38];

  BOOL v39 = 1;
LABEL_42:

  return v39;
}

- (void)_addNSFWClassificationObservations:(id)a3 toContext:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        __int16 v12 = [v11 identifier];
        [v11 confidence];
        +[AXMMediaAnalysisSceneDetectorNode addNSFWResultToContext:v6 forIdentifier:v12 confidence:0 markAsSensitiveCaptionContent:v13];
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
  [v6 addEvaluatedFeatureType:29];
}

- (void)_addSignificantEventClassificationObservations:(id)a3 toContext:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        __int16 v12 = [v11 identifier];
        [v11 confidence];
        +[AXMMediaAnalysisSceneDetectorNode addSignificantEventResultToContext:v6 forIdentifier:v12 confidence:0 markAsSensitiveCaptionContent:v13];
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
  [v6 addEvaluatedFeatureType:30];
}

- (void)_addRecognizedObjectObservations:(id)a3 toContext:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v43 = a4;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  obuint64_t j = v5;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v46 objects:v52 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v47;
    *(void *)&long long v7 = 138412290;
    long long v42 = v7;
    do
    {
      uint64_t v10 = 0;
      uint64_t v44 = v8;
      do
      {
        if (*(void *)v47 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v46 + 1) + 8 * v10);
        __int16 v12 = +[AXMPhotoVisionSupport axmTaxonomyNodeForObjectObservation:](AXMPhotoVisionSupport, "axmTaxonomyNodeForObjectObservation:", v11, v42);
        float v13 = v12;
        if (v12)
        {
          uint64_t v14 = [v12 label];
          if (v14)
          {
            long long v15 = (void *)v14;
            long long v16 = +[AXMPhotoVisionSupport _deniedVoiceOverObjectClassificationLabels];
            long long v17 = [v13 label];
            int v18 = [v16 containsObject:v17];

            if (v18)
            {
              uint64_t v19 = AXMediaLogCommon();
              if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
                goto LABEL_20;
              }
              v20 = [v13 label];
              *(_DWORD *)buf = v42;
              uint64_t v51 = v20;
              _os_log_impl(&dword_1B57D5000, v19, OS_LOG_TYPE_INFO, "Object classifier detected but denied for VoiceOver: %@", buf, 0xCu);
              goto LABEL_17;
            }
          }
          uint64_t v19 = [v13 localizedName];
          if (![v19 length])
          {
            uint64_t v21 = AXMediaLogCommon();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v42;
              uint64_t v51 = v19;
              _os_log_impl(&dword_1B57D5000, v21, OS_LOG_TYPE_DEFAULT, "Could not get localized value for label: %@. Falling back to raw value", buf, 0xCu);
            }

            uint64_t v22 = [v13 label];

            uint64_t v19 = v22;
          }
          [v11 confidence];
          if (v23 > 0.4)
          {
            uint64_t v24 = [v13 label];
            [v11 boundingBox];
            double v26 = v25;
            double v28 = v27;
            double v30 = v29;
            double v32 = v31;
            [v11 confidence];
            int v34 = v33;
            [v43 size];
            double v36 = v35;
            double v38 = v37;
            BOOL v39 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v13, "sceneClassId"));
            long long v40 = [v39 stringValue];
            LODWORD(v41) = v34;
            v20 = +[AXMVisionFeature mediaAnalysisObjectClassificationWithLabel:localizedValue:boundingBox:confidence:canvasSize:sceneClassId:](AXMVisionFeature, "mediaAnalysisObjectClassificationWithLabel:localizedValue:boundingBox:confidence:canvasSize:sceneClassId:", v24, v19, v40, v26, v28, v30, v32, v41, v36, v38);

            uint64_t v8 = v44;
            [v43 appendFeature:v20];
LABEL_17:
          }
        }
        else
        {
          uint64_t v19 = AXMediaLogCommon();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B57D5000, v19, OS_LOG_TYPE_DEFAULT, "Recognized object result produced no labels", buf, 2u);
          }
        }
LABEL_20:

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
    }
    while (v8);
  }
  [v43 addEvaluatedFeatureType:27];
}

- (void)_addSaliencyImageObservations:(id)a3 toContext:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [a3 firstObject];
  long long v7 = [v6 salientObjects];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  __int16 v12 = __77__AXMMediaAnalysisSceneDetectorNode__addSaliencyImageObservations_toContext___block_invoke;
  float v13 = &unk_1E6118588;
  id v14 = v6;
  id v15 = v5;
  id v8 = v5;
  id v9 = v6;
  [v7 enumerateObjectsUsingBlock:&v10];
  objc_msgSend(v8, "addEvaluatedFeatureType:", 28, v10, v11, v12, v13);
}

void __77__AXMMediaAnalysisSceneDetectorNode__addSaliencyImageObservations_toContext___block_invoke(uint64_t a1, void *a2)
{
  id v29 = a2;
  [v29 boundingBox];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [*(id *)(a1 + 32) narrowedBoundingBox];
  v33.origin.x = v11;
  v33.origin.y = v12;
  v33.size.width = v13;
  v33.size.height = v14;
  v31.origin.x = v4;
  v31.origin.y = v6;
  v31.size.width = v8;
  v31.size.height = v10;
  CGRect v32 = CGRectIntersection(v31, v33);
  if (!CGRectIsEmpty(v32))
  {
    [v29 boundingBox];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = 1.0 - v21 - v19;
    [*(id *)(a1 + 40) size];
    double v24 = v23;
    double v26 = v25;
    [v29 confidence];
    double v28 = +[AXMVisionFeature mediaAnalysisProminentObjectWithBoundingBox:canvasSize:confidence:](AXMVisionFeature, "mediaAnalysisProminentObjectWithBoundingBox:canvasSize:confidence:", v16, v22, v18, v20, v24, v26, v27);
    [*(id *)(a1 + 40) appendFeature:v28];
  }
}

- (BOOL)_shouldIncludeSceneLabelForOCRDocumenTypeDetection:(id)a3
{
  id v3 = a3;
  CGFloat v4 = [v3 identifier];
  double v5 = 0.35;
  if (([v4 isEqualToString:@"diagram"] & 1) == 0
    && ([v4 isEqualToString:@"envelope"] & 1) == 0)
  {
    if (![v4 isEqualToString:@"receipt"])
    {
      BOOL v7 = 0;
      goto LABEL_6;
    }
    double v5 = 0.65;
  }
  [v3 confidence];
  BOOL v7 = v5 < v6;
LABEL_6:

  return v7;
}

- (unsigned)taxonomyOptions
{
  return self->_taxonomyOptions;
}

- (void)setTaxonomyOptions:(unsigned int)a3
{
  self->_taxonomyOptions = a3;
}

- (MADVISceneClassificationRequest)_sceneClassificationRequest
{
  return self->__sceneClassificationRequest;
}

- (void)_setSceneClassificationRequest:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)evaluate:(os_log_t)log metrics:.cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1B57D5000, log, OS_LOG_TYPE_ERROR, "AXM Media Analysis: Scene Detection request timed out", buf, 2u);
}

void __54__AXMMediaAnalysisSceneDetectorNode_evaluate_metrics___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B57D5000, log, OS_LOG_TYPE_DEBUG, "AXM Media analysis: Invalid request - MADVISceneClassificationRequest", v1, 2u);
}

void __54__AXMMediaAnalysisSceneDetectorNode_evaluate_metrics___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1B57D5000, a2, OS_LOG_TYPE_DEBUG, "AXM Media analysis: Error in scene analysis: %@", (uint8_t *)&v2, 0xCu);
}

@end