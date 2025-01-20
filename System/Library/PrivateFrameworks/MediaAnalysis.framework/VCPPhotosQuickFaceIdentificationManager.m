@interface VCPPhotosQuickFaceIdentificationManager
+ (BOOL)_fastFaceMigrationEnabled;
- (BOOL)_faceProcessingPassGoalWithExtendTimeout:(id)a3;
- (BOOL)_keepCurrentPersonsModelWithExtendTimeout:(id)a3;
- (BOOL)_modelLastGenerationDidExceedTimeIntervalForType:(unint64_t)a3;
- (BOOL)_needToGenerateModelWithType:(unint64_t)a3 ignoreLastGenerationTime:(BOOL)a4 withExtendTimeout:(id)a5;
- (BOOL)_persistPersonsModel:(id)a3 evaluationMode:(BOOL)a4 error:(id *)a5;
- (BOOL)_persistPetsModel:(id)a3 error:(id *)a4;
- (VCPPhotosQuickFaceIdentificationManager)init;
- (VCPPhotosQuickFaceIdentificationManager)initWithPhotoLibrary:(id)a3;
- (id)_fetchPersonsToFeedVIPModel:(BOOL)a3 allowUnverifiedPerson:(BOOL)a4;
- (id)_fetchPetsToFeedVIPModel;
- (id)fetchEntityForModelType:(unint64_t)a3 evaluationMode:(BOOL)a4 allowUnverifiedPerson:(BOOL)a5;
- (int)_classifyFaces:(id)a3 forAsset:(id)a4 detectedPersons:(id *)a5;
- (int)_generatePersonsModelWithExtendTimeoutBlock:(id)a3 cancel:(id)a4 evaluationMode:(BOOL)a5 allowUnverifiedPerson:(BOOL)a6;
- (int)_generatePetsModelWithExtendTimeoutBlock:(id)a3 cancel:(id)a4;
- (int)_loadPersonsModelAndInitializeFaceAnalyzer;
- (int)_loadPetsModel;
- (int)classifyVIPPets;
- (int)faceProcessingVersionFromVNFaceprintRequestRevision:(unint64_t)a3;
- (int)generateVIPModelWithType:(unint64_t)a3 ignoreLastGenerationTime:(BOOL)a4 evaluationMode:(BOOL)a5 allowUnverifiedPerson:(BOOL)a6 modelGenerated:(BOOL *)a7 extendTimeout:(id)a8 andCancel:(id)a9;
- (int)loadPersonsModelAndInitializeFaceAnalyzerWrapper;
- (int)processAsset:(id)a3 onDemandDetection:(BOOL)a4 detectedFaces:(id *)a5 detectedPersons:(id *)a6;
- (void)personIdentificationForSyndicationPhotoLibrary:(id)a3 withCancelOrExtendTimeoutBlock:(id)a4;
@end

@implementation VCPPhotosQuickFaceIdentificationManager

- (VCPPhotosQuickFaceIdentificationManager)init
{
  return 0;
}

- (VCPPhotosQuickFaceIdentificationManager)initWithPhotoLibrary:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VCPPhotosQuickFaceIdentificationManager;
  v6 = [(VCPPhotosQuickFaceIdentificationManager *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.mediaanalysis.quickfaceid.management", 0);
    management = v7->_management;
    v7->_management = (OS_dispatch_queue *)v8;
  }
  return v7;
}

- (int)loadPersonsModelAndInitializeFaceAnalyzerWrapper
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  management = self->_management;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __91__VCPPhotosQuickFaceIdentificationManager_loadPersonsModelAndInitializeFaceAnalyzerWrapper__block_invoke;
  v5[3] = &unk_1E6298560;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(management, v5);
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void *__91__VCPPhotosQuickFaceIdentificationManager_loadPersonsModelAndInitializeFaceAnalyzerWrapper__block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (!result[1] && !result[6])
  {
    result = (void *)[result _loadPersonsModelAndInitializeFaceAnalyzer];
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  }
  return result;
}

- (int)faceProcessingVersionFromVNFaceprintRequestRevision:(unint64_t)a3
{
  if (a3 == 3737841665) {
    return 11;
  }
  else {
    return [(PHPhotoLibrary *)self->_photoLibrary mad_faceProcessingInternalVersion];
  }
}

- (int)_loadPersonsModelAndInitializeFaceAnalyzer
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  int v3 = +[VCPPhotosFaceProcessingContext contextWithPhotoLibrary:self->_photoLibrary];
  if ([(PHPhotoLibrary *)self->_photoLibrary mad_useVUGallery]
    && _os_feature_enabled_impl())
  {
    v4 = [(PHPhotoLibrary *)self->_photoLibrary vcp_visionCacheStorageDirectoryURL];
    uint64_t v49 = 0;
    v50 = &v49;
    uint64_t v51 = 0x2050000000;
    id v5 = (void *)getGDVUVisualUnderstandingServiceClass(void)::softClass;
    uint64_t v52 = getGDVUVisualUnderstandingServiceClass(void)::softClass;
    if (!getGDVUVisualUnderstandingServiceClass(void)::softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = ___ZL38getGDVUVisualUnderstandingServiceClassv_block_invoke_0;
      v54 = &unk_1E62970F8;
      v55 = &v49;
      ___ZL38getGDVUVisualUnderstandingServiceClassv_block_invoke_0((uint64_t)buf);
      id v5 = (void *)v50[3];
    }
    uint64_t v6 = v5;
    _Block_object_dispose(&v49, 8);
    id v7 = [v6 alloc];
    uint64_t v49 = 0;
    v50 = &v49;
    uint64_t v51 = 0x2050000000;
    uint64_t v8 = (void *)getGDVUEntityRecognitionClientClass(void)::softClass;
    uint64_t v52 = getGDVUEntityRecognitionClientClass(void)::softClass;
    if (!getGDVUEntityRecognitionClientClass(void)::softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = ___ZL35getGDVUEntityRecognitionClientClassv_block_invoke_1;
      v54 = &unk_1E62970F8;
      v55 = &v49;
      ___ZL35getGDVUEntityRecognitionClientClassv_block_invoke_1((uint64_t)buf);
      uint64_t v8 = (void *)v50[3];
    }
    id v9 = v8;
    _Block_object_dispose(&v49, 8);
    v10 = [v9 photos];
    id v48 = 0;
    objc_super v11 = (GDVUVisualUnderstandingService *)[v7 initWithClient:v10 version:1 url:v4 error:&v48];
    id v12 = v48;
    vuService = self->_vuService;
    self->_vuService = v11;

    v14 = self->_vuService;
    if (!v14)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v45 = VCPLogInstance();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v12;
          _os_log_impl(&dword_1BBEDA000, v45, OS_LOG_TYPE_ERROR, "Failed to create MADGDVisualUnderstandingService instance - %@", buf, 0xCu);
        }
      }
LABEL_54:
      int v43 = -18;
      goto LABEL_55;
    }
    v15 = [(GDVUVisualUnderstandingService *)v14 gallery];
    uint64_t v16 = [v15 faceprintRevision];

    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v17 = VCPLogInstance();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[4] = v16;
        _os_log_impl(&dword_1BBEDA000, v17, OS_LOG_TYPE_DEBUG, "Gallery uses faceprint with revision %ld", buf, 0xCu);
      }
    }
    if (v16 == 3737841669) {
      uint64_t v18 = 15;
    }
    else {
      uint64_t v18 = 11;
    }
    [v3 setProcessingVersion:v18];
    v19 = v4;
  }
  else
  {
    uint64_t v20 = mach_absolute_time();
    v21 = VCPSignPostLog();
    os_signpost_id_t v22 = os_signpost_id_generate(v21);

    v23 = VCPSignPostLog();
    v24 = v23;
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "VCPPersonVIPLoadModel", "", buf, 2u);
    }

    v19 = [(PHPhotoLibrary *)self->_photoLibrary vcp_vipModelFilepathForVIPType:0];
    if (!v19)
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        int v43 = -50;
        goto LABEL_56;
      }
      v4 = VCPLogInstance();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_ERROR, "QuickFaceID Model: persistent storageDirectoryURL is nil", buf, 2u);
      }
      int v43 = -50;
LABEL_55:

      goto LABEL_56;
    }
    id v47 = 0;
    v25 = +[VCPFaceIDModel loadVIPModelAtPath:v19 withVIPType:0 error:&v47];
    id v12 = v47;
    personsModel = self->_personsModel;
    self->_personsModel = v25;

    if (!self->_personsModel)
    {
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        v44 = VCPLogInstance();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v12;
          _os_log_impl(&dword_1BBEDA000, v44, OS_LOG_TYPE_DEFAULT, "QuickFaceID Model: cannot load Persons Model: %@", buf, 0xCu);
        }
      }
      int v43 = -18;
      v4 = v19;
      goto LABEL_55;
    }
    v27 = VCPSignPostLog();
    v28 = v27;
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v28, OS_SIGNPOST_INTERVAL_END, v22, "VCPPersonVIPLoadModel", "", buf, 2u);
    }

    if (v20)
    {
      mach_absolute_time();
      VCPPerformance_LogMeasurement();
    }
    v29 = [(VNPersonsModel *)self->_personsModel configuration];
    uint64_t v30 = [v29 faceprintRequestRevision];

    objc_msgSend(v3, "setProcessingVersion:", -[VCPPhotosQuickFaceIdentificationManager faceProcessingVersionFromVNFaceprintRequestRevision:](self, "faceProcessingVersionFromVNFaceprintRequestRevision:", v30));
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      v31 = VCPLogInstance();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        v32 = [(VNPersonsModel *)self->_personsModel configuration];
        uint64_t v33 = [v32 faceprintRequestRevision];
        int v34 = [v3 processingVersion];
        *(_DWORD *)buf = 134218240;
        *(void *)&buf[4] = v33;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v34;
        _os_log_impl(&dword_1BBEDA000, v31, OS_LOG_TYPE_INFO, "QuickFaceID Model: model with VNCreateFaceprintRequest revision %lu (FaceProcessing Version%d)", buf, 0x12u);
      }
    }
    v35 = +[VCPFaceProcessingVersionManager sharedManagerForPhotoLibrary:self->_photoLibrary];
    uint64_t v36 = [v35 currentProcessingVersion];

    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      v37 = VCPLogInstance();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        v38 = (objc_class *)objc_opt_class();
        uint64_t v39 = VCPMAGetRevisionForVisionModel(v38, v36);
        *(_DWORD *)buf = 134218240;
        *(void *)&buf[4] = v39;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v36;
        _os_log_impl(&dword_1BBEDA000, v37, OS_LOG_TYPE_INFO, "QuickFaceID Model: system is using VNCreateFaceprintRequest revision %lu (FaceProcessing Version%d)", buf, 0x12u);
      }
    }
  }

  v40 = [[VCPFaceAnalyzer alloc] initWithContext:v3];
  faceAnalyzer = self->_faceAnalyzer;
  p_faceAnalyzer = &self->_faceAnalyzer;
  *p_faceAnalyzer = v40;

  if (!*p_faceAnalyzer)
  {
    if ((int)MediaAnalysisLogLevel() < 3)
    {
      int v43 = -18;
      goto LABEL_56;
    }
    v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_ERROR, "QuickFaceID: failed to initialize face analyzer", buf, 2u);
    }
    goto LABEL_54;
  }
  int v43 = 0;
LABEL_56:

  return v43;
}

- (int)_loadPetsModel
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = mach_absolute_time();
  v4 = VCPSignPostLog();
  os_signpost_id_t v5 = os_signpost_id_generate(v4);

  uint64_t v6 = VCPSignPostLog();
  id v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "VCPPetVIPLoadModel", "", buf, 2u);
  }

  uint64_t v8 = [(PHPhotoLibrary *)self->_photoLibrary vcp_vipModelFilepathForVIPType:1];
  if (v8)
  {
    id v17 = 0;
    uint64_t v9 = +[VCPFaceIDModel loadVIPModelAtPath:v8 withVIPType:1 error:&v17];
    v10 = v17;
    petsModel = self->_petsModel;
    p_petsModel = &self->_petsModel;
    *p_petsModel = (VNEntityIdentificationModel *)v9;

    if (*p_petsModel)
    {
      v13 = VCPSignPostLog();
      v14 = v13;
      if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v14, OS_SIGNPOST_INTERVAL_END, v5, "VCPPetVIPLoadModel", "", buf, 2u);
      }

      if (v3)
      {
        mach_absolute_time();
        VCPPerformance_LogMeasurement();
        LODWORD(v3) = 0;
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        v15 = VCPLogInstance();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v19 = v10;
          _os_log_impl(&dword_1BBEDA000, v15, OS_LOG_TYPE_DEFAULT, "QuickFaceID Pet Model: cannot load Model: %@", buf, 0xCu);
        }
      }
      LODWORD(v3) = -18;
    }
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() < 3)
    {
      LODWORD(v3) = -50;
      goto LABEL_21;
    }
    v10 = VCPLogInstance();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_ERROR, "QuickFaceID Pet Model: persistent storageDirectoryURL is nil; skip loading Model",
        buf,
        2u);
    }
    LODWORD(v3) = -50;
  }

LABEL_21:
  return v3;
}

