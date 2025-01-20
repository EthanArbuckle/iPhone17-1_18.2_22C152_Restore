@interface MIOPixelBufferUtility
+ (BOOL)bufferHasPadding:(__CVBuffer *)a3;
+ (BOOL)concatPixelBuffer:(__CVBuffer *)a3 withPixelBuffer:(__CVBuffer *)a4 targetPixelBuffer:(__CVBuffer *)a5;
+ (BOOL)copyAlphaChannelOfBuffer:(__CVBuffer *)a3 toMonochromeBuffer:(__CVBuffer *)a4;
+ (BOOL)copyAlphaChannelOfBuffer:(__CVBuffer *)a3 touint16Data:(unsigned __int16 *)a4;
+ (BOOL)copyData:(id)a3 toNonPlanarPixelBuffer:(__CVBuffer *)a4;
+ (BOOL)copyData:(id)a3 toPlanarPixelBuffer:(__CVBuffer *)a4 toPlane:(unint64_t)a5;
+ (BOOL)copyFromPixelBuffer:(__CVBuffer *)a3 toPixelBuffer:(__CVBuffer *)a4 andShiftBits:(int)a5;
+ (BOOL)copyMonochromeBuffer:(__CVBuffer *)a3 toAlphaChannelOfBuffer:(__CVBuffer *)a4;
+ (BOOL)copyPixelBuffer:(__CVBuffer *)a3 toPixelBuffer:(__CVBuffer *)a4;
+ (BOOL)copyPixelBuffer:(__CVBuffer *)a3 toPixelBuffer:(__CVBuffer *)a4 bytesPerPixel:(double)a5;
+ (BOOL)copyuint16Data:(unsigned __int16 *)a3 toAlphaChannelOfBuffer:(__CVBuffer *)a4;
+ (BOOL)fillPlaneOfPixelBuffer:(__CVBuffer *)a3 planeIndex:(int)a4 withValue:(unsigned __int16)a5;
+ (BOOL)isPixelBufferCompandedRawBayer:(__CVBuffer *)a3;
+ (BOOL)isPixelBufferRawBayer:(__CVBuffer *)a3;
+ (BOOL)isPixelFormatCompandedRawBayer:(unsigned int)a3;
+ (BOOL)isPixelFormatRawBayer:(unsigned int)a3;
+ (BOOL)joinCompandedWarholBuffer:(__CVBuffer *)a3 intoCompandedBayerBuffer:(__CVBuffer *)a4;
+ (BOOL)joinWarholBuffer:(__CVBuffer *)a3 intoBayerBuffer:(__CVBuffer *)a4 shiftBitsRightBy:(int)a5 msbReplication:(BOOL)a6;
+ (BOOL)joinYUVBuffer:(__CVBuffer *)a3 intoRawBayerPixelBuffer:(__CVBuffer *)a4 shiftBitsLeftBy:(int)a5 msbReplication:(BOOL)a6;
+ (BOOL)splitBayerBuffer:(__CVBuffer *)a3 intoWarholPixelBuffer:(__CVBuffer *)a4 shiftBitsLeftBy:(int)a5;
+ (BOOL)splitBayerBuffer:(__CVBuffer *)a3 intoYUVPixelBuffer:(__CVBuffer *)a4 shiftBitsLeftBy:(int)a5;
+ (BOOL)splitCompandedBayerBuffer:(__CVBuffer *)a3 intoCompandedWarholPixelBuffer:(__CVBuffer *)a4;
+ (BOOL)transferL010PixelBuffer:(__CVBuffer *)a3 toq8q2PixelBuffer:(__CVBuffer *)a4;
+ (BOOL)transferq8q2PixelBuffer:(__CVBuffer *)a3 toL010PixelBuffer:(__CVBuffer *)a4;
+ (BOOL)verticallySplitPixelBuffer:(__CVBuffer *)a3 intoTopPixelBuffer:(__CVBuffer *)a4 bottomPixelBuffer:(__CVBuffer *)a5;
+ (BOOL)writeBuffer:(__CVBuffer *)a3 toFile:(id)a4;
+ (__CFDictionary)createPixelBufferAttributesWithWidth:(unsigned int)a3 height:(unsigned int)a4 extendedPixelsPerRow:(unsigned int)a5 pixelFormat:(int)a6 bytesPerRowAlignment:(unsigned int)a7 planeAlignment:(unsigned int)a8;
+ (__CFDictionary)createPixelBufferAttributesWithWidth:(unsigned int)a3 height:(unsigned int)a4 extendedPixelsPerRow:(unsigned int)a5 pixelFormat:(int)a6 bytesPerRowAlignment:(unsigned int)a7 planeAlignment:(unsigned int)a8 bufferCacheMode:(int)a9;
+ (__CFDictionary)createPixelBufferAttributesWithWidth:(unsigned int)a3 height:(unsigned int)a4 pixelFormat:(int)a5 bytesPerRow:(unsigned int)a6;
+ (__CFDictionary)createPixelBufferAttributesWithWidth:(unsigned int)a3 height:(unsigned int)a4 pixelFormat:(int)a5 bytesPerRows:(id)a6;
+ (__CVBuffer)combineLeftBuffer:(__CVBuffer *)a3 rightBuffer:(__CVBuffer *)a4;
+ (__CVBuffer)create4444AYpCbCr16PixelBufferFillAlphaWithData:(__CFData *)a3 width:(unint64_t)a4 height:(unint64_t)a5;
+ (__CVBuffer)createRawPixelBufferWithWidth:(unsigned int)a3 height:(unsigned int)a4 extendedRows:(unsigned int)a5 extendedPixelsPerRow:(unsigned int)a6 pixelFormat:(int)a7 bytesPerRowAlignment:(unsigned int)a8 planeAlignment:(unsigned int)a9 bufferCacheMode:(unsigned int)a10;
+ (__CVBuffer)createRawPixelBufferWithWidth:(unsigned int)a3 height:(unsigned int)a4 pixelFormat:(int)a5 bytesPerRow:(unsigned int)a6;
+ (__CVBuffer)newPixelBufferRefCopy:(__CVBuffer *)a3;
+ (__CVBuffer)newPixelBufferRefCopy:(__CVBuffer *)a3 attachmentKeysToCopy:(id)a4;
+ (__CVBuffer)newRawBayerBufferFromYUVPixelBuffer:(__CVBuffer *)a3 withPixelBufferPool:(__CVPixelBufferPool *)a4 msbReplication:(BOOL)a5;
+ (__CVBuffer)newWarholBufferFromCompandedRawBayerPixelBuffer:(__CVBuffer *)a3 withPixelBufferPool:(__CVPixelBufferPool *)a4;
+ (__CVBuffer)newWarholBufferFromRawBayerPixelBuffer:(__CVBuffer *)a3;
+ (__CVBuffer)newWarholBufferFromRawBayerPixelBuffer:(__CVBuffer *)a3 withPixelBufferPool:(__CVPixelBufferPool *)a4;
+ (__CVBuffer)newYUVBufferFromRawBayerPixelBuffer:(__CVBuffer *)a3 withPixelBufferPool:(__CVPixelBufferPool *)a4;
+ (__CVBuffer)pixelBufferFromPool:(__CVPixelBufferPool *)a3;
+ (__CVBuffer)readFrameFromFile:(id)a3 width:(unsigned int)a4 height:(unsigned int)a5 pixelFormat:(unsigned int)a6;
+ (__CVBuffer)stripBufferPadding:(__CVBuffer *)a3;
+ (__CVPixelBufferPool)createNewL008PixelBufferPoolWithReferencePixelBuffer:(__CVBuffer *)a3 minimumBufferCount:(unint64_t)a4;
+ (__CVPixelBufferPool)createNewL010PixelBufferPoolWithReferencePixelBuffer:(__CVBuffer *)a3 minimumBufferCount:(unint64_t)a4;
+ (__CVPixelBufferPool)createPixelBufferPoolWithWidth:(unint64_t)a3 height:(unint64_t)a4 format:(unsigned int)a5 bytesPerRow:(unint64_t)a6 minBufferCount:(unint64_t)a7;
+ (__CVPixelBufferPool)createPixelBufferPoolWithWidth:(unint64_t)a3 height:(unint64_t)a4 format:(unsigned int)a5 bytesPerRows:(id)a6 minBufferCount:(unint64_t)a7;
+ (__CVPixelBufferPool)createPixelBufferPoolWithWidth:(unint64_t)a3 height:(unint64_t)a4 format:(unsigned int)a5 extendedPixelsPerRow:(unint64_t)a6 minBufferCount:(unint64_t)a7;
+ (__CVPixelBufferPool)createPixelBufferPoolWithWidth:(unint64_t)a3 height:(unint64_t)a4 format:(unsigned int)a5 extendedPixelsPerRow:(unint64_t)a6 minBufferCount:(unint64_t)a7 bufferCacheMode:(int)a8;
+ (id)copyNonPlanarPixelBufferData:(__CVBuffer *)a3;
+ (id)copyPixelBufferData:(__CVBuffer *)a3 ofPlane:(unint64_t)a4;
+ (id)histogramOf8BitBuffer:(__CVBuffer *)a3;
+ (id)rangesOf8BitBuffer:(__CVBuffer *)a3;
+ (id)sharedBytesPerPixelLookUp;
+ (int64_t)numberOfPlanesForPixelFormatType:(unsigned int)a3;
+ (unint64_t)bytesPerWidthOfBuffer:(__CVBuffer *)a3;
+ (unint64_t)extendedPixelsPerRowOfPixelBuffer:(__CVBuffer *)a3;
+ (unint64_t)pixelBufferSizeWithPadding:(__CVBuffer *)a3;
+ (void)transferAttachmentForKey:(__CFString *)a3 fromBuffer:(__CVBuffer *)a4 toBuffer:(__CVBuffer *)a5;
+ (void)writeBuffer:(const char *)a3 ofSize:(unint64_t)a4 toFile:(id)a5;
@end

@implementation MIOPixelBufferUtility

+ (id)sharedBytesPerPixelLookUp
{
  if (+[MIOPixelBufferUtility sharedBytesPerPixelLookUp]::onceToken != -1) {
    dispatch_once(&+[MIOPixelBufferUtility sharedBytesPerPixelLookUp]::onceToken, &__block_literal_global_4);
  }
  v2 = (void *)+[MIOPixelBufferUtility sharedBytesPerPixelLookUp]::lookup;

  return v2;
}

uint64_t __50__MIOPixelBufferUtility_sharedBytesPerPixelLookUp__block_invoke()
{
  +[MIOPixelBufferUtility sharedBytesPerPixelLookUp]::lookup = [&unk_26CB7D548 mutableCopy];

  return MEMORY[0x270F9A758]();
}

+ (__CVBuffer)createRawPixelBufferWithWidth:(unsigned int)a3 height:(unsigned int)a4 extendedRows:(unsigned int)a5 extendedPixelsPerRow:(unsigned int)a6 pixelFormat:(int)a7 bytesPerRowAlignment:(unsigned int)a8 planeAlignment:(unsigned int)a9 bufferCacheMode:(unsigned int)a10
{
  CVPixelBufferRef pixelBufferOut = 0;
  LODWORD(v15) = a10;
  v13 = +[MIOPixelBufferUtility createPixelBufferAttributesWithWidth:*(void *)&a3 height:*(void *)&a4 extendedPixelsPerRow:*(void *)&a6 pixelFormat:*(void *)&a7 bytesPerRowAlignment:*(void *)&a8 planeAlignment:a9 bufferCacheMode:v15];
  CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], a3, a4, a7, v13, &pixelBufferOut);
  CFRelease(v13);
  return pixelBufferOut;
}

