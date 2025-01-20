@interface ARReferenceImage
+ (BOOL)supportsSecureCoding;
+ (NSSet)referenceImagesInGroupNamed:(NSString *)name bundle:(NSBundle *)bundle;
+ (id)referenceImagesInGroupNamed:(id)a3 catalog:(id)a4;
+ (id)referenceImagesInGroupNamed:(id)a3 catalogName:(id)a4 bundle:(id)a5;
+ (id)referenceImagesInGroupNamed:(id)a3 catalogURL:(id)a4;
- (ARReferenceImage)initWithCGImage:(CGImage *)a3 orientation:(unsigned int)a4 physicalWidth:(double)a5 addPadding:(BOOL)a6;
- (ARReferenceImage)initWithCGImage:(CGImageRef)image orientation:(CGImagePropertyOrientation)orientation physicalWidth:(CGFloat)physicalWidth;
- (ARReferenceImage)initWithCIImage:(id)a3 orientation:(unsigned int)a4 physicalWidth:(double)a5 alphaInfo:(unsigned int *)a6 addPadding:(BOOL)a7;
- (ARReferenceImage)initWithCoder:(id)a3;
- (ARReferenceImage)initWithIdentifier:(id)a3;
- (ARReferenceImage)initWithPixelBuffer:(CVPixelBufferRef)pixelBuffer orientation:(CGImagePropertyOrientation)orientation physicalWidth:(CGFloat)physicalWidth;
- (ARReferenceImage)initWithPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4 physicalWidth:(double)a5 addPadding:(BOOL)a6;
- (ARReferenceImageCachedError)cachedVerificationError;
- (BOOL)isEqual:(id)a3;
- (CGSize)imageSize;
- (CGSize)physicalSize;
- (NSString)name;
- (NSString)resourceGroupName;
- (NSUUID)identifier;
- (__CVBuffer)alphaMask;
- (__CVBuffer)pixelBuffer;
- (double)estimatedQuality;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)shortDebugDescription;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)estimateQualityWithCompletionHandler:(id)a3;
- (void)setCachedVerificationError:(id)a3;
- (void)setEstimatedQuality:(double)a3;
- (void)setName:(NSString *)name;
- (void)setResourceGroupName:(id)a3;
- (void)validateWithCompletionHandler:(void *)completionHandler;
@end

@implementation ARReferenceImage

- (ARReferenceImage)initWithCGImage:(CGImage *)a3 orientation:(unsigned int)a4 physicalWidth:(double)a5 addPadding:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v8 = *(void *)&a4;
  CGImageAlphaInfo AlphaInfo = CGImageGetAlphaInfo(a3);
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F1E050]) initWithCGImage:a3];
  v12 = [(ARReferenceImage *)self initWithCIImage:v11 orientation:v8 physicalWidth:&AlphaInfo alphaInfo:v6 addPadding:a5];

  return v12;
}

- (ARReferenceImage)initWithPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4 physicalWidth:(double)a5 addPadding:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v8 = *(void *)&a4;
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F1E050]) initWithCVPixelBuffer:a3];
  v11 = [(ARReferenceImage *)self initWithCIImage:v10 orientation:v8 physicalWidth:0 alphaInfo:v6 addPadding:a5];

  return v11;
}

- (ARReferenceImage)initWithCGImage:(CGImageRef)image orientation:(CGImagePropertyOrientation)orientation physicalWidth:(CGFloat)physicalWidth
{
  uint64_t v6 = *(void *)&orientation;
  CGImageAlphaInfo AlphaInfo = CGImageGetAlphaInfo(image);
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F1E050]) initWithCGImage:image];
  v10 = [(ARReferenceImage *)self initWithCIImage:v9 orientation:v6 physicalWidth:&AlphaInfo alphaInfo:0 addPadding:physicalWidth];

  return v10;
}

