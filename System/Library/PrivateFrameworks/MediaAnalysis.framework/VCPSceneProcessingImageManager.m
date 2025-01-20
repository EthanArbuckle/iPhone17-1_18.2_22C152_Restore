@interface VCPSceneProcessingImageManager
+ (id)imageManager;
- (VCPSceneProcessingImageManager)init;
- (int)_createPixelBuffer:(__CVBuffer *)a3 withColorSpace:(CGColorSpace *)a4 fromPixelBuffer:(__CVBuffer *)a5;
- (int)_createPixelBuffer:(__CVBuffer *)a3 withMinorDimension:(unint64_t)a4 fromFullPixelBuffer:(__CVBuffer *)a5;
- (int)_createPixelBuffer:(__CVBuffer *)a3 withWidth:(unint64_t)a4 andHeight:(unint64_t)a5;
- (int)_pooledPixelBuffer:(__CVBuffer *)a3 withDimension:(unint64_t)a4;
- (int)fullPixelBuffer:(__CVBuffer *)a3 toScaledBuffer:(__CVBuffer *)a4;
- (int)loadFullPixelBuffer:(__CVBuffer *)a3 scaledPixelBuffer299:(__CVBuffer *)a4 scaledPixelBuffer360:(__CVBuffer *)a5 fromImageURL:(id)a6 abnormalDimension:(unint64_t)a7;
- (int)scalePixelBuffer:(__CVBuffer *)a3 toPixelBuffer:(__CVBuffer *)a4 width:(unint64_t)a5 height:(unint64_t)a6;
- (void)dealloc;
@end

@implementation VCPSceneProcessingImageManager

- (VCPSceneProcessingImageManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)VCPSceneProcessingImageManager;
  v2 = [(VCPSceneProcessingImageManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    pixelBufferPools = v2->_pixelBufferPools;
    v2->_pixelBufferPools = (NSMutableDictionary *)v3;
  }
  return v2;
}

+ (id)imageManager
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = +[VCPImageManager sharedImageManager];
  [v3 flushCache];

  v4.receiver = self;
  v4.super_class = (Class)VCPSceneProcessingImageManager;
  [(VCPSceneProcessingImageManager *)&v4 dealloc];
}

- (int)_createPixelBuffer:(__CVBuffer *)a3 withWidth:(unint64_t)a4 andHeight:(unint64_t)a5
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = *MEMORY[0x1E4F24D20];
  v11[0] = MEMORY[0x1E4F1CC08];
  CFDictionaryRef v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  LODWORD(a3) = CVPixelBufferCreate(0, a4, a5, 0x42475241u, v8, a3);

  return (int)a3;
}

- (int)_createPixelBuffer:(__CVBuffer *)a3 withMinorDimension:(unint64_t)a4 fromFullPixelBuffer:(__CVBuffer *)a5
{
  size_t Height = CVPixelBufferGetHeight(a5);
  size_t Width = CVPixelBufferGetWidth(a5);
  if (!Width || !Height) {
    return -18;
  }
  size_t v11 = Height / Width;
  if (Width > Height) {
    size_t v11 = Width / Height;
  }
  unint64_t v12 = v11 * a4;
  if (Width <= Height) {
    unint64_t v13 = a4;
  }
  else {
    unint64_t v13 = v12;
  }
  if (Width <= Height) {
    unint64_t v14 = v12;
  }
  else {
    unint64_t v14 = a4;
  }
  return [(VCPSceneProcessingImageManager *)self _createPixelBuffer:a3 withWidth:v13 andHeight:v14];
}