+ (__CVBuffer)createRawPixelBufferWithWidth:(unsigned int)a3 height:(unsigned int)a4 pixelFormat:(int)a5 bytesPerRow:(unsigned int)a6
{
  CVPixelBufferRef pixelBufferOut = 0;
  v9 = +[MIOPixelBufferUtility createPixelBufferAttributesWithWidth:*(void *)&a3 height:*(void *)&a4 pixelFormat:*(void *)&a5 bytesPerRow:*(void *)&a6];
  CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], a3, a4, a5, v9, &pixelBufferOut);
  CFRelease(v9);
  return pixelBufferOut;
}

+ (__CFDictionary)createPixelBufferAttributesWithWidth:(unsigned int)a3 height:(unsigned int)a4 pixelFormat:(int)a5 bytesPerRows:(id)a6
{
  unsigned int v20 = a4;
  unsigned int valuePtr = a3;
  int v19 = a5;
  id v6 = a6;
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFNumberRef v9 = CFNumberCreate(v7, kCFNumberIntType, &valuePtr);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F04240], v9);
  CFRelease(v9);
  if ([v6 count] == 1)
  {
    v10 = [v6 objectAtIndexedSubscript:0];
    int v11 = [v10 intValue];

    int v18 = v11;
    CFNumberRef v12 = CFNumberCreate(v7, kCFNumberIntType, &v18);
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F040C8], v12);
    CFRelease(v12);
  }
  if ((unint64_t)[v6 count] >= 2) {
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F040C8], v6);
  }
  CFNumberRef v13 = CFNumberCreate(v7, kCFNumberIntType, &v20);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F04118], v13);
  CFRelease(v13);
  CFNumberRef v14 = CFNumberCreate(v7, kCFNumberIntType, &v19);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F04180], v14);
  CFRelease(v14);
  uint64_t v15 = CFDictionaryCreateMutable(v7, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  int v18 = 0;
  CFNumberRef v16 = CFNumberCreate(v7, kCFNumberIntType, &v18);
  CFDictionarySetValue(v15, (const void *)*MEMORY[0x263F0ED58], v16);
  CFRelease(v16);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F04130], v15);
  CFRelease(v15);

  return Mutable;
}

+ (__CFDictionary)createPixelBufferAttributesWithWidth:(unsigned int)a3 height:(unsigned int)a4 pixelFormat:(int)a5 bytesPerRow:(unsigned int)a6
{
  unsigned int v21 = a4;
  unsigned int valuePtr = a3;
  int v20 = a5;
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  v8 = (const CFDictionaryKeyCallBacks *)MEMORY[0x263EFFF88];
  CFNumberRef v9 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFNumberRef v11 = CFNumberCreate(v7, kCFNumberIntType, &valuePtr);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F04240], v11);
  CFRelease(v11);
  unsigned int v19 = a6;
  CFNumberRef v12 = CFNumberCreate(v7, kCFNumberIntType, &v19);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F040C8], v12);
  CFRelease(v12);
  CFNumberRef v13 = CFNumberCreate(v7, kCFNumberIntType, &v21);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F04118], v13);
  CFRelease(v13);
  CFNumberRef v14 = CFNumberCreate(v7, kCFNumberIntType, &v20);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F04180], v14);
  CFRelease(v14);
  uint64_t v15 = CFDictionaryCreateMutable(v7, 0, v8, v9);
  int v18 = 0;
  CFNumberRef v16 = CFNumberCreate(v7, kCFNumberIntType, &v18);
  CFDictionarySetValue(v15, (const void *)*MEMORY[0x263F0ED58], v16);
  CFRelease(v16);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F04130], v15);
  CFRelease(v15);
  return Mutable;
}

+ (__CFDictionary)createPixelBufferAttributesWithWidth:(unsigned int)a3 height:(unsigned int)a4 extendedPixelsPerRow:(unsigned int)a5 pixelFormat:(int)a6 bytesPerRowAlignment:(unsigned int)a7 planeAlignment:(unsigned int)a8
{
  unsigned int v27 = a4;
  unsigned int valuePtr = a3;
  int v25 = a6;
  unsigned int v26 = a5;
  CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFNumberRef v13 = CFNumberCreate(v11, kCFNumberIntType, &valuePtr);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F04240], v13);
  CFRelease(v13);
  unsigned int v24 = a7;
  CFNumberRef v14 = CFNumberCreate(v11, kCFNumberIntType, &v24);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F04078], v14);
  CFRelease(v14);
  CFNumberRef v15 = CFNumberCreate(v11, kCFNumberIntType, &v27);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F04118], v15);
  CFRelease(v15);
  if (a5)
  {
    CFNumberRef v16 = CFNumberCreate(v11, kCFNumberIntType, &v26);
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F040F8], v16);
    CFRelease(v16);
  }
  CFNumberRef v17 = CFNumberCreate(v11, kCFNumberIntType, &v25);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F04180], v17);
  CFRelease(v17);
  unsigned int v23 = a8;
  CFNumberRef v18 = CFNumberCreate(v11, kCFNumberIntType, &v23);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F04198], v18);
  CFRelease(v18);
  unsigned int v19 = CFDictionaryCreateMutable(v11, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  int v22 = 0;
  CFNumberRef v20 = CFNumberCreate(v11, kCFNumberIntType, &v22);
  CFDictionarySetValue(v19, (const void *)*MEMORY[0x263F0ED58], v20);
  CFRelease(v20);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F04130], v19);
  CFRelease(v19);
  return Mutable;
}

+ (__CFDictionary)createPixelBufferAttributesWithWidth:(unsigned int)a3 height:(unsigned int)a4 extendedPixelsPerRow:(unsigned int)a5 pixelFormat:(int)a6 bytesPerRowAlignment:(unsigned int)a7 planeAlignment:(unsigned int)a8 bufferCacheMode:(int)a9
{
  int v9 = a9;
  v10 = +[MIOPixelBufferUtility createPixelBufferAttributesWithWidth:*(void *)&a3 height:*(void *)&a4 extendedPixelsPerRow:*(void *)&a5 pixelFormat:*(void *)&a6 bytesPerRowAlignment:1 planeAlignment:1];
  CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, v10);
  CFRelease(v10);
  if (!v9) {
    a9 = 0;
  }
  Mutable = CFDictionaryCreateMutable(v11, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFNumberRef v14 = CFNumberCreate(v11, kCFNumberIntType, &a9);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F0ED58], v14);
  CFRelease(v14);
  CFDictionarySetValue(MutableCopy, (const void *)*MEMORY[0x263F04130], Mutable);
  CFRelease(Mutable);
  return MutableCopy;
}

+ (__CVPixelBufferPool)createPixelBufferPoolWithWidth:(unint64_t)a3 height:(unint64_t)a4 format:(unsigned int)a5 extendedPixelsPerRow:(unint64_t)a6 minBufferCount:(unint64_t)a7 bufferCacheMode:(int)a8
{
  v16[1] = *MEMORY[0x263EF8340];
  LODWORD(v13) = a8;
  int v9 = +[MIOPixelBufferUtility createPixelBufferAttributesWithWidth:a3 height:a4 extendedPixelsPerRow:a6 pixelFormat:*(void *)&a5 bytesPerRowAlignment:1 planeAlignment:1 bufferCacheMode:v13];
  CVPixelBufferPoolRef poolOut = 0;
  uint64_t v15 = *MEMORY[0x263F041C0];
  v10 = [NSNumber numberWithUnsignedLong:a7];
  v16[0] = v10;
  CFDictionaryRef v11 = (const __CFDictionary *)[NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
  CVPixelBufferPoolCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v11, v9, &poolOut);

  CFRelease(v9);
  return poolOut;
}

+ (__CVBuffer)newPixelBufferRefCopy:(__CVBuffer *)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  CVPixelBufferRef pixelBufferOut = 0;
  IOSurface = CVPixelBufferGetIOSurface(a3);
  if (IOSurfaceGetProhibitUseCount())
  {
    uint64_t v12 = *MEMORY[0x263F040C0];
    v13[0] = MEMORY[0x263EFFA88];
    CFDictionaryRef v4 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
  }
  else
  {
    CFDictionaryRef v4 = 0;
  }
  CVReturn v5 = CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x263EFFB08], IOSurface, v4, &pixelBufferOut);
  if (v5)
  {
    id v6 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      CVReturn v11 = v5;
      _os_log_impl(&dword_21B5ED000, v6, OS_LOG_TYPE_ERROR, "ERROR CREATING PIXELBUFFERREFCOPY %d", buf, 8u);
    }

    CFAllocatorRef v7 = 0;
  }
  else
  {
    CFAllocatorRef v7 = pixelBufferOut;
  }

  return v7;
}

+ (__CVBuffer)newPixelBufferRefCopy:(__CVBuffer *)a3 attachmentKeysToCopy:(id)a4
{
  v27[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  IOSurface = CVPixelBufferGetIOSurface(a3);
  CVPixelBufferRef pixelBufferOut = 0;
  if (IOSurfaceGetProhibitUseCount())
  {
    uint64_t v26 = *MEMORY[0x263F040C0];
    v27[0] = MEMORY[0x263EFFA88];
    CFDictionaryRef v7 = [NSDictionary dictionaryWithObjects:v27 forKeys:&v26 count:1];
  }
  else
  {
    CFDictionaryRef v7 = 0;
  }
  CVReturn v8 = CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x263EFFB08], IOSurface, v7, &pixelBufferOut);
  if (v8)
  {
    int v9 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      CVReturn v25 = v8;
      _os_log_impl(&dword_21B5ED000, v9, OS_LOG_TYPE_ERROR, "ERROR CREATING PIXELBUFFERREFCOPY %d", buf, 8u);
    }

    v10 = 0;
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v11 = v5;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v19;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v11);
          }
          CFStringRef v15 = *(const __CFString **)(*((void *)&v18 + 1) + 8 * v14);
          *(_DWORD *)buf = 0;
          CFTypeRef v16 = CVBufferCopyAttachment(a3, v15, (CVAttachmentMode *)buf);
          if (v16)
          {
            CVBufferSetAttachment(pixelBufferOut, v15, v16, *(CVAttachmentMode *)buf);
            CFRelease(v16);
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v12);
    }

    v10 = pixelBufferOut;
  }

  return v10;
}

