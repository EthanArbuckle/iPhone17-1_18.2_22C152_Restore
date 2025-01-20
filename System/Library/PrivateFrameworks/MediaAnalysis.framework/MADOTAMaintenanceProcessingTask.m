@interface MADOTAMaintenanceProcessingTask
+ (id)taskWithCancelBlock:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5;
- (BOOL)run:(id *)a3;
- (MADOTAMaintenanceProcessingTask)initWithCancelBlock:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5;
@end

@implementation MADOTAMaintenanceProcessingTask

- (MADOTAMaintenanceProcessingTask)initWithCancelBlock:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  v9 = (Block_layout *)a4;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100165AC0;
  v17[3] = &unk_10021AD08;
  id v10 = a5;
  id v18 = v10;
  v16.receiver = self;
  v16.super_class = (Class)MADOTAMaintenanceProcessingTask;
  v11 = [(MADOTAMaintenanceProcessingTask *)&v16 initWithCompletionHandler:v17];
  if (v11)
  {
    if (v9) {
      v12 = v9;
    }
    else {
      v12 = &stru_10021F120;
    }
    v13 = objc_retainBlock(v12);
    id progressHandler = v11->_progressHandler;
    v11->_id progressHandler = v13;

    [(MADOTAMaintenanceProcessingTask *)v11 setCancelBlock:v8];
  }

  return v11;
}

+ (id)taskWithCancelBlock:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [objc_alloc((Class)a1) initWithCancelBlock:v8 progressHandler:v9 completionHandler:v10];

  return v11;
}

- (BOOL)run:(id *)a3
{
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    v5 = VCPLogInstance();
    os_log_type_t v6 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v5, v6))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v36 = @"[MADOTAMaintenanceProcessingTask]";
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "%@ Running ...", buf, 0xCu);
    }
  }
  unsigned int v7 = [(MADOTAMaintenanceProcessingTask *)self isCanceled];
  if (!v7)
  {
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1001660B4;
    v31[3] = &unk_10021BFD0;
    v31[4] = self;
    v32 = @"[MADOTAMaintenanceProcessingTask]";
    v14 = objc_retainBlock(v31);
    v15 = +[VCPWatchdog sharedWatchdog];
    [v15 pet];

    id progressHandler = (void (**)(double))self->_progressHandler;
    if (progressHandler) {
      progressHandler[2](0.0);
    }
    if ([(id)objc_opt_class() isCaptionOTAEnabled])
    {
      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        v17 = VCPLogInstance();
        os_log_type_t v18 = VCPLogToOSLogType[5];
        if (os_log_type_enabled(v17, v18))
        {
          *(_DWORD *)buf = 138412290;
          CFStringRef v36 = @"[MADOTAMaintenanceProcessingTask]";
          _os_log_impl((void *)&_mh_execute_header, v17, v18, "%@ Retriving CSU AX Image Caption model", buf, 0xCu);
        }
      }
      v19 = VCPSignPostLog();
      os_signpost_id_t v20 = os_signpost_id_generate(v19);

      v21 = VCPSignPostLog();
      v22 = v21;
      if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "MADOTAMaintenanceProcessingTask_DownloadAXImageCaptionModel", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      v23 = +[VCPMobileAssetManager sharedManager];
      id v24 = [v23 retrieveAssetLocalURL:1 petWatchDog:&stru_10021F140 cancelBlock:v14];

      v25 = VCPSignPostLog();
      v26 = v25;
      if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_INTERVAL_END, v20, "MADOTAMaintenanceProcessingTask_DownloadAXImageCaptionModel", (const char *)&unk_1001F3BD3, buf, 2u);
      }

      v27 = (void (**)(double))self->_progressHandler;
      if (!v27) {
        goto LABEL_29;
      }
      v27[2](50.0);
    }
    v28 = (void (**)(double))self->_progressHandler;
    if (v28) {
      v28[2](100.0);
    }
LABEL_29:
    v29 = [(MADOTAMaintenanceProcessingTask *)self completionHandler];
    v29[2](v29, 0, 0);

    return v7 ^ 1;
  }
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v8 = VCPLogInstance();
    os_log_type_t v9 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v8, v9))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v36 = @"[MADOTAMaintenanceProcessingTask]";
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "%@ Request canceled", buf, 0xCu);
    }
  }
  if (a3)
  {
    NSErrorUserInfoKey v33 = NSLocalizedDescriptionKey;
    id v10 = +[NSString stringWithFormat:@"Request was canceled"];
    v34 = v10;
    id v11 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    v12 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-128 userInfo:v11];
    id v13 = *a3;
    *a3 = v12;
  }
  return v7 ^ 1;
}

- (void).cxx_destruct
{
}

@end