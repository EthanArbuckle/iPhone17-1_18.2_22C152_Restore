@interface VCPMADPhotoAssetProcessingTask
- (BOOL)run:(id *)a3;
- (VCPMADPhotoAssetProcessingTask)initWithLocalIdentifiers:(id)a3 fromPhotoLibraryWithURL:(id)a4 cancelBlock:(id)a5 progressHandler:(id)a6 completionHandler:(id)a7;
@end

@implementation VCPMADPhotoAssetProcessingTask

- (VCPMADPhotoAssetProcessingTask)initWithLocalIdentifiers:(id)a3 fromPhotoLibraryWithURL:(id)a4 cancelBlock:(id)a5 progressHandler:(id)a6 completionHandler:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000FDC9C;
  v24[3] = &unk_1002196A0;
  id v17 = a7;
  id v25 = v17;
  v23.receiver = self;
  v23.super_class = (Class)VCPMADPhotoAssetProcessingTask;
  v18 = [(VCPMADPhotosProcessingTask *)&v23 initWithCompletionHandler:v24];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)(v18 + 28), a3);
    objc_storeStrong((id *)(v19 + 36), a4);
    id v20 = objc_retainBlock(v16);
    v21 = *(void **)(v19 + 44);
    *(void *)(v19 + 44) = v20;

    [v19 setCancelBlock:v15];
  }

  return (VCPMADPhotoAssetProcessingTask *)v19;
}