+ (BOOL)copyFromPixelBuffer:(__CVBuffer *)a3 toPixelBuffer:(__CVBuffer *)a4 andShiftBits:(int)a5
{
  if (a3) {
    BOOL v5 = a4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  BOOL v6 = !v5;
  if (!v5)
  {
    if (a5 >= 0) {
      LOBYTE(v10) = a5;
    }
    else {
      int v10 = -a5;
    }
    CVPixelBufferLockBaseAddress(a3, 1uLL);
    CVPixelBufferLockBaseAddress(a4, 0);
    if (CVPixelBufferIsPlanar(a3)) {
      BaseAddressOfPlane = (unsigned __int16 *)CVPixelBufferGetBaseAddressOfPlane(a3, 0);
    }
    else {
      BaseAddressOfPlane = (unsigned __int16 *)CVPixelBufferGetBaseAddress(a3);
    }
    uint64_t v12 = BaseAddressOfPlane;
    if (CVPixelBufferIsPlanar(a4)) {
      BaseAddress = (uint16x8_t *)CVPixelBufferGetBaseAddressOfPlane(a4, 0);
    }
    else {
      BaseAddress = (uint16x8_t *)CVPixelBufferGetBaseAddress(a4);
    }
    uint64_t v14 = BaseAddress;
    if (CVPixelBufferIsPlanar(a3)) {
      size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
    }
    else {
      size_t HeightOfPlane = CVPixelBufferGetHeight(a3);
    }
    size_t v16 = HeightOfPlane;
    if (CVPixelBufferIsPlanar(a3)) {
      size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
    }
    else {
      size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRow(a3);
    }
    unint64_t v18 = BytesPerRowOfPlane * v16;
    if (a5)
    {
      if (a5 < 1) {
        right_shift_uint16_buffer(v12, v14, v18, v10);
      }
      else {
        left_shift_uint16_buffer(v12, v14, v18, v10);
      }
    }
    else
    {
      memcpy(v14, v12, v18);
    }
    CVPixelBufferUnlockBaseAddress(a4, 0);
    CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  }
  return v6;
}

+ (__CVPixelBufferPool)createNewL010PixelBufferPoolWithReferencePixelBuffer:(__CVBuffer *)a3 minimumBufferCount:(unint64_t)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  unint64_t v8 = +[MOVStreamIOUtility getPreferredBytesPerRowAlignmentSize];
  int v9 = +[MIOPixelBufferUtility createPixelBufferAttributesWithWidth:height:extendedPixelsPerRow:pixelFormat:bytesPerRowAlignment:planeAlignment:](MIOPixelBufferUtility, "createPixelBufferAttributesWithWidth:height:extendedPixelsPerRow:pixelFormat:bytesPerRowAlignment:planeAlignment:", Width, Height, (unint64_t)(int)(CVPixelBufferGetBytesPerRow(a3) % v8) >> 1, 1278226736, v8, +[MOVStreamIOUtility getPreferredPlaneAlignmentSize]);
  CVPixelBufferPoolRef v13 = 0;
  uint64_t v14 = *MEMORY[0x263F041C0];
  int v10 = [NSNumber numberWithUnsignedLong:a4];
  v15[0] = v10;
  CFDictionaryRef v11 = (const __CFDictionary *)[NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
  CVPixelBufferPoolCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v11, v9, &v13);

  CFRelease(v9);
  return v13;
}

+ (__CVPixelBufferPool)createNewL008PixelBufferPoolWithReferencePixelBuffer:(__CVBuffer *)a3 minimumBufferCount:(unint64_t)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  unint64_t v8 = +[MOVStreamIOUtility getPreferredBytesPerRowAlignmentSize];
  int v9 = +[MIOPixelBufferUtility createPixelBufferAttributesWithWidth:height:extendedPixelsPerRow:pixelFormat:bytesPerRowAlignment:planeAlignment:](MIOPixelBufferUtility, "createPixelBufferAttributesWithWidth:height:extendedPixelsPerRow:pixelFormat:bytesPerRowAlignment:planeAlignment:", Width, Height, (CVPixelBufferGetBytesPerRow(a3) % v8), 1278226488, v8, +[MOVStreamIOUtility getPreferredPlaneAlignmentSize]);
  CVPixelBufferPoolRef v13 = 0;
  uint64_t v14 = *MEMORY[0x263F041C0];
  int v10 = [NSNumber numberWithUnsignedLong:a4];
  v15[0] = v10;
  CFDictionaryRef v11 = (const __CFDictionary *)[NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
  CVPixelBufferPoolCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v11, v9, &v13);

  CFRelease(v9);
  return v13;
}

+ (__CVBuffer)newWarholBufferFromRawBayerPixelBuffer:(__CVBuffer *)a3 withPixelBufferPool:(__CVPixelBufferPool *)a4
{
  CVPixelBufferRef pixelBufferOut = 0;
  CVReturn v5 = CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x263EFFB08], a4, &pixelBufferOut);
  result = 0;
  if (v5) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = pixelBufferOut == 0;
  }
  if (!v7)
  {
    +[MIOPixelBufferUtility splitBayerBuffer:intoWarholPixelBuffer:shiftBitsLeftBy:](MIOPixelBufferUtility, "splitBayerBuffer:intoWarholPixelBuffer:shiftBitsLeftBy:", a3);
    return pixelBufferOut;
  }
  return result;
}

+ (__CVBuffer)newYUVBufferFromRawBayerPixelBuffer:(__CVBuffer *)a3 withPixelBufferPool:(__CVPixelBufferPool *)a4
{
  CVPixelBufferRef pixelBufferOut = 0;
  CVReturn v5 = CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x263EFFB08], a4, &pixelBufferOut);
  result = 0;
  if (v5) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = pixelBufferOut == 0;
  }
  if (!v7)
  {
    +[MIOPixelBufferUtility splitBayerBuffer:intoYUVPixelBuffer:shiftBitsLeftBy:](MIOPixelBufferUtility, "splitBayerBuffer:intoYUVPixelBuffer:shiftBitsLeftBy:", a3);
    return pixelBufferOut;
  }
  return result;
}

+ (__CVBuffer)newRawBayerBufferFromYUVPixelBuffer:(__CVBuffer *)a3 withPixelBufferPool:(__CVPixelBufferPool *)a4 msbReplication:(BOOL)a5
{
  CVPixelBufferRef pixelBufferOut = 0;
  CVReturn v6 = CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x263EFFB08], a4, &pixelBufferOut);
  result = 0;
  if (v6) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = pixelBufferOut == 0;
  }
  if (!v8)
  {
    +[MIOPixelBufferUtility joinYUVBuffer:intoRawBayerPixelBuffer:shiftBitsLeftBy:msbReplication:](MIOPixelBufferUtility, "joinYUVBuffer:intoRawBayerPixelBuffer:shiftBitsLeftBy:msbReplication:", a3);
    return pixelBufferOut;
  }
  return result;
}

+ (__CVBuffer)newWarholBufferFromCompandedRawBayerPixelBuffer:(__CVBuffer *)a3 withPixelBufferPool:(__CVPixelBufferPool *)a4
{
  CVPixelBufferRef pixelBufferOut = 0;
  CVReturn v5 = CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x263EFFB08], a4, &pixelBufferOut);
  result = 0;
  if (v5) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = pixelBufferOut == 0;
  }
  if (!v7)
  {
    +[MIOPixelBufferUtility splitCompandedBayerBuffer:intoCompandedWarholPixelBuffer:](MIOPixelBufferUtility, "splitCompandedBayerBuffer:intoCompandedWarholPixelBuffer:", a3);
    return pixelBufferOut;
  }
  return result;
}

+ (__CVBuffer)newWarholBufferFromRawBayerPixelBuffer:(__CVBuffer *)a3
{
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  unint64_t v6 = +[MOVStreamIOUtility getPreferredBytesPerRowAlignmentSize];
  BOOL v7 = +[MIOPixelBufferUtility createRawPixelBufferWithWidth:height:extendedRows:extendedPixelsPerRow:pixelFormat:bytesPerRowAlignment:planeAlignment:bufferCacheMode:](MIOPixelBufferUtility, "createRawPixelBufferWithWidth:height:extendedRows:extendedPixelsPerRow:pixelFormat:bytesPerRowAlignment:planeAlignment:bufferCacheMode:", Width, Height, 0, (unint64_t)(int)(CVPixelBufferGetBytesPerRow(a3) % v6) >> 1, 1278226736, v6, +[MOVStreamIOUtility getPreferredPlaneAlignmentSize]);
  +[MIOPixelBufferUtility splitBayerBuffer:a3 intoWarholPixelBuffer:v7 shiftBitsLeftBy:2];
  return v7;
}

+ (BOOL)fillPlaneOfPixelBuffer:(__CVBuffer *)a3 planeIndex:(int)a4 withValue:(unsigned __int16)a5
{
  BOOL result = 0;
  if (a3 && (a4 & 0x80000000) == 0)
  {
    if (CVPixelBufferGetPlaneCount(a3) <= a4)
    {
      return 0;
    }
    else
    {
      CVPixelBufferLockBaseAddress(a3, 0);
      BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(a3, a4);
      size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, a4);
      size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, a4);
      __pattern4[0] = a5;
      __pattern4[1] = a5;
      memset_pattern4(BaseAddressOfPlane, __pattern4, BytesPerRowOfPlane * HeightOfPlane);
      CVPixelBufferUnlockBaseAddress(a3, 0);
      return 1;
    }
  }
  return result;
}

+ (BOOL)isPixelBufferRawBayer:(__CVBuffer *)a3
{
  uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(a3);

  return +[MIOPixelBufferUtility isPixelFormatRawBayer:PixelFormatType];
}

+ (BOOL)isPixelFormatRawBayer:(unsigned int)a3
{
  BOOL result = 1;
  if ((int)a3 > 1735549491)
  {
    if (a3 == 1735549492) {
      return result;
    }
    int v4 = 1919379252;
  }
  else
  {
    if (a3 == 1650943796) {
      return result;
    }
    int v4 = 1734505012;
  }
  if (a3 != v4) {
    return 0;
  }
  return result;
}

+ (BOOL)isPixelBufferCompandedRawBayer:(__CVBuffer *)a3
{
  uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(a3);

  return +[MIOPixelBufferUtility isPixelFormatCompandedRawBayer:PixelFormatType];
}

+ (BOOL)isPixelFormatCompandedRawBayer:(unsigned int)a3
{
  BOOL result = 1;
  if ((int)a3 > 1735549751)
  {
    if (a3 == 1735549752) {
      return result;
    }
    int v4 = 1919378232;
  }
  else
  {
    if (a3 == 1650942776) {
      return result;
    }
    int v4 = 1734501176;
  }
  if (a3 != v4) {
    return 0;
  }
  return result;
}

+ (void)writeBuffer:(const char *)a3 ofSize:(unint64_t)a4 toFile:(id)a5
{
  BOOL v7 = fopen((const char *)[a5 cStringUsingEncoding:4], "wb");
  if (v7)
  {
    BOOL v8 = v7;
    fwrite(a3, a4, 1uLL, v7);
    fclose(v8);
  }
}

+ (BOOL)joinYUVBuffer:(__CVBuffer *)a3 intoRawBayerPixelBuffer:(__CVBuffer *)a4 shiftBitsLeftBy:(int)a5 msbReplication:(BOOL)a6
{
  if (a3) {
    BOOL v6 = a4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  BOOL v7 = !v6;
  if (!v6)
  {
    BOOL v8 = a6;
    uint64_t v9 = *(void *)&a5;
    uint64_t v12 = +[MOVStreamMetalPixelBufferUtility sharedMetalPixelBufferUtility];
    char v13 = [v12 joinYUVBuffer:a3 intoRawBayerPixelBuffer:a4 shiftBitsLeftBy:v9 msbReplication:v8];

    if ((v13 & 1) == 0)
    {
      if ((int)v9 >= 0) {
        int v14 = v9;
      }
      else {
        int v14 = -(int)v9;
      }
      unsigned int v24 = v14;
      CVPixelBufferLockBaseAddress(a3, 1uLL);
      CVPixelBufferLockBaseAddress(a4, 0);
      BaseAddress = (unsigned __int16 *)CVPixelBufferGetBaseAddress(a4);
      BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(a3, 0);
      size_t v16 = (const unsigned __int16 *)CVPixelBufferGetBaseAddressOfPlane(a3, 1uLL);
      size_t Height = CVPixelBufferGetHeight(a4);
      size_t Width = CVPixelBufferGetWidth(a4);
      size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a4);
      size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
      size_t v21 = CVPixelBufferGetBytesPerRowOfPlane(a3, 1uLL);
      join_bayer_buffer_yuv((uint64_t)BaseAddressOfPlane, v16, BaseAddress, Width, Height, BytesPerRow, BytesPerRowOfPlane, v21, v24, v8);
      CVPixelBufferUnlockBaseAddress(a4, 0);
      CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    }
  }
  return v7;
}

