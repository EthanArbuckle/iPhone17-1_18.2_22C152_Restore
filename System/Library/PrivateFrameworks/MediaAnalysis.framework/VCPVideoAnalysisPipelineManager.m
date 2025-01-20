@interface VCPVideoAnalysisPipelineManager
- (VCPVideoAnalysisPipelineManager)initWithVideoAnalysisBlocks:(id)a3 videoDecoder:(id)a4 maxBufferedFrames:(unint64_t)a5 cancelBlock:(id)a6;
- (id)lastFrameResource;
- (id)nextFrameResource;
- (int)addFrameResource:(id)a3;
- (int)manageFrameResources;
- (int)run;
- (unint64_t)flags;
- (void)executeDecode;
- (void)executePipelineStageAt:(unint64_t)a3 currentFrameResource:(id)a4 nextFrameSample:(opaqueCMSampleBuffer *)a5;
- (void)flushFrameResources;
- (void)setFlags:(unint64_t)a3;
@end

@implementation VCPVideoAnalysisPipelineManager

- (VCPVideoAnalysisPipelineManager)initWithVideoAnalysisBlocks:(id)a3 videoDecoder:(id)a4 maxBufferedFrames:(unint64_t)a5 cancelBlock:(id)a6
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v44 = a3;
  id v43 = a4;
  id aBlock = a6;
  v45.receiver = self;
  v45.super_class = (Class)VCPVideoAnalysisPipelineManager;
  v11 = [(VCPVideoAnalysisPipelineManager *)&v45 init];
  if (!v11) {
    goto LABEL_17;
  }
  uint64_t v12 = [NSString stringWithFormat:@"[%@]", objc_opt_class()];
  logPrefix = v11->_logPrefix;
  v11->_logPrefix = (NSString *)v12;

  if (!v43)
  {
    if ((int)MediaAnalysisLogLevel() < 3) {
      goto LABEL_17;
    }
    v16 = VCPLogInstance();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    v21 = v11->_logPrefix;
    *(_DWORD *)buf = 138412290;
    v47 = v21;
    v18 = "%@ video decoder can not be nil.";
LABEL_14:
    v19 = v16;
    uint32_t v20 = 12;
    goto LABEL_15;
  }
  if (![v44 count])
  {
    if ((int)MediaAnalysisLogLevel() < 3) {
      goto LABEL_17;
    }
    v16 = VCPLogInstance();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    v22 = v11->_logPrefix;
    *(_DWORD *)buf = 138412290;
    v47 = v22;
    v18 = "%@ empty analysis blocks.";
    goto LABEL_14;
  }
  uint64_t v14 = [v44 count];
  int v15 = v14 + 1;
  if (v14 + 1 <= a5)
  {
    atomic_store(0, (unsigned int *)&v11->_err);
    v11->_flags = 0;
    objc_storeStrong((id *)&v11->_decoder, a4);
    v11->_decodeDone = 0;
    v24 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    frameResources = v11->_frameResources;
    v11->_frameResources = v24;

    v11->_maxBufferedFrames = a5;
    objc_storeStrong((id *)&v11->_pipelineBlocks, a3);
    v26 = _Block_copy(aBlock);
    id cancelBlock = v11->_cancelBlock;
    v11->_id cancelBlock = v26;

    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v28 = [NSString stringWithFormat:@"%@.", objc_opt_class()];
    id v29 = [v28 stringByAppendingString:@"Decode"];
    dispatch_queue_t v30 = dispatch_queue_create((const char *)[v29 UTF8String], v16);
    decodeQueue = v11->_decodeQueue;
    v11->_decodeQueue = (OS_dispatch_queue *)v30;

    v32 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pipelineQueues = v11->_pipelineQueues;
    v11->_pipelineQueues = v32;

    for (unint64_t i = 0; i < [(NSArray *)v11->_pipelineBlocks count]; ++i)
    {
      v35 = objc_msgSend(NSString, "stringWithFormat:", @"Stage-%lu", i);
      v36 = v11->_pipelineQueues;
      id v37 = [v28 stringByAppendingString:v35];
      dispatch_queue_t v38 = dispatch_queue_create((const char *)[v37 UTF8String], v16);
      [(NSMutableArray *)v36 addObject:v38];
    }
    dispatch_group_t v39 = dispatch_group_create();
    group = v11->_group;
    v11->_group = (OS_dispatch_group *)v39;

    v23 = v11;
    goto LABEL_22;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v16 = VCPLogInstance();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = v11->_logPrefix;
      *(_DWORD *)buf = 138412802;
      v47 = v17;
      __int16 v48 = 1024;
      int v49 = a5;
      __int16 v50 = 1024;
      int v51 = v15;
      v18 = "%@ maxBufferedFrames %u < pipelineDepth %u";
      v19 = v16;
      uint32_t v20 = 24;
LABEL_15:
      _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_ERROR, v18, buf, v20);
    }
