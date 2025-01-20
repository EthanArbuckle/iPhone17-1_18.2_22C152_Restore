@interface VCPFaceCropManager
+ (BOOL)_allowANE;
- (BOOL)_clearDirtyStateOnFaceCrop:(id)a3 error:(id *)a4;
- (BOOL)_generateAndAssociateFaceprintedFaceForFaceCrop:(id)a3 faceCropFaceLocalIdentifier:(id *)a4 error:(id *)a5;
- (BOOL)_persistGeneratedFaceCrops:(id)a3 forAsset:(id)a4 error:(id *)a5;
- (BOOL)_processDirtyFaceCrop:(id)a3 faceCropFaceLocalIdentifier:(id *)a4 error:(id *)a5;
- (BOOL)_recordNeedToPersonBuildOnFaceGroupContainingFace:(id)a3 error:(id *)a4;
- (BOOL)_updateFace:(id)a3 withFaceCrop:(id)a4 error:(id *)a5;
- (BOOL)_updateFaceprint:(id)a3 forFace:(id)a4 error:(id *)a5;
- (BOOL)generateAndPersistFaceCropsForFaces:(id)a3 withAsset:(id)a4 resource:(id)a5 resourceURL:(id)a6 error:(id *)a7;
- (VCPFaceCropManager)initWithPhotoLibrary:(id)a3 andContext:(id)a4;
- (id)_associateFace:(id)a3 withFaceCrop:(id)a4 error:(id *)a5;
- (id)_bestFaceForFacePrintRequest:(id)a3 withRect:(CGRect)a4;
- (id)_bestObservationInAnimalObservations:(id)a3 withRect:(CGRect)a4;
- (id)_faceAssociatedWithFaceCrop:(id)a3;
- (id)_faceFromFaceCrop:(id)a3 error:(id *)a4;
- (id)_vcpAnimalFaceWithFaceCrop:(id)a3 animalFaceObservations:(id)a4 animalBodyObservations:(id)a5 animalprintRequest:(id)a6 normalizedFaceCropBoundingBox:(CGRect)a7 faceCropImageDimension:(CGSize)a8 error:(id *)a9;
- (id)_vcpFaceCropFromPHFaceCrop:(id)a3;
- (id)_vcpHumanFaceWithFaceCrop:(id)a3 imageRequestHandler:(id)a4 faceDetectionRequest:(id)a5 normalizedFaceCropBoundingBox:(CGRect)a6 faceCropImageDimension:(CGSize)a7 faceprintRequest:(id)a8 error:(id *)a9;
- (int)processDirtyFaceCrops:(unint64_t *)a3 withCancelBlock:(id)a4 andExtendTimeoutBlock:(id)a5;
@end

@implementation VCPFaceCropManager

- (VCPFaceCropManager)initWithPhotoLibrary:(id)a3 andContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VCPFaceCropManager;
  v9 = [(VCPFaceCropManager *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_photoLibrary, a3);
    objc_storeStrong((id *)&v10->_context, a4);
  }

  return v10;
}

- (BOOL)_persistGeneratedFaceCrops:(id)a3 forAsset:(id)a4 error:(id *)a5
{
  v64[2] = *MEMORY[0x1E4F143B8];
  id v39 = a3;
  id v41 = a4;
  v42 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  v38 = self;
  v46 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  [v46 setIncludeNonvisibleFaces:1];
  uint64_t v7 = *MEMORY[0x1E4F39638];
  v64[0] = *MEMORY[0x1E4F39620];
  v64[1] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:2];
  [v46 setFetchPropertySets:v8];

  [v46 setIncludedDetectionTypes:&unk_1F15EE280];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = v39;
  uint64_t v9 = [obj countByEnumeratingWithState:&v52 objects:v63 count:16];
  if (!v9)
  {

    id v48 = 0;
LABEL_23:
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __64__VCPFaceCropManager__persistGeneratedFaceCrops_forAsset_error___block_invoke;
    aBlock[3] = &unk_1E62982E8;
    id v50 = v42;
    id v51 = v41;
    v31 = _Block_copy(aBlock);
    BOOL v32 = [(PHPhotoLibrary *)v38->_photoLibrary performChangesAndWait:v31 error:a5];

    goto LABEL_28;
  }
  uint64_t v47 = *(void *)v53;
  id v48 = 0;
  uint64_t v44 = *MEMORY[0x1E4F28760];
  char v10 = 1;
  uint64_t v45 = *MEMORY[0x1E4F28568];
  do
  {
    uint64_t v11 = 0;
    do
    {
      if (*(void *)v53 != v47) {
        objc_enumerationMutation(obj);
      }
      objc_super v12 = *(void **)(*((void *)&v52 + 1) + 8 * v11);
      v13 = [v12 originatingFace];
      if (!v13)
      {
        v33 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v61 = v45;
        v34 = [NSString stringWithFormat:@"Cannot generate facecrop without originating face"];
        v62 = v34;
        v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v62 forKeys:&v61 count:1];
        uint64_t v36 = [v33 errorWithDomain:v44 code:-18 userInfo:v35];

        id v48 = (id)v36;
        goto LABEL_25;
      }
      v14 = (void *)MEMORY[0x1C186D320]();
      uint64_t v15 = [v13 localIdentifier];
      v16 = (void *)v15;
      if (!v15) {
        goto LABEL_13;
      }
      v17 = (void *)MEMORY[0x1E4F39048];
      uint64_t v60 = v15;
      v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v60 count:1];
      v19 = [v17 fetchFacesWithLocalIdentifiers:v18 options:v46];

      if ([v19 count] != 1)
      {

LABEL_13:
        v27 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v58 = v45;
        v28 = NSString;
        v23 = [v13 localIdentifier];
        v24 = [v28 stringWithFormat:@"Failed to find originating PHFace %@", v23];
        v59 = v24;
        v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
        uint64_t v26 = [v27 errorWithDomain:v44 code:-18 userInfo:v25];
        v20 = 0;
LABEL_14:

        int v29 = 0;
        char v10 = 0;
        id v48 = (id)v26;
        goto LABEL_15;
      }
      v20 = [v19 firstObject];

      if (!v20) {
        goto LABEL_13;
      }
      if ([v20 manual])
      {
        v21 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v56 = v45;
        v22 = NSString;
        v23 = [v20 localIdentifier];
        v24 = [v22 stringWithFormat:@"Failed to generate facecrop on manual originating face %@", v23];
        v57 = v24;
        v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
        uint64_t v26 = [v21 errorWithDomain:v44 code:-18 userInfo:v25];
        goto LABEL_14;
      }
      [v42 setObject:v12 forKey:v20];
      int v29 = 1;
LABEL_15:

      if (!v29) {
        goto LABEL_20;
      }
      ++v11;
    }
    while (v9 != v11);
    uint64_t v30 = [obj countByEnumeratingWithState:&v52 objects:v63 count:16];
    uint64_t v9 = v30;
  }
  while (v30);
LABEL_20:

  if (v10) {
    goto LABEL_23;
  }
LABEL_25:
  if (a5)
  {
    id v48 = v48;
    BOOL v32 = 0;
    *a5 = v48;
  }
  else
  {
    BOOL v32 = 0;
  }
