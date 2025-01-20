@interface MADRemoveBackgroundMaskResult
+ (BOOL)supportsSecureCoding;
- (CGImage)instanceMaskImage;
- (CGRect)sourceRegionOfInterest;
- (MADRemoveBackgroundMaskResult)initWithCoder:(id)a3;
- (MADRemoveBackgroundMaskResult)initWithInstances:(id)a3 instanceMaskSurface:(id)a4 perInstanceMaskSurfaces:(id)a5 sourceRegionOfInterest:(CGRect)a6 confidence:(float)a7 animatedStickerScore:(id)a8;
- (NSIndexSet)allInstances;
- (NSNumber)animatedStickerScore;
- (__CVBuffer)instanceMaskPixelBuffer;
- (float)confidence;
- (id).cxx_construct;
- (id)description;
- (id)maskImagesForInstances:(id)a3 error:(id *)a4;
- (id)maskPixelBuffersForInstances:(id)a3 error:(id *)a4;
- (void)encodeWithCoder:(id)a3;
- (void)instanceMaskImage;
- (void)instanceMaskPixelBuffer;
@end

@implementation MADRemoveBackgroundMaskResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADRemoveBackgroundMaskResult)initWithInstances:(id)a3 instanceMaskSurface:(id)a4 perInstanceMaskSurfaces:(id)a5 sourceRegionOfInterest:(CGRect)a6 confidence:(float)a7 animatedStickerScore:(id)a8
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a8;
  v25.receiver = self;
  v25.super_class = (Class)MADRemoveBackgroundMaskResult;
  v22 = [(MADResult *)&v25 init];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_allInstances, a3);
    objc_storeStrong((id *)&v23->_instanceMaskSurface, a4);
    objc_storeStrong((id *)&v23->_perInstanceMaskSurfaces, a5);
    v23->_sourceRegionOfInterest.origin.CGFloat x = x;
    v23->_sourceRegionOfInterest.origin.CGFloat y = y;
    v23->_sourceRegionOfInterest.size.CGFloat width = width;
    v23->_sourceRegionOfInterest.size.CGFloat height = height;
    v23->_confidence = a7;
    objc_storeStrong((id *)&v23->_animatedStickerScore, a8);
  }

  return v23;
}

