@interface MADPhotosFaceCropProcessingTask
+ (id)taskWithPhotoLibrary:(id)a3 andFaceClusterer:(id)a4;
+ (id)taskWithPhotoLibrary:(id)a3 andGallery:(id)a4;
- (MADPhotosFaceCropProcessingTask)initWithPhotoLibrary:(id)a3 andFaceClusterer:(id)a4;
- (MADPhotosFaceCropProcessingTask)initWithPhotoLibrary:(id)a3 andGallery:(id)a4;
- (unint64_t)count;
- (void)_processEntries;
- (void)addFaceCrop:(id)a3;
- (void)process;
@end

@implementation MADPhotosFaceCropProcessingTask

- (MADPhotosFaceCropProcessingTask)initWithPhotoLibrary:(id)a3 andFaceClusterer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (objc_msgSend(v7, "mad_useVUGallery"))
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v9 = VCPLogInstance();
      os_log_type_t v10 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v9, v10))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, v10, "[MADPhotosFaceCropProcessingTask] VCPFaceClusterer is disabled", buf, 2u);
      }
    }
    v11 = 0;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)MADPhotosFaceCropProcessingTask;
    v12 = [(MADProcessingTask *)&v17 init];
    v13 = v12;
    if (v12)
    {
      objc_storeStrong((id *)&v12->_photoLibrary, a3);
      objc_storeStrong((id *)&v13->_faceClusterer, a4);
      uint64_t v14 = +[NSMutableArray array];
      faceCropEntries = v13->_faceCropEntries;
      v13->_faceCropEntries = (NSMutableArray *)v14;
    }
    self = v13;
    v11 = self;
  }

  return v11;
}

- (MADPhotosFaceCropProcessingTask)initWithPhotoLibrary:(id)a3 andGallery:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (objc_msgSend(v7, "mad_useVUGallery"))
  {
    v17.receiver = self;
    v17.super_class = (Class)MADPhotosFaceCropProcessingTask;
    v9 = [(MADProcessingTask *)&v17 init];
    os_log_type_t v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_photoLibrary, a3);
      objc_storeStrong((id *)&v10->_gallery, a4);
      uint64_t v11 = +[NSMutableArray array];
      faceCropEntries = v10->_faceCropEntries;
      v10->_faceCropEntries = (NSMutableArray *)v11;
    }
    self = v10;
    v13 = self;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v14 = VCPLogInstance();
      os_log_type_t v15 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v14, v15))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, v15, "[MADPhotosFaceCropProcessingTask] Gallery is not enabled", buf, 2u);
      }
    }
    v13 = 0;
  }

  return v13;
}

+ (id)taskWithPhotoLibrary:(id)a3 andFaceClusterer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithPhotoLibrary:v7 andFaceClusterer:v6];

  return v8;
}

+ (id)taskWithPhotoLibrary:(id)a3 andGallery:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithPhotoLibrary:v7 andGallery:v6];

  return v8;
}

- (unint64_t)count
{
  return (unint64_t)[(NSMutableArray *)self->_faceCropEntries count];
}

- (void)addFaceCrop:(id)a3
{
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v18 = self;
  v5 = self->_faceCropEntries;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        os_log_type_t v10 = [*(id *)(*((void *)&v19 + 1) + 8 * i) faceCrop];
        uint64_t v11 = [v10 localIdentifier];
        v12 = [v4 localIdentifier];
        unsigned int v13 = [v11 isEqualToString:v12];

        if (v13)
        {
          if ((int)MediaAnalysisLogLevel() >= 4)
          {
            os_log_type_t v15 = VCPLogInstance();
            os_log_type_t v16 = VCPLogToOSLogType[4];
            if (os_log_type_enabled(v15, v16))
            {
              objc_super v17 = [v4 localIdentifier];
              *(_DWORD *)buf = 138412290;
              v24 = v17;
              _os_log_impl((void *)&_mh_execute_header, v15, v16, "[FaceCrop][%@] Batch already contains face crop; ignoring",
                buf,
                0xCu);
            }
          }
          goto LABEL_14;
        }
      }
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  faceCropEntries = v18->_faceCropEntries;
  v5 = [[MADPhotosFaceCropProcessingEntry alloc] initWithFaceCrop:v4];
  [(NSMutableArray *)faceCropEntries addObject:v5];
LABEL_14:
}

