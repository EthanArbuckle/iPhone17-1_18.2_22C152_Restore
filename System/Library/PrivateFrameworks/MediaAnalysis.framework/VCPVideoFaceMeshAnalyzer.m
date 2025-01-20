@interface VCPVideoFaceMeshAnalyzer
- (BOOL)bufferRotated;
- (BOOL)isTracked;
- (BOOL)updateFocalLengthInPixels:(float)a3;
- (NSDictionary)blendShapes;
- (VCPVideoFaceMeshAnalyzer)initWithFocalLengthInPixels:(float)a3 offline:(BOOL)a4 isFastMode:(BOOL)a5;
- (__n128)pose;
- (const)landmarks;
- (int)analyzeFrame:(__CVBuffer *)a3 withFaceRect:(CGRect)a4 withRotation:(int)a5 withTimestamp:(id *)a6;
- (int)checkResolutionChange:(__CVBuffer *)a3 withRotation:(int)a4;
- (int)setFrame:(__CVBuffer *)a3;
- (int)validateFace:(__CVBuffer *)a3 eulerAngles:(float *)a4;
- (uint64_t)vertices;
- (unint64_t)vertexCount;
- (void)dealloc;
- (void)makeValidationDecision;
- (void)mapToCameraNegativeZ;
- (void)rotateLandmarks:(int)a3 width:(int)a4 height:(int)a5 landmarks:(float *)a6 numLandmarks:(int)a7;
- (void)updateIntrinsicWhenRotated;
@end

@implementation VCPVideoFaceMeshAnalyzer

- (VCPVideoFaceMeshAnalyzer)initWithFocalLengthInPixels:(float)a3 offline:(BOOL)a4 isFastMode:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)VCPVideoFaceMeshAnalyzer;
  v8 = [(VCPVideoFaceMeshAnalyzer *)&v15 init];
  v9 = v8;
  if (v8)
  {
    v8->_focalLengthInPixels = a3;
    v8->_offline = a4;
    v8->_initialized = 0;
    v8->_vertexCount = 0;
    *(void *)v8->_meshVertices = 0;
    v10 = [[VCPFaceShapeModel alloc] initWithMode:v5];
    shapeModel = v9->_shapeModel;
    v9->_shapeModel = v10;

    v12 = v9->_shapeModel;
    if (v12)
    {
      if ([(VCPFaceShapeModel *)v12 vertexCount])
      {
        v9->_vertexCount = [(VCPFaceShapeModel *)v9->_shapeModel vertexCount];
        operator new[]();
      }
    }
  }
  v13 = (VCPVideoFaceMeshAnalyzer *)0;

  return v13;
}

- (BOOL)updateFocalLengthInPixels:(float)a3
{
  self->_focalLengthInPixels = a3;
  shapeModel = self->_shapeModel;
  if (shapeModel) {
    -[VCPFaceShapeModel updateFocalLengthInPixels:](shapeModel, "updateFocalLengthInPixels:");
  }
  return 1;
}

- (void)updateIntrinsicWhenRotated
{
  float uc = self->_uc;
  self->_float uc = self->_vc;
  self->_vc = uc;
  -[VCPFaceShapeModel updateIntrinsic:vc:](self->_shapeModel, "updateIntrinsic:vc:");
  self->_bufferRotated ^= 1u;
}

- (int)setFrame:(__CVBuffer *)a3
{
  if (self->_initialized) {
    return -18;
  }
  int Width = CVPixelBufferGetWidth(a3);
  int Height = CVPixelBufferGetHeight(a3);
  self->_float uc = (float)Width * 0.5;
  self->_vc = (float)Height * 0.5;
  self->_bufferRotated = 0;
  shapeModel = self->_shapeModel;
  *(float *)&double v9 = self->_focalLengthInPixels;
  return -[VCPFaceShapeModel setCameraIntrinsics:uc:vc:](shapeModel, "setCameraIntrinsics:uc:vc:", v9);
}

