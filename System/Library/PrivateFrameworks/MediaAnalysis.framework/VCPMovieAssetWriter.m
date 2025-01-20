@interface VCPMovieAssetWriter
+ (VCPMovieAssetWriter)assetWriterWithURL:(id)a3 andTrack:(id)a4 andBitrate:(int64_t)a5 withOutputSize:(CGSize)a6 enableAudio:(BOOL)a7;
+ (VCPMovieAssetWriter)assetWriterWithURL:(id)a3 andTrack:(id)a4 andBitrate:(int64_t)a5 withOutputSize:(CGSize)a6 enableAudio:(BOOL)a7 enableStyle:(BOOL)a8 hasStyleApplied:(BOOL)a9;
- (VCPMovieAssetWriter)initWithURL:(id)a3 andTrack:(id)a4 andBitrate:(int64_t)a5 withOutputSize:(CGSize)a6 enableAudio:(BOOL)a7 enableStyle:(BOOL)a8 hasStyleApplied:(BOOL)a9;
- (id).cxx_construct;
- (int)addAdditionalAuxTracks:(opaqueCMSampleBuffer *)a3 toTrack:(id)a4;
- (int)addAuxPixelBuffer:(__CVBuffer *)a3 withTime:(id *)a4 withAttachment:(id)a5;
- (int)addLivePhotoInfoBuffer:(opaqueCMSampleBuffer *)a3;
- (int)addPixelBuffer:(__CVBuffer *)a3 withTime:(id *)a4 withAttachment:(id)a5;
- (int)addStyleInfoData:(id)a3 timerange:(id *)a4;
- (int)appendMetadataTrack;
- (int)copyPixelBuffer:(__CVBuffer *)a3 toPixelBuffer:(__CVBuffer *)a4;
- (int)dispatchEncoding;
- (int)finish;
- (int)passthroughAuxTrackFrom:(id)a3 to:(id)a4;
- (int)passthroughMetadataTrackFrom:(id)a3 to:(id)a4;
- (int)processLivePhotoInfoMetadataTrack;
- (int)processStillImageMetadataTrack;
- (int)setupAdditionalAuxTrack;
- (int)setupAudioTrack;
- (int)setupAuxTrack:(int64_t)a3 withOutputSize:(CGSize)a4;
- (int)setupMetadataTrack;
- (int)setupVideoTrack:(int64_t)a3 withOutputSize:(CGSize)a4;
- (int64_t)status;
- (opaqueCMSampleBuffer)popAuxSample;
- (opaqueCMSampleBuffer)popLivePhotoInfoSample;
- (opaqueCMSampleBuffer)popSample;
- (void)cancel;
- (void)dealloc;
- (void)pushAuxSample:(opaqueCMSampleBuffer *)a3;
- (void)pushLivePhotoInfoSample:(opaqueCMSampleBuffer *)a3;
- (void)pushSample:(opaqueCMSampleBuffer *)a3;
- (void)updateStillPTS:(id *)a3;
@end

@implementation VCPMovieAssetWriter

- (VCPMovieAssetWriter)initWithURL:(id)a3 andTrack:(id)a4 andBitrate:(int64_t)a5 withOutputSize:(CGSize)a6 enableAudio:(BOOL)a7 enableStyle:(BOOL)a8 hasStyleApplied:(BOOL)a9
{
  BOOL v9 = a9;
  BOOL v11 = a7;
  double height = a6.height;
  double width = a6.width;
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v81 = a4;
  v84.receiver = self;
  v84.super_class = (Class)VCPMovieAssetWriter;
  v18 = [(VCPMovieAssetWriter *)&v84 init];
  if (!v18) {
    goto LABEL_22;
  }
  int64_t v80 = a5;
  v19 = [MEMORY[0x1E4F28CB8] defaultManager];
  v20 = [v17 path];
  int v21 = [v19 fileExistsAtPath:v20];

  if (v21)
  {
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      v22 = VCPLogInstance();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = [v17 path];
        *(_DWORD *)buf = 138412290;
        v86 = v23;
        _os_log_impl(&dword_1BBEDA000, v22, OS_LOG_TYPE_DEFAULT, "Removing existing file at path %@", buf, 0xCu);
      }
    }
    v24 = [v17 path];
    id v83 = 0;
    char v25 = [v19 removeItemAtPath:v24 error:&v83];
    id v26 = v83;

    if ((v25 & 1) == 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v27 = VCPLogInstance();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v28 = [v17 path];
          v29 = [v26 description];
          *(_DWORD *)buf = 138412546;
          v86 = v28;
          __int16 v87 = 2112;
          v88 = v29;
          _os_log_impl(&dword_1BBEDA000, v27, OS_LOG_TYPE_ERROR, "Failed to remove existing file at path %@ (%@)", buf, 0x16u);
        }
LABEL_40:

        goto LABEL_41;
      }
      goto LABEL_41;
    }
  }
  else
  {
    id v26 = 0;
  }
  objc_storeStrong((id *)v18 + 6, a4);
  uint64_t v30 = [*((id *)v18 + 6) asset];
  v31 = (void *)*((void *)v18 + 1);
  *((void *)v18 + 1) = v30;

  uint64_t v32 = *MEMORY[0x1E4F15AB0];
  id v82 = v26;
  uint64_t v33 = [MEMORY[0x1E4F163B8] assetWriterWithURL:v17 fileType:v32 error:&v82];
  id v34 = v82;

  v35 = (void *)*((void *)v18 + 8);
  *((void *)v18 + 8) = v33;

  id v26 = v34;
  if (!*((void *)v18 + 8))
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v27 = VCPLogInstance();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v78 = [v34 description];
        *(_DWORD *)buf = 138412290;
        v86 = v78;
        _os_log_impl(&dword_1BBEDA000, v27, OS_LOG_TYPE_ERROR, "Failed to create asset writer (%@)", buf, 0xCu);
      }
      goto LABEL_40;
    }
    goto LABEL_41;
  }
  if (v11)
  {
    uint64_t v36 = objc_msgSend(*((id *)v18 + 1), "vcp_firstEnabledTrackWithMediaType:", *MEMORY[0x1E4F15BA8]);
    v37 = (void *)*((void *)v18 + 7);
    *((void *)v18 + 7) = v36;

    if (!*((void *)v18 + 7))
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v27 = VCPLogInstance();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BBEDA000, v27, OS_LOG_TYPE_ERROR, "Asset does not have an audio track", buf, 2u);
        }
        goto LABEL_40;
      }
LABEL_41:

      v77 = 0;
      goto LABEL_42;
    }
  }
  uint64_t v38 = [MEMORY[0x1E4F1CA48] array];
  v39 = (void *)*((void *)v18 + 15);
  *((void *)v18 + 15) = v38;

  uint64_t v40 = [MEMORY[0x1E4F1CA48] array];
  v41 = (void *)*((void *)v18 + 17);
  *((void *)v18 + 17) = v40;

  dispatch_semaphore_t v42 = dispatch_semaphore_create(5);
  v43 = (void *)*((void *)v18 + 19);
  *((void *)v18 + 19) = v42;

  dispatch_semaphore_t v44 = dispatch_semaphore_create(0);
  v45 = (void *)*((void *)v18 + 20);
  *((void *)v18 + 20) = v44;

  dispatch_semaphore_t v46 = dispatch_semaphore_create(5);
  v47 = (void *)*((void *)v18 + 23);
  *((void *)v18 + 23) = v46;

  dispatch_semaphore_t v48 = dispatch_semaphore_create(0);
  v49 = (void *)*((void *)v18 + 24);
  *((void *)v18 + 24) = v48;

  dispatch_group_t v50 = dispatch_group_create();
  v51 = (void *)*((void *)v18 + 18);
  *((void *)v18 + 18) = v50;

  *((void *)v18 + 30) = 1;
  uint64_t v52 = MEMORY[0x1E4F1F9F8];
  *(_OWORD *)(v18 + 264) = *MEMORY[0x1E4F1F9F8];
  *((void *)v18 + 35) = *(void *)(v52 + 16);
  v18[288] = v11;
  dispatch_queue_t v53 = dispatch_queue_create("com.apple.mediaanalysisd.movieassetwriter.status", 0);
  v54 = (void *)*((void *)v18 + 25);
  *((void *)v18 + 25) = v53;

  dispatch_queue_t v55 = dispatch_queue_create("com.apple.mediaanalysisd.movieassetwriter.mediaDataRequest.videoEncoding", 0);
  v56 = (void *)*((void *)v18 + 26);
  *((void *)v18 + 26) = v55;

  if (v18[288])
  {
    dispatch_queue_t v57 = dispatch_queue_create("com.apple.mediaanalysisd.movieassetwriter.mediaDataRequest.audioEncoding", 0);
    v58 = (void *)*((void *)v18 + 28);
    *((void *)v18 + 28) = v57;
  }
  dispatch_queue_t v59 = dispatch_queue_create("com.apple.mediaanalysisd.movieassetwriter.mediaDataRequest.metadataEncoding", 0);
  v60 = (void *)*((void *)v18 + 29);
  *((void *)v18 + 29) = v59;

  uint64_t v61 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  v62 = (void *)*((void *)v18 + 37);
  *((void *)v18 + 37) = v61;

  v18[289] = a8;
  v18[290] = v9;
  if (v9)
  {
    uint64_t v63 = [MEMORY[0x1E4F1CA48] array];
    v64 = (void *)*((void *)v18 + 16);
    *((void *)v18 + 16) = v63;

    dispatch_semaphore_t v65 = dispatch_semaphore_create(5);
    v66 = (void *)*((void *)v18 + 21);
    *((void *)v18 + 21) = v65;

    dispatch_semaphore_t v67 = dispatch_semaphore_create(0);
    v68 = (void *)*((void *)v18 + 22);
    *((void *)v18 + 22) = v67;

    dispatch_queue_t v69 = dispatch_queue_create("com.apple.mediaanalysisd.movieassetwriter.mediaDataRequest.auxEncoding", 0);
    v70 = (void *)*((void *)v18 + 27);
    *((void *)v18 + 27) = v69;
  }
  uint64_t v71 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  v72 = (void *)*((void *)v18 + 38);
  *((void *)v18 + 38) = v71;

  uint64_t v73 = [objc_alloc(MEMORY[0x1E4F16378]) initWithAsset:*((void *)v18 + 1) error:0];
  v74 = (void *)*((void *)v18 + 2);
  *((void *)v18 + 2) = v73;

  int v75 = objc_msgSend(v18, "setupVideoTrack:withOutputSize:", v80, width, height);
  if (!v75
    && (!v18[288] || (int v75 = [v18 setupAudioTrack]) == 0)
    && (!v18[289]
     || (!v18[290] || (int v75 = objc_msgSend(v18, "setupAuxTrack:withOutputSize:", v80, width, height)) == 0)
     && (int v75 = [v18 setupAdditionalAuxTrack]) == 0))
  {
    int v75 = [v18 setupMetadataTrack];
    if (!v75)
    {
      if ([*((id *)v18 + 2) startReading]) {
        int v75 = 0;
      }
      else {
        int v75 = -19;
      }
    }
  }

  if (v75) {
    v76 = 0;
  }
  else {
LABEL_22:
  }
    v76 = v18;
  v77 = v76;
