@interface VCPImageManager
+ (BOOL)_exportReencodedJPEG;
+ (BOOL)allowFastPathDecodeWithUniformType:(id)a3 pixelWidth:(unint64_t)a4 andPixelHeight:(unint64_t)a5;
+ (BOOL)canDecodeAcceleratedUniformTypeIdentifier:(id)a3;
+ (BOOL)loggingEnabled;
+ (id)sharedImageManager;
- (VCPImageManager)init;
- (__CVBuffer)imageForResource:(id)a3 pixelFormat:(int)a4;
- (__CVBuffer)imageForResource:(id)a3 pixelFormat:(int)a4 maxDimension:(unint64_t)a5;
- (__CVBuffer)imageForResource:(id)a3 pixelFormat:(int)a4 maxDimension:(unint64_t)a5 orientation:(unsigned int *)a6;
- (__CVBuffer)pixelBufferWithFormat:(int)a3 andMaxDimension:(unint64_t)a4 fromData:(id)a5 withUniformTypeIdentifier:(id)a6 flushCache:(BOOL)a7 orientation:(unsigned int *)a8;
- (__CVBuffer)pixelBufferWithFormat:(int)a3 andMaxDimension:(unint64_t)a4 fromImageURL:(id)a5;
- (__CVBuffer)pixelBufferWithFormat:(int)a3 andMaxDimension:(unint64_t)a4 fromImageURL:(id)a5 flushCache:(BOOL)a6 orientation:(unsigned int *)a7;
- (__CVBuffer)pixelBufferWithFormat:(int)a3 andMaxDimension:(unint64_t)a4 fromImageURL:(id)a5 orientation:(unsigned int *)a6;
- (__CVBuffer)pixelBufferWithFormat:(int)a3 fromImageURL:(id)a4 flushCache:(BOOL)a5;
- (__CVBuffer)pixelBufferWithFormat:(int)a3 fromImageURL:(id)a4 flushCache:(BOOL)a5 orientation:(unsigned int *)a6;
- (id)dataForResource:(id)a3;
- (int)acceleratedDecodeImageData:(id)a3 pixelFormat:(int)a4 maxDimension:(unint64_t)a5 pixelBuffer:(__CVBuffer *)a6 orientation:(unsigned int *)a7 flushCache:(BOOL)a8;
- (int)compressCVPixelBuffer:(__CVBuffer *)a3 toJPEGData:(id *)a4 targetBitStreamLength:(unint64_t)a5 padding:(BOOL)a6;
- (int)convertPixelBuffer:(__CVBuffer *)a3 toPixelFormat:(int)a4 flushCache:(BOOL)a5;
- (int)createPixelBufferWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(int)a5 pixelBuffer:(__CVBuffer *)a6;
- (int)decodeImageSource:(CGImageSource *)a3 withUniformTypeIdentifier:(id)a4 pixelFormat:(int)a5 maxDimension:(unint64_t)a6 orientation:(unsigned int *)a7 pixelBuffer:(__CVBuffer *)a8;
- (int)drawImage:(CGImage *)a3 pixelFormat:(int)a4 withOrientation:(unsigned int)a5 maxDimension:(unint64_t)a6 pixelBuffer:(__CVBuffer *)a7;
- (void)dealloc;
- (void)flushCache;
@end

@implementation VCPImageManager

- (VCPImageManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)VCPImageManager;
  v2 = [(VCPImageManager *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_encodeSession = 0;
    v2->_decodeSession = 0;
    v2->_transferSession = 0;
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.mediaanalysis.VCPImageManager.transcodeQueue", v4);
    transcodeQueue = v3->_transcodeQueue;
    v3->_transcodeQueue = (OS_dispatch_queue *)v5;

    v7 = v3;
  }

  return v3;
}

- (void)dealloc
{
  if (self->_encodeSession)
  {
    CMPhotoCompressionSessionFlushCachedBuffers();
    encodeSession = self->_encodeSession;
    if (encodeSession) {
      CFRelease(encodeSession);
    }
  }
  if (self->_decodeSession)
  {
    CMPhotoDecompressionSessionDiscardCachedBuffers();
    decodeSession = self->_decodeSession;
    if (decodeSession) {
      CFRelease(decodeSession);
    }
  }
  transferSession = self->_transferSession;
  if (transferSession) {
    CFRelease(transferSession);
  }
  v6.receiver = self;
  v6.super_class = (Class)VCPImageManager;
  [(VCPImageManager *)&v6 dealloc];
}

+ (id)sharedImageManager
{
  v2 = +[VCPSharedInstanceManager sharedManager];
  v3 = [v2 sharedInstanceWithIdentifier:@"VCPImageManager" andCreationBlock:&__block_literal_global_78];

  return v3;
}

VCPImageManager *__37__VCPImageManager_sharedImageManager__block_invoke()
{
  v0 = objc_alloc_init(VCPImageManager);
  return v0;
}

+ (BOOL)canDecodeAcceleratedUniformTypeIdentifier:(id)a3
{
  id v3 = a3;
  if (([v3 conformsToType:*MEMORY[0x1E4F44410]] & 1) != 0
    || ([v3 conformsToType:*MEMORY[0x1E4F443E0]] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 conformsToType:*MEMORY[0x1E4F443E8]];
  }

  return v4;
}

+ (BOOL)allowFastPathDecodeWithUniformType:(id)a3 pixelWidth:(unint64_t)a4 andPixelHeight:(unint64_t)a5
{
  BOOL result = +[VCPImageManager canDecodeAcceleratedUniformTypeIdentifier:a3];
  if (a4 > 0x1000 || a5 > 0x1000) {
    return 0;
  }
  return result;
}

+ (BOOL)loggingEnabled
{
  return 0;
}