- (void)dealloc
{
  prevLM = self->_prevLM;
  if (prevLM) {
    MEMORY[0x1C186C790](prevLM, 0x1000C8052888210);
  }
  curLM = self->_curLM;
  if (curLM) {
    MEMORY[0x1C186C790](curLM, 0x1000C8052888210);
  }
  valLM = self->_valLM;
  if (valLM) {
    MEMORY[0x1C186C790](valLM, 0x1000C8052888210);
  }
  uint64_t v6 = *(void *)self->_meshVertices;
  if (v6) {
    MEMORY[0x1C186C790](v6, 0x1000C80451B5BE8);
  }
  valBuffer = self->_valBuffer;
  if (valBuffer) {
    CFRelease(valBuffer);
  }
  valBufferRotated = self->_valBufferRotated;
  if (valBufferRotated) {
    CFRelease(valBufferRotated);
  }
  v9.receiver = self;
  v9.super_class = (Class)VCPVideoFaceMeshAnalyzer;
  [(VCPVideoFaceMeshAnalyzer *)&v9 dealloc];
}

- (void)makeValidationDecision
{
  if (fabsf(self->_eulerAngle[1]) <= 10.0) {
    float v2 = flt_1BC2839E0[fabsf(self->_eulerAngle[2]) > 10.0];
  }
  else {
    float v2 = 0.1;
  }
  float validationScore = self->_validationScore;
  BOOL v4 = validationScore >= v2 || !self->_validateFailedOnce;
  if (v4 && validationScore >= 0.015)
  {
    if (validationScore < 0.2) {
      self->_validateFailedOnce = 1;
    }
  }
  else
  {
    self->_inDetectionMode = 1;
    *(void *)&self->_detectionModeCounter = 0;
    ++self->_lostTrackCounter;
  }
}

- (int)validateFace:(__CVBuffer *)a3 eulerAngles:(float *)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
  int HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
  size_t v9 = CVPixelBufferGetBytesPerRowOfPlane(self->_valBuffer, 0);
  int v10 = CVPixelBufferGetHeightOfPlane(self->_valBuffer, 0);
  if (self->_bufferRotated)
  {
    size_t v9 = CVPixelBufferGetBytesPerRowOfPlane(self->_valBufferRotated, 0);
    int v10 = CVPixelBufferGetHeightOfPlane(self->_valBufferRotated, 0);
  }
  if (BytesPerRowOfPlane != v9 || HeightOfPlane != v10) {
    goto LABEL_7;
  }
  uint64_t v13 = 136;
  if (!self->_bufferRotated) {
    uint64_t v13 = 128;
  }
  v14 = (__CVBuffer *)CFRetain(*(CFTypeRef *)((char *)&self->super.isa + v13));
  CVReturn v44 = 0;
  CVPixelBufferRef v45 = v14;
  CVPixelBufferLockFlags v46 = 0;
  if (!v14)
  {
    BOOL v18 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v18) {
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v18, v19, v20, v21, v22, v23, v24, v25);
    }
