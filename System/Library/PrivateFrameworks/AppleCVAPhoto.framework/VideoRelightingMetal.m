@interface VideoRelightingMetal
- (CGRect)primaryCaptureRect;
- (VideoRelightingMetal)initWithMetalContext:(void *)a3;
- (double)gpuEndTime;
- (double)gpuStartTime;
- (float)relightingStability;
- (id).cxx_construct;
- (id)create3DTextureWithSize:(unint64_t)a3;
- (id)getInternalColorCube:(int)a3;
- (id)loadCube:(id)a3;
- (void)configureRenderPipeline;
- (void)createTexturesWith:(unint64_t)a3 imgHeight:(unint64_t)a4;
- (void)encodeAlphaBlendRGBATextureArrayToCommandBuffer:(id)a3 inTexFirst:(id)a4 inTexSecond:(id)a5 outTex:(id)a6 alpha:(const float *)a7;
- (void)encodeCountKernelToCommandBuffer:(id)a3;
- (void)encodeLerpNearFarMapsToCommandBuffer:(id)a3;
- (void)encodeRelightKernelToCommandBuffer:(id)a3;
- (void)encodeSlideKernelToCommandBuffer:(id)a3;
- (void)encodeTCKernelToCommandBuffer:(id)a3;
- (void)encodeVertCountKernelToCommandBuffer:(id)a3;
- (void)generateModelNormals;
- (void)initCommon;
- (void)initKernelFunctions;
- (void)loadRGBTransformMapsForEffectVersion:(BOOL)a3;
- (void)loadRGBTransformMapsOnceTo:(id *)a3 namePrefix:(const void *)a4 forIntermediateResults:(BOOL)a5;
- (void)renderWithSrcImage:(__CVBuffer *)a3 srcAlpha:(__CVBuffer *)a4 trustAlpha:(BOOL)a5 isAfterPreviewStitcher:(BOOL)a6 yuvSourceDownsampled:(id)a7 skinSegmentation:(__CVBuffer *)a8 dstImage:(__CVBuffer *)a9 faceKitProcessOutput:(id)a10 portraitStyleStrength:(float)a11 colorSim:(id)a12 disparity:(id)a13 focusDistance:(float)a14 singleCubeData:(id)a15 properties:(id)a16 callbackQueue:(id)a17 callback:(id)a18;
- (void)saveTexture:(id)a3 toImage:(id)a4;
- (void)setModelVertices;
- (void)setPrimaryCaptureRect:(CGRect)a3;
- (void)updateFaceKitStreamedDataFromProcessOutput:(id)a3;
- (void)updateMatrixWithWidth:(int)a3 height:(int)a4 camera:(const void *)a5 pose:(const void *)a6;
- (void)updateModelAndPose:(void *)a3 camera:(void *)a4;
- (void)updateUniforms:(BOOL)a3;
@end

@implementation VideoRelightingMetal

- (id).cxx_construct
{
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_OWORD *)self + 8) = 0u;
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 40) = 0u;
  *((_OWORD *)self + 41) = 0u;
  *((_OWORD *)self + 42) = 0u;
  *((_OWORD *)self + 43) = 0u;
  *((_OWORD *)self + 44) = 0u;
  *((_OWORD *)self + 45) = 0u;
  *((_OWORD *)self + 46) = 0u;
  *((_OWORD *)self + 47) = 0u;
  *((_OWORD *)self + 48) = 0u;
  *((_OWORD *)self + 49) = 0u;
  *((_OWORD *)self + 50) = 0u;
  *((_OWORD *)self + 51) = 0u;
  *((void *)self + 119) = 0;
  *((void *)self + 120) = 0;
  *((void *)self + 118) = 0;
  *((_OWORD *)self + 61) = 0u;
  *((_OWORD *)self + 62) = 0u;
  *((_OWORD *)self + 63) = 0u;
  *(_OWORD *)((char *)self + 1020) = 0u;
  *(_OWORD *)((char *)self + 1048) = 0u;
  *(_OWORD *)((char *)self + 1064) = 0u;
  *((void *)self + 135) = 0;
  *((unsigned char *)self + 1088) = 0;
  *((unsigned char *)self + 1160) = 0;
  *((void *)self + 154) = 0;
  *((void *)self + 155) = 0;
  *((void *)self + 153) = 0;
  *((unsigned char *)self + 1304) = 0;
  *((unsigned char *)self + 1320) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_texSkinSegmentationAlias, 0);
  objc_storeStrong((id *)&self->_texSkinRGBAPyramid, 0);
  objc_storeStrong((id *)&self->_blurPyramidForSkinFg, 0);
  objc_storeStrong((id *)&self->_colorAlphaToFgBg, 0);
  objc_storeStrong((id *)&self->_faceKitMeshTexcoords, 0);
  objc_storeStrong((id *)&self->_indexBufferImmutable, 0);
  begin = self->_faceKitMeshTris.__begin_;
  if (begin)
  {
    self->_faceKitMeshTris.__end_ = begin;
    operator delete(begin);
  }
  if (self->_faceRelightingAngleFactorsRollingMean.m_storage.dummy_.data[6])
  {
    uint64_t v5 = *(void *)((char *)&self->_faceRelightingAngleFactorsRollingMean.m_storage.dummy_.aligner_ + 22);
    uint64_t v4 = *(void *)((char *)&self->_faceRelightingAngleFactorsRollingMean.m_storage.dummy_.aligner_ + 30);
    uint64_t v6 = *(void *)((char *)&self->_faceRelightingAngleFactorsRollingMean.m_storage.dummy_.aligner_ + 46);
    v7 = *(void **)((char *)&self->_faceRelightingAngleFactorsRollingMean.m_storage.dummy_.aligner_ + 14);
    uint64_t v8 = v5 - v4;
    unint64_t v9 = (unint64_t)(v5 - (void)v7) >> 2;
    if (v6 < v8 >> 2) {
      unint64_t v9 = 0;
    }
    *(void *)((char *)&self->_faceRelightingAngleFactorsRollingMean.m_storage.dummy_.aligner_ + 30) = v4 + 4 * (v6 - v9);
    if (v7) {
      operator delete(v7);
    }
    self->_faceRelightingAngleFactorsRollingMean.m_storage.dummy_.data[6] = 0;
  }
  if (self->_faceConfidenceRollingVariance.m_initialized)
  {
    uint64_t v11 = *(void *)((char *)&self->_faceConfidenceRollingVariance.m_storage.dummy_.aligner_ + 15);
    uint64_t v10 = *(void *)((char *)&self->_faceConfidenceRollingVariance.m_storage.dummy_.aligner_ + 23);
    uint64_t v12 = *(void *)((char *)&self->_faceConfidenceRollingVariance.m_storage.dummy_.aligner_ + 39);
    v13 = *(void **)((char *)&self->_faceConfidenceRollingVariance.m_storage.dummy_.aligner_ + 7);
    uint64_t v14 = v11 - v10;
    unint64_t v15 = (unint64_t)(v11 - (void)v13) >> 2;
    if (v12 < v14 >> 2) {
      unint64_t v15 = 0;
    }
    *(void *)((char *)&self->_faceConfidenceRollingVariance.m_storage.dummy_.aligner_ + 23) = v10 + 4 * (v12 - v15);
    if (v13) {
      operator delete(v13);
    }
    self->_faceConfidenceRollingVariance.m_initialized = 0;
  }
  m_end = self->_faceDetectedRealHistory.m_end;
  m_first = self->_faceDetectedRealHistory.m_first;
  int64_t m_size = self->_faceDetectedRealHistory.m_size;
  m_buff = self->_faceDetectedRealHistory.m_buff;
  int64_t v20 = m_end - m_first;
  v21 = &m_buff[m_size - (void)m_end];
  if (v20 <= m_size) {
    int64_t m_size = (int64_t)v21;
  }
  self->_faceDetectedRealHistory.m_first = &m_first[m_size];
  if (m_buff) {
    operator delete(m_buff);
  }

  objc_storeStrong((id *)&self->_vertexBuffer, 0);
  v22 = self->_modelVertices.__begin_;
  if (v22)
  {
    self->_modelVertices.__end_ = v22;
    operator delete(v22);
  }
  objc_storeStrong((id *)&self->_facemaskRegionTexture, 0);
  objc_storeStrong((id *)&self->_kernel_Face, 0);
  objc_storeStrong((id *)&self->_faceRenderDesc3, 0);
  objc_storeStrong((id *)&self->_faceRenderDesc2, 0);
  objc_storeStrong((id *)&self->_faceRenderDesc1, 0);
  objc_storeStrong((id *)&self->_inflightSemaphore, 0);
  objc_storeStrong((id *)&self->_synchronousRelightingCallbackQueue, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_rgbTransformMapTextureSelectedPtr, 0);
  objc_storeStrong((id *)&self->_rgbTransformMapCurrentTextureInterpolated, 0);
  objc_storeStrong((id *)&self->_rgbTransformMapCurrentFarTexturePtr, 0);
  objc_storeStrong((id *)&self->_rgbTransformMapCurrentNearTexturePtr, 0);
  objc_storeStrong((id *)&self->_rgbTransformMapStudioFarTexture[1], 0);
  objc_storeStrong((id *)self->_rgbTransformMapStudioFarTexture, 0);
  objc_storeStrong((id *)&self->_rgbTransformMapContourFarTexture[1], 0);
  objc_storeStrong((id *)self->_rgbTransformMapContourFarTexture, 0);
  objc_storeStrong((id *)&self->_rgbTransformMapStudioNearTexture[1], 0);
  objc_storeStrong((id *)self->_rgbTransformMapStudioNearTexture, 0);
  objc_storeStrong((id *)&self->_rgbTransformMapContourNearTexture[1], 0);
  objc_storeStrong((id *)self->_rgbTransformMapContourNearTexture, 0);
  objc_storeStrong((id *)&self->_slideTexture, 0);
  objc_storeStrong((id *)&self->_countTexture, 0);
  objc_storeStrong((id *)&self->_vertCountTexture, 0);
  objc_storeStrong((id *)&self->_alphaTexture, 0);
  objc_storeStrong((id *)&self->_dstUVTexture, 0);
  objc_storeStrong((id *)&self->_dstTexture, 0);
  objc_storeStrong((id *)&self->_srcTexture, 0);
  objc_storeStrong((id *)&self->_texSelectedColorCube, 0);
  objc_storeStrong((id *)&self->_texColorCubeStaticArray[6], 0);
  objc_storeStrong((id *)&self->_texColorCubeStaticArray[5], 0);
  objc_storeStrong((id *)&self->_texColorCubeStaticArray[4], 0);
  objc_storeStrong((id *)&self->_texColorCubeStaticArray[3], 0);
  objc_storeStrong((id *)&self->_texColorCubeStaticArray[2], 0);
  objc_storeStrong((id *)&self->_texColorCubeStaticArray[1], 0);
  objc_storeStrong((id *)self->_texColorCubeStaticArray, 0);
  objc_storeStrong((id *)&self->_texColorCubeUserData, 0);
  objc_storeStrong((id *)&self->_colorCubeUserData, 0);
  objc_storeStrong((id *)&self->_texStub, 0);
  objc_storeStrong((id *)&self->_kernel_AlphaBlendRGBATextureArray, 0);
  objc_storeStrong((id *)&self->_kernel_Relight[1][1][1], 0);
  objc_storeStrong((id *)self->_kernel_Relight[1][1], 0);
  objc_storeStrong((id *)&self->_kernel_Relight[1][0][1], 0);
  objc_storeStrong((id *)self->_kernel_Relight[1][0], 0);
  objc_storeStrong((id *)&self->_kernel_Relight[0][1][1], 0);
  objc_storeStrong((id *)self->_kernel_Relight[0][1], 0);
  objc_storeStrong((id *)&self->_kernel_Relight[0][0][1], 0);
  objc_storeStrong((id *)self->_kernel_Relight[0][0], 0);
  objc_storeStrong((id *)&self->_kernel_Slide, 0);
  objc_storeStrong((id *)&self->_kernel_Count, 0);
  objc_storeStrong((id *)&self->_kernel_CountVertical, 0);
  objc_storeStrong((id *)&self->_depthStencilState, 0);
  objc_storeStrong((id *)&self->_lightTexture, 0);
  objc_storeStrong((id *)&self->_tcTexture, 0);
  objc_storeStrong((id *)&self->_tcDepthTexture, 0);
  objc_storeStrong((id *)&self->_tcKernel, 0);
  objc_storeStrong((id *)&self->_tcRenderDesc, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_pipelineLibrary, 0);
  objc_storeStrong((id *)&self->_library, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

- (void)setPrimaryCaptureRect:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_primaryCaptureRect, &v3, 32, 1, 0);
}

- (CGRect)primaryCaptureRect
{
  objc_copyStruct(v6, &self->_primaryCaptureRect, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (float)relightingStability
{
  return self->_relightingStability;
}

- (double)gpuEndTime
{
  return self->_gpuEndTime;
}

- (double)gpuStartTime
{
  return self->_gpuStartTime;
}

- (void)renderWithSrcImage:(__CVBuffer *)a3 srcAlpha:(__CVBuffer *)a4 trustAlpha:(BOOL)a5 isAfterPreviewStitcher:(BOOL)a6 yuvSourceDownsampled:(id)a7 skinSegmentation:(__CVBuffer *)a8 dstImage:(__CVBuffer *)a9 faceKitProcessOutput:(id)a10 portraitStyleStrength:(float)a11 colorSim:(id)a12 disparity:(id)a13 focusDistance:(float)a14 singleCubeData:(id)a15 properties:(id)a16 callbackQueue:(id)a17 callback:(id)a18
{
  v136[2] = *MEMORY[0x1E4F143B8];
  v134 = self;
  id v115 = a7;
  id v117 = a10;
  id v107 = a12;
  id v108 = a13;
  v116 = (NSData *)a15;
  id v109 = a16;
  id v110 = a17;
  id v111 = a18;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76B08, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1E9F76B08))
  {
    v96 = +[CVAPreferenceManager defaults];
    char v97 = [v96 BOOLForKey:@"CVAPhotoDebugStyle"];

    byte_1E9F76B00 = v97;
    __cxa_guard_release(&qword_1E9F76B08);
  }
  if (a8) {
    float v22 = a11;
  }
  else {
    float v22 = NAN;
  }
  v23 = v134;
  v134->_portraitStyleStrength = v22;
  float v24 = fminf(v22, 1.0);
  if (v22 < 0.0) {
    float v24 = 0.0;
  }
  v23->_portraitStyleStrength = v24;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76B18, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1E9F76B18))
  {
    qword_1E9F76B10 = [NSNumber numberWithInt:0xFFFFFFFFLL];
    __cxa_guard_release(&qword_1E9F76B18);
  }
  if ((byte_1E9F76B20 & 1) == 0)
  {
    HIBYTE(__p[2]) = 12;
    strcpy((char *)__p, "lightMapType");
    sub_1BA81CE64((uint64_t)&qword_1E9F76B10, (uint64_t)__p);
    if (SHIBYTE(__p[2]) < 0) {
      operator delete(__p[0]);
    }
    byte_1E9F76B20 = 1;
  }
  if ([(id)qword_1E9F76B10 intValue])
  {
    if ([(id)qword_1E9F76B10 intValue] != 1) {
      goto LABEL_19;
    }
    p_portraitStyleStrength = (_DWORD *)&v134->_portraitStyleStrength;
    float v27 = (float)(v134->_portraitStyleStrength * 1.8)
        + (float)((float)(v134->_portraitStyleStrength * -0.8) * v134->_portraitStyleStrength);
  }
  else
  {
    p_portraitStyleStrength = (_DWORD *)&v134->_portraitStyleStrength;
    float v27 = powf(v134->_portraitStyleStrength, 0.75);
  }
  float v28 = fminf(v27, 1.0);
  BOOL v29 = v27 < 0.0;
  double v25 = 0.0;
  if (!v29) {
    *(float *)&double v25 = v28;
  }
  _DWORD *p_portraitStyleStrength = LODWORD(v25);