- (id)dataForResource:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F38F90]);
  [v4 setNetworkAccessAllowed:0];
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__52;
  v24 = __Block_byref_object_dispose__52;
  id v25 = [MEMORY[0x1E4F1CA58] data];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __35__VCPImageManager_dataForResource___block_invoke;
  aBlock[3] = &unk_1E629C360;
  aBlock[4] = &v20;
  dispatch_queue_t v5 = _Block_copy(aBlock);
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __35__VCPImageManager_dataForResource___block_invoke_2;
  v17 = &unk_1E6297BE8;
  v7 = v6;
  v18 = v7;
  v8 = _Block_copy(&v14);
  objc_super v9 = objc_msgSend(MEMORY[0x1E4F38F80], "defaultManager", v14, v15, v16, v17);
  int v10 = [v9 requestDataForAssetResource:v3 options:v4 dataReceivedHandler:v5 completionHandler:v8];

  if (v10)
  {
    dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
    id v11 = (id)v21[5];
  }
  else
  {
    v12 = [v3 privateFileURL];
    if (v12)
    {
      id v11 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v12];
    }
    else
    {
      id v11 = 0;
    }
  }
  _Block_object_dispose(&v20, 8);

  return v11;
}

uint64_t __35__VCPImageManager_dataForResource___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) appendData:a2];
}

intptr_t __35__VCPImageManager_dataForResource___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (int)createPixelBufferWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(int)a5 pixelBuffer:(__CVBuffer *)a6
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v13 = *MEMORY[0x1E4F24D20];
  v14[0] = MEMORY[0x1E4F1CC08];
  CFDictionaryRef v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  CVReturn v11 = CVPixelBufferCreate(0, a3, a4, a5, v10, a6);
  if (v11 && *a6)
  {
    CFRelease(*a6);
    *a6 = 0;
  }

  return v11;
}

- (int)convertPixelBuffer:(__CVBuffer *)a3 toPixelFormat:(int)a4 flushCache:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  p_transferSession = &self->_transferSession;
  if (self->_transferSession || (OSStatus v11 = VTPixelTransferSessionCreate(0, p_transferSession)) == 0)
  {
    CVPixelBufferRef destinationBuffer = 0;
    size_t Width = CVPixelBufferGetWidth(*a3);
    OSStatus v11 = [(VCPImageManager *)self createPixelBufferWithWidth:Width height:CVPixelBufferGetHeight(*a3) pixelFormat:v6 pixelBuffer:&destinationBuffer];
    if (!v11)
    {
      OSStatus v11 = VTPixelTransferSessionTransferImage(*p_transferSession, *a3, destinationBuffer);
      if (v5 && *p_transferSession)
      {
        CFRelease(*p_transferSession);
        *p_transferSession = 0;
      }
      if (v11)
      {
        if (destinationBuffer) {
          CFRelease(destinationBuffer);
        }
      }
      else
      {
        CFRelease(*a3);
        *a3 = destinationBuffer;
      }
    }
  }
  return v11;
}

- (int)acceleratedDecodeImageData:(id)a3 pixelFormat:(int)a4 maxDimension:(unint64_t)a5 pixelBuffer:(__CVBuffer *)a6 orientation:(unsigned int *)a7 flushCache:(BOOL)a8
{
  id v13 = a3;
  if (a4 == 1111970369) {
    uint64_t v14 = 1111970369;
  }
  else {
    uint64_t v14 = 875704422;
  }
  uint64_t v15 = [MEMORY[0x1E4F1CA60] dictionary];
  v16 = [NSNumber numberWithInt:v14];
  [v15 setValue:v16 forKey:*MEMORY[0x1E4F562B0]];

  if (!a7) {
    [v15 setValue:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F56288]];
  }
  if (a5)
  {
    v17 = [NSNumber numberWithUnsignedLong:a5];
    [v15 setValue:v17 forKey:*MEMORY[0x1E4F562A8]];

    [v15 setValue:&unk_1F15EDA88 forKey:*MEMORY[0x1E4F562D8]];
  }
  if (self->_decodeSession || (int Container = CMPhotoDecompressionSessionCreate()) == 0)
  {
    int Container = CMPhotoDecompressionSessionCreateContainer();
    if (!Container)
    {
      int Container = CMPhotoDecompressionContainerCreateDictionaryDescription();
      if (!Container) {
        int Container = -50;
      }
    }
  }
  if (*a6)
  {
    CFRelease(*a6);
    *a6 = 0;
  }

  return Container;
}