+ (unint64_t)bytesPerWidthOfBuffer:(__CVBuffer *)a3
{
  if (CVPixelBufferIsPlanar(a3))
  {
    int v4 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)BOOL v8 = 0;
      _os_log_impl(&dword_21B5ED000, v4, OS_LOG_TYPE_ERROR, "bytesPerWidthOfBuffer requires non-planar buffer.", v8, 2u);
    }

    return 0;
  }
  else
  {
    uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
    double BytesPerPixelOfPlaneForFormat = MIOCVPixelBufferGetBytesPerPixelOfPlaneForFormat(PixelFormatType, 0);
    return (unint64_t)(BytesPerPixelOfPlaneForFormat * (double)CVPixelBufferGetWidth(a3));
  }
}

+ (BOOL)bufferHasPadding:(__CVBuffer *)a3
{
  if (CVPixelBufferIsPlanar(a3))
  {
    int v4 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)BOOL v7 = 0;
      _os_log_impl(&dword_21B5ED000, v4, OS_LOG_TYPE_ERROR, "bufferHasPadding requires non-planar buffer.", v7, 2u);
    }

    return 0;
  }
  else
  {
    size_t v6 = +[MIOPixelBufferUtility bytesPerWidthOfBuffer:a3];
    return v6 < CVPixelBufferGetBytesPerRow(a3);
  }
}

+ (__CVBuffer)stripBufferPadding:(__CVBuffer *)a3
{
  void v15[2] = *MEMORY[0x263EF8340];
  if (CVPixelBufferIsPlanar(a3))
  {
    int v4 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LOWORD(destinationBuffer) = 0;
      _os_log_impl(&dword_21B5ED000, v4, OS_LOG_TYPE_ERROR, "stripBufferPadding requires non-planar buffer.", (uint8_t *)&destinationBuffer, 2u);
    }
    goto LABEL_7;
  }
  unint64_t v5 = +[MIOPixelBufferUtility bytesPerWidthOfBuffer:a3];
  v14[0] = *MEMORY[0x263F040C8];
  size_t v6 = [NSNumber numberWithUnsignedLong:v5];
  v14[1] = *MEMORY[0x263F04130];
  v15[0] = v6;
  v15[1] = MEMORY[0x263EFFA78];
  int v4 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];

  CVBufferRef destinationBuffer = 0;
  CFAllocatorRef Default = CFAllocatorGetDefault();
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  CVPixelBufferCreate(Default, Width, Height, PixelFormatType, (CFDictionaryRef)v4, &destinationBuffer);
  if (!+[MIOPixelBufferUtility copyPixelBuffer:a3 toPixelBuffer:destinationBuffer])
  {
    CVPixelBufferRelease(destinationBuffer);
LABEL_7:
    CFDictionaryRef v11 = 0;
    goto LABEL_8;
  }
  CVBufferPropagateAttachments(a3, destinationBuffer);
  CFDictionaryRef v11 = destinationBuffer;
LABEL_8:

  return v11;
}

+ (BOOL)splitBayerBuffer:(__CVBuffer *)a3 intoYUVPixelBuffer:(__CVBuffer *)a4 shiftBitsLeftBy:(int)a5
{
  if (a3) {
    BOOL v5 = a4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  BOOL v6 = !v5;
  if (!v5)
  {
    uint64_t v7 = *(void *)&a5;
    int v10 = +[MOVStreamMetalPixelBufferUtility sharedMetalPixelBufferUtility];
    char v11 = [v10 splitBayerBuffer:a3 intoYUVPixelBuffer:a4 shiftBitsLeftBy:v7];

    if ((v11 & 1) == 0)
    {
      if ((int)v7 >= 0) {
        int v12 = v7;
      }
      else {
        int v12 = -(int)v7;
      }
      unsigned int v30 = v12;
      CVPixelBufferLockBaseAddress(a3, 1uLL);
      CVPixelBufferLockBaseAddress(a4, 0);
      BaseAddress = CVPixelBufferGetBaseAddress(a3);
      BaseAddressOfPlane = (unsigned __int16 *)CVPixelBufferGetBaseAddressOfPlane(a4, 0);
      CFStringRef v15 = (unsigned __int16 *)CVPixelBufferGetBaseAddressOfPlane(a4, 1uLL);
      size_t Height = CVPixelBufferGetHeight(a3);
      size_t Width = CVPixelBufferGetWidth(a3);
      size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
      size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a4, 0);
      size_t v20 = CVPixelBufferGetBytesPerRowOfPlane(a4, 1uLL);
      split_bayer_buffer_yuv((unint64_t)BaseAddress, BaseAddressOfPlane, v15, Width, Height, BytesPerRow, BytesPerRowOfPlane, v20, v21, v22, v23, v24, v25, v26, v27, v28, v30);
      CVPixelBufferUnlockBaseAddress(a4, 0);
      CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    }
  }
  return v6;
}

+ (BOOL)splitBayerBuffer:(__CVBuffer *)a3 intoWarholPixelBuffer:(__CVBuffer *)a4 shiftBitsLeftBy:(int)a5
{
  if (a3) {
    BOOL v5 = a4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  BOOL v6 = !v5;
  if (!v5)
  {
    uint64_t v7 = *(void *)&a5;
    int v10 = +[MOVStreamMetalPixelBufferUtility sharedMetalPixelBufferUtility];
    char v11 = [v10 splitBayerBuffer:a3 intoWarholPixelBuffer:a4 shiftBitsLeftBy:v7];

    if ((v11 & 1) == 0)
    {
      if ((int)v7 >= 0) {
        unsigned int v12 = v7;
      }
      else {
        unsigned int v12 = -(int)v7;
      }
      CVPixelBufferLockBaseAddress(a3, 1uLL);
      CVPixelBufferLockBaseAddress(a4, 0);
      if (CVPixelBufferIsPlanar(a3)) {
        BaseAddressOfPlane = (unsigned __int16 *)CVPixelBufferGetBaseAddressOfPlane(a3, 0);
      }
      else {
        BaseAddressOfPlane = (unsigned __int16 *)CVPixelBufferGetBaseAddress(a3);
      }
      int v14 = BaseAddressOfPlane;
      if (CVPixelBufferIsPlanar(a4)) {
        BaseAddress = (unsigned __int16 *)CVPixelBufferGetBaseAddressOfPlane(a4, 0);
      }
      else {
        BaseAddress = (unsigned __int16 *)CVPixelBufferGetBaseAddress(a4);
      }
      size_t v16 = BaseAddress;
      if (CVPixelBufferIsPlanar(a3)) {
        size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
      }
      else {
        size_t HeightOfPlane = CVPixelBufferGetHeight(a3);
      }
      size_t v18 = HeightOfPlane;
      if (CVPixelBufferIsPlanar(a3)) {
        size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
      }
      else {
        size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRow(a3);
      }
      unint64_t v20 = BytesPerRowOfPlane;
      unint64_t v21 = BytesPerRowOfPlane * v18;
      if (CVPixelBufferIsPlanar(a4)) {
        size_t Height = CVPixelBufferGetHeightOfPlane(a4, 0);
      }
      else {
        size_t Height = CVPixelBufferGetHeight(a4);
      }
      size_t v23 = Height;
      if (CVPixelBufferIsPlanar(a4)) {
        size_t BytesPerRow = CVPixelBufferGetBytesPerRowOfPlane(a4, 0);
      }
      else {
        size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a4);
      }
      split_bayer_buffer(v14, v16, (unsigned __int16 *)((char *)v16 + (v20 >> 1)), (unsigned __int16 *)((char *)v16 + BytesPerRow * (v23 >> 1)), (unsigned __int16 *)((char *)v16 + BytesPerRow * (v23 >> 1) + (v20 >> 1)), v21, v20, BytesPerRow, v12, 1);
      CVPixelBufferUnlockBaseAddress(a4, 0);
      CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    }
  }
  return v6;
}

+ (BOOL)joinWarholBuffer:(__CVBuffer *)a3 intoBayerBuffer:(__CVBuffer *)a4 shiftBitsRightBy:(int)a5 msbReplication:(BOOL)a6
{
  if (a3) {
    BOOL v6 = a4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  BOOL v7 = !v6;
  if (!v6)
  {
    BOOL v8 = a6;
    uint64_t v9 = *(void *)&a5;
    unsigned int v12 = +[MOVStreamMetalPixelBufferUtility sharedMetalPixelBufferUtility];
    char v13 = [v12 joinWarholBuffer:a3 intoBayerBuffer:a4 shiftBitsRightBy:v9 msbReplication:v8];

    if ((v13 & 1) == 0)
    {
      if ((int)v9 < 0) {
        LODWORD(v9) = -(int)v9;
      }
      CVPixelBufferLockBaseAddress(a3, 1uLL);
      CVPixelBufferLockBaseAddress(a4, 0);
      if (CVPixelBufferIsPlanar(a4)) {
        BaseAddressOfPlane = (unsigned __int16 *)CVPixelBufferGetBaseAddressOfPlane(a4, 0);
      }
      else {
        BaseAddressOfPlane = (unsigned __int16 *)CVPixelBufferGetBaseAddress(a4);
      }
      double v26 = BaseAddressOfPlane;
      if (CVPixelBufferIsPlanar(a3)) {
        BaseAddress = (unsigned __int16 *)CVPixelBufferGetBaseAddressOfPlane(a3, 0);
      }
      else {
        BaseAddress = (unsigned __int16 *)CVPixelBufferGetBaseAddress(a3);
      }
      size_t v16 = BaseAddress;
      if (CVPixelBufferIsPlanar(a3)) {
        size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
      }
      else {
        size_t HeightOfPlane = CVPixelBufferGetHeight(a3);
      }
      size_t v18 = HeightOfPlane;
      if (CVPixelBufferIsPlanar(a3)) {
        size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
      }
      else {
        size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRow(a3);
      }
      size_t v20 = BytesPerRowOfPlane;
      if (CVPixelBufferIsPlanar(a3)) {
        size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
      }
      else {
        size_t WidthOfPlane = CVPixelBufferGetWidth(a3);
      }
      size_t v22 = WidthOfPlane;
      size_t v23 = v20 - 2 * WidthOfPlane;
      if (CVPixelBufferIsPlanar(a4)) {
        size_t BytesPerRow = CVPixelBufferGetBytesPerRowOfPlane(a4, 0);
      }
      else {
        size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a4);
      }
      join_bayer_buffer(v16, (unsigned __int16 *)((char *)v16 + v22), (unsigned __int16 *)((char *)v16 + v20 * (v18 >> 1)), (unsigned __int16 *)((char *)v16 + v20 * (v18 >> 1) + v22), v26, (v20 * v18) >> 2, v20 >> 1, BytesPerRow, v23 >> 1, v9, 1, v8);
      CVPixelBufferUnlockBaseAddress(a4, 0);
      CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    }
  }
  return v7;
}

