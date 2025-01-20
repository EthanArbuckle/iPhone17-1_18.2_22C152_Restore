@interface MOVStreamFrameConverter
- (BOOL)transferSessionUsageDisabled;
- (MOVStreamFrameConverter)init;
- (MOVStreamFrameConverter)initWithTargetWidth:(unint64_t)a3 height:(unint64_t)a4 format:(unsigned int)a5 bytesPerRow:(unint64_t)a6;
- (MOVStreamFrameConverter)initWithTargetWidth:(unint64_t)a3 height:(unint64_t)a4 format:(unsigned int)a5 bytesPerRow:(unint64_t)a6 bufferCacheMode:(int)a7;
- (MOVStreamFrameConverter)initWithTargetWidth:(unint64_t)a3 height:(unint64_t)a4 format:(unsigned int)a5 bytesPerRows:(id)a6;
- (MOVStreamFrameConverter)initWithTargetWidth:(unint64_t)a3 height:(unint64_t)a4 format:(unsigned int)a5 bytesPerRows:(id)a6 bufferCacheMode:(int)a7;
- (MOVStreamFrameConverter)initWithTargetWidth:(unint64_t)a3 height:(unint64_t)a4 format:(unsigned int)a5 extendedPixelsPerRow:(unint64_t)a6;
- (MOVStreamFrameConverter)initWithTargetWidth:(unint64_t)a3 height:(unint64_t)a4 format:(unsigned int)a5 extendedPixelsPerRow:(unint64_t)a6 bufferCacheMode:(int)a7;
- (__CVBuffer)convertPixelBuffer:(__CVBuffer *)a3;
- (void)dealloc;
- (void)setTransferSessionUsageDisabled:(BOOL)a3;
@end

@implementation MOVStreamFrameConverter

- (MOVStreamFrameConverter)init
{
  v6.receiver = self;
  v6.super_class = (Class)MOVStreamFrameConverter;
  v2 = [(MOVStreamFrameConverter *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_transferSessionUsageDisabled = 0;
    if (VTPixelTransferSessionCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], &v2->_transferSession))
    {
      id v5 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF488] reason:@"Cannot create pixel buffer transfer session" userInfo:0];
      objc_exception_throw(v5);
    }
  }
  return v3;
}

- (MOVStreamFrameConverter)initWithTargetWidth:(unint64_t)a3 height:(unint64_t)a4 format:(unsigned int)a5 extendedPixelsPerRow:(unint64_t)a6
{
  return [(MOVStreamFrameConverter *)self initWithTargetWidth:a3 height:a4 format:*(void *)&a5 extendedPixelsPerRow:a6 bufferCacheMode:0];
}

- (MOVStreamFrameConverter)initWithTargetWidth:(unint64_t)a3 height:(unint64_t)a4 format:(unsigned int)a5 bytesPerRow:(unint64_t)a6
{
  return [(MOVStreamFrameConverter *)self initWithTargetWidth:a3 height:a4 format:*(void *)&a5 bytesPerRow:a6 bufferCacheMode:0];
}

- (MOVStreamFrameConverter)initWithTargetWidth:(unint64_t)a3 height:(unint64_t)a4 format:(unsigned int)a5 bytesPerRows:(id)a6
{
  return [(MOVStreamFrameConverter *)self initWithTargetWidth:a3 height:a4 format:*(void *)&a5 bytesPerRows:a6 bufferCacheMode:0];
}

- (MOVStreamFrameConverter)initWithTargetWidth:(unint64_t)a3 height:(unint64_t)a4 format:(unsigned int)a5 extendedPixelsPerRow:(unint64_t)a6 bufferCacheMode:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v9 = *(void *)&a5;
  v12 = [(MOVStreamFrameConverter *)self init];
  if (v12)
  {
    uint64_t v13 = +[MIOPixelBufferPool createMIOPixelBufferPoolWithWidth:a3 height:a4 pixelFormat:v9 extendedPixelsPerRow:a6 minBufferCount:1 bufferCacheMode:v7];
    pool = v12->_pool;
    v12->_pool = (MIOPixelBufferPool *)v13;

    if (!v12->_pool)
    {
      id v16 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF488] reason:@"Cannot create pixel buffer pool" userInfo:0];
      objc_exception_throw(v16);
    }
  }
  return v12;
}

