@interface MADHEICSAlphaSequenceWriter
+ (id)transcodeSequenceData:(id)a3 maxDimension:(unint64_t)a4 outputWidth:(unint64_t *)a5 outputHeight:(unint64_t *)a6;
+ (int)getOutputWidth:(unint64_t *)a3 outputHeight:(unint64_t *)a4 sequenceData:(id)a5;
- (MADHEICSAlphaSequenceWriter)initWithFrameCount:(unint64_t)a3 crop:(CGRect *)a4;
- (id).cxx_construct;
- (id)finishWithEndTime:(id *)a3;
- (int)_addPixelBuffer420Alpha:(__CVBuffer *)a3 withTime:(id *)a4;
- (int)_addPixelBufferBGRA:(__CVBuffer *)a3 withTime:(id *)a4;
- (int)_createCompressionSessionLazy;
- (int)_finishWithEndTime:(id *)a3 outputData:(id *)a4;
- (int)addPixelBuffer:(__CVBuffer *)a3 withTime:(id *)a4;
- (int)copyInputPlaneIndex:(unint64_t)a3 inputPixelBuffer:(__CVBuffer *)a4 toOutputPlaneIndex:(unint64_t)a5 outputPixelBuffer:(__CVBuffer *)a6 bytesPerPixel:(unint64_t)a7;
- (int)createPixelBufferPool:(__CVPixelBufferPool *)a3 width:(unint64_t)a4 height:(unint64_t)a5 pixelFormat:(int)a6;
- (int)demuxPixelBuffer:(__CVBuffer *)a3 imagePixelBuffer:(__CVBuffer *)a4 alphaPixelBuffer:(__CVBuffer *)a5;
@end

@implementation MADHEICSAlphaSequenceWriter

- (MADHEICSAlphaSequenceWriter)initWithFrameCount:(unint64_t)a3 crop:(CGRect *)a4
{
  v10.receiver = self;
  v10.super_class = (Class)MADHEICSAlphaSequenceWriter;
  v5 = [(MADHEICSAlphaSequenceWriter *)&v10 init];
  v6 = v5;
  if (a4 && v5)
  {
    CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(*a4);
    crop = v6->_crop;
    v6->_crop = (NSDictionary *)DictionaryRepresentation;
  }
  return v6;
}

- (int)createPixelBufferPool:(__CVPixelBufferPool *)a3 width:(unint64_t)a4 height:(unint64_t)a5 pixelFormat:(int)a6
{
  v18[4] = *MEMORY[0x1E4F143B8];
  v17[0] = *MEMORY[0x1E4F24D70];
  v9 = [NSNumber numberWithInt:*(void *)&a6];
  v18[0] = v9;
  v17[1] = *MEMORY[0x1E4F24E10];
  objc_super v10 = [NSNumber numberWithUnsignedLong:a4];
  v18[1] = v10;
  v17[2] = *MEMORY[0x1E4F24D08];
  v11 = [NSNumber numberWithUnsignedLong:a5];
  v17[3] = *MEMORY[0x1E4F24D20];
  v18[2] = v11;
  v18[3] = MEMORY[0x1E4F1CC08];
  CFDictionaryRef v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];

  CVReturn v13 = CVPixelBufferPoolCreate(0, 0, v12, a3);
  if (v13 && (int)MediaAnalysisLogLevel() >= 3)
  {
    v14 = VCPLogInstance();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1BBEDA000, v14, OS_LOG_TYPE_ERROR, "Failed to create pixel buffer pool", v16, 2u);
    }
  }
  return v13;
}

- (int)copyInputPlaneIndex:(unint64_t)a3 inputPixelBuffer:(__CVBuffer *)a4 toOutputPlaneIndex:(unint64_t)a5 outputPixelBuffer:(__CVBuffer *)a6 bytesPerPixel:(unint64_t)a7
{
  size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a4, a3);
  size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a4, a3);
  if (WidthOfPlane != CVPixelBufferGetWidthOfPlane(a6, a5) || HeightOfPlane != CVPixelBufferGetHeightOfPlane(a6, a5)) {
    return -50;
  }
  size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a4, a3);
  size_t v15 = CVPixelBufferGetBytesPerRowOfPlane(a6, a5);
  size_t v16 = WidthOfPlane * a7;
  int result = -50;
  if (v16 <= BytesPerRowOfPlane && v16 <= v15)
  {
    BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a4, a3);
    v19 = (char *)CVPixelBufferGetBaseAddressOfPlane(a6, a5);
    if (HeightOfPlane)
    {
      v20 = v19;
      do
      {
        memcpy(v20, BaseAddressOfPlane, v16);
        BaseAddressOfPlane += BytesPerRowOfPlane;
        v20 += v15;
        --HeightOfPlane;
      }
      while (HeightOfPlane);
    }
    return 0;
  }
  return result;
}

