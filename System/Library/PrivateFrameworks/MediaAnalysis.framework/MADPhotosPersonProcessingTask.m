@interface MADPhotosPersonProcessingTask
+ (id)taskWithPhotoLibrary:(id)a3 requirement:(unint64_t)a4 faceClusterer:(id)a5 andContext:(id)a6;
+ (id)taskWithPhotoLibrary:(id)a3 requirement:(unint64_t)a4 understandingService:(id)a5 andContext:(id)a6;
- (BOOL)_buildAndPromotePersonWithError:(id *)a3 needReclustering:(BOOL *)a4;
- (BOOL)_updateGalleryWithError:(id *)a3;
- (MADPhotosPersonProcessingTask)initWithPhotoLibrary:(id)a3 requirement:(unint64_t)a4 faceClusterer:(id)a5 andContext:(id)a6;
- (MADPhotosPersonProcessingTask)initWithPhotoLibrary:(id)a3 requirement:(unint64_t)a4 understandingService:(id)a5 andContext:(id)a6;
- (int)_updateVIPModels;
- (void)process;
- (void)processGallery;
- (void)processLegacy;
@end

@implementation MADPhotosPersonProcessingTask

- (MADPhotosPersonProcessingTask)initWithPhotoLibrary:(id)a3 requirement:(unint64_t)a4 faceClusterer:(id)a5 andContext:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (objc_msgSend(v11, "mad_useVUGallery"))
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v14 = VCPLogInstance();
      os_log_type_t v15 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v14, v15))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, v15, "[MADPhotosPersonProcessingTask] VCPFaceClusterer is disabled", buf, 2u);
      }
    }
    v16 = 0;
  }
  else
  {
    v29.receiver = self;
    v29.super_class = (Class)MADPhotosPersonProcessingTask;
    v17 = [(MADProcessingTask *)&v29 init];
    v18 = v17;
    if (v17)
    {
      p_photoLibrary = (id *)&v17->_photoLibrary;
      objc_storeStrong((id *)&v17->_photoLibrary, a3);
      v18->_requirement = a4;
      objc_storeStrong((id *)&v18->_context, a6);
      objc_storeStrong((id *)&v18->_faceClusterer, a5);
      v20 = (VCPPersonBuilder *)[objc_alloc((Class)VCPPersonBuilder) initWithPhotoLibrary:*p_photoLibrary andFaceClusterer:v18->_faceClusterer andContext:v18->_context];
      personBuilder = v18->_personBuilder;
      v18->_personBuilder = v20;

      id v22 = [objc_alloc((Class)VCPPhotosPersistenceDelegate) initWithPhotoLibrary:*p_photoLibrary];
      v23 = (PNPersonPromoter *)[objc_alloc((Class)PNPersonPromoter) initWithPhotoLibrary:*p_photoLibrary andDelegate:v22];
      personPromoter = v18->_personPromoter;
      v18->_personPromoter = v23;

      v25 = objc_msgSend(*p_photoLibrary, "vcp_description");
      uint64_t v26 = +[NSString stringWithFormat:@"[Person][%@]", v25];
      logPrefix = v18->_logPrefix;
      v18->_logPrefix = (NSString *)v26;
    }
    self = v18;
    v16 = self;
  }

  return v16;
}

- (MADPhotosPersonProcessingTask)initWithPhotoLibrary:(id)a3 requirement:(unint64_t)a4 understandingService:(id)a5 andContext:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (objc_msgSend(v11, "mad_useVUGallery"))
  {
    v32.receiver = self;
    v32.super_class = (Class)MADPhotosPersonProcessingTask;
    v14 = [(MADProcessingTask *)&v32 init];
    os_log_type_t v15 = v14;
    if (v14)
    {
      p_photoLibrary = (id *)&v14->_photoLibrary;
      objc_storeStrong((id *)&v14->_photoLibrary, a3);
      v15->_requirement = a4;
      objc_storeStrong((id *)&v15->_vuService, a5);
      uint64_t v17 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:v11];
      analysisDatabase = v15->_analysisDatabase;
      v15->_analysisDatabase = (VCPDatabaseWriter *)v17;

      objc_storeStrong((id *)&v15->_context, a6);
      v19 = (VCPPhotosPersistenceDelegate *)[objc_alloc((Class)VCPPhotosPersistenceDelegate) initWithPhotoLibrary:*p_photoLibrary];
      persistenceDelegate = v15->_persistenceDelegate;
      v15->_persistenceDelegate = v19;

      v21 = (PNPersonPromoter *)[objc_alloc((Class)PNPersonPromoter) initWithPhotoLibrary:*p_photoLibrary andDelegate:v15->_persistenceDelegate];
      personPromoter = v15->_personPromoter;
      v15->_personPromoter = v21;

      v23 = (PNPetPromoterWrapper *)[objc_alloc((Class)PNPetPromoterWrapper) initWithLibrary:*p_photoLibrary andDelegate:v15->_persistenceDelegate];
      petPromoter = v15->_petPromoter;
      v15->_petPromoter = v23;

      v25 = objc_msgSend(*p_photoLibrary, "vcp_description");
      uint64_t v26 = +[NSString stringWithFormat:@"[GalleryPerson][%@]", v25];
      logPrefix = v15->_logPrefix;
      v15->_logPrefix = (NSString *)v26;
    }
    self = v15;
    v28 = self;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      objc_super v29 = VCPLogInstance();
      os_log_type_t v30 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v29, v30))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, v30, "[MADPhotosPersonProcessingTask] Gallery is not enabled", buf, 2u);
      }
    }
    v28 = 0;
  }

  return v28;
}

+ (id)taskWithPhotoLibrary:(id)a3 requirement:(unint64_t)a4 faceClusterer:(id)a5 andContext:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [objc_alloc((Class)a1) initWithPhotoLibrary:v10 requirement:a4 faceClusterer:v11 andContext:v12];

  return v13;
}

+ (id)taskWithPhotoLibrary:(id)a3 requirement:(unint64_t)a4 understandingService:(id)a5 andContext:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [objc_alloc((Class)a1) initWithPhotoLibrary:v10 requirement:a4 understandingService:v11 andContext:v12];

  return v13;
}

- (int)_updateVIPModels
{
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v3 = VCPLogInstance();
    os_log_type_t v4 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v3, v4))
    {
      logPrefix = self->_logPrefix;
      *(_DWORD *)buf = 138412290;
      v20 = logPrefix;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "%@ Start QuickFaceID model update", buf, 0xCu);
    }
  }
  char v18 = 0;
  id v6 = [objc_alloc((Class)VCPPhotosQuickFaceIdentificationManager) initWithPhotoLibrary:self->_photoLibrary];
  v7 = [(MADProcessingTask *)self cancelBlock];
  int v8 = [v6 generateVIPModelWithType:0 ignoreLastGenerationTime:0 evaluationMode:0 allowUnverifiedPerson:0 modelGenerated:&v18 extendTimeout:&stru_10021E408 andCancel:v7];

  if (!v8)
  {
    if (v18)
    {
      v9 = +[VCPMADCoreAnalyticsManager sharedManager];
      [v9 accumulateInt64Value:1 forField:@"PeopleVIPGenerated" andEvent:@"com.apple.mediaanalysisd.FaceAnalysisRunSession"];
    }
    id v10 = [(MADProcessingTask *)self cancelBlock];
    int v8 = [v6 generateVIPModelWithType:1 ignoreLastGenerationTime:0 evaluationMode:0 allowUnverifiedPerson:0 modelGenerated:&v18 extendTimeout:&stru_10021E428 andCancel:v10];

    if (!v8)
    {
      if (v18)
      {
        os_log_type_t v15 = +[VCPMADCoreAnalyticsManager sharedManager];
        [v15 accumulateInt64Value:1 forField:@"PetsVIPGenerated" andEvent:@"com.apple.mediaanalysisd.FaceAnalysisRunSession"];
      }
      if (([(PHPhotoLibrary *)self->_photoLibrary mad_useVUGallery] & 1) != 0
        || (int v8 = [v6 classifyVIPPets]) == 0)
      {
        if ((int)MediaAnalysisLogLevel() < 6)
        {
          int v8 = 0;
          goto LABEL_13;
        }
        id v11 = VCPLogInstance();
        os_log_type_t v16 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v11, v16))
        {
          uint64_t v17 = self->_logPrefix;
          *(_DWORD *)buf = 138412290;
          v20 = v17;
          _os_log_impl((void *)&_mh_execute_header, v11, v16, "%@ Finished QuickFaceID model update", buf, 0xCu);
        }
        int v8 = 0;
        goto LABEL_12;
      }
    }
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    id v11 = VCPLogInstance();
    os_log_type_t v12 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v11, v12))
    {
      id v13 = self->_logPrefix;
      *(_DWORD *)buf = 138412546;
      v20 = v13;
      __int16 v21 = 1024;
      int v22 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "%@ Failed to update QuickFaceID model - %d", buf, 0x12u);
    }
LABEL_12:
  }
LABEL_13:

  return v8;
}

