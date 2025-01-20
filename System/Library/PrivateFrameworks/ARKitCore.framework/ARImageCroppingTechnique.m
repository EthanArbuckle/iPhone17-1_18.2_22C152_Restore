@interface ARImageCroppingTechnique
- (ARImageCroppingTechnique)initWithCroppedImageSize:(CGSize)a3;
- (ARImageCroppingTechnique)initWithCroppedImageSize:(CGSize)a3 centerCropToTargetResolution:(BOOL)a4;
- (BOOL)isEqual:(id)a3;
- (CGSize)croppedImageSize;
- (id)processData:(id)a3;
- (unint64_t)requiredSensorDataTypes;
- (void)dealloc;
@end

@implementation ARImageCroppingTechnique

- (ARImageCroppingTechnique)initWithCroppedImageSize:(CGSize)a3 centerCropToTargetResolution:(BOOL)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)ARImageCroppingTechnique;
  v7 = [(ARTechnique *)&v23 init];
  v8 = v7;
  if (!v7)
  {
LABEL_11:
    v16 = v8;
    goto LABEL_12;
  }
  v9 = (uint64_t *)(v7 + 112);
  *((CGFloat *)v7 + 14) = width;
  *((CGFloat *)v7 + 15) = height;
  v7[104] = a4;
  v10 = (CFTypeRef *)(v7 + 56);
  OSStatus v11 = VTPixelTransferSessionCreate(0, (VTPixelTransferSessionRef *)v7 + 7);
  if (!v11)
  {
    v17 = _ARLogTechnique_1();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = (objc_class *)objc_opt_class();
      v19 = NSStringFromClass(v18);
      uint64_t v20 = *v9;
      uint64_t v21 = v8[15];
      *(_DWORD *)buf = 138544130;
      v25 = v19;
      __int16 v26 = 2048;
      v27 = v8;
      __int16 v28 = 2048;
      uint64_t v29 = v20;
      __int16 v30 = 2048;
      uint64_t v31 = v21;
      _os_log_impl(&dword_1B88A2000, v17, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Initialized with crop image size: %f, %f)", buf, 0x2Au);
    }
    goto LABEL_11;
  }
  OSStatus v12 = v11;
  if (*v10) {
    CFRelease(*v10);
  }
  CFTypeRef *v10 = 0;
  v13 = _ARLogTechnique_1();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    *(_DWORD *)buf = 138543874;
    v25 = v15;
    __int16 v26 = 2048;
    v27 = v8;
    __int16 v28 = 1024;
    LODWORD(v29) = v12;
    _os_log_impl(&dword_1B88A2000, v13, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to create pixel transfer session for image cropping: %i", buf, 0x1Cu);
  }
  v16 = 0;
LABEL_12:

  return v16;
}

- (ARImageCroppingTechnique)initWithCroppedImageSize:(CGSize)a3
{
  return -[ARImageCroppingTechnique initWithCroppedImageSize:centerCropToTargetResolution:](self, "initWithCroppedImageSize:centerCropToTargetResolution:", 0, a3.width, a3.height);
}

- (void)dealloc
{
  vtPixelTransferSession = self->_vtPixelTransferSession;
  if (vtPixelTransferSession)
  {
    VTPixelTransferSessionInvalidate(vtPixelTransferSession);
    v4 = self->_vtPixelTransferSession;
    if (v4) {
      CFRelease(v4);
    }
    self->_vtPixelTransferSession = 0;
  }
  croppedPixelBufferPool = self->_croppedPixelBufferPool;
  if (croppedPixelBufferPool)
  {
    CVPixelBufferPoolRelease(croppedPixelBufferPool);
    self->_croppedPixelBufferPool = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)ARImageCroppingTechnique;
  [(ARImageCroppingTechnique *)&v6 dealloc];
}

- (unint64_t)requiredSensorDataTypes
{
  return 1;
}