- (int)_pooledPixelBuffer:(__CVBuffer *)a3 withDimension:(unint64_t)a4
{
  v22[4] = *MEMORY[0x1E4F143B8];
  pixelBufferPools = self->_pixelBufferPools;
  CFDictionaryRef v8 = [NSNumber numberWithUnsignedInteger:a4];
  CVPixelBufferPoolRef v9 = [(NSMutableDictionary *)pixelBufferPools objectForKeyedSubscript:v8];

  CVPixelBufferPoolRef v20 = v9;
  if (!v9)
  {
    v21[0] = *MEMORY[0x1E4F24E10];
    size_t v11 = [NSNumber numberWithUnsignedInteger:a4];
    v22[0] = v11;
    v21[1] = *MEMORY[0x1E4F24D08];
    unint64_t v12 = [NSNumber numberWithUnsignedInteger:a4];
    uint64_t v13 = *MEMORY[0x1E4F24D70];
    v22[1] = v12;
    v22[2] = &unk_1F15EDCE0;
    uint64_t v14 = *MEMORY[0x1E4F24D20];
    v21[2] = v13;
    v21[3] = v14;
    v22[3] = MEMORY[0x1E4F1CC08];
    CFDictionaryRef v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:4];

    CVReturn v10 = CVPixelBufferPoolCreate(0, 0, v15, &v20);
    if (v10)
    {

      return v10;
    }
    CVPixelBufferPoolRef v17 = v20;
    v18 = self->_pixelBufferPools;
    v19 = [NSNumber numberWithUnsignedInteger:a4];
    [(NSMutableDictionary *)v18 setObject:v17 forKeyedSubscript:v19];

    CVPixelBufferPoolRef v9 = v20;
  }
  return CVPixelBufferPoolCreatePixelBuffer(0, v9, a3);
}

- (int)fullPixelBuffer:(__CVBuffer *)a3 toScaledBuffer:(__CVBuffer *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  CVReturn v28 = 0;
  CVPixelBufferRef v29 = a3;
  CVPixelBufferLockFlags v30 = 1;
  if (a3)
  {
    CVReturn v6 = CVPixelBufferLockBaseAddress(a3, 1uLL);
    CVReturn v28 = v6;
    if (!v6
      || (int v7 = v6, os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      && (LODWORD(buf.data) = 134218240,
          *(void **)((char *)&buf.data + 4) = a3,
          WORD2(buf.height) = 1024,
          *(_DWORD *)((char *)&buf.height + 6) = v7,
          _os_log_error_impl(&dword_1BBEDA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", (uint8_t *)&buf, 0x12u), (int v7 = v28) == 0))
    {
      buf.data = CVPixelBufferGetBaseAddress(a3);
      buf.height = CVPixelBufferGetHeight(a3);
      buf.width = CVPixelBufferGetWidth(a3);
      buf.rowBytes = CVPixelBufferGetBytesPerRow(a3);
      CVPixelBufferRef pixelBuffer = a4;
      CVPixelBufferLockFlags unlockFlags = 0;
      if (a4)
      {
        int v7 = CVPixelBufferLockBaseAddress(a4, 0);
        int v25 = v7;
        if (!v7
          || os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)
          && (LODWORD(v31.data) = 134218240,
              *(void **)((char *)&v31.data + 4) = pixelBuffer,
              WORD2(v31.height) = 1024,
              *(_DWORD *)((char *)&v31.height + 6) = v7,
              _os_log_error_impl(&dword_1BBEDA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", (uint8_t *)&v31, 0x12u), (int v7 = v25) == 0))
        {
          v31.data = CVPixelBufferGetBaseAddress(a4);
          v31.height = CVPixelBufferGetHeight(a4);
          v31.width = CVPixelBufferGetWidth(a4);
          v31.rowBytes = CVPixelBufferGetBytesPerRow(a4);
          int v7 = vImageScale_ARGB8888(&buf, &v31, 0, 0x20u);
          if (!v7)
          {
            CVBufferPropagateAttachments(a3, a4);
            int v7 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v25);
            if (!v7) {
              int v7 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v28);
            }
          }
          if (pixelBuffer
            && !v25
            && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
            && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:]();
          }
        }
      }
      else
      {
        BOOL v17 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
        if (v17) {
          -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v17, v18, v19, v20, v21, v22, v23, v24);
        }
        int v7 = -50;
      }
      if (v29
        && !v28
        && CVPixelBufferUnlockBaseAddress(v29, v30)
        && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:]();
      }
    }
  }
  else
  {
    BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v8) {
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v8, v9, v10, v11, v12, v13, v14, v15);
    }
    return -50;
  }
  return v7;
}