- (void)processLegacy
{
  id v150 = objc_alloc_init((Class)VCPTimeMeasurement);
  v163 = self;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v3 = VCPLogInstance();
    os_log_type_t v4 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v3, v4))
    {
      logPrefix = self->_logPrefix;
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = logPrefix;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "%@ Start Legacy Person Processing", buf, 0xCu);
    }
  }
  [v150 start];
  id v6 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:self->_photoLibrary];
  [v6 cacheCurrentFaceProgress];

  os_log_type_t type = VCPLogToOSLogType[7];
  os_log_type_t v158 = VCPLogToOSLogType[6];
  os_log_type_t v151 = VCPLogToOSLogType[3];
  v7 = self;
  do
  {
    id v8 = [(PHPhotoLibrary *)v7->_photoLibrary countOfFaceCropsToBeGenerated];
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v9 = VCPLogInstance();
      if (os_log_type_enabled(v9, type))
      {
        id v10 = v7->_logPrefix;
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v10;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, type, "%@ Found %lu face crops to generate", buf, 0x16u);
      }

      v7 = v163;
    }
    if (v8)
    {
      uint64_t v11 = mach_absolute_time();
      os_log_type_t v12 = VCPSignPostLog();
      os_signpost_id_t v13 = os_signpost_id_generate(v12);

      v14 = VCPSignPostLog();
      os_log_type_t v15 = v14;
      if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "MADPhotosPersonProcessingTaskGenerateFaceCrop", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      os_log_type_t v16 = objc_alloc_init(MADPhotosFaceCropGenerationTask);
      uint64_t v17 = [(MADProcessingTask *)v163 cancelBlock];
      [(MADProcessingTask *)v16 setCancelBlock:v17];

      id v18 = [(PHPhotoLibrary *)v163->_photoLibrary newFaceCropsToBeGeneratedFetchOptions];
      v19 = +[PHFace fetchFacesWithOptions:v18];
      for (unint64_t i = 0; i < (unint64_t)[v19 count]; ++i)
      {
        int v22 = [v19 objectAtIndexedSubscript:i];
        [(MADPhotosFaceCropGenerationTask *)v16 addFace:v22];

        if ([(MADPhotosFaceCropGenerationTask *)v16 count] >= 0x64)
        {
          [(MADPhotosFaceCropGenerationTask *)v16 prepare];
          [(MADPhotosFaceCropGenerationTask *)v16 process];
          [(MADAssetProcessingTask *)v16 publish];
          v23 = objc_alloc_init(MADPhotosFaceCropGenerationTask);

          v24 = [(MADProcessingTask *)v163 cancelBlock];
          [(MADProcessingTask *)v23 setCancelBlock:v24];

          os_log_type_t v16 = v23;
        }
      }
      if ([(MADPhotosFaceCropGenerationTask *)v16 count])
      {
        [(MADPhotosFaceCropGenerationTask *)v16 prepare];
        [(MADPhotosFaceCropGenerationTask *)v16 process];
        [(MADAssetProcessingTask *)v16 publish];
      }
      v25 = VCPSignPostLog();
      uint64_t v26 = v25;
      if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_INTERVAL_END, v13, "MADPhotosPersonProcessingTaskGenerateFaceCrop", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      if (v11)
      {
        mach_absolute_time();
        VCPPerformance_LogMeasurement();
      }
      id v27 = [(PHPhotoLibrary *)v163->_photoLibrary countOfFaceCropsToBeGenerated];
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v28 = VCPLogInstance();
        if (os_log_type_enabled(v28, type))
        {
          objc_super v29 = v163->_logPrefix;
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v29;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v27;
          _os_log_impl((void *)&_mh_execute_header, v28, type, "%@ Found %lu face crops yet to generate", buf, 0x16u);
        }
      }
      BOOL v30 = v8 != v27;

      v7 = v163;
    }
    else
    {
      BOOL v30 = 0;
    }
    id v31 = [(PHPhotoLibrary *)v7->_photoLibrary countOfUnprocessedFaceCrops];
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      objc_super v32 = VCPLogInstance();
      if (os_log_type_enabled(v32, type))
      {
        v33 = v7->_logPrefix;
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v33;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v31;
        _os_log_impl((void *)&_mh_execute_header, v32, type, "%@ Found %lu face crops to process", buf, 0x16u);
      }

      v7 = v163;
    }
    if (v31)
    {
      uint64_t v34 = mach_absolute_time();
      v35 = VCPSignPostLog();
      os_signpost_id_t v36 = os_signpost_id_generate(v35);

      v37 = VCPSignPostLog();
      v38 = v37;
      if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v38, OS_SIGNPOST_INTERVAL_BEGIN, v36, "MADPhotosPersonProcessingTaskFaceCropProcessing", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      v39 = +[MADPhotosFaceCropProcessingTask taskWithPhotoLibrary:v163->_photoLibrary andFaceClusterer:v163->_faceClusterer];
      v40 = [(MADProcessingTask *)v163 cancelBlock];
      [v39 setCancelBlock:v40];

      [v39 process];
      v41 = VCPSignPostLog();
      v42 = v41;
      if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v42, OS_SIGNPOST_INTERVAL_END, v36, "MADPhotosPersonProcessingTaskFaceCropProcessing", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      if (v34)
      {
        mach_absolute_time();
        VCPPerformance_LogMeasurement();
      }
      id v43 = [(PHPhotoLibrary *)v163->_photoLibrary countOfUnprocessedFaceCrops];
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v44 = VCPLogInstance();
        if (os_log_type_enabled(v44, type))
        {
          v45 = v163->_logPrefix;
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v45;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v43;
          _os_log_impl((void *)&_mh_execute_header, v44, type, "%@ Found %lu face crops yet to process", buf, 0x16u);
        }
      }
      if (v31 != v43) {
        BOOL v30 = 1;
      }

      v7 = v163;
    }
    if ([(PHPhotoLibrary *)v7->_photoLibrary vcp_isSyndicationLibrary])
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v46 = VCPLogInstance();
        if (os_log_type_enabled(v46, type))
        {
          v47 = v7->_logPrefix;
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v47;
          _os_log_impl((void *)&_mh_execute_header, v46, type, "%@ Skipping clustering and person processing for syndication library", buf, 0xCu);
        }

        v7 = v163;
      }
      continue;
    }
    id v48 = [(PHPhotoLibrary *)v7->_photoLibrary mad_countOfUnclusteredFaces];
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v49 = VCPLogInstance();
      if (os_log_type_enabled(v49, type))
      {
        v50 = v7->_logPrefix;
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v50;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v48;
        _os_log_impl((void *)&_mh_execute_header, v49, type, "%@ Found %lu faces to cluster", buf, 0x16u);
      }

      v7 = v163;
    }
    if (v48)
    {
      v51 = objc_alloc_init((Class)VCPTimeMeasurement);
      [v51 start];
      uint64_t v52 = mach_absolute_time();
      v53 = VCPSignPostLog();
      os_signpost_id_t v54 = os_signpost_id_generate(v53);

      v55 = VCPSignPostLog();
      v56 = v55;
      if (v54 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v55))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v56, OS_SIGNPOST_INTERVAL_BEGIN, v54, "MADPhotosPersonProcessingTaskClusterFace", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      faceClusterer = v163->_faceClusterer;
      if (v163->_requirement == 20) {
        unsigned int v58 = [(VCPFaceClusterer *)faceClusterer clusterFaces];
      }
      else {
        unsigned int v58 = [(VCPFaceClusterer *)faceClusterer clusterFacesIfNecessary];
      }
      unsigned int v59 = v58;
      v60 = VCPSignPostLog();
      v61 = v60;
      if (v54 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v60))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v61, OS_SIGNPOST_INTERVAL_END, v54, "MADPhotosPersonProcessingTaskClusterFace", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      if (v52)
      {
        mach_absolute_time();
        VCPPerformance_LogMeasurement();
      }
      if (v59)
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v145 = VCPLogInstance();
          if (os_log_type_enabled(v145, v151))
          {
            v146 = v163->_logPrefix;
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v146;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v59;
            _os_log_impl((void *)&_mh_execute_header, v145, v151, "%@ Failed to cluster faces - %d", buf, 0x12u);
          }
        }
        [v51 stop];
        goto LABEL_165;
      }
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        v62 = VCPLogInstance();
        if (os_log_type_enabled(v62, v158))
        {
          v63 = v163->_logPrefix;
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v63;
          _os_log_impl((void *)&_mh_execute_header, v62, v158, "%@ Finished Face Clustering", buf, 0xCu);
        }
      }
      [v51 stop];
      v64 = +[VCPMADCoreAnalyticsManager sharedManager];
      [v51 elapsedTimeSeconds];
      objc_msgSend(v64, "accumulateDoubleValue:forField:andEvent:", @"FaceClusteringElapsedTimeInSeconds", @"com.apple.mediaanalysisd.FaceAnalysisRunSession");

      v65 = +[VCPMADCoreAnalyticsManager sharedManager];
      [v65 accumulateInt64Value:1 forField:@"NumberOfClusterEvents" andEvent:@"com.apple.mediaanalysisd.FaceAnalysisRunSession"];

      id v66 = [(PHPhotoLibrary *)v163->_photoLibrary mad_countOfUnclusteredFaces];
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v67 = VCPLogInstance();
        if (os_log_type_enabled(v67, type))
        {
          v68 = v163->_logPrefix;
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v68;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v66;
          _os_log_impl((void *)&_mh_execute_header, v67, type, "%@ Found %lu faces yet to cluster", buf, 0x16u);
        }
      }
      if (v48 != v66) {
        BOOL v30 = 1;
      }

      v7 = v163;
    }
    id v69 = [(PHPhotoLibrary *)v7->_photoLibrary countOfDirtyFaceGroups];
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v70 = VCPLogInstance();
      if (os_log_type_enabled(v70, type))
      {
        v71 = v7->_logPrefix;
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v71;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v69;
        _os_log_impl((void *)&_mh_execute_header, v70, type, "%@ Found %lu face groups to process", buf, 0x16u);
      }

      v7 = v163;
    }
    if (v69)
    {
      +[PNPersonPromoter setProcessed:0 forLibrary:v7->_photoLibrary];
      id v161 = objc_alloc_init((Class)VCPTimeMeasurement);
      [v161 start];
      uint64_t v72 = mach_absolute_time();
      v73 = VCPSignPostLog();
      os_signpost_id_t v74 = os_signpost_id_generate(v73);

      v75 = VCPSignPostLog();
      v76 = v75;
      if (v74 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v75))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v76, OS_SIGNPOST_INTERVAL_BEGIN, v74, "MADPhotosPersonProcessingTaskBuildPerson", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      personBuilder = v163->_personBuilder;
      id v169 = 0;
      v170[0] = _NSConcreteStackBlock;
      v170[1] = 3221225472;
      v170[2] = sub_100122A64;
      v170[3] = &unk_100219D98;
      v170[4] = v163;
      unsigned __int8 v78 = [(VCPPersonBuilder *)personBuilder performPersonBuildingWithCancelOrExtendTimeoutBlock:v170 error:&v169];
      id v160 = v169;
      v79 = VCPSignPostLog();
      v80 = v79;
      if (v74 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v79))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v80, OS_SIGNPOST_INTERVAL_END, v74, "MADPhotosPersonProcessingTaskBuildPerson", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      if (v72)
      {
        mach_absolute_time();
        VCPPerformance_LogMeasurement();
      }
      if ((v78 & 1) == 0)
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v136 = VCPLogInstance();
          if (os_log_type_enabled(v136, v151))
          {
            v137 = v163->_logPrefix;
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v137;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v160;
            _os_log_impl((void *)&_mh_execute_header, v136, v151, "%@ Failed to build persons - %@", buf, 0x16u);
          }
        }
        [v161 stop];
        int v135 = 1;
