@interface VCPVideoProcessorSession
- (BOOL)addFrameProcessingRequest:(id)a3 withConfiguration:(id)a4 error:(id *)a5;
- (BOOL)addRequest:(id)a3 withConfiguration:(id)a4 error:(id *)a5;
- (BOOL)allRequestsFinished;
- (BOOL)flushWithEndTime:(id *)a3 error:(id *)a4;
- (BOOL)processSampleBuffer:(opaqueCMSampleBuffer *)a3 error:(id *)a4;
- (BOOL)processSampleBuffer:(opaqueCMSampleBuffer *)a3 withEndTime:(id *)a4 error:(id *)a5;
- (BOOL)removeRequest:(id)a3 error:(id *)a4;
- (BOOL)shouldProcessSampleWithTimeRange:(id *)a3 atSamplingInterval:(id *)a4;
- (VCPVideoProcessorSession)init;
- (id).cxx_construct;
- (unsigned)orientation;
- (void)setOrientation:(unsigned int)a3;
@end

@implementation VCPVideoProcessorSession

- (VCPVideoProcessorSession)init
{
  v10.receiver = self;
  v10.super_class = (Class)VCPVideoProcessorSession;
  v2 = [(VCPVideoProcessorSession *)&v10 init];
  v3 = v2;
  if (v2)
  {
    v2->_orientation = 1;
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.mediaanalysis.VCPVideoProcessorSession", 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    nodes = v3->_nodes;
    v3->_nodes = (NSMutableArray *)v6;

    uint64_t v8 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)(&v3->_modified + 4) = *MEMORY[0x1E4F1F9F8];
    *(void *)&v3->_startTime.flags = *(void *)(v8 + 16);
  }
  return v3;
}

- (BOOL)addRequest:(id)a3 withConfiguration:(id)a4 error:(id *)a5
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  objc_super v10 = [v8 completionHandler];

  if (!v10)
  {
    if (!a5) {
      goto LABEL_7;
    }
    v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = *MEMORY[0x1E4F28568];
    v13 = [NSString stringWithFormat:@"Video processing requests must have completion handler"];
    v26[0] = v13;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
    *a5 = [v12 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v14];

LABEL_6:
    LOBYTE(a5) = 0;
    goto LABEL_7;
  }
  if (!+[VCPVideoProcessorNode validateConfiguration:v9 withError:a5])goto LABEL_6; {
  uint64_t v21 = 0;
  }
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 1;
  queue = self->_queue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __63__VCPVideoProcessorSession_addRequest_withConfiguration_error___block_invoke;
  v16[3] = &unk_1E62986E8;
  v16[4] = self;
  v19 = &v21;
  v20 = a5;
  id v17 = v8;
  id v18 = v9;
  dispatch_sync(queue, v16);
  LOBYTE(a5) = *((unsigned char *)v22 + 24) != 0;

  _Block_object_dispose(&v21, 8);
LABEL_7:

  return (char)a5;
}

void __63__VCPVideoProcessorSession_addRequest_withConfiguration_error___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v15 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "request", (void)v14);
        BOOL v7 = v6 == *(void **)(a1 + 40);

        if (v7)
        {
          if (*(void *)(a1 + 64))
          {
            id v8 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v20 = *MEMORY[0x1E4F28568];
            id v9 = [NSString stringWithFormat:@"Specified request already active; cannot add"];
            uint64_t v21 = v9;
            objc_super v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
            **(void **)(a1 + 64) = [v8 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v10];
          }
          goto LABEL_13;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v22 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

  id v2 = +[VCPVideoProcessorNode nodeWithRequest:*(void *)(a1 + 40) andConfiguration:*(void *)(a1 + 48)];
  if (v2)
  {
    [*(id *)(*(void *)(a1 + 32) + 16) addObject:v2];
    *(unsigned char *)(*(void *)(a1 + 32) + 24) = 1;
  }
  else
  {
    if (*(void *)(a1 + 64))
    {
      v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v18 = *MEMORY[0x1E4F28568];
      v12 = [NSString stringWithFormat:@"Failed to create request with specified configuration"];
      v19 = v12;
      v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      **(void **)(a1 + 64) = [v11 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v13];
    }
LABEL_13:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
}

- (BOOL)removeRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 1;
  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__VCPVideoProcessorSession_removeRequest_error___block_invoke;
  v10[3] = &unk_1E6298480;
  v10[4] = self;
  id v11 = v6;
  v12 = &v14;
  v13 = a4;
  id v8 = v6;
  dispatch_sync(queue, v10);
  LOBYTE(self) = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return (char)self;
}

