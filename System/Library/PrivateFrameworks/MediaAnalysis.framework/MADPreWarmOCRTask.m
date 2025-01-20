@interface MADPreWarmOCRTask
- (BOOL)run:(id *)a3;
- (MADPreWarmOCRTask)initWithCompletionHandler:(id)a3 cancelOrExtendTimeoutBlock:(id)a4;
@end

@implementation MADPreWarmOCRTask

- (MADPreWarmOCRTask)initWithCompletionHandler:(id)a3 cancelOrExtendTimeoutBlock:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MADPreWarmOCRTask;
  v7 = [(MADPreWarmOCRTask *)&v11 initWithCompletionHandler:a3];
  if (v7)
  {
    id v8 = objc_retainBlock(v6);
    id cancelOrExtendTimeoutBlock = v7->_cancelOrExtendTimeoutBlock;
    v7->_id cancelOrExtendTimeoutBlock = v8;
  }
  return v7;
}

- (BOOL)run:(id *)a3
{
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    v5 = VCPLogInstance();
    os_log_type_t v6 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v5, v6))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Pre-warming OCR models", buf, 2u);
    }
  }
  id v7 = +[CRImageReader defaultRevisionNumber];
  id cancelOrExtendTimeoutBlock = self->_cancelOrExtendTimeoutBlock;
  id v19 = 0;
  unsigned __int8 v9 = +[CRImageReader preheatModelsForOptions:&__NSDictionary0__struct revision:v7 extendedTimeoutBlock:cancelOrExtendTimeoutBlock error:&v19];
  id v10 = v19;
  if (v9)
  {
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      objc_super v11 = VCPLogInstance();
      os_log_type_t v12 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v11, v12))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, v12, "Successfully pre-warmed OCR models", buf, 2u);
      }
    }
    v13 = [(MADPreWarmOCRTask *)self completionHandler];
    v13[2](v13, 0, 0);
    goto LABEL_17;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v14 = VCPLogInstance();
    os_log_type_t v15 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v14, v15))
    {
      v16 = [v10 description];
      *(_DWORD *)buf = 138412290;
      v21 = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Failed to pre-warm OCR models (%@)", buf, 0xCu);
    }
  }
  if (a3)
  {
    id v17 = [v10 copy];
    v13 = (void (**)(void, void, void))*a3;
    *a3 = v17;
LABEL_17:
  }
  return v9;
}

- (void).cxx_destruct
{
}

@end