LABEL_151:

        v7 = v163;
        if (v135) {
          goto LABEL_166;
        }
        goto LABEL_152;
      }
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        v81 = VCPLogInstance();
        if (os_log_type_enabled(v81, v158))
        {
          v82 = v163->_logPrefix;
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v82;
          _os_log_impl((void *)&_mh_execute_header, v81, v158, "%@ Finished Person Building", buf, 0xCu);
        }
      }
      [v161 stop];
      v83 = +[VCPMADCoreAnalyticsManager sharedManager];
      [v161 elapsedTimeSeconds];
      objc_msgSend(v83, "accumulateDoubleValue:forField:andEvent:", @"PersonBuildingElapsedTimeInSeconds", @"com.apple.mediaanalysisd.FaceAnalysisRunSession");

      v84 = +[VCPMADCoreAnalyticsManager sharedManager];
      [v84 accumulateInt64Value:1 forField:@"NumberOfPersonBuildingEvents" andEvent:@"com.apple.mediaanalysisd.FaceAnalysisRunSession"];

      v85 = v163;
      id v86 = [(PHPhotoLibrary *)v163->_photoLibrary countOfDirtyFaceGroups];
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v87 = VCPLogInstance();
        if (os_log_type_enabled(v87, type))
        {
          v88 = v163->_logPrefix;
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v88;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v86;
          _os_log_impl((void *)&_mh_execute_header, v87, type, "%@ Found %lu face groups yet to process", buf, 0x16u);
        }

        v85 = v163;
      }
      if (v69 != v86) {
        BOOL v30 = 1;
      }
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        v89 = VCPLogInstance();
        if (os_log_type_enabled(v89, v158))
        {
          v90 = v85->_logPrefix;
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v90;
          _os_log_impl((void *)&_mh_execute_header, v89, v158, "%@ Starting Person Promoting", buf, 0xCu);
        }
      }
      uint64_t v91 = mach_absolute_time();
      v92 = VCPSignPostLog();
      os_signpost_id_t v93 = os_signpost_id_generate(v92);

      v94 = VCPSignPostLog();
      v95 = v94;
      if (v93 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v94))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v95, OS_SIGNPOST_INTERVAL_BEGIN, v93, "VCPFaceProcessingPromotePersonsCoreAnalyticsCollection", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      id v96 = [(PHPhotoLibrary *)v163->_photoLibrary vcp_assetCountForTaskID:3];
      v157 = [(PHPhotoLibrary *)v163->_photoLibrary librarySpecificFetchOptions];
      [v157 setIncludeNonvisibleFaces:1];
      [v157 setIncludeTorsoOnlyDetectionData:1];
      [v157 setShouldPrefetchCount:1];
      v97 = +[NSPredicate predicateWithFormat:@"(clusterSequenceNumber > 0)"];
      [v157 setPredicate:v97];

      if (+[PHPhotoLibrary mad_clusterVideoFaces]) {
        [v157 setIncludeMediaAnalysisProcessingRangeTypes:3];
      }
      v98 = +[PHFace fetchFacesWithOptions:v157];
      id v155 = [v98 count];

      v99 = [(PHPhotoLibrary *)v163->_photoLibrary librarySpecificFetchOptions];
      [v99 setMinimumVerifiedFaceCount:0];
      [v99 setMinimumUnverifiedFaceCount:0];
      [v99 setIncludeTorsoOnlyPerson:1];
      [v99 setShouldPrefetchCount:1];
      v100 = +[NSPredicate predicateWithFormat:@"verifiedType = %@", &off_10022F268];
      [v99 setPredicate:v100];

      v101 = +[PHPerson fetchPersonsWithOptions:v99];
      id v102 = [v101 count];

      v103 = +[NSPredicate predicateWithFormat:@"verifiedType = %@", &off_10022F280];
      [v99 setPredicate:v103];

      v104 = +[PHPerson fetchPersonsWithOptions:v99];
      id v154 = [v104 count];

      v105 = +[NSPredicate predicateWithFormat:@"verifiedType = %@", &off_10022F298];
      [v99 setPredicate:v105];

      v106 = +[PHPerson fetchPersonsWithOptions:v99];
      id v153 = [v106 count];

      v107 = VCPSignPostLog();
      v108 = v107;
      if (v93 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v107))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v108, OS_SIGNPOST_INTERVAL_END, v93, "VCPFaceProcessingPromotePersonsCoreAnalyticsCollection", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      if (v91)
      {
        mach_absolute_time();
        VCPPerformance_LogMeasurement();
      }
      double Current = CFAbsoluteTimeGetCurrent();
      id v159 = objc_alloc_init((Class)VCPTimeMeasurement);
      [v159 start];
      uint64_t v110 = mach_absolute_time();
      v111 = VCPSignPostLog();
      os_signpost_id_t v112 = os_signpost_id_generate(v111);

      v113 = VCPSignPostLog();
      v114 = v113;
      if (v112 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v113))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v114, OS_SIGNPOST_INTERVAL_BEGIN, v112, "MADPhotosPersonProcessingTaskPromotePerson", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      v178 = sub_100122B18;
      v179 = sub_100122B28;
      id v180 = +[NSDate distantPast];
      dispatch_queue_t v115 = dispatch_queue_create("MADPersonPromotingProgress", 0);
      personPromoter = v163->_personPromoter;
      v165[0] = _NSConcreteStackBlock;
      v165[1] = 3221225472;
      v165[2] = sub_100122B30;
      v165[3] = &unk_10021E450;
      v117 = v115;
      v167 = v163;
      v168 = buf;
      v156 = v117;
      v166 = v117;
      unsigned __int8 v118 = [(PNPersonPromoter *)personPromoter promoteUnverifiedPersonsWithUpdateBlock:v165];
      v119 = VCPSignPostLog();
      v120 = v119;
      if (v112 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v119))
      {
        *(_WORD *)v171 = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v120, OS_SIGNPOST_INTERVAL_END, v112, "MADPhotosPersonProcessingTaskPromotePerson", (const char *)&unk_1001F3BD3, v171, 2u);
      }

      if (v110)
      {
        mach_absolute_time();
        VCPPerformance_LogMeasurement();
      }
      [v159 stop];
      v121 = +[VCPMADCoreAnalyticsManager sharedManager];
      [v159 elapsedTimeSeconds];
      objc_msgSend(v121, "accumulateDoubleValue:forField:andEvent:", @"PersonPromotingElapsedTimeInSeconds", @"com.apple.mediaanalysisd.FaceAnalysisRunSession");

      v122 = +[VCPMADCoreAnalyticsManager sharedManager];
      [v122 accumulateInt64Value:1 forField:@"NumberOfPersonPromotingEvents" andEvent:@"com.apple.mediaanalysisd.FaceAnalysisRunSession"];

      v123 = v163;
      double v124 = CFAbsoluteTimeGetCurrent() - Current;
      if (v124 > 5.0)
      {
        v152 = +[VCPMADCoreAnalyticsManager sharedManager];
        v175[0] = @"GraphVerifiedPersonCount";
        v149 = +[NSNumber numberWithUnsignedInteger:v102];
        v176[0] = v149;
        v175[1] = @"ProcessingQoS";
        qos_class_t v125 = qos_class_self();
        v148 = VCPMAQoSDescription(v125);
        v176[1] = v148;
        v175[2] = @"PromotingInterval";
        v147 = +[NSNumber numberWithDouble:v124];
        v176[2] = v147;
        v175[3] = @"PromotingSequence";
        v126 = +[NSDate now];
        v127 = [v126 description];
        v176[3] = v127;
        v175[4] = @"TotalAssetCount";
        v128 = +[NSNumber numberWithUnsignedInteger:v96];
        v176[4] = v128;
        v175[5] = @"TotalFaceCount";
        v129 = +[NSNumber numberWithUnsignedInteger:v155];
        v176[5] = v129;
        v175[6] = @"UnverifiedPersonCount";
        v130 = +[NSNumber numberWithUnsignedInteger:v154];
        v176[6] = v130;
        v175[7] = @"UserVerifiedPersonCount";
        v131 = +[NSNumber numberWithUnsignedInteger:v153];
        v176[7] = v131;
        v132 = +[NSDictionary dictionaryWithObjects:v176 forKeys:v175 count:8];
        [v152 sendEvent:@"com.apple.mediaanalysisd.photos.personpromoting" withAnalytics:v132];

        v123 = v163;
      }
      if (v118)
      {
        +[PNPersonPromoter setProcessed:1 forLibrary:v123->_photoLibrary];
        if ((int)MediaAnalysisLogLevel() < 6)
        {
          int v135 = 0;
          goto LABEL_150;
        }
        v133 = VCPLogInstance();
        if (os_log_type_enabled(v133, v158))
        {
          v134 = v123->_logPrefix;
          *(_DWORD *)v171 = 138412290;
          v172 = v134;
          _os_log_impl((void *)&_mh_execute_header, v133, v158, "%@ Finished Person Promoting", v171, 0xCu);
        }
        int v135 = 0;
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() < 3)
        {
          int v135 = 1;
          goto LABEL_150;
        }
        v133 = VCPLogInstance();
        if (os_log_type_enabled(v133, v151))
        {
          v138 = v123->_logPrefix;
          *(_DWORD *)v171 = 138412546;
          v172 = v138;
          __int16 v173 = 2112;
          id v174 = v160;
          _os_log_impl((void *)&_mh_execute_header, v133, v151, "%@ Failed to promote persons - %@", v171, 0x16u);
        }
        int v135 = 1;
      }

LABEL_150:
      _Block_object_dispose(buf, 8);

      goto LABEL_151;
    }
LABEL_152:
    if (v7->_requirement != 20) {
      break;
    }
  }
  while (v30);
  if ([(PHPhotoLibrary *)v7->_photoLibrary vcp_isSyndicationLibrary])
  {
    v139 = +[VCPDefaultPhotoLibraryManager sharedManager];
    v140 = [v139 defaultPhotoLibrary];

    id v141 = [objc_alloc((Class)VCPPhotosQuickFaceIdentificationManager) initWithPhotoLibrary:v140];
    photoLibrary = v163->_photoLibrary;
    v164[0] = _NSConcreteStackBlock;
    v164[1] = 3221225472;
    v164[2] = sub_100122E28;
    v164[3] = &unk_100219D98;
    v164[4] = v163;
    [v141 personIdentificationForSyndicationPhotoLibrary:photoLibrary withCancelOrExtendTimeoutBlock:v164];

    v7 = v163;
  }
  else
  {
    [(MADPhotosPersonProcessingTask *)v7 _updateVIPModels];
  }
  [v150 stop];
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v51 = VCPLogInstance();
    if (os_log_type_enabled(v51, v158))
    {
      v143 = v7->_logPrefix;
      [v150 elapsedTimeSeconds];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v143;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v144;
      _os_log_impl((void *)&_mh_execute_header, v51, v158, "%@ Finished Legacy Person Processing (%.2f seconds)", buf, 0x16u);
    }
LABEL_165:
  }
LABEL_166:
}

- (BOOL)_updateGalleryWithError:(id *)a3
{
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10012350C;
  v28[3] = &unk_100219D98;
  v28[4] = self;
  v5 = objc_retainBlock(v28);
  if (!((unsigned int (*)(void))v5[2])())
  {
    if (-[VCPDatabaseWriter valueForKey:](self->_analysisDatabase, "valueForKey:")
      || -[VCPDatabaseWriter valueForKey:](self->_analysisDatabase, "valueForKey:"))
    {
      [(VCPDatabaseWriter *)self->_analysisDatabase removeKey:@"MADPersonProcessingStatus"];
      -[VCPDatabaseWriter removeKey:](self->_analysisDatabase, "removeKey:");
      [(VCPDatabaseWriter *)self->_analysisDatabase commit];
    }
    id v24 = objc_alloc_init((Class)VCPTimeMeasurement);
    [v24 start];
    uint64_t v7 = mach_absolute_time();
    id v8 = VCPSignPostLog();
    os_signpost_id_t v9 = os_signpost_id_generate(v8);

    id v10 = VCPSignPostLog();
    uint64_t v11 = v10;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "MADPhotosPersonProcessingTaskClusterFace", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    os_log_type_t v12 = [(GDVUVisualUnderstandingService *)self->_vuService gallery];
    id v27 = 0;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1001235C0;
    v25[3] = &unk_10021CCC8;
    v25[4] = self;
    os_signpost_id_t v13 = v5;
    id v26 = v13;
    [v12 updateAndReturnError:&v27 progressHandler:v25];
    id v23 = v27;

    v14 = VCPSignPostLog();
    os_log_type_t v15 = v14;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_END, v9, "MADPhotosPersonProcessingTaskClusterFace", (const char *)&unk_1001F3BD3, buf, 2u);
    }

    if (v7)
    {
      mach_absolute_time();
      VCPPerformance_LogMeasurement();
    }
    if (((unsigned int (*)(id))v5[2])(v13))
    {
      if (a3)
      {
        NSErrorUserInfoKey v31 = NSLocalizedDescriptionKey;
        os_log_type_t v16 = +[NSString stringWithFormat:@"%@ Canceled during Gallery updating", self->_logPrefix];
        objc_super v32 = v16;
        uint64_t v17 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
        *a3 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-128 userInfo:v17];
      }
    }
    else
    {
      [v24 stop];
      if (!v23)
      {
        [(VCPDatabaseWriter *)self->_analysisDatabase setValue:1 forKey:@"MADPersonProcessingStatus"];
        [(VCPDatabaseWriter *)self->_analysisDatabase setValue:0 forKey:@"MADPersonProcessingUpdateAttemptCount"];
        [(VCPDatabaseWriter *)self->_analysisDatabase commit];
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          id v18 = VCPLogInstance();
          os_log_type_t v19 = VCPLogToOSLogType[6];
          if (os_log_type_enabled(v18, v19))
          {
            logPrefix = self->_logPrefix;
            *(_DWORD *)buf = 138412290;
            BOOL v30 = logPrefix;
            _os_log_impl((void *)&_mh_execute_header, v18, v19, "%@ Successfully updated Gallery", buf, 0xCu);
          }
        }
        __int16 v21 = +[VCPMADCoreAnalyticsManager sharedManager];
        [v24 elapsedTimeSeconds];
        objc_msgSend(v21, "accumulateDoubleValue:forField:andEvent:", @"FaceClusteringElapsedTimeInSeconds", @"com.apple.mediaanalysisd.FaceAnalysisRunSession");
        [v21 accumulateInt64Value:1 forField:@"NumberOfClusterEvents" andEvent:@"com.apple.mediaanalysisd.FaceAnalysisRunSession"];

        BOOL v6 = 1;
        goto LABEL_28;
      }
      if (a3)
      {
        BOOL v6 = 0;
        *a3 = [v23 copy];
LABEL_28:

        goto LABEL_29;
      }
    }
    BOOL v6 = 0;
    goto LABEL_28;
  }
  if (a3)
  {
    NSErrorUserInfoKey v33 = NSLocalizedDescriptionKey;
    id v24 = +[NSString stringWithFormat:@"%@ Gallery updating cancelled before clustering started", self->_logPrefix];
    id v34 = v24;
    id v23 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    +[NSError errorWithDomain:NSOSStatusErrorDomain code:-128 userInfo:v23];
    BOOL v6 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_29:

    goto LABEL_30;
  }
  BOOL v6 = 0;
LABEL_30:

  return v6;
}