- (int)_createPixelBuffer:(__CVBuffer *)a3 withColorSpace:(CGColorSpace *)a4 fromPixelBuffer:(__CVBuffer *)a5
{
  unint64_t Height = CVPixelBufferGetHeight(a5);
  size_t Width = CVPixelBufferGetWidth(a5);
  LODWORD(BaseAddress) = -18;
  if (Width)
  {
    if (Height)
    {
      size_t v12 = Width;
      LODWORD(BaseAddress) = [(VCPSceneProcessingImageManager *)self _createPixelBuffer:a3 withWidth:Width andHeight:Height];
      if (!BaseAddress)
      {
        CGImageRef imageOut = 0;
        VTCreateCGImageFromCVPixelBuffer(a5, 0, &imageOut);
        if (imageOut)
        {
          uint64_t v13 = *a3;
          CVPixelBufferRef pixelBuffer = v13;
          CVPixelBufferLockFlags unlockFlags = 0;
          if (v13)
          {
            uint64_t BaseAddress = CVPixelBufferLockBaseAddress(v13, 0);
            int v32 = BaseAddress;
            if (BaseAddress)
            {
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
                -[VCPImageConverter convertImage:yuvFrame:]((uint64_t)v13, BaseAddress, v14, v15, v16, v17, v18, v19);
              }
            }
            else
            {
              uint64_t BaseAddress = (uint64_t)CVPixelBufferGetBaseAddress(v13);
              size_t BytesPerRow = CVPixelBufferGetBytesPerRow(v13);
              uint32_t BitmapInfo = CGImageGetBitmapInfo(imageOut);
              vImage_Buffer v31 = CGBitmapContextCreate((void *)BaseAddress, v12, Height, 8uLL, BytesPerRow, a4, BitmapInfo);
              v36.size.width = (double)v12;
              v36.size.height = (double)Height;
              v36.origin.x = 0.0;
              v36.origin.y = 0.0;
              CGContextDrawImage(v31, v36, imageOut);
              CVBufferSetAttachment(v13, (CFStringRef)*MEMORY[0x1E4F24A00], a4, kCVAttachmentMode_ShouldPropagate);
              LODWORD(BaseAddress) = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v32);
              CF<opaqueCMSampleBuffer *>::~CF((const void **)&v31);
              if (pixelBuffer
                && !v32
                && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
                && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
              {
                -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:]();
              }
            }
          }
          else
          {
            BOOL v20 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
            if (v20) {
              -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v20, v21, v22, v23, v24, v25, v26, v27);
            }
            LODWORD(BaseAddress) = -50;
          }
        }
        else
        {
          LODWORD(BaseAddress) = -18;
        }
        CF<opaqueCMSampleBuffer *>::~CF((const void **)&imageOut);
      }
    }
  }
  return BaseAddress;
}

- (int)loadFullPixelBuffer:(__CVBuffer *)a3 scaledPixelBuffer299:(__CVBuffer *)a4 scaledPixelBuffer360:(__CVBuffer *)a5 fromImageURL:(id)a6 abnormalDimension:(unint64_t)a7
{
  id v12 = a6;
  *a3 = 0;
  if (a4) {
    *a4 = 0;
  }
  if (a5) {
    *a5 = 0;
  }
  CFTypeRef v26 = 0;
  CFTypeRef v24 = 0;
  CFTypeRef v25 = 0;
  uint64_t v13 = self;
  objc_sync_enter(v13);
  uint64_t v14 = +[VCPImageManager sharedImageManager];
  CFTypeRef cf = (CFTypeRef)[v14 pixelBufferWithFormat:1111970369 fromImageURL:v12 flushCache:0];
  uint64_t v23 = 0;
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&v23);

  if (cf)
  {
    CGColorSpaceRef v15 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
    uint64_t v23 = v15;
    if (v26)
    {
      CFRelease(v26);
      CFTypeRef v26 = 0;
      CGColorSpaceRef v15 = v23;
    }
    int v16 = [(VCPSceneProcessingImageManager *)v13 _createPixelBuffer:&v26 withColorSpace:v15 fromPixelBuffer:cf];
    if (v16) {
      goto LABEL_9;
    }
    if (a7)
    {
      if (a4)
      {
        if (v25)
        {
          CFRelease(v25);
          CFTypeRef v25 = 0;
        }
        int v16 = [(VCPSceneProcessingImageManager *)v13 _createPixelBuffer:&v25 withMinorDimension:299 fromFullPixelBuffer:v26];
        if (v16) {
          goto LABEL_9;
        }
      }
      if (a5)
      {
        if (v24)
        {
          CFRelease(v24);
          CFTypeRef v24 = 0;
        }
        int v22 = [(VCPSceneProcessingImageManager *)v13 _createPixelBuffer:&v24 withMinorDimension:360 fromFullPixelBuffer:v26];
        goto LABEL_45;
      }
    }
    else
    {
      if (a4)
      {
        if (v25)
        {
          CFRelease(v25);
          CFTypeRef v25 = 0;
        }
        int v16 = [(VCPSceneProcessingImageManager *)v13 _pooledPixelBuffer:&v25 withDimension:299];
        if (v16) {
          goto LABEL_9;
        }
      }
      if (a5)
      {
        if (v24)
        {
          CFRelease(v24);
          CFTypeRef v24 = 0;
        }
        int v22 = [(VCPSceneProcessingImageManager *)v13 _pooledPixelBuffer:&v24 withDimension:360];
LABEL_45:
        int v16 = v22;
        if (!v22) {
          goto LABEL_46;
        }
LABEL_9:
        int v17 = 1;
LABEL_10:
        CF<opaqueCMSampleBuffer *>::~CF((const void **)&v23);
        goto LABEL_12;
      }
    }
LABEL_46:
    int v16 = 0;
    int v17 = 0;
    goto LABEL_10;
  }
  int v17 = 1;
  int v16 = -18;
