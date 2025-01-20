@interface AXMMediaAnalysisFaceDetectorNode
+ (BOOL)supportsSecureCoding;
+ (id)title;
- (AXMMediaAnalysisFaceDetectorNode)initWithCoder:(id)a3;
- (AXMVisionFaceNameHelper)_faceNameHelper;
- (BOOL)requiresVisionFramework;
- (id)_faceResultForUUID:(id)a3 inFaceDictionary:(id)a4;
- (void)_addFaceDetectionFeaturesToContext:(id)a3 fromResults:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)evaluate:(id)a3 metrics:(id)a4;
- (void)set_faceNameHelper:(id)a3;
@end

@implementation AXMMediaAnalysisFaceDetectorNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMMediaAnalysisFaceDetectorNode)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AXMMediaAnalysisFaceDetectorNode;
  return [(AXMEvaluationNode *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)AXMMediaAnalysisFaceDetectorNode;
  [(AXMEvaluationNode *)&v3 encodeWithCoder:a3];
}

- (BOOL)requiresVisionFramework
{
  return 0;
}

+ (id)title
{
  return @"AXM Media Analysis - Face Detector Node";
}

- (void)evaluate:(id)a3 metrics:(id)a4
{
  v48[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v40.receiver = self;
  v40.super_class = (Class)AXMMediaAnalysisFaceDetectorNode;
  id v30 = a4;
  -[AXMEvaluationNode evaluate:metrics:](&v40, sel_evaluate_metrics_, v6);
  v7 = [(AXMMediaAnalysisFaceDetectorNode *)self _faceNameHelper];
  LODWORD(a4) = v7 == 0;

  if (a4)
  {
    v8 = objc_alloc_init(AXMVisionFaceNameHelper);
    [(AXMMediaAnalysisFaceDetectorNode *)self set_faceNameHelper:v8];
  }
  v9 = [v6 sourceInput];
  v33 = [v9 phAssetLocalIdentifier];

  v10 = [v6 sourceInput];
  v34 = [v10 photoLibraryURL];

  v11 = [v6 sourceInput];
  v32 = [v11 ciImage];

  v12 = [v6 sourceInput];
  v31 = [v12 pixelBuffer];

  *(void *)buf = 0;
  v43 = buf;
  uint64_t v44 = 0x2050000000;
  v13 = (void *)getMADVIFaceRequestClass_softClass;
  uint64_t v45 = getMADVIFaceRequestClass_softClass;
  if (!getMADVIFaceRequestClass_softClass)
  {
    location[0] = (id)MEMORY[0x1E4F143A8];
    location[1] = (id)3221225472;
    location[2] = __getMADVIFaceRequestClass_block_invoke;
    location[3] = &unk_1E6116AD8;
    location[4] = buf;
    __getMADVIFaceRequestClass_block_invoke((uint64_t)location);
    v13 = (void *)*((void *)v43 + 3);
  }
  v14 = v13;
  _Block_object_dispose(buf, 8);
  id v15 = objc_alloc_init(v14);
  dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
  objc_initWeak(location, self);
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __53__AXMMediaAnalysisFaceDetectorNode_evaluate_metrics___block_invoke;
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
          -[AXMMediaAnalysisFaceDetectorNode evaluate:metrics:](buf, &buf[1], v27);
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

void __53__AXMMediaAnalysisFaceDetectorNode_evaluate_metrics___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v7 = AXMediaLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v10 = [*(id *)(a1 + 32) results];
    v11[0] = 67109634;
    v11[1] = a2;
    __int16 v12 = 2112;
    id v13 = v5;
    __int16 v14 = 2112;
    id v15 = v10;
    _os_log_debug_impl(&dword_1B57D5000, v7, OS_LOG_TYPE_DEBUG, "AXM Media analysis: Face Detection results: requestID: %d error: %@ results: %@", (uint8_t *)v11, 0x1Cu);
  }
  if (v5)
  {
    v8 = AXMediaLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __53__AXMMediaAnalysisFaceDetectorNode_evaluate_metrics___block_invoke_cold_2((uint64_t)v5, v8);
    }
  }
  else if (a2 == -1)
  {
    v8 = AXMediaLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __53__AXMMediaAnalysisFaceDetectorNode_evaluate_metrics___block_invoke_cold_1(v8);
    }
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 40);
    v8 = [*(id *)(a1 + 32) results];
    [WeakRetained _addFaceDetectionFeaturesToContext:v9 fromResults:v8];
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (void)_addFaceDetectionFeaturesToContext:(id)a3 fromResults:(id)a4
{
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  id v69 = a3;
  id v70 = a4;
  id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([v70 count])
  {
    v7 = [v70 firstObject];
    uint64_t v96 = 0;
    v97 = &v96;
    uint64_t v98 = 0x2050000000;
    v8 = (void *)getMADVIFaceResultClass_softClass;
    uint64_t v99 = getMADVIFaceResultClass_softClass;
    if (!getMADVIFaceResultClass_softClass)
    {
      v95[0] = MEMORY[0x1E4F143A8];
      v95[1] = 3221225472;
      v95[2] = __getMADVIFaceResultClass_block_invoke;
      v95[3] = &unk_1E6116AD8;
      v95[4] = &v96;
      __getMADVIFaceResultClass_block_invoke((uint64_t)v95);
      v8 = (void *)v97[3];
    }
    id v9 = v8;
    _Block_object_dispose(&v96, 8);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v68 = [v70 firstObject];
      long long v93 = 0u;
      long long v94 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      v11 = [v68 faceRectanglesObservations];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v91 objects:v104 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v92;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v92 != v13) {
              objc_enumerationMutation(v11);
            }
            id v15 = *(void **)(*((void *)&v91 + 1) + 8 * i);
            uint64_t v16 = [v15 uuid];
            id v17 = [(AXMMediaAnalysisFaceDetectorNode *)self _faceResultForUUID:v16 inFaceDictionary:v6];

            objc_msgSend(v17, "setFaceId:", objc_msgSend(v15, "faceId"));
            v18 = [v15 uuid];
            [v17 setUuid:v18];

            [v15 boundingBox];
            objc_msgSend(v17, "setFrame:");
            [v15 confidence];
            [v17 setRectanglesConfidence:v19];
          }
          uint64_t v12 = [v11 countByEnumeratingWithState:&v91 objects:v104 count:16];
        }
        while (v12);
      }

      v20 = [v69 sourceInput];
      uint64_t v66 = [v20 photoLibraryURL];

      v21 = [(AXMMediaAnalysisFaceDetectorNode *)self _faceNameHelper];
      LODWORD(v20) = [v21 prepareForLookupWithPhotoLibraryURL:v66];

      if (v20)
      {
        long long v89 = 0u;
        long long v90 = 0u;
        long long v87 = 0u;
        long long v88 = 0u;
        v22 = [v68 faceprintObservations];
        uint64_t v23 = [v22 countByEnumeratingWithState:&v87 objects:v103 count:16];
        if (v23)
        {
          uint64_t v24 = *(void *)v88;
          do
          {
            for (uint64_t j = 0; j != v23; ++j)
            {
              if (*(void *)v88 != v24) {
                objc_enumerationMutation(v22);
              }
              unint64_t v26 = *(void **)(*((void *)&v87 + 1) + 8 * j);
              v27 = objc_msgSend(v26, "uuid", v66);
              dispatch_time_t v28 = [(AXMMediaAnalysisFaceDetectorNode *)self _faceResultForUUID:v27 inFaceDictionary:v6];

              id v29 = [(AXMMediaAnalysisFaceDetectorNode *)self _faceNameHelper];
              id v30 = [v29 nameForFaceObservation:v26];
              [v28 setName:v30];

              [v26 confidence];
              [v28 setNameConfidence:v31];
            }
            uint64_t v23 = [v22 countByEnumeratingWithState:&v87 objects:v103 count:16];
          }
          while (v23);
        }
      }
      long long v85 = 0u;
      long long v86 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      objc_msgSend(v68, "faceAttributesObservations", v66);
      obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v32 = [obj countByEnumeratingWithState:&v83 objects:v102 count:16];
      if (v32)
      {
        uint64_t v33 = *(void *)v84;
        do
        {
          for (uint64_t k = 0; k != v32; ++k)
          {
            if (*(void *)v84 != v33) {
              objc_enumerationMutation(obj);
            }
            v35 = *(void **)(*((void *)&v83 + 1) + 8 * k);
            id v36 = [v35 uuid];
            id v37 = [(AXMMediaAnalysisFaceDetectorNode *)self _faceResultForUUID:v36 inFaceDictionary:v6];

            v38 = [AXMVisionFeatureFaceAttributes alloc];
            id v39 = [v35 faceAttributes];
            objc_super v40 = [(AXMVisionFeatureFaceAttributes *)v38 initWithVisionFaceAttributes:v39];
            [v37 setAttributes:v40];

            int64_t v41 = +[AXMVisionFeatureFaceAttributes defaultExcludeOptions];
            v42 = [v37 attributes];
            [v42 setExcludeOptions:v41];

            [v35 confidence];
            [v37 setAttributesConfidence:v43];
          }
          uint64_t v32 = [obj countByEnumeratingWithState:&v83 objects:v102 count:16];
        }
        while (v32);
      }

      long long v81 = 0u;
      long long v82 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      uint64_t v44 = [v68 faceExpressionsObservations];
      uint64_t v45 = [v44 countByEnumeratingWithState:&v79 objects:v101 count:16];
      if (v45)
      {
        uint64_t v46 = *(void *)v80;
        do
        {
          for (uint64_t m = 0; m != v45; ++m)
          {
            if (*(void *)v80 != v46) {
              objc_enumerationMutation(v44);
            }
            v48 = *(void **)(*((void *)&v79 + 1) + 8 * m);
            v49 = [v48 uuid];
            v50 = [(AXMMediaAnalysisFaceDetectorNode *)self _faceResultForUUID:v49 inFaceDictionary:v6];

            v51 = [v48 expressionsAndConfidence];
            [v50 setExpressionsAndConfidence:v51];
          }
          uint64_t v45 = [v44 countByEnumeratingWithState:&v79 objects:v101 count:16];
        }
        while (v45);
      }

      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      id obja = [v68 faceLandmarksObservations];
      uint64_t v52 = [obja countByEnumeratingWithState:&v75 objects:v100 count:16];
      if (v52)
      {
        uint64_t v53 = *(void *)v76;
        do
        {
          for (uint64_t n = 0; n != v52; ++n)
          {
            if (*(void *)v76 != v53) {
              objc_enumerationMutation(obja);
            }
            v55 = *(void **)(*((void *)&v75 + 1) + 8 * n);
            v56 = [v55 uuid];
            v57 = [(AXMMediaAnalysisFaceDetectorNode *)self _faceResultForUUID:v56 inFaceDictionary:v6];

            v58 = [AXMVisionFeatureFaceLandmarks alloc];
            v59 = [v55 landmarks];
            v60 = [(AXMVisionFeatureFaceLandmarks *)v58 initWithVisionFaceLandmarks:v59];
            [v57 setLandmarks:v60];

            v61 = [AXMVisionFeatureFaceLandmarks alloc];
            v62 = [v55 landmarks3d];
            v63 = [(AXMVisionFeatureFaceLandmarks *)v61 initWithVisionFaceLandmarks:v62];
            [v57 setLandmarks3d:v63];

            [v55 confidence];
            [v57 setLandmarksConfidence:v64];
          }
          uint64_t v52 = [obja countByEnumeratingWithState:&v75 objects:v100 count:16];
        }
        while (v52);
      }
    }
  }
  v73[0] = MEMORY[0x1E4F143A8];
  v73[1] = 3221225472;
  v73[2] = __83__AXMMediaAnalysisFaceDetectorNode__addFaceDetectionFeaturesToContext_fromResults___block_invoke;
  v73[3] = &unk_1E6116DB0;
  id v74 = v69;
  id v65 = v69;
  [v6 enumerateKeysAndObjectsUsingBlock:v73];
  [v65 addEvaluatedFeatureType:31];
}