+ (BOOL)splitCompandedBayerBuffer:(__CVBuffer *)a3 intoCompandedWarholPixelBuffer:(__CVBuffer *)a4
{
  if (a3) {
    BOOL v4 = a4 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  BOOL v5 = !v4;
  if (!v4)
  {
    BOOL v8 = +[MOVStreamMetalPixelBufferUtility sharedMetalPixelBufferUtility];
    char v9 = [v8 splitCompandedBayerBuffer:a3 intoCompandedWarholPixelBuffer:a4];

    if ((v9 & 1) == 0)
    {
      size_t extraColumnsOnRight = 0;
      size_t extraColumnsOnLeft = 0;
      size_t extraRowsOnBottom = 0;
      size_t extraRowsOnTop = 0;
      CVPixelBufferGetExtendedPixels(a4, &extraColumnsOnLeft, &extraColumnsOnRight, &extraRowsOnTop, &extraRowsOnBottom);
      CVPixelBufferLockBaseAddress(a3, 1uLL);
      CVPixelBufferLockBaseAddress(a4, 0);
      if (CVPixelBufferIsPlanar(a3)) {
        BaseAddressOfPlane = (unsigned __int8 *)CVPixelBufferGetBaseAddressOfPlane(a3, 0);
      }
      else {
        BaseAddressOfPlane = (unsigned __int8 *)CVPixelBufferGetBaseAddress(a3);
      }
      char v11 = BaseAddressOfPlane;
      if (CVPixelBufferIsPlanar(a4)) {
        BaseAddress = (unsigned __int8 *)CVPixelBufferGetBaseAddressOfPlane(a4, 0);
      }
      else {
        BaseAddress = (unsigned __int8 *)CVPixelBufferGetBaseAddress(a4);
      }
      char v13 = BaseAddress;
      if (CVPixelBufferIsPlanar(a3)) {
        size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
      }
      else {
        size_t HeightOfPlane = CVPixelBufferGetHeight(a3);
      }
      size_t v15 = HeightOfPlane;
      if (CVPixelBufferIsPlanar(a3)) {
        size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
      }
      else {
        size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRow(a3);
      }
      unint64_t v17 = BytesPerRowOfPlane;
      unint64_t v18 = BytesPerRowOfPlane * v15;
      size_t Width = CVPixelBufferGetWidth(a3);
      size_t v20 = CVPixelBufferGetWidth(a4);
      if (CVPixelBufferIsPlanar(a4)) {
        size_t Height = CVPixelBufferGetHeightOfPlane(a4, 0);
      }
      else {
        size_t Height = CVPixelBufferGetHeight(a4);
      }
      size_t v22 = Height;
      if (CVPixelBufferIsPlanar(a4)) {
        size_t BytesPerRow = CVPixelBufferGetBytesPerRowOfPlane(a4, 0);
      }
      else {
        size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a4);
      }
      split_companded_bayer_buffer(v11, &v13[extraColumnsOnLeft + extraRowsOnTop * BytesPerRow], &v13[extraColumnsOnLeft + extraRowsOnTop * BytesPerRow + (Width >> 1)], &v13[extraColumnsOnLeft + extraRowsOnTop * BytesPerRow + BytesPerRow * (v22 >> 1)], &v13[extraColumnsOnLeft + extraRowsOnTop * BytesPerRow + BytesPerRow * (v22 >> 1) + (Width >> 1)], v18, v17, BytesPerRow, Width, v20);
      CVPixelBufferUnlockBaseAddress(a4, 0);
      CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    }
  }
  return v5;
}

+ (BOOL)joinCompandedWarholBuffer:(__CVBuffer *)a3 intoCompandedBayerBuffer:(__CVBuffer *)a4
{
  if (a3) {
    BOOL v4 = a4 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  BOOL v5 = !v4;
  if (!v4)
  {
    BOOL v8 = +[MOVStreamMetalPixelBufferUtility sharedMetalPixelBufferUtility];
    char v9 = [v8 joinCompandedWarholBuffer:a3 intoCompandedBayerBuffer:a4];

    if ((v9 & 1) == 0)
    {
      CVPixelBufferLockBaseAddress(a3, 1uLL);
      CVPixelBufferLockBaseAddress(a4, 0);
      if (CVPixelBufferIsPlanar(a4)) {
        BaseAddressOfPlane = (int8x16_t *)CVPixelBufferGetBaseAddressOfPlane(a4, 0);
      }
      else {
        BaseAddressOfPlane = (int8x16_t *)CVPixelBufferGetBaseAddress(a4);
      }
      char v11 = BaseAddressOfPlane;
      if (CVPixelBufferIsPlanar(a3)) {
        BaseAddress = CVPixelBufferGetBaseAddressOfPlane(a3, 0);
      }
      else {
        BaseAddress = CVPixelBufferGetBaseAddress(a3);
      }
      uint64_t v13 = (uint64_t)BaseAddress;
      if (CVPixelBufferIsPlanar(a3)) {
        size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
      }
      else {
        size_t HeightOfPlane = CVPixelBufferGetHeight(a3);
      }
      size_t v15 = HeightOfPlane;
      if (CVPixelBufferIsPlanar(a3)) {
        size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
      }
      else {
        size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRow(a3);
      }
      size_t v17 = BytesPerRowOfPlane;
      if (CVPixelBufferIsPlanar(a3)) {
        size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
      }
      else {
        size_t WidthOfPlane = CVPixelBufferGetWidth(a3);
      }
      size_t v19 = WidthOfPlane;
      unint64_t v20 = v17 - WidthOfPlane;
      if (CVPixelBufferIsPlanar(a4)) {
        size_t BytesPerRow = CVPixelBufferGetBytesPerRowOfPlane(a4, 0);
      }
      else {
        size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a4);
      }
      join_companded_bayer_buffer(v13, (const unsigned __int8 *)(v13 + (v19 >> 1)), (const unsigned __int8 *)(v13 + v17 * (v15 >> 1)), (const unsigned __int8 *)(v13 + v17 * (v15 >> 1) + (v19 >> 1)), v11, v15 >> 1, v19 >> 1, BytesPerRow, v20, 1);
      CVPixelBufferUnlockBaseAddress(a4, 0);
      CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    }
  }
  return v5;
}

+ (BOOL)verticallySplitPixelBuffer:(__CVBuffer *)a3 intoTopPixelBuffer:(__CVBuffer *)a4 bottomPixelBuffer:(__CVBuffer *)a5
{
  BOOL v5 = 0;
  if (a3 && a4 && a5)
  {
    size_t Height = CVPixelBufferGetHeight(a3);
    size_t v10 = CVPixelBufferGetHeight(a4);
    if (Height == CVPixelBufferGetHeight(a5) + v10)
    {
      size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
      if (BytesPerRow == CVPixelBufferGetBytesPerRow(a4))
      {
        size_t v12 = CVPixelBufferGetBytesPerRow(a3);
        if (v12 == CVPixelBufferGetBytesPerRow(a5))
        {
          BOOL v5 = 1;
          CVPixelBufferLockBaseAddress(a3, 1uLL);
          CVPixelBufferLockBaseAddress(a4, 0);
          BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a3, 0);
          int v14 = CVPixelBufferGetBaseAddressOfPlane(a4, 0);
          size_t v15 = CVPixelBufferGetBytesPerRow(a4);
          size_t v16 = CVPixelBufferGetHeight(a4) * v15;
          memcpy(v14, BaseAddressOfPlane, v16);
          CVPixelBufferUnlockBaseAddress(a4, 0);
          size_t v17 = &BaseAddressOfPlane[v16];
          CVPixelBufferLockBaseAddress(a5, 0);
          unint64_t v18 = CVPixelBufferGetBaseAddressOfPlane(a5, 0);
          size_t v19 = CVPixelBufferGetBytesPerRow(a5);
          size_t v20 = CVPixelBufferGetHeight(a5);
          memcpy(v18, v17, v20 * v19);
          CVPixelBufferUnlockBaseAddress(a3, 1uLL);
          CVPixelBufferUnlockBaseAddress(a5, 0);
          return v5;
        }
      }
      if (+[MIOLog debugEnabled])
      {
        unint64_t v21 = +[MIOLog defaultLog];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          __int16 v25 = 0;
          size_t v22 = "Inconsistent bytes per row.";
          size_t v23 = (uint8_t *)&v25;
          goto LABEL_14;
        }
        goto LABEL_15;
      }
    }
    else if (+[MIOLog debugEnabled])
    {
      unint64_t v21 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        __int16 v26 = 0;
        size_t v22 = "Inconsistent height.";
        size_t v23 = (uint8_t *)&v26;
LABEL_14:
        _os_log_impl(&dword_21B5ED000, v21, OS_LOG_TYPE_DEBUG, v22, v23, 2u);
      }
LABEL_15:
    }
    return 0;
  }
  return v5;
}

+ (BOOL)concatPixelBuffer:(__CVBuffer *)a3 withPixelBuffer:(__CVBuffer *)a4 targetPixelBuffer:(__CVBuffer *)a5
{
  BOOL v5 = 0;
  if (a3 && a4 && a5)
  {
    size_t Width = CVPixelBufferGetWidth(a3);
    size_t Height = CVPixelBufferGetHeight(a3);
    size_t v11 = CVPixelBufferGetHeight(a4);
    if (Width == CVPixelBufferGetWidth(a5) && Width == CVPixelBufferGetWidth(a4))
    {
      if (v11 + Height == CVPixelBufferGetHeight(a5))
      {
        size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
        size_t v13 = CVPixelBufferGetBytesPerRow(a4);
        size_t v14 = CVPixelBufferGetBytesPerRow(a5);
        if (v14 == BytesPerRow && v14 == v13)
        {
          BOOL v5 = 1;
          CVPixelBufferLockBaseAddress(a3, 1uLL);
          CVPixelBufferLockBaseAddress(a5, 0);
          BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(a3, 0);
          size_t v16 = (char *)CVPixelBufferGetBaseAddressOfPlane(a5, 0);
          size_t v17 = CVPixelBufferGetBytesPerRow(a3);
          size_t v18 = CVPixelBufferGetHeight(a3) * v17;
          memcpy(v16, BaseAddressOfPlane, v18);
          CVPixelBufferUnlockBaseAddress(a3, 1uLL);
          size_t v19 = &v16[v18];
          CVPixelBufferLockBaseAddress(a4, 1uLL);
          size_t v20 = CVPixelBufferGetBaseAddressOfPlane(a4, 0);
          size_t v21 = CVPixelBufferGetBytesPerRow(a4);
          size_t v22 = CVPixelBufferGetHeight(a4);
          memcpy(v19, v20, v22 * v21);
          CVPixelBufferUnlockBaseAddress(a4, 1uLL);
          CVPixelBufferUnlockBaseAddress(a5, 0);
          return v5;
        }
        if (+[MIOLog debugEnabled])
        {
          size_t v23 = +[MIOLog defaultLog];
          if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_14;
          }
          __int16 v27 = 0;
          double v24 = "Inconsistent bytes per row.";
          __int16 v25 = (uint8_t *)&v27;
          goto LABEL_13;
        }
        return 0;
      }
      if (!+[MIOLog debugEnabled]) {
        return 0;
      }
      size_t v23 = +[MIOLog defaultLog];
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_14;
      }
      __int16 v28 = 0;
      double v24 = "Inconsistent height.";
      __int16 v25 = (uint8_t *)&v28;
    }
    else
    {
      if (!+[MIOLog debugEnabled]) {
        return 0;
      }
      size_t v23 = +[MIOLog defaultLog];
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
LABEL_14:

        return 0;
      }
      *(_WORD *)buf = 0;
      double v24 = "Inconsistent width.";
      __int16 v25 = buf;
    }
