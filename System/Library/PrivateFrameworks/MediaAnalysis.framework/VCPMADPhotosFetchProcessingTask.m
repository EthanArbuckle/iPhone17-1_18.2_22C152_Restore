@interface VCPMADPhotosFetchProcessingTask
- (BOOL)run:(id *)p_isa;
- (VCPMADPhotosFetchProcessingTask)initWithFetchBlock:(id)a3 photoLibraryWithURL:(id)a4 cancelBlock:(id)a5 progressHandler:(id)a6 completionHandler:(id)a7;
@end

@implementation VCPMADPhotosFetchProcessingTask

- (VCPMADPhotosFetchProcessingTask)initWithFetchBlock:(id)a3 photoLibraryWithURL:(id)a4 cancelBlock:(id)a5 progressHandler:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100087F18;
  v25[3] = &unk_1002196A0;
  id v16 = a7;
  id v26 = v16;
  v24.receiver = self;
  v24.super_class = (Class)VCPMADPhotosFetchProcessingTask;
  v17 = [(VCPMADPhotosProcessingTask *)&v24 initWithCompletionHandler:v25];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)(v17 + 28), a4);
    id v19 = objc_retainBlock(v12);
    v20 = *(void **)(v18 + 36);
    *(void *)(v18 + 36) = v19;

    id v21 = objc_retainBlock(v15);
    v22 = *(void **)(v18 + 44);
    *(void *)(v18 + 44) = v21;

    [v18 setCancelBlock:v14];
  }

  return (VCPMADPhotosFetchProcessingTask *)v18;
}

- (BOOL)run:(id *)p_isa
{
  v5 = VCPSignPostLog();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  v7 = VCPSignPostLog();
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "VCPProcessPhotoAssets", (const char *)&unk_1001F3BD3, buf, 2u);
  }

  v9 = +[VCPPhotoLibraryManager sharedManager];
  v10 = [v9 photoLibraryWithURL:*(void *)(&self->super._publishError + 1)];

  if (v10)
  {
    v11 = +[VCPDatabaseManager sharedDatabaseForPhotoLibrary:v10];
    if (v11)
    {
      id v12 = +[PHAsset vcp_fetchOptionsForLibrary:forTaskID:](PHAsset, "vcp_fetchOptionsForLibrary:forTaskID:", v10, [(id)objc_opt_class() taskID]);
      id v13 = ((void (*)(void))(*(NSURL **)((char *)&self->_photoLibraryURL + 4))->_baseURL)();
      if ([v13 count])
      {
        signed int v14 = [(VCPMADPhotosProcessingTask *)self processAssetsInFetchResult:v13 withAnalysisDatabase:v11 allowDownload:0 progress:0];
        if (v14 || (signed int v14 = [(VCPMADPhotosProcessingTask *)self waitForPublishing]) != 0)
        {
          if (v14 == -128)
          {
            if (p_isa)
            {
              NSErrorUserInfoKey v38 = NSLocalizedDescriptionKey;
              id v15 = [(id)objc_opt_class() name];
              v18 = +[NSString stringWithFormat:@"[%@] Asset processing cancelled", v15];
              v39 = v18;
              objc_super v24 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
              v25 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-128 userInfo:v24];
              id v26 = *p_isa;
              *p_isa = v25;

LABEL_21:
              goto LABEL_28;
            }
          }
          else if (p_isa)
          {
            uint64_t v28 = v14;
            NSErrorUserInfoKey v36 = NSLocalizedDescriptionKey;
            id v15 = [(id)objc_opt_class() name];
            v29 = +[NSString stringWithFormat:@"[%@] Asset processing failed", v15];
            v37 = v29;
            v30 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
            v31 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v28 userInfo:v30];
            id v32 = *p_isa;
            *p_isa = v31;

            goto LABEL_28;
          }
LABEL_30:

          goto LABEL_31;
        }
      }
      else if ((int)MediaAnalysisLogLevel() >= 4)
      {
        id v21 = VCPLogInstance();
        os_log_type_t v22 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v21, v22))
        {
          v23 = [(id)objc_opt_class() name];
          *(_DWORD *)buf = 138412290;
          v35 = v23;
          _os_log_impl((void *)&_mh_execute_header, v21, v22, "[%@] Fetch yielded no assets; skipping processing",
            buf,
            0xCu);
        }
      }
      v27 = VCPSignPostLog();
      p_isa = (id *)&v27->isa;
      if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, (os_log_t)p_isa, OS_SIGNPOST_INTERVAL_END, v6, "VCPProcessPhotoAssets", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      id v15 = [(VCPMADPhotosFetchProcessingTask *)self completionHandler];
      v15[2](v15, 0, 0);
      LOBYTE(p_isa) = 1;
      goto LABEL_29;
    }
    if (!p_isa)
    {
LABEL_31:

      goto LABEL_32;
    }
    NSErrorUserInfoKey v40 = NSLocalizedDescriptionKey;
    id v12 = [(id)objc_opt_class() name];
    id v13 = [*(id *)(&self->super._publishError + 1) path];
    id v15 = +[NSString stringWithFormat:@"[%@] Failed to open Media Analysis for Photo Library (%@)", v12, v13];
    v41 = v15;
    v18 = +[NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
    id v19 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-23 userInfo:v18];
    id v20 = *p_isa;
    *p_isa = v19;

    goto LABEL_21;
  }
  if (p_isa)
  {
    NSErrorUserInfoKey v42 = NSLocalizedDescriptionKey;
    v11 = [(id)objc_opt_class() name];
    id v12 = [*(id *)(&self->super._publishError + 1) path];
    id v13 = +[NSString stringWithFormat:@"[%@] Failed to open Photo Library (%@)", v11, v12];
    v43 = v13;
    id v15 = +[NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
    id v16 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-23 userInfo:v15];
    id v17 = *p_isa;
    *p_isa = v16;

LABEL_28:
    LOBYTE(p_isa) = 0;
LABEL_29:

    goto LABEL_30;
  }
LABEL_32:

  return (char)p_isa;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_fetchBlock + 4), 0);
  objc_storeStrong((id *)((char *)&self->_photoLibraryURL + 4), 0);
  objc_storeStrong((id *)(&self->super._publishError + 1), 0);
}

@end