- (int)_classifyFaces:(id)a3 forAsset:(id)a4 detectedPersons:(id *)a5
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v49 = a4;
  v50 = v7;
  if (![v7 count]) {
    goto LABEL_32;
  }
  uint64_t v8 = NSString;
  uint64_t v9 = [v49 localIdentifier];
  uint64_t v56 = [v8 stringWithFormat:@"[%@][QuickFaceID Classify]", v9];

  uint64_t v52 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v50, "count"));
  v54 = [(PHPhotoLibrary *)self->_photoLibrary mad_allPersonsFetchOptionsWithDetectionTypes:0 andVerifiedTypes:&unk_1F15EE2B0];
  id v48 = a5;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  obuint64_t j = v50;
  uint64_t v10 = [obj countByEnumeratingWithState:&v79 objects:v92 count:16];
  if (!v10) {
    goto LABEL_24;
  }
  uint64_t v53 = *(void *)v80;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v80 != v53) {
        objc_enumerationMutation(obj);
      }
      id v12 = *(void **)(*((void *)&v79 + 1) + 8 * i);
      v13 = (void *)MEMORY[0x1C186D320]();
      v14 = NSString;
      v15 = [v12 localIdentifier];
      uint64_t v16 = [v14 stringWithFormat:@"%@[%@]", v56, v15];

      id v17 = [v12 imageprintWrapper];
      uint64_t v18 = [v17 data];

      v19 = +[VCPFaceIDModel faceObservationFromFaceprintData:v18];
      uint64_t v73 = 0;
      v74 = &v73;
      uint64_t v75 = 0x3032000000;
      v76 = __Block_byref_object_copy__29;
      v77 = __Block_byref_object_dispose__29;
      id v78 = 0;
      uint64_t v67 = 0;
      v68 = &v67;
      uint64_t v69 = 0x3032000000;
      v70 = __Block_byref_object_copy__29;
      v71 = __Block_byref_object_dispose__29;
      id v72 = 0;
      management = self->_management;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __83__VCPPhotosQuickFaceIdentificationManager__classifyFaces_forAsset_detectedPersons___block_invoke;
      block[3] = &unk_1E629ADA8;
      block[4] = self;
      id v21 = v19;
      id v62 = v21;
      v65 = &v73;
      id v22 = v16;
      id v63 = v22;
      id v64 = v54;
      v66 = &v67;
      dispatch_sync(management, block);
      if (!v68[5])
      {
        if (v74[5])
        {
          if ((int)MediaAnalysisLogLevel() < 3) {
            goto LABEL_22;
          }
          v25 = VCPLogInstance();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            [v12 centerX];
            uint64_t v27 = v26;
            [v12 centerY];
            uint64_t v28 = v74[5];
            *(_DWORD *)buf = 138413058;
            v85 = v56;
            __int16 v86 = 2048;
            uint64_t v87 = v27;
            __int16 v88 = 2048;
            uint64_t v89 = v29;
            __int16 v90 = 2112;
            uint64_t v91 = v28;
            uint64_t v30 = v25;
            os_log_type_t v31 = OS_LOG_TYPE_ERROR;
            v32 = "%@ No matching person at location (%.3f, %.3f) - %@";
            uint32_t v33 = 42;
            goto LABEL_20;
          }
        }
        else
        {
          if ((int)MediaAnalysisLogLevel() < 7) {
            goto LABEL_22;
          }
          v25 = VCPLogInstance();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            [v12 centerX];
            uint64_t v35 = v34;
            [v12 centerY];
            *(_DWORD *)buf = 138412802;
            v85 = v56;
            __int16 v86 = 2048;
            uint64_t v87 = v35;
            __int16 v88 = 2048;
            uint64_t v89 = v36;
            uint64_t v30 = v25;
            os_log_type_t v31 = OS_LOG_TYPE_DEBUG;
            v32 = "%@ No matching person at location (%.3f, %.3f)";
            uint32_t v33 = 32;
LABEL_20:
            _os_log_impl(&dword_1BBEDA000, v30, v31, v32, buf, v33);
          }
        }

        goto LABEL_22;
      }
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v23 = VCPLogInstance();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v24 = v68[5];
          *(_DWORD *)buf = 138412546;
          v85 = v56;
          __int16 v86 = 2112;
          uint64_t v87 = v24;
          _os_log_impl(&dword_1BBEDA000, v23, OS_LOG_TYPE_DEBUG, "%@ Matching person %@", buf, 0x16u);
        }
      }
      [v12 setPersonLocalIdentifier:v68[5]];
      [v52 addObject:v68[5]];
LABEL_22:

      _Block_object_dispose(&v67, 8);
      _Block_object_dispose(&v73, 8);
    }
    uint64_t v10 = [obj countByEnumeratingWithState:&v79 objects:v92 count:16];
  }
  while (v10);
LABEL_24:

  v37 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  v38 = [MEMORY[0x1E4F391F8] fetchPersonsWithLocalIdentifiers:v52 options:v37];
  uint64_t v39 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v40 = v38;
  uint64_t v41 = [v40 countByEnumeratingWithState:&v57 objects:v83 count:16];
  if (v41)
  {
    uint64_t v42 = *(void *)v58;
    do
    {
      for (uint64_t j = 0; j != v41; ++j)
      {
        if (*(void *)v58 != v42) {
          objc_enumerationMutation(v40);
        }
        v44 = *(void **)(*((void *)&v57 + 1) + 8 * j);
        v45 = [v44 localIdentifier];
        [v39 setObject:v44 forKeyedSubscript:v45];
      }
      uint64_t v41 = [v40 countByEnumeratingWithState:&v57 objects:v83 count:16];
    }
    while (v41);
  }

  id v46 = v39;
  *id v48 = v46;

LABEL_32:
  return 0;
}

void __83__VCPPhotosQuickFaceIdentificationManager__classifyFaces_forAsset_detectedPersons___block_invoke(void *a1)
{
  v52[1] = *MEMORY[0x1E4F143B8];
  if (!objc_msgSend(*(id *)(a1[4] + 24), "mad_useVUGallery")
    || !_os_feature_enabled_impl())
  {
    uint64_t v9 = a1[5];
    uint64_t v10 = *(void *)(a1[4] + 8);
    uint64_t v11 = *(void *)(a1[8] + 8);
    id v42 = *(id *)(v11 + 40);
    uint64_t v12 = +[VCPFaceIDModel classifyFaceObservation:v9 withModel:v10 error:&v42];
    objc_storeStrong((id *)(v11 + 40), v42);
    uint64_t v13 = *(void *)(a1[9] + 8);
    os_signpost_id_t v5 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
    goto LABEL_8;
  }
  uint64_t v2 = a1[5];
  uint64_t v3 = *(void **)(a1[4] + 48);
  uint64_t v4 = *(void *)(a1[8] + 8);
  obuint64_t j = *(id *)(v4 + 40);
  os_signpost_id_t v5 = [v3 recognizeIn:v2 context:0 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  if (!*(void *)(*(void *)(a1[8] + 8) + 40))
  {
    v14 = [v5 firstObject];
    uint64_t v6 = v14;
    if (v14)
    {
      [v14 confidence];
      if (v15 > VCPPersonFaceVIPMatchingThreshold())
      {
        uint64_t v16 = [v6 entityIdentifier];
        id v17 = [v16 stringValue];

        uint64_t v18 = (void *)MEMORY[0x1E4F391F8];
        v52[0] = v17;
        v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:1];
        uint64_t v20 = [v18 fetchPersonsWithMdIDs:v19 options:a1[7]];
        id v21 = [v20 firstObject];

        if (v21)
        {
          uint64_t v22 = [v21 localIdentifier];
          uint64_t v23 = *(void *)(a1[9] + 8);
          uint64_t v24 = *(void **)(v23 + 40);
          *(void *)(v23 + 40) = v22;

          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            v25 = VCPLogInstance();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v26 = a1[6];
              double v27 = [v21 localIdentifier];
              uint64_t v28 = [v6 entityIdentifier];
              double v29 = [v28 stringValue];
              [v6 confidence];
              *(_DWORD *)buf = 138413058;
              uint64_t v45 = v26;
              __int16 v46 = 2112;
              double v47 = v27;
              __int16 v48 = 2112;
              double v49 = v29;
              __int16 v50 = 2048;
              double v51 = v30;
              _os_log_impl(&dword_1BBEDA000, v25, OS_LOG_TYPE_DEBUG, "%@[VU] Identified as %@ %@ with confidence %f", buf, 0x2Au);
            }
LABEL_25:
          }
        }
        else if ((int)MediaAnalysisLogLevel() >= 7)
        {
          v25 = VCPLogInstance();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v38 = a1[6];
            uint64_t v39 = [v6 entityIdentifier];
            double v40 = [v39 stringValue];
            [v6 confidence];
            *(_DWORD *)buf = 138412802;
            uint64_t v45 = v38;
            __int16 v46 = 2112;
            double v47 = v40;
            __int16 v48 = 2048;
            double v49 = v41;
            _os_log_impl(&dword_1BBEDA000, v25, OS_LOG_TYPE_DEBUG, "%@[VU] Identified as %@ with confidence %f, but invalid person", buf, 0x20u);
          }
          goto LABEL_25;
        }

        goto LABEL_27;
      }
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        id v17 = VCPLogInstance();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          uint64_t v36 = a1[6];
          [v6 confidence];
          *(_DWORD *)buf = 138412546;
          uint64_t v45 = v36;
          __int16 v46 = 2048;
          double v47 = v37;
          v32 = "%@[VU] Failed to pass classify confidence %f";
          uint32_t v33 = v17;
          os_log_type_t v34 = OS_LOG_TYPE_INFO;
          uint32_t v35 = 22;
          goto LABEL_21;
        }
        goto LABEL_27;
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 5)
    {
      id v17 = VCPLogInstance();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v31 = a1[6];
        *(_DWORD *)buf = 138412290;
        uint64_t v45 = v31;
        v32 = "%@[VU] No valid identification to face";
        uint32_t v33 = v17;
        os_log_type_t v34 = OS_LOG_TYPE_DEFAULT;
        uint32_t v35 = 12;
LABEL_21:
        _os_log_impl(&dword_1BBEDA000, v33, v34, v32, buf, v35);
      }
LABEL_27:
    }
LABEL_28:

    goto LABEL_8;
  }
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    uint64_t v6 = VCPLogInstance();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = a1[6];
      double v8 = *(double *)(*(void *)(a1[8] + 8) + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v45 = v7;
      __int16 v46 = 2112;
      double v47 = v8;
      _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_DEFAULT, "%@[VU] Failed to classify face - %@", buf, 0x16u);
    }
    goto LABEL_28;
  }
LABEL_8:
}

- (int)processAsset:(id)a3 onDemandDetection:(BOOL)a4 detectedFaces:(id *)a5 detectedPersons:(id *)a6
{
  BOOL v7 = a4;
  v53[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  uint64_t v10 = NSString;
  uint64_t v11 = [v9 localIdentifier];
  uint64_t v12 = [v10 stringWithFormat:@"[%@] QuickFaceID Analysis", v11];

  if (![(PHPhotoLibrary *)self->_photoLibrary mad_useVUGallery]
    || !_os_feature_enabled_impl())
  {
    management = self->_management;
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __104__VCPPhotosQuickFaceIdentificationManager_processAsset_onDemandDetection_detectedFaces_detectedPersons___block_invoke_307;
    v47[3] = &unk_1E6296FF8;
    v47[4] = self;
    dispatch_sync(management, v47);
    if (!self->_personsModel || !self->_faceAnalyzer)
    {
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        double v29 = VCPLogInstance();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          __int16 v50 = v12;
          _os_log_impl(&dword_1BBEDA000, v29, OS_LOG_TYPE_DEFAULT, "%@ Persons Model is not ready; skip processing",
            buf,
            0xCu);
        }
      }
      goto LABEL_29;
    }
LABEL_11:
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      uint64_t v16 = VCPLogInstance();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        int v17 = [v9 deferredProcessingNeeded];
        *(_DWORD *)buf = 138412546;
        __int16 v50 = v12;
        __int16 v51 = 1024;
        LODWORD(v52) = v17;
        _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_INFO, "%@ Analyzing asset (deferType: %d)", buf, 0x12u);
      }
    }
    int v43 = a6;
    uint64_t v18 = VCPSignPostLog();
    os_signpost_id_t spid = os_signpost_id_generate(v18);

    v19 = VCPSignPostLog();
    uint64_t v20 = v19;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v20, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VCPPersonVIPAssetProcessing", "", buf, 2u);
    }

    id v21 = [MEMORY[0x1E4F1CA48] array];
    if (v7)
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        uint64_t v22 = VCPLogInstance();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          __int16 v50 = v12;
          _os_log_impl(&dword_1BBEDA000, v22, OS_LOG_TYPE_DEBUG, "%@ Detecting faces", buf, 0xCu);
        }
      }
      faceAnalyzer = self->_faceAnalyzer;
      id v46 = 0;
      int v24 = [(VCPFaceAnalyzer *)faceAnalyzer quickAnalyzeAsset:v9 results:&v46];
      v25 = v46;
      uint64_t v26 = v25;
      if (v24) {
        goto LABEL_47;
      }
      double v27 = [v25 objectForKeyedSubscript:@"FaceResults"];
      uint64_t v28 = [v27 objectForKeyedSubscript:@"FacesToPersist"];
      [v21 addObjectsFromArray:v28];
    }
    else
    {
      float v30 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
      v53[0] = *MEMORY[0x1E4F39610];
      uint64_t v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:1];
      [v30 setFetchPropertySets:v31];

      [v30 setIncludeNonvisibleFaces:1];
      [v30 setIncludeTorsoOnlyDetectionData:1];
      v32 = [MEMORY[0x1E4F39048] fetchFacesInAsset:v9 options:v30];
      for (unint64_t i = 0; i < [v32 count]; ++i)
      {
        os_log_type_t v34 = [v32 objectAtIndexedSubscript:i];
        uint32_t v35 = +[VCPPhotosFace faceFromPHFace:v34 copyOption:2];
        [v21 addObject:v35];
      }
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        uint64_t v36 = VCPLogInstance();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v37 = [v21 count];
          *(_DWORD *)buf = 138412546;
          __int16 v50 = v12;
          __int16 v51 = 2048;
          uint64_t v52 = v37;
          _os_log_impl(&dword_1BBEDA000, v36, OS_LOG_TYPE_DEBUG, "%@ %lu detected faces", buf, 0x16u);
        }
      }
      int v24 = [(VCPFaceAnalyzer *)self->_faceAnalyzer updateMissingFaceprintForFaces:v21 withAsset:v9];

      if (v24) {
        goto LABEL_48;
      }
    }
    int v24 = [(VCPPhotosQuickFaceIdentificationManager *)self _classifyFaces:v21 forAsset:v9 detectedPersons:v43];
    if (v24)
    {
LABEL_48:

      goto LABEL_49;
    }
    id v38 = v21;
    *a5 = v38;
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      uint64_t v39 = VCPLogInstance();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        uint64_t v40 = [v38 count];
        *(_DWORD *)buf = 138412546;
        __int16 v50 = v12;
        __int16 v51 = 2048;
        uint64_t v52 = v40;
        _os_log_impl(&dword_1BBEDA000, v39, OS_LOG_TYPE_INFO, "%@ processed %lu faces", buf, 0x16u);
      }
    }
    float v41 = VCPSignPostLog();
    uint64_t v26 = v41;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v26, OS_SIGNPOST_INTERVAL_END, spid, "VCPPersonVIPAssetProcessing", "", buf, 2u);
    }
    int v24 = 0;