- (int)drawImage:(CGImage *)a3 pixelFormat:(int)a4 withOrientation:(unsigned int)a5 maxDimension:(unint64_t)a6 pixelBuffer:(__CVBuffer *)a7
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  size_t Width = CGImageGetWidth(a3);
  size_t Height = CGImageGetHeight(a3);
  if (Width <= Height) {
    unint64_t v14 = Height;
  }
  else {
    unint64_t v14 = Width;
  }
  double v15 = 1.0;
  if (a6 && v14 > a6) {
    double v15 = (double)a6 / (double)v14;
  }
  *a7 = 0;
  size_t v16 = CGImageGetWidth(a3);
  size_t v17 = CGImageGetHeight(a3);
  if (v15 > 0.0 && v15 <= 1.0)
  {
    size_t v20 = v17;
    v21 = (CGFloat *)MEMORY[0x1E4F1DAB8];
    CGFloat v23 = *MEMORY[0x1E4F1DAB8];
    CGFloat v22 = *(double *)(MEMORY[0x1E4F1DAB8] + 8);
    CGFloat v25 = *(double *)(MEMORY[0x1E4F1DAB8] + 16);
    CGFloat v24 = *(double *)(MEMORY[0x1E4F1DAB8] + 24);
    double v26 = *(double *)(MEMORY[0x1E4F1DAB8] + 32);
    double v27 = *(double *)(MEMORY[0x1E4F1DAB8] + 40);
    if (v15 >= 1.0)
    {
      unint64_t v28 = v16;
      unint64_t v29 = v17;
    }
    else
    {
      unint64_t v28 = (unint64_t)(v15 * (double)v16) & 0xFFFFFFFFFFFFFFFELL;
      unint64_t v29 = (unint64_t)(v15 * (double)v17) & 0xFFFFFFFFFFFFFFFELL;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        LODWORD(buf.a) = 134218752;
        *(void *)((char *)&buf.a + 4) = v16;
        WORD2(buf.b) = 2048;
        *(void *)((char *)&buf.b + 6) = v20;
        HIWORD(buf.c) = 2048;
        *(void *)&buf.d = (unint64_t)(v15 * (double)v16) & 0xFFFFFFFFFFFFFFFELL;
        LOWORD(buf.tx) = 2048;
        *(void *)((char *)&buf.tx + 2) = v29;
        _os_log_impl(&dword_1BBEDA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[CGImage->CVPixelBuffer] Downscaling %zux%zu --> %zux%zu", (uint8_t *)&buf, 0x2Au);
      }
    }
    size_t v30 = v28;
    size_t v31 = v29;
    if (a5 >= 2)
    {
      if (a5 <= 4) {
        size_t v30 = v28;
      }
      else {
        size_t v30 = v29;
      }
      if (a5 <= 4) {
        size_t v31 = v29;
      }
      else {
        size_t v31 = v28;
      }
      CGFloat v24 = 0.0;
      CGFloat v25 = 1.0;
      CGFloat v22 = 1.0;
      double v26 = 0.0;
      double v27 = 0.0;
      CGFloat v23 = 0.0;
      switch(a5)
      {
        case 2u:
          double v26 = (double)v28;
          CGFloat v23 = -1.0;
          CGFloat v24 = 1.0;
          goto LABEL_30;
        case 3u:
          double v26 = (double)v28;
          double v27 = (double)v29;
          CGFloat v24 = -1.0;
          CGFloat v22 = 0.0;
          CGFloat v25 = 0.0;
          CGFloat v23 = -1.0;
          break;
        case 4u:
          double v27 = (double)v29;
          CGFloat v23 = 1.0;
          CGFloat v24 = -1.0;
LABEL_30:
          CGFloat v22 = 0.0;
          CGFloat v25 = 0.0;
          break;
        case 5u:
          double v26 = (double)v29;
          double v27 = (double)v28;
          CGFloat v22 = -1.0;
          goto LABEL_34;
        case 6u:
          double v27 = (double)v28;
          CGFloat v22 = -1.0;
          break;
        case 7u:
          break;
        case 8u:
          double v26 = (double)v29;
LABEL_34:
          CGFloat v25 = -1.0;
          break;
        default:
          CGFloat v23 = *v21;
          CGFloat v22 = v21[1];
          CGFloat v25 = v21[2];
          CGFloat v24 = v21[3];
          double v26 = v21[4];
          double v27 = v21[5];
          break;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        LODWORD(buf.a) = 67109120;
        HIDWORD(buf.a) = a5;
        _os_log_impl(&dword_1BBEDA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[CGImage->CVPixelBuffer] Rotating image (orientation %u) to upright", (uint8_t *)&buf, 8u);
      }
    }
    CFTypeRef cf = 0;
    if (a4 == 32) {
      uint32_t v32 = 2;
    }
    else {
      uint32_t v32 = 8194;
    }
    if (a4 == 32) {
      OSType v33 = 32;
    }
    else {
      OSType v33 = 1111970369;
    }
    ColorSpace = CGImageGetColorSpace(a3);
    v35 = ColorSpace;
    if (!ColorSpace) {
      goto LABEL_49;
    }
    if (CGColorSpaceSupportsOutput(ColorSpace) && CGColorSpaceGetNumberOfComponents(v35) == 1)
    {
      uint32_t v32 = 0;
      OSType v33 = 1278226488;
    }
    if (!CGColorSpaceSupportsOutput(v35) || CGColorSpaceUsesExtendedRange(v35))
    {
LABEL_49:
      v35 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
      CFTypeRef cf = v35;
      buf.a = 0.0;
      CF<opaqueCMSampleBuffer *>::~CF((const void **)&buf);
    }
    value = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    CFDictionaryRef pixelBufferAttributes = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    CFDictionarySetValue(pixelBufferAttributes, (const void *)*MEMORY[0x1E4F24D20], value);
    CVPixelBufferRef pixelBufferOut = 0;
    CVPixelBufferCreate(0, v30, v31, v33, pixelBufferAttributes, &pixelBufferOut);
    if (pixelBufferOut)
    {
      CVBufferSetAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x1E4F24A00], v35, kCVAttachmentMode_ShouldPropagate);
      CVPixelBufferRef pixelBuffer = pixelBufferOut;
      CVPixelBufferLockFlags unlockFlags = 0;
      if (pixelBufferOut)
      {
        CVReturn v19 = CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
        CVReturn v68 = v19;
        if (v19)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:]();
          }
        }
        else
        {
          BaseAddress = CVPixelBufferGetBaseAddress(pixelBufferOut);
          size_t v54 = CVPixelBufferGetWidth(pixelBufferOut);
          size_t v55 = CVPixelBufferGetHeight(pixelBufferOut);
          size_t BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBufferOut);
          v57 = CGBitmapContextCreate(BaseAddress, v54, v55, 8uLL, BytesPerRow, v35, v32);
          CGContextRef c = v57;
          if (v57)
          {
            buf.a = v23;
            buf.b = v22;
            buf.CGContextRef c = v25;
            buf.d = v24;
            buf.tx = v26;
            buf.ty = v27;
            CGContextConcatCTM(v57, &buf);
            v77.size.width = (double)v28;
            v77.size.height = (double)v29;
            v77.origin.x = 0.0;
            v77.origin.y = 0.0;
            CGContextDrawImage(c, v77, a3);
            CVReturn v19 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v68);
            if (!v19)
            {
              v58 = pixelBufferOut;
              if (pixelBufferOut) {
                v58 = (__CVBuffer *)CFRetain(pixelBufferOut);
              }
              CVReturn v19 = 0;
              *a7 = v58;
            }
          }
          else
          {
            BOOL v59 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
            if (v59) {
              CGImage_CreateCVPixelBuffer(v59, v60, v61, v62, v63, v64, v65, v66);
            }
            CVReturn v19 = -18;
          }
          CF<opaqueCMSampleBuffer *>::~CF((const void **)&c);
          if (pixelBuffer
            && !v68
            && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
            && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            -[VCPCNNSmileDetector detectSmileForFace:inBuffer:smile:]();
          }
        }
      }
      else
      {
        BOOL v44 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
        if (v44) {
          -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v44, v45, v46, v47, v48, v49, v50, v51);
        }
        CVReturn v19 = -50;
      }
    }
    else
    {
      BOOL v36 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      if (v36) {
        CGImage_CreateCVPixelBuffer(v36, v37, v38, v39, v40, v41, v42, v43);
      }
      CVReturn v19 = -18;
    }
    CF<opaqueCMSampleBuffer *>::~CF((const void **)&pixelBufferOut);
    CF<opaqueCMSampleBuffer *>::~CF((const void **)&pixelBufferAttributes);
    CF<opaqueCMSampleBuffer *>::~CF((const void **)&value);
    CF<opaqueCMSampleBuffer *>::~CF(&cf);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[VCPImageManager drawImage:pixelFormat:withOrientation:maxDimension:pixelBuffer:](v15);
    }
    return -50;
  }
  return v19;
}

