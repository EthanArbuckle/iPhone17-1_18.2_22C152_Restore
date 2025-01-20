@interface VCPFaceMerger
+ (BOOL)_allowANE;
- (VCPFaceMerger)initWithThreshold:(double)a3;
- (id)_alignFaceObservations:(id)a3 withRequestHandler:(id)a4 error:(id *)a5;
- (id)_faceObservationsWithBoundingBoxFromFaces:(id)a3 withFaceHashMapping:(id)a4;
- (id)_sortedViableFaceMergePairsFromQueryFaces:(id)a3 andCandidateFaces:(id)a4;
- (id)mergeExistingFaces:(id)a3 andDetectedFaces:(id)a4 withRequestHandler:(id)a5 orientedWidth:(unint64_t)a6 orientedHeight:(unint64_t)a7 assetWidth:(unint64_t)a8 assetHeight:(unint64_t)a9;
- (void)_alignBoundingBoxOfFaces:(id)a3 withRequestHandler:(id)a4 orientedWidth:(unint64_t)a5 orientedHeight:(unint64_t)a6;
@end

@implementation VCPFaceMerger

- (VCPFaceMerger)initWithThreshold:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VCPFaceMerger;
  result = [(VCPFaceMerger *)&v5 init];
  if (result) {
    result->_mergeDistanceThreshold = a3;
  }
  return result;
}

- (id)_faceObservationsWithBoundingBoxFromFaces:(id)a3 withFaceHashMapping:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x1E4F1CA48] array];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if (!objc_msgSend(v13, "algorithmVersion", (void)v30) && (objc_msgSend(v13, "manual") & 1) == 0)
        {
          [v13 size];
          double v15 = v14;
          uint64_t v16 = [v13 sourceWidth];
          uint64_t v17 = [v13 sourceHeight];
          if (v16 <= v17) {
            uint64_t v18 = v17;
          }
          else {
            uint64_t v18 = v16;
          }
          double v19 = v15 * (double)v18;
          double v20 = v19 / (double)[v13 sourceWidth];
          double v21 = v19 / (double)[v13 sourceHeight];
          [v13 centerX];
          double v23 = v22 - v20 * 0.5;
          [v13 centerY];
          v25 = objc_msgSend(MEMORY[0x1E4F457F8], "observationWithBoundingBox:", v23, v24 - v21 * 0.5, v20, v21);
          [v7 addObject:v25];
          v26 = [v13 localIdentifier];
          uint64_t v27 = [v26 hash];

          [v25 setFaceId:v27];
          v28 = [NSNumber numberWithUnsignedInteger:v27];
          [v6 setObject:v13 forKey:v28];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v10);
  }

  return v7;
}

+ (BOOL)_allowANE
{
  return 1;
}

- (id)_alignFaceObservations:(id)a3 withRequestHandler:(id)a4 error:(id *)a5
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = (objc_class *)MEMORY[0x1E4F456A8];
  id v9 = a3;
  uint64_t v10 = (void *)[[v8 alloc] initWithFaceObservations:v9];

  if (v10)
  {
    [v10 setRevision:1];
    [v10 setMetalContextPriority:1];
    [v10 setPreferBackgroundProcessing:1];
    if (DeviceHasANE() && [(id)objc_opt_class() _allowANE])
    {
      uint64_t v11 = [MEMORY[0x1E4F458E8] defaultANEDevice];
      [v10 setProcessingDevice:v11];
    }
    v26 = v10;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
    id v23 = 0;
    char v13 = [v7 performRequests:v12 error:&v23];
    id v14 = v23;

    if (v13)
    {
      double v15 = [v10 results];
      goto LABEL_10;
    }
    double v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F28760];
    uint64_t v24 = *MEMORY[0x1E4F28568];
    uint64_t v18 = [NSString stringWithFormat:@"Failed to exercise Vision request - %@", v14];
    v25 = v18;
    double v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    *a5 = [v19 errorWithDomain:v20 code:-18 userInfo:v21];
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F28760];
    uint64_t v27 = *MEMORY[0x1E4F28568];
    id v14 = [NSString stringWithFormat:@"Failed to create VNAlignFaceRectangleRequest"];
    v28[0] = v14;
    uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
    *a5 = [v16 errorWithDomain:v17 code:-18 userInfo:v18];
  }

  double v15 = 0;