void __48__VCPVideoProcessorSession_removeRequest_error___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v14;
LABEL_3:
    uint64_t v5 = 0;
    while (1)
    {
      if (*(void *)v14 != v4) {
        objc_enumerationMutation(v2);
      }
      id v6 = *(void **)(*((void *)&v13 + 1) + 8 * v5);
      BOOL v7 = objc_msgSend(v6, "request", (void)v13);
      BOOL v8 = v7 == *(void **)(a1 + 40);

      if (v8) {
        break;
      }
      if (v3 == ++v5)
      {
        uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v19 count:16];
        if (v3) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v9 = v6;

    if (!v9) {
      goto LABEL_12;
    }
    [*(id *)(*(void *)(a1 + 32) + 16) removeObject:v9];
    *(unsigned char *)(*(void *)(a1 + 32) + 24) = 1;
  }
  else
  {
LABEL_9:

LABEL_12:
    if (*(void *)(a1 + 56))
    {
      objc_super v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = *MEMORY[0x1E4F28568];
      id v11 = [NSString stringWithFormat:@"Specified request not found; cannot remove"];
      uint64_t v18 = v11;
      v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      **(void **)(a1 + 56) = [v10 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v12];
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
}

- (BOOL)addFrameProcessingRequest:(id)a3 withConfiguration:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (+[VCPVideoProcessorNode validateConfiguration:v9 withError:a5])
  {
    uint64_t v19 = 0;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x2020000000;
    char v22 = 1;
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __78__VCPVideoProcessorSession_addFrameProcessingRequest_withConfiguration_error___block_invoke;
    block[3] = &unk_1E6298710;
    id v16 = v8;
    uint64_t v17 = &v19;
    uint64_t v18 = a5;
    id v14 = v9;
    long long v15 = self;
    dispatch_sync(queue, block);
    BOOL v11 = *((unsigned char *)v20 + 24) != 0;

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

void __78__VCPVideoProcessorSession_addFrameProcessingRequest_withConfiguration_error___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = +[VCPVideoProcessorNode nodeWithFrameProcessor:*(void *)(a1 + 48) andConfiguration:*(void *)(a1 + 32)];
  if (v2)
  {
    [*(id *)(*(void *)(a1 + 40) + 16) addObject:v2];
    *(unsigned char *)(*(void *)(a1 + 40) + 24) = 1;
  }
  else
  {
    if (*(void *)(a1 + 64))
    {
      uint64_t v3 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v6 = *MEMORY[0x1E4F28568];
      uint64_t v4 = [NSString stringWithFormat:@"Failed to create video processor node with specified configuration"];
      v7[0] = v4;
      uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
      **(void **)(a1 + 64) = [v3 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v5];
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
}

- (BOOL)shouldProcessSampleWithTimeRange:(id *)a3 atSamplingInterval:(id *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  memset(&v20, 0, sizeof(v20));
  long long v7 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range.start.epoch = v7;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
  CMTimeRangeGetEnd(&v20, &range);
  memset(&v18, 0, sizeof(v18));
  CMTime lhs = (CMTime)a3->var0;
  *(_OWORD *)&rhs.value = *(_OWORD *)(&self->_modified + 4);
  rhs.epoch = *(void *)&self->_startTime.flags;
  CMTimeSubtract(&v18, &lhs, &rhs);
  int32_t v8 = vcvtpd_s64_f64((double)a4->var1 * (double)v18.value / (double)(a4->var0 * v18.timescale));
  memset(&v17, 0, sizeof(v17));
  CMTime lhs = *(CMTime *)a4;
  CMTimeMultiply(&v21, &lhs, v8);
  *(_OWORD *)&lhs.value = *(_OWORD *)(&self->_modified + 4);
  lhs.epoch = *(void *)&self->_startTime.flags;
  CMTime rhs = v21;
  CMTimeAdd(&v17, &lhs, &rhs);
  CMTime lhs = v17;
  CMTime rhs = v20;
  unsigned int v9 = CMTimeCompare(&lhs, &rhs);
  if ((v9 & 0x80000000) != 0)
  {
    CMTime rhs = v17;
    CMTime v21 = (CMTime)*a4;
    CMTimeAdd(&lhs, &rhs, &v21);
    CMTime v17 = lhs;
    CMTime rhs = v20;
    if (CMTimeCompare(&lhs, &rhs) < 0 && (int)MediaAnalysisLogLevel() >= 4)
    {
      objc_super v10 = VCPLogInstance();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        $3CC8671D27C23BF42ADDB32F2B5E48AE v16 = *a4;
        Float64 Seconds = CMTimeGetSeconds((CMTime *)&v16);
        int64_t var0 = a3->var0.var0;
        int var1 = a3->var0.var1;
        LODWORD(lhs.value) = 134218496;
        *(Float64 *)((char *)&lhs.value + 4) = Seconds;
        LOWORD(lhs.flags) = 2048;
        *(void *)((char *)&lhs.flags + 2) = var0;
        HIWORD(lhs.epoch) = 1024;
        int v24 = var1;
        _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_DEFAULT, "Multiple sampling times (%0.1fs) intersect frame at %lld/%d", (uint8_t *)&lhs, 0x1Cu);
      }
    }
  }
  return v9 >> 31;
}

- (BOOL)allRequestsFinished
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = self->_nodes;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        if ((objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "finished", (void)v8) & 1) == 0)
        {
          BOOL v6 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  BOOL v6 = 1;
LABEL_11:

  return v6;
}