LABEL_47:

    goto LABEL_48;
  }
  uint64_t v13 = self->_management;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __104__VCPPhotosQuickFaceIdentificationManager_processAsset_onDemandDetection_detectedFaces_detectedPersons___block_invoke;
  block[3] = &unk_1E6296FF8;
  block[4] = self;
  dispatch_sync(v13, block);
  if (self->_vuService && self->_faceAnalyzer) {
    goto LABEL_11;
  }
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    v14 = VCPLogInstance();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v50 = v12;
      _os_log_impl(&dword_1BBEDA000, v14, OS_LOG_TYPE_DEFAULT, "%@ Persons Model is not ready; skip processing",
        buf,
        0xCu);
    }
  }
LABEL_29:
  int v24 = 0;
LABEL_49:

  return v24;
}

void *__104__VCPPhotosQuickFaceIdentificationManager_processAsset_onDemandDetection_detectedFaces_detectedPersons___block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (!result[6]) {
    return (void *)[result _loadPersonsModelAndInitializeFaceAnalyzer];
  }
  return result;
}

void *__104__VCPPhotosQuickFaceIdentificationManager_processAsset_onDemandDetection_detectedFaces_detectedPersons___block_invoke_307(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (!result[1]) {
    return (void *)[result _loadPersonsModelAndInitializeFaceAnalyzer];
  }
  return result;
}

- (int)classifyVIPPets
{
  v97[3] = *MEMORY[0x1E4F143B8];
  management = self->_management;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__VCPPhotosQuickFaceIdentificationManager_classifyVIPPets__block_invoke;
  block[3] = &unk_1E6296FF8;
  block[4] = self;
  dispatch_sync(management, block);
  if (self->_petsModel)
  {
    id v63 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
    [v63 setIncludedDetectionTypes:&unk_1F15EE2C8];
    uint64_t v4 = *MEMORY[0x1E4F39620];
    v97[0] = *MEMORY[0x1E4F39630];
    v97[1] = v4;
    v97[2] = *MEMORY[0x1E4F39610];
    os_signpost_id_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v97 count:3];
    id v62 = self;
    [v63 setFetchPropertySets:v5];

    uint64_t v6 = [MEMORY[0x1E4F39048] fetchFacesWithOptions:v63];
    long long v59 = [MEMORY[0x1E4F1CA48] array];
    v61 = [MEMORY[0x1E4F1CA48] array];
    long long v60 = [MEMORY[0x1E4F1CA60] dictionary];
    for (unint64_t i = 0; ; ++i)
    {
      if (i >= [v6 count])
      {
        v65 = [(PHPhotoLibrary *)v62->_photoLibrary librarySpecificFetchOptions];
        [v65 setIncludedDetectionTypes:&unk_1F15EE2E0];
        id v64 = [MEMORY[0x1E4F391F8] fetchPersonsWithLocalIdentifiers:v61 options:v65];
        uint64_t v39 = [MEMORY[0x1E4F1CA60] dictionary];
        long long v73 = 0u;
        long long v74 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        id v40 = v64;
        uint64_t v41 = [v40 countByEnumeratingWithState:&v71 objects:v82 count:16];
        if (v41)
        {
          uint64_t v42 = *(void *)v72;
          do
          {
            for (uint64_t j = 0; j != v41; ++j)
            {
              if (*(void *)v72 != v42) {
                objc_enumerationMutation(v40);
              }
              v44 = *(void **)(*((void *)&v71 + 1) + 8 * j);
              uint64_t v45 = [v44 localIdentifier];
              [v39 setObject:v44 forKeyedSubscript:v45];
            }
            uint64_t v41 = [v40 countByEnumeratingWithState:&v71 objects:v82 count:16];
          }
          while (v41);
        }

        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __58__VCPPhotosQuickFaceIdentificationManager_classifyVIPPets__block_invoke_325;
        aBlock[3] = &unk_1E6299338;
        id v46 = v59;
        id v68 = v46;
        id v47 = v60;
        id v69 = v47;
        id v48 = v39;
        id v70 = v48;
        double v49 = _Block_copy(aBlock);
        photoLibrary = v62->_photoLibrary;
        id v66 = 0;
        BOOL v51 = [(PHPhotoLibrary *)photoLibrary performChangesAndWait:v49 error:&v66];
        id v52 = v66;
        if (v51)
        {
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            uint64_t v53 = VCPLogInstance();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v54 = [v46 count];
              *(_DWORD *)buf = 134217984;
              *(void *)&uint8_t buf[4] = v54;
              _os_log_impl(&dword_1BBEDA000, v53, OS_LOG_TYPE_DEBUG, "QuickFaceID Pet: classified and persisted %lu Pet PHFace", buf, 0xCu);
            }
          }
          int v55 = 0;
        }
        else
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            long long v57 = VCPLogInstance();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v52;
              _os_log_impl(&dword_1BBEDA000, v57, OS_LOG_TYPE_ERROR, "QuickFaceID Pet: failed to persist pet classification results: %@", buf, 0xCu);
            }
          }
          int v55 = [v52 code];
        }

        goto LABEL_59;
      }
      double v8 = (void *)MEMORY[0x1C186D320]();
      id v9 = [v6 objectAtIndexedSubscript:i];
      if ([v9 nameSource])
      {
        if ((int)MediaAnalysisLogLevel() < 7) {
          goto LABEL_35;
        }
        uint64_t v10 = VCPLogInstance();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v11 = [v9 localIdentifier];
          uint64_t v12 = [v9 nameSource];
          uint64_t v13 = [v9 personLocalIdentifier];
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v11;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v12;
          *(_WORD *)&buf[22] = 2112;
          v94 = v13;
          _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_DEBUG, "QuickFaceID Pet: pet (PHFace) %@ already has a nameSource %ld for petPerson %@; skip",
            buf,
            0x20u);
        }
        goto LABEL_34;
      }
      if (![v9 isInVIPModel]) {
        break;
      }
      if ((int)MediaAnalysisLogLevel() < 7) {
        goto LABEL_35;
      }
      uint64_t v10 = VCPLogInstance();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v14 = [v9 localIdentifier];
        float v15 = [v9 personLocalIdentifier];
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v14;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v15;
        _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_DEBUG, "QuickFaceID Pet: pet (PHFace) %@ is used to train this VIP model with petPerson %@; skip",
          buf,
          0x16u);
      }
LABEL_34:

LABEL_35:
    }
    uint64_t v16 = [v9 faceClusteringProperties];
    int v17 = [v16 faceprint];
    uint64_t v10 = [v17 faceprintData];

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v94 = __Block_byref_object_copy__29;
    v95 = __Block_byref_object_dispose__29;
    id v96 = 0;
    id v18 = objc_alloc(MEMORY[0x1E4F456B8]);
    uint64_t v19 = *(void *)&buf[8];
    obuint64_t j = *(id *)(*(void *)&buf[8] + 40);
    uint64_t v20 = (void *)[v18 initWithState:v10 error:&obj];
    objc_storeStrong((id *)(v19 + 40), obj);
    if (!v20 || *(void *)(*(void *)&buf[8] + 40))
    {
      if ((int)MediaAnalysisLogLevel() < 4)
      {
LABEL_33:

        _Block_object_dispose(buf, 8);
        goto LABEL_34;
      }
      id v21 = VCPLogInstance();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = *(void *)(*(void *)&buf[8] + 40);
        *(_DWORD *)uint64_t v89 = 138412546;
        *(void *)&v89[4] = v9;
        *(_WORD *)&v89[12] = 2112;
        *(void *)&v89[14] = v22;
        _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_DEFAULT, "QuickFaceID Pet: Could not create animalprint for pet (PHFace) %@ - %@", v89, 0x16u);
      }
LABEL_32:

      goto LABEL_33;
    }
    id v23 = objc_alloc(MEMORY[0x1E4F456B0]);
    LODWORD(v24) = 1065336439;
    v25 = (void *)[v23 initWithAnimalprint:v20 confidence:v24];
    *(void *)uint64_t v89 = 0;
    *(void *)&v89[8] = v89;
    *(void *)&v89[16] = 0x3032000000;
    __int16 v90 = __Block_byref_object_copy__29;
    uint64_t v91 = __Block_byref_object_dispose__29;
    id v92 = 0;
    uint64_t v26 = v62->_management;
    v75[0] = MEMORY[0x1E4F143A8];
    v75[1] = 3221225472;
    v75[2] = __58__VCPPhotosQuickFaceIdentificationManager_classifyVIPPets__block_invoke_321;
    v75[3] = &unk_1E629ADD0;
    id v78 = v89;
    id v21 = v25;
    v76 = v21;
    v77 = v62;
    long long v79 = buf;
    dispatch_sync(v26, v75);
    if (*(void *)(*(void *)&buf[8] + 40))
    {
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        double v27 = VCPLogInstance();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v28 = [v9 localIdentifier];
          uint64_t v29 = *(void *)(*(void *)&buf[8] + 40);
          *(_DWORD *)v83 = 138412546;
          v84 = v28;
          __int16 v85 = 2112;
          uint64_t v86 = v29;
          _os_log_impl(&dword_1BBEDA000, v27, OS_LOG_TYPE_DEFAULT, "QuickFaceID Pet: Failed to classify %@ - %@; skip",
            v83,
            0x16u);
        }
LABEL_21:
      }
    }
    else
    {
      if (*(void *)(*(void *)&v89[8] + 40))
      {
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          float v30 = VCPLogInstance();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v31 = [v9 localIdentifier];
            uint64_t v32 = *(void *)(*(void *)&v89[8] + 40);
            *(_DWORD *)v83 = 138412546;
            v84 = v31;
            __int16 v85 = 2112;
            uint64_t v86 = v32;
            _os_log_impl(&dword_1BBEDA000, v30, OS_LOG_TYPE_DEBUG, "QuickFaceID Pet: classified %@ to petPerson %@", v83, 0x16u);
          }
        }
        uint64_t v33 = *(void *)(*(void *)&v89[8] + 40);
        os_log_type_t v34 = [v9 localIdentifier];
        [v60 setObject:v33 forKeyedSubscript:v34];

        [v61 addObject:*(void *)(*(void *)&v89[8] + 40)];
        [v59 addObject:v9];
        goto LABEL_31;
      }
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        double v27 = VCPLogInstance();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          uint32_t v35 = [v9 localIdentifier];
          [v9 centerX];
          uint64_t v37 = v36;
          [v9 centerY];
          *(_DWORD *)v83 = 138412802;
          v84 = v35;
          __int16 v85 = 2048;
          uint64_t v86 = v37;
          __int16 v87 = 2048;
          uint64_t v88 = v38;
          _os_log_impl(&dword_1BBEDA000, v27, OS_LOG_TYPE_DEBUG, "QuickFaceID Pet: did not match %@ (at %.3f, %.3f)", v83, 0x20u);
        }
        goto LABEL_21;
      }
    }
LABEL_31:

    _Block_object_dispose(v89, 8);
    goto LABEL_32;
  }
  if ((int)MediaAnalysisLogLevel() < 4) {
    return 0;
  }
  uint64_t v56 = VCPLogInstance();
  id v63 = v56;
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BBEDA000, v56, OS_LOG_TYPE_DEFAULT, "QuickFaceID Pets Model is not ready; skip classifying",
      buf,
      2u);
  }
  int v55 = 0;
LABEL_59:

  return v55;
}

void *__58__VCPPhotosQuickFaceIdentificationManager_classifyVIPPets__block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (!result[2]) {
    return (void *)[result _loadPetsModel];
  }
  return result;
}

void __58__VCPPhotosQuickFaceIdentificationManager_classifyVIPPets__block_invoke_321(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = *(void *)(a1[5] + 16);
  uint64_t v4 = *(void *)(a1[7] + 8);
  obuint64_t j = *(id *)(v4 + 40);
  uint64_t v5 = +[VCPFaceIDModel classifyAnimalObservation:v2 withModel:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(a1[6] + 8);
  BOOL v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __58__VCPPhotosQuickFaceIdentificationManager_classifyVIPPets__block_invoke_325(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v3 = [obj countByEnumeratingWithState:&v18 objects:v25 count:16];
  if (v3)
  {
    uint64_t v5 = *(void *)v19;
    *(void *)&long long v4 = 138412290;
    long long v16 = v4;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(obj);
        }
        BOOL v7 = *(void **)(*((void *)&v18 + 1) + 8 * v6);
        double v8 = *(void **)(a1 + 40);
        id v9 = objc_msgSend(v7, "localIdentifier", v16);
        uint64_t v10 = [v8 objectForKeyedSubscript:v9];

        if (v10)
        {
          uint64_t v11 = [v2 objectForKeyedSubscript:v10];
          if (v11) {
            goto LABEL_10;
          }
          uint64_t v12 = [*(id *)(a1 + 48) objectForKeyedSubscript:v10];
          if (v12)
          {
            uint64_t v11 = [MEMORY[0x1E4F39208] changeRequestForPerson:v12];
            [v2 setObject:v11 forKeyedSubscript:v10];

LABEL_10:
            uint64_t v22 = v7;
            uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
            [v11 addFaces:v13];

            v14 = [MEMORY[0x1E4F39058] changeRequestForFace:v7];
            [v14 setNameSource:6];

LABEL_11:
            goto LABEL_12;
          }
          if ((int)MediaAnalysisLogLevel() >= 4)
          {
            uint64_t v11 = VCPLogInstance();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v16;
              double v24 = v10;
              _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_DEFAULT, "QuickFaceID Pet: no petPerson %@; skipping",
                buf,
                0xCu);
            }
            goto LABEL_11;
          }
        }
LABEL_12:

        ++v6;
      }
      while (v3 != v6);
      uint64_t v15 = [obj countByEnumeratingWithState:&v18 objects:v25 count:16];
      uint64_t v3 = v15;
    }
    while (v15);
  }
}

