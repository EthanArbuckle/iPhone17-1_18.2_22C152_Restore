@interface MADHEVCAlphaSequenceWriter
+ (id)assetWriterWithURL:(id)a3;
- (MADHEVCAlphaSequenceWriter)initWithFrameCount:(unint64_t)a3;
- (id)finishWithEndTime:(id *)a3;
- (int)addPixelBuffer:(__CVBuffer *)a3 withTime:(id *)a4;
- (int)createAssetWriterInputWithFormatDescription:(opaqueCMFormatDescription *)a3;
- (opaqueCMSampleBuffer)popSample;
- (void)dealloc;
- (void)processMediaRequest;
- (void)pushSample:(opaqueCMSampleBuffer *)a3;
@end

@implementation MADHEVCAlphaSequenceWriter

- (MADHEVCAlphaSequenceWriter)initWithFrameCount:(unint64_t)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v40.receiver = self;
  v40.super_class = (Class)MADHEVCAlphaSequenceWriter;
  v3 = [(MADHEVCAlphaSequenceWriter *)&v40 init];
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E4F1CB10];
    v5 = NSTemporaryDirectory();
    v6 = [MEMORY[0x1E4F29128] UUID];
    v7 = [v6 UUIDString];
    v8 = [v7 stringByAppendingPathExtension:@".mov"];
    v9 = [v5 stringByAppendingPathComponent:v8];
    uint64_t v10 = [v4 fileURLWithPath:v9];
    url = v3->_url;
    v3->_url = (NSURL *)v10;

    v12 = [MEMORY[0x1E4F28CB8] defaultManager];
    v13 = [(NSURL *)v3->_url path];
    LODWORD(v6) = [v12 fileExistsAtPath:v13];

    if (v6)
    {
      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        v14 = VCPLogInstance();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = [(NSURL *)v3->_url path];
          *(_DWORD *)buf = 138412290;
          v42 = v15;
          _os_log_impl(&dword_1BBEDA000, v14, OS_LOG_TYPE_DEFAULT, "Removing existing file at path %@", buf, 0xCu);
        }
      }
      v16 = [(NSURL *)v3->_url path];
      id v39 = 0;
      char v17 = [v12 removeItemAtPath:v16 error:&v39];
      id v18 = v39;

      if ((v17 & 1) == 0)
      {
        if ((int)MediaAnalysisLogLevel() < 3)
        {
LABEL_21:

          v35 = 0;
          goto LABEL_22;
        }
        v19 = VCPLogInstance();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v20 = [(NSURL *)v3->_url path];
          v21 = [v18 description];
          *(_DWORD *)buf = 138412546;
          v42 = v20;
          __int16 v43 = 2112;
          v44 = v21;
          _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_ERROR, "Failed to remove existing file at path %@ (%@)", buf, 0x16u);
        }
LABEL_19:

        goto LABEL_21;
      }
    }
    else
    {
      id v18 = 0;
    }
    v22 = v3->_url;
    uint64_t v23 = *MEMORY[0x1E4F15AB0];
    id v38 = v18;
    uint64_t v24 = [MEMORY[0x1E4F163B8] assetWriterWithURL:v22 fileType:v23 error:&v38];
    id v25 = v38;

    writer = v3->_writer;
    v3->_writer = (AVAssetWriter *)v24;

    if (!v3->_writer)
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        id v18 = v25;
        goto LABEL_21;
      }
      v19 = VCPLogInstance();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v36 = [v25 description];
        *(_DWORD *)buf = 138412290;
        v42 = v36;
        _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_ERROR, "Failed to create asset writer (%@)", buf, 0xCu);
      }
      id v18 = v25;
      goto LABEL_19;
    }
    uint64_t v27 = [MEMORY[0x1E4F1CA48] array];
    sampleQueue = v3->_sampleQueue;
    v3->_sampleQueue = (NSMutableArray *)v27;

    dispatch_semaphore_t v29 = dispatch_semaphore_create(5);
    enqueueSemaphore = v3->_enqueueSemaphore;
    v3->_enqueueSemaphore = (OS_dispatch_semaphore *)v29;

    dispatch_semaphore_t v31 = dispatch_semaphore_create(0);
    dequeueSemaphore = v3->_dequeueSemaphore;
    v3->_dequeueSemaphore = (OS_dispatch_semaphore *)v31;

    dispatch_semaphore_t v33 = dispatch_semaphore_create(0);
    completionSemaphore = v3->_completionSemaphore;
    v3->_completionSemaphore = (OS_dispatch_semaphore *)v33;

    atomic_store(1u, (unsigned int *)&v3->_status);
  }
  v35 = v3;
LABEL_22:

  return v35;
}

+ (id)assetWriterWithURL:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithURL:v3];

  return v4;
}