LABEL_7:
    LODWORD(BaseAddressOfPlane) = -50;
    return BaseAddressOfPlane;
  }
  objc_super v15 = v14;
  CVReturn v16 = CVPixelBufferLockBaseAddress(v14, 0);
  CVReturn v44 = v16;
  if (!v16
    || (LODWORD(BaseAddressOfPlane) = v16, os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    && (*(_DWORD *)buf = 134218240,
        *(void *)pixelBuffer = v15,
        *(_WORD *)&pixelBuffer[8] = 1024,
        *(_DWORD *)&pixelBuffer[10] = BaseAddressOfPlane,
        _os_log_error_impl(&dword_1BBEDA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", buf, 0x12u), (LODWORD(BaseAddressOfPlane) = v44) == 0))
  {
    *(void *)&pixelBuffer[4] = a3;
    *(void *)&pixelBuffer[12] = 1;
    if (a3)
    {
      uint64_t BaseAddressOfPlane = CVPixelBufferLockBaseAddress(a3, 1uLL);
      *(_DWORD *)buf = BaseAddressOfPlane;
      if (BaseAddressOfPlane)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[VCPImageConverter convertImage:yuvFrame:]((uint64_t)a3, BaseAddressOfPlane, v26, v27, v28, v29, v30, v31);
        }
      }
      else
      {
        uint64_t BaseAddressOfPlane = (uint64_t)CVPixelBufferGetBaseAddressOfPlane(a3, 0);
        v40 = CVPixelBufferGetBaseAddressOfPlane(v15, 0);
        memcpy(v40, (const void *)BaseAddressOfPlane, HeightOfPlane * BytesPerRowOfPlane);
        LODWORD(BaseAddressOfPlane) = CVPixelBufferLock::Unlock((CVPixelBufferLock *)buf);
        if (!BaseAddressOfPlane)
        {
          LODWORD(BaseAddressOfPlane) = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v44);
          if (!BaseAddressOfPlane)
          {
            memcpy(self->_valLM, self->_curLM, 0x1F8uLL);
            validationQueue = self->_validationQueue;
            validationGroup = self->_validationGroup;
            v43[0] = MEMORY[0x1E4F143A8];
            v43[1] = 3221225472;
            v43[2] = __53__VCPVideoFaceMeshAnalyzer_validateFace_eulerAngles___block_invoke;
            v43[3] = &unk_1E629B6C0;
            v43[4] = self;
            v43[5] = a4;
            v43[6] = v15;
            dispatch_group_async(validationGroup, validationQueue, v43);
            CFRelease(v15);
            LODWORD(BaseAddressOfPlane) = 0;
          }
        }
      }
    }
    else
    {
      BOOL v32 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      if (v32) {
        -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v32, v33, v34, v35, v36, v37, v38, v39);
      }
      LODWORD(BaseAddressOfPlane) = -50;
      *(_DWORD *)buf = -50;
    }
    if (*(void *)&pixelBuffer[4]
      && !*(_DWORD *)buf
      && CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)&pixelBuffer[4], *(CVPixelBufferLockFlags *)&pixelBuffer[12])&& os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:]();
    }
    if (v45
      && !v44
      && CVPixelBufferUnlockBaseAddress(v45, v46)
      && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:]();
    }
  }
  return BaseAddressOfPlane;
}

unsigned char *__53__VCPVideoFaceMeshAnalyzer_validateFace_eulerAngles___block_invoke(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[5];
  if (v2)
  {
    uint64_t v3 = 0;
    int v4 = 0;
    float v5 = 3.4028e38;
    do
    {
      uint64_t v6 = 0;
      float v7 = 0.0;
      do
      {
        float v8 = *(float *)(a1[5] + v6);
        uint64_t v9 = [*(id *)(a1[4] + 8 * v3 + 176) orientation];
        float v7 = v7 + (float)((float)(v8 - *(float *)(v9 + v6)) * (float)(v8 - *(float *)(v9 + v6)));
        v6 += 4;
      }
      while (v6 != 12);
      if (v7 < v5)
      {
        float v5 = v7;
        int v4 = v3;
      }
      ++v3;
    }
    while (v3 != 5);
    uint64_t v2 = v4;
  }
  int v10 = [*(id *)(a1[4] + 8 * v2 + 176) validateOneImage:a1[6] landmarks:*(void *)(a1[4] + 152) numofLandmarks:63 score:a1[4] + 104];
  if (v10)
  {
    int v11 = v10;
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v12 = VCPLogInstance();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v14[0] = 67109120;
        v14[1] = v11;
        _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_ERROR, "VCPLandmarkValidator failed to validate image (%d)", (uint8_t *)v14, 8u);
      }
    }
    *(_DWORD *)(a1[4] + 104) = 0;
  }
  result = (unsigned char *)a1[4];
  if (!result[48]) {
    return (unsigned char *)[result makeValidationDecision];
  }
  return result;
}