- (void)personIdentificationForSyndicationPhotoLibrary:(id)a3 withCancelOrExtendTimeoutBlock:(id)a4
{
  v107[3] = *MEMORY[0x1E4F143B8];
  id v89 = a3;
  __int16 v90 = (uint64_t (**)(void))a4;
  uint64_t v5 = NSString;
  uint64_t v6 = objc_msgSend(v89, "vcp_description");
  __int16 v87 = [v5 stringWithFormat:@"[PersonIdentification][%@]", v6];

  if (objc_msgSend(v89, "vcp_isSyndicationLibrary"))
  {
    if (v90 && (v90[2]() & 1) != 0) {
      goto LABEL_124;
    }
    v84 = [(PHPhotoLibrary *)self->_photoLibrary mad_allPersonsFetchOptionsWithDetectionTypes:0 andVerifiedTypes:&unk_1F15EE2F8];
    __int16 v85 = [v89 librarySpecificFetchOptions];
    [v85 setIncludeOnlyFacesWithFaceprints:1];
    [v85 setIncludeMediaAnalysisProcessingRangeTypes:3];
    uint64_t v7 = *MEMORY[0x1E4F39620];
    v107[0] = *MEMORY[0x1E4F39630];
    v107[1] = v7;
    v107[2] = *MEMORY[0x1E4F39610];
    double v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v107 count:3];
    [v85 setFetchPropertySets:v8];

    id v9 = [MEMORY[0x1E4F39220] mediaProcessingFacesSortDescriptorsForGeneratingPersonModel];
    [v85 setInternalSortDescriptors:v9];

    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"nameSource == %ld", 0);
    [v85 setPredicate:v10];

    uint64_t v88 = [MEMORY[0x1E4F39048] fetchFacesWithOptions:v85];
    if (![v88 count])
    {
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        uint64_t v15 = VCPLogInstance();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v99 = v87;
          _os_log_impl(&dword_1BBEDA000, v15, OS_LOG_TYPE_INFO, "%@ No face needs to identify", buf, 0xCu);
        }
      }
      goto LABEL_122;
    }
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      uint64_t v11 = VCPLogInstance();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v99 = v87;
        __int16 v100 = 2048;
        uint64_t v101 = [v88 count];
        _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_INFO, "%@ Identifying %lu faces", buf, 0x16u);
      }
    }
    if (v90 && (v90[2]() & 1) != 0) {
      goto LABEL_122;
    }
    if ([(PHPhotoLibrary *)self->_photoLibrary mad_useVUGallery]
      && _os_feature_enabled_impl())
    {
      management = self->_management;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __121__VCPPhotosQuickFaceIdentificationManager_personIdentificationForSyndicationPhotoLibrary_withCancelOrExtendTimeoutBlock___block_invoke;
      block[3] = &unk_1E6296FF8;
      block[4] = self;
      dispatch_sync(management, block);
      if (!self->_vuService)
      {
        if ((int)MediaAnalysisLogLevel() >= 4)
        {
          uint64_t v13 = VCPLogInstance();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v99 = v87;
            _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_DEFAULT, "%@[VU] Persons Model is not ready; skip processing",
              buf,
              0xCu);
          }
        }
        goto LABEL_122;
      }
    }
    else
    {
      long long v16 = self->_management;
      v96[0] = MEMORY[0x1E4F143A8];
      v96[1] = 3221225472;
      v96[2] = __121__VCPPhotosQuickFaceIdentificationManager_personIdentificationForSyndicationPhotoLibrary_withCancelOrExtendTimeoutBlock___block_invoke_339;
      v96[3] = &unk_1E6296FF8;
      v96[4] = self;
      dispatch_sync(v16, v96);
      if (!self->_personsModel)
      {
        if ((int)MediaAnalysisLogLevel() >= 5)
        {
          long long v72 = VCPLogInstance();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v99 = v87;
            _os_log_impl(&dword_1BBEDA000, v72, OS_LOG_TYPE_DEFAULT, "%@ VIP Persons Model is not ready", buf, 0xCu);
          }
        }
        goto LABEL_122;
      }
    }
    long long v82 = [MEMORY[0x1E4F1CA60] dictionary];
    unint64_t v17 = 0;
    uint64_t v18 = 0;
    while (1)
    {
      if (v17 >= [v88 count])
      {
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          v61 = VCPLogInstance();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
          {
            uint64_t v62 = [v82 count];
            uint64_t v63 = [v88 count];
            *(_DWORD *)buf = 138412802;
            v99 = v87;
            __int16 v100 = 2048;
            uint64_t v101 = v62;
            __int16 v102 = 2048;
            double v103 = *(double *)&v63;
            _os_log_impl(&dword_1BBEDA000, v61, OS_LOG_TYPE_INFO, "%@ Identified %lu out of %lu faces", buf, 0x20u);
          }
        }
        if ([v82 count])
        {
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __121__VCPPhotosQuickFaceIdentificationManager_personIdentificationForSyndicationPhotoLibrary_withCancelOrExtendTimeoutBlock___block_invoke_344;
          aBlock[3] = &unk_1E6296FF8;
          id v93 = v82;
          id v64 = _Block_copy(aBlock);
          id v91 = 0;
          int v65 = [v89 performChangesAndWait:v64 error:&v91];
          id v66 = v91;
          if (v65)
          {
            if ((int)MediaAnalysisLogLevel() >= 6)
            {
              uint64_t v67 = VCPLogInstance();
              if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v99 = v87;
                id v68 = "%@ Successfully persisted identification results";
                id v69 = v67;
                os_log_type_t v70 = OS_LOG_TYPE_INFO;
                uint32_t v71 = 12;
                goto LABEL_118;
              }
              goto LABEL_119;
            }
          }
          else if ((int)MediaAnalysisLogLevel() >= 3)
          {
            uint64_t v67 = VCPLogInstance();
            if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v99 = v87;
              __int16 v100 = 2112;
              uint64_t v101 = (uint64_t)v66;
              id v68 = "%@ Failed to persist identification results - %@";
              id v69 = v67;
              os_log_type_t v70 = OS_LOG_TYPE_ERROR;
              uint32_t v71 = 22;
LABEL_118:
              _os_log_impl(&dword_1BBEDA000, v69, v70, v68, buf, v71);
            }
LABEL_119:
          }
        }
LABEL_121:

LABEL_122:
LABEL_123:

        goto LABEL_124;
      }
      uint64_t v19 = v18;
      long long v20 = (void *)MEMORY[0x1C186D320]();
      if (!v90 || (v90[2]() & 1) == 0) {
        break;
      }
      int v21 = 1;
LABEL_95:
      if (v21 && v21 != 14) {
        goto LABEL_121;
      }
      ++v17;
    }
    uint64_t v22 = [v88 objectAtIndexedSubscript:v17];
    id v23 = NSString;
    double v24 = [v22 localIdentifier];
    v25 = [v23 stringWithFormat:@"%@[%@]", v87, v24];

    uint64_t v26 = [v22 faceClusteringProperties];
    double v27 = [v26 faceprint];

    if (v27)
    {
      uint64_t v28 = [v27 faceprintData];
      uint64_t v29 = +[VCPFaceIDModel faceObservationFromFaceprintData:v28];

      if (v29)
      {
        if ([(PHPhotoLibrary *)self->_photoLibrary mad_useVUGallery]
          && _os_feature_enabled_impl())
        {
          vuService = self->_vuService;
          id v95 = 0;
          v83 = [(GDVUVisualUnderstandingService *)vuService recognizeIn:v29 context:0 error:&v95];
          long long v80 = v95;
          if (v80)
          {
            if ((int)MediaAnalysisLogLevel() >= 4)
            {
              uint64_t v31 = VCPLogInstance();
              if (os_log_type_enabled(v31, (os_log_type_t)v19))
              {
                *(_DWORD *)buf = 138412546;
                v99 = v25;
                __int16 v100 = 2112;
                uint64_t v101 = (uint64_t)v80;
                _os_log_impl(&dword_1BBEDA000, v31, (os_log_type_t)v19, "%@[VU] Failed to classify face - %@", buf, 0x16u);
              }
            }
            int v21 = 14;
            uint64_t v32 = v80;
            goto LABEL_92;
          }
          int v43 = [v83 firstObject];
          v44 = v43;
          if (v43)
          {
            [v43 confidence];
            if (v45 <= VCPPersonFaceVIPMatchingThreshold())
            {
              if ((int)MediaAnalysisLogLevel() < 7)
              {
LABEL_86:

                int v21 = 0;
                goto LABEL_51;
              }
              int v55 = VCPLogInstance();
              long long v79 = v44;
              if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
              {
                long long v57 = NSNumber;
                [v44 confidence];
                long long v58 = objc_msgSend(v57, "numberWithFloat:");
                *(_DWORD *)buf = 138412546;
                v99 = v25;
                __int16 v100 = 2112;
                uint64_t v101 = (uint64_t)v58;
                _os_log_impl(&dword_1BBEDA000, v55, OS_LOG_TYPE_DEBUG, "%@[VU] Face not identified, confidence:%@", buf, 0x16u);
              }
LABEL_85:

              v44 = v79;
              goto LABEL_86;
            }
            id v46 = [v44 entityIdentifier];
            long long v79 = v44;
            uint64_t v76 = [v46 stringValue];

            id v47 = (void *)MEMORY[0x1E4F391F8];
            uint64_t v106 = v76;
            id v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v106 count:1];
            double v49 = [v47 fetchPersonsWithMdIDs:v48 options:v84];
            __int16 v50 = [v49 firstObject];

            if (v50)
            {
              if ((int)MediaAnalysisLogLevel() >= 7)
              {
                BOOL v51 = VCPLogInstance();
                if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
                {
                  long long v74 = [v50 localIdentifier];
                  long long v73 = [v79 entityIdentifier];
                  id v52 = [v73 stringValue];
                  [v79 confidence];
                  *(_DWORD *)buf = 138413058;
                  v99 = v25;
                  __int16 v100 = 2112;
                  uint64_t v101 = (uint64_t)v74;
                  __int16 v102 = 2112;
                  double v103 = *(double *)&v52;
                  __int16 v104 = 2048;
                  double v105 = v53;
                  _os_log_impl(&dword_1BBEDA000, v51, OS_LOG_TYPE_DEBUG, "%@[VU] Identified as %@ (%@) with confidence:%.2f", buf, 0x2Au);
                }
              }
              uint64_t v54 = [v50 localIdentifier];
              [v82 setObject:v54 forKeyedSubscript:v22];
            }
            else
            {
              if ((int)MediaAnalysisLogLevel() < 7) {
                goto LABEL_77;
              }
              uint64_t v54 = VCPLogInstance();
              if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v75 = [v79 entityIdentifier];
                long long v59 = [v75 stringValue];
                [v79 confidence];
                *(_DWORD *)buf = 138412802;
                v99 = v25;
                __int16 v100 = 2112;
                uint64_t v101 = (uint64_t)v59;
                __int16 v102 = 2048;
                double v103 = v60;
                _os_log_impl(&dword_1BBEDA000, v54, OS_LOG_TYPE_DEBUG, "%@[VU] Identified as %@ with confidence:%.2f, but invalid person", buf, 0x20u);
              }
            }

LABEL_77:
            int v55 = v76;
            goto LABEL_85;
          }
          if ((int)MediaAnalysisLogLevel() >= 5)
          {
            uint64_t v56 = VCPLogInstance();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v99 = v25;
              _os_log_impl(&dword_1BBEDA000, v56, OS_LOG_TYPE_DEFAULT, "%@[VU] No valid identification", buf, 0xCu);
            }
          }
LABEL_50:
          int v21 = 14;
LABEL_51:
          uint64_t v32 = v83;
