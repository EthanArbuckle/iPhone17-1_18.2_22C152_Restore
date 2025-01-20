@interface ARImageRotationTechnique
- (ARImageRotationTechnique)initWithRotation:(int64_t)a3 mirror:(int64_t)a4;
- (BOOL)isEqual:(id)a3;
- (id)_fullDescription;
- (id)processData:(id)a3;
- (int)_rotateAccelerate:(__CVBuffer *)a3 pOutputBuffer:(__CVBuffer *)a4;
- (int64_t)mirrorMode;
- (int64_t)rotationAngle;
- (unint64_t)requiredSensorDataTypes;
- (void)dealloc;
@end

@implementation ARImageRotationTechnique

- (ARImageRotationTechnique)initWithRotation:(int64_t)a3 mirror:(int64_t)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)ARImageRotationTechnique;
  v6 = [(ARTechnique *)&v20 init];
  p_isa = (VTSessionRef *)&v6->super.super.isa;
  if (!v6) {
    goto LABEL_16;
  }
  v6->_vtPixelRotationSession = 0;
  v6->_rotationAngle = a3;
  v6->_mirrorMode = a4;
  OSStatus v8 = VTPixelRotationSessionCreate(0, &v6->_vtPixelRotationSession);
  if (!v8)
  {
    v10 = [MEMORY[0x1E4F1CA60] dictionary];
    [v10 setObject:kVTRotationFromARRotationAngle(a3) forKeyedSubscript:*MEMORY[0x1E4F450C0]];
    if (a4 == 1)
    {
      v13 = (void *)MEMORY[0x1E4F45098];
    }
    else
    {
      if (a4 != 2)
      {
LABEL_10:
        OSStatus v14 = VTSessionSetProperties(p_isa[7], (CFDictionaryRef)v10);
        if (v14)
        {
          OSStatus v15 = v14;
          v12 = _ARLogTechnique_6();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            v16 = (objc_class *)objc_opt_class();
            v17 = NSStringFromClass(v16);
            *(_DWORD *)buf = 138543874;
            v22 = v17;
            __int16 v23 = 2048;
            v24 = p_isa;
            __int16 v25 = 1024;
            OSStatus v26 = v15;
            _os_log_impl(&dword_1B88A2000, v12, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Configuration of VTPixelRotationSession failed with error %d", buf, 0x1Cu);
          }
          goto LABEL_13;
        }

LABEL_16:
        v18 = p_isa;
        goto LABEL_17;
      }
      v13 = (void *)MEMORY[0x1E4F450A0];
    }
    [v10 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*v13];
    goto LABEL_10;
  }
  OSStatus v9 = v8;
  v10 = _ARLogTechnique_6();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    *(_DWORD *)buf = 138543874;
    v22 = v12;
    __int16 v23 = 2048;
    v24 = p_isa;
    __int16 v25 = 1024;
    OSStatus v26 = v9;
    _os_log_impl(&dword_1B88A2000, v10, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Creation of VTPixelRotationSession failed with error %d", buf, 0x1Cu);
LABEL_13:
  }
  v18 = 0;
LABEL_17:

  return v18;
}

- (void)dealloc
{
  vtPixelRotationSession = self->_vtPixelRotationSession;
  if (vtPixelRotationSession)
  {
    VTPixelRotationSessionInvalidate(vtPixelRotationSession);
    CFRelease(self->_vtPixelRotationSession);
    self->_vtPixelRotationSession = 0;
  }
  bufferPool = self->_bufferPool;
  if (bufferPool)
  {
    CVPixelBufferPoolRelease(bufferPool);
    self->_bufferPool = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)ARImageRotationTechnique;
  [(ARImageRotationTechnique *)&v5 dealloc];
}

- (unint64_t)requiredSensorDataTypes
{
  return 1;
}

- (int)_rotateAccelerate:(__CVBuffer *)a3 pOutputBuffer:(__CVBuffer *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (!a3 || !a4)
  {
    v11 = _ARLogTechnique_6();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v12);
      LODWORD(buf.data) = 138543618;
      *(void **)((char *)&buf.data + 4) = v13;
      WORD2(buf.height) = 2048;
      *(vImagePixelCount *)((char *)&buf.height + 6) = (vImagePixelCount)self;
      OSStatus v14 = "%{public}@ <%p>: Arguments can't be nil";
LABEL_28:
      _os_log_impl(&dword_1B88A2000, v11, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&buf, 0x16u);
    }