- (int)demuxPixelBuffer:(__CVBuffer *)a3 imagePixelBuffer:(__CVBuffer *)a4 alphaPixelBuffer:(__CVBuffer *)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (CVPixelBufferGetPixelFormatType(a3) != 1982882104) {
    return -50;
  }
  if (self->_imagePixelBufferPool.value_
    || (size_t v11 = CVPixelBufferGetWidth(a3),
        (CVReturn v9 = [(MADHEICSAlphaSequenceWriter *)self createPixelBufferPool:&self->_imagePixelBufferPool width:v11 height:CVPixelBufferGetHeight(a3) pixelFormat:875704438]) == 0))
  {
    if (self->_alphaPixelBufferPool.value_
      || (size_t Width = CVPixelBufferGetWidth(a3),
          (CVReturn v9 = [(MADHEICSAlphaSequenceWriter *)self createPixelBufferPool:&self->_alphaPixelBufferPool width:Width height:CVPixelBufferGetHeight(a3) pixelFormat:1278226488]) == 0))
    {
      CVPixelBufferRef pixelBufferOut = 0;
      CVReturn v9 = CVPixelBufferPoolCreatePixelBuffer(0, self->_imagePixelBufferPool.value_, &pixelBufferOut);
      if (!v9)
      {
        CVPixelBufferRef v27 = 0;
        CVReturn v9 = CVPixelBufferPoolCreatePixelBuffer(0, self->_alphaPixelBufferPool.value_, &v27);
        if (!v9)
        {
          CVReturn v24 = 0;
          CVPixelBufferRef pixelBuffer = a3;
          CVPixelBufferLockFlags unlockFlags = 1;
          if (a3)
          {
            CVReturn v9 = CVPixelBufferLockBaseAddress(a3, 1uLL);
            CVReturn v24 = v9;
            if (!v9
              || os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)
              && (*(_DWORD *)buf = 134218240,
                  CVPixelBufferRef v30 = pixelBuffer,
                  __int16 v31 = 1024,
                  CVReturn v32 = v9,
                  _os_log_error_impl(&dword_1BBEDA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", buf, 0x12u), (CVReturn v9 = v24) == 0))
            {
              CVPixelBufferLock::CVPixelBufferLock((CVPixelBufferLock *)buf, pixelBufferOut, 0);
              CVReturn v9 = *(_DWORD *)buf;
              if (!*(_DWORD *)buf)
              {
                CVReturn v9 = [(MADHEICSAlphaSequenceWriter *)self copyInputPlaneIndex:0 inputPixelBuffer:a3 toOutputPlaneIndex:0 outputPixelBuffer:pixelBufferOut bytesPerPixel:1];
                if (!v9)
                {
                  CVReturn v9 = [(MADHEICSAlphaSequenceWriter *)self copyInputPlaneIndex:1 inputPixelBuffer:a3 toOutputPlaneIndex:1 outputPixelBuffer:pixelBufferOut bytesPerPixel:2];
                  if (!v9)
                  {
                    CVReturn v9 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)buf);
                    if (!v9)
                    {
                      CVPixelBufferLock::CVPixelBufferLock((CVPixelBufferLock *)v23, v27, 0);
                      CVReturn v9 = v23[0];
                      if (!v23[0])
                      {
                        CVReturn v9 = [(MADHEICSAlphaSequenceWriter *)self copyInputPlaneIndex:2 inputPixelBuffer:a3 toOutputPlaneIndex:0 outputPixelBuffer:v27 bytesPerPixel:1];
                        if (!v9)
                        {
                          CVReturn v9 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)v23);
                          if (!v9)
                          {
                            CVReturn v9 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v24);
                            if (!v9)
                            {
                              CVReturn v13 = pixelBufferOut;
                              if (pixelBufferOut) {
                                CVReturn v13 = (__CVBuffer *)CFRetain(pixelBufferOut);
                              }
                              *a4 = v13;
                              v14 = v27;
                              if (v27) {
                                v14 = (__CVBuffer *)CFRetain(v27);
                              }
                              CVReturn v9 = 0;
                              *a5 = v14;
                            }
                          }
                        }
                      }
                      CVPixelBufferLock::~CVPixelBufferLock((CVPixelBufferLock *)v23);
                    }
                  }
                }
              }
              CVPixelBufferLock::~CVPixelBufferLock((CVPixelBufferLock *)buf);
              if (pixelBuffer
                && !v24
                && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
                && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
              {
                -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:]();
              }
            }
          }
          else
          {
            BOOL v15 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
            if (v15) {
              -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v15, v16, v17, v18, v19, v20, v21, v22);
            }
            CVReturn v9 = -50;
          }
        }
        CF<opaqueCMSampleBuffer *>::~CF((const void **)&v27);
      }
      CF<opaqueCMSampleBuffer *>::~CF((const void **)&pixelBufferOut);
    }
  }
  return v9;
}