LABEL_92:

          goto LABEL_93;
        }
        personsModel = self->_personsModel;
        id v94 = 0;
        uint64_t v32 = [(VNPersonsModel *)personsModel predictPersonFromFaceObservation:v29 limit:1 canceller:0 error:&v94];
        v83 = v94;
        if (v83)
        {
          if ((int)MediaAnalysisLogLevel() >= 4)
          {
            os_log_type_t v34 = VCPLogInstance();
            if (os_log_type_enabled(v34, (os_log_type_t)v19))
            {
              *(_DWORD *)buf = 138412546;
              v99 = v25;
              __int16 v100 = 2112;
              uint64_t v101 = (uint64_t)v83;
              _os_log_impl(&dword_1BBEDA000, v34, (os_log_type_t)v19, "%@ Face identification process failed - %@; skipping",
                buf,
                0x16u);
            }
          }
          goto LABEL_50;
        }
        long long v81 = [v32 firstObject];
        [v81 confidence];
        if (v35 <= VCPPersonFaceVIPMatchingThreshold())
        {
          if ((int)MediaAnalysisLogLevel() < 7)
          {
LABEL_91:

            int v21 = 0;
            goto LABEL_92;
          }
          uint64_t v38 = VCPLogInstance();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v40 = (uint64_t)v77;
            if (v81)
            {
              uint64_t v41 = NSNumber;
              [v81 confidence];
              uint64_t v40 = objc_msgSend(v41, "numberWithFloat:");
              uint64_t v42 = (__CFString *)v40;
            }
            else
            {
              uint64_t v42 = @"NaN";
            }
            v77 = (void *)v40;
            *(_DWORD *)buf = 138412546;
            v99 = v25;
            __int16 v100 = 2112;
            uint64_t v101 = (uint64_t)v42;
            _os_log_impl(&dword_1BBEDA000, v38, OS_LOG_TYPE_DEBUG, "%@ Face not identified, confidence:%@", buf, 0x16u);
            if (v81) {
          }
            }
        }
        else
        {
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            uint64_t v36 = VCPLogInstance();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
            {
              id v78 = [v81 predictedPersonUniqueIdentifier];
              [v81 confidence];
              *(_DWORD *)buf = 138412802;
              v99 = v25;
              __int16 v100 = 2112;
              uint64_t v101 = (uint64_t)v78;
              __int16 v102 = 2048;
              double v103 = v37;
              _os_log_impl(&dword_1BBEDA000, v36, OS_LOG_TYPE_DEBUG, "%@ Face identified as %@ confidence:%.2f", buf, 0x20u);
            }
          }
          uint64_t v38 = [v32 firstObject];
          uint64_t v39 = [v38 predictedPersonUniqueIdentifier];
          [v82 setObject:v39 forKeyedSubscript:v22];
        }
        goto LABEL_91;
      }
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        uint64_t v32 = VCPLogInstance();
        if (os_log_type_enabled(v32, (os_log_type_t)v19))
        {
          *(_DWORD *)buf = 138412290;
          v99 = v25;
          _os_log_impl(&dword_1BBEDA000, v32, (os_log_type_t)v19, "%@ Failed to obtain face observation; skipping",
            buf,
            0xCu);
        }
        int v21 = 14;
        goto LABEL_92;
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 4)
      {
        int v21 = 14;
LABEL_94:

        uint64_t v18 = v19;
        goto LABEL_95;
      }
      uint64_t v29 = VCPLogInstance();
      if (os_log_type_enabled(v29, (os_log_type_t)v19))
      {
        *(_DWORD *)buf = 138412290;
        v99 = v25;
        _os_log_impl(&dword_1BBEDA000, v29, (os_log_type_t)v19, "%@ Failed to obtain faceprint; skipping", buf, 0xCu);
      }
    }
    int v21 = 14;
LABEL_93:

    goto LABEL_94;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v14 = VCPLogInstance();
    v84 = v14;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v99 = v87;
      _os_log_impl(&dword_1BBEDA000, v14, OS_LOG_TYPE_ERROR, "%@ Unsupported library", buf, 0xCu);
    }
    goto LABEL_123;
  }
LABEL_124:
}

void *__121__VCPPhotosQuickFaceIdentificationManager_personIdentificationForSyndicationPhotoLibrary_withCancelOrExtendTimeoutBlock___block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (!result[6]) {
    return (void *)[result _loadPersonsModelAndInitializeFaceAnalyzer];
  }
  return result;
}

void *__121__VCPPhotosQuickFaceIdentificationManager_personIdentificationForSyndicationPhotoLibrary_withCancelOrExtendTimeoutBlock___block_invoke_339(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (!result[1]) {
    return (void *)[result _loadPersonsModelAndInitializeFaceAnalyzer];
  }
  return result;
}

void __121__VCPPhotosQuickFaceIdentificationManager_personIdentificationForSyndicationPhotoLibrary_withCancelOrExtendTimeoutBlock___block_invoke_344(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v12 != v3) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v6 = [MEMORY[0x1E4F39058] changeRequestForFace:v5];
        uint64_t v7 = (void *)MEMORY[0x1E4F391C8];
        double v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
        id v9 = [v7 uuidFromLocalIdentifier:v8];

        [v6 associateFaceWithPersonUUID:v9];
        [v6 setNameSource:6];
      }
      uint64_t v2 = [obj countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v2);
  }
}

- (BOOL)_persistPersonsModel:(id)a3 evaluationMode:(BOOL)a4 error:(id *)a5
{
  id v7 = a3;
  double v8 = [(PHPhotoLibrary *)self->_photoLibrary vcp_vipModelFilepathForVIPType:0];
  LOBYTE(a5) = +[VCPFaceIDModel persistModel:v7 toPath:v8 error:a5];

  return (char)a5;
}

- (BOOL)_persistPetsModel:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(PHPhotoLibrary *)self->_photoLibrary vcp_vipModelFilepathForVIPType:1];
  LOBYTE(a4) = +[VCPFaceIDModel persistPetsModel:v6 toPath:v7 error:a4];

  return (char)a4;
}

- (id)_fetchPersonsToFeedVIPModel:(BOOL)a3 allowUnverifiedPerson:(BOOL)a4
{
  BOOL v4 = a4;
  v17[2] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  id v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"verifiedType = %@ OR verifiedType = %@", &unk_1F15ED038, &unk_1F15ED050];
  [v5 setPredicate:v6];

  if (v4)
  {
    id v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"verifiedType = %@", &unk_1F15ED098];
    double v8 = [v5 predicate];
    v17[0] = v8;
    v17[1] = v7;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];

    uint64_t v10 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v9];
    [v5 setPredicate:v10];
  }
  long long v11 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"faceCount" ascending:0];
  v16[0] = v11;
  long long v12 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:0];
  v16[1] = v12;
  long long v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  [v5 setSortDescriptors:v13];

  long long v14 = [MEMORY[0x1E4F391F8] fetchPersonsWithOptions:v5];

  return v14;
}

- (id)_fetchPetsToFeedVIPModel
{
  v8[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  [v2 setFetchLimit:100];
  uint64_t v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"faceCount" ascending:0];
  v8[0] = v3;
  BOOL v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:0];
  v8[1] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  [v2 setSortDescriptors:v5];

  [v2 setIncludedDetectionTypes:&unk_1F15EE310];
  [v2 setMinimumVerifiedFaceCount:0];
  [v2 setMinimumUnverifiedFaceCount:0];
  [v2 setIncludeTorsoOnlyPerson:0];
  id v6 = [MEMORY[0x1E4F391F8] fetchPersonsWithOptions:v2];

  return v6;
}

- (id)fetchEntityForModelType:(unint64_t)a3 evaluationMode:(BOOL)a4 allowUnverifiedPerson:(BOOL)a5
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a3 == 1)
  {
    id v6 = [(VCPPhotosQuickFaceIdentificationManager *)self _fetchPetsToFeedVIPModel];
  }
  else if (a3)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v7 = VCPLogInstance();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v9 = 134217984;
        unint64_t v10 = a3;
        _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_ERROR, "QuickFaceID Model: unknown VIP type (%lu); no entity fetched",
          (uint8_t *)&v9,
          0xCu);
      }
    }
    id v6 = 0;
  }
  else
  {
    id v6 = [(VCPPhotosQuickFaceIdentificationManager *)self _fetchPersonsToFeedVIPModel:a4 allowUnverifiedPerson:a5];
  }
  return v6;
}

