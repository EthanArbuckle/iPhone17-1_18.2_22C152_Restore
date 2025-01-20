@interface VCPPhotosAutoCounterWorker
+ (BOOL)_dumpAssetsToFaces;
+ (BOOL)_dumpFaceprint;
+ (id)workerWithPhotoLibrary:(id)a3;
- (BOOL)optInStatus:(id)a3 error:(id *)a4;
- (BOOL)optInUserPickedPerson:(id)a3 error:(id *)a4 extendTimeoutBlock:(id)a5 cancelBlock:(id)a6;
- (VCPPhotosAutoCounterWorker)initWithPhotoLibrary:(id)a3;
- (double)_overlapRatioOf:(CGRect)a3 with:(CGRect)a4;
- (id)_anonymizedName:(id)a3;
- (id)_fetchPeopleHomePersons;
- (id)_groundTruthURL;
- (int)_loadGroundTruth:(id *)a3 error:(id *)a4;
- (int)_loadGroundTruthURL:(id)a3 toGroundTruth:(id *)a4 error:(id *)a5;
- (int)_measureClusterWithClusterStateURL:(id)a3 groundTruthFaceCountPerPerson:(id)a4 groundTruthPersonInformation:(id)a5 groundTruthFaceToPerson:(id)a6 groundTruthAssetToFaces:(id)a7 measures:(id *)a8 extendTimeoutBlock:(id)a9 cancelBlock:(id)a10;
- (int)_measurePNPersonClusters:(id)a3 groundTruthFaceCountPerPerson:(id)a4 groundTruthPersonInformation:(id)a5 groundTruthFaceToPerson:(id)a6 groundTruthAssetToFaces:(id)a7 measures:(id *)a8 extendTimeoutBlock:(id)a9 cancelBlock:(id)a10;
- (int)_parseGroundTruthWithURL:(id)a3 faceCountPerPerson:(id *)a4 personInformation:(id *)a5 faceToPerson:(id *)a6 assetToFaces:(id *)a7 extendTimeoutBlock:(id)a8 cancelBlock:(id)a9;
- (int)_parseSIMLGroundTruthWithURL:(id)a3 faceCountPerPerson:(id *)a4 personInformation:(id *)a5 faceToPerson:(id *)a6 assetToFaces:(id *)a7 extendTimeoutBlock:(id)a8 cancelBlock:(id)a9;
- (int)_processFetchedFaceGroup:(id)a3 forPersonID:(id)a4 facesPerAsset:(id)a5 assetInformation:(id)a6 extendTimeoutBlock:(id)a7 cancelBlock:(id)a8;
- (int)_processFetchedVURawCluster:(id)a3 forPersonLocalIdentifier:(id)a4 facesPerAsset:(id)a5 assetInformation:(id)a6 extendTimeoutBlock:(id)a7 cancelBlock:(id)a8;
- (int)_reportCoreAnalyticsWithVisionClusterMeasure:(id)a3 personClusterMeasure:(id)a4 personClusters:(id)a5 andGroundTruthInformation:(id)a6;
- (int)calculateAndReportClusterAccuracyWithVisionClusterURL:(id)a3 andPersonClusters:(id)a4 results:(id *)a5 extendTimeoutBlock:(id)a6 cancelBlock:(id)a7;
- (int)calculateAndReportClusterAccuracyWithVisionClusterURL:(id)a3 andPersonClusters:(id)a4 withGroundtruth:(id)a5 results:(id *)a6 extendTimeoutBlock:(id)a7 cancelBlock:(id)a8;
- (int)exportClustersStates:(id *)a3 error:(id *)a4 extendTimeoutBlock:(id)a5 cancelBlock:(id)a6;
- (int)exportVUGalleryClusterStates:(id *)a3 error:(id *)a4 extendTimeoutBlock:(id)a5 cancelBlock:(id)a6;
- (int)validateClusterAccuracyWithSIMLGroundtruth:(id)a3 results:(id *)a4 extendTimeoutBlock:(id)a5 cancelBlock:(id)a6;
- (unint64_t)optInPersonCount;
- (void)_exportAssetsToFacesDetails:(id)a3;
- (void)_fetchPersonWithIdentifier:(id)a3 facesPerAsset:(id)a4 assetInformation:(id)a5 extendTimeoutBlock:(id)a6 cancelBlock:(id)a7;
@end

@implementation VCPPhotosAutoCounterWorker

- (VCPPhotosAutoCounterWorker)initWithPhotoLibrary:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)VCPPhotosAutoCounterWorker;
  v6 = [(VCPPhotosAutoCounterWorker *)&v19 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    v8 = +[VCPFaceProcessingVersionManager sharedManagerForPhotoLibrary:v5];
    v7->_processingVersion = [v8 currentProcessingVersion];

    v7->_personClusterVersion = *MEMORY[0x1E4F8E910];
    v9 = (objc_class *)objc_opt_class();
    v7->_detectionVersion = VCPMAGetRevisionForVisionModel(v9, v7->_processingVersion);
    v10 = (objc_class *)objc_opt_class();
    v7->_recognitionVersion = VCPMAGetRevisionForVisionModel(v10, v7->_processingVersion);
    v7->_madVersion = 1;
    v7->_clusterDumpFaceFetched = 0;
    v11 = [(PHPhotoLibrary *)v7->_photoLibrary vcp_visionCacheStorageDirectoryURL];
    id v12 = objc_alloc((Class)getGDVUVisualUnderstandingServiceClass());
    v13 = [getGDVUEntityRecognitionClientClass() photos];
    id v18 = 0;
    v14 = (void *)[v12 initWithClient:v13 version:1 url:v11 error:&v18];
    id v15 = v18;

    v16 = [v14 gallery];
    v7->_vuVersion = [v16 version];
  }
  return v7;
}

+ (id)workerWithPhotoLibrary:(id)a3
{
  id v3 = a3;
  if (VCPMAIsAppleInternal())
  {
    v4 = [[VCPPhotosAutoCounterWorker alloc] initWithPhotoLibrary:v3];
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      id v5 = VCPLogInstance();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_DEFAULT, "[AutoCounter] feature not supported on this OS variant", v7, 2u);
      }
    }
    v4 = 0;
  }

  return v4;
}

- (id)_groundTruthURL
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__VCPPhotosAutoCounterWorker__groundTruthURL__block_invoke;
  block[3] = &unk_1E6296FF8;
  block[4] = self;
  if (-[VCPPhotosAutoCounterWorker _groundTruthURL]::groundTruthURLToken != -1) {
    dispatch_once(&-[VCPPhotosAutoCounterWorker _groundTruthURL]::groundTruthURLToken, block);
  }
  return (id)-[VCPPhotosAutoCounterWorker _groundTruthURL]::groundTruthURL;
}

void __45__VCPPhotosAutoCounterWorker__groundTruthURL__block_invoke(uint64_t a1)
{
  id v5 = [NSString stringWithFormat:@"AutoCounterGroundTruth.plist"];
  v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "vcp_visionCacheStorageDirectoryURL");
  uint64_t v3 = [v2 URLByAppendingPathComponent:v5];
  v4 = (void *)-[VCPPhotosAutoCounterWorker _groundTruthURL]::groundTruthURL;
  -[VCPPhotosAutoCounterWorker _groundTruthURL]::groundTruthURL = v3;
}

- (int)_loadGroundTruthURL:(id)a3 toGroundTruth:(id *)a4 error:(id *)a5
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (v8)
  {
    v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    v10 = [v8 path];
    int v11 = [v9 fileExistsAtPath:v10];

    if (v11)
    {
      LODWORD(a5) = 0;
      *a4 = (id)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithContentsOfURL:v8];
    }
    else
    {
      *a4 = (id)MEMORY[0x1E4F1CC08];
      id v15 = self;
      objc_sync_enter(v15);
      int v16 = [*a4 writeToURL:v8 error:a5];
      objc_sync_exit(v15);

      if (v16) {
        LODWORD(a5) = 0;
      }
      else {
        LODWORD(a5) = -20;
      }
    }
  }
  else if (a5)
  {
    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F28568];
    v13 = [NSString stringWithFormat:@"[AutoCounter] Cannot load ground truth file URL"];
    v19[0] = v13;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    *a5 = [v12 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v14];

    LODWORD(a5) = 0;
  }

  return (int)a5;
}

- (int)_loadGroundTruth:(id *)a3 error:(id *)a4
{
  v7 = [(VCPPhotosAutoCounterWorker *)self _groundTruthURL];
  LODWORD(a4) = [(VCPPhotosAutoCounterWorker *)self _loadGroundTruthURL:v7 toGroundTruth:a3 error:a4];

  return (int)a4;
}

- (unint64_t)optInPersonCount
{
  id v7 = 0;
  int v2 = [(VCPPhotosAutoCounterWorker *)self _loadGroundTruth:&v7 error:0];
  id v3 = v7;
  v4 = v3;
  if (v2) {
    unint64_t v5 = 0;
  }
  else {
    unint64_t v5 = [v3 count];
  }

  return v5;
}

- (id)_fetchPeopleHomePersons
{
  v8[2] = *MEMORY[0x1E4F143B8];
  int v2 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  [v2 setPersonContext:1];
  id v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"faceCount" ascending:0];
  v8[0] = v3;
  v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:0];
  v8[1] = v4;
  unint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  [v2 setSortDescriptors:v5];

  v6 = [MEMORY[0x1E4F391F8] fetchPersonsWithOptions:v2];

  return v6;
}

- (id)_anonymizedName:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = [v3 dataUsingEncoding:1 allowLossyConversion:1];
    CC_SHA1((const void *)[v4 bytes], objc_msgSend(v4, "length"), md);
    unint64_t v5 = [MEMORY[0x1E4F1C9B8] dataWithBytes:md length:20];
    v6 = [v5 base64EncodedStringWithOptions:0];
  }
  else
  {
    v6 = @"no_name";
  }

  return v6;
}

+ (BOOL)_dumpFaceprint
{
  return 0;
}

- (int)_processFetchedFaceGroup:(id)a3 forPersonID:(id)a4 facesPerAsset:(id)a5 assetInformation:(id)a6 extendTimeoutBlock:(id)a7 cancelBlock:(id)a8
{
  v115[2] = *MEMORY[0x1E4F143B8];
  id v75 = a3;
  id v89 = a4;
  id v88 = a5;
  id v87 = a6;
  v93 = (void (**)(void))a7;
  v94 = (uint64_t (**)(void))a8;
  v83 = self;
  v80 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  [v80 setIncludeNonvisibleFaces:0];
  uint64_t v14 = *MEMORY[0x1E4F39620];
  v115[0] = *MEMORY[0x1E4F39610];
  v115[1] = v14;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v115 count:2];
  [v80 setFetchPropertySets:v15];

  v90 = objc_msgSend(MEMORY[0x1E4F38EC0], "vcp_fetchOptionsForLibrary:forTaskID:", self->_photoLibrary, 3);
  uint64_t v114 = *MEMORY[0x1E4F39460];
  int v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v114 count:1];
  [v90 addFetchPropertySets:v16];

  v86 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  id obj = v75;
  uint64_t v17 = [obj countByEnumeratingWithState:&v102 objects:v113 count:16];
  if (!v17)
  {
LABEL_88:
    int v73 = 0;
    goto LABEL_90;
  }
  uint64_t v79 = *(void *)v103;
LABEL_3:
  uint64_t v82 = 0;
  uint64_t v78 = v17;
  while (2)
  {
    if (*(void *)v103 != v79) {
      objc_enumerationMutation(obj);
    }
    v84 = *(void **)(*((void *)&v102 + 1) + 8 * v82);
    context = (void *)MEMORY[0x1C186D320]();
    uint64_t v18 = [MEMORY[0x1E4F39048] fetchFacesInFaceGroup:v84 options:v80];
    v83->_clusterDumpFaceFetched += [v18 count];
    long long v98 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    id v85 = v18;
    uint64_t v19 = [v85 countByEnumeratingWithState:&v98 objects:v112 count:16];
    if (!v19) {
      goto LABEL_83;
    }
    v76 = v18;
    uint64_t v91 = *(void *)v99;
    do
    {
      uint64_t v92 = v19;
      for (uint64_t i = 0; i != v92; ++i)
      {
        if (*(void *)v99 != v91) {
          objc_enumerationMutation(v85);
        }
        v21 = *(void **)(*((void *)&v98 + 1) + 8 * i);
        if (v94 && (v94[2]() & 1) != 0)
        {
          int v72 = 0;
          goto LABEL_85;
        }
        if (v93) {
          v93[2]();
        }
        v22 = (void *)MEMORY[0x1E4F38EC0];
        v111 = v21;
        v23 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v111, 1, v75, v76);
        v24 = [v22 fetchAssetsForFaces:v23 options:v90];
        v25 = [v24 firstObject];

        if (v25)
        {
          v26 = [v25 cloudIdentifier];
          if (!v26)
          {
            if ((int)MediaAnalysisLogLevel() >= 6)
            {
              v27 = VCPLogInstance();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
              {
                v28 = [v25 localIdentifier];
                *(_DWORD *)buf = 138412290;
                v110 = v28;
                _os_log_impl(&dword_1BBEDA000, v27, OS_LOG_TYPE_INFO, "[AutoCounter] Asset without cloudIdentifier, use localIdentifier: %@", buf, 0xCu);
              }
            }
            v26 = [v25 localIdentifier];
          }
          v95 = [v88 objectForKeyedSubscript:v26];
          if (!v95)
          {
            v95 = [MEMORY[0x1E4F1CA48] array];
            [v88 setObject:v95 forKeyedSubscript:v26];
          }
          v29 = [v87 objectForKeyedSubscript:v26];
          BOOL v30 = v29 == 0;

          if (v30)
          {
            v107 = @"AddedDate";
            v31 = NSNumber;
            v32 = [v25 curationProperties];
            v33 = [v32 addedDate];
            [v33 timeIntervalSinceReferenceDate];
            v34 = objc_msgSend(v31, "numberWithDouble:");
            v108 = v34;
            v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v108 forKeys:&v107 count:1];
            [v87 setObject:v35 forKeyedSubscript:v26];
          }
          v97 = [MEMORY[0x1E4F1CA60] dictionary];
          v36 = [MEMORY[0x1E4F391F8] fetchPersonWithFace:v21 options:v86];
          v96 = [v36 firstObject];

          v37 = [v96 localIdentifier];
          if (v37) {
            goto LABEL_32;
          }
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            v38 = VCPLogInstance();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1BBEDA000, v38, OS_LOG_TYPE_DEBUG, "[AutoCounter] Person without localIdentifier; use face.personLocalidentifier",
                buf,
                2u);
            }
          }
          v37 = [v21 personLocalIdentifier];
          if (v37)
          {
LABEL_32:
            [v97 setObject:v37 forKey:@"personID"];
            if (v89 && ([v89 isEqualToString:v37] & 1) == 0)
            {
              if ((int)MediaAnalysisLogLevel() >= 7)
              {
                v57 = VCPLogInstance();
                if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1BBEDA000, v57, OS_LOG_TYPE_DEBUG, "[AutoCounter] Fetched face/person not matching required person; skip",
                    buf,
                    2u);
                }
                goto LABEL_76;
              }
            }
            else
            {
              unint64_t v39 = [v96 verifiedType];
              v40 = @"unknown";
              if (v39 < 3) {
                v40 = off_1E629C2A0[v39];
              }
              [v97 setObject:v40 forKey:@"verifiedType"];
              if (v96)
              {
                v41 = [v96 name];
                BOOL v42 = v41 == 0;

                if (!v42)
                {
                  v43 = [v96 name];
                  [v97 setObject:v43 forKey:@"personName"];
                }
              }
              unint64_t v44 = [v25 pixelWidth];
              unint64_t v45 = [v25 pixelHeight];
              if (v44 <= v45) {
                unint64_t v46 = v45;
              }
              else {
                unint64_t v46 = v44;
              }
              [v21 centerX];
              double v48 = v47;
              unint64_t v49 = [v25 pixelWidth];
              [v21 centerY];
              double v51 = v50;
              unint64_t v52 = [v25 pixelHeight];
              [v21 size];
              double v54 = v53;
              [v21 size];
              v116.origin.y = v51 * (double)v52;
              v116.size.width = v54 * (double)v46;
              v116.size.height = v55 * (double)v46;
              v116.origin.x = v48 * (double)v49;
              v56 = NSStringFromRect(v116);
              [v97 setObject:v56 forKey:@"faceRect"];

              v57 = [v84 localIdentifier];
              if (v57)
              {
                [v97 setObject:v57 forKey:@"faceGroupID"];
                if ([(id)objc_opt_class() _dumpFaceprint])
                {
                  v58 = [v21 faceClusteringProperties];
                  v59 = [v58 faceprint];
                  v60 = [v59 faceprintData];

                  v61 = [v60 base64EncodedStringWithOptions:0];
                  if (!v61)
                  {
                    v61 = @"unknown";
                    if ((int)MediaAnalysisLogLevel() >= 4)
                    {
                      v62 = VCPLogInstance();
                      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl(&dword_1BBEDA000, v62, OS_LOG_TYPE_DEFAULT, "[AutoCounter] No valid faceprint data; leave as unknown",
                          buf,
                          2u);
                      }

                      v61 = @"unknown";
                    }
                  }
                  [v97 setObject:v61 forKey:@"faceprint"];
                }
                v63 = (void *)MEMORY[0x1E4F39000];
                v64 = [v25 localIdentifier];
                v106 = v64;
                v65 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v106 count:1];
                v66 = [v63 fetchMomentsForAssetsWithLocalIdentifiers:v65 options:v86];

                v67 = [v66 firstObject];
                v68 = [v67 localIdentifier];

                if (!v68)
                {
                  v68 = @"unknown";
                  if ((int)MediaAnalysisLogLevel() >= 4)
                  {
                    v69 = VCPLogInstance();
                    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_1BBEDA000, v69, OS_LOG_TYPE_DEFAULT, "[AutoCounter] No valid momentLocalIdentifier; leave as 'unknown'",
                        buf,
                        2u);
                    }

                    v68 = @"unknown";
                  }
                }
                [v97 setObject:v68 forKey:@"momentIdentifier"];
                v70 = [v21 localIdentifier];
                if (v70)
                {
                  [v97 setObject:v70 forKey:@"faceID"];
                  [v95 addObject:v97];
                }
                else if ((int)MediaAnalysisLogLevel() >= 4)
                {
                  v71 = VCPLogInstance();
                  if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1BBEDA000, v71, OS_LOG_TYPE_DEFAULT, "[AutoCounter] Face without localIdentifier; skip",
                      buf,
                      2u);
                  }
                }
                goto LABEL_75;
              }
              if ((int)MediaAnalysisLogLevel() >= 4)
              {
                v66 = VCPLogInstance();
                if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1BBEDA000, v66, OS_LOG_TYPE_DEFAULT, "[AutoCounter] Face in a facegroup without localIdentifier; skip",
                    buf,
                    2u);
                }
LABEL_75:
              }
LABEL_76:
            }
          }
          else
          {
            if ((int)MediaAnalysisLogLevel() >= 4)
            {
              v57 = VCPLogInstance();
              if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1BBEDA000, v57, OS_LOG_TYPE_DEFAULT, "[AutoCounter] Face without personLocalIdentifier; skip",
                  buf,
                  2u);
              }
              v37 = 0;
              goto LABEL_76;
            }
            v37 = 0;
          }

          goto LABEL_78;
        }
        if ((int)MediaAnalysisLogLevel() < 4) {
          goto LABEL_79;
        }
        v26 = VCPLogInstance();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v110 = v21;
          _os_log_impl(&dword_1BBEDA000, v26, OS_LOG_TYPE_DEFAULT, "[AutoCounter] Failed to find asset for face: %@; skip",
            buf,
            0xCu);
        }
LABEL_78:

LABEL_79:
      }
      uint64_t v19 = [v85 countByEnumeratingWithState:&v98 objects:v112 count:16];
    }
    while (v19);
LABEL_83:
    int v72 = 1;
LABEL_85:

    if (v72)
    {
      if (++v82 != v78) {
        continue;
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v102 objects:v113 count:16];
      if (!v17) {
        goto LABEL_88;
      }
      goto LABEL_3;
    }
    break;
  }
  int v73 = -128;
LABEL_90:

  return v73;
}

- (void)_fetchPersonWithIdentifier:(id)a3 facesPerAsset:(id)a4 assetInformation:(id)a5 extendTimeoutBlock:(id)a6 cancelBlock:(id)a7
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v31 = a4;
  id v32 = a5;
  id v33 = a6;
  id v13 = a7;
  uint64_t v14 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  id v15 = (void *)MEMORY[0x1E4F391F8];
  v37[0] = v12;
  int v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
  uint64_t v17 = [v15 fetchPersonsWithLocalIdentifiers:v16 options:v14];

  if ([v17 count])
  {
    BOOL v18 = [(PHPhotoLibrary *)self->_photoLibrary mad_useVUGallery];
    photoLibrary = self->_photoLibrary;
    if (v18)
    {
      v20 = [(PHPhotoLibrary *)photoLibrary vcp_visionCacheStorageDirectoryURL];
      id v21 = objc_alloc((Class)getGDVUVisualUnderstandingServiceClass());
      v22 = [getGDVUEntityRecognitionClientClass() photos];
      id v34 = 0;
      v23 = (void *)[v21 initWithClient:v22 version:1 url:v20 error:&v34];
      id v30 = v34;

      v24 = [v23 gallery];
      v25 = [getGDVUEntityClassClass() person];
      v26 = [v24 clustersFor:v25];

      [(VCPPhotosAutoCounterWorker *)self _processFetchedVURawCluster:v26 forPersonLocalIdentifier:v12 facesPerAsset:v31 assetInformation:v32 extendTimeoutBlock:v33 cancelBlock:v13];
    }
    else
    {
      v20 = [(PHPhotoLibrary *)photoLibrary librarySpecificFetchOptions];
      [v20 setMinimumUnverifiedFaceCount:1];
      [v20 setMinimumVerifiedFaceCount:1];
      v27 = (void *)MEMORY[0x1E4F39080];
      v28 = [v17 firstObject];
      v29 = [v27 fetchFaceGroupsForPerson:v28 options:v20];

      [(VCPPhotosAutoCounterWorker *)self _processFetchedFaceGroup:v29 forPersonID:v12 facesPerAsset:v31 assetInformation:v32 extendTimeoutBlock:v33 cancelBlock:v13];
    }
LABEL_8:

    goto LABEL_9;
  }
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    v20 = VCPLogInstance();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v36 = v12;
      _os_log_impl(&dword_1BBEDA000, v20, OS_LOG_TYPE_DEFAULT, "[AutoCounter] Failed to fetch person %@", buf, 0xCu);
    }
    goto LABEL_8;
  }