- (BOOL)_buildAndPromotePersonWithError:(id *)a3 needReclustering:(BOOL *)a4
{
  if (a4)
  {
    v184[0] = _NSConcreteStackBlock;
    v184[1] = 3221225472;
    v184[2] = sub_10012596C;
    v184[3] = &unk_100219D98;
    v184[4] = self;
    os_log_type_t v158 = objc_retainBlock(v184);
    BOOL v6 = (unsigned int (**)(id))(v158 + 16);
    if ((*((unsigned int (**)(void))v158 + 2))())
    {
      if (!a3)
      {
        char v7 = 0;
LABEL_143:

        return v7;
      }
      NSErrorUserInfoKey v211 = NSLocalizedDescriptionKey;
      id v155 = +[NSString stringWithFormat:@"%@ Person updating cancelled", self->_logPrefix];
      id v212 = v155;
      id v156 = +[NSDictionary dictionaryWithObjects:&v212 forKeys:&v211 count:1];
      +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, -128);
      char v7 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_142:

      goto LABEL_143;
    }
    analysisDatabase = self->_analysisDatabase;
    id v183 = 0;
    unsigned int v11 = [(VCPDatabaseWriter *)analysisDatabase queryChangeToken:&v183 forTaskID:3 andChangeTokenType:2];
    id v155 = v183;
    if (v11 && (int)MediaAnalysisLogLevel() >= 3)
    {
      os_log_type_t v12 = VCPLogInstance();
      os_log_type_t v13 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v12, v13))
      {
        logPrefix = self->_logPrefix;
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = logPrefix;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, v13, "%@ Failed to query previous MADGDChangeBookmark (code:%d)", buf, 0x12u);
      }
    }
    if (v155)
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        os_log_type_t v15 = VCPLogInstance();
        os_log_type_t v16 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v15, v16))
        {
          uint64_t v17 = self->_logPrefix;
          id v18 = [v155 base64EncodedStringWithOptions:0];
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v17;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v18;
          _os_log_impl((void *)&_mh_execute_header, v15, v16, "%@ previousChangeBookmark data %@", buf, 0x16u);
        }
      }
      *(void *)v191 = 0;
      *(void *)&v191[8] = v191;
      *(void *)&v191[16] = 0x2050000000;
      os_log_type_t v19 = (void *)qword_100252768;
      v192 = (uint64_t (*)(uint64_t, uint64_t))qword_100252768;
      if (!qword_100252768)
      {
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3221225472;
        *(void *)&uint8_t buf[16] = sub_100129A68;
        v202 = (uint64_t (*)(uint64_t, uint64_t))&unk_100219E10;
        v203 = (void (*)(uint64_t))v191;
        sub_100129A68((uint64_t)buf);
        os_log_type_t v19 = *(void **)(*(void *)&v191[8] + 24);
      }
      id v20 = v19;
      _Block_object_dispose(v191, 8);
      id v182 = 0;
      uint64_t v21 = [v20 decodeFromData:v155 error:&v182];
      id v22 = v182;
      if (!v21 && (int)MediaAnalysisLogLevel() >= 3)
      {
        id v23 = VCPLogInstance();
        os_log_type_t v24 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v23, v24))
        {
          v25 = self->_logPrefix;
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v25;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v22;
          _os_log_impl((void *)&_mh_execute_header, v23, v24, "%@ Failed to retrieve previous MADGDChangeBookmark - %@", buf, 0x16u);
        }

        uint64_t v21 = 0;
      }
    }
    else
    {
      uint64_t v21 = 0;
    }
    id v26 = +[NSMutableSet set];
    id v153 = v26;
    if (!v21)
    {
LABEL_44:
      id v156 = (id)v21;
      if ((*((unsigned int (**)(void))v158 + 2))())
      {
        if (!a3)
        {
          char v7 = 0;
LABEL_141:

          goto LABEL_142;
        }
        NSErrorUserInfoKey v209 = NSLocalizedDescriptionKey;
        v152 = +[NSString stringWithFormat:@"%@ Person updating cancelled", self->_logPrefix];
        v210 = v152;
        id v149 = +[NSDictionary dictionaryWithObjects:&v210 forKeys:&v209 count:1];
        +[NSError errorWithDomain:NSOSStatusErrorDomain code:-128 userInfo:v149];
        char v7 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_140:

        goto LABEL_141;
      }
      uint64_t v150 = mach_absolute_time();
      v42 = VCPSignPostLog();
      os_signpost_id_t v43 = os_signpost_id_generate(v42);

      v44 = VCPSignPostLog();
      v45 = v44;
      if (v43 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v44))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v45, OS_SIGNPOST_INTERVAL_BEGIN, v43, "GalleryPhotosUpdate_UpdateEndToEnd", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      v152 = +[NSDate now];
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        v46 = VCPLogInstance();
        os_log_type_t v47 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v46, v47))
        {
          id v48 = self->_logPrefix;
          id v49 = [v153 count];
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v48;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v49;
          _os_log_impl((void *)&_mh_execute_header, v46, v47, "%@ Initiate all entities from Gallery to PhotosDB (with %lu changed entities)", buf, 0x16u);
        }
      }
      v145 = +[NSMutableSet set];
      if (([(PHPhotoLibrary *)self->_photoLibrary vcp_isSyndicationLibrary] & 1) == 0)
      {
        v50 = +[MADGDUtilities fetchKeyFaceLocalIdentifiersForPhotoLibrary:self->_photoLibrary];
        if ([v50 count]) {
          [v145 unionSet:v50];
        }
      }
      v177[0] = 0;
      v177[1] = v177;
      v177[2] = 0x2020000000;
      v177[3] = 0;
      v136 = [(PHPhotoLibrary *)self->_photoLibrary mad_allPersonsFetchOptionsWithDetectionTypes:0 andVerifiedTypes:0];
      [v136 setFetchLimit:1];
      [v136 setShouldPrefetchCount:1];
      v170[0] = _NSConcreteStackBlock;
      v170[1] = 3221225472;
      v170[2] = sub_100125E74;
      v170[3] = &unk_10021E4A0;
      v176 = v177;
      v170[4] = self;
      id v156 = v156;
      id v171 = v156;
      id v172 = v153;
      id v143 = v136;
      id v173 = v143;
      v146 = v158;
      v175 = v146;
      id v149 = v145;
      id v174 = v149;
      v148 = objc_retainBlock(v170);
      v51 = +[MADGDUtilities sharedInstance];
      [v51 flush];

      vuService = self->_vuService;
      id v169 = 0;
      v147 = [(GDVUVisualUnderstandingService *)vuService entitiesFor:0 error:&v169 body:v148];
      id v144 = v169;
      if (v144)
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v53 = VCPLogInstance();
          os_log_type_t v54 = VCPLogToOSLogType[3];
          if (os_log_type_enabled(v53, v54))
          {
            v55 = self->_logPrefix;
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v55;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v144;
            _os_log_impl((void *)&_mh_execute_header, v53, v54, "%@ Failed to update entities from Gallery - %@", buf, 0x16u);
          }
        }
      }
      else
      {
        if ((*v6)(v146))
        {
          if (!a3)
          {
            char v7 = 0;
LABEL_139:

            _Block_object_dispose(v177, 8);
            goto LABEL_140;
          }
          NSErrorUserInfoKey v207 = NSLocalizedDescriptionKey;
          os_log_type_t v151 = +[NSString stringWithFormat:@"%@ Person updating cancelled", self->_logPrefix];
          v208 = v151;
          v140 = +[NSDictionary dictionaryWithObjects:&v208 forKeys:&v207 count:1];
          +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, -128);
          char v7 = 0;
          *a3 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_138;
        }
        if (v156)
        {
          if ((int)MediaAnalysisLogLevel() >= 6)
          {
            v56 = VCPLogInstance();
            os_log_type_t v57 = VCPLogToOSLogType[6];
            if (os_log_type_enabled(v56, v57))
            {
              unsigned int v58 = self->_logPrefix;
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v58;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v147;
              _os_log_impl((void *)&_mh_execute_header, v56, v57, "%@ Update MADGDChangeBookmark %@", buf, 0x16u);
            }
          }
          id v167 = 0;
          uint64_t v59 = [v147 encodeToDataAndReturnError:&v167];
          id v137 = v167;
          id v141 = (void *)v59;
          if (!v59 && (int)MediaAnalysisLogLevel() >= 3)
          {
            v60 = VCPLogInstance();
            os_log_type_t v61 = VCPLogToOSLogType[3];
            if (os_log_type_enabled(v60, v61))
            {
              v62 = self->_logPrefix;
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v62;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v137;
              _os_log_impl((void *)&_mh_execute_header, v60, v61, "%@ Failed to encode updated MADGDChangeBookmark - %@", buf, 0x16u);
            }
          }
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            v63 = VCPLogInstance();
            os_log_type_t v64 = VCPLogToOSLogType[7];
            if (os_log_type_enabled(v63, v64))
            {
              v65 = self->_logPrefix;
              id v66 = [v141 base64EncodedStringWithOptions:0];
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v65;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v66;
              _os_log_impl((void *)&_mh_execute_header, v63, v64, "%@ Update ChangeBookmark with data %@", buf, 0x16u);
            }
          }
          [(VCPDatabaseWriter *)self->_analysisDatabase updateChangeToken:v141 forTaskID:3 andChangeTokenType:2];
          v147;

          v67 = self->_analysisDatabase;
          v68 = [(PHPhotoLibrary *)self->_photoLibrary currentToken];
          [(VCPDatabaseWriter *)v67 updateChangeToken:v68 forTaskID:3 andChangeTokenType:3];
        }
        else
        {
          if ((int)MediaAnalysisLogLevel() >= 6)
          {
            id v69 = VCPLogInstance();
            os_log_type_t v70 = VCPLogToOSLogType[6];
            if (os_log_type_enabled(v69, v70))
            {
              v71 = self->_logPrefix;
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v71;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v147;
              _os_log_impl((void *)&_mh_execute_header, v69, v70, "%@ Initiate MADGDChangeBookmark %@", buf, 0x16u);
            }
          }
          id v168 = 0;
          uint64_t v72 = [v147 encodeToDataAndReturnError:&v168];
          id v137 = v168;
          id v141 = (void *)v72;
          if (!v72 && (int)MediaAnalysisLogLevel() >= 3)
          {
            v73 = VCPLogInstance();
            os_log_type_t v74 = VCPLogToOSLogType[3];
            if (os_log_type_enabled(v73, v74))
            {
              v75 = self->_logPrefix;
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v75;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v137;
              _os_log_impl((void *)&_mh_execute_header, v73, v74, "%@ Failed to encode initial MADGDChangeBookmark - %@", buf, 0x16u);
            }
          }
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            v76 = VCPLogInstance();
            os_log_type_t v77 = VCPLogToOSLogType[7];
            if (os_log_type_enabled(v76, v77))
            {
              unsigned __int8 v78 = self->_logPrefix;
              id v79 = [v141 base64EncodedStringWithOptions:0];
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v78;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v79;
              _os_log_impl((void *)&_mh_execute_header, v76, v77, "%@ Setting ChangeBookmark with data %@", buf, 0x16u);
            }
          }
          [(VCPDatabaseWriter *)self->_analysisDatabase setChangeToken:v141 forTaskID:3 andChangeTokenType:2];
          v147;
          v80 = self->_analysisDatabase;
          v68 = [(PHPhotoLibrary *)self->_photoLibrary currentToken];
          [(VCPDatabaseWriter *)v80 setChangeToken:v68 forTaskID:3 andChangeTokenType:3];
        }

        [(VCPDatabaseWriter *)self->_analysisDatabase removeKey:@"MADPersonProcessingStatus"];
        [(VCPDatabaseWriter *)self->_analysisDatabase removeKey:@"MADPersonProcessingUpdateAttemptCount"];
        id v156 = v147;
        [(VCPDatabaseWriter *)self->_analysisDatabase commit];
      }
      v81 = VCPSignPostLog();
      v82 = v81;
      if (v43 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v81))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v82, OS_SIGNPOST_INTERVAL_END, v43, "GalleryPhotosUpdate_UpdateEndToEnd", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      if (v150)
      {
        mach_absolute_time();
        VCPPerformance_LogMeasurement();
      }
      os_log_type_t v151 = +[VCPMADCoreAnalyticsManager sharedManager];
      [v152 timeIntervalSinceNow];
      [v151 accumulateDoubleValue:@"PersonBuildingElapsedTimeInSeconds" forField:@"com.apple.mediaanalysisd.FaceAnalysisRunSession" andEvent:-v83];
      [v151 accumulateInt64Value:1 forField:@"NumberOfPersonBuildingEvents" andEvent:@"com.apple.mediaanalysisd.FaceAnalysisRunSession"];
      if ((*v6)(v146))
      {
        if (a3)
        {
          NSErrorUserInfoKey v205 = NSLocalizedDescriptionKey;
          v142 = +[NSString stringWithFormat:@"%@ Person promoting cancelled", self->_logPrefix];
          v206 = v142;
          v138 = +[NSDictionary dictionaryWithObjects:&v206 forKeys:&v205 count:1];
          +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, -128);
          char v7 = 0;
          *a3 = (id)objc_claimAutoreleasedReturnValue();

LABEL_137:
          goto LABEL_138;
        }
        char v7 = 0;
