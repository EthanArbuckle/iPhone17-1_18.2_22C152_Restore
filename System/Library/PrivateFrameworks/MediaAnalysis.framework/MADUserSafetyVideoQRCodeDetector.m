@interface MADUserSafetyVideoQRCodeDetector
+ (int)generateDecoderSettings:(id)a3 decoderConfig:(id)a4 withRequest:(id)a5 videoDuration:(double)a6;
- (id)sensitivityFromQRCodeInVideo:(id)a3 request:(id)a4 signpostPayload:(id)a5 progressHandler:(id)a6;
@end

@implementation MADUserSafetyVideoQRCodeDetector

+ (int)generateDecoderSettings:(id)a3 decoderConfig:(id)a4 withRequest:(id)a5 videoDuration:(double)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9 && v10)
  {
    [v9 setObject:&unk_1F15EBCD0 forKeyedSubscript:*MEMORY[0x1E4F24D70]];
    [v9 setObject:&unk_1F15EBCE8 forKeyedSubscript:*MEMORY[0x1E4F24E10]];
    [v9 setObject:&unk_1F15EBCE8 forKeyedSubscript:*MEMORY[0x1E4F24D08]];
    v12 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v11, "appliesPreferredTrackTransform"));
    [v9 setObject:v12 forKeyedSubscript:@"AppliesPreferredTrackTransform"];

    v13 = [v11 sampling];
    if (v13)
    {
      v14 = [v11 sampling];
      uint64_t v15 = [v14 framesPerSync];
    }
    else
    {
      uint64_t v15 = 1;
    }

    v18 = [v11 sampling];
    if (v18)
    {
      v19 = [v11 sampling];
      uint64_t v20 = [v19 uniformSampling];
    }
    else
    {
      uint64_t v20 = 1;
    }

    v16 = [objc_alloc(MEMORY[0x1E4F747A0]) initWithFramesPerSync:v15 frameLimit:1 uniformSampling:v20];
    if ([v11 requiresBlastdoor])
    {
      v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSObject framesPerSync](v16, "framesPerSync"));
      [v9 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F16270]];

      v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSObject frameLimit](v16, "frameLimit"));
      [v9 setObject:v22 forKeyedSubscript:@"FrameLimit"];

      v23 = objc_msgSend(NSNumber, "numberWithBool:", -[NSObject uniformSampling](v16, "uniformSampling"));
      [v9 setObject:v23 forKeyedSubscript:@"UniformSampling"];
    }
    else
    {
      if (![v16 frameLimit]
        && [v16 uniformSampling]
        && (int)MediaAnalysisLogLevel() >= 4)
      {
        v25 = VCPLogInstance();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf.value) = 138412290;
          *(CMTimeValue *)((char *)&buf.value + 4) = objc_opt_class();
          id v26 = *(id *)((char *)&buf.value + 4);
          _os_log_impl(&dword_1BBEDA000, v25, OS_LOG_TYPE_DEFAULT, "[%@] Unexpected uniformSampling specified when frameLimit is 0,ignoring uniformSampling", (uint8_t *)&buf, 0xCu);
        }
      }
      if ([v16 framesPerSync])
      {
        v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSObject framesPerSync](v16, "framesPerSync"));
        [v9 setObject:v27 forKeyedSubscript:*MEMORY[0x1E4F16270]];

        if ([v16 frameLimit])
        {
          v28 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSObject frameLimit](v16, "frameLimit"));
          [v10 setObject:v28 forKeyedSubscript:@"FrameLimit"];

          if ([v16 uniformSampling])
          {
            double v29 = a6 / ((double)(unint64_t)([v16 frameLimit] - 1) + 0.1);
            if (v29 <= 0.0)
            {
              if ((int)MediaAnalysisLogLevel() >= 4)
              {
                v33 = VCPLogInstance();
                if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                {
                  v34 = objc_opt_class();
                  uint64_t v35 = *MEMORY[0x1E4F161E0];
                  LODWORD(buf.value) = 138412802;
                  *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v34;
                  LOWORD(buf.flags) = 2112;
                  *(void *)((char *)&buf.flags + 2) = v35;
                  HIWORD(buf.epoch) = 2048;
                  double v39 = v29;
                  id v36 = v34;
                  _os_log_impl(&dword_1BBEDA000, v33, OS_LOG_TYPE_DEFAULT, "[%@] Invalid decoder configuration value (%@ = %f), ignoring", (uint8_t *)&buf, 0x20u);
                }
              }
            }
            else
            {
              memset(&buf, 0, sizeof(buf));
              CMTimeMakeWithSeconds(&buf, v29, 1000);
              CMTime v37 = buf;
              CFDictionaryRef v30 = CMTimeCopyAsDictionary(&v37, (CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
              [v9 setObject:v30 forKeyedSubscript:*MEMORY[0x1E4F161E0]];
            }
          }
        }
      }
      else if ([v16 frameLimit])
      {
        v31 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSObject frameLimit](v16, "frameLimit"));
        [v10 setObject:v31 forKeyedSubscript:@"FrameLimit"];

        if ([v16 uniformSampling])
        {
          v32 = objc_msgSend(NSNumber, "numberWithDouble:", (double)(unint64_t)-[NSObject frameLimit](v16, "frameLimit") / a6);
          [v10 setObject:v32 forKeyedSubscript:@"FramesPerSecond"];
        }
      }
    }
    int v17 = 0;