- (BOOL)processSampleBuffer:(opaqueCMSampleBuffer *)a3 withEndTime:(id *)a4 error:(id *)a5
{
  v96[1] = *MEMORY[0x1E4F143B8];
  if (!CMSampleBufferGetImageBuffer(a3))
  {
    if (a5)
    {
      id v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v95 = *MEMORY[0x1E4F28568];
      long long v15 = [NSString stringWithFormat:@"Sample buffer does not contain video frame"];
      v96[0] = v15;
      $3CC8671D27C23BF42ADDB32F2B5E48AE v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v96 forKeys:&v95 count:1];
      *a5 = [v14 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v16];

      LOBYTE(a5) = 0;
    }
    return (char)a5;
  }
  memset(&v87, 0, sizeof(v87));
  v57 = a3;
  CMSampleBufferGetPresentationTimeStamp(&start, a3);
  CMTime end = (CMTime)*a4;
  CMTimeRangeFromTimeToTime(&v87, &start, &end);
  uint64_t v79 = 0;
  v80 = &v79;
  uint64_t v81 = 0x3032000000;
  v82 = __Block_byref_object_copy__16;
  v83 = __Block_byref_object_dispose__16;
  id v84 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__VCPVideoProcessorSession_processSampleBuffer_withEndTime_error___block_invoke;
  block[3] = &unk_1E6297458;
  block[5] = &v79;
  void block[4] = self;
  dispatch_sync(queue, block);
  uint64_t v74 = 0;
  v75 = &v74;
  uint64_t v76 = 0x2020000000;
  char v77 = 0;
  long long v10 = [MEMORY[0x1E4F1CA48] array];
  id v11 = objc_alloc(MEMORY[0x1E4F45890]);
  uint64_t v12 = [(VCPVideoProcessorSession *)self orientation];
  v56 = (void *)[v11 initWithCMSampleBuffer:a3 orientation:v12 options:MEMORY[0x1E4F1CC08]];
  unint64_t frameCount = self->_frameCount;
  self->_unint64_t frameCount = frameCount + 1;
  if (*((unsigned char *)v75 + 24)) {
    goto LABEL_3;
  }
  unint64_t v58 = frameCount;
  do
  {
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id obj = (id)v80[5];
    uint64_t v17 = [obj countByEnumeratingWithState:&v70 objects:v94 count:16];
    if (!v17) {
      goto LABEL_54;
    }
    uint64_t v18 = *(void *)v71;
    while (2)
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v71 != v18) {
          objc_enumerationMutation(obj);
        }
        CMTime v20 = *(void **)(*((void *)&v70 + 1) + 8 * v19);
        if (([v10 containsObject:v20] & 1) == 0)
        {
          uint64_t v66 = 0;
          v67 = &v66;
          uint64_t v68 = 0x2020000000;
          char v69 = 0;
          CMTime v21 = self->_queue;
          v65[0] = MEMORY[0x1E4F143A8];
          v65[1] = 3221225472;
          v65[2] = __66__VCPVideoProcessorSession_processSampleBuffer_withEndTime_error___block_invoke_2;
          v65[3] = &unk_1E62982C0;
          v65[5] = v20;
          v65[6] = &v66;
          v65[4] = self;
          dispatch_sync(v21, v65);
          if (*((unsigned char *)v67 + 24)) {
            goto LABEL_14;
          }
          if ((unint64_t)[v20 frameInterval] >= 2 && v58 % objc_msgSend(v20, "frameInterval"))
          {
            if ((int)MediaAnalysisLogLevel() < 7) {
              goto LABEL_14;
            }
            char v22 = VCPLogInstance();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_21;
            }
          }
          else
          {
            if (v20) {
              [v20 timeInterval];
            }
            else {
              memset(&v64[48], 0, 24);
            }
            CMTime buf = *(CMTime *)&v64[48];
            CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
            if (!CMTimeCompare(&buf, &time2)) {
              goto LABEL_30;
            }
            *(CMTimeRange *)v64 = v87;
            if (v20) {
              [v20 timeInterval];
            }
            else {
              memset(v63, 0, sizeof(v63));
            }
            if (![(VCPVideoProcessorSession *)self shouldProcessSampleWithTimeRange:v64 atSamplingInterval:v63])
            {
              if ((int)MediaAnalysisLogLevel() < 7) {
                goto LABEL_14;
              }
              char v22 = VCPLogInstance();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
              {
LABEL_21:
                uint64_t v23 = [v20 typeDescription];
                LODWORD(buf.value) = 138413058;
                *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v23;
                LOWORD(buf.flags) = 2048;
                *(void *)((char *)&buf.flags + 2) = v58;
                HIWORD(buf.epoch) = 2048;
                *(void *)v91 = v87.start.value;
                *(_WORD *)&v91[8] = 1024;
                *(_DWORD *)&v91[10] = v87.start.timescale;
                _os_log_impl(&dword_1BBEDA000, v22, OS_LOG_TYPE_DEBUG, "%@ skipping sample %lld at %lld/%d", (uint8_t *)&buf, 0x26u);
              }
            }
            else
            {
LABEL_30:
              int v24 = [v20 frameLimit];
              BOOL v25 = v24 == 0;

              if (v25
                || (unint64_t v26 = [v20 processedFrameCount],
                    [v20 frameLimit],
                    v27 = objc_claimAutoreleasedReturnValue(),
                    LOBYTE(v26) = v26 < [v27 unsignedIntegerValue],
                    v27,
                    (v26 & 1) != 0))
              {
                LOBYTE(time2.value) = 0;
                v28 = [v20 frameProcessor];
                BOOL v29 = v28 == 0;

                if (v29)
                {
                  v35 = [v20 request];
                  BOOL v36 = v35 == 0;

                  if (v36)
                  {
                    if ((int)MediaAnalysisLogLevel() >= 3)
                    {
                      v50 = VCPLogInstance();
                      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
                      {
                        LOWORD(buf.value) = 0;
                        _os_log_impl(&dword_1BBEDA000, v50, OS_LOG_TYPE_ERROR, "A processor node must contain either a frame processor or a vision request!", (uint8_t *)&buf, 2u);
                      }
                    }
                    _Block_object_dispose(&v66, 8);

                    LOBYTE(a5) = 0;
                    goto LABEL_61;
                  }
                  v37 = [v20 request];
                  v89 = v37;
                  v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v89 count:1];
                  id v62 = 0;
                  char v39 = [v56 performRequests:v38 error:&v62];
                  id v30 = v62;

                  if ((v39 & 1) == 0 && (int)MediaAnalysisLogLevel() >= 4)
                  {
                    v40 = VCPLogInstance();
                    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
                    {
                      log = v40;
                      v52 = [v20 request];
                      v41 = (objc_class *)objc_opt_class();
                      NSStringFromClass(v41);
                      id v55 = (id)objc_claimAutoreleasedReturnValue();
                      CMTimeValue value = v87.start.value;
                      CMTimeScale timescale = v87.start.timescale;
                      v44 = [v30 description];
                      LODWORD(buf.value) = 138413058;
                      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v55;
                      LOWORD(buf.flags) = 2048;
                      *(void *)((char *)&buf.flags + 2) = value;
                      HIWORD(buf.epoch) = 1024;
                      *(_DWORD *)v91 = timescale;
                      *(_WORD *)&v91[4] = 2112;
                      *(void *)&v91[6] = v44;
                      v40 = log;
                      _os_log_impl(&dword_1BBEDA000, log, OS_LOG_TYPE_DEFAULT, "%@ failed for sample at %lld/%d (%@)", (uint8_t *)&buf, 0x26u);
                    }
                  }
                }
                else
                {
                  id v30 = [v20 frameProcessor];
                  (*((void (**)(id, opaqueCMSampleBuffer *, CMTime *))v30 + 2))(v30, v57, &time2);
                }

                objc_msgSend(v20, "setProcessedFrameCount:", objc_msgSend(v20, "processedFrameCount") + 1);
                if ((int)MediaAnalysisLogLevel() >= 7)
                {
                  v45 = VCPLogInstance();
                  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
                  {
                    v46 = [v20 typeDescription];
                    LODWORD(buf.value) = 138413058;
                    *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v46;
                    LOWORD(buf.flags) = 2048;
                    *(void *)((char *)&buf.flags + 2) = v58;
                    HIWORD(buf.epoch) = 2048;
                    *(void *)v91 = v87.start.value;
                    *(_WORD *)&v91[8] = 1024;
                    *(_DWORD *)&v91[10] = v87.start.timescale;
                    _os_log_impl(&dword_1BBEDA000, v45, OS_LOG_TYPE_DEBUG, "%@ processed sample %llu at %lld/%d", (uint8_t *)&buf, 0x26u);
                  }
                }
                [v10 addObject:v20];
                if (LOBYTE(time2.value))
                {
                  v47 = self->_queue;
                  v61[0] = MEMORY[0x1E4F143A8];
                  v61[1] = 3221225472;
                  v61[2] = __66__VCPVideoProcessorSession_processSampleBuffer_withEndTime_error___block_invoke_24;
                  v61[3] = &unk_1E62982E8;
                  v61[4] = self;
                  v61[5] = v20;
                  dispatch_sync(v47, v61);
                }
                goto LABEL_14;
              }
              if ((int)MediaAnalysisLogLevel() < 7)
              {
LABEL_14:
                _Block_object_dispose(&v66, 8);
                goto LABEL_15;
              }
              char v22 = VCPLogInstance();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
              {
                v54 = [v20 typeDescription];
                CMTimeValue v31 = v87.start.value;
                CMTimeScale v32 = v87.start.timescale;
                v33 = [v20 frameLimit];
                uint64_t v34 = [v33 unsignedIntegerValue];
                LODWORD(buf.value) = 138413314;
                *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v54;
                LOWORD(buf.flags) = 2048;
                *(void *)((char *)&buf.flags + 2) = v58;
                HIWORD(buf.epoch) = 2048;
                *(void *)v91 = v31;
                *(_WORD *)&v91[8] = 1024;
                *(_DWORD *)&v91[10] = v32;
                __int16 v92 = 2048;
                uint64_t v93 = v34;
                _os_log_impl(&dword_1BBEDA000, v22, OS_LOG_TYPE_DEBUG, "%@ skipping sample %llu at %lld/%d due to frame process limit %llu reached", (uint8_t *)&buf, 0x30u);
              }
            }
          }

          goto LABEL_14;
        }