- (void)dealloc
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = atomic_load((unsigned int *)&self->_status);
  if (v3 == 1)
  {
    long long v19 = *MEMORY[0x1E4F1F9F8];
    uint64_t v20 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    id v4 = [(MADHEVCAlphaSequenceWriter *)self finishWithEndTime:&v19];
  }
  while ([(NSMutableArray *)self->_sampleQueue count])
  {
    *(void *)buf = [(NSMutableArray *)self->_sampleQueue objectAtIndexedSubscript:0];

    [(NSMutableArray *)self->_sampleQueue removeObjectAtIndex:0];
    CF<opaqueCMSampleBuffer *>::~CF((const void **)buf);
  }
  v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  url = self->_url;
  if (url)
  {
    v7 = [(NSURL *)url path];
    int v8 = [v5 fileExistsAtPath:v7];

    if (v8)
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v9 = VCPLogInstance();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v10 = [(NSURL *)self->_url path];
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v10;
          _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_DEBUG, "Removing temporary file at path %@", buf, 0xCu);
        }
      }
      v11 = [(NSURL *)self->_url path];
      id v18 = 0;
      char v12 = [v5 removeItemAtPath:v11 error:&v18];
      id v13 = v18;

      if ((v12 & 1) == 0 && (int)MediaAnalysisLogLevel() >= 3)
      {
        v14 = VCPLogInstance();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v15 = self->_url;
          v16 = [v13 description];
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v15;
          __int16 v22 = 2112;
          uint64_t v23 = v16;
          _os_log_impl(&dword_1BBEDA000, v14, OS_LOG_TYPE_ERROR, "Failed to remove temporary file %@ (%@)", buf, 0x16u);
        }
      }
    }
  }

  v17.receiver = self;
  v17.super_class = (Class)MADHEVCAlphaSequenceWriter;
  [(MADHEVCAlphaSequenceWriter *)&v17 dealloc];
}

- (void)pushSample:(opaqueCMSampleBuffer *)a3
{
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_enqueueSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  if (a3)
  {
    v5 = self->_sampleQueue;
    objc_sync_enter(v5);
    [(NSMutableArray *)self->_sampleQueue addObject:a3];
    objc_sync_exit(v5);
  }
  dequeueSemaphore = self->_dequeueSemaphore;
  dispatch_semaphore_signal(dequeueSemaphore);
}

- (opaqueCMSampleBuffer)popSample
{
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_dequeueSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  unsigned int v3 = self->_sampleQueue;
  objc_sync_enter(v3);
  if ([(NSMutableArray *)self->_sampleQueue count])
  {
    id v4 = [(NSMutableArray *)self->_sampleQueue objectAtIndexedSubscript:0];

    [(NSMutableArray *)self->_sampleQueue removeObjectAtIndex:0];
  }
  else
  {
    id v4 = 0;
  }
  objc_sync_exit(v3);

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_enqueueSemaphore);
  return (opaqueCMSampleBuffer *)v4;
}

- (void)processMediaRequest
{
  if ([(AVAssetWriterInput *)self->_input isReadyForMoreMediaData])
  {
    while (1)
    {
      v6 = [(MADHEVCAlphaSequenceWriter *)self popSample];
      input = self->_input;
      if (!v6)
      {
        [(AVAssetWriterInput *)input markAsFinished];
        writer = self->_writer;
        v5[0] = MEMORY[0x1E4F143A8];
        v5[1] = 3221225472;
        v5[2] = __49__MADHEVCAlphaSequenceWriter_processMediaRequest__block_invoke;
        v5[3] = &unk_1E6296FF8;
        v5[4] = self;
        [(AVAssetWriter *)writer finishWritingWithCompletionHandler:v5];
        goto LABEL_8;
      }
      if (!-[AVAssetWriterInput appendSampleBuffer:](input, "appendSampleBuffer:")) {
        break;
      }
      CF<opaqueCMSampleBuffer *>::~CF((const void **)&v6);
      if (![(AVAssetWriterInput *)self->_input isReadyForMoreMediaData]) {
        return;
      }
    }
    atomic_store(3u, (unsigned int *)&self->_status);
    [(AVAssetWriter *)self->_writer cancelWriting];
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_completionSemaphore);
LABEL_8:
    CF<opaqueCMSampleBuffer *>::~CF((const void **)&v6);
  }
}

intptr_t __49__MADHEVCAlphaSequenceWriter_processMediaRequest__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 64));
}