- (int)_generatePetsModelWithExtendTimeoutBlock:(id)a3 cancel:(id)a4
{
  v145[1] = *MEMORY[0x1E4F143B8];
  uint64_t v88 = (void (**)(void))a3;
  id v93 = (unsigned int (**)(void))a4;
  __int16 v87 = self;
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    id v6 = VCPLogInstance();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_DEBUG, "QuickFaceID Pets Model: Begin Pets model generation", buf, 2u);
    }
  }
  uint64_t v89 = mach_absolute_time();
  id v7 = VCPSignPostLog();
  os_signpost_id_t spid = os_signpost_id_generate(v7);

  double v8 = VCPSignPostLog();
  int v9 = v8;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v9, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VCPPetVIPGenerateModel", "", buf, 2u);
  }

  v83 = [(VCPPhotosQuickFaceIdentificationManager *)self fetchEntityForModelType:1 evaluationMode:0 allowUnverifiedPerson:0];
  v97 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  v145[0] = *MEMORY[0x1E4F39610];
  unint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v145 count:1];
  [v97 setFetchPropertySets:v10];

  [v97 setIncludeOnlyFacesWithFaceprints:1];
  [v97 setFetchLimit:512];
  uint64_t v11 = [MEMORY[0x1E4F39220] mediaProcessingFacesSortDescriptorsForGeneratingPersonModel];
  [v97 setInternalSortDescriptors:v11];

  long long v12 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"nameSource != %ld", 6);
  [v97 setPredicate:v12];

  [v97 setIncludedDetectionTypes:&unk_1F15EE328];
  __int16 v85 = [[VCPPhotosFaceProcessingContext alloc] initWithPhotoLibrary:self->_photoLibrary];
  id v13 = objc_alloc_init(MEMORY[0x1E4F45738]);
  id v132 = v13;
  int v14 = +[VCPFaceUtils configureVNRequest:&v132 withClass:objc_opt_class() andProcessingVersion:[(VCPPhotosFaceProcessingContext *)v85 processingVersion]];
  id v86 = v132;

  if (!v14)
  {
    id v131 = 0;
    uint64_t v16 = [MEMORY[0x1E4F457E0] newConfigurationForEntityPrintsGeneratedByRequest:v86 error:&v131];
    unint64_t v17 = v131;
    uint64_t v18 = v17;
    long long v81 = (void *)v16;
    if (!v16 || v17)
    {
      long long v82 = v17;
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        int v14 = -18;
        goto LABEL_110;
      }
      id v78 = VCPLogInstance();
      id v94 = v78;
      if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v139 = v18;
        _os_log_impl(&dword_1BBEDA000, v78, OS_LOG_TYPE_ERROR, "QuickFaceID Pets Model: Failed to create VNEntityIdentificationModelConfiguration - %@", buf, 0xCu);
      }
    }
    else
    {
      id v130 = 0;
      uint64_t v19 = [MEMORY[0x1E4F458A8] modelWithConfiguration:v16 error:&v130];
      long long v20 = v130;
      id v94 = (void *)v19;
      if (v19 && !v20)
      {
        int v21 = [MEMORY[0x1E4F1CA60] dictionary];
        long long v128 = 0u;
        long long v129 = 0u;
        long long v126 = 0u;
        long long v127 = 0u;
        uint64_t v22 = v83;
        obuint64_t j = v22;
        uint64_t v23 = [v22 countByEnumeratingWithState:&v126 objects:v144 count:16];
        if (!v23) {
          goto LABEL_40;
        }
        int v14 = 0;
        uint64_t v24 = *(void *)v127;
        while (1)
        {
          uint64_t v25 = 0;
          do
          {
            if (*(void *)v127 != v24) {
              objc_enumerationMutation(obj);
            }
            uint64_t v26 = *(void **)(*((void *)&v126 + 1) + 8 * v25);
            double v27 = (void *)MEMORY[0x1C186D320]();
            if (!v93 || !v93[2]())
            {
              uint64_t v28 = [MEMORY[0x1E4F39048] fetchFacesForPerson:v26 options:v97];
              if ((int)MediaAnalysisLogLevel() >= 7)
              {
                float v30 = VCPLogInstance();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
                {
                  uint64_t v31 = [v26 localIdentifier];
                  uint64_t v32 = [v28 count];
                  *(_DWORD *)buf = 138412802;
                  v139 = v31;
                  __int16 v140 = 2048;
                  uint64_t v141 = v32;
                  __int16 v142 = 2112;
                  v143 = v28;
                  _os_log_impl(&dword_1BBEDA000, v30, OS_LOG_TYPE_DEBUG, "QuickFaceID Pets Model: petPerson: %@, petFaceFetchResult(%lu): %@", buf, 0x20u);
                }
              }
              v122[0] = MEMORY[0x1E4F143A8];
              v122[1] = 3221225472;
              v122[2] = __91__VCPPhotosQuickFaceIdentificationManager__generatePetsModelWithExtendTimeoutBlock_cancel___block_invoke;
              v122[3] = &unk_1E629ADF8;
              v123 = v21;
              id v124 = v94;
              v125 = v26;
              +[VCPPhotosPersistenceDelegate enumerateFetchResult:v28 withBatchSize:128 handler:v122];
              if (v88) {
                v88[2]();
              }

              int v29 = 1;
              goto LABEL_34;
            }
            if ((int)MediaAnalysisLogLevel() >= 4)
            {
              uint64_t v28 = VCPLogInstance();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1BBEDA000, v28, OS_LOG_TYPE_DEFAULT, "QuickFaceID Pets Model: Model generation cancelled; quitting\n",
                  buf,
                  2u);
              }
              int v29 = 0;
              int v14 = -128;
LABEL_34:

              goto LABEL_35;
            }
            int v29 = 0;
            int v14 = -128;
LABEL_35:
            if (!v29)
            {
              long long v82 = 0;
              uint64_t v40 = obj;
              goto LABEL_102;
            }
            ++v25;
          }
          while (v23 != v25);
          uint64_t v22 = obj;
          uint64_t v33 = [obj countByEnumeratingWithState:&v126 objects:v144 count:16];
          uint64_t v23 = v33;
          if (!v33)
          {
LABEL_40:

            os_log_type_t v34 = VCPSignPostLog();
            float v35 = v34;
            if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v35, OS_SIGNPOST_INTERVAL_END, spid, "VCPPetVIPGenerateModel", "", buf, 2u);
            }

            uint64_t v36 = obj;
            if (v89)
            {
              mach_absolute_time();
              VCPPerformance_LogMeasurement();
            }
            if ((int)MediaAnalysisLogLevel() >= 7)
            {
              float v37 = VCPLogInstance();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1BBEDA000, v37, OS_LOG_TYPE_DEBUG, "QuickFaceID Pets Model: Finished model generation", buf, 2u);
              }

              uint64_t v36 = obj;
            }
            id v121 = 0;
            BOOL v38 = [(VCPPhotosQuickFaceIdentificationManager *)v87 _persistPetsModel:v94 error:&v121];
            uint64_t v39 = v121;
            long long v82 = v39;
            if (v38)
            {
              uint64_t v40 = [MEMORY[0x1E4F1CA80] set];
              long long v119 = 0u;
              long long v120 = 0u;
              long long v117 = 0u;
              long long v118 = 0u;
              v84 = v36;
              uint64_t v41 = [v84 countByEnumeratingWithState:&v117 objects:v137 count:16];
              if (!v41) {
                goto LABEL_71;
              }
              uint64_t v90 = *(void *)v118;
              while (1)
              {
                uint64_t v42 = 0;
                id obja = (id)v41;
                do
                {
                  if (*(void *)v118 != v90) {
                    objc_enumerationMutation(v84);
                  }
                  int v43 = *(void **)(*((void *)&v117 + 1) + 8 * (void)v42);
                  context = (void *)MEMORY[0x1C186D320]();
                  v44 = [v43 localIdentifier];
                  id v116 = 0;
                  v98 = [v94 trainingObservationsForEntityWithUniqueIdentifier:v44 canceller:0 error:&v116];
                  id spida = v116;

                  if (spida)
                  {
                    if ((int)MediaAnalysisLogLevel() < 4) {
                      goto LABEL_69;
                    }
                    float v45 = VCPLogInstance();
                    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
                    {
                      id v46 = [v43 localIdentifier];
                      *(_DWORD *)buf = 138412546;
                      v139 = v46;
                      __int16 v140 = 2112;
                      uint64_t v141 = (uint64_t)spida;
                      _os_log_impl(&dword_1BBEDA000, v45, OS_LOG_TYPE_DEFAULT, "QuickFaceID Pets Model: Could not get animalObservations for pet %@ - %@", buf, 0x16u);
                    }
                  }
                  else
                  {
                    long long v114 = 0u;
                    long long v115 = 0u;
                    long long v112 = 0u;
                    long long v113 = 0u;
                    float v45 = v98;
                    uint64_t v47 = [v45 countByEnumeratingWithState:&v112 objects:v136 count:16];
                    if (v47)
                    {
                      uint64_t v48 = *(void *)v113;
                      do
                      {
                        for (uint64_t i = 0; i != v47; ++i)
                        {
                          if (*(void *)v113 != v48) {
                            objc_enumerationMutation(v45);
                          }
                          __int16 v50 = [*(id *)(*((void *)&v112 + 1) + 8 * i) uuid];
                          BOOL v51 = [v50 UUIDString];
                          id v52 = [v21 objectForKeyedSubscript:v51];

                          if (v52) {
                            [v40 addObject:v52];
                          }
                        }
                        uint64_t v47 = [v45 countByEnumeratingWithState:&v112 objects:v136 count:16];
                      }
                      while (v47);
                    }
                  }

LABEL_69:
                  uint64_t v42 = (char *)v42 + 1;
                }
                while (v42 != obja);
                uint64_t v41 = [v84 countByEnumeratingWithState:&v117 objects:v137 count:16];
                if (!v41)
                {
LABEL_71:

                  float v53 = [(PHPhotoLibrary *)v87->_photoLibrary librarySpecificFetchOptions];
                  uint64_t v54 = *MEMORY[0x1E4F39630];
                  uint64_t v135 = *MEMORY[0x1E4F39630];
                  spidb = v53;
                  int v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v135 count:1];
                  [v53 setFetchPropertySets:v55];

                  uint64_t v56 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"isInVIPModel == YES"];
                  [v53 setPredicate:v56];

                  [v53 setIncludedDetectionTypes:&unk_1F15EE340];
                  contexta = [MEMORY[0x1E4F39048] fetchFacesWithOptions:v53];
                  long long v57 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(contexta, "count"));
                  long long v110 = 0u;
                  long long v111 = 0u;
                  long long v108 = 0u;
                  long long v109 = 0u;
                  id v58 = contexta;
                  uint64_t v59 = [v58 countByEnumeratingWithState:&v108 objects:v134 count:16];
                  if (v59)
                  {
                    uint64_t v60 = *(void *)v109;
                    do
                    {
                      for (uint64_t j = 0; j != v59; ++j)
                      {
                        if (*(void *)v109 != v60) {
                          objc_enumerationMutation(v58);
                        }
                        uint64_t v62 = [*(id *)(*((void *)&v108 + 1) + 8 * j) localIdentifier];
                        [v57 addObject:v62];
                      }
                      uint64_t v59 = [v58 countByEnumeratingWithState:&v108 objects:v134 count:16];
                    }
                    while (v59);
                  }

                  uint64_t v63 = (void *)[v57 mutableCopy];
                  [v63 minusSet:v40];
                  id v64 = [v40 mutableCopy];
                  [v64 minusSet:v57];
                  int v65 = [v63 allObjects];
                  id v66 = [v64 allObjects];
                  v99 = [v65 arrayByAddingObjectsFromArray:v66];

                  if ([v99 count])
                  {
                    uint64_t v67 = [(PHPhotoLibrary *)v87->_photoLibrary librarySpecificFetchOptions];
                    uint64_t v133 = v54;
                    id v68 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v133 count:1];
                    [v67 setFetchPropertySets:v68];

                    [v67 setIncludedDetectionTypes:&unk_1F15EE358];
                    photoLibrary = v87->_photoLibrary;
                    v104[0] = MEMORY[0x1E4F143A8];
                    v104[1] = 3221225472;
                    v104[2] = __91__VCPPhotosQuickFaceIdentificationManager__generatePetsModelWithExtendTimeoutBlock_cancel___block_invoke_385;
                    v104[3] = &unk_1E6299338;
                    id v105 = v99;
                    id v70 = v67;
                    id v106 = v70;
                    id v107 = v64;
                    id v103 = 0;
                    BOOL v71 = [(PHPhotoLibrary *)photoLibrary performChangesAndWait:v104 error:&v103];
                    long long v72 = v103;
                    if (v72) {
                      BOOL v73 = 0;
                    }
                    else {
                      BOOL v73 = v71;
                    }
                    if (!v73 && (int)MediaAnalysisLogLevel() >= 3)
                    {
                      long long v74 = VCPLogInstance();
                      if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412290;
                        v139 = v72;
                        _os_log_impl(&dword_1BBEDA000, v74, OS_LOG_TYPE_ERROR, "QuickFaceID Pets Model: Could not persist isInVIPModel on trained pets - %@", buf, 0xCu);
                      }
                    }
                  }
                  uint64_t v75 = v87->_photoLibrary;
                  uint64_t v76 = [MEMORY[0x1E4F1C9C8] date];
                  [(PHPhotoLibrary *)v75 vcp_setAnalysisPreferencesValue:v76 forKey:@"PetIDModelLastGenerationKey"];

                  if ((int)MediaAnalysisLogLevel() >= 6)
                  {
                    v77 = VCPLogInstance();
                    if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_1BBEDA000, v77, OS_LOG_TYPE_INFO, "QuickFaceID Pets Model: Finished model generation and persistence", buf, 2u);
                    }
                  }
                  int v14 = 0;
                  goto LABEL_102;
                }
              }
            }
            long long v79 = v39;
            if ((int)MediaAnalysisLogLevel() >= 3)
            {
              uint64_t v40 = VCPLogInstance();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v139 = v79;
                _os_log_impl(&dword_1BBEDA000, v40, OS_LOG_TYPE_ERROR, "QuickFaceID Pets Model: Failed to persist pet model %@", buf, 0xCu);
              }
              int v14 = -18;
LABEL_102:

LABEL_108:
LABEL_109:

LABEL_110:
              uint64_t v15 = v82;
LABEL_111:

              goto LABEL_112;
            }
LABEL_107:
            int v14 = -18;
            goto LABEL_108;
          }
        }
      }
      long long v82 = v20;
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        int v21 = VCPLogInstance();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v139 = v82;
          _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_ERROR, "Failed to create VNMutableEntityIdentificationModel - %@", buf, 0xCu);
        }
        goto LABEL_107;
      }
    }
    int v14 = -18;
    goto LABEL_109;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    uint64_t v15 = VCPLogInstance();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v15, OS_LOG_TYPE_ERROR, "QuickFaceID Pets Model: Failed to initialize VNAnimalObservation", buf, 2u);
    }
    goto LABEL_111;
  }
LABEL_112:

  return v14;
}

void __91__VCPPhotosQuickFaceIdentificationManager__generatePetsModelWithExtendTimeoutBlock_cancel___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v28 = a2;
  float v30 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v28, "count"));
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  obuint64_t j = v28;
  uint64_t v2 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v2)
  {
    uint64_t v32 = *(void *)v37;
    do
    {
      uint64_t v33 = v2;
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v37 != v32) {
          objc_enumerationMutation(obj);
        }
        BOOL v4 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        uint64_t v5 = [v4 faceClusteringProperties];
        id v6 = [v5 faceprint];
        id v7 = [v6 faceprintData];

        id v8 = objc_alloc(MEMORY[0x1E4F456B8]);
        id v35 = 0;
        int v9 = (void *)[v8 initWithState:v7 error:&v35];
        id v10 = v35;
        uint64_t v11 = v10;
        if (v9) {
          BOOL v12 = v10 == 0;
        }
        else {
          BOOL v12 = 0;
        }
        if (v12)
        {
          id v14 = objc_alloc(MEMORY[0x1E4F456B0]);
          LODWORD(v15) = 1065336439;
          id v13 = [v14 initWithAnimalprint:v9 confidence:v15];
          if (v13)
          {
            [v30 addObject:v13];
            uint64_t v16 = [v4 localIdentifier];
            unint64_t v17 = *(void **)(a1 + 32);
            uint64_t v18 = [v13 uuid];
            uint64_t v19 = [v18 UUIDString];
            [v17 setObject:v16 forKeyedSubscript:v19];
          }
          else
          {
            if ((int)MediaAnalysisLogLevel() < 4) {
              goto LABEL_16;
            }
            uint64_t v16 = VCPLogInstance();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v41 = (uint64_t)v4;
              _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_DEFAULT, "QuickFaceID Pets Model: Could not add animalObservation to model for pet (PHFace): %@.", buf, 0xCu);
            }
          }
        }
        else
        {
          if ((int)MediaAnalysisLogLevel() < 4) {
            goto LABEL_17;
          }
          id v13 = VCPLogInstance();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v41 = (uint64_t)v4;
            __int16 v42 = 2112;
            int v43 = v11;
            _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_DEFAULT, "QuickFaceID Pets Model: Could not create animalprint for pet (PHFace): %@ - %@", buf, 0x16u);
          }
        }
LABEL_16:

LABEL_17:
      }
      uint64_t v2 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
    }
    while (v2);
  }

  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    long long v20 = VCPLogInstance();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v21 = [v30 count];
      *(_DWORD *)buf = 134218242;
      uint64_t v41 = v21;
      __int16 v42 = 2112;
      int v43 = v30;
      _os_log_impl(&dword_1BBEDA000, v20, OS_LOG_TYPE_DEBUG, "QuickFaceID Pets Model: animalObservations(%lu): %@", buf, 0x16u);
    }
  }
  if ([v30 count])
  {
    uint64_t v22 = *(void **)(a1 + 40);
    uint64_t v23 = [*(id *)(a1 + 48) localIdentifier];
    id v34 = 0;
    char v24 = [v22 addObservations:v30 toEntityWithUniqueIdentifier:v23 error:&v34];
    id v25 = v34;

    if (v25) {
      char v26 = 0;
    }
    else {
      char v26 = v24;
    }
    if ((v26 & 1) == 0 && (int)MediaAnalysisLogLevel() >= 3)
    {
      double v27 = VCPLogInstance();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v41 = (uint64_t)v25;
        _os_log_impl(&dword_1BBEDA000, v27, OS_LOG_TYPE_ERROR, "QuickFaceID Pets Model: Could not add animalprint to model - %@", buf, 0xCu);
      }
    }
  }
}

void __91__VCPPhotosQuickFaceIdentificationManager__generatePetsModelWithExtendTimeoutBlock_cancel___block_invoke_385(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F39048], "fetchFacesWithLocalIdentifiers:options:", a1[4], a1[5], 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        id v7 = [MEMORY[0x1E4F39058] changeRequestForFace:v6];
        id v8 = (void *)a1[6];
        int v9 = [v6 localIdentifier];
        objc_msgSend(v7, "setIsInVIPModel:", objc_msgSend(v8, "containsObject:", v9));
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v3);
  }
}