LABEL_29:

    return -1;
  }
  signed int PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  int v8 = PixelFormatType;
  int v9 = 1;
  if (PixelFormatType <= 1278226533)
  {
    if (PixelFormatType <= 1111970368)
    {
      if (PixelFormatType == 32) {
        goto LABEL_20;
      }
      int v10 = 1094862674;
      goto LABEL_12;
    }
    if (PixelFormatType == 1111970369) {
      goto LABEL_20;
    }
    int v15 = 1278226488;
    goto LABEL_18;
  }
  if (PixelFormatType > 1380410944)
  {
    if (PixelFormatType != 1380410945)
    {
      int v15 = 1717855600;
LABEL_18:
      if (PixelFormatType != v15)
      {
LABEL_42:
        v11 = _ARLogTechnique_6();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          goto LABEL_29;
        }
        __int16 v23 = (objc_class *)objc_opt_class();
        v13 = NSStringFromClass(v23);
        LODWORD(buf.data) = 138543618;
        *(void **)((char *)&buf.data + 4) = v13;
        WORD2(buf.height) = 2048;
        *(vImagePixelCount *)((char *)&buf.height + 6) = (vImagePixelCount)self;
        OSStatus v14 = "%{public}@ <%p>: Accelerate currently only supports kCVPixelFormatType_32BGRA, kCVPixelFormatType_32ARGB f"
              "ormats or kCVPixelFormatType_128RGBAFloat, kCVPixelFormatType_DepthFloat32, kCVPixelFormatType_OneComponen"
              "t32Float and kCVPixelFormatType_OneComponent8";
        goto LABEL_28;
      }
    }
LABEL_19:
    int v9 = 0;
    goto LABEL_20;
  }
  if (PixelFormatType == 1278226534) {
    goto LABEL_19;
  }
  int v10 = 1380401729;
LABEL_12:
  if (PixelFormatType != v10) {
    goto LABEL_42;
  }
LABEL_20:
  OSType v16 = CVPixelBufferGetPixelFormatType(a3);
  if (v16 != CVPixelBufferGetPixelFormatType(*a4))
  {
    v11 = _ARLogTechnique_6();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v19 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v19);
      LODWORD(buf.data) = 138543618;
      *(void **)((char *)&buf.data + 4) = v13;
      WORD2(buf.height) = 2048;
      *(vImagePixelCount *)((char *)&buf.height + 6) = (vImagePixelCount)self;
      OSStatus v14 = "%{public}@ <%p>: Input and output pixel buffer format need to match.";
      goto LABEL_28;
    }
    goto LABEL_29;
  }
  CVPixelBufferLockBaseAddress(a3, 0);
  CVPixelBufferLockBaseAddress(*a4, 0);
  memset(&buf, 0, sizeof(buf));
  ARWrapCVPixelBufferVImage(a3, &buf.data);
  memset(&v24, 0, sizeof(v24));
  ARWrapCVPixelBufferVImage(*a4, &v24.data);
  int64_t v17 = [(ARImageRotationTechnique *)self rotationAngle];
  if (v17 == 180)
  {
    uint8_t v18 = 2;
    if (v9) {
      goto LABEL_38;
    }
    goto LABEL_33;
  }
  if (v17 == 90)
  {
    uint8_t v18 = 3;
    if (!v9) {
      goto LABEL_33;
    }
    goto LABEL_38;
  }
  if (v17 != -90)
  {
    uint8_t v18 = 0;
    if (!v9) {
      goto LABEL_33;
    }
LABEL_38:
    vImage_Error v22 = vImageRotate90_ARGB8888(&buf, &v24, v18, _rotateAccelerate_pOutputBuffer___bgColor, 0x10u);
LABEL_46:
    uint64_t v21 = v22;
    goto LABEL_47;
  }
  uint8_t v18 = 1;
  if (v9) {
    goto LABEL_38;
  }
LABEL_33:
  uint64_t v21 = -21778;
  if (v8 > 1380410944)
  {
    if (v8 != 1717855600)
    {
      if (v8 != 1380410945) {
        goto LABEL_47;
      }
      vImage_Error v22 = vImageRotate90_ARGBFFFF(&buf, &v24, v18, _rotateAccelerate_pOutputBuffer___bgColor_3, 0x10u);
      goto LABEL_46;
    }
LABEL_44:
    vImage_Error v22 = vImageRotate90_PlanarF(&buf, &v24, v18, 0.0, 0x10u);
    goto LABEL_46;
  }
  if (v8 == 1278226488)
  {
    vImage_Error v22 = vImageRotate90_Planar8(&buf, &v24, v18, 0, 0x10u);
    goto LABEL_46;
  }
  if (v8 == 1278226534) {
    goto LABEL_44;
  }
LABEL_47:
  CVPixelBufferUnlockBaseAddress(*a4, 0);
  CVPixelBufferUnlockBaseAddress(a3, 0);
  if (v21) {
    return -1;
  }
  else {
    return 0;
  }
}