LABEL_19:
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76B28, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1E9F76B28))
  {
    v98 = +[CVAPreferenceManager defaults];
    [v98 floatForKey:@"CVAPhotoStyleStrengthMultiplier"];
    int v100 = v99;

    dword_1E9F76B24 = v100;
    __cxa_guard_release(&qword_1E9F76B28);
  }
  LODWORD(v25) = dword_1E9F76B24;
  v30 = v134;
  if (*(float *)&dword_1E9F76B24 != 0.0)
  {
    *(float *)&double v25 = *(float *)&dword_1E9F76B24 * v134->_portraitStyleStrength;
    v134->_portraitStyleStrength = *(float *)&v25;
  }
  v30->_focusDistance = a14;
  if (byte_1E9F76B00)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"portraitStyleStrength (API) = %f", a11);

    LODWORD(v31) = dword_1E9F76B24;
    if (*(float *)&dword_1E9F76B24 != 0.0)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"portraitStyleStrength (rescaled) = %f", v30->_portraitStyleStrength);
    }
    v32 = "non-nil";
    if (!a8) {
      v32 = "nil";
    }
    objc_msgSend(NSString, "stringWithFormat:", @"skinSegmentation is %s", v31, v32);
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76B38, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1E9F76B38))
  {
    v101 = +[CVAPreferenceManager defaults];
    char v102 = [v101 BOOLForKey:@"CVAPhotoLogValidation"];

    byte_1E9F76B30 = v102;
    __cxa_guard_release(&qword_1E9F76B38);
  }
  if (byte_1E9F76B30)
  {
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76B48, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_1E9F76B48))
    {
      v103 = +[CVAPreferenceManager defaults];
      char v104 = [v103 BOOLForKey:@"CVAPhotoLogValidationPassed"];

      byte_1E9F76B40 = v104;
      __cxa_guard_release(&qword_1E9F76B48);
    }
    if (a8)
    {
      if (byte_1E9F76B40) {
        NSLog(&cfstr_SSkinsegmentat_0.isa, v25, "> > > CVAPhoto validation PASSED:");
      }
    }
    else
    {
      NSLog(&cfstr_SSkinsegmentat.isa, v25, "> > > CVAPhoto validation FAILED:");
    }
    if (v117)
    {
      if (byte_1E9F76B40) {
        NSLog(&cfstr_SFacekitproces_0.isa, v25, "> > > CVAPhoto validation PASSED:");
      }
    }
    else
    {
      NSLog(&cfstr_SFacekitproces.isa, v25, "> > > CVAPhoto validation FAILED:");
    }
  }
  v33 = v134;
  objc_storeStrong((id *)&v134->_properties, a16);
  ++v33->_frameIndex;
  [(VideoRelightingMetal *)v33 updateFaceKitStreamedDataFromProcessOutput:v117];
  v34 = a3;
  p_colorCubeUserData = (void **)&v33->_colorCubeUserData;
  if (v33->_colorCubeUserData != v116)
  {
    objc_storeStrong((id *)&v33->_colorCubeUserData, a15);
    v34 = a3;
    if (*p_colorCubeUserData)
    {
      v36 = sub_1BA862804(*p_colorCubeUserData, v33->_device);
      uint64_t v37 = +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:v36];
      texColorCubeUserData = v33->_texColorCubeUserData;
      v33->_texColorCubeUserData = (MTLTexture *)v37;

      v34 = a3;
    }
  }
  CVPixelBufferRetain(v34);
  CVPixelBufferRetain(a4);
  CVPixelBufferRetain(a9);
  CVPixelBufferRetain(a8);
  size_t Width = CVPixelBufferGetWidth(v34);
  size_t Height = CVPixelBufferGetHeight(v34);
  sub_1BA862478((uint64_t *)__p, v34, a4, v33->_device);
  srcTexture = v33->_srcTexture;
  v33->_srcTexture = (MTLTexture *)__p[0];

  alphaTexture = v33->_alphaTexture;
  v33->_alphaTexture = (MTLTexture *)__p[1];

  v33->_trustAlpha = a5;
  v33->_isAfterPreviewStitcher = a6;
  if (a8)
  {
    uint64_t v42 = sub_1BA8623E0(a8, v33->_device);
    texSkinSegmentationAlias = v33->_texSkinSegmentationAlias;
    v33->_texSkinSegmentationAlias = (MTLTexture *)v42;
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76B58, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1E9F76B58))
  {
    qword_1E9F76B50 = [NSNumber numberWithBool:0];
    __cxa_guard_release(&qword_1E9F76B58);
  }
  if ((byte_1E9F76B60 & 1) == 0)
  {
    HIBYTE(__p[2]) = 15;
    strcpy((char *)__p, "forceTrustAlpha");
    sub_1BA81CE64((uint64_t)&qword_1E9F76B50, (uint64_t)__p);
    if (SHIBYTE(__p[2]) < 0) {
      operator delete(__p[0]);
    }
    byte_1E9F76B60 = 1;
  }
  if (sub_1BA81E754("forceTrustAlpha") && [(id)qword_1E9F76B50 BOOLValue]) {
    v134->_trustAlpha = 1;
  }
  size_t v44 = CVPixelBufferGetWidth(a9);
  v45 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:10 width:v44 height:CVPixelBufferGetHeight(a9) mipmapped:0];
  v46 = +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:v45];

  [v46 setUsage:3];
  v47 = (void *)MEMORY[0x1E4F35330];
  size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a9, 1uLL);
  v49 = objc_msgSend(v47, "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 30, WidthOfPlane, CVPixelBufferGetHeightOfPlane(a9, 1uLL), 0);
  v50 = +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:v49];

  [v50 setUsage:3];
  v51 = v134;
  v52 = (void *)[(MTLDeviceSPI *)v134->_device newTextureWithDescriptor:v46 iosurface:CVPixelBufferGetIOSurface(a9) plane:0];
  uint64_t v53 = +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:v52];
  dstTexture = v51->_dstTexture;
  v51->_dstTexture = (MTLTexture *)v53;

  v55 = (void *)[(MTLDeviceSPI *)v51->_device newTextureWithDescriptor:v50 iosurface:CVPixelBufferGetIOSurface(a9) plane:1];
  uint64_t v56 = +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:v55];
  dstUVTexture = v51->_dstUVTexture;
  v51->_dstUVTexture = (MTLTexture *)v56;

  if (!v51->_tcTexture)
  {
    [(VideoRelightingMetal *)v51 createTexturesWith:(int)Width imgHeight:(int)Height];
    [(VideoRelightingMetal *)v51 configureRenderPipeline];
  }
  if (v51->_debugFace)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"frame = %lld", v51->_frameIndex);
  }
  if (v51->_faceDetected)
  {
    v58 = operator new(0x40uLL);
    __p[1] = v58 + 4;
    __p[2] = v58 + 4;
    _OWORD *v58 = 0u;
    v58[1] = 0u;
    v58[2] = 0u;
    v58[3] = 0u;
    __p[0] = v58;
    v59 = operator new(0x24uLL);
    v132 = (char *)v59 + 36;
    v133 = (char *)v59 + 36;
    _OWORD *v59 = 0u;
    v59[1] = 0u;
    *((_DWORD *)v59 + 8) = 0;
    v131 = v59;
    [(VideoRelightingMetal *)v51 updateModelAndPose:__p camera:&v131];
    [(VideoRelightingMetal *)v51 updateMatrixWithWidth:Width height:Height camera:&v131 pose:__p];
    if (v131)
    {
      v132 = v131;
      operator delete(v131);
    }
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
  }
  [(VideoRelightingMetal *)v51 loadRGBTransformMapsForEffectVersion:1];
  [(VideoRelightingMetal *)v51 updateUniforms:1];
  rgbTransformMapCurrentNearTexturePtr = v51->_rgbTransformMapCurrentNearTexturePtr;
  v61 = [(MTLCommandQueue *)v51->_commandQueue commandBuffer];
  v62 = +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:v61];

  [v62 setLabel:@"video relighting"];
  if (rgbTransformMapCurrentNearTexturePtr)
  {
    double x = v51->_primaryCaptureRect.origin.x;
    size_t v64 = CVPixelBufferGetWidth(a9);
    double y = v51->_primaryCaptureRect.origin.y;
    size_t v66 = CVPixelBufferGetHeight(a9);
    double v67 = v51->_primaryCaptureRect.size.width;
    size_t v68 = CVPixelBufferGetWidth(a9);
    -[CVAFilterColorAlphaToFgBg encodeToCommandBuffer:srcColorTex:srcAlphaTex:dstForegroundTex:normalizedPrimaryCaptureRect:isAfterPreviewStitcher:](v51->_colorAlphaToFgBg, "encodeToCommandBuffer:srcColorTex:srcAlphaTex:dstForegroundTex:normalizedPrimaryCaptureRect:isAfterPreviewStitcher:", v62, v115, v51->_texSkinSegmentationAlias, v51->_texSkinRGBAPyramid, v51->_isAfterPreviewStitcher, x / (double)v64, y / (double)v66, v67 / (double)v68, v51->_primaryCaptureRect.size.height / (double)CVPixelBufferGetHeight(a9));
    [(CVAFilterMaskedVariableBlur *)v51->_blurPyramidForSkinFg encodeBlurPyramidInPlaceToCommandBuffer:v62 inoutTexture:v51->_texSkinRGBAPyramid];
    [(VideoRelightingMetal *)v51 encodeLerpNearFarMapsToCommandBuffer:v62];
    if (v51->_faceDetected)
    {
      [(VideoRelightingMetal *)v51 encodeTCKernelToCommandBuffer:v62];
      [(VideoRelightingMetal *)v51 encodeVertCountKernelToCommandBuffer:v62];
      [(VideoRelightingMetal *)v51 encodeCountKernelToCommandBuffer:v62];
      [(VideoRelightingMetal *)v51 encodeSlideKernelToCommandBuffer:v62];
    }
    [(VideoRelightingMetal *)v51 encodeRelightKernelToCommandBuffer:v62];
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76B70, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1E9F76B70))
  {
    qword_1E9F76B68 = [NSNumber numberWithBool:0];
    __cxa_guard_release(&qword_1E9F76B70);
  }
  if ((byte_1E9F76B78 & 1) == 0)
  {
    HIBYTE(__p[2]) = 19;
    strcpy((char *)__p, "saveRelitModelToPNG");
    sub_1BA81CE64((uint64_t)&qword_1E9F76B68, (uint64_t)__p);
    if (SHIBYTE(__p[2]) < 0) {
      operator delete(__p[0]);
    }
    byte_1E9F76B78 = 1;
  }
  v69 = v134;
  if (v134->_debugFace && [(NSData *)v134->_faceKitStreamedData.landmarks length])
  {
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76B88, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_1E9F76B88))
    {
      qword_1E9F76B80 = [NSNumber numberWithInt:0];
      __cxa_guard_release(&qword_1E9F76B88);
    }
    if ((byte_1E9F76B90 & 1) == 0)
    {
      __p[0] = operator new(0x20uLL);
      *(_OWORD *)&__p[1] = xmmword_1BA86C1A0;
      strcpy((char *)__p[0], "debugDrawFaceStartVertex");
      sub_1BA81CE64((uint64_t)&qword_1E9F76B80, (uint64_t)__p);
      if (SHIBYTE(__p[2]) < 0) {
        operator delete(__p[0]);
      }
      byte_1E9F76B90 = 1;
    }
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76BA0, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_1E9F76BA0))
    {
      qword_1E9F76B98 = [NSNumber numberWithInt:0];
      __cxa_guard_release(&qword_1E9F76BA0);
    }
    if ((byte_1E9F76BA8 & 1) == 0)
    {
      __p[0] = operator new(0x20uLL);
      *(_OWORD *)&__p[1] = xmmword_1BA86C1A0;
      strcpy((char *)__p[0], "debugDrawFaceVertexCount");
      sub_1BA81CE64((uint64_t)&qword_1E9F76B98, (uint64_t)__p);
      if (SHIBYTE(__p[2]) < 0) {
        operator delete(__p[0]);
      }
      byte_1E9F76BA8 = 1;
    }
    CVPixelBufferGetWidthOfPlane(a9, 0);
    CVPixelBufferGetHeightOfPlane(a9, 0);
    v70 = v134;
    p_verticesPos = (id *)&v134->_faceKitStreamedData.verticesPos;
    unint64_t v114 = [(NSData *)v134->_faceKitStreamedData.landmarks length];
    [p_verticesPos[6] bytes];
    [*p_verticesPos bytes];
    uint64_t v72 = (((int)[*p_verticesPos length] / 3) >> 2);
    if (v70->_faceDetected)
    {
      [NSString stringWithFormat:@"Face is detected, nVerts = %d", v72];
    }
    if (v70->_debugFaceDraw && ([(id)qword_1E9F76B80 intValue] & 0x80000000) == 0)
    {
      int v73 = [(id)qword_1E9F76B80 intValue];
      if ((int)([(id)qword_1E9F76B98 intValue] + v73) <= (int)v72)
      {
        signed int v74 = [(id)qword_1E9F76B80 intValue] - 1;
        do
        {
          int v75 = [(id)qword_1E9F76B80 intValue];
          ++v74;
        }
        while (v74 < (int)([(id)qword_1E9F76B98 intValue] + v75));
      }
    }
    v76 = [NSNumber numberWithUnsignedLong:v70->_indexOfCheekLandmark_topLeft];
    v136[0] = v76;
    v77 = [NSNumber numberWithUnsignedLong:v70->_indexOfCheekLandmark_topRight];
    v136[1] = v77;
    v78 = [MEMORY[0x1E4F1C978] arrayWithObjects:v136 count:2];

    v79 = [NSNumber numberWithUnsignedLong:v70->_indexOfCheekLandmark_bottomLeft];
    v135[0] = v79;
    v80 = [NSNumber numberWithUnsignedLong:v70->_indexOfCheekLandmark_bottomRight];
    v135[1] = v80;
    v81 = [MEMORY[0x1E4F1C978] arrayWithObjects:v135 count:2];

    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76BB0, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_1E9F76BB0))
    {
      v105 = +[CVAPreferenceManager defaults];
      char v106 = [v105 BOOLForKey:@"CVAPhotoDrawFaceLandmarks"];

      byte_1E9F76BA9 = v106;
      __cxa_guard_release(&qword_1E9F76BB0);
    }
    v69 = v134;
    if (v134->_debugFaceDraw && v114 >= 8)
    {
      uint64_t v82 = 0;
      if (v114 >> 3 <= 1) {
        uint64_t v83 = 1;
      }
      else {
        uint64_t v83 = v114 >> 3;
      }
      do
      {
        v84 = [NSNumber numberWithUnsignedLong:v82];
        [v78 containsObject:v84];

        v85 = [NSNumber numberWithUnsignedLong:v82];
        [v81 containsObject:v85];

        ++v82;
      }
      while (v83 != v82);
    }
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)v69->_inflightSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  __p[0] = 0;
  __p[1] = __p;
  __p[2] = (void *)0x3032000000;
  __p[3] = sub_1BA83F330;
  __p[4] = sub_1BA83F340;
  v130 = v69->_inflightSemaphore;
  v120[0] = MEMORY[0x1E4F143A8];
  v120[1] = 3221225472;
  v120[2] = sub_1BA83F348;
  v120[3] = &unk_1E62285F8;
  v125 = a3;
  v126 = a4;
  v127 = a8;
  v124 = &v134;
  v120[4] = v69;
  id v86 = v110;
  id v121 = v86;
  id v87 = v111;
  v128 = a9;
  id v122 = v87;
  v123 = __p;
  [v62 addCompletedHandler:v120];
  [v62 commit];
  p_faceKitStreamedData = &v134->_faceKitStreamedData;
  verticesPos = v134->_faceKitStreamedData.verticesPos;
  v134->_faceKitStreamedData.verticesPos = 0;

  intrinsics = p_faceKitStreamedData->intrinsics;
  p_faceKitStreamedData->intrinsics = 0;

  camR = p_faceKitStreamedData->camR;
  p_faceKitStreamedData->camR = 0;

  camT = p_faceKitStreamedData->camT;
  p_faceKitStreamedData->camT = 0;

  poseR = p_faceKitStreamedData->poseR;
  p_faceKitStreamedData->poseR = 0;

  poseT = p_faceKitStreamedData->poseT;
  p_faceKitStreamedData->poseT = 0;

  landmarks = p_faceKitStreamedData->landmarks;
  p_faceKitStreamedData->landmarks = 0;

  p_faceKitStreamedData->confidence = 0.0;
  _Block_object_dispose(__p, 8);
}

- (void)encodeLerpNearFarMapsToCommandBuffer:(id)a3
{
  id v4 = a3;
  float lightMapsNearFarLerp = self->_lightMapsNearFarLerp;
  id v10 = v4;
  if (lightMapsNearFarLerp <= 0.0)
  {
    v7 = &OBJC_IVAR___VideoRelightingMetal__rgbTransformMapCurrentNearTexturePtr;
  }
  else
  {
    if (lightMapsNearFarLerp < 1.0)
    {
      p_rgbTransformMapCurrentTextureInterpolated = &self->_rgbTransformMapCurrentTextureInterpolated;
      -[VideoRelightingMetal encodeAlphaBlendRGBATextureArrayToCommandBuffer:inTexFirst:inTexSecond:outTex:alpha:](self, "encodeAlphaBlendRGBATextureArrayToCommandBuffer:inTexFirst:inTexSecond:outTex:alpha:", v4, self->_rgbTransformMapCurrentNearTexturePtr, self->_rgbTransformMapCurrentFarTexturePtr, self->_rgbTransformMapCurrentTextureInterpolated);
      goto LABEL_7;
    }
    v7 = &OBJC_IVAR___VideoRelightingMetal__rgbTransformMapCurrentFarTexturePtr;
  }
  p_rgbTransformMapCurrentTextureInterpolated = (Class *)((char *)&self->super.super.super.isa + *v7);
LABEL_7:
  uint64_t v8 = *p_rgbTransformMapCurrentTextureInterpolated;
  rgbTransformMapTextureSelectedPtr = self->_rgbTransformMapTextureSelectedPtr;
  self->_rgbTransformMapTextureSelectedPtr = v8;
}

- (void)encodeAlphaBlendRGBATextureArrayToCommandBuffer:(id)a3 inTexFirst:(id)a4 inTexSecond:(id)a5 outTex:(id)a6 alpha:(const float *)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  unint64_t v15 = [a3 computeCommandEncoder];
  v16 = +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:v15];

  long long v20 = 0uLL;
  uint64_t v21 = 0;
  sub_1BA861E2C((uint64_t *)&v20, self->_kernel_AlphaBlendRGBATextureArray);
  [v16 setLabel:@"_kernel_AlphaBlendRGBATextureArray"];
  [v16 setComputePipelineState:self->_kernel_AlphaBlendRGBATextureArray];
  [v16 setTexture:v12 atIndex:0];
  [v16 setTexture:v13 atIndex:1];
  [v16 setBytes:a7 length:4 atIndex:0];
  [v16 setTexture:v14 atIndex:2];
  v19[0] = [v14 width];
  v19[1] = [v14 height];
  v19[2] = 1;
  long long v17 = v20;
  uint64_t v18 = v21;
  [v16 dispatchThreads:v19 threadsPerThreadgroup:&v17];
  [v16 endEncoding];
}

- (void)updateFaceKitStreamedDataFromProcessOutput:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v41 = self;
  id v4 = a3;
  verticesPos = self->_faceKitStreamedData.verticesPos;
  self->_faceKitStreamedData.verticesPos = 0;

  intrinsics = self->_faceKitStreamedData.intrinsics;
  self->_faceKitStreamedData.intrinsics = 0;

  camR = self->_faceKitStreamedData.camR;
  self->_faceKitStreamedData.camR = 0;

  camT = self->_faceKitStreamedData.camT;
  self->_faceKitStreamedData.camT = 0;

  poseR = self->_faceKitStreamedData.poseR;
  self->_faceKitStreamedData.poseR = 0;

  poseT = self->_faceKitStreamedData.poseT;
  self->_faceKitStreamedData.poseT = 0;

  landmarks = self->_faceKitStreamedData.landmarks;
  self->_faceKitStreamedData.landmarks = 0;

  self->_faceKitStreamedData.confidence = 0.0;
  self->_faceDetectedReal = 0;
  self->_faceDetected = 0;
  v42[0] = &unk_1F142EE78;
  v42[1] = &v41;
  v42[3] = v42;
  size_t v44 = v43;
  v43[0] = &unk_1F142EE78;
  v43[1] = &v41;
  if (qword_1E9F768B0 == -1)
  {
    if (!v4) {
      goto LABEL_11;
    }
  }
  else
  {
    dispatch_once(&qword_1E9F768B0, &unk_1F142F248);
    if (!v4) {
      goto LABEL_11;
    }
  }
  if (byte_1E9F768A8)
  {
    id v39 = v4;
    v40 = [v39 objectForKeyedSubscript:qword_1E9F76840];
    if ([v40 count])
    {
      id v12 = [v40 objectAtIndex:0];
      v38 = [v12 objectForKeyedSubscript:qword_1E9F767F0];
      uint64_t v13 = [v38 objectForKeyedSubscript:qword_1E9F767D0];
      id v14 = v41->_faceKitStreamedData.intrinsics;
      v41->_faceKitStreamedData.intrinsics = (NSArray *)v13;

      uint64_t v37 = [v38 objectForKeyedSubscript:qword_1E9F767C8];
      uint64_t v15 = [v37 objectForKeyedSubscript:qword_1E9F767B8];
      v16 = v41->_faceKitStreamedData.camR;
      v41->_faceKitStreamedData.camR = (NSArray *)v15;

      uint64_t v17 = [v37 objectForKeyedSubscript:qword_1E9F767F8];
      uint64_t v18 = v41->_faceKitStreamedData.camT;
      v41->_faceKitStreamedData.camT = (NSArray *)v17;

      v19 = [v12 objectForKeyedSubscript:qword_1E9F767D8];
      long long v20 = [v19 objectForKeyedSubscript:qword_1E9F767A8];

      uint64_t v21 = [v20 objectForKeyedSubscript:qword_1E9F767B8];
      float v22 = v41->_faceKitStreamedData.poseR;
      v41->_faceKitStreamedData.poseR = (NSArray *)v21;

      uint64_t v23 = [v20 objectForKeyedSubscript:qword_1E9F767F8];
      float v24 = v41->_faceKitStreamedData.poseT;
      v41->_faceKitStreamedData.poseT = (NSArray *)v23;

      double v25 = [v12 objectForKeyedSubscript:qword_1E9F767D8];
      v26 = [v25 objectForKeyedSubscript:qword_1E9F767B0];

      uint64_t v27 = [v26 objectForKeyedSubscript:qword_1E9F76828];
      float v28 = v41->_faceKitStreamedData.verticesPos;
      v41->_faceKitStreamedData.verticesPos = (NSData *)v27;

      uint64_t v29 = [v26 objectForKeyedSubscript:qword_1E9F76838];
      v30 = v41->_faceKitStreamedData.landmarks;
      v41->_faceKitStreamedData.landmarks = (NSData *)v29;

      double v31 = v41;
      v32 = v41->_faceKitStreamedData.verticesPos;
      if (v32 && (v33 = [(NSData *)v32 length], double v31 = v41, v33))
      {
        BOOL v34 = [(NSData *)v41->_faceKitStreamedData.landmarks length] != 0;
        double v31 = v41;
      }
      else
      {
        BOOL v34 = 0;
      }
      v31->_faceDetectedReal = v34;
      v41->_faceDetected = v34;
      v35 = [v12 objectForKeyedSubscript:qword_1E9F767C0];
      [v35 floatValue];
      v41->_faceKitStreamedData.confidence = v36;
    }
  }
LABEL_11:
  if (!v44)
  {
    sub_1BA816504();
    __break(1u);
  }
  (*(void (**)(void *))(*v44 + 48))(v44);
  if (v44 == v43)
  {
    (*(void (**)(void *))(v43[0] + 32))(v43);
  }
  else if (v44)
  {
    (*(void (**)(void))(*v44 + 40))();
  }
}

- (void)encodeSlideKernelToCommandBuffer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MTLTexture *)self->_slideTexture width];
  uint64_t v6 = [(MTLTexture *)self->_slideTexture height];
  long long v12 = 0uLL;
  uint64_t v13 = 0;
  sub_1BA861E2C((uint64_t *)&v12, self->_kernel_Slide);
  v7 = [v4 computeCommandEncoder];
  uint64_t v8 = +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:v7];

  [v8 setLabel:@"_kernel_Slide"];
  [v8 setComputePipelineState:self->_kernel_Slide];
  [v8 setTexture:self->_tcTexture atIndex:0];
  [v8 setTexture:self->_slideTexture atIndex:1];
  [v8 setBytes:&self->_uniformBuffer_slide length:8 atIndex:0];
  v11[0] = v5;
  v11[1] = v6;
  v11[2] = 1;
  long long v9 = v12;
  uint64_t v10 = v13;
  [v8 dispatchThreads:v11 threadsPerThreadgroup:&v9];
  [v8 endEncoding];
}

- (void)encodeCountKernelToCommandBuffer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MTLTexture *)self->_countTexture width];
  uint64_t v6 = [(MTLTexture *)self->_countTexture height];
  long long v12 = 0uLL;
  uint64_t v13 = 0;
  sub_1BA861E2C((uint64_t *)&v12, self->_kernel_Count);
  v7 = [v4 computeCommandEncoder];
  uint64_t v8 = +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:v7];

  [v8 setLabel:@"_kernel_Count"];
  [v8 setComputePipelineState:self->_kernel_Count];
  [v8 setTexture:self->_vertCountTexture atIndex:0];
  [v8 setTexture:self->_countTexture atIndex:1];
  v11[0] = v5;
  v11[1] = v6;
  v11[2] = 1;
  long long v9 = v12;
  uint64_t v10 = v13;
  [v8 dispatchThreads:v11 threadsPerThreadgroup:&v9];
  [v8 endEncoding];
}

- (void)encodeVertCountKernelToCommandBuffer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MTLTexture *)self->_vertCountTexture width];
  uint64_t v6 = [(MTLTexture *)self->_vertCountTexture height];
  long long v12 = 0uLL;
  uint64_t v13 = 0;
  sub_1BA861E2C((uint64_t *)&v12, self->_kernel_CountVertical);
  v7 = [v4 computeCommandEncoder];
  uint64_t v8 = +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:v7];

  [v8 setLabel:@"_kernel_CountVertical"];
  [v8 setComputePipelineState:self->_kernel_CountVertical];
  [v8 setTexture:self->_tcTexture atIndex:0];
  [v8 setTexture:self->_vertCountTexture atIndex:1];
  v11[0] = v5;
  v11[1] = v6;
  v11[2] = 1;
  long long v9 = v12;
  uint64_t v10 = v13;
  [v8 dispatchThreads:v11 threadsPerThreadgroup:&v9];
  [v8 endEncoding];
}

- (void)encodeRelightKernelToCommandBuffer:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(MTLTexture *)self->_dstTexture width];
  unint64_t v6 = [(MTLTexture *)self->_dstTexture height];
  double x = self->_primaryCaptureRect.origin.x;
  unint64_t v8 = [(MTLTexture *)self->_dstTexture width];
  float v9 = x;
  v29[0] = v9 / (float)v8;
  double y = self->_primaryCaptureRect.origin.y;
  unint64_t v11 = [(MTLTexture *)self->_dstTexture height];
  float v12 = y;
  v29[1] = v12 / (float)v11;
  double width = self->_primaryCaptureRect.size.width;
  unint64_t v14 = [(MTLTexture *)self->_dstTexture width];
  float v15 = width;
  v29[2] = v15 / (float)v14;
  double height = self->_primaryCaptureRect.size.height;
  unint64_t v17 = [(MTLTexture *)self->_dstTexture height];
  float v18 = height;
  v29[3] = v18 / (float)v17;
  BOOL isAfterPreviewStitcher = self->_isAfterPreviewStitcher;
  BOOL trustAlpha = self->_trustAlpha;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76AF0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1E9F76AF0))
  {
    qword_1E9F76AE8 = [NSNumber numberWithInt:0xFFFFFFFFLL];
    __cxa_guard_release(&qword_1E9F76AF0);
  }
  if ((byte_1E9F76AF8 & 1) == 0)
  {
    char v27 = 12;
    strcpy((char *)__p, "lightMapType");
    sub_1BA81CE64((uint64_t)&qword_1E9F76AE8, (uint64_t)__p);
    if (v27 < 0) {
      operator delete(__p[0]);
    }
    byte_1E9F76AF8 = 1;
  }
  long long v20 = self->_kernel_Relight[1][!trustAlpha][[(id)qword_1E9F76AE8 intValue] == 1];
  uint64_t v21 = [v4 computeCommandEncoder];
  float v22 = +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:v21];

  [v22 setLabel:@"krnRelight"];
  [v22 setComputePipelineState:v20];
  [v22 setTexture:self->_srcTexture atIndex:0];
  [v22 setTexture:self->_dstTexture atIndex:1];
  [v22 setTexture:self->_dstUVTexture atIndex:2];
  [v22 setTexture:self->_tcTexture atIndex:3];
  [v22 setTexture:self->_slideTexture atIndex:4];
  [v22 setTexture:self->_alphaTexture atIndex:5];
  [v22 setTexture:self->_countTexture atIndex:7];
  [v22 setTexture:self->_rgbTransformMapTextureSelectedPtr atIndex:18];
  [v22 setTexture:self->_texSelectedColorCube atIndex:22];
  [v22 setTexture:self->_texSkinSegmentationAlias atIndex:27];
  [v22 setTexture:self->_texSkinRGBAPyramid atIndex:28];
  [v22 setBytes:&self->_anon_220[4] length:88 atIndex:0];
  [v22 setBytes:v29 length:16 atIndex:1];
  [v22 setBytes:&isAfterPreviewStitcher length:1 atIndex:2];
  v25[0] = (unint64_t)(double)(v5 >> 1);
  v25[1] = (unint64_t)(double)(v6 >> 1);
  v25[2] = 1;
  uint64_t v24 = 1;
  long long v23 = xmmword_1BA86C8E8;
  [v22 dispatchThreads:v25 threadsPerThreadgroup:&v23];
  [v22 endEncoding];
}

- (void)encodeTCKernelToCommandBuffer:(id)a3
{
  id v4 = [a3 renderCommandEncoderWithDescriptor:self->_tcRenderDesc];
  id v6 = +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:v4];

  unint64_t v5 = [(CVAPhotoMTLRingBuffer *)self->_vertexBuffer currentBuffer];
  [v6 setVertexBuffer:v5 offset:0 atIndex:0];

  [v6 setVertexBytes:self->_anon_60 length:64 atIndex:1];
  [v6 setLabel:@"_tcKernel"];
  [v6 setRenderPipelineState:self->_tcKernel];
  [v6 setCullMode:2];
  [v6 setFrontFacingWinding:1];
  [v6 setDepthStencilState:self->_depthStencilState];
  objc_msgSend(v6, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:", 3, (unint64_t)-[MTLBuffer length](self->_indexBufferImmutable, "length") >> 1, 0, self->_indexBufferImmutable, 0);
  [v6 endEncoding];
}

