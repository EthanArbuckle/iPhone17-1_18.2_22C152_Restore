@interface VCPVideoProcessor
- (BOOL)_analyzeWithStart:(id *)a3 andDuration:(id *)a4 error:(id *)a5;
- (BOOL)addFrameProcessingRequest:(id)a3 withConfiguration:(id)a4 error:(id *)a5;
- (BOOL)addRequest:(id)a3 withConfiguration:(id)a4 error:(id *)a5;
- (BOOL)analyzeWithError:(id *)a3;
- (BOOL)analyzeWithStart:(id *)a3 andDuration:(id *)a4 error:(id *)a5;
- (BOOL)removeRequest:(id)a3 error:(id *)a4;
- (NSDictionary)decoderSettings;
- (VCPVideoProcessor)initWithURL:(id)a3;
- (double)videoDuration;
- (id)progressHandler;
- (void)cancel;
- (void)setDecoderSettings:(id)a3;
- (void)setProgressHandler:(id)a3;
@end

@implementation VCPVideoProcessor

- (NSDictionary)decoderSettings
{
  return self->_decoderSettings;
}

- (void)setDecoderSettings:(id)a3
{
  id v6 = a3;
  v4 = (NSDictionary *)[v6 count];
  if (v4) {
    v4 = (NSDictionary *)v6;
  }
  decoderSettings = self->_decoderSettings;
  self->_decoderSettings = v4;
}

- (VCPVideoProcessor)initWithURL:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)VCPVideoProcessor;
  id v6 = [(VCPVideoProcessor *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_url, a3);
    v8 = objc_alloc_init(VCPVideoProcessorSession);
    session = v7->_session;
    v7->_session = v8;

    uint64_t v17 = *MEMORY[0x1E4F24D70];
    v18[0] = &unk_1F15ED458;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    decoderSettings = v7->_decoderSettings;
    v7->_decoderSettings = (NSDictionary *)v10;

    v12 = [MEMORY[0x1E4F16330] assetWithURL:v7->_url];
    v13 = v12;
    if (v12) {
      [v12 duration];
    }
    else {
      memset(&v15, 0, sizeof(v15));
    }
    v7->_videoDuration = CMTimeGetSeconds(&v15);
  }
  return v7;
}

- (BOOL)addRequest:(id)a3 withConfiguration:(id)a4 error:(id *)a5
{
  return [(VCPVideoProcessorSession *)self->_session addRequest:a3 withConfiguration:a4 error:a5];
}

- (BOOL)removeRequest:(id)a3 error:(id *)a4
{
  return [(VCPVideoProcessorSession *)self->_session removeRequest:a3 error:a4];
}

- (BOOL)addFrameProcessingRequest:(id)a3 withConfiguration:(id)a4 error:(id *)a5
{
  return [(VCPVideoProcessorSession *)self->_session addFrameProcessingRequest:a3 withConfiguration:a4 error:a5];
}