- (int)checkResolutionChange:(__CVBuffer *)a3 withRotation:(int)a4
{
  size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
  int Width = CVPixelBufferGetWidth(a3);
  int HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
  p_valBuffer = &self->_valBuffer;
  size_t v11 = CVPixelBufferGetBytesPerRowOfPlane(self->_valBuffer, 0);
  int v12 = CVPixelBufferGetHeightOfPlane(self->_valBuffer, 0);
  if (a4 == 270 || a4 == 90) {
    [(VCPVideoFaceMeshAnalyzer *)self updateIntrinsicWhenRotated];
  }
  if (self->_bufferRotated)
  {
    size_t v11 = CVPixelBufferGetBytesPerRowOfPlane(self->_valBufferRotated, 0);
    int v12 = CVPixelBufferGetHeightOfPlane(self->_valBufferRotated, 0);
  }
  if (BytesPerRowOfPlane == v11 && HeightOfPlane == v12) {
    return 0;
  }
  if (*p_valBuffer) {
    CFRelease(*p_valBuffer);
  }
  valBufferRotated = self->_valBufferRotated;
  if (valBufferRotated) {
    CFRelease(valBufferRotated);
  }
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  if (self->_bufferRotated) {
    int v16 = HeightOfPlane;
  }
  else {
    int v16 = Width;
  }
  if (self->_bufferRotated) {
    int v17 = Width;
  }
  else {
    int v17 = HeightOfPlane;
  }
  CFAllocatorRef v18 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  size_t v19 = v16;
  size_t v20 = v17;
  if (!CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v16, v17, PixelFormatType, 0, &self->_valBuffer)
    && !CVPixelBufferCreate(v18, v20, v19, PixelFormatType, 0, &self->_valBufferRotated))
  {
    self->_float uc = (float)Width * 0.5;
    self->_vc = (float)HeightOfPlane * 0.5;
    -[VCPFaceShapeModel updateIntrinsic:vc:](self->_shapeModel, "updateIntrinsic:vc:");
    return 0;
  }
  return -108;
}

- (BOOL)isTracked
{
  return self->_initialized && self->_lostTrackCounter < 5;
}

- (void)rotateLandmarks:(int)a3 width:(int)a4 height:(int)a5 landmarks:(float *)a6 numLandmarks:(int)a7
{
  v24[1] = *MEMORY[0x1E4F143B8];
  if (a3 && a3 != 360)
  {
    uint64_t v9 = (float32x2_t *)a6;
    int v12 = (float32x2_t *)((char *)v24 - ((4 * (2 * a7) + 15) & 0x7FFFFFFF0));
    memcpy(v12, a6, 8 * a7);
    if (a3 == 270)
    {
      if (a7 >= 1)
      {
        uint64_t v17 = a7;
        CFAllocatorRef v18 = (float *)v12 + 1;
        size_t v19 = (float *)v9 + 1;
        do
        {
          float v20 = (float)(a5 - 1) - *(v18 - 1);
          *(v19 - 1) = *v18;
          *size_t v19 = v20;
          v18 += 2;
          v19 += 2;
          --v17;
        }
        while (v17);
      }
    }
    else if (a3 == 180)
    {
      if (a7 >= 1)
      {
        float32x2_t v21 = vcvt_f32_s32(vadd_s32((int32x2_t)__PAIR64__(a5, a4), (int32x2_t)-1));
        uint64_t v22 = a7;
        do
        {
          float32x2_t v23 = *v12++;
          *v9++ = vsub_f32(v21, v23);
          --v22;
        }
        while (v22);
      }
    }
    else if (a3 == 90 && a7 >= 1)
    {
      uint64_t v13 = a7;
      v14 = (float *)v12 + 1;
      uint64_t v15 = (float *)v9 + 1;
      do
      {
        int v16 = *((_DWORD *)v14 - 1);
        *(v15 - 1) = (float)(a4 - 1) - *v14;
        *(_DWORD *)uint64_t v15 = v16;
        v14 += 2;
        v15 += 2;
        --v13;
      }
      while (v13);
    }
  }
}

