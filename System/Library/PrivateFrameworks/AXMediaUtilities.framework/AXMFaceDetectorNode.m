@interface AXMFaceDetectorNode
+ (BOOL)isSupported;
+ (BOOL)supportsSecureCoding;
+ (id)title;
- (AXMFaceDetectorNode)initWithCoder:(id)a3;
- (AXMVisionFaceNameHelper)_faceNameHelper;
- (BOOL)requiresVisionFramework;
- (BOOL)validateVisionKitSoftLinkSymbols;
- (VNClassifyFaceAttributesRequest)_faceAttributesRequest;
- (VNCreateFaceprintRequest)_faceprintRequest;
- (VNDetectFaceExpressionsRequest)_faceExpressionsRequest;
- (VNDetectFaceLandmarksRequest)_faceLandmarksRequest;
- (VNDetectFacePoseRequest)_facePoseRequest;
- (VNDetectFaceRectanglesRequest)_faceRectanglesRequest;
- (id)_createRequestsForContext:(id)a3;
- (id)_faceDetectionResultsForVisionRequests:(id)a3 canvasSize:(CGSize)a4;
- (id)_faceResultForUUID:(id)a3 inFaceDictionary:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)evaluate:(id)a3 metrics:(id)a4;
- (void)nodeInitialize;
- (void)set_faceAttributesRequest:(id)a3;
- (void)set_faceExpressionsRequest:(id)a3;
- (void)set_faceLandmarksRequest:(id)a3;
- (void)set_faceNameHelper:(id)a3;
- (void)set_facePoseRequest:(id)a3;
- (void)set_faceRectanglesRequest:(id)a3;
- (void)set_faceprintRequest:(id)a3;
- (void)validateVisionKitSoftLinkSymbols;
@end

@implementation AXMFaceDetectorNode

- (void)nodeInitialize
{
  v2.receiver = self;
  v2.super_class = (Class)AXMFaceDetectorNode;
  [(AXMEvaluationNode *)&v2 nodeInitialize];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMFaceDetectorNode)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AXMFaceDetectorNode;
  return [(AXMEvaluationNode *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)AXMFaceDetectorNode;
  [(AXMEvaluationNode *)&v3 encodeWithCoder:a3];
}

+ (BOOL)isSupported
{
  return 1;
}

- (BOOL)requiresVisionFramework
{
  return 1;
}

+ (id)title
{
  return @"Face Detector";
}

- (BOOL)validateVisionKitSoftLinkSymbols
{
  if (getVNDetectFaceExpressionsRequestClass())
  {
    v5.receiver = self;
    v5.super_class = (Class)AXMFaceDetectorNode;
    return [(AXMVisionEngineNode *)&v5 validateVisionKitSoftLinkSymbols];
  }
  else
  {
    objc_super v4 = AXMediaLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[AXMFaceDetectorNode validateVisionKitSoftLinkSymbols]();
    }

    return 0;
  }
}