LABEL_9:
}

- (BOOL)optInStatus:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v13 = 0;
  LODWORD(a4) = [(VCPPhotosAutoCounterWorker *)self _loadGroundTruth:&v13 error:a4];
  id v7 = v13;
  id v8 = v7;
  if (a4)
  {
    if ((int)MediaAnalysisLogLevel() < 3)
    {
      BOOL v10 = 1;
      goto LABEL_9;
    }
    uint64_t v9 = VCPLogInstance();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_ERROR, "[AutoCounter] Fail to load groundtruth file", v12, 2u);
    }
    BOOL v10 = 1;
  }
  else
  {
    uint64_t v9 = [v7 objectForKeyedSubscript:v6];
    BOOL v10 = v9 != 0;
  }

LABEL_9:
  return v10;
}

- (BOOL)optInUserPickedPerson:(id)a3 error:(id *)a4 extendTimeoutBlock:(id)a5 cancelBlock:(id)a6
{
  v67[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v56 = a5;
  id v11 = a6;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v12 = VCPLogInstance();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = [v10 objectForKeyedSubscript:@"PersonIdentifier"];
      *(_DWORD *)buf = 138412546;
      v61 = @"[AutoCounter][OptIn]";
      __int16 v62 = 2112;
      v63 = v13;
      _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_INFO, "%@ Receiving opt-in person (%@)", buf, 0x16u);
    }
  }
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __89__VCPPhotosAutoCounterWorker_optInUserPickedPerson_error_extendTimeoutBlock_cancelBlock___block_invoke;
  v58[3] = &unk_1E629B670;
  v59 = @"[AutoCounter][OptIn]";
  [v10 enumerateKeysAndObjectsUsingBlock:v58];
  id v57 = 0;
  int v14 = [(VCPPhotosAutoCounterWorker *)self _loadGroundTruth:&v57 error:a4];
  id v15 = v57;
  if (!v14)
  {
    int v16 = [v10 objectForKeyedSubscript:@"PersonIdentifier"];
    uint64_t v17 = [v15 objectForKeyedSubscript:v16];
    BOOL v18 = v17 == 0;

    if (v18)
    {
      double v54 = [MEMORY[0x1E4F1CA60] dictionary];
      unint64_t v52 = [MEMORY[0x1E4F1CA60] dictionary];
      -[VCPPhotosAutoCounterWorker _fetchPersonWithIdentifier:facesPerAsset:assetInformation:extendTimeoutBlock:cancelBlock:](self, "_fetchPersonWithIdentifier:facesPerAsset:assetInformation:extendTimeoutBlock:cancelBlock:", v16, v54);
      id v21 = [v54 allKeys];
      BOOL v22 = [v21 count] == 0;

      if (v22)
      {
        v43 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v66 = *MEMORY[0x1E4F28568];
        unint64_t v44 = [NSString stringWithFormat:@"%@ Failed to fetch person %@", @"[AutoCounter][OptIn]", v16];
        v67[0] = v44;
        unint64_t v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v67 forKeys:&v66 count:1];
        id v42 = [v43 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v45];

        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          unint64_t v46 = VCPLogInstance();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            double v47 = [v42 description];
            *(_DWORD *)buf = 138412290;
            v61 = v47;
            _os_log_impl(&dword_1BBEDA000, v46, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
          }
        }
        char v20 = 0;
        if (a4)
        {
          id v42 = v42;
          *a4 = v42;
        }
      }
      else
      {
        double v53 = [MEMORY[0x1E4F1CA60] dictionary];
        [v53 setObject:v54 forKeyedSubscript:@"FacesPerAsset"];
        v23 = [v10 objectForKeyedSubscript:@"PersonInformation"];
        double v55 = (void *)[v23 mutableCopy];

        double v51 = [MEMORY[0x1E4F1C9C8] now];
        unint64_t v49 = objc_msgSend(MEMORY[0x1E4F28C10], "localizedStringFromDate:dateStyle:timeStyle:");
        objc_msgSend(v55, "setObject:forKeyedSubscript:");
        v24 = NSNumber;
        [v51 timeIntervalSinceReferenceDate];
        v25 = objc_msgSend(v24, "numberWithDouble:");
        [v55 setObject:v25 forKeyedSubscript:@"OptInDateSinceReferenceDate"];

        v26 = objc_msgSend(NSNumber, "numberWithInt:", -[PHPhotoLibrary mad_faceProcessingInternalVersion](self->_photoLibrary, "mad_faceProcessingInternalVersion"));
        [v55 setObject:v26 forKeyedSubscript:@"OptInMADFaceVersion"];

        v27 = [NSNumber numberWithUnsignedInteger:self->_detectionVersion];
        [v55 setObject:v27 forKeyedSubscript:@"OptInDetectionModelVersion"];

        v28 = [NSNumber numberWithUnsignedInteger:self->_recognitionVersion];
        [v55 setObject:v28 forKeyedSubscript:@"OptInRecognitionModelVersion"];

        uint64_t v29 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
        id v30 = NSNumber;
        double v50 = (void *)v29;
        id v31 = objc_msgSend(MEMORY[0x1E4F39048], "fetchFacesWithOptions:");
        id v32 = objc_msgSend(v30, "numberWithUnsignedInteger:", objc_msgSend(v31, "count"));
        [v55 setObject:v32 forKeyedSubscript:@"FaceCount"];

        id v33 = NSNumber;
        id v34 = [MEMORY[0x1E4F38EC0] fetchAssetsWithOptions:v50];
        v35 = objc_msgSend(v33, "numberWithUnsignedInteger:", objc_msgSend(v34, "count"));
        [v55 setObject:v35 forKeyedSubscript:@"AssetCount"];

        [v53 setObject:v55 forKeyedSubscript:@"AdditionalInformation"];
        id v36 = (void *)[v15 mutableCopy];
        [v36 setObject:v53 forKeyedSubscript:v16];
        v37 = self;
        objc_sync_enter(v37);
        v38 = [(VCPPhotosAutoCounterWorker *)v37 _groundTruthURL];
        char v20 = [v36 writeToURL:v38 error:a4];

        objc_sync_exit(v37);
        if ((v20 & 1) == 0 && (int)MediaAnalysisLogLevel() >= 3)
        {
          unint64_t v39 = VCPLogInstance();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            v40 = [(VCPPhotosAutoCounterWorker *)v37 _groundTruthURL];
            id v41 = *a4;
            *(_DWORD *)buf = 138412802;
            v61 = @"[AutoCounter][OptIn]";
            __int16 v62 = 2112;
            v63 = v40;
            __int16 v64 = 2112;
            id v65 = v41;
            _os_log_impl(&dword_1BBEDA000, v39, OS_LOG_TYPE_ERROR, "%@ Cannot write opt-in groundtruth to %@ : %@", buf, 0x20u);
          }
        }

        id v42 = v53;
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 6)
      {
LABEL_14:
        char v20 = 1;
LABEL_31:

        goto LABEL_32;
      }
      uint64_t v19 = VCPLogInstance();
      double v54 = v19;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v61 = @"[AutoCounter][OptIn]";
        __int16 v62 = 2112;
        v63 = v16;
        _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_INFO, "%@ Person (%@) already opt-in; skip", buf, 0x16u);
      }
      char v20 = 1;
    }

    goto LABEL_31;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    int v16 = VCPLogInstance();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v61 = @"[AutoCounter][OptIn]";
      _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_ERROR, "%@ Fail to load groundtruth file", buf, 0xCu);
    }
    goto LABEL_14;
  }
  char v20 = 1;
LABEL_32:

  return v20;
}

void __89__VCPPhotosAutoCounterWorker_optInUserPickedPerson_error_extendTimeoutBlock_cancelBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    id v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412802;
      uint64_t v10 = v8;
      __int16 v11 = 2112;
      id v12 = v5;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_DEBUG, "%@ -> %@ : %@", (uint8_t *)&v9, 0x20u);
    }
  }
}

- (int)_processFetchedVURawCluster:(id)a3 forPersonLocalIdentifier:(id)a4 facesPerAsset:(id)a5 assetInformation:(id)a6 extendTimeoutBlock:(id)a7 cancelBlock:(id)a8
{
  v136[2] = *MEMORY[0x1E4F143B8];
  id v85 = a3;
  id v99 = a4;
  id v98 = a5;
  id v97 = a6;
  long long v104 = (void (**)(void))a7;
  v106 = (uint64_t (**)(void))a8;
  v94 = self;
  v86 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  [v86 setIncludeNonvisibleFaces:0];
  uint64_t v14 = *MEMORY[0x1E4F39620];
  v136[0] = *MEMORY[0x1E4F39610];
  v136[1] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v136 count:2];
  [v86 setFetchPropertySets:v15];

  uint64_t v82 = objc_msgSend(MEMORY[0x1E4F38EC0], "vcp_fetchOptionsForLibrary:forTaskID:", self->_photoLibrary, 3);
  uint64_t v84 = *MEMORY[0x1E4F39460];
  uint64_t v135 = *MEMORY[0x1E4F39460];
  int v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v135 count:1];
  [v82 addFetchPropertySets:v16];

  long long v100 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  [v85 allKeys];
  long long v115 = 0u;
  long long v116 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = [obj countByEnumeratingWithState:&v113 objects:v134 count:16];
  if (!v17) {
    goto LABEL_110;
  }
  uint64_t v83 = 0;
  uint64_t v88 = *(void *)v114;
  do
  {
    uint64_t v92 = 0;
    uint64_t v89 = v17;
    do
    {
      if (*(void *)v114 != v88) {
        objc_enumerationMutation(obj);
      }
      uint64_t v95 = *(void *)(*((void *)&v113 + 1) + 8 * v92);
      context = (void *)MEMORY[0x1C186D320]();
      if (!v106 || (v106[2]() & 1) == 0)
      {
        if (v104) {
          v104[2]();
        }
        v90 = [v85 objectForKeyedSubscript:v95];
        v93 = objc_msgSend(MEMORY[0x1E4F39048], "fetchFacesWithVuObservationIDs:options:");
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          uint64_t v19 = VCPLogInstance();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v20 = [obj count];
            uint64_t v21 = [v93 count];
            uint64_t v22 = [v90 count];
            *(_DWORD *)buf = 138413570;
            v123 = @"[AutoCounter][VURawCluster]";
            __int16 v124 = 2048;
            uint64_t v125 = ++v83;
            __int16 v126 = 2048;
            uint64_t v127 = v20;
            __int16 v128 = 2048;
            uint64_t v129 = v21;
            __int16 v130 = 2048;
            uint64_t v131 = v22;
            __int16 v132 = 2112;
            uint64_t v133 = v95;
            _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_DEBUG, "%@ (%lu out of %lu) Fetched %lu out of %lu faces from raw-cluster %@", buf, 0x3Eu);
          }
        }
        if ([v93 count])
        {
          v94->_clusterDumpFaceFetched += [v93 count];
          v23 = (void *)MEMORY[0x1E4F38EC0];
          uint64_t v121 = v84;
          v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v121 count:1];
          long long v101 = [v23 fetchAssetsGroupedByFaceUUIDForFaces:v93 fetchPropertySets:v24];

          long long v111 = 0u;
          long long v112 = 0u;
          long long v109 = 0u;
          long long v110 = 0u;
          id v96 = v93;
          uint64_t v25 = [v96 countByEnumeratingWithState:&v109 objects:v120 count:16];
          if (v25)
          {
            uint64_t v102 = *(void *)v110;
            do
            {
              uint64_t v26 = 0;
              uint64_t v103 = v25;
              do
              {
                if (*(void *)v110 != v102) {
                  objc_enumerationMutation(v96);
                }
                v27 = *(void **)(*((void *)&v109 + 1) + 8 * v26);
                v28 = (void *)MEMORY[0x1C186D320]();
                if (!v106 || (v106[2]() & 1) == 0)
                {
                  if (v104) {
                    v104[2]();
                  }
                  uint64_t v29 = [v27 uuid];
                  id v30 = [v101 objectForKeyedSubscript:v29];

                  if (!v30)
                  {
                    if ((int)MediaAnalysisLogLevel() >= 4)
                    {
                      log = VCPLogInstance();
                      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
                      {
                        v77 = [v27 localIdentifier];
                        *(_DWORD *)buf = 138412546;
                        v123 = @"[AutoCounter][VURawCluster]";
                        __int16 v124 = 2112;
                        uint64_t v125 = (uint64_t)v77;
                        _os_log_impl(&dword_1BBEDA000, log, OS_LOG_TYPE_DEFAULT, "%@ Failed to find asset for face %@; skip",
                          buf,
                          0x16u);
                      }
                      int v18 = 9;
                      goto LABEL_90;
                    }
                    int v18 = 9;
LABEL_91:

                    goto LABEL_92;
                  }
                  uint64_t v31 = [v30 cloudIdentifier];
                  if (!v31)
                  {
                    if ((int)MediaAnalysisLogLevel() >= 6)
                    {
                      id v32 = VCPLogInstance();
                      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
                      {
                        id v33 = [v30 localIdentifier];
                        *(_DWORD *)buf = 138412546;
                        v123 = @"[AutoCounter][VURawCluster]";
                        __int16 v124 = 2112;
                        uint64_t v125 = (uint64_t)v33;
                        _os_log_impl(&dword_1BBEDA000, v32, OS_LOG_TYPE_INFO, "%@ Asset without cloudIdentifier (use localIdentifier %@)", buf, 0x16u);
                      }
                    }
                    uint64_t v31 = [v30 localIdentifier];
                  }
                  log = v31;
                  long long v105 = objc_msgSend(v98, "objectForKeyedSubscript:");
                  if (!v105)
                  {
                    long long v105 = [MEMORY[0x1E4F1CA48] array];
                    [v98 setObject:v105 forKeyedSubscript:log];
                  }
                  id v34 = [v97 objectForKeyedSubscript:log];
                  BOOL v35 = v34 == 0;

                  if (v35)
                  {
                    v118 = @"AddedDate";
                    id v36 = NSNumber;
                    v37 = [v30 curationProperties];
                    v38 = [v37 addedDate];
                    [v38 timeIntervalSinceReferenceDate];
                    unint64_t v39 = objc_msgSend(v36, "numberWithDouble:");
                    v119 = v39;
                    v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v119 forKeys:&v118 count:1];
                    [v97 setObject:v40 forKeyedSubscript:log];
                  }
                  id v41 = [MEMORY[0x1E4F1CA60] dictionary];
                  id v42 = [MEMORY[0x1E4F391F8] fetchPersonWithFace:v27 options:v100];
                  v108 = [v42 firstObject];

                  v43 = [v108 localIdentifier];
                  if (v43) {
                    goto LABEL_43;
                  }
                  if ((int)MediaAnalysisLogLevel() >= 4)
                  {
                    unint64_t v44 = VCPLogInstance();
                    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
                    {
                      unint64_t v45 = [v27 personLocalIdentifier];
                      *(_DWORD *)buf = 138412546;
                      v123 = @"[AutoCounter][VURawCluster]";
                      __int16 v124 = 2112;
                      uint64_t v125 = (uint64_t)v45;
                      _os_log_impl(&dword_1BBEDA000, v44, OS_LOG_TYPE_DEFAULT, "%@ Person without localIdentifier (use face.personLocalIdentifier %@)", buf, 0x16u);
                    }
                  }
                  v43 = [v27 personLocalIdentifier];
                  if (v43)
                  {
LABEL_43:
                    [v41 setObject:v43 forKeyedSubscript:@"personID"];
                    if (!v99 || ([v99 isEqualToString:v43] & 1) != 0)
                    {
                      unint64_t v46 = [v108 verifiedType];
                      double v47 = @"unknown";
                      if (v46 < 3) {
                        double v47 = off_1E629C2A0[v46];
                      }
                      [v41 setObject:v47 forKeyedSubscript:@"verifiedType"];
                      if (v108)
                      {
                        double v48 = [v108 name];
                        BOOL v49 = v48 == 0;

                        if (!v49)
                        {
                          double v50 = [v108 name];
                          [v41 setObject:v50 forKeyedSubscript:@"personName"];
                        }
                      }
                      unint64_t v51 = [v30 pixelWidth];
                      unint64_t v52 = [v30 pixelHeight];
                      if (v51 <= v52) {
                        unint64_t v53 = v52;
                      }
                      else {
                        unint64_t v53 = v51;
                      }
                      [v27 centerX];
                      double v55 = v54;
                      unint64_t v56 = [v30 pixelWidth];
                      [v27 centerY];
                      double v58 = v57;
                      unint64_t v59 = [v30 pixelHeight];
                      [v27 size];
                      double v61 = v60;
                      [v27 size];
                      v137.origin.y = v58 * (double)v59;
                      v137.size.width = v61 * (double)v53;
                      v137.size.height = v62 * (double)v53;
                      v137.origin.x = v55 * (double)v56;
                      v63 = NSStringFromRect(v137);
                      [v41 setObject:v63 forKeyedSubscript:@"faceRect"];

                      [v41 setObject:v95 forKeyedSubscript:@"faceGroupID"];
                      if ([(id)objc_opt_class() _dumpFaceprint])
                      {
                        __int16 v64 = [v27 faceClusteringProperties];
                        id v65 = [v64 faceprint];
                        uint64_t v66 = [v65 faceprintData];

                        v67 = [v66 base64EncodedStringWithOptions:0];
                        if (!v67)
                        {
                          v67 = @"unknown";
                          if ((int)MediaAnalysisLogLevel() >= 4)
                          {
                            v68 = VCPLogInstance();
                            if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
                            {
                              *(_DWORD *)buf = 138412290;
                              v123 = @"[AutoCounter][VURawCluster]";
                              _os_log_impl(&dword_1BBEDA000, v68, OS_LOG_TYPE_DEFAULT, "%@ No valid faceprint data; leave as unknown",
                                buf,
                                0xCu);
                            }

                            v67 = @"unknown";
                          }
                        }
                        [v41 setObject:v67 forKeyedSubscript:@"faceprint"];
                      }
                      v69 = (void *)MEMORY[0x1E4F39000];
                      v70 = [v30 localIdentifier];
                      v117 = v70;
                      v71 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v117 count:1];
                      int v72 = [v69 fetchMomentsForAssetsWithLocalIdentifiers:v71 options:v100];

                      int v73 = [v72 firstObject];
                      v74 = [v73 localIdentifier];

                      if (!v74)
                      {
                        v74 = @"unknown";
                        if ((int)MediaAnalysisLogLevel() >= 4)
                        {
                          id v75 = VCPLogInstance();
                          if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)buf = 138412290;
                            v123 = @"[AutoCounter][VURawCluster]";
                            _os_log_impl(&dword_1BBEDA000, v75, OS_LOG_TYPE_DEFAULT, "%@ No valid momentLocalIdentifier; leave as 'unknown'",
                              buf,
                              0xCu);
                          }

                          v74 = @"unknown";
                        }
                      }
                      [v41 setObject:v74 forKeyedSubscript:@"momentIdentifier"];
                      v76 = [v27 localIdentifier];
                      if (v76)
                      {
                        [v41 setObject:v76 forKeyedSubscript:@"faceID"];
                        [v105 addObject:v41];
                        int v18 = 0;
                      }
                      else
                      {
                        if ((int)MediaAnalysisLogLevel() >= 4)
                        {
                          uint64_t v78 = VCPLogInstance();
                          if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)buf = 138412290;
                            v123 = @"[AutoCounter][VURawCluster]";
                            _os_log_impl(&dword_1BBEDA000, v78, OS_LOG_TYPE_DEFAULT, "%@ Face without localIdentifier; skip",
                              buf,
                              0xCu);
                          }
                        }
                        int v18 = 9;
                      }

LABEL_86:
LABEL_89:

LABEL_90:
                      goto LABEL_91;
                    }
                    if ((int)MediaAnalysisLogLevel() >= 7)
                    {
                      int v72 = VCPLogInstance();
                      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138412802;
                        v123 = @"[AutoCounter][VURawCluster]";
                        __int16 v124 = 2112;
                        uint64_t v125 = (uint64_t)v43;
                        __int16 v126 = 2112;
                        uint64_t v127 = (uint64_t)v99;
                        _os_log_impl(&dword_1BBEDA000, v72, OS_LOG_TYPE_DEBUG, "%@  Fetched face/person %@ not matching required person %@; skip",
                          buf,
                          0x20u);
                      }
LABEL_85:
                      int v18 = 9;
                      goto LABEL_86;
                    }
                  }
                  else
                  {
                    if ((int)MediaAnalysisLogLevel() >= 4)
                    {
                      int v72 = VCPLogInstance();
                      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412290;
                        v123 = @"[AutoCounter][VURawCluster]";
                        _os_log_impl(&dword_1BBEDA000, v72, OS_LOG_TYPE_DEFAULT, "%@ Face without personLocalIdentifier; skip",
                          buf,
                          0xCu);
                      }
                      v43 = 0;
                      goto LABEL_85;
                    }
                    v43 = 0;
                  }
                  int v18 = 9;
                  goto LABEL_89;
                }
                int v18 = 1;
LABEL_92:
                if (v18 != 9 && v18) {
                  goto LABEL_97;
                }
                ++v26;
              }
              while (v103 != v26);
              uint64_t v25 = [v96 countByEnumeratingWithState:&v109 objects:v120 count:16];
            }
            while (v25);
          }
          int v18 = 0;
LABEL_97:

          uint64_t v79 = v101;
LABEL_102:
        }
        else
        {
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            uint64_t v79 = VCPLogInstance();
            if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v123 = @"[AutoCounter][VURawCluster]";
              _os_log_impl(&dword_1BBEDA000, v79, OS_LOG_TYPE_DEBUG, "%@ Skipping raw-cluster with non visible faces", buf, 0xCu);
            }
            int v18 = 3;
            goto LABEL_102;
          }
          int v18 = 3;
        }

        goto LABEL_104;
      }
      int v18 = 1;
LABEL_104:
      if (v18 != 3 && v18)
      {
        int v80 = -128;
        goto LABEL_112;
      }
      ++v92;
    }
    while (v92 != v89);
    uint64_t v17 = [obj countByEnumeratingWithState:&v113 objects:v134 count:16];
  }
  while (v17);
LABEL_110:
  int v80 = 0;
LABEL_112:

  return v80;
}