- (void)loadRGBTransformMapsForEffectVersion:(BOOL)a3
{
  BOOL v3 = a3;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76AD8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1E9F76AD8))
  {
    qword_1E9F76AD0 = [NSNumber numberWithInt:0xFFFFFFFFLL];
    __cxa_guard_release(&qword_1E9F76AD8);
  }
  if ((byte_1E9F76AE0 & 1) == 0)
  {
    HIBYTE(__p[2]) = 12;
    strcpy((char *)__p, "lightMapType");
    sub_1BA81CE64((uint64_t)&qword_1E9F76AD0, (uint64_t)__p);
    if (SHIBYTE(__p[2]) < 0) {
      operator delete(__p[0]);
    }
    byte_1E9F76AE0 = 1;
  }
  if ([(id)qword_1E9F76AD0 intValue] == -1)
  {
    rgbTransformMapCurrentNearTexturePtr = self->_rgbTransformMapCurrentNearTexturePtr;
    self->_rgbTransformMapCurrentNearTexturePtr = 0;

    rgbTransformMapCurrentFarTexturePtr = self->_rgbTransformMapCurrentFarTexturePtr;
    self->_rgbTransformMapCurrentFarTexturePtr = 0;

    rgbTransformMapTextureSelectedPtr = self->_rgbTransformMapTextureSelectedPtr;
    self->_rgbTransformMapTextureSelectedPtr = 0;
    goto LABEL_55;
  }
  BOOL v5 = v3;
  id v6 = &self->_rgbTransformMapContourNearTexture[v3];
  if (!*v6)
  {
    __p[0] = operator new(0x30uLL);
    *(_OWORD *)&__p[1] = xmmword_1BA86C1B0;
    strcpy((char *)__p[0], "rgbTransformMap_Contour_NEAR_fp16_RGBAslice");
    [(VideoRelightingMetal *)self loadRGBTransformMapsOnceTo:&self->_rgbTransformMapCurrentTextureInterpolated namePrefix:__p forIntermediateResults:1];
    if (SHIBYTE(__p[2]) < 0) {
      operator delete(__p[0]);
    }
    if (v3) {
      v7 = "rgbTransformMap_";
    }
    else {
      v7 = "rgbTransformMap_v1_";
    }
    if (v3) {
      size_t v8 = 16;
    }
    else {
      size_t v8 = 19;
    }
    HIBYTE(__p[2]) = v8;
    memcpy(__p, v7, v8);
    *((unsigned char *)__p + v8) = 0;
    v32.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x20uLL);
    *(_OWORD *)&v32.__r_.__value_.__r.__words[1] = xmmword_1BA86C110;
    strcpy(v32.__r_.__value_.__l.__data_, "Contour_NEAR_fp16_RGBAslice");
    if (SHIBYTE(__p[2]) >= 0) {
      float v9 = __p;
    }
    else {
      float v9 = (void **)__p[0];
    }
    if (SHIBYTE(__p[2]) >= 0) {
      std::string::size_type v10 = HIBYTE(__p[2]);
    }
    else {
      std::string::size_type v10 = (std::string::size_type)__p[1];
    }
    unint64_t v11 = std::string::insert(&v32, 0, (const std::string::value_type *)v9, v10);
    long long v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
    std::string::size_type v34 = v11->__r_.__value_.__r.__words[2];
    *(_OWORD *)uint64_t v33 = v12;
    v11->__r_.__value_.__l.__size_ = 0;
    v11->__r_.__value_.__r.__words[2] = 0;
    v11->__r_.__value_.__r.__words[0] = 0;
    [(VideoRelightingMetal *)self loadRGBTransformMapsOnceTo:v6 namePrefix:v33 forIntermediateResults:0];
    if (SHIBYTE(v34) < 0)
    {
      operator delete(v33[0]);
      if ((SHIBYTE(v32.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
        goto LABEL_24;
      }
    }
    else if ((SHIBYTE(v32.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      goto LABEL_24;
    }
    operator delete(v32.__r_.__value_.__l.__data_);
LABEL_24:
    v32.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x20uLL);
    long long v31 = xmmword_1BA86C1C0;
    *(_OWORD *)&v32.__r_.__value_.__r.__words[1] = xmmword_1BA86C1C0;
    strcpy(v32.__r_.__value_.__l.__data_, "Contour_FAR_fp16_RGBAslice");
    if (SHIBYTE(__p[2]) >= 0) {
      uint64_t v13 = __p;
    }
    else {
      uint64_t v13 = (void **)__p[0];
    }
    if (SHIBYTE(__p[2]) >= 0) {
      std::string::size_type v14 = HIBYTE(__p[2]);
    }
    else {
      std::string::size_type v14 = (std::string::size_type)__p[1];
    }
    float v15 = std::string::insert(&v32, 0, (const std::string::value_type *)v13, v14);
    long long v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
    std::string::size_type v34 = v15->__r_.__value_.__r.__words[2];
    *(_OWORD *)uint64_t v33 = v16;
    v15->__r_.__value_.__l.__size_ = 0;
    v15->__r_.__value_.__r.__words[2] = 0;
    v15->__r_.__value_.__r.__words[0] = 0;
    [(VideoRelightingMetal *)self loadRGBTransformMapsOnceTo:&self->_rgbTransformMapContourFarTexture[v5] namePrefix:v33 forIntermediateResults:0];
    if (SHIBYTE(v34) < 0)
    {
      operator delete(v33[0]);
      if ((SHIBYTE(v32.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
        goto LABEL_32;
      }
    }
    else if ((SHIBYTE(v32.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      goto LABEL_32;
    }
    operator delete(v32.__r_.__value_.__l.__data_);
LABEL_32:
    v32.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x20uLL);
    *(_OWORD *)&v32.__r_.__value_.__r.__words[1] = xmmword_1BA86C1C0;
    strcpy(v32.__r_.__value_.__l.__data_, "Studio_NEAR_fp16_RGBAslice");
    if (SHIBYTE(__p[2]) >= 0) {
      unint64_t v17 = __p;
    }
    else {
      unint64_t v17 = (void **)__p[0];
    }
    if (SHIBYTE(__p[2]) >= 0) {
      std::string::size_type v18 = HIBYTE(__p[2]);
    }
    else {
      std::string::size_type v18 = (std::string::size_type)__p[1];
    }
    v19 = std::string::insert(&v32, 0, (const std::string::value_type *)v17, v18);
    long long v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
    std::string::size_type v34 = v19->__r_.__value_.__r.__words[2];
    *(_OWORD *)uint64_t v33 = v20;
    v19->__r_.__value_.__l.__size_ = 0;
    v19->__r_.__value_.__r.__words[2] = 0;
    v19->__r_.__value_.__r.__words[0] = 0;
    [(VideoRelightingMetal *)self loadRGBTransformMapsOnceTo:&self->_rgbTransformMapStudioNearTexture[v5] namePrefix:v33 forIntermediateResults:0];
    if (SHIBYTE(v34) < 0)
    {
      operator delete(v33[0]);
      if ((SHIBYTE(v32.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
        goto LABEL_40;
      }
    }
    else if ((SHIBYTE(v32.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      goto LABEL_40;
    }
    operator delete(v32.__r_.__value_.__l.__data_);
LABEL_40:
    v32.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x20uLL);
    *(_OWORD *)&v32.__r_.__value_.__r.__words[1] = xmmword_1BA86C1D0;
    strcpy(v32.__r_.__value_.__l.__data_, "Studio_FAR_fp16_RGBAslice");
    if (SHIBYTE(__p[2]) >= 0) {
      uint64_t v21 = __p;
    }
    else {
      uint64_t v21 = (void **)__p[0];
    }
    if (SHIBYTE(__p[2]) >= 0) {
      std::string::size_type v22 = HIBYTE(__p[2]);
    }
    else {
      std::string::size_type v22 = (std::string::size_type)__p[1];
    }
    long long v23 = std::string::insert(&v32, 0, (const std::string::value_type *)v21, v22);
    long long v24 = *(_OWORD *)&v23->__r_.__value_.__l.__data_;
    std::string::size_type v34 = v23->__r_.__value_.__r.__words[2];
    *(_OWORD *)uint64_t v33 = v24;
    v23->__r_.__value_.__l.__size_ = 0;
    v23->__r_.__value_.__r.__words[2] = 0;
    v23->__r_.__value_.__r.__words[0] = 0;
    [(VideoRelightingMetal *)self loadRGBTransformMapsOnceTo:&self->_rgbTransformMapStudioFarTexture[v5] namePrefix:v33 forIntermediateResults:0];
    if (SHIBYTE(v34) < 0)
    {
      operator delete(v33[0]);
      if ((SHIBYTE(v32.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_48:
        if ((SHIBYTE(__p[2]) & 0x80000000) == 0) {
          goto LABEL_49;
        }
LABEL_64:
        operator delete(__p[0]);
        goto LABEL_49;
      }
    }
    else if ((SHIBYTE(v32.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      goto LABEL_48;
    }
    operator delete(v32.__r_.__value_.__l.__data_);
    if ((SHIBYTE(__p[2]) & 0x80000000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_64;
  }
LABEL_49:
  if (objc_msgSend((id)qword_1E9F76AD0, "intValue", v31) != 1) {
    id v6 = &self->_rgbTransformMapStudioNearTexture[v5];
  }
  objc_storeStrong((id *)&self->_rgbTransformMapCurrentNearTexturePtr, *v6);
  int v25 = [(id)qword_1E9F76AD0 intValue];
  v26 = &OBJC_IVAR___VideoRelightingMetal__rgbTransformMapStudioFarTexture;
  if (v25 == 1) {
    v26 = &OBJC_IVAR___VideoRelightingMetal__rgbTransformMapContourFarTexture;
  }
  objc_storeStrong((id *)&self->_rgbTransformMapCurrentFarTexturePtr, *(id *)((char *)&self->super.super.super.isa + 8 * v5 + *v26));
  char v27 = self->_rgbTransformMapCurrentTextureInterpolated;
  rgbTransformMapTextureSelectedPtr = self->_rgbTransformMapTextureSelectedPtr;
  self->_rgbTransformMapTextureSelectedPtr = v27;
LABEL_55:
}

- (void)loadRGBTransformMapsOnceTo:(id *)a3 namePrefix:(const void *)a4 forIntermediateResults:(BOOL)a5
{
  BOOL v5 = a5;
  if ((byte_1E9F76AC1 & 1) == 0)
  {
    float v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    v46[0] = 0;
    std::string::size_type v10 = [v9 attributesOfItemAtPath:@"/System/Library/PrivateFrameworks/AppleCVAPhoto.framework/Resources/rgbTransformMap_Contour_NEAR_fp16_RGBAslice0" error:v46];
    id v11 = v46[0];
    qword_1E9F76AC8 = [v10 fileSize];

    if (v11) {
      qword_1E9F76AC8 = 0;
    }
    byte_1E9F76AC1 = 1;
  }
  if (qword_1E9F76AC8 && !*a3)
  {
    int v12 = (int)sqrtf((float)((unint64_t)qword_1E9F76AC8 >> 2) + 0.5);
    if (8 * v12 * (uint64_t)v12 == 2 * qword_1E9F76AC8)
    {
      uint64_t v13 = objc_opt_new();
      std::string::size_type v14 = +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:v13];

      [v14 setTextureType:3];
      [v14 setPixelFormat:115];
      unint64_t v15 = (unint64_t)v12 >> 1;
      [v14 setWidth:v15];
      [v14 setHeight:v12];
      [v14 setMipmapLevelCount:1];
      [v14 setArrayLength:12];
      if (v5) {
        uint64_t v16 = 3;
      }
      else {
        uint64_t v16 = 1;
      }
      [v14 setUsage:v16];
      unint64_t v17 = (void *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v14];
      std::string::size_type v18 = +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:v17];
      id v19 = *a3;
      *a3 = v18;

      unint64_t v20 = v15 * v12;
      if (4 * v20)
      {
        if (((4 * v20) & 0x8000000000000000) != 0) {
          abort();
        }
        size_t v21 = 8 * v20;
        std::string::size_type v22 = (char *)operator new(8 * v20);
        bzero(v22, v21);
        long long v23 = &v22[v21];
        long long v24 = v14;
        if (!v5) {
          goto LABEL_21;
        }
      }
      else
      {
        std::string::size_type v22 = 0;
        long long v23 = 0;
        long long v24 = v14;
        if (!v5)
        {
LABEL_21:
          unint64_t v25 = 0;
          size_t v26 = (v23 - v22) >> 1;
          do
          {
            char v27 = operator new(0x48uLL);
            v42.__r_.__value_.__r.__words[0] = (std::string::size_type)v27;
            *(_OWORD *)&v42.__r_.__value_.__r.__words[1] = xmmword_1BA86C1E0;
            qmemcpy(v27, "/System/Library/PrivateFrameworks/AppleCVAPhoto.framework/Resources/", 68);
            char v28 = *((unsigned char *)a4 + 23);
            if (v28 >= 0) {
              uint64_t v29 = (const std::string::value_type *)a4;
            }
            else {
              uint64_t v29 = *(const std::string::value_type **)a4;
            }
            if (v28 >= 0) {
              std::string::size_type v30 = *((unsigned __int8 *)a4 + 23);
            }
            else {
              std::string::size_type v30 = *((void *)a4 + 1);
            }
            v27[68] = 0;
            long long v31 = std::string::append(&v42, v29, v30);
            long long v32 = *(_OWORD *)&v31->__r_.__value_.__l.__data_;
            v43.__r_.__value_.__r.__words[2] = v31->__r_.__value_.__r.__words[2];
            *(_OWORD *)&v43.__r_.__value_.__l.__data_ = v32;
            v31->__r_.__value_.__l.__size_ = 0;
            v31->__r_.__value_.__r.__words[2] = 0;
            v31->__r_.__value_.__r.__words[0] = 0;
            std::to_string(&v41, v25);
            if ((v41.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              uint64_t v33 = &v41;
            }
            else {
              uint64_t v33 = (std::string *)v41.__r_.__value_.__r.__words[0];
            }
            if ((v41.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              std::string::size_type size = HIBYTE(v41.__r_.__value_.__r.__words[2]);
            }
            else {
              std::string::size_type size = v41.__r_.__value_.__l.__size_;
            }
            v35 = std::string::append(&v43, (const std::string::value_type *)v33, size);
            long long v36 = *(_OWORD *)&v35->__r_.__value_.__l.__data_;
            int64_t v45 = v35->__r_.__value_.__r.__words[2];
            long long v44 = v36;
            v35->__r_.__value_.__l.__size_ = 0;
            v35->__r_.__value_.__r.__words[2] = 0;
            v35->__r_.__value_.__r.__words[0] = 0;
            if (v45 >= 0) {
              uint64_t v37 = (const char *)&v44;
            }
            else {
              uint64_t v37 = (const char *)v44;
            }
            v38 = fopen(v37, "rb");
            if (SHIBYTE(v45) < 0)
            {
              operator delete((void *)v44);
              if ((SHIBYTE(v41.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
              {
LABEL_39:
                if ((SHIBYTE(v43.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
                  goto LABEL_40;
                }
                goto LABEL_45;
              }
            }
            else if ((SHIBYTE(v41.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
            {
              goto LABEL_39;
            }
            operator delete(v41.__r_.__value_.__l.__data_);
            if ((SHIBYTE(v43.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
            {
LABEL_40:
              if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0) {
                goto LABEL_46;
              }
              goto LABEL_41;
            }
LABEL_45:
            operator delete(v43.__r_.__value_.__l.__data_);
            if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0) {
LABEL_46:
            }
              operator delete(v42.__r_.__value_.__l.__data_);
LABEL_41:
            fread(v22, 2uLL, v26, v38);
            id v39 = *a3;
            memset(v40, 0, 24);
            v40[3] = (unint64_t)v12 >> 1;
            v40[4] = v12;
            v40[5] = 1;
            [v39 replaceRegion:v40 mipmapLevel:0 slice:v25 withBytes:v22 bytesPerRow:(4 * v12) & 0xFFFFFFFFFFFFFFF8 bytesPerImage:0];
            fclose(v38);
            ++v25;
            long long v24 = v14;
          }
          while (v25 != 12);
        }
      }
      if (v22) {
        operator delete(v22);
      }
    }
    else
    {
      NSLog(&cfstr_CvaphotoErrorW.isa, a2);
      qword_1E9F76AC8 = 0;
    }
  }
}

- (void)updateUniforms:(BOOL)a3
{
  BOOL v3 = a3;
  self->_uniformBuffer_slide = *(SlideUniforms *)&self->_faceModelCenterProjected[4];
  BOOL v5 = &self->_anon_220[4];
  uint64_t v6 = [(MTLTexture *)self->_dstTexture width];
  uint64_t v7 = [(MTLTexture *)self->_dstTexture height];
  v8.i64[0] = v6;
  v8.i64[1] = v7;
  *(float32x2_t *)BOOL v5 = vdiv_f32((float32x2_t)0x4000000040000000, vcvt_f32_f64(vcvtq_f64_u64(v8)));
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F769F0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1E9F769F0))
  {
    qword_1E9F769E8 = [NSNumber numberWithFloat:0.0];
    __cxa_guard_release(&qword_1E9F769F0);
  }
  if ((byte_1E9F769F8 & 1) == 0)
  {
    HIBYTE(v221[2]) = 15;
    strcpy((char *)v221, "backgroundAlpha");
    sub_1BA81CE64((uint64_t)&qword_1E9F769E8, (uint64_t)v221);
    if (SHIBYTE(v221[2]) < 0) {
      operator delete(v221[0]);
    }
    byte_1E9F769F8 = 1;
  }
  backgroundColor = self->_backgroundColor;
  [(id)qword_1E9F769E8 floatValue];
  unsigned int v218 = v10;
  id v11 = backgroundColor;
  [(CIColor *)v11 red];
  float64_t v216 = v12;
  [(CIColor *)v11 green];
  float64_t v214 = v13;
  [(CIColor *)v11 blue];
  v14.f64[0] = v216;
  v14.f64[1] = v214;
  *(float *)&double v15 = v15;
  LODWORD(v214) = LODWORD(v15);
  float32x2_t v217 = vcvt_f32_f64(v14);

  *(float32x2_t *)v16.f32 = v217;
  v16.i64[1] = __PAIR64__(v218, LODWORD(v214));
  *((float16x4_t *)v5 + 1) = vcvt_f16_f32(v16);
  if ((byte_1E9F769F9 & 1) == 0)
  {
    strcpy((char *)v221, "userFriendlyConfigName");
    HIBYTE(v221[2]) = 22;
    sub_1BA81CE64((uint64_t)&qword_1E9F76510, (uint64_t)v221);
    if (SHIBYTE(v221[2]) < 0) {
      operator delete(v221[0]);
    }
    byte_1E9F769F9 = 1;
  }
  p_texSelectedColorCube = &self->_texSelectedColorCube;
  texSelectedColorCube = self->_texSelectedColorCube;
  self->_texSelectedColorCube = 0;

  if (![(id)qword_1E9F76510 isEqualToString:@"STAGE LIGHT MONO"])
  {
    if ([(id)qword_1E9F76510 isEqualToString:@"STAGE LIGHT CUSTOM MONO"])
    {
      if (v3)
      {
        id v19 = self;
        uint64_t v20 = 6;
        goto LABEL_16;
      }
LABEL_31:
      size_t v21 = *p_texSelectedColorCube;
      *p_texSelectedColorCube = 0;
      goto LABEL_32;
    }
    if ([(id)qword_1E9F76510 isEqualToString:@"STUDIO LIGHT"])
    {
      if (v3) {
        uint64_t v24 = 3;
      }
      else {
        uint64_t v24 = 0;
      }
    }
    else
    {
      if (([(id)qword_1E9F76510 isEqualToString:@"CONTOUR LIGHT"] & 1) == 0
        && ![(id)qword_1E9F76510 isEqualToString:@"STAGE LIGHT"])
      {
        goto LABEL_31;
      }
      if (v3) {
        uint64_t v24 = 4;
      }
      else {
        uint64_t v24 = 1;
      }
    }
    long long v23 = [(VideoRelightingMetal *)self getInternalColorCube:v24];
LABEL_30:
    size_t v21 = *p_texSelectedColorCube;
    *p_texSelectedColorCube = v23;
    goto LABEL_32;
  }
  if (!v3)
  {
    colorCubeUserData = self->_colorCubeUserData;
    if (colorCubeUserData) {
      colorCubeUserData = self->_texColorCubeUserData;
    }
    long long v23 = colorCubeUserData;
    goto LABEL_30;
  }
  id v19 = self;
  uint64_t v20 = 5;
LABEL_16:
  size_t v21 = [(VideoRelightingMetal *)v19 getInternalColorCube:v20];
  objc_storeStrong((id *)&self->_texSelectedColorCube, v21);
LABEL_32:

  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76A08, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1E9F76A08))
  {
    qword_1E9F76A00 = [NSNumber numberWithBool:1];
    __cxa_guard_release(&qword_1E9F76A08);
  }
  if ((byte_1E9F76A10 & 1) == 0)
  {
    HIBYTE(v221[2]) = 15;
    strcpy((char *)v221, "applyCubeOnFace");
    sub_1BA81CE64((uint64_t)&qword_1E9F76A00, (uint64_t)v221);
    if (SHIBYTE(v221[2]) < 0) {
      operator delete(v221[0]);
    }
    byte_1E9F76A10 = 1;
  }
  *((short float *)v5 + 11) = (short float)([(id)qword_1E9F76A00 BOOLValue] ^ 1);
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76A20, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1E9F76A20))
  {
    LODWORD(v198) = 1.0;
    qword_1E9F76A18 = [NSNumber numberWithFloat:v198];
    __cxa_guard_release(&qword_1E9F76A20);
  }
  if ((byte_1E9F76A28 & 1) == 0)
  {
    HIBYTE(v221[2]) = 21;
    strcpy((char *)v221, "colorCubeIntensity_v1");
    sub_1BA81CE64((uint64_t)&qword_1E9F76A18, (uint64_t)v221);
    if (SHIBYTE(v221[2]) < 0) {
      operator delete(v221[0]);
    }
    byte_1E9F76A28 = 1;
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76A38, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1E9F76A38))
  {
    LODWORD(v199) = 1.0;
    qword_1E9F76A30 = [NSNumber numberWithFloat:v199];
    __cxa_guard_release(&qword_1E9F76A38);
  }
  if ((byte_1E9F76A40 & 1) == 0)
  {
    HIBYTE(v221[2]) = 21;
    strcpy((char *)v221, "colorCubeIntensity_v2");
    sub_1BA81CE64((uint64_t)&qword_1E9F76A30, (uint64_t)v221);
    if (SHIBYTE(v221[2]) < 0) {
      operator delete(v221[0]);
    }
    byte_1E9F76A40 = 1;
  }
  unint64_t v25 = &qword_1E9F76A18;
  if (v3) {
    unint64_t v25 = &qword_1E9F76A30;
  }
  [(id)*v25 floatValue];
  __asm { FCVT            H0, S0 }
  *((_WORD *)v5 + 12) = _S0;
  if ([(id)qword_1E9F76510 isEqualToString:@"STAGE LIGHT"]) {
    unsigned int v30 = 1;
  }
  else {
    unsigned int v30 = [(id)qword_1E9F76510 isEqualToString:@"STAGE LIGHT MONO"];
  }
  *((short float *)v5 + 13) = (short float)v30;
  _S0 = self->_vignettingScale;
  __asm { FCVT            H0, S0 }
  *((_WORD *)v5 + 14) = LOWORD(_S0);
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76A48, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1E9F76A48))
  {
    v200 = +[CVAPreferenceManager defaults];
    char v201 = [v200 BOOLForKey:@"CVAPhotoDebugStyle"];

    byte_1E9F76A41 = v201;
    __cxa_guard_release(&qword_1E9F76A48);
  }
  if (byte_1E9F76A41)
  {
    _H0 = *((_WORD *)v5 + 12);
    __asm { FCVT            D0, H0 }
    [NSString stringWithFormat:@"ColorCube.intensitdouble y = %.2f", _D0];

    objc_msgSend(NSString, "stringWithFormat:", @"ColorCube.applyOnFace = %d", objc_msgSend((id)qword_1E9F76A00, "intValue"));
  }
  float v34 = 1.0;
  unint64_t v35 = 0x1E9F75000;
  float v36 = 1.0;
  float v37 = 1.0;
  if (self->_faceDetected)
  {
    float32x4_t v211 = *(float32x4_t *)&self->_anon_2c0[20];
    float32x4_t v212 = *(float32x4_t *)&self->_anon_2c0[4];
    float32x4_t v213 = *(float32x4_t *)&self->_anon_2c0[36];
    float32x4_t v215 = *(float32x4_t *)&self->_anon_2c0[52];
    float32x4_t v38 = vmlaq_f32(vmlaq_f32(vmlaq_f32(v212, (float32x4_t)0, v211), (float32x4_t)0, v213), (float32x4_t)0, v215);
    int32x4_t v39 = (int32x4_t)vmulq_f32(v38, v38);
    v39.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v39, 2), vadd_f32(*(float32x2_t *)v39.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v39.i8, 1))).u32[0];
    float32x2_t v40 = vrsqrte_f32((float32x2_t)v39.u32[0]);
    float32x2_t v41 = vmul_f32(v40, vrsqrts_f32((float32x2_t)v39.u32[0], vmul_f32(v40, v40)));
    float32x4_t v42 = vmulq_n_f32(v38, vmul_f32(v41, vrsqrts_f32((float32x2_t)v39.u32[0], vmul_f32(v41, v41))).f32[0]);
    float32x4_t v43 = *(float32x4_t *)&self->_face3DCenter[4];
    int32x4_t v44 = (int32x4_t)vmulq_f32(v43, v43);
    v44.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v44, 2), vadd_f32(*(float32x2_t *)v44.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v44.i8, 1))).u32[0];
    float32x2_t v45 = vrsqrte_f32((float32x2_t)v44.u32[0]);
    float32x2_t v46 = vmul_f32(v45, vrsqrts_f32((float32x2_t)v44.u32[0], vmul_f32(v45, v45)));
    float32x4_t v47 = vmulq_f32(v42, vmulq_n_f32(v43, vmul_f32(v46, vrsqrts_f32((float32x2_t)v44.u32[0], vmul_f32(v46, v46))).f32[0]));
    _S12 = acosf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v47, 2), vaddq_f32(v47, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v47.f32, 1))).f32[0])+ -1.57079633;
    if (v3)
    {
      float v49 = (float)(fabsf(_S12 * 57.296) + -15.0) / 30.0;
      float v50 = 1.0 - v49;
      if (v49 >= 1.0) {
        float v50 = 0.0;
      }
      if (v49 >= 0.0) {
        float v36 = v50;
      }
      else {
        float v36 = 1.0;
      }
    }
    v51 = [(NSData *)self->_faceKitStreamedData.landmarks bytes];
    unint64_t v52 = [(MTLTexture *)self->_dstTexture width];
    unint64_t v53 = [(MTLTexture *)self->_dstTexture height];
    if (!self->_trustAlpha)
    {
      v55 = (float *)&v51[8 * self->_indexOfCheekLandmark_bottomRight];
      v56.f32[0] = *v55 / (float)v52;
      v56.f32[1] = v55[1] / (float)v53;
      float32x2_t v210 = v56;
      v57 = (float *)&v51[8 * self->_indexOfCheekLandmark_topRight];
      v58.f32[0] = *v57 / (float)v52;
      v58.f32[1] = v57[1] / (float)v53;
      v59 = (float *)&v51[8 * self->_indexOfCheekLandmark_bottomLeft];
      v60.f32[0] = *v59 / (float)v52;
      v60.f32[1] = v59[1] / (float)v53;
      v61 = (float *)&v51[8 * self->_indexOfCheekLandmark_topLeft];
      v62.f32[0] = *v61 / (float)v52;
      v62.f32[1] = v61[1] / (float)v53;
      *(float32x2_t *)_Q1.f32 = vadd_f32(v56, vadd_f32(v58, vadd_f32(v60, v62)));
      __asm { FMOV            V3.2S, #0.25 }
      float32x2_t v64 = vmul_f32(*(float32x2_t *)_Q1.f32, _D3);
      *((float32x2_t *)v5 + 4) = v64;
      __asm { FCVT            H1, S12 }
      *((_WORD *)v5 + 20) = _Q1.i16[0];
      float32x2_t v65 = vsub_f32(v62, v64);
      float32x2_t v207 = v60;
      float32x2_t v208 = vsub_f32(v58, v64);
      *(float32x2_t *)_Q1.f32 = vadd_f32(v65, v208);
      float32x2_t v66 = vmul_f32(*(float32x2_t *)_Q1.f32, *(float32x2_t *)_Q1.f32);
      v66.i32[0] = vadd_f32(v66, (float32x2_t)vdup_lane_s32((int32x2_t)v66, 1)).u32[0];
      float32x2_t v67 = vrsqrte_f32((float32x2_t)v66.u32[0]);
      float32x2_t v68 = vmul_f32(v67, vrsqrts_f32((float32x2_t)v66.u32[0], vmul_f32(v67, v67)));
      _D2 = vneg_f32((float32x2_t)vdup_lane_s32((int32x2_t)vmul_f32(v68, vrsqrts_f32((float32x2_t)v66.u32[0], vmul_f32(v68, v68))), 0));
      *(float32x2_t *)_Q1.f32 = vmul_f32(*(float32x2_t *)_Q1.f32, _D2);
      _D2.i32[0] = _Q1.i32[1];
      float32x2_t v70 = (float32x2_t)vzip1_s32(vdup_lane_s32(*(int32x2_t *)_Q1.f32, 1), *(int32x2_t *)_Q1.f32);
      float32x4_t v71 = _Q1;
      v71.i32[1] = vneg_f32(*(float32x2_t *)&_Q1).i32[1];
      float32x2_t v219 = *(float32x2_t *)v71.f32;
      int16x4_t v72 = (int16x4_t)vcvt_f16_f32(v71);
      __asm { FCVT            H2, S2 }
      *(int32x2_t *)(v5 + 44) = vzip1_s32((int32x2_t)v72, (int32x2_t)vzip1_s16((int16x4_t)_D2, v72));
      float32x2_t v73 = vmla_lane_f32(vmul_n_f32(*(float32x2_t *)v71.f32, v65.f32[0]), v70, v65, 1);
      float v74 = atan2f(v73.f32[1], v73.f32[0]);
      float32x2_t v75 = vsub_f32(v207, v64);
      float32x2_t v76 = vmla_lane_f32(vmul_n_f32(v219, v75.f32[0]), v70, v75, 1);
      float v77 = atan2f(v76.f32[1], v76.f32[0]);
      float32x2_t v78 = vmla_lane_f32(vmul_n_f32(v219, v208.f32[0]), v70, v208, 1);
      float v209 = atan2f(v78.f32[1], v78.f32[0]);
      float32x2_t v79 = vsub_f32(v210, v64);
      float32x2_t v80 = vmla_lane_f32(vmul_n_f32(v219, v79.f32[0]), v70, v79, 1);
      float v81 = atan2f(v80.f32[1], v80.f32[0]);
      if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76A58, memory_order_acquire) & 1) == 0
        && __cxa_guard_acquire(&qword_1E9F76A58))
      {
        LODWORD(v204) = 25.0;
        qword_1E9F76A50 = [NSNumber numberWithFloat:v204];
        __cxa_guard_release(&qword_1E9F76A58);
      }
      if ((byte_1E9F76A60 & 1) == 0)
      {
        HIBYTE(v221[2]) = 20;
        strcpy((char *)v221, "faceSideAngleFadeTop");
        sub_1BA81CE64((uint64_t)&qword_1E9F76A50, (uint64_t)v221);
        if (SHIBYTE(v221[2]) < 0) {
          operator delete(v221[0]);
        }
        byte_1E9F76A60 = 1;
      }
      if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76A70, memory_order_acquire) & 1) == 0
        && __cxa_guard_acquire(&qword_1E9F76A70))
      {
        LODWORD(v205) = 25.0;
        qword_1E9F76A68 = [NSNumber numberWithFloat:v205];
        __cxa_guard_release(&qword_1E9F76A70);
      }
      if ((byte_1E9F76A78 & 1) == 0)
      {
        v221[0] = (char *)operator new(0x19uLL);
        *(_OWORD *)&v221[1] = xmmword_1BA86C1F0;
        strcpy(v221[0], "faceSideAngleFadeBottom");
        sub_1BA81CE64((uint64_t)&qword_1E9F76A68, (uint64_t)v221);
        if (SHIBYTE(v221[2]) < 0) {
          operator delete(v221[0]);
        }
        byte_1E9F76A78 = 1;
      }
      [(id)qword_1E9F76A50 floatValue];
      float v83 = v74 - (float)(v82 * 0.017453);
      float v84 = fminf(v83, 3.1416);
      if (v83 >= -3.1416) {
        float v85 = v84;
      }
      else {
        float v85 = -3.1416;
      }
      [(id)qword_1E9F76A68 floatValue];
      _S0 = v77 + (float)(v88 * 0.017453);
      _S1 = fminf(_S0, 3.1416);
      if (_S0 >= -3.1416) {
        float v91 = _S1;
      }
      else {
        float v91 = -3.1416;
      }
      if (v74 <= v77 && v85 < v74 && v77 < v91)
      {
        if (v85 != v74)
        {
          _S0 = 1.0 / (float)(v74 - v85);
          __asm { FCVT            H0, S0 }
          _H3 = 0;
          _S1 = 0.0 - (float)(v85 / (float)(v74 - v85));
          __asm { FCVT            H1, S1 }
        }
        if (v91 != v77)
        {
          _S3 = 1.0 / (float)(v77 - v91);
          __asm { FCVT            H3, S3 }
          _S2 = 0.0 - (float)(v91 / (float)(v77 - v91));
          __asm { FCVT            H4, S2 }
        }
      }
      *((_WORD *)v5 + 32) = LOWORD(_S0);
      *((_WORD *)v5 + 33) = LOWORD(_S1);
      *((_WORD *)v5 + 34) = _H3;
      *((_WORD *)v5 + 35) = _H4;
      *((_DWORD *)v5 + 18) = 1006632960;
      [(id)qword_1E9F76A50 floatValue];
      float v97 = v209 + (float)(v96 * 0.017453);
      float v98 = fminf(v97, 3.1416);
      if (v97 >= -3.1416) {
        float v99 = v98;
      }
      else {
        float v99 = -3.1416;
      }
      [(id)qword_1E9F76A68 floatValue];
      _S0 = v81 - (float)(v102 * 0.017453);
      _S1 = fminf(_S0, 3.1416);
      if (_S0 >= -3.1416) {
        float v105 = _S1;
      }
      else {
        float v105 = -3.1416;
      }
      if (v209 < v99 && v81 <= v209 && v105 < v81)
      {
        if (v105 != v81)
        {
          _S0 = 1.0 / (float)(v81 - v105);
          __asm { FCVT            H0, S0 }
          _H2 = 0;
          _S1 = 0.0 - (float)(v105 / (float)(v81 - v105));
          __asm { FCVT            H1, S1 }
        }
        if (v99 != v209)
        {
          _S2 = 1.0 / (float)(v209 - v99);
          __asm { FCVT            H2, S2 }
          _S3 = 0.0 - (float)(v99 / (float)(v209 - v99));
          __asm { FCVT            H3, S3 }
        }
      }
      *((_WORD *)v5 + 26) = LOWORD(_S0);
      *((_WORD *)v5 + 27) = LOWORD(_S1);
      *((_WORD *)v5 + 28) = _H2;
      *((_WORD *)v5 + 29) = _H3;
      *((_DWORD *)v5 + 15) = 1006632960;
      if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76A88, memory_order_acquire) & 1) == 0
        && __cxa_guard_acquire(&qword_1E9F76A88))
      {
        LODWORD(v206) = 1093926912;
        qword_1E9F76A80 = [NSNumber numberWithFloat:v206];
        __cxa_guard_release(&qword_1E9F76A88);
      }
      if ((byte_1E9F76A90 & 1) == 0)
      {
        HIBYTE(v221[2]) = 14;
        strcpy((char *)v221, "cheekFadeAngle");
        sub_1BA81CE64((uint64_t)&qword_1E9F76A80, (uint64_t)v221);
        if (SHIBYTE(v221[2]) < 0) {
          operator delete(v221[0]);
        }
        byte_1E9F76A90 = 1;
      }
      float m_storage = self->_cheekAngle.m_storage;
      [(id)qword_1E9F76A80 floatValue];
      float v112 = m_storage + (float)(v111 * -0.017453);
      float v113 = self->_cheekAngle.m_storage;
      if (v112 != v113)
      {
        _S1 = v112 - v113;
        _S2 = 1.0 / _S1;
        _S0 = 0.0 - (float)(v113 / _S1);
        __asm
        {
          FCVT            H1, S2
          FCVT            H0, S0
        }
        *((_DWORD *)v5 + 19) = LOWORD(_S1) | (LODWORD(_S0) << 16);
      }
      *((_DWORD *)v5 + 20) = 1006632960;
    }
    float32x4_t v220 = *(float32x4_t *)&self->_face3DCenter[4];
    float v117 = *((float *)self->_modelVertices.__begin_ + 12 * self->_closestLeftCheekVertexID.m_storage);
    float v118 = *(float *)&self->_anon_300[24];
    unint64_t v119 = [(MTLTexture *)self->_dstTexture width];
    if (v119 >= [(MTLTexture *)self->_dstTexture height]) {
      float v120 = fabsf(v118);
    }
    else {
      float v120 = fabsf(*(float *)&self->_anon_300[4]);
    }
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76AA0, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_1E9F76AA0))
    {
      LODWORD(v202) = 1055286886;
      qword_1E9F76A98 = [NSNumber numberWithFloat:v202];
      __cxa_guard_release(&qword_1E9F76AA0);
    }
    if ((byte_1E9F76AA8 & 1) == 0)
    {
      HIBYTE(v221[2]) = 16;
      strcpy((char *)v221, "faceSizeCVMLNear");
      sub_1BA81CE64((uint64_t)&qword_1E9F76A98, (uint64_t)v221);
      if (SHIBYTE(v221[2]) < 0) {
        operator delete(v221[0]);
      }
      byte_1E9F76AA8 = 1;
    }
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F76AB8, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_1E9F76AB8))
    {
      LODWORD(v203) = 0.25;
      qword_1E9F76AB0 = [NSNumber numberWithFloat:v203];
      __cxa_guard_release(&qword_1E9F76AB8);
    }
    if ((byte_1E9F76AC0 & 1) == 0)
    {
      HIBYTE(v221[2]) = 15;
      strcpy((char *)v221, "faceSizeCVMLFar");
      sub_1BA81CE64((uint64_t)&qword_1E9F76AB0, (uint64_t)v221);
      if (SHIBYTE(v221[2]) < 0) {
        operator delete(v221[0]);
      }
      byte_1E9F76AC0 = 1;
    }
    float32x4_t v121 = vmulq_f32(v220, v220);
    float v122 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v121, 2), vaddq_f32(v121, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v121.f32, 1))).f32[0])/ 1000.0;
    float v123 = (float)((float)(fabsf(v117) / 1000.0) * v120) / v122;
    [(id)qword_1E9F76A98 floatValue];
    float v125 = v124 / 1.2264;
    [(id)qword_1E9F76AB0 floatValue];
    float v127 = (float)((float)((float)(1.0 / v123) - (float)(1.0 / v125))
                 / (float)((float)(1.0 / (float)(v126 / 1.2264)) - (float)(1.0 / v125)))
         + 0.0;
    float v128 = fminf(v127, 1.0);
    if (v127 >= 0.0) {
      float v129 = v128;
    }
    else {
      float v129 = 0.0;
    }
    self->_float lightMapsNearFarLerp = v129;
    float v130 = (float)(v129 * -0.5) + 1.0;
    float v131 = fminf(v130, 1.0);
    if (v130 >= 0.5) {
      float v37 = v131;
    }
    else {
      float v37 = 0.5;
    }
    if (!self->_debugFace)
    {
      unint64_t v35 = 0x1E9F75000;
LABEL_146:
      float v34 = 1.0;
      goto LABEL_147;
    }
    float32x4_t v132 = vmlaq_f32(vmlaq_f32(vaddq_f32(v211, vmulq_f32(v212, (float32x4_t)0)), (float32x4_t)0, v213), (float32x4_t)0, v215);
    int32x4_t v133 = (int32x4_t)vmulq_f32(v132, v132);
    v133.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v133, 2), vadd_f32(*(float32x2_t *)v133.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v133.i8, 1))).u32[0];
    float32x2_t v134 = vrsqrte_f32((float32x2_t)v133.u32[0]);
    float32x2_t v135 = vmul_f32(v134, vrsqrts_f32((float32x2_t)v133.u32[0], vmul_f32(v134, v134)));
    float32x4_t v136 = vmulq_n_f32(v132, vmul_f32(v135, vrsqrts_f32((float32x2_t)v133.u32[0], vmul_f32(v135, v135))).f32[0]);
    float32x4_t v137 = *(float32x4_t *)&self->_face3DCenter[4];
    int32x4_t v138 = (int32x4_t)vmulq_f32(v137, v137);
    v138.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v138, 2), vadd_f32(*(float32x2_t *)v138.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v138.i8, 1))).u32[0];
    float32x2_t v139 = vrsqrte_f32((float32x2_t)v138.u32[0]);
    float32x2_t v140 = vmul_f32(v139, vrsqrts_f32((float32x2_t)v138.u32[0], vmul_f32(v139, v139)));
    float32x4_t v141 = vmulq_f32(v136, vmulq_n_f32(v137, vmul_f32(v140, vrsqrts_f32((float32x2_t)v138.u32[0], vmul_f32(v140, v140))).f32[0]));
    float v142 = 1.57079633
         - acosf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v141, 2), vaddq_f32(v141, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v141.f32, 1))).f32[0]);
    objc_msgSend(NSString, "stringWithFormat:", @"faceConfidence = %.0f%%", (float)(self->_faceKitStreamedData.confidence * 100.0));

    uint64_t v143 = *(void *)((char *)&self->_faceConfidenceRollingVariance.m_storage.dummy_.aligner_ + 39);
    if (v143)
    {
      uint64_t v144 = *(void *)((char *)&self->_faceConfidenceRollingVariance.m_storage.dummy_.aligner_ + 7);
      uint64_t v145 = v144 + 4 * v143;
      uint64_t v146 = v144;
      unint64_t v35 = 0x1E9F75000;
      if (*(void *)((char *)&self->_faceConfidenceRollingVariance.m_storage.dummy_.aligner_ + 23))
      {
LABEL_143:
        float v147 = fabsf(_S12 * 57.296);
        float v148 = v142 * 57.296;
        unint64_t v149 = ((v145 - v146) >> 2)
             - (v143 == (*(void *)((char *)&self->_faceConfidenceRollingVariance.m_storage.dummy_.aligner_ + 15) - v144) >> 2);
        float v150 = 0.0;
        if (v149 >= 2) {
          float v150 = *(float *)((char *)&self->_faceConfidenceRollingVariance.m_storage.dummy_.aligner_ + 59)
        }
               / (float)(v149 - 1);
        objc_msgSend(NSString, "stringWithFormat:", @"faceConfidence.stddev = %.1f%%", (float)(sqrtf(v150) * 100.0));

        [NSString stringWithFormat:@"faceDistance = %.2fm", v122];
        objc_msgSend(NSString, "stringWithFormat:", @"faceSizeProjection = %.0f%%", (float)(v123 * 100.0));

        objc_msgSend(NSString, "stringWithFormat:", @"lerpNearFar = %.0f%%", (float)(self->_lightMapsNearFarLerp * 100.0));
        objc_msgSend(NSString, "stringWithFormat:", @"faceAngleHorAbs = %.0f", v147);

        objc_msgSend(NSString, "stringWithFormat:", @"faceAngleVer = %.0f", v148);
        objc_msgSend(NSString, "stringWithFormat:", @"geometricHaloRemoval = %i", !self->_trustAlpha);

        goto LABEL_146;
      }
    }
    else
    {
      uint64_t v144 = *(void *)((char *)&self->_faceConfidenceRollingVariance.m_storage.dummy_.aligner_ + 7);
      uint64_t v145 = v144;
      unint64_t v35 = 0x1E9F75000uLL;
    }
    uint64_t v146 = v144 + 4 * v143;
    goto LABEL_143;
  }