LABEL_15:
        ++v19;
      }
      while (v17 != v19);
      uint64_t v48 = [obj countByEnumeratingWithState:&v70 objects:v94 count:16];
      uint64_t v17 = v48;
      if (v48) {
        continue;
      }
      break;
    }
LABEL_54:

    v49 = self->_queue;
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __66__VCPVideoProcessorSession_processSampleBuffer_withEndTime_error___block_invoke_2_25;
    v60[3] = &unk_1E6298738;
    v60[4] = self;
    v60[5] = &v79;
    v60[6] = &v74;
    dispatch_sync(v49, v60);
  }
  while (!*((unsigned char *)v75 + 24));
LABEL_3:
  LOBYTE(a5) = 1;
LABEL_61:

  _Block_object_dispose(&v74, 8);
  _Block_object_dispose(&v79, 8);

  return (char)a5;
}

void __66__VCPVideoProcessorSession_processSampleBuffer_withEndTime_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithArray:*(void *)(*(void *)(a1 + 32) + 16)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 0;
}

uint64_t __66__VCPVideoProcessorSession_processSampleBuffer_withEndTime_error___block_invoke_2(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(void *)(result + 32);
  if (*(unsigned char *)(v2 + 24))
  {
    result = [*(id *)(v2 + 16) containsObject:*(void *)(result + 40)];
    char v3 = result ^ 1;
  }
  else
  {
    char v3 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(v1 + 48) + 8) + 24) = v3;
  return result;
}