LABEL_13:
    _os_log_impl(&dword_21B5ED000, v23, OS_LOG_TYPE_DEBUG, v24, v25, 2u);
    goto LABEL_14;
  }
  return v5;
}

+ (unint64_t)extendedPixelsPerRowOfPixelBuffer:(__CVBuffer *)a3
{
  size_t extraColumnsOnRight = 0;
  CVPixelBufferGetExtendedPixels(a3, 0, &extraColumnsOnRight, 0, 0);
  return extraColumnsOnRight;
}

+ (__CVPixelBufferPool)createPixelBufferPoolWithWidth:(unint64_t)a3 height:(unint64_t)a4 format:(unsigned int)a5 extendedPixelsPerRow:(unint64_t)a6 minBufferCount:(unint64_t)a7
{
  v14[1] = *MEMORY[0x263EF8340];
  BOOL v8 = +[MIOPixelBufferUtility createPixelBufferAttributesWithWidth:a3 height:a4 extendedPixelsPerRow:a6 pixelFormat:*(void *)&a5 bytesPerRowAlignment:1 planeAlignment:1];
  CVPixelBufferPoolRef v12 = 0;
  uint64_t v13 = *MEMORY[0x263F041C0];
  char v9 = [NSNumber numberWithUnsignedLong:a7];
  v14[0] = v9;
  CFDictionaryRef v10 = (const __CFDictionary *)[NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
  CVPixelBufferPoolCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v10, v8, &v12);

  CFRelease(v8);
  return v12;
}

+ (__CVPixelBufferPool)createPixelBufferPoolWithWidth:(unint64_t)a3 height:(unint64_t)a4 format:(unsigned int)a5 bytesPerRow:(unint64_t)a6 minBufferCount:(unint64_t)a7
{
  v14[1] = *MEMORY[0x263EF8340];
  BOOL v8 = +[MIOPixelBufferUtility createPixelBufferAttributesWithWidth:a3 height:a4 pixelFormat:*(void *)&a5 bytesPerRow:a6];
  CVPixelBufferPoolRef v12 = 0;
  uint64_t v13 = *MEMORY[0x263F041C0];
  char v9 = [NSNumber numberWithUnsignedLong:a7];
  v14[0] = v9;
  CFDictionaryRef v10 = (const __CFDictionary *)[NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
  CVPixelBufferPoolCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v10, v8, &v12);

  CFRelease(v8);
  return v12;
}

+ (__CVPixelBufferPool)createPixelBufferPoolWithWidth:(unint64_t)a3 height:(unint64_t)a4 format:(unsigned int)a5 bytesPerRows:(id)a6 minBufferCount:(unint64_t)a7
{
  v14[1] = *MEMORY[0x263EF8340];
  BOOL v8 = +[MIOPixelBufferUtility createPixelBufferAttributesWithWidth:a3 height:a4 pixelFormat:*(void *)&a5 bytesPerRows:a6];
  CVPixelBufferPoolRef v12 = 0;
  uint64_t v13 = *MEMORY[0x263F041C0];
  char v9 = [NSNumber numberWithUnsignedLong:a7];
  v14[0] = v9;
  CFDictionaryRef v10 = (const __CFDictionary *)[NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
  CVPixelBufferPoolCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v10, v8, &v12);

  CFRelease(v8);
  return v12;
}

+ (__CVBuffer)pixelBufferFromPool:(__CVPixelBufferPool *)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  CVPixelBufferRef pixelBufferOut = 0;
  CVReturn v3 = CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x263EFFB08], a3, &pixelBufferOut);
  BOOL result = pixelBufferOut;
  if (v3) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = pixelBufferOut == 0;
  }
  if (v5)
  {
    BOOL v6 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      CVReturn v9 = v3;
      _os_log_impl(&dword_21B5ED000, v6, OS_LOG_TYPE_ERROR, "Error creating pixel buffer from pool (%d).", buf, 8u);
    }

    return 0;
  }
  return result;
}

+ (BOOL)transferq8q2PixelBuffer:(__CVBuffer *)a3 toL010PixelBuffer:(__CVBuffer *)a4
{
  BOOL v4 = 0;
  if (a3 && a4)
  {
    if (CVPixelBufferLockBaseAddress(a3, 1uLL))
    {
      return 0;
    }
    else
    {
      CVReturn v7 = CVPixelBufferLockBaseAddress(a4, 0);
      BOOL v4 = v7 == 0;
      if (!v7)
      {
        BaseAddress = CVPixelBufferGetBaseAddress(a3);
        int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
        uint64_t v10 = (int16x8_t *)CVPixelBufferGetBaseAddress(a4);
        int v11 = CVPixelBufferGetBytesPerRow(a4);
        unsigned int Width = CVPixelBufferGetWidth(a3);
        int Height = CVPixelBufferGetHeight(a3);
        conv_q8q2_to_L010((uint64_t)BaseAddress, BytesPerRow, v10, v11, Width, Height);
        CVPixelBufferUnlockBaseAddress(a4, 0);
      }
      CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    }
  }
  return v4;
}

+ (BOOL)transferL010PixelBuffer:(__CVBuffer *)a3 toq8q2PixelBuffer:(__CVBuffer *)a4
{
  BOOL v4 = 0;
  if (a3 && a4)
  {
    if (CVPixelBufferLockBaseAddress(a3, 1uLL))
    {
      return 0;
    }
    else
    {
      CVReturn v7 = CVPixelBufferLockBaseAddress(a4, 0);
      BOOL v4 = v7 == 0;
      if (!v7)
      {
        BaseAddress = (int16x8_t *)CVPixelBufferGetBaseAddress(a3);
        int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
        uint64_t v10 = (unsigned __int8 *)CVPixelBufferGetBaseAddress(a4);
        int v11 = CVPixelBufferGetBytesPerRow(a4);
        unsigned int Width = CVPixelBufferGetWidth(a3);
        int Height = CVPixelBufferGetHeight(a3);
        conv_L010_to_q8q2(BaseAddress, BytesPerRow, v10, v11, Width, Height);
        CVPixelBufferUnlockBaseAddress(a4, 0);
      }
      CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    }
  }
  return v4;
}

+ (BOOL)copyPixelBuffer:(__CVBuffer *)a3 toPixelBuffer:(__CVBuffer *)a4 bytesPerPixel:(double)a5
{
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  CVPixelBufferLockBaseAddress(a4, 0);
  size_t PlaneCount = CVPixelBufferGetPlaneCount(a3);
  if (PlaneCount <= 1) {
    unint64_t v9 = 1;
  }
  else {
    unint64_t v9 = PlaneCount;
  }
  size_t v10 = CVPixelBufferGetPlaneCount(a4);
  if (v10 <= 1) {
    unint64_t v11 = 1;
  }
  else {
    unint64_t v11 = v10;
  }
  if (v11 >= v9)
  {
    size_t v15 = 0;
    while (1)
    {
      size_t v16 = (unint64_t)((double)CVPixelBufferGetWidthOfPlane(a3, v15) * a5);
      if (CVPixelBufferGetBytesPerRowOfPlane(a4, v15) < v16) {
        break;
      }
      BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a3, v15);
      size_t v18 = (char *)CVPixelBufferGetBaseAddressOfPlane(a4, v15);
      if (CVPixelBufferGetHeightOfPlane(a3, v15))
      {
        size_t v19 = 0;
        do
        {
          size_t v20 = &BaseAddressOfPlane[CVPixelBufferGetBytesPerRowOfPlane(a3, v15) * v19];
          size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a4, v15);
          memcpy(&v18[BytesPerRowOfPlane * v19++], v20, v16);
        }
        while (v19 < CVPixelBufferGetHeightOfPlane(a3, v15));
      }
      if (++v15 == v9)
      {
        CVPixelBufferUnlockBaseAddress(a4, 0);
        BOOL v22 = 1;
        CVPixelBufferUnlockBaseAddress(a3, 1uLL);
        return v22;
      }
    }
    if (+[MIOLog debugEnabled])
    {
      CVPixelBufferPoolRef v12 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        __int16 v24 = 0;
        uint64_t v13 = "Cannot copyPixelBuffer, not matching bytes per row";
        size_t v14 = (uint8_t *)&v24;
        goto LABEL_21;
      }
LABEL_22:
    }
  }
  else if (+[MIOLog debugEnabled])
  {
    CVPixelBufferPoolRef v12 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      __int16 v25 = 0;
      uint64_t v13 = "Cannot copyPixelBuffer, not matching plane count";
      size_t v14 = (uint8_t *)&v25;
LABEL_21:
      _os_log_impl(&dword_21B5ED000, v12, OS_LOG_TYPE_DEBUG, v13, v14, 2u);
      goto LABEL_22;
    }
    goto LABEL_22;
  }
  return 0;
}

+ (BOOL)copyPixelBuffer:(__CVBuffer *)a3 toPixelBuffer:(__CVBuffer *)a4
{
  if (a3) {
    BOOL v4 = a4 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  BOOL result = !v4;
  if (!v4)
  {
    BOOL v30 = result;
    CVPixelBufferLockBaseAddress(a3, 1uLL);
    CVPixelBufferLockBaseAddress(a4, 0);
    size_t PlaneCount = CVPixelBufferGetPlaneCount(a3);
    if (PlaneCount <= 1) {
      unint64_t v9 = 1;
    }
    else {
      unint64_t v9 = PlaneCount;
    }
    size_t v10 = CVPixelBufferGetPlaneCount(a4);
    size_t v11 = 0;
    if (v10 <= 1) {
      unint64_t v12 = 1;
    }
    else {
      unint64_t v12 = v10;
    }
    if (v9 >= v12) {
      unint64_t v13 = v12;
    }
    else {
      unint64_t v13 = v9;
    }
    do
    {
      uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
      double BytesPerPixelOfPlaneForFormat = MIOCVPixelBufferGetBytesPerPixelOfPlaneForFormat(PixelFormatType, v11);
      uint64_t v16 = CVPixelBufferGetPixelFormatType(a4);
      double v17 = MIOCVPixelBufferGetBytesPerPixelOfPlaneForFormat(v16, v11);
      unint64_t v18 = (unint64_t)(BytesPerPixelOfPlaneForFormat * (double)CVPixelBufferGetWidthOfPlane(a3, v11));
      double v19 = v17 * (double)CVPixelBufferGetWidthOfPlane(a4, v11);
      if (v18 >= (unint64_t)v19) {
        size_t v20 = (unint64_t)v19;
      }
      else {
        size_t v20 = v18;
      }
      size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, v11);
      size_t v22 = CVPixelBufferGetHeightOfPlane(a4, v11);
      if (HeightOfPlane >= v22) {
        size_t v23 = v22;
      }
      else {
        size_t v23 = HeightOfPlane;
      }
      BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a3, v11);
      __int16 v25 = (char *)CVPixelBufferGetBaseAddressOfPlane(a4, v11);
      if (v23)
      {
        __int16 v26 = v25;
        for (uint64_t i = 0; i != v23; ++i)
        {
          __int16 v28 = &BaseAddressOfPlane[CVPixelBufferGetBytesPerRowOfPlane(a3, v11) * i];
          size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a4, v11);
          memcpy(&v26[BytesPerRowOfPlane * i], v28, v20);
        }
      }
      ++v11;
    }
    while (v11 != v13);
    CVPixelBufferUnlockBaseAddress(a4, 0);
    CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    return v30;
  }
  return result;
}