LABEL_42:

  return v77;
}

+ (VCPMovieAssetWriter)assetWriterWithURL:(id)a3 andTrack:(id)a4 andBitrate:(int64_t)a5 withOutputSize:(CGSize)a6 enableAudio:(BOOL)a7
{
  BOOL v7 = a7;
  double height = a6.height;
  double width = a6.width;
  id v12 = a3;
  id v13 = a4;
  v14 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithURL:andTrack:andBitrate:withOutputSize:enableAudio:enableStyle:hasStyleApplied:", v12, v13, a5, v7, 0, 0, width, height);

  return (VCPMovieAssetWriter *)v14;
}

+ (VCPMovieAssetWriter)assetWriterWithURL:(id)a3 andTrack:(id)a4 andBitrate:(int64_t)a5 withOutputSize:(CGSize)a6 enableAudio:(BOOL)a7 enableStyle:(BOOL)a8 hasStyleApplied:(BOOL)a9
{
  BOOL v9 = a9;
  BOOL v10 = a8;
  BOOL v11 = a7;
  double height = a6.height;
  double width = a6.width;
  id v16 = a3;
  id v17 = a4;
  v18 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithURL:andTrack:andBitrate:withOutputSize:enableAudio:enableStyle:hasStyleApplied:", v16, v17, a5, v11, v10, v9, width, height);

  return (VCPMovieAssetWriter *)v18;
}

- (void)dealloc
{
  if (self->_status == 1) {
    [(VCPMovieAssetWriter *)self cancel];
  }
  while ([(NSMutableArray *)self->_sampleQueue count])
  {
    v4 = [(NSMutableArray *)self->_sampleQueue objectAtIndexedSubscript:0];

    [(NSMutableArray *)self->_sampleQueue removeObjectAtIndex:0];
    CF<opaqueCMSampleBuffer *>::~CF((const void **)&v4);
  }
  if (self->_hasStyleApplied)
  {
    while ([(NSMutableArray *)self->_auxsampleQueue count])
    {
      v4 = [(NSMutableArray *)self->_auxsampleQueue objectAtIndexedSubscript:0];

      [(NSMutableArray *)self->_auxsampleQueue removeObjectAtIndex:0];
      CF<opaqueCMSampleBuffer *>::~CF((const void **)&v4);
    }
  }
  while ([(NSMutableArray *)self->_livePhotoInfoQueue count])
  {
    v4 = [(NSMutableArray *)self->_livePhotoInfoQueue objectAtIndexedSubscript:0];

    [(NSMutableArray *)self->_livePhotoInfoQueue removeObjectAtIndex:0];
    CF<opaqueCMSampleBuffer *>::~CF((const void **)&v4);
  }
  v3.receiver = self;
  v3.super_class = (Class)VCPMovieAssetWriter;
  [(VCPMovieAssetWriter *)&v3 dealloc];
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
  objc_super v3 = self->_sampleQueue;
  objc_sync_enter(v3);
  if ([(NSMutableArray *)self->_sampleQueue count])
  {
    v4 = [(NSMutableArray *)self->_sampleQueue objectAtIndexedSubscript:0];

    [(NSMutableArray *)self->_sampleQueue removeObjectAtIndex:0];
  }
  else
  {
    v4 = 0;
  }
  objc_sync_exit(v3);

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_enqueueSemaphore);
  return (opaqueCMSampleBuffer *)v4;
}

- (void)pushAuxSample:(opaqueCMSampleBuffer *)a3
{
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_auxEnqueueSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  if (a3)
  {
    v5 = self->_auxsampleQueue;
    objc_sync_enter(v5);
    [(NSMutableArray *)self->_auxsampleQueue addObject:a3];
    objc_sync_exit(v5);
  }
  auxDequeueSemaphore = self->_auxDequeueSemaphore;
  dispatch_semaphore_signal(auxDequeueSemaphore);
}

- (opaqueCMSampleBuffer)popAuxSample
{
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_auxDequeueSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  objc_super v3 = self->_auxsampleQueue;
  objc_sync_enter(v3);
  if ([(NSMutableArray *)self->_auxsampleQueue count])
  {
    v4 = [(NSMutableArray *)self->_auxsampleQueue objectAtIndexedSubscript:0];

    [(NSMutableArray *)self->_auxsampleQueue removeObjectAtIndex:0];
  }
  else
  {
    v4 = 0;
  }
  objc_sync_exit(v3);

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_auxEnqueueSemaphore);
  return (opaqueCMSampleBuffer *)v4;
}

- (void)pushLivePhotoInfoSample:(opaqueCMSampleBuffer *)a3
{
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_livePhotoInfoEnqueueSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  if (a3)
  {
    v5 = self->_livePhotoInfoQueue;
    objc_sync_enter(v5);
    [(NSMutableArray *)self->_livePhotoInfoQueue addObject:a3];
    objc_sync_exit(v5);
  }
  livePhotoInfoDequeueSemaphore = self->_livePhotoInfoDequeueSemaphore;
  dispatch_semaphore_signal(livePhotoInfoDequeueSemaphore);
}

- (opaqueCMSampleBuffer)popLivePhotoInfoSample
{
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_livePhotoInfoDequeueSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  objc_super v3 = self->_livePhotoInfoQueue;
  objc_sync_enter(v3);
  if ([(NSMutableArray *)self->_livePhotoInfoQueue count])
  {
    v4 = [(NSMutableArray *)self->_livePhotoInfoQueue objectAtIndexedSubscript:0];

    [(NSMutableArray *)self->_livePhotoInfoQueue removeObjectAtIndex:0];
  }
  else
  {
    v4 = 0;
  }
  objc_sync_exit(v3);

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_livePhotoInfoEnqueueSemaphore);
  return (opaqueCMSampleBuffer *)v4;
}

- (int)dispatchEncoding
{
  if (![(AVAssetWriter *)self->_writer startWriting]) {
    return -18;
  }
  writer = self->_writer;
  long long v14 = *MEMORY[0x1E4F1FA48];
  uint64_t v15 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  [(AVAssetWriter *)writer startSessionAtSourceTime:&v14];
  dispatch_group_enter((dispatch_group_t)self->_encodingGroup);
  input = self->_input;
  videoQueue = self->_videoQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __39__VCPMovieAssetWriter_dispatchEncoding__block_invoke;
  v13[3] = &unk_1E6296FF8;
  v13[4] = self;
  [(AVAssetWriterInput *)input requestMediaDataWhenReadyOnQueue:videoQueue usingBlock:v13];
  if (self->_enableStyle && self->_hasStyleApplied)
  {
    dispatch_group_enter((dispatch_group_t)self->_encodingGroup);
    auxInput = self->_auxInput;
    auxQueue = self->_auxQueue;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __39__VCPMovieAssetWriter_dispatchEncoding__block_invoke_12;
    v12[3] = &unk_1E6296FF8;
    v12[4] = self;
    [(AVAssetWriterInput *)auxInput requestMediaDataWhenReadyOnQueue:auxQueue usingBlock:v12];
  }
  if (self->_enableAudio)
  {
    dispatch_group_enter((dispatch_group_t)self->_encodingGroup);
    audioInput = self->_audioInput;
    audioQueue = self->_audioQueue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __39__VCPMovieAssetWriter_dispatchEncoding__block_invoke_14;
    v11[3] = &unk_1E6296FF8;
    v11[4] = self;
    [(AVAssetWriterInput *)audioInput requestMediaDataWhenReadyOnQueue:audioQueue usingBlock:v11];
  }
  return [(VCPMovieAssetWriter *)self processLivePhotoInfoMetadataTrack];
}

void __39__VCPMovieAssetWriter_dispatchEncoding__block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 72) isReadyForMoreMediaData])
  {
    while (1)
    {
      v2 = *(void **)(a1 + 32);
      if (v2[30] != 1) {
        goto LABEL_7;
      }
      objc_super v3 = (const void *)[v2 popSample];
      id v12 = v3;
      uint64_t v4 = *(void *)(a1 + 32);
      if (*(void *)(v4 + 240) == 3) {
        break;
      }
      if (!v3)
      {
        char v5 = 0;
        char v6 = 1;
        goto LABEL_11;
      }
      if (([*(id *)(v4 + 72) appendSampleBuffer:v3] & 1) == 0)
      {
        char v6 = 0;
        char v5 = 1;
        goto LABEL_11;
      }
      CF<opaqueCMSampleBuffer *>::~CF(&v12);
      if (([*(id *)(*(void *)(a1 + 32) + 72) isReadyForMoreMediaData] & 1) == 0) {
        goto LABEL_7;
      }
    }
    char v5 = 0;
    char v6 = 0;
LABEL_11:
    CF<opaqueCMSampleBuffer *>::~CF(&v12);
    goto LABEL_12;
  }
LABEL_7:
  char v5 = 0;
  char v6 = 0;
LABEL_12:
  uint64_t v7 = *(void *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 200);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__VCPMovieAssetWriter_dispatchEncoding__block_invoke_2;
  block[3] = &unk_1E629B0B0;
  block[4] = v7;
  char v10 = v5;
  char v11 = v6;
  dispatch_sync(v8, block);
}

void __39__VCPMovieAssetWriter_dispatchEncoding__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 240);
  if (v2 != 3 && !*(unsigned char *)(a1 + 40) && !*(unsigned char *)(a1 + 41)) {
    return;
  }
  if (*(unsigned char *)(a1 + 41))
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      objc_super v3 = VCPLogInstance();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        __int16 v9 = 0;
        uint64_t v4 = "[FRC] Video encoding finished";
        char v5 = (uint8_t *)&v9;