LABEL_28:

  return v32;
}

void __64__VCPFaceCropManager__persistGeneratedFaceCrops_forAsset_error___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = [*(id *)(a1 + 32) keyEnumerator];
  uint64_t v2 = [obj countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v2)
  {
    uint64_t v4 = *(void *)v17;
    *(void *)&long long v3 = 138412546;
    long long v14 = v3;
    do
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v17 != v4) {
          objc_enumerationMutation(obj);
        }
        v6 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6, v14);
        id v8 = (void *)MEMORY[0x1E4F39078];
        uint64_t v9 = [v7 faceCropData];
        id v10 = (id)[v8 creationRequestsForFaceCropsWithOriginatingFace:v6 resourceData:v9];

        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          uint64_t v11 = VCPLogInstance();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            objc_super v12 = [*(id *)(a1 + 40) localIdentifier];
            v13 = [v6 localIdentifier];
            *(_DWORD *)buf = v14;
            v21 = v12;
            __int16 v22 = 2112;
            v23 = v13;
            _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_DEBUG, "[FaceCropManager][%@] Publish facecrop for face %@", buf, 0x16u);
          }
        }
      }
      uint64_t v2 = [obj countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v2);
  }
}

- (id)_faceAssociatedWithFaceCrop:(id)a3
{
  id v4 = a3;
  v5 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  [v5 setIncludeNonvisibleFaces:1];
  [v5 setIncludedDetectionTypes:&unk_1F15EE298];
  v6 = [MEMORY[0x1E4F39048] fetchFacesForFaceCrop:v4 options:v5];
  uint64_t v7 = [v6 firstObject];

  return v7;
}

- (id)_bestFaceForFacePrintRequest:(id)a3 withRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = [v8 results];
  uint64_t v10 = [v9 count];

  if (v10 == 1)
  {
    uint64_t v11 = [v8 results];
    objc_super v12 = [v11 firstObject];
  }
  else
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v13 = objc_msgSend(v8, "results", 0);
    objc_super v12 = 0;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v26;
      double v16 = 1.17549435e-38;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v26 != v15) {
            objc_enumerationMutation(v13);
          }
          long long v18 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          [v18 boundingBox];
          v36.origin.CGFloat x = x;
          v36.origin.CGFloat y = y;
          v36.size.CGFloat width = width;
          v36.size.CGFloat height = height;
          CGRect v33 = CGRectUnion(v32, v36);
          double v19 = v33.size.width;
          double v20 = v33.size.height;
          objc_msgSend(v18, "boundingBox", v33.origin.x, v33.origin.y);
          v37.origin.CGFloat x = x;
          v37.origin.CGFloat y = y;
          v37.size.CGFloat width = width;
          v37.size.CGFloat height = height;
          CGRect v35 = CGRectIntersection(v34, v37);
          double v21 = v19 * v20;
          if (v19 * v20 > 0.0)
          {
            double v22 = v35.size.width * v35.size.height / v21;
            if (v22 > v16)
            {
              id v23 = v18;

              objc_super v12 = v23;
              double v16 = v22;
            }
          }
        }
        uint64_t v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16, v21);
      }
      while (v14);
    }
  }
  return v12;
}

+ (BOOL)_allowANE
{
  return 1;
}

- (id)_vcpHumanFaceWithFaceCrop:(id)a3 imageRequestHandler:(id)a4 faceDetectionRequest:(id)a5 normalizedFaceCropBoundingBox:(CGRect)a6 faceCropImageDimension:(CGSize)a7 faceprintRequest:(id)a8 error:(id *)a9
{
  double height = a7.height;
  double width = a7.width;
  double v13 = a6.size.height;
  double v14 = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v39 = a3;
  id v20 = a4;
  id v21 = a5;
  id v22 = a8;
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    id v23 = VCPLogInstance();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      v24 = [v39 localIdentifier];
      *(_DWORD *)buf = 138412290;
      uint64_t v47 = v24;
      _os_log_impl(&dword_1BBEDA000, v23, OS_LOG_TYPE_DEBUG, "[FaceCropManager][%@] Create human face for face crop", buf, 0xCu);
    }
  }
  long long v25 = -[VCPFaceCropManager _bestFaceForFacePrintRequest:withRect:](self, "_bestFaceForFacePrintRequest:withRect:", v22, x, y, v14, v13);
  if (v25) {
    goto LABEL_12;
  }
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    long long v26 = VCPLogInstance();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      long long v27 = [v39 localIdentifier];
      *(_DWORD *)buf = 138412290;
      uint64_t v47 = v27;
      _os_log_impl(&dword_1BBEDA000, v26, OS_LOG_TYPE_DEBUG, "[FaceCropManager][%@] No human face detected; force faceprinting",
        buf,
        0xCu);
    }
  }
  long long v25 = objc_msgSend(MEMORY[0x1E4F457F8], "faceObservationWithRequestRevision:boundingBox:andAlignedBoundingBox:", objc_msgSend(v21, "revision"), x, y, v14, v13, x, y, v14, v13);
  uint64_t v45 = v25;
  long long v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
  [v22 setInputFaceObservations:v28];

  [v22 setForceFaceprintCreation:1];
  id v44 = v22;
  int v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
  id v40 = 0;
  char v30 = [v20 performRequests:v29 error:&v40];
  id v31 = v40;

  if (v30)
  {
    CGRect v32 = [v22 results];
    uint64_t v33 = [v32 firstObject];

    long long v25 = (void *)v33;
LABEL_12:
    v41[0] = v21;
    v41[1] = v22;
    id v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:2];
    LOBYTE(v38) = 1;
    a9 = +[VCPPhotosFace faceFromFaceObservation:v25 humanObservation:0 sourceWidth:(unint64_t)width sourceHeight:(unint64_t)height visionRequests:v31 processingVersion:[(VCPPhotosFaceProcessingContext *)self->_context processingVersion] force:v38 andError:a9];
    goto LABEL_13;
  }
  if (a9)
  {
    CGRect v35 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v42 = *MEMORY[0x1E4F28568];
    CGRect v36 = [NSString stringWithFormat:@"Failed to create faceprint - %@", v31];
    v43 = v36;
    CGRect v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
    *a9 = [v35 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v37];

    a9 = 0;
  }
LABEL_13:

  return a9;
}

- (id)_bestObservationInAnimalObservations:(id)a3 withRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if ([v8 count] == 1)
  {
    uint64_t v9 = [v8 firstObject];
  }
  else
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v10 = v8;
    uint64_t v9 = 0;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v23;
      double v13 = 1.17549435e-38;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          objc_msgSend(v15, "boundingBox", (void)v22);
          v33.origin.CGFloat x = x;
          v33.origin.CGFloat y = y;
          v33.size.CGFloat width = width;
          v33.size.CGFloat height = height;
          CGRect v30 = CGRectUnion(v29, v33);
          double v16 = v30.size.width;
          double v17 = v30.size.height;
          objc_msgSend(v15, "boundingBox", v30.origin.x, v30.origin.y);
          v34.origin.CGFloat x = x;
          v34.origin.CGFloat y = y;
          v34.size.CGFloat width = width;
          v34.size.CGFloat height = height;
          CGRect v32 = CGRectIntersection(v31, v34);
          double v18 = v16 * v17;
          if (v16 * v17 > 0.0)
          {
            double v19 = v32.size.width * v32.size.height / v18;
            if (v19 > v13)
            {
              id v20 = v15;

              uint64_t v9 = v20;
              double v13 = v19;
            }
          }
        }
        uint64_t v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16, v18);
      }
      while (v11);
    }
  }
  return v9;
}