LABEL_147:
  *(float *)&double v153 = v34
                  / (float)(unint64_t)[(CVAVideoPipelinePropertiesSPI *)self->_properties proxyToFaceEffectLerpNumFrames];
  float proxyToFaceEffectLerpTemporal = self->_proxyToFaceEffectLerpTemporal;
  float v152 = fmaxf(proxyToFaceEffectLerpTemporal - *(float *)&v153, 0.0);
  *(float *)&double v153 = fminf(*(float *)&v153 + proxyToFaceEffectLerpTemporal, v34);
  if (!self->_faceDetected) {
    *(float *)&double v153 = v152;
  }
  self->_float proxyToFaceEffectLerpTemporal = *(float *)&v153;
  v154 = *(float **)((char *)&self->_faceRelightingAngleFactorsRollingMean.m_storage.dummy_.aligner_ + 14);
  v155 = *(float **)((char *)&self->_faceRelightingAngleFactorsRollingMean.m_storage.dummy_.aligner_ + 22);
  uint64_t v156 = v155 - v154;
  uint64_t v157 = *(void *)((char *)&self->_faceRelightingAngleFactorsRollingMean.m_storage.dummy_.aligner_ + 46);
  if (v156 == v157)
  {
    if (v155 != v154)
    {
      v158 = *(float **)((char *)&self->_faceRelightingAngleFactorsRollingMean.m_storage.dummy_.aligner_ + 38);
      float *v158 = v36;
      v159 = v158 + 1;
      if (v159 != v155) {
        v154 = v159;
      }
      *(void *)((char *)&self->_faceRelightingAngleFactorsRollingMean.m_storage.dummy_.aligner_ + 30) = v154;
      *(void *)((char *)&self->_faceRelightingAngleFactorsRollingMean.m_storage.dummy_.aligner_ + 38) = v154;
    }
    v160 = (_DWORD *)((char *)&self->_faceRelightingAngleFactorsRollingMean.m_storage.dummy_.aligner_ + 58);
    goto LABEL_158;
  }
  v161 = *(float **)((char *)&self->_faceRelightingAngleFactorsRollingMean.m_storage.dummy_.aligner_ + 38);
  float *v161 = v36;
  v162 = v161 + 1;
  if (v162 == v155) {
    v162 = v154;
  }
  uint64_t v163 = v157 + 1;
  *(void *)((char *)&self->_faceRelightingAngleFactorsRollingMean.m_storage.dummy_.aligner_ + 38) = v162;
  *(void *)((char *)&self->_faceRelightingAngleFactorsRollingMean.m_storage.dummy_.aligner_ + 46) = v157 + 1;
  v160 = (_DWORD *)((char *)&self->_faceRelightingAngleFactorsRollingMean.m_storage.dummy_.aligner_ + 58);
  if (v156 != v157 + 1)
  {
    LODWORD(v153) = *v160;
    if (*(float *)v160 > v36)
    {
      if (v157 == -1)
      {
        v166 = v154;
      }
      else
      {
        v166 = &v154[v163];
        if (*(void *)((char *)&self->_faceRelightingAngleFactorsRollingMean.m_storage.dummy_.aligner_ + 30))
        {
LABEL_172:
          *(float *)&double v153 = *(float *)&v153
                          - (float)((float)(*(float *)&v153 - v36) / (float)(unint64_t)(v166 - v154));
          goto LABEL_177;
        }
      }
      v154 += v163;
      goto LABEL_172;
    }
    if (*(float *)v160 >= v36) {
      goto LABEL_178;
    }
    if (v157 == -1)
    {
      v167 = v154;
    }
    else
    {
      v167 = &v154[v163];
      if (*(void *)((char *)&self->_faceRelightingAngleFactorsRollingMean.m_storage.dummy_.aligner_ + 30))
      {
LABEL_175:
        float v165 = (float)(v36 - *(float *)&v153) / (float)(unint64_t)(v167 - v154);
LABEL_176:
        *(float *)&double v153 = *(float *)&v153 + v165;
        goto LABEL_177;
      }
    }
    v154 += v163;
    goto LABEL_175;
  }
LABEL_158:
  v164 = *(_DWORD **)((char *)&self->_faceRelightingAngleFactorsRollingMean.m_storage.dummy_.aligner_ + 30);
  LODWORD(v153) = *v164;
  if (*(float *)v164 <= v36)
  {
    if (*(float *)v164 >= v36) {
      goto LABEL_178;
    }
    *(float *)&double v153 = (float)(v36 - *(float *)&v153) / (float)(unint64_t)(v156 - 1);
    float v165 = *(float *)v160;
    goto LABEL_176;
  }
  *(float *)&double v153 = *(float *)v160 - (float)((float)(*(float *)&v153 - v36) / (float)(unint64_t)(v156 - 1));