LABEL_10:

  return v15;
}

- (void)_alignBoundingBoxOfFaces:(id)a3 withRequestHandler:(id)a4 orientedWidth:(unint64_t)a5 orientedHeight:(unint64_t)a6
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  v12 = [MEMORY[0x1E4F1CA60] dictionary];
  char v13 = [(VCPFaceMerger *)self _faceObservationsWithBoundingBoxFromFaces:v10 withFaceHashMapping:v12];
  if ([v13 count])
  {
    id v43 = 0;
    id v14 = [(VCPFaceMerger *)self _alignFaceObservations:v13 withRequestHandler:v11 error:&v43];
    id v15 = v43;
    uint64_t v16 = v15;
    if (v14)
    {
      id v38 = v15;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      uint64_t v17 = v14;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v39 objects:v44 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        v36 = v14;
        id v37 = v10;
        uint64_t v20 = *(void *)v40;
        double v21 = (double)a5;
        double v22 = (double)a6;
        if (a5 <= a6) {
          unint64_t v23 = a6;
        }
        else {
          unint64_t v23 = a5;
        }
        double v24 = (double)v23;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v40 != v20) {
              objc_enumerationMutation(v17);
            }
            v26 = *(void **)(*((void *)&v39 + 1) + 8 * i);
            uint64_t v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v26, "faceId"));
            v28 = [v12 objectForKeyedSubscript:v27];

            if (v28)
            {
              [v26 boundingBox];
              CGFloat x = v48.origin.x;
              CGFloat y = v48.origin.y;
              double width = v48.size.width;
              double height = v48.size.height;
              if (CGRectIsEmpty(v48))
              {
                if ((int)MediaAnalysisLogLevel() >= 4)
                {
                  long long v33 = VCPLogInstance();
                  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1BBEDA000, v33, OS_LOG_TYPE_DEFAULT, "[VCPFaceMerger] Bounding box aligner returned an empty rectangle", buf, 2u);
                  }
                }
              }
              else
              {
                v49.origin.CGFloat x = x;
                v49.origin.CGFloat y = y;
                v49.size.double width = width;
                v49.size.double height = height;
                [v28 setCenterX:CGRectGetMidX(v49)];
                v50.origin.CGFloat x = x;
                v50.origin.CGFloat y = y;
                v50.size.double width = width;
                v50.size.double height = height;
                [v28 setCenterY:CGRectGetMidY(v50)];
                double v35 = width * v21;
                if (width * v21 < height * v22) {
                  double v35 = height * v22;
                }
                [v28 setSize:v35 / v24];
              }
            }
            else if ((int)MediaAnalysisLogLevel() >= 4)
            {
              v34 = VCPLogInstance();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v46 = v26;
                _os_log_impl(&dword_1BBEDA000, v34, OS_LOG_TYPE_DEFAULT, "[VCPFaceMerger] Missing face for observation %@ from mapping", buf, 0xCu);
              }
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v39 objects:v44 count:16];
        }
        while (v19);
        id v10 = v37;
        id v14 = v36;
      }
      uint64_t v16 = v38;
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 4) {
        goto LABEL_29;
      }
      uint64_t v17 = VCPLogInstance();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v46 = v16;
        _os_log_impl(&dword_1BBEDA000, v17, OS_LOG_TYPE_DEFAULT, "[VCPFaceMerger] Failed to align face observation - %@", buf, 0xCu);
      }
    }

LABEL_29:
  }
}

