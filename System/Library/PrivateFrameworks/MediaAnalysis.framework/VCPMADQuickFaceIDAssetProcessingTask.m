@interface VCPMADQuickFaceIDAssetProcessingTask
+ (NSString)name;
+ (unint64_t)taskID;
- (BOOL)shouldProcessAsset:(id)a3;
- (VCPMADQuickFaceIDAssetProcessingTask)initWithLocalIdentifiers:(id)a3 fromPhotoLibraryWithURL:(id)a4 cancelBlock:(id)a5 progressHandler:(id)a6 completionHandler:(id)a7;
- (id)batchWithAnalysisDatabase:(id)a3 allowDownload:(BOOL)a4 cancelBlock:(id)a5;
@end

@implementation VCPMADQuickFaceIDAssetProcessingTask

- (VCPMADQuickFaceIDAssetProcessingTask)initWithLocalIdentifiers:(id)a3 fromPhotoLibraryWithURL:(id)a4 cancelBlock:(id)a5 progressHandler:(id)a6 completionHandler:(id)a7
{
  id v12 = a4;
  v25.receiver = self;
  v25.super_class = (Class)VCPMADQuickFaceIDAssetProcessingTask;
  v13 = [(VCPMADPhotoAssetProcessingTask *)&v25 initWithLocalIdentifiers:a3 fromPhotoLibraryWithURL:v12 cancelBlock:a5 progressHandler:a6 completionHandler:a7];
  if (!v13) {
    goto LABEL_5;
  }
  v14 = +[VCPPhotoLibraryManager sharedManager];
  v15 = [v14 photoLibraryWithURL:v12];

  if (!v15)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v19 = VCPLogInstance();
      os_log_type_t v20 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v19, v20))
      {
        *(_DWORD *)buf = 138412290;
        id v27 = v12;
        _os_log_impl((void *)&_mh_execute_header, v19, v20, "Failed to open Photo Library %@", buf, 0xCu);
      }
      goto LABEL_12;
    }
LABEL_13:

    v18 = 0;
    goto LABEL_14;
  }
  id v16 = [objc_alloc((Class)VCPPhotosQuickFaceIdentificationManager) initWithPhotoLibrary:v15];
  v17 = *(void **)(v13 + 52);
  *(void *)(v13 + 52) = v16;

  if (!*(void *)(v13 + 52))
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v19 = VCPLogInstance();
      os_log_type_t v21 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v19, v21))
      {
        v22 = objc_opt_class();
        *(_DWORD *)buf = 138412546;
        id v27 = v22;
        __int16 v28 = 2112;
        id v29 = v12;
        id v23 = v22;
        _os_log_impl((void *)&_mh_execute_header, v19, v21, "Failed to create %@ for Photo Library %@", buf, 0x16u);
      }
LABEL_12:

      goto LABEL_13;
    }
    goto LABEL_13;
  }

LABEL_5:
  v18 = v13;
LABEL_14:

  return v18;
}

+ (NSString)name
{
  return (NSString *)@"QuickFaceID";
}

+ (unint64_t)taskID
{
  return 8;
}

- (BOOL)shouldProcessAsset:(id)a3
{
  return objc_msgSend(a3, "vcp_quickFaceClassificationDone") ^ 1;
}

- (id)batchWithAnalysisDatabase:(id)a3 allowDownload:(BOOL)a4 cancelBlock:(id)a5
{
  return +[VCPMADQuickFaceIDAssetBatch batchWithAnalysisDatabase:a3 quickFaceIDManager:*(id *)((char *)&self->super._progressHandler + 4) cancelBlock:a5];
}

- (void).cxx_destruct
{
}

@end