- (BOOL)_analyzeWithStart:(id *)a3 andDuration:(id *)a4 error:(id *)a5
{
  v105[1] = *MEMORY[0x1E4F143B8];
  v9 = [MEMORY[0x1E4F16330] assetWithURL:self->_url];
  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F16378] assetReaderWithAsset:v9 error:a5];
    if (!v10)
    {
      BOOL v37 = 0;
LABEL_80:

      goto LABEL_81;
    }
    v11 = objc_msgSend(v9, "vcp_firstEnabledTrackWithMediaType:", *MEMORY[0x1E4F15C18]);
    v12 = v11;
    if (v11)
    {
      if (!self->_requiresSyncFrameDetectionFromNalUnit) {
        goto LABEL_9;
      }
      v13 = [v11 formatDescriptions];
      v66 = v13;
      if ([v13 count] == 1)
      {
        v14 = [v13 objectAtIndexedSubscript:0];
        uint64_t MediaSubType = CMFormatDescriptionGetMediaSubType(v14);

        if (MediaSubType == 1635148593 || MediaSubType == 1752589105)
        {

LABEL_9:
          objc_super v16 = [(NSDictionary *)self->_decoderSettings objectForKeyedSubscript:@"AppliesPreferredTrackTransform"];
          int v17 = [v16 BOOLValue];

          v66 = (void *)[(NSDictionary *)self->_decoderSettings mutableCopy];
          [v66 removeObjectForKey:@"AppliesPreferredTrackTransform"];
          [v12 preferredTransform];
          unsigned int v64 = angleForTransform(v87);
          if (self->_requiresSyncFrameDetectionFromNalUnit) {
            v18 = 0;
          }
          else {
            v18 = v66;
          }
          v19 = [MEMORY[0x1E4F163A0] assetReaderTrackOutputWithTrack:v12 outputSettings:v18];
          v20 = v19;
          if (v19)
          {
            if (v17 && !self->_requiresSyncFrameDetectionFromNalUnit) {
              [v19 setAppliesPreferredTrackTransform:1];
            }
            CMTime start = (CMTime)*a3;
            CMTime duration = (CMTime)*a4;
            CMTimeRangeMake(&range, &start, &duration);
            [v12 timeRange];
            CMTimeRangeGetIntersection(&v86, &range, &otherRange);
            CMTimeRange v81 = v86;
            [v10 setTimeRange:&v81];
            [v10 addOutput:v20];
            if ([v10 startReading])
            {
              -[VCPVideoProcessorSession setOrientation:](self->_session, "setOrientation:", objc_msgSend(v12, "vcp_imageOrientation"));
              progressHandler = (void (**)(double))self->_progressHandler;
              if (progressHandler) {
                progressHandler[2](0.0);
              }
              uint64_t v74 = 0;
              v75 = (CMTime *)&v74;
              uint64_t v76 = 0x4812000000;
              v77 = __Block_byref_object_copy__36;
              v78 = __Block_byref_object_dispose__36;
              v79 = &unk_1BC33760A;
              memset(&v80, 0, sizeof(v80));
              [v10 timeRange];
              CMTime v80 = buf[0];
              v70[0] = MEMORY[0x1E4F143A8];
              v70[1] = 3221225472;
              v70[2] = __57__VCPVideoProcessor__analyzeWithStart_andDuration_error___block_invoke;
              v70[3] = &unk_1E629AD70;
              v70[4] = self;
              v72 = &v74;
              id v22 = v10;
              id v71 = v22;
              v63 = +[VCPTimer timerWithIntervalSeconds:1 isOneShot:0 andBlock:v70];
              unsigned __int8 v23 = atomic_load((unsigned __int8 *)&self->_canceled);
              if ((v23 & 1) == 0)
              {
                if (v17) {
                  unsigned int v24 = v64;
                }
                else {
                  unsigned int v24 = 0;
                }
                unsigned int v65 = v24;
                do
                {
                  if ([(VCPVideoProcessorSession *)self->_session allRequestsFinished]) {
                    break;
                  }
                  v25 = VCPSignPostLog();
                  os_signpost_id_t v26 = os_signpost_id_generate(v25);

                  v27 = VCPSignPostLog();
                  v28 = v27;
                  if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
                  {
                    LOWORD(buf[0].value) = 0;
                    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v28, OS_SIGNPOST_INTERVAL_BEGIN, v26, "AVAssetReaderTrackOutput_copyNextSampleBuffer", "", (uint8_t *)buf, 2u);
                  }

                  CMSampleBufferRef sbuf = (CMSampleBufferRef)[v20 copyNextSampleBuffer];
                  v29 = VCPSignPostLog();
                  v30 = v29;
                  if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
                  {
                    LOWORD(buf[0].value) = 0;
                    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v30, OS_SIGNPOST_INTERVAL_END, v26, "AVAssetReaderTrackOutput_copyNextSampleBuffer", "", (uint8_t *)buf, 2u);
                  }

                  if (!sbuf)
                  {
                    CF<opaqueCMSampleBuffer *>::~CF((const void **)&sbuf);
                    goto LABEL_42;
                  }
                  if (self->_requiresSyncFrameDetectionFromNalUnit)
                  {
                    if (!+[VCPVideoSyncFrameDecoder isSyncFrameForCMSampleBuffer:](VCPVideoSyncFrameDecoder, "isSyncFrameForCMSampleBuffer:"))goto LABEL_40; {
                    syncFrameDecoder = self->_syncFrameDecoder;
                    }
                    if (!syncFrameDecoder)
                    {
                      v32 = [VCPVideoSyncFrameDecoder alloc];
                      v33 = [(VCPVideoSyncFrameDecoder *)v32 initWithDecoderSettings:self->_decoderSettings formatDescription:CMSampleBufferGetFormatDescription(sbuf) rotationAngle:v65];
                      v34 = self->_syncFrameDecoder;
                      self->_syncFrameDecoder = v33;

                      syncFrameDecoder = self->_syncFrameDecoder;
                      if (!syncFrameDecoder)
                      {
                        if (a5)
                        {
                          v60 = (void *)MEMORY[0x1E4F28C58];
                          uint64_t v92 = *MEMORY[0x1E4F28568];
                          v61 = [NSString stringWithFormat:@"Failed to create VCPVideoSyncFrameDecoder"];
                          v93 = v61;
                          v62 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v93 forKeys:&v92 count:1];
                          *a5 = [v60 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v62];
                        }
                        goto LABEL_74;
                      }
                    }
                    buf[0].value = 0;
                    if (![(VCPVideoSyncFrameDecoder *)syncFrameDecoder decodeCMSampleBuffer:sbuf toCMSampleBuffer:buf error:a5])
                    {
                      CF<opaqueCMSampleBuffer *>::~CF((const void **)buf);
LABEL_74:
                      CF<opaqueCMSampleBuffer *>::~CF((const void **)&sbuf);
                      goto LABEL_75;
                    }
                    CF<__CVBuffer *>::operator=((const void **)&sbuf, (const void **)buf);
                    CF<opaqueCMSampleBuffer *>::~CF((const void **)buf);
                  }
                  if (!-[VCPVideoProcessorSession processSampleBuffer:error:](self->_session, "processSampleBuffer:error:"))goto LABEL_74; {
                  CMSampleBufferGetPresentationTimeStamp(buf, sbuf);
                  }
                  v75[2] = buf[0];
LABEL_40:
                  CF<opaqueCMSampleBuffer *>::~CF((const void **)&sbuf);
                  unsigned __int8 v35 = atomic_load((unsigned __int8 *)&self->_canceled);
                }
                while ((v35 & 1) == 0);
              }
              [v22 cancelReading];
LABEL_42:
              if ([(VCPVideoProcessorSession *)self->_session allRequestsFinished]) {
                goto LABEL_43;
              }
              if ([v22 status] == 4)
              {
                if (a5)
                {
                  v50 = (void *)MEMORY[0x1E4F28C58];
                  uint64_t v90 = *MEMORY[0x1E4F28568];
                  v51 = [NSString stringWithFormat:@"Video processor cancelled"];
                  v91 = v51;
                  v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v91 forKeys:&v90 count:1];
                  *a5 = [v50 errorWithDomain:*MEMORY[0x1E4F28760] code:-128 userInfo:v52];
                }
              }
              else if ([v22 status] == 2)
              {
                session = self->_session;
                [v22 timeRange];
                CMTimeRangeGetEnd(&v68, &v67);
                if ([(VCPVideoProcessorSession *)session flushWithEndTime:&v68 error:a5])
                {
LABEL_43:
                  [v63 destroy];
                  v36 = (void (**)(double))self->_progressHandler;
                  if (v36) {
                    v36[2](1.0);
                  }
                  BOOL v37 = 1;
                  goto LABEL_76;
                }
              }
              else if (a5)
              {
                v54 = (void *)MEMORY[0x1E4F28C58];
                uint64_t v88 = *MEMORY[0x1E4F28568];
                v55 = NSString;
                v56 = [v22 error];
                v57 = [v55 stringWithFormat:@"Failed to complete video decoding: %@", v56];
                v89 = v57;
                v58 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v89 forKeys:&v88 count:1];
                *a5 = [v54 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v58];
              }