- (id)_vcpAnimalFaceWithFaceCrop:(id)a3 animalFaceObservations:(id)a4 animalBodyObservations:(id)a5 animalprintRequest:(id)a6 normalizedFaceCropBoundingBox:(CGRect)a7 faceCropImageDimension:(CGSize)a8 error:(id *)a9
{
  double height = a8.height;
  double width = a8.width;
  double v11 = a7.size.height;
  double v12 = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v20 = a4;
  id v21 = a5;
  id v22 = a6;
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    long long v23 = VCPLogInstance();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      long long v24 = [v19 localIdentifier];
      *(_DWORD *)buf = 138412290;
      uint64_t v42 = v24;
      _os_log_impl(&dword_1BBEDA000, v23, OS_LOG_TYPE_DEBUG, "[FaceCropManager][%@] Create animal face for face crop", buf, 0xCu);
    }
  }
  uint64_t v25 = -[VCPFaceCropManager _bestObservationInAnimalObservations:withRect:](self, "_bestObservationInAnimalObservations:withRect:", v20, x, y, v12, v11);
  uint64_t v26 = -[VCPFaceCropManager _bestObservationInAnimalObservations:withRect:](self, "_bestObservationInAnimalObservations:withRect:", v21, x, y, v12, v11);
  uint64_t v27 = (void *)v26;
  if (v25 | v26)
  {
    if (v26)
    {
      long long v28 = [(id)v26 labels];
      CGRect v29 = [v28 firstObject];
      CGRect v30 = [v29 identifier];

LABEL_18:
      id v40 = v22;
      CGRect v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
      LODWORD(v39) = [(VCPPhotosFaceProcessingContext *)self->_context processingVersion];
      CGRect v32 = +[VCPPhotosFace faceFromAnimalHeadObservation:v25 animalBodyObservation:v27 animalLabel:v30 sourceWidth:(unint64_t)width sourceHeight:(unint64_t)height visionRequests:v36 processingVersion:v39];
      long long v28 = v30;
LABEL_19:

      goto LABEL_20;
    }
    CGRect v33 = [(id)v25 labels];
    CGRect v34 = [v33 firstObject];
    long long v28 = [v34 identifier];

    if ([v28 isEqualToString:*MEMORY[0x1E4F45B60]])
    {
      CGRect v35 = (id *)MEMORY[0x1E4F45B70];
LABEL_17:
      CGRect v30 = *v35;
      goto LABEL_18;
    }
    if ([v28 isEqualToString:*MEMORY[0x1E4F45B58]])
    {
      CGRect v35 = (id *)MEMORY[0x1E4F45B68];
      goto LABEL_17;
    }
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      CGRect v36 = VCPLogInstance();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v38 = [v19 localIdentifier];
        *(_DWORD *)buf = 138412290;
        uint64_t v42 = v38;
        _os_log_impl(&dword_1BBEDA000, v36, OS_LOG_TYPE_DEFAULT, "[FaceCropManager][%@] faceLabel is not dog or cat. Ignoring", buf, 0xCu);
      }
      CGRect v32 = 0;
      goto LABEL_19;
    }
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() < 7)
    {
      CGRect v32 = 0;
      goto LABEL_21;
    }
    long long v28 = VCPLogInstance();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      CGRect v31 = [v19 localIdentifier];
      *(_DWORD *)buf = 138412290;
      uint64_t v42 = v31;
      _os_log_impl(&dword_1BBEDA000, v28, OS_LOG_TYPE_DEBUG, "[FaceCropManager][%@] Either animal face or animal body detected in face crop", buf, 0xCu);
    }
  }
  CGRect v32 = 0;
LABEL_20:

LABEL_21:
  return v32;
}