- (id)processData:(id)a3
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = v4;
  if (*(_OWORD *)&self->_rotationAngle == 0)
  {
    id v23 = v4;
    goto LABEL_53;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = v5;
  id v23 = v7;
  if (isKindOfClass)
  {
    unsigned int Width = CVPixelBufferGetWidth((CVPixelBufferRef)[v7 pixelBuffer]);
    unsigned int Height = CVPixelBufferGetHeight((CVPixelBufferRef)[v23 pixelBuffer]);
    int64_t rotationAngle = self->_rotationAngle;
    unsigned int v11 = Width;
    if (rotationAngle)
    {
      unsigned int v11 = Width;
      if (rotationAngle != 180) {
        unsigned int v11 = Height;
      }
    }
    if (rotationAngle == 180) {
      unsigned int v12 = Height;
    }
    else {
      unsigned int v12 = Width;
    }
    if (rotationAngle) {
      unsigned int v13 = v12;
    }
    else {
      unsigned int v13 = Height;
    }
    p_bufferPool = &self->_bufferPool;
    bufferPool = self->_bufferPool;
    if (bufferPool)
    {
      v58 = v5;
      OSType v16 = CVPixelBufferPoolGetPixelBufferAttributes(bufferPool);
      int64_t v17 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F24E10]];
      uint8_t v18 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F24D08]];
      unsigned int v19 = v11;
      if ([v17 integerValue] == v11 && objc_msgSend(v18, "integerValue") == v13)
      {
        unsigned int v20 = v13;
        char v21 = 0;
      }
      else
      {
        unsigned int v20 = v13;
        char v21 = 1;
      }

      vImage_Error v22 = *p_bufferPool;
      if ((v21 & 1) == 0 && v22)
      {
        unsigned int v13 = v20;
        unsigned int v11 = v19;
        objc_super v5 = v58;
        goto LABEL_27;
      }
      unsigned int v13 = v20;
      unsigned int v11 = v19;
      objc_super v5 = v58;
      if (v22)
      {
        CVPixelBufferPoolRelease(*p_bufferPool);
        *p_bufferPool = 0;
      }
    }
    OSType PixelFormatType = CVPixelBufferGetPixelFormatType((CVPixelBufferRef)[v23 pixelBuffer]);
    unsigned int New = ar_pixelBufferPoolCreateNew(v11, v13, PixelFormatType, &self->_bufferPool);
    if (New)
    {
      unsigned int v26 = New;
      uint64_t v27 = _ARLogTechnique_6();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v28 = (objc_class *)objc_opt_class();
        v29 = NSStringFromClass(v28);
        *(_DWORD *)vImage_Buffer buf = 138543874;
        v61 = v29;
        __int16 v62 = 2048;
        v63 = self;
        __int16 v64 = 1024;
        unsigned int v65 = v26;
        v30 = "%{public}@ <%p>: Creation of CVPixelBufferPool failed with error %d";
LABEL_30:
        _os_log_impl(&dword_1B88A2000, v27, OS_LOG_TYPE_ERROR, v30, buf, 0x1Cu);
      }
LABEL_31:

      v34 = [(ARTechnique *)self delegate];
      v35 = ARErrorWithCodeAndUserInfo(151, 0);
      [v34 technique:self didFailWithError:v35];

      id v36 = v23;
LABEL_52:

      id v23 = v36;
      goto LABEL_53;
    }
    vImage_Error v22 = *p_bufferPool;