LABEL_138:

        goto LABEL_139;
      }
      v142 = [(PHPhotoLibrary *)self->_photoLibrary mad_allPersonsFetchOptionsWithDetectionTypes:&off_100230560 andVerifiedTypes:&off_100230578];
      v84 = +[PHPerson fetchPersonsWithOptions:](PHPerson, "fetchPersonsWithOptions:");
      v130 = [v84 count];

      v139 = +[NSDate now];
      uint64_t v132 = mach_absolute_time();
      v85 = VCPSignPostLog();
      os_signpost_id_t v86 = os_signpost_id_generate(v85);

      v87 = VCPSignPostLog();
      v88 = v87;
      if (v86 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v87))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v88, OS_SIGNPOST_INTERVAL_BEGIN, v86, "MADPhotosPersonProcessingTaskPromotePerson", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      v202 = sub_100122B18;
      v203 = sub_100122B28;
      id v204 = +[NSDate distantPast];
      dispatch_queue_t v135 = dispatch_queue_create("MADPersonPromotingProgress", 0);
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v89 = VCPLogInstance();
        os_log_type_t v90 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v89, v90))
        {
          uint64_t v91 = self->_logPrefix;
          *(_DWORD *)v191 = 138412546;
          *(void *)&v191[4] = v91;
          *(_WORD *)&v191[12] = 2048;
          *(void *)&v191[14] = v130;
          _os_log_impl((void *)&_mh_execute_header, v89, v90, "%@ Start Person Promoting with %lu graph verified person", v191, 0x16u);
        }
      }
      +[PNPersonPromoter setProcessed:0 forLibrary:self->_photoLibrary];
      personPromoter = self->_personPromoter;
      v163[0] = _NSConcreteStackBlock;
      v163[1] = 3221225472;
      v163[2] = sub_1001266C0;
      v163[3] = &unk_10021E450;
      os_signpost_id_t v93 = v135;
      v165 = self;
      v166 = buf;
      v134 = v93;
      v164 = v93;
      unsigned __int8 v94 = [(PNPersonPromoter *)personPromoter promoteUnverifiedPersonsWithUpdateBlock:v163];
      if ((*v6)(v146))
      {
        if (a3)
        {
          NSErrorUserInfoKey v199 = NSLocalizedDescriptionKey;
          v95 = +[NSString stringWithFormat:@"%@ Person promoting cancelled", self->_logPrefix];
          v200 = v95;
          id v96 = +[NSDictionary dictionaryWithObjects:&v200 forKeys:&v199 count:1];
          +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, -128);
          id v97 = (id)objc_claimAutoreleasedReturnValue();
LABEL_132:
          char v7 = 0;
          *a3 = v97;
LABEL_133:

          goto LABEL_135;
        }
      }
      else
      {
        v98 = VCPSignPostLog();
        v99 = v98;
        if (v86 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v98))
        {
          *(_WORD *)v191 = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v99, OS_SIGNPOST_INTERVAL_END, v86, "MADPhotosPersonProcessingTaskPromotePerson", (const char *)&unk_1001F3BD3, v191, 2u);
        }

        if (v132)
        {
          mach_absolute_time();
          VCPPerformance_LogMeasurement();
        }
        [v139 timeIntervalSinceNow];
        [v151 accumulateDoubleValue:@"PersonPromotingElapsedTimeInSeconds" forField:@"com.apple.mediaanalysisd.FaceAnalysisRunSession" andEvent:-v100];
        [v151 accumulateInt64Value:1 forField:@"NumberOfPersonPromotingEvents" andEvent:@"com.apple.mediaanalysisd.FaceAnalysisRunSession"];
        v101 = +[PHPerson fetchPersonsWithOptions:v142];
        id v102 = [v101 count];

        if (v94)
        {
          +[PNPersonPromoter setProcessed:1 forLibrary:self->_photoLibrary];
          if ((int)MediaAnalysisLogLevel() >= 6)
          {
            v103 = VCPLogInstance();
            os_log_type_t v104 = VCPLogToOSLogType[6];
            if (os_log_type_enabled(v103, v104))
            {
              v105 = self->_logPrefix;
              *(_DWORD *)v191 = 138412546;
              *(void *)&v191[4] = v105;
              *(_WORD *)&v191[12] = 2048;
              *(void *)&v191[14] = v102 - v130;
              _os_log_impl((void *)&_mh_execute_header, v103, v104, "%@ Finished Person Promoting with %lu new Graph verified persons", v191, 0x16u);
            }
          }
          *a4 |= v102 != v130;
          if (!(*v6)(v146))
          {
            v95 = [(PHPhotoLibrary *)self->_photoLibrary mad_allPersonsFetchOptionsWithDetectionTypes:&off_100230590 andVerifiedTypes:&off_1002305A8];
            v107 = +[PHPerson fetchPersonsWithOptions:v95];
            v129 = [v107 count];

            id v96 = +[NSDate now];
            uint64_t v128 = mach_absolute_time();
            v108 = VCPSignPostLog();
            os_signpost_id_t v109 = os_signpost_id_generate(v108);

            uint64_t v110 = VCPSignPostLog();
            v111 = v110;
            if (v109 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v110))
            {
              *(_WORD *)v191 = 0;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v111, OS_SIGNPOST_INTERVAL_BEGIN, v109, "MADPhotosPersonProcessingTaskPromotePet", (const char *)&unk_1001F3BD3, v191, 2u);
            }

            *(void *)v191 = 0;
            *(void *)&v191[8] = v191;
            *(void *)&v191[16] = 0x3032000000;
            v192 = sub_100122B18;
            v193 = sub_100122B28;
            id v194 = +[NSDate distantPast];
            dispatch_queue_t v133 = dispatch_queue_create("MADPetPromotingProgress", 0);
            if ((int)MediaAnalysisLogLevel() >= 7)
            {
              os_signpost_id_t v112 = VCPLogInstance();
              os_log_type_t v113 = VCPLogToOSLogType[7];
              if (os_log_type_enabled(v112, v113))
              {
                v114 = self->_logPrefix;
                *(_DWORD *)v187 = 138412546;
                v188 = v114;
                __int16 v189 = 2048;
                v190 = v129;
                _os_log_impl((void *)&_mh_execute_header, v112, v113, "%@ Start Pet Promoting with %lu graph verified pet", v187, 0x16u);
              }
            }
            petPromoter = self->_petPromoter;
            v159[0] = _NSConcreteStackBlock;
            v159[1] = 3221225472;
            v159[2] = sub_1001269B8;
            v159[3] = &unk_10021E4C8;
            v116 = v133;
            id v161 = self;
            v162 = v191;
            v131 = v116;
            id v160 = v116;
            [(PNPetPromoterWrapper *)petPromoter promoteUnverifiedPetsWithUpdateBlock:v159];
            unsigned int v117 = (*v6)(v146);
            if (v117)
            {
              if (a3)
              {
                NSErrorUserInfoKey v185 = NSLocalizedDescriptionKey;
                unsigned __int8 v118 = +[NSString stringWithFormat:@"%@ Pet promoting cancelled", self->_logPrefix];
                v186 = v118;
                v119 = +[NSDictionary dictionaryWithObjects:&v186 forKeys:&v185 count:1];
                *a3 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-128 userInfo:v119];
              }
            }
            else
            {
              v120 = VCPSignPostLog();
              v121 = v120;
              if (v109 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v120))
              {
                *(_WORD *)v187 = 0;
                _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v121, OS_SIGNPOST_INTERVAL_END, v109, "MADPhotosPersonProcessingTaskPromotePet", (const char *)&unk_1001F3BD3, v187, 2u);
              }

              if (v128)
              {
                mach_absolute_time();
                VCPPerformance_LogMeasurement();
              }
              [v96 timeIntervalSinceNow];
              [v151 accumulateDoubleValue:@"PetPromotingElapsedTimeInSeconds" forField:@"com.apple.mediaanalysisd.FaceAnalysisRunSession" andEvent:-v122];
              [v151 accumulateInt64Value:1 forField:@"NumberOfPetPromotingEvents" andEvent:@"com.apple.mediaanalysisd.FaceAnalysisRunSession"];
              v123 = +[PHPerson fetchPersonsWithOptions:v95];
              double v124 = [v123 count];

              if ((int)MediaAnalysisLogLevel() >= 6)
              {
                qos_class_t v125 = VCPLogInstance();
                os_log_type_t v126 = VCPLogToOSLogType[6];
                if (os_log_type_enabled(v125, v126))
                {
                  v127 = self->_logPrefix;
                  *(_DWORD *)v187 = 138412546;
                  v188 = v127;
                  __int16 v189 = 2048;
                  v190 = (unsigned char *)(v124 - v129);
                  _os_log_impl((void *)&_mh_execute_header, v125, v126, "%@ Finished Pet Promoting with %lu new Graph verified pets", v187, 0x16u);
                }
              }
              *a4 |= v124 != v129;
              [(VCPDatabaseWriter *)self->_analysisDatabase cacheProcessedAssetCountAfterPromoter:[(VCPDatabaseWriter *)self->_analysisDatabase valueForKey:@"NumberOfAssetsAnalyzedForPhotosFaceProcessing"]];
            }

            _Block_object_dispose(v191, 8);
            char v7 = v117 ^ 1;
            goto LABEL_133;
          }
          if (a3)
          {
            NSErrorUserInfoKey v195 = NSLocalizedDescriptionKey;
            v95 = +[NSString stringWithFormat:@"%@ Pet promoting cancelled", self->_logPrefix];
            v196 = v95;
            id v96 = +[NSDictionary dictionaryWithObjects:&v196 forKeys:&v195 count:1];
            +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, -128);
            id v97 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_132;
          }
        }
        else if (a3)
        {
          NSErrorUserInfoKey v197 = NSLocalizedDescriptionKey;
          v95 = +[NSString stringWithFormat:@"%@ Failed during person promoting", self->_logPrefix];
          v198 = v95;
          id v96 = +[NSDictionary dictionaryWithObjects:&v198 forKeys:&v197 count:1];
          +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, -18);
          id v97 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_132;
        }
      }
      char v7 = 0;
LABEL_135:

      _Block_object_dispose(buf, 8);
      goto LABEL_137;
    }
    v157 = v21;
    v179[0] = _NSConcreteStackBlock;
    v179[1] = 3221225472;
    v179[2] = sub_100125A20;
    v179[3] = &unk_10021E478;
    id v27 = v26;
    id v180 = v27;
    v181 = self;
    v28 = objc_retainBlock(v179);
    objc_super v29 = self->_vuService;
    id v178 = 0;
    BOOL v30 = [(GDVUVisualUnderstandingService *)v29 changesSince:v21 error:&v178 body:v28];
    id v31 = v178;
    if (v30)
    {
      if ((int)MediaAnalysisLogLevel() < 7)
      {
LABEL_39:
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          v38 = VCPLogInstance();
          os_log_type_t v39 = VCPLogToOSLogType[6];
          if (os_log_type_enabled(v38, v39))
          {
            v40 = self->_logPrefix;
            id v41 = [v27 count];
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v40;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = v41;
            _os_log_impl((void *)&_mh_execute_header, v38, v39, "%@ Fetched %lu entities to update", buf, 0x16u);
          }
        }
        uint64_t v21 = (uint64_t)v157;
        goto LABEL_44;
      }
      objc_super v32 = VCPLogInstance();
      os_log_type_t v33 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v32, v33))
      {
        id v34 = self->_logPrefix;
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v34;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v30;
        _os_log_impl((void *)&_mh_execute_header, v32, v33, "%@ fresh currentChangeBookmark %@", buf, 0x16u);
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v35 = VCPLogInstance();
        os_log_type_t v36 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v35, v36))
        {
          v37 = self->_logPrefix;
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v37;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v31;
          _os_log_impl((void *)&_mh_execute_header, v35, v36, "%@ Failed to fetch Gallery updates; falls to full sync - %@",
            buf,
            0x16u);
        }
      }
      [v27 removeAllObjects];
      objc_super v32 = v157;
      v157 = 0;
    }

    goto LABEL_39;
  }
  if (a3)
  {
    NSErrorUserInfoKey v213 = NSLocalizedDescriptionKey;
    id v8 = +[NSString stringWithFormat:@"needReclustering is nil"];
    v214 = v8;
    os_signpost_id_t v9 = +[NSDictionary dictionaryWithObjects:&v214 forKeys:&v213 count:1];
    *a3 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-50 userInfo:v9];
  }
  return 0;
}

