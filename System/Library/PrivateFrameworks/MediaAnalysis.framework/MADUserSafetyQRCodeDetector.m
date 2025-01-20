@interface MADUserSafetyQRCodeDetector
+ (BOOL)enabled;
+ (id)sensitiveURLString;
- (MADUserSafetyQRCodeDetector)init;
- (NSNumber)sensitivity;
- (void)processPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4 signpostPayload:(id)a5;
- (void)setSensitivity:(id)a3;
@end

@implementation MADUserSafetyQRCodeDetector

+ (BOOL)enabled
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.sensitivecontentanalysis.testing"];
  v3 = [v2 objectForKey:@"SensitiveContentAnalysisTestMode"];

  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

+ (id)sensitiveURLString
{
  return @"https://www.apple.com/families/";
}

- (MADUserSafetyQRCodeDetector)init
{
  v3.receiver = self;
  v3.super_class = (Class)MADUserSafetyQRCodeDetector;
  return [(MADUserSafetyQRCodeDetector *)&v3 init];
}

- (void)processPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4 signpostPayload:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  v73[1] = *MEMORY[0x1E4F143B8];
  id v60 = a5;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v8 = VCPLogInstance();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v69 = (id)objc_opt_class();
      id v9 = v69;
      _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_INFO, "[%@] start barcode detection", buf, 0xCu);
    }
  }
  context = (void *)MEMORY[0x1C186D320]();
  v61 = objc_msgSend(MEMORY[0x1E4F45768], "mad_defaultRequest");
  if (v61)
  {
    v10 = (void *)*MEMORY[0x1E4F45BA0];
    v73[0] = *MEMORY[0x1E4F45BA0];
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:1];
    [v61 setSymbologies:v11];

    v12 = VCPSignPostLog();
    os_signpost_id_t v13 = os_signpost_id_generate(v12);

    v14 = VCPSignPostLog();
    v15 = v14;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_DWORD *)buf = 138412290;
      id v69 = v60;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "VNImageRequestHandler_init", "%@", buf, 0xCu);
    }

    id v16 = objc_alloc(MEMORY[0x1E4F45890]);
    v59 = [v16 initWithCVPixelBuffer:a3 orientation:v5 options:MEMORY[0x1E4F1CC08]];
    v17 = VCPSignPostLog();
    v18 = v17;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_DWORD *)buf = 138412290;
      id v69 = v60;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v18, OS_SIGNPOST_INTERVAL_END, v13, "VNImageRequestHandler_init", "%@", buf, 0xCu);
    }

    if (v59)
    {
      v19 = VCPSignPostLog();
      os_signpost_id_t v20 = os_signpost_id_generate(v19);

      v21 = VCPSignPostLog();
      v22 = v21;
      if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
      {
        *(_DWORD *)buf = 138412290;
        id v69 = v60;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "VNImageRequestHandler_performRequests", "%@", buf, 0xCu);
      }

      v72 = v61;
      v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v72 count:1];
      id v66 = 0;
      char v24 = [v59 performRequests:v23 error:&v66];
      id v25 = v66;

      v26 = VCPSignPostLog();
      v27 = v26;
      if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        *(_DWORD *)buf = 138412290;
        id v69 = v60;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v27, OS_SIGNPOST_INTERVAL_END, v20, "VNImageRequestHandler_performRequests", "%@", buf, 0xCu);
      }

      if (v24)
      {
        v28 = [v61 results];
        log = v28;
        if (v28)
        {
          long long v64 = 0u;
          long long v65 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          v29 = v28;
          uint64_t v30 = [v29 countByEnumeratingWithState:&v62 objects:v67 count:16];
          if (v30)
          {
            uint64_t v31 = *(void *)v63;
            v56 = (NSNumber *)MEMORY[0x1E4F1CC28];
            while (2)
            {
              for (uint64_t i = 0; i != v30; ++i)
              {
                if (*(void *)v63 != v31) {
                  objc_enumerationMutation(v29);
                }
                v33 = *(void **)(*((void *)&v62 + 1) + 8 * i);
                v34 = objc_msgSend(v33, "symbology", v56, log);
                BOOL v35 = v34 == v10;

                if (v35)
                {
                  v36 = [v33 payloadStringValue];
                  v37 = [(id)objc_opt_class() sensitiveURLString];
                  int v38 = [v36 isEqualToString:v37];

                  if (v38)
                  {
                    if ((int)MediaAnalysisLogLevel() >= 6)
                    {
                      v48 = VCPLogInstance();
                      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
                      {
                        v49 = objc_opt_class();
                        *(_DWORD *)buf = 138412290;
                        id v69 = v49;
                        id v50 = v49;
                        _os_log_impl(&dword_1BBEDA000, v48, OS_LOG_TYPE_INFO, "[%@] Successfully detected the sensitive barcode!", buf, 0xCu);
                      }
                    }
                    v51 = (NSNumber *)MEMORY[0x1E4F1CC38];
                    goto LABEL_52;
                  }
                }
              }
              uint64_t v30 = [v29 countByEnumeratingWithState:&v62 objects:v67 count:16];
              if (v30) {
                continue;
              }
              break;
            }
          }
          else
          {
            v51 = (NSNumber *)MEMORY[0x1E4F1CC28];
LABEL_52:
            v56 = v51;
          }

          v47 = v56;
        }
        else
        {
          v47 = (NSNumber *)MEMORY[0x1E4F1CC28];
        }
        sensitivity = self->_sensitivity;
        self->_sensitivity = v47;

        int v42 = 0;
        goto LABEL_55;
      }
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        int v42 = 1;
LABEL_56:
        v39 = v59;
        goto LABEL_57;
      }
      log = VCPLogInstance();
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        v45 = objc_opt_class();
        *(_DWORD *)buf = 138412546;
        id v69 = v45;
        __int16 v70 = 2112;
        id v71 = v25;
        id v46 = v45;
        _os_log_impl(&dword_1BBEDA000, log, OS_LOG_TYPE_ERROR, "[%@] Failed to perform vision requests, err %@", buf, 0x16u);
      }
LABEL_42:
      int v42 = 1;
LABEL_55:

      goto LABEL_56;
    }
    v39 = 0;
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      log = VCPLogInstance();
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        v43 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        id v69 = v43;
        id v44 = v43;
        _os_log_impl(&dword_1BBEDA000, log, OS_LOG_TYPE_ERROR, "[%@] Failed to create VNImageRequestHandler", buf, 0xCu);
      }
      id v25 = 0;
      goto LABEL_42;
    }
    goto LABEL_38;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v39 = VCPLogInstance();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      v40 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      id v69 = v40;
      id v41 = v40;
      _os_log_impl(&dword_1BBEDA000, v39, OS_LOG_TYPE_ERROR, "[%@] Failed to configure VNDetectBarcodesRequest", buf, 0xCu);

      id v25 = 0;
      int v42 = 1;
LABEL_57:

      goto LABEL_58;
    }
LABEL_38:
    id v25 = 0;
    int v42 = 1;
    goto LABEL_57;
  }
  id v25 = 0;
  int v42 = 1;
LABEL_58:

  if (!v42 && (int)MediaAnalysisLogLevel() >= 6)
  {
    v53 = VCPLogInstance();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
    {
      v54 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      id v69 = v54;
      id v55 = v54;
      _os_log_impl(&dword_1BBEDA000, v53, OS_LOG_TYPE_INFO, "[%@] complete barcode detection", buf, 0xCu);
    }
  }
}

- (NSNumber)sensitivity
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSensitivity:(id)a3
{
}

- (void).cxx_destruct
{
}

@end