- (int)exportVUGalleryClusterStates:(id *)a3 error:(id *)a4 extendTimeoutBlock:(id)a5 cancelBlock:(id)a6
{
  v61[1] = *MEMORY[0x1E4F143B8];
  id v46 = a5;
  id v47 = a6;
  unint64_t v44 = [(PHPhotoLibrary *)self->_photoLibrary vcp_visionCacheStorageDirectoryURL];
  id v8 = objc_alloc((Class)getGDVUVisualUnderstandingServiceClass());
  int v9 = [getGDVUEntityRecognitionClientClass() photos];
  id v51 = 0;
  double v48 = (void *)[v8 initWithClient:v9 version:1 url:v44 error:&v51];
  id v43 = v51;

  uint64_t v10 = [v48 gallery];
  __int16 v11 = [getGDVUEntityClassClass() person];
  id v12 = [v10 clustersFor:v11];

  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    __int16 v13 = VCPLogInstance();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = [v12 count];
      *(_DWORD *)buf = 138412546;
      unint64_t v53 = @"[AutoCounter][ExportVUGallery]";
      __int16 v54 = 2048;
      unint64_t v55 = v14;
      _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_DEBUG, "%@ Retrieved %lu raw-cluster", buf, 0x16u);
    }
  }
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __96__VCPPhotosAutoCounterWorker_exportVUGalleryClusterStates_error_extendTimeoutBlock_cancelBlock___block_invoke;
  v49[3] = &unk_1E629BF98;
  double v50 = @"[AutoCounter][ExportVUGallery]";
  [v12 enumerateKeysAndObjectsUsingBlock:v49];
  id v42 = objc_msgSend(NSString, "stringWithFormat:", @"AutoCounterClustersVU_Ver%d_Detector%lu_Printer%lu_MAD%lu_VU%lu_PhotosPerson%lu.plist", -[PHPhotoLibrary mad_faceProcessingInternalVersion](self->_photoLibrary, "mad_faceProcessingInternalVersion"), self->_detectionVersion, self->_recognitionVersion, self->_madVersion, self->_vuVersion, self->_personClusterVersion);
  uint64_t v15 = [(PHPhotoLibrary *)self->_photoLibrary vcp_visionCacheStorageDirectoryURL];
  int v16 = [v15 URLByAppendingPathComponent:v42];

  if (v16)
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      uint64_t v17 = VCPLogInstance();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        unint64_t v53 = @"[AutoCounter][ExportVUGallery]";
        __int16 v54 = 2112;
        unint64_t v55 = (unint64_t)v16;
        _os_log_impl(&dword_1BBEDA000, v17, OS_LOG_TYPE_DEBUG, "%@ Export to file-URL %@", buf, 0x16u);
      }
    }
    id v18 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v19 = [MEMORY[0x1E4F1CA60] dictionary];
    [v18 setObject:v19 forKeyedSubscript:@"faces"];
    uint64_t v20 = [MEMORY[0x1E4F1CA60] dictionary];
    [v18 setObject:v20 forKeyedSubscript:@"assetInformation"];
    [(VCPPhotosAutoCounterWorker *)self _processFetchedVURawCluster:v12 forPersonLocalIdentifier:0 facesPerAsset:v19 assetInformation:v20 extendTimeoutBlock:v46 cancelBlock:v47];
    uint64_t v21 = [v19 allKeys];
    BOOL v22 = [v21 count] == 0;

    if (v22)
    {
      id v34 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v58 = *MEMORY[0x1E4F28568];
      BOOL v35 = [NSString stringWithFormat:@"%@ Failed to process raw-clusters", @"[AutoCounter][ExportVUGallery]"];
      unint64_t v59 = v35;
      id v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
      v27 = [v34 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v36];

      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v37 = VCPLogInstance();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          v38 = [v27 description];
          *(_DWORD *)buf = 138412290;
          unint64_t v53 = v38;
          _os_log_impl(&dword_1BBEDA000, v37, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
      if (!a4)
      {
LABEL_37:
        int v33 = 0;
        goto LABEL_38;
      }
      v27 = v27;
      int v33 = 0;
      *a4 = v27;
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        v23 = VCPLogInstance();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          unint64_t clusterDumpFaceFetched = self->_clusterDumpFaceFetched;
          *(_DWORD *)buf = 138412546;
          unint64_t v53 = @"[AutoCounter][ExportVUGallery]";
          __int16 v54 = 2048;
          unint64_t v55 = clusterDumpFaceFetched;
          _os_log_impl(&dword_1BBEDA000, v23, OS_LOG_TYPE_INFO, "%@ Retrieved and dumpped %lu faces", buf, 0x16u);
        }
      }
      uint64_t v25 = self;
      objc_sync_enter(v25);
      int v26 = [v18 writeToURL:v16 error:a4];
      objc_sync_exit(v25);

      if (v26)
      {
        if (a3) {
          *a3 = v16;
        }
        if ((int)MediaAnalysisLogLevel() < 6)
        {
          int v33 = 0;
          goto LABEL_39;
        }
        v27 = VCPLogInstance();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          unint64_t v53 = @"[AutoCounter][ExportVUGallery]";
          __int16 v54 = 2112;
          unint64_t v55 = (unint64_t)v16;
          _os_log_impl(&dword_1BBEDA000, v27, OS_LOG_TYPE_INFO, "%@ Saved cluster state to %@", buf, 0x16u);
        }
        goto LABEL_37;
      }
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        int v33 = -20;
        goto LABEL_39;
      }
      v27 = VCPLogInstance();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        id v39 = *a4;
        *(_DWORD *)buf = 138412802;
        unint64_t v53 = @"[AutoCounter][ExportVUGallery]";
        __int16 v54 = 2112;
        unint64_t v55 = (unint64_t)v16;
        __int16 v56 = 2112;
        id v57 = v39;
        _os_log_impl(&dword_1BBEDA000, v27, OS_LOG_TYPE_ERROR, "%@ Failed to write to %@ - %@", buf, 0x20u);
      }
      int v33 = -20;
    }
LABEL_38:

LABEL_39:
    goto LABEL_40;
  }
  v28 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v60 = *MEMORY[0x1E4F28568];
  uint64_t v29 = [NSString stringWithFormat:@"%@ Failed to retrive export file-URL", @"[AutoCounter][ExportVUGallery]"];
  v61[0] = v29;
  id v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:&v60 count:1];
  id v18 = [v28 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v30];

  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    uint64_t v31 = VCPLogInstance();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      id v32 = [v18 description];
      *(_DWORD *)buf = 138412290;
      unint64_t v53 = v32;
      _os_log_impl(&dword_1BBEDA000, v31, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
  }
  if (a4)
  {
    id v18 = v18;
    int v33 = 0;
    *a4 = v18;
  }
  else
  {
    int v33 = 0;
  }
LABEL_40:

  return v33;
}

void __96__VCPPhotosAutoCounterWorker_exportVUGalleryClusterStates_error_extendTimeoutBlock_cancelBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    id v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412802;
      uint64_t v10 = v8;
      __int16 v11 = 2112;
      id v12 = v5;
      __int16 v13 = 2048;
      uint64_t v14 = [v6 count];
      _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_DEBUG, "%@ raw-cluster %@ has %lu observation(s)", (uint8_t *)&v9, 0x20u);
    }
  }
}

- (int)exportClustersStates:(id *)a3 error:(id *)a4 extendTimeoutBlock:(id)a5 cancelBlock:(id)a6
{
  v92[1] = *MEMORY[0x1E4F143B8];
  v68 = (void (**)(void))a5;
  v69 = (uint64_t (**)(void))a6;
  uint64_t v60 = objc_msgSend(NSString, "stringWithFormat:", @"AutoCounterClusters_Ver%d_Detector%lu_Printer%lu_MAD%lu_VU%lu_PhotosPerson%lu.plist", -[PHPhotoLibrary mad_faceProcessingInternalVersion](self->_photoLibrary, "mad_faceProcessingInternalVersion"), self->_detectionVersion, self->_recognitionVersion, self->_madVersion, self->_vuVersion, self->_personClusterVersion);
  unint64_t v59 = self;
  uint64_t v8 = [(PHPhotoLibrary *)self->_photoLibrary vcp_visionCacheStorageDirectoryURL];
  uint64_t v9 = [v8 URLByAppendingPathComponent:v60];

  id v58 = (id)v9;
  if (v9)
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      uint64_t v10 = VCPLogInstance();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v84 = v9;
        _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_DEBUG, "[AutoCounter] Export URL: %@", buf, 0xCu);
      }
    }
    id v61 = [MEMORY[0x1E4F1CA60] dictionary];
    __int16 v56 = [(VCPPhotosAutoCounterWorker *)self _fetchPeopleHomePersons];
    v74 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
    v63 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id obj = v56;
    uint64_t v11 = [obj countByEnumeratingWithState:&v79 objects:v90 count:16];
    if (v11)
    {
      uint64_t v67 = *(void *)v80;
      do
      {
        uint64_t v72 = 0;
        uint64_t v66 = v11;
        do
        {
          if (*(void *)v80 != v67) {
            objc_enumerationMutation(obj);
          }
          uint64_t v71 = *(void *)(*((void *)&v79 + 1) + 8 * v72);
          context = (void *)MEMORY[0x1C186D320]();
          if (v69 && (v69[2]() & 1) != 0)
          {
            int v12 = 0;
            goto LABEL_42;
          }
          if (v68) {
            v68[2]();
          }
          id v65 = [MEMORY[0x1E4F391F8] fetchMergeCandidatePersonsForPerson:v71 options:v74];
          int v73 = [MEMORY[0x1E4F1CA48] array];
          long long v77 = 0u;
          long long v78 = 0u;
          long long v75 = 0u;
          long long v76 = 0u;
          id v13 = v65;
          uint64_t v14 = [v13 countByEnumeratingWithState:&v75 objects:v89 count:16];
          if (v14)
          {
            unint64_t v15 = 0;
            uint64_t v16 = *(void *)v76;
            do
            {
              for (uint64_t i = 0; i != v14; ++i)
              {
                if (*(void *)v76 != v16) {
                  objc_enumerationMutation(v13);
                }
                uint64_t v18 = *(void *)(*((void *)&v75 + 1) + 8 * i);
                uint64_t v19 = (void *)MEMORY[0x1C186D320]();
                uint64_t v20 = [MEMORY[0x1E4F39080] fetchFaceGroupsForPerson:v18 options:v74];
                uint64_t v21 = [v20 count];
                BOOL v22 = v21 == 0;
                if (!v21)
                {
                  if ((int)MediaAnalysisLogLevel() < 4) {
                    goto LABEL_27;
                  }
                  uint64_t v25 = VCPLogInstance();
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    uint64_t v84 = v18;
                    _os_log_impl(&dword_1BBEDA000, v25, OS_LOG_TYPE_DEFAULT, "[AutoCounter] Failed to find facegroup for mergeCandidate: %@", buf, 0xCu);
                  }
                  goto LABEL_32;
                }
                v23 = [v20 firstObject];
                v24 = [v23 localIdentifier];
                [v73 addObject:v24];

                if (v15 < 9)
                {
                  ++v15;
LABEL_27:
                  BOOL v22 = 1;
                  goto LABEL_34;
                }
                if ((int)MediaAnalysisLogLevel() >= 7)
                {
                  uint64_t v25 = VCPLogInstance();
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 134217984;
                    uint64_t v84 = 9;
                    _os_log_impl(&dword_1BBEDA000, v25, OS_LOG_TYPE_DEBUG, "[AutoCounter] Reach kVCPMaximumNumberOfMergeCandidatesShown (%lu); skip the rest",
                      buf,
                      0xCu);
                  }
                  unint64_t v15 = 10;
LABEL_32:

                  goto LABEL_34;
                }
                BOOL v22 = 0;
                unint64_t v15 = 10;
LABEL_34:

                if (!v22) {
                  goto LABEL_37;
                }
              }
              uint64_t v14 = [v13 countByEnumeratingWithState:&v75 objects:v89 count:16];
            }
            while (v14);
          }
LABEL_37:

          if ([v73 count])
          {
            int v26 = [MEMORY[0x1E4F39080] fetchFaceGroupsForPerson:v71 options:v74];
            if ([v26 count])
            {
              v27 = [v26 firstObject];
              v28 = [v27 localIdentifier];
              [v63 setObject:v73 forKeyedSubscript:v28];
            }
          }

          int v12 = 1;
LABEL_42:
          if (!v12)
          {
            int v42 = -128;
            uint64_t v29 = obj;
LABEL_81:

            goto LABEL_82;
          }
          ++v72;
        }
        while (v72 != v66);
        uint64_t v11 = [obj countByEnumeratingWithState:&v79 objects:v90 count:16];
      }
      while (v11);
    }

    [v61 setObject:v63 forKey:@"mergecandidates"];
    uint64_t v29 = [MEMORY[0x1E4F1CA60] dictionary];
    [v61 setObject:v29 forKey:@"faces"];
    id v30 = [MEMORY[0x1E4F1CA60] dictionary];
    [v61 setObject:v30 forKey:@"assetInformation"];
    uint64_t v31 = [(PHPhotoLibrary *)v59->_photoLibrary librarySpecificFetchOptions];
    [v31 setMinimumUnverifiedFaceCount:1];
    [v31 setMinimumVerifiedFaceCount:1];
    id v32 = [MEMORY[0x1E4F39080] fetchFaceGroupsWithOptions:v31];
    [(VCPPhotosAutoCounterWorker *)v59 _processFetchedFaceGroup:v32 forPersonID:0 facesPerAsset:v29 assetInformation:v30 extendTimeoutBlock:v68 cancelBlock:v69];
    int v33 = [v29 allKeys];
    BOOL v34 = [v33 count] == 0;

    if (v34)
    {
      double v48 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v87 = *MEMORY[0x1E4F28568];
      BOOL v49 = [NSString stringWithFormat:@"[AutoCounter] Failed to process FaceGroups"];
      uint64_t v88 = v49;
      double v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v88 forKeys:&v87 count:1];
      id v41 = [v48 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v50];

      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        id v51 = VCPLogInstance();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          unint64_t v52 = [v41 description];
          *(_DWORD *)buf = 138412290;
          uint64_t v84 = (uint64_t)v52;
          _os_log_impl(&dword_1BBEDA000, v51, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
      if (!a4)
      {
LABEL_78:
        int v42 = 0;
        goto LABEL_79;
      }
      id v41 = v41;
      int v42 = 0;
      *a4 = v41;
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        BOOL v35 = VCPLogInstance();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v36 = [v32 count];
          *(_DWORD *)buf = 134217984;
          uint64_t v84 = v36;
          _os_log_impl(&dword_1BBEDA000, v35, OS_LOG_TYPE_DEFAULT, "[AutoCounter][ClusterDump] FaceGroupCount %lu", buf, 0xCu);
        }
      }
      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        v37 = VCPLogInstance();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t clusterDumpFaceFetched = v59->_clusterDumpFaceFetched;
          *(_DWORD *)buf = 134217984;
          uint64_t v84 = clusterDumpFaceFetched;
          _os_log_impl(&dword_1BBEDA000, v37, OS_LOG_TYPE_DEFAULT, "[AutoCounter][ClusterDump] FaceCount %lu", buf, 0xCu);
        }
      }
      id v39 = v59;
      objc_sync_enter(v39);
      int v40 = [v61 writeToURL:v58 error:a4];
      objc_sync_exit(v39);

      if (v40)
      {
        if (a3) {
          *a3 = v58;
        }
        if ((int)MediaAnalysisLogLevel() < 5)
        {
          int v42 = 0;
          goto LABEL_80;
        }
        id v41 = VCPLogInstance();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v84 = (uint64_t)v58;
          _os_log_impl(&dword_1BBEDA000, v41, OS_LOG_TYPE_DEFAULT, "[AutoCounter] Saved cluster state to %@", buf, 0xCu);
        }
        goto LABEL_78;
      }
      if ((int)MediaAnalysisLogLevel() < 4)
      {
        int v42 = -20;
        goto LABEL_80;
      }
      id v41 = VCPLogInstance();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        id v53 = *a4;
        *(_DWORD *)buf = 138412546;
        uint64_t v84 = (uint64_t)v58;
        __int16 v85 = 2112;
        id v86 = v53;
        _os_log_impl(&dword_1BBEDA000, v41, OS_LOG_TYPE_DEFAULT, "[AutoCounter] Cannot write to %@ : %@", buf, 0x16u);
      }
      int v42 = -20;
    }
LABEL_79:

LABEL_80:
    goto LABEL_81;
  }
  id v43 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v91 = *MEMORY[0x1E4F28568];
  unint64_t v44 = [NSString stringWithFormat:@"[AutoCounter] Failed to retrive export URL"];
  v92[0] = v44;
  unint64_t v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v92 forKeys:&v91 count:1];
  id v61 = [v43 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v45];

  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    id v46 = VCPLogInstance();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      id v47 = [v61 description];
      *(_DWORD *)buf = 138412290;
      uint64_t v84 = (uint64_t)v47;
      _os_log_impl(&dword_1BBEDA000, v46, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
  }
  if (!a4)
  {
    int v42 = 0;
LABEL_82:

    goto LABEL_83;
  }
  id v62 = v61;
  int v42 = 0;
  *a4 = v62;

LABEL_83:
  return v42;
}

- (double)_overlapRatioOf:(CGRect)a3 with:(CGRect)a4
{
  CGFloat v4 = a3.size.width * a3.size.height;
  CGFloat v5 = a4.size.width * a4.size.height;
  CGRect v7 = CGRectIntersection(a3, a4);
  return v7.size.width * v7.size.height / (v4 + v5 - v7.size.width * v7.size.height);
}

- (int)_parseGroundTruthWithURL:(id)a3 faceCountPerPerson:(id *)a4 personInformation:(id *)a5 faceToPerson:(id *)a6 assetToFaces:(id *)a7 extendTimeoutBlock:(id)a8 cancelBlock:(id)a9
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v25 = a8;
  id v26 = a9;
  *a4 = 0;
  *a5 = 0;
  *a6 = 0;
  *a7 = 0;
  uint64_t v41 = 0;
  int v42 = &v41;
  uint64_t v43 = 0x2020000000;
  int v44 = 0;
  id v29 = [MEMORY[0x1E4F28BD0] set];
  id v28 = [MEMORY[0x1E4F1CA60] dictionary];
  v23 = a7;
  v24 = a6;
  id v27 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v16 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v17 = (void *)MEMORY[0x1C186D320]();
  id v39 = 0;
  id v40 = 0;
  int v18 = [(VCPPhotosAutoCounterWorker *)self _loadGroundTruthURL:v15 toGroundTruth:&v40 error:&v39];
  id v19 = v40;
  id v20 = v39;
  if (v18)
  {
    if ((int)MediaAnalysisLogLevel() < 3) {
      goto LABEL_7;
    }
    uint64_t v21 = VCPLogInstance();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v46 = @"[AutoCounter][ParseGT]";
      __int16 v47 = 2112;
      id v48 = v20;
      _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_ERROR, "%@ Fail to load groundtruth file: %@", buf, 0x16u);
    }
  }
  else
  {
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __149__VCPPhotosAutoCounterWorker__parseGroundTruthWithURL_faceCountPerPerson_personInformation_faceToPerson_assetToFaces_extendTimeoutBlock_cancelBlock___block_invoke;
    v30[3] = &unk_1E629C010;
    uint64_t v31 = v28;
    id v32 = @"[AutoCounter][ParseGT]";
    id v36 = v26;
    v38 = &v41;
    id v37 = v25;
    id v33 = v16;
    id v34 = v27;
    id v35 = v29;
    [v19 enumerateKeysAndObjectsUsingBlock:v30];

    uint64_t v21 = v31;
  }

LABEL_7:
  if (!v18)
  {
    *a4 = v29;
    *a5 = v28;
    id *v24 = v27;
    id *v23 = v16;
    int v18 = *((_DWORD *)v42 + 6);
  }

  _Block_object_dispose(&v41, 8);
  return v18;
}

void __149__VCPPhotosAutoCounterWorker__parseGroundTruthWithURL_faceCountPerPerson_personInformation_faceToPerson_assetToFaces_extendTimeoutBlock_cancelBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = (void *)MEMORY[0x1C186D320]();
  uint64_t v10 = [v8 objectForKeyedSubscript:@"AdditionalInformation"];
  [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:v7];

  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    uint64_t v11 = VCPLogInstance();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = *(void *)(a1 + 40);
      id v13 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
      *(_DWORD *)buf = 138412546;
      uint64_t v28 = v12;
      __int16 v29 = 2112;
      id v30 = v13;
      _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_DEBUG, "%@ person information: %@", buf, 0x16u);
    }
  }
  uint64_t v14 = [v8 objectForKeyedSubscript:@"FacesPerAsset"];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __149__VCPPhotosAutoCounterWorker__parseGroundTruthWithURL_faceCountPerPerson_personInformation_faceToPerson_assetToFaces_extendTimeoutBlock_cancelBlock___block_invoke_473;
  v18[3] = &unk_1E629BFE8;
  id v24 = *(id *)(a1 + 72);
  uint64_t v26 = a4;
  long long v17 = *(_OWORD *)(a1 + 80);
  id v15 = (id)v17;
  long long v25 = v17;
  id v19 = *(id *)(a1 + 48);
  id v20 = *(id *)(a1 + 40);
  id v16 = v7;
  id v21 = v16;
  id v22 = *(id *)(a1 + 56);
  id v23 = *(id *)(a1 + 64);
  [v14 enumerateKeysAndObjectsUsingBlock:v18];
}

void __149__VCPPhotosAutoCounterWorker__parseGroundTruthWithURL_faceCountPerPerson_personInformation_faceToPerson_assetToFaces_extendTimeoutBlock_cancelBlock___block_invoke_473(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = (void *)MEMORY[0x1C186D320]();
  uint64_t v10 = *(void *)(a1 + 72);
  if (v10 && (*(unsigned int (**)(void))(v10 + 16))())
  {
    uint64_t v11 = *(unsigned char **)(a1 + 96);
    *(_DWORD *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = -128;
    *a4 = 1;
    unsigned char *v11 = 1;
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 80);
    if (v12) {
      (*(void (**)(void))(v12 + 16))();
    }
    id v13 = [*(id *)(a1 + 32) allKeys];
    char v14 = [v13 containsObject:v7];

    if ((v14 & 1) == 0)
    {
      id v15 = [MEMORY[0x1E4F1CA48] array];
      [*(id *)(a1 + 32) setObject:v15 forKeyedSubscript:v7];
    }
    id v16 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
    [v16 addObjectsFromArray:v8];

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __149__VCPPhotosAutoCounterWorker__parseGroundTruthWithURL_faceCountPerPerson_personInformation_faceToPerson_assetToFaces_extendTimeoutBlock_cancelBlock___block_invoke_2;
    v17[3] = &unk_1E629BFC0;
    id v18 = *(id *)(a1 + 40);
    id v19 = *(id *)(a1 + 48);
    id v20 = *(id *)(a1 + 56);
    id v21 = *(id *)(a1 + 64);
    [v8 enumerateObjectsUsingBlock:v17];
  }
}