- (id)_createRequestsForContext:(id)a3
{
  id v4 = a3;
  objc_super v5 = [MEMORY[0x1E4F1CA48] array];
  v6 = [v4 analysisOptions];
  int v7 = [v6 detectFaceNames];

  if (v7)
  {
    v8 = [v4 sourceInput];
    id v9 = [v8 photoLibraryURL];

    v10 = [(AXMFaceDetectorNode *)self _faceNameHelper];

    if (!v10)
    {
      v11 = objc_alloc_init(AXMVisionFaceNameHelper);
      [(AXMFaceDetectorNode *)self set_faceNameHelper:v11];
    }
    v12 = [(AXMFaceDetectorNode *)self _faceNameHelper];
    int v13 = [v12 prepareForLookupWithPhotoLibraryURL:v9];

    if (v13)
    {
      if (!getVNCreateFaceprintRequestClass())
      {
        v45 = AXMediaLogCommon();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
          -[AXMFaceDetectorNode _createRequestsForContext:]();
        }
        goto LABEL_54;
      }
      v14 = [(AXMFaceDetectorNode *)self _faceprintRequest];

      if (!v14)
      {
        id v46 = objc_alloc_init((Class)getVNCreateFaceprintRequestClass());
        [(AXMFaceDetectorNode *)self set_faceprintRequest:v46];

        v47 = [(AXMFaceDetectorNode *)self _faceprintRequest];
        v48 = [(AXMFaceDetectorNode *)self _faceNameHelper];
        id v55 = 0;
        objc_msgSend(v47, "setRevision:error:", objc_msgSend(v48, "faceprintRequestRevisionForPersonsModel"), &v55);
        v45 = v55;

        if (v45)
        {
          v49 = AXMediaLogCommon();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
            [(AXMFaceDetectorNode *)self _createRequestsForContext:v49];
          }

LABEL_54:
LABEL_59:

          goto LABEL_60;
        }
      }
      v15 = [(AXMFaceDetectorNode *)self _faceprintRequest];
      [v5 addObject:v15];
    }
  }
  v16 = [v4 analysisOptions];
  int v17 = [v16 detectFaceAttributes];

  if (v17)
  {
    if (!getVNClassifyFaceAttributesRequestClass())
    {
      v41 = AXMediaLogCommon();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        -[AXMFaceDetectorNode _createRequestsForContext:]();
      }
      goto LABEL_49;
    }
    v18 = [(AXMFaceDetectorNode *)self _faceAttributesRequest];

    if (!v18)
    {
      id v42 = objc_alloc_init((Class)getVNClassifyFaceAttributesRequestClass());
      [(AXMFaceDetectorNode *)self set_faceAttributesRequest:v42];

      v43 = [(AXMFaceDetectorNode *)self _faceAttributesRequest];
      id v54 = 0;
      [v43 setRevision:3737841666 error:&v54];
      id v9 = v54;

      if (v9)
      {
        v44 = AXMediaLogCommon();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
          -[AXMFaceDetectorNode _createRequestsForContext:].cold.8((uint64_t)v9, v44);
        }
LABEL_58:

        goto LABEL_59;
      }
    }
    v19 = [(AXMFaceDetectorNode *)self _faceAttributesRequest];
    [v5 addObject:v19];
  }
  v20 = [v4 analysisOptions];
  int v21 = [v20 detectFaceExpressions];

  if (v21)
  {
    if (!getVNDetectFaceExpressionsRequestClass())
    {
      v41 = AXMediaLogCommon();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        -[AXMFaceDetectorNode validateVisionKitSoftLinkSymbols]();
      }
      goto LABEL_49;
    }
    v22 = [(AXMFaceDetectorNode *)self _faceExpressionsRequest];

    if (!v22)
    {
      id v23 = objc_alloc_init((Class)getVNDetectFaceExpressionsRequestClass());
      [(AXMFaceDetectorNode *)self set_faceExpressionsRequest:v23];
    }
    v24 = [(AXMFaceDetectorNode *)self _faceExpressionsRequest];
    [v5 addObject:v24];
  }
  v25 = [v4 analysisOptions];
  int v26 = [v25 detectFaceLandmarks];

  if (v26)
  {
    if (!getVNDetectFaceLandmarksRequestClass())
    {
      v41 = AXMediaLogCommon();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        -[AXMFaceDetectorNode _createRequestsForContext:].cold.4();
      }
      goto LABEL_49;
    }
    v27 = [(AXMFaceDetectorNode *)self _faceLandmarksRequest];

    if (!v27)
    {
      id v28 = objc_alloc_init((Class)getVNDetectFaceLandmarksRequestClass());
      [(AXMFaceDetectorNode *)self set_faceLandmarksRequest:v28];
    }
    v29 = [(AXMFaceDetectorNode *)self _faceLandmarksRequest];
    [v5 addObject:v29];
  }
  v30 = [v4 analysisOptions];
  int v31 = [v30 detectFacePose];

  if (v31)
  {
    if (!getVNDetectFacePoseRequestClass())
    {
      v41 = AXMediaLogCommon();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        -[AXMFaceDetectorNode _createRequestsForContext:].cold.5();
      }
      goto LABEL_49;
    }
    v32 = [(AXMFaceDetectorNode *)self _facePoseRequest];

    if (!v32)
    {
      id v33 = objc_alloc_init((Class)getVNDetectFacePoseRequestClass());
      [(AXMFaceDetectorNode *)self set_facePoseRequest:v33];
    }
    v34 = [(AXMFaceDetectorNode *)self _facePoseRequest];
    [v5 addObject:v34];
  }
  uint64_t v35 = [v5 count];
  v36 = [v4 analysisOptions];
  char v37 = [v36 detectFaceRectangles];

  if ((v37 & 1) == 0 && !v35) {
    goto LABEL_33;
  }
  if (getVNDetectFaceRectanglesRequestClass())
  {
    v38 = [(AXMFaceDetectorNode *)self _faceRectanglesRequest];

    if (!v38)
    {
      id v50 = objc_alloc_init((Class)getVNDetectFaceRectanglesRequestClass());
      [(AXMFaceDetectorNode *)self set_faceRectanglesRequest:v50];

      v51 = [(AXMFaceDetectorNode *)self _faceRectanglesRequest];
      id v53 = 0;
      [v51 setRevision:3737841666 error:&v53];
      id v9 = v53;

      if (v9)
      {
        v44 = AXMediaLogCommon();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
          -[AXMFaceDetectorNode _createRequestsForContext:].cold.7((uint64_t)v9, v44);
        }
        goto LABEL_58;
      }
    }
    v39 = [(AXMFaceDetectorNode *)self _faceRectanglesRequest];
    [v5 addObject:v39];