- (MADRemoveBackgroundMaskResult)initWithCoder:(id)a3
{
  v24[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MADRemoveBackgroundMaskResult;
  v5 = [(MADResult *)&v23 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AllInstances"];
    allInstances = v5->_allInstances;
    v5->_allInstances = (NSIndexSet *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"InstanceMaskSurface"];
    instanceMaskSurface = v5->_instanceMaskSurface;
    v5->_instanceMaskSurface = (IOSurface *)v8;

    v10 = (void *)MEMORY[0x1E4F1CAD0];
    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    v24[2] = objc_opt_class();
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:3];
    v12 = [v10 setWithArray:v11];

    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"PerInstanceMaskSurfaces"];
    perInstanceMaskSurfaces = v5->_perInstanceMaskSurfaces;
    v5->_perInstanceMaskSurfaces = (NSDictionary *)v13;

    [v4 decodeRectForKey:@"SourceRegionOfInterest"];
    v5->_sourceRegionOfInterest.origin.CGFloat x = v15;
    v5->_sourceRegionOfInterest.origin.CGFloat y = v16;
    v5->_sourceRegionOfInterest.size.CGFloat width = v17;
    v5->_sourceRegionOfInterest.size.CGFloat height = v18;
    [v4 decodeFloatForKey:@"Confidence"];
    v5->_confidence = v19;
    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AnimatedStickerScore"];
    animatedStickerScore = v5->_animatedStickerScore;
    v5->_animatedStickerScore = (NSNumber *)v20;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MADRemoveBackgroundMaskResult;
  [(MADResult *)&v6 encodeWithCoder:v4];
  [v4 encodeObject:self->_allInstances forKey:@"AllInstances"];
  [v4 encodeObject:self->_instanceMaskSurface forKey:@"InstanceMaskSurface"];
  [v4 encodeObject:self->_perInstanceMaskSurfaces forKey:@"PerInstanceMaskSurfaces"];
  objc_msgSend(v4, "encodeRect:forKey:", @"SourceRegionOfInterest", self->_sourceRegionOfInterest.origin.x, self->_sourceRegionOfInterest.origin.y, self->_sourceRegionOfInterest.size.width, self->_sourceRegionOfInterest.size.height);
  *(float *)&double v5 = self->_confidence;
  [v4 encodeFloat:@"Confidence" forKey:v5];
  [v4 encodeObject:self->_animatedStickerScore forKey:@"AnimatedStickerScore"];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  [v3 appendFormat:@"allInstances: %@, ", self->_allInstances];
  [v3 appendFormat:@"instanceMaskSurface: %@, ", self->_instanceMaskSurface];
  [v3 appendFormat:@"perInstanceMaskSurfaces: %@, ", self->_perInstanceMaskSurfaces];
  [v3 appendFormat:@"sourceRegionOfInterest: %0.2fx%0.2f @ (%0.2f, %0.2f), ", *(void *)&self->_sourceRegionOfInterest.size.width, *(void *)&self->_sourceRegionOfInterest.size.height, *(void *)&self->_sourceRegionOfInterest.origin.x, *(void *)&self->_sourceRegionOfInterest.origin.y];
  [v3 appendFormat:@"confidence: %0.2f, ", self->_confidence];
  [v3 appendFormat:@"animatedStickerScore: %@>", self->_animatedStickerScore];
  return v3;
}

- (__CVBuffer)instanceMaskPixelBuffer
{
  p_instanceMaskPixelBuffer = &self->_instanceMaskPixelBuffer;
  result = self->_instanceMaskPixelBuffer.value_;
  if (!result)
  {
    uint64_t v5 = CVPixelBufferCreateWithIOSurface(0, (IOSurfaceRef)self->_instanceMaskSurface, 0, &p_instanceMaskPixelBuffer->value_);
    result = p_instanceMaskPixelBuffer->value_;
    if (!p_instanceMaskPixelBuffer->value_)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        [(MADRemoveBackgroundMaskResult *)v5 instanceMaskPixelBuffer];
      }
      return p_instanceMaskPixelBuffer->value_;
    }
  }
  return result;
}

- (CGImage)instanceMaskImage
{
  p_instanceMaskImage = &self->_instanceMaskImage;
  result = self->_instanceMaskImage.value_;
  if (!result)
  {
    uint64_t v5 = [(MADRemoveBackgroundMaskResult *)self instanceMaskPixelBuffer];
    result = p_instanceMaskImage->value_;
    if (v5)
    {
      if (result)
      {
        CFRelease(result);
        p_instanceMaskImage->value_ = 0;
      }
      uint64_t v6 = VTCreateCGImageFromCVPixelBuffer(v5, 0, &p_instanceMaskImage->value_);
      result = p_instanceMaskImage->value_;
      if (!p_instanceMaskImage->value_)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          [(MADRemoveBackgroundMaskResult *)v6 instanceMaskImage];
        }
        return p_instanceMaskImage->value_;
      }
    }
  }
  return result;
}