- (id)_sortedViableFaceMergePairsFromQueryFaces:(id)a3 andCandidateFaces:(id)a4
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5 && [v6 count])
  {
    id v51 = [MEMORY[0x1E4F1CA48] array];
    CGRect v50 = [MEMORY[0x1E4F1CA48] array];
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v43 = v5;
    id obj = v5;
    uint64_t v47 = [obj countByEnumeratingWithState:&v63 objects:v76 count:16];
    if (!v47) {
      goto LABEL_42;
    }
    uint64_t v45 = *(void *)v64;
    uint64_t v8 = 0;
    uint64_t v9 = 2;
    v46 = v7;
    while (1)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v64 != v45) {
          objc_enumerationMutation(obj);
        }
        uint64_t v49 = v10;
        id v11 = *(void **)(*((void *)&v63 + 1) + 8 * v10);
        context = (void *)MEMORY[0x1C186D320]();
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        id v12 = v7;
        uint64_t v56 = [v12 countByEnumeratingWithState:&v59 objects:v75 count:16];
        if (v56)
        {
          uint64_t v13 = *(void *)v60;
          uint64_t v53 = *(void *)v60;
          do
          {
            for (uint64_t i = 0; i != v56; ++i)
            {
              if (*(void *)v60 != v13) {
                objc_enumerationMutation(v12);
              }
              id v15 = *(void **)(*((void *)&v59 + 1) + 8 * i);
              uint64_t v16 = [v15 imageprintWrapper];
              if (v16 && (uint64_t v17 = [v15 algorithmVersion], v17 == objc_msgSend(v11, "algorithmVersion")))
              {
                int v18 = [v15 detectionType];
                int v19 = [v11 detectionType];

                if (v18 == v19)
                {
                  float v58 = 1.0;
                  uint64_t v20 = [v11 imageprintWrapper];
                  double v21 = [v15 imageprintWrapper];
                  id v57 = 0;
                  int v22 = [v20 calculateDistance:&v58 toWrapper:v21 andError:&v57];
                  id v23 = v57;

                  if (v22)
                  {
                    if (self->_mergeDistanceThreshold > v58)
                    {
                      double v24 = +[VCPPhotosFacePair pairWithFace:andFace:distance:](VCPPhotosFacePair, "pairWithFace:andFace:distance:", v11, v15);
                      if (v24)
                      {
                        v25 = [NSNumber numberWithDouble:self->_mergeDistanceThreshold];
                        uint64_t v26 = objc_msgSend(v50, "indexOfObject:inSortedRange:options:usingComparator:", v25, 0, objc_msgSend(v50, "count"), 1024, &__block_literal_global_82);
                        [v50 insertObject:v25 atIndex:v26];
                        [v51 insertObject:v24 atIndex:v26];
                        goto LABEL_34;
                      }
                      goto LABEL_35;
                    }
                    uint64_t v13 = v53;
                    if ((int)MediaAnalysisLogLevel() >= 7)
                    {
                      double v24 = VCPLogInstance();
                      if (os_log_type_enabled(v24, (os_log_type_t)v9))
                      {
                        v25 = [v15 localIdentifier];
                        double mergeDistanceThreshold = self->_mergeDistanceThreshold;
                        *(_DWORD *)buf = 138412802;
                        uint64_t v68 = (uint64_t)v25;
                        __int16 v69 = 2048;
                        *(double *)v70 = v58;
                        *(_WORD *)&v70[8] = 2048;
                        *(double *)&v70[10] = mergeDistanceThreshold;
                        id v37 = v24;
                        os_log_type_t v38 = v9;
                        long long v39 = "[VCPFaceMerger] Cannot merge face with face %@ - distance %f > threashold %f";
                        uint32_t v40 = 32;
LABEL_33:
                        _os_log_impl(&dword_1BBEDA000, v37, v38, v39, buf, v40);
LABEL_34:

LABEL_35:
                        uint64_t v13 = v53;
                      }
                      goto LABEL_36;
                    }
                  }
                  else
                  {
                    uint64_t v13 = v53;
                    if ((int)MediaAnalysisLogLevel() >= 4)
                    {
                      double v24 = VCPLogInstance();
                      if (os_log_type_enabled(v24, (os_log_type_t)v8))
                      {
                        v25 = [v15 localIdentifier];
                        *(_DWORD *)buf = 138412546;
                        uint64_t v68 = (uint64_t)v25;
                        __int16 v69 = 2112;
                        *(void *)v70 = v23;
                        id v37 = v24;
                        os_log_type_t v38 = v8;
                        long long v39 = "[VCPFaceMerger] Cannot merge face with face %@ - distance calculation failed %@";
                        uint32_t v40 = 22;
                        goto LABEL_33;
                      }
LABEL_36:
                    }
                  }

                  continue;
                }
              }
              else
              {
              }
              if ((int)MediaAnalysisLogLevel() >= 7)
              {
                uint64_t v27 = VCPLogInstance();
                if (os_log_type_enabled(v27, (os_log_type_t)v9))
                {
                  uint64_t v55 = [v11 algorithmVersion];
                  int v54 = [v11 detectionType];
                  v28 = [v15 localIdentifier];
                  id v29 = v12;
                  uint64_t v30 = [v15 algorithmVersion];
                  long long v31 = v11;
                  uint64_t v32 = v9;
                  uint64_t v33 = v8;
                  int v34 = [v15 detectionType];
                  double v35 = [v15 imageprintWrapper];
                  *(_DWORD *)buf = 134219266;
                  v36 = "has";
                  if (!v35) {
                    v36 = "no";
                  }
                  uint64_t v68 = v55;
                  __int16 v69 = 1024;
                  *(_DWORD *)v70 = v54;
                  *(_WORD *)&v70[4] = 2112;
                  *(void *)&v70[6] = v28;
                  *(_WORD *)&v70[14] = 2048;
                  *(void *)&v70[16] = v30;
                  id v12 = v29;
                  __int16 v71 = 1024;
                  int v72 = v34;
                  uint64_t v8 = v33;
                  uint64_t v9 = v32;
                  id v11 = v31;
                  __int16 v73 = 2080;
                  v74 = v36;
                  _os_log_impl(&dword_1BBEDA000, v27, (os_log_type_t)v9, "[VCPFaceMerger] Cannot merge face (v%lu, type-%d) with face %@ (v%lu, type-%d, %s imageprint)", buf, 0x36u);

                  uint64_t v13 = v53;
                }
              }
            }
            uint64_t v56 = [v12 countByEnumeratingWithState:&v59 objects:v75 count:16];
          }
          while (v56);
        }

        uint64_t v10 = v49 + 1;
        id v7 = v46;
      }
      while (v49 + 1 != v47);
      uint64_t v47 = [obj countByEnumeratingWithState:&v63 objects:v76 count:16];
      if (!v47)
      {
LABEL_42:

        id v5 = v43;
        goto LABEL_44;
      }
    }
  }
  id v51 = 0;