- (int)analyzeFrame:(__CVBuffer *)a3 withFaceRect:(CGRect)a4 withRotation:(int)a5 withTimestamp:(id *)a6
{
  uint64_t v6 = *(void *)&a5;
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  blendShapes = self->_blendShapes;
  self->_blendShapes = 0;

  uint64_t v14 = MEMORY[0x1E4F149A0];
  CGPoint v15 = *(CGPoint *)(MEMORY[0x1E4F149A0] + 16);
  *(_OWORD *)&self[1].super.isa = *MEMORY[0x1E4F149A0];
  self[1]._faceBounds.origin = v15;
  long long v16 = *(_OWORD *)(v14 + 48);
  self[1]._faceBounds.size = *(CGSize *)(v14 + 32);
  *(_OWORD *)&self[1]._inDetectionMode = v16;
  CGFloat v17 = x;
  *(CGFloat *)&long long v16 = y;
  CGFloat v18 = width;
  CGFloat v19 = height;
  if (CGRectIsEmpty(*(CGRect *)((char *)&v16 - 8)) && self->_inDetectionMode)
  {
    CVReturn v20 = 0;
    ++self->_lostTrackCounter;
    return v20;
  }
  self->_faceCount = 1;
  if (self->_initialized)
  {
    [(VCPVideoFaceMeshAnalyzer *)self checkResolutionChange:a3 withRotation:v6];
  }
  else
  {
    CVReturn v20 = [(VCPVideoFaceMeshAnalyzer *)self setFrame:a3];
    if (v20) {
      return v20;
    }
    self->_initialized = 1;
  }
  size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
  size_t v22 = CVPixelBufferGetWidth(a3);
  size_t v23 = CVPixelBufferGetHeight(a3);
  if (!self->_valBuffer)
  {
    OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
    if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (int)v22, (int)v23, PixelFormatType, 0, &self->_valBuffer))
    {
      return -108;
    }
  }
  if (!self->_valBufferRotated)
  {
    OSType v32 = CVPixelBufferGetPixelFormatType(a3);
    if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (int)v23, (int)v22, v32, 0, &self->_valBufferRotated))
    {
      return -108;
    }
  }
  v77.b = 0.0;
  v77.c = 0.0;
  v77.a = (double)(int)v22;
  v77.d = (double)-(int)v23;
  v77.tCGFloat x = 0.0;
  v77.tCGFloat y = (double)(int)v23;
  v89.origin.CGFloat x = x;
  v89.origin.CGFloat y = y;
  v89.size.CGFloat width = width;
  v89.size.CGFloat height = height;
  CGRect v90 = CGRectApplyAffineTransform(v89, &v77);
  float v24 = v90.origin.y;
  float v25 = v90.origin.x;
  *(float *)v83 = v24;
  *(float *)&v83[1] = v25;
  float v26 = v90.size.height;
  float v27 = v24 + v26;
  float v28 = v90.size.width;
  *(float *)&v83[2] = v27;
  *(float *)&v83[3] = v25 + v28;
  if (!self->_inDetectionMode)
  {
    [(VCPVideoFaceMeshAnalyzer *)self rotateLandmarks:v6 width:v22 height:v23 landmarks:self->_prevLM numLandmarks:63];
    [(VCPRTLandmarkDetector *)self->_lmTracker calculateFaceRectFromPrevLM:self->_prevLM result:v83 numOfLandmarks:63];
    *(_DWORD *)buf = 0;
    *(_OWORD *)&pixelBuffer[4] = (unint64_t)a3;
    if (a3)
    {
      CVReturn v20 = CVPixelBufferLockBaseAddress(a3, 0);
      *(_DWORD *)buf = v20;
      if (v20)
      {
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          goto LABEL_28;
        }
        *(_DWORD *)v84 = 134218240;
        uint64_t v85 = *(void *)&pixelBuffer[4];
        __int16 v86 = 1024;
        CVReturn v87 = v20;
        _os_log_error_impl(&dword_1BBEDA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", v84, 0x12u);
        CVReturn v20 = *(_DWORD *)buf;
        if (*(_DWORD *)buf) {
          goto LABEL_28;
        }
      }
      [(VCPRTLandmarkDetector *)self->_lmTracker detectLandmark:CVPixelBufferGetBaseAddressOfPlane(a3, 0) width:v22 height:v23 stride:BytesPerRowOfPlane facerect:v83 prevResult:self->_prevLM result:self->_curLM];
      CVReturn v20 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)buf);
      if (v20)
      {
LABEL_28:
        char v30 = 0;
      }
      else
      {
        [(VCPFaceShapeModel *)self->_shapeModel moveBoundaryLandmarks:self->_curLM output:&v80 isInput:1];
        curLM = self->_curLM;
        *(float *)&double v63 = *curLM;
        if (*curLM == 0.0)
        {
          self->_float validationScore = 0.0;
          char v65 = 1;
          self->_inDetectionMode = 1;
          [(VCPFaceShapeModel *)self->_shapeModel resetIdentityAndExpressions];
          int v64 = 0;
        }
        else
        {
          if (self->_lostTrackCounter > 0 || self->_validateFailedOnce)
          {
            -[VCPVideoFaceMeshAnalyzer validateFace:eulerAngles:](self, "validateFace:eulerAngles:", a3, self->_eulerAngle, v63);
            curLM = self->_curLM;
            int v64 = 1;
          }
          else
          {
            int v64 = 0;
          }
          if ([(VCPFaceShapeModel *)self->_shapeModel trackFaceMesh:curLM])
          {
            char v65 = 0;
          }
          else
          {
            self->_float validationScore = 0.0;
            [(VCPFaceShapeModel *)self->_shapeModel resetIdentityAndExpressions];
            int v64 = 0;
            char v65 = 1;
            self->_inDetectionMode = 1;
          }
        }
        int v69 = (self->_trackingModeCounter + 1) % 600;
        if (self->_offline) {
          int v69 = 0;
        }
        self->_trackingModeCounter = v69;
        if ((v65 & 1) == 0 && (v64 & 1) == 0 && !((__int16)v69 % 3)) {
          [(VCPVideoFaceMeshAnalyzer *)self validateFace:a3 eulerAngles:self->_eulerAngle];
        }
        if (v64) {
          dispatch_group_wait((dispatch_group_t)self->_validationGroup, 0xFFFFFFFFFFFFFFFFLL);
        }
        float validationScore = self->_validationScore;
        if (validationScore > 0.2)
        {
          self->_int lostTrackCounter = 0;
          self->_validateFailedOnce = 0;
          if (validationScore > 0.9)
          {
            [(VCPFaceShapeModel *)self->_shapeModel setDetectionModeCounterShapeModel:0];
            [(VCPFaceShapeModel *)self->_shapeModel updateIdentityShape:&v80];
          }
        }
        if (self->_inDetectionMode)
        {
          CVReturn v20 = 0;
        }
        else
        {
          memcpy(self->_prevLM, self->_curLM, 0x1F8uLL);
          CVReturn v20 = 0;
          prevLM = self->_prevLM;
          int v72 = *((_DWORD *)prevLM + 124);
          *((_DWORD *)prevLM + 126) = v72;
          int v73 = *((_DWORD *)prevLM + 125);
          *((_DWORD *)prevLM + 127) = v73;
          *((_DWORD *)prevLM + 128) = v72;
          *((_DWORD *)prevLM + 129) = v73;
          *((_DWORD *)prevLM + 130) = v72;
          *((_DWORD *)prevLM + 131) = v73;
          *((_OWORD *)prevLM + 33) = 0u;
        }
        char v30 = 1;
      }
    }
    else
    {
      BOOL v34 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      if (v34) {
        -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v34, v35, v36, v37, v38, v39, v40, v41);
      }
      char v30 = 0;
      CVReturn v20 = -50;
      *(_DWORD *)buf = -50;
    }
    if (*(void *)&pixelBuffer[4]
      && !*(_DWORD *)buf
      && CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)&pixelBuffer[4], *(CVPixelBufferLockFlags *)&pixelBuffer[12])&& os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      goto LABEL_47;
    }
    goto LABEL_48;
  }
  if (self->_faceCount < 1)
  {
    self->_detectionModeCounter = 0;
    int lostTrackCounter = self->_lostTrackCounter;
    if (lostTrackCounter >= 1)
    {
      self->_int lostTrackCounter = lostTrackCounter + 1;
      if (lostTrackCounter >= 0x1E) {
        [(VCPFaceShapeModel *)self->_shapeModel resetIdentityAndExpressions];
      }
    }
    goto LABEL_49;
  }
  if (CGRectIsEmpty(v90)) {
    return -18;
  }
  int v80 = 0;
  CVPixelBufferRef v81 = a3;
  CVPixelBufferLockFlags v82 = 0;
  if (a3)
  {
    CVReturn v20 = CVPixelBufferLockBaseAddress(a3, 0);
    int v80 = v20;
    if (v20)
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        goto LABEL_16;
      }
      *(_DWORD *)buf = 134218240;
      *(void *)pixelBuffer = v81;
      *(_WORD *)&pixelBuffer[8] = 1024;
      *(_DWORD *)&pixelBuffer[10] = v20;
      _os_log_error_impl(&dword_1BBEDA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", buf, 0x12u);
      CVReturn v20 = v80;
      if (v80) {
        goto LABEL_16;
      }
    }
    [(VCPRTLandmarkDetector *)self->_lmDetector detectLandmark:CVPixelBufferGetBaseAddressOfPlane(a3, 0) width:v22 height:v23 stride:BytesPerRowOfPlane facerect:v83 prevResult:0 result:self->_curLM];
    CVReturn v20 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v80);
    if (v20)
    {
LABEL_16:
      char v30 = 0;
      goto LABEL_43;
    }
    *(float *)&double v29 = *self->_curLM;
    shapeModel = self->_shapeModel;
    if (*(float *)&v29 == 0.0)
    {
      [(VCPFaceShapeModel *)shapeModel resetIdentityAndExpressions];
      self->_detectionModeCounter = 0;
    }
    else
    {
      BOOL v67 = [(VCPFaceShapeModel *)shapeModel isIdentityInit];
      BOOL v68 = v67;
      if (v67) {
        [(VCPVideoFaceMeshAnalyzer *)self validateFace:a3 eulerAngles:self->_eulerAngle];
      }
      if ([(VCPFaceShapeModel *)self->_shapeModel fitOneImage:self->_curLM])
      {
        if (!v68)
        {
          CVReturn v20 = 0;
          ++self->_detectionModeCounter;
LABEL_92:
          char v30 = 1;
          goto LABEL_43;
        }
LABEL_87:
        dispatch_group_wait((dispatch_group_t)self->_validationGroup, 0xFFFFFFFFFFFFFFFFLL);
        if (self->_validationScore <= 0.2)
        {
          CVReturn v20 = 0;
          ++self->_lostTrackCounter;
        }
        else
        {
          self->_inDetectionMode = 0;
          *(void *)&self->_detectionModeCounter = 0;
          self->_validateFailedOnce = 0;
          memcpy(self->_prevLM, self->_curLM, 0x1F8uLL);
          CVReturn v20 = 0;
          v74 = self->_prevLM;
          int v75 = *((_DWORD *)v74 + 124);
          *((_DWORD *)v74 + 126) = v75;
          int v76 = *((_DWORD *)v74 + 125);
          *((_DWORD *)v74 + 127) = v76;
          *((_DWORD *)v74 + 128) = v75;
          *((_DWORD *)v74 + 129) = v76;
          *((_DWORD *)v74 + 130) = v75;
          *((_DWORD *)v74 + 131) = v76;
          *((_OWORD *)v74 + 33) = 0u;
        }
        goto LABEL_92;
      }
      [(VCPFaceShapeModel *)self->_shapeModel resetIdentityAndExpressions];
      self->_detectionModeCounter = 0;
      if (v68) {
        goto LABEL_87;
      }
    }
    CVReturn v20 = 0;
    char v30 = 1;
    self->_detectionModeCounter = 1;
    ++self->_lostTrackCounter;
    goto LABEL_43;
  }
  BOOL v42 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  if (v42) {
    -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v42, v43, v44, v45, v46, v47, v48, v49);
  }
  char v30 = 0;
  CVReturn v20 = -50;
  int v80 = -50;