LABEL_33:
    id v40 = v5;
    goto LABEL_61;
  }
  v41 = AXMediaLogCommon();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
    -[AXMFaceDetectorNode _createRequestsForContext:].cold.6();
  }
LABEL_49:

LABEL_60:
  id v40 = 0;
LABEL_61:

  return v40;
}

- (id)_faceDetectionResultsForVisionRequests:(id)a3 canvasSize:(CGSize)a4
{
  objc_super v5 = (void *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  int v7 = [v5 dictionary];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__AXMFaceDetectorNode__faceDetectionResultsForVisionRequests_canvasSize___block_invoke;
  v12[3] = &unk_1E6116D88;
  v12[4] = self;
  id v8 = v7;
  id v13 = v8;
  [v6 enumerateObjectsUsingBlock:v12];

  id v9 = v13;
  id v10 = v8;

  return v10;
}

void __73__AXMFaceDetectorNode__faceDetectionResultsForVisionRequests_canvasSize___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  getVNDetectFaceRectanglesRequestClass();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    id v4 = [v3 results];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v94 objects:v103 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v95;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v95 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v94 + 1) + 8 * i);
          id v10 = *(void **)(a1 + 32);
          v11 = [v9 uuid];
          v12 = [v10 _faceResultForUUID:v11 inFaceDictionary:*(void *)(a1 + 40)];

          objc_msgSend(v12, "setFaceId:", objc_msgSend(v9, "faceId"));
          id v13 = [v9 uuid];
          [v12 setUuid:v13];

          [v9 boundingBox];
          objc_msgSend(v12, "setFrame:");
          [v9 confidence];
          [v12 setRectanglesConfidence:v14];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v94 objects:v103 count:16];
      }
      while (v6);
    }
    goto LABEL_46;
  }
  getVNCreateFaceprintRequestClass();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v92 = 0u;
    long long v93 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    id v4 = [v3 results];
    uint64_t v15 = [v4 countByEnumeratingWithState:&v90 objects:v102 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v91;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v91 != v17) {
            objc_enumerationMutation(v4);
          }
          v19 = *(void **)(*((void *)&v90 + 1) + 8 * j);
          v20 = *(void **)(a1 + 32);
          int v21 = [v19 uuid];
          v22 = [v20 _faceResultForUUID:v21 inFaceDictionary:*(void *)(a1 + 40)];

          id v23 = [*(id *)(a1 + 32) _faceNameHelper];
          v24 = [v23 nameForFaceObservation:v19];
          [v22 setName:v24];

          [v19 confidence];
          [v22 setNameConfidence:v25];
        }
        uint64_t v16 = [v4 countByEnumeratingWithState:&v90 objects:v102 count:16];
      }
      while (v16);
    }
    goto LABEL_46;
  }
  getVNClassifyFaceAttributesRequestClass();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v88 = 0u;
    long long v89 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    id v4 = [v3 results];
    uint64_t v26 = [v4 countByEnumeratingWithState:&v86 objects:v101 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      id v73 = v3;
      uint64_t v28 = *(void *)v87;
      do
      {
        for (uint64_t k = 0; k != v27; ++k)
        {
          if (*(void *)v87 != v28) {
            objc_enumerationMutation(v4);
          }
          v30 = *(void **)(*((void *)&v86 + 1) + 8 * k);
          int v31 = *(void **)(a1 + 32);
          v32 = [v30 uuid];
          id v33 = [v31 _faceResultForUUID:v32 inFaceDictionary:*(void *)(a1 + 40)];

          v34 = [AXMVisionFeatureFaceAttributes alloc];
          uint64_t v35 = [v30 faceAttributes];
          v36 = [(AXMVisionFeatureFaceAttributes *)v34 initWithVisionFaceAttributes:v35];
          [v33 setAttributes:v36];

          int64_t v37 = +[AXMVisionFeatureFaceAttributes defaultExcludeOptions];
          v38 = [v33 attributes];
          [v38 setExcludeOptions:v37];

          [v30 confidence];
          [v33 setAttributesConfidence:v39];
        }
        uint64_t v27 = [v4 countByEnumeratingWithState:&v86 objects:v101 count:16];
      }
      while (v27);
LABEL_45:
      id v3 = v73;
    }
  }
  else
  {
    getVNDetectFaceExpressionsRequestClass();
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v84 = 0u;
      long long v85 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      id v4 = [v3 results];
      uint64_t v40 = [v4 countByEnumeratingWithState:&v82 objects:v100 count:16];
      if (v40)
      {
        uint64_t v41 = v40;
        uint64_t v42 = *(void *)v83;
        do
        {
          for (uint64_t m = 0; m != v41; ++m)
          {
            if (*(void *)v83 != v42) {
              objc_enumerationMutation(v4);
            }
            v44 = *(void **)(*((void *)&v82 + 1) + 8 * m);
            v45 = *(void **)(a1 + 32);
            id v46 = [v44 uuid];
            v47 = [v45 _faceResultForUUID:v46 inFaceDictionary:*(void *)(a1 + 40)];

            v48 = [v44 expressionsAndConfidence];
            [v47 setExpressionsAndConfidence:v48];
          }
          uint64_t v41 = [v4 countByEnumeratingWithState:&v82 objects:v100 count:16];
        }
        while (v41);
      }
      goto LABEL_46;
    }
    getVNDetectFaceLandmarksRequestClass();
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v80 = 0u;
      long long v81 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      id v4 = [v3 results];
      uint64_t v49 = [v4 countByEnumeratingWithState:&v78 objects:v99 count:16];
      if (v49)
      {
        uint64_t v50 = v49;
        id v73 = v3;
        uint64_t v51 = *(void *)v79;
        do
        {
          for (uint64_t n = 0; n != v50; ++n)
          {
            if (*(void *)v79 != v51) {
              objc_enumerationMutation(v4);
            }
            id v53 = *(void **)(*((void *)&v78 + 1) + 8 * n);
            id v54 = *(void **)(a1 + 32);
            id v55 = [v53 uuid];
            v56 = [v54 _faceResultForUUID:v55 inFaceDictionary:*(void *)(a1 + 40)];

            v57 = [AXMVisionFeatureFaceLandmarks alloc];
            v58 = [v53 landmarks];
            v59 = [(AXMVisionFeatureFaceLandmarks *)v57 initWithVisionFaceLandmarks:v58];
            [v56 setLandmarks:v59];

            v60 = [AXMVisionFeatureFaceLandmarks alloc];
            v61 = [v53 landmarks3d];
            v62 = [(AXMVisionFeatureFaceLandmarks *)v60 initWithVisionFaceLandmarks:v61];
            [v56 setLandmarks3d:v62];

            [v53 confidence];
            [v56 setLandmarksConfidence:v63];
          }
          uint64_t v50 = [v4 countByEnumeratingWithState:&v78 objects:v99 count:16];
        }
        while (v50);
        goto LABEL_45;
      }
    }
    else
    {
      getVNDetectFacePoseRequestClass();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_47;
      }
      long long v76 = 0u;
      long long v77 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      id v4 = [v3 results];
      uint64_t v64 = [v4 countByEnumeratingWithState:&v74 objects:v98 count:16];
      if (v64)
      {
        uint64_t v65 = v64;
        uint64_t v66 = *(void *)v75;
        do
        {
          for (iuint64_t i = 0; ii != v65; ++ii)
          {
            if (*(void *)v75 != v66) {
              objc_enumerationMutation(v4);
            }
            v68 = *(void **)(*((void *)&v74 + 1) + 8 * ii);
            v69 = *(void **)(a1 + 32);
            v70 = [v68 uuid];
            v71 = [v69 _faceResultForUUID:v70 inFaceDictionary:*(void *)(a1 + 40)];

            [v68 pose];
            objc_msgSend(v71, "setPose:");
            [v68 confidence];
            [v71 setPoseConfidence:v72];
          }
          uint64_t v65 = [v4 countByEnumeratingWithState:&v74 objects:v98 count:16];
        }
        while (v65);
      }
    }
  }