LABEL_44:

  return v51;
}

uint64_t __77__VCPFaceMerger__sortedViableFaceMergePairsFromQueryFaces_andCandidateFaces___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (id)mergeExistingFaces:(id)a3 andDetectedFaces:(id)a4 withRequestHandler:(id)a5 orientedWidth:(unint64_t)a6 orientedHeight:(unint64_t)a7 assetWidth:(unint64_t)a8 assetHeight:(unint64_t)a9
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a5;
  uint64_t v16 = [MEMORY[0x1E4F1CA48] arrayWithArray:a4];
  uint64_t v17 = [MEMORY[0x1E4F1CA48] array];
  int v18 = [MEMORY[0x1E4F1CA48] array];
  __int16 v73 = [MEMORY[0x1E4F1CA48] array];
  v67 = v15;
  uint64_t v68 = v14;
  __int16 v69 = (void *)v16;
  v70 = v17;
  if ([v14 count])
  {
    [(VCPFaceMerger *)self _alignBoundingBoxOfFaces:v14 withRequestHandler:v15 orientedWidth:a6 orientedHeight:a7];
    [v18 addObjectsFromArray:v14];
    long long v93 = 0u;
    long long v94 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    long long v66 = v18;
    id v19 = v18;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v91 objects:v102 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v92;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v92 != v22) {
            objc_enumerationMutation(v19);
          }
          double v24 = *(void **)(*((void *)&v91 + 1) + 8 * i);
          v25 = [v24 imageprintWrapper];

          if (v25)
          {
            uint64_t v26 = [v24 imageprintWrapper];
            [v73 addObject:v26];
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v91 objects:v102 count:16];
      }
      while (v21);
    }

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __124__VCPFaceMerger_mergeExistingFaces_andDetectedFaces_withRequestHandler_orientedWidth_orientedHeight_assetWidth_assetHeight___block_invoke;
    aBlock[3] = &unk_1E629C5F0;
    id v27 = v69;
    id v87 = v27;
    id v28 = v19;
    id v88 = v28;
    id v89 = v73;
    id v64 = v70;
    id v90 = v64;
    id v29 = _Block_copy(aBlock);
    id v75 = v28;
    uint64_t v30 = [(VCPFaceMerger *)self _sortedViableFaceMergePairsFromQueryFaces:v27 andCandidateFaces:v28];
    long long v65 = (void (**)(void, void))v29;
    (*((void (**)(void *, void *))v29 + 2))(v29, v30);
    long long v31 = [MEMORY[0x1E4F1CA48] array];

    v79 = [MEMORY[0x1E4F1CA48] array];
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    id obj = v27;
    uint64_t v76 = [obj countByEnumeratingWithState:&v82 objects:v101 count:16];
    if (v76)
    {
      uint64_t v74 = *(void *)v83;
      p_cache = VCPHumanPoseVideoRequest.cache;
      do
      {
        uint64_t v33 = 0;
        do
        {
          if (*(void *)v83 != v74) {
            objc_enumerationMutation(obj);
          }
          int v34 = *(void **)(*((void *)&v82 + 1) + 8 * v33);
          [v34 size];
          uint64_t v77 = v33;
          if (v35 == 0.0)
          {
            uint64_t v80 = 0;
            v36 = (id *)&v80;
            [MEMORY[0x1E4F8CCE8] sortedViableMergeCandidateTorsosFor:v34 from:v75 ignoreSourceAssetDimensions:0 matchScores:&v80];
          }
          else
          {
            uint64_t v81 = 0;
            v36 = (id *)&v81;
            [MEMORY[0x1E4F8CCE8] sortedViableMergeCandidateFacesFor:v34 from:v75 ignoreSourceAssetDimensions:0 matchScores:&v81];
          id v37 = };
          id v38 = *v36;
          if ([v37 count])
          {
            unint64_t v39 = 0;
            v78 = v37;
            do
            {
              uint32_t v40 = [v37 objectAtIndex:v39];
              long long v41 = [v38 objectAtIndexedSubscript:v39];
              [v41 doubleValue];
              long long v42 = objc_msgSend(p_cache + 178, "pairWithFace:andFace:distance:", v34, v40);
              if (v42)
              {
                if ([v31 count])
                {
                  id v43 = v38;
                  v44 = v34;
                  uint64_t v45 = p_cache;
                  uint64_t v46 = objc_msgSend(v79, "indexOfObject:inSortedRange:options:usingComparator:", v41, 0, objc_msgSend(v79, "count"), 1024, &__block_literal_global_286);
                  [v79 insertObject:v41 atIndex:v46];
                  uint64_t v47 = v46;
                  p_cache = v45;
                  int v34 = v44;
                  id v38 = v43;
                  id v37 = v78;
                  [v31 insertObject:v42 atIndex:v47];
                }
                else
                {
                  [v31 addObject:v42];
                  [v79 addObject:v41];
                }
              }

              ++v39;
            }
            while (v39 < [v37 count]);
          }

          uint64_t v33 = v77 + 1;
        }
        while (v77 + 1 != v76);
        uint64_t v76 = [obj countByEnumeratingWithState:&v82 objects:v101 count:16];
      }
      while (v76);
    }

    ((void (**)(void, void *))v65)[2](v65, v31);
    [v64 addObjectsFromArray:obj];

    CGRect v48 = v66;
  }
  else
  {
    [v17 addObjectsFromArray:v16];
    CGRect v48 = v18;
  }
  uint64_t v49 = [v48 count];
  if (v49)
  {
    for (uint64_t j = v49 - 1; j != -1; --j)
    {
      id v51 = [v48 objectAtIndexedSubscript:j];
      if (([v51 manual] & 1) != 0 || objc_msgSend(v51, "algorithmVersion"))
      {
        if ([v51 manual])
        {
          if ([v51 sourceWidth] != a8 || objc_msgSend(v51, "sourceHeight") != a9)
          {
            if ((int)MediaAnalysisLogLevel() >= 4)
            {
              int v54 = VCPLogInstance();
              if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v55 = [v51 gist];
                *(_DWORD *)buf = 138412802;
                v96 = v55;
                __int16 v97 = 2048;
                unint64_t v98 = a8;
                __int16 v99 = 2048;
                unint64_t v100 = a9;
                _os_log_impl(&dword_1BBEDA000, v54, OS_LOG_TYPE_DEFAULT, "[VCPFaceMerger] Deleting manual face %@ with mismatched asset dimension (%ldx%ld)", buf, 0x20u);
              }
            }
            goto LABEL_56;
          }
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            v52 = VCPLogInstance();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v53 = [v51 localIdentifier];
              *(_DWORD *)buf = 138412290;
              v96 = v53;
              _os_log_impl(&dword_1BBEDA000, v52, OS_LOG_TYPE_DEBUG, "[VCPFaceMerger] Manual face %@; skip deletion",
                buf,
                0xCu);
            }
          }
          goto LABEL_55;
        }
      }
      else
      {
        if ([v51 detectionType] != 1) {
          goto LABEL_56;
        }
        uint64_t v56 = [v51 personLocalIdentifier];
        if (!v56) {
          goto LABEL_56;
        }
        id v57 = (void *)v56;
        if ([v51 nameSource] == 1)
        {

LABEL_50:
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            long long v59 = VCPLogInstance();
            if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
            {
              long long v60 = [v51 localIdentifier];
              *(_DWORD *)buf = 138412290;
              v96 = v60;
              _os_log_impl(&dword_1BBEDA000, v59, OS_LOG_TYPE_DEBUG, "[VCPFaceMerger] Face %@ with valid personIdentifier; reinstate as manual face",
                buf,
                0xCu);
            }
          }
          [v51 setManual:1];
          [v51 setImageprintWrapper:0];
          [v70 addObject:v51];
LABEL_55:
          [v48 removeObjectAtIndex:j];
          goto LABEL_56;
        }
        uint64_t v58 = [v51 nameSource];

        if (v58 == 3) {
          goto LABEL_50;
        }
      }