LABEL_16:
        _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_DEBUG, v4, v5, 2u);
        goto LABEL_17;
      }
      goto LABEL_17;
    }
  }
  else
  {
    if (!*(unsigned char *)(a1 + 40))
    {
      if (v2 != 3 || (int)MediaAnalysisLogLevel() < 7) {
        goto LABEL_18;
      }
      objc_super v3 = VCPLogInstance();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_17;
      }
      LOWORD(v7) = 0;
      uint64_t v4 = "[FRC] Video encoding aborted";
      char v5 = (uint8_t *)&v7;
      goto LABEL_16;
    }
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      objc_super v3 = VCPLogInstance();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        __int16 v8 = 0;
        uint64_t v4 = "[FRC] Video encoding failed";
        char v5 = (uint8_t *)&v8;
        goto LABEL_16;
      }
LABEL_17:
    }
  }
LABEL_18:
  uint64_t v6 = *(void *)(a1 + 32);
  if (*(void *)(v6 + 240) == 1)
  {
    if (*(unsigned char *)(a1 + 40))
    {
      *(void *)(v6 + 240) = 3;
      uint64_t v6 = *(void *)(a1 + 32);
    }
  }
  objc_msgSend(*(id *)(v6 + 72), "markAsFinished", v7);
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 144));
}

void __39__VCPMovieAssetWriter_dispatchEncoding__block_invoke_12(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 80) isReadyForMoreMediaData])
  {
    while (1)
    {
      uint64_t v2 = *(void **)(a1 + 32);
      if (v2[30] != 1) {
        goto LABEL_7;
      }
      objc_super v3 = (const void *)[v2 popAuxSample];
      id v12 = v3;
      uint64_t v4 = *(void *)(a1 + 32);
      if (*(void *)(v4 + 240) == 3) {
        break;
      }
      if (!v3)
      {
        char v5 = 0;
        char v6 = 1;
        goto LABEL_11;
      }
      if (([*(id *)(v4 + 80) appendSampleBuffer:v3] & 1) == 0)
      {
        char v6 = 0;
        char v5 = 1;
        goto LABEL_11;
      }
      CF<opaqueCMSampleBuffer *>::~CF(&v12);
      if (([*(id *)(*(void *)(a1 + 32) + 80) isReadyForMoreMediaData] & 1) == 0) {
        goto LABEL_7;
      }
    }
    char v5 = 0;
    char v6 = 0;
LABEL_11:
    CF<opaqueCMSampleBuffer *>::~CF(&v12);
    goto LABEL_12;
  }
LABEL_7:
  char v5 = 0;
  char v6 = 0;
LABEL_12:
  uint64_t v7 = *(void *)(a1 + 32);
  __int16 v8 = *(NSObject **)(v7 + 200);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__VCPMovieAssetWriter_dispatchEncoding__block_invoke_2_13;
  block[3] = &unk_1E629B0B0;
  block[4] = v7;
  char v10 = v5;
  char v11 = v6;
  dispatch_sync(v8, block);
}

void __39__VCPMovieAssetWriter_dispatchEncoding__block_invoke_2_13(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 240);
  if (v2 != 3 && !*(unsigned char *)(a1 + 40) && !*(unsigned char *)(a1 + 41)) {
    return;
  }
  if (*(unsigned char *)(a1 + 41))
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      objc_super v3 = VCPLogInstance();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        __int16 v9 = 0;
        uint64_t v4 = "[FRC] Aux encoding finished";
        char v5 = (uint8_t *)&v9;
LABEL_16:
        _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_DEBUG, v4, v5, 2u);
        goto LABEL_17;
      }
      goto LABEL_17;
    }
  }
  else
  {
    if (!*(unsigned char *)(a1 + 40))
    {
      if (v2 != 3 || (int)MediaAnalysisLogLevel() < 7) {
        goto LABEL_18;
      }
      objc_super v3 = VCPLogInstance();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_17;
      }
      LOWORD(v7) = 0;
      uint64_t v4 = "[FRC] Aux encoding aborted";
      char v5 = (uint8_t *)&v7;
      goto LABEL_16;
    }
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      objc_super v3 = VCPLogInstance();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        __int16 v8 = 0;
        uint64_t v4 = "[FRC] Aux encoding failed";
        char v5 = (uint8_t *)&v8;
        goto LABEL_16;
      }
LABEL_17:
    }
  }
LABEL_18:
  uint64_t v6 = *(void *)(a1 + 32);
  if (*(void *)(v6 + 240) == 1)
  {
    if (*(unsigned char *)(a1 + 40))
    {
      *(void *)(v6 + 240) = 3;
      uint64_t v6 = *(void *)(a1 + 32);
    }
  }
  objc_msgSend(*(id *)(v6 + 80), "markAsFinished", v7);
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 144));
}

void __39__VCPMovieAssetWriter_dispatchEncoding__block_invoke_14(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 88) isReadyForMoreMediaData])
  {
    do
    {
      uint64_t v2 = *(void *)(a1 + 32);
      if (*(void *)(v2 + 240) != 1) {
        break;
      }
      uint64_t v3 = [*(id *)(v2 + 24) copyNextSampleBuffer];
      if (!v3)
      {
        char v7 = 0;
        char v6 = 1;
        goto LABEL_7;
      }
      uint64_t v4 = (const void *)v3;
      int v5 = [*(id *)(*(void *)(a1 + 32) + 88) appendSampleBuffer:v3];
      CFRelease(v4);
      if (!v5)
      {
        char v6 = 0;
        char v7 = 1;
        goto LABEL_7;
      }
    }
    while (([*(id *)(*(void *)(a1 + 32) + 88) isReadyForMoreMediaData] & 1) != 0);
  }
  char v6 = 0;
  char v7 = 0;
LABEL_7:
  uint64_t v8 = *(void *)(a1 + 32);
  __int16 v9 = *(NSObject **)(v8 + 200);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __39__VCPMovieAssetWriter_dispatchEncoding__block_invoke_2_15;
  v10[3] = &unk_1E629B0B0;
  v10[4] = v8;
  char v11 = v7;
  char v12 = v6;
  dispatch_sync(v9, v10);
}

void __39__VCPMovieAssetWriter_dispatchEncoding__block_invoke_2_15(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 240);
  if (v2 != 3 && !*(unsigned char *)(a1 + 40) && !*(unsigned char *)(a1 + 41)) {
    return;
  }
  if (*(unsigned char *)(a1 + 41))
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      uint64_t v3 = VCPLogInstance();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        __int16 v9 = 0;
        uint64_t v4 = "[FRC] Audio encoding finished";
        int v5 = (uint8_t *)&v9;
LABEL_16:
        _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_DEBUG, v4, v5, 2u);
        goto LABEL_17;
      }
      goto LABEL_17;
    }
  }
  else
  {
    if (!*(unsigned char *)(a1 + 40))
    {
      if (v2 != 3 || (int)MediaAnalysisLogLevel() < 7) {
        goto LABEL_18;
      }
      uint64_t v3 = VCPLogInstance();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_17;
      }
      LOWORD(v7) = 0;
      uint64_t v4 = "[FRC] Audio encoding aborted";
      int v5 = (uint8_t *)&v7;
      goto LABEL_16;
    }
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      uint64_t v3 = VCPLogInstance();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        __int16 v8 = 0;
        uint64_t v4 = "[FRC] Audio encoding failed";
        int v5 = (uint8_t *)&v8;
        goto LABEL_16;
      }
LABEL_17:
    }
  }
LABEL_18:
  uint64_t v6 = *(void *)(a1 + 32);
  if (*(void *)(v6 + 240) == 1)
  {
    if (*(unsigned char *)(a1 + 40))
    {
      *(void *)(v6 + 240) = 3;
      uint64_t v6 = *(void *)(a1 + 32);
    }
  }
  objc_msgSend(*(id *)(v6 + 88), "markAsFinished", v7);
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 144));
}

- (int)copyPixelBuffer:(__CVBuffer *)a3 toPixelBuffer:(__CVBuffer *)a4
{
  v17[4] = *MEMORY[0x1E4F143B8];
  p_pixelBufferPool = &self->_pixelBufferPool;
  if (self->_pixelBufferPool.value_) {
    goto LABEL_17;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    __int16 v9 = VCPLogInstance();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_ERROR, "Pixel buffers are not IOSurface-backed; copying", v15, 2u);
    }
  }
  v16[0] = *MEMORY[0x1E4F24D70];
  char v10 = [NSNumber numberWithUnsignedInt:CVPixelBufferGetPixelFormatType(a3)];
  v17[0] = v10;
  v16[1] = *MEMORY[0x1E4F24E10];
  char v11 = [NSNumber numberWithUnsignedLong:CVPixelBufferGetWidth(a3)];
  v17[1] = v11;
  v16[2] = *MEMORY[0x1E4F24D08];
  char v12 = [NSNumber numberWithUnsignedLong:CVPixelBufferGetHeight(a3)];
  v16[3] = *MEMORY[0x1E4F24D20];
  v17[2] = v12;
  v17[3] = MEMORY[0x1E4F1CC08];
  CFDictionaryRef v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];

  if (p_pixelBufferPool->value_)
  {
    CFRelease(p_pixelBufferPool->value_);
    p_pixelBufferPool->value_ = 0;
  }
  CVReturn PixelBuffer = CVPixelBufferPoolCreate(0, 0, v13, &p_pixelBufferPool->value_);

  if (!PixelBuffer)
  {
LABEL_17:
    if (self->_transferSession.value_
      || (CVReturn PixelBuffer = VTPixelTransferSessionCreate(0, &self->_transferSession.value_)) == 0)
    {
      CVReturn PixelBuffer = CVPixelBufferPoolCreatePixelBuffer(0, p_pixelBufferPool->value_, a4);
      if (!PixelBuffer) {
        return VTPixelTransferSessionTransferImage(self->_transferSession.value_, a3, *a4);
      }
    }
  }
  return PixelBuffer;
}

