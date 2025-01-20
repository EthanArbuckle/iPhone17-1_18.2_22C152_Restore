@interface MADPhotosDeferredProcessingTask
- (BOOL)run:(id *)a3;
- (MADPhotosDeferredProcessingTask)initWithCancelBlock:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5;
- (int)performFullProcessing:(id)a3;
- (int)performSceneProcessing:(id)a3;
- (void)generateError:(id *)a3 status:(int)a4;
@end

@implementation MADPhotosDeferredProcessingTask

- (MADPhotosDeferredProcessingTask)initWithCancelBlock:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000245C;
  v14[3] = &unk_1002196A0;
  id v8 = a5;
  id v15 = v8;
  v9 = objc_retainBlock(v14);
  v13.receiver = self;
  v13.super_class = (Class)MADPhotosDeferredProcessingTask;
  v10 = [(MADPhotosDeferredProcessingTask *)&v13 initWithCompletionHandler:v9];
  v11 = v10;
  if (v10) {
    [(MADPhotosDeferredProcessingTask *)v10 setCancelBlock:v7];
  }

  return v11;
}

- (int)performSceneProcessing:(id)a3
{
  id v4 = a3;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000026B0;
  v19[3] = &unk_1002196C8;
  id v6 = v4;
  id v20 = v6;
  id v7 = objc_retainBlock(v19);
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  int v18 = 0;
  id v8 = [VCPMADSceneFetchProcessingTask alloc];
  v9 = +[PHPhotoLibrary systemPhotoLibraryURL];
  v10 = [(MADPhotosDeferredProcessingTask *)self cancelBlock];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000027A4;
  v14[3] = &unk_1002196F0;
  void v14[4] = self;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000027C8;
  v13[3] = &unk_100219718;
  v13[4] = &v15;
  v11 = [(VCPMADSceneFetchProcessingTask *)v8 initWithFetchBlock:v7 photoLibraryWithURL:v9 cancelBlock:v10 progressHandler:v14 completionHandler:v13];

  [(VCPMADSceneFetchProcessingTask *)v11 run];
  LODWORD(v9) = *((_DWORD *)v16 + 6);

  _Block_object_dispose(&v15, 8);

  return (int)v9;
}

- (int)performFullProcessing:(id)a3
{
  id v4 = a3;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000029D8;
  v19[3] = &unk_1002196C8;
  id v6 = v4;
  id v20 = v6;
  id v7 = objc_retainBlock(v19);
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  int v18 = 0;
  id v8 = [MADFullImageFetchProcessingTask alloc];
  v9 = +[PHPhotoLibrary systemPhotoLibraryURL];
  v10 = [(MADPhotosDeferredProcessingTask *)self cancelBlock];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100002ACC;
  v14[3] = &unk_1002196F0;
  void v14[4] = self;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100002AF4;
  v13[3] = &unk_100219718;
  v13[4] = &v15;
  v11 = [(MADFullImageFetchProcessingTask *)v8 initWithFetchBlock:v7 photoLibraryWithURL:v9 cancelBlock:v10 progressHandler:v14 completionHandler:v13];

  [(MADFullImageFetchProcessingTask *)v11 run];
  LODWORD(v9) = *((_DWORD *)v16 + 6);

  _Block_object_dispose(&v15, 8);

  return (int)v9;
}

- (void)generateError:(id *)a3 status:(int)a4
{
  int v6 = MediaAnalysisLogLevel();
  if (a4 == -128)
  {
    if (v6 >= 5)
    {
      id v7 = VCPLogInstance();
      os_log_type_t v8 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v7, v8))
      {
        *(_WORD *)int v18 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, v8, "[Deferred] Processing cancelled", v18, 2u);
      }
    }
    if (a3)
    {
      NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
      v9 = +[NSString stringWithFormat:@"Deferred processing cancelled"];
      v22 = v9;
      v10 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      NSErrorDomain v11 = NSOSStatusErrorDomain;
      uint64_t v12 = -128;
LABEL_14:
      v16 = +[NSError errorWithDomain:v11 code:v12 userInfo:v10];
      id v17 = *a3;
      *a3 = v16;
    }
  }
  else
  {
    if (v6 >= 3)
    {
      objc_super v13 = VCPLogInstance();
      os_log_type_t v14 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v13, v14))
      {
        *(_WORD *)int v18 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, v14, "[Deferred] Processing failed", v18, 2u);
      }
    }
    if (a3)
    {
      uint64_t v15 = a4;
      NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
      v9 = +[NSString stringWithFormat:@"Deferred processing failed"];
      id v20 = v9;
      v10 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      NSErrorDomain v11 = NSOSStatusErrorDomain;
      uint64_t v12 = v15;
      goto LABEL_14;
    }
  }
}

- (BOOL)run:(id *)a3
{
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    v5 = VCPLogInstance();
    os_log_type_t v6 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v5, v6))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "[Deferred] Processing recent captures...", v10, 2u);
    }
  }
  uint64_t v7 = [(MADPhotosDeferredProcessingTask *)self performSceneProcessing:&stru_100219758];
  if (v7
    || (uint64_t v7 = -[MADPhotosDeferredProcessingTask performFullProcessing:](self, "performFullProcessing:", &stru_100219758, v7), v7))
  {
    [(MADPhotosDeferredProcessingTask *)self generateError:a3 status:v7];
    return 0;
  }
  else
  {
    v9 = [(MADPhotosDeferredProcessingTask *)self completionHandler];
    v9[2](v9, 0, 0);

    return 1;
  }
}

- (void).cxx_destruct
{
}

@end