void __149__VCPPhotosAutoCounterWorker__parseGroundTruthWithURL_faceCountPerPerson_personInformation_faceToPerson_assetToFaces_extendTimeoutBlock_cancelBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  CGFloat v4 = [v3 objectForKeyedSubscript:@"faceID"];
  if (!v4)
  {
    if ((int)MediaAnalysisLogLevel() < 4) {
      goto LABEL_15;
    }
    id v7 = VCPLogInstance();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    uint64_t v14 = *(void *)(a1 + 32);
    int v16 = 138412546;
    uint64_t v17 = v14;
    __int16 v18 = 2112;
    id v19 = v3;
    uint64_t v10 = "%@ Invalid faceID for face: %@; ignore";
LABEL_12:
    uint64_t v11 = v7;
    os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
    uint32_t v13 = 22;
    goto LABEL_13;
  }
  CGFloat v5 = *(void **)(a1 + 40);
  id v6 = [v3 objectForKeyedSubscript:@"personID"];
  LOBYTE(v5) = [v5 isEqualToString:v6];

  if ((v5 & 1) == 0)
  {
    if ((int)MediaAnalysisLogLevel() < 4) {
      goto LABEL_15;
    }
    id v7 = VCPLogInstance();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    uint64_t v15 = *(void *)(a1 + 32);
    int v16 = 138412546;
    uint64_t v17 = v15;
    __int16 v18 = 2112;
    id v19 = v4;
    uint64_t v10 = "%@ Invalid PersonID for faceID: %@; ignore";
    goto LABEL_12;
  }
  [*(id *)(a1 + 48) setObject:*(void *)(a1 + 40) forKeyedSubscript:v4];
  [*(id *)(a1 + 56) addObject:*(void *)(a1 + 40)];
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    id v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      int v16 = 138412802;
      uint64_t v17 = v8;
      __int16 v18 = 2112;
      id v19 = v4;
      __int16 v20 = 2112;
      uint64_t v21 = v9;
      uint64_t v10 = "%@ Load faceID: %@ for PersonID: %@";
      uint64_t v11 = v7;
      os_log_type_t v12 = OS_LOG_TYPE_DEBUG;
      uint32_t v13 = 32;
LABEL_13:
      _os_log_impl(&dword_1BBEDA000, v11, v12, v10, (uint8_t *)&v16, v13);
    }
LABEL_14:
  }
LABEL_15:
}

- (void)_exportAssetsToFacesDetails:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  CGFloat v5 = objc_msgSend(NSString, "stringWithFormat:", @"AutoCounterClusterAssetsToFaces_Ver%d_Detector%lu_Printer%lu_MAD%lu_VU%lu_PhotosPerson%lu.plist", -[PHPhotoLibrary mad_faceProcessingInternalVersion](self->_photoLibrary, "mad_faceProcessingInternalVersion"), self->_detectionVersion, self->_recognitionVersion, self->_madVersion, self->_vuVersion, self->_personClusterVersion);
  id v6 = [(PHPhotoLibrary *)self->_photoLibrary vcp_visionCacheStorageDirectoryURL];
  id v7 = [v6 URLByAppendingPathComponent:v5];

  uint64_t v8 = self;
  objc_sync_enter(v8);
  id v14 = 0;
  LODWORD(v6) = [v4 writeToURL:v7 error:&v14];
  id v9 = v14;
  objc_sync_exit(v8);

  if (v6)
  {
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      uint64_t v10 = VCPLogInstance();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        int v16 = v7;
        uint64_t v11 = "[AutoCounter] Saved assets-to-faces details to %@";
        os_log_type_t v12 = v10;
        uint32_t v13 = 12;
LABEL_8:
        _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 4)
  {
    uint64_t v10 = VCPLogInstance();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      int v16 = v7;
      __int16 v17 = 2112;
      id v18 = v9;
      uint64_t v11 = "[AutoCounter] Cannot write assets-to-faces to %@ : %@";
      os_log_type_t v12 = v10;
      uint32_t v13 = 22;
      goto LABEL_8;
    }
LABEL_9:
  }
}

+ (BOOL)_dumpAssetsToFaces
{
  return 0;
}

- (int)_measureClusterWithClusterStateURL:(id)a3 groundTruthFaceCountPerPerson:(id)a4 groundTruthPersonInformation:(id)a5 groundTruthFaceToPerson:(id)a6 groundTruthAssetToFaces:(id)a7 measures:(id *)a8 extendTimeoutBlock:(id)a9 cancelBlock:(id)a10
{
  uint64_t v221 = *MEMORY[0x1E4F143B8];
  id v160 = a3;
  id v156 = a4;
  id v171 = a5;
  id v172 = a6;
  id v150 = a7;
  v157 = (void (**)(void))a9;
  v161 = (unsigned int (**)(void))a10;
  v145 = a8;
  *a8 = 0;
  v153 = [MEMORY[0x1E4F1CA60] dictionary];
  v151 = [MEMORY[0x1E4F1CA60] dictionary];
  v152 = [MEMORY[0x1E4F1CA60] dictionary];
  v170 = [MEMORY[0x1E4F1CA60] dictionary];
  int v16 = [MEMORY[0x1E4F28CB8] defaultManager];
  __int16 v17 = [v160 path];
  LODWORD(a4) = [v16 fileExistsAtPath:v17];

  if (a4)
  {
    id v18 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithContentsOfURL:v160];
    uint64_t v19 = v18;
    if (v18)
    {
      v142 = [v18 objectForKeyedSubscript:@"assetInformation"];
      v143 = v19;
      if (!v142)
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          uint64_t v95 = VCPLogInstance();
          if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v214 = @"[AutoCounter][P/R]";
            _os_log_impl(&dword_1BBEDA000, v95, OS_LOG_TYPE_ERROR, "%@ Cluster contains no asset information", buf, 0xCu);
          }
        }
        int v25 = -50;
LABEL_165:

        v94 = v143;
LABEL_166:

        goto LABEL_167;
      }
      uint64_t v208 = 0;
      v209 = &v208;
      uint64_t v210 = 0x2020000000;
      int v211 = 0;
      __int16 v20 = (void *)MEMORY[0x1C186D320]();
      uint64_t v21 = [v19 objectForKeyedSubscript:@"faces"];
      uint64_t v22 = [v21 count];
      if (v22)
      {
        id v23 = [MEMORY[0x1E4F1CA60] dictionary];
        v195[0] = MEMORY[0x1E4F143A8];
        v195[1] = 3221225472;
        v195[2] = __212__VCPPhotosAutoCounterWorker__measureClusterWithClusterStateURL_groundTruthFaceCountPerPerson_groundTruthPersonInformation_groundTruthFaceToPerson_groundTruthAssetToFaces_measures_extendTimeoutBlock_cancelBlock___block_invoke;
        v195[3] = &unk_1E629C088;
        id v196 = v142;
        v197 = @"[AutoCounter][P/R]";
        id v198 = v150;
        v205 = v161;
        v207 = &v208;
        v206 = v157;
        v199 = self;
        id v200 = v153;
        id v201 = v152;
        id v202 = v151;
        id v203 = v170;
        id v24 = v23;
        v204 = v24;
        [v21 enumerateKeysAndObjectsUsingBlock:v195];
        if ([(id)objc_opt_class() _dumpAssetsToFaces]) {
          [(VCPPhotosAutoCounterWorker *)self _exportAssetsToFacesDetails:v24];
        }
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() < 3) {
          goto LABEL_9;
        }
        id v24 = VCPLogInstance();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v214 = @"[AutoCounter][P/R]";
          _os_log_impl(&dword_1BBEDA000, v24, OS_LOG_TYPE_ERROR, "%@ Cluster contains no data", buf, 0xCu);
        }
      }

LABEL_9:
      if (v22)
      {
        int v25 = *((_DWORD *)v209 + 6);
        if (v25) {
          int v26 = *((_DWORD *)v209 + 6);
        }
        else {
          int v26 = -18;
        }
        if (!v25)
        {
          int v135 = v26;
          v140 = objc_alloc_init(VCPClusteringAccuracyMeasures);
          v144 = [MEMORY[0x1E4F1CA60] dictionary];
          v149 = [v153 allValues];
          v141 = [MEMORY[0x1E4F1CA60] dictionary];
          unint64_t v158 = 0;
          unint64_t v136 = 0;
          unint64_t v137 = 0;
          float v27 = 0.0;
          *(void *)&long long v28 = 138413314;
          long long v134 = v28;
          float v139 = 0.0;
          while (v158 < objc_msgSend(v149, "count", v134))
          {
            context = (void *)MEMORY[0x1C186D320]();
            v154 = [v149 objectAtIndexedSubscript:v158];
            if (v161 && v161[2]())
            {
              *((_DWORD *)v209 + 6) = -128;
              int v29 = 16;
            }
            else
            {
              if (v157) {
                v157[2]();
              }
              id v30 = [MEMORY[0x1E4F28BD0] set];
              long long v193 = 0u;
              long long v194 = 0u;
              long long v191 = 0u;
              long long v192 = 0u;
              id v31 = v154;
              uint64_t v32 = [v31 countByEnumeratingWithState:&v191 objects:v220 count:16];
              if (v32)
              {
                uint64_t v33 = *(void *)v192;
                do
                {
                  for (uint64_t i = 0; i != v32; ++i)
                  {
                    if (*(void *)v192 != v33) {
                      objc_enumerationMutation(v31);
                    }
                    uint64_t v35 = *(void *)(*((void *)&v191 + 1) + 8 * i);
                    id v36 = [v172 objectForKeyedSubscript:v35];
                    if (v36)
                    {
                      id v37 = [v171 objectForKeyedSubscript:v36];
                      v38 = [v37 objectForKeyedSubscript:@"OptInDateSinceReferenceDate"];
                      [v38 doubleValue];
                      double v40 = v39;

                      uint64_t v41 = [v170 objectForKeyedSubscript:v35];
                      int v42 = v41;
                      if (v41)
                      {
                        [v41 doubleValue];
                        if (v40 > v43) {
                          [v30 addObject:v36];
                        }
                      }
                    }
                    else
                    {
                      [v30 addObject:@"Unknown"];
                    }
                  }
                  uint64_t v32 = [v31 countByEnumeratingWithState:&v191 objects:v220 count:16];
                }
                while (v32);
              }

              long long v189 = 0u;
              long long v190 = 0u;
              long long v187 = 0u;
              long long v188 = 0u;
              int v44 = [v30 allObjects];
              unint64_t v45 = 0;
              uint64_t v46 = [v44 countByEnumeratingWithState:&v187 objects:v219 count:16];
              if (v46)
              {
                v168 = 0;
                uint64_t v47 = *(void *)v188;
                do
                {
                  for (uint64_t j = 0; j != v46; ++j)
                  {
                    if (*(void *)v188 != v47) {
                      objc_enumerationMutation(v44);
                    }
                    uint64_t v49 = *(void **)(*((void *)&v187 + 1) + 8 * j);
                    if (([v49 isEqualToString:@"Unknown"] & 1) == 0)
                    {
                      unint64_t v50 = [v30 countForObject:v49];
                      if (v50 > v45)
                      {
                        id v51 = v49;

                        unint64_t v45 = v50;
                        v168 = v51;
                      }
                    }
                  }
                  uint64_t v46 = [v44 countByEnumeratingWithState:&v187 objects:v219 count:16];
                }
                while (v46);
              }
              else
              {
                v168 = 0;
              }

              v146 = [v171 objectForKeyedSubscript:v168];
              v147 = [v146 objectForKeyedSubscript:@"OptInDateSinceReferenceDate"];
              int v29 = 18;
              if (v168 && v147)
              {
                [v147 doubleValue];
                double v53 = v52;
                long long v185 = 0u;
                long long v186 = 0u;
                long long v183 = 0u;
                long long v184 = 0u;
                id obj = v31;
                int v54 = 0;
                uint64_t v55 = [obj countByEnumeratingWithState:&v183 objects:v218 count:16];
                if (v55)
                {
                  uint64_t v56 = *(void *)v184;
                  do
                  {
                    for (uint64_t k = 0; k != v55; ++k)
                    {
                      if (*(void *)v184 != v56) {
                        objc_enumerationMutation(obj);
                      }
                      uint64_t v58 = *(void *)(*((void *)&v183 + 1) + 8 * k);
                      unint64_t v59 = [v172 objectForKeyedSubscript:v58];
                      if (v59)
                      {
                        uint64_t v60 = [v171 objectForKeyedSubscript:v59];
                        id v61 = [v60 objectForKeyedSubscript:@"OptInDateSinceReferenceDate"];
                        [v61 doubleValue];
                        double v63 = v62;

                        if (v63 <= v53 + 21600.0)
                        {
                          __int16 v64 = [v170 objectForKeyedSubscript:v58];
                          id v65 = v64;
                          if (v64)
                          {
                            [v64 doubleValue];
                            if (v66 > v53) {
                              ++v54;
                            }
                          }
                        }
                        else
                        {
                          ++v54;
                        }
                      }
                    }
                    uint64_t v55 = [obj countByEnumeratingWithState:&v183 objects:v218 count:16];
                  }
                  while (v55);
                }

                uint64_t v67 = [v144 allKeys];
                int v68 = [v67 containsObject:v168];

                if (v68)
                {
                  v69 = [v144 objectForKeyedSubscript:v168];
                  long long v181 = 0u;
                  long long v182 = 0u;
                  long long v179 = 0u;
                  long long v180 = 0u;
                  v138 = v69;
                  v70 = [v69 allObjects];
                  id v164 = v70;
                  uint64_t v71 = [v70 countByEnumeratingWithState:&v179 objects:v217 count:16];
                  if (v71)
                  {
                    unint64_t v162 = 0;
                    uint64_t v72 = *(void *)v180;
                    do
                    {
                      for (uint64_t m = 0; m != v71; ++m)
                      {
                        if (*(void *)v180 != v72) {
                          objc_enumerationMutation(v164);
                        }
                        uint64_t v74 = *(void *)(*((void *)&v179 + 1) + 8 * m);
                        long long v75 = [v172 objectForKeyedSubscript:v74];
                        if ([v75 isEqualToString:v168])
                        {
                          long long v76 = [v171 objectForKeyedSubscript:v75];
                          long long v77 = [v76 objectForKeyedSubscript:@"OptInDateSinceReferenceDate"];
                          [v77 doubleValue];
                          double v79 = v78;

                          long long v80 = [v170 objectForKeyedSubscript:v74];
                          long long v81 = v80;
                          if (v80)
                          {
                            [v80 doubleValue];
                            if (v79 > v82) {
                              ++v162;
                            }
                          }
                        }
                      }
                      v70 = v164;
                      uint64_t v71 = [v164 countByEnumeratingWithState:&v179 objects:v217 count:16];
                    }
                    while (v71);
                  }
                  else
                  {
                    unint64_t v162 = 0;
                  }

                  if (v45 > v162) {
                    [v144 setObject:obj forKeyedSubscript:v168];
                  }
                }
                else
                {
                  [v144 setObject:obj forKeyedSubscript:v168];
                }
                uint64_t v83 = [obj allObjects];
                int v84 = [v83 count];
                int v85 = [v30 countForObject:@"Unknown"];

                uint64_t v86 = (v84 - v54 - v85);
                if ((int)v86 < 1)
                {
                  int v29 = 0;
                  ++v137;
                }
                else
                {
                  uint64_t v87 = NSNumber;
                  uint64_t v88 = [v141 objectForKeyedSubscript:v168];
                  uint64_t v89 = objc_msgSend(v87, "numberWithUnsignedInteger:", v45 + (int)objc_msgSend(v88, "intValue"));
                  [v141 setObject:v89 forKeyedSubscript:v168];

                  float v139 = v139 + (float)v45;
                  float v27 = v27 + (float)(int)v86;
                  if (v86 < 2)
                  {
                    int v29 = 0;
                    ++v136;
                  }
                  else
                  {
                    uint64_t v90 = [v156 countForObject:v168];
                    if ((int)MediaAnalysisLogLevel() >= 6)
                    {
                      uint64_t v91 = VCPLogInstance();
                      if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = v134;
                        v214 = @"[AutoCounter][P/R]";
                        __int16 v215 = 1024;
                        *(_DWORD *)v216 = v86;
                        *(_WORD *)&v216[4] = 2112;
                        *(void *)&v216[6] = v168;
                        *(_WORD *)&v216[14] = 2048;
                        *(void *)&v216[16] = v90;
                        *(_WORD *)&v216[24] = 2048;
                        *(double *)&v216[26] = (float)((float)v45 / (float)(int)v86);
                        _os_log_impl(&dword_1BBEDA000, v91, OS_LOG_TYPE_INFO, "%@ Precision for FaceGroup (of size %d) for personID %@ (of size %lu) is %f", buf, 0x30u);
                      }
                    }
                    uint64_t v92 = [v156 countForObject:v168];
                    *(float *)&double v93 = (float)v45 / (float)(int)v86;
                    [(VCPClusteringAccuracyMeasures *)v140 addClusterPrecision:v168 forPersonID:v45 personFaceCount:v86 validFaceCount:v92 identitySize:v93];
                    int v29 = 0;
                  }
                }
              }
            }
            if (v29 != 18)
            {
              if (v29) {
                break;
              }
            }
            ++v158;
          }
          int v25 = *((_DWORD *)v209 + 6);
          if (!v25)
          {
            if ((int)MediaAnalysisLogLevel() >= 6)
            {
              id v97 = VCPLogInstance();
              if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412802;
                v214 = @"[AutoCounter][P/R]";
                __int16 v215 = 2048;
                *(void *)v216 = v136;
                *(_WORD *)&v216[8] = 2048;
                *(void *)&v216[10] = v137;
                _os_log_impl(&dword_1BBEDA000, v97, OS_LOG_TYPE_INFO, "%@ Valid singleton count = %lu, invalid singleton count = %lu", buf, 0x20u);
              }
            }
            *(float *)&double v96 = (float)v136;
            [(VCPClusteringAccuracyMeasures *)v140 setNumSingletons:v96];
            *(float *)&double v98 = (float)v137;
            [(VCPClusteringAccuracyMeasures *)v140 setNumValidSingletons:v98];
            v177[0] = MEMORY[0x1E4F143A8];
            v177[1] = 3221225472;
            v177[2] = __212__VCPPhotosAutoCounterWorker__measureClusterWithClusterStateURL_groundTruthFaceCountPerPerson_groundTruthPersonInformation_groundTruthFaceToPerson_groundTruthAssetToFaces_measures_extendTimeoutBlock_cancelBlock___block_invoke_508;
            v177[3] = &unk_1E6298C90;
            v178 = @"[AutoCounter][P/R]";
            [v141 enumerateKeysAndObjectsUsingBlock:v177];
            v163 = [v156 allObjects];
            unint64_t v169 = 0;
            float v99 = 0.0;
            float v100 = 0.0;
            float v101 = 0.0;
            float v102 = 0.0;
            while (v169 < [v163 count])
            {
              id v165 = (id)MEMORY[0x1C186D320]();
              if (v161 && (((uint64_t (*)(void))v161[2])() & 1) != 0)
              {
                char v103 = 0;
                int v135 = -128;
              }
              else
              {
                if (v157) {
                  v157[2]();
                }
                long long v104 = [v163 objectAtIndexedSubscript:v169];
                unint64_t v159 = [v156 countForObject:v104];
                long long v105 = [v141 objectForKeyedSubscript:v104];
                unsigned int obja = [v105 unsignedIntValue];

                v106 = [v144 objectForKeyedSubscript:v104];
                long long v175 = 0u;
                long long v176 = 0u;
                long long v173 = 0u;
                long long v174 = 0u;
                v155 = v106;
                v107 = [v106 allObjects];
                unint64_t v108 = 0;
                uint64_t v109 = [v107 countByEnumeratingWithState:&v173 objects:v212 count:16];
                if (v109)
                {
                  uint64_t v110 = *(void *)v174;
                  do
                  {
                    for (uint64_t n = 0; n != v109; ++n)
                    {
                      if (*(void *)v174 != v110) {
                        objc_enumerationMutation(v107);
                      }
                      uint64_t v112 = *(void *)(*((void *)&v173 + 1) + 8 * n);
                      long long v113 = [v172 objectForKeyedSubscript:v112];
                      BOOL v114 = v113 == v104;

                      if (v114)
                      {
                        long long v115 = [v171 objectForKeyedSubscript:v104];
                        long long v116 = [v115 objectForKeyedSubscript:@"OptInDateSinceReferenceDate"];
                        [v116 doubleValue];
                        double v118 = v117;

                        v119 = [v170 objectForKeyedSubscript:v112];
                        v120 = v119;
                        if (v119)
                        {
                          [v119 doubleValue];
                          if (v118 > v121) {
                            ++v108;
                          }
                        }
                      }
                    }
                    uint64_t v109 = [v107 countByEnumeratingWithState:&v173 objects:v212 count:16];
                  }
                  while (v109);
                }

                if ((int)MediaAnalysisLogLevel() >= 6)
                {
                  v122 = VCPLogInstance();
                  if (os_log_type_enabled(v122, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138413058;
                    v214 = @"[AutoCounter][P/R]";
                    __int16 v215 = 2112;
                    *(void *)v216 = v104;
                    *(_WORD *)&v216[8] = 2048;
                    *(void *)&v216[10] = v159;
                    *(_WORD *)&v216[18] = 2048;
                    *(double *)&v216[20] = (float)((float)v108 / (float)v159);
                    _os_log_impl(&dword_1BBEDA000, v122, OS_LOG_TYPE_INFO, "%@ personID %@ Recall (of size %lu) is %f", buf, 0x2Au);
                  }
                }
                if ((int)MediaAnalysisLogLevel() >= 6)
                {
                  __int16 v124 = VCPLogInstance();
                  if (os_log_type_enabled(v124, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138413058;
                    v214 = @"[AutoCounter][P/R]";
                    __int16 v215 = 2112;
                    *(void *)v216 = v104;
                    *(_WORD *)&v216[8] = 2048;
                    *(void *)&v216[10] = obja;
                    *(_WORD *)&v216[18] = 2048;
                    *(double *)&v216[20] = (float)((float)v108 / (float)obja);
                    _os_log_impl(&dword_1BBEDA000, v124, OS_LOG_TYPE_INFO, "%@ personID %@ Recall (exclude detection miss) (of size %lu) is %f", buf, 0x2Au);
                  }
                }
                *(float *)&double v123 = (float)v108 / (float)v159;
                -[VCPClusteringAccuracyMeasures addIdentityRecallToGroundTruth:forPersonID:personFaceCount:identitySize:](v140, "addIdentityRecallToGroundTruth:forPersonID:personFaceCount:identitySize:", v104, v108, v123);
                *(float *)&double v125 = (float)v108 / (float)obja;
                [(VCPClusteringAccuracyMeasures *)v140 addIdentityRecallExcludeMissDetection:v104 forPersonID:v108 personFaceCount:obja identitySize:v125];

                float v102 = v102 + (float)v108;
                float v100 = v100 + (float)v108;
                float v101 = v101 + (float)v159;
                char v103 = 1;
                float v99 = v99 + (float)obja;
              }
              ++v169;
              if ((v103 & 1) == 0) {
                goto LABEL_162;
              }
            }
            if (v27 <= 0.0) {
              float v126 = 0.0;
            }
            else {
              float v126 = v139 / v27;
            }
            if (v101 <= 0.0) {
              float v127 = 0.0;
            }
            else {
              float v127 = v102 / v101;
            }
            if (v99 <= 0.0) {
              float v128 = 0.0;
            }
            else {
              float v128 = v100 / v99;
            }
            if ((int)MediaAnalysisLogLevel() >= 5)
            {
              uint64_t v129 = VCPLogInstance();
              if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138413058;
                v214 = @"[AutoCounter][P/R]";
                __int16 v215 = 2048;
                *(double *)v216 = v126;
                *(_WORD *)&v216[8] = 2048;
                *(double *)&v216[10] = v127;
                *(_WORD *)&v216[18] = 2048;
                *(double *)&v216[20] = v101;
                _os_log_impl(&dword_1BBEDA000, v129, OS_LOG_TYPE_DEFAULT, "%@ Weighted Precision: %f, Weighted Recall: %f (number of best face: %.0f)", buf, 0x2Au);
              }
            }
            if ((int)MediaAnalysisLogLevel() >= 5)
            {
              uint64_t v131 = VCPLogInstance();
              if (os_log_type_enabled(v131, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412802;
                v214 = @"[AutoCounter][P/R]";
                __int16 v215 = 2048;
                *(double *)v216 = v128;
                *(_WORD *)&v216[8] = 2048;
                *(double *)&v216[10] = v99;
                _os_log_impl(&dword_1BBEDA000, v131, OS_LOG_TYPE_DEFAULT, "%@ Weighted Recall (exclude detection miss): %f (number of best face: %.0f)", buf, 0x20u);
              }
            }
            *(float *)&double v130 = v127;
            [(VCPClusteringAccuracyMeasures *)v140 setWeightedAverageRecall:v130];
            *(float *)&double v132 = v126;
            [(VCPClusteringAccuracyMeasures *)v140 setWeightedAveragePrecision:v132];
            int v135 = 0;
            id *v145 = v140;
LABEL_162:

            int v25 = v135;
          }
        }
      }
      else
      {
        int v25 = -18;
      }
      _Block_object_dispose(&v208, 8);
      goto LABEL_165;
    }
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v94 = VCPLogInstance();
    if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v214 = @"[AutoCounter][P/R]";
      __int16 v215 = 2112;
      *(void *)v216 = v160;
      _os_log_impl(&dword_1BBEDA000, v94, OS_LOG_TYPE_ERROR, "%@ Fail to load cluster state file: %@", buf, 0x16u);
    }
    int v25 = -50;
    goto LABEL_166;
  }
  int v25 = -50;