- (int)addPixelBuffer:(__CVBuffer *)a3 withTime:(id *)a4 withAttachment:(id)a5
{
  id v8 = a5;
  if (a3)
  {
    if (self->_status == 1)
    {
      CMVideoFormatDescriptionRef formatDescriptionOut = 0;
      OSStatus v9 = CMVideoFormatDescriptionCreateForImageBuffer(0, a3, &formatDescriptionOut);
      if (v9)
      {
LABEL_22:
        CF<opaqueCMSampleBuffer *>::~CF((const void **)&formatDescriptionOut);
        goto LABEL_23;
      }
      *(_OWORD *)&sampleTiming.duration.value = *MEMORY[0x1E4F1F9F8];
      sampleTiming.duration.epoch = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
      sampleTiming.presentationTimeStamp = (CMTime)*a4;
      sampleTiming.decodeTimeStamp = sampleTiming.duration;
      CFTypeRef cf = 0;
      if (CVPixelBufferGetIOSurface(a3))
      {
        CMAttachmentBearerRef target = 0;
        CFTypeRef cf = CFRetain(a3);
        CF<opaqueCMSampleBuffer *>::~CF(&target);
      }
      else
      {
        OSStatus v9 = [(VCPMovieAssetWriter *)self copyPixelBuffer:a3 toPixelBuffer:&cf];
        if (v9)
        {
LABEL_21:
          CF<opaqueCMSampleBuffer *>::~CF(&cf);
          goto LABEL_22;
        }
      }
      CMAttachmentBearerRef target = 0;
      OSStatus v9 = CMSampleBufferCreateForImageBuffer(0, (CVImageBufferRef)cf, 1u, 0, 0, formatDescriptionOut, &sampleTiming, (CMSampleBufferRef *)&target);
      if (!v9)
      {
        CFStringRef v10 = (const __CFString *)*MEMORY[0x1E4F1F288];
        char v11 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F1F288]];

        char v12 = (CFTypeRef *)MEMORY[0x1E4F1CFD0];
        if (v11
          || (CFStringRef v10 = (const __CFString *)*MEMORY[0x1E4F1F2B0],
              [v8 objectForKeyedSubscript:*MEMORY[0x1E4F1F2B0]],
              CFDictionaryRef v13 = objc_claimAutoreleasedReturnValue(),
              v13,
              v13))
        {
          CMSetAttachment(target, v10, *v12, 1u);
        }
        CFStringRef v14 = (const __CFString *)*MEMORY[0x1E4F1F280];
        uint64_t v15 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F1F280]];

        if (v15) {
          CMSetAttachment(target, v14, *v12, 1u);
        }
        if (target) {
          CFTypeRef v16 = CFRetain(target);
        }
        else {
          CFTypeRef v16 = 0;
        }
        [(VCPMovieAssetWriter *)self pushSample:v16];
      }
      CF<opaqueCMSampleBuffer *>::~CF(&target);
      goto LABEL_21;
    }
    OSStatus v9 = -18;
  }
  else
  {
    OSStatus v9 = -50;
  }
LABEL_23:

  return v9;
}

- (int)addAuxPixelBuffer:(__CVBuffer *)a3 withTime:(id *)a4 withAttachment:(id)a5
{
  id v8 = a5;
  if (a3)
  {
    if (self->_status == 1)
    {
      CMVideoFormatDescriptionRef formatDescriptionOut = 0;
      OSStatus v9 = CMVideoFormatDescriptionCreateForImageBuffer(0, a3, &formatDescriptionOut);
      if (v9)
      {
LABEL_22:
        CF<opaqueCMSampleBuffer *>::~CF((const void **)&formatDescriptionOut);
        goto LABEL_23;
      }
      *(_OWORD *)&sampleTiming.duration.value = *MEMORY[0x1E4F1F9F8];
      sampleTiming.duration.epoch = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
      sampleTiming.presentationTimeStamp = (CMTime)*a4;
      sampleTiming.decodeTimeStamp = sampleTiming.duration;
      CFTypeRef cf = 0;
      if (CVPixelBufferGetIOSurface(a3))
      {
        CMAttachmentBearerRef target = 0;
        CFTypeRef cf = CFRetain(a3);
        CF<opaqueCMSampleBuffer *>::~CF(&target);
      }
      else
      {
        OSStatus v9 = [(VCPMovieAssetWriter *)self copyPixelBuffer:a3 toPixelBuffer:&cf];
        if (v9)
        {
LABEL_21:
          CF<opaqueCMSampleBuffer *>::~CF(&cf);
          goto LABEL_22;
        }
      }
      CMAttachmentBearerRef target = 0;
      OSStatus v9 = CMSampleBufferCreateForImageBuffer(0, (CVImageBufferRef)cf, 1u, 0, 0, formatDescriptionOut, &sampleTiming, (CMSampleBufferRef *)&target);
      if (!v9)
      {
        CFStringRef v10 = (const __CFString *)*MEMORY[0x1E4F1F288];
        char v11 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F1F288]];

        char v12 = (CFTypeRef *)MEMORY[0x1E4F1CFD0];
        if (v11
          || (CFStringRef v10 = (const __CFString *)*MEMORY[0x1E4F1F2B0],
              [v8 objectForKeyedSubscript:*MEMORY[0x1E4F1F2B0]],
              CFDictionaryRef v13 = objc_claimAutoreleasedReturnValue(),
              v13,
              v13))
        {
          CMSetAttachment(target, v10, *v12, 1u);
        }
        CFStringRef v14 = (const __CFString *)*MEMORY[0x1E4F1F280];
        uint64_t v15 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F1F280]];

        if (v15) {
          CMSetAttachment(target, v14, *v12, 1u);
        }
        if (target) {
          CFTypeRef v16 = CFRetain(target);
        }
        else {
          CFTypeRef v16 = 0;
        }
        [(VCPMovieAssetWriter *)self pushAuxSample:v16];
      }
      CF<opaqueCMSampleBuffer *>::~CF(&target);
      goto LABEL_21;
    }
    OSStatus v9 = -18;
  }
  else
  {
    OSStatus v9 = -50;
  }
LABEL_23:

  return v9;
}

- (int)addLivePhotoInfoBuffer:(opaqueCMSampleBuffer *)a3
{
  if (!a3) {
    return -50;
  }
  if (self->_status != 1) {
    return -18;
  }
  -[VCPMovieAssetWriter pushLivePhotoInfoSample:](self, "pushLivePhotoInfoSample:");
  return 0;
}

- (void)updateStillPTS:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_stillPTS.epoch = a3->var3;
  *(_OWORD *)&self->_stillPTS.value = v3;
}

- (int)setupMetadataTrack
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  v37 = [(AVAssetTrack *)self->_track asset];
  long long v3 = [v37 metadata];
  [(AVAssetWriter *)self->_writer setMetadata:v3];

  uint64_t v4 = *MEMORY[0x1E4F15BE0];
  objc_msgSend(v37, "vcp_enabledTracksWithMediaType:", *MEMORY[0x1E4F15BE0]);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (!v5)
  {
    int v33 = 0;
    goto LABEL_39;
  }
  uint64_t v7 = *(void *)v42;
  uint64_t v39 = *MEMORY[0x1E4F218A0];
  uint64_t v38 = *MEMORY[0x1E4F1F170];
  uint64_t v36 = *MEMORY[0x1E4F52790];
  *(void *)&long long v6 = 138412290;
  long long v35 = v6;
  do
  {
    uint64_t v8 = 0;
    do
    {
      if (*(void *)v42 != v7) {
        objc_enumerationMutation(obj);
      }
      OSStatus v9 = *(void **)(*((void *)&v41 + 1) + 8 * v8);
      CFStringRef v10 = objc_msgSend(v9, "formatDescriptions", v35);
      char v11 = [v10 firstObject];

      if (v11)
      {
        char v12 = CMMetadataFormatDescriptionGetIdentifiers((CMMetadataFormatDescriptionRef)v11);
        CFDictionaryRef v13 = [v9 formatDescriptions];
        if ([v13 count] != 1) {
          goto LABEL_38;
        }
        id v14 = objc_alloc(MEMORY[0x1E4F163C0]);
        uint64_t v15 = [v13 objectAtIndexedSubscript:0];
        CFTypeRef v16 = (void *)[v14 initWithMediaType:v4 outputSettings:0 sourceFormatHint:v15];

        if ([v12 containsObject:v39])
        {
          id v17 = [MEMORY[0x1E4F163A0] assetReaderTrackOutputWithTrack:v9 outputSettings:0];
          stillImageOutput = self->_stillImageOutput;
          self->_stillImageOutput = v17;

          if (![(AVAssetReader *)self->_assetReader canAddOutput:self->_stillImageOutput]) {
            goto LABEL_37;
          }
          [(AVAssetReader *)self->_assetReader addOutput:self->_stillImageOutput];
          objc_storeStrong((id *)&self->_stillImageInput, v16);
          BOOL v19 = [(AVAssetWriter *)self->_writer canAddInput:self->_stillImageInput];
          p_stillImageInput = &self->_stillImageInput;
          if (!v19) {
            goto LABEL_37;
          }
          goto LABEL_18;
        }
        if ([v12 containsObject:v38])
        {
          int v21 = [MEMORY[0x1E4F163A0] assetReaderTrackOutputWithTrack:v9 outputSettings:0];
          videoOrientationOutput = self->_videoOrientationOutput;
          self->_videoOrientationOutput = v21;

          if (![(AVAssetReader *)self->_assetReader canAddOutput:self->_videoOrientationOutput]) {
            goto LABEL_37;
          }
          [(AVAssetReader *)self->_assetReader addOutput:self->_videoOrientationOutput];
          objc_storeStrong((id *)&self->_videoOrientationInput, v16);
          BOOL v23 = [(AVAssetWriter *)self->_writer canAddInput:self->_videoOrientationInput];
          p_stillImageInput = &self->_videoOrientationInput;
          if (!v23) {
            goto LABEL_37;
          }
LABEL_18:
          [(AVAssetWriter *)self->_writer addInput:*p_stillImageInput];
        }
        else
        {
          if ([v12 containsObject:v36])
          {
            objc_storeStrong((id *)&self->_livePhotoInfoInput, v16);
            BOOL v24 = [(AVAssetWriter *)self->_writer canAddInput:self->_livePhotoInfoInput];
            p_stillImageInput = &self->_livePhotoInfoInput;
            if (!v24) {
              goto LABEL_37;
            }
            goto LABEL_18;
          }
          if ([v12 containsObject:@"mdta/com.apple.quicktime.smartstyle-info"])
          {
            char v25 = (AVAssetWriterInputMetadataAdaptor *)[objc_alloc(MEMORY[0x1E4F163D0]) initWithAssetWriterInput:v16];
            styleInfoAdaptor = self->_styleInfoAdaptor;
            self->_styleInfoAdaptor = v25;

            writer = self->_writer;
            v28 = [(AVAssetWriterInputMetadataAdaptor *)self->_styleInfoAdaptor assetWriterInput];
            LOBYTE(writer) = [(AVAssetWriter *)writer canAddInput:v28];

            if ((writer & 1) == 0) {
              goto LABEL_37;
            }
            v29 = self->_writer;
            uint64_t v30 = [(AVAssetWriterInputMetadataAdaptor *)self->_styleInfoAdaptor assetWriterInput];
            [(AVAssetWriter *)v29 addInput:v30];
          }
          else
          {
            if ((int)MediaAnalysisLogLevel() >= 5)
            {
              v31 = VCPLogInstance();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v35;
                dispatch_semaphore_t v46 = v12;
                _os_log_impl(&dword_1BBEDA000, v31, OS_LOG_TYPE_DEFAULT, "Unknown metadata with identifiers: %@", buf, 0xCu);
              }
            }
            uint64_t v30 = [MEMORY[0x1E4F163A0] assetReaderTrackOutputWithTrack:v9 outputSettings:0];
            if (![(AVAssetReader *)self->_assetReader canAddOutput:v30]
              || ([(AVAssetReader *)self->_assetReader addOutput:v30],
                  ![(AVAssetWriter *)self->_writer canAddInput:v16]))
            {

LABEL_37:
LABEL_38:

              int v33 = -18;
              goto LABEL_39;
            }
            [(AVAssetWriter *)self->_writer addInput:v16];
            [(NSMapTable *)self->_inputToOutputMap setObject:v30 forKey:v16];
          }
        }
      }
      ++v8;
    }
    while (v5 != v8);
    uint64_t v32 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
    uint64_t v5 = v32;
    int v33 = 0;
  }
  while (v32);