- (MOVStreamFrameConverter)initWithTargetWidth:(unint64_t)a3 height:(unint64_t)a4 format:(unsigned int)a5 bytesPerRow:(unint64_t)a6 bufferCacheMode:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v9 = *(void *)&a5;
  v12 = [(MOVStreamFrameConverter *)self init];
  if (v12)
  {
    uint64_t v13 = +[MIOPixelBufferPool createMIOPixelBufferPoolWithWidth:a3 height:a4 pixelFormat:v9 exactBytesPerRow:a6 minBufferCount:1 bufferCacheMode:v7];
    pool = v12->_pool;
    v12->_pool = (MIOPixelBufferPool *)v13;

    if (!v12->_pool)
    {
      id v16 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF488] reason:@"Cannot create pixel buffer pool" userInfo:0];
      objc_exception_throw(v16);
    }
  }
  return v12;
}

- (MOVStreamFrameConverter)initWithTargetWidth:(unint64_t)a3 height:(unint64_t)a4 format:(unsigned int)a5 bytesPerRows:(id)a6 bufferCacheMode:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v8 = *(void *)&a5;
  id v12 = a6;
  uint64_t v13 = [(MOVStreamFrameConverter *)self init];
  if (v13)
  {
    uint64_t v14 = +[MIOPixelBufferPool createMIOPixelBufferPoolWithWidth:a3 height:a4 pixelFormat:v8 exactBytesPerRows:v12 minBufferCount:1 bufferCacheMode:v7];
    pool = v13->_pool;
    v13->_pool = (MIOPixelBufferPool *)v14;

    if (!v13->_pool)
    {
      id v17 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF488] reason:@"Cannot create pixel buffer pool" userInfo:0];
      objc_exception_throw(v17);
    }
  }

  return v13;
}

- (void)dealloc
{
  transferSession = self->_transferSession;
  if (transferSession)
  {
    VTPixelTransferSessionInvalidate(transferSession);
    CFRelease(self->_transferSession);
  }
  v4.receiver = self;
  v4.super_class = (Class)MOVStreamFrameConverter;
  [(MOVStreamFrameConverter *)&v4 dealloc];
}

- (__CVBuffer)convertPixelBuffer:(__CVBuffer *)a3
{
  id v5 = [(MIOPixelBufferPool *)self->_pool getPixelBuffer];
  if (!v5)
  {
    uint64_t v7 = (void *)MEMORY[0x263EFF940];
    uint64_t v8 = *MEMORY[0x263EFF488];
    uint64_t v9 = @"Cannot create new pixel buffer.";
    goto LABEL_11;
  }
  objc_super v6 = v5;
  if (!self->_transferSessionUsageDisabled)
  {
    if (!VTPixelTransferSessionTransferImage(self->_transferSession, a3, v5)) {
      goto LABEL_6;
    }
    CVPixelBufferRelease(v6);
    uint64_t v7 = (void *)MEMORY[0x263EFF940];
    uint64_t v8 = *MEMORY[0x263EFF488];
    uint64_t v9 = @"Cannot transfer pixel buffer";
LABEL_11:
    id v12 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    objc_exception_throw(v12);
  }
  if (!+[MIOPixelBufferUtility copyPixelBuffer:a3 toPixelBuffer:v5])
  {
    CVPixelBufferRelease(v6);
    uint64_t v7 = (void *)MEMORY[0x263EFF940];
    uint64_t v8 = *MEMORY[0x263EFF488];
    uint64_t v9 = @"Cannot copy pixel buffer";
    goto LABEL_11;
  }
LABEL_6:
  CFDictionaryRef v10 = CVBufferCopyAttachments(a3, kCVAttachmentMode_ShouldPropagate);
  CVBufferSetAttachments(v6, v10, kCVAttachmentMode_ShouldPropagate);
  if (v10) {
    CFRelease(v10);
  }
  return v6;
}

- (BOOL)transferSessionUsageDisabled
{
  return self->_transferSessionUsageDisabled;
}

- (void)setTransferSessionUsageDisabled:(BOOL)a3
{
  self->_transferSessionUsageDisabled = a3;
}

- (void).cxx_destruct
{
}

@end