LABEL_167:

  return v25;
}

void __212__VCPPhotosAutoCounterWorker__measureClusterWithClusterStateURL_groundTruthFaceCountPerPerson_groundTruthPersonInformation_groundTruthFaceToPerson_groundTruthAssetToFaces_measures_extendTimeoutBlock_cancelBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v10 = (void *)MEMORY[0x1C186D320]();
  uint64_t v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
  os_log_type_t v12 = v11;
  if (v11
    && ([v11 objectForKeyedSubscript:@"AddedDate"],
        uint32_t v13 = objc_claimAutoreleasedReturnValue(),
        v13,
        v13))
  {
    id v14 = [*(id *)(a1 + 48) objectForKeyedSubscript:v7];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __212__VCPPhotosAutoCounterWorker__measureClusterWithClusterStateURL_groundTruthFaceCountPerPerson_groundTruthPersonInformation_groundTruthFaceToPerson_groundTruthAssetToFaces_measures_extendTimeoutBlock_cancelBlock___block_invoke_483;
    v28[3] = &unk_1E629C060;
    id v39 = *(id *)(a1 + 104);
    uint64_t v41 = a4;
    long long v27 = *(_OWORD *)(a1 + 112);
    id v15 = (id)v27;
    long long v40 = v27;
    id v29 = *(id *)(a1 + 40);
    id v30 = v14;
    uint64_t v31 = *(void *)(a1 + 56);
    id v32 = v7;
    id v33 = v9;
    id v34 = *(id *)(a1 + 64);
    id v35 = *(id *)(a1 + 72);
    id v36 = *(id *)(a1 + 80);
    id v37 = *(id *)(a1 + 88);
    id v38 = v12;
    int v16 = v14;
    [v8 enumerateObjectsUsingBlock:v28];

    char v17 = 0;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() < 4)
    {
      char v17 = 1;
      goto LABEL_10;
    }
    int v16 = VCPLogInstance();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v44 = v18;
      __int16 v45 = 2112;
      id v46 = v7;
      _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_DEFAULT, "%@ Invalid information for asset %@ in cluster; ignore",
        buf,
        0x16u);
    }
    char v17 = 1;
  }

LABEL_10:
  if ((v17 & 1) == 0 && [(id)objc_opt_class() _dumpAssetsToFaces])
  {
    uint64_t v19 = objc_msgSend(MEMORY[0x1E4F38EC0], "vcp_fetchOptionsForLibrary:forTaskID:", *(void *)(*(void *)(a1 + 56) + 8), 3);
    __int16 v20 = (void *)MEMORY[0x1E4F38EC0];
    id v42 = v7;
    uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
    uint64_t v22 = [v20 fetchAssetsWithLocalIdentifiers:v21 options:v19];
    id v23 = [v22 firstObject];

    if (v23)
    {
      id v24 = *(void **)(a1 + 96);
      int v25 = [v23 originalFilename];
      [v24 setObject:v9 forKeyedSubscript:v25];
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 6) {
        goto LABEL_15;
      }
      int v25 = VCPLogInstance();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        uint64_t v26 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        uint64_t v44 = v26;
        __int16 v45 = 2112;
        id v46 = v7;
        _os_log_impl(&dword_1BBEDA000, v25, OS_LOG_TYPE_INFO, "%@ Cannot find asset for id %@", buf, 0x16u);
      }
    }

LABEL_15:
  }
}

void __212__VCPPhotosAutoCounterWorker__measureClusterWithClusterStateURL_groundTruthFaceCountPerPerson_groundTruthPersonInformation_groundTruthFaceToPerson_groundTruthAssetToFaces_measures_extendTimeoutBlock_cancelBlock___block_invoke_483(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = (void *)MEMORY[0x1C186D320]();
  uint64_t v8 = *(void *)(a1 + 112);
  if (!v8 || !(*(unsigned int (**)(void))(v8 + 16))())
  {
    uint64_t v9 = *(void *)(a1 + 120);
    if (v9) {
      (*(void (**)(void))(v9 + 16))();
    }
    uint64_t v52 = 0;
    double v53 = &v52;
    uint64_t v54 = 0x3032000000;
    uint64_t v55 = __Block_byref_object_copy__50;
    uint64_t v56 = __Block_byref_object_dispose__50;
    id v57 = [v6 objectForKeyedSubscript:@"faceID"];
    uint64_t v46 = 0;
    uint64_t v47 = &v46;
    uint64_t v48 = 0x3032000000;
    uint64_t v49 = __Block_byref_object_copy__50;
    unint64_t v50 = __Block_byref_object_dispose__50;
    id v51 = [v6 objectForKeyedSubscript:@"faceGroupID"];
    uint64_t v10 = [v6 objectForKeyedSubscript:@"personID"];
    uint64_t v11 = (void *)v10;
    if (v53[5] && v47[5] && v10)
    {
      os_log_type_t v12 = [v6 objectForKeyedSubscript:@"faceRect"];
      NSRect v65 = NSRectFromString(v12);
      CGFloat x = v65.origin.x;
      CGFloat y = v65.origin.y;
      CGFloat width = v65.size.width;
      CGFloat height = v65.size.height;

      v66.origin.CGFloat x = x;
      v66.origin.CGFloat y = y;
      v66.size.CGFloat width = width;
      v66.size.CGFloat height = height;
      if (!CGRectIsEmpty(v66))
      {
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          uint64_t v22 = VCPLogInstance();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v23 = *(void *)(a1 + 32);
            id v24 = (void *)v53[5];
            *(_DWORD *)buf = 138412802;
            uint64_t v59 = v23;
            __int16 v60 = 2112;
            id v61 = v24;
            __int16 v62 = 2112;
            double v63 = v11;
            _os_log_impl(&dword_1BBEDA000, v22, OS_LOG_TYPE_DEBUG, "%@ processing cluster state faceID: %@ forPersonID: %@", buf, 0x20u);
          }
        }
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __212__VCPPhotosAutoCounterWorker__measureClusterWithClusterStateURL_groundTruthFaceCountPerPerson_groundTruthPersonInformation_groundTruthFaceToPerson_groundTruthAssetToFaces_measures_extendTimeoutBlock_cancelBlock___block_invoke_484;
        v34[3] = &unk_1E629C038;
        long long v40 = &v52;
        int v25 = *(void **)(a1 + 40);
        uint64_t v26 = *(id *)(a1 + 32);
        uint64_t v27 = *(void *)(a1 + 48);
        long long v28 = *(void **)(a1 + 56);
        id v35 = v26;
        uint64_t v36 = v27;
        CGFloat v42 = x;
        CGFloat v43 = y;
        CGFloat v44 = width;
        CGFloat v45 = height;
        id v37 = v28;
        id v38 = v6;
        id v39 = *(id *)(a1 + 64);
        uint64_t v41 = &v46;
        [v25 enumerateObjectsUsingBlock:v34];
        id v29 = [*(id *)(a1 + 72) allKeys];
        char v30 = [v29 containsObject:v47[5]];

        if ((v30 & 1) == 0)
        {
          uint64_t v31 = [MEMORY[0x1E4F1CA80] set];
          [*(id *)(a1 + 72) setObject:v31 forKeyedSubscript:v47[5]];
        }
        id v32 = [*(id *)(a1 + 72) objectForKeyedSubscript:v47[5]];
        [v32 addObject:v53[5]];

        [*(id *)(a1 + 80) setObject:*(void *)(a1 + 56) forKeyedSubscript:v53[5]];
        [*(id *)(a1 + 88) setObject:v11 forKeyedSubscript:v53[5]];
        id v33 = [*(id *)(a1 + 104) objectForKeyedSubscript:@"AddedDate"];
        [*(id *)(a1 + 96) setObject:v33 forKeyedSubscript:v53[5]];

        char v17 = v35;
        goto LABEL_24;
      }
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        char v17 = VCPLogInstance();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v18 = *(void *)(a1 + 32);
          uint64_t v19 = (void *)v53[5];
          *(_DWORD *)buf = 138412546;
          uint64_t v59 = v18;
          __int16 v60 = 2112;
          id v61 = v19;
          __int16 v20 = "%@ Invalid face rectangle in cluster state for faceID:%@; ignore";
LABEL_16:
          _os_log_impl(&dword_1BBEDA000, v17, OS_LOG_TYPE_DEFAULT, v20, buf, 0x16u);
          goto LABEL_24;
        }
        goto LABEL_24;
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 4)
    {
      char v17 = VCPLogInstance();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        uint64_t v59 = v21;
        __int16 v60 = 2112;
        id v61 = v6;
        __int16 v20 = "%@ Invalid ID(s) in cluster: %@; ignore";
        goto LABEL_16;
      }
LABEL_24:
    }
    _Block_object_dispose(&v46, 8);

    _Block_object_dispose(&v52, 8);
    goto LABEL_26;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 128) + 8) + 24) = -128;
  *a4 = 1;
  **(unsigned char **)(a1 + 136) = 1;
LABEL_26:
}

void __212__VCPPhotosAutoCounterWorker__measureClusterWithClusterStateURL_groundTruthFaceCountPerPerson_groundTruthPersonInformation_groundTruthFaceToPerson_groundTruthAssetToFaces_measures_extendTimeoutBlock_cancelBlock___block_invoke_484(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = (void *)MEMORY[0x1C186D320]();
  uint64_t v8 = [v6 objectForKeyedSubscript:@"faceID"];
  uint64_t v9 = [v6 objectForKeyedSubscript:@"personID"];
  if ([*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) isEqualToString:v8])
  {
    *a4 = 1;
  }
  else
  {
    uint64_t v10 = [v6 objectForKeyedSubscript:@"faceRect"];
    NSRect v52 = NSRectFromString(v10);
    double x = v52.origin.x;
    double y = v52.origin.y;
    double width = v52.size.width;
    double height = v52.size.height;

    v53.origin.double x = x;
    v53.origin.double y = y;
    v53.size.double width = width;
    v53.size.double height = height;
    if (CGRectIsEmpty(v53))
    {
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        id v15 = VCPLogInstance();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v16 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138412546;
          uint64_t v38 = v16;
          __int16 v39 = 2112;
          long long v40 = v8;
          _os_log_impl(&dword_1BBEDA000, v15, OS_LOG_TYPE_DEFAULT, "%@ Invalid ground truth rect for faceID:%@", buf, 0x16u);
        }
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "_overlapRatioOf:with:", *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112), x, y, width, height);
      float v18 = v17;
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        uint64_t v19 = VCPLogInstance();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v20 = *(void *)(a1 + 32);
          id v32 = *(void **)(a1 + 48);
          os_log_t log = [*(id *)(a1 + 56) objectForKeyedSubscript:@"faceRect"];
          uint64_t v21 = [v6 objectForKeyedSubscript:@"faceRect"];
          *(_DWORD *)buf = 138413826;
          uint64_t v38 = v20;
          __int16 v39 = 2112;
          long long v40 = v32;
          __int16 v41 = 2048;
          double v42 = v18;
          __int16 v43 = 2112;
          os_log_t v44 = log;
          __int16 v45 = 2112;
          uint64_t v46 = v21;
          __int16 v47 = 2112;
          uint64_t v48 = v8;
          __int16 v49 = 2112;
          unint64_t v50 = v9;
          _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_DEBUG, "%@[%@] %.4f library: %@, gt: %@ (fid:%@, pid:%@)", buf, 0x48u);
        }
      }
      if (v18 > 0.3)
      {
        uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
        v35[0] = @"phFaceID";
        v35[1] = @"gtFaceID";
        v36[0] = v22;
        v36[1] = v8;
        v36[2] = v9;
        v35[2] = @"gtPersonID";
        v35[3] = @"centerX";
        uint64_t v23 = [NSNumber numberWithDouble:CGRectGetMidX(*(CGRect *)(a1 + 88))];
        v36[3] = v23;
        v35[4] = @"centerY";
        id v24 = [NSNumber numberWithDouble:CGRectGetMidY(*(CGRect *)(a1 + 88))];
        v36[4] = v24;
        v35[5] = @"size";
        int v25 = [NSNumber numberWithDouble:*(double *)(a1 + 104)];
        v36[5] = v25;
        uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:6];

        [*(id *)(a1 + 64) addObject:v26];
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          uint64_t v27 = VCPLogInstance();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            id v29 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
            double v30 = *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
            uint64_t v31 = *(void *)(a1 + 32);
            id v33 = [v6 objectForKeyedSubscript:@"faceID"];
            long long v28 = [v6 objectForKeyedSubscript:@"faceGroupID"];
            *(_DWORD *)buf = 138413314;
            uint64_t v38 = v31;
            __int16 v39 = 2112;
            long long v40 = v29;
            __int16 v41 = 2112;
            double v42 = v30;
            __int16 v43 = 2112;
            os_log_t v44 = v33;
            __int16 v45 = 2112;
            uint64_t v46 = v28;
            _os_log_impl(&dword_1BBEDA000, v27, OS_LOG_TYPE_DEBUG, "%@ Co-location mapping faceID:faceGroupID %@:%@ -> %@:%@", buf, 0x34u);
          }
        }
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v8);
        *a4 = 1;
      }
    }
  }
}

void __212__VCPPhotosAutoCounterWorker__measureClusterWithClusterStateURL_groundTruthFaceCountPerPerson_groundTruthPersonInformation_groundTruthFaceToPerson_groundTruthAssetToFaces_measures_extendTimeoutBlock_cancelBlock___block_invoke_508(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412802;
      uint64_t v10 = v8;
      __int16 v11 = 2112;
      id v12 = v5;
      __int16 v13 = 1024;
      int v14 = [v6 intValue];
      _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_INFO, "%@ Valid face count for person %@ is %d", (uint8_t *)&v9, 0x1Cu);
    }
  }
}