LABEL_43:
  if (v81
    && !v80
    && CVPixelBufferUnlockBaseAddress(v81, v82)
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
LABEL_47:
    -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:]();
  }
LABEL_48:
  if ((v30 & 1) == 0) {
    return v20;
  }
LABEL_49:
  [(VCPFaceShapeModel *)self->_shapeModel getEulerAngle:self->_eulerAngle];
  [(VCPFaceShapeModel *)self->_shapeModel getPose];
  *(_OWORD *)&self[1].super.isa = v50;
  self[1]._faceBounds.origin = v51;
  self[1]._faceBounds.size = v52;
  *(_OWORD *)&self[1]._inDetectionMode = v53;
  [(VCPFaceShapeModel *)self->_shapeModel updateMeshVertices];
  unint64_t vertexCount = self->_vertexCount;
  if (vertexCount != [(VCPFaceShapeModel *)self->_shapeModel vertexCount] || !self->_vertexCount) {
    return -18;
  }
  memcpy(*(void **)self->_meshVertices, (const void *)[(VCPFaceShapeModel *)self->_shapeModel meshVertices], 16 * self->_vertexCount);
  [(VCPVideoFaceMeshAnalyzer *)self mapToCameraNegativeZ];
  v55 = [(VCPFaceShapeModel *)self->_shapeModel blendShapes];
  BOOL v56 = v55 == 0;

  if (!v56)
  {
    v57 = (void *)MEMORY[0x1E4F1C9E8];
    v58 = [(VCPFaceShapeModel *)self->_shapeModel blendShapes];
    v59 = [v57 dictionaryWithDictionary:v58];
    v60 = self->_blendShapes;
    self->_blendShapes = v59;
  }
  return 0;
}

