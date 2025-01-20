@interface VideoWriter
- (AVAssetWriter)assetWriter;
- (AVAssetWriterInput)writerInput;
- (AVAssetWriterInputPixelBufferAdaptor)inputAdaptor;
- (BOOL)initFailed;
- (CGAffineTransform)preferredTransform;
- (NSConditionLock)inputLock;
- (NSError)lastError;
- (OS_dispatch_queue)frameWriteQueue;
- (__CVBuffer)createPixelBuffer;
- (float)fps;
- (id)addFrame:(CGImage *)a3;
- (id)addFrameAsPixelBuf:(__CVBuffer *)a3;
- (id)addFrameAsPixelBuf:(__CVBuffer *)a3 atFrameTime:(id *)a4;
- (id)finish;
- (id)initForPath:(const char *)a3 fileType:(id)a4 codecType:(id)a5 imgWidth:(unsigned int)a6 imgHeight:(unsigned int)a7 fps:(float)a8 pixFormat:(unsigned int)a9 metadata:(id)a10;
- (id)initForURL:(id)a3 fileType:(id)a4 codecType:(id)a5 imgWidth:(unsigned int)a6 imgHeight:(unsigned int)a7 fps:(float)a8 pixFormat:(unsigned int)a9 metadata:(id)a10;
- (id)initForURL:(id)a3 fileType:(id)a4 codecType:(id)a5 imgWidth:(unsigned int)a6 imgHeight:(unsigned int)a7 fps:(float)a8 timeScale:(int)a9 transform:(CGAffineTransform *)a10 pixFormat:(unsigned int)a11 metadata:(id)a12;
- (int)timeScale;
- (int64_t)currFrame;
- (int64_t)currFrameTime;
- (int64_t)frameIncr;
- (unsigned)imgHeight;
- (unsigned)imgWidth;
- (unsigned)pixelFormat;
- (void)endSessionAtTime:(id *)a3;
- (void)endSessionInfer;
- (void)setAssetWriter:(id)a3;
- (void)setCurrFrameTime:(int64_t)a3;
- (void)setFrameIncr:(int64_t)a3;
- (void)setFrameWriteQueue:(id)a3;
- (void)setInitFailed:(BOOL)a3;
- (void)setInputAdaptor:(id)a3;
- (void)setInputLock:(id)a3;
- (void)setInputReady;
- (void)setWriterInput:(id)a3;
@end

@implementation VideoWriter