- (int)_measurePNPersonClusters:(id)a3 groundTruthFaceCountPerPerson:(id)a4 groundTruthPersonInformation:(id)a5 groundTruthFaceToPerson:(id)a6 groundTruthAssetToFaces:(id)a7 measures:(id *)a8 extendTimeoutBlock:(id)a9 cancelBlock:(id)a10
{
  v201[1] = *MEMORY[0x1E4F143B8];
  id v121 = a3;
  id v119 = a4;
  id v120 = a5;
  id v15 = a6;
  id v125 = a7;
  v138 = (void (**)(void))a9;
  v141 = (uint64_t (**)(void))a10;
  double v117 = a8;
  double v118 = v15;
  *a8 = 0;
  uint64_t v129 = [MEMORY[0x1E4F1CA60] dictionary];
  float v128 = [MEMORY[0x1E4F1CA60] dictionary];
  float v127 = [MEMORY[0x1E4F1CA60] dictionary];
  double v132 = objc_msgSend(MEMORY[0x1E4F38EC0], "vcp_fetchOptionsForLibrary:forTaskID:", self->_photoLibrary, 3);
  v201[0] = *MEMORY[0x1E4F39460];
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v201 count:1];
  [v132 addFetchPropertySets:v16];

  double v123 = [v121 allObjects];
  unint64_t v124 = 0;
  while (2)
  {
    if (v124 >= [v123 count])
    {
      uint64_t v86 = objc_alloc_init(VCPClusteringAccuracyMeasures);
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      LODWORD(v196) = 0;
      uint64_t v172 = 0;
      long long v173 = (float *)&v172;
      uint64_t v174 = 0x2020000000;
      LODWORD(v175) = 0;
      *(void *)long long v192 = 0;
      *(void *)&v192[8] = v192;
      *(void *)&v192[16] = 0x2020000000;
      long long v193 = 0;
      uint64_t v159 = 0;
      id v160 = (double *)&v159;
      uint64_t v161 = 0x2020000000;
      uint64_t v162 = 0;
      uint64_t v155 = 0;
      id v156 = &v155;
      uint64_t v157 = 0x2020000000;
      int v158 = 0;
      uint64_t v87 = [MEMORY[0x1E4F1CA60] dictionary];
      v142[0] = MEMORY[0x1E4F143A8];
      v142[1] = 3221225472;
      v142[2] = __202__VCPPhotosAutoCounterWorker__measurePNPersonClusters_groundTruthFaceCountPerPerson_groundTruthPersonInformation_groundTruthFaceToPerson_groundTruthAssetToFaces_measures_extendTimeoutBlock_cancelBlock___block_invoke_510;
      v142[3] = &unk_1E629C150;
      uint64_t v88 = v141;
      id v148 = v88;
      id v150 = &v155;
      unint64_t v137 = v138;
      id v149 = v137;
      id v143 = v120;
      id v144 = v127;
      id v140 = v87;
      id v145 = v140;
      v151 = buf;
      v152 = &v172;
      id v89 = v119;
      id v146 = v89;
      uint64_t v90 = v86;
      v147 = v90;
      v153 = v192;
      v154 = &v159;
      [v129 enumerateKeysAndObjectsUsingBlock:v142];
      int v108 = *((_DWORD *)v156 + 6);
      if (!v108)
      {
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          uint64_t v92 = VCPLogInstance();
          if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
          {
            double v93 = *(double *)(*(void *)&v192[8] + 24);
            double v94 = v160[3];
            *(_DWORD *)long long v186 = 134218240;
            double v187 = v93;
            __int16 v188 = 2048;
            double v189 = v94;
            _os_log_impl(&dword_1BBEDA000, v92, OS_LOG_TYPE_INFO, "[AutoCounter][P/R][PV] Valid singleton count = %lu, invalid singleton count = %lu", v186, 0x16u);
          }
        }
        *(float *)&double v91 = (float)*(unint64_t *)(*(void *)&v192[8] + 24);
        [(VCPClusteringAccuracyMeasures *)v90 setNumSingletons:v91];
        *(float *)&double v95 = (float)*((unint64_t *)v160 + 3);
        [(VCPClusteringAccuracyMeasures *)v90 setNumValidSingletons:v95];
        double v96 = [v89 allObjects];
        unint64_t v97 = 0;
        float v98 = 0.0;
        float v99 = 0.0;
        while (v97 < [v96 count])
        {
          float v100 = (void *)MEMORY[0x1C186D320]();
          if (v141 && (v141[2](v88) & 1) != 0)
          {
            char v101 = 0;
          }
          else
          {
            if (v138) {
              v138[2](v137);
            }
            double v102 = [v96 objectAtIndexedSubscript:v97];
            double v103 = COERCE_DOUBLE([v89 countForObject:*(void *)&v102]);
            long long v104 = [v140 objectForKeyedSubscript:*(void *)&v102];
            unsigned int v105 = [v104 unsignedIntValue];

            if ((int)MediaAnalysisLogLevel() >= 6)
            {
              v107 = VCPLogInstance();
              if (os_log_type_enabled(v107, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)long long v186 = 138412802;
                double v187 = v102;
                __int16 v188 = 2048;
                double v189 = v103;
                __int16 v190 = 2048;
                double v191 = (float)((float)v105 / (float)*(unint64_t *)&v103);
                _os_log_impl(&dword_1BBEDA000, v107, OS_LOG_TYPE_INFO, "[AutoCounter][P/R][PV] Recall for personID %@ (of size %lu) is %f", v186, 0x20u);
              }
            }
            *(float *)&double v106 = (float)v105 / (float)*(unint64_t *)&v103;
            [(VCPClusteringAccuracyMeasures *)v90 addIdentityRecallToGroundTruth:*(void *)&v102 forPersonID:v105 personFaceCount:*(void *)&v103 identitySize:v106];

            float v98 = v98 + (float)v105;
            float v99 = v99 + (float)*(unint64_t *)&v103;
            char v101 = 1;
          }
          ++v97;
          if ((v101 & 1) == 0)
          {
            int v108 = -128;
            goto LABEL_105;
          }
        }
        float v109 = v173[6];
        float v110 = 0.0;
        if (v109 > 0.0) {
          float v110 = *(float *)(*(void *)&buf[8] + 24) / v109;
        }
        *(float *)(*(void *)&buf[8] + 24) = v110;
        if (v99 <= 0.0) {
          float v111 = 0.0;
        }
        else {
          float v111 = v98 / v99;
        }
        if ((int)MediaAnalysisLogLevel() >= 5)
        {
          long long v113 = VCPLogInstance();
          if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
          {
            double v114 = *(float *)(*(void *)&buf[8] + 24);
            *(_DWORD *)long long v186 = 134218240;
            double v187 = v114;
            __int16 v188 = 2048;
            double v189 = v111;
            _os_log_impl(&dword_1BBEDA000, v113, OS_LOG_TYPE_DEFAULT, "[AutoCounter][P/R][PV] Weighted Precision: %f, Weighted Recall: %f", v186, 0x16u);
          }
        }
        *(float *)&double v112 = v111;
        [(VCPClusteringAccuracyMeasures *)v90 setWeightedAverageRecall:v112];
        LODWORD(v115) = *(_DWORD *)(*(void *)&buf[8] + 24);
        [(VCPClusteringAccuracyMeasures *)v90 setWeightedAveragePrecision:v115];
        int v108 = 0;
        id *v117 = v90;
LABEL_105:
      }
      _Block_object_dispose(&v155, 8);
      _Block_object_dispose(&v159, 8);
      _Block_object_dispose(v192, 8);
      _Block_object_dispose(&v172, 8);
      _Block_object_dispose(buf, 8);

      goto LABEL_107;
    }
    context = (void *)MEMORY[0x1C186D320]();
    uint64_t v133 = [v123 objectAtIndexedSubscript:v124];
    double v17 = [MEMORY[0x1E4F1CA60] dictionary];
    float v18 = [v133 localIdentifier];
    [v129 setObject:v17 forKeyedSubscript:v18];

    uint64_t v19 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v20 = [v133 fetchFaces];
    long long v184 = 0u;
    long long v185 = 0u;
    long long v182 = 0u;
    long long v183 = 0u;
    id v21 = v20;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v182 objects:v200 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v183;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v183 != v23) {
            objc_enumerationMutation(v21);
          }
          int v25 = *(void **)(*((void *)&v182 + 1) + 8 * i);
          uint64_t v26 = (void *)MEMORY[0x1C186D320]();
          uint64_t v27 = [v25 personLocalIdentifier];
          BOOL v28 = v27 == 0;

          if (!v28)
          {
            id v29 = [v25 personLocalIdentifier];
            [v19 addObject:v29];
          }
        }
        uint64_t v22 = [v21 countByEnumeratingWithState:&v182 objects:v200 count:16];
      }
      while (v22);
    }

    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      double v30 = VCPLogInstance();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v31 = [v133 localIdentifier];
        uint64_t v32 = [v21 count];
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v31;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v32;
        _os_log_impl(&dword_1BBEDA000, v30, OS_LOG_TYPE_DEBUG, "[AutoCounter][P/R][PV] Processing person cluster %@ with %lu faces", buf, 0x16u);
      }
    }
    long long v180 = 0u;
    long long v181 = 0u;
    long long v178 = 0u;
    long long v179 = 0u;
    id obj = v21;
    uint64_t v33 = [obj countByEnumeratingWithState:&v178 objects:v199 count:16];
    if (!v33) {
      goto LABEL_72;
    }
    uint64_t v135 = *(void *)v179;
    do
    {
      uint64_t v34 = 0;
      uint64_t v136 = v33;
      do
      {
        if (*(void *)v179 != v135) {
          objc_enumerationMutation(obj);
        }
        id v35 = *(void **)(*((void *)&v178 + 1) + 8 * v34);
        uint64_t v36 = (void *)MEMORY[0x1C186D320]();
        if (!v141 || (((uint64_t (*)(void))v141[2])() & 1) == 0)
        {
          if (v138) {
            ((void (*)(void))v138[2])();
          }
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          id v196 = __Block_byref_object_copy__50;
          v197 = __Block_byref_object_dispose__50;
          id v198 = [v35 personLocalIdentifier];
          uint64_t v172 = 0;
          long long v173 = (float *)&v172;
          uint64_t v174 = 0x3032000000;
          long long v175 = __Block_byref_object_copy__50;
          long long v176 = __Block_byref_object_dispose__50;
          id v177 = [v35 localIdentifier];
          if (*((void *)v173 + 5))
          {
            uint64_t v38 = (void *)MEMORY[0x1E4F38EC0];
            long long v194 = v35;
            __int16 v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v194 count:1];
            float v139 = [v38 fetchAssetsForFaces:v39 options:v132];

            if ([v139 count])
            {
              long long v40 = [v139 firstObject];
              __int16 v41 = [v40 cloudIdentifier];
              if (!v41)
              {
                if ((int)MediaAnalysisLogLevel() >= 6)
                {
                  double v42 = VCPLogInstance();
                  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
                  {
                    __int16 v43 = [v40 localIdentifier];
                    *(_DWORD *)long long v192 = 138412290;
                    *(void *)&v192[4] = v43;
                    _os_log_impl(&dword_1BBEDA000, v42, OS_LOG_TYPE_INFO, "[AutoCounter][P/R][PV] Asset without cloudIdentifier, use localIdentifier: %@", v192, 0xCu);
                  }
                }
                __int16 v41 = [v40 localIdentifier];
              }
              unint64_t v44 = [v40 pixelWidth];
              unint64_t v45 = [v40 pixelHeight];
              if (v44 <= v45) {
                unint64_t v46 = v45;
              }
              else {
                unint64_t v46 = v44;
              }
              [v35 centerX];
              double v48 = v47;
              unint64_t v49 = [v40 pixelWidth];
              [v35 centerY];
              double v51 = v50;
              unint64_t v52 = [v40 pixelHeight];
              [v35 size];
              double v54 = v53;
              [v35 size];
              double v55 = v48 * (double)v49;
              double v56 = v51 * (double)v52;
              double v57 = v54 * (double)v46;
              double v59 = v58 * (double)v46;
              v202.origin.double x = v55;
              v202.origin.double y = v56;
              v202.size.double width = v57;
              v202.size.double height = v59;
              if (CGRectIsEmpty(v202))
              {
                if ((int)MediaAnalysisLogLevel() >= 4)
                {
                  __int16 v60 = VCPLogInstance();
                  double v130 = v60;
                  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
                  {
                    uint64_t v61 = *((void *)v173 + 5);
                    *(_DWORD *)long long v192 = 138412290;
                    *(void *)&v192[4] = v61;
                    _os_log_impl(&dword_1BBEDA000, v60, OS_LOG_TYPE_DEFAULT, "[AutoCounter][P/R][PV] Invalid face rectangle in person cluster state for face: %@; ignore",
                      v192,
                      0xCu);
                  }
                  int v37 = 10;
                  goto LABEL_59;
                }
                int v37 = 10;
              }
              else
              {
                if ((int)MediaAnalysisLogLevel() >= 7)
                {
                  uint64_t v64 = VCPLogInstance();
                  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
                  {
                    uint64_t v131 = v41;
                    uint64_t v65 = *((void *)v173 + 5);
                    CGRect v66 = [v35 personLocalIdentifier];
                    uint64_t v67 = [v133 localIdentifier];
                    *(_DWORD *)long long v192 = 138412802;
                    *(void *)&v192[4] = v65;
                    *(_WORD *)&v192[12] = 2112;
                    *(void *)&v192[14] = v66;
                    *(_WORD *)&v192[22] = 2112;
                    long long v193 = v67;
                    _os_log_impl(&dword_1BBEDA000, v64, OS_LOG_TYPE_DEBUG, "[AutoCounter][P/R][PV] processing person cluster faceID: %@ for PersonID: %@ and clusterID: %@", v192, 0x20u);

                    __int16 v41 = v131;
                  }
                }
                uint64_t v68 = [v125 objectForKeyedSubscript:v41];
                v163[0] = MEMORY[0x1E4F143A8];
                v163[1] = 3221225472;
                v163[2] = __202__VCPPhotosAutoCounterWorker__measurePNPersonClusters_groundTruthFaceCountPerPerson_groundTruthPersonInformation_groundTruthFaceToPerson_groundTruthAssetToFaces_measures_extendTimeoutBlock_cancelBlock___block_invoke;
                v163[3] = &unk_1E629C0B0;
                v166 = &v172;
                id v69 = v19;
                v167 = buf;
                id v164 = v69;
                id v165 = self;
                double v168 = v55;
                double v169 = v56;
                double v170 = v57;
                double v171 = v59;
                double v130 = (void *)v68;
                [(id)v68 enumerateObjectsUsingBlock:v163];
                v70 = [v133 localIdentifier];
                uint64_t v71 = [v129 objectForKeyedSubscript:v70];
                uint64_t v72 = [v71 allKeys];
                LOBYTE(v68) = [v72 containsObject:*(void *)(*(void *)&buf[8] + 40)];

                if ((v68 & 1) == 0)
                {
                  int v73 = [MEMORY[0x1E4F1CA80] set];
                  uint64_t v74 = [v133 localIdentifier];
                  long long v75 = [v129 objectForKeyedSubscript:v74];
                  [v75 setObject:v73 forKeyedSubscript:*(void *)(*(void *)&buf[8] + 40)];
                }
                uint64_t v76 = [v133 localIdentifier];
                long long v77 = [v129 objectForKeyedSubscript:v76];
                double v78 = [v77 objectForKeyedSubscript:*(void *)(*(void *)&buf[8] + 40)];
                [v78 addObject:*((void *)v173 + 5)];

                double v79 = [v128 allKeys];
                LOBYTE(v76) = [v79 containsObject:*(void *)(*(void *)&buf[8] + 40)];

                if ((v76 & 1) == 0)
                {
                  long long v80 = [MEMORY[0x1E4F1CA80] set];
                  [v128 setObject:v80 forKeyedSubscript:*(void *)(*(void *)&buf[8] + 40)];
                }
                long long v81 = [v128 objectForKeyedSubscript:*(void *)(*(void *)&buf[8] + 40)];
                [v81 addObject:v41];

                double v82 = NSNumber;
                uint64_t v83 = [v40 curationProperties];
                int v84 = [v83 addedDate];
                [v84 timeIntervalSinceReferenceDate];
                int v85 = objc_msgSend(v82, "numberWithDouble:");
                [v127 setObject:v85 forKeyedSubscript:*((void *)v173 + 5)];

                int v37 = 0;
LABEL_59:
              }
LABEL_64:
            }
            else
            {
              if ((int)MediaAnalysisLogLevel() >= 4)
              {
                long long v40 = VCPLogInstance();
                if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v63 = *((void *)v173 + 5);
                  *(_DWORD *)long long v192 = 138412290;
                  *(void *)&v192[4] = v63;
                  _os_log_impl(&dword_1BBEDA000, v40, OS_LOG_TYPE_DEFAULT, "[AutoCounter][P/R][PV] Failed to fetch asset for face %@; ignore",
                    v192,
                    0xCu);
                }
                int v37 = 10;
                goto LABEL_64;
              }
              int v37 = 10;
            }
            __int16 v62 = v139;
LABEL_66:
          }
          else
          {
            if ((int)MediaAnalysisLogLevel() >= 4)
            {
              __int16 v62 = VCPLogInstance();
              if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)long long v192 = 138412290;
                *(void *)&v192[4] = v35;
                _os_log_impl(&dword_1BBEDA000, v62, OS_LOG_TYPE_DEFAULT, "[AutoCounter][P/R][PV] Invalid faceID in person cluster: %@; ignore",
                  v192,
                  0xCu);
              }
              int v37 = 10;
              goto LABEL_66;
            }
            int v37 = 10;
          }
          _Block_object_dispose(&v172, 8);

          _Block_object_dispose(buf, 8);
          goto LABEL_68;
        }
        int v37 = 1;
LABEL_68:
        if (v37 != 10 && v37) {
          goto LABEL_73;
        }
        ++v34;
      }
      while (v136 != v34);
      uint64_t v33 = [obj countByEnumeratingWithState:&v178 objects:v199 count:16];
    }
    while (v33);
LABEL_72:
    int v37 = 0;
LABEL_73:

    if (!v37)
    {
      ++v124;
      continue;
    }
    break;
  }
  int v108 = -128;
LABEL_107:

  return v108;
}

void __202__VCPPhotosAutoCounterWorker__measurePNPersonClusters_groundTruthFaceCountPerPerson_groundTruthPersonInformation_groundTruthFaceToPerson_groundTruthAssetToFaces_measures_extendTimeoutBlock_cancelBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = [v6 objectForKeyedSubscript:@"faceID"];
  uint64_t v8 = [v6 objectForKeyedSubscript:@"personID"];
  if ([v7 isEqualToString:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)])
  {
    if ([*(id *)(a1 + 32) containsObject:v8])
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        int v9 = VCPLogInstance();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
          uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
          int v27 = 138413058;
          BOOL v28 = v10;
          __int16 v29 = 2112;
          uint64_t v30 = v11;
          __int16 v31 = 2112;
          uint64_t v32 = v7;
          __int16 v33 = 2112;
          uint64_t v34 = v8;
          _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_DEBUG, "[AutoCounter][P/R][PV] Valid faceID mapping faceID:personID %@:%@ -> %@:%@", (uint8_t *)&v27, 0x2Au);
        }
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v8);
LABEL_8:
      *a4 = 1;
      goto LABEL_29;
    }
    if ((int)MediaAnalysisLogLevel() < 7) {
      goto LABEL_29;
    }
    float v18 = VCPLogInstance();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v19 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      uint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      int v27 = 138413058;
      BOOL v28 = v19;
      __int16 v29 = 2112;
      uint64_t v30 = v20;
      __int16 v31 = 2112;
      uint64_t v32 = v7;
      __int16 v33 = 2112;
      uint64_t v34 = v8;
      _os_log_impl(&dword_1BBEDA000, v18, OS_LOG_TYPE_DEBUG, "[AutoCounter][P/R][PV] Invalid faceID mapping faceID:faceGroupID %@:%@ -> %@:%@", (uint8_t *)&v27, 0x2Au);
    }
    goto LABEL_28;
  }
  id v12 = [v6 objectForKeyedSubscript:@"faceRect"];
  NSRect v36 = NSRectFromString(v12);
  double x = v36.origin.x;
  double y = v36.origin.y;
  double width = v36.size.width;
  double height = v36.size.height;

  v37.origin.double x = x;
  v37.origin.double y = y;
  v37.size.double width = width;
  v37.size.double height = height;
  if (!CGRectIsEmpty(v37))
  {
    objc_msgSend(*(id *)(a1 + 40), "_overlapRatioOf:with:", *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), x, y, width, height);
    if (v21 <= 0.8) {
      goto LABEL_29;
    }
    if ([*(id *)(a1 + 32) containsObject:v8])
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        uint64_t v22 = VCPLogInstance();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v23 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
          uint64_t v24 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
          int v27 = 138413058;
          BOOL v28 = v23;
          __int16 v29 = 2112;
          uint64_t v30 = v24;
          __int16 v31 = 2112;
          uint64_t v32 = v7;
          __int16 v33 = 2112;
          uint64_t v34 = v8;
          _os_log_impl(&dword_1BBEDA000, v22, OS_LOG_TYPE_DEBUG, "[AutoCounter][P/R][PV] Valid co-locate mapping faceID:personID %@:%@ -> %@:%@", (uint8_t *)&v27, 0x2Au);
        }
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v7);
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v8);
      goto LABEL_8;
    }
    if ((int)MediaAnalysisLogLevel() < 7) {
      goto LABEL_29;
    }
    float v18 = VCPLogInstance();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      int v25 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      uint64_t v26 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      int v27 = 138413058;
      BOOL v28 = v25;
      __int16 v29 = 2112;
      uint64_t v30 = v26;
      __int16 v31 = 2112;
      uint64_t v32 = v7;
      __int16 v33 = 2112;
      uint64_t v34 = v8;
      _os_log_impl(&dword_1BBEDA000, v18, OS_LOG_TYPE_DEBUG, "[AutoCounter][P/R][PV] Invalid co-location mapping faceID:faceGroupID %@:%@ -> %@:%@", (uint8_t *)&v27, 0x2Au);
    }
LABEL_28:

    goto LABEL_29;
  }
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    double v17 = VCPLogInstance();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v27 = 138412290;
      BOOL v28 = v7;
      _os_log_impl(&dword_1BBEDA000, v17, OS_LOG_TYPE_INFO, "[AutoCounter][P/R][PV] Invalid ground truth face rectangle for faceID:%@", (uint8_t *)&v27, 0xCu);
    }
  }
LABEL_29:
}

void __202__VCPPhotosAutoCounterWorker__measurePNPersonClusters_groundTruthFaceCountPerPerson_groundTruthPersonInformation_groundTruthFaceToPerson_groundTruthAssetToFaces_measures_extendTimeoutBlock_cancelBlock___block_invoke_510(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  int v9 = (void *)MEMORY[0x1C186D320]();
  uint64_t v10 = *(void *)(a1 + 72);
  if (!v10 || !(*(unsigned int (**)(void))(v10 + 16))())
  {
    uint64_t v11 = *(void *)(a1 + 80);
    if (v11) {
      (*(void (**)(void))(v11 + 16))();
    }
    uint64_t v66 = 0;
    uint64_t v67 = &v66;
    uint64_t v68 = 0x3032000000;
    id v69 = __Block_byref_object_copy__50;
    v70 = __Block_byref_object_dispose__50;
    id v71 = 0;
    uint64_t v62 = 0;
    uint64_t v63 = &v62;
    uint64_t v64 = 0x2020000000;
    uint64_t v65 = 0;
    uint64_t v58 = 0;
    double v59 = &v58;
    uint64_t v60 = 0x2020000000;
    uint64_t v61 = 0;
    uint64_t v54 = 0;
    double v55 = &v54;
    uint64_t v56 = 0x2020000000;
    uint64_t v57 = 0;
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __202__VCPPhotosAutoCounterWorker__measurePNPersonClusters_groundTruthFaceCountPerPerson_groundTruthPersonInformation_groundTruthFaceToPerson_groundTruthAssetToFaces_measures_extendTimeoutBlock_cancelBlock___block_invoke_2;
    v47[3] = &unk_1E629C100;
    double v50 = &v62;
    id v48 = *(id *)(a1 + 32);
    double v51 = &v54;
    id v49 = *(id *)(a1 + 40);
    unint64_t v52 = &v58;
    double v53 = &v66;
    [v8 enumerateKeysAndObjectsUsingBlock:v47];
    id v12 = [*(id *)(a1 + 32) objectForKeyedSubscript:v67[5]];
    __int16 v13 = [v12 objectForKeyedSubscript:@"OptInDateSinceReferenceDate"];
    int v14 = v13;
    if (!v67[5] || !v13) {
      goto LABEL_22;
    }
    [v13 doubleValue];
    uint64_t v16 = v15;
    uint64_t v43 = 0;
    unint64_t v44 = &v43;
    uint64_t v45 = 0x2020000000;
    uint64_t v46 = 0;
    uint64_t v35 = MEMORY[0x1E4F143A8];
    uint64_t v36 = 3221225472;
    CGRect v37 = __202__VCPPhotosAutoCounterWorker__measurePNPersonClusters_groundTruthFaceCountPerPerson_groundTruthPersonInformation_groundTruthFaceToPerson_groundTruthAssetToFaces_measures_extendTimeoutBlock_cancelBlock___block_invoke_4;
    uint64_t v38 = &unk_1E629C128;
    id v17 = *(id *)(a1 + 32);
    uint64_t v42 = v16;
    id v39 = v17;
    __int16 v41 = &v43;
    id v40 = *(id *)(a1 + 40);
    [v8 enumerateKeysAndObjectsUsingBlock:&v35];
    float v18 = objc_msgSend(*(id *)(a1 + 48), "allKeys", v35, v36, v37, v38);
    int v19 = [v18 containsObject:v67[5]];

    if (!v19
      || (unint64_t v20 = v59[3],
          [*(id *)(a1 + 48) objectForKeyedSubscript:v67[5]],
          double v21 = objc_claimAutoreleasedReturnValue(),
          LODWORD(v20) = v20 > [v21 unsignedIntValue],
          v21,
          v20))
    {
      uint64_t v22 = [NSNumber numberWithUnsignedInteger:v59[3]];
      [*(id *)(a1 + 48) setObject:v22 forKeyedSubscript:v67[5]];
    }
    uint64_t v23 = (*((_DWORD *)v63 + 6) - (*((_DWORD *)v55 + 6) + *((_DWORD *)v44 + 6)));
    if ((int)v23 < 1)
    {
      uint64_t v25 = *(void *)(a1 + 120);
    }
    else
    {
      float v24 = (float)(unint64_t)v59[3];
      *(float *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = *(float *)(*(void *)(*(void *)(a1 + 96) + 8)
                                                                            + 24)
                                                                 + v24;
      *(float *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = *(float *)(*(void *)(*(void *)(a1 + 104) + 8)
                                                                             + 24)
                                                                  + (float)(int)v23;
      if (v23 != 1)
      {
        float v26 = v24 / (float)(int)v23;
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          int v27 = VCPLogInstance();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            uint64_t v28 = v67[5];
            uint64_t v29 = [*(id *)(a1 + 56) countForObject:v28];
            *(_DWORD *)buf = 67109890;
            int v73 = v23;
            __int16 v74 = 2112;
            uint64_t v75 = v28;
            __int16 v76 = 2048;
            uint64_t v77 = v29;
            __int16 v78 = 2048;
            double v79 = v26;
            _os_log_impl(&dword_1BBEDA000, v27, OS_LOG_TYPE_INFO, "[AutoCounter][P/R][PV] Precision for cluster (of size %d) for personID %@ (of size %lu) is %f", buf, 0x26u);
          }
        }
        uint64_t v30 = v67[5];
        uint64_t v31 = v59[3];
        uint64_t v32 = *(void **)(a1 + 64);
        uint64_t v33 = [*(id *)(a1 + 56) countForObject:v30];
        *(float *)&double v34 = v26;
        [v32 addClusterPrecision:v30 forPersonID:v31 personFaceCount:v23 validFaceCount:v33 identitySize:v34];
        goto LABEL_21;
      }
      uint64_t v25 = *(void *)(a1 + 112);
    }
    ++*(void *)(*(void *)(v25 + 8) + 24);
LABEL_21:

    _Block_object_dispose(&v43, 8);
LABEL_22:

    _Block_object_dispose(&v54, 8);
    _Block_object_dispose(&v58, 8);
    _Block_object_dispose(&v62, 8);
    _Block_object_dispose(&v66, 8);

    goto LABEL_23;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = -128;
  *a4 = 1;
LABEL_23:
}

void __202__VCPPhotosAutoCounterWorker__measurePNPersonClusters_groundTruthFaceCountPerPerson_groundTruthPersonInformation_groundTruthFaceToPerson_groundTruthAssetToFaces_measures_extendTimeoutBlock_cancelBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  id v8 = (void *)MEMORY[0x1C186D320]();
  int v9 = [v7 allObjects];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += [v9 count];

  uint64_t v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
  uint64_t v11 = [v10 objectForKeyedSubscript:@"OptInDateSinceReferenceDate"];
  id v12 = v11;
  if (v11)
  {
    [v11 doubleValue];
    uint64_t v14 = v13;
    uint64_t v23 = 0;
    float v24 = &v23;
    uint64_t v25 = 0x2020000000;
    uint64_t v26 = 0;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    void v19[2] = __202__VCPPhotosAutoCounterWorker__measurePNPersonClusters_groundTruthFaceCountPerPerson_groundTruthPersonInformation_groundTruthFaceToPerson_groundTruthAssetToFaces_measures_extendTimeoutBlock_cancelBlock___block_invoke_3;
    v19[3] = &unk_1E629C0D8;
    id v15 = *(id *)(a1 + 40);
    uint64_t v22 = v14;
    id v20 = v15;
    double v21 = &v23;
    [v7 enumerateObjectsUsingBlock:v19];
    unint64_t v16 = v24[3];
    uint64_t v17 = *(void *)(*(void *)(a1 + 64) + 8);
    if (v16 > *(void *)(v17 + 24))
    {
      *(void *)(v17 + 24) = v16;
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), a2);
    }

    _Block_object_dispose(&v23, 8);
  }
  else
  {
    float v18 = [v7 allObjects];
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += [v18 count];
  }
}