uint64_t __66__VCPVideoProcessorSession_processSampleBuffer_withEndTime_error___block_invoke_24(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 1;
  return result;
}

void __66__VCPVideoProcessorSession_processSampleBuffer_withEndTime_error___block_invoke_2_25(void *a1)
{
  uint64_t v2 = a1[4];
  if (*(unsigned char *)(v2 + 24))
  {
    uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithArray:*(void *)(v2 + 16)];
    uint64_t v4 = *(void *)(a1[5] + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    *(unsigned char *)(a1[4] + 24) = 0;
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
}

- (BOOL)processSampleBuffer:(opaqueCMSampleBuffer *)a3 error:(id *)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  if (CMSampleBufferGetImageBuffer(a3))
  {
    long long v7 = (void *)MEMORY[0x1C186D320]();
    p_nextSampleBuffer = &self->_nextSampleBuffer;
    CMTimeValue value = self->_nextSampleBuffer.value_;
    if (value) {
      CMTimeValue value = CFRetain(value);
    }
    uint64_t v19 = value;
    v18.CMTimeValue value = (CMTimeValue)CFRetain(a3);
    CF<__CVBuffer *>::operator=((const void **)&self->_nextSampleBuffer.value_, (const void **)&v18);
    CF<opaqueCMSampleBuffer *>::~CF((const void **)&v18);
    long long v10 = v19;
    if (v19)
    {
      CMSampleBufferGetPresentationTimeStamp(&v17, p_nextSampleBuffer->value_);
      id v16 = 0;
      BOOL v11 = [(VCPVideoProcessorSession *)self processSampleBuffer:v10 withEndTime:&v17 error:&v16];
      id v12 = v16;
    }
    else
    {
      CMSampleBufferGetPresentationTimeStamp(&v18, p_nextSampleBuffer->value_);
      BOOL v11 = 0;
      id v12 = 0;
      *(CMTime *)(&self->_modified + 4) = v18;
    }
    CF<opaqueCMSampleBuffer *>::~CF(&v19);
    if (v10)
    {
      if (a4 && v12) {
        *a4 = (id)[v12 copy];
      }
    }
    else
    {
      BOOL v11 = 1;
    }
  }
  else
  {
    if (!a4) {
      return 0;
    }
    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F28568];
    id v12 = [NSString stringWithFormat:@"Sample buffer must contain uncompressed video"];
    v21[0] = v12;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    *a4 = [v13 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v14];

    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)flushWithEndTime:(id *)a3 error:(id *)a4
{
  long long v7 = (void *)MEMORY[0x1C186D320](self, a2);
  CMTimeValue value = self->_nextSampleBuffer.value_;
  if (value)
  {
    CFTypeRef v9 = CFRetain(value);
    long long v10 = self->_nextSampleBuffer.value_;
    CMTime v18 = v9;
    if (v10)
    {
      CFRelease(v10);
      self->_nextSampleBuffer.value_ = 0;
      CFTypeRef v9 = v18;
    }
    if (v9)
    {
      long long v16 = *(_OWORD *)&a3->var0;
      int64_t var3 = a3->var3;
      id v15 = 0;
      BOOL v11 = [(VCPVideoProcessorSession *)self processSampleBuffer:v9 withEndTime:&v16 error:&v15];
      id v12 = v15;
      char v13 = 0;
      goto LABEL_9;
    }
    BOOL v11 = 0;
    id v12 = 0;
  }
  else
  {
    BOOL v11 = 0;
    id v12 = 0;
    CMTime v18 = 0;
  }
  char v13 = 1;
LABEL_9:
  CF<opaqueCMSampleBuffer *>::~CF(&v18);
  if (v13)
  {
    BOOL v11 = 1;
  }
  else if (a4 && v12)
  {
    *a4 = (id)[v12 copy];
  }

  return v11;
}

- (unsigned)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(unsigned int)a3
{
  self->_orientation = a3;
}

- (void).cxx_destruct
{
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_nextSampleBuffer.value_);
  objc_storeStrong((id *)&self->_nodes, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  return self;
}

@end