- (void)_processEntries
{
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v3 = VCPLogInstance();
    os_log_type_t v4 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v3, v4))
    {
      unsigned int v5 = [(NSMutableArray *)self->_faceCropEntries count];
      *(_DWORD *)buf = 67109120;
      LODWORD(v38) = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "[FaceCrop] Processing %d face crops", buf, 8u);
    }
  }
  id v6 = [(NSMutableArray *)self->_faceCropEntries firstObject];
  id v7 = [v6 faceCrop];
  uint64_t v8 = [v7 photoLibrary];

  v9 = +[VCPPhotosFaceProcessingContext contextWithPhotoLibrary:v8];
  id v34 = [objc_alloc((Class)VCPFaceCropManager) initWithPhotoLibrary:v8 andContext:v9];
  v33 = +[NSMutableSet set];
  if ([(NSMutableArray *)self->_faceCropEntries count])
  {
    uint64_t v11 = 0;
    os_log_type_t type = VCPLogToOSLogType[3];
    *(void *)&long long v10 = 138412546;
    long long v30 = v10;
    v31 = v9;
    while (1)
    {
      unsigned int v13 = +[VCPWatchdog sharedWatchdog];
      [v13 pet];

      uint64_t v14 = [(MADProcessingTask *)self cancelBlock];
      if (v14)
      {
        os_log_type_t v15 = (void *)v14;
        os_log_type_t v16 = [(MADProcessingTask *)self cancelBlock];
        int v17 = v16[2]();

        if (v17) {
          break;
        }
      }
      v18 = -[NSMutableArray objectAtIndexedSubscript:](self->_faceCropEntries, "objectAtIndexedSubscript:", v11, v30);
      long long v19 = [v18 faceCrop];

      long long v20 = [v19 localIdentifier];

      if (v20)
      {
        id v35 = 0;
        id v36 = 0;
        unsigned __int8 v21 = [v34 _processDirtyFaceCrop:v19 faceCropFaceLocalIdentifier:&v36 error:&v35];
        id v22 = v36;
        id v23 = v35;
        if ((v21 & 1) == 0 && (int)MediaAnalysisLogLevel() >= 3)
        {
          v24 = VCPLogInstance();
          if (os_log_type_enabled(v24, type))
          {
            [v19 localIdentifier];
            v26 = v25 = v8;
            *(_DWORD *)buf = v30;
            v38 = v26;
            __int16 v39 = 2112;
            id v40 = v23;
            _os_log_impl((void *)&_mh_execute_header, v24, type, "[FaceCrop] Failed to process dirty facecrop %@ - %@", buf, 0x16u);

            uint64_t v8 = v25;
            v9 = v31;
          }
        }
        if (v22) {
          [v33 addObject:v22];
        }
      }
      if (++v11 >= (unint64_t)[(NSMutableArray *)self->_faceCropEntries count]) {
        goto LABEL_25;
      }
    }
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      v27 = VCPLogInstance();
      os_log_type_t v28 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v27, v28))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, v28, "[FaceCrop] Processing canceled", buf, 2u);
      }
    }
  }
LABEL_25:
  v29 = +[VCPMADCoreAnalyticsManager sharedManager];
  objc_msgSend(v29, "accumulateInt64Value:forField:andEvent:", -[NSMutableArray count](self->_faceCropEntries, "count"), @"NumberOfFacecropsAnalyzed", @"com.apple.mediaanalysisd.FaceAnalysisRunSession");

  [(NSMutableArray *)self->_faceCropEntries removeAllObjects];
}

- (void)process
{
  id v3 = objc_alloc_init((Class)VCPTimeMeasurement);
  [v3 start];
  os_log_type_t v4 = VCPSignPostLog();
  os_signpost_id_t v5 = os_signpost_id_generate(v4);

  id v6 = VCPSignPostLog();
  id v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "MADPhotosFaceCropProcessingTask_Process", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  uint64_t v8 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  v9 = +[PHFaceCrop fetchFaceCropsNeedingFaceDetectionWithOptions:v8];

  if ([v9 count])
  {
    unint64_t v10 = 0;
    do
    {
      v12 = [v9 objectAtIndexedSubscript:v10];
      [(MADPhotosFaceCropProcessingTask *)self addFaceCrop:v12];

      if ([(MADPhotosFaceCropProcessingTask *)self count] >= 0x64) {
        [(MADPhotosFaceCropProcessingTask *)self _processEntries];
      }
      ++v10;
    }
    while (v10 < (unint64_t)[v9 count]);
  }
  if ([(MADPhotosFaceCropProcessingTask *)self count]) {
    [(MADPhotosFaceCropProcessingTask *)self _processEntries];
  }
  unsigned int v13 = VCPSignPostLog();
  uint64_t v14 = v13;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)os_log_type_t v16 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_END, v5, "MADPhotosFaceCropProcessingTask_Process", (const char *)&unk_1001F3BD3, v16, 2u);
  }

  [v3 stop];
  os_log_type_t v15 = +[VCPMADCoreAnalyticsManager sharedManager];
  [v3 elapsedTimeSeconds];
  objc_msgSend(v15, "accumulateDoubleValue:forField:andEvent:", @"TotalAnalyzingTimeInSeconds", @"com.apple.mediaanalysisd.FaceAnalysisRunSession");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceCropEntries, 0);
  objc_storeStrong((id *)&self->_gallery, 0);
  objc_storeStrong((id *)&self->_faceClusterer, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

@end