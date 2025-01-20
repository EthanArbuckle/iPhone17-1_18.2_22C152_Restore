@interface MADPhotosOnDemandStaticStickerScoreTask
+ (id)taskWithPhotoLibrary:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (BOOL)run:(id *)a3;
- (MADPhotosOnDemandStaticStickerScoreTask)initWithPhotoLibrary:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)publishResults:(id)a3;
@end

@implementation MADPhotosOnDemandStaticStickerScoreTask

- (MADPhotosOnDemandStaticStickerScoreTask)initWithPhotoLibrary:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10011EB44;
  v27[3] = &unk_10021AD08;
  id v11 = a5;
  id v28 = v11;
  v12 = objc_retainBlock(v27);
  v26.receiver = self;
  v26.super_class = (Class)MADPhotosOnDemandStaticStickerScoreTask;
  v13 = [(MADPhotosOnDemandStaticStickerScoreTask *)&v26 initWithCompletionHandler:v12];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_photoLibrary, a3);
    v14->_targetResultCount = 10;
    v15 = [v10 objectForKeyedSubscript:VCPMediaAnalysisService_TargetResultCount];
    if (v15)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v14->_targetResultCount = (unint64_t)[v15 unsignedIntegerValue];
      }
      else if ((int)MediaAnalysisLogLevel() >= 4)
      {
        v16 = VCPLogInstance();
        os_log_type_t v17 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v16, v17))
        {
          *(_DWORD *)buf = 138412290;
          v30 = v15;
          _os_log_impl((void *)&_mh_execute_header, v16, v17, "[Sticker] Unexpected target result count type (%@); ignoring",
            buf,
            0xCu);
        }
      }
    }
    dispatch_semaphore_t v18 = dispatch_semaphore_create(1);
    publishSemaphore = v14->_publishSemaphore;
    v14->_publishSemaphore = (OS_dispatch_semaphore *)v18;

    dispatch_group_t v20 = dispatch_group_create();
    publishGroup = v14->_publishGroup;
    v14->_publishGroup = (OS_dispatch_group *)v20;

    v22 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v23 = dispatch_queue_create("publishQueue", v22);
    publishQueue = v14->_publishQueue;
    v14->_publishQueue = (OS_dispatch_queue *)v23;
  }
  return v14;
}

+ (id)taskWithPhotoLibrary:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [objc_alloc((Class)objc_opt_class()) initWithPhotoLibrary:v7 options:v8 completionHandler:v9];

  return v10;
}

- (void)publishResults:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_publishSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  publishGroup = self->_publishGroup;
  publishQueue = self->_publishQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10011ECC8;
  v8[3] = &unk_100219D70;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_group_async(publishGroup, publishQueue, v8);
}