LABEL_56:
    }
  }
  long long v61 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v62 = v61;
  if (v70) {
    [v61 setObject:v70 forKeyedSubscript:@"FacesToPersist"];
  }
  if (v48) {
    [v62 setObject:v48 forKeyedSubscript:@"FacesToDelete"];
  }

  return v62;
}

void __124__VCPFaceMerger_mergeExistingFaces_andDetectedFaces_withRequestHandler_orientedWidth_orientedHeight_assetWidth_assetHeight___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v32 objects:v42 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v33;
    *(void *)&long long v5 = 138412802;
    long long v30 = v5;
    id v31 = v3;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v33 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "face1", v30);
        id v11 = [v9 face2];
        LODWORD(v9) = [v10 detectionType];
        if (v9 != [v11 detectionType])
        {
          if ((int)MediaAnalysisLogLevel() < 6) {
            goto LABEL_37;
          }
          uint64_t v20 = VCPLogInstance();
          if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO)) {
            goto LABEL_36;
          }
          uint64_t v21 = [v10 gist];
          uint64_t v22 = [v11 gist];
          *(_DWORD *)buf = 138412546;
          id v37 = v21;
          __int16 v38 = 2112;
          unint64_t v39 = v22;
          _os_log_impl(&dword_1BBEDA000, v20, OS_LOG_TYPE_INFO, " [VCPFaceMerger] Cannot Merge due to mismatched detection type:detected face: %@, existing face: %@", buf, 0x16u);