- (id)initForURL:(id)a3 fileType:(id)a4 codecType:(id)a5 imgWidth:(unsigned int)a6 imgHeight:(unsigned int)a7 fps:(float)a8 pixFormat:(unsigned int)a9 metadata:(id)a10
{
  long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v13[0] = *MEMORY[0x1E4F1DAB8];
  v13[1] = v10;
  v13[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  LODWORD(v12) = a9;
  return -[VideoWriter initForURL:fileType:codecType:imgWidth:imgHeight:fps:timeScale:transform:pixFormat:metadata:](self, "initForURL:fileType:codecType:imgWidth:imgHeight:fps:timeScale:transform:pixFormat:metadata:", a3, a4, a5, *(void *)&a6, *(void *)&a7, 0, v13, v12, a10);
}

- (id)initForURL:(id)a3 fileType:(id)a4 codecType:(id)a5 imgWidth:(unsigned int)a6 imgHeight:(unsigned int)a7 fps:(float)a8 timeScale:(int)a9 transform:(CGAffineTransform *)a10 pixFormat:(unsigned int)a11 metadata:(id)a12
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v20 = a4;
  id v21 = a5;
  id v22 = a12;
  v77.receiver = self;
  v77.super_class = (Class)VideoWriter;
  v23 = [(VideoWriter *)&v77 init];
  v24 = v23;
  if (!v23) {
    goto LABEL_18;
  }
  assetWriter = v23->_assetWriter;
  v23->_assetWriter = 0;

  writerInput = v24->_writerInput;
  v24->_writerInput = 0;

  inputAdaptor = v24->_inputAdaptor;
  v24->_inputAdaptor = 0;

  v24->fps = a8;
  v24->currFrame = 0;
  v24->_currFrameTime = 0;
  v24->imgWidth = a6;
  v24->imgHeight = a7;
  v24->_initFailed = 0;
  if (a9)
  {
    v24->timeScale = a9;
    float v28 = (float)a9;
  }
  else if (a8 == 60.0)
  {
    v24->timeScale = 6000;
    float v28 = 6000.0;
  }
  else
  {
    v24->timeScale = 90000;
    float v28 = 90000.0;
  }
  v24->pixelFormat = a11;
  long long v29 = *(_OWORD *)&a10->a;
  long long v30 = *(_OWORD *)&a10->c;
  *(_OWORD *)&v24->preferredTransform.tx = *(_OWORD *)&a10->tx;
  *(_OWORD *)&v24->preferredTransform.c = v30;
  *(_OWORD *)&v24->preferredTransform.a = v29;
  v24->_frameIncr = (uint64_t)(float)(v28 / a8);
  uint64_t v31 = [objc_alloc(MEMORY[0x1E4F28BB8]) initWithCondition:1];
  inputLock = v24->_inputLock;
  v24->_inputLock = (NSConditionLock *)v31;

  dispatch_queue_t v33 = dispatch_queue_create("frame write queue", 0);
  frameWriteQueue = v24->_frameWriteQueue;
  v24->_frameWriteQueue = (OS_dispatch_queue *)v33;

  [v19 getFileSystemRepresentation:v78 maxLength:1000];
  unlink(v78);
  id v76 = 0;
  uint64_t v35 = [objc_alloc(MEMORY[0x1E4F163B8]) initWithURL:v19 fileType:v20 error:&v76];
  v36 = (NSError *)v76;
  v37 = v24->_assetWriter;
  v24->_assetWriter = (AVAssetWriter *)v35;

  if (!v24->_assetWriter)
  {
    NSLog(&cfstr_AvassetwriterI.isa, v36);
    lastError = v24->lastError;
    v24->lastError = v36;
    v54 = v36;

    v24->_initFailed = 1;
    v58 = v24;
LABEL_29:

    goto LABEL_30;
  }
  v69 = v36;
  id v70 = v20;
  id v38 = v22;
  v39 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v40 = *MEMORY[0x1E4F16220];
  v41 = [NSNumber numberWithUnsignedInt:v24->imgWidth];
  id v42 = v21;
  uint64_t v43 = *MEMORY[0x1E4F16300];
  v44 = [NSNumber numberWithUnsignedInt:v24->imgHeight];
  uint64_t v68 = v43;
  id v21 = v42;
  v45 = objc_msgSend(v39, "dictionaryWithObjectsAndKeys:", v42, v40, v41, v68, v44, *MEMORY[0x1E4F162A0], 0);

  uint64_t v46 = [MEMORY[0x1E4F163C0] assetWriterInputWithMediaType:*MEMORY[0x1E4F15C18] outputSettings:v45];
  v47 = v24->_writerInput;
  v24->_writerInput = (AVAssetWriterInput *)v46;

  v48 = v24->_writerInput;
  if (!v48)
  {
    NSLog(&cfstr_Avassetwriteri.isa);

    v58 = 0;
    id v22 = v38;
    id v20 = v70;
    goto LABEL_30;
  }
  [(AVAssetWriterInput *)v48 setMediaTimeScale:v24->timeScale];
  long long v49 = *(_OWORD *)&v24->preferredTransform.c;
  v75[0] = *(_OWORD *)&v24->preferredTransform.a;
  v75[1] = v49;
  v75[2] = *(_OWORD *)&v24->preferredTransform.tx;
  [(AVAssetWriterInput *)v24->_writerInput setTransform:v75];
  [(AVAssetWriter *)v24->_assetWriter setMovieTimeScale:v24->timeScale];
  if (a11) {
    __int16 v50 = a11;
  }
  else {
    __int16 v50 = 193;
  }
  v51 = sub_1DD3D9ABC(v50, 0);
  uint64_t v52 = [MEMORY[0x1E4F163D8] assetWriterInputPixelBufferAdaptorWithAssetWriterInput:v24->_writerInput sourcePixelBufferAttributes:v51];
  v53 = v24->_inputAdaptor;
  v24->_inputAdaptor = (AVAssetWriterInputPixelBufferAdaptor *)v52;

  id v22 = v38;
  if (!v24->_inputAdaptor)
  {
    NSLog(&cfstr_Avassetwriteri_0.isa);
    v58 = 0;
    id v21 = v42;
    v54 = v69;
    id v20 = v70;
LABEL_28:

    goto LABEL_29;
  }
  id v21 = v42;
  id v20 = v70;
  if (![(AVAssetWriter *)v24->_assetWriter canAddInput:v24->_writerInput])
  {
    NSLog(&cfstr_AvassetwriterC.isa);
    v58 = 0;
    v54 = v69;
    goto LABEL_28;
  }
  [(AVAssetWriter *)v24->_assetWriter addInput:v24->_writerInput];
  v54 = v69;
  if (v22) {
    [(AVAssetWriter *)v24->_assetWriter setMetadata:v22];
  }
  if (![(AVAssetWriter *)v24->_assetWriter startWriting])
  {
    NSLog(&cfstr_ErrorInVideowr.isa);
    NSLog(&cfstr_VideowriterSta.isa, [(AVAssetWriter *)v24->_assetWriter status]);
    v60 = [(AVAssetWriter *)v24->_assetWriter error];
    NSLog(&cfstr_Error.isa, v60);

    v61 = [(AVAssetWriter *)v24->_assetWriter error];
    v62 = [v61 userInfo];

    if (v62)
    {
      v63 = [v62 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];
      v64 = v63;
      if (v63) {
        NSLog(&cfstr_UnderlyingErro.isa, [v63 code]);
      }
    }
    uint64_t v65 = [(AVAssetWriter *)v24->_assetWriter error];
    v66 = v24->lastError;
    v24->lastError = (NSError *)v65;

    v24->_initFailed = 1;
    v58 = v24;

    goto LABEL_28;
  }
  memset(&v74, 0, sizeof(v74));
  CMTimeMake(&v74, 0, v24->timeScale);
  v55 = v24->_assetWriter;
  CMTime v73 = v74;
  [(AVAssetWriter *)v55 startSessionAtSourceTime:&v73];
  v56 = v24->_writerInput;
  v57 = v24->_frameWriteQueue;
  v71[0] = MEMORY[0x1E4F143A8];
  v71[1] = 3221225472;
  v71[2] = sub_1DD3E1404;
  v71[3] = &unk_1E6CC0308;
  v72 = v24;
  [(AVAssetWriterInput *)v56 requestMediaDataWhenReadyOnQueue:v57 usingBlock:v71];

LABEL_18:
  v58 = v24;
LABEL_30:

  return v58;
}