void __83__AXMMediaAnalysisFaceDetectorNode__addFaceDetectionFeaturesToContext_fromResults___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = AXMediaLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __83__AXMMediaAnalysisFaceDetectorNode__addFaceDetectionFeaturesToContext_fromResults___block_invoke_cold_1(v4, v5);
  }

  id v6 = *(void **)(a1 + 32);
  [v6 size];
  v7 = +[AXMVisionFeature featureWithMediaAnalysisFaceDetectionResult:canvasSize:](AXMVisionFeature, "featureWithMediaAnalysisFaceDetectionResult:canvasSize:", v4);
  [v6 appendFeature:v7];
}

- (id)_faceResultForUUID:(id)a3 inFaceDictionary:(id)a4
{
  id v5 = a4;
  id v6 = [a3 UUIDString];
  v7 = [v5 objectForKeyedSubscript:v6];
  if (!v7)
  {
    v7 = objc_alloc_init(AXMVisionFeatureFaceDetectionResult);
    [v5 setObject:v7 forKeyedSubscript:v6];
  }

  return v7;
}

- (AXMVisionFaceNameHelper)_faceNameHelper
{
  return self->__faceNameHelper;
}

- (void)set_faceNameHelper:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)evaluate:(os_log_t)log metrics:.cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1B57D5000, log, OS_LOG_TYPE_ERROR, "AXM Media Analysis: Face Detection request timed out", buf, 2u);
}

void __53__AXMMediaAnalysisFaceDetectorNode_evaluate_metrics___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B57D5000, log, OS_LOG_TYPE_DEBUG, "AXM Media analysis: Invalid request - MADVIFaceRequest", v1, 2u);
}

void __53__AXMMediaAnalysisFaceDetectorNode_evaluate_metrics___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1B57D5000, a2, OS_LOG_TYPE_DEBUG, "AXM Media analysis: Error in face analysis: %@", (uint8_t *)&v2, 0xCu);
}

void __83__AXMMediaAnalysisFaceDetectorNode__addFaceDetectionFeaturesToContext_fromResults___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 name];
  id v5 = [a1 attributes];
  id v6 = [v5 accessibilityLabelForAttributes];
  int v7 = 138412546;
  v8 = v4;
  __int16 v9 = 2112;
  v10 = v6;
  _os_log_debug_impl(&dword_1B57D5000, a2, OS_LOG_TYPE_DEBUG, "AXM Media analysis: results : %@ %@", (uint8_t *)&v7, 0x16u);
}

@end