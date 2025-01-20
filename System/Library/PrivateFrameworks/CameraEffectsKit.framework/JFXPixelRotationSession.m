@interface JFXPixelRotationSession
+ (const)toVTRotation:(int)a3;
+ (void)JFX_rotateFrameSet:(id *)a3 toOrientation:(int64_t)a4 pixelRotationSession:(id *)a5;
+ (void)rotateFrameSet:(id *)a3 by:(int)a4 mirror:(BOOL)a5 pixelRotationSession:(id *)a6;
+ (void)rotateFrameSetToDeviceOrientation:(id *)a3 pixelRotationSession:(id *)a4;
+ (void)rotateFrameSetToUIOrientation:(id *)a3 pixelRotationSession:(id *)a4;
- (BOOL)mirror;
- (JFXPixelBufferPool)pixelBufferPool;
- (JFXPixelRotationSession)initWithRotation:(int)a3 mirror:(BOOL)a4;
- (__CVBuffer)createRotatedPixelBuffer:(__CVBuffer *)a3;
- (__CVBuffer)createRotatedPixelBuffer:(__CVBuffer *)a3 using:(__CVBuffer *)a4;
- (id)createRotatedFrameSet:(id)a3;
- (int)rotationCardinalAngle;
- (void)JT_releaseImageRotationSession;
- (void)dealloc;
- (void)setPixelBufferPool:(id)a3;
@end

@implementation JFXPixelRotationSession

+ (void)rotateFrameSetToUIOrientation:(id *)a3 pixelRotationSession:(id *)a4
{
  id v7 = [*a3 metadataObjectForKey:*MEMORY[0x263F61650]];
  objc_msgSend(a1, "JFX_rotateFrameSet:toOrientation:pixelRotationSession:", a3, objc_msgSend(v7, "interfaceOrientation"), a4);
}

+ (void)rotateFrameSetToDeviceOrientation:(id *)a3 pixelRotationSession:(id *)a4
{
  id v7 = [*a3 metadataObjectForKey:@"PVFrameSetMetadataDeviceOrientationkey"];
  uint64_t v8 = [v7 integerValue];

  objc_msgSend(a1, "JFX_rotateFrameSet:toOrientation:pixelRotationSession:", a3, v8, a4);
}

+ (void)rotateFrameSet:(id *)a3 by:(int)a4 mirror:(BOOL)a5 pixelRotationSession:(id *)a6
{
  BOOL v7 = a5;
  uint64_t v8 = *(void *)&a4;
  if (a4 || a5)
  {
    v10 = (JFXPixelRotationSession *)*a6;
    if ([(JFXPixelRotationSession *)v10 rotationCardinalAngle] != v8
      || [(JFXPixelRotationSession *)v10 mirror] != v7)
    {
      v11 = [[JFXPixelRotationSession alloc] initWithRotation:v8 mirror:v7];

      v10 = v11;
    }
    id v12 = *a3;
    id v13 = [(JFXPixelRotationSession *)v10 createRotatedFrameSet:v12];
    *a3 = v13;
  }
  else
  {
    v10 = 0;
  }
  id v14 = *a6;
  *a6 = v10;
}

+ (void)JFX_rotateFrameSet:(id *)a3 toOrientation:(int64_t)a4 pixelRotationSession:(id *)a5
{
  id v10 = [*a3 metadataObjectForKey:*MEMORY[0x263F61650]];
  uint64_t v9 = [v10 cameraPosition];
  objc_msgSend(a1, "rotateFrameSet:by:mirror:pixelRotationSession:", a3, +[JFXRotationTransforms rotationFromCaptureDevicePosition:captureVideoOrientation:toInterfaceOrientation:](JFXRotationTransforms, "rotationFromCaptureDevicePosition:captureVideoOrientation:toInterfaceOrientation:", v9, objc_msgSend(v10, "captureVideoOrientation"), a4), v9 == 2, a5);
}

+ (const)toVTRotation:(int)a3
{
  switch(a3)
  {
    case 0:
      v3 = (const __CFString **)MEMORY[0x263F1EBE8];
      goto LABEL_6;
    case 1:
      v3 = (const __CFString **)MEMORY[0x263F1EC00];
      goto LABEL_6;
    case 2:
      v3 = (const __CFString **)MEMORY[0x263F1EBF0];
      goto LABEL_6;
    case 3:
      v3 = (const __CFString **)MEMORY[0x263F1EBF8];
LABEL_6:
      result = *v3;
      break;
    default:
      return result;
  }
  return result;
}

- (JFXPixelRotationSession)initWithRotation:(int)a3 mirror:(BOOL)a4
{
  v10.receiver = self;
  v10.super_class = (Class)JFXPixelRotationSession;
  v6 = [(JFXPixelRotationSession *)&v10 init];
  BOOL v7 = v6;
  if (v6 {
    && ((v6->_rotationCardinalAngle = a3,
  }
         v6->_mirror = a4,
         VTPixelRotationSessionCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], &v6->_imageRotationSession))
     || VTSessionSetProperty(v7->_imageRotationSession, (CFStringRef)*MEMORY[0x263F1E9D0], +[JFXPixelRotationSession toVTRotation:(CFTypeRef)*MEMORY[0x263EFFB40] v7->_rotationCardinalAngle]))
  {
    [(JFXPixelRotationSession *)v7 JT_releaseImageRotationSession];
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = v7;
  }

  return v8;
}

