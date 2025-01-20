@interface VCPVideoFramesCaptionTask
+ (id)taskWithFrames:(id)a3 frameRate:(float)a4 timeRange:(id *)a5 andCompletionHandler:(id)a6;
- (BOOL)autoCancellable;
- (VCPVideoFramesCaptionTask)initWithFrames:(id)a3 frameRate:(float)a4 timeRange:(id *)a5 andCompletionHandler:(id)a6;
- (float)resourceRequirement;
- (int)main;
- (int)run;
- (void)cancel;
- (void)dealloc;
@end

@implementation VCPVideoFramesCaptionTask

- (VCPVideoFramesCaptionTask)initWithFrames:(id)a3 frameRate:(float)a4 timeRange:(id *)a5 andCompletionHandler:(id)a6
{
  id v11 = a3;
  v12 = (Block_layout *)a6;
  if ([v11 count])
  {
    v29.receiver = self;
    v29.super_class = (Class)VCPVideoFramesCaptionTask;
    v13 = [(VCPVideoFramesCaptionTask *)&v29 init];
    v14 = v13;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_frames, a3);
      long long v15 = *(_OWORD *)&a5->var0.var0;
      long long v16 = *(_OWORD *)&a5->var0.var3;
      *(_OWORD *)((char *)&v14->_timeRange.duration.value + 4) = *(_OWORD *)&a5->var1.var1;
      *(_OWORD *)&v14->_timeRange.start.flags = v16;
      *(_OWORD *)(&v14->_frameRate + 1) = v15;
      v14->_frameRate = a4;
      NSUInteger v17 = [(NSArray *)v14->_frames count];
      v14->_frameNum = v17;
      $3CC8671D27C23BF42ADDB32F2B5E48AE var1 = a5->var1;
      CMTimeMultiplyByRatio(&v28, (CMTime *)&var1, 1, v17 - 1);
      *(CMTime *)((char *)&v14->_timeRange.duration.epoch + 4) = v28;
      id v18 = [objc_alloc((Class)NSMutableString) initWithString:&stru_10021F768];
      v19 = *(void **)&v14->_canceled.__a_.__a_value;
      *(void *)&v14->_canceled.__a_.__a_value = v18;

      uint64_t v20 = +[NSMutableDictionary dictionary];
      errorMessage = v14->_errorMessage;
      v14->_errorMessage = (NSMutableString *)v20;

      if (v12) {
        v22 = v12;
      }
      else {
        v22 = &stru_10021C630;
      }
      v23 = objc_retainBlock(v22);
      id completionHandler = v14->_completionHandler;
      v14->_id completionHandler = v23;
    }
    self = v14;
    v25 = self;
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

+ (id)taskWithFrames:(id)a3 frameRate:(float)a4 timeRange:(id *)a5 andCompletionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = objc_alloc((Class)objc_opt_class());
  long long v12 = *(_OWORD *)&a5->var0.var3;
  v15[0] = *(_OWORD *)&a5->var0.var0;
  v15[1] = v12;
  long long v16 = *(_OWORD *)&a5->var1.var1;
  id v13 = objc_msgSend(v11, "initWithFrames:frameRate:timeRange:andCompletionHandler:", v9, v15, v10, COERCE_DOUBLE(__PAIR64__(DWORD1(v16), LODWORD(a4))));

  return v13;
}

- (float)resourceRequirement
{
  return 1.0;
}

- (BOOL)autoCancellable
{
  return 0;
}

- (void)cancel
{
}

- (void)dealloc
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_frameInterval.epoch + 5);
  if ((v3 & 1) == 0)
  {
    id completionHandler = (void (**)(id, void, void *))self->_completionHandler;
    if (completionHandler)
    {
      NSErrorUserInfoKey v9 = NSLocalizedDescriptionKey;
      v5 = +[NSString stringWithFormat:@"Video frames caption task cancelled"];
      id v10 = v5;
      v6 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
      v7 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-128 userInfo:v6];
      completionHandler[2](completionHandler, 0, v7);
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)VCPVideoFramesCaptionTask;
  [(VCPVideoFramesCaptionTask *)&v8 dealloc];
}