LABEL_16:
    v23 = 0;
LABEL_22:

    goto LABEL_23;
  }
LABEL_17:
  v23 = 0;
LABEL_23:

  return v23;
}

- (void)flushFrameResources
{
  for (unint64_t i = self->_frameResources; [(NSMutableArray *)i count]; unint64_t i = self->_frameResources)
  {
    v4 = [(NSMutableArray *)self->_frameResources objectAtIndex:0];
    self->_flags |= [v4 frameFlags];
    [(NSMutableArray *)self->_frameResources removeObjectAtIndex:0];
  }
}

- (int)manageFrameResources
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableArray *)self->_frameResources count] >= self->_maxBufferedFrames)
  {
    v3 = [(NSMutableArray *)self->_frameResources objectAtIndex:0];
    self->_flags |= [v3 frameFlags];
    [(NSMutableArray *)self->_frameResources removeObjectAtIndex:0];
  }
  if ([(NSMutableArray *)self->_frameResources count] < self->_maxBufferedFrames) {
    return 0;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v5 = VCPLogInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      logPrefix = self->_logPrefix;
      int v7 = [(NSMutableArray *)self->_frameResources count];
      int v8 = 138412546;
      v9 = logPrefix;
      __int16 v10 = 1024;
      int v11 = v7;
      _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_ERROR, "%@ total buffered %u frames exceeding capacity.", (uint8_t *)&v8, 0x12u);
    }
  }
  return -18;
}

- (id)nextFrameResource
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = [(VCPVideoTrackDecoder *)self->_decoder copyNextSampleBuffer];
  if (v3)
  {
    v4 = [[VCPVideoAnalysisPipelineFrameResource alloc] initWithSampleBuffer:v3];
  }
  else
  {
    self->_decodeDone = 1;
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v5 = VCPLogInstance();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        logPrefix = self->_logPrefix;
        int v8 = 138412290;
        v9 = logPrefix;
        _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_DEBUG, "%@ frame decoding finished.", (uint8_t *)&v8, 0xCu);
      }
    }
    v4 = 0;
  }
  return v4;
}

- (id)lastFrameResource
{
  v3 = (void *)[(NSMutableArray *)self->_frameResources count];
  if (v3)
  {
    v3 = [(NSMutableArray *)self->_frameResources lastObject];
  }
  return v3;
}

- (int)addFrameResource:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSMutableArray *)self->_frameResources count] >= self->_maxBufferedFrames)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v6 = VCPLogInstance();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        logPrefix = self->_logPrefix;
        int v8 = [(NSMutableArray *)self->_frameResources count];
        int v10 = 138412546;
        int v11 = logPrefix;
        __int16 v12 = 1024;
        int v13 = v8;
        _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_ERROR, "%@ total buffered %u frames exceeding capacity.", (uint8_t *)&v10, 0x12u);
      }
    }
    int v5 = -18;
  }
  else
  {
    [(NSMutableArray *)self->_frameResources addObject:v4];
    int v5 = 0;
  }

  return v5;
}