+ (BOOL)copyData:(id)a3 toNonPlanarPixelBuffer:(__CVBuffer *)a4
{
  id v5 = a3;
  char v6 = 0;
  if (v5 && a4)
  {
    if (CVPixelBufferIsPlanar(a4)) {
      char v6 = 0;
    }
    else {
      char v6 = [(id)objc_opt_class() copyData:v5 toPlanarPixelBuffer:a4 toPlane:0];
    }
  }

  return v6;
}

+ (BOOL)copyData:(id)a3 toPlanarPixelBuffer:(__CVBuffer *)a4 toPlane:(unint64_t)a5
{
  id v7 = a3;
  if (v7) {
    BOOL v8 = a4 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  BOOL v9 = !v8;
  if (!v8)
  {
    size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a4, a5);
    size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a4, a5);
    size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a4, a5);
    uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(a4);
    double BytesPerPixelOfPlaneForFormat = MIOCVPixelBufferGetBytesPerPixelOfPlaneForFormat(PixelFormatType, a5);
    size_t v15 = (char *)[v7 bytes];
    CVPixelBufferLockBaseAddress(a4, 0);
    BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a4, a5);
    if (HeightOfPlane)
    {
      double v17 = BaseAddressOfPlane;
      size_t v18 = (unint64_t)(BytesPerPixelOfPlaneForFormat * (double)WidthOfPlane);
      do
      {
        memcpy(v17, v15, v18);
        v15 += v18;
        v17 += BytesPerRowOfPlane;
        --HeightOfPlane;
      }
      while (HeightOfPlane);
    }
    CVPixelBufferUnlockBaseAddress(a4, 0);
  }

  return v9;
}

+ (id)copyNonPlanarPixelBufferData:(__CVBuffer *)a3
{
  if (!a3 || CVPixelBufferIsPlanar(a3)) {
    return 0;
  }
  id v5 = objc_opt_class();

  return (id)[v5 copyPixelBufferData:a3 ofPlane:0];
}

+ (id)copyPixelBufferData:(__CVBuffer *)a3 ofPlane:(unint64_t)a4
{
  if (!a3) {
    return 0;
  }
  if (!CVPixelBufferIsPlanar(a3))
  {
    if (!a4) {
      goto LABEL_4;
    }
    return 0;
  }
  if (CVPixelBufferGetPlaneCount(a3) <= a4) {
    return 0;
  }
LABEL_4:
  size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, a4);
  size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, a4);
  size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, a4);
  uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  size_t v10 = (unint64_t)(MIOCVPixelBufferGetBytesPerPixelOfPlaneForFormat(PixelFormatType, a4) * (double)WidthOfPlane);
  id v11 = [MEMORY[0x263EFF990] dataWithLength:HeightOfPlane * v10];
  unint64_t v12 = (char *)[v11 mutableBytes];
  CVPixelBufferLockBaseAddress(a3, 0);
  BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a3, a4);
  if (HeightOfPlane)
  {
    size_t v14 = BaseAddressOfPlane;
    do
    {
      memcpy(v12, v14, v10);
      v12 += v10;
      v14 += BytesPerRowOfPlane;
      --HeightOfPlane;
    }
    while (HeightOfPlane);
  }
  CVPixelBufferUnlockBaseAddress(a3, 0);
  return v11;
}

+ (__CVBuffer)readFrameFromFile:(id)a3 width:(unsigned int)a4 height:(unsigned int)a5 pixelFormat:(unsigned int)a6
{
  v31[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  CVPixelBufferRef pixelBuffer = 0;
  uint64_t v30 = *MEMORY[0x263F04130];
  v31[0] = MEMORY[0x263EFFA78];
  CFDictionaryRef v10 = [NSDictionary dictionaryWithObjects:v31 forKeys:&v30 count:1];
  CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], a4, a5, a6, v10, &pixelBuffer);
  if (pixelBuffer)
  {
    size_t PlaneCount = CVPixelBufferGetPlaneCount(pixelBuffer);
    if (PlaneCount <= 1) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = PlaneCount;
    }
    unint64_t v13 = fopen((const char *)[v9 UTF8String], "rb");
    if (v13)
    {
      CVPixelBufferLockBaseAddress(pixelBuffer, 0);
      for (size_t i = 0; i != v12; ++i)
      {
        if (CVPixelBufferIsPlanar(pixelBuffer)) {
          BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, i);
        }
        else {
          BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
        }
        uint64_t v16 = BaseAddressOfPlane;
        if (CVPixelBufferIsPlanar(pixelBuffer)) {
          size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(pixelBuffer, i);
        }
        else {
          size_t HeightOfPlane = CVPixelBufferGetHeight(pixelBuffer);
        }
        size_t v18 = HeightOfPlane;
        if (CVPixelBufferIsPlanar(pixelBuffer)) {
          size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(pixelBuffer, i);
        }
        else {
          size_t WidthOfPlane = CVPixelBufferGetWidth(pixelBuffer);
        }
        unint64_t v20 = WidthOfPlane;
        if (CVPixelBufferIsPlanar(pixelBuffer)) {
          size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, i);
        }
        else {
          size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRow(pixelBuffer);
        }
        size_t v22 = BytesPerRowOfPlane;
        uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(pixelBuffer);
        double BytesPerPixelOfPlaneForFormat = MIOCVPixelBufferGetBytesPerPixelOfPlaneForFormat(PixelFormatType, i);
        if (v18)
        {
          size_t v25 = (unint64_t)(BytesPerPixelOfPlaneForFormat * (double)v20);
          unint64_t v26 = 1;
          do
          {
            if (!fread(v16, 1uLL, v25, v13)) {
              break;
            }
            v16 += v22;
          }
          while (v26++ < v18);
        }
      }
      fclose(v13);
      CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
      unint64_t v13 = (FILE *)pixelBuffer;
    }
  }
  else
  {
    unint64_t v13 = 0;
  }

  return (__CVBuffer *)v13;
}

+ (__CVBuffer)combineLeftBuffer:(__CVBuffer *)a3 rightBuffer:(__CVBuffer *)a4
{
  id v5 = a3;
  v36[1] = *MEMORY[0x263EF8340];
  size_t Width = CVPixelBufferGetWidth(a3);
  v33 = a4;
  size_t v7 = CVPixelBufferGetWidth(a4);
  size_t Height = CVPixelBufferGetHeight(v5);
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(v5);
  size_t PlaneCount = CVPixelBufferGetPlaneCount(v5);
  if (PlaneCount <= 1) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = PlaneCount;
  }
  uint64_t v32 = v11;
  CVPixelBufferRef pixelBufferOut = 0;
  uint64_t v35 = *MEMORY[0x263F04130];
  v36[0] = MEMORY[0x263EFFA78];
  CFDictionaryRef v12 = [NSDictionary dictionaryWithObjects:v36 forKeys:&v35 count:1];
  CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v7 + Width, Height, PixelFormatType, v12, &pixelBufferOut);
  unint64_t v13 = v33;
  if (pixelBufferOut)
  {
    CVPixelBufferLockBaseAddress(v5, 1uLL);
    CVPixelBufferLockBaseAddress(v33, 1uLL);
    CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
    CFDictionaryRef v30 = v12;
    CVPixelBufferRef pixelBuffer = v5;
    for (size_t i = 0; i != v32; ++i)
    {
      BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(v5, i);
      uint64_t v16 = (char *)CVPixelBufferGetBaseAddressOfPlane(v13, i);
      double v17 = (char *)CVPixelBufferGetBaseAddressOfPlane(pixelBufferOut, i);
      size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(v5, i);
      size_t v19 = CVPixelBufferGetBytesPerRowOfPlane(v13, i);
      size_t v20 = CVPixelBufferGetBytesPerRowOfPlane(pixelBufferOut, i);
      uint64_t v21 = CVPixelBufferGetPixelFormatType(v5);
      double BytesPerPixelOfPlaneForFormat = MIOCVPixelBufferGetBytesPerPixelOfPlaneForFormat(v21, i);
      size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(v5, i);
      size_t v24 = CVPixelBufferGetWidthOfPlane(v13, i);
      size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(pixelBufferOut, i);
      if (HeightOfPlane)
      {
        size_t v26 = (unint64_t)(BytesPerPixelOfPlaneForFormat * (double)WidthOfPlane);
        size_t v27 = (unint64_t)(BytesPerPixelOfPlaneForFormat * (double)v24);
        do
        {
          memcpy(v17, BaseAddressOfPlane, v26);
          memcpy(&v17[v26], v16, v27);
          v17 += v20;
          v16 += v19;
          BaseAddressOfPlane += BytesPerRowOfPlane;
          --HeightOfPlane;
        }
        while (HeightOfPlane);
      }
      unint64_t v13 = v33;
      id v5 = pixelBuffer;
    }
    CFDictionaryRef v12 = v30;
    CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
    CVPixelBufferUnlockBaseAddress(v33, 1uLL);
    CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
    __int16 v28 = pixelBufferOut;
  }
  else
  {
    __int16 v28 = 0;
  }

  return v28;
}

+ (BOOL)writeBuffer:(__CVBuffer *)a3 toFile:(id)a4
{
  id v5 = a4;
  char v6 = fopen((const char *)[v5 UTF8String], "wb");
  if (v6)
  {
    CVPixelBufferLockBaseAddress(a3, 1uLL);
    size_t PlaneCount = CVPixelBufferGetPlaneCount(a3);
    size_t v8 = 0;
    if (PlaneCount <= 1) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = PlaneCount;
    }
    while (1)
    {
      CFDictionaryRef v10 = (char *)(CVPixelBufferIsPlanar(a3)
                   ? CVPixelBufferGetBaseAddressOfPlane(a3, v8)
                   : CVPixelBufferGetBaseAddress(a3));
      uint64_t v11 = v10;
      size_t v12 = CVPixelBufferIsPlanar(a3) ? CVPixelBufferGetHeightOfPlane(a3, v8) : CVPixelBufferGetHeight(a3);
      size_t v13 = v12;
      size_t v14 = CVPixelBufferIsPlanar(a3) ? CVPixelBufferGetWidthOfPlane(a3, v8) : CVPixelBufferGetWidth(a3);
      unint64_t v15 = v14;
      size_t v16 = CVPixelBufferIsPlanar(a3) ? CVPixelBufferGetBytesPerRowOfPlane(a3, v8) : CVPixelBufferGetBytesPerRow(a3);
      size_t v17 = v16;
      uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
      double BytesPerPixelOfPlaneForFormat = MIOCVPixelBufferGetBytesPerPixelOfPlaneForFormat(PixelFormatType, v8);
      if (v13) {
        break;
      }
LABEL_21:
      if (++v8 == v9)
      {
        CVPixelBufferUnlockBaseAddress(a3, 1uLL);
        fclose(v6);
        BOOL v21 = 1;
        goto LABEL_25;
      }
    }
    size_t v20 = (unint64_t)(BytesPerPixelOfPlaneForFormat * (double)v15);
    while (fwrite(v11, v20, 1uLL, v6) == 1)
    {
      v11 += v17;
      if (!--v13) {
        goto LABEL_21;
      }
    }
    CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  }
  BOOL v21 = 0;