- (int)decodeImageSource:(CGImageSource *)a3 withUniformTypeIdentifier:(id)a4 pixelFormat:(int)a5 maxDimension:(unint64_t)a6 orientation:(unsigned int *)a7 pixelBuffer:(__CVBuffer *)a8
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v51 = a4;
  OSStatus v11 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v49 = a7;
  [v11 setValue:MEMORY[0x1E4F1CC28] forKey:*MEMORY[0x1E4F2FF08]];
  [v11 setValue:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F2FF88]];
  if (!a6) {
    goto LABEL_30;
  }
  CFDictionaryRef v12 = CGImageSourceCopyPropertiesAtIndex(a3, 0, 0);
  id v13 = [(__CFDictionary *)v12 objectForKey:*MEMORY[0x1E4F2FD00]];
  unint64_t v14 = [(__CFDictionary *)v12 objectForKey:*MEMORY[0x1E4F2FCE8]];
  double v15 = [(__CFDictionary *)v12 objectForKey:*MEMORY[0x1E4F2FCA0]];
  id v16 = v13;
  id v17 = v14;
  id v18 = v15;
  if (![v16 intValue] || !objc_msgSend(v17, "intValue"))
  {
    double v24 = *MEMORY[0x1E4F1DB30];
    double v23 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    goto LABEL_14;
  }
  if (!v18) {
    goto LABEL_11;
  }
  unsigned int v19 = [v18 unsignedIntValue];
  unsigned int v20 = v19;
  if (v19 - 9 <= 0xFFFFFFF7)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)CGAffineTransform buf = 67109120;
      *(_DWORD *)&buf[4] = v20;
      _os_log_impl(&dword_1BBEDA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Orientation value %u invalid, assuming kCGImagePropertyOrientationUp", buf, 8u);
    }
    int v21 = [v16 intValue];
    int v22 = [v17 intValue];
    goto LABEL_13;
  }
  if (v19 > 4)
  {
    int v21 = [v17 intValue];
    int v22 = [v16 intValue];
  }
  else
  {
LABEL_11:
    int v21 = [v16 intValue];
    int v22 = [v17 intValue];
  }
LABEL_13:
  double v23 = (double)v22;
  double v24 = (double)v21;
LABEL_14:

  if (v24 < v23) {
    double v25 = v23;
  }
  else {
    double v25 = v24;
  }
  if (v25 > (double)a6)
  {
    int v26 = [v51 conformsToType:*MEMORY[0x1E4F44460]];
    double v27 = log2(v25 / (double)a6);
    double v28 = ceil(v27);
    double v29 = floor(v27);
    if (v26) {
      double v29 = v28;
    }
    float v30 = v29;
    int v31 = (int)exp2f(v30);
    if (v31 >= 32) {
      uint64_t v32 = 32;
    }
    else {
      uint64_t v32 = v31;
    }
    if ((int)v32 > 1)
    {
      if (+[VCPImageManager loggingEnabled]
        && (int)MediaAnalysisLogLevel() >= 6)
      {
        OSType v33 = VCPLogInstance();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)CGAffineTransform buf = 134218752;
          *(double *)&buf[4] = v24;
          __int16 v55 = 2048;
          double v56 = v23;
          __int16 v57 = 2048;
          unint64_t v58 = a6;
          __int16 v59 = 1024;
          int v60 = v32;
          _os_log_impl(&dword_1BBEDA000, v33, OS_LOG_TYPE_INFO, "[Decode] %.0fx%.0f --> %zu; subsampling %dx on decode",
            buf,
            0x26u);
        }
      }
      v34 = [NSNumber numberWithInt:v32];
      [v11 setValue:v34 forKey:*MEMORY[0x1E4F2FF58]];
    }
  }