- (void)executeDecode
{
  v3 = VCPSignPostLog();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  int v5 = VCPSignPostLog();
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "VCPVideoAnalysisPipelineManager_ExecuteDecode", "", buf, 2u);
  }

  if (!atomic_load((unsigned int *)&self->_err))
  {
    id cancelBlock = (unsigned int (**)(void))self->_cancelBlock;
    if (cancelBlock && cancelBlock[2]())
    {
      atomic_store(0xFFFFFF80, (unsigned int *)&self->_err);
    }
    else if (!self->_decodeDone)
    {
      unsigned int v9 = [(VCPVideoAnalysisPipelineManager *)self manageFrameResources];
      if (v9)
      {
        atomic_store(v9, (unsigned int *)&self->_err);
      }
      else
      {
        int v10 = [(VCPVideoAnalysisPipelineManager *)self lastFrameResource];
        int v11 = [(VCPVideoAnalysisPipelineManager *)self nextFrameResource];
        if (v11 && (unsigned int v12 = [(VCPVideoAnalysisPipelineManager *)self addFrameResource:v11]) != 0)
        {
          atomic_store(v12, (unsigned int *)&self->_err);
        }
        else
        {
          if (v10)
          {
            group = self->_group;
            uint64_t v14 = [(NSMutableArray *)self->_pipelineQueues objectAtIndex:0];
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __48__VCPVideoAnalysisPipelineManager_executeDecode__block_invoke;
            block[3] = &unk_1E6299338;
            block[4] = self;
            id v18 = v10;
            id v19 = v11;
            dispatch_group_async(group, v14, block);
          }
          int v15 = VCPSignPostLog();
          v16 = v15;
          if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v16, OS_SIGNPOST_INTERVAL_END, v4, "VCPVideoAnalysisPipelineManager_ExecuteDecode", "", buf, 2u);
          }
        }
      }
    }
  }
}

uint64_t __48__VCPVideoAnalysisPipelineManager_executeDecode__block_invoke(void *a1)
{
  v1 = (void *)a1[4];
  uint64_t v2 = a1[5];
  v3 = (void *)a1[6];
  if (v3) {
    uint64_t v4 = [v3 frameSampleBuffer];
  }
  else {
    uint64_t v4 = 0;
  }
  return [v1 executePipelineStageAt:0 currentFrameResource:v2 nextFrameSample:v4];
}

- (void)executePipelineStageAt:(unint64_t)a3 currentFrameResource:(id)a4 nextFrameSample:(opaqueCMSampleBuffer *)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  unsigned int v9 = VCPSignPostLog();
  os_signpost_id_t v10 = os_signpost_id_generate(v9);

  int v11 = VCPSignPostLog();
  unsigned int v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_DWORD *)buf = 67109120;
    int v29 = a3;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "VCPVideoAnalysisPipelineManager_ExecuteStage", "-%u", buf, 8u);
  }

  if (!atomic_load((unsigned int *)&self->_err))
  {
    id cancelBlock = (unsigned int (**)(void))self->_cancelBlock;
    if (cancelBlock && cancelBlock[2]())
    {
      atomic_store(0xFFFFFF80, (unsigned int *)&self->_err);
    }
    else
    {
      int v15 = [(NSArray *)self->_pipelineBlocks objectAtIndex:a3];
      unsigned int v16 = ((uint64_t (**)(void, id, opaqueCMSampleBuffer *))v15)[2](v15, v8, a5);

      if (v16)
      {
        atomic_store(v16, (unsigned int *)&self->_err);
      }
      else
      {
        unint64_t v17 = (a3 + 1) % [(NSArray *)self->_pipelineBlocks count];
        group = self->_group;
        if (v17)
        {
          id v19 = [(NSMutableArray *)self->_pipelineQueues objectAtIndex:v17];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __95__VCPVideoAnalysisPipelineManager_executePipelineStageAt_currentFrameResource_nextFrameSample___block_invoke_2;
          block[3] = &unk_1E629B698;
          block[4] = self;
          unint64_t v25 = v17;
          id v24 = v8;
          v26 = a5;
          dispatch_group_async(group, v19, block);
        }
        else
        {
          decodeQueue = self->_decodeQueue;
          v27[0] = MEMORY[0x1E4F143A8];
          v27[1] = 3221225472;
          v27[2] = __95__VCPVideoAnalysisPipelineManager_executePipelineStageAt_currentFrameResource_nextFrameSample___block_invoke;
          v27[3] = &unk_1E6296FF8;
          v27[4] = self;
          dispatch_group_async(group, decodeQueue, v27);
        }
        v21 = VCPSignPostLog();
        v22 = v21;
        if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
        {
          *(_DWORD *)buf = 67109120;
          int v29 = a3;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v22, OS_SIGNPOST_INTERVAL_END, v10, "VCPVideoAnalysisPipelineManager_ExecuteStage", "-%u", buf, 8u);
        }
      }
    }
  }
}