LABEL_39:

  return v33;
}

- (int)setupAdditionalAuxTrack
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  v29 = [(AVAssetTrack *)self->_track asset];
  long long v3 = [v29 metadata];
  [(AVAssetWriter *)self->_writer setMetadata:v3];

  uint64_t v4 = [(AVAssetTrack *)self->_track asset];
  uint64_t v31 = *MEMORY[0x1E4F15BB8];
  uint64_t v5 = objc_msgSend(v4, "tracksWithMediaType:");

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v45 objects:v52 count:16];
  if (v6)
  {
    uint64_t v33 = *(void *)v46;
    uint64_t v30 = *MEMORY[0x1E4F15D20];
    uint64_t v28 = *MEMORY[0x1E4F15EC0];
    uint64_t v27 = *MEMORY[0x1E4F15E00];
    do
    {
      uint64_t v32 = v6;
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v46 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        OSStatus v9 = [v8 formatDescriptions];
        CFStringRef v10 = [v9 firstObject];

        if (v10)
        {
          long long v35 = [v8 metadataForFormat:v30];
          char v11 = (void *)[objc_alloc(MEMORY[0x1E4F163C0]) initWithMediaType:v31 outputSettings:0 sourceFormatHint:0];
          if (v35)
          {
            char v12 = [MEMORY[0x1E4F16558] metadataItemsFromArray:v35 withKey:v28 keySpace:v27];
            if (v12)
            {
              long long v43 = 0u;
              long long v44 = 0u;
              long long v41 = 0u;
              long long v42 = 0u;
              id v26 = v12;
              id v36 = v12;
              uint64_t v13 = [v36 countByEnumeratingWithState:&v41 objects:v51 count:16];
              if (v13)
              {
                uint64_t v14 = *(void *)v42;
                while (2)
                {
                  for (uint64_t j = 0; j != v13; ++j)
                  {
                    if (*(void *)v42 != v14) {
                      objc_enumerationMutation(v36);
                    }
                    CFTypeRef v16 = *(void **)(*((void *)&v41 + 1) + 8 * j);
                    objc_msgSend(v11, "setMarksOutputTrackAsEnabled:", objc_msgSend(v8, "isEnabled"));
                    id v17 = [v16 stringValue];
                    char v18 = [v17 isEqualToString:@"com.apple.quicktime.video-map.smart-style-delta-map"];

                    if ((v18 & 1) == 0)
                    {
                      if ((int)MediaAnalysisLogLevel() >= 5)
                      {
                        BOOL v19 = VCPLogInstance();
                        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
                        {
                          v20 = [v16 stringValue];
                          *(_DWORD *)buf = 138412290;
                          dispatch_group_t v50 = v20;
                          _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_DEFAULT, "Setting up aux track with name: %@", buf, 0xCu);
                        }
                      }
                      if (v8)
                      {
                        [v8 preferredTransform];
                      }
                      else
                      {
                        long long v39 = 0u;
                        long long v40 = 0u;
                        long long v38 = 0u;
                      }
                      v37[0] = v38;
                      v37[1] = v39;
                      v37[2] = v40;
                      [v11 setTransform:v37];
                      int v21 = [v8 metadata];
                      [v11 setMetadata:v21];

                      if (![(AVAssetWriter *)self->_writer canAddInput:v11])
                      {

                        int v24 = -18;
                        goto LABEL_34;
                      }
                      [(AVAssetWriter *)self->_writer addInput:v11];
                      auxInputToOutputMap = self->_auxInputToOutputMap;
                      BOOL v23 = [v16 stringValue];
                      [(NSMapTable *)auxInputToOutputMap setObject:v11 forKey:v23];
                    }
                  }
                  uint64_t v13 = [v36 countByEnumeratingWithState:&v41 objects:v51 count:16];
                  if (v13) {
                    continue;
                  }
                  break;
                }
              }

              char v12 = v26;
            }
          }
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v45 objects:v52 count:16];
      int v24 = 0;
    }
    while (v6);
  }
  else
  {
    int v24 = 0;
  }
LABEL_34:

  return v24;
}

- (int)setupAudioTrack
{
  v16[1] = *MEMORY[0x1E4F143B8];
  uint64_t v15 = *MEMORY[0x1E4F151E0];
  v16[0] = &unk_1F15ED140;
  long long v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
  uint64_t v4 = [MEMORY[0x1E4F163A0] assetReaderTrackOutputWithTrack:self->_audioTrack outputSettings:v3];
  audioOutput = self->_audioOutput;
  self->_audioOutput = v4;

  if ([(AVAssetReader *)self->_assetReader canAddOutput:self->_audioOutput])
  {
    [(AVAssetReader *)self->_assetReader addOutput:self->_audioOutput];
    uint64_t v6 = [(AVAssetTrack *)self->_audioTrack formatDescriptions];
    if ([v6 count] == 1)
    {
      uint64_t v7 = (void *)MEMORY[0x1E4F163C0];
      uint64_t v8 = [v6 objectAtIndexedSubscript:0];
      OSStatus v9 = [v7 assetWriterInputWithMediaType:*MEMORY[0x1E4F15BA8] outputSettings:0 sourceFormatHint:v8];
      audioInput = self->_audioInput;
      self->_audioInput = v9;

      if (self->_audioInput)
      {
        -[AVAssetWriter addInput:](self->_writer, "addInput:");
        int v11 = 0;
LABEL_11:

        goto LABEL_12;
      }
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        char v12 = VCPLogInstance();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)uint64_t v14 = 0;
          _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_ERROR, "Failed to create asset audio writer input", v14, 2u);
        }
      }
    }
    int v11 = -18;
    goto LABEL_11;
  }
  int v11 = -18;
LABEL_12:

  return v11;
}

- (int)setupVideoTrack:(int64_t)a3 withOutputSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  v39[7] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = [(AVAssetTrack *)self->_track formatDescriptions];
  if ([v8 count] == 1)
  {
    OSStatus v9 = [v8 objectAtIndexedSubscript:0];

    FourCharCode MediaSubType = CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)v9);
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (MediaSubType == 1635148593)
    {
      uint64_t v21 = *MEMORY[0x1E4F44AB8];
      v36[0] = *MEMORY[0x1E4F44AC0];
      v36[1] = v21;
      v37[0] = MEMORY[0x1E4F1CC38];
      v37[1] = &unk_1F15ED1A0;
      v36[2] = *MEMORY[0x1E4F44810];
      v22 = [NSNumber numberWithInteger:a3];
      v36[3] = *MEMORY[0x1E4F447D0];
      v37[2] = v22;
      _OWORD v37[3] = MEMORY[0x1E4F1CC28];
      id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:4];

      [v11 setObject:*MEMORY[0x1E4F16228] forKeyedSubscript:*MEMORY[0x1E4F16220]];
      [v11 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F16268]];
      if (*MEMORY[0x1E4F1DB30] != width || *(double *)(MEMORY[0x1E4F1DB30] + 8) != height)
      {
        BOOL v23 = [NSNumber numberWithLong:(uint64_t)rint(width)];
        [v11 setObject:v23 forKeyedSubscript:*MEMORY[0x1E4F16300]];

        BOOL v19 = [NSNumber numberWithLong:(uint64_t)rint(height)];
        [v11 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F162A0]];
        goto LABEL_11;
      }
    }
    else
    {
      if (MediaSubType != 1752589105)
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          uint64_t v27 = VCPLogInstance();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            uint64_t v28 = "[FRC] Unexpected codec type";
LABEL_21:
            _os_log_impl(&dword_1BBEDA000, v27, OS_LOG_TYPE_ERROR, v28, buf, 2u);
          }
LABEL_22:
        }
LABEL_23:
        int v20 = -18;
LABEL_26:

        goto LABEL_27;
      }
      uint64_t v12 = MEMORY[0x1E4F1CC28];
      uint64_t v13 = *MEMORY[0x1E4F44AC0];
      v38[0] = *MEMORY[0x1E4F447D8];
      v38[1] = v13;
      v39[0] = MEMORY[0x1E4F1CC28];
      v39[1] = MEMORY[0x1E4F1CC38];
      uint64_t v14 = *MEMORY[0x1E4F449B8];
      v38[2] = *MEMORY[0x1E4F44828];
      v38[3] = v14;
      v39[2] = &unk_1F15ED158;
      v39[3] = &unk_1F15ED170;
      v39[4] = &unk_1F15ED188;
      uint64_t v15 = *MEMORY[0x1E4F44810];
      v38[4] = *MEMORY[0x1E4F44BC0];
      v38[5] = v15;
      CFTypeRef v16 = [NSNumber numberWithInteger:a3];
      v38[6] = *MEMORY[0x1E4F44A58];
      v39[5] = v16;
      v39[6] = v12;
      id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:7];

      [v11 setObject:*MEMORY[0x1E4F16230] forKeyedSubscript:*MEMORY[0x1E4F16220]];
      [v11 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F16268]];
      if (*MEMORY[0x1E4F1DB30] != width || *(double *)(MEMORY[0x1E4F1DB30] + 8) != height)
      {
        char v18 = [NSNumber numberWithLong:(uint64_t)rint(width)];
        [v11 setObject:v18 forKeyedSubscript:*MEMORY[0x1E4F16300]];

        BOOL v19 = [NSNumber numberWithLong:(uint64_t)rint(height)];
        [v11 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F162A0]];