- (id)_faceFromFaceCrop:(id)a3 error:(id *)a4
{
  v140[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v6)
  {
    if (!a4)
    {
      double v18 = 0;
      goto LABEL_33;
    }
    id v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v139 = *MEMORY[0x1E4F28568];
    id v8 = [NSString stringWithFormat:@"Facecrop is nil"];
    v140[0] = v8;
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v140 forKeys:&v139 count:1];
    [v19 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v15];
    double v18 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  id v8 = [v6 resourceData];
  if (!v8)
  {
    if (!a4) {
      goto LABEL_31;
    }
    id v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v137 = *MEMORY[0x1E4F28568];
    uint64_t v15 = [NSString stringWithFormat:@"Missing image data from facecrop %@", v7];
    v138 = v15;
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v138 forKeys:&v137 count:1];
    id v21 = [v20 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v16];
    goto LABEL_14;
  }
  if (!+[VCPFaceCropUtils isValidFaceCrop:v8])
  {
    if (!a4) {
      goto LABEL_31;
    }
    id v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v135 = *MEMORY[0x1E4F28568];
    uint64_t v15 = [NSString stringWithFormat:@"Invalid facecrop image data %@", v8];
    v136 = v15;
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v136 forKeys:&v135 count:1];
    id v21 = [v22 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v16];
    goto LABEL_14;
  }
  +[VCPFaceCropUtils faceBoundsFromFaceCrop:v8 error:a4];
  double x = v142.origin.x;
  double y = v142.origin.y;
  double width = v142.size.width;
  double height = v142.size.height;
  if (!CGRectIsNull(v142))
  {
    +[VCPFaceCropUtils faceCropDimensionsFromFaceCrop:v8 error:a4];
    double v25 = v23;
    double v26 = v24;
    uint64_t v27 = (double *)MEMORY[0x1E4F1DB30];
    if (v23 != *MEMORY[0x1E4F1DB30] || v24 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      +[VCPGeometryUtils normalizedRectForRect:inBoundsOfSize:](VCPGeometryUtils, "normalizedRectForRect:inBoundsOfSize:", x, y, width, height, v23, v24);
      double v29 = v144.origin.x;
      double v30 = v144.origin.y;
      double v96 = v144.size.width;
      double v97 = v144.size.height;
      if (CGRectIsNull(v144))
      {
        if (a4)
        {
          CGRect v31 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v129 = *MEMORY[0x1E4F28568];
          CGRect v32 = NSString;
          v145.origin.double x = x;
          v145.origin.double y = y;
          v145.size.double width = width;
          v145.size.double height = height;
          uint64_t v15 = NSStringFromRect(v145);
          id v16 = [v32 stringWithFormat:@"Failed to normalize bound %@ with image (%.0fx%.0f)", v15, *(void *)&v25, *(void *)&v26];
          id v130 = v16;
          CGRect v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v130 forKeys:&v129 count:1];
          *a4 = [v31 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v33];

          goto LABEL_7;
        }
LABEL_31:
        double v18 = 0;
        goto LABEL_32;
      }
      +[VCPFaceCropUtils faceCropDimensionsFromFaceCrop:v8 error:a4];
      double v37 = v36;
      double v38 = v35;
      if (v36 == *v27 && v35 == v27[1])
      {
        if (!a4) {
          goto LABEL_31;
        }
        uint64_t v39 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v127 = *MEMORY[0x1E4F28568];
        uint64_t v15 = [NSString stringWithFormat:@"Failed to obtain the facecrop image dimensions"];
        v128 = v15;
        id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v128 forKeys:&v127 count:1];
        id v21 = [v39 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v16];
        goto LABEL_14;
      }
      id v41 = objc_alloc(MEMORY[0x1E4F45890]);
      uint64_t v15 = (void *)[v41 initWithData:v8 orientation:1 options:MEMORY[0x1E4F1CC08]];
      if (!v15)
      {
        if (!a4)
        {
          double v18 = 0;
          goto LABEL_16;
        }
        v46 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v125 = *MEMORY[0x1E4F28568];
        id v16 = [NSString stringWithFormat:@"Failed to create VNImageRequestHandler"];
        id v126 = v16;
        id v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v126 forKeys:&v125 count:1];
        [v46 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v44];
        double v18 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_104;
      }
      id v105 = 0;
      int v42 = +[VCPFaceUtils configureVNRequest:&v105 withClass:objc_opt_class() andProcessingVersion:[(VCPPhotosFaceProcessingContext *)self->_context processingVersion]];
      id v16 = v105;
      if (v42)
      {
        if (!a4) {
          goto LABEL_7;
        }
        uint64_t v43 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v123 = *MEMORY[0x1E4F28568];
        id v44 = [NSString stringWithFormat:@"Failed to set VNDetectFaceRectanglesRequest"];
        id v124 = v44;
        uint64_t v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v124 forKeys:&v123 count:1];
        [v43 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v45];
        double v18 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_103;
      }
      id v104 = 0;
      int v47 = +[VCPFaceUtils configureVNRequest:&v104 withClass:objc_opt_class() andProcessingVersion:[(VCPPhotosFaceProcessingContext *)self->_context processingVersion]];
      id v44 = v104;
      if (v47)
      {
        if (!a4)
        {
          double v18 = 0;
LABEL_104:

          goto LABEL_15;
        }
        uint64_t v48 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v121 = *MEMORY[0x1E4F28568];
        uint64_t v45 = [NSString stringWithFormat:@"Failed to set VNRecognizeAnimalFacesRequest"];
        v122 = v45;
        v93 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v122 forKeys:&v121 count:1];
        objc_msgSend(v48, "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F28760], -18);
        double v18 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_103:
        goto LABEL_104;
      }
      id v103 = 0;
      int v49 = +[VCPFaceUtils configureVNRequest:&v103 withClass:objc_opt_class() andProcessingVersion:[(VCPPhotosFaceProcessingContext *)self->_context processingVersion]];
      id v50 = v103;
      uint64_t v45 = v50;
      if (v49)
      {
        if (!a4)
        {
          double v18 = 0;
          goto LABEL_103;
        }
        id v51 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v119 = *MEMORY[0x1E4F28568];
        uint64_t v120 = [NSString stringWithFormat:@"Failed to set VNRecognizeAnimalsRequest"];
        id v94 = (id)v120;
        v91 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v120 forKeys:&v119 count:1];
        [v51 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v91];
        double v18 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_102:
        goto LABEL_103;
      }
      v118[0] = v16;
      v118[1] = v44;
      v118[2] = v50;
      long long v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:v118 count:3];
      id v102 = 0;
      char v53 = [v15 performRequests:v52 error:&v102];
      id v94 = v102;

      if ((v53 & 1) == 0)
      {
        if (!a4)
        {
          double v18 = 0;
          goto LABEL_102;
        }
        uint64_t v56 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v116 = *MEMORY[0x1E4F28568];
        id v92 = [NSString stringWithFormat:@"Failed to detect facecrop - %@", v94];
        id v117 = v92;
        v90 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v117 forKeys:&v116 count:1];
        [v56 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v90];
        double v18 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_101;
      }
      id v101 = 0;
      int v54 = +[VCPFaceUtils configureVNRequest:&v101 withClass:objc_opt_class() andProcessingVersion:[(VCPPhotosFaceProcessingContext *)self->_context processingVersion]];
      id v92 = v101;
      if (v54)
      {
        if (a4)
        {
          long long v55 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v114 = *MEMORY[0x1E4F28568];
          id v89 = [NSString stringWithFormat:@"Failed to set VNCreateFaceprintRequest"];
          id v115 = v89;
          v87 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v115 forKeys:&v114 count:1];
          [v55 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v87];
          double v18 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_100:
          goto LABEL_101;
        }
        double v18 = 0;