- (id)maskPixelBuffersForInstances:(id)a3 error:(id *)a4
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v8 = [v6 firstIndex];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_6:
    id v13 = v7;
  }
  else
  {
    uint64_t v29 = *MEMORY[0x1E4F28760];
    uint64_t v30 = *MEMORY[0x1E4F28568];
    while (1)
    {
      perInstanceMaskSurfaces = self->_perInstanceMaskSurfaces;
      uint64_t v10 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v8];
      uint64_t v11 = [(NSDictionary *)perInstanceMaskSurfaces objectForKeyedSubscript:v10];

      if (!v11) {
        break;
      }
      CVPixelBufferRef pixelBufferOut = 0;
      uint64_t v12 = CVPixelBufferCreateWithIOSurface(0, v11, 0, &pixelBufferOut);
      if (!pixelBufferOut)
      {
        uint64_t v24 = v12;
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[MADRemoveBackgroundMaskResult maskPixelBuffersForInstances:error:](buf, v24, &v35);
        }
        if (a4)
        {
          objc_super v25 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v32 = v30;
          v26 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to create CVPixelBufferRef from IOSurface (%d)", v24);
          v33 = v26;
          v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
          *a4 = [v25 errorWithDomain:v29 code:-18 userInfo:v27];
        }
        CF<CGColorSpace *>::~CF((const void **)&pixelBufferOut);

        goto LABEL_16;
      }
      objc_msgSend(v7, "addObject:");
      uint64_t v8 = [v6 indexGreaterThanIndex:v8];
      CF<CGColorSpace *>::~CF((const void **)&pixelBufferOut);

      if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_6;
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[MADRemoveBackgroundMaskResult maskPixelBuffersForInstances:error:](v8, v14, v15, v16, v17, v18, v19, v20);
    }
    if (a4)
    {
      id v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v36 = v30;
      v22 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid instance index %d", v8);
      v37[0] = v22;
      objc_super v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v36 count:1];
      *a4 = [v21 errorWithDomain:v29 code:-50 userInfo:v23];
    }
LABEL_16:
    id v13 = 0;
  }

  return v13;
}

- (id)maskImagesForInstances:(id)a3 error:(id *)a4
{
  v62[1] = *MEMORY[0x1E4F143B8];
  id v45 = a3;
  v46 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v6 = [v45 firstIndex];
  uint64_t v43 = *MEMORY[0x1E4F28760];
  uint64_t v44 = *MEMORY[0x1E4F28568];
  while (1)
  {
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v21 = v46;
      goto LABEL_33;
    }
    perInstanceMaskSurfaces = self->_perInstanceMaskSurfaces;
    uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v6];
    uint64_t v9 = [(NSDictionary *)perInstanceMaskSurfaces objectForKeyedSubscript:v8];

    if (!v9) {
      break;
    }
    if ([v9 pixelFormat] != 1278226534)
    {
      BOOL v33 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      if (v33) {
        -[MADRemoveBackgroundMaskResult maskImagesForInstances:error:].cold.4(v33, v34, v35, v36, v37, v38, v39, v40);
      }
      if (a4)
      {
        v41 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v59 = v44;
        uint64_t v30 = [NSString stringWithFormat:@"Unexpected pixel format"];
        v60 = v30;
        v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v60 forKeys:&v59 count:1];
        uint64_t v32 = [v41 errorWithDomain:v43 code:-50 userInfo:v31];
        goto LABEL_30;
      }
      goto LABEL_31;
    }
    CGDataProviderDirectCallbacks callbacks = *(CGDataProviderDirectCallbacks *)byte_1F381E958;
    CGDataProviderRef provider = CGDataProviderCreateDirect(v9, [v9 height] * objc_msgSend(v9, "bytesPerRow"), &callbacks);
    if (provider)
    {
      CFRetain(v9);
      CGColorSpaceRef space = CGColorSpaceCreateDeviceGray();
      size_t v10 = [v9 width];
      size_t v11 = [v9 height];
      size_t v12 = [v9 bytesPerRow];
      CGImageRef v13 = CGImageCreate(v10, v11, 0x20uLL, 0x20uLL, v12, space, 0x2100u, provider, 0, 1, kCGRenderingIntentDefault);
      CGImageRef v49 = v13;
      if (v13)
      {
        [v46 addObject:v13];
        uint64_t v6 = [v45 indexGreaterThanIndex:v6];
        int v14 = 0;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[MADRemoveBackgroundMaskResult maskImagesForInstances:error:](&v47, v48);
        }
        if (a4)
        {
          uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v55 = v44;
          uint64_t v19 = [NSString stringWithFormat:@"Failed to create CGImage for IOSurface"];
          v56 = v19;
          uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v56 forKeys:&v55 count:1];
          *a4 = [v18 errorWithDomain:v43 code:-18 userInfo:v20];
        }
        int v14 = 1;
      }
      CF<CGColorSpace *>::~CF((const void **)&v49);
      CF<CGColorSpace *>::~CF((const void **)&space);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[MADRemoveBackgroundMaskResult maskImagesForInstances:error:](&buf, v52);
      }
      if (a4)
      {
        uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v57 = v44;
        uint64_t v16 = [NSString stringWithFormat:@"Failed to create CGDataProviderRef for IOSurface"];
        v58 = v16;
        uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
        *a4 = [v15 errorWithDomain:v43 code:-18 userInfo:v17];
      }
      int v14 = 1;
    }
    CF<CGColorSpace *>::~CF((const void **)&provider);

    if (v14) {
      goto LABEL_32;
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[MADRemoveBackgroundMaskResult maskPixelBuffersForInstances:error:](v6, v22, v23, v24, v25, v26, v27, v28);
  }
  if (a4)
  {
    uint64_t v29 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v61 = v44;
    uint64_t v30 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid instance index %d", v6);
    v62[0] = v30;
    v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:&v61 count:1];
    uint64_t v32 = [v29 errorWithDomain:v43 code:-50 userInfo:v31];