- (void)dealloc
{
  [(JFXPixelRotationSession *)self JT_releaseImageRotationSession];
  pixelBufferPool = self->_pixelBufferPool;
  self->_pixelBufferPool = 0;

  v4.receiver = self;
  v4.super_class = (Class)JFXPixelRotationSession;
  [(JFXPixelRotationSession *)&v4 dealloc];
}

- (id)createRotatedFrameSet:(id)a3
{
  id v4 = a3;
  v5 = [v4 colorImageBuffer];
  v6 = -[JFXPixelRotationSession createRotatedPixelBuffer:](self, "createRotatedPixelBuffer:", [v5 cvPixelBuffer]);
  if (v6)
  {
    BOOL v7 = v6;
    uint64_t v8 = [MEMORY[0x263F61268] imageWithCVPixelBuffer:v6];
    CVPixelBufferRelease(v7);
    long long v23 = 0uLL;
    uint64_t v24 = 0;
    if (v4) {
      [v4 presentationTimeStamp];
    }
    memset(&v22, 0, sizeof(v22));
    uint64_t v9 = [v4 colorSampleBuffer];
    CMSampleBufferGetDuration(&v22, (CMSampleBufferRef)[v9 sampleBufferRef]);

    long long v20 = v23;
    uint64_t v21 = v24;
    CMTime v19 = v22;
    objc_super v10 = [MEMORY[0x263F61228] sampleBufferWithPVImageBuffer:v8 timestamp:&v20 frameDuration:&v19];
    v11 = [v4 metadataDict];
    id v12 = (void *)[v11 copy];

    id v13 = [v12 objectForKey:@"PVFrameSetMetadataARMetadataKey"];
    id v14 = [v13 arFrame];
    objc_msgSend(v14, "setCapturedImage:", objc_msgSend(v8, "cvPixelBuffer"));
    id v15 = objc_alloc(MEMORY[0x263F61258]);
    v16 = [v4 depthData];
    v17 = (void *)[v15 initWithColorBuffer:v10 depthData:v16 metadata:v12];
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (__CVBuffer)createRotatedPixelBuffer:(__CVBuffer *)a3
{
  return [(JFXPixelRotationSession *)self createRotatedPixelBuffer:a3 using:0];
}

- (__CVBuffer)createRotatedPixelBuffer:(__CVBuffer *)a3 using:(__CVBuffer *)a4
{
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  uint64_t v9 = a4;
  if (!a4)
  {
    unint64_t v10 = Height;
    double v11 = (double)Height;
    switch([(JFXPixelRotationSession *)self rotationCardinalAngle])
    {
      case 0:
      case 2:
        double v12 = (double)Width;
        break;
      case 1:
      case 3:
        double v12 = (double)v10;
        double v11 = (double)Width;
        break;
      default:
        double v12 = *MEMORY[0x263F001B0];
        double v11 = *(double *)(MEMORY[0x263F001B0] + 8);
        break;
    }
    uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
    id v14 = [(JFXPixelRotationSession *)self pixelBufferPool];

    if (!v14) {
      goto LABEL_12;
    }
    id v15 = [(JFXPixelRotationSession *)self pixelBufferPool];
    int v16 = [v15 type];

    v17 = [(JFXPixelRotationSession *)self pixelBufferPool];
    [v17 size];
    double v19 = v18;
    double v21 = v20;

    if (PixelFormatType != v16) {
      goto LABEL_12;
    }
    if (v19 != v12 || v21 != v11)
    {
LABEL_12:
      long long v23 = -[JFXPixelBufferPool initWithSize:type:]([JFXPixelBufferPool alloc], "initWithSize:type:", PixelFormatType, v12, v11);
      [(JFXPixelRotationSession *)self setPixelBufferPool:v23];
    }
    uint64_t v24 = [(JFXPixelRotationSession *)self pixelBufferPool];
    uint64_t v9 = (__CVBuffer *)[v24 createPixelBuffer];
  }
  CVBufferPropagateAttachments(a3, v9);
  OSStatus v25 = VTPixelRotationSessionRotateImage(self->_imageRotationSession, a3, v9);
  if (v25) {
    result = 0;
  }
  else {
    result = v9;
  }
  if (!a4)
  {
    if (v25)
    {
      CVPixelBufferRelease(v9);
      return 0;
    }
  }
  return result;
}

- (void)JT_releaseImageRotationSession
{
  imageRotationSession = self->_imageRotationSession;
  if (imageRotationSession)
  {
    VTPixelRotationSessionInvalidate(imageRotationSession);
    CFRelease(self->_imageRotationSession);
    self->_imageRotationSession = 0;
  }
}

- (int)rotationCardinalAngle
{
  return self->_rotationCardinalAngle;
}

- (BOOL)mirror
{
  return self->_mirror;
}

- (JFXPixelBufferPool)pixelBufferPool
{
  return self->_pixelBufferPool;
}

- (void)setPixelBufferPool:(id)a3
{
}

- (void).cxx_destruct
{
}

@end