- (id)initForPath:(const char *)a3 fileType:(id)a4 codecType:(id)a5 imgWidth:(unsigned int)a6 imgHeight:(unsigned int)a7 fps:(float)a8 pixFormat:(unsigned int)a9 metadata:(id)a10
{
  uint64_t v10 = *(void *)&a9;
  uint64_t v12 = *(void *)&a7;
  uint64_t v13 = *(void *)&a6;
  v18 = NSString;
  id v19 = a10;
  id v20 = a5;
  id v21 = a4;
  id v22 = [v18 stringWithCString:a3 encoding:4];
  v23 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v22 isDirectory:0];
  *(float *)&double v24 = a8;
  id v25 = [(VideoWriter *)self initForURL:v23 fileType:v21 codecType:v20 imgWidth:v13 imgHeight:v12 fps:v10 pixFormat:v24 metadata:v19];

  return v25;
}

- (void)setInputReady
{
  [(NSConditionLock *)self->_inputLock lockWhenCondition:1];
  inputLock = self->_inputLock;

  [(NSConditionLock *)inputLock unlockWithCondition:0];
}

- (id)addFrame:(CGImage *)a3
{
  if (self->_initFailed)
  {
    lastError = self->lastError;
    if (lastError)
    {
      v5 = [(NSError *)lastError localizedDescription];
    }
    else
    {
      v5 = @"VideoWriter: init I/O failure";
    }
  }
  else
  {
    CVPixelBufferRef v6 = sub_1DD3E0D14(a3);
    if (v6)
    {
      CVPixelBufferRef v7 = v6;
      v5 = [(VideoWriter *)self addFrameAsPixelBuf:v6];
      CFRelease(v7);
    }
    else
    {
      v5 = @"Error creating CVPixelBufferRef";
      NSLog(&stru_1F38968F8.isa, @"Error creating CVPixelBufferRef");
    }
  }

  return v5;
}