LABEL_30:
  CFDictionaryRef v35 = CGImageSourceCopyPropertiesAtIndex(a3, 0, 0);
  BOOL v36 = [(__CFDictionary *)v35 objectForKey:*MEMORY[0x1E4F2FCA0]];
  uint64_t v37 = v36;
  if (v36) {
    uint64_t v38 = [v36 unsignedIntValue];
  }
  else {
    uint64_t v38 = 1;
  }

  if (v49 || v38 == 1)
  {
    IOSurfaceAtIndex = (__IOSurface *)CGImageSourceCreateIOSurfaceAtIndex();
    *(void *)CGAffineTransform buf = IOSurfaceAtIndex;
    if (IOSurfaceAtIndex)
    {
      if (!CVPixelBufferCreateWithIOSurface(0, IOSurfaceAtIndex, 0, a8))
      {
        if (v49) {
          *uint64_t v49 = v38;
        }
        goto LABEL_47;
      }
      if ((int)MediaAnalysisLogLevel() < 4)
      {
LABEL_47:
        CF<opaqueCMSampleBuffer *>::~CF((const void **)buf);
        goto LABEL_48;
      }
      uint64_t v40 = VCPLogInstance();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v53 = 0;
        _os_log_impl(&dword_1BBEDA000, v40, OS_LOG_TYPE_DEFAULT, "[Decode] Failed to create CVPixelBuffer from IOSurface; falling back to rendering path",
          v53,
          2u);
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 4) {
        goto LABEL_47;
      }
      uint64_t v40 = VCPLogInstance();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v53 = 0;
        _os_log_impl(&dword_1BBEDA000, v40, OS_LOG_TYPE_DEFAULT, "[Decode] Failed to obtain IOSurface; falling back to rendering path",
          v53,
          2u);
      }
    }

    goto LABEL_47;
  }
LABEL_48:
  uint64_t v41 = *a8;
  if (*a8) {
    goto LABEL_49;
  }
  CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(a3, 0, (CFDictionaryRef)v11);
  *(void *)CGAffineTransform buf = ImageAtIndex;
  if (ImageAtIndex)
  {
    int v42 = [(VCPImageManager *)self drawImage:ImageAtIndex pixelFormat:a5 withOrientation:v38 maxDimension:a6 pixelBuffer:a8];
    if (!v42)
    {
      CF<opaqueCMSampleBuffer *>::~CF((const void **)buf);
      uint64_t v41 = *a8;
LABEL_49:
      if (CVPixelBufferGetPixelFormatType(v41) == a5)
      {
        int v42 = 0;
        goto LABEL_68;
      }
      signed int PixelFormatType = CVPixelBufferGetPixelFormatType(*a8);
      uint64_t v45 = 0;
      if (PixelFormatType <= 875704437)
      {
        if (PixelFormatType == 32) {
          goto LABEL_62;
        }
        int v46 = 875704422;
      }
      else
      {
        if (PixelFormatType == 875704438 || PixelFormatType == 1111970369) {
          goto LABEL_62;
        }
        int v46 = 1278226488;
      }
      if (PixelFormatType != v46) {
        uint64_t v45 = 1;
      }
LABEL_62:
      int v42 = [(VCPImageManager *)self convertPixelBuffer:a8 toPixelFormat:a5 flushCache:v45];
      if (!v42) {
        goto LABEL_68;
      }
      goto LABEL_66;
    }
  }
  else
  {
    int v42 = -18;
  }
  CF<opaqueCMSampleBuffer *>::~CF((const void **)buf);
LABEL_66:
  if (*a8)
  {
    CFRelease(*a8);
    *a8 = 0;
  }
LABEL_68:

  return v42;
}

- (__CVBuffer)pixelBufferWithFormat:(int)a3 andMaxDimension:(unint64_t)a4 fromData:(id)a5 withUniformTypeIdentifier:(id)a6 flushCache:(BOOL)a7 orientation:(unsigned int *)a8
{
  id v14 = a5;
  id v15 = a6;
  id v16 = v15;
  if (v14)
  {
    uint64_t v29 = 0;
    float v30 = &v29;
    uint64_t v31 = 0x2020000000;
    uint64_t v32 = 0;
    if (a8) {
      *a8 = 1;
    }
    transcodeQueue = self->_transcodeQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __115__VCPImageManager_pixelBufferWithFormat_andMaxDimension_fromData_withUniformTypeIdentifier_flushCache_orientation___block_invoke;
    block[3] = &unk_1E629C388;
    id v21 = v15;
    int v22 = self;
    int v27 = a3;
    id v23 = v14;
    double v24 = &v29;
    unint64_t v25 = a4;
    int v26 = a8;
    BOOL v28 = a7;
    dispatch_sync(transcodeQueue, block);
    id v18 = (__CVBuffer *)v30[3];

    _Block_object_dispose(&v29, 8);
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

void __115__VCPImageManager_pixelBufferWithFormat_andMaxDimension_fromData_withUniformTypeIdentifier_flushCache_orientation___block_invoke(uint64_t a1)
{
  if (+[VCPImageManager canDecodeAcceleratedUniformTypeIdentifier:*(void *)(a1 + 32)])
  {
    if (![*(id *)(a1 + 40) acceleratedDecodeImageData:*(void *)(a1 + 48) pixelFormat:*(unsigned int *)(a1 + 80) maxDimension:*(void *)(a1 + 64) pixelBuffer:*(void *)(*(void *)(a1 + 56) + 8) + 24 orientation:*(void *)(a1 + 72) flushCache:*(unsigned __int8 *)(a1 + 84)])return; {
    if (+[VCPImageManager loggingEnabled]
    }
      && (int)MediaAnalysisLogLevel() >= 5)
    {
      v2 = VCPLogInstance();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v13 = 0;
        _os_log_impl(&dword_1BBEDA000, v2, OS_LOG_TYPE_DEFAULT, "[Decode] Accelerated decode failed; falling back to CGImage",
          v13,
          2u);
      }
    }
  }
  CGImageSourceRef v3 = CGImageSourceCreateWithData(*(CFDataRef *)(a1 + 48), 0);
  if ([*(id *)(a1 + 40) decodeImageSource:v3 withUniformTypeIdentifier:*(void *)(a1 + 32) pixelFormat:*(unsigned int *)(a1 + 80) maxDimension:*(void *)(a1 + 64) orientation:*(void *)(a1 + 72) pixelBuffer:*(void *)(*(void *)(a1 + 56) + 8) + 24])
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
    BOOL v5 = *(const void **)(v4 + 24);
    if (v5)
    {
      CFRelease(v5);
      *(void *)(v4 + 24) = 0;
    }
    if (v3) {
      CFRelease(v3);
    }
    uint64_t v6 = [*(id *)(a1 + 32) preferredFilenameExtension];
    BOOL v7 = +[MADImageASTCFormatReader isValidASTCExtension:v6];

    if (v7)
    {
      v8 = [[MADImageASTCFormatReader alloc] initWithData:*(void *)(a1 + 48)];
      objc_super v9 = v8;
      if (v8)
      {
        CFDictionaryRef v10 = [(MADImageASTCFormatReader *)v8 readNextImageSource];
        if (v10)
        {
          if ([*(id *)(a1 + 40) decodeImageSource:v10 withUniformTypeIdentifier:*(void *)(a1 + 32) pixelFormat:*(unsigned int *)(a1 + 80) maxDimension:*(void *)(a1 + 64) orientation:*(void *)(a1 + 72) pixelBuffer:*(void *)(*(void *)(a1 + 56) + 8) + 24])
          {
            uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
            CFDictionaryRef v12 = *(const void **)(v11 + 24);
            if (v12)
            {
              CFRelease(v12);
              *(void *)(v11 + 24) = 0;
            }
          }
          CFRelease(v10);
        }
      }
    }
  }
  else if (v3)
  {
    CFRelease(v3);
  }
}