LABEL_46:

LABEL_47:
}

- (void)evaluate:(id)a3 metrics:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AXMFaceDetectorNode;
  id v8 = [(AXMEvaluationNode *)&v16 evaluate:v6 metrics:v7];
  id v9 = (void *)MEMORY[0x1BA9A10B0](v8);
  id v10 = [(AXMFaceDetectorNode *)self _createRequestsForContext:v6];
  if ([v10 count])
  {
    [(AXMEvaluationNode *)self evaluateRequests:v10 withContext:v6 requestHandlerOptions:0 metrics:v7 error:0];
    [v6 size];
    v11 = -[AXMFaceDetectorNode _faceDetectionResultsForVisionRequests:canvasSize:](self, "_faceDetectionResultsForVisionRequests:canvasSize:", v10);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __40__AXMFaceDetectorNode_evaluate_metrics___block_invoke;
    v13[3] = &unk_1E6116DB0;
    id v12 = v6;
    id v14 = v12;
    [v11 enumerateKeysAndObjectsUsingBlock:v13];
    [v12 addEvaluatedFeatureType:5];
  }
  else
  {
    v11 = AXMediaLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B57D5000, v11, OS_LOG_TYPE_DEFAULT, "AXMFaceDetectorNode: no requests to evaluate", buf, 2u);
    }
  }
}