LABEL_101:

        goto LABEL_102;
      }
      id v100 = 0;
      int v57 = +[VCPFaceUtils configureVNRequest:&v100 withClass:objc_opt_class() andProcessingVersion:[(VCPPhotosFaceProcessingContext *)self->_context processingVersion]];
      id v89 = v100;
      if (v57)
      {
        if (!a4)
        {
          double v18 = 0;
          goto LABEL_100;
        }
        uint64_t v58 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v112 = *MEMORY[0x1E4F28568];
        v88 = [NSString stringWithFormat:@"Failed to set VNCreateAnimalprintRequest"];
        v113 = v88;
        v84 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v113 forKeys:&v112 count:1];
        [v58 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v84];
        double v18 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_99:
        goto LABEL_100;
      }
      v88 = [MEMORY[0x1E4F1CA48] array];
      v59 = [v16 results];
      BOOL v60 = v59 == 0;

      if (!v60)
      {
        uint64_t v61 = [v16 results];
        [v92 setInputFaceObservations:v61];

        [v88 addObject:v92];
      }
      v62 = [v44 results];
      BOOL v63 = v62 == 0;

      if (!v63)
      {
        v85 = [MEMORY[0x1E4F1CA48] array];
        v64 = [v45 results];
        BOOL v65 = [v64 count] == 0;

        if (!v65)
        {
          v66 = [v45 results];
          [v85 addObjectsFromArray:v66];
        }
        v67 = [v44 results];
        BOOL v68 = [v67 count] == 0;

        if (!v68)
        {
          v69 = [v44 results];
          [v85 addObjectsFromArray:v69];
        }
        [v89 setInputDetectedObjectObservations:v85];
        [v88 addObject:v89];
      }
      id v99 = v94;
      char v70 = [v15 performRequests:v88 error:&v99];
      id v83 = v99;

      if ((v70 & 1) == 0)
      {
        if (!a4)
        {
          double v18 = 0;
          id v94 = v83;
          goto LABEL_99;
        }
        v72 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v110 = *MEMORY[0x1E4F28568];
        v86 = [NSString stringWithFormat:@"Failed to print facecrop - %@", v83];
        v111 = v86;
        v95 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v111 forKeys:&v110 count:1];
        [v72 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v95];
        double v18 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_98:

        id v94 = v83;
        goto LABEL_99;
      }
      v86 = [(PHPhotoLibrary *)self->_photoLibrary mad_allPersonsFetchOptions];
      v95 = [MEMORY[0x1E4F391F8] fetchPersonForFaceCrop:v7 options:v86];
      v82 = [v95 firstObject];
      if (!v82)
      {
        if ((int)MediaAnalysisLogLevel() < 3)
        {
          double v18 = 0;
LABEL_97:

          goto LABEL_98;
        }
        v71 = VCPLogInstance();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
        {
          v73 = [v7 localIdentifier];
          *(_DWORD *)buf = 138412290;
          id v109 = v73;
          _os_log_impl(&dword_1BBEDA000, v71, OS_LOG_TYPE_ERROR, "[FaceCropManager][%@] Failed to retrieve PHPerson from face crop", buf, 0xCu);
        }
        goto LABEL_95;
      }
      if ([v82 detectionType] == 1)
      {
        v71 = -[VCPFaceCropManager _vcpHumanFaceWithFaceCrop:imageRequestHandler:faceDetectionRequest:normalizedFaceCropBoundingBox:faceCropImageDimension:faceprintRequest:error:](self, "_vcpHumanFaceWithFaceCrop:imageRequestHandler:faceDetectionRequest:normalizedFaceCropBoundingBox:faceCropImageDimension:faceprintRequest:error:", v7, v15, v16, v92, a4, v29, v30, v96, v97, v37, v38);
      }
      else
      {
        if ([v82 detectionType] != 3
          && [v82 detectionType] != 4)
        {
          goto LABEL_87;
        }
        v81 = [v44 results];
        v74 = [v45 results];
        v71 = -[VCPFaceCropManager _vcpAnimalFaceWithFaceCrop:animalFaceObservations:animalBodyObservations:animalprintRequest:normalizedFaceCropBoundingBox:faceCropImageDimension:error:](self, "_vcpAnimalFaceWithFaceCrop:animalFaceObservations:animalBodyObservations:animalprintRequest:normalizedFaceCropBoundingBox:faceCropImageDimension:error:", v7, v81, v74, v89, a4, v29, v30, v96, v97, v37, v38);
      }
      if (v71)
      {
        v75 = [v71 imageprintWrapper];
        BOOL v76 = v75 == 0;

        if (!v76)
        {
          v71 = v71;
          double v18 = v71;
LABEL_96:

          goto LABEL_97;
        }
        if (a4)
        {
          v98 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v106 = *MEMORY[0x1E4F28568];
          v79 = [NSString stringWithFormat:@"Failed to wrap faceprint/faceTorsoprint/animalprint"];
          v107 = v79;
          v80 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v107 forKeys:&v106 count:1];
          *a4 = [v98 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v80];
        }
LABEL_95:
        double v18 = 0;
        goto LABEL_96;
      }
LABEL_87:
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v77 = VCPLogInstance();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
        {
          id v78 = *a4;
          *(_DWORD *)buf = 138412290;
          id v109 = v78;
          _os_log_impl(&dword_1BBEDA000, v77, OS_LOG_TYPE_ERROR, "[FaceCropManager] Failed to create VCPPhotosFace - %@", buf, 0xCu);
        }
      }
      v71 = 0;
      goto LABEL_95;
    }
    if (!a4) {
      goto LABEL_31;
    }
    CGRect v34 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v131 = *MEMORY[0x1E4F28568];
    uint64_t v15 = [NSString stringWithFormat:@"Facecrop image size equals to 0"];
    v132 = v15;
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v132 forKeys:&v131 count:1];
    id v21 = [v34 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v16];
LABEL_14:
    double v18 = 0;
    *a4 = v21;
    goto LABEL_15;
  }
  if (!a4) {
    goto LABEL_31;
  }
  double v13 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v133 = *MEMORY[0x1E4F28568];
  double v14 = NSString;
  v143.origin.double x = x;
  v143.origin.double y = y;
  v143.size.double width = width;
  v143.size.double height = height;
  uint64_t v15 = NSStringFromRect(v143);
  id v16 = [v14 stringWithFormat:@"Invalid facecrop bounding box %@", v15];
  id v134 = v16;
  double v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v134 forKeys:&v133 count:1];
  *a4 = [v13 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v17];

LABEL_7:
  double v18 = 0;
LABEL_15:

LABEL_16:
LABEL_32:

LABEL_33:
  return v18;
}

- (id)_associateFace:(id)a3 withFaceCrop:(id)a4 error:(id *)a5
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 localIdentifier];

  if (v10)
  {
    if (!a5) {
      goto LABEL_13;
    }
    double v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v40 = *MEMORY[0x1E4F28568];
    double v12 = [NSString stringWithFormat:@"Face has already been persisted with a facecrop"];
    v41[0] = v12;
    double v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:&v40 count:1];
    *a5 = [v11 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v13];

    goto LABEL_4;
  }
  double v14 = [v8 imageprintWrapper];

  if (v14)
  {
    uint64_t v30 = 0;
    CGRect v31 = &v30;
    uint64_t v32 = 0x3032000000;
    CGRect v33 = __Block_byref_object_copy__28;
    CGRect v34 = __Block_byref_object_dispose__28;
    id v35 = 0;
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    double v25 = __56__VCPFaceCropManager__associateFace_withFaceCrop_error___block_invoke;
    double v26 = &unk_1E629AD70;
    id v27 = v8;
    double v29 = &v30;
    id v28 = v9;
    uint64_t v15 = _Block_copy(&v23);
    if (-[PHPhotoLibrary performChangesAndWait:error:](self->_photoLibrary, "performChangesAndWait:error:", v15, a5, v23, v24, v25, v26))
    {
      a5 = (id *)(id)v31[5];
    }
    else if (a5)
    {
      id v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v36 = *MEMORY[0x1E4F28568];
      id v20 = [NSString stringWithFormat:@"Failed to persist face and facecrop"];
      double v37 = v20;
      id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
      *a5 = [v19 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v21];

      a5 = 0;
    }

    _Block_object_dispose(&v30, 8);
  }
  else if (a5)
  {
    id v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v38 = *MEMORY[0x1E4F28568];
    double v17 = [NSString stringWithFormat:@"Face does not have a faceprint"];
    uint64_t v39 = v17;
    double v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
    *a5 = [v16 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v18];

LABEL_4:
    a5 = 0;
  }
LABEL_13:

  return a5;
}