- (__CVBuffer)imageForResource:(id)a3 pixelFormat:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  BOOL v7 = (void *)MEMORY[0x1C186D320]();
  v8 = [(VCPImageManager *)self dataForResource:v6];
  objc_super v9 = objc_msgSend(v6, "vcp_uniformTypeIdentifier");
  CFDictionaryRef v10 = [(VCPImageManager *)self pixelBufferWithFormat:v4 andMaxDimension:0 fromData:v8 withUniformTypeIdentifier:v9 flushCache:1 orientation:0];

  return v10;
}

- (__CVBuffer)imageForResource:(id)a3 pixelFormat:(int)a4 maxDimension:(unint64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  if (a5 >= 2)
  {
    CFDictionaryRef v10 = (void *)MEMORY[0x1C186D320]();
    uint64_t v11 = [(VCPImageManager *)self dataForResource:v8];
    CFDictionaryRef v12 = objc_msgSend(v8, "vcp_uniformTypeIdentifier");
    objc_super v9 = [(VCPImageManager *)self pixelBufferWithFormat:v6 andMaxDimension:a5 fromData:v11 withUniformTypeIdentifier:v12 flushCache:1 orientation:0];
  }
  else
  {
    objc_super v9 = 0;
  }

  return v9;
}

- (__CVBuffer)imageForResource:(id)a3 pixelFormat:(int)a4 maxDimension:(unint64_t)a5 orientation:(unsigned int *)a6
{
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  if (a5 >= 2)
  {
    CFDictionaryRef v12 = (void *)MEMORY[0x1C186D320]();
    id v13 = [(VCPImageManager *)self dataForResource:v10];
    id v14 = objc_msgSend(v10, "vcp_uniformTypeIdentifier");
    uint64_t v11 = [(VCPImageManager *)self pixelBufferWithFormat:v8 andMaxDimension:a5 fromData:v13 withUniformTypeIdentifier:v14 flushCache:1 orientation:a6];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (__CVBuffer)pixelBufferWithFormat:(int)a3 fromImageURL:(id)a4 flushCache:(BOOL)a5
{
  return [(VCPImageManager *)self pixelBufferWithFormat:*(void *)&a3 fromImageURL:a4 flushCache:a5 orientation:0];
}

- (__CVBuffer)pixelBufferWithFormat:(int)a3 andMaxDimension:(unint64_t)a4 fromImageURL:(id)a5 flushCache:(BOOL)a6 orientation:(unsigned int *)a7
{
  BOOL v8 = a6;
  uint64_t v10 = *(void *)&a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  id v13 = (void *)MEMORY[0x1C186D320]();
  if (v12)
  {
    id v21 = 0;
    [v12 getResourceValue:&v21 forKey:*MEMORY[0x1E4F1C538] error:0];
    id v14 = v21;
    id v20 = 0;
    id v15 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v12 options:1 error:&v20];
    id v19 = v20;
    if (v15)
    {
      id v16 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v12];
      id v17 = [(VCPImageManager *)self pixelBufferWithFormat:v10 andMaxDimension:a4 fromData:v16 withUniformTypeIdentifier:v14 flushCache:v8 orientation:a7];
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        id v17 = 0;
        goto LABEL_12;
      }
      id v16 = VCPLogInstance();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)CGAffineTransform buf = 138412546;
        id v23 = v12;
        __int16 v24 = 2112;
        id v25 = v19;
        _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_ERROR, "Failed to load url %@ (%@)", buf, 0x16u);
      }
      id v17 = 0;
    }

LABEL_12:
    goto LABEL_13;
  }
  id v14 = VCPLogInstance();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
    -[VCPImageManager pixelBufferWithFormat:andMaxDimension:fromImageURL:flushCache:orientation:](v14);
  }
  id v17 = 0;
LABEL_13:

  return v17;
}