- (int)main
{
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v4 = VCPLogInstance();
    os_log_type_t v5 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v4, v5))
    {
      LOWORD(buf.value) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "VCPVideoFramesCaptionTask running...", (uint8_t *)&buf, 2u);
    }
  }
  unsigned __int8 v6 = atomic_load((unsigned __int8 *)&self->_frameInterval.epoch + 4);
  if (v6)
  {
    [*(id *)&self->_canceled.__a_.__a_value setString:@"Video frames caption task cancelled"];
    return -128;
  }
  else
  {
    id v33 = [objc_alloc((Class)VCPImageCaptionAnalyzer) initWithCaptionModelType:1 captionSafetyType:0 useSharedModel:1];
    if (v33)
    {
      v7 = +[AXMImageCaptionModelAssetManager sharedInstance];
      v30 = [v7 modelURLForType:1 timeout:0.5];

      if (v30)
      {
        id v8 = [objc_alloc((Class)VCPVideoCaptionAnalyzer) initWithModelType:1 frameNumber:self->_frameNum];
        if (v8)
        {
          uint64_t v50 = 0;
          long long v46 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          NSErrorUserInfoKey v9 = self->_frames;
          v31 = v8;
          obj = v9;
          id v10 = [(NSArray *)v9 countByEnumeratingWithState:&v46 objects:v51 count:16];
          if (v10)
          {
            int32_t v11 = 0;
            v34 = 0;
            uint64_t v35 = *(void *)v47;
            long long v12 = (_OWORD *)((char *)&self->_timeRange.duration.epoch + 4);
            while (1)
            {
              id v13 = 0;
              do
              {
                if (*(void *)v47 != v35) {
                  objc_enumerationMutation(obj);
                }
                v14 = *(__IOSurface **)(*((void *)&v46 + 1) + 8 * (void)v13);
                memset(&buf, 0, sizeof(buf));
                CMTime lhs = *(CMTime *)(&self->_frameRate + 1);
                *(_OWORD *)&time.value = *v12;
                time.epoch = *(void *)&self->_frameInterval.flags;
                CMTimeMultiply(&rhs, &time, v11);
                CMTimeAdd(&buf, &lhs, &rhs);
                CVPixelBufferRef pixelBufferOut = 0;
                CVReturn v16 = CVPixelBufferCreateWithIOSurface(0, v14, 0, &pixelBufferOut);
                if (v16)
                {
                  [*(id *)&self->_canceled.__a_.__a_value setString:@"[VCPVideoFramesCaptionTask] Failed to create CVPixelBuffer from specified IOSurface"];
LABEL_20:
                  int v18 = 0;
                  int v2 = v16;
                  goto LABEL_21;
                }
                if (!v11)
                {
                  id v40 = v34;
                  [v33 analyzePixelBuffer:pixelBufferOut flags:&v50 results:&v40 cancel:&stru_10021C650];
                  id v17 = v40;

                  v34 = v17;
                  [(NSMutableString *)self->_errorMessage addEntriesFromDictionary:v17];
                }
                CMTime v39 = buf;
                long long v37 = *v12;
                uint64_t v38 = *(void *)&self->_frameInterval.flags;
                CVReturn v16 = objc_msgSend(v31, "analyzeFrame:withTimestamp:andDuration:flags:", pixelBufferOut, &v39, &v37, &v50, v30);
                if (v16)
                {
                  [*(id *)&self->_canceled.__a_.__a_value setString:@"[VCPVideoFramesCaptionTask] VideoCaptionAnalyzer failed to analyze frame"];
                  goto LABEL_20;
                }
                ++v11;
                int v18 = 1;
LABEL_21:
                sub_100004484((const void **)&pixelBufferOut);
                if (!v18)
                {
                  v24 = obj;
                  goto LABEL_46;
                }
                id v13 = (char *)v13 + 1;
              }
              while (v10 != v13);
              NSErrorUserInfoKey v9 = obj;
              id v19 = [(NSArray *)obj countByEnumeratingWithState:&v46 objects:v51 count:16];
              id v10 = v19;
              if (!v19) {
                goto LABEL_45;
              }
            }
          }
          v34 = 0;
LABEL_45:

          long long v27 = *(_OWORD *)&self->_timeRange.start.flags;
          v36[0] = *(_OWORD *)(&self->_frameRate + 1);
          v36[1] = v27;
          v36[2] = *(_OWORD *)((char *)&self->_timeRange.duration.value + 4);
          [v31 finishAnalysisPass:v36];
          errorMessage = self->_errorMessage;
          v24 = [v31 results];
          [(NSMutableString *)errorMessage addEntriesFromDictionary:v24];
          int v2 = 0;
LABEL_46:

          id v8 = v31;
        }
        else
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            v25 = VCPLogInstance();
            os_log_type_t v26 = VCPLogToOSLogType[3];
            if (os_log_type_enabled(v25, v26))
            {
              LOWORD(buf.value) = 0;
              _os_log_impl((void *)&_mh_execute_header, v25, v26, "[VCPVideoFramesCaptionTask] VCPVideoCaptionAnalyzer init fail", (uint8_t *)&buf, 2u);
            }
          }
          objc_msgSend(*(id *)&self->_canceled.__a_.__a_value, "setString:", @"[VCPVideoFramesCaptionTask] VCPVideoCaptionAnalyzer init fail", v30);
          v34 = 0;
          int v2 = -108;
        }
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v22 = VCPLogInstance();
          os_log_type_t v23 = VCPLogToOSLogType[3];
          if (os_log_type_enabled(v22, v23))
          {
            LOWORD(buf.value) = 0;
            _os_log_impl((void *)&_mh_execute_header, v22, v23, "[VCPVideoFramesCaptionTask] AX video captioning decoder model not found", (uint8_t *)&buf, 2u);
          }
        }
        objc_msgSend(*(id *)&self->_canceled.__a_.__a_value, "setString:", @"[VCPVideoFramesCaptionTask] AX video captioning decoder model not found", 0);
        v34 = 0;
        int v2 = -18;
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        uint64_t v20 = VCPLogInstance();
        os_log_type_t v21 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v20, v21))
        {
          LOWORD(buf.value) = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, v21, "[VCPVideoFramesCaptionTask] VCPImageCaptionAnalyzer init fail", (uint8_t *)&buf, 2u);
        }
      }
      [*(id *)&self->_canceled.__a_.__a_value setString:@"[VCPVideoFramesCaptionTask] VCPImageCaptionAnalyzer init fail"];
      v34 = 0;
      int v2 = -18;
    }
  }
  return v2;
}

- (int)run
{
  atomic_store(1u, (unsigned __int8 *)&self->_frameInterval.epoch + 5);
  int v3 = [(VCPVideoFramesCaptionTask *)self main];
  if (v3)
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      v4 = VCPLogInstance();
      os_log_type_t v5 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v4, v5))
      {
        *(_WORD *)int32_t v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, v5, "VCPVideoFramesCaptionTask processing failed", v11, 2u);
      }
    }
    uint64_t v6 = *(void *)&self->_canceled.__a_.__a_value;
    NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
    uint64_t v13 = v6;
    v7 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    id completionHandler = (void (**)(id, void, void *))self->_completionHandler;
    NSErrorUserInfoKey v9 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v3 userInfo:v7];
    completionHandler[2](completionHandler, 0, v9);
  }
  else
  {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorMessage, 0);
  objc_storeStrong((id *)&self->_canceled, 0);
  objc_storeStrong((id *)&self->_frames, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end