LABEL_30:
    *a4 = v32;
  }
LABEL_31:

LABEL_32:
  id v21 = 0;
LABEL_33:

  return v21;
}

- (NSIndexSet)allInstances
{
  return self->_allInstances;
}

- (CGRect)sourceRegionOfInterest
{
  double x = self->_sourceRegionOfInterest.origin.x;
  double y = self->_sourceRegionOfInterest.origin.y;
  double width = self->_sourceRegionOfInterest.size.width;
  double height = self->_sourceRegionOfInterest.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (float)confidence
{
  return self->_confidence;
}

- (NSNumber)animatedStickerScore
{
  return self->_animatedStickerScore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animatedStickerScore, 0);
  objc_storeStrong((id *)&self->_allInstances, 0);
  CF<CGColorSpace *>::~CF((const void **)&self->_instanceMaskImage.value_);
  CF<CGColorSpace *>::~CF((const void **)&self->_instanceMaskPixelBuffer.value_);
  objc_storeStrong((id *)&self->_perInstanceMaskSurfaces, 0);
  objc_storeStrong((id *)&self->_instanceMaskSurface, 0);
}

- (id).cxx_construct
{
  *((void *)self + 10) = 0;
  *((void *)self + 11) = 0;
  return self;
}

- (void)instanceMaskPixelBuffer
{
}

- (void)instanceMaskImage
{
}

- (void)maskPixelBuffersForInstances:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)maskPixelBuffersForInstances:(_DWORD *)a3 error:.cold.2(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)uint8_t buf = 67109120;
  *a3 = a2;
  _os_log_error_impl(&dword_1DCC91000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to create CVPixelBufferRef from IOSurface (%d)", buf, 8u);
}

- (void)maskImagesForInstances:(uint8_t *)buf error:(unsigned char *)a2 .cold.2(uint8_t *buf, unsigned char *a2)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1DCC91000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to create CGDataProviderRef for IOSurface", buf, 2u);
}

- (void)maskImagesForInstances:(uint8_t *)buf error:(unsigned char *)a2 .cold.3(uint8_t *buf, unsigned char *a2)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1DCC91000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to create CGImage for IOSurface", buf, 2u);
}

- (void)maskImagesForInstances:(uint64_t)a3 error:(uint64_t)a4 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end