void __56__VCPFaceCropManager__associateFace_withFaceCrop_error___block_invoke(void *a1)
{
  id v7 = [MEMORY[0x1E4F39058] creationRequestForFace];
  +[VCPFaceUtils assignPropertiesOfVCPPhotosFace:toPHFaceChangeRequest:](VCPFaceUtils, "assignPropertiesOfVCPPhotosFace:toPHFaceChangeRequest:", a1[4]);
  uint64_t v2 = [v7 placeholderForCreatedFace];
  uint64_t v3 = [v2 localIdentifier];
  uint64_t v4 = *(void *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = [MEMORY[0x1E4F39078] changeRequestForFaceCrop:a1[5]];
  [v6 setState:1];
  [v6 setFace:v2];
}

- (BOOL)_clearDirtyStateOnFaceCrop:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __55__VCPFaceCropManager__clearDirtyStateOnFaceCrop_error___block_invoke;
    aBlock[3] = &unk_1E6296FF8;
    double v13 = v6;
    id v8 = _Block_copy(aBlock);
    BOOL v9 = [(PHPhotoLibrary *)self->_photoLibrary performChangesAndWait:v8 error:a4];

    id v10 = v13;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() < 3)
    {
      BOOL v9 = 0;
      goto LABEL_8;
    }
    id v10 = VCPLogInstance();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_ERROR, "[FaceCropManager] faceCrop is nil; ignore resetting state to PHFaceCropStateProcessed",
        buf,
        2u);
    }
    BOOL v9 = 0;
  }

LABEL_8:
  return v9;
}

void __55__VCPFaceCropManager__clearDirtyStateOnFaceCrop_error___block_invoke(uint64_t a1)
{
  id v1 = [MEMORY[0x1E4F39078] changeRequestForFaceCrop:*(void *)(a1 + 32)];
  [v1 setState:1];
}

- (BOOL)_generateAndAssociateFaceprintedFaceForFaceCrop:(id)a3 faceCropFaceLocalIdentifier:(id *)a4 error:(id *)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v24 = 0;
  BOOL v9 = [(VCPFaceCropManager *)self _faceFromFaceCrop:v8 error:&v24];
  id v10 = v24;
  double v11 = v10;
  if (v9)
  {
    id v23 = v10;
    double v12 = [(VCPFaceCropManager *)self _associateFace:v9 withFaceCrop:v8 error:&v23];
    id v13 = v23;

    BOOL v14 = v12 != 0;
    if (v12)
    {
      if (a4) {
        *a4 = v12;
      }
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        uint64_t v15 = VCPLogInstance();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          id v16 = [v8 localIdentifier];
          *(_DWORD *)buf = 138412546;
          double v26 = v16;
          __int16 v27 = 2112;
          id v28 = v12;
          _os_log_impl(&dword_1BBEDA000, v15, OS_LOG_TYPE_DEBUG, "[FacecropManager][%@] Associated with face %@", buf, 0x16u);
        }
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        id v19 = VCPLogInstance();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          id v20 = [v8 localIdentifier];
          id v21 = [v9 localIdentifier];
          *(_DWORD *)buf = 138412802;
          double v26 = v20;
          __int16 v27 = 2112;
          id v28 = v21;
          __int16 v29 = 2112;
          id v30 = v13;
          _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_ERROR, "[FaceCropManager][%@] Failed to associate with face %@ - %@", buf, 0x20u);
        }
      }
      if (a5) {
        *a5 = v13;
      }
    }

    double v11 = v13;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      double v17 = VCPLogInstance();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        double v18 = [v8 localIdentifier];
        *(_DWORD *)buf = 138412546;
        double v26 = v18;
        __int16 v27 = 2112;
        id v28 = v11;
        _os_log_impl(&dword_1BBEDA000, v17, OS_LOG_TYPE_ERROR, "[FaceCropManager][%@] Failed to faceprint - %@", buf, 0x16u);
      }
    }
    if (a5) {
      *a5 = v11;
    }
    [(VCPFaceCropManager *)self _clearDirtyStateOnFaceCrop:v8 error:a5];
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)_updateFaceprint:(id)a3 forFace:(id)a4 error:(id *)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc(MEMORY[0x1E4F39090]);
  double v11 = [v8 data];
  double v12 = objc_msgSend(v10, "initWithFaceprintData:faceprintVersion:", v11, (int)objc_msgSend(v8, "version"));

  if (v12)
  {
    id v13 = [v9 photoLibrary];
    BOOL v14 = +[VCPPhotosPersistenceDelegate newAllPersonsFetchOptionsWithPhotoLibrary:v13];

    uint64_t v15 = [MEMORY[0x1E4F391F8] fetchPersonWithFace:v9 options:v14];
    id v16 = [v15 firstObject];

    if ([v16 type] == -1 && objc_msgSend(v16, "verifiedType") == 2) {
      uint64_t v17 = -1;
    }
    else {
      uint64_t v17 = 0;
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __53__VCPFaceCropManager__updateFaceprint_forFace_error___block_invoke;
    aBlock[3] = &unk_1E6298650;
    id v23 = v9;
    id v24 = v12;
    uint64_t v25 = v17;
    double v18 = _Block_copy(aBlock);
    BOOL v19 = [(PHPhotoLibrary *)self->_photoLibrary performChangesAndWait:v18 error:a5];
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() < 3)
    {
      BOOL v19 = 0;
      goto LABEL_12;
    }
    BOOL v14 = VCPLogInstance();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v20 = [v9 localIdentifier];
      *(_DWORD *)buf = 138412290;
      __int16 v27 = v20;
      _os_log_impl(&dword_1BBEDA000, v14, OS_LOG_TYPE_ERROR, "[FacecropManager] Failed to retreive faceprint for face %@", buf, 0xCu);
    }
    BOOL v19 = 0;
  }

LABEL_12:
  return v19;
}

void __53__VCPFaceCropManager__updateFaceprint_forFace_error___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F39058] changeRequestForFace:*(void *)(a1 + 32)];
  [v2 setFaceprint:*(void *)(a1 + 40)];
  [v2 setClusterSequenceNumber:0];
  [v2 setVuObservationID:*(void *)(a1 + 48)];
  objc_msgSend(v2, "setFaceAlgorithmVersion:", objc_msgSend(*(id *)(a1 + 40), "faceprintVersion"));
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    uint64_t v3 = VCPLogInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v4 = [*(id *)(a1 + 32) localIdentifier];
      int v5 = 138412290;
      id v6 = v4;
      _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_DEBUG, "[FacecropManager] Updating faceprint for face %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (BOOL)_updateFace:(id)a3 withFaceCrop:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v18 = 0;
  id v9 = [(VCPFaceCropManager *)self _faceFromFaceCrop:a4 error:&v18];
  id v10 = v18;
  id v11 = v10;
  if (v9)
  {
    double v12 = [v9 imageprintWrapper];
    id v17 = v11;
    BOOL v13 = [(VCPFaceCropManager *)self _updateFaceprint:v12 forFace:v8 error:&v17];
    id v14 = v17;

    if (v13)
    {
      BOOL v15 = 1;
LABEL_10:
      id v11 = v14;
      goto LABEL_11;
    }
    if (!a5)
    {
      BOOL v15 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    if (!a5)
    {
      BOOL v15 = 0;
      goto LABEL_11;
    }
    id v14 = v10;
  }
  id v11 = v14;
  BOOL v15 = 0;
  *a5 = v11;
LABEL_11:

  return v15;
}