void __202__VCPPhotosAutoCounterWorker__measurePNPersonClusters_groundTruthFaceCountPerPerson_groundTruthPersonInformation_groundTruthFaceToPerson_groundTruthAssetToFaces_measures_extendTimeoutBlock_cancelBlock___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  [v3 doubleValue];
  double v5 = v4;

  if (v5 < *(double *)(a1 + 48)) {
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
}

void __202__VCPPhotosAutoCounterWorker__measurePNPersonClusters_groundTruthFaceCountPerPerson_groundTruthPersonInformation_groundTruthFaceToPerson_groundTruthAssetToFaces_measures_extendTimeoutBlock_cancelBlock___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1C186D320]();
  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  id v8 = [v7 objectForKeyedSubscript:@"OptInDateSinceReferenceDate"];
  int v9 = v8;
  if (v8)
  {
    [v8 doubleValue];
    if (v10 <= *(double *)(a1 + 56) + 21600.0)
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __202__VCPPhotosAutoCounterWorker__measurePNPersonClusters_groundTruthFaceCountPerPerson_groundTruthPersonInformation_groundTruthFaceToPerson_groundTruthAssetToFaces_measures_extendTimeoutBlock_cancelBlock___block_invoke_5;
      v14[3] = &unk_1E629C0D8;
      id v12 = *(id *)(a1 + 40);
      uint64_t v17 = *(void *)(a1 + 56);
      uint64_t v13 = *(void *)(a1 + 48);
      id v15 = v12;
      uint64_t v16 = v13;
      [v5 enumerateObjectsUsingBlock:v14];
    }
    else
    {
      uint64_t v11 = [v5 allObjects];
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += [v11 count];
    }
  }
}

void __202__VCPPhotosAutoCounterWorker__measurePNPersonClusters_groundTruthFaceCountPerPerson_groundTruthPersonInformation_groundTruthFaceToPerson_groundTruthAssetToFaces_measures_extendTimeoutBlock_cancelBlock___block_invoke_5(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  [v4 doubleValue];
  if (v3 > *(double *)(a1 + 48)) {
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
}

- (int)_reportCoreAnalyticsWithVisionClusterMeasure:(id)a3 personClusterMeasure:(id)a4 personClusters:(id)a5 andGroundTruthInformation:(id)a6
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v35 = a3;
  id v36 = a4;
  id v37 = a5;
  id v39 = a6;
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    double v10 = VCPLogInstance();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      double v53 = @"[AutoCounter][CA]";
      _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_DEBUG, "%@ Collecting data ...", buf, 0xCu);
    }
  }
  uint64_t v33 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F38EC0], "vcp_fetchOptionsForLibrary:forTaskID:", self->_photoLibrary, 3);
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __137__VCPPhotosAutoCounterWorker__reportCoreAnalyticsWithVisionClusterMeasure_personClusterMeasure_personClusters_andGroundTruthInformation___block_invoke;
  v44[3] = &unk_1E629C1F0;
  id v12 = v35;
  id v45 = v12;
  id v13 = v36;
  id v46 = v13;
  double v47 = self;
  id v14 = v37;
  id v48 = v14;
  id v34 = v11;
  id v49 = v34;
  id v15 = v33;
  id v50 = v15;
  double v51 = @"[AutoCounter][CA]";
  [v39 enumerateKeysAndObjectsUsingBlock:v44];
  uint64_t v38 = [NSString stringWithFormat:@"%@_Ver%d_Detector%lu_Printer%lu_MAD%lu_VU%lu_PhotosPerson%lu.plist", @"AutoCounterCoreAnalytics", -[PHPhotoLibrary mad_faceProcessingInternalVersion](self->_photoLibrary, "mad_faceProcessingInternalVersion"), self->_detectionVersion, self->_recognitionVersion, self->_madVersion, self->_vuVersion, self->_personClusterVersion];
  uint64_t v16 = [(PHPhotoLibrary *)self->_photoLibrary vcp_visionCacheStorageDirectoryURL];
  uint64_t v17 = [v16 URLByAppendingPathComponent:v38];

  if (v17)
  {
    id v43 = 0;
    int v18 = [v15 writeToURL:v17 error:&v43];
    int v19 = v43;
    if (!v18)
    {
      if ((int)MediaAnalysisLogLevel() < 4)
      {
        int v26 = -20;
LABEL_44:

        goto LABEL_45;
      }
      double v21 = VCPLogInstance();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        double v53 = @"[AutoCounter][CA]";
        __int16 v54 = 2112;
        double v55 = v17;
        __int16 v56 = 2112;
        uint64_t v57 = v19;
        _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_DEFAULT, "%@ Cannot write CoreAnalytics to %@ - %@", buf, 0x20u);
      }
      int v26 = -20;
LABEL_43:

      goto LABEL_44;
    }
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      id v20 = VCPLogInstance();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        double v53 = @"[AutoCounter][CA]";
        __int16 v54 = 2112;
        double v55 = v17;
        _os_log_impl(&dword_1BBEDA000, v20, OS_LOG_TYPE_DEFAULT, "%@ Saved CoreAnalytics to %@", buf, 0x16u);
      }
    }
    double v21 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v22 = [(PHPhotoLibrary *)self->_photoLibrary vcp_visionCacheStorageDirectoryURL];
    uint64_t v42 = v19;
    uint64_t v32 = [v21 contentsOfDirectoryAtURL:v22 includingPropertiesForKeys:0 options:1 error:&v42];
    uint64_t v23 = v42;

    if (v23)
    {
      if ((int)MediaAnalysisLogLevel() < 4)
      {
        int v26 = -19;
LABEL_42:

        int v19 = v23;
        goto LABEL_43;
      }
      float v24 = VCPLogInstance();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        double v53 = @"[AutoCounter][CA]";
        __int16 v54 = 2112;
        double v55 = v23;
        uint64_t v25 = v24;
        _os_log_impl(&dword_1BBEDA000, v24, OS_LOG_TYPE_DEFAULT, "%@ Cannot retrieve CoreAnalytics files %@", buf, 0x16u);
      }
      else
      {
        uint64_t v25 = v24;
      }
      int v26 = -19;
    }
    else
    {
      uint64_t v25 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self.lastPathComponent BEGINSWITH %@", @"AutoCounterCoreAnalytics"];
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        int v27 = VCPLogInstance();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          double v53 = @"[AutoCounter][CA]";
          __int16 v54 = 2112;
          double v55 = v32;
          _os_log_impl(&dword_1BBEDA000, v27, OS_LOG_TYPE_DEBUG, "%@ Files in folder %@", buf, 0x16u);
        }
      }
      uint64_t v28 = [v32 filteredArrayUsingPredicate:v25];
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        uint64_t v29 = VCPLogInstance();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          double v53 = @"[AutoCounter][CA]";
          __int16 v54 = 2112;
          double v55 = v28;
          _os_log_impl(&dword_1BBEDA000, v29, OS_LOG_TYPE_DEBUG, "%@ Report CoreAnalytics files: %@", buf, 0x16u);
        }
      }
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __137__VCPPhotosAutoCounterWorker__reportCoreAnalyticsWithVisionClusterMeasure_personClusterMeasure_personClusters_andGroundTruthInformation___block_invoke_624;
      v40[3] = &unk_1E629C240;
      __int16 v41 = @"[AutoCounter][CA]";
      [v28 enumerateObjectsUsingBlock:v40];
      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        uint64_t v30 = VCPLogInstance();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          double v53 = @"[AutoCounter][CA]";
          __int16 v54 = 2112;
          double v55 = v28;
          _os_log_impl(&dword_1BBEDA000, v30, OS_LOG_TYPE_DEFAULT, "%@ Finished reporting CoreAnalytics %@", buf, 0x16u);
        }
      }
      int v26 = 0;
    }

    goto LABEL_42;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    int v19 = VCPLogInstance();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      double v53 = @"[AutoCounter][CA]";
      _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_ERROR, "%@ Failed to retrive CoreAnalytics export URL", buf, 0xCu);
    }
    int v26 = -18;
    goto LABEL_44;
  }
  int v26 = -18;
LABEL_45:

  return v26;
}

void __137__VCPPhotosAutoCounterWorker__reportCoreAnalyticsWithVisionClusterMeasure_personClusterMeasure_personClusters_andGroundTruthInformation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v116[26] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v67 = a3;
  uint64_t v107 = 0;
  int v108 = &v107;
  uint64_t v109 = 0x2020000000;
  uint64_t v110 = 0;
  uint64_t v103 = 0;
  long long v104 = &v103;
  uint64_t v105 = 0x2020000000;
  uint64_t v106 = 0;
  uint64_t v99 = 0;
  float v100 = &v99;
  uint64_t v101 = 0x2020000000;
  uint64_t v102 = 0;
  id v6 = [*(id *)(a1 + 32) precisionPerCluster];
  v94[0] = MEMORY[0x1E4F143A8];
  v94[1] = 3221225472;
  v94[2] = __137__VCPPhotosAutoCounterWorker__reportCoreAnalyticsWithVisionClusterMeasure_personClusterMeasure_personClusters_andGroundTruthInformation___block_invoke_2;
  v94[3] = &unk_1E629C178;
  id v7 = v5;
  id v95 = v7;
  double v96 = &v107;
  unint64_t v97 = &v103;
  float v98 = &v99;
  [v6 enumerateObjectsUsingBlock:v94];

  uint64_t v90 = 0;
  double v91 = &v90;
  uint64_t v92 = 0x2020000000;
  uint64_t v93 = 0;
  uint64_t v86 = 0;
  uint64_t v87 = &v86;
  uint64_t v88 = 0x2020000000;
  uint64_t v89 = 0;
  id v8 = [*(id *)(a1 + 40) precisionPerCluster];
  v82[0] = MEMORY[0x1E4F143A8];
  v82[1] = 3221225472;
  v82[2] = __137__VCPPhotosAutoCounterWorker__reportCoreAnalyticsWithVisionClusterMeasure_personClusterMeasure_personClusters_andGroundTruthInformation___block_invoke_3;
  v82[3] = &unk_1E629C1A0;
  id v9 = v7;
  id v83 = v9;
  int v84 = &v90;
  int v85 = &v86;
  [v8 enumerateObjectsUsingBlock:v82];

  uint64_t v78 = 0;
  double v79 = (double *)&v78;
  uint64_t v80 = 0x2020000000;
  uint64_t v81 = 0;
  double v10 = [*(id *)(a1 + 32) recallPerPersonToGroundTruth];
  v75[0] = MEMORY[0x1E4F143A8];
  v75[1] = 3221225472;
  v75[2] = __137__VCPPhotosAutoCounterWorker__reportCoreAnalyticsWithVisionClusterMeasure_personClusterMeasure_personClusters_andGroundTruthInformation___block_invoke_4;
  v75[3] = &unk_1E629C1C8;
  id v11 = v9;
  id v76 = v11;
  uint64_t v77 = &v78;
  [v10 enumerateObjectsUsingBlock:v75];

  uint64_t v71 = 0;
  uint64_t v72 = (double *)&v71;
  uint64_t v73 = 0x2020000000;
  uint64_t v74 = 0;
  id v12 = [*(id *)(a1 + 40) recallPerPersonToGroundTruth];
  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v68[2] = __137__VCPPhotosAutoCounterWorker__reportCoreAnalyticsWithVisionClusterMeasure_personClusterMeasure_personClusters_andGroundTruthInformation___block_invoke_5;
  v68[3] = &unk_1E629C1C8;
  id v66 = v11;
  id v69 = v66;
  v70 = &v71;
  [v12 enumerateObjectsUsingBlock:v68];

  uint64_t v65 = objc_msgSend(NSString, "stringWithFormat:", @"nightly-Ver%d_Detector%lu_Printer%lu_MAD%lu_VU%lu_PhotosPerson%lu", objc_msgSend(*(id *)(*(void *)(a1 + 48) + 8), "mad_faceProcessingInternalVersion"), *(void *)(*(void *)(a1 + 48) + 16), *(void *)(*(void *)(a1 + 48) + 24), *(void *)(*(void *)(a1 + 48) + 48), *(void *)(*(void *)(a1 + 48) + 56), *(void *)(*(void *)(a1 + 48) + 32));
  unint64_t v13 = v87[3];
  double v14 = 0.0;
  double v15 = 0.0;
  if (v13) {
    double v15 = (float)((float)(unint64_t)v91[3] / (float)v13);
  }
  unint64_t v16 = v100[3];
  if (v16) {
    double v14 = (float)((float)(unint64_t)v104[3] / (float)v16);
  }
  v115[0] = @"date_optin";
  uint64_t v17 = [v67 objectForKeyedSubscript:@"OptInDate"];
  int v18 = @"NA";
  if (v17) {
    int v18 = (__CFString *)v17;
  }
  v116[0] = v18;
  v115[1] = @"detection_version_current";
  uint64_t v62 = (void *)v17;
  uint64_t v63 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(a1 + 48) + 16)];
  v116[1] = v63;
  v115[2] = @"detection_version_optin";
  uint64_t v19 = [v67 objectForKeyedSubscript:@"OptInDetectionModelVersion"];
  uint64_t v64 = (void *)v19;
  if (v19) {
    id v20 = (void *)v19;
  }
  else {
    id v20 = &unk_1F15EDA28;
  }
  v116[2] = v20;
  v115[3] = @"mad_version_current";
  uint64_t v60 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(*(void *)(a1 + 48) + 8), "mad_faceProcessingInternalVersion"));
  v116[3] = v60;
  v115[4] = @"mad_version_optin";
  uint64_t v21 = [v67 objectForKeyedSubscript:@"OptInMADFaceVersion"];
  uint64_t v61 = (void *)v21;
  if (v21) {
    uint64_t v22 = (void *)v21;
  }
  else {
    uint64_t v22 = &unk_1F15EDA28;
  }
  v116[4] = v22;
  v116[5] = v66;
  void v115[5] = @"person_id";
  v115[6] = @"promoter_clusters";
  double v55 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 56), "count"));
  v116[6] = v55;
  v116[7] = &unk_1F15EDA28;
  v115[7] = @"promoter_clusters_duplicates";
  v115[8] = @"promoter_precision";
  __int16 v54 = [NSNumber numberWithDouble:v15];
  v116[8] = v54;
  v115[9] = @"promoter_recall";
  double v53 = [NSNumber numberWithDouble:v72[3]];
  v116[9] = v53;
  v115[10] = @"promoter_version_current";
  unint64_t v52 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(a1 + 48) + 32)];
  v116[10] = v52;
  v115[11] = @"promoter_version_optin";
  __int16 v56 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(a1 + 48) + 32)];
  v116[11] = v56;
  v115[12] = @"recognition_version_current";
  uint64_t v57 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(a1 + 48) + 24)];
  v116[12] = v57;
  v115[13] = @"recognition_version_optin";
  uint64_t v23 = [v67 objectForKeyedSubscript:@"OptInRecognitionModelVersion"];
  uint64_t v58 = (void *)v23;
  if (v23) {
    float v24 = (void *)v23;
  }
  else {
    float v24 = &unk_1F15EDA28;
  }
  v116[13] = v24;
  v115[14] = @"total_assets";
  uint64_t v25 = NSNumber;
  double v59 = [MEMORY[0x1E4F38EC0] fetchAssetsWithOptions:*(void *)(a1 + 64)];
  id v50 = objc_msgSend(v25, "numberWithUnsignedInteger:", objc_msgSend(v59, "count"));
  v116[14] = v50;
  v115[15] = @"total_assets_optin";
  uint64_t v26 = [v67 objectForKeyedSubscript:@"AssetCount"];
  int v27 = (void *)v26;
  if (v26) {
    uint64_t v28 = (void *)v26;
  }
  else {
    uint64_t v28 = &unk_1F15EDA28;
  }
  v116[15] = v28;
  v115[16] = @"total_faces";
  uint64_t v29 = NSNumber;
  double v51 = [MEMORY[0x1E4F39048] fetchFacesWithOptions:*(void *)(a1 + 64)];
  id v49 = objc_msgSend(v29, "numberWithUnsignedInteger:", objc_msgSend(v51, "count"));
  v116[16] = v49;
  v115[17] = @"total_faces_optin";
  uint64_t v30 = [v67 objectForKeyedSubscript:@"FaceCount"];
  uint64_t v31 = (void *)v30;
  if (v30) {
    uint64_t v32 = (void *)v30;
  }
  else {
    uint64_t v32 = &unk_1F15EDA28;
  }
  v116[17] = v32;
  v116[18] = v65;
  v115[18] = @"type";
  v115[19] = @"userLabeledAge";
  uint64_t v33 = [v67 objectForKeyedSubscript:@"UserLabeledAge"];
  id v34 = (void *)v33;
  if (v33) {
    id v35 = (void *)v33;
  }
  else {
    id v35 = &unk_1F15EDA28;
  }
  v116[19] = v35;
  v115[20] = @"userLabeledEthnicity";
  uint64_t v36 = [v67 objectForKeyedSubscript:@"UserLabeledEthnicity"];
  id v37 = (void *)v36;
  if (v36) {
    uint64_t v38 = (void *)v36;
  }
  else {
    uint64_t v38 = &unk_1F15EDA28;
  }
  v116[20] = v38;
  v115[21] = @"userLabeledGender";
  uint64_t v39 = [v67 objectForKeyedSubscript:@"UserLabeledGender"];
  id v40 = (void *)v39;
  if (v39) {
    __int16 v41 = (void *)v39;
  }
  else {
    __int16 v41 = &unk_1F15EDA28;
  }
  v116[21] = v41;
  v115[22] = @"vision_clusters";
  uint64_t v42 = [NSNumber numberWithUnsignedInteger:v108[3]];
  v116[22] = v42;
  v116[23] = &unk_1F15EDA28;
  v115[23] = @"vision_clusters_duplicates";
  v115[24] = @"vision_precision";
  id v43 = [NSNumber numberWithDouble:v14];
  v116[24] = v43;
  v115[25] = @"vision_recall";
  unint64_t v44 = [NSNumber numberWithDouble:v79[3]];
  v116[25] = v44;
  id v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v116 forKeys:v115 count:26];

  [*(id *)(a1 + 72) addObject:v45];
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    id v46 = VCPLogInstance();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v47 = *(void *)(a1 + 80);
      *(_DWORD *)buf = 138412546;
      uint64_t v112 = v47;
      __int16 v113 = 2112;
      double v114 = v45;
      _os_log_impl(&dword_1BBEDA000, v46, OS_LOG_TYPE_DEBUG, "%@ Report CoreAnalytics: %@", buf, 0x16u);
    }
  }
  id v48 = +[VCPMADCoreAnalyticsManager sharedManager];
  [v48 sendEvent:@"com.apple.photos.autocounter" withAnalytics:v45];

  _Block_object_dispose(&v71, 8);
  _Block_object_dispose(&v78, 8);

  _Block_object_dispose(&v86, 8);
  _Block_object_dispose(&v90, 8);

  _Block_object_dispose(&v99, 8);
  _Block_object_dispose(&v103, 8);
  _Block_object_dispose(&v107, 8);
}

void __137__VCPPhotosAutoCounterWorker__reportCoreAnalyticsWithVisionClusterMeasure_personClusterMeasure_personClusters_andGroundTruthInformation___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)a1[4];
  id v8 = v3;
  id v5 = [v3 objectForKeyedSubscript:@"personID"];
  LODWORD(v4) = [v4 isEqual:v5];

  if (v4)
  {
    ++*(void *)(*(void *)(a1[5] + 8) + 24);
    id v6 = [v8 objectForKeyedSubscript:@"personFaceCount"];
    *(void *)(*(void *)(a1[6] + 8) + 24) += [v6 unsignedIntegerValue];

    id v7 = [v8 objectForKeyedSubscript:@"validFaceCount"];
    *(void *)(*(void *)(a1[7] + 8) + 24) += [v7 unsignedIntegerValue];
  }
}

void __137__VCPPhotosAutoCounterWorker__reportCoreAnalyticsWithVisionClusterMeasure_personClusterMeasure_personClusters_andGroundTruthInformation___block_invoke_3(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)a1[4];
  id v8 = v3;
  id v5 = [v3 objectForKeyedSubscript:@"personID"];
  LODWORD(v4) = [v4 isEqual:v5];

  if (v4)
  {
    id v6 = [v8 objectForKeyedSubscript:@"personFaceCount"];
    *(void *)(*(void *)(a1[5] + 8) + 24) += [v6 unsignedIntegerValue];

    id v7 = [v8 objectForKeyedSubscript:@"validFaceCount"];
    *(void *)(*(void *)(a1[6] + 8) + 24) += [v7 unsignedIntegerValue];
  }
}