LABEL_75:
              BOOL v37 = 0;
LABEL_76:

              _Block_object_dispose(&v74, 8);
              goto LABEL_77;
            }
            if (a5)
            {
              v46 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v94 = *MEMORY[0x1E4F28568];
              v47 = [NSString stringWithFormat:@"Failed to start decoding video track"];
              v95 = v47;
              v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v95 forKeys:&v94 count:1];
              *a5 = [v46 errorWithDomain:*MEMORY[0x1E4F28760] code:-19 userInfo:v48];
            }
          }
          else if (a5)
          {
            v43 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v96 = *MEMORY[0x1E4F28568];
            v44 = [NSString stringWithFormat:@"Failed to create video track output"];
            v97 = v44;
            v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v97 forKeys:&v96 count:1];
            *a5 = [v43 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v45];
          }
          goto LABEL_62;
        }
        if (a5)
        {
          v49 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v98 = *MEMORY[0x1E4F28568];
          v20 = objc_msgSend(NSString, "stringWithFormat:", @"Unsupported codec type: %d", MediaSubType);
          v99 = v20;
          v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v99 forKeys:&v98 count:1];
          v42 = [v49 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v41];
          goto LABEL_61;
        }
      }
      else if (a5)
      {
        v40 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v100 = *MEMORY[0x1E4F28568];
        v20 = objc_msgSend(NSString, "stringWithFormat:", @"Video track contains %d (expecting 1) format description(s)", objc_msgSend(v13, "count"));
        v101 = v20;
        v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v101 forKeys:&v100 count:1];
        v42 = [v40 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v41];