- (void)processGallery
{
  if (self->_requirement == 10)
  {
    id v3 = [(PHPhotoLibrary *)self->_photoLibrary mad_countOfUnclusteredFaces];
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      os_log_type_t v4 = VCPLogInstance();
      os_log_type_t v5 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v4, v5))
      {
        logPrefix = self->_logPrefix;
        *(_DWORD *)buf = 138412546;
        v187 = logPrefix;
        __int16 v188 = 2048;
        uint64_t v189 = (uint64_t)v3;
        _os_log_impl((void *)&_mh_execute_header, v4, v5, "%@ Found %lu faces to add to Gallery for clustering", buf, 0x16u);
      }
    }
    if (v3 < (id)+[MADGDUtilities clusterFaceCountThreshold])
    {
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        oslog = VCPLogInstance();
        os_log_type_t v7 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(oslog, v7))
        {
          id v8 = self->_logPrefix;
          *(_DWORD *)buf = 138412290;
          v187 = v8;
          _os_log_impl((void *)&_mh_execute_header, oslog, v7, "%@ Skipping cluster and person building", buf, 0xCu);
        }
        goto LABEL_204;
      }
      return;
    }
  }
  oslog = objc_alloc_init((Class)VCPTimeMeasurement);
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    os_signpost_id_t v9 = VCPLogInstance();
    os_log_type_t v10 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v9, v10))
    {
      unsigned int v11 = self->_logPrefix;
      *(_DWORD *)buf = 138412290;
      v187 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "%@ Start Gallery Person Processing", buf, 0xCu);
    }
  }
  [oslog start];
  v185[0] = _NSConcreteStackBlock;
  v185[1] = 3221225472;
  v185[2] = sub_100128C58;
  v185[3] = &unk_100219D98;
  v185[4] = self;
  id v174 = objc_retainBlock(v185);
  if (((unsigned int (*)(void))v174[2])())
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      os_log_type_t v12 = VCPLogInstance();
      os_log_type_t v13 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v12, v13))
      {
        v14 = self->_logPrefix;
        *(_DWORD *)buf = 138412290;
        v187 = v14;
        _os_log_impl((void *)&_mh_execute_header, v12, v13, "%@ Gallery processing canceled", buf, 0xCu);
      }
    }
    goto LABEL_203;
  }
  os_log_type_t v15 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:self->_photoLibrary];
  [v15 cacheCurrentFaceProgress];

  uint64_t v16 = [(VCPDatabaseWriter *)self->_analysisDatabase valueForKey:@"MADPersonProcessingStatus"];
  int v17 = [(VCPDatabaseWriter *)self->_analysisDatabase valueForKey:@"MADPersonProcessingUpdateAttemptCount"];
  int v18 = v17;
  if (v16 == 1 && v17 <= 4)
  {
    os_log_type_t v19 = +[MADGDUtilities sharedInstance];
    [v19 flush];

    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      id v20 = VCPLogInstance();
      os_log_type_t v21 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v20, v21))
      {
        id v22 = self->_logPrefix;
        *(_DWORD *)buf = 138412290;
        v187 = v22;
        _os_log_impl((void *)&_mh_execute_header, v20, v21, "%@ Finishing previous Gallery updates to Photos", buf, 0xCu);
      }
    }
    char v184 = 0;
    [(VCPDatabaseWriter *)self->_analysisDatabase setValue:v18 + 1 forKey:@"MADPersonProcessingUpdateAttemptCount"];
    [(VCPDatabaseWriter *)self->_analysisDatabase commit];
    id v183 = 0;
    unsigned __int8 v23 = [(MADPhotosPersonProcessingTask *)self _buildAndPromotePersonWithError:&v183 needReclustering:&v184];
    os_log_type_t v24 = v183;
    if ((v23 & 1) == 0 && (int)MediaAnalysisLogLevel() >= 3)
    {
      v25 = VCPLogInstance();
      os_log_type_t v26 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v25, v26))
      {
        id v27 = self->_logPrefix;
        *(_DWORD *)buf = 138412546;
        v187 = v27;
        __int16 v188 = 2112;
        uint64_t v189 = (uint64_t)v24;
        _os_log_impl((void *)&_mh_execute_header, v25, v26, "%@ Failed to finish previous person updates to Photos - %@", buf, 0x16u);
      }
    }
LABEL_37:

    goto LABEL_38;
  }
  if (v16)
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      os_log_type_t v24 = VCPLogInstance();
      os_log_type_t v28 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v24, v28))
      {
        objc_super v29 = self->_logPrefix;
        MADPersonProcessingStatusDescription(v16);
        id v30 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v187 = v29;
        __int16 v188 = 2112;
        uint64_t v189 = (uint64_t)v30;
        __int16 v190 = 1024;
        LODWORD(v191) = v18;
        _os_log_impl((void *)&_mh_execute_header, v24, v28, "%@ Previous Gallery update status: %@, attempts: %d; skip update catch-up",
          buf,
          0x1Cu);
      }
      goto LABEL_37;
    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 6)
  {
    os_log_type_t v24 = VCPLogInstance();
    os_log_type_t v31 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v24, v31))
    {
      objc_super v32 = self->_logPrefix;
      MADPersonProcessingStatusDescription(0);
      id v33 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v187 = v32;
      __int16 v188 = 2112;
      uint64_t v189 = (uint64_t)v33;
      _os_log_impl((void *)&_mh_execute_header, v24, v31, "%@ No previous Gallery updates (%@)", buf, 0x16u);
    }
    goto LABEL_37;
  }
LABEL_38:
  char v165 = 0;
  os_log_type_t type = VCPLogToOSLogType[6];
  os_log_type_t v170 = VCPLogToOSLogType[7];
  uint64_t v169 = PHFacePropertySetIdentifier;
  uint64_t v168 = PHFacePropertySetCore;
  uint64_t v166 = PHFacePropertySetPersonBuilder;
  uint64_t v167 = PHFacePropertySetClustering;
  os_log_type_t v164 = VCPLogToOSLogType[3];
  while (1)
  {
    if (((unsigned int (*)(void))v174[2])())
    {
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        v108 = VCPLogInstance();
        if (os_log_type_enabled(v108, type))
        {
          os_signpost_id_t v109 = self->_logPrefix;
          *(_DWORD *)buf = 138412290;
          v187 = v109;
          _os_log_impl((void *)&_mh_execute_header, v108, type, "%@ Gallery processing canceled", buf, 0xCu);
        }
      }
      goto LABEL_203;
    }
    id v34 = [(PHPhotoLibrary *)self->_photoLibrary countOfFaceCropsToBeGenerated];
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      v35 = VCPLogInstance();
      if (os_log_type_enabled(v35, type))
      {
        os_log_type_t v36 = self->_logPrefix;
        *(_DWORD *)buf = 138412546;
        v187 = v36;
        __int16 v188 = 2048;
        uint64_t v189 = (uint64_t)v34;
        _os_log_impl((void *)&_mh_execute_header, v35, type, "%@ Found %lu face crops to generate", buf, 0x16u);
      }
    }
    if (v34)
    {
      uint64_t v37 = mach_absolute_time();
      v38 = VCPSignPostLog();
      os_signpost_id_t v39 = os_signpost_id_generate(v38);

      v40 = VCPSignPostLog();
      id v41 = v40;
      if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v41, OS_SIGNPOST_INTERVAL_BEGIN, v39, "MADPhotosPersonProcessingTaskGenerateFaceCrop", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      v42 = objc_alloc_init(MADPhotosFaceCropGenerationTask);
      os_signpost_id_t v43 = [(MADProcessingTask *)self cancelBlock];
      [(MADProcessingTask *)v42 setCancelBlock:v43];

      id v44 = [(PHPhotoLibrary *)self->_photoLibrary newFaceCropsToBeGeneratedFetchOptions];
      v45 = +[PHFace fetchFacesWithOptions:v44];
      for (unint64_t i = 0; i < (unint64_t)[v45 count]; ++i)
      {
        id v48 = [v45 objectAtIndexedSubscript:i];
        [(MADPhotosFaceCropGenerationTask *)v42 addFace:v48];

        if ([(MADPhotosFaceCropGenerationTask *)v42 count] >= 0x64)
        {
          [(MADPhotosFaceCropGenerationTask *)v42 prepare];
          [(MADPhotosFaceCropGenerationTask *)v42 process];
          [(MADAssetProcessingTask *)v42 publish];
          id v49 = objc_alloc_init(MADPhotosFaceCropGenerationTask);

          v50 = [(MADProcessingTask *)self cancelBlock];
          [(MADProcessingTask *)v49 setCancelBlock:v50];

          v42 = v49;
        }
      }
      if ([(MADPhotosFaceCropGenerationTask *)v42 count])
      {
        [(MADPhotosFaceCropGenerationTask *)v42 prepare];
        [(MADPhotosFaceCropGenerationTask *)v42 process];
        [(MADAssetProcessingTask *)v42 publish];
      }
      v51 = VCPSignPostLog();
      uint64_t v52 = v51;
      if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v51))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v52, OS_SIGNPOST_INTERVAL_END, v39, "MADPhotosPersonProcessingTaskGenerateFaceCrop", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      if (v37)
      {
        mach_absolute_time();
        VCPPerformance_LogMeasurement();
      }
      id v53 = [(PHPhotoLibrary *)self->_photoLibrary countOfFaceCropsToBeGenerated];
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        os_log_type_t v54 = VCPLogInstance();
        if (os_log_type_enabled(v54, v170))
        {
          v55 = self->_logPrefix;
          *(_DWORD *)buf = 138412546;
          v187 = v55;
          __int16 v188 = 2048;
          uint64_t v189 = (uint64_t)v53;
          _os_log_impl((void *)&_mh_execute_header, v54, v170, "%@ Found %lu face crops yet to generate", buf, 0x16u);
        }
      }
    }
    if (((uint64_t (*)(void))v174[2])()) {
      goto LABEL_137;
    }
    id v56 = [(PHPhotoLibrary *)self->_photoLibrary countOfUnprocessedFaceCrops];
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      os_log_type_t v57 = VCPLogInstance();
      if (os_log_type_enabled(v57, type))
      {
        unsigned int v58 = self->_logPrefix;
        *(_DWORD *)buf = 138412546;
        v187 = v58;
        __int16 v188 = 2048;
        uint64_t v189 = (uint64_t)v56;
        _os_log_impl((void *)&_mh_execute_header, v57, type, "%@ Found %lu face crops to process", buf, 0x16u);
      }
    }
    if (v56)
    {
      uint64_t v59 = mach_absolute_time();
      v60 = VCPSignPostLog();
      os_signpost_id_t v61 = os_signpost_id_generate(v60);

      v62 = VCPSignPostLog();
      v63 = v62;
      if (v61 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v62))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v63, OS_SIGNPOST_INTERVAL_BEGIN, v61, "MADPhotosPersonProcessingTaskFaceCropProcessing", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      photoLibrary = self->_photoLibrary;
      v65 = [(GDVUVisualUnderstandingService *)self->_vuService gallery];
      id v66 = +[MADPhotosFaceCropProcessingTask taskWithPhotoLibrary:photoLibrary andGallery:v65];

      v67 = [(MADProcessingTask *)self cancelBlock];
      [v66 setCancelBlock:v67];

      [v66 process];
      v68 = VCPSignPostLog();
      id v69 = v68;
      if (v61 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v68))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v69, OS_SIGNPOST_INTERVAL_END, v61, "MADPhotosPersonProcessingTaskFaceCropProcessing", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      if (v59)
      {
        mach_absolute_time();
        VCPPerformance_LogMeasurement();
      }
      id v70 = [(PHPhotoLibrary *)self->_photoLibrary countOfUnprocessedFaceCrops];
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v71 = VCPLogInstance();
        if (os_log_type_enabled(v71, v170))
        {
          uint64_t v72 = self->_logPrefix;
          *(_DWORD *)buf = 138412546;
          v187 = v72;
          __int16 v188 = 2048;
          uint64_t v189 = (uint64_t)v70;
          _os_log_impl((void *)&_mh_execute_header, v71, v170, "%@ Found %lu face crops yet to process", buf, 0x16u);
        }
      }
    }
    if ([(PHPhotoLibrary *)self->_photoLibrary vcp_isSyndicationLibrary]
      && (_os_feature_enabled_impl() & 1) == 0)
    {
      break;
    }
    v73 = +[MADGDUtilities sharedInstance];
    [v73 flush];

    if (((uint64_t (*)(void))v174[2])()) {
      goto LABEL_137;
    }
    id v74 = [(PHPhotoLibrary *)self->_photoLibrary mad_countOfUnclusteredFaces];
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      v75 = VCPLogInstance();
      if (os_log_type_enabled(v75, type))
      {
        v76 = self->_logPrefix;
        *(_DWORD *)buf = 138412546;
        v187 = v76;
        __int16 v188 = 2048;
        uint64_t v189 = (uint64_t)v74;
        _os_log_impl((void *)&_mh_execute_header, v75, type, "%@ Found %lu faces to add to Gallery", buf, 0x16u);
      }
    }
    if (v74)
    {
      id v172 = objc_alloc_init((Class)VCPTimeMeasurement);
      [v172 start];
      uint64_t v77 = mach_absolute_time();
      unsigned __int8 v78 = VCPSignPostLog();
      os_signpost_id_t v79 = os_signpost_id_generate(v78);

      v80 = VCPSignPostLog();
      v81 = v80;
      if (v79 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v80))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v81, OS_SIGNPOST_INTERVAL_BEGIN, v79, "MADPhotosPersonProcessingTaskClusterFaceSendFaces", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      v82 = [(PHPhotoLibrary *)self->_photoLibrary mad_unclusteredFacesFetchOptions];
      v194[0] = v169;
      v194[1] = v168;
      v194[2] = v167;
      v194[3] = v166;
      double v83 = +[NSArray arrayWithObjects:v194 count:4];
      [v82 setFetchPropertySets:v83];

      v84 = +[PHFace fetchFacesWithOptions:v82];
      v85 = +[MADGDUtilities sharedInstance];
      os_signpost_id_t v86 = [(GDVUVisualUnderstandingService *)self->_vuService gallery];
      id v182 = 0;
      unsigned __int8 v87 = [v85 prepareClusteringWithFaces:v84 gallery:v86 cancelOrExtendTimeoutBlock:v174 error:&v182];
      id v88 = v182;

      if ((v87 & 1) == 0 && (int)MediaAnalysisLogLevel() >= 3)
      {
        v89 = VCPLogInstance();
        if (os_log_type_enabled(v89, v164))
        {
          os_log_type_t v90 = self->_logPrefix;
          *(_DWORD *)buf = 138412546;
          v187 = v90;
          __int16 v188 = 2112;
          uint64_t v189 = (uint64_t)v88;
          _os_log_impl((void *)&_mh_execute_header, v89, v164, "%@ Failed to add faces to Gallery - %@", buf, 0x16u);
        }
      }
      uint64_t v91 = VCPSignPostLog();
      v92 = v91;
      if (v79 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v91))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v92, OS_SIGNPOST_INTERVAL_END, v79, "MADPhotosPersonProcessingTaskClusterFaceSendFaces", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      if (v77)
      {
        mach_absolute_time();
        VCPPerformance_LogMeasurement();
      }
      id v93 = [(PHPhotoLibrary *)self->_photoLibrary mad_countOfUnclusteredFaces];
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        unsigned __int8 v94 = VCPLogInstance();
        if (os_log_type_enabled(v94, type))
        {
          v95 = self->_logPrefix;
          *(_DWORD *)buf = 138412546;
          v187 = v95;
          __int16 v188 = 2048;
          uint64_t v189 = (uint64_t)v93;
          _os_log_impl((void *)&_mh_execute_header, v94, type, "%@ Found %lu (expected 0) faces yet to add to Gallery", buf, 0x16u);
        }
      }
      [v172 stop];
      id v96 = +[VCPMADCoreAnalyticsManager sharedManager];
      [v172 elapsedTimeSeconds];
      objc_msgSend(v96, "accumulateDoubleValue:forField:andEvent:", @"FaceClusteringElapsedTimeInSeconds", @"com.apple.mediaanalysisd.FaceAnalysisRunSession");
    }
    id v97 = +[MADGDUtilities sharedInstance];
    [v97 flush];

    v98 = [(GDVUVisualUnderstandingService *)self->_vuService gallery];
    unsigned int v99 = [v98 ready];

    if (v99)
    {
      if ((int)MediaAnalysisLogLevel() < 6) {
        goto LABEL_117;
      }
      double v100 = VCPLogInstance();
      if (os_log_type_enabled(v100, type))
      {
        v101 = self->_logPrefix;
        *(_DWORD *)buf = 138412290;
        v187 = v101;
        _os_log_impl((void *)&_mh_execute_header, v100, type, "%@ Gallery is ready; skip updating", buf, 0xCu);
      }
    }
    else
    {
      id v181 = 0;
      int v102 = [(MADPhotosPersonProcessingTask *)self _updateGalleryWithError:&v181];
      double v100 = v181;
      if ((v102 & 1) == 0)
      {
        if ((int)MediaAnalysisLogLevel() < 3) {
          goto LABEL_136;
        }
        uint64_t v110 = VCPLogInstance();
        if (os_log_type_enabled(v110, v164))
        {
          os_log_type_t v113 = self->_logPrefix;
          *(_DWORD *)buf = 138412546;
          v187 = v113;
          __int16 v188 = 2112;
          uint64_t v189 = (uint64_t)v100;
          _os_log_impl((void *)&_mh_execute_header, v110, v164, "%@ Failed to update Gallery - %@", buf, 0x16u);
        }
        goto LABEL_135;
      }
      char v165 = 1;
    }