LABEL_25:

  return v21;
}

+ (id)histogramOf8BitBuffer:(__CVBuffer *)a3
{
  size_t PlaneCount = CVPixelBufferGetPlaneCount(a3);
  if (PlaneCount <= 1) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = PlaneCount;
  }
  uint64_t v20 = v5;
  objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:");
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  CVPixelBufferLockBaseAddress(a3, 0);
  for (size_t i = 0; i != v20; ++i)
  {
    size_t v7 = [MEMORY[0x263EFF980] arrayWithCapacity:256];
    int v8 = 256;
    do
    {
      [v7 addObject:&unk_26CB7D170];
      --v8;
    }
    while (v8);
    BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a3, i);
    for (size_t j = 0; j < CVPixelBufferGetHeightOfPlane(a3, i); ++j)
    {
      size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, i);
      uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
      double BytesPerPixelOfPlaneForFormat = MIOCVPixelBufferGetBytesPerPixelOfPlaneForFormat(PixelFormatType, i);
      unint64_t v13 = 0;
      size_t v14 = &BaseAddressOfPlane[BytesPerRowOfPlane * j];
      while (BytesPerPixelOfPlaneForFormat * (double)CVPixelBufferGetWidthOfPlane(a3, i) > (double)v13)
      {
        uint64_t v15 = v14[v13];
        size_t v16 = NSNumber;
        size_t v17 = [v7 objectAtIndex:v15];
        size_t v18 = objc_msgSend(v16, "numberWithInt:", objc_msgSend(v17, "intValue") + 1);
        [v7 replaceObjectAtIndex:v15 withObject:v18];

        ++v13;
      }
    }
    [v21 addObject:v7];
  }
  CVPixelBufferUnlockBaseAddress(a3, 0);

  return v21;
}

+ (id)rangesOf8BitBuffer:(__CVBuffer *)a3
{
  size_t PlaneCount = CVPixelBufferGetPlaneCount(a3);
  if (PlaneCount <= 1) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = PlaneCount;
  }
  char v6 = [MEMORY[0x263EFF980] arrayWithCapacity:v5];
  CVPixelBufferLockBaseAddress(a3, 0);
  for (size_t i = 0; i != v5; ++i)
  {
    BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a3, i);
    unsigned __int8 v9 = 0;
    size_t v10 = 0;
    unsigned __int8 v11 = -1;
    while (v10 < CVPixelBufferGetHeightOfPlane(a3, i))
    {
      size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, i);
      uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
      double BytesPerPixelOfPlaneForFormat = MIOCVPixelBufferGetBytesPerPixelOfPlaneForFormat(PixelFormatType, i);
      unint64_t v15 = 0;
      size_t v16 = &BaseAddressOfPlane[BytesPerRowOfPlane * v10];
      while (BytesPerPixelOfPlaneForFormat * (double)CVPixelBufferGetWidthOfPlane(a3, i) > (double)v15)
      {
        unsigned int v17 = v16[v15];
        if (v17 < v11) {
          unsigned __int8 v11 = v16[v15];
        }
        if (v17 > v9) {
          unsigned __int8 v9 = v16[v15];
        }
        ++v15;
      }
      ++v10;
    }
    size_t v18 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v11, v9);
    [v6 addObject:v18];
  }
  CVPixelBufferUnlockBaseAddress(a3, 0);

  return v6;
}

+ (__CVBuffer)create4444AYpCbCr16PixelBufferFillAlphaWithData:(__CFData *)a3 width:(unint64_t)a4 height:(unint64_t)a5
{
  v20[1] = *MEMORY[0x263EF8340];
  CVPixelBufferRef pixelBuffer = 0;
  uint64_t v19 = *MEMORY[0x263F04130];
  v20[0] = MEMORY[0x263EFFA78];
  CFDictionaryRef v8 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
  CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], a4, a5, 0x79343136u, v8, &pixelBuffer);
  BytePtr = CFDataGetBytePtr(a3);
  CVPixelBufferLockBaseAddress(pixelBuffer, 0);
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  size_t v12 = 0;
  unint64_t v13 = (char *)CVPixelBufferGetBaseAddress(pixelBuffer) + 4;
  while (v12 < CVPixelBufferGetHeight(pixelBuffer))
  {
    size_t v14 = 0;
    unint64_t v15 = &v13[v10 * (CVPixelBufferGetBytesPerRow(pixelBuffer) >> 1)];
    while (v14 < 4 * CVPixelBufferGetWidth(pixelBuffer))
    {
      *((_WORD *)v15 - 2) = *(_WORD *)&BytePtr[2 * v11];
      *(_DWORD *)(v15 - 2) = -2147450880;
      *((_WORD *)v15 + 1) = 0x8000;
      ++v11;
      v14 += 4;
      v15 += 8;
    }
    ++v12;
    v10 += 2;
  }
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
  size_t v16 = pixelBuffer;

  return v16;
}

+ (BOOL)copyMonochromeBuffer:(__CVBuffer *)a3 toAlphaChannelOfBuffer:(__CVBuffer *)a4
{
  BOOL v4 = 0;
  if (a3 && a4)
  {
    if (CVPixelBufferGetPixelFormatType(a4) == 2033463606)
    {
      BOOL v4 = 1;
      CVPixelBufferLockBaseAddress(a3, 1uLL);
      CVPixelBufferLockBaseAddress(a4, 0);
      size_t Width = CVPixelBufferGetWidth(a3);
      size_t Height = CVPixelBufferGetHeight(a3);
      size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
      size_t v10 = CVPixelBufferGetBytesPerRow(a4);
      BaseAddress = CVPixelBufferGetBaseAddress(a3);
      size_t v12 = (unsigned __int16 *)CVPixelBufferGetBaseAddress(a4);
      copy_monochrome_to_alpha_channel((uint64_t)BaseAddress, v12, Width, Height, BytesPerRow, v10);
      CVPixelBufferUnlockBaseAddress(a4, 0);
      CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    }
    else
    {
      return 0;
    }
  }
  return v4;
}

+ (BOOL)copyuint16Data:(unsigned __int16 *)a3 toAlphaChannelOfBuffer:(__CVBuffer *)a4
{
  BOOL result = 0;
  if (a3 && a4)
  {
    if (CVPixelBufferGetPixelFormatType(a4) == 2033463606)
    {
      CVPixelBufferLockBaseAddress(a4, 0);
      size_t Width = CVPixelBufferGetWidth(a4);
      size_t Height = CVPixelBufferGetHeight(a4);
      size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a4);
      BaseAddress = (unsigned __int16 *)CVPixelBufferGetBaseAddress(a4);
      copy_monochrome_to_alpha_channel((uint64_t)a3, BaseAddress, Width, Height, 2 * Width, BytesPerRow);
      CVPixelBufferUnlockBaseAddress(a4, 0);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

+ (BOOL)copyAlphaChannelOfBuffer:(__CVBuffer *)a3 touint16Data:(unsigned __int16 *)a4
{
  BOOL v4 = 0;
  if (a3 && a4)
  {
    if (CVPixelBufferGetPixelFormatType(a3) == 2033463606)
    {
      size_t Width = CVPixelBufferGetWidth(a3);
      size_t Height = CVPixelBufferGetHeight(a3);
      size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
      BOOL v4 = 1;
      CVPixelBufferLockBaseAddress(a3, 1uLL);
      BaseAddress = CVPixelBufferGetBaseAddress(a3);
      copy_alpha_channel_to_monochrome((uint64_t)BaseAddress, a4, Width, Height, 2 * Width, BytesPerRow);
      CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    }
    else
    {
      return 0;
    }
  }
  return v4;
}

+ (BOOL)copyAlphaChannelOfBuffer:(__CVBuffer *)a3 toMonochromeBuffer:(__CVBuffer *)a4
{
  BOOL v4 = 0;
  if (a3 && a4)
  {
    if (CVPixelBufferGetPixelFormatType(a3) == 2033463606)
    {
      size_t Width = CVPixelBufferGetWidth(a4);
      size_t Height = CVPixelBufferGetHeight(a4);
      size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a4);
      size_t v10 = CVPixelBufferGetBytesPerRow(a3);
      BOOL v4 = 1;
      CVPixelBufferLockBaseAddress(a3, 1uLL);
      CVPixelBufferLockBaseAddress(a4, 0);
      BaseAddress = CVPixelBufferGetBaseAddress(a3);
      size_t v12 = (unsigned __int16 *)CVPixelBufferGetBaseAddress(a4);
      copy_alpha_channel_to_monochrome((uint64_t)BaseAddress, v12, Width, Height, BytesPerRow, v10);
      CVPixelBufferUnlockBaseAddress(a4, 0);
      CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    }
    else
    {
      return 0;
    }
  }
  return v4;
}

+ (int64_t)numberOfPlanesForPixelFormatType:(unsigned int)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  CVPixelBufferRef pixelBuffer = 0;
  uint64_t v8 = *MEMORY[0x263F04130];
  v9[0] = MEMORY[0x263EFFA78];
  CFDictionaryRef v4 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0x280uLL, 0x1E0uLL, a3, v4, &pixelBuffer);
  if (pixelBuffer)
  {
    size_t PlaneCount = CVPixelBufferGetPlaneCount(pixelBuffer);
    CVPixelBufferRelease(pixelBuffer);
  }
  else
  {
    size_t PlaneCount = -1;
  }

  return PlaneCount;
}

+ (unint64_t)pixelBufferSizeWithPadding:(__CVBuffer *)a3
{
  size_t extraColumnsOnRight = 0;
  size_t extraColumnsOnLeft = 0;
  size_t v15 = 0;
  size_t extraRowsOnTop = 0;
  CVPixelBufferGetExtendedPixels(a3, &extraColumnsOnLeft, &extraColumnsOnRight, &extraRowsOnTop, &v15);
  if (CVPixelBufferIsPlanar(a3))
  {
    size_t PlaneCount = CVPixelBufferGetPlaneCount(a3);
    if (PlaneCount)
    {
      size_t v5 = PlaneCount;
      unint64_t v6 = 0;
      for (size_t i = 0; i != v5; ++i)
      {
        size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, i);
        size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, i);
        unint64_t v10 = (unint64_t)(double)(BytesPerRowOfPlane / (extraColumnsOnLeft + WidthOfPlane + extraColumnsOnRight));
        v6 += CVPixelBufferGetHeightOfPlane(a3, i) * WidthOfPlane * v10;
      }
    }
    else
    {
      return 0;
    }
  }
  else
  {
    size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
    size_t Width = CVPixelBufferGetWidth(a3);
    unint64_t v13 = (unint64_t)(double)(BytesPerRow / (extraColumnsOnLeft + Width + extraColumnsOnRight));
    return CVPixelBufferGetHeight(a3) * Width * v13;
  }
  return v6;
}

+ (void)transferAttachmentForKey:(__CFString *)a3 fromBuffer:(__CVBuffer *)a4 toBuffer:(__CVBuffer *)a5
{
  CFTypeRef v7 = CVBufferCopyAttachment(a4, a3, 0);
  if (v7)
  {
    uint64_t v8 = v7;
    CVBufferSetAttachment(a5, a3, v7, kCVAttachmentMode_ShouldPropagate);
    CFRelease(v8);
  }
  else
  {
    CVBufferRemoveAttachment(a5, a3);
  }
}

@end