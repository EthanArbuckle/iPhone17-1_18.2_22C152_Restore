@interface MOVStreamFrameTransform
- (MOVStreamFrameTransform)initWithRotation:(int64_t)a3 flip:(int64_t)a4;
- (MOVStreamFrameTransform)initWithRotation:(int64_t)a3 flip:(int64_t)a4 bufferCacheMode:(int)a5;
- (__CVBuffer)transform:(__CVBuffer *)a3;
- (void)dealloc;
@end

@implementation MOVStreamFrameTransform

- (MOVStreamFrameTransform)initWithRotation:(int64_t)a3 flip:(int64_t)a4 bufferCacheMode:(int)a5
{
  v16.receiver = self;
  v16.super_class = (Class)MOVStreamFrameTransform;
  v8 = [(MOVStreamFrameTransform *)&v16 init];
  if (v8)
  {
    p_rotationSession = (VTSessionRef *)&v8->_rotationSession;
    uint64_t v10 = VTPixelRotationSessionCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], &v8->_rotationSession);
    if (v10)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Cannot create pixel buffer rotation session (err: %d)", v10);
    }
    else
    {
      v8->_bufferCacheMode = a5;
      v8->_rotation = a3;
      if ((unint64_t)a3 >= 4) {
        -[MOVStreamFrameTransform initWithRotation:flip:bufferCacheMode:]();
      }
      uint64_t v11 = VTSessionSetProperty(*p_rotationSession, (CFStringRef)*MEMORY[0x263F1E9D0], **((CFTypeRef **)&unk_2643AF980 + a3));
      if (v11)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Cannot set rotation property (err: %d).", v11);
      }
      else if ((a4 & 0xFFFFFFFFFFFFFFFDLL) == 1 {
             && (uint64_t v12 = VTSessionSetProperty(*p_rotationSession, (CFStringRef)*MEMORY[0x263F1E9C0], (CFTypeRef)*MEMORY[0x263EFFB40]), v12))
      }
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Cannot set horizontal flip (err: %d).", v12);
      }
      else
      {
        if ((a4 & 0xFFFFFFFFFFFFFFFELL) != 2) {
          return v8;
        }
        uint64_t v13 = VTSessionSetProperty(*p_rotationSession, (CFStringRef)*MEMORY[0x263F1E9C8], (CFTypeRef)*MEMORY[0x263EFFB40]);
        if (!v13) {
          return v8;
        }
        objc_msgSend(NSString, "stringWithFormat:", @"Cannot set vertical flip (err: %d).", v13);
      }
    }
    id v15 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF488] reason:objc_claimAutoreleasedReturnValue() userInfo:0];
    objc_exception_throw(v15);
  }
  return v8;
}

- (MOVStreamFrameTransform)initWithRotation:(int64_t)a3 flip:(int64_t)a4
{
  return [(MOVStreamFrameTransform *)self initWithRotation:a3 flip:a4 bufferCacheMode:0];
}

- (void)dealloc
{
  rotationSession = self->_rotationSession;
  if (rotationSession)
  {
    VTPixelRotationSessionInvalidate(rotationSession);
    CFRelease(self->_rotationSession);
  }
  v4.receiver = self;
  v4.super_class = (Class)MOVStreamFrameTransform;
  [(MOVStreamFrameTransform *)&v4 dealloc];
}

- (__CVBuffer)transform:(__CVBuffer *)a3
{
  pool = self->_pool;
  if (!pool)
  {
    size_t Width = CVPixelBufferGetWidth(a3);
    size_t Height = CVPixelBufferGetHeight(a3);
    uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
    int64_t v9 = self->_rotation | 2;
    size_t v10 = v9 == 3 ? Width : Height;
    size_t v11 = v9 == 3 ? Height : Width;
    uint64_t v12 = +[MIOPixelBufferPool createMIOPixelBufferPoolWithWidth:v11 height:v10 pixelFormat:PixelFormatType extendedPixelsPerRow:0 minBufferCount:10 bufferCacheMode:self->_bufferCacheMode];
    uint64_t v13 = self->_pool;
    self->_pool = v12;

    pool = self->_pool;
    if (!pool)
    {
      v18 = (void *)MEMORY[0x263EFF940];
      uint64_t v19 = *MEMORY[0x263EFF488];
      v20 = @"Cannot create pixel buffer pool.";
LABEL_15:
      id v22 = [v18 exceptionWithName:v19 reason:v20 userInfo:0];
      objc_exception_throw(v22);
    }
  }
  v14 = [(MIOPixelBufferPool *)pool getPixelBuffer];
  if (!v14)
  {
    v18 = (void *)MEMORY[0x263EFF940];
    uint64_t v19 = *MEMORY[0x263EFF488];
    v20 = @"Cannot create new pixel buffer.";
    goto LABEL_15;
  }
  id v15 = v14;
  uint64_t v16 = VTPixelRotationSessionRotateImage(self->_rotationSession, a3, v14);
  if (v16)
  {
    uint64_t v21 = v16;
    CVPixelBufferRelease(v15);
    objc_msgSend(NSString, "stringWithFormat:", @"Cannot rotate pixel buffer (err: %d).", v21);
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x263EFF940];
    uint64_t v19 = *MEMORY[0x263EFF488];
    goto LABEL_15;
  }
  return v15;
}

- (void).cxx_destruct
{
}

- (void)initWithRotation:flip:bufferCacheMode:.cold.1()
{
}

@end