- (int)_createCompressionSessionLazy
{
  v7[2] = *MEMORY[0x1E4F143B8];
  if (self->_compressionSession.value_) {
    return 0;
  }
  int started = CMPhotoCompressionSessionCreate();
  if (!started)
  {
    uint64_t v3 = *MEMORY[0x1E4F56048];
    v6[0] = *MEMORY[0x1E4F56058];
    v6[1] = v3;
    v7[0] = &unk_1F15EB3D0;
    v7[1] = &unk_1F15EB3E8;
    v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];
    int started = CMPhotoCompressionSessionOpenEmptyContainer();
    if (!started) {
      int started = CMPhotoCompressionSessionStartImageSequence();
    }
  }
  return started;
}

- (int)_addPixelBuffer420Alpha:(__CVBuffer *)a3 withTime:(id *)a4
{
  v20[3] = *MEMORY[0x1E4F143B8];
  int v6 = [(MADHEICSAlphaSequenceWriter *)self _createCompressionSessionLazy];
  if (!v6)
  {
    BOOL v15 = 0;
    uint64_t v16 = 0;
    int v6 = [(MADHEICSAlphaSequenceWriter *)self demuxPixelBuffer:a3 imagePixelBuffer:&v16 alphaPixelBuffer:&v15];
    if (!v6)
    {
      v7 = (void *)MEMORY[0x1E4F1CA60];
      uint64_t v8 = *MEMORY[0x1E4F56158];
      v19[0] = *MEMORY[0x1E4F560B8];
      v19[1] = v8;
      v20[0] = &unk_1F15EB400;
      v20[1] = &unk_1F15EB418;
      v19[2] = *MEMORY[0x1E4F56150];
      uint64_t v17 = *MEMORY[0x1E4F56358];
      uint64_t v18 = &unk_1F15EB068;
      CVReturn v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      v20[2] = v9;
      objc_super v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];
      size_t v11 = [v7 dictionaryWithDictionary:v10];

      crop = self->_crop;
      if (crop) {
        [v11 setObject:crop forKeyedSubscript:*MEMORY[0x1E4F56170]];
      }
      CVReturn v13 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v11];
      [v13 setObject:&unk_1F15EB430 forKeyedSubscript:*MEMORY[0x1E4F560F8]];
      int v6 = CMPhotoCompressionSessionAddImageToSequence();
      if (!v6) {
        int v6 = CMPhotoCompressionSessionAddAuxiliaryImage();
      }
    }
    CF<opaqueCMSampleBuffer *>::~CF(&v15);
    CF<opaqueCMSampleBuffer *>::~CF(&v16);
  }
  return v6;
}

- (int)_addPixelBufferBGRA:(__CVBuffer *)a3 withTime:(id *)a4
{
  v17[3] = *MEMORY[0x1E4F143B8];
  int v5 = [(MADHEICSAlphaSequenceWriter *)self _createCompressionSessionLazy];
  if (!v5)
  {
    int v6 = (void *)MEMORY[0x1E4F1CA60];
    uint64_t v7 = *MEMORY[0x1E4F56158];
    v16[0] = *MEMORY[0x1E4F560B8];
    v16[1] = v7;
    v17[0] = &unk_1F15EB400;
    v17[1] = &unk_1F15EB418;
    v16[2] = *MEMORY[0x1E4F56150];
    uint64_t v14 = *MEMORY[0x1E4F56358];
    BOOL v15 = &unk_1F15EB068;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    v17[2] = v8;
    CVReturn v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];
    objc_super v10 = [v6 dictionaryWithDictionary:v9];

    crop = self->_crop;
    if (crop) {
      [v10 setObject:crop forKeyedSubscript:*MEMORY[0x1E4F56170]];
    }
    CFDictionaryRef v12 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v10];
    [v12 setObject:&unk_1F15EB430 forKeyedSubscript:*MEMORY[0x1E4F560F8]];
    [v12 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F56100]];
    int v5 = CMPhotoCompressionSessionAddImageToSequence();
  }
  return v5;
}