- (BOOL)run:(id *)a3
{
  id v4 = +[NSDate now];
  [v4 timeIntervalSince1970];

  v83 = +[PHAsset vcp_fetchOptionsForLibrary:self->_photoLibrary forTaskID:12];
  v5 = +[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:0];
  v97 = v5;
  v6 = +[NSArray arrayWithObjects:&v97 count:1];
  [v83 setSortDescriptors:v6];

  [v83 setFetchLimit:10 * self->_targetResultCount];
  id v7 = +[PHAsset fetchAssetsWithOptions:v83];
  id v79 = objc_alloc_init((Class)VNSession);
  v84 = +[NSMutableArray array];
  unint64_t v8 = 0;
  uint64_t v75 = 0;
  unint64_t v86 = 0;
  os_log_type_t type = VCPLogToOSLogType[7];
  os_log_type_t v77 = VCPLogToOSLogType[6];
  os_log_type_t v9 = VCPLogToOSLogType[4];
  os_log_type_t v10 = v9;
  while (v8 < (unint64_t)objc_msgSend(v7, "count", v73))
  {
    os_log_type_t v9 = v10;
    if (([(MADPhotosOnDemandStaticStickerScoreTask *)self isCanceled] & 1) != 0
      || (unsigned __int8 v12 = atomic_load((unsigned __int8 *)&self->_publishFailed), (v12 & 1) != 0)
      || v86 >= self->_targetResultCount)
    {
      int v22 = 2;
      goto LABEL_19;
    }
    v13 = +[VCPWatchdog sharedWatchdog];
    [v13 pet];

    v14 = [v7 objectAtIndexedSubscript:v8];
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v15 = VCPLogInstance();
      if (os_log_type_enabled(v15, type))
      {
        v16 = [v14 localIdentifier];
        *(_DWORD *)buf = 138412290;
        v94 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, type, "[Sticker][%@] Evaluating asset...", buf, 0xCu);
      }
    }
    v85 = [v14 visualSearchProperties];
    if ([v85 stickerAlgorithmVersion] == (id)1)
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        os_log_type_t v17 = VCPLogInstance();
        if (os_log_type_enabled(v17, type))
        {
          dispatch_semaphore_t v18 = [v14 localIdentifier];
          [v85 stickerConfidenceScore];
          *(_DWORD *)buf = 138412546;
          v94 = v18;
          __int16 v95 = 2048;
          double v96 = v19;
          _os_log_impl((void *)&_mh_execute_header, v17, type, "[Sticker][%@] Asset already processed (confidence: %0.3f)", buf, 0x16u);
        }
      }
      [v85 stickerConfidenceScore];
      unint64_t v21 = v86;
      if (v20 >= 0.2) {
        unint64_t v21 = v86 + 1;
      }
      unint64_t v86 = v21;
      int v22 = 4;
      goto LABEL_72;
    }
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      dispatch_queue_t v23 = VCPLogInstance();
      if (os_log_type_enabled(v23, v77))
      {
        v24 = [v14 localIdentifier];
        *(_DWORD *)buf = 138412290;
        v94 = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, v77, "[Sticker][%@] Processing asset...", buf, 0xCu);
      }
    }
    v80 = +[PHAssetResource vcp_allAcceptableResourcesForAsset:v14];
    v25 = objc_msgSend(v80, "vcp_thumbnailResource");
    v81 = v25;
    if (v25)
    {
      if ([v25 isLocallyAvailable])
      {
        objc_super v26 = VCPSignPostLog();
        os_signpost_id_t v27 = os_signpost_id_generate(v26);

        id v28 = VCPSignPostLog();
        v29 = v28;
        if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v29, OS_SIGNPOST_INTERVAL_BEGIN, v27, "MADStickerScore_Decode", (const char *)&unk_1001F3BD3, buf, 2u);
        }

        unsigned int v89 = 0;
        v30 = +[VCPImageManager sharedImageManager];
        v31 = [v81 privateFileURL];
        id v88 = [v30 pixelBufferWithFormat:875704422 fromImageURL:v31 flushCache:0 orientation:&v89];

        v32 = VCPSignPostLog();
        v33 = v32;
        if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v33, OS_SIGNPOST_INTERVAL_END, v27, "MADStickerScore_Decode", (const char *)&unk_1001F3BD3, buf, 2u);
        }

        id v34 = objc_alloc((Class)VNImageRequestHandler);
        id v73 = [v34 initWithCVPixelBuffer:v88 orientation:v89 options:&__NSDictionary0__struct session:v79];
        id v76 = objc_alloc_init((Class)VNGenerateInstanceMaskGatingRequest);
        if (DeviceHasANE())
        {
          v35 = +[VNProcessingDevice defaultANEDevice];
          [v76 setProcessingDevice:v35];
        }
        v36 = VCPSignPostLog();
        os_signpost_id_t v37 = os_signpost_id_generate(v36);

        v38 = VCPSignPostLog();
        v39 = v38;
        if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v39, OS_SIGNPOST_INTERVAL_BEGIN, v37, "MADStickerScore_PerformRequests", (const char *)&unk_1001F3BD3, buf, 2u);
        }

        id v92 = v76;
        v40 = +[NSArray arrayWithObjects:&v92 count:1];
        id v87 = 0;
        unsigned __int8 v41 = [v73 performRequests:v40 error:&v87];
        id v74 = v87;

        v42 = VCPSignPostLog();
        v43 = v42;
        if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v43, OS_SIGNPOST_INTERVAL_END, v37, "MADStickerScore_PerformRequests", (const char *)&unk_1001F3BD3, buf, 2u);
        }

        if (v41)
        {
          v44 = [v76 results];
          BOOL v45 = [v44 count] == 0;

          if (!v45)
          {
            v46 = [v76 results];
            v47 = [v46 firstObject];
            [v47 confidence];
            float v49 = v48;

            double v50 = v49;
            if ((int)MediaAnalysisLogLevel() >= 6)
            {
              v51 = VCPLogInstance();
              if (os_log_type_enabled(v51, v77))
              {
                v52 = [v14 localIdentifier];
                *(_DWORD *)buf = 138412546;
                v94 = v52;
                __int16 v95 = 2048;
                double v96 = v50;
                _os_log_impl((void *)&_mh_execute_header, v51, v77, "[Sticker][%@] Confidence: %0.3f", buf, 0x16u);
              }
            }
            unint64_t v53 = v86;
            if (v50 >= 0.2) {
              unint64_t v53 = v86 + 1;
            }
            unint64_t v86 = v53;
            v54 = [[MADPhotosStickerScoreResult alloc] initWithAsset:v14 stickerScore:v50];
            [v84 addObject:v54];

            ++v75;
            if ((unint64_t)[v84 count] >= 0x64)
            {
              [(MADPhotosOnDemandStaticStickerScoreTask *)self publishResults:v84];
              +[NSMutableArray array];
              int v22 = 0;
              v84 = v55 = v84;
              goto LABEL_67;
            }
            int v22 = 0;
LABEL_70:

            sub_100004484((const void **)&v88);
            goto LABEL_71;
          }
          if ((int)MediaAnalysisLogLevel() >= 4)
          {
            v55 = VCPLogInstance();
            if (os_log_type_enabled(v55, v10))
            {
              v61 = [v14 localIdentifier];
              *(_DWORD *)buf = 138412290;
              v94 = v61;
              _os_log_impl((void *)&_mh_execute_header, v55, v10, "[Sticker][%@] Vision request produced no observations", buf, 0xCu);
            }
            goto LABEL_66;
          }
        }
        else if ((int)MediaAnalysisLogLevel() >= 4)
        {
          v55 = VCPLogInstance();
          if (os_log_type_enabled(v55, v10))
          {
            v59 = [v14 localIdentifier];
            double v60 = [v74 description];
            *(_DWORD *)buf = 138412546;
            v94 = v59;
            __int16 v95 = 2112;
            double v96 = v60;
            _os_log_impl((void *)&_mh_execute_header, v55, v10, "[Sticker][%@] Vision request failed (%@)", buf, 0x16u);
          }
LABEL_66:
          int v22 = 4;
LABEL_67:

          goto LABEL_70;
        }
        int v22 = 4;
        goto LABEL_70;
      }
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        v56 = VCPLogInstance();
        if (os_log_type_enabled(v56, v10))
        {
          v58 = [v14 localIdentifier];
          *(_DWORD *)buf = 138412290;
          v94 = v58;
          _os_log_impl((void *)&_mh_execute_header, v56, v10, "[Sticker][%@] Thumbnail resource not locally available", buf, 0xCu);
        }