- (id)addFrameAsPixelBuf:(__CVBuffer *)a3
{
  if (self->_initFailed)
  {
    lastError = self->lastError;
    if (lastError)
    {
      v5 = [(NSError *)lastError localizedDescription];
    }
    else
    {
      v5 = @"VideoWriter: init I/O failure";
    }
  }
  else
  {
    if (![(AVAssetWriterInput *)self->_writerInput isReadyForMoreMediaData])
    {
      do
      {
        [(NSConditionLock *)self->_inputLock lockWhenCondition:0];
        [(NSConditionLock *)self->_inputLock unlock];
      }
      while (![(AVAssetWriterInput *)self->_writerInput isReadyForMoreMediaData]);
    }
    memset(&v15, 0, sizeof(v15));
    CMTimeMake(&v15, self->_currFrameTime, self->timeScale);
    self->_currFrameTime += self->_frameIncr;
    ++self->currFrame;
    inputAdaptor = self->_inputAdaptor;
    CMTime v14 = v15;
    BOOL v8 = [(AVAssetWriterInputPixelBufferAdaptor *)inputAdaptor appendPixelBuffer:a3 withPresentationTime:&v14];
    v5 = 0;
    if (!v8)
    {
      NSLog(&cfstr_Avassetwriteri_1.isa);
      v9 = [(AVAssetWriter *)self->_assetWriter error];
      NSLog(&cfstr_AssetwriterErr.isa, v9);

      NSLog(&cfstr_AssetwriterSta.isa, [(AVAssetWriter *)self->_assetWriter status]);
      uint64_t v10 = [(AVAssetWriter *)self->_assetWriter error];
      v11 = self->lastError;
      self->lastError = v10;

      uint64_t v12 = [(AVAssetWriter *)self->_assetWriter error];
      v5 = [v12 localizedDescription];
    }
    [(NSConditionLock *)self->_inputLock lock];
    [(NSConditionLock *)self->_inputLock unlockWithCondition:1];
  }

  return v5;
}