- (BOOL)_recordNeedToPersonBuildOnFaceGroupContainingFace:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  id v8 = [MEMORY[0x1E4F39080] fetchFaceGroupsWithFace:v6 options:v7];
  id v9 = [v8 firstObject];
  id v10 = v9;
  if (v9)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __78__VCPFaceCropManager__recordNeedToPersonBuildOnFaceGroupContainingFace_error___block_invoke;
    aBlock[3] = &unk_1E6296FF8;
    id v11 = v9;
    id v19 = v11;
    double v12 = _Block_copy(aBlock);
    BOOL v13 = [(PHPhotoLibrary *)self->_photoLibrary performChangesAndWait:v12 error:a4];
    if (v13 && (int)MediaAnalysisLogLevel() >= 7)
    {
      id v14 = VCPLogInstance();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        id v17 = [v11 localIdentifier];
        BOOL v15 = [v6 localIdentifier];
        *(_DWORD *)buf = 138412546;
        id v21 = v17;
        __int16 v22 = 2112;
        id v23 = v15;
        _os_log_impl(&dword_1BBEDA000, v14, OS_LOG_TYPE_DEBUG, "[FaceCropManager] Set personBuilderState of faceGroup %@ for face %@", buf, 0x16u);
      }
    }
  }
  else
  {
    BOOL v13 = 1;
  }

  return v13;
}

void __78__VCPFaceCropManager__recordNeedToPersonBuildOnFaceGroupContainingFace_error___block_invoke(uint64_t a1)
{
  id v1 = [MEMORY[0x1E4F39088] changeRequestForFaceGroup:*(void *)(a1 + 32)];
  [v1 setPersonBuilderState:1];
}

- (BOOL)_processDirtyFaceCrop:(id)a3 faceCropFaceLocalIdentifier:(id *)a4 error:(id *)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = [v8 resourceData];
  +[VCPFaceCropUtils faceCropDimensionsFromFaceCrop:v9 error:a5];
  uint64_t v11 = v10;
  BOOL v13 = v12;

  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v14 = VCPLogInstance();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      BOOL v15 = [v8 localIdentifier];
      *(_DWORD *)buf = 138412802;
      id v41 = v15;
      __int16 v42 = 2048;
      *(void *)uint64_t v43 = v11;
      *(_WORD *)&v43[8] = 2048;
      id v44 = v13;
      _os_log_impl(&dword_1BBEDA000, v14, OS_LOG_TYPE_INFO, "[FaceCropManager][%@] Analyzing facecrop (%.0fx%.0f)", buf, 0x20u);
    }
  }
  if (![v8 state])
  {
    id v20 = [v8 resourceData];
    BOOL v21 = v20 == 0;

    if (v21)
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        BOOL v19 = 0;
        goto LABEL_43;
      }
      id v16 = VCPLogInstance();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v32 = [v8 localIdentifier];
        *(_DWORD *)buf = 138412290;
        id v41 = v32;
        _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_ERROR, "[FaceCropManager][%@] FaceCrop does not have data", buf, 0xCu);
      }
    }
    else
    {
      id v16 = [(VCPFaceCropManager *)self _faceAssociatedWithFaceCrop:v8];
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        __int16 v22 = VCPLogInstance();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          id v23 = [v8 localIdentifier];
          uint64_t v24 = [v16 localIdentifier];
          *(_DWORD *)buf = 138412546;
          id v41 = v23;
          __int16 v42 = 2112;
          *(void *)uint64_t v43 = v24;
          _os_log_impl(&dword_1BBEDA000, v22, OS_LOG_TYPE_DEBUG, "[FaceCropManager][%@] existing face %@", buf, 0x16u);
        }
      }
      if (!v16)
      {
        BOOL v33 = [(VCPFaceCropManager *)self _generateAndAssociateFaceprintedFaceForFaceCrop:v8 faceCropFaceLocalIdentifier:a4 error:a5];
LABEL_42:
        BOOL v19 = v33;
        goto LABEL_43;
      }
      id v39 = 0;
      BOOL v25 = [(VCPFaceCropManager *)self _updateFace:v16 withFaceCrop:v8 error:&v39];
      id v26 = v39;
      if (v25)
      {
        if ([v16 clusterSequenceNumber])
        {
          id v38 = 0;
          BOOL v27 = [(VCPFaceCropManager *)self _recordNeedToPersonBuildOnFaceGroupContainingFace:v16 error:&v38];
          id v28 = v38;
          if (!v27 && (int)MediaAnalysisLogLevel() >= 4)
          {
            __int16 v29 = VCPLogInstance();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              id v30 = [v16 localIdentifier];
              uint64_t v31 = [v16 localIdentifier];
              *(_DWORD *)buf = 138412802;
              id v41 = v30;
              __int16 v42 = 2112;
              *(void *)uint64_t v43 = v31;
              *(_WORD *)&v43[8] = 2112;
              id v44 = v28;
              _os_log_impl(&dword_1BBEDA000, v29, OS_LOG_TYPE_DEFAULT, "[FaceCropManager][%@] Failed to record needing to Person Building for face %@ - %@", buf, 0x20u);
            }
          }
        }
        else if (a4 {
               && ([v16 detectionType] == 1
        }
                || [(PHPhotoLibrary *)self->_photoLibrary mad_useVUGallery]))
        {
          *a4 = [v16 localIdentifier];
        }

        BOOL v33 = [(VCPFaceCropManager *)self _clearDirtyStateOnFaceCrop:v8 error:a5];
        goto LABEL_42;
      }
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        CGRect v34 = VCPLogInstance();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          id v35 = [v16 localIdentifier];
          uint64_t v36 = [v16 localIdentifier];
          *(_DWORD *)buf = 138412802;
          id v41 = v35;
          __int16 v42 = 2112;
          *(void *)uint64_t v43 = v36;
          *(_WORD *)&v43[8] = 2112;
          id v44 = v26;
          _os_log_impl(&dword_1BBEDA000, v34, OS_LOG_TYPE_ERROR, "[FaceCropManager][%@] Failed to update associated face %@ - %@", buf, 0x20u);
        }
      }
    }
    BOOL v19 = 0;
LABEL_35:

    goto LABEL_43;
  }
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v16 = VCPLogInstance();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = [v8 localIdentifier];
      int v18 = [v8 state];
      *(_DWORD *)buf = 138412802;
      id v41 = v17;
      __int16 v42 = 1024;
      *(_DWORD *)uint64_t v43 = v18;
      *(_WORD *)&v43[4] = 1024;
      *(_DWORD *)&v43[6] = 0;
      _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_INFO, "[FaceCropManager][%@] Not in a dirty state (state:%d, expect:%d); skipping process",
        buf,
        0x18u);
    }
    BOOL v19 = 1;
    goto LABEL_35;
  }
  BOOL v19 = 1;
LABEL_43:

  return v19;
}