LABEL_11:
      }
    }

    int v24 = [MEMORY[0x1E4F163C0] assetWriterInputWithMediaType:*MEMORY[0x1E4F15C18] outputSettings:v11 sourceFormatHint:v9];
    input = self->_input;
    self->_input = v24;

    id v26 = self->_input;
    if (v26)
    {
      if (self->_track)
      {
        [(AVAssetTrack *)self->_track preferredTransform];
        id v26 = self->_input;
      }
      else
      {
        long long v33 = 0u;
        long long v34 = 0u;
        long long v32 = 0u;
      }
      v31[0] = v32;
      v31[1] = v33;
      v31[2] = v34;
      [(AVAssetWriterInput *)v26 setTransform:v31];
      v29 = [(AVAssetTrack *)self->_track metadata];
      [(AVAssetWriterInput *)self->_input setMetadata:v29];

      [(AVAssetWriter *)self->_writer addInput:self->_input];
      int v20 = 0;
      goto LABEL_26;
    }
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v27 = VCPLogInstance();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        uint64_t v28 = "Failed to create asset video writer input";
        goto LABEL_21;
      }
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  int v20 = -18;
LABEL_27:

  return v20;
}

- (int)setupAuxTrack:(int64_t)a3 withOutputSize:(CGSize)a4
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(AVAssetTrack *)self->_track asset];
  uint64_t v5 = *MEMORY[0x1E4F15BB8];
  uint64_t v6 = [v4 tracksWithMediaType:*MEMORY[0x1E4F15BB8]];

  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v74 objects:v83 count:16];
  uint64_t v54 = v5;
  uint64_t v8 = 0;
  if (v7)
  {
    uint64_t v60 = *MEMORY[0x1E4F15D20];
    uint64_t v61 = *(void *)v75;
    uint64_t v58 = *MEMORY[0x1E4F15E00];
    uint64_t v59 = *MEMORY[0x1E4F15EC0];
    do
    {
      uint64_t v62 = v7;
      for (uint64_t i = 0; i != v62; ++i)
      {
        if (*(void *)v75 != v61) {
          objc_enumerationMutation(obj);
        }
        CFStringRef v10 = *(void **)(*((void *)&v74 + 1) + 8 * i);
        uint64_t v11 = [v10 metadataForFormat:v60];
        v64 = (void *)v11;
        if (v11)
        {
          uint64_t v12 = [MEMORY[0x1E4F16558] metadataItemsFromArray:v11 withKey:v59 keySpace:v58];
          uint64_t v63 = v12;
          if (v12)
          {
            long long v72 = 0u;
            long long v73 = 0u;
            long long v70 = 0u;
            long long v71 = 0u;
            id v13 = v12;
            uint64_t v14 = [v13 countByEnumeratingWithState:&v70 objects:v82 count:16];
            if (v14)
            {
              uint64_t v15 = *(void *)v71;
              do
              {
                for (uint64_t j = 0; j != v14; ++j)
                {
                  if (*(void *)v71 != v15) {
                    objc_enumerationMutation(v13);
                  }
                  id v17 = [*(id *)(*((void *)&v70 + 1) + 8 * j) stringValue];
                  int v18 = [v17 isEqualToString:@"com.apple.quicktime.video-map.smart-style-delta-map"];

                  if (v18)
                  {
                    id v19 = v10;

                    uint64_t v8 = v19;
                  }
                }
                uint64_t v14 = [v13 countByEnumeratingWithState:&v70 objects:v82 count:16];
              }
              while (v14);
            }
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v74 objects:v83 count:16];
    }
    while (v7);
  }

  int v20 = [v8 formatDescriptions];
  if ([v20 count] == 1)
  {
    uint64_t v21 = [v20 objectAtIndexedSubscript:0];

    CGSize PresentationDimensions = CMVideoFormatDescriptionGetPresentationDimensions((CMVideoFormatDescriptionRef)v21, 0, 1u);
    CGSize v23 = CMVideoFormatDescriptionGetPresentationDimensions((CMVideoFormatDescriptionRef)v21, 0, 0);
    v80[0] = *MEMORY[0x1E4F16208];
    int v24 = [NSNumber numberWithDouble:PresentationDimensions.width];
    v81[0] = v24;
    v80[1] = *MEMORY[0x1E4F161E8];
    char v25 = [NSNumber numberWithDouble:PresentationDimensions.height];
    uint64_t v26 = *MEMORY[0x1E4F161F0];
    v81[1] = v25;
    v81[2] = &unk_1F15ED158;
    uint64_t v27 = *MEMORY[0x1E4F16200];
    v80[2] = v26;
    v80[3] = v27;
    v81[3] = &unk_1F15ED158;
    uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v81 forKeys:v80 count:4];

    id v29 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v30 = MEMORY[0x1E4F1CC28];
    uint64_t v31 = *MEMORY[0x1E4F447D8];
    v78[0] = *MEMORY[0x1E4F447D0];
    v78[1] = v31;
    v79[0] = MEMORY[0x1E4F1CC28];
    v79[1] = MEMORY[0x1E4F1CC28];
    uint64_t v32 = MEMORY[0x1E4F1CC38];
    uint64_t v33 = *MEMORY[0x1E4F44828];
    v78[2] = *MEMORY[0x1E4F44AC0];
    v78[3] = v33;
    v79[2] = MEMORY[0x1E4F1CC38];
    v79[3] = &unk_1F15ED158;
    uint64_t v34 = *MEMORY[0x1E4F44BC0];
    v78[4] = *MEMORY[0x1E4F449B8];
    v78[5] = v34;
    v79[4] = &unk_1F15ED170;
    v79[5] = &unk_1F15ED188;
    v78[6] = *MEMORY[0x1E4F44810];
    long long v35 = [NSNumber numberWithInteger:a3];
    uint64_t v36 = *MEMORY[0x1E4F44A58];
    v79[6] = v35;
    v79[7] = v30;
    uint64_t v37 = *MEMORY[0x1E4F448F0];
    v78[7] = v36;
    v78[8] = v37;
    uint64_t v38 = *MEMORY[0x1E4F449D0];
    v79[8] = &unk_1F15ED1B8;
    v79[9] = &unk_1F15EB168;
    uint64_t v39 = *MEMORY[0x1E4F449E0];
    v78[9] = v38;
    v78[10] = v39;
    uint64_t v40 = *MEMORY[0x1E4F449F8];
    v79[10] = &unk_1F15ED188;
    v79[11] = v32;
    uint64_t v41 = *MEMORY[0x1E4F44A98];
    v78[11] = v40;
    v78[12] = v41;
    uint64_t v42 = *MEMORY[0x1E4F44AD0];
    v79[12] = &unk_1F15ED1D0;
    v79[13] = v32;
    uint64_t v43 = *MEMORY[0x1E4F161F8];
    v78[13] = v42;
    v78[14] = v43;
    v79[14] = v28;
    long long v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v79 forKeys:v78 count:15];

    [v29 setObject:*MEMORY[0x1E4F16230] forKeyedSubscript:*MEMORY[0x1E4F16220]];
    [v29 setObject:v44 forKeyedSubscript:*MEMORY[0x1E4F16268]];
    long long v45 = [NSNumber numberWithInt:(int)v23.width];
    [v29 setObject:v45 forKeyedSubscript:*MEMORY[0x1E4F16300]];

    long long v46 = [NSNumber numberWithInt:(int)v23.height];
    [v29 setObject:v46 forKeyedSubscript:*MEMORY[0x1E4F162A0]];

    long long v47 = [MEMORY[0x1E4F163C0] assetWriterInputWithMediaType:v54 outputSettings:v29 sourceFormatHint:0];
    auxInput = self->_auxInput;
    self->_auxInput = v47;

    v49 = self->_auxInput;
    if (v49)
    {
      if (v8)
      {
        [v8 preferredTransform];
        v49 = self->_auxInput;
      }
      else
      {
        long long v67 = 0u;
        long long v68 = 0u;
        long long v66 = 0u;
      }
      v65[0] = v66;
      v65[1] = v67;
      v65[2] = v68;
      [(AVAssetWriterInput *)v49 setTransform:v65];
      uint64_t v52 = [v8 metadata];
      [(AVAssetWriterInput *)self->_auxInput setMetadata:v52];

      -[AVAssetWriterInput setMarksOutputTrackAsEnabled:](self->_auxInput, "setMarksOutputTrackAsEnabled:", [v8 isEnabled]);
      [(AVAssetWriter *)self->_writer addInput:self->_auxInput];
      int v50 = 0;
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v51 = VCPLogInstance();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BBEDA000, v51, OS_LOG_TYPE_ERROR, "Failed to create asset video writer input", buf, 2u);
        }
      }
      int v50 = -18;
    }
  }
  else
  {
    int v50 = -18;
  }

  return v50;
}

- (int)appendMetadataTrack
{
  int v3 = [(VCPMovieAssetWriter *)self processStillImageMetadataTrack];
  if (!v3)
  {
    int v3 = [(VCPMovieAssetWriter *)self passthroughMetadataTrackFrom:self->_videoOrientationOutput to:self->_videoOrientationInput];
    if (!v3)
    {
      uint64_t v4 = [(NSMapTable *)self->_inputToOutputMap keyEnumerator];
      uint64_t v5 = 0;
      while (1)
      {
        uint64_t v6 = [v4 nextObject];

        if (!v6) {
          break;
        }
        uint64_t v7 = [(NSMapTable *)self->_inputToOutputMap objectForKey:v6];
        int v3 = [(VCPMovieAssetWriter *)self passthroughMetadataTrackFrom:v7 to:v6];

        uint64_t v5 = v6;
        if (v3) {
          goto LABEL_8;
        }
      }
      int v3 = 0;
LABEL_8:
    }
  }
  return v3;
}

- (int)addAdditionalAuxTracks:(opaqueCMSampleBuffer *)a3 toTrack:(id)a4
{
  uint64_t v6 = [(NSMapTable *)self->_auxInputToOutputMap objectForKey:a4];
  if (![v6 isReadyForMoreMediaData])
  {
LABEL_6:
    int v7 = 0;
    goto LABEL_7;
  }
  int v7 = 0;
  if (a3 && self->_status == 1)
  {
    if (([v6 appendSampleBuffer:a3] & 1) == 0)
    {
      CFRelease(a3);
      self->_status = 3;
      int v7 = -18;
      goto LABEL_7;
    }
    CFRelease(a3);
    goto LABEL_6;
  }
LABEL_7:

  return v7;
}

- (int)addStyleInfoData:(id)a3 timerange:(id *)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_alloc(MEMORY[0x1E4F166C0]);
  v13[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  long long v9 = *(_OWORD *)&a4->var0.var3;
  v12[0] = *(_OWORD *)&a4->var0.var0;
  v12[1] = v9;
  v12[2] = *(_OWORD *)&a4->var1.var1;
  CFStringRef v10 = (void *)[v7 initWithItems:v8 timeRange:v12];

  [(AVAssetWriterInputMetadataAdaptor *)self->_styleInfoAdaptor appendTimedMetadataGroup:v10];
  return 0;
}