LABEL_177:
  _DWORD *v160 = LODWORD(v153);
LABEL_178:
  float v168 = self->_proxyToFaceEffectLerpTemporal;
  [(CVAVideoPipelinePropertiesSPI *)self->_properties relightEffectStrength];
  self->_proxyToFaceEffectLerpFinal = (float)(v168 * v169) * *(float *)v160;
  self->_relightingStabilitdouble y = self->_proxyToFaceEffectLerpTemporal;
  BOOL faceDetected = self->_faceDetected;
  float v171 = 0.4;
  if (!self->_faceDetected) {
    float v171 = 0.1;
  }
  self->_vignettingScale = self->_vignettingScale + (float)((float)(v37 - self->_vignettingScale) * v171);
  if (byte_1E9F76A41)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"vignettingScaleRealTime = %.3f", v37);

    objc_msgSend(NSString, "stringWithFormat:", @"vignettingScale = %.3f", self->_vignettingScale);
    BOOL faceDetected = self->_faceDetected;
  }
  if (!self->_debugFace) {
    goto LABEL_205;
  }
  uint64_t v172 = *(void *)((char *)&self->_faceConfidenceRollingVariance.m_storage.dummy_.aligner_ + 39);
  if (v172)
  {
    uint64_t v173 = *(void *)((char *)&self->_faceConfidenceRollingVariance.m_storage.dummy_.aligner_ + 7);
    uint64_t v174 = v173 + 4 * v172;
    uint64_t v175 = v173;
    if (*(void *)((char *)&self->_faceConfidenceRollingVariance.m_storage.dummy_.aligner_ + 23)) {
      goto LABEL_188;
    }
  }
  else
  {
    uint64_t v173 = *(void *)((char *)&self->_faceConfidenceRollingVariance.m_storage.dummy_.aligner_ + 7);
    uint64_t v174 = v173;
  }
  uint64_t v175 = v173 + 4 * v172;
LABEL_188:
  unint64_t v176 = ((v174 - v175) >> 2)
       - (v172 == (*(void *)((char *)&self->_faceConfidenceRollingVariance.m_storage.dummy_.aligner_ + 15) - v173) >> 2);
  float v177 = 0.0;
  if (v176 >= 2) {
    float v177 = *(float *)((char *)&self->_faceConfidenceRollingVariance.m_storage.dummy_.aligner_ + 59) / (float)(v176 - 1);
  }
  double v178 = sqrtf(v177);
  v179 = " [face]";
  if (!faceDetected) {
    v179 = " [face skipped]";
  }
  if (!self->_faceDetectedReal) {
    v179 = " []";
  }
  NSLog(&cfstr_CvaphotoFrameL.isa, self->_frameIndex, self->_faceDetectedReal, faceDetected, *(void *)&v178, self->_proxyToFaceEffectLerpFinal, v179);
  if (self->_faceDetected)
  {
    LODWORD(faceDetected) = 1;
    goto LABEL_205;
  }
  LODWORD(faceDetected) = self->_faceDetectedReal;
  if (self->_faceDetectedReal)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"geometricHaloRemoval = %i", !self->_trustAlpha);

    [NSString stringWithFormat:@"Face was detected, but skipped"];
    uint64_t v180 = *(void *)((char *)&self->_faceConfidenceRollingVariance.m_storage.dummy_.aligner_ + 39);
    if (v180)
    {
      uint64_t v181 = *(void *)((char *)&self->_faceConfidenceRollingVariance.m_storage.dummy_.aligner_ + 7);
      uint64_t v182 = v181 + 4 * v180;
      uint64_t v183 = v181;
      if (*(void *)((char *)&self->_faceConfidenceRollingVariance.m_storage.dummy_.aligner_ + 23))
      {
LABEL_202:
        unint64_t v184 = ((v182 - v183) >> 2)
             - (v180 == (*(void *)((char *)&self->_faceConfidenceRollingVariance.m_storage.dummy_.aligner_ + 15) - v181) >> 2);
        float v185 = 0.0;
        if (v184 >= 2) {
          float v185 = *(float *)((char *)&self->_faceConfidenceRollingVariance.m_storage.dummy_.aligner_ + 59)
        }
               / (float)(v184 - 1);
        objc_msgSend(NSString, "stringWithFormat:", @"faceConfidence.stddev = %.1f%%", (float)(sqrtf(v185) * 100.0));

        LODWORD(faceDetected) = self->_faceDetected;
        goto LABEL_205;
      }
    }
    else
    {
      uint64_t v181 = *(void *)((char *)&self->_faceConfidenceRollingVariance.m_storage.dummy_.aligner_ + 7);
      uint64_t v182 = v181;
    }
    uint64_t v183 = v181 + 4 * v180;
    goto LABEL_202;
  }
LABEL_205:
  _S0 = self->_proxyToFaceEffectLerpFinal;
  __asm { FCVT            H1, S0 }
  *((_WORD *)v5 + 8) = _H1;
  _S1 = self->_portraitStyleStrength;
  __asm { FCVT            H1, S1 }
  *((_WORD *)v5 + 10) = LOWORD(_S1);
  _S1 = (float)(*(float *)((char *)&self->super.super.super.isa + *(int *)(v35 + 3028)) * -0.5) + 1.0;
  if (!faceDetected)
  {
    float v190 = (float)((float)((float)(self->_focusDistance + -0.54) / 0.76) * -0.5) + 1.0;
    float v191 = fminf(v190, 1.0);
    if (v190 < 0.5) {
      float v191 = 0.5;
    }
    _S1 = v191 + (float)((float)(_S1 - v191) * _S0);
  }
  __asm { FCVT            H0, S1 }
  *((_WORD *)v5 + 9) = _H0;
  if (self->_debugFace)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"focusDistance = %.3fm", self->_focusDistance);

    _H0 = *((_WORD *)v5 + 9);
    __asm { FCVT            S0, H0 }
    objc_msgSend(NSString, "stringWithFormat:", @"blurStrengthByDistance = %.1f%%", (float)(_S0 * 100.0));

    if (self->_debugFace)
    {
      [NSString stringWithFormat:@"proxyToFaceLerp = %.2f", self->_proxyToFaceEffectLerpFinal];
    }
  }
  long long v195 = *(_OWORD *)&self->_anon_280[52];
  long long v197 = *(_OWORD *)&self->_anon_280[4];
  long long v196 = *(_OWORD *)&self->_anon_280[20];
  *(_OWORD *)&self->_anon_60[32] = *(_OWORD *)&self->_anon_280[36];
  *(_OWORD *)&self->_anon_60[48] = v195;
  *(_OWORD *)self->_anon_60 = v197;
  *(_OWORD *)&self->_anon_60[16] = v196;
}

- (void)updateMatrixWithWidth:(int)a3 height:(int)a4 camera:(const void *)a5 pose:(const void *)a6
{
  float32x4_t v7 = *(float32x4_t *)*(void *)a6;
  *(float32x4_t *)&self->_anon_2c0[4] = v7;
  float32x4_t v8 = *(float32x4_t *)(*(void *)a6 + 16);
  *(float32x4_t *)&self->_anon_2c0[20] = v8;
  float32x4_t v9 = *(float32x4_t *)(*(void *)a6 + 32);
  *(float32x4_t *)&self->_anon_2c0[36] = v9;
  float32x4_t v10 = *(float32x4_t *)(*(void *)a6 + 48);
  *(float32x4_t *)&self->_anon_2c0[52] = v10;
  float32x4_t v11 = vaddq_f32(v10, vmlaq_f32(vmlaq_f32(vmulq_f32(v7, (float32x4_t)0), (float32x4_t)0, v8), (float32x4_t)0, v9));
  *(float32x4_t *)&self->_face3DCenter[4] = v11;
  float v12 = fmaxf((float)(v11.f32[2] + 800.0) + -50.0, 1.0);
  *(float32x2_t *)v8.f32 = vdiv_f32((float32x2_t)0xC000000040000000, vcvt_f32_s32((int32x2_t)__PAIR64__(a4, a3)));
  *(float *)&unsigned int v13 = **(float **)a5 * v8.f32[0];
  LODWORD(v14) = 0;
  HIDWORD(v14) = vmuls_lane_f32(*(float *)(*(void *)a5 + 16), *(float32x2_t *)v8.f32, 1);
  *(float32x2_t *)v15.f32 = vmla_f32((float32x2_t)0x3F800000BF800000, vadd_f32(*(float32x2_t *)(*(void *)a5 + 24), (float32x2_t)0x3F0000003F000000), *(float32x2_t *)v8.f32);
  v15.f32[2] = (float)((float)(v11.f32[2] + 800.0) + 50.0) / v12;
  v15.i32[3] = 1.0;
  v9.i64[0] = 0;
  v9.i32[3] = 0;
  v9.f32[2] = (float)((float)((float)(v11.f32[2] + 800.0) * -2.0) * 50.0) / v12;
  *(_OWORD *)&self->_anon_300[4] = v13;
  *(_OWORD *)&self->_anon_300[20] = v14;
  *(float32x4_t *)&self->_anon_300[36] = v15;
  *(float32x4_t *)&self->_anon_300[52] = v9;
  float32x4_t v16 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v13, COERCE_FLOAT(*(_OWORD *)&self->_anon_2c0[4])), (float32x4_t)v14, *(float32x2_t *)&self->_anon_2c0[4], 1), v15, *(float32x4_t *)&self->_anon_2c0[4], 2), v9, *(float32x4_t *)&self->_anon_2c0[4], 3);
  _Q2 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v13, COERCE_FLOAT(*(_OWORD *)&self->_anon_2c0[20])), (float32x4_t)v14, *(float32x2_t *)&self->_anon_2c0[20], 1), v15, *(float32x4_t *)&self->_anon_2c0[20], 2), v9, *(float32x4_t *)&self->_anon_2c0[20], 3);
  float32x4_t v18 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v13, COERCE_FLOAT(*(_OWORD *)&self->_anon_2c0[36])), (float32x4_t)v14, *(float32x2_t *)&self->_anon_2c0[36], 1), v15, *(float32x4_t *)&self->_anon_2c0[36], 2), v9, *(float32x4_t *)&self->_anon_2c0[36], 3);
  float32x4_t v19 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v13, COERCE_FLOAT(*(_OWORD *)&self->_anon_2c0[52])), (float32x4_t)v14, *(float32x2_t *)&self->_anon_2c0[52], 1), v15, *(float32x4_t *)&self->_anon_2c0[52], 2), v9, *(float32x4_t *)&self->_anon_2c0[52], 3);
  *(float32x4_t *)&self->_anon_280[4] = v16;
  *(float32x4_t *)&self->_anon_280[20] = _Q2;
  int32x4_t v20 = (int32x4_t)vaddq_f32(v19, vmlaq_f32(vmlaq_f32(vmulq_f32(v16, (float32x4_t)0), (float32x4_t)0, _Q2), (float32x4_t)0, v18));
  *(float32x2_t *)v20.i8 = vdiv_f32(*(float32x2_t *)v20.i8, (float32x2_t)vdup_laneq_s32(v20, 3));
  __asm { FMOV            V2.2S, #1.0 }
  v9.i64[0] = vadd_f32(*(float32x2_t *)v20.i8, *(float32x2_t *)_Q2.f32).u32[0];
  v9.i32[1] = vsub_f32(*(float32x2_t *)&_Q2, *(float32x2_t *)&v20).i32[1];
  *(float32x4_t *)&self->_anon_280[36] = v18;
  *(float32x4_t *)&self->_anon_280[52] = v19;
  *(float32x2_t *)&self->_faceModelCenterProjected[4] = vmul_f32(*(float32x2_t *)v9.f32, (float32x2_t)0x3F0000003F000000);
  p_cheekAngle = &self->_cheekAngle;
  self->_cheekAngle.m_initialized = 0;
  p_closestLeftCheekVertexID = &self->_closestLeftCheekVertexID;
  if (self->_closestLeftCheekVertexID.m_initialized)
  {
    float32x4_t v27 = *((float32x4_t *)self->_modelVertices.__begin_ + 3 * self->_closestLeftCheekVertexID.m_storage + 1);
    v27.i32[1] = 0;
    int32x4_t v28 = (int32x4_t)vmulq_f32(v27, v27);
    v28.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v28, 2), vadd_f32(*(float32x2_t *)v28.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v28.i8, 1))).u32[0];
    float32x2_t v29 = vrsqrte_f32((float32x2_t)v28.u32[0]);
    float32x2_t v30 = vmul_f32(v29, vrsqrts_f32((float32x2_t)v28.u32[0], vmul_f32(v29, v29)));
    float32x4_t v31 = vmulq_f32(vmulq_n_f32(v27, vmul_f32(v30, vrsqrts_f32((float32x2_t)v28.u32[0], vmul_f32(v30, v30))).f32[0]), (float32x4_t)xmmword_1BA86C200);
    float v32 = fabsf(acosf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v31, 2), vaddq_f32(v31, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v31.f32, 1))).f32[0]))+ -1.57079633;
    p_cheekAngle->float m_storage = v32;
    p_cheekAngle->m_initialized = 1;
    if (!self->_debugFace) {
      goto LABEL_7;
    }
    objc_msgSend(NSString, "stringWithFormat:", @"cheek angle = %.1f", (float)(v32 * 57.296));
  }
  else
  {
    if (!self->_debugFace) {
      goto LABEL_7;
    }
    objc_msgSend(NSString, "stringWithFormat:", @"cheek angle = FATAL ERROR: not found", v39);
  }

LABEL_7:
  if (self->_debugFaceDraw && p_closestLeftCheekVertexID->m_initialized)
  {
    float32x4_t v33 = *((float32x4_t *)self->_modelVertices.__begin_ + 3 * p_closestLeftCheekVertexID->m_storage + 1);
    v33.i32[1] = 0;
    int32x4_t v34 = (int32x4_t)vmulq_f32(v33, v33);
    v34.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v34, 2), vadd_f32(*(float32x2_t *)v34.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v34.i8, 1))).u32[0];
    float32x2_t v35 = vrsqrte_f32((float32x2_t)v34.u32[0]);
    float32x2_t v36 = vmul_f32(v35, vrsqrts_f32((float32x2_t)v34.u32[0], vmul_f32(v35, v35)));
    float32x4_t v37 = vmulq_f32(vmulq_n_f32(v33, vmul_f32(v36, vrsqrts_f32((float32x2_t)v34.u32[0], vmul_f32(v36, v36))).f32[0]), (float32x4_t)xmmword_1BA86C200);
    float v38 = fabsf(acosf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v37, 2), vaddq_f32(v37, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v37.f32, 1))).f32[0]))+ -1.57079633;
    p_cheekAngle->float m_storage = v38;
    p_cheekAngle->m_initialized = 1;
  }
}

- (void)generateModelNormals
{
  p_modelVertices = &self->_modelVertices;
  begin = self->_modelVertices.__begin_;
  for (i = self->_modelVertices.__end_; begin != i; begin = (FaceVertex *)((char *)begin + 48))
    *((_OWORD *)begin + 1) = 0uLL;
  BOOL v5 = self->_faceKitMeshTris.__begin_;
  if (self->_faceKitMeshTris.__end_ != v5)
  {
    unint64_t v6 = 0;
    do
    {
      float32x4_t v7 = &v5[v6];
      float32x4_t v8 = (float32x4_t *)((char *)p_modelVertices->__begin_ + 48 * *v7);
      float32x4_t v9 = (float32x4_t *)((char *)p_modelVertices->__begin_ + 48 * v7[1]);
      float32x4_t v10 = (float32x4_t *)((char *)p_modelVertices->__begin_ + 48 * v7[2]);
      float32x4_t v11 = vsubq_f32(*v9, *v8);
      float32x4_t v12 = vsubq_f32(*v10, *v8);
      int32x4_t v13 = (int32x4_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v12, (int32x4_t)v12), (int8x16_t)v12, 0xCuLL), vnegq_f32(v11)), v12, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v11, (int32x4_t)v11), (int8x16_t)v11, 0xCuLL));
      float32x4_t v14 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v13, v13), (int8x16_t)v13, 0xCuLL);
      v8[1] = vaddq_f32(v8[1], v14);
      v9[1] = vaddq_f32(v9[1], v14);
      v10[1] = vaddq_f32(v14, v10[1]);
      v6 += 3;
      BOOL v5 = self->_faceKitMeshTris.__begin_;
    }
    while (v6 < self->_faceKitMeshTris.__end_ - v5);
  }
  float32x4_t v16 = p_modelVertices->__begin_;
  for (j = self->_modelVertices.__end_; v16 != j; float32x4_t v16 = (FaceVertex *)((char *)v16 + 48))
  {
    float32x4_t v17 = *((float32x4_t *)v16 + 1);
    int32x4_t v18 = (int32x4_t)vmulq_f32(v17, v17);
    v18.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v18, 2), vadd_f32(*(float32x2_t *)v18.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v18.i8, 1))).u32[0];
    float32x2_t v19 = vrsqrte_f32((float32x2_t)v18.u32[0]);
    float32x2_t v20 = vmul_f32(v19, vrsqrts_f32((float32x2_t)v18.u32[0], vmul_f32(v19, v19)));
    *((float32x4_t *)v16 + 1) = vmulq_n_f32(v17, vmul_f32(v20, vrsqrts_f32((float32x2_t)v18.u32[0], vmul_f32(v20, v20))).f32[0]);
  }
}

- (void)setModelVertices
{
  p_modelVertices = &self->_modelVertices;
  self->_modelVertices.__end_ = self->_modelVertices.__begin_;
  id v4 = [(NSData *)self->_faceKitStreamedData.verticesPos bytes];
  NSUInteger v5 = [(NSData *)self->_faceKitStreamedData.verticesPos length];
  unint64_t v6 = [(NSData *)self->_faceKitMeshTexcoords bytes];
  float v38 = self;
  p_closestLeftCheekVertexID = &self->_closestLeftCheekVertexID;
  p_closestLeftCheekVertexID->m_initialized = 0;
  if (v5 >= 0xC)
  {
    float32x4_t v15 = v6;
    unint64_t v16 = 0;
    unint64_t v17 = v5 / 0xC;
    end = p_modelVertices->__end_;
    float v19 = 3.4028e38;
    do
    {
      float32x2_t v20 = &v4[12 * v16];
      v21.i64[0] = *(void *)v20;
      v21.i32[2] = *((_DWORD *)v20 + 2);
      v21.i32[3] = 1.0;
      uint64_t v22 = v15[v16];
      value = p_modelVertices->__end_cap_.__value_;
      if (end >= value)
      {
        begin = p_modelVertices->__begin_;
        unint64_t v25 = 0xAAAAAAAAAAAAAAABLL * ((end - p_modelVertices->__begin_) >> 4);
        unint64_t v26 = v25 + 1;
        if (v25 + 1 > 0x555555555555555) {
          abort();
        }
        unint64_t v27 = 0xAAAAAAAAAAAAAAABLL * ((value - begin) >> 4);
        if (2 * v27 > v26) {
          unint64_t v26 = 2 * v27;
        }
        if (v27 >= 0x2AAAAAAAAAAAAAALL) {
          unint64_t v28 = 0x555555555555555;
        }
        else {
          unint64_t v28 = v26;
        }
        *(float32x4_t *)float32x2_t v40 = v21;
        if (v28)
        {
          if (v28 > 0x555555555555555) {
            sub_1BA81F974();
          }
          float32x2_t v29 = (char *)operator new(48 * v28);
          float32x4_t v21 = *(float32x4_t *)v40;
        }
        else
        {
          float32x2_t v29 = 0;
        }
        float32x2_t v30 = &v29[48 * v25];
        *(float32x4_t *)float32x2_t v30 = v21;
        *((_OWORD *)v30 + 1) = xmmword_1BA86C210;
        *((void *)v30 + 4) = v22;
        if (end == begin)
        {
          int32x4_t v34 = end;
          float32x4_t v31 = (FaceVertex *)&v29[48 * v25];
        }
        else
        {
          float32x4_t v31 = (FaceVertex *)&v29[48 * v25];
          do
          {
            long long v32 = *((_OWORD *)end - 3);
            long long v33 = *((_OWORD *)end - 1);
            *((_OWORD *)v31 - 2) = *((_OWORD *)end - 2);
            *((_OWORD *)v31 - 1) = v33;
            *((_OWORD *)v31 - 3) = v32;
            float32x4_t v31 = (FaceVertex *)((char *)v31 - 48);
            end = (FaceVertex *)((char *)end - 48);
          }
          while (end != begin);
          int32x4_t v34 = p_modelVertices->__begin_;
        }
        end = (FaceVertex *)(v30 + 48);
        p_modelVertices->__begin_ = v31;
        p_modelVertices->__end_ = (FaceVertex *)(v30 + 48);
        p_modelVertices->__end_cap_.__value_ = (FaceVertex *)&v29[48 * v28];
        if (v34)
        {
          operator delete(v34);
          float32x4_t v21 = *(float32x4_t *)v40;
        }
      }
      else
      {
        *(float32x4_t *)end = v21;
        *((_OWORD *)end + 1) = xmmword_1BA86C210;
        *((void *)end + 4) = v22;
        end = (FaceVertex *)((char *)end + 48);
      }
      float32x4_t v35 = vaddq_f32(v21, (float32x4_t)xmmword_1BA86C220);
      float32x4_t v36 = vmulq_f32(v35, v35);
      p_modelVertices->__end_ = end;
      float v37 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v36, 2), vaddq_f32(v36, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v36.f32, 1))).f32[0];
      if (v37 < v19)
      {
        p_closestLeftCheekVertexID->float m_storage = v16;
        p_closestLeftCheekVertexID->m_initialized = 1;
        float v19 = v37;
      }
      ++v16;
    }
    while (v16 != v17);
  }
  [(VideoRelightingMetal *)v38 generateModelNormals];
  float32x4_t v8 = [MEMORY[0x1E4F1C9B8] dataWithBytes:p_modelVertices->__begin_ length:p_modelVertices->__end_ - p_modelVertices->__begin_];
  vertexBuffer = v38->_vertexBuffer;
  if (!vertexBuffer)
  {
    float32x4_t v10 = -[CVAPhotoMTLRingBuffer initWithLength:options:device:]([CVAPhotoMTLRingBuffer alloc], "initWithLength:options:device:", [v8 length], 0, v38->_device);
    uint64_t v11 = +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:v10];
    float32x4_t v12 = v38->_vertexBuffer;
    v38->_vertexBuffer = (CVAPhotoMTLRingBuffer *)v11;

    vertexBuffer = v38->_vertexBuffer;
  }
  id v13 = [(CVAPhotoMTLRingBuffer *)vertexBuffer advancedBuffer];
  float32x4_t v14 = (void *)[v13 contents];
  id v39 = v8;
  memcpy(v14, (const void *)[v39 bytes], objc_msgSend(v39, "length"));
}