uint64_t __95__VCPVideoAnalysisPipelineManager_executePipelineStageAt_currentFrameResource_nextFrameSample___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) executeDecode];
}

uint64_t __95__VCPVideoAnalysisPipelineManager_executePipelineStageAt_currentFrameResource_nextFrameSample___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) executePipelineStageAt:*(void *)(a1 + 48) currentFrameResource:*(void *)(a1 + 40) nextFrameSample:*(void *)(a1 + 56)];
}

- (int)run
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = VCPSignPostLog();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  int v5 = VCPSignPostLog();
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "VCPVideoAnalysisPipelineManager_Run", "", buf, 2u);
  }

  if (self->_maxBufferedFrames)
  {
    unint64_t v7 = 0;
    uint64_t v8 = MEMORY[0x1E4F143A8];
    do
    {
      group = self->_group;
      decodeQueue = self->_decodeQueue;
      block[0] = v8;
      block[1] = 3221225472;
      block[2] = __38__VCPVideoAnalysisPipelineManager_run__block_invoke;
      block[3] = &unk_1E6296FF8;
      block[4] = self;
      dispatch_group_async(group, decodeQueue, block);
      ++v7;
    }
    while (v7 < self->_maxBufferedFrames);
  }
  dispatch_group_wait((dispatch_group_t)self->_group, 0xFFFFFFFFFFFFFFFFLL);
  if (!atomic_load((unsigned int *)&self->_err))
  {
    if ([(VCPVideoTrackDecoder *)self->_decoder status] == 2)
    {
      [(VCPVideoAnalysisPipelineManager *)self flushFrameResources];
      int v15 = VCPSignPostLog();
      int v13 = v15;
      if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v13, OS_SIGNPOST_INTERVAL_END, v4, "VCPVideoAnalysisPipelineManager_Run", "", buf, 2u);
      }
      int v12 = 0;
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 3) {
        return -19;
      }
      int v13 = VCPLogInstance();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        logPrefix = self->_logPrefix;
        *(_DWORD *)buf = 138412290;
        uint32_t v20 = logPrefix;
        _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_ERROR, "%@ video decoder read err.", buf, 0xCu);
      }
      int v12 = -19;
    }
    goto LABEL_20;
  }
  int v12 = atomic_load((unsigned int *)&self->_err);
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    int v13 = VCPLogInstance();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = self->_logPrefix;
      *(_DWORD *)buf = 138412546;
      uint32_t v20 = v14;
      __int16 v21 = 1024;
      int v22 = v12;
      _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_ERROR, "%@ Pipeline execution err: %d.", buf, 0x12u);
    }
LABEL_20:
  }
  return v12;
}

uint64_t __38__VCPVideoAnalysisPipelineManager_run__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) executeDecode];
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logPrefix, 0);
  objc_storeStrong(&self->_cancelBlock, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_pipelineQueues, 0);
  objc_storeStrong((id *)&self->_decodeQueue, 0);
  objc_storeStrong((id *)&self->_pipelineBlocks, 0);
  objc_storeStrong((id *)&self->_frameResources, 0);
  objc_storeStrong((id *)&self->_decoder, 0);
}

@end