- (id)_vcpFaceCropFromPHFaceCrop:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 localIdentifier];
  if (v4)
  {
    int v5 = [VCPFaceCrop alloc];
    id v6 = [v3 resourceData];
    uint64_t v7 = [(VCPFaceCrop *)v5 initWithLocalIdentifier:v4 faceCropData:v6];

    -[VCPFaceCrop setState:](v7, "setState:", [v3 state]);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (BOOL)generateAndPersistFaceCropsForFaces:(id)a3 withAsset:(id)a4 resource:(id)a5 resourceURL:(id)a6 error:(id *)a7
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v45 = a4;
  id v41 = a5;
  id v44 = a6;
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v50 objects:v65 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v51 != v14) {
          objc_enumerationMutation(v12);
        }
        id v16 = +[VCPPhotosFace faceFromPHFace:*(void *)(*((void *)&v50 + 1) + 8 * i) copyOption:0];
        if (v16) {
          [v11 addObject:v16];
        }
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v50 objects:v65 count:16];
    }
    while (v13);
  }

  if ([v11 count])
  {
    os_log_t log = [MEMORY[0x1E4F1CA48] array];
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id obj = v11;
    uint64_t v17 = [obj countByEnumeratingWithState:&v46 objects:v64 count:16];
    if (!v17) {
      goto LABEL_32;
    }
    uint64_t v18 = *(void *)v47;
    while (1)
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v47 != v18) {
          objc_enumerationMutation(obj);
        }
        id v20 = *(void **)(*((void *)&v46 + 1) + 8 * v19);
        if ([v20 manual])
        {
          if ((int)MediaAnalysisLogLevel() < 4) {
            goto LABEL_30;
          }
          BOOL v21 = VCPLogInstance();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v22 = [v45 localIdentifier];
            id v23 = [v20 localIdentifier];
            *(_DWORD *)buf = 138412546;
            long long v55 = v22;
            __int16 v56 = 2112;
            uint64_t v57 = (uint64_t)v23;
            _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_DEFAULT, "[FaceCropManager][%@] Facecrop will not be generated for the manual face %@", buf, 0x16u);
          }
        }
        else
        {
          id v24 = [v45 creationDate];
          if (_GetGroupingIdentifier(NSDate *)::dateFormatterCreationToken != -1) {
            dispatch_once(&_GetGroupingIdentifier(NSDate *)::dateFormatterCreationToken, &__block_literal_global_45);
          }
          BOOL v25 = [(id)_GetGroupingIdentifier(NSDate *)::dateFormatterToStripTime stringFromDate:v24];

          BOOL v21 = +[VCPFaceCrop generateFaceCropsForFace:v20 resourceURL:v44 groupingIdentifier:v25];

          if (v21)
          {
            [log addObject:v21];
            [v21 imageDimensions];
            if (v26 < 128.0 || ([v21 imageDimensions], v27 < 128.0))
            {
              if ((int)MediaAnalysisLogLevel() >= 3)
              {
                id v28 = VCPLogInstance();
                if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                {
                  __int16 v29 = [v45 localIdentifier];
                  [v21 imageDimensions];
                  uint64_t v31 = v30;
                  [v21 imageDimensions];
                  *(_DWORD *)buf = 138413314;
                  long long v55 = v29;
                  __int16 v56 = 2048;
                  uint64_t v57 = v31;
                  __int16 v58 = 2048;
                  uint64_t v59 = v32;
                  __int16 v60 = 2112;
                  id v61 = v41;
                  __int16 v62 = 2112;
                  id v63 = v44;
                  _os_log_impl(&dword_1BBEDA000, v28, OS_LOG_TYPE_ERROR, "[FaceCropManager][%@] Too small facecrop (%.0fx%.0f) using resource %@ (%@)", buf, 0x34u);
                }
              }
            }
          }
        }

LABEL_30:
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [obj countByEnumeratingWithState:&v46 objects:v64 count:16];
      if (!v17)
      {
LABEL_32:

        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          BOOL v33 = VCPLogInstance();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            CGRect v34 = [v45 localIdentifier];
            uint64_t v35 = [log count];
            *(_DWORD *)buf = 138412546;
            long long v55 = v34;
            __int16 v56 = 2048;
            uint64_t v57 = v35;
            _os_log_impl(&dword_1BBEDA000, v33, OS_LOG_TYPE_INFO, "[FaceCropManager][%@] Generated %lu facecrop(s)", buf, 0x16u);
          }
        }
        BOOL v36 = [(VCPFaceCropManager *)self _persistGeneratedFaceCrops:log forAsset:v45 error:a7];
        goto LABEL_41;
      }
    }
  }
  if ((int)MediaAnalysisLogLevel() < 6)
  {
    BOOL v36 = 1;
  }
  else
  {
    VCPLogInstance();
    os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      double v37 = [v45 localIdentifier];
      *(_DWORD *)buf = 138412290;
      long long v55 = v37;
      _os_log_impl(&dword_1BBEDA000, log, OS_LOG_TYPE_INFO, "[FaceCropManager][%@] Asset has face; skip facecrop generation",
        buf,
        0xCu);
    }
    BOOL v36 = 1;
LABEL_41:
  }
  return v36;
}

- (int)processDirtyFaceCrops:(unint64_t *)a3 withCancelBlock:(id)a4 andExtendTimeoutBlock:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = (uint64_t (**)(void))a4;
  uint64_t v31 = (void (**)(void))a5;
  uint64_t v7 = VCPSignPostLog();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  id v9 = VCPSignPostLog();
  id v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "VCPFaceProcessingDirtyFaceCrops", "", buf, 2u);
  }

  uint64_t v11 = (void *)MEMORY[0x1E4F39068];
  id v12 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  uint64_t v13 = [v11 fetchFaceCropsNeedingFaceDetectionWithOptions:v12];

  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    uint64_t v14 = VCPLogInstance();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = [v13 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v34 = v15;
      _os_log_impl(&dword_1BBEDA000, v14, OS_LOG_TYPE_INFO, "[FaceCropManager] Library has %lu dirty face crops to analyze", buf, 0xCu);
    }
  }
  unint64_t v16 = 0;
  unint64_t v29 = 0;
  while (v16 < [v13 count])
  {
    uint64_t v17 = (void *)MEMORY[0x1C186D320]();
    char v18 = v6[2](v6);
    if ((v18 & 1) == 0)
    {
      if (v31) {
        v31[2]();
      }
      uint64_t v19 = [v13 objectAtIndexedSubscript:v16];
      id v32 = 0;
      BOOL v20 = [(VCPFaceCropManager *)self _processDirtyFaceCrop:v19 faceCropFaceLocalIdentifier:0 error:&v32];
      id v21 = v32;
      if (v20)
      {
        ++v29;
      }
      else if ((int)MediaAnalysisLogLevel() >= 3)
      {
        __int16 v22 = VCPLogInstance();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          id v23 = [v19 localIdentifier];
          *(_DWORD *)buf = 138412546;
          uint64_t v34 = (uint64_t)v23;
          __int16 v35 = 2112;
          id v36 = v21;
          _os_log_impl(&dword_1BBEDA000, v22, OS_LOG_TYPE_ERROR, "[FaceCropManager] Failed to process dirty facecrop %@ - %@", buf, 0x16u);
        }
      }
    }
    ++v16;
    if (v18)
    {
      int v24 = -128;
      goto LABEL_26;
    }
  }
  *a3 = v29;
  BOOL v25 = VCPSignPostLog();
  double v26 = v25;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v26, OS_SIGNPOST_INTERVAL_END, v8, "VCPFaceProcessingDirtyFaceCrops", "", buf, 2u);
  }

  int v24 = 0;
LABEL_26:

  return v24;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

@end