- (BOOL)run:(id *)a3
{
  +[NSProgress progressWithTotalUnitCount:](NSProgress, "progressWithTotalUnitCount:", [*(id *)(&self->super._publishError + 1) count]);
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = sub_1000FE4DC;
  v55[3] = &unk_100219D00;
  v55[4] = self;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v56 = v5;
  v6 = +[VCPTimer timerWithIntervalSeconds:10 isOneShot:0 andBlock:v55];
  uint64_t v7 = *(uint64_t *)((char *)&self->_photoLibraryURL + 4);
  if (v7) {
    (*(void (**)(double))(v7 + 16))(0.0);
  }
  id v54 = v5;
  v8 = VCPSignPostLog();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  v10 = VCPSignPostLog();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "VCPProcessPhotoAssets", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  v12 = +[VCPPhotoLibraryManager sharedManager];
  id v13 = [v12 photoLibraryWithURL:*(NSArray **)((char *)&self->_localIdentifiers + 4)];

  if (v13)
  {
    id v14 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:v13];
    if (v14)
    {
      v50 = a3;
      v53 = v6;
      uint64_t v52 = +[PHAsset vcp_fetchOptionsForLibrary:forTaskID:](PHAsset, "vcp_fetchOptionsForLibrary:forTaskID:", v13, [(id)objc_opt_class() taskID]);
      id v15 = +[PHAsset fetchAssetsWithLocalIdentifiers:options:](PHAsset, "fetchAssetsWithLocalIdentifiers:options:", *(void *)(&self->super._publishError + 1));
      if ([v15 count])
      {
        id v16 = [v15 count];
        if (v16 != [*(id *)(&self->super._publishError + 1) count] && (int)MediaAnalysisLogLevel() >= 4)
        {
          id v17 = VCPLogInstance();
          os_log_type_t type = VCPLogToOSLogType[4];
          if (os_log_type_enabled(v17, type))
          {
            v48 = [(id)objc_opt_class() name];
            id v47 = [v15 count];
            id v18 = [*(id *)(&self->super._publishError + 1) count];
            *(_DWORD *)buf = 138412802;
            v62 = v48;
            __int16 v63 = 2048;
            id v64 = v47;
            __int16 v65 = 2048;
            id v66 = v18;
            _os_log_impl((void *)&_mh_execute_header, v17, type, "[%@] Fetched asset count (%ld) does not match requested (%ld)", buf, 0x20u);
          }
        }
        signed int v19 = [(VCPMADPhotosProcessingTask *)self processAssetsInFetchResult:v15 withAnalysisDatabase:v14 allowDownload:0 progress:v5];
        v6 = v53;
        if (v19 || (signed int v19 = [(VCPMADPhotosProcessingTask *)self waitForPublishing]) != 0)
        {
          v21 = (void *)v52;
          if (v19 == -128)
          {
            BOOL v31 = (char)v50;
            if (v50)
            {
              NSErrorUserInfoKey v59 = NSLocalizedDescriptionKey;
              v22 = [(id)objc_opt_class() name];
              v34 = +[NSString stringWithFormat:@"[%@] Asset processing cancelled", v22];
              v60 = v34;
              v35 = +[NSDictionary dictionaryWithObjects:&v60 forKeys:&v59 count:1];
              uint64_t v36 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-128 userInfo:v35];
              id v37 = *v50;
              id *v50 = (id)v36;

              v6 = v53;
LABEL_39:
              BOOL v31 = 0;
              goto LABEL_40;
            }
          }
          else
          {
            BOOL v31 = (char)v50;
            if (v50)
            {
              uint64_t v41 = v19;
              NSErrorUserInfoKey v57 = NSLocalizedDescriptionKey;
              v22 = [(id)objc_opt_class() name];
              v42 = +[NSString stringWithFormat:@"[%@] Asset processing failed", v22];
              v58 = v42;
              v43 = +[NSDictionary dictionaryWithObjects:&v58 forKeys:&v57 count:1];
              uint64_t v44 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v41 userInfo:v43];
              id v45 = *v50;
              id *v50 = (id)v44;

              v6 = v53;
              goto LABEL_39;
            }
          }
LABEL_41:

          goto LABEL_42;
        }
      }
      else if ((int)MediaAnalysisLogLevel() >= 4)
      {
        v32 = VCPLogInstance();
        os_log_type_t v33 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v32, v33))
        {
          v51 = [(id)objc_opt_class() name];
          *(_DWORD *)buf = 138412290;
          v62 = v51;
          _os_log_impl((void *)&_mh_execute_header, v32, v33, "[%@] Fetched yielded no assets; skipping processing",
            buf,
            0xCu);
        }
        v6 = v53;
      }
      v38 = VCPSignPostLog();
      v39 = v38;
      if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v39, OS_SIGNPOST_INTERVAL_END, v9, "VCPProcessPhotoAssets", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      uint64_t v40 = *(uint64_t *)((char *)&self->_photoLibraryURL + 4);
      v21 = (void *)v52;
      if (v40) {
        (*(void (**)(double))(v40 + 16))(100.0);
      }
      [v6 destroy];
      v22 = [(VCPMADPhotoAssetProcessingTask *)self completionHandler];
      v22[2](v22, 0, 0);
      BOOL v31 = 1;
      goto LABEL_40;
    }
    if (!a3)
    {
      BOOL v31 = 0;
LABEL_42:

      goto LABEL_43;
    }
    NSErrorUserInfoKey v67 = NSLocalizedDescriptionKey;
    id v25 = v6;
    uint64_t v26 = [(id)objc_opt_class() name];
    [*(id *)((char *)&self->_localIdentifiers + 4) path];
    id v15 = v27 = a3;
    v22 = +[NSString stringWithFormat:@"[%@] Failed to open Media Analysis for Photo Library (%@)", v26, v15];
    v68 = v22;
    v28 = +[NSDictionary dictionaryWithObjects:&v68 forKeys:&v67 count:1];
    uint64_t v29 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-23 userInfo:v28];
    id v30 = *v27;
    id *v27 = (id)v29;

    v6 = v25;
    v21 = (void *)v26;
LABEL_20:
    BOOL v31 = 0;
    id v5 = v54;
LABEL_40:

    goto LABEL_41;
  }
  if (a3)
  {
    NSErrorUserInfoKey v69 = NSLocalizedDescriptionKey;
    id v20 = a3;
    id v14 = [(id)objc_opt_class() name];
    v21 = [*(id *)((char *)&self->_localIdentifiers + 4) path];
    id v15 = +[NSString stringWithFormat:@"[%@] Failed to open Photo Library (%@)", v14, v21];
    v70 = v15;
    v22 = +[NSDictionary dictionaryWithObjects:&v70 forKeys:&v69 count:1];
    uint64_t v23 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-23 userInfo:v22];
    id v24 = *v20;
    *id v20 = (id)v23;

    goto LABEL_20;
  }
  BOOL v31 = 0;
LABEL_43:

  return v31;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_photoLibraryURL + 4), 0);
  objc_storeStrong((id *)((char *)&self->_localIdentifiers + 4), 0);
  objc_storeStrong((id *)(&self->super._publishError + 1), 0);
}

@end