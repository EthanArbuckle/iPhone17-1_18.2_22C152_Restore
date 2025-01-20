@interface MADUserSafetyImageQRCodeDetector
- (id)sensitivityFromQRCodeInImage:(id)a3 signpostPayload:(id)a4;
@end

@implementation MADUserSafetyImageQRCodeDetector

- (id)sensitivityFromQRCodeInImage:(id)a3 signpostPayload:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v9 = VCPLogInstance();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = (id)objc_opt_class();
      id v4 = v24;
      _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_INFO, "[%@] running...", buf, 0xCu);
    }
  }
  v10 = [(MADUserSafetyQRCodeDetector *)self sensitivity];
  BOOL v11 = v10 == 0;

  if (!v11) {
    goto LABEL_6;
  }
  v15 = (void *)MEMORY[0x1C186D320]();
  v22 = 0;
  unsigned int v21 = 0;
  int v16 = [v7 loadLowResPixelBuffer:&v22 orientation:&v21];
  if (v16)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v17 = VCPLogInstance();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        id v24 = v18;
        id v19 = v18;
        _os_log_impl(&dword_1BBEDA000, v17, OS_LOG_TYPE_ERROR, "[%@] image loading failed", buf, 0xCu);
      }
    }
    id v4 = [(MADUserSafetyQRCodeDetector *)self sensitivity];
  }
  else
  {
    [(MADUserSafetyQRCodeDetector *)self processPixelBuffer:v22 orientation:v21 signpostPayload:v8];
  }
  CF<opaqueCMSampleBuffer *>::~CF(&v22);
  if (!v16)
  {
LABEL_6:
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      v12 = VCPLogInstance();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        id v24 = v13;
        id v14 = v13;
        _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_INFO, "[%@] complete", buf, 0xCu);
      }
    }
    id v4 = [(MADUserSafetyQRCodeDetector *)self sensitivity];
  }

  return v4;
}

@end