void __137__VCPPhotosAutoCounterWorker__reportCoreAnalyticsWithVisionClusterMeasure_personClusterMeasure_personClusters_andGroundTruthInformation___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = *(void **)(a1 + 32);
  id v11 = v6;
  id v8 = [v6 objectForKeyedSubscript:@"personID"];
  LODWORD(v7) = [v7 isEqual:v8];

  if (v7)
  {
    id v9 = [v11 objectForKeyedSubscript:@"recall"];
    [v9 doubleValue];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v10;

    *a4 = 1;
  }
}

void __137__VCPPhotosAutoCounterWorker__reportCoreAnalyticsWithVisionClusterMeasure_personClusterMeasure_personClusters_andGroundTruthInformation___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = *(void **)(a1 + 32);
  id v11 = v6;
  id v8 = [v6 objectForKeyedSubscript:@"personID"];
  LODWORD(v7) = [v7 isEqual:v8];

  if (v7)
  {
    id v9 = [v11 objectForKeyedSubscript:@"recall"];
    [v9 doubleValue];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v10;

    *a4 = 1;
  }
}

void __137__VCPPhotosAutoCounterWorker__reportCoreAnalyticsWithVisionClusterMeasure_personClusterMeasure_personClusters_andGroundTruthInformation___block_invoke_624(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    id v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v10 = v5;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEBUG, "%@ Report CoreAnalytics file: %@", buf, 0x16u);
    }
  }
  id v6 = [MEMORY[0x1E4F1C978] arrayWithContentsOfURL:v3];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __137__VCPPhotosAutoCounterWorker__reportCoreAnalyticsWithVisionClusterMeasure_personClusterMeasure_personClusters_andGroundTruthInformation___block_invoke_625;
  v7[3] = &unk_1E629C218;
  id v8 = *(id *)(a1 + 32);
  [v6 enumerateObjectsUsingBlock:v7];
}

void __137__VCPPhotosAutoCounterWorker__reportCoreAnalyticsWithVisionClusterMeasure_personClusterMeasure_personClusters_andGroundTruthInformation___block_invoke_625(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    id v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v7 = 138412546;
      uint64_t v8 = v5;
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEBUG, "%@ Report CoreAnalytics: %@", (uint8_t *)&v7, 0x16u);
    }
  }
  id v6 = +[VCPMADCoreAnalyticsManager sharedManager];
  [v6 sendEvent:@"com.apple.photos.autocounter" withAnalytics:v3];
}

- (int)calculateAndReportClusterAccuracyWithVisionClusterURL:(id)a3 andPersonClusters:(id)a4 withGroundtruth:(id)a5 results:(id *)a6 extendTimeoutBlock:(id)a7 cancelBlock:(id)a8
{
  v65[2] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v52 = a4;
  id v15 = a7;
  id v16 = a8;
  id v58 = 0;
  id v59 = 0;
  id v56 = 0;
  id v57 = 0;
  int v17 = [(VCPPhotosAutoCounterWorker *)self _parseGroundTruthWithURL:a5 faceCountPerPerson:&v59 personInformation:&v58 faceToPerson:&v57 assetToFaces:&v56 extendTimeoutBlock:v15 cancelBlock:v16];
  id v18 = v59;
  id v19 = v58;
  id v20 = v57;
  id v21 = v56;
  if (!v17)
  {
    id v55 = 0;
    int v17 = [(VCPPhotosAutoCounterWorker *)self _measureClusterWithClusterStateURL:v14 groundTruthFaceCountPerPerson:v18 groundTruthPersonInformation:v19 groundTruthFaceToPerson:v20 groundTruthAssetToFaces:v21 measures:&v55 extendTimeoutBlock:v15 cancelBlock:v16];
    id v51 = v55;
    if (v17)
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
LABEL_19:

        goto LABEL_20;
      }
      uint64_t v22 = VCPLogInstance();
      id v50 = v22;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v22, OS_LOG_TYPE_ERROR, "[AutoCounter][P/R] Failed to measure Vision cluster state against ground truth", buf, 2u);
      }
LABEL_18:

      goto LABEL_19;
    }
    id v53 = 0;
    int v17 = [(VCPPhotosAutoCounterWorker *)self _measurePNPersonClusters:v52 groundTruthFaceCountPerPerson:v18 groundTruthPersonInformation:v19 groundTruthFaceToPerson:v20 groundTruthAssetToFaces:v21 measures:&v53 extendTimeoutBlock:v15 cancelBlock:v16];
    uint64_t v23 = v53;
    id v50 = v23;
    if (v17)
    {
      if ((int)MediaAnalysisLogLevel() < 3) {
        goto LABEL_18;
      }
      float v24 = VCPLogInstance();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        uint64_t v25 = "[AutoCounter][P/R][PV] Failed to measure Person cluster state against ground truth";
LABEL_14:
        _os_log_impl(&dword_1BBEDA000, v24, OS_LOG_TYPE_ERROR, v25, buf, 2u);
      }
    }
    else
    {
      int v17 = [(VCPPhotosAutoCounterWorker *)self _reportCoreAnalyticsWithVisionClusterMeasure:v51 personClusterMeasure:v23 personClusters:v52 andGroundTruthInformation:v19];
      if (!v17)
      {
        if (!a6)
        {
          int v17 = 0;
          goto LABEL_18;
        }
        v64[0] = @"visionCluster";
        v62[0] = @"weightedAveragePrecision";
        uint64_t v26 = NSNumber;
        [v51 weightedAveragePrecision];
        uint64_t v49 = objc_msgSend(v26, "numberWithFloat:");
        v63[0] = v49;
        v62[1] = @"weightedAverageRecall";
        int v27 = NSNumber;
        [v51 weightedAverageRecall];
        id v48 = objc_msgSend(v27, "numberWithFloat:");
        v63[1] = v48;
        v62[2] = @"numSingletons";
        uint64_t v28 = NSNumber;
        [v51 numSingletons];
        uint64_t v47 = objc_msgSend(v28, "numberWithFloat:");
        v63[2] = v47;
        v62[3] = @"numValidSingletons";
        uint64_t v29 = NSNumber;
        [v51 numValidSingletons];
        __int16 v41 = objc_msgSend(v29, "numberWithFloat:");
        v63[3] = v41;
        v62[4] = @"precisionPerCluster";
        uint64_t v42 = [v51 precisionPerCluster];
        v63[4] = v42;
        v62[5] = @"recallPerPersonToGroundTruth";
        id v43 = [v51 recallPerPersonToGroundTruth];
        v63[5] = v43;
        v62[6] = @"recallPerPersonExcludeMissDetection";
        id v45 = [v51 recallPerPersonExcludeMissDetection];
        v63[6] = v45;
        id v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:v62 count:7];
        v64[1] = @"personCluster";
        v65[0] = v46;
        v60[0] = @"weightedAveragePrecision";
        uint64_t v30 = NSNumber;
        [v50 weightedAveragePrecision];
        unint64_t v44 = objc_msgSend(v30, "numberWithFloat:");
        v61[0] = v44;
        v60[1] = @"weightedAverageRecall";
        uint64_t v31 = NSNumber;
        [v50 weightedAverageRecall];
        uint64_t v39 = objc_msgSend(v31, "numberWithFloat:");
        v61[1] = v39;
        v60[2] = @"numSingletons";
        uint64_t v32 = NSNumber;
        [v50 numSingletons];
        uint64_t v38 = objc_msgSend(v32, "numberWithFloat:");
        v61[2] = v38;
        v60[3] = @"numValidSingletons";
        uint64_t v33 = NSNumber;
        [v50 numValidSingletons];
        id v40 = objc_msgSend(v33, "numberWithFloat:");
        void v61[3] = v40;
        v60[4] = @"precisionPerCluster";
        id v37 = [v50 precisionPerCluster];
        v61[4] = v37;
        v60[5] = @"recallPerPersonToGroundTruth";
        uint64_t v36 = [v50 recallPerPersonToGroundTruth];
        v61[5] = v36;
        id v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:v60 count:6];
        v65[1] = v34;
        *a6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:v64 count:2];

        int v17 = 0;
        float v24 = v49;
        goto LABEL_17;
      }
      if ((int)MediaAnalysisLogLevel() < 3) {
        goto LABEL_18;
      }
      float v24 = VCPLogInstance();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        uint64_t v25 = "[AutoCounter][P/R][PV] Failed to report CoreAnalytics";
        goto LABEL_14;
      }
    }
LABEL_17:

    goto LABEL_18;
  }
LABEL_20:

  return v17;
}

- (int)calculateAndReportClusterAccuracyWithVisionClusterURL:(id)a3 andPersonClusters:(id)a4 results:(id *)a5 extendTimeoutBlock:(id)a6 cancelBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v16 = [(VCPPhotosAutoCounterWorker *)self _groundTruthURL];
  LODWORD(a5) = [(VCPPhotosAutoCounterWorker *)self calculateAndReportClusterAccuracyWithVisionClusterURL:v12 andPersonClusters:v13 withGroundtruth:v16 results:a5 extendTimeoutBlock:v14 cancelBlock:v15];

  return (int)a5;
}

- (int)_parseSIMLGroundTruthWithURL:(id)a3 faceCountPerPerson:(id *)a4 personInformation:(id *)a5 faceToPerson:(id *)a6 assetToFaces:(id *)a7 extendTimeoutBlock:(id)a8 cancelBlock:(id)a9
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v50 = a3;
  id v56 = (void (**)(void))a8;
  id v15 = (uint64_t (**)(void))a9;
  id v45 = a4;
  *a4 = 0;
  *a5 = 0;
  *a6 = 0;
  *a7 = 0;
  id v55 = [MEMORY[0x1E4F28BD0] set];
  id v54 = [MEMORY[0x1E4F1CA60] dictionary];
  id v53 = [MEMORY[0x1E4F1CA60] dictionary];
  id v52 = [MEMORY[0x1E4F1CA60] dictionary];
  id v66 = 0;
  uint64_t v16 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v50 options:0 error:&v66];
  id v17 = v66;
  id v48 = (void *)v16;
  if (v16 && !v17)
  {
    id v65 = 0;
    id v18 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v16 options:0 error:&v65];
    id v19 = v65;
    id v46 = v18;
    uint64_t v47 = v19;
    if (v18 && !v19)
    {
      id v20 = [MEMORY[0x1E4F1CA60] dictionary];
      v63[0] = MEMORY[0x1E4F143A8];
      v63[1] = 3221225472;
      v63[2] = __153__VCPPhotosAutoCounterWorker__parseSIMLGroundTruthWithURL_faceCountPerPerson_personInformation_faceToPerson_assetToFaces_extendTimeoutBlock_cancelBlock___block_invoke;
      v63[3] = &unk_1E629C218;
      id v51 = v20;
      uint64_t v64 = v51;
      [v18 enumerateObjectsUsingBlock:v63];
      id v67 = @"OptInDateSinceReferenceDate";
      id v21 = NSNumber;
      uint64_t v22 = [MEMORY[0x1E4F1C9C8] now];
      [v22 timeIntervalSinceReferenceDate];
      uint64_t v23 = objc_msgSend(v21, "numberWithDouble:");
      uint64_t v42 = a6;
      id v43 = a5;
      __int16 v41 = a7;
      uint64_t v68 = v23;
      uint64_t v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v68 forKeys:&v67 count:1];

      unint64_t v44 = objc_msgSend(MEMORY[0x1E4F38EC0], "vcp_fetchOptionsForLibrary:forTaskID:", self->_photoLibrary, 3);
      float v24 = objc_msgSend(MEMORY[0x1E4F38EC0], "fetchAssetsWithOptions:");
      for (unint64_t i = 0; ; ++i)
      {
        if (i >= [v24 count])
        {
          *id v45 = v55;
          id *v43 = v54;
          *uint64_t v42 = v53;
          int v39 = 0;
          id *v41 = v52;
          goto LABEL_30;
        }
        uint64_t v26 = (void *)MEMORY[0x1C186D320]();
        if (v15 && (v15[2](v15) & 1) != 0)
        {
          int v27 = 1;
        }
        else
        {
          if (v56) {
            v56[2]();
          }
          uint64_t v28 = [v24 objectAtIndexedSubscript:i];
          uint64_t v29 = [v28 originalFilename];
          uint64_t v30 = [v29 stringByDeletingPathExtension];

          uint64_t v31 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v30, "integerValue"));
          uint64_t v32 = [v51 objectForKeyedSubscript:v31];

          if (v32)
          {
            uint64_t v33 = [v32 objectForKeyedSubscript:@"faces"];
            id v34 = [MEMORY[0x1E4F1CA48] array];
            v57[0] = MEMORY[0x1E4F143A8];
            v57[1] = 3221225472;
            v57[2] = __153__VCPPhotosAutoCounterWorker__parseSIMLGroundTruthWithURL_faceCountPerPerson_personInformation_faceToPerson_assetToFaces_extendTimeoutBlock_cancelBlock___block_invoke_2;
            v57[3] = &unk_1E629C268;
            id v35 = v34;
            id v58 = v35;
            id v59 = v53;
            id v60 = v55;
            id v61 = v54;
            id v62 = v49;
            [v33 enumerateObjectsUsingBlock:v57];
            uint64_t v36 = [v28 localIdentifier];
            [v52 setObject:v35 forKeyedSubscript:v36];

            int v27 = 0;
          }
          else
          {
            int v27 = 12;
          }
        }
        if (v27 != 12)
        {
          if (v27) {
            break;
          }
        }
      }
      int v39 = -128;
LABEL_30:

      goto LABEL_31;
    }
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v38 = VCPLogInstance();
      id v51 = v38;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v70 = v47;
        _os_log_impl(&dword_1BBEDA000, v38, OS_LOG_TYPE_ERROR, "[AutoCounter][P/R][SIMLGT] Failed to serialize SIML ground truth - %@", buf, 0xCu);
      }
      int v39 = -18;
LABEL_31:

      goto LABEL_32;
    }
LABEL_26:
    int v39 = -18;
LABEL_32:

    goto LABEL_33;
  }
  uint64_t v47 = v17;
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    id v37 = VCPLogInstance();
    id v46 = v37;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v70 = v47;
      _os_log_impl(&dword_1BBEDA000, v37, OS_LOG_TYPE_ERROR, "[AutoCounter][P/R][SIMLGT] Failed to load SIML ground truth - %@", buf, 0xCu);
    }
    goto LABEL_26;
  }
  int v39 = -18;
LABEL_33:

  return v39;
}

void __153__VCPPhotosAutoCounterWorker__parseSIMLGroundTruthWithURL_faceCountPerPerson_personInformation_faceToPerson_assetToFaces_extendTimeoutBlock_cancelBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v6 = v3;
  uint64_t v5 = [v3 objectForKeyedSubscript:@"id"];
  [v4 setObject:v6 forKeyedSubscript:v5];
}

void __153__VCPPhotosAutoCounterWorker__parseSIMLGroundTruthWithURL_faceCountPerPerson_personInformation_faceToPerson_assetToFaces_extendTimeoutBlock_cancelBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 objectForKeyedSubscript:@"identity"];
  uint64_t v5 = [MEMORY[0x1E4F1CA98] null];

  if (v4 != v5)
  {
    id v6 = [MEMORY[0x1E4F1CA60] dictionary];
    int v7 = [v3 objectForKeyedSubscript:@"centerX"];
    [v7 floatValue];
    float v9 = v8;

    id v10 = [v3 objectForKeyedSubscript:@"centerY"];
    [v10 floatValue];
    float v12 = v11;

    id v13 = [v3 objectForKeyedSubscript:@"size"];
    [v13 floatValue];
    float v15 = v14;

    uint64_t v16 = NSString;
    id v17 = [v3 objectForKeyedSubscript:@"id"];
    id v18 = [v16 stringWithFormat:@"f%@", v17];

    id v19 = NSString;
    id v20 = [v4 objectForKeyedSubscript:@"id"];
    id v21 = [v19 stringWithFormat:@"p%@", v20];

    [v6 setObject:v18 forKey:@"faceID"];
    [v6 setObject:v21 forKey:@"personID"];
    float v22 = v15 * 1.76;
    v30.origin.double x = v9;
    v30.origin.double y = v12;
    v30.size.double width = v22;
    v30.size.double height = v30.size.width;
    uint64_t v23 = NSStringFromRect(v30);
    [v6 setObject:v23 forKey:@"faceRect"];

    [*(id *)(a1 + 32) addObject:v6];
    [*(id *)(a1 + 40) setObject:v21 forKeyedSubscript:v18];
    [*(id *)(a1 + 48) addObject:v21];
    [*(id *)(a1 + 56) setObject:*(void *)(a1 + 64) forKeyedSubscript:v21];
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      float v24 = VCPLogInstance();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v26 = v18;
        __int16 v27 = 2112;
        uint64_t v28 = v21;
        _os_log_impl(&dword_1BBEDA000, v24, OS_LOG_TYPE_DEBUG, "[AutoCounter][P/R][SIMLGT] Load faceID: %@ for PersonID: %@", buf, 0x16u);
      }
    }
  }
}

- (int)validateClusterAccuracyWithSIMLGroundtruth:(id)a3 results:(id *)a4 extendTimeoutBlock:(id)a5 cancelBlock:(id)a6
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v54 = 0;
  id v55 = 0;
  id v52 = 0;
  id v53 = 0;
  int v13 = [(VCPPhotosAutoCounterWorker *)self _parseSIMLGroundTruthWithURL:v10 faceCountPerPerson:&v55 personInformation:&v54 faceToPerson:&v53 assetToFaces:&v52 extendTimeoutBlock:v11 cancelBlock:v12];
  id v46 = v55;
  id v14 = v54;
  id v15 = v53;
  id v16 = v52;
  if (!v13)
  {
    unint64_t v44 = a4;
    if ([(PHPhotoLibrary *)self->_photoLibrary mad_useVUGallery])
    {
      uint64_t v50 = 0;
      uint64_t v51 = 0;
      id v17 = (id *)&v50;
      id v18 = (id *)&v51;
      int v19 = [(VCPPhotosAutoCounterWorker *)self exportVUGalleryClusterStates:&v51 error:&v50 extendTimeoutBlock:v11 cancelBlock:v12];
    }
    else
    {
      uint64_t v48 = 0;
      uint64_t v49 = 0;
      id v17 = (id *)&v48;
      id v18 = (id *)&v49;
      int v19 = [(VCPPhotosAutoCounterWorker *)self exportClustersStates:&v49 error:&v48 extendTimeoutBlock:v11 cancelBlock:v12];
    }
    int v20 = v19;
    id v45 = *v18;
    id v21 = *v17;
    if (v20 || v21)
    {
      float v22 = v21;
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        int v13 = -18;
LABEL_25:

        goto LABEL_26;
      }
      __int16 v27 = VCPLogInstance();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v27, OS_LOG_TYPE_ERROR, "[AutoCounter][P/R][SIML] Failed to export current clusters states", buf, 2u);
      }
      int v13 = -18;
      uint64_t v25 = v27;
    }
    else
    {
      float v22 = 0;
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        uint64_t v23 = VCPLogInstance();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v59 = v45;
          __int16 v60 = 2112;
          id v61 = v10;
          _os_log_impl(&dword_1BBEDA000, v23, OS_LOG_TYPE_INFO, "[AutoCounter][P/R][SIML] Validate cluster state  %@ against ground truth %@", buf, 0x16u);
        }
      }
      id v47 = 0;
      int v13 = [(VCPPhotosAutoCounterWorker *)self _measureClusterWithClusterStateURL:v45 groundTruthFaceCountPerPerson:v46 groundTruthPersonInformation:v14 groundTruthFaceToPerson:v15 groundTruthAssetToFaces:v16 measures:&v47 extendTimeoutBlock:v11 cancelBlock:v12];
      float v24 = v47;
      uint64_t v25 = v24;
      if (v13)
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          uint64_t v26 = VCPLogInstance();
          uint64_t v42 = v26;
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1BBEDA000, v26, OS_LOG_TYPE_ERROR, "[AutoCounter][P/R][SIML] Failed to measure Vision cluster state against SIML ground truth", buf, 2u);
          }
          goto LABEL_23;
        }
      }
      else if (v44)
      {
        v56[0] = @"weightedAveragePrecision";
        uint64_t v28 = NSNumber;
        id v43 = v24;
        [v24 weightedAveragePrecision];
        uint64_t v42 = objc_msgSend(v28, "numberWithFloat:");
        v57[0] = v42;
        v56[1] = @"weightedAverageRecall";
        uint64_t v29 = NSNumber;
        [v43 weightedAverageRecall];
        __int16 v41 = objc_msgSend(v29, "numberWithFloat:");
        v57[1] = v41;
        v56[2] = @"numSingletons";
        NSRect v30 = NSNumber;
        [v43 numSingletons];
        id v40 = objc_msgSend(v30, "numberWithFloat:");
        v57[2] = v40;
        v56[3] = @"numValidSingletons";
        uint64_t v31 = NSNumber;
        [v43 numValidSingletons];
        int v39 = objc_msgSend(v31, "numberWithFloat:");
        v57[3] = v39;
        v56[4] = @"precisionPerCluster";
        uint64_t v25 = v43;
        uint64_t v38 = [v43 precisionPerCluster];
        id v37 = [v38 sortedArrayUsingComparator:&__block_literal_global_74];
        void v57[4] = v37;
        v56[5] = @"recallPerPersonToGroundTruth";
        uint64_t v36 = [v43 recallPerPersonToGroundTruth];
        id v35 = [v36 sortedArrayUsingComparator:&__block_literal_global_74];
        v57[5] = v35;
        v56[6] = @"recallPerPersonExcludeMissDetection";
        id v34 = [v43 recallPerPersonExcludeMissDetection];
        uint64_t v32 = [v34 sortedArrayUsingComparator:&__block_literal_global_74];
        v57[6] = v32;
        *unint64_t v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:7];

LABEL_23:
      }
    }

    goto LABEL_25;
  }
LABEL_26:

  return v13;
}

uint64_t __112__VCPPhotosAutoCounterWorker_validateClusterAccuracyWithSIMLGroundtruth_results_extendTimeoutBlock_cancelBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 objectForKeyedSubscript:@"personID"];
  int v7 = [v5 objectForKeyedSubscript:@"personID"];
  uint64_t v8 = [v6 compare:v7 options:64];
  if (!v8)
  {
    float v9 = [v4 objectForKeyedSubscript:@"validFaceCount"];
    id v10 = [v5 objectForKeyedSubscript:@"validFaceCount"];
    uint64_t v8 = [v9 compare:v10];
  }
  return v8;
}

- (void).cxx_destruct
{
}

@end