LABEL_117:
    if (((uint64_t (*)(void))v174[2])()) {
      goto LABEL_137;
    }
    v103 = +[MADGDUtilities sharedInstance];
    [v103 flush];

    char v184 = 0;
    id v180 = 0;
    unsigned __int8 v104 = [(MADPhotosPersonProcessingTask *)self _buildAndPromotePersonWithError:&v180 needReclustering:&v184];
    v105 = v180;
    double v100 = v105;
    if ((v104 & 1) == 0)
    {
      if ((int)MediaAnalysisLogLevel() < 3) {
        goto LABEL_136;
      }
      uint64_t v110 = VCPLogInstance();
      if (os_log_type_enabled(v110, v164))
      {
        v111 = self->_logPrefix;
        *(_DWORD *)buf = 138412546;
        v187 = v111;
        __int16 v188 = 2112;
        uint64_t v189 = (uint64_t)v100;
        _os_log_impl((void *)&_mh_execute_header, v110, v164, "%@ Failed to update person in Photos - %@", buf, 0x16u);
      }
LABEL_135:

      goto LABEL_136;
    }
    BOOL v106 = v184 == 0;
    BOOL v107 = self->_requirement != 20;

    if (v106 || v107) {
      goto LABEL_137;
    }
  }
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    double v100 = VCPLogInstance();
    if (os_log_type_enabled(v100, v170))
    {
      os_signpost_id_t v112 = self->_logPrefix;
      *(_DWORD *)buf = 138412290;
      v187 = v112;
      _os_log_impl((void *)&_mh_execute_header, v100, v170, "%@ Skipping clustering and person processing for syndication library", buf, 0xCu);
    }
LABEL_136:
  }
LABEL_137:
  if ((((uint64_t (*)(void))v174[2])() & 1) == 0)
  {
    if ([(PHPhotoLibrary *)self->_photoLibrary vcp_isSyndicationLibrary]
      && (_os_feature_enabled_impl() & 1) == 0)
    {
      v114 = +[VCPDefaultPhotoLibraryManager sharedManager];
      dispatch_queue_t v115 = [v114 defaultPhotoLibrary];

      id v116 = [objc_alloc((Class)VCPPhotosQuickFaceIdentificationManager) initWithPhotoLibrary:v115];
      unsigned int v117 = self->_photoLibrary;
      v179[0] = _NSConcreteStackBlock;
      v179[1] = 3221225472;
      v179[2] = sub_100128D0C;
      v179[3] = &unk_100219D98;
      void v179[4] = self;
      [v116 personIdentificationForSyndicationPhotoLibrary:v117 withCancelOrExtendTimeoutBlock:v179];
    }
    if ((((uint64_t (*)(void))v174[2])() & 1) == 0)
    {
      if (([(PHPhotoLibrary *)self->_photoLibrary vcp_isSyndicationLibrary] & 1) == 0) {
        [(MADPhotosPersonProcessingTask *)self _updateVIPModels];
      }
      if ((((uint64_t (*)(void))v174[2])() & 1) == 0)
      {
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          unsigned __int8 v118 = VCPLogInstance();
          if (os_log_type_enabled(v118, type))
          {
            v119 = self->_logPrefix;
            *(_DWORD *)buf = 138412290;
            v187 = v119;
            _os_log_impl((void *)&_mh_execute_header, v118, type, "%@ Start updating VUWGallery plugins", buf, 0xCu);
          }
        }
        v178[0] = _NSConcreteStackBlock;
        v178[1] = 3221225472;
        v178[2] = sub_100128DC0;
        v178[3] = &unk_10021E4F0;
        v178[4] = self;
        v120 = objc_retainBlock(v178);
        v121 = +[MADVUWGalleryManager sharedGalleryForPhotoLibrary:self->_photoLibrary];
        if (v165)
        {
          uint64_t v122 = mach_absolute_time();
          v123 = VCPSignPostLog();
          os_signpost_id_t v124 = os_signpost_id_generate(v123);

          qos_class_t v125 = VCPSignPostLog();
          os_log_type_t v126 = v125;
          if (v124 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v125))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v126, OS_SIGNPOST_INTERVAL_BEGIN, v124, "MADVUWGalleryPluginTypeDeviceOwner", (const char *)&unk_1001F3BD3, buf, 2u);
          }

          id v177 = 0;
          unsigned __int8 v127 = [v121 updatePlugin:0 progressHandler:v120 error:&v177];
          id v128 = v177;
          if ((v127 & 1) == 0 && (int)MediaAnalysisLogLevel() >= 3)
          {
            v129 = VCPLogInstance();
            if (os_log_type_enabled(v129, v164))
            {
              v130 = self->_logPrefix;
              *(_DWORD *)buf = 138412546;
              v187 = v130;
              __int16 v188 = 2112;
              uint64_t v189 = (uint64_t)v128;
              _os_log_impl((void *)&_mh_execute_header, v129, v164, "%@ Failed to update device owner - %@", buf, 0x16u);
            }
          }
          v131 = VCPSignPostLog();
          uint64_t v132 = v131;
          if (v124 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v131))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v132, OS_SIGNPOST_INTERVAL_END, v124, "MADVUWGalleryPluginTypeDeviceOwner", (const char *)&unk_1001F3BD3, buf, 2u);
          }

          if (v122)
          {
            mach_absolute_time();
            VCPPerformance_LogMeasurement();
          }
          if (DeviceWithGreymatterSupport())
          {
            uint64_t v133 = mach_absolute_time();
            v134 = VCPSignPostLog();
            os_signpost_id_t v135 = os_signpost_id_generate(v134);

            v136 = VCPSignPostLog();
            id v137 = v136;
            if (v135 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v136))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v137, OS_SIGNPOST_INTERVAL_BEGIN, v135, "MADVUWGalleryPluginTypePersonalization", (const char *)&unk_1001F3BD3, buf, 2u);
            }

            id v176 = v128;
            unsigned __int8 v138 = [v121 updatePlugin:1 progressHandler:v120 error:&v176];
            id v139 = v176;

            id v128 = v139;
            if ((v138 & 1) == 0 && (int)MediaAnalysisLogLevel() >= 3)
            {
              v140 = VCPLogInstance();
              if (os_log_type_enabled(v140, v164))
              {
                id v141 = self->_logPrefix;
                *(_DWORD *)buf = 138412546;
                v187 = v141;
                __int16 v188 = 2112;
                uint64_t v189 = (uint64_t)v128;
                _os_log_impl((void *)&_mh_execute_header, v140, v164, "%@ Failed to update personalization - %@", buf, 0x16u);
              }
            }
            v142 = VCPSignPostLog();
            id v143 = v142;
            if (v135 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v142))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v143, OS_SIGNPOST_INTERVAL_END, v135, "MADVUWGalleryPluginTypePersonalization", (const char *)&unk_1001F3BD3, buf, 2u);
            }

            if (v133)
            {
              mach_absolute_time();
              VCPPerformance_LogMeasurement();
            }
            if ((int)MediaAnalysisLogLevel() >= 6)
            {
              id v144 = VCPLogInstance();
              if (os_log_type_enabled(v144, type))
              {
                v145 = self->_logPrefix;
                *(_DWORD *)buf = 138412290;
                v187 = v145;
                _os_log_impl((void *)&_mh_execute_header, v144, type, "%@ Finished personalization plugin", buf, 0xCu);
              }
            }
            if ([(VCPDatabaseWriter *)self->_analysisDatabase valueForKey:@"PrioritizedFaceAnalysisCheckpointReportedTimestamp"]&& ![(VCPDatabaseWriter *)self->_analysisDatabase valueForKey:@"PersonalizationCheckpointReportedTimestamp"])
            {
              id v175 = v128;
              unsigned __int8 v146 = +[BGSystemTaskCheckpoints reportFeatureCheckpoint:50 forFeature:802 error:&v175];
              id v147 = v175;

              id v128 = v147;
              if (v146)
              {
                if ((int)MediaAnalysisLogLevel() >= 5)
                {
                  v148 = VCPLogInstance();
                  os_log_type_t v149 = VCPLogToOSLogType[5];
                  if (os_log_type_enabled(v148, v149))
                  {
                    uint64_t v150 = self->_logPrefix;
                    *(_DWORD *)buf = 138412802;
                    v187 = v150;
                    __int16 v188 = 2048;
                    uint64_t v189 = 30;
                    __int16 v190 = 2048;
                    uint64_t v191 = 802;
                    os_log_type_t v151 = "%@ Reported checkpoint %lu for %lu";
                    v152 = v148;
                    os_log_type_t v153 = v149;
                    uint32_t v154 = 32;
                    goto LABEL_191;
                  }
                  goto LABEL_192;
                }
              }
              else if ((int)MediaAnalysisLogLevel() >= 3)
              {
                v148 = VCPLogInstance();
                if (os_log_type_enabled(v148, v164))
                {
                  id v155 = self->_logPrefix;
                  *(_DWORD *)buf = 138413058;
                  v187 = v155;
                  __int16 v188 = 2048;
                  uint64_t v189 = 30;
                  __int16 v190 = 2048;
                  uint64_t v191 = 802;
                  __int16 v192 = 2112;
                  id v193 = v147;
                  os_log_type_t v151 = "%@ Failed to report checkpoint %lu for %lu - %@";
                  v152 = v148;
                  os_log_type_t v153 = v164;
                  uint32_t v154 = 42;
LABEL_191:
                  _os_log_impl((void *)&_mh_execute_header, v152, v153, v151, buf, v154);
                }
LABEL_192:
              }
              analysisDatabase = self->_analysisDatabase;
              v157 = +[NSDate now];
              [v157 timeIntervalSinceReferenceDate];
              [(VCPDatabaseWriter *)analysisDatabase setValue:(uint64_t)v158 forKey:@"PersonalizationCheckpointReportedTimestamp"];

              [(VCPDatabaseWriter *)self->_analysisDatabase commit];
            }
          }
          if ((int)MediaAnalysisLogLevel() >= 6)
          {
            id v159 = VCPLogInstance();
            if (os_log_type_enabled(v159, type))
            {
              id v160 = self->_logPrefix;
              *(_DWORD *)buf = 138412290;
              v187 = v160;
              _os_log_impl((void *)&_mh_execute_header, v159, type, "%@ Finished updating VUWGallery plugins", buf, 0xCu);
            }
          }
        }
        else
        {
          id v128 = 0;
        }
        [oslog stop];
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          id v161 = VCPLogInstance();
          if (os_log_type_enabled(v161, type))
          {
            v162 = self->_logPrefix;
            [oslog elapsedTimeSeconds];
            *(_DWORD *)buf = 138412546;
            v187 = v162;
            __int16 v188 = 2048;
            uint64_t v189 = v163;
            _os_log_impl((void *)&_mh_execute_header, v161, type, "%@ Finished Gallery Person Processing (%.2f seconds)", buf, 0x16u);
          }
        }
      }
    }
  }