LABEL_27:
    CVPixelBufferRef pixelBufferOut = 0;
    CVReturn v31 = CVPixelBufferPoolCreatePixelBuffer(0, v22, &pixelBufferOut);
    if (v31)
    {
      CVReturn v32 = v31;
      uint64_t v27 = _ARLogTechnique_6();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v33 = (objc_class *)objc_opt_class();
        v29 = NSStringFromClass(v33);
        *(_DWORD *)vImage_Buffer buf = 138543874;
        v61 = v29;
        __int16 v62 = 2048;
        v63 = self;
        __int16 v64 = 1024;
        unsigned int v65 = v32;
        v30 = "%{public}@ <%p>: Could not create pixel buffer for rotation. (%i)";
        goto LABEL_30;
      }
      goto LABEL_31;
    }
    signed int v37 = CVPixelBufferGetPixelFormatType((CVPixelBufferRef)[v23 pixelBuffer]);
    signed int v38 = v37;
    if (v37 > 1111970368)
    {
      if (v37 == 1111970369) {
        goto LABEL_38;
      }
      int v39 = 1380401729;
    }
    else
    {
      if (v37 == 32) {
        goto LABEL_38;
      }
      int v39 = 1094862674;
    }
    if (v37 != v39)
    {
      id v42 = v23;
      if (v38 > 1380410944)
      {
        if (v38 == 1380410945) {
          goto LABEL_39;
        }
        int v57 = 1717855600;
      }
      else
      {
        if (v38 == 1278226488) {
          goto LABEL_39;
        }
        int v57 = 1278226534;
      }
      if (v38 != v57)
      {
        vtPixelRotationSession = self->_vtPixelRotationSession;
        goto LABEL_41;
      }
LABEL_39:
      if (!-[ARImageRotationTechnique _rotateAccelerate:pOutputBuffer:](self, "_rotateAccelerate:pOutputBuffer:", [v23 pixelBuffer], &pixelBufferOut))goto LABEL_45; {
      vtPixelRotationSession = self->_vtPixelRotationSession;
      }
      id v42 = v23;
LABEL_41:
      v43 = (__CVBuffer *)[v42 pixelBuffer];
      OSStatus v44 = VTPixelRotationSessionRotateImage(vtPixelRotationSession, v43, pixelBufferOut);
      if (v44)
      {
        v45 = _ARLogTechnique_6();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          v46 = (objc_class *)objc_opt_class();
          v47 = NSStringFromClass(v46);
          v48 = AROSTypeToString(v38);
          *(_DWORD *)vImage_Buffer buf = 138544642;
          v61 = v47;
          __int16 v62 = 2048;
          v63 = self;
          __int16 v64 = 1024;
          unsigned int v65 = v11;
          __int16 v66 = 1024;
          unsigned int v67 = v13;
          __int16 v68 = 2112;
          v69 = v48;
          __int16 v70 = 1024;
          OSStatus v71 = v44;
          _os_log_impl(&dword_1B88A2000, v45, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not transform image with size %ix%i and format %@. (%i)", buf, 0x32u);
        }
        id v49 = [(ARTechnique *)self delegate];
        v50 = ARErrorWithCodeAndUserInfo(151, 0);
        [v49 technique:self didFailWithError:v50];
        goto LABEL_50;
      }
LABEL_45:
      v51 = [[ARModifiedImageData alloc] initWithImageData:v23];
      id v49 = v51;
      if (v51)
      {
        [(ARImageData *)v51 setPixelBuffer:pixelBufferOut];
        [v23 cameraIntrinsics];
        [v23 imageResolution];
        ARAdjustIntrincisForOrientation();
        [v49 imageResolution];
        ARAdjustIntrincisForMirroring();
        objc_msgSend(v49, "setCameraIntrinsics:");
        [v49 setMirrored:self->_mirrorMode != 0];
        id v49 = v49;
        v50 = v23;
        id v36 = v49;
LABEL_51:

        CVPixelBufferRelease(pixelBufferOut);
        goto LABEL_52;
      }
      v52 = _ARLogTechnique_6();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        v53 = (objc_class *)objc_opt_class();
        v54 = NSStringFromClass(v53);
        *(_DWORD *)vImage_Buffer buf = 138543618;
        v61 = v54;
        __int16 v62 = 2048;
        v63 = self;
        _os_log_impl(&dword_1B88A2000, v52, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not allocated image.", buf, 0x16u);
      }
      v50 = [(ARTechnique *)self delegate];
      v55 = ARErrorWithCodeAndUserInfo(151, 0);
      [v50 technique:self didFailWithError:v55];

LABEL_50:
      id v36 = v23;
      goto LABEL_51;
    }
LABEL_38:
    id v40 = v23;
    goto LABEL_39;
  }
LABEL_53:

  return v23;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && v4[10] == self->_mirrorMode && v4[9] == self->_rotationAngle;

  return v5;
}

- (id)_fullDescription
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v8.receiver = self;
  v8.super_class = (Class)ARImageRotationTechnique;
  id v4 = [(ARTechnique *)&v8 _fullDescription];
  BOOL v5 = [v3 stringWithFormat:@"%@\n", v4];

  objc_msgSend(v5, "appendFormat:", @"Rotation (%li)\n", self->_rotationAngle);
  objc_msgSend(v5, "appendFormat:", @"Mirror (%ld)\n", self->_mirrorMode);
  v6 = CVPixelBufferPoolGetPixelBufferAttributes(self->_bufferPool);
  [v5 appendFormat:@"OutputPixelBufferPool attr: %@\n", v6];

  return v5;
}

- (int64_t)rotationAngle
{
  return self->_rotationAngle;
}

- (int64_t)mirrorMode
{
  return self->_mirrorMode;
}

@end