- (ARReferenceImage)initWithPixelBuffer:(CVPixelBufferRef)pixelBuffer orientation:(CGImagePropertyOrientation)orientation physicalWidth:(CGFloat)physicalWidth
{
  uint64_t v6 = *(void *)&orientation;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1E050]) initWithCVPixelBuffer:pixelBuffer];
  v9 = [(ARReferenceImage *)self initWithCIImage:v8 orientation:v6 physicalWidth:0 alphaInfo:0 addPadding:physicalWidth];

  return v9;
}

- (ARReferenceImage)initWithCIImage:(id)a3 orientation:(unsigned int)a4 physicalWidth:(double)a5 alphaInfo:(unsigned int *)a6 addPadding:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  v58.receiver = self;
  v58.super_class = (Class)ARReferenceImage;
  v13 = [(ARReferenceImage *)&v58 init];
  if (!v13) {
    goto LABEL_54;
  }
  if (!a6 || (*a6 <= 6 ? (BOOL v14 = ((1 << *a6) & 0x61) == 0) : (BOOL v14 = 1), v14))
  {
    CVPixelBufferRef pixelBuffer = 0;
    p_CVPixelBufferRef pixelBufferOut = &pixelBufferOut;
  }
  else
  {
    p_CVPixelBufferRef pixelBufferOut = 0;
    CVPixelBufferRef pixelBuffer = 0;
  }
  CVPixelBufferRef pixelBufferOut = 0;
  if (ARCreateDownScaledGrayscaleImageAndMask(v12, 0x280uLL, @"ARReferenceImage", &pixelBuffer, p_pixelBufferOut))
  {
    v16 = _ARLogGeneral_1();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = (objc_class *)objc_opt_class();
      v18 = NSStringFromClass(v17);
      LODWORD(buf.data) = 138543618;
      *(void **)((char *)&buf.data + 4) = v18;
      WORD2(buf.height) = 2048;
      *(vImagePixelCount *)((char *)&buf.height + 6) = (vImagePixelCount)v13;
      _os_log_impl(&dword_1B88A2000, v16, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not create pixelbuffer and alpha mask", (uint8_t *)&buf, 0x16u);
    }
    goto LABEL_54;
  }
  BOOL v19 = CVPixelBufferGetWidth(pixelBuffer) < 0x64 || CVPixelBufferGetHeight(pixelBuffer) < 0x64;
  [v12 extent];
  if (v20 == (double)CVPixelBufferGetWidth(pixelBuffer))
  {
    [v12 extent];
    int v22 = v21 != (double)CVPixelBufferGetHeight(pixelBuffer) || v7;
    if ((v22 & v19 & 1) == 0) {
      goto LABEL_44;
    }
LABEL_23:
    if (!pixelBufferOut)
    {
      CFAllocatorRef v23 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      size_t Width = CVPixelBufferGetWidth(pixelBuffer);
      size_t Height = CVPixelBufferGetHeight(pixelBuffer);
      if (CVPixelBufferCreate(v23, Width, Height, 0x4C303038u, 0, &pixelBufferOut))
      {
        v26 = _ARLogGeneral_1();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          v27 = (objc_class *)objc_opt_class();
          v28 = NSStringFromClass(v27);
          LODWORD(buf.data) = 138543618;
          *(void **)((char *)&buf.data + 4) = v28;
          WORD2(buf.height) = 2048;
          *(vImagePixelCount *)((char *)&buf.height + 6) = (vImagePixelCount)v13;
          _os_log_impl(&dword_1B88A2000, v26, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not create pixelbuffer", (uint8_t *)&buf, 0x16u);
        }
      }
      CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
      buf.data = CVPixelBufferGetBaseAddress(pixelBufferOut);
      buf.height = CVPixelBufferGetHeight(pixelBufferOut);
      buf.width = CVPixelBufferGetWidth(pixelBufferOut);
      buf.rowBytes = CVPixelBufferGetBytesPerRow(pixelBufferOut);
      if (vImageOverwriteChannelsWithScalar_Planar8(0xFFu, &buf, 0))
      {
        v29 = _ARLogGeneral_1();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          v30 = (objc_class *)objc_opt_class();
          v31 = NSStringFromClass(v30);
          *(_DWORD *)v59 = 138543618;
          *(void *)&v59[4] = v31;
          __int16 v60 = 2048;
          v61 = v13;
          _os_log_impl(&dword_1B88A2000, v29, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not fill buffer", v59, 0x16u);
        }
      }
      CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
    }
    *(void *)v59 = 0;
    if (ARCreatePixelBufferWithPaddingToFillMinimumDimension(pixelBuffer, 0x64uLL, 0, (__CVBuffer **)v59))
    {
      v32 = _ARLogGeneral_1();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v33 = (objc_class *)objc_opt_class();
        v34 = NSStringFromClass(v33);
        LODWORD(buf.data) = 138543618;
        *(void **)((char *)&buf.data + 4) = v34;
        WORD2(buf.height) = 2048;
        *(vImagePixelCount *)((char *)&buf.height + 6) = (vImagePixelCount)v13;
        _os_log_impl(&dword_1B88A2000, v32, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not add padding to pixel buffer", (uint8_t *)&buf, 0x16u);
      }
    }
    else
    {
      CVPixelBufferRelease(pixelBuffer);
      CVPixelBufferRef pixelBuffer = *(CVPixelBufferRef *)v59;
    }
    if (pixelBufferOut)
    {
      v55 = 0;
      if (ARCreatePixelBufferWithPaddingToFillMinimumDimension(pixelBufferOut, 0x64uLL, 0, &v55))
      {
        v35 = _ARLogGeneral_1();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          v36 = (objc_class *)objc_opt_class();
          v37 = NSStringFromClass(v36);
          LODWORD(buf.data) = 138543618;
          *(void **)((char *)&buf.data + 4) = v37;
          WORD2(buf.height) = 2048;
          *(vImagePixelCount *)((char *)&buf.height + 6) = (vImagePixelCount)v13;
          _os_log_impl(&dword_1B88A2000, v35, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not add padding to alpha mask", (uint8_t *)&buf, 0x16u);
        }
      }
      else
      {
        CVPixelBufferRelease(pixelBufferOut);
        CVPixelBufferRef pixelBufferOut = v55;
      }
    }
    goto LABEL_44;
  }
  if (v19) {
    goto LABEL_23;
  }