- (void)updateModelAndPose:(void *)a3 camera:(void *)a4
{
  p_faceKitStreamedData = &self->_faceKitStreamedData;
  sub_1BA832C1C(self->_faceKitStreamedData.intrinsics, a4);
  float32x4_t v7 = operator new(0x40uLL);
  v17[1] = v7 + 4;
  v17[2] = v7 + 4;
  _OWORD *v7 = 0u;
  v7[1] = 0u;
  v7[2] = 0u;
  v7[3] = 0u;
  v17[0] = v7;
  sub_1BA832DB8(p_faceKitStreamedData->camR, p_faceKitStreamedData->camT, v17);
  float32x4_t v8 = operator new(0x40uLL);
  v16[1] = v8 + 4;
  v16[2] = v8 + 4;
  *float32x4_t v8 = 0u;
  v8[1] = 0u;
  v8[2] = 0u;
  v8[3] = 0u;
  v16[0] = v8;
  sub_1BA832DB8(p_faceKitStreamedData->poseR, p_faceKitStreamedData->poseT, v16);
  float32x4_t v9 = *((float32x4_t *)v7 + 1);
  float32x4_t v10 = *((float32x4_t *)v7 + 2);
  float32x4_t v11 = *((float32x4_t *)v7 + 3);
  float32x4_t v12 = vmlaq_n_f32(vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(*(float32x4_t *)v7, COERCE_FLOAT(v8[1])), v9, COERCE_FLOAT(*(_OWORD *)((char *)v8 + 20))), v10, COERCE_FLOAT(*(_OWORD *)((char *)v8 + 24))), v11, COERCE_FLOAT(*(_OWORD *)((char *)v8 + 28)));
  float32x4_t v13 = vmlaq_n_f32(vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(*(float32x4_t *)v7, COERCE_FLOAT(v8[2])), v9, COERCE_FLOAT(*(_OWORD *)((char *)v8 + 36))), v10, COERCE_FLOAT(*(_OWORD *)((char *)v8 + 40))), v11, COERCE_FLOAT(*(_OWORD *)((char *)v8 + 44)));
  float32x4_t v14 = vmlaq_n_f32(vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(*(float32x4_t *)v7, COERCE_FLOAT(v8[3])), v9, COERCE_FLOAT(*(void *)((char *)v8 + 52))), v10, COERCE_FLOAT(*((void *)v8 + 7))), v11, *((float *)v8 + 15));
  float32x4_t v15 = *(float32x4_t **)a3;
  *float32x4_t v15 = vmlaq_n_f32(vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(*(float32x4_t *)v7, COERCE_FLOAT(*v8)), v9, COERCE_FLOAT(*(_OWORD *)((char *)v8 + 4))), v10, COERCE_FLOAT(*(_OWORD *)((char *)v8 + 8))), v11, COERCE_FLOAT(*(_OWORD *)((char *)v8 + 12)));
  v15[1] = v12;
  v15[2] = v13;
  v15[3] = v14;
  [(VideoRelightingMetal *)self setModelVertices];
  operator delete(v8);

  operator delete(v7);
}

- (void)configureRenderPipeline
{
  BOOL v3 = objc_opt_new();
  id v15 = +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:v3];

  [v15 setDepthCompareFunction:1];
  [v15 setDepthWriteEnabled:1];
  id v4 = (void *)[(MTLDeviceSPI *)self->_device newDepthStencilStateWithDescriptor:v15];
  NSUInteger v5 = +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:v4];
  depthStencilState = self->_depthStencilState;
  self->_depthStencilState = v5;

  id v16 = [MEMORY[0x1E4F352E0] renderPassDescriptor];
  +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:](CVAPhotoExceptionMetalResourceUnavailable, "throwIfNil:");
  float32x4_t v7 = (MTLRenderPassDescriptor *)objc_claimAutoreleasedReturnValue();
  tcRenderDesc = self->_tcRenderDesc;
  self->_tcRenderDesc = v7;

  tcTexture = self->_tcTexture;
  id v17 = [(MTLRenderPassDescriptor *)self->_tcRenderDesc colorAttachments];
  float32x4_t v10 = [v17 objectAtIndexedSubscript:0];
  [v10 setTexture:tcTexture];

  id v18 = [(MTLRenderPassDescriptor *)self->_tcRenderDesc colorAttachments];
  float32x4_t v11 = [v18 objectAtIndexedSubscript:0];
  [v11 setLoadAction:2];

  id v19 = [(MTLRenderPassDescriptor *)self->_tcRenderDesc colorAttachments];
  float32x4_t v12 = [v19 objectAtIndexedSubscript:0];
  [v12 setStoreAction:1];

  id v20 = [(MTLRenderPassDescriptor *)self->_tcRenderDesc colorAttachments];
  float32x4_t v13 = [v20 objectAtIndexedSubscript:0];
  objc_msgSend(v13, "setClearColor:", 0.0, 0.0, 0.0, 0.0);

  tcDepthTexture = self->_tcDepthTexture;
  id v21 = [(MTLRenderPassDescriptor *)self->_tcRenderDesc depthAttachment];
  [v21 setTexture:tcDepthTexture];

  id v22 = [(MTLRenderPassDescriptor *)self->_tcRenderDesc depthAttachment];
  [v22 setLoadAction:2];

  id v23 = [(MTLRenderPassDescriptor *)self->_tcRenderDesc depthAttachment];
  [v23 setStoreAction:1];

  id v24 = [(MTLRenderPassDescriptor *)self->_tcRenderDesc depthAttachment];
  [v24 setClearDepth:1.0];
}

- (void)saveTexture:(id)a3 toImage:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 pixelFormat] != 80
    && [v7 pixelFormat] != 70
    && [v7 pixelFormat] != 115)
  {
    long long v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2 object:self file:@"VideoRelightingMetal.mm" lineNumber:708 description:@"unsupported pixel format!"];
  }
  double v9 = (double)(unint64_t)[v7 width];
  double v10 = (double)(unint64_t)[v7 height];
  size_t v11 = vcvtd_n_u64_f64(v9 * v10, 2uLL);
  float32x4_t v12 = (char *)malloc_type_malloc(v11, 0xAEA05369uLL);
  size_t v13 = vcvtd_n_u64_f64(v9, 2uLL);
  if ([v7 pixelFormat] == 115) {
    operator new[]();
  }
  memset(v34, 0, 24);
  v34[3] = (unint64_t)v9;
  v34[4] = (unint64_t)v10;
  v34[5] = 1;
  [v7 getBytes:v12 bytesPerRow:v13 fromRegion:v34 mipmapLevel:0];
  if ([v7 pixelFormat] == 80 && v11)
  {
    if (v11 < 5
      || ((unint64_t v14 = (v11 - 1) >> 2, (~v14 & 0x3FFFFFFF) != 0) ? (v15 = v14 >> 30 == 0) : (v15 = 0),
          v15 ? (BOOL v16 = (v11 - 1) >> 34 == 0) : (BOOL v16 = 0),
          !v16))
    {
      int v17 = 0;
      id v18 = v12;
      goto LABEL_18;
    }
    unint64_t v26 = v14 + 1;
    uint64_t v27 = (v14 + 1) & 0x7FFFFFFFFFFFFFFELL;
    unint64_t v28 = v12 + 4;
    uint64_t v29 = v27;
    do
    {
      char v30 = *(v28 - 4);
      char v31 = *v28;
      char v32 = v28[2];
      *(v28 - 4) = *(v28 - 2);
      *unint64_t v28 = v32;
      *(v28 - 2) = v30;
      v28[2] = v31;
      v28 += 8;
      v29 -= 2;
    }
    while (v29);
    if (v26 != v27)
    {
      int v17 = 4 * v27;
      id v18 = &v12[4 * v27];
LABEL_18:
      unsigned int v19 = v17 + 4;
      do
      {
        char v20 = *v18;
        *id v18 = v18[2];
        v18[2] = v20;
        v18 += 4;
        size_t v21 = v19;
        v19 += 4;
      }
      while (v21 < v11);
    }
  }
  id v22 = CGDataProviderCreateWithData(0, v12, v11, (CGDataProviderReleaseDataCallback)sub_1BA845534);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  CGImageRef v24 = CGImageCreate((unint64_t)v9, (unint64_t)v10, 8uLL, 0x20uLL, v13, DeviceRGB, 0x4001u, v22, 0, 0, kCGRenderingIntentDefault);
  id v25 = v8;
  [v25 UTF8String];
  CGImageWriteToFile();
  CFRelease(v22);
  CFRelease(DeviceRGB);
  CFRelease(v24);
}

- (VideoRelightingMetal)initWithMetalContext:(void *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)VideoRelightingMetal;
  id v4 = [(ImageSaverAndFileConfigRegistrator *)&v8 init];
  NSUInteger v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_device, *(id *)a3);
    objc_storeStrong((id *)&v5->_commandQueue, *((id *)a3 + 1));
    objc_storeStrong((id *)&v5->_library, *((id *)a3 + 2));
    objc_storeStrong((id *)&v5->_pipelineLibrary, *((id *)a3 + 3));
    v5->_metalContext = a3;
    [(VideoRelightingMetal *)v5 initCommon];
    unint64_t v6 = v5;
  }

  return v5;
}

- (void)initCommon
{
  uint64_t v252 = *MEMORY[0x1E4F143B8];
  BOOL v3 = +[CVAPreferenceManager defaults];

  if (v3)
  {
    id v4 = +[CVAPreferenceManager defaults];
    self->_debugFace = [v4 BOOLForKey:@"CVAPhotoDebugFace"];

    if (self->_debugFace)
    {
      NSUInteger v5 = +[CVAPreferenceManager defaults];
      self->_debugFaceDraw = [v5 BOOLForKey:@"CVAPhotoDebugFaceDraw"];
    }
    else
    {
      self->_debugFaceDraw = 0;
    }
  }
  [(VideoRelightingMetal *)self initKernelFunctions];
  unint64_t v6 = [[CVAFilterColorAlphaToFgBg alloc] initWithDevice:self->_device library:self->_library pipelineLibrary:self->_pipelineLibrary error:0];
  id v7 = +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:v6];
  colorAlphaToFgBg = self->_colorAlphaToFgBg;
  self->_colorAlphaToFgBg = v7;

  double v9 = [[CVAFilterMaskedVariableBlur alloc] initWithDevice:self->_device library:self->_library pipelineLibrary:self->_pipelineLibrary commandQueue:self->_commandQueue kernelSize:7 error:0];
  double v10 = +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:v9];
  blurPyramidForSkinFg = self->_blurPyramidForSkinFg;
  self->_blurPyramidForSkinFg = v10;

  float32x4_t v12 = [MEMORY[0x1E4F1E008] blackColor];
  backgroundColor = self->_backgroundColor;
  self->_backgroundColor = v12;

  self->_relightingStabilitdouble y = 1.0;
  self->_vignettingScale = 1.0;
  self->_frameIndedouble x = -1;
  unint64_t v14 = (BOOL *)operator new(3uLL);
  m_buff = self->_faceDetectedRealHistory.m_buff;
  self->_faceDetectedRealHistory.m_buff = v14;
  self->_faceDetectedRealHistory.m_end = v14 + 3;
  self->_faceDetectedRealHistory.m_first = v14;
  self->_faceDetectedRealHistory.m_last = v14;
  self->_faceDetectedRealHistory.int64_t m_size = 0;
  if (m_buff) {
    operator delete(m_buff);
  }
  sub_1BA841104((uint64_t)&__p, 5);
  LOBYTE(v244) = 0;
  uint64_t v16 = v235;
  uint64_t v249 = v235;
  id v18 = (int *)__p;
  int v17 = v232;
  uint64_t v19 = (char *)v232 - (unsigned char *)__p;
  if ((char *)v232 - (unsigned char *)__p < 0)
  {
    std::logic_error::logic_error(&v238, "circular_buffer");
    v238.__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D0] + 16);
    abort();
  }
  if (v232 == __p) {
    char v20 = 0;
  }
  else {
    char v20 = (char *)operator new((char *)v232 - (unsigned char *)__p);
  }
  v245 = v20;
  v246 = (id *)&v20[4 * (v19 >> 2)];
  v247 = v20;
  size_t v21 = v20;
  if (v16)
  {
    id v22 = v233;
    size_t v21 = v20;
    if (v233)
    {
      id v23 = v234;
      size_t v21 = v20;
      do
      {
        int v24 = *v22++;
        *(_DWORD *)size_t v21 = v24;
        v21 += 4;
        if (v22 == v17) {
          id v22 = v18;
        }
      }
      while (v22 != v23 && v22 != 0);
    }
  }
  if (v21 == &v20[4 * (v19 >> 2)]) {
    unint64_t v26 = v20;
  }
  else {
    unint64_t v26 = v21;
  }
  v248 = v26;
  int v250 = v236;
  uint64_t v251 = v237;
  LOBYTE(v244) = 1;
  uint64_t v27 = (void **)((char *)&self->_faceConfidenceRollingVariance.m_storage.dummy_.aligner_ + 7);
  if (self->_faceConfidenceRollingVariance.m_initialized)
  {
    sub_1BA84120C(v27, (void **)&v245);
    *(_DWORD *)((char *)&self->_faceConfidenceRollingVariance.m_storage.dummy_.aligner_ + 51) = v250;
    *(void *)((char *)&self->_faceConfidenceRollingVariance.m_storage.dummy_.aligner_ + 55) = v251;
    if (!(_BYTE)v244) {
      goto LABEL_33;
    }
  }
  else
  {
    sub_1BA841364(v27, (int **)&v245);
    *(_DWORD *)((char *)&self->_faceConfidenceRollingVariance.m_storage.dummy_.aligner_ + 51) = v250;
    *(void *)((char *)&self->_faceConfidenceRollingVariance.m_storage.dummy_.aligner_ + 55) = v251;
    self->_faceConfidenceRollingVariance.m_initialized = 1;
    if (!(_BYTE)v244) {
      goto LABEL_33;
    }
  }
  unint64_t v28 = (unint64_t)((char *)v246 - v245) >> 2;
  if (v249 < ((char *)v246 - v247) >> 2) {
    unint64_t v28 = 0;
  }
  v247 += 4 * (v249 - v28);
  if (v245) {
    operator delete(v245);
  }
  LOBYTE(v244) = 0;
LABEL_33:
  unint64_t v29 = (unint64_t)((char *)v232 - (unsigned char *)__p) >> 2;
  if (v235 < v232 - v233) {
    unint64_t v29 = 0;
  }
  v233 += v235 - v29;
  if (__p) {
    operator delete(__p);
  }
  uint64_t v241 = 0;
  char v30 = (char *)operator new(0x18uLL);
  v238.__vftable = (std::logic_error_vtbl *)v30;
  v238.__imp_.__imp_ = v30 + 24;
  v239 = v30;
  v240 = v30;
  sub_1BA841364(&__p, (int **)&v238);
  int v236 = 0;
  operator delete(v30);
  LOBYTE(v244) = 0;
  uint64_t v31 = v235;
  uint64_t v249 = v235;
  long long v33 = (int *)__p;
  char v32 = v232;
  uint64_t v34 = (char *)v232 - (unsigned char *)__p;
  if ((char *)v232 - (unsigned char *)__p < 0)
  {
    std::logic_error::logic_error(&v238, "circular_buffer");
    v238.__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D0] + 16);
    abort();
  }
  if (v232 == __p) {
    float32x4_t v35 = 0;
  }
  else {
    float32x4_t v35 = (char *)operator new((char *)v232 - (unsigned char *)__p);
  }
  v245 = v35;
  v246 = (id *)&v35[4 * (v34 >> 2)];
  v247 = v35;
  float32x4_t v36 = v35;
  if (v31)
  {
    float v37 = v233;
    float32x4_t v36 = v35;
    if (v233)
    {
      float v38 = v234;
      float32x4_t v36 = v35;
      do
      {
        int v39 = *v37++;
        *(_DWORD *)float32x4_t v36 = v39;
        v36 += 4;
        if (v37 == v32) {
          float v37 = v33;
        }
      }
      while (v37 != v38 && v37 != 0);
    }
  }
  if (v36 == &v35[4 * (v34 >> 2)]) {
    float32x2_t v41 = v35;
  }
  else {
    float32x2_t v41 = v36;
  }
  v248 = v41;
  int v250 = v236;
  LOBYTE(v244) = 1;
  float32x4_t v42 = (void **)((char *)&self->_faceRelightingAngleFactorsRollingMean.m_storage.dummy_.aligner_ + 14);
  if (self->_faceRelightingAngleFactorsRollingMean.m_storage.dummy_.data[6])
  {
    sub_1BA84120C(v42, (void **)&v245);
    *(_DWORD *)((char *)&self->_faceRelightingAngleFactorsRollingMean.m_storage.dummy_.aligner_ + 58) = v250;
    if (!(_BYTE)v244) {
      goto LABEL_63;
    }
  }
  else
  {
    sub_1BA841364(v42, (int **)&v245);
    *(_DWORD *)((char *)&self->_faceRelightingAngleFactorsRollingMean.m_storage.dummy_.aligner_ + 58) = v250;
    self->_faceRelightingAngleFactorsRollingMean.m_storage.dummy_.data[6] = 1;
    if (!(_BYTE)v244) {
      goto LABEL_63;
    }
  }
  unint64_t v43 = (unint64_t)((char *)v246 - v245) >> 2;
  if (v249 < ((char *)v246 - v247) >> 2) {
    unint64_t v43 = 0;
  }
  v247 += 4 * (v249 - v43);
  if (v245) {
    operator delete(v245);
  }
  LOBYTE(v244) = 0;