- (id)processData:(id)a3
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v6 = (ARModifiedImageData *)v4;
  v7 = v6;
  v8 = v6;
  if (isKindOfClass)
  {
    [(ARImageData *)v6 imageResolution];
    double v11 = v9;
    double v12 = v10;
    double width = self->_croppedImageSize.width;
    double height = self->_croppedImageSize.height;
    if (width == *MEMORY[0x1E4F1DB30] && height == *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
      goto LABEL_34;
    }
    if (width == v9 && height == v10) {
      goto LABEL_34;
    }
    CVPixelBufferRef pixelBufferOut = 0;
    croppedPixelBufferPool = self->_croppedPixelBufferPool;
    if (!croppedPixelBufferPool)
    {
      p_cropRect = &self->_cropRect;
      if (self->_isCropToTargetResolution)
      {
        double v25 = ARGetCroppedRegionCenterCrop(v9, v10, width);
      }
      else
      {
        double v55 = width / height;
        if (width / height >= v11 / v10)
        {
          double v57 = v10 - v11 / v55;
          double v26 = v57 * 0.5;
          double v28 = v12 - v57;
          double v25 = 0.0;
          double v27 = v11;
        }
        else
        {
          double v56 = v11 - v10 * v55;
          double v25 = v56 * 0.5;
          double v27 = v11 - v56;
          double v26 = 0.0;
          double v28 = v12;
        }
      }
      p_cropRect->origin.double x = v25;
      self->_cropRect.origin.CGFloat y = v26;
      self->_cropRect.size.double width = v27;
      self->_cropRect.size.double height = v28;
      if (CGRectIsEmpty(*(CGRect *)&v25)
        || ((double v58 = self->_cropRect.size.width, v59 = self->_cropRect.size.height, v58 == v11)
          ? (BOOL v60 = v59 == v12)
          : (BOOL v60 = 0),
            v60))
      {
        uint64_t v20 = _ARLogTechnique_1();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v66 = (objc_class *)objc_opt_class();
          v67 = NSStringFromClass(v66);
          *(_DWORD *)buf = 138543618;
          v83 = v67;
          __int16 v84 = 2048;
          v85 = self;
          _os_log_impl(&dword_1B88A2000, v20, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: The cropped image size must be less than source image size and not zero", buf, 0x16u);
        }
        goto LABEL_33;
      }
      double x = p_cropRect->origin.x;
      CGFloat y = self->_cropRect.origin.y;
      CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(*(CGRect *)(&v58 - 2));
      OSStatus v64 = VTSessionSetProperty(self->_vtPixelTransferSession, (CFStringRef)*MEMORY[0x1E4F45170], DictionaryRepresentation);
      if (DictionaryRepresentation) {
        CFRelease(DictionaryRepresentation);
      }
      if (v64)
      {
        uint64_t v20 = _ARLogTechnique_1();
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          goto LABEL_33;
        }
        v65 = (objc_class *)objc_opt_class();
        v22 = NSStringFromClass(v65);
        *(_DWORD *)buf = 138543874;
        v83 = v22;
        __int16 v84 = 2048;
        v85 = self;
        __int16 v86 = 1024;
        OSStatus v87 = v64;
        objc_super v23 = "%{public}@ <%p>: Unable to initialize pixel transfer session for image cropping: %i";
LABEL_14:
        _os_log_impl(&dword_1B88A2000, v20, OS_LOG_TYPE_ERROR, v23, buf, 0x1Cu);

LABEL_33:
        v68 = [(ARTechnique *)self delegate];
        v69 = ARErrorWithCodeAndUserInfo(151, 0);
        [v68 technique:self didFailWithError:v69];

LABEL_34:
        v8 = v7;
        goto LABEL_35;
      }
      OSType PixelFormatType = CVPixelBufferGetPixelFormatType([(ARImageData *)v7 pixelBuffer]);
      OSStatus v72 = ARRecreatePixelBufferPoolOnConfigurationChanges(&self->_croppedPixelBufferPool, PixelFormatType, self->_cropRect.size.width, self->_cropRect.size.height);
      if (v72)
      {
        OSStatus v73 = v72;
        uint64_t v20 = _ARLogTechnique_1();
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          goto LABEL_33;
        }
        v74 = (objc_class *)objc_opt_class();
        v22 = NSStringFromClass(v74);
        *(_DWORD *)buf = 138543874;
        v83 = v22;
        __int16 v84 = 2048;
        v85 = self;
        __int16 v86 = 1024;
        OSStatus v87 = v73;
        objc_super v23 = "%{public}@ <%p>: Unable to create pixel buffer pool for cropping: %i";
        goto LABEL_14;
      }
      croppedPixelBufferPool = self->_croppedPixelBufferPool;
    }
    CVReturn v18 = CVPixelBufferPoolCreatePixelBuffer(0, croppedPixelBufferPool, &pixelBufferOut);
    if (!v18)
    {
      vtPixelTransferSession = self->_vtPixelTransferSession;
      __int16 v30 = [(ARImageData *)v7 pixelBuffer];
      VTPixelTransferSessionTransferImage(vtPixelTransferSession, v30, pixelBufferOut);
      v8 = [[ARModifiedImageData alloc] initWithImageData:v7];
      [(ARImageData *)v8 setPixelBuffer:pixelBufferOut];
      [(ARImageData *)v7 cameraIntrinsics];
      double v76 = v32;
      float v77 = v31;
      double v75 = v33;
      [(ARImageData *)v7 imageResolution];
      double v35 = v34;
      double v37 = v36;
      [(ARImageData *)v8 imageResolution];
      *(float *)&double v40 = ARAdjustIntrinsicsForViewportSize(v77, v76, v75, v35, v37, v38, v39);
      [(ARImageData *)v8 setCameraIntrinsics:v40];
      v41 = &self->_cropRect;
      double v42 = v41->origin.x;
      [(ARImageData *)v7 imageResolution];
      double v43 = v41->origin.y;
      double v45 = v42 / v44;
      [(ARImageData *)v7 imageResolution];
      double v46 = v41->size.width;
      double v48 = v43 / v47;
      [(ARImageData *)v7 imageResolution];
      double v49 = v41->size.height;
      double v51 = v46 / v50;
      [(ARImageData *)v7 imageResolution];
      v80 = @"croppedRect";
      *(double *)v78 = v45;
      *(double *)&v78[1] = v48;
      *(double *)&v78[2] = v51;
      *(double *)&v78[3] = v49 / v52;
      v53 = [MEMORY[0x1E4F29238] valueWithBytes:v78 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
      v81 = v53;
      v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v81 forKeys:&v80 count:1];
      [(ARModifiedImageData *)v8 setMetaData:v54];

      CVPixelBufferRelease(pixelBufferOut);
LABEL_35:

      goto LABEL_36;
    }
    CVReturn v19 = v18;
    uint64_t v20 = _ARLogTechnique_1();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      goto LABEL_33;
    }
    uint64_t v21 = (objc_class *)objc_opt_class();
    v22 = NSStringFromClass(v21);
    *(_DWORD *)buf = 138543874;
    v83 = v22;
    __int16 v84 = 2048;
    v85 = self;
    __int16 v86 = 1024;
    OSStatus v87 = v19;
    objc_super v23 = "%{public}@ <%p>: Unable to create pixel buffer for cropping: %i";
    goto LABEL_14;
  }
LABEL_36:

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ARImageCroppingTechnique;
  if ([(ARTechnique *)&v16 isEqual:v4])
  {
    id v5 = v4;
    [(ARImageCroppingTechnique *)self croppedImageSize];
    double v7 = v6;
    double v9 = v8;
    [v5 croppedImageSize];
    double v11 = v10;
    double v13 = v12;

    BOOL v14 = v9 == v13 && v7 == v11;
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (CGSize)croppedImageSize
{
  double width = self->_croppedImageSize.width;
  double height = self->_croppedImageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

@end