LABEL_44:
  if (ARCorrectCVPixelBufferOrientation(pixelBuffer, a4, &v13->_pixelBuffer))
  {
    v38 = _ARLogGeneral_1();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v39 = (objc_class *)objc_opt_class();
      v40 = NSStringFromClass(v39);
      LODWORD(buf.data) = 138543618;
      *(void **)((char *)&buf.data + 4) = v40;
      WORD2(buf.height) = 2048;
      *(vImagePixelCount *)((char *)&buf.height + 6) = (vImagePixelCount)v13;
      _os_log_impl(&dword_1B88A2000, v38, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not correct orientation of pixelbuffer", (uint8_t *)&buf, 0x16u);
    }
  }
  if (pixelBufferOut && ARCorrectCVPixelBufferOrientation(pixelBufferOut, a4, &v13->_alphaMask))
  {
    v41 = _ARLogGeneral_1();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      v42 = (objc_class *)objc_opt_class();
      v43 = NSStringFromClass(v42);
      LODWORD(buf.data) = 138543618;
      *(void **)((char *)&buf.data + 4) = v43;
      WORD2(buf.height) = 2048;
      *(vImagePixelCount *)((char *)&buf.height + 6) = (vImagePixelCount)v13;
      _os_log_impl(&dword_1B88A2000, v41, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not correct orientation of alpha mask", (uint8_t *)&buf, 0x16u);
    }
  }
  CVPixelBufferRelease(pixelBuffer);
  CVPixelBufferRelease(pixelBufferOut);
  [v12 extent];
  v13->_physicalSize.width = a5;
  v13->_physicalSize.height = v45 / v44 * a5;
  uint64_t v46 = objc_msgSend(MEMORY[0x1E4F29128], "ar_UUIDWithCVPixelBuffer:", -[ARReferenceImage pixelBuffer](v13, "pixelBuffer"));
  identifier = v13->_identifier;
  v13->_identifier = (NSUUID *)v46;

  v13->_estimatedQuality = -1.0;
  v48 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v49 = dispatch_queue_create("com.apple.arkit.arreference.verificationqueue", v48);
  verificationQueue = v13->_verificationQueue;
  v13->_verificationQueue = (OS_dispatch_queue *)v49;

  dispatch_semaphore_t v51 = dispatch_semaphore_create(1);
  verificationQueueSemaphore = v13->_verificationQueueSemaphore;
  v13->_verificationQueueSemaphore = (OS_dispatch_semaphore *)v51;

  resourceGroupName = v13->_resourceGroupName;
  v13->_resourceGroupName = 0;