LABEL_63:
  unint64_t v44 = (unint64_t)((char *)v232 - (unsigned char *)__p) >> 2;
  if (v235 < v232 - v233) {
    unint64_t v44 = 0;
  }
  v233 += v235 - v44;
  if (__p) {
    operator delete(__p);
  }
  float32x2_t v45 = (OS_dispatch_semaphore *)dispatch_semaphore_create(5);
  inflightSemaphore = self->_inflightSemaphore;
  self->_inflightSemaphore = v45;

  float32x4_t v47 = (OS_dispatch_queue *)dispatch_queue_create("_synchronousRelightingCallbackQueue", 0);
  synchronousRelightingCallbackQueue = self->_synchronousRelightingCallbackQueue;
  self->_synchronousRelightingCallbackQueue = v47;

  if (qword_1E9F768B0 != -1) {
    dispatch_once(&qword_1E9F768B0, &unk_1F142F248);
  }
  if (byte_1E9F768A8 == 1)
  {
    __p = 0;
    v242[0] = qword_1E9F76810;
    v242[1] = qword_1E9F76830;
    v243[0] = MEMORY[0x1E4F1CC38];
    v243[1] = MEMORY[0x1E4F1CC28];
    float v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v243 forKeys:v242 count:2];
    if (off_1E9F767E0(v49, &__p))
    {
LABEL_264:

      return;
    }
    float v50 = __p;
    if (!__p)
    {
LABEL_263:

      goto LABEL_264;
    }
    p_faceKitMeshTris = &self->_faceKitMeshTris;
    self->_faceKitMeshTris.__end_ = self->_faceKitMeshTris.__begin_;
    id v222 = v50;
    unint64_t v52 = [v50 objectForKeyedSubscript:qword_1E9F767A0];
    v225 = v52;
    uint64_t v53 = [v52 objectForKeyedSubscript:qword_1E9F76818];
    uint64_t v228 = v53;
    [v52 objectForKeyedSubscript:qword_1E9F76820];
    v221 = float32x4_t v220 = v49;
    if (!(v53 | v221))
    {
      end = self->_faceKitMeshTris.__end_;
      goto LABEL_258;
    }
    unint64_t v54 = [(id)v53 length];
    uint64_t v55 = [ (id) v53 bytes];
    if (v54 < 4)
    {
LABEL_74:
      uint64_t v56 = [(id)v221 length];
      uint64_t v53 = v228;
      uint64_t v57 = [ (id) v221 bytes];
      end = p_faceKitMeshTris->__end_;
      if ((unint64_t)(v56 << 28) >> 32)
      {
        uint64_t v59 = 0;
        unint64_t v60 = (int)(v56 >> 4);
        if (v60 <= 1) {
          unint64_t v60 = 1;
        }
        unint64_t v224 = v60;
        uint64_t v229 = v57;
        do
        {
          int v61 = *(_DWORD *)(v57 + 16 * v59);
          value = p_faceKitMeshTris->__end_cap_.__value_;
          if (end < value)
          {
            unsigned __int16 *end = v61;
            v63 = end + 1;
            goto LABEL_102;
          }
          begin = p_faceKitMeshTris->__begin_;
          uint64_t v65 = (char *)end - (char *)p_faceKitMeshTris->__begin_;
          if (v65 <= -3) {
            abort();
          }
          uint64_t v66 = v59;
          uint64_t v67 = v65 >> 1;
          unint64_t v68 = (char *)value - (char *)begin;
          if (v68 <= (v65 >> 1) + 1) {
            unint64_t v69 = v67 + 1;
          }
          else {
            unint64_t v69 = v68;
          }
          if (v68 >= 0x7FFFFFFFFFFFFFFELL) {
            uint64_t v70 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else {
            uint64_t v70 = v69;
          }
          if (v70)
          {
            if (v70 < 0) {
              sub_1BA81F974();
            }
            float32x4_t v71 = operator new(2 * v70);
          }
          else
          {
            float32x4_t v71 = 0;
          }
          int16x4_t v72 = (unsigned __int16 *)&v71[2 * v67];
          *int16x4_t v72 = v61;
          v63 = v72 + 1;
          if (end == begin)
          {
            uint64_t v53 = v228;
          }
          else
          {
            unint64_t v73 = (char *)(end - 1) - (char *)begin;
            if (v73 < 0x5E
              || (unint64_t v132 = v65 & 0xFFFFFFFFFFFFFFFELL,
                  &v71[(v65 & 0xFFFFFFFFFFFFFFFELL) - 2 - (v73 & 0xFFFFFFFFFFFFFFFELL)] > &v71[(v65 & 0xFFFFFFFFFFFFFFFELL)
                                                                                             - 2]))
            {
              float v74 = end;
              uint64_t v53 = v228;
            }
            else
            {
              uint64_t v53 = v228;
              if ((unsigned __int16 *)((char *)end - (v73 & 0xFFFFFFFFFFFFFFFELL) - 2) > end - 1)
              {
                float v74 = end;
              }
              else if ((char *)end - v71 - v132 >= 0x20)
              {
                uint64_t v161 = (v73 >> 1) + 1;
                float v74 = &end[-(v161 & 0xFFFFFFFFFFFFFFF0)];
                v162 = &v71[2 * v67 - 16];
                uint64_t v163 = end - 8;
                unint64_t v164 = v161 & 0xFFFFFFFFFFFFFFF0;
                do
                {
                  long long v165 = *(_OWORD *)v163;
                  *(v162 - 1) = *((_OWORD *)v163 - 1);
                  _OWORD *v162 = v165;
                  v162 -= 2;
                  v163 -= 16;
                  v164 -= 16;
                }
                while (v164);
                v72 -= v161 & 0xFFFFFFFFFFFFFFF0;
                if (v161 == (v161 & 0xFFFFFFFFFFFFFFF0)) {
                  goto LABEL_99;
                }
              }
              else
              {
                float v74 = end;
              }
            }
            do
            {
              unsigned __int16 v75 = *--v74;
              *--int16x4_t v72 = v75;
            }
            while (v74 != begin);
          }
LABEL_99:
          value = (unsigned __int16 *)&v71[2 * v70];
          p_faceKitMeshTris->__begin_ = v72;
          p_faceKitMeshTris->__end_ = v63;
          p_faceKitMeshTris->__end_cap_.__value_ = value;
          if (begin)
          {
            operator delete(begin);
            value = p_faceKitMeshTris->__end_cap_.__value_;
          }
          uint64_t v57 = v229;
          uint64_t v59 = v66;
LABEL_102:
          uint64_t v226 = v59;
          uint64_t v76 = 4 * v59;
          p_faceKitMeshTris->__end_ = v63;
          uint64_t v227 = 16 * v59;
          int v77 = *(_DWORD *)(v57 + ((16 * v59) | 4));
          if (v63 < value)
          {
            unsigned __int16 *v63 = v77;
            float32x2_t v78 = v63 + 1;
            goto LABEL_124;
          }
          float32x2_t v79 = p_faceKitMeshTris->__begin_;
          uint64_t v80 = (char *)v63 - (char *)p_faceKitMeshTris->__begin_;
          if (v80 <= -3) {
            abort();
          }
          uint64_t v81 = v80 >> 1;
          unint64_t v82 = (char *)value - (char *)v79;
          if (v82 <= (v80 >> 1) + 1) {
            unint64_t v83 = v81 + 1;
          }
          else {
            unint64_t v83 = v82;
          }
          if (v82 >= 0x7FFFFFFFFFFFFFFELL) {
            uint64_t v84 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else {
            uint64_t v84 = v83;
          }
          if (v84)
          {
            if (v84 < 0) {
              sub_1BA81F974();
            }
            float v85 = operator new(2 * v84);
          }
          else
          {
            float v85 = 0;
          }
          id v86 = (unsigned __int16 *)&v85[2 * v81];
          *id v86 = v77;
          float32x2_t v78 = v86 + 1;
          if (v63 == v79)
          {
            uint64_t v53 = v228;
          }
          else
          {
            unint64_t v87 = (char *)(v63 - 1) - (char *)v79;
            if (v87 < 0x5E
              || &v85[(v80 & 0xFFFFFFFFFFFFFFFELL) - 2 - (v87 & 0xFFFFFFFFFFFFFFFELL)] > &v85[(v80 & 0xFFFFFFFFFFFFFFFELL)
                                                                                            - 2]
              || (unsigned __int16 *)((char *)v63 - (v87 & 0xFFFFFFFFFFFFFFFELL) - 2) > v63 - 1
              || (char *)v63 - v85 - (v80 & 0xFFFFFFFFFFFFFFFELL) < 0x20)
            {
              float v88 = v63;
              uint64_t v53 = v228;
            }
            else
            {
              uint64_t v133 = (v87 >> 1) + 1;
              float v88 = &v63[-(v133 & 0xFFFFFFFFFFFFFFF0)];
              float32x2_t v134 = &v85[2 * v81 - 16];
              float32x2_t v135 = v63 - 8;
              unint64_t v136 = v133 & 0xFFFFFFFFFFFFFFF0;
              do
              {
                long long v137 = *(_OWORD *)v135;
                *(v134 - 1) = *((_OWORD *)v135 - 1);
                _OWORD *v134 = v137;
                v134 -= 2;
                v135 -= 16;
                v136 -= 16;
              }
              while (v136);
              v86 -= v133 & 0xFFFFFFFFFFFFFFF0;
              uint64_t v53 = v228;
              if (v133 == (v133 & 0xFFFFFFFFFFFFFFF0)) {
                goto LABEL_121;
              }
            }
            do
            {
              unsigned __int16 v89 = *--v88;
              *--id v86 = v89;
            }
            while (v88 != v79);
          }
LABEL_121:
          value = (unsigned __int16 *)&v85[2 * v84];
          p_faceKitMeshTris->__begin_ = v86;
          p_faceKitMeshTris->__end_ = v78;
          p_faceKitMeshTris->__end_cap_.__value_ = value;
          if (v79)
          {
            operator delete(v79);
            value = p_faceKitMeshTris->__end_cap_.__value_;
          }
          uint64_t v57 = v229;
LABEL_124:
          p_faceKitMeshTris->__end_ = v78;
          uint64_t v90 = v76 | 2;
          int v91 = *(_DWORD *)(v57 + 4 * (v76 | 2));
          if (v78 < value)
          {
            unsigned __int16 *v78 = v91;
            v92 = v78 + 1;
            goto LABEL_146;
          }
          uint64_t v223 = v76;
          uint64_t v93 = v76 | 2;
          v94 = p_faceKitMeshTris->__begin_;
          uint64_t v95 = (char *)v78 - (char *)p_faceKitMeshTris->__begin_;
          if (v95 <= -3) {
            abort();
          }
          uint64_t v96 = v95 >> 1;
          unint64_t v97 = (char *)value - (char *)v94;
          if (v97 <= (v95 >> 1) + 1) {
            unint64_t v98 = v96 + 1;
          }
          else {
            unint64_t v98 = v97;
          }
          if (v97 >= 0x7FFFFFFFFFFFFFFELL) {
            uint64_t v99 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else {
            uint64_t v99 = v98;
          }
          if (v99)
          {
            if (v99 < 0) {
              sub_1BA81F974();
            }
            int v100 = operator new(2 * v99);
          }
          else
          {
            int v100 = 0;
          }
          v101 = (unsigned __int16 *)&v100[2 * v96];
          unsigned __int16 *v101 = v91;
          v92 = v101 + 1;
          if (v78 == v94)
          {
            uint64_t v90 = v93;
          }
          else
          {
            unint64_t v102 = (char *)(v78 - 1) - (char *)v94;
            if (v102 < 0x5E
              || &v100[(v95 & 0xFFFFFFFFFFFFFFFELL) - 2 - (v102 & 0xFFFFFFFFFFFFFFFELL)] > &v100[(v95 & 0xFFFFFFFFFFFFFFFELL)
                                                                                               - 2]
              || (unsigned __int16 *)((char *)v78 - (v102 & 0xFFFFFFFFFFFFFFFELL) - 2) > v78 - 1
              || (unint64_t)((char *)v78 - &v100[v95 & 0xFFFFFFFFFFFFFFFELL]) < 0x20)
            {
              v103 = v78;
              uint64_t v90 = v93;
            }
            else
            {
              uint64_t v138 = (v102 >> 1) + 1;
              v103 = &v78[-(v138 & 0xFFFFFFFFFFFFFFF0)];
              float32x2_t v139 = &v100[2 * v96 - 16];
              float32x2_t v140 = v78 - 8;
              unint64_t v141 = v138 & 0xFFFFFFFFFFFFFFF0;
              do
              {
                long long v142 = *(_OWORD *)v140;
                *(v139 - 1) = *((_OWORD *)v140 - 1);
                *float32x2_t v139 = v142;
                v139 -= 2;
                v140 -= 16;
                v141 -= 16;
              }
              while (v141);
              v101 -= v138 & 0xFFFFFFFFFFFFFFF0;
              uint64_t v90 = v93;
              if (v138 == (v138 & 0xFFFFFFFFFFFFFFF0)) {
                goto LABEL_143;
              }
            }
            do
            {
              unsigned __int16 v104 = *--v103;
              *--v101 = v104;
            }
            while (v103 != v94);
          }
LABEL_143:
          value = (unsigned __int16 *)&v100[2 * v99];
          p_faceKitMeshTris->__begin_ = v101;
          p_faceKitMeshTris->__end_ = v92;
          p_faceKitMeshTris->__end_cap_.__value_ = value;
          uint64_t v76 = v223;
          if (v94)
          {
            operator delete(v94);
            value = p_faceKitMeshTris->__end_cap_.__value_;
          }
          uint64_t v53 = v228;
          uint64_t v57 = v229;
LABEL_146:
          p_faceKitMeshTris->__end_ = v92;
          int v105 = *(_DWORD *)(v57 + 4 * v76);
          if (v92 < value)
          {
            unsigned __int16 *v92 = v105;
            char v106 = v92 + 1;
            goto LABEL_168;
          }
          uint64_t v107 = v90;
          id v108 = p_faceKitMeshTris->__begin_;
          uint64_t v109 = (char *)v92 - (char *)p_faceKitMeshTris->__begin_;
          if (v109 <= -3) {
            abort();
          }
          uint64_t v110 = v109 >> 1;
          unint64_t v111 = (char *)value - (char *)v108;
          if (v111 <= (v109 >> 1) + 1) {
            unint64_t v112 = v110 + 1;
          }
          else {
            unint64_t v112 = v111;
          }
          if (v111 >= 0x7FFFFFFFFFFFFFFELL) {
            uint64_t v113 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else {
            uint64_t v113 = v112;
          }
          if (v113)
          {
            if (v113 < 0) {
              sub_1BA81F974();
            }
            unint64_t v114 = operator new(2 * v113);
          }
          else
          {
            unint64_t v114 = 0;
          }
          id v115 = (unsigned __int16 *)&v114[2 * v110];
          *id v115 = v105;
          char v106 = v115 + 1;
          if (v92 == v108)
          {
            uint64_t v90 = v107;
          }
          else
          {
            unint64_t v116 = (char *)(v92 - 1) - (char *)v108;
            if (v116 < 0x5E
              || &v114[(v109 & 0xFFFFFFFFFFFFFFFELL) - 2 - (v116 & 0xFFFFFFFFFFFFFFFELL)] > &v114[(v109 & 0xFFFFFFFFFFFFFFFELL)
                                                                                                - 2]
              || (unsigned __int16 *)((char *)v92 - (v116 & 0xFFFFFFFFFFFFFFFELL) - 2) > v92 - 1
              || (char *)v92 - v114 - (v109 & 0xFFFFFFFFFFFFFFFELL) < 0x20)
            {
              float v117 = v92;
              uint64_t v90 = v107;
            }
            else
            {
              uint64_t v143 = (v116 >> 1) + 1;
              float v117 = &v92[-(v143 & 0xFFFFFFFFFFFFFFF0)];
              uint64_t v144 = &v114[2 * v110 - 16];
              uint64_t v145 = v92 - 8;
              unint64_t v146 = v143 & 0xFFFFFFFFFFFFFFF0;
              do
              {
                long long v147 = *(_OWORD *)v145;
                *(v144 - 1) = *((_OWORD *)v145 - 1);
                *uint64_t v144 = v147;
                v144 -= 2;
                v145 -= 16;
                v146 -= 16;
              }
              while (v146);
              v115 -= v143 & 0xFFFFFFFFFFFFFFF0;
              uint64_t v90 = v107;
              if (v143 == (v143 & 0xFFFFFFFFFFFFFFF0)) {
                goto LABEL_165;
              }
            }
            do
            {
              unsigned __int16 v118 = *--v117;
              *--id v115 = v118;
            }
            while (v117 != v108);
          }
LABEL_165:
          value = (unsigned __int16 *)&v114[2 * v113];
          p_faceKitMeshTris->__begin_ = v115;
          p_faceKitMeshTris->__end_ = v106;
          p_faceKitMeshTris->__end_cap_.__value_ = value;
          uint64_t v53 = v228;
          if (v108)
          {
            operator delete(v108);
            value = p_faceKitMeshTris->__end_cap_.__value_;
          }
          uint64_t v57 = v229;
LABEL_168:
          p_faceKitMeshTris->__end_ = v106;
          int v119 = *(_DWORD *)(v57 + 4 * v90);
          if (v106 < value)
          {
            *char v106 = v119;
            float v120 = v106 + 1;
            uint64_t v121 = v227;
            goto LABEL_218;
          }
          float v122 = p_faceKitMeshTris->__begin_;
          uint64_t v123 = (char *)v106 - (char *)p_faceKitMeshTris->__begin_;
          if (v123 <= -3) {
            abort();
          }
          uint64_t v124 = v123 >> 1;
          unint64_t v125 = (char *)value - (char *)v122;
          if (v125 <= (v123 >> 1) + 1) {
            unint64_t v126 = v124 + 1;
          }
          else {
            unint64_t v126 = v125;
          }
          if (v125 >= 0x7FFFFFFFFFFFFFFELL) {
            uint64_t v127 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else {
            uint64_t v127 = v126;
          }
          if (v127)
          {
            if (v127 < 0) {
              sub_1BA81F974();
            }
            float v128 = operator new(2 * v127);
          }
          else
          {
            float v128 = 0;
          }
          float v129 = (unsigned __int16 *)&v128[2 * v124];
          *float v129 = v119;
          float v120 = v129 + 1;
          if (v106 == v122)
          {
            uint64_t v121 = v227;
          }
          else
          {
            unint64_t v130 = (char *)(v106 - 1) - (char *)v122;
            if (v130 < 0x5E
              || &v128[(v123 & 0xFFFFFFFFFFFFFFFELL) - 2 - (v130 & 0xFFFFFFFFFFFFFFFELL)] > &v128[(v123 & 0xFFFFFFFFFFFFFFFELL)
                                                                                                - 2])
            {
              float v131 = v106;
              uint64_t v121 = v227;
            }
            else if ((unsigned __int16 *)((char *)v106 - (v130 & 0xFFFFFFFFFFFFFFFELL) - 2) <= v106 - 1 {
                   && (char *)v106 - v128 - (v123 & 0xFFFFFFFFFFFFFFFELL) >= 0x20)
            }
            {
              uint64_t v166 = (v130 >> 1) + 1;
              float v131 = &v106[-(v166 & 0xFFFFFFFFFFFFFFF0)];
              v167 = &v128[2 * v124 - 16];
              float v168 = v106 - 8;
              unint64_t v169 = v166 & 0xFFFFFFFFFFFFFFF0;
              do
              {
                long long v170 = *(_OWORD *)v168;
                *(v167 - 1) = *((_OWORD *)v168 - 1);
                _OWORD *v167 = v170;
                v167 -= 2;
                v168 -= 16;
                v169 -= 16;
              }
              while (v169);
              v129 -= v166 & 0xFFFFFFFFFFFFFFF0;
              uint64_t v121 = v227;
              if (v166 == (v166 & 0xFFFFFFFFFFFFFFF0)) {
                goto LABEL_215;
              }
            }
            else
            {
              float v131 = v106;
              uint64_t v121 = v227;
            }
            do
            {
              unsigned __int16 v148 = *--v131;
              *--float v129 = v148;
            }
            while (v131 != v122);
          }
LABEL_215:
          value = (unsigned __int16 *)&v128[2 * v127];
          p_faceKitMeshTris->__begin_ = v129;
          p_faceKitMeshTris->__end_ = v120;
          p_faceKitMeshTris->__end_cap_.__value_ = value;
          if (v122)
          {
            operator delete(v122);
            value = p_faceKitMeshTris->__end_cap_.__value_;
          }
          uint64_t v57 = v229;
LABEL_218:
          p_faceKitMeshTris->__end_ = v120;
          int v149 = *(_DWORD *)(v57 + (v121 | 0xC));
          if (v120 >= value)
          {
            float v150 = p_faceKitMeshTris->__begin_;
            uint64_t v151 = (char *)v120 - (char *)p_faceKitMeshTris->__begin_;
            if (v151 <= -3) {
              abort();
            }
            uint64_t v152 = v151 >> 1;
            unint64_t v153 = (char *)value - (char *)v150;
            if (v153 <= (v151 >> 1) + 1) {
              unint64_t v154 = v152 + 1;
            }
            else {
              unint64_t v154 = v153;
            }
            if (v153 >= 0x7FFFFFFFFFFFFFFELL) {
              uint64_t v155 = 0x7FFFFFFFFFFFFFFFLL;
            }
            else {
              uint64_t v155 = v154;
            }
            if (v155)
            {
              if (v155 < 0) {
                sub_1BA81F974();
              }
              uint64_t v156 = operator new(2 * v155);
            }
            else
            {
              uint64_t v156 = 0;
            }
            uint64_t v157 = (unsigned __int16 *)&v156[2 * v152];
            *uint64_t v157 = v149;
            end = v157 + 1;
            if (v120 == v150)
            {
              unint64_t v52 = v225;
              goto LABEL_236;
            }
            unint64_t v158 = (char *)(v120 - 1) - (char *)v150;
            unint64_t v52 = v225;
            if (v158 < 0x5E
              || &v156[(v151 & 0xFFFFFFFFFFFFFFFELL) - 2 - (v158 & 0xFFFFFFFFFFFFFFFELL)] > &v156[(v151 & 0xFFFFFFFFFFFFFFFELL)
                                                                                                - 2])
            {
              v159 = v120;
            }
            else
            {
              if ((unsigned __int16 *)((char *)v120 - (v158 & 0xFFFFFFFFFFFFFFFELL) - 2) > v120 - 1)
              {
                v159 = v120;
                goto LABEL_233;
              }
              if ((char *)v120 - v156 - (v151 & 0xFFFFFFFFFFFFFFFELL) < 0x20)
              {
                v159 = v120;
                goto LABEL_233;
              }
              uint64_t v171 = (v158 >> 1) + 1;
              v159 = &v120[-(v171 & 0xFFFFFFFFFFFFFFF0)];
              uint64_t v172 = &v156[2 * v152 - 16];
              uint64_t v173 = v120 - 8;
              unint64_t v174 = v171 & 0xFFFFFFFFFFFFFFF0;
              do
              {
                long long v175 = *(_OWORD *)v173;
                *(v172 - 1) = *((_OWORD *)v173 - 1);
                *uint64_t v172 = v175;
                v172 -= 2;
                v173 -= 16;
                v174 -= 16;
              }
              while (v174);
              v157 -= v171 & 0xFFFFFFFFFFFFFFF0;
              if (v171 == (v171 & 0xFFFFFFFFFFFFFFF0))
              {
LABEL_236:
                p_faceKitMeshTris->__begin_ = v157;
                p_faceKitMeshTris->__end_ = end;
                p_faceKitMeshTris->__end_cap_.__value_ = (unsigned __int16 *)&v156[2 * v155];
                if (v150) {
                  operator delete(v150);
                }
                uint64_t v57 = v229;
                goto LABEL_79;
              }
            }
            do
            {
LABEL_233:
              unsigned __int16 v160 = *--v159;
              *--uint64_t v157 = v160;
            }
            while (v159 != v150);
            goto LABEL_236;
          }
          *float v120 = v149;
          end = v120 + 1;
          unint64_t v52 = v225;
LABEL_79:
          p_faceKitMeshTris->__end_ = end;
          uint64_t v59 = v226 + 1;
        }
        while (v226 + 1 != v224);
      }
LABEL_258:
      unint64_t v176 = (void *)[(MTLDeviceSPI *)self->_device newBufferWithBytes:p_faceKitMeshTris->__begin_ length:(char *)end - (char *)p_faceKitMeshTris->__begin_ options:0];
      float v177 = +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:v176];
      indexBufferImmutable = self->_indexBufferImmutable;
      self->_indexBufferImmutable = v177;

      v179 = [v52 objectForKeyedSubscript:qword_1E9F76808];
      faceKitMeshTexcoords = self->_faceKitMeshTexcoords;
      self->_faceKitMeshTexcoords = v179;

      uint64_t v181 = [v222 objectForKeyedSubscript:qword_1E9F76800];
      uint64_t v182 = operator new(0x20uLL);
      p_indexOfCheekLandmark_topLeft = &self->_indexOfCheekLandmark_topLeft;
      *uint64_t v182 = &self->_indexOfCheekLandmark_topLeft;
      v182[1] = &self->_indexOfCheekLandmark_topRight;
      v182[2] = &self->_indexOfCheekLandmark_bottomLeft;
      v182[3] = &self->_indexOfCheekLandmark_bottomRight;
      unint64_t v184 = (id *)operator new(0x20uLL);
      v245 = v184 + 4;
      v246 = v184 + 4;
      *unint64_t v184 = @"CheekLeft0";
      v184[1] = @"CheekRight0";
      v184[2] = @"CheekLeft4";
      v184[3] = @"CheekRight4";
      v244 = v184;
      float v49 = v220;
      uint64_t v185 = objc_msgSend(v181, "indexOfObject:");
      unint64_t *p_indexOfCheekLandmark_topLeft = v185;
      if (v185 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v218 = 0;
      }
      else
      {
        v186 = (uint64_t *)v182[1];
        uint64_t v187 = [v181 indexOfObject:v184[1]];
        uint64_t *v186 = v187;
        if (v187 == 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v218 = 1;
        }
        else
        {
          v188 = (uint64_t *)v182[2];
          uint64_t v189 = [v181 indexOfObject:v184[2]];
          uint64_t *v188 = v189;
          if (v189 == 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v218 = 2;
          }
          else
          {
            float v190 = (uint64_t *)v182[3];
            uint64_t v191 = [v181 indexOfObject:v184[3]];
            *float v190 = v191;
            if (v191 != 0x7FFFFFFFFFFFFFFFLL)
            {

              operator delete(v184);
              operator delete(v182);

              float v50 = v222;
              goto LABEL_263;
            }
            uint64_t v218 = 3;
          }
        }
      }
      float32x2_t v219 = [NSString stringWithFormat:@"FaceKit bad API - landmark %@ not found.", v184[v218]];
      objc_exception_throw(v219);
    }
    uint64_t v192 = 0;
    if (v54 >> 2 <= 1) {
      uint64_t v193 = 1;
    }
    else {
      uint64_t v193 = v54 >> 2;
    }
    v194 = self->_faceKitMeshTris.__end_;
    uint64_t v230 = v55;
    while (1)
    {
      int v196 = *(_DWORD *)(v55 + 4 * v192);
      long long v197 = p_faceKitMeshTris->__end_cap_.__value_;
      if (v194 >= v197) {
        break;
      }
      unsigned __int16 *v194 = v196;
      long long v195 = v194 + 1;
LABEL_271:
      p_faceKitMeshTris->__end_ = v195;
      ++v192;
      v194 = v195;
      if (v192 == v193) {
        goto LABEL_74;
      }
    }
    double v198 = self;
    uint64_t v199 = v193;
    v200 = p_faceKitMeshTris->__begin_;
    uint64_t v201 = (char *)v194 - (char *)p_faceKitMeshTris->__begin_;
    if (v201 <= -3) {
      abort();
    }
    uint64_t v202 = v201 >> 1;
    unint64_t v203 = (char *)v197 - (char *)v200;
    if (v203 <= (v201 >> 1) + 1) {
      unint64_t v204 = v202 + 1;
    }
    else {
      unint64_t v204 = v203;
    }
    if (v203 >= 0x7FFFFFFFFFFFFFFELL) {
      uint64_t v205 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v205 = v204;
    }
    if (v205)
    {
      if (v205 < 0) {
        sub_1BA81F974();
      }
      uint64_t v206 = v205;
      float32x2_t v207 = operator new(2 * v205);
      uint64_t v205 = v206;
    }
    else
    {
      float32x2_t v207 = 0;
    }
    float32x2_t v208 = (unsigned __int16 *)&v207[2 * v202];
    *float32x2_t v208 = v196;
    long long v195 = v208 + 1;
    if (v194 == v200)
    {
      unint64_t v52 = v225;
      uint64_t v193 = v199;
      self = v198;
    }
    else
    {
      unint64_t v209 = (char *)(v194 - 1) - (char *)v200;
      if (v209 < 0x5E
        || (unint64_t v212 = v201 & 0xFFFFFFFFFFFFFFFELL,
            &v207[(v201 & 0xFFFFFFFFFFFFFFFELL) - 2 - (v209 & 0xFFFFFFFFFFFFFFFELL)] > &v207[(v201 & 0xFFFFFFFFFFFFFFFELL)
                                                                                           - 2]))
      {
        float32x2_t v210 = v194;
        unint64_t v52 = v225;
        uint64_t v193 = v199;
        self = v198;
      }
      else
      {
        uint64_t v193 = v199;
        if ((unsigned __int16 *)((char *)v194 - (v209 & 0xFFFFFFFFFFFFFFFELL) - 2) > v194 - 1)
        {
          float32x2_t v210 = v194;
          unint64_t v52 = v225;
          self = v198;
        }
        else
        {
          self = v198;
          if ((unint64_t)((char *)v194 - &v207[v212]) >= 0x20)
          {
            uint64_t v213 = (v209 >> 1) + 1;
            float32x2_t v210 = &v194[-(v213 & 0xFFFFFFFFFFFFFFF0)];
            float64_t v214 = &v207[2 * v202 - 16];
            float32x4_t v215 = v194 - 8;
            unint64_t v216 = v213 & 0xFFFFFFFFFFFFFFF0;
            do
            {
              long long v217 = *(_OWORD *)v215;
              *(v214 - 1) = *((_OWORD *)v215 - 1);
              *float64_t v214 = v217;
              v214 -= 2;
              v215 -= 16;
              v216 -= 16;
            }
            while (v216);
            v208 -= v213 & 0xFFFFFFFFFFFFFFF0;
            unint64_t v52 = v225;
            if (v213 == (v213 & 0xFFFFFFFFFFFFFFF0)) {
              goto LABEL_290;
            }
          }
          else
          {
            float32x2_t v210 = v194;
            unint64_t v52 = v225;
          }
        }
      }
      do
      {
        unsigned __int16 v211 = *--v210;
        *--float32x2_t v208 = v211;
      }
      while (v210 != v200);
    }
LABEL_290:
    p_faceKitMeshTris->__begin_ = v208;
    p_faceKitMeshTris->__end_ = v195;
    p_faceKitMeshTris->__end_cap_.__value_ = (unsigned __int16 *)&v207[2 * v205];
    if (v200) {
      operator delete(v200);
    }
    uint64_t v55 = v230;
    goto LABEL_271;
  }
}

- (id)getInternalColorCube:(int)a3
{
  texColorCubeStaticArradouble y = self->_texColorCubeStaticArray;
  uint64_t v4 = a3;
  if (self->_texColorCubeStaticArray[a3]) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = a3 > 6;
  }
  if (!v5 && ((0x7Bu >> a3) & 1) != 0)
  {
    uint64_t v6 = [(VideoRelightingMetal *)self loadCube:*(&off_1E6228618 + a3)];
    id v7 = texColorCubeStaticArray[v4];
    texColorCubeStaticArray[v4] = (MTLTexture *)v6;
  }
  p_inst_props = &OBJC_PROTOCOL___CVALightRequest.inst_props;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F769E0, memory_order_acquire) & 1) == 0)
  {
    int v11 = __cxa_guard_acquire(&qword_1E9F769E0);
    p_inst_props = (__objc2_prop_list **)(&OBJC_PROTOCOL___CVALightRequest + 56);
    if (v11)
    {
      unint64_t v14 = texColorCubeStaticArray;
      uint64_t v15 = v4;
      float32x4_t v12 = +[CVAPreferenceManager defaults];
      char v13 = [v12 BOOLForKey:@"CVAPhotoDebugStyle"];

      byte_1E9F769D8 = v13;
      __cxa_guard_release(&qword_1E9F769E0);
      p_inst_props = &OBJC_PROTOCOL___CVALightRequest.inst_props;
      texColorCubeStaticArradouble y = v14;
      uint64_t v4 = v15;
    }
  }
  if (*((unsigned char *)p_inst_props + 2520))
  {
    [NSString stringWithFormat:@"ColorCube: %@", off_1E6228590[v4]];
  }
  double v9 = texColorCubeStaticArray[v4];

  return v9;
}