- (int)addPixelBuffer:(__CVBuffer *)a3 withTime:(id *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  int result = self->_status;
  if (!result)
  {
    OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
    if (PixelFormatType == 1111970369)
    {
      long long v11 = *(_OWORD *)&a4->var0;
      int64_t var3 = a4->var3;
      int result = [(MADHEICSAlphaSequenceWriter *)self _addPixelBufferBGRA:a3 withTime:&v11];
    }
    else
    {
      int v9 = PixelFormatType;
      if (PixelFormatType == 1982882104)
      {
        long long v13 = *(_OWORD *)&a4->var0;
        int64_t v14 = a4->var3;
        int result = [(MADHEICSAlphaSequenceWriter *)self _addPixelBuffer420Alpha:a3 withTime:&v13];
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          objc_super v10 = VCPLogInstance();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67110144;
            int v16 = v9 >> 24;
            __int16 v17 = 1024;
            int v18 = v9 << 8 >> 24;
            __int16 v19 = 1024;
            int v20 = (__int16)v9 >> 8;
            __int16 v21 = 1024;
            int v22 = (char)v9;
            __int16 v23 = 1024;
            int v24 = v9;
            _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_ERROR, "Unsupported pixel format '%c%c%c%c' (%d)", buf, 0x20u);
          }
        }
        int result = -50;
      }
    }
    self->_status = result;
  }
  return result;
}

- (int)_finishWithEndTime:(id *)a3 outputData:(id *)a4
{
  int v5 = CMPhotoCompressionSessionEndImageSequence();
  if (!v5)
  {
    id obj = 0;
    int v5 = CMPhotoCompressionSessionCloseContainerAndCopyBacking();
    if (!v5) {
      objc_storeStrong(a4, obj);
    }
    CF<opaqueCMSampleBuffer *>::~CF((const void **)&obj);
  }
  return v5;
}

- (id)finishWithEndTime:(id *)a3
{
  if (self->_status)
  {
    id v3 = 0;
  }
  else
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = *a3;
    id v9 = 0;
    if ([(MADHEICSAlphaSequenceWriter *)self _finishWithEndTime:&v8 outputData:&v9]
      && (int)MediaAnalysisLogLevel() >= 3)
    {
      int v5 = VCPLogInstance();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v7 = 0;
        _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_ERROR, "Failed to finalize HEIC sequence", v7, 2u);
      }
    }
    self->_status = -18;
    id v3 = v9;
  }
  return v3;
}

+ (int)getOutputWidth:(unint64_t *)a3 outputHeight:(unint64_t *)a4 sequenceData:(id)a5
{
  id v7 = a5;
  *a4 = 0;
  *a3 = 0;
  long long v11 = 0;
  int Container = CMPhotoDecompressionSessionCreate();
  if (!Container)
  {
    objc_super v10 = 0;
    int Container = CMPhotoDecompressionSessionCreateContainer();
    if (!Container)
    {
      int Container = CMPhotoDecompressionContainerGetImageGeometryForIndex();
      if (!Container)
      {
        *a3 = 0;
        *a4 = 0;
      }
    }
    CF<opaqueCMSampleBuffer *>::~CF(&v10);
  }
  CF<opaqueCMSampleBuffer *>::~CF(&v11);

  return Container;
}

+ (id)transcodeSequenceData:(id)a3 maxDimension:(unint64_t)a4 outputWidth:(unint64_t *)a5 outputHeight:(unint64_t *)a6
{
  id v9 = a3;
  objc_super v10 = [[MADHEICSAlphaSequenceTranscoder alloc] initWithSequenceData:v9 maxDimension:a4 qualityValue:0.5];
  long long v11 = [(MADHEICSAlphaSequenceTranscoder *)v10 run];
  if (v11)
  {
    if ([(id)objc_opt_class() getOutputWidth:a5 outputHeight:a6 sequenceData:v11]
      && (int)MediaAnalysisLogLevel() >= 4)
    {
      CFDictionaryRef v12 = VCPLogInstance();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v16 = 0;
        _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_DEFAULT, "Failed to query HEIC sequence output dimensions", v16, 2u);
      }
    }
    id v13 = v11;
  }
  else if ((int)MediaAnalysisLogLevel() >= 3)
  {
    int64_t v14 = VCPLogInstance();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v14, OS_LOG_TYPE_ERROR, "Failed to transcode HEIC sequence", buf, 2u);
    }
  }
  return v11;
}

- (void).cxx_destruct
{
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_alphaPixelBufferPool.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_imagePixelBufferPool.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_compressionSession.value_);
  objc_storeStrong((id *)&self->_crop, 0);
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  return self;
}

- (void)demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:.cold.2()
{
  OUTLINED_FUNCTION_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_1BBEDA000, MEMORY[0x1E4F14500], v0, "Failed to unlock CVPixelBuffer (%p, %d)", v1, v2, v3, v4, v5);
}

@end