LABEL_54:
  return v13;
}

- (ARReferenceImage)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ARReferenceImage;
  uint64_t v6 = [(ARReferenceImage *)&v9 init];
  BOOL v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_identifier, a3);
  }

  return v7;
}

+ (id)referenceImagesInGroupNamed:(id)a3 catalog:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  id v5 = objc_msgSend(a4, "namedRecognitionGroupWithName:");
  if (v5)
  {
    id v21 = (id)objc_opt_new();
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v6 = [v5 namedRecognitionImageImageList];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v12 = [v5 recognitionImageWithName:v11];
            v13 = v12;
            if (v12 && [v12 image])
            {
              if (objc_opt_respondsToSelector())
              {
                BOOL v14 = [v13 valueForKey:@"exifOrientation"];
                uint64_t v15 = [v14 intValue];
              }
              else
              {
                uint64_t v15 = 1;
              }
              v17 = [ARReferenceImage alloc];
              uint64_t v18 = [v13 image];
              [v13 physicalSizeInMeters];
              v16 = -[ARReferenceImage initWithCGImage:orientation:physicalWidth:addPadding:](v17, "initWithCGImage:orientation:physicalWidth:addPadding:", v18, v15, 1);
              BOOL v19 = [v13 name];
              [v16 setName:v19];

              [v16 setResourceGroupName:v22];
              [v21 addObject:v16];
            }
            else
            {
              v16 = _ARLogGeneral_1();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)vImage_Buffer buf = 0;
                _os_log_impl(&dword_1B88A2000, v16, OS_LOG_TYPE_ERROR, "Invalid reference image in catalog", buf, 2u);
              }
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v8);
    }
  }
  else
  {
    uint64_t v6 = _ARLogGeneral_1();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)vImage_Buffer buf = 138543362;
      id v29 = v22;
      _os_log_impl(&dword_1B88A2000, v6, OS_LOG_TYPE_ERROR, "No resource group with name \"%{public}@\" found", buf, 0xCu);
    }
    id v21 = 0;
  }

  return v21;
}

+ (NSSet)referenceImagesInGroupNamed:(NSString *)name bundle:(NSBundle *)bundle
{
  id v5 = bundle;
  uint64_t v6 = name;
  uint64_t v7 = [(id)objc_opt_class() referenceImagesInGroupNamed:v6 catalogName:@"Assets" bundle:v5];

  return (NSSet *)v7;
}

+ (id)referenceImagesInGroupNamed:(id)a3 catalogName:(id)a4 bundle:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v15 = 0;
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F5E048]) initWithName:v8 fromBundle:v9 error:&v15];
  id v11 = v15;
  if (v11)
  {
    id v12 = _ARLogGeneral_1();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)vImage_Buffer buf = 138543874;
      id v17 = v8;
      __int16 v18 = 2114;
      id v19 = v9;
      __int16 v20 = 2112;
      id v21 = v11;
      _os_log_impl(&dword_1B88A2000, v12, OS_LOG_TYPE_ERROR, "Error while opening catalog named \"%{public}@\" in bundle \"%{public}@\": %@", buf, 0x20u);
    }

    v13 = 0;
  }
  else
  {
    v13 = [(id)objc_opt_class() referenceImagesInGroupNamed:v7 catalog:v10];
  }

  return v13;
}