LABEL_17:

    goto LABEL_18;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v16 = VCPLogInstance();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf.value) = 0;
      _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_ERROR, "generateDecoderSettings:decoderConfig:withRequest:videoDuration: failed, nil inputs", (uint8_t *)&buf, 2u);
    }
    int v17 = -50;
    goto LABEL_17;
  }
  int v17 = -50;
LABEL_18:

  return v17;
}

- (id)sensitivityFromQRCodeInVideo:(id)a3 request:(id)a4 signpostPayload:(id)a5 progressHandler:(id)a6
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v14 = VCPLogInstance();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)CMTime buf = 138412290;
      id v75 = (id)objc_opt_class();
      id v15 = v75;
      _os_log_impl(&dword_1BBEDA000, v14, OS_LOG_TYPE_INFO, "[%@] running...", buf, 0xCu);
    }
  }
  v16 = [(MADUserSafetyQRCodeDetector *)self sensitivity];
  BOOL v17 = v16 == 0;

  if (v17)
  {
    context = (void *)MEMORY[0x1C186D320]();
    v22 = [v11 sensitiveFrameCountThreshold];
    if (v22)
    {
      v23 = [v11 sensitiveFrameCountThreshold];
      BOOL v24 = [v23 unsignedIntegerValue] == 0;

      if (v24)
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          uint64_t v40 = VCPLogInstance();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            v41 = objc_opt_class();
            *(_DWORD *)CMTime buf = 138412290;
            id v75 = v41;
            id v42 = v41;
            _os_log_impl(&dword_1BBEDA000, v40, OS_LOG_TYPE_ERROR, "[%@] Invalid configuration, sensitiveFrameCountThreshold must be > 0", buf, 0xCu);
          }
        }
        v21 = [(MADUserSafetyQRCodeDetector *)self sensitivity];
        int v31 = 1;
LABEL_72:
        if (v31) {
          goto LABEL_73;
        }
        goto LABEL_6;
      }
    }
    v25 = [v10 url];
    if (!v25)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v32 = VCPLogInstance();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v33 = objc_opt_class();
          *(_DWORD *)CMTime buf = 138412290;
          id v75 = v33;
          id v34 = v33;
          _os_log_impl(&dword_1BBEDA000, v32, OS_LOG_TYPE_ERROR, "[%@] Failed to obtain video resource", buf, 0xCu);
        }
      }
      v21 = [(MADUserSafetyQRCodeDetector *)self sensitivity];
      int v31 = 1;
      goto LABEL_71;
    }
    if ([v11 requiresBlastdoor])
    {
      id v26 = [[VCPBlastdoorVideoProcessor alloc] initWithURL:v25];
      double v27 = 0.0;
      if (v26) {
        goto LABEL_16;
      }
    }
    else
    {
      id v26 = [[VCPVideoProcessor alloc] initWithURL:v25];
      [(VCPBlastdoorVideoProcessor *)v26 videoDuration];
      double v27 = v35;
      if (v26)
      {
LABEL_16:
        if (v13) {
          [(VCPBlastdoorVideoProcessor *)v26 setProgressHandler:v13];
        }
        v67 = [MEMORY[0x1E4F1CA60] dictionary];
        v68 = [MEMORY[0x1E4F1CA60] dictionary];
        if ([(id)objc_opt_class() generateDecoderSettings:v67 decoderConfig:v68 withRequest:v11 videoDuration:v27])
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            v28 = VCPLogInstance();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              double v29 = objc_opt_class();
              *(_DWORD *)CMTime buf = 138412290;
              id v75 = v29;
              id v30 = v29;
              _os_log_impl(&dword_1BBEDA000, v28, OS_LOG_TYPE_ERROR, "[%@] Failed to generate settings and config for videoProcessor", buf, 0xCu);
            }
          }
          v21 = [(MADUserSafetyQRCodeDetector *)self sensitivity];
          int v31 = 1;
          goto LABEL_69;
        }
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          v43 = VCPLogInstance();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
          {
            id v44 = (id)objc_opt_class();
            int v45 = [v11 requiresBlastdoor];
            v46 = @"NO";
            *(_DWORD *)CMTime buf = 138413058;
            id v75 = v44;
            __int16 v76 = 2112;
            if (v45) {
              v46 = @"YES";
            }
            v77 = v46;
            __int16 v78 = 2112;
            v79 = v67;
            __int16 v80 = 2112;
            v81 = v68;
            _os_log_impl(&dword_1BBEDA000, v43, OS_LOG_TYPE_DEBUG, "[%@] requiresBlastdoor: %@, decoder settings: %@, decoder configuration: %@", buf, 0x2Au);
          }
        }
        [(VCPBlastdoorVideoProcessor *)v26 setDecoderSettings:v67];
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __105__MADUserSafetyVideoQRCodeDetector_sensitivityFromQRCodeInVideo_request_signpostPayload_progressHandler___block_invoke;
        aBlock[3] = &unk_1E6299AE8;
        aBlock[4] = self;
        id v62 = v12;
        id v73 = v62;
        v65 = _Block_copy(aBlock);
        id v71 = 0;
        BOOL v47 = [(VCPBlastdoorVideoProcessor *)v26 addFrameProcessingRequest:v65 withConfiguration:v68 error:&v71];
        id v66 = v71;
        if (v47)
        {
          v48 = VCPSignPostLog();
          os_signpost_id_t v61 = os_signpost_id_generate(v48);

          v49 = VCPSignPostLog();
          v50 = v49;
          v21 = (void *)(v61 - 1);
          if (v61 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v49))
          {
            *(_DWORD *)CMTime buf = 138412290;
            id v75 = v62;
            _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v50, OS_SIGNPOST_INTERVAL_BEGIN, v61, "VCPVideoProcessor_Analyze", "%@", buf, 0xCu);
          }

          id v70 = v66;
          BOOL v51 = [(VCPBlastdoorVideoProcessor *)v26 analyzeWithError:&v70];
          id v52 = v70;

          id v66 = v52;
          if (v51)
          {
            v53 = VCPSignPostLog();
            v54 = v53;
            if ((unint64_t)v21 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v53))
            {
              *(_DWORD *)CMTime buf = 138412290;
              id v75 = v62;
              _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v54, OS_SIGNPOST_INTERVAL_END, v61, "VCPVideoProcessor_Analyze", "%@", buf, 0xCu);
            }

            int v31 = 0;
            goto LABEL_68;
          }
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            v58 = VCPLogInstance();
            if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
            {
              id v64 = (id)objc_opt_class();
              v59 = [v52 description];
              *(_DWORD *)CMTime buf = 138412546;
              id v75 = v64;
              __int16 v76 = 2112;
              v77 = v59;
              _os_log_impl(&dword_1BBEDA000, v58, OS_LOG_TYPE_ERROR, "[%@] Failed to process video (%@)", buf, 0x16u);
            }
          }
          uint64_t v57 = [(MADUserSafetyQRCodeDetector *)self sensitivity];
        }
        else
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            v55 = VCPLogInstance();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
            {
              id v63 = (id)objc_opt_class();
              v56 = [v66 description];
              *(_DWORD *)CMTime buf = 138412546;
              id v75 = v63;
              __int16 v76 = 2112;
              v77 = v56;
              _os_log_impl(&dword_1BBEDA000, v55, OS_LOG_TYPE_ERROR, "[%@] Failed to add request to video processor (%@)", buf, 0x16u);
            }
          }
          uint64_t v57 = [(MADUserSafetyQRCodeDetector *)self sensitivity];
        }
        v21 = (void *)v57;
        int v31 = 1;