- (int)_generatePersonsModelWithExtendTimeoutBlock:(id)a3 cancel:(id)a4 evaluationMode:(BOOL)a5 allowUnverifiedPerson:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v84 = a5;
  v140[4] = *MEMORY[0x1E4F143B8];
  uint64_t v88 = (void (**)(void))a3;
  uint64_t v89 = (unsigned int (**)(void))a4;
  __int16 v85 = self;
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    int v9 = VCPLogInstance();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_DEBUG, "QuickFaceID Model: Begin model generation", buf, 2u);
    }
  }
  uint64_t v81 = mach_absolute_time();
  long long v10 = VCPSignPostLog();
  os_signpost_id_t spid = os_signpost_id_generate(v10);

  long long v11 = VCPSignPostLog();
  long long v12 = v11;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v12, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VCPPersonVIPGenerateModel", "", buf, 2u);
  }

  uint64_t v90 = [(VCPPhotosQuickFaceIdentificationManager *)self _fetchPersonsToFeedVIPModel:v84 allowUnverifiedPerson:v6];
  __int16 v87 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  uint64_t v13 = *MEMORY[0x1E4F39620];
  uint64_t v80 = *MEMORY[0x1E4F39630];
  v140[0] = *MEMORY[0x1E4F39630];
  v140[1] = v13;
  uint64_t v14 = *MEMORY[0x1E4F39638];
  v140[2] = *MEMORY[0x1E4F39610];
  v140[3] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v140 count:4];
  [v87 setFetchPropertySets:v15];

  [v87 setIncludeOnlyFacesWithFaceprints:1];
  [v87 setIncludeNonvisibleFaces:1];
  [v87 setFetchLimit:5120];
  uint64_t v16 = [MEMORY[0x1E4F39220] mediaProcessingFacesSortDescriptorsForGeneratingPersonModel];
  [v87 setInternalSortDescriptors:v16];

  id v86 = (void *)[v87 copy];
  unint64_t v17 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"roll == 0.0"];
  [v87 setInternalPredicate:v17];

  id v94 = +[VCPFaceIDModel newMutablePersonsModel];
  uint64_t v18 = [MEMORY[0x1E4F1CA60] dictionary];
  unint64_t v19 = 0;
  long long v20 = v89 + 2;
  uint64_t v21 = 2;
  while (v19 < [v90 count])
  {
    context = (void *)MEMORY[0x1C186D320]();
    if (v89 && v89[2]())
    {
      if ((int)MediaAnalysisLogLevel() < 4)
      {
        char v23 = 0;
        goto LABEL_41;
      }
      uint64_t v22 = VCPLogInstance();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v22, OS_LOG_TYPE_DEFAULT, "QuickFaceID Model: Model generation cancelled. Quitting", buf, 2u);
      }
      char v23 = 0;
    }
    else
    {
      __int16 v100 = [v90 objectAtIndexedSubscript:v19];
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        char v24 = VCPLogInstance();
        if (os_log_type_enabled(v24, (os_log_type_t)v21))
        {
          if ([v100 verifiedType] == 2) {
            id v25 = @"graph";
          }
          else {
            id v25 = @"user";
          }
          char v26 = [v100 name];
          double v27 = [v100 localIdentifier];
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v25;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v26;
          *(_WORD *)&buf[22] = 2112;
          v139 = v27;
          _os_log_impl(&dword_1BBEDA000, v24, (os_log_type_t)v21, "QuickFaceID: Building %@-confirmed person %@ (%@)", buf, 0x20u);
        }
      }
      id v28 = [MEMORY[0x1E4F39048] fetchFacesForPerson:v100 options:v87];
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        int v29 = VCPLogInstance();
        if (os_log_type_enabled(v29, (os_log_type_t)v21))
        {
          uint64_t v30 = [v28 count];
          *(_DWORD *)buf = 134217984;
          *(void *)&uint8_t buf[4] = v30;
          _os_log_impl(&dword_1BBEDA000, v29, (os_log_type_t)v21, "FaceID Model: fetched %lu faces", buf, 0xCu);
        }
      }
      if ((unint64_t)[v28 count] > 0x13)
      {
        uint64_t v31 = v28;
      }
      else
      {
        uint64_t v31 = [MEMORY[0x1E4F39048] fetchFacesForPerson:v100 options:v86];

        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          uint64_t v32 = VCPLogInstance();
          if (os_log_type_enabled(v32, (os_log_type_t)v21))
          {
            uint64_t v33 = [v31 count];
            *(_DWORD *)buf = 134217984;
            *(void *)&uint8_t buf[4] = v33;
            _os_log_impl(&dword_1BBEDA000, v32, (os_log_type_t)v21, "FaceID Model: fetched %lu faces without roll predicate", buf, 0xCu);
          }
        }
      }
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      v139 = 0;
      v122[0] = MEMORY[0x1E4F143A8];
      v122[1] = 3221225472;
      v122[2] = __131__VCPPhotosQuickFaceIdentificationManager__generatePersonsModelWithExtendTimeoutBlock_cancel_evaluationMode_allowUnverifiedPerson___block_invoke;
      v122[3] = &unk_1E629AE20;
      id v123 = v94;
      id v124 = v18;
      long long v126 = buf;
      uint64_t v22 = v100;
      v125 = v22;
      +[VCPPhotosPersistenceDelegate enumerateFetchResult:v31 withBatchSize:128 handler:v122];
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        id v34 = VCPLogInstance();
        if (os_log_type_enabled(v34, (os_log_type_t)v21))
        {
          id v35 = v20;
          uint64_t v36 = v21;
          uint64_t v37 = *(void *)(*(void *)&buf[8] + 24);
          long long v38 = [v22 name];
          long long v39 = [v22 localIdentifier];
          *(_DWORD *)id v132 = 134218498;
          uint64_t v133 = v37;
          __int16 v134 = 2112;
          uint64_t v135 = v38;
          __int16 v136 = 2112;
          v137 = v39;
          uint64_t v21 = v36;
          _os_log_impl(&dword_1BBEDA000, v34, (os_log_type_t)v36, "QuickFaceID: Built using %lu faces for person %@ (%@)", v132, 0x20u);

          long long v20 = v35;
        }
      }
      if (v88) {
        v88[2]();
      }

      _Block_object_dispose(buf, 8);
      char v23 = 1;
    }

LABEL_41:
    ++v19;
    if ((v23 & 1) == 0)
    {
      int v78 = -128;
      goto LABEL_101;
    }
  }
  uint64_t v40 = VCPSignPostLog();
  uint64_t v41 = v40;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v41, OS_SIGNPOST_INTERVAL_END, spid, "VCPPersonVIPGenerateModel", "", buf, 2u);
  }

  if (v81)
  {
    mach_absolute_time();
    VCPPerformance_LogMeasurement();
  }
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    __int16 v42 = VCPLogInstance();
    if (os_log_type_enabled(v42, (os_log_type_t)v21))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v42, (os_log_type_t)v21, "QuickFaceID Model: Finished model generation", buf, 2u);
    }
  }
  id v121 = 0;
  BOOL v43 = [(VCPPhotosQuickFaceIdentificationManager *)v85 _persistPersonsModel:v94 evaluationMode:v84 error:&v121];
  id spida = v121;
  if (v43)
  {
    v44 = [MEMORY[0x1E4F1CA80] set];
    long long v119 = 0u;
    long long v120 = 0u;
    long long v117 = 0u;
    long long v118 = 0u;
    obuint64_t j = v90;
    uint64_t v45 = [obj countByEnumeratingWithState:&v117 objects:v131 count:16];
    if (!v45) {
      goto LABEL_75;
    }
    uint64_t v92 = *(void *)v118;
    while (1)
    {
      uint64_t v46 = 0;
      uint64_t v93 = v45;
      do
      {
        if (*(void *)v118 != v92) {
          objc_enumerationMutation(obj);
        }
        uint64_t v47 = *(void **)(*((void *)&v117 + 1) + 8 * v46);
        id v95 = (void *)MEMORY[0x1C186D320]();
        uint64_t v48 = [v47 localIdentifier];
        id v116 = 0;
        contexta = [v94 trainingFaceObservationsForPersonWithUniqueIdentifier:v48 canceller:0 error:&v116];
        id v101 = v116;

        if (v101)
        {
          if ((int)MediaAnalysisLogLevel() < 4) {
            goto LABEL_73;
          }
          double v49 = VCPLogInstance();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v50 = [v47 localIdentifier];
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v50;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v101;
            _os_log_impl(&dword_1BBEDA000, v49, OS_LOG_TYPE_DEFAULT, "QuickFaceID Model: Could not get face observations for person %@ - %@", buf, 0x16u);
          }
        }
        else
        {
          long long v114 = 0u;
          long long v115 = 0u;
          long long v112 = 0u;
          long long v113 = 0u;
          double v49 = contexta;
          uint64_t v51 = [v49 countByEnumeratingWithState:&v112 objects:v130 count:16];
          if (v51)
          {
            uint64_t v52 = *(void *)v113;
            do
            {
              for (uint64_t i = 0; i != v51; ++i)
              {
                if (*(void *)v113 != v52) {
                  objc_enumerationMutation(v49);
                }
                uint64_t v54 = [*(id *)(*((void *)&v112 + 1) + 8 * i) uuid];
                int v55 = [v54 UUIDString];
                uint64_t v56 = [v18 objectForKeyedSubscript:v55];

                if (v56) {
                  [v44 addObject:v56];
                }
              }
              uint64_t v51 = [v49 countByEnumeratingWithState:&v112 objects:v130 count:16];
            }
            while (v51);
          }
        }

LABEL_73:
        ++v46;
      }
      while (v46 != v93);
      uint64_t v45 = [obj countByEnumeratingWithState:&v117 objects:v131 count:16];
      if (!v45)
      {
LABEL_75:

        __int16 v102 = [(PHPhotoLibrary *)v85->_photoLibrary librarySpecificFetchOptions];
        uint64_t v129 = v80;
        long long v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v129 count:1];
        [v102 setFetchPropertySets:v57];

        id v58 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"isInVIPModel == YES"];
        [v102 setPredicate:v58];

        id v96 = [MEMORY[0x1E4F39048] fetchFacesWithOptions:v102];
        uint64_t v59 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v96, "count"));
        long long v110 = 0u;
        long long v111 = 0u;
        long long v108 = 0u;
        long long v109 = 0u;
        id v60 = v96;
        uint64_t v61 = [v60 countByEnumeratingWithState:&v108 objects:v128 count:16];
        if (v61)
        {
          uint64_t v62 = *(void *)v109;
          do
          {
            for (uint64_t j = 0; j != v61; ++j)
            {
              if (*(void *)v109 != v62) {
                objc_enumerationMutation(v60);
              }
              id v64 = [*(id *)(*((void *)&v108 + 1) + 8 * j) localIdentifier];
              [v59 addObject:v64];
            }
            uint64_t v61 = [v60 countByEnumeratingWithState:&v108 objects:v128 count:16];
          }
          while (v61);
        }

        contextb = (void *)[v59 mutableCopy];
        [contextb minusSet:v44];
        id v65 = [v44 mutableCopy];
        [v65 minusSet:v59];
        id v66 = [contextb allObjects];
        uint64_t v67 = [v65 allObjects];
        id v68 = [v66 arrayByAddingObjectsFromArray:v67];

        if ([v68 count])
        {
          id v69 = [(PHPhotoLibrary *)v85->_photoLibrary librarySpecificFetchOptions];
          uint64_t v127 = v80;
          id v70 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v127 count:1];
          [v69 setFetchPropertySets:v70];

          photoLibrary = v85->_photoLibrary;
          v104[0] = MEMORY[0x1E4F143A8];
          v104[1] = 3221225472;
          v104[2] = __131__VCPPhotosQuickFaceIdentificationManager__generatePersonsModelWithExtendTimeoutBlock_cancel_evaluationMode_allowUnverifiedPerson___block_invoke_399;
          v104[3] = &unk_1E6299338;
          id v105 = v68;
          id v72 = v69;
          id v106 = v72;
          id v107 = v65;
          id v103 = 0;
          [(PHPhotoLibrary *)photoLibrary performChangesAndWait:v104 error:&v103];
          id v73 = v103;
          if (v73 && (int)MediaAnalysisLogLevel() >= 3)
          {
            long long v74 = VCPLogInstance();
            if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v73;
              _os_log_impl(&dword_1BBEDA000, v74, OS_LOG_TYPE_ERROR, "QuickFaceID Model: Could not persist isInVIPModel on trained faces - %@", buf, 0xCu);
            }
          }
        }
        uint64_t v75 = v85->_photoLibrary;
        uint64_t v76 = [MEMORY[0x1E4F1C9C8] date];
        [(PHPhotoLibrary *)v75 vcp_setAnalysisPreferencesValue:v76 forKey:@"FaceIDModelLastGenerationKey"];

        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          v77 = VCPLogInstance();
          if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1BBEDA000, v77, OS_LOG_TYPE_INFO, "QuickFaceID Model: Finished model generation and persistence", buf, 2u);
          }
        }
        int v78 = 0;
        goto LABEL_98;
      }
    }
  }
  if ((int)MediaAnalysisLogLevel() < 3)
  {
    int v78 = -18;
  }
  else
  {
    v44 = VCPLogInstance();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = spida;
      _os_log_impl(&dword_1BBEDA000, v44, OS_LOG_TYPE_ERROR, "QuickFaceID Model: Failed to persist model %@", buf, 0xCu);
    }
    int v78 = -18;
LABEL_98:
  }
LABEL_101:

  return v78;
}