void __40__AXMFaceDetectorNode_evaluate_metrics___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a3;
  [v3 size];
  +[AXMVisionFeature featureWithFaceDetectionResult:canvasSize:](AXMVisionFeature, "featureWithFaceDetectionResult:canvasSize:", v4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  [v3 appendFeature:v5];
}

- (id)_faceResultForUUID:(id)a3 inFaceDictionary:(id)a4
{
  id v5 = a4;
  id v6 = [a3 UUIDString];
  id v7 = [v5 objectForKeyedSubscript:v6];
  if (!v7)
  {
    id v7 = objc_alloc_init(AXMVisionFeatureFaceDetectionResult);
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

- (VNDetectFaceRectanglesRequest)_faceRectanglesRequest
{
  return self->__faceRectanglesRequest;
}

- (void)set_faceRectanglesRequest:(id)a3
{
}

- (VNCreateFaceprintRequest)_faceprintRequest
{
  return self->__faceprintRequest;
}

- (void)set_faceprintRequest:(id)a3
{
}

- (VNClassifyFaceAttributesRequest)_faceAttributesRequest
{
  return self->__faceAttributesRequest;
}

- (void)set_faceAttributesRequest:(id)a3
{
}

- (VNDetectFaceExpressionsRequest)_faceExpressionsRequest
{
  return self->__faceExpressionsRequest;
}

- (void)set_faceExpressionsRequest:(id)a3
{
}

- (VNDetectFaceLandmarksRequest)_faceLandmarksRequest
{
  return self->__faceLandmarksRequest;
}

- (void)set_faceLandmarksRequest:(id)a3
{
}

- (VNDetectFacePoseRequest)_facePoseRequest
{
  return self->__facePoseRequest;
}

- (void)set_facePoseRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__facePoseRequest, 0);
  objc_storeStrong((id *)&self->__faceLandmarksRequest, 0);
  objc_storeStrong((id *)&self->__faceExpressionsRequest, 0);
  objc_storeStrong((id *)&self->__faceAttributesRequest, 0);
  objc_storeStrong((id *)&self->__faceprintRequest, 0);
  objc_storeStrong((id *)&self->__faceRectanglesRequest, 0);

  objc_storeStrong((id *)&self->__faceNameHelper, 0);
}