LABEL_68:

LABEL_69:
LABEL_70:

LABEL_71:
        goto LABEL_72;
      }
    }
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v36 = VCPLogInstance();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        id v37 = (id)objc_opt_class();
        int v38 = [v11 requiresBlastdoor];
        double v39 = @"NO";
        if (v38) {
          double v39 = @"YES";
        }
        *(_DWORD *)CMTime buf = 138412546;
        id v75 = v37;
        __int16 v76 = 2112;
        v77 = v39;
        _os_log_impl(&dword_1BBEDA000, v36, OS_LOG_TYPE_ERROR, "[%@] Failed to create video processor (requiresBlastdoor: %@)", buf, 0x16u);
      }
    }
    v21 = [(MADUserSafetyQRCodeDetector *)self sensitivity];
    int v31 = 1;
    goto LABEL_70;
  }
LABEL_6:
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v18 = VCPLogInstance();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = objc_opt_class();
      *(_DWORD *)CMTime buf = 138412290;
      id v75 = v19;
      id v20 = v19;
      _os_log_impl(&dword_1BBEDA000, v18, OS_LOG_TYPE_INFO, "[%@] complete", buf, 0xCu);
    }
  }
  v21 = [(MADUserSafetyQRCodeDetector *)self sensitivity];
LABEL_73:

  return v21;
}

void __105__MADUserSafetyVideoQRCodeDetector_sensitivityFromQRCodeInVideo_request_signpostPayload_progressHandler___block_invoke(uint64_t a1, opaqueCMSampleBuffer *a2, unsigned char *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v6 = [*(id *)(a1 + 32) sensitivity];
  if (!v6
    || ([*(id *)(a1 + 32) sensitivity],
        v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 BOOLValue],
        v7,
        v6,
        (v8 & 1) == 0))
  {
    CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a2);
    if (ImageBuffer)
    {
      [*(id *)(a1 + 32) processPixelBuffer:ImageBuffer orientation:1 signpostPayload:*(void *)(a1 + 40)];
    }
    else if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v10 = VCPLogInstance();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v12 = 138412290;
        id v13 = (id)objc_opt_class();
        id v11 = v13;
        _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_ERROR, "[%@] Failed to acquire pixelBuffer", (uint8_t *)&v12, 0xCu);
      }
    }
  }
  *a3 = 1;
}

@end