LABEL_203:

LABEL_204:
}

- (void)process
{
  id v3 = objc_alloc_init((Class)VCPTimeMeasurement);
  [v3 start];
  if ([(PHPhotoLibrary *)self->_photoLibrary mad_useVUGallery]) {
    [(MADPhotosPersonProcessingTask *)self processGallery];
  }
  else {
    [(MADPhotosPersonProcessingTask *)self processLegacy];
  }
  if (_os_feature_enabled_impl()
    && [(PHPhotoLibrary *)self->_photoLibrary isSystemPhotoLibrary]
    && [(PHPhotoLibrary *)self->_photoLibrary mad_useVUGallery]
    && self->_requirement == 20)
  {
    os_log_type_t v4 = [(MADProcessingTask *)self cancelBlock];
    if (v4)
    {
      os_log_type_t v5 = [(MADProcessingTask *)self cancelBlock];
      char v6 = v5[2]();

      if (v6) {
        goto LABEL_65;
      }
    }
    uint64_t v7 = -[VCPDatabaseWriter valueForKey:](self->_analysisDatabase, "valueForKey:");
    double v8 = (double)v7;
    os_signpost_id_t v9 = +[NSDate dateWithTimeIntervalSinceReferenceDate:(double)v7];
    if (v7)
    {
      os_log_type_t v10 = +[NSDate now];
      [v10 timeIntervalSinceReferenceDate];
      BOOL v12 = v11 - v8 >= 43200.0;
    }
    else
    {
      BOOL v12 = 1;
    }
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      os_log_type_t v13 = VCPLogInstance();
      os_log_type_t v14 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v13, v14))
      {
        if (v12) {
          CFStringRef v15 = @"Yes";
        }
        else {
          CFStringRef v15 = @"No";
        }
        uint64_t v16 = +[VCPLogManager dateFormatter];
        int v17 = [v16 stringFromDate:v9];
        *(_DWORD *)buf = 138412802;
        v71 = v65;
        __int16 v72 = 2112;
        CFStringRef v73 = v15;
        __int16 v74 = 2112;
        v75 = v17;
        _os_log_impl((void *)&_mh_execute_header, v13, v14, "%@ Contact ingestion needed: %@ (last ingestion date: %@", buf, 0x20u);
      }
    }
    if (v12)
    {
      os_log_type_t v19 = objc_alloc_init(MADContactsPersonProcessingTask);
      id v20 = [(MADProcessingTask *)self cancelBlock];
      [(MADProcessingTask *)v19 setCancelBlock:v20];

      [(MADContactsPersonProcessingTask *)v19 process];
      os_log_type_t v21 = [(MADProcessingTask *)self cancelBlock];
      if (!v21) {
        goto LABEL_24;
      }
      id v22 = [(MADProcessingTask *)self cancelBlock];
      char v23 = v22[2]();

      if (v23)
      {
        char v24 = 1;
      }
      else
      {
LABEL_24:
        analysisDatabase = self->_analysisDatabase;
        os_log_type_t v26 = +[NSDate now];
        [v26 timeIntervalSinceReferenceDate];
        [(VCPDatabaseWriter *)analysisDatabase setValue:(uint64_t)v27 forKey:@"ContactIngestionTimestamp"];

        [(VCPDatabaseWriter *)self->_analysisDatabase commit];
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          os_log_type_t v28 = VCPLogInstance();
          os_log_type_t v29 = VCPLogToOSLogType[6];
          if (os_log_type_enabled(v28, v29))
          {
            logPrefix = self->_logPrefix;
            *(_DWORD *)buf = 138412290;
            v71 = logPrefix;
            _os_log_impl((void *)&_mh_execute_header, v28, v29, "%@ Updated contact ingestion timestamp", buf, 0xCu);
          }
        }
        char v24 = 0;
      }

      if (v24) {
        goto LABEL_64;
      }
    }
  }
  if (_os_feature_enabled_impl()
    && [(PHPhotoLibrary *)self->_photoLibrary isSystemPhotoLibrary]
    && [(PHPhotoLibrary *)self->_photoLibrary mad_useVUGallery]
    && self->_requirement == 20)
  {
    os_log_type_t v31 = [(MADProcessingTask *)self cancelBlock];
    if (v31)
    {
      objc_super v32 = [(MADProcessingTask *)self cancelBlock];
      char v33 = v32[2]();

      if (v33) {
        goto LABEL_65;
      }
    }
    uint64_t v34 = -[VCPDatabaseWriter valueForKey:](self->_analysisDatabase, "valueForKey:");
    double v35 = (double)v34;
    os_signpost_id_t v9 = +[NSDate dateWithTimeIntervalSinceReferenceDate:(double)v34];
    if (v34)
    {
      os_log_type_t v36 = +[NSDate now];
      [v36 timeIntervalSinceReferenceDate];
      BOOL v38 = v37 - v35 >= 43200.0;
    }
    else
    {
      BOOL v38 = 1;
    }
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      os_signpost_id_t v39 = VCPLogInstance();
      os_log_type_t v40 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v39, v40))
      {
        if (v38) {
          CFStringRef v41 = @"Yes";
        }
        else {
          CFStringRef v41 = @"No";
        }
        v42 = +[VCPLogManager dateFormatter];
        os_signpost_id_t v43 = [v42 stringFromDate:v9];
        *(_DWORD *)buf = 138412802;
        v71 = v66;
        __int16 v72 = 2112;
        CFStringRef v73 = v41;
        __int16 v74 = 2112;
        v75 = v43;
        _os_log_impl((void *)&_mh_execute_header, v39, v40, "%@ Home person ingestion needed: %@ (last ingestion date: %@", buf, 0x20u);
      }
    }
    if (v38)
    {
      v45 = objc_alloc_init(MADHomePersonProcessingTask);
      v46 = [(MADProcessingTask *)self cancelBlock];
      [(MADProcessingTask *)v45 setCancelBlock:v46];

      [(MADHomePersonProcessingTask *)v45 process];
      os_log_type_t v47 = [(MADProcessingTask *)self cancelBlock];
      if (!v47) {
        goto LABEL_51;
      }
      id v48 = [(MADProcessingTask *)self cancelBlock];
      char v49 = v48[2]();

      if (v49)
      {
        char v50 = 1;
      }
      else
      {
LABEL_51:
        v51 = self->_analysisDatabase;
        uint64_t v52 = +[NSDate now];
        [v52 timeIntervalSinceReferenceDate];
        [(VCPDatabaseWriter *)v51 setValue:(uint64_t)v53 forKey:@"HomePersonIngestionTimestamp"];

        [(VCPDatabaseWriter *)self->_analysisDatabase commit];
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          os_log_type_t v54 = VCPLogInstance();
          os_log_type_t v55 = VCPLogToOSLogType[6];
          if (os_log_type_enabled(v54, v55))
          {
            id v56 = self->_logPrefix;
            *(_DWORD *)buf = 138412290;
            v71 = v56;
            _os_log_impl((void *)&_mh_execute_header, v54, v55, "%@ Updated home person ingestion timestamp", buf, 0xCu);
          }
        }
        char v50 = 0;
      }

      if (v50) {
        goto LABEL_64;
      }
    }
  }
  int v57 = _os_feature_enabled_impl();
  if (([(PHPhotoLibrary *)self->_photoLibrary isSystemPhotoLibrary] & v57) != 1
    || !VCPMAIsAppleInternal())
  {
    goto LABEL_63;
  }
  unsigned int v58 = [(MADProcessingTask *)self cancelBlock];
  if (!v58
    || ([(MADProcessingTask *)self cancelBlock],
        uint64_t v59 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(),
        char v60 = v59[2](),
        v59,
        v58,
        (v60 & 1) == 0))
  {
    CFStringRef v68 = @"AutoCounterOnly";
    id v69 = &__kCFBooleanTrue;
    os_signpost_id_t v61 = +[NSDictionary dictionaryWithObjects:&v69 forKeys:&v68 count:1];
    photoLibrary = self->_photoLibrary;
    v62 = +[NSArray arrayWithObjects:&photoLibrary count:1];
    v63 = [(MADProcessingTask *)self cancelBlock];
    os_log_type_t v64 = +[VCPFaceLibraryProcessingTask taskWithPhotoLibraries:v62 andOptions:v61 andProgressHandler:0 andCompletionHandler:0 andCancelBlock:v63];

    [v64 run];
LABEL_63:
    [v3 stop];
    os_signpost_id_t v9 = +[VCPMADCoreAnalyticsManager sharedManager];
    [v3 elapsedTimeSeconds];
    objc_msgSend(v9, "accumulateDoubleValue:forField:andEvent:", @"TotalPersonProcessingTimeInSeconds", @"com.apple.mediaanalysisd.FaceAnalysisRunSession");
LABEL_64:
  }
LABEL_65:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logPrefix, 0);
  objc_storeStrong((id *)&self->_petPromoter, 0);
  objc_storeStrong((id *)&self->_personPromoter, 0);
  objc_storeStrong((id *)&self->_analysisDatabase, 0);
  objc_storeStrong((id *)&self->_persistenceDelegate, 0);
  objc_storeStrong((id *)&self->_vuService, 0);
  objc_storeStrong((id *)&self->_personBuilder, 0);
  objc_storeStrong((id *)&self->_faceClusterer, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

@end