- (uint64_t)vertices
{
  return *(void *)(a1 + 160);
}

- (const)landmarks
{
  return self->_curLM;
}

- (void)mapToCameraNegativeZ
{
  int8x16_t v2 = *(int8x16_t *)&self[1].super.isa;
  int8x16_t origin = (int8x16_t)self[1]._faceBounds.origin;
  float32x4_t size = (float32x4_t)self[1]._faceBounds.size;
  int8x16_t v4 = *(int8x16_t *)&self[1]._inDetectionMode;
  float32x4_t v6 = vnegq_f32(size);
  *(float32x2_t *)&long long v7 = vdiv_f32(*(float32x2_t *)v4.i8, (float32x2_t)0xC47A0000447A0000);
  HIDWORD(v7) = vextq_s8(v4, v4, 8uLL).i32[1];
  size.i32[1] = v6.i32[1];
  size.i32[2] = v6.i32[2];
  *(uint64_t *)((char *)v2.i64 + 4) = vnegq_f32((float32x4_t)vextq_s8(v2, v2, 4uLL)).u64[0];
  v6.i64[0] = vnegq_f32((float32x4_t)vextq_s8(origin, v2, 4uLL)).u64[0];
  origin.i32[1] = v6.i32[0];
  *(float *)v4.i32 = COERCE_FLOAT(self[1]._lmDetector);
  origin.i32[2] = v6.i32[1];
  *(int8x16_t *)&self[1].super.isa = v2;
  self[1]._faceBounds.int8x16_t origin = (CGPoint)origin;
  *((float *)&v7 + 2) = *(float *)v4.i32 / -1000.0;
  self[1]._faceBounds.float32x4_t size = (CGSize)size;
  *(_OWORD *)&self[1]._inDetectionMode = v7;
}

- (__n128)pose
{
  return a1[17];
}

- (NSDictionary)blendShapes
{
  return self->_blendShapes;
}

- (unint64_t)vertexCount
{
  return self->_vertexCount;
}

- (BOOL)bufferRotated
{
  return self->_bufferRotated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blendShapes, 0);
  for (uint64_t i = 0; i != -5; --i)
    objc_storeStrong((id *)&self->_faceValidator[i + 4], 0);
  objc_storeStrong((id *)&self->_shapeModel, 0);
  objc_storeStrong((id *)&self->_validationGroup, 0);
  objc_storeStrong((id *)&self->_validationQueue, 0);
  objc_storeStrong((id *)&self->_lmTracker, 0);
  objc_storeStrong((id *)&self->_lmDetector, 0);
}

@end