LABEL_12:
  objc_sync_exit(v13);

  if (!v17
    && (!a4
     || (int v16 = [(VCPSceneProcessingImageManager *)v13 fullPixelBuffer:v26 toScaledBuffer:v25]) == 0)&& (!a5|| (int v16 = [(VCPSceneProcessingImageManager *)v13 fullPixelBuffer:v26 toScaledBuffer:v24]) == 0))
  {
    uint64_t v19 = (__CVBuffer *)v26;
    if (v26) {
      uint64_t v19 = (__CVBuffer *)CFRetain(v26);
    }
    *a3 = v19;
    if (a4)
    {
      BOOL v20 = (__CVBuffer *)v25;
      if (v25) {
        BOOL v20 = (__CVBuffer *)CFRetain(v25);
      }
      *a4 = v20;
    }
    if (a5)
    {
      uint64_t v21 = (__CVBuffer *)v24;
      if (v24) {
        uint64_t v21 = (__CVBuffer *)CFRetain(v24);
      }
      int v16 = 0;
      *a5 = v21;
    }
    else
    {
      int v16 = 0;
    }
  }
  CF<opaqueCMSampleBuffer *>::~CF(&v24);
  CF<opaqueCMSampleBuffer *>::~CF(&v25);
  CF<opaqueCMSampleBuffer *>::~CF(&v26);
  CF<opaqueCMSampleBuffer *>::~CF(&cf);

  return v16;
}

- (int)scalePixelBuffer:(__CVBuffer *)a3 toPixelBuffer:(__CVBuffer *)a4 width:(unint64_t)a5 height:(unint64_t)a6
{
  CFTypeRef cf = 0;
  if (a5 == a6)
  {
    uint64_t v10 = self;
    objc_sync_enter(v10);
    int v11 = [(VCPSceneProcessingImageManager *)v10 _pooledPixelBuffer:&cf withDimension:a5];
    objc_sync_exit(v10);

    if (v11) {
      goto LABEL_9;
    }
  }
  else
  {
    int v11 = [(VCPSceneProcessingImageManager *)self _createPixelBuffer:&cf withWidth:a5 andHeight:a6];
    if (v11) {
      goto LABEL_9;
    }
  }
  int v11 = [(VCPSceneProcessingImageManager *)self fullPixelBuffer:a3 toScaledBuffer:cf];
  if (!v11)
  {
    id v12 = (__CVBuffer *)cf;
    if (cf) {
      id v12 = (__CVBuffer *)CFRetain(cf);
    }
    int v11 = 0;
    *a4 = v12;
  }
LABEL_9:
  CF<opaqueCMSampleBuffer *>::~CF(&cf);
  return v11;
}

- (void).cxx_destruct
{
}

@end