- (id)addFrameAsPixelBuf:(__CVBuffer *)a3 atFrameTime:(id *)a4
{
  if (self->_initFailed)
  {
    lastError = self->lastError;
    if (lastError)
    {
      CVPixelBufferRef v6 = [(NSError *)lastError localizedDescription];
    }
    else
    {
      CVPixelBufferRef v6 = @"VideoWriter: init I/O failure";
    }
  }
  else
  {
    if (![(AVAssetWriterInput *)self->_writerInput isReadyForMoreMediaData])
    {
      do
      {
        [(NSConditionLock *)self->_inputLock lockWhenCondition:0];
        [(NSConditionLock *)self->_inputLock unlock];
      }
      while (![(AVAssetWriterInput *)self->_writerInput isReadyForMoreMediaData]);
    }
    int32_t timeScale = self->timeScale;
    if (a4->var1 != timeScale)
    {
      CMTime time = (CMTime)*a4;
      CMTimeConvertScale(&v17, &time, timeScale, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
      *(CMTime *)a4 = v17;
    }
    self->_currFrameTime = a4->var0;
    ++self->currFrame;
    inputAdaptor = self->_inputAdaptor;
    CMTime v17 = (CMTime)*a4;
    if ([(AVAssetWriterInputPixelBufferAdaptor *)inputAdaptor appendPixelBuffer:a3 withPresentationTime:&v17])
    {
      CVPixelBufferRef v6 = 0;
    }
    else
    {
      NSLog(&cfstr_Avassetwriteri_1.isa);
      v11 = [(AVAssetWriter *)self->_assetWriter error];
      NSLog(&cfstr_AssetwriterErr.isa, v11);

      NSLog(&cfstr_AssetwriterSta.isa, [(AVAssetWriter *)self->_assetWriter status]);
      uint64_t v12 = [(AVAssetWriter *)self->_assetWriter error];
      uint64_t v13 = self->lastError;
      self->lastError = v12;

      CMTime v14 = [(AVAssetWriter *)self->_assetWriter error];
      CVPixelBufferRef v6 = [v14 localizedDescription];
    }
    [(NSConditionLock *)self->_inputLock lock];
    [(NSConditionLock *)self->_inputLock unlockWithCondition:1];
  }

  return v6;
}

- (__CVBuffer)createPixelBuffer
{
  if (self->_initFailed) {
    return 0;
  }
  CVPixelBufferRef pixelBufferOut = 0;
  uint64_t v2 = CVPixelBufferPoolCreatePixelBuffer(0, [(AVAssetWriterInputPixelBufferAdaptor *)self->_inputAdaptor pixelBufferPool], &pixelBufferOut);
  if (v2)
  {
    NSLog(&cfstr_VideowriterCvp.isa, v2);
    return 0;
  }
  result = pixelBufferOut;
  if (!pixelBufferOut)
  {
    NSLog(&cfstr_VideowriterCvp_0.isa);
    return 0;
  }
  return result;
}

- (void)endSessionAtTime:(id *)a3
{
  assetWriter = self->_assetWriter;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4 = *a3;
  [(AVAssetWriter *)assetWriter endSessionAtSourceTime:&v4];
}

- (void)endSessionInfer
{
  memset(&v4, 0, sizeof(v4));
  CMTimeMake(&v4, self->_currFrameTime, self->timeScale);
  self->_currFrameTime += self->_frameIncr;
  ++self->currFrame;
  CMTime v3 = v4;
  [(VideoWriter *)self endSessionAtTime:&v3];
}

- (id)finish
{
  if (self->_initFailed)
  {
    lastError = self->lastError;
    if (lastError)
    {
      CMTime v4 = [(NSError *)lastError localizedDescription];
    }
    else
    {
      CMTime v4 = @"VideoWriter: init I/O failure";
    }
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3032000000;
    CMTime v15 = sub_1DD3E1C6C;
    v16 = sub_1DD3E1C7C;
    id v17 = (id)[objc_alloc(MEMORY[0x1E4F28BB8]) initWithCondition:0];
    assetWriter = self->_assetWriter;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1DD3E1C84;
    v11[3] = &unk_1E6CC0360;
    v11[4] = &v12;
    [(AVAssetWriter *)assetWriter finishWritingWithCompletionHandler:v11];
    [(id)v13[5] lockWhenCondition:1];
    [(id)v13[5] unlockWithCondition:1];
    [(NSConditionLock *)self->_inputLock lock];
    [(NSConditionLock *)self->_inputLock unlockWithCondition:1];
    if ([(AVAssetWriter *)self->_assetWriter status] == AVAssetWriterStatusCompleted)
    {
      CMTime v4 = 0;
    }
    else
    {
      NSLog(&cfstr_AssetwriterSta_0.isa, [(AVAssetWriter *)self->_assetWriter status]);
      CVPixelBufferRef v6 = [(AVAssetWriter *)self->_assetWriter error];
      CMTime v4 = [v6 localizedDescription];

      CVPixelBufferRef v7 = [(AVAssetWriter *)self->_assetWriter error];
      NSLog(&cfstr_Error.isa, v7);

      BOOL v8 = [(AVAssetWriter *)self->_assetWriter error];
      v9 = self->lastError;
      self->lastError = v8;
    }
    _Block_object_dispose(&v12, 8);
  }

  return v4;
}

- (float)fps
{
  return self->fps;
}

- (int64_t)currFrame
{
  return self->currFrame;
}

- (unsigned)imgWidth
{
  return self->imgWidth;
}

- (unsigned)imgHeight
{
  return self->imgHeight;
}

- (int)timeScale
{
  return self->timeScale;
}

- (unsigned)pixelFormat
{
  return self->pixelFormat;
}

- (CGAffineTransform)preferredTransform
{
  objc_copyStruct(retstr, &self->preferredTransform, 48, 1, 0);
  return result;
}

- (NSError)lastError
{
  return (NSError *)objc_getProperty(self, a2, 40, 1);
}

- (AVAssetWriter)assetWriter
{
  return (AVAssetWriter *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAssetWriter:(id)a3
{
}

- (AVAssetWriterInput)writerInput
{
  return (AVAssetWriterInput *)objc_getProperty(self, a2, 56, 1);
}

- (void)setWriterInput:(id)a3
{
}

- (AVAssetWriterInputPixelBufferAdaptor)inputAdaptor
{
  return (AVAssetWriterInputPixelBufferAdaptor *)objc_getProperty(self, a2, 64, 1);
}

- (void)setInputAdaptor:(id)a3
{
}

- (NSConditionLock)inputLock
{
  return (NSConditionLock *)objc_getProperty(self, a2, 72, 1);
}

- (void)setInputLock:(id)a3
{
}

- (OS_dispatch_queue)frameWriteQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 80, 1);
}

- (void)setFrameWriteQueue:(id)a3
{
}

- (int64_t)currFrameTime
{
  return self->_currFrameTime;
}

- (void)setCurrFrameTime:(int64_t)a3
{
  self->_currFrameTime = a3;
}

- (int64_t)frameIncr
{
  return self->_frameIncr;
}

- (void)setFrameIncr:(int64_t)a3
{
  self->_frameIncr = a3;
}

- (BOOL)initFailed
{
  return self->_initFailed;
}

- (void)setInitFailed:(BOOL)a3
{
  self->_initFailed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameWriteQueue, 0);
  objc_storeStrong((id *)&self->_inputLock, 0);
  objc_storeStrong((id *)&self->_inputAdaptor, 0);
  objc_storeStrong((id *)&self->_writerInput, 0);
  objc_storeStrong((id *)&self->_assetWriter, 0);

  objc_storeStrong((id *)&self->lastError, 0);
}

@end