- (id)loadCube:(id)a3
{
  uint64_t v4 = [@"/System/Library/PrivateFrameworks/AppleCVAPhoto.framework/Resources/" stringByAppendingString:a3];
  BOOL v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v4];
  uint64_t v6 = sub_1BA862804(v5, self->_device);
  id v7 = +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:v6];

  return v7;
}

- (void)initKernelFunctions
{
  v139[12] = *(id *)MEMORY[0x1E4F143B8];
  p_kernel_CountVertical = &self->_kernel_CountVertical;
  v139[0] = &self->_kernel_CountVertical;
  v139[1] = @"smooth_v";
  p_kernel_Count = &self->_kernel_Count;
  v139[2] = 0;
  v139[3] = &self->_kernel_Count;
  v139[4] = @"smooth_h";
  v139[5] = 0;
  p_kernel_Slide = &self->_kernel_Slide;
  v139[6] = &self->_kernel_Slide;
  v139[7] = @"slide";
  p_kernel_AlphaBlendRGBATextureArradouble y = &self->_kernel_AlphaBlendRGBATextureArray;
  v139[8] = 0;
  v139[9] = &self->_kernel_AlphaBlendRGBATextureArray;
  v139[10] = @"alphaBlendRGBATextureArray";
  v139[11] = 0;
  id v7 = (uint64_t *)operator new(0x60uLL);
  char v8 = 0;
  uint64_t v137 = 0;
  double v9 = v7 + 12;
  uint64_t *v7 = (uint64_t)p_kernel_CountVertical;
  v7[1] = @"smooth_v";
  v7[2] = 0;
  v7[3] = (uint64_t)p_kernel_Count;
  v7[4] = @"smooth_h";
  v7[5] = 0;
  kernel_Relight = self->_kernel_Relight;
  v7[6] = (uint64_t)p_kernel_Slide;
  v7[7] = @"slide";
  v7[8] = 0;
  v7[9] = (uint64_t)p_kernel_AlphaBlendRGBATextureArray;
  char v10 = 1;
  int v11 = (char *)(v7 + 12);
  v7[10] = @"alphaBlendRGBATextureArray";
  v7[11] = 0;
  float v129 = self;
  while (2)
  {
    char v12 = 0;
    uint64_t v13 = 0;
    char v130 = v10;
    char v135 = v8 & 1;
    char v14 = 1;
    do
    {
      char v132 = v14;
      uint64_t v15 = objc_opt_new();
      LOBYTE(v139[0]) = v135;
      [v15 setConstantValue:v139 type:53 withName:@"kV2"];
      char v16 = v12 & 1;
      LOBYTE(v139[0]) = v12 & 1;
      [v15 setConstantValue:v139 type:53 withName:@"kGeometricHaloRemoval"];
      LOBYTE(v139[0]) = 0;
      [v15 setConstantValue:v139 type:53 withName:@"kIsContour"];
      uint64_t v17 = (uint64_t)kernel_Relight[v137][v13];
      id v18 = v15;
      uint64_t v19 = v18;
      if (v9 < (uint64_t *)v11)
      {
        *double v9 = v17;
        v9[1] = @"compositeLightmap";
        v9[2] = (uint64_t)v18;
        char v20 = v9 + 3;
        goto LABEL_22;
      }
      int64_t v21 = (char *)v9 - (char *)v7;
      unint64_t v22 = 0xAAAAAAAAAAAAAAABLL * (v9 - v7) + 1;
      if (v22 > 0xAAAAAAAAAAAAAAALL) {
        goto LABEL_109;
      }
      if (0x5555555555555556 * ((v11 - (char *)v7) >> 3) > v22) {
        unint64_t v22 = 0x5555555555555556 * ((v11 - (char *)v7) >> 3);
      }
      if (0xAAAAAAAAAAAAAAABLL * ((v11 - (char *)v7) >> 3) >= 0x555555555555555) {
        unint64_t v22 = 0xAAAAAAAAAAAAAAALL;
      }
      if (v22 > 0xAAAAAAAAAAAAAAALL) {
        goto LABEL_110;
      }
      unint64_t v131 = v22;
      id v23 = (char *)operator new(24 * v22);
      int v24 = v23;
      id v25 = (uint64_t *)&v23[8 * (v9 - v7)];
      *id v25 = v17;
      v25[1] = @"compositeLightmap";
      v25[2] = (uint64_t)v19;
      if (v9 != v7)
      {
        unint64_t v26 = (char *)v9 - (char *)v7 - 24;
        if (v26 < 0x438) {
          goto LABEL_14;
        }
        unint64_t v46 = v26 / 0x18;
        if (&v23[v21 - 24 + -24 * (v26 / 0x18)] > &v23[v21 - 24]) {
          goto LABEL_14;
        }
        unint64_t v47 = (unint64_t)&v9[-3 * v46 - 3];
        if (v47 > (unint64_t)(v9 - 3)) {
          goto LABEL_14;
        }
        unint64_t v48 = (unint64_t)&v9[-3 * v46 - 2];
        if (v48 > (unint64_t)(v9 - 2)) {
          goto LABEL_14;
        }
        unint64_t v49 = (unint64_t)&v23[v21 - 16];
        if (v49 - 24 * v46 > v49) {
          goto LABEL_14;
        }
        unint64_t v50 = (unint64_t)&v9[-3 * v46 - 1];
        if (v50 > (unint64_t)(v9 - 1)) {
          goto LABEL_14;
        }
        unint64_t v51 = (unint64_t)&v23[v21 - 8];
        if (v51 - 24 * v46 > v51) {
          goto LABEL_14;
        }
        unint64_t v52 = -24 * (v26 / 0x18) + v21;
        unint64_t v53 = (unint64_t)&v23[v52 - 24];
        unint64_t v54 = (unint64_t)&v23[v52 - 16];
        uint64_t v55 = &v23[v52 - 8];
        BOOL v56 = v48 >= v51 || v54 >= (unint64_t)(v9 - 1);
        BOOL v57 = !v56;
        BOOL v58 = v50 >= (unint64_t)v25 || v55 >= (char *)v9;
        BOOL v59 = !v58;
        BOOL v60 = v47 >= v49 || v53 >= (unint64_t)(v9 - 2);
        if (!v60 || v57)
        {
LABEL_14:
          uint64_t v27 = v9;
          unint64_t v28 = (uint64_t *)&v23[8 * (v9 - v7)];
        }
        else
        {
          uint64_t v27 = v9;
          unint64_t v28 = (uint64_t *)&v23[8 * (v9 - v7)];
          if (!v59)
          {
            unint64_t v61 = v46 + 1;
            uint64_t v27 = &v9[-3 * (v61 & 0x1FFFFFFFFFFFFFFELL)];
            float32x2_t v62 = (double *)(v25 - 6);
            v63 = v9 - 6;
            uint64_t v64 = v61 & 0x1FFFFFFFFFFFFFFELL;
            do
            {
              float64x2x3_t v140 = vld3q_f64((const double *)v63);
              *((_OWORD *)v63 + 2) = 0uLL;
              *(_OWORD *)(v63 + 1) = 0uLL;
              vst3q_f64(v62, v140);
              v62 -= 6;
              v63 -= 6;
              v64 -= 2;
            }
            while (v64);
            unint64_t v28 = &v25[-3 * (v61 & 0x1FFFFFFFFFFFFFFELL)];
            if (v61 == (v61 & 0x1FFFFFFFFFFFFFFELL)) {
              goto LABEL_16;
            }
          }
        }
        do
        {
          long long v29 = *(_OWORD *)(v27 - 3);
          v27 -= 3;
          v27[1] = 0;
          *(_OWORD *)(v28 - 3) = v29;
          v28 -= 3;
          uint64_t v30 = v27[2];
          v27[2] = 0;
          v28[2] = v30;
        }
        while (v27 != v7);
        do
        {
LABEL_16:

          v9 -= 3;
        }
        while (v9 != v7);
        goto LABEL_19;
      }
      unint64_t v28 = (uint64_t *)&v23[8 * (v9 - v7)];
LABEL_19:
      int v11 = &v24[24 * v131];
      char v20 = v25 + 3;
      if (v7) {
        operator delete(v7);
      }
      id v7 = v28;
LABEL_22:

      uint64_t v31 = objc_opt_new();
      LOBYTE(v139[0]) = v135;
      [v31 setConstantValue:v139 type:53 withName:@"kV2"];
      LOBYTE(v139[0]) = v16;
      [v31 setConstantValue:v139 type:53 withName:@"kGeometricHaloRemoval"];
      LOBYTE(v139[0]) = 1;
      [v31 setConstantValue:v139 type:53 withName:@"kIsContour"];
      uint64_t v32 = (uint64_t)&kernel_Relight[v137][v13][1];
      id v33 = v31;
      uint64_t v34 = v33;
      if (v20 < (uint64_t *)v11)
      {
        *char v20 = v32;
        v20[1] = @"compositeLightmap";
        v20[2] = (uint64_t)v33;
        double v9 = v20 + 3;
        goto LABEL_41;
      }
      int64_t v35 = (char *)v20 - (char *)v7;
      unint64_t v36 = 0xAAAAAAAAAAAAAAABLL * (v20 - v7) + 1;
      if (v36 > 0xAAAAAAAAAAAAAAALL) {
LABEL_109:
      }
        sub_1BA81F974();
      if (0x5555555555555556 * ((v11 - (char *)v7) >> 3) > v36) {
        unint64_t v36 = 0x5555555555555556 * ((v11 - (char *)v7) >> 3);
      }
      if (0xAAAAAAAAAAAAAAABLL * ((v11 - (char *)v7) >> 3) >= 0x555555555555555) {
        unint64_t v37 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v37 = v36;
      }
      if (v37 > 0xAAAAAAAAAAAAAAALL) {
LABEL_110:
      }
        sub_1BA81F974();
      float v38 = (char *)operator new(24 * v37);
      int v39 = v38;
      float32x2_t v40 = (uint64_t *)&v38[8 * (v20 - v7)];
      uint64_t *v40 = v32;
      v40[1] = @"compositeLightmap";
      id v40[2] = (uint64_t)v34;
      if (v20 != v7)
      {
        unint64_t v41 = (char *)v20 - (char *)v7 - 24;
        if (v41 < 0x438) {
          goto LABEL_33;
        }
        unint64_t v65 = v41 / 0x18;
        if (&v38[v35 - 24 + -24 * (v41 / 0x18)] > &v38[v35 - 24]) {
          goto LABEL_33;
        }
        unint64_t v66 = (unint64_t)&v20[-3 * v65 - 3];
        if (v66 > (unint64_t)(v20 - 3)) {
          goto LABEL_33;
        }
        unint64_t v67 = (unint64_t)&v20[-3 * v65 - 2];
        if (v67 > (unint64_t)(v20 - 2)) {
          goto LABEL_33;
        }
        unint64_t v68 = (unint64_t)&v38[v35 - 16];
        if (v68 - 24 * v65 > v68) {
          goto LABEL_33;
        }
        unint64_t v69 = (unint64_t)&v20[-3 * v65 - 1];
        if (v69 > (unint64_t)(v20 - 1)) {
          goto LABEL_33;
        }
        unint64_t v70 = (unint64_t)&v38[v35 - 8];
        if (v70 - 24 * v65 > v70) {
          goto LABEL_33;
        }
        unint64_t v71 = -24 * (v41 / 0x18) + v35;
        unint64_t v72 = (unint64_t)&v38[v71 - 24];
        unint64_t v73 = (unint64_t)&v38[v71 - 16];
        float v74 = &v38[v71 - 8];
        BOOL v75 = v67 >= v70 || v73 >= (unint64_t)(v20 - 1);
        BOOL v76 = !v75;
        BOOL v77 = v69 >= (unint64_t)v40 || v74 >= (char *)v20;
        BOOL v78 = !v77;
        BOOL v79 = v66 >= v68 || v72 >= (unint64_t)(v20 - 2);
        if (!v79 || v76)
        {
LABEL_33:
          float32x4_t v42 = v20;
          unint64_t v43 = (uint64_t *)&v38[8 * (v20 - v7)];
        }
        else
        {
          float32x4_t v42 = v20;
          unint64_t v43 = (uint64_t *)&v38[8 * (v20 - v7)];
          if (!v78)
          {
            unint64_t v80 = v65 + 1;
            float32x4_t v42 = &v20[-3 * (v80 & 0x1FFFFFFFFFFFFFFELL)];
            uint64_t v81 = (double *)(v40 - 6);
            unint64_t v82 = v20 - 6;
            uint64_t v83 = v80 & 0x1FFFFFFFFFFFFFFELL;
            do
            {
              float64x2x3_t v141 = vld3q_f64((const double *)v82);
              *((_OWORD *)v82 + 2) = 0uLL;
              *(_OWORD *)(v82 + 1) = 0uLL;
              vst3q_f64(v81, v141);
              v81 -= 6;
              v82 -= 6;
              v83 -= 2;
            }
            while (v83);
            unint64_t v43 = &v40[-3 * (v80 & 0x1FFFFFFFFFFFFFFELL)];
            if (v80 == (v80 & 0x1FFFFFFFFFFFFFFELL)) {
              goto LABEL_35;
            }
          }
        }
        do
        {
          long long v44 = *(_OWORD *)(v42 - 3);
          v42 -= 3;
          v42[1] = 0;
          *(_OWORD *)(v43 - 3) = v44;
          v43 -= 3;
          uint64_t v45 = v42[2];
          v42[2] = 0;
          v43[2] = v45;
        }
        while (v42 != v7);
        do
        {
LABEL_35:

          v20 -= 3;
        }
        while (v20 != v7);
        goto LABEL_38;
      }
      unint64_t v43 = (uint64_t *)&v38[8 * (v20 - v7)];
LABEL_38:
      int v11 = &v39[24 * v37];
      double v9 = v40 + 3;
      if (v7) {
        operator delete(v7);
      }
      id v7 = v43;
LABEL_41:

      char v14 = 0;
      char v12 = 1;
      uint64_t v13 = 1;
    }
    while ((v132 & 1) != 0);
    char v10 = 0;
    char v8 = 1;
    uint64_t v137 = 1;
    if (v130) {
      continue;
    }
    break;
  }
  if (v7 != v9)
  {
    uint64_t v84 = v7;
    do
    {
      sub_1BA8328CC((void **)*v84, v129->_library, v129->_pipelineLibrary, v129->_device, (void *)v84[1], 0, (void *)v84[2]);
      +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:*(void *)*v84];

      v84 += 3;
    }
    while (v84 != v9);
  }
  float v85 = [MEMORY[0x1E4F35358] vertexDescriptor];
  uint64_t v138 = +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:v85];

  id v86 = [v138 attributes];
  unint64_t v87 = [v86 objectAtIndexedSubscript:0];
  [v87 setFormat:31];

  float v88 = [v138 attributes];
  unsigned __int16 v89 = [v88 objectAtIndexedSubscript:0];
  [v89 setBufferIndex:0];

  uint64_t v90 = [v138 attributes];
  int v91 = [v90 objectAtIndexedSubscript:0];
  [v91 setOffset:0];

  v92 = [v138 attributes];
  uint64_t v93 = [v92 objectAtIndexedSubscript:1];
  [v93 setFormat:30];

  v94 = [v138 attributes];
  uint64_t v95 = [v94 objectAtIndexedSubscript:1];
  [v95 setBufferIndex:0];

  uint64_t v96 = [v138 attributes];
  unint64_t v97 = [v96 objectAtIndexedSubscript:1];
  [v97 setOffset:16];

  unint64_t v98 = [v138 attributes];
  uint64_t v99 = [v98 objectAtIndexedSubscript:2];
  [v99 setBufferIndex:0];

  int v100 = [v138 attributes];
  v101 = [v100 objectAtIndexedSubscript:2];
  [v101 setFormat:29];

  unint64_t v102 = [v138 attributes];
  v103 = [v102 objectAtIndexedSubscript:2];
  [v103 setOffset:32];

  unsigned __int16 v104 = [v138 layouts];
  int v105 = [v104 objectAtIndexedSubscript:0];
  [v105 setStride:48];

  char v106 = [v138 layouts];
  uint64_t v107 = [v106 objectAtIndexedSubscript:0];
  [v107 setStepFunction:1];

  id v108 = objc_opt_new();
  uint64_t v109 = +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:v108];

  [v109 setVertexFunction:0];
  [v109 setFragmentFunction:0];
  [v109 setVertexDescriptor:v138];
  uint64_t v110 = [v109 colorAttachments];
  unint64_t v111 = [v110 objectAtIndexedSubscript:0];
  [v111 setPixelFormat:30];

  [v109 setDepthAttachmentPixelFormat:252];
  pipelineLibrardouble y = v129->_pipelineLibrary;
  device = v129->_device;
  unint64_t v136 = v129->_library;
  unint64_t v114 = pipelineLibrary;
  float32x2_t v134 = device;
  id v115 = v109;
  unint64_t v116 = @"TC_vertex";
  float v117 = @"TC_fragment";
  unsigned __int16 v118 = NSString;
  int v119 = [NSString stringWithFormat:@"One of vertexShaderName/fragmentShaderName should be nonnil"];
  float v120 = [v118 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "static void KernelReloader::assignAndWatchShader(__strong id<MTLRenderPipelineState>  _Nonnull * _Nonnull, id<MTLLibrary>  _Nonnull __strong, id<MTLPipelineLibrarySPI>  _Nullable __strong, id<MTLDeviceSPI>  _Nonnull __strong, MTLRenderPipelineDescriptor * _Nonnull __strong, NSError *__autoreleasing  _Nullable * _Nullable, NSString * _Nonnull __strong, NSString * _Nonnull __strong)", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/module/sdof/include/AppleCVAPhoto/sdof/KernelReloader.h", 61, v119];
  sub_1BA8161F4(0, 0, 0, 4294944393, v120);

  uint64_t v121 = sub_1BA861EB8(v136, v114, @"TC_vertex", 0, 0);
  [v115 setVertexFunction:v121];

  float v122 = sub_1BA861EB8(v136, v114, @"TC_fragment", 0, 0);
  [v115 setFragmentFunction:v122];

  [v115 setPipelineLibrary:v114];
  v139[0] = 0;
  uint64_t v123 = [(MTLDeviceSPI *)v134 newRenderPipelineStateWithDescriptor:v115 error:v139];
  id v124 = v139[0];
  tcKernel = v129->_tcKernel;
  v129->_tcKernel = (MTLRenderPipelineState *)v123;

  unint64_t v126 = NSString;
  uint64_t v127 = [NSString stringWithFormat:@"Error occurred when creating face pipeline state: %@", v124];
  float v128 = [v126 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "static void KernelReloader::assignAndWatchShader(__strong id<MTLRenderPipelineState>  _Nonnull * _Nonnull, id<MTLLibrary>  _Nonnull __strong, id<MTLPipelineLibrarySPI>  _Nullable __strong, id<MTLDeviceSPI>  _Nonnull __strong, MTLRenderPipelineDescriptor * _Nonnull __strong, NSError *__autoreleasing  _Nullable * _Nullable, NSString * _Nonnull __strong, NSString * _Nonnull __strong)", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/module/sdof/include/AppleCVAPhoto/sdof/KernelReloader.h", 86, v127];
  sub_1BA8161F4(v124 != 0, 0, v124, 4294944382, v128);

  +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:v129->_tcKernel];
  if (v7)
  {
    for (; v9 != v7; v9 -= 3)
    {
    }
    operator delete(v7);
  }
}

- (void)createTexturesWith:(unint64_t)a3 imgHeight:(unint64_t)a4
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1E9F769D0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1E9F769D0))
  {
    unint64_t v36 = a3;
    unint64_t v37 = +[CVAPreferenceManager defaults];
    char v38 = [v37 BOOLForKey:@"CVAPhotoFullResTCMap"];

    byte_1E9F769CA = v38;
    __cxa_guard_release(&qword_1E9F769D0);
    a3 = v36;
  }
  unint64_t v39 = a3;
  id v40 = (id)(a3 >> 2);
  if (byte_1E9F769CA) {
    unint64_t v7 = a3;
  }
  else {
    unint64_t v7 = a3 >> 2;
  }
  unint64_t v8 = a4 >> 2;
  if (byte_1E9F769CA) {
    unint64_t v9 = a4;
  }
  else {
    unint64_t v9 = a4 >> 2;
  }
  char v10 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:30 width:v7 height:v9 mipmapped:0];
  int v11 = +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:v10];

  [v11 setUsage:7];
  char v12 = (void *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v11];
  uint64_t v13 = +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:v12];
  tcTexture = self->_tcTexture;
  self->_tcTexture = v13;

  objc_storeStrong((id *)&self->_lightTexture, self->_tcTexture);
  uint64_t v15 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:252 width:v7 height:v9 mipmapped:0];
  char v16 = +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:v15];

  [v16 setUsage:5];
  uint64_t v17 = (void *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v16];
  id v18 = +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:v17];
  tcDepthTexture = self->_tcDepthTexture;
  self->_tcDepthTexture = v18;

  char v20 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:30 width:v40 height:v8 mipmapped:0];
  int64_t v21 = +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:v20];

  [v21 setUsage:7];
  unint64_t v22 = (void *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v21];
  id v23 = +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:v22];
  slideTexture = self->_slideTexture;
  self->_slideTexture = v23;

  id v25 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:10 width:v40 height:v8 mipmapped:0];
  unint64_t v26 = +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:v25];

  [v26 setUsage:7];
  uint64_t v27 = (void *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v26];
  unint64_t v28 = +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:v27];
  vertCountTexture = self->_vertCountTexture;
  self->_vertCountTexture = v28;

  uint64_t v30 = (void *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v26];
  uint64_t v31 = +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:v30];
  countTexture = self->_countTexture;
  self->_countTexture = v31;

  id v41 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:70 width:v39 >> 1 height:a4 >> 1 mipmapped:1];
  [v41 setUsage:3];
  [v41 setMipmapLevelCount:3];
  id v33 = (void *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v41];
  uint64_t v34 = +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:v33];
  texSkinRGBAPyramid = self->_texSkinRGBAPyramid;
  self->_texSkinRGBAPyramid = v34;
}

- (id)create3DTextureWithSize:(unint64_t)a3
{
  BOOL v5 = objc_opt_new();
  uint64_t v6 = +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:v5];

  [v6 setTextureType:7];
  [v6 setHeight:a3];
  [v6 setWidth:a3];
  [v6 setDepth:a3];
  [v6 setPixelFormat:70];
  [v6 setArrayLength:1];
  [v6 setMipmapLevelCount:1];
  [v6 setUsage:3];
  unint64_t v7 = (void *)[(MTLDeviceSPI *)self->_device newTextureWithDescriptor:v6];
  unint64_t v8 = +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:v7];

  return v8;
}

@end