- (int)processStillImageMetadataTrack
{
  dispatch_group_enter((dispatch_group_t)self->_encodingGroup);
  stillImageInput = self->_stillImageInput;
  metadataQueue = self->_metadataQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__VCPMovieAssetWriter_processStillImageMetadataTrack__block_invoke;
  v6[3] = &unk_1E6296FF8;
  v6[4] = self;
  [(AVAssetWriterInput *)stillImageInput requestMediaDataWhenReadyOnQueue:metadataQueue usingBlock:v6];
  return 0;
}

void __53__VCPMovieAssetWriter_processStillImageMetadataTrack__block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 104) isReadyForMoreMediaData])
  {
    do
    {
      uint64_t v2 = *(void *)(a1 + 32);
      if (*(void *)(v2 + 240) != 1) {
        break;
      }
      int v3 = (opaqueCMSampleBuffer *)[*(id *)(v2 + 40) copyNextSampleBuffer];
      if (!v3)
      {
        char v6 = 0;
        char v5 = 1;
        goto LABEL_8;
      }
      uint64_t v4 = v3;
      if (CMSampleBufferGetNumSamples(v3))
      {
        CMTime outputPresentationTimeStamp = *(CMTime *)(*(void *)(a1 + 32) + 264);
        CMSampleBufferSetOutputPresentationTimeStamp(v4, &outputPresentationTimeStamp);
        if (([*(id *)(*(void *)(a1 + 32) + 104) appendSampleBuffer:v4] & 1) == 0)
        {
          CFRelease(v4);
          char v5 = 0;
          char v6 = 1;
          goto LABEL_8;
        }
      }
      CFRelease(v4);
    }
    while (([*(id *)(*(void *)(a1 + 32) + 104) isReadyForMoreMediaData] & 1) != 0);
  }
  char v5 = 0;
  char v6 = 0;
LABEL_8:
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(NSObject **)(v7 + 200);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__VCPMovieAssetWriter_processStillImageMetadataTrack__block_invoke_2;
  v9[3] = &unk_1E629B0B0;
  v9[4] = v7;
  char v10 = v6;
  char v11 = v5;
  dispatch_sync(v8, v9);
}

void __53__VCPMovieAssetWriter_processStillImageMetadataTrack__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 240);
  if (v2 != 3 && !*(unsigned char *)(a1 + 40) && !*(unsigned char *)(a1 + 41)) {
    return;
  }
  if (*(unsigned char *)(a1 + 41))
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      int v3 = VCPLogInstance();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        __int16 v9 = 0;
        uint64_t v4 = "[FRC] Still image metadata encoding finished";
        char v5 = (uint8_t *)&v9;
LABEL_16:
        _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_DEBUG, v4, v5, 2u);
        goto LABEL_17;
      }
      goto LABEL_17;
    }
  }
  else
  {
    if (!*(unsigned char *)(a1 + 40))
    {
      if (v2 != 3 || (int)MediaAnalysisLogLevel() < 7) {
        goto LABEL_18;
      }
      int v3 = VCPLogInstance();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_17;
      }
      LOWORD(v7) = 0;
      uint64_t v4 = "[FRC] Still image metadata aborted";
      char v5 = (uint8_t *)&v7;
      goto LABEL_16;
    }
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      int v3 = VCPLogInstance();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        __int16 v8 = 0;
        uint64_t v4 = "[FRC] Still image metadata failed";
        char v5 = (uint8_t *)&v8;
        goto LABEL_16;
      }
LABEL_17:
    }
  }
LABEL_18:
  uint64_t v6 = *(void *)(a1 + 32);
  if (*(void *)(v6 + 240) == 1)
  {
    if (*(unsigned char *)(a1 + 40))
    {
      *(void *)(v6 + 240) = 3;
      uint64_t v6 = *(void *)(a1 + 32);
    }
  }
  objc_msgSend(*(id *)(v6 + 104), "markAsFinished", v7);
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 144));
}

- (int)processLivePhotoInfoMetadataTrack
{
  dispatch_group_enter((dispatch_group_t)self->_encodingGroup);
  livePhotoInfoInput = self->_livePhotoInfoInput;
  metadataQueue = self->_metadataQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__VCPMovieAssetWriter_processLivePhotoInfoMetadataTrack__block_invoke;
  v6[3] = &unk_1E6296FF8;
  v6[4] = self;
  [(AVAssetWriterInput *)livePhotoInfoInput requestMediaDataWhenReadyOnQueue:metadataQueue usingBlock:v6];
  return 0;
}

void __56__VCPMovieAssetWriter_processLivePhotoInfoMetadataTrack__block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 96) isReadyForMoreMediaData])
  {
    while (1)
    {
      uint64_t v2 = *(void **)(a1 + 32);
      if (v2[30] != 1) {
        goto LABEL_7;
      }
      int v3 = (const void *)[v2 popLivePhotoInfoSample];
      uint64_t v12 = v3;
      uint64_t v4 = *(void *)(a1 + 32);
      if (*(void *)(v4 + 240) == 3) {
        break;
      }
      if (!v3)
      {
        char v5 = 0;
        char v6 = 1;
        goto LABEL_11;
      }
      if (([*(id *)(v4 + 96) appendSampleBuffer:v3] & 1) == 0)
      {
        char v6 = 0;
        char v5 = 1;
        goto LABEL_11;
      }
      CF<opaqueCMSampleBuffer *>::~CF(&v12);
      if (([*(id *)(*(void *)(a1 + 32) + 96) isReadyForMoreMediaData] & 1) == 0) {
        goto LABEL_7;
      }
    }
    char v5 = 0;
    char v6 = 0;
LABEL_11:
    CF<opaqueCMSampleBuffer *>::~CF(&v12);
    goto LABEL_12;
  }
LABEL_7:
  char v5 = 0;
  char v6 = 0;
LABEL_12:
  uint64_t v7 = *(void *)(a1 + 32);
  __int16 v8 = *(NSObject **)(v7 + 200);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__VCPMovieAssetWriter_processLivePhotoInfoMetadataTrack__block_invoke_2;
  block[3] = &unk_1E629B0B0;
  block[4] = v7;
  char v10 = v5;
  char v11 = v6;
  dispatch_sync(v8, block);
}

void __56__VCPMovieAssetWriter_processLivePhotoInfoMetadataTrack__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 240);
  if (v2 != 3 && !*(unsigned char *)(a1 + 40) && !*(unsigned char *)(a1 + 41)) {
    return;
  }
  if (*(unsigned char *)(a1 + 41))
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      int v3 = VCPLogInstance();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        __int16 v9 = 0;
        uint64_t v4 = "[FRC] Live photo info encoding finished";
        char v5 = (uint8_t *)&v9;
LABEL_16:
        _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_DEBUG, v4, v5, 2u);
        goto LABEL_17;
      }
      goto LABEL_17;
    }
  }
  else
  {
    if (!*(unsigned char *)(a1 + 40))
    {
      if (v2 != 3 || (int)MediaAnalysisLogLevel() < 7) {
        goto LABEL_18;
      }
      int v3 = VCPLogInstance();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_17;
      }
      LOWORD(v7) = 0;
      uint64_t v4 = "[FRC] Live photo info encoding aborted";
      char v5 = (uint8_t *)&v7;
      goto LABEL_16;
    }
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      int v3 = VCPLogInstance();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        __int16 v8 = 0;
        uint64_t v4 = "[FRC] Live photo info encoding failed";
        char v5 = (uint8_t *)&v8;
        goto LABEL_16;
      }
LABEL_17:
    }
  }
LABEL_18:
  uint64_t v6 = *(void *)(a1 + 32);
  if (*(void *)(v6 + 240) == 1)
  {
    if (*(unsigned char *)(a1 + 40))
    {
      *(void *)(v6 + 240) = 3;
      uint64_t v6 = *(void *)(a1 + 32);
    }
  }
  objc_msgSend(*(id *)(v6 + 96), "markAsFinished", v7);
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 144));
}

- (int)passthroughMetadataTrackFrom:(id)a3 to:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_group_enter((dispatch_group_t)self->_encodingGroup);
  metadataQueue = self->_metadataQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__VCPMovieAssetWriter_passthroughMetadataTrackFrom_to___block_invoke;
  _OWORD v12[3] = &unk_1E6299338;
  id v13 = v7;
  uint64_t v14 = self;
  id v15 = v6;
  id v9 = v6;
  id v10 = v7;
  [v10 requestMediaDataWhenReadyOnQueue:metadataQueue usingBlock:v12];

  return 0;
}

void __55__VCPMovieAssetWriter_passthroughMetadataTrackFrom_to___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isReadyForMoreMediaData])
  {
    while (*(void *)(*(void *)(a1 + 40) + 240) == 1)
    {
      uint64_t v2 = [*(id *)(a1 + 48) copyNextSampleBuffer];
      if (!v2)
      {
        char v6 = 0;
        char v5 = 1;
        goto LABEL_7;
      }
      int v3 = (const void *)v2;
      int v4 = [*(id *)(a1 + 32) appendSampleBuffer:v2];
      CFRelease(v3);
      if (!v4)
      {
        char v5 = 0;
        char v6 = 1;
        goto LABEL_7;
      }
      if (([*(id *)(a1 + 32) isReadyForMoreMediaData] & 1) == 0) {
        break;
      }
    }
  }
  char v5 = 0;
  char v6 = 0;
LABEL_7:
  uint64_t v7 = *(void *)(a1 + 40);
  __int16 v8 = *(NSObject **)(v7 + 200);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__VCPMovieAssetWriter_passthroughMetadataTrackFrom_to___block_invoke_2;
  v9[3] = &unk_1E629B0D8;
  v9[4] = v7;
  char v12 = v6;
  char v13 = v5;
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 32);
  dispatch_sync(v8, v9);
}

void __55__VCPMovieAssetWriter_passthroughMetadataTrackFrom_to___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 240) != 3 && !*(unsigned char *)(a1 + 56) && !*(unsigned char *)(a1 + 57)) {
    return;
  }
  uint64_t v2 = [*(id *)(a1 + 40) track];
  int v3 = [v2 formatDescriptions];
  int v4 = [v3 firstObject];

  if (v4)
  {
    char v5 = CMMetadataFormatDescriptionGetIdentifiers((CMMetadataFormatDescriptionRef)v4);
  }
  else
  {
    char v5 = 0;
  }
  if (*(unsigned char *)(a1 + 57))
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      char v6 = VCPLogInstance();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)id v9 = 138412290;
        *(void *)&v9[4] = v5;
        uint64_t v7 = "[FRC] Metadata track encoding finished: %@";