LABEL_58:
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 4)
    {
      v56 = VCPLogInstance();
      if (os_log_type_enabled(v56, v10))
      {
        v57 = [v14 localIdentifier];
        *(_DWORD *)buf = 138412290;
        v94 = v57;
        _os_log_impl((void *)&_mh_execute_header, v56, v10, "[Sticker][%@] No thumbnail resource", buf, 0xCu);
      }
      goto LABEL_58;
    }
    int v22 = 4;
LABEL_71:

LABEL_72:
    os_log_type_t v9 = v10;
LABEL_19:
    if ((v22 | 4) != 4) {
      break;
    }
    ++v8;
  }
  if ([v84 count])
  {
    [(MADPhotosOnDemandStaticStickerScoreTask *)self publishResults:v84];
    uint64_t v62 = +[NSMutableArray array];

    v84 = v62;
    os_log_type_t v9 = v10;
  }
  dispatch_group_wait((dispatch_group_t)self->_publishGroup, 0xFFFFFFFFFFFFFFFFLL);
  unsigned __int8 v63 = atomic_load((unsigned __int8 *)&self->_publishFailed);
  if (v63)
  {
    if (a3)
    {
      id v69 = [(NSError *)self->_publishError copy];
      v68 = *a3;
      *a3 = v69;
      goto LABEL_84;
    }
LABEL_85:
    BOOL v70 = 0;
  }
  else
  {
    if ([(MADPhotosOnDemandStaticStickerScoreTask *)self isCanceled])
    {
      if (a3)
      {
        NSErrorUserInfoKey v90 = NSLocalizedDescriptionKey;
        v64 = +[NSString stringWithFormat:@"On-demand sticker scoring cancelled"];
        v91 = v64;
        v65 = +[NSDictionary dictionaryWithObjects:&v91 forKeys:&v90 count:1];
        v66 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-128 userInfo:v65];
        id v67 = *a3;
        *a3 = v66;

        os_log_type_t v9 = v10;
      }
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        v68 = VCPLogInstance();
        if (os_log_type_enabled(v68, v9))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v68, v9, "[Sticker] On-demand sticker scoring cancelled", buf, 2u);
        }
LABEL_84:
      }
      goto LABEL_85;
    }
    v71 = [(MADPhotosOnDemandStaticStickerScoreTask *)self completionHandler];
    v71[2](v71, 0, 0);

    MADPLLogOnDemandStaticStickerScoring();
    BOOL v70 = 1;
  }

  return v70;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publishError, 0);
  objc_storeStrong((id *)&self->_publishQueue, 0);
  objc_storeStrong((id *)&self->_publishGroup, 0);
  objc_storeStrong((id *)&self->_publishSemaphore, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

@end