- (void)validateVisionKitSoftLinkSymbols
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1B57D5000, v0, v1, "Could not evaluate. VNDetectFaceExpressionsRequestSoft was nil", v2, v3, v4, v5, v6);
}

- (void)_createRequestsForContext:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1B57D5000, v0, v1, "Could not evaluate. VNCreateFaceprintRequestSoft was nil", v2, v3, v4, v5, v6);
}

- (void)_createRequestsForContext:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1B57D5000, v0, v1, "Could not evaluate. VNClassifyFaceAttributesRequestSoft was nil", v2, v3, v4, v5, v6);
}

- (void)_createRequestsForContext:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1B57D5000, v0, v1, "Could not evaluate. VNDetectFaceLandmarksRequestSoft was nil", v2, v3, v4, v5, v6);
}

- (void)_createRequestsForContext:.cold.5()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1B57D5000, v0, v1, "Could not evaluate. VNDetectFacePoseRequestSoft was nil", v2, v3, v4, v5, v6);
}

- (void)_createRequestsForContext:.cold.6()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1B57D5000, v0, v1, "Could not evaluate. VNDetectFaceRectanglesRequestSoft was nil", v2, v3, v4, v5, v6);
}

- (void)_createRequestsForContext:(uint64_t)a1 .cold.7(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B57D5000, a2, OS_LOG_TYPE_ERROR, "Could not set revision VNDetectFaceRectanglesRequestPrivateRevisionANOD3Detector. Error : %@", (uint8_t *)&v2, 0xCu);
}

- (void)_createRequestsForContext:(uint64_t)a1 .cold.8(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 134218242;
  uint64_t v3 = 3737841666;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1B57D5000, a2, OS_LOG_TYPE_ERROR, "Could not set face attributes revision %ld. Error : %@", (uint8_t *)&v2, 0x16u);
}

- (void)_createRequestsForContext:(NSObject *)a3 .cold.9(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 _faceNameHelper];
  int v6 = 134218242;
  uint64_t v7 = [v5 faceprintRequestRevisionForPersonsModel];
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1B57D5000, a3, OS_LOG_TYPE_ERROR, "Could not set revision %ld. Error : %@", (uint8_t *)&v6, 0x16u);
}

@end