+ (id)referenceImagesInGroupNamed:(id)a3 catalogURL:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v12 = 0;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F5E048]) initWithURL:v6 error:&v12];
  id v8 = v12;
  if (v8)
  {
    id v9 = _ARLogGeneral_1();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)vImage_Buffer buf = 138543874;
      id v14 = v5;
      __int16 v15 = 2114;
      id v16 = v6;
      __int16 v17 = 2112;
      id v18 = v8;
      _os_log_impl(&dword_1B88A2000, v9, OS_LOG_TYPE_ERROR, "Error while opening catalog named \"%{public}@\" from URL \"%{public}@\": %@", buf, 0x20u);
    }

    v10 = 0;
  }
  else
  {
    v10 = [(id)objc_opt_class() referenceImagesInGroupNamed:v5 catalog:v7];
  }

  return v10;
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_pixelBuffer);
  CVPixelBufferRelease(self->_alphaMask);
  v3.receiver = self;
  v3.super_class = (Class)ARReferenceImage;
  [(ARReferenceImage *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [(ARReferenceImage *)self name];
  [(ARReferenceImage *)self physicalSize];
  uint64_t v8 = v7;
  [(ARReferenceImage *)self physicalSize];
  v10 = [v3 stringWithFormat:@"<%@: %p name=\"%@\" physicalSize=(%.03f, %.03f)>", v5, self, v6, v8, v9];

  return v10;
}

- (id)shortDebugDescription
{
  objc_super v3 = NSString;
  v4 = [(ARReferenceImage *)self name];
  [(ARReferenceImage *)self physicalSize];
  uint64_t v6 = v5;
  [(ARReferenceImage *)self physicalSize];
  uint64_t v8 = [v3 stringWithFormat:@"<name=\"%@\", physicalSize=(%.03f, %.03f)>", v4, v6, v7];

  return v8;
}

- (CGSize)imageSize
{
  CVPixelBufferRef pixelBuffer = self->_pixelBuffer;
  if (pixelBuffer)
  {
    double Width = (double)CVPixelBufferGetWidth(self->_pixelBuffer);
    double Height = (double)CVPixelBufferGetHeight(pixelBuffer);
  }
  else
  {
    double Width = *MEMORY[0x1E4F1DB30];
    double Height = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  double v5 = Width;
  result.height = Height;
  result.width = v5;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [v5 identifier];
    uint64_t v7 = [(ARReferenceImage *)self identifier];
    if ([v6 isEqual:v7])
    {
      [v5 physicalSize];
      double v9 = v8;
      double v11 = v10;
      [(ARReferenceImage *)self physicalSize];
      BOOL v14 = v11 == v13 && v9 == v12;
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  return [(NSUUID *)self->_identifier hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  [(ARReferenceImage *)self physicalSize];
  v5[10] = v6;
  v5[11] = v7;
  double v8 = [(ARReferenceImage *)self name];
  uint64_t v9 = [v8 copyWithZone:a3];
  double v10 = (void *)v5[3];
  v5[3] = v9;

  v5[7] = CVPixelBufferRetain(self->_pixelBuffer);
  v5[8] = CVPixelBufferRetain(self->_alphaMask);
  double v11 = [(ARReferenceImage *)self identifier];
  uint64_t v12 = [v11 copyWithZone:a3];
  double v13 = (void *)v5[9];
  v5[9] = v12;

  [(ARReferenceImage *)self estimatedQuality];
  v5[5] = v14;
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  [(ARReferenceImage *)self physicalSize];
  objc_msgSend(v7, "encodeSize:forKey:", @"physicalSize");
  id v4 = [(ARReferenceImage *)self name];
  [v7 encodeObject:v4 forKey:@"name"];

  id v5 = [(ARReferenceImage *)self identifier];
  [v7 encodeObject:v5 forKey:@"identifier"];

  [(ARReferenceImage *)self estimatedQuality];
  objc_msgSend(v7, "encodeDouble:forKey:", @"estimatedQuality");
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1E050]), "initWithCVPixelBuffer:", -[ARReferenceImage pixelBuffer](self, "pixelBuffer"));
  if (v6) {
    [v7 encodeObject:v6 forKey:@"pixelbuffer"];
  }
}

- (ARReferenceImage)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ARReferenceImage;
  id v5 = [(ARReferenceImage *)&v15 init];
  if (v5)
  {
    [v4 decodeSizeForKey:@"physicalSize"];
    v5->_physicalSize.width = v6;
    v5->_physicalSize.height = v7;
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v10;

    [v4 decodeDoubleForKey:@"estimatedQuality"];
    v5->_estimatedQuality = v12;
    double v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pixelbuffer"];
    v5->_CVPixelBufferRef pixelBuffer = ARPixelBufferWithCIImage(v13);
  }
  return v5;
}