- (int)createAssetWriterInputWithFormatDescription:(opaqueCMFormatDescription *)a3
{
  v26[4] = *MEMORY[0x1E4F143B8];
  CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions(a3);
  uint64_t v5 = *MEMORY[0x1E4F16220];
  v26[0] = *MEMORY[0x1E4F16238];
  uint64_t v6 = *MEMORY[0x1E4F16300];
  v25[0] = v5;
  v25[1] = v6;
  v7 = [NSNumber numberWithInt:Dimensions];
  v26[1] = v7;
  v25[2] = *MEMORY[0x1E4F162A0];
  int v8 = [NSNumber numberWithInt:HIDWORD(*(unint64_t *)&Dimensions)];
  v26[2] = v8;
  v25[3] = *MEMORY[0x1E4F16268];
  uint64_t v23 = *MEMORY[0x1E4F44B30];
  uint64_t v24 = &unk_1F15EAE28;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
  v26[3] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:4];

  v11 = [MEMORY[0x1E4F163C0] assetWriterInputWithMediaType:*MEMORY[0x1E4F15C18] outputSettings:v10];
  input = self->_input;
  self->_input = v11;

  if (!self->_input)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v14 = VCPLogInstance();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        objc_super v17 = "Failed to create asset writer input";
LABEL_10:
        _os_log_impl(&dword_1BBEDA000, v14, OS_LOG_TYPE_ERROR, v17, buf, 2u);
      }
LABEL_11:
      int v16 = -18;
      goto LABEL_12;
    }
LABEL_13:
    int v16 = -18;
    goto LABEL_14;
  }
  -[AVAssetWriter addInput:](self->_writer, "addInput:");
  if (![(AVAssetWriter *)self->_writer startWriting])
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v14 = VCPLogInstance();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        objc_super v17 = "Failed to start asset writer";
        goto LABEL_10;
      }
      goto LABEL_11;
    }
    goto LABEL_13;
  }
  writer = self->_writer;
  long long v20 = *MEMORY[0x1E4F1FA48];
  uint64_t v21 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  [(AVAssetWriter *)writer startSessionAtSourceTime:&v20];
  v14 = dispatch_queue_create("VCPSimpleMovieWriter.mediaDataRequest", 0);
  v15 = self->_input;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __74__MADHEVCAlphaSequenceWriter_createAssetWriterInputWithFormatDescription___block_invoke;
  v19[3] = &unk_1E6296FF8;
  v19[4] = self;
  [(AVAssetWriterInput *)v15 requestMediaDataWhenReadyOnQueue:v14 usingBlock:v19];
  int v16 = 0;
LABEL_12:

LABEL_14:
  return v16;
}

uint64_t __74__MADHEVCAlphaSequenceWriter_createAssetWriterInputWithFormatDescription___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) processMediaRequest];
}

- (int)addPixelBuffer:(__CVBuffer *)a3 withTime:(id *)a4
{
  if (!a3) {
    return -50;
  }
  unsigned int v5 = atomic_load((unsigned int *)&self->_status);
  if (v5 != 1) {
    return -18;
  }
  CMVideoFormatDescriptionRef formatDescriptionOut = 0;
  OSStatus v8 = CMVideoFormatDescriptionCreateForImageBuffer(0, a3, &formatDescriptionOut);
  if (!v8
    && (self->_input
     || (OSStatus v8 = [(MADHEVCAlphaSequenceWriter *)self createAssetWriterInputWithFormatDescription:formatDescriptionOut]) == 0))
  {
    *(_OWORD *)&sampleTiming.duration.value = *MEMORY[0x1E4F1F9F8];
    sampleTiming.duration.epoch = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    sampleTiming.presentationTimeStamp = (CMTime)*a4;
    sampleTiming.decodeTimeStamp = sampleTiming.duration;
    CMSampleBufferRef sampleBufferOut = 0;
    OSStatus v8 = CMSampleBufferCreateForImageBuffer(0, a3, 1u, 0, 0, formatDescriptionOut, &sampleTiming, &sampleBufferOut);
    if (!v8)
    {
      if (sampleBufferOut) {
        CFTypeRef v9 = CFRetain(sampleBufferOut);
      }
      else {
        CFTypeRef v9 = 0;
      }
      [(MADHEVCAlphaSequenceWriter *)self pushSample:v9];
    }
    CF<opaqueCMSampleBuffer *>::~CF((const void **)&sampleBufferOut);
  }
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&formatDescriptionOut);
  return v8;
}

- (id)finishWithEndTime:(id *)a3
{
  p_status = &self->_status;
  unsigned int v4 = atomic_load((unsigned int *)&self->_status);
  if (v4 == 1)
  {
    [(MADHEVCAlphaSequenceWriter *)self pushSample:0];
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_completionSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    atomic_store(2u, (unsigned int *)p_status);
    uint64_t v6 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:self->_url];
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionSemaphore, 0);
  objc_storeStrong((id *)&self->_dequeueSemaphore, 0);
  objc_storeStrong((id *)&self->_enqueueSemaphore, 0);
  objc_storeStrong((id *)&self->_sampleQueue, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_writer, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end