- (__CVBuffer)pixelBufferWithFormat:(int)a3 fromImageURL:(id)a4 flushCache:(BOOL)a5 orientation:(unsigned int *)a6
{
  return [(VCPImageManager *)self pixelBufferWithFormat:*(void *)&a3 andMaxDimension:0 fromImageURL:a4 flushCache:a5 orientation:a6];
}

- (__CVBuffer)pixelBufferWithFormat:(int)a3 andMaxDimension:(unint64_t)a4 fromImageURL:(id)a5
{
  return [(VCPImageManager *)self pixelBufferWithFormat:*(void *)&a3 andMaxDimension:a4 fromImageURL:a5 orientation:0];
}

- (__CVBuffer)pixelBufferWithFormat:(int)a3 andMaxDimension:(unint64_t)a4 fromImageURL:(id)a5 orientation:(unsigned int *)a6
{
  uint64_t v8 = *(void *)&a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  uint64_t v11 = v10;
  if (a4 < 2)
  {
LABEL_8:
    id v16 = 0;
    goto LABEL_15;
  }
  if (!v10)
  {
    id v17 = VCPLogInstance();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      -[VCPImageManager pixelBufferWithFormat:andMaxDimension:fromImageURL:flushCache:orientation:](v17);
    }

    goto LABEL_8;
  }
  id v12 = (void *)MEMORY[0x1C186D320]();
  id v21 = 0;
  [v11 getResourceValue:&v21 forKey:*MEMORY[0x1E4F1C538] error:0];
  id v13 = v21;
  id v20 = 0;
  id v14 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v11 options:1 error:&v20];
  id v15 = v20;
  if (v14)
  {
    id v16 = [(VCPImageManager *)self pixelBufferWithFormat:v8 andMaxDimension:a4 fromData:v14 withUniformTypeIdentifier:v13 flushCache:1 orientation:a6];
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v18 = VCPLogInstance();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)CGAffineTransform buf = 138412546;
        id v23 = v11;
        __int16 v24 = 2112;
        id v25 = v15;
        _os_log_impl(&dword_1BBEDA000, v18, OS_LOG_TYPE_ERROR, "Failed to load url %@ (%@)", buf, 0x16u);
      }
    }
    id v16 = 0;
  }

LABEL_15:

  return v16;
}

- (void)flushCache
{
  if (self->_decodeSession) {
    CMPhotoDecompressionSessionDiscardCachedBuffers();
  }
}

+ (BOOL)_exportReencodedJPEG
{
  return 0;
}

- (int)compressCVPixelBuffer:(__CVBuffer *)a3 toJPEGData:(id *)a4 targetBitStreamLength:(unint64_t)a5 padding:(BOOL)a6
{
  v43[3] = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      __int16 v24 = VCPLogInstance();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)CGAffineTransform buf = 0;
        _os_log_impl(&dword_1BBEDA000, v24, OS_LOG_TYPE_ERROR, "[ImageManagerEncode] inputCVPixelBuffer cannot be NULL", buf, 2u);
      }
      goto LABEL_16;
    }
    return -50;
  }
  if (!a4)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      __int16 v24 = VCPLogInstance();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)CGAffineTransform buf = 0;
        _os_log_impl(&dword_1BBEDA000, v24, OS_LOG_TYPE_ERROR, "[ImageManagerEncode] outputJPEGData cannot be nil", buf, 2u);
      }
      goto LABEL_16;
    }
    return -50;
  }
  if (!a5)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      __int16 v24 = VCPLogInstance();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)CGAffineTransform buf = 0;
        _os_log_impl(&dword_1BBEDA000, v24, OS_LOG_TYPE_ERROR, "[ImageManagerEncode] targetBitStreamLength cannot be 0", buf, 2u);
      }
LABEL_16:

      return -50;
    }
    return -50;
  }
  uint64_t v11 = *MEMORY[0x1E4F56060];
  v42[0] = *MEMORY[0x1E4F56058];
  v42[1] = v11;
  v43[0] = &unk_1F15EDAA0;
  v43[1] = &unk_1F15EDAA0;
  v42[2] = *MEMORY[0x1E4F56048];
  v43[2] = &unk_1F15EDAB8;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:3];
  uint64_t v13 = *MEMORY[0x1E4F560E8];
  v40[0] = *MEMORY[0x1E4F560B8];
  v40[1] = v13;
  uint64_t v14 = MEMORY[0x1E4F1CC38];
  v41[0] = &unk_1F15EDAD0;
  v41[1] = MEMORY[0x1E4F1CC38];
  uint64_t v15 = *MEMORY[0x1E4F56158];
  v41[2] = &unk_1F15EDAE8;
  uint64_t v16 = *MEMORY[0x1E4F56150];
  v40[2] = v15;
  v40[3] = v16;
  uint64_t v38 = *MEMORY[0x1E4F56340];
  id v17 = [NSNumber numberWithUnsignedInteger:a5];
  uint64_t v39 = v17;
  id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
  v40[4] = *MEMORY[0x1E4F56130];
  v41[3] = v18;
  v41[4] = v14;
  id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:5];

  *(void *)CGAffineTransform buf = 0;
  CFDictionaryRef v35 = buf;
  uint64_t v36 = 0x2020000000;
  int v37 = 0;
  transcodeQueue = self->_transcodeQueue;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __82__VCPImageManager_compressCVPixelBuffer_toJPEGData_targetBitStreamLength_padding___block_invoke;
  v26[3] = &unk_1E629C3B0;
  v26[4] = self;
  id v27 = v12;
  id v28 = v19;
  uint64_t v29 = buf;
  unint64_t v30 = a5;
  uint64_t v31 = a3;
  BOOL v33 = a6;
  uint64_t v32 = a4;
  id v21 = v19;
  id v22 = v12;
  dispatch_sync(transcodeQueue, v26);
  int v23 = *((_DWORD *)v35 + 6);

  _Block_object_dispose(buf, 8);
  return v23;
}