- (void)setResourceGroupName:(id)a3
{
}

- (void)validateWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  id v5 = [(ARReferenceImage *)self cachedVerificationError];

  if (v5)
  {
    if (v4)
    {
      CGFloat v6 = [(ARReferenceImage *)self cachedVerificationError];
      CGFloat v7 = [v6 error];
      v4[2](v4, v7);
    }
  }
  else
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_verificationQueueSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    verificationQueue = self->_verificationQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __50__ARReferenceImage_validateWithCompletionHandler___block_invoke;
    v9[3] = &unk_1E61852B0;
    v9[4] = self;
    uint64_t v10 = v4;
    dispatch_async(verificationQueue, v9);
  }
}

void __50__ARReferenceImage_validateWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = objc_opt_new();
  objc_super v3 = objc_opt_new();
  uint64_t v4 = +[ARODTHandleManager verifyReferenceImage:*(void *)(a1 + 32)];
  id v15 = v2;
  uint64_t v16 = 0;
  uint64_t v5 = *(void *)(a1 + 32);
  id v14 = v3;
  +[ARODTHandleManager accumulateReferenceImageErrorsForResult:v4 refImage:v5 objectID:0 pReferenceImageMap:&v15 pFailedReferenceImageNames:&v14 pUserErrorType:&v16];
  id v6 = v15;

  id v7 = v14;
  uint64_t v8 = objc_opt_new();
  [*(id *)(a1 + 32) setCachedVerificationError:v8];

  uint64_t v9 = +[ARODTHandleManager handleAccumulatedErrorType:v16 failedReferenceImageNames:v7];
  uint64_t v10 = [*(id *)(a1 + 32) cachedVerificationError];
  [v10 setError:v9];

  uint64_t v11 = *(void *)(a1 + 40);
  if (v11)
  {
    double v12 = [*(id *)(a1 + 32) cachedVerificationError];
    double v13 = [v12 error];
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v13);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 16));
}

- (void)estimateQualityWithCompletionHandler:(id)a3
{
  if (a3)
  {
    objc_super v3 = (void (**)(id, void *, double))a3;
    id v8 = (id)objc_opt_new();
    uint64_t v4 = ARKitCoreBundle();
    uint64_t v5 = [v4 localizedStringForKey:@"Image detection quality estimation could not be performed" value:&stru_1F120C8F0 table:@"Localizable_iOS"];
    [v8 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F28568]];

    id v6 = [NSString stringWithFormat:@"SPI has been deprecated."];
    [v8 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F28588]];

    id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.arkit.error" code:1003 userInfo:v8];
    v3[2](v3, v7, -1.0);
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(NSString *)name
{
}

- (CGSize)physicalSize
{
  double width = self->_physicalSize.width;
  double height = self->_physicalSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSString)resourceGroupName
{
  return self->_resourceGroupName;
}

- (double)estimatedQuality
{
  return self->_estimatedQuality;
}

- (void)setEstimatedQuality:(double)a3
{
  self->_estimatedQuality = a3;
}

- (ARReferenceImageCachedError)cachedVerificationError
{
  return (ARReferenceImageCachedError *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCachedVerificationError:(id)a3
{
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (__CVBuffer)alphaMask
{
  return self->_alphaMask;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_cachedVerificationError, 0);
  objc_storeStrong((id *)&self->_resourceGroupName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_verificationQueueSemaphore, 0);
  objc_storeStrong((id *)&self->_verificationQueue, 0);
}

@end