void __131__VCPPhotosQuickFaceIdentificationManager__generatePersonsModelWithExtendTimeoutBlock_cancel_evaluationMode_allowUnverifiedPerson___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v34 = a2;
  id v35 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v34, "count"));
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  obuint64_t j = v34;
  uint64_t v3 = [obj countByEnumeratingWithState:&v44 objects:v54 count:16];
  uint64_t v36 = a1;
  if (v3)
  {
    uint64_t v41 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v45 != v41) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        BOOL v6 = (void *)MEMORY[0x1C186D320]();
        if ([v5 trainingType] != 4 && objc_msgSend(v5, "trainingType") != 2)
        {
          uint64_t v37 = [v5 faceClusteringProperties];
          id v7 = [v37 faceprint];
          uint64_t v40 = [v7 faceprintData];

          id v8 = objc_alloc(MEMORY[0x1E4F45800]);
          id v43 = 0;
          int v9 = (void *)[v8 initWithState:v40 error:&v43];
          id v38 = v43;
          if (v9)
          {
            long long v10 = objc_alloc_init(MEMORY[0x1E4F457F8]);
            [v10 setFaceTorsoprint:v9];
            long long v11 = [v9 faceprint];
            [v10 setFaceprint:v11];

            if (v10)
            {
              long long v12 = [v10 faceprint];
              BOOL v13 = v12 == 0;

              if (v13) {
                goto LABEL_26;
              }
              uint64_t v14 = [*(id *)(v36 + 32) configuration];
              if ([v14 faceprintRequestRevision])
              {
                uint64_t v15 = [v10 faceprint];
                uint64_t v16 = [v15 requestRevision];
                unint64_t v17 = [*(id *)(v36 + 32) configuration];
                LOBYTE(v16) = v16 == [v17 faceprintRequestRevision];

                if ((v16 & 1) == 0)
                {
                  if ((int)MediaAnalysisLogLevel() >= 3)
                  {
                    uint64_t v18 = VCPLogInstance();
                    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
                    {
                      unint64_t v19 = [v5 localIdentifier];
                      long long v20 = [v10 faceprint];
                      uint64_t v21 = [v20 requestRevision];
                      uint64_t v22 = [*(id *)(v36 + 32) configuration];
                      uint64_t v23 = [v22 faceprintRequestRevision];
                      *(_DWORD *)buf = 138412802;
                      id v49 = v19;
                      __int16 v50 = 2048;
                      uint64_t v51 = v21;
                      __int16 v52 = 2048;
                      uint64_t v53 = v23;
                      _os_log_impl(&dword_1BBEDA000, v18, OS_LOG_TYPE_ERROR, "QuickFaceID Model[%@]: Mismatched faceprint version %lu (expected %lu).", buf, 0x20u);
                    }
                  }
                  goto LABEL_26;
                }
              }
              else
              {
              }
              [v35 addObject:v10];
              id v25 = [v5 localIdentifier];
              char v26 = *(void **)(v36 + 40);
              double v27 = [v10 uuid];
              id v28 = [v27 UUIDString];
              [v26 setObject:v25 forKeyedSubscript:v28];

              ++*(void *)(*(void *)(*(void *)(v36 + 56) + 8) + 24);
              goto LABEL_26;
            }
            if ((int)MediaAnalysisLogLevel() >= 4)
            {
              char v24 = VCPLogInstance();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v49 = v5;
                _os_log_impl(&dword_1BBEDA000, v24, OS_LOG_TYPE_DEFAULT, "QuickFaceID Model: Could not add faceprint to model for face: %@.", buf, 0xCu);
              }
            }
LABEL_26:
          }
          else if ((int)MediaAnalysisLogLevel() >= 4)
          {
            long long v10 = VCPLogInstance();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v49 = v5;
              __int16 v50 = 2112;
              uint64_t v51 = (uint64_t)v38;
              _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_DEFAULT, "QuickFaceID Model: Could not create faceprint for face: %@. Error: %@", buf, 0x16u);
            }
            goto LABEL_26;
          }
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v44 objects:v54 count:16];
    }
    while (v3);
  }

  if ([v35 count])
  {
    int v29 = [*(id *)(v36 + 48) localIdentifier];
    uint64_t v30 = *(void *)(v36 + 32);
    id v42 = 0;
    BOOL v31 = +[VCPFaceIDModel addFaceObservations:v35 forPersonIdentifier:v29 toModel:v30 error:&v42];
    id v32 = v42;

    if (!v31 && (int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v33 = VCPLogInstance();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v49 = v32;
        _os_log_impl(&dword_1BBEDA000, v33, OS_LOG_TYPE_ERROR, "QuickFaceID Model: Could not add faceprints to model. Error: %@", buf, 0xCu);
      }
    }
  }
}

void __131__VCPPhotosQuickFaceIdentificationManager__generatePersonsModelWithExtendTimeoutBlock_cancel_evaluationMode_allowUnverifiedPerson___block_invoke_399(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F39048], "fetchFacesWithLocalIdentifiers:options:", a1[4], a1[5], 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        BOOL v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        id v7 = [MEMORY[0x1E4F39058] changeRequestForFace:v6];
        id v8 = (void *)a1[6];
        int v9 = [v6 localIdentifier];
        objc_msgSend(v7, "setIsInVIPModel:", objc_msgSend(v8, "containsObject:", v9));
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v3);
  }
}

- (BOOL)_modelLastGenerationDidExceedTimeIntervalForType:(unint64_t)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(PHPhotoLibrary *)self->_photoLibrary vcp_analysisPreferences];
  uint64_t v5 = @"PetIDModelLastGenerationKey";
  if (!a3) {
    uint64_t v5 = @"FaceIDModelLastGenerationKey";
  }
  BOOL v6 = v5;
  id v7 = [v4 objectForKeyedSubscript:v6];
  if (!v7)
  {
    id v7 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  id v8 = [MEMORY[0x1E4F1C9C8] date];
  [v8 timeIntervalSinceDate:v7];
  double v10 = v9;

  double v11 = (double)0x15180uLL;
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    long long v12 = VCPLogInstance();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      long long v13 = VCPMAVIPTypeDescription(a3);
      uint64_t v14 = @"No";
      int v16 = 138412802;
      unint64_t v17 = v13;
      if (v10 > v11) {
        uint64_t v14 = @"Yes";
      }
      __int16 v18 = 2048;
      double v19 = v10;
      __int16 v20 = 2112;
      uint64_t v21 = v14;
      _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_DEBUG, "QuickFaceID %@ Model: Last job generation %.0fs ago, job is due = %@", (uint8_t *)&v16, 0x20u);
    }
  }

  return v10 > v11;
}

- (BOOL)_faceProcessingPassGoalWithExtendTimeout:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__VCPPhotosQuickFaceIdentificationManager__faceProcessingPassGoalWithExtendTimeout___block_invoke;
  aBlock[3] = &unk_1E6297C38;
  id v5 = v4;
  id v30 = v5;
  double v27 = _Block_copy(aBlock);
  id v28 = 0;
  +[VCPAnalysisProgressQuery queryProgressDetail:&v28 photoLibrary:self->_photoLibrary taskID:3 cancelOrExtendTimeoutBlock:v27];
  id v6 = v28;
  id v7 = [v6 objectForKeyedSubscript:@"total-allowed"];
  uint64_t v8 = [v7 integerValue];

  double v9 = [v6 objectForKeyedSubscript:@"processed"];
  uint64_t v10 = [v9 integerValue];

  double v11 = [v6 objectForKeyedSubscript:@"failed"];
  uint64_t v12 = [v11 integerValue];

  uint64_t v13 = 100 * (v12 + v10);
  uint64_t v14 = 90 * v8;
  uint64_t v15 = 100 * v12;
  uint64_t v16 = 10 * v8;
  if (v8) {
    BOOL v17 = v13 <= v14;
  }
  else {
    BOOL v17 = 1;
  }
  int v19 = !v17 && v15 <= v16;
  BOOL v26 = v19;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    __int16 v20 = VCPLogInstance();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218496;
      uint64_t v32 = v8;
      __int16 v33 = 2048;
      uint64_t v34 = v10;
      __int16 v35 = 2048;
      uint64_t v36 = v12;
      _os_log_impl(&dword_1BBEDA000, v20, OS_LOG_TYPE_INFO, "QuickFaceID [FastMigration]: asset processing progress: total: %ld, processed: %ld, failed: %ld", buf, 0x20u);
    }
  }
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    uint64_t v21 = VCPLogInstance();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      uint64_t v22 = "No";
      if (v13 <= v14) {
        uint64_t v23 = "No";
      }
      else {
        uint64_t v23 = "Yes";
      }
      if (v15 > v16) {
        char v24 = "Yes";
      }
      else {
        char v24 = "No";
      }
      *(_DWORD *)buf = 136315650;
      uint64_t v32 = (uint64_t)v23;
      __int16 v33 = 2080;
      uint64_t v34 = (uint64_t)v24;
      if (v26) {
        uint64_t v22 = "Yes";
      }
      __int16 v35 = 2080;
      uint64_t v36 = (uint64_t)v22;
      _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_INFO, "QuickFaceID [FastMigration]: asset processing rate: processed>90%%: %s, failure>10%%: %s, pass: %s", buf, 0x20u);
    }
  }
  return v26;
}

uint64_t __84__VCPPhotosQuickFaceIdentificationManager__faceProcessingPassGoalWithExtendTimeout___block_invoke(uint64_t a1)
{
  return 0;
}

+ (BOOL)_fastFaceMigrationEnabled
{
  return 0;
}

- (BOOL)_keepCurrentPersonsModelWithExtendTimeout:(id)a3
{
  id v4 = a3;
  if ([(id)objc_opt_class() _fastFaceMigrationEnabled])
  {
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    management = self->_management;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __85__VCPPhotosQuickFaceIdentificationManager__keepCurrentPersonsModelWithExtendTimeout___block_invoke;
    block[3] = &unk_1E629AE48;
    block[4] = self;
    id v9 = v4;
    uint64_t v10 = &v11;
    dispatch_sync(management, block);
    BOOL v6 = *((unsigned char *)v12 + 24) != 0;

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

void __85__VCPPhotosQuickFaceIdentificationManager__keepCurrentPersonsModelWithExtendTimeout___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "vcp_vipModelFilepathForVIPType:", 0);
  if (v2)
  {
    id v10 = 0;
    uint64_t v3 = +[VCPFaceIDModel loadVIPModelAtPath:v2 withVIPType:0 error:&v10];
    id v4 = v10;
    if (v3)
    {
      id v5 = [*(id *)(*(void *)(a1 + 32) + 8) configuration];
      uint64_t v6 = [v5 faceprintRequestRevision];

      LODWORD(v5) = [*(id *)(a1 + 32) faceProcessingVersionFromVNFaceprintRequestRevision:v6];
      id v7 = +[VCPFaceProcessingVersionManager sharedManagerForPhotoLibrary:*(void *)(*(void *)(a1 + 32) + 24)];
      int v8 = [v7 currentProcessingVersion];

      if (v5 != v8
        && ([*(id *)(a1 + 32) _faceProcessingPassGoalWithExtendTimeout:*(void *)(a1 + 40)] & 1) == 0)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 4)
    {
      id v9 = VCPLogInstance();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v12 = v4;
        _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_DEFAULT, "QuickFaceID [FastMigration]: cannot load Persons Model: %@", buf, 0xCu);
      }
    }
LABEL_14:

    goto LABEL_15;
  }
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    id v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEFAULT, "QuickFaceID [FastMigration]: persistent storageDirectoryURL is nil", buf, 2u);
    }
    goto LABEL_14;
  }
LABEL_15:
}

- (BOOL)_needToGenerateModelWithType:(unint64_t)a3 ignoreLastGenerationTime:(BOOL)a4 withExtendTimeout:(id)a5
{
  BOOL v5 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if (([(PHPhotoLibrary *)self->_photoLibrary isSystemPhotoLibrary] & 1) == 0) {
    goto LABEL_11;
  }
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v9 = VCPLogInstance();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = VCPMAVIPTypeDescription(a3);
      uint64_t v11 = (void *)v10;
      uint64_t v12 = "NO";
      if (v5) {
        uint64_t v12 = "YES";
      }
      int v16 = 138412546;
      uint64_t v17 = v10;
      __int16 v18 = 2080;
      int v19 = v12;
      _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_INFO, "QuickFaceID %@ Model: ignoreLastGenerationTime: %s", (uint8_t *)&v16, 0x16u);
    }
  }
  if ([(VCPPhotosQuickFaceIdentificationManager *)self _modelLastGenerationDidExceedTimeIntervalForType:a3]|| v5)
  {
    if (a3) {
      BOOL v13 = 0;
    }
    else {
      BOOL v13 = [(VCPPhotosQuickFaceIdentificationManager *)self _keepCurrentPersonsModelWithExtendTimeout:v8];
    }
    BOOL v14 = !v13;
  }
  else
  {
LABEL_11:
    BOOL v14 = 0;
  }

  return v14;
}

- (int)generateVIPModelWithType:(unint64_t)a3 ignoreLastGenerationTime:(BOOL)a4 evaluationMode:(BOOL)a5 allowUnverifiedPerson:(BOOL)a6 modelGenerated:(BOOL *)a7 extendTimeout:(id)a8 andCancel:(id)a9
{
  BOOL v10 = a6;
  BOOL v11 = a5;
  BOOL v12 = a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v15 = a8;
  id v16 = a9;
  if ([(VCPPhotosQuickFaceIdentificationManager *)self _needToGenerateModelWithType:a3 ignoreLastGenerationTime:v12 withExtendTimeout:v15])
  {
    if (a7) {
      *a7 = 1;
    }
    if (a3 == 1)
    {
      int v17 = [(VCPPhotosQuickFaceIdentificationManager *)self _generatePetsModelWithExtendTimeoutBlock:v15 cancel:v16];
      goto LABEL_14;
    }
    if (!a3)
    {
      int v17 = [(VCPPhotosQuickFaceIdentificationManager *)self _generatePersonsModelWithExtendTimeoutBlock:v15 cancel:v16 evaluationMode:v11 allowUnverifiedPerson:v10];
LABEL_14:
      int v20 = v17;
      goto LABEL_20;
    }
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v21 = VCPLogInstance();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        int v23 = 134217984;
        unint64_t v24 = a3;
        _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_ERROR, "QuickFaceID Model: unknown VIP type (%lu); no model generated",
          (uint8_t *)&v23,
          0xCu);
      }
    }
    int v20 = -50;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      __int16 v18 = VCPLogInstance();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        int v19 = VCPMAVIPTypeDescription(a3);
        int v23 = 138412290;
        unint64_t v24 = (unint64_t)v19;
        _os_log_impl(&dword_1BBEDA000, v18, OS_LOG_TYPE_INFO, "QuickFaceID %@ Model: No need to generate model", (uint8_t *)&v23, 0xCu);
      }
    }
    int v20 = 0;
    if (a7) {
      *a7 = 0;
    }
  }
LABEL_20:

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vuService, 0);
  objc_storeStrong((id *)&self->_management, 0);
  objc_storeStrong((id *)&self->_faceAnalyzer, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_petsModel, 0);
  objc_storeStrong((id *)&self->_personsModel, 0);
}

@end