LABEL_61:
        *a5 = v42;

LABEL_62:
        BOOL v37 = 0;
        goto LABEL_77;
      }
      BOOL v37 = 0;
LABEL_78:

      goto LABEL_79;
    }
    if (a5)
    {
      v39 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v102 = *MEMORY[0x1E4F28568];
      v66 = [NSString stringWithFormat:@"Asset contains no video tracks"];
      v103 = v66;
      v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v103 forKeys:&v102 count:1];
      [v39 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v20];
      BOOL v37 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_77:

      goto LABEL_78;
    }
    BOOL v37 = 0;
LABEL_79:

    goto LABEL_80;
  }
  if (a5)
  {
    v38 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v104 = *MEMORY[0x1E4F28568];
    uint64_t v10 = [NSString stringWithFormat:@"Failed to load asset"];
    v105[0] = v10;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v105 forKeys:&v104 count:1];
    [v38 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v12];
    BOOL v37 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_79;
  }
  BOOL v37 = 0;
LABEL_81:

  return v37;
}

void __57__VCPVideoProcessor__analyzeWithStart_andDuration_error___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) progressHandler];
  if (v2)
  {
    v3 = *(void **)(a1 + 40);
    v4 = *(CMTime **)(*(void *)(a1 + 48) + 8);
    if (v3)
    {
      [v3 timeRange];
    }
    else
    {
      memset(v10, 0, sizeof(v10));
      long long v9 = 0u;
    }
    CMTime lhs = v4[2];
    *(_OWORD *)&rhs.value = v9;
    rhs.epoch = *(void *)&v10[0];
    CMTimeSubtract(&time, &lhs, &rhs);
    double Seconds = CMTimeGetSeconds(&time);
    id v6 = *(void **)(a1 + 40);
    if (v6)
    {
      [v6 timeRange];
    }
    else
    {
      memset(v10, 0, sizeof(v10));
      long long v9 = 0u;
    }
    CMTime v8 = *(CMTime *)((char *)v10 + 8);
    Float64 v7 = CMTimeGetSeconds(&v8);
    v2[2](v2, Seconds / v7);
  }
}

- (BOOL)analyzeWithStart:(id *)a3 andDuration:(id *)a4 error:(id *)a5
{
  long long v9 = (void *)MEMORY[0x1C186D320](self, a2);
  $3CC8671D27C23BF42ADDB32F2B5E48AE v25 = *a3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v24 = *a4;
  id v23 = 0;
  BOOL v10 = [(VCPVideoProcessor *)self _analyzeWithStart:&v25 andDuration:&v24 error:&v23];
  id v11 = v23;
  if (v10)
  {
    BOOL v12 = 1;
  }
  else
  {
    v13 = [(NSDictionary *)self->_decoderSettings objectForKeyedSubscript:*MEMORY[0x1E4F16270]];

    if (v13)
    {
      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        v14 = VCPLogInstance();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BBEDA000, v14, OS_LOG_TYPE_DEFAULT, "Attempting second pass decoding via VTDecompressionSession", buf, 2u);
        }
      }
      self->_requiresSyncFrameDetectionFromNalUnit = 1;
      long long v20 = *(_OWORD *)&a3->var0;
      int64_t var3 = a3->var3;
      long long v18 = *(_OWORD *)&a4->var0;
      int64_t v19 = a4->var3;
      id v17 = v11;
      BOOL v12 = [(VCPVideoProcessor *)self _analyzeWithStart:&v20 andDuration:&v18 error:&v17];
      id v15 = v17;

      id v11 = v15;
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  if (a5 && v11) {
    *a5 = (id)[v11 copy];
  }

  return v12;
}

- (BOOL)analyzeWithError:(id *)a3
{
  long long v6 = *MEMORY[0x1E4F1FA48];
  uint64_t v7 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  long long v4 = *MEMORY[0x1E4F1FA10];
  uint64_t v5 = *(void *)(MEMORY[0x1E4F1FA10] + 16);
  return [(VCPVideoProcessor *)self analyzeWithStart:&v6 andDuration:&v4 error:a3];
}

- (void)cancel
{
}

- (id)progressHandler
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setProgressHandler:(id)a3
{
}

- (double)videoDuration
{
  return self->_videoDuration;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_syncFrameDecoder, 0);
  objc_storeStrong((id *)&self->_decoderSettings, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end