LABEL_19:
        _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_DEBUG, v7, v9, 0xCu);
        goto LABEL_20;
      }
      goto LABEL_20;
    }
  }
  else
  {
    if (!*(unsigned char *)(a1 + 56))
    {
      if (*(void *)(*(void *)(a1 + 32) + 240) != 3 || (int)MediaAnalysisLogLevel() < 7) {
        goto LABEL_21;
      }
      char v6 = VCPLogInstance();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_20;
      }
      *(_DWORD *)id v9 = 138412290;
      *(void *)&v9[4] = v5;
      uint64_t v7 = "[FRC] Metadata track aborted: %@";
      goto LABEL_19;
    }
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      char v6 = VCPLogInstance();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)id v9 = 138412290;
        *(void *)&v9[4] = v5;
        uint64_t v7 = "[FRC] Metadata track failed: %@";
        goto LABEL_19;
      }
LABEL_20:
    }
  }
LABEL_21:
  uint64_t v8 = *(void *)(a1 + 32);
  if (*(void *)(v8 + 240) == 1)
  {
    if (*(unsigned char *)(a1 + 56)) {
      *(void *)(v8 + 240) = 3;
    }
  }
  objc_msgSend(*(id *)(a1 + 48), "markAsFinished", *(_OWORD *)v9);
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 144));
}

- (int)passthroughAuxTrackFrom:(id)a3 to:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_group_enter((dispatch_group_t)self->_encodingGroup);
  metadataQueue = self->_metadataQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __50__VCPMovieAssetWriter_passthroughAuxTrackFrom_to___block_invoke;
  _OWORD v12[3] = &unk_1E6299338;
  id v13 = v7;
  uint64_t v14 = self;
  id v15 = v6;
  id v9 = v6;
  id v10 = v7;
  [v10 requestMediaDataWhenReadyOnQueue:metadataQueue usingBlock:v12];

  return 0;
}

void __50__VCPMovieAssetWriter_passthroughAuxTrackFrom_to___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isReadyForMoreMediaData])
  {
    while (*(void *)(*(void *)(a1 + 40) + 240) == 1)
    {
      uint64_t v2 = [*(id *)(a1 + 48) copyNextSampleBuffer];
      if (!v2)
      {
        char v6 = 0;
        char v5 = 1;
        goto LABEL_7;
      }
      int v3 = (const void *)v2;
      int v4 = [*(id *)(a1 + 32) appendSampleBuffer:v2];
      CFRelease(v3);
      if (!v4)
      {
        char v5 = 0;
        char v6 = 1;
        goto LABEL_7;
      }
      if (([*(id *)(a1 + 32) isReadyForMoreMediaData] & 1) == 0) {
        break;
      }
    }
  }
  char v5 = 0;
  char v6 = 0;
LABEL_7:
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(NSObject **)(v7 + 200);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__VCPMovieAssetWriter_passthroughAuxTrackFrom_to___block_invoke_2;
  block[3] = &unk_1E629B100;
  block[4] = v7;
  char v11 = v6;
  char v12 = v5;
  id v10 = *(id *)(a1 + 32);
  dispatch_sync(v8, block);
}

void __50__VCPMovieAssetWriter_passthroughAuxTrackFrom_to___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 240);
  if (v2 != 3 && !*(unsigned char *)(a1 + 48) && !*(unsigned char *)(a1 + 49)) {
    return;
  }
  if (*(unsigned char *)(a1 + 49))
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      int v3 = VCPLogInstance();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        __int16 v9 = 0;
        int v4 = "[FRC] Aux track encoding finished";
        char v5 = (uint8_t *)&v9;
LABEL_16:
        _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_DEBUG, v4, v5, 2u);
        goto LABEL_17;
      }
      goto LABEL_17;
    }
  }
  else
  {
    if (!*(unsigned char *)(a1 + 48))
    {
      if (v2 != 3 || (int)MediaAnalysisLogLevel() < 7) {
        goto LABEL_18;
      }
      int v3 = VCPLogInstance();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_17;
      }
      LOWORD(v7) = 0;
      int v4 = "[FRC] Aux track aborted";
      char v5 = (uint8_t *)&v7;
      goto LABEL_16;
    }
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      int v3 = VCPLogInstance();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        __int16 v8 = 0;
        int v4 = "[FRC] Aux track failed";
        char v5 = (uint8_t *)&v8;
        goto LABEL_16;
      }
LABEL_17:
    }
  }
LABEL_18:
  uint64_t v6 = *(void *)(a1 + 32);
  if (*(void *)(v6 + 240) == 1)
  {
    if (*(unsigned char *)(a1 + 48)) {
      *(void *)(v6 + 240) = 3;
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "markAsFinished", v7);
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 144));
}

- (int)finish
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self->_status != 1) {
    return -18;
  }
  if (self->_enableAudio) {
    [(VCPMovieAssetWriter *)self appendMetadataTrack];
  }
  [(VCPMovieAssetWriter *)self pushSample:0];
  if (self->_enableStyle && self->_hasStyleApplied) {
    [(VCPMovieAssetWriter *)self pushAuxSample:0];
  }
  [(VCPMovieAssetWriter *)self pushLivePhotoInfoSample:0];
  dispatch_group_wait((dispatch_group_t)self->_encodingGroup, 0xFFFFFFFFFFFFFFFFLL);
  if (self->_status == 3) {
    return -18;
  }
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  writer = self->_writer;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __29__VCPMovieAssetWriter_finish__block_invoke;
  uint64_t v14 = &unk_1E62982E8;
  id v15 = self;
  uint64_t v6 = v4;
  CFTypeRef v16 = v6;
  [(AVAssetWriter *)writer finishWritingWithCompletionHandler:&v11];
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v7 = [(AVAssetWriter *)self->_writer error];
  LOBYTE(writer) = v7 == 0;

  if (writer)
  {
    int v3 = 0;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      __int16 v8 = VCPLogInstance();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        __int16 v9 = [(AVAssetWriter *)self->_writer error];
        *(_DWORD *)buf = 138412290;
        int v18 = v9;
        _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_ERROR, "Asset writer failed to complete with error %@", buf, 0xCu);
      }
    }
    int v3 = -18;
  }

  return v3;
}

intptr_t __29__VCPMovieAssetWriter_finish__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 240) = 2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)cancel
{
  statusOperationQueue = self->_statusOperationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__VCPMovieAssetWriter_cancel__block_invoke;
  block[3] = &unk_1E6296FF8;
  block[4] = self;
  dispatch_sync(statusOperationQueue, block);
  dispatch_group_wait((dispatch_group_t)self->_encodingGroup, 0xFFFFFFFFFFFFFFFFLL);
  [(AVAssetWriter *)self->_writer cancelWriting];
  [(AVAssetReader *)self->_assetReader cancelReading];
}

uint64_t __29__VCPMovieAssetWriter_cancel__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 240);
  int v3 = MediaAnalysisLogLevel();
  if (v2 == 3)
  {
    if (v3 >= 7)
    {
      dispatch_semaphore_t v4 = VCPLogInstance();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEBUG, "[FRC] Encoding failed", buf, 2u);
      }
    }
  }
  else
  {
    if (v3 >= 7)
    {
      char v5 = VCPLogInstance();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)__int16 v8 = 0;
        _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_DEBUG, "[FRC] Cancelling encoding", v8, 2u);
      }
    }
    *(void *)(*(void *)(a1 + 32) + 240) = 3;
  }
  while (1)
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 160));
    if (![*(id *)(*(void *)(a1 + 32) + 120) count]) {
      break;
    }
    [*(id *)(a1 + 32) popSample];
  }
  while (1)
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 192));
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 136) count];
    if (!result) {
      break;
    }
    [*(id *)(a1 + 32) popLivePhotoInfoSample];
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v7 + 290))
  {
    while (1)
    {
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v7 + 176));
      uint64_t result = [*(id *)(*(void *)(a1 + 32) + 128) count];
      if (!result) {
        break;
      }
      [*(id *)(a1 + 32) popAuxSample];
      uint64_t v7 = *(void *)(a1 + 32);
    }
  }
  return result;
}

- (int64_t)status
{
  return self->_status;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleInfoAdaptor, 0);
  objc_storeStrong((id *)&self->_auxInputToOutputMap, 0);
  objc_storeStrong((id *)&self->_inputToOutputMap, 0);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_transferSession.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_pixelBufferPool.value_);
  objc_storeStrong((id *)&self->_metadataQueue, 0);
  objc_storeStrong((id *)&self->_audioQueue, 0);
  objc_storeStrong((id *)&self->_auxQueue, 0);
  objc_storeStrong((id *)&self->_videoQueue, 0);
  objc_storeStrong((id *)&self->_statusOperationQueue, 0);
  objc_storeStrong((id *)&self->_livePhotoInfoDequeueSemaphore, 0);
  objc_storeStrong((id *)&self->_livePhotoInfoEnqueueSemaphore, 0);
  objc_storeStrong((id *)&self->_auxDequeueSemaphore, 0);
  objc_storeStrong((id *)&self->_auxEnqueueSemaphore, 0);
  objc_storeStrong((id *)&self->_dequeueSemaphore, 0);
  objc_storeStrong((id *)&self->_enqueueSemaphore, 0);
  objc_storeStrong((id *)&self->_encodingGroup, 0);
  objc_storeStrong((id *)&self->_livePhotoInfoQueue, 0);
  objc_storeStrong((id *)&self->_auxsampleQueue, 0);
  objc_storeStrong((id *)&self->_sampleQueue, 0);
  objc_storeStrong((id *)&self->_videoOrientationInput, 0);
  objc_storeStrong((id *)&self->_stillImageInput, 0);
  objc_storeStrong((id *)&self->_livePhotoInfoInput, 0);
  objc_storeStrong((id *)&self->_audioInput, 0);
  objc_storeStrong((id *)&self->_auxInput, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_writer, 0);
  objc_storeStrong((id *)&self->_audioTrack, 0);
  objc_storeStrong((id *)&self->_track, 0);
  objc_storeStrong((id *)&self->_stillImageOutput, 0);
  objc_storeStrong((id *)&self->_videoOrientationOutput, 0);
  objc_storeStrong((id *)&self->_audioOutput, 0);
  objc_storeStrong((id *)&self->_assetReader, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

- (id).cxx_construct
{
  *((void *)self + 31) = 0;
  *((void *)self + 32) = 0;
  return self;
}

@end