void __82__VCPImageManager_compressCVPixelBuffer_toJPEGData_targetBitStreamLength_padding___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v2 = VCPLogInstance();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v3 = *(void *)(a1 + 64);
      *(_DWORD *)CGAffineTransform buf = 134217984;
      unint64_t v31 = v3;
      _os_log_impl(&dword_1BBEDA000, v2, OS_LOG_TYPE_DEBUG, "[ImageManagerEncode] Encoding CVPixelBuffer -> JPEG (%lu Bytes)", buf, 0xCu);
    }
  }
  if (!*(void *)(*(void *)(a1 + 32) + 8))
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = CMPhotoCompressionSessionCreate();
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      if ((int)MediaAnalysisLogLevel() < 3) {
        return;
      }
      uint64_t v4 = VCPLogInstance();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)CGAffineTransform buf = 0;
        _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_ERROR, "[ImageManagerEncode] Failed to create compression session", buf, 2u);
      }
      goto LABEL_47;
    }
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = CMPhotoCompressionSessionOpenEmptyContainer();
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    if ((int)MediaAnalysisLogLevel() < 3) {
      return;
    }
    uint64_t v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)CGAffineTransform buf = 0;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_ERROR, "[ImageManagerEncode] Fail to open compression container", buf, 2u);
    }
    goto LABEL_47;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = CMPhotoCompressionSessionAddImage();
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    if ((int)MediaAnalysisLogLevel() < 3) {
      return;
    }
    uint64_t v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)CGAffineTransform buf = 0;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_ERROR, "[ImageManagerEncode] Fail to image buffer", buf, 2u);
    }
    goto LABEL_47;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = CMPhotoCompressionSessionCloseContainerAndCopyBacking();
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    uint64_t v4 = 0;
    if (!*(unsigned char *)(a1 + 88)) {
      goto LABEL_34;
    }
    unint64_t v5 = [0 length];
    unint64_t v6 = v5;
    unint64_t v7 = *(void *)(a1 + 64);
    unint64_t v8 = v7 - v5;
    if (v7 < v5)
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = -18;
      if ((int)MediaAnalysisLogLevel() < 3) {
        goto LABEL_47;
      }
      objc_super v9 = VCPLogInstance();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)CGAffineTransform buf = 134217984;
        unint64_t v31 = v6;
        _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_ERROR, "[ImageManagerEncode] Oversized data (%luBytes)", buf, 0xCu);
      }
LABEL_46:

      goto LABEL_47;
    }
    if (v7 == v5)
    {
LABEL_34:
      **(void **)(a1 + 80) = 0;
    }
    else
    {
      int v10 = MediaAnalysisLogLevel();
      if (v10 >= 7)
      {
        uint64_t v11 = VCPLogInstance();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)CGAffineTransform buf = 134217984;
          unint64_t v31 = v8;
          _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_DEBUG, "[ImageManagerEncode] Padding JPEG with %lu Bytes", buf, 0xCu);
        }
      }
      id v12 = (void *)[0 mutableCopy];
      uint64_t v13 = [MEMORY[0x1E4F1CA58] dataWithLength:v8];
      [v12 appendData:v13];

      id v14 = v12;
      **(void **)(a1 + 80) = v14;
    }
    if (![(id)objc_opt_class() _exportReencodedJPEG]) {
      goto LABEL_47;
    }
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      uint64_t v15 = VCPLogInstance();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)CGAffineTransform buf = 0;
        _os_log_impl(&dword_1BBEDA000, v15, OS_LOG_TYPE_DEBUG, "[ImageManagerEncode] Exporting reencoded JPEGs", buf, 2u);
      }
    }
    objc_super v9 = [MEMORY[0x1E4F1C9C8] now];
    uint64_t v16 = (void *)MEMORY[0x1E4F1CB10];
    id v17 = NSTemporaryDirectory();
    id v18 = NSString;
    [v9 timeIntervalSinceReferenceDate];
    id v20 = objc_msgSend(v18, "stringWithFormat:", @"MADImageManagerEncode_%.3f_unpadded.jpg", v19);
    id v21 = [v17 stringByAppendingPathComponent:v20];
    id v22 = [v16 fileURLWithPath:v21];

    [0 writeToURL:v22 atomically:1];
    int v23 = (void *)MEMORY[0x1E4F1CB10];
    __int16 v24 = NSTemporaryDirectory();
    id v25 = NSString;
    [v9 timeIntervalSinceReferenceDate];
    id v27 = objc_msgSend(v25, "stringWithFormat:", @"MADImageManagerEncode_%.3f_padded.jpg", v26);
    id v28 = [v24 stringByAppendingPathComponent:v27];
    uint64_t v29 = [v23 fileURLWithPath:v28];

    [**(id **)(a1 + 80) writeToURL:v29 atomically:1];
    goto LABEL_46;
  }
  if ((int)MediaAnalysisLogLevel() < 3) {
    return;
  }
  uint64_t v4 = VCPLogInstance();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)CGAffineTransform buf = 0;
    _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_ERROR, "[ImageManagerEncode] Fail to get transcoded data", buf, 2u);
  }
LABEL_47:
}

- (void).cxx_destruct
{
}

- (void)drawImage:(double)a1 pixelFormat:withOrientation:maxDimension:pixelBuffer:.cold.1(double a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 134217984;
  double v2 = a1;
  _os_log_error_impl(&dword_1BBEDA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "[CGImage->CVPixelBuffer] Invalid downscaling factor %f", (uint8_t *)&v1, 0xCu);
}

- (void)pixelBufferWithFormat:(os_log_t)log andMaxDimension:fromImageURL:flushCache:orientation:.cold.1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_fault_impl(&dword_1BBEDA000, log, OS_LOG_TYPE_FAULT, "Failed to load pixel buffer due to invalid nil url", v1, 2u);
}

@end