LABEL_34:

LABEL_35:
LABEL_36:

          goto LABEL_37;
        }
        if ([*(id *)(a1 + 32) containsObject:v10]
          && [*(id *)(a1 + 40) containsObject:v11])
        {
          [v11 replaceCoordinatesAndFeaturesFromDetectedFace:v10];
          id v12 = [v10 adjustmentVersion];
          [v11 setAdjustmentVersion:v12];

          [v11 setManual:0];
          uint64_t v13 = [v11 imageprintWrapper];

          if (v13)
          {
            id v14 = *(void **)(a1 + 48);
            id v15 = [v11 imageprintWrapper];
            [v14 removeObject:v15];
          }
          uint64_t v16 = [v10 imageprintWrapper];
          [v11 setImageprintWrapper:v16];

          [*(id *)(a1 + 56) addObject:v11];
          [*(id *)(a1 + 40) removeObject:v11];
          [*(id *)(a1 + 32) removeObject:v10];
          [v10 size];
          if (v17 == 0.0)
          {
            int v18 = @"Torso";
          }
          else
          {
            [v10 bodyWidth];
            int v18 = @"Face";
            if (v19 != 0.0) {
              int v18 = @"Facetorso";
            }
          }
          uint64_t v20 = v18;
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            uint64_t v21 = VCPLogInstance();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v22 = [v10 gist];
              id v29 = [v11 gist];
              *(_DWORD *)buf = v30;
              id v37 = v20;
              __int16 v38 = 2112;
              unint64_t v39 = v22;
              __int16 v40 = 2112;
              long long v41 = v29;
              _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_DEBUG, "[VCPFaceMerger] Merged %@: detected %@ to existing %@", buf, 0x20u);

              id v3 = v31;
              goto LABEL_34;
            }
            goto LABEL_35;
          }
          goto LABEL_36;
        }
        if ((int)MediaAnalysisLogLevel() >= 4)
        {
          id v23 = VCPLogInstance();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            double v24 = [v10 gist];
            v25 = [v11 gist];
            *(_DWORD *)buf = 138412546;
            id v37 = v24;
            __int16 v38 = 2112;
            unint64_t v39 = v25;
            _os_log_impl(&dword_1BBEDA000, v23, OS_LOG_TYPE_DEFAULT, "[VCPFaceMerger] Failed to merge detected face %@ to existing face %@", buf, 0x16u);

            id v3 = v31;
          }
        }
        if ((int)MediaAnalysisLogLevel() >= 4)
        {
          uint64_t v20 = VCPLogInstance();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            if ([*(id *)(a1 + 32) containsObject:v10]) {
              uint64_t v26 = @"Yes";
            }
            else {
              uint64_t v26 = @"No";
            }
            int v27 = [*(id *)(a1 + 40) containsObject:v11];
            *(_DWORD *)buf = 138412546;
            id v28 = @"Yes";
            if (!v27) {
              id v28 = @"No";
            }
            id v37 = v26;
            id v3 = v31;
            __int16 v38 = 2112;
            unint64_t v39 = v28;
            _os_log_impl(&dword_1BBEDA000, v20, OS_LOG_TYPE_DEFAULT, "[VCPFaceMerger] [mutableDetectedFaces containsObject:detectedFace] %@ [facesToDelete containsObject:matchedExistingFace] %@ ", buf, 0x16u);
          }
          goto LABEL_36;
        }
LABEL_37:
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v32 objects:v42 count:16];
    }
    while (v6);
  }
}

uint64_t __124__VCPFaceMerger_mergeExistingFaces_andDetectedFaces_withRequestHandler_orientedWidth_orientedHeight_assetWidth_assetHeight___block_invoke_284(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

@end