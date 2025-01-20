@interface VNFaceAnalyzerMultiDetector
+ (float)faceBoundingBoxScalingFactorForFaceObservation:(unint64_t)a3;
+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4;
+ (unsigned)networkRequiredInputImagePixelFormatForConfigurationOptions:(id)a3;
- (BOOL)_isFaceprintJunk:(shared_ptr<vision::mod::ImageDescriptorBufferAbstract>)a3;
- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4;
- (CGRect)calculateCropRectForInputFace:(id)a3 imageBuffer:(id)a4 options:(id)a5 error:(id *)a6;
- (id).cxx_construct;
- (vImage_Buffer)prepare_vImageBufferForCVPixelBuffer:(__CVBuffer *)a3 error:(id *)a4;
@end

@implementation VNFaceAnalyzerMultiDetector

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ((id)objc_opt_class() == a1)
  {
    v13 = @"VNComputeStageMain";
    v8 = +[VNComputeDeviceUtilities mostPerformantComputeDevice];
    v12 = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
    v14[0] = v9;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  }
  else
  {
    v11.receiver = a1;
    v11.super_class = (Class)&OBJC_METACLASS___VNFaceAnalyzerMultiDetector;
    v7 = objc_msgSendSuper2(&v11, sel_supportedComputeStageDevicesForOptions_error_, v6, a4);
  }

  return v7;
}

- (id).cxx_construct
{
  *((void *)self + 13) = 0;
  *((void *)self + 14) = 0;
  return self;
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VNFaceAnalyzerMultiDetector;
  if (![(VNFaceAnalyzerMultiDetectorBase *)&v13 completeInitializationForSession:v6 error:a4])goto LABEL_7; {
  v7 = (char *)operator new(0x80uLL);
  }
  *((void *)v7 + 1) = 0;
  *((void *)v7 + 2) = 0;
  *(void *)v7 = &unk_1EF753540;
  *((void *)v7 + 3) = 0;
  ptr = (FaceFrontalizer *)(v7 + 24);
  *((void *)v7 + 12) = 4;
  *((void *)v7 + 13) = 0x3EA8F5C341700000;
  *((_DWORD *)v7 + 28) = 1051260355;
  *((void *)v7 + 15) = 0;
  *((_OWORD *)v7 + 2) = 0u;
  *((_OWORD *)v7 + 3) = 0u;
  *((_OWORD *)v7 + 4) = 0u;
  *((_OWORD *)v7 + 5) = 0u;
  p_mFaceFrontalizerImpl = &self->_mFaceFrontalizerImpl;
  cntrl = (std::__shared_weak_count *)p_mFaceFrontalizerImpl->__cntrl_;
  p_mFaceFrontalizerImpl->__ptr_ = (FaceFrontalizer *)(v7 + 24);
  p_mFaceFrontalizerImpl->__cntrl_ = (__shared_weak_count *)v7;
  if (cntrl)
  {
    std::__shared_weak_count::__release_shared[abi:nn180100](cntrl);
    ptr = p_mFaceFrontalizerImpl->__ptr_;
    if (!p_mFaceFrontalizerImpl->__ptr_)
    {
      if (a4)
      {
        +[VNError errorForInternalErrorWithLocalizedDescription:@"Unable to initialize frontalizer."];
        BOOL v11 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
LABEL_7:
      BOOL v11 = 0;
      goto LABEL_8;
    }
  }
  *((_DWORD *)ptr + 18) = 6;
  BOOL v11 = 1;
LABEL_8:

  return v11;
}

- (void).cxx_destruct
{
  cntrl = self->_mFaceFrontalizerImpl.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
  }
}

- (vImage_Buffer)prepare_vImageBufferForCVPixelBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  long long v40 = 0u;
  espresso_network_query_blob_dimensions();
  unint64_t v7 = (unint64_t)(float)0;
  uint64_t v8 = [(id)objc_opt_class() numberOfImageChannels] * v7;
  v9 = (vImage_Buffer *)malloc_type_calloc(v8 * v7 + 32, 1uLL, 0x1AE58436uLL);
  if (!v9)
  {
    if (!a4) {
      return 0;
    }
    +[VNError errorForMemoryAllocationFailure];
    v18 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    return v18;
  }
  v10 = v9;
  v9->data = &v9[1];
  v9->height = (unint64_t)(float)0;
  v9->width = v7;
  v9->rowBytes = v8;
  BaseAddress = CVPixelBufferGetBaseAddress(a3);
  v39[0] = BaseAddress;
  size_t Height = CVPixelBufferGetHeight(a3);
  v39[1] = Height;
  size_t Width = CVPixelBufferGetWidth(a3);
  *(void *)&long long v40 = Width;
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  ptr = self->_mFaceFrontalizerImpl.__ptr_;
  *((void *)&v40 + 1) = BytesPerRow;
  v16 = (void **)((char *)ptr + 40);
  uint64_t v17 = ImageProcessing_reallocVImageBuffer((uint64_t)ptr + 40, (unint64_t)(float)Width, (unint64_t)(float)Height, 4);
  if ((v17 & 0x80) == 0) {
    goto LABEL_3;
  }
  if (*((_DWORD *)ptr + 18) == 6)
  {
    uint64_t v17 = 4221;
    if (!BaseAddress || !Width || !Height || BytesPerRow < 2) {
      goto LABEL_3;
    }
    v19 = *v16;
    if (!*v16 || (unint64_t v20 = *((void *)ptr + 7)) == 0 || !*((void *)ptr + 6) || *((void *)ptr + 8) < 2uLL)
    {
      uint64_t v17 = 4221;
      goto LABEL_3;
    }
    uint64_t v31 = *((void *)ptr + 8);
    unint64_t v33 = *((void *)ptr + 6);
    uint64_t v37 = 0;
    float32x2_t v38 = vrndp_f32((float32x2_t)__PAIR64__((float)Width, (float)Height));
    float32x2_t v32 = v38;
    uint64_t v34 = 0;
    float v35 = (float)Height;
    float v36 = (float)Width;
    Geometry2D_intersectRect2D((float *)&v37, (float *)&v34);
    uint64_t v17 = 4220;
    if (v32.f32[0] != (float)v33 || v32.f32[1] != (float)v20)
    {
LABEL_3:
      if (v17 == 128) {
        goto LABEL_36;
      }
      goto LABEL_34;
    }
    if ((unint64_t)v32.f32[0] - 1 >= Height - 1) {
      unint64_t v22 = Height - 1;
    }
    else {
      unint64_t v22 = (unint64_t)v32.f32[0] - 1;
    }
    PointerToPoint = (char *)ImageProcessing_getPointerToPoint(v39, 4, 0.0, 0.0);
    unint64_t v24 = ImageProcessing_getPointerToPoint((void *)ptr + 5, 4, 0.0, 0.0);
    if (!PointerToPoint || (v25 = (char *)v24) == 0)
    {
      syslog(5, "Round ROI: %.2f %.2f %.2f %.2f", 0.0, 0.0, v32.f32[1], v32.f32[0]);
      uint64_t v17 = 4220;
      goto LABEL_3;
    }
    if ((unint64_t)v32.f32[1] - 1 >= Width - 1) {
      unint64_t v26 = Width - 1;
    }
    else {
      unint64_t v26 = (unint64_t)v32.f32[1] - 1;
    }
    bzero(v19, v31 * v33);
    size_t v27 = 4 * v26 + 4;
    unint64_t v28 = v22 + 1;
    do
    {
      memcpy(v25, PointerToPoint, v27);
      PointerToPoint += BytesPerRow;
      v25 += *((void *)ptr + 8);
      --v28;
    }
    while (v28);
    if (!vImageScale_ARGB8888((const vImage_Buffer *)((char *)ptr + 40), v10, 0, 0x20u))
    {
      int v29 = 6;
      uint64_t v17 = 4224;
      goto LABEL_35;
    }
    uint64_t v17 = 1402;
  }
  else
  {
    uint64_t v17 = 1399;
  }
LABEL_34:
  int v29 = 0;
LABEL_35:
  *((_DWORD *)ptr + 19) = v29;
LABEL_36:
  free(*v16);
  *(_OWORD *)v16 = 0u;
  *(_OWORD *)((char *)ptr + 56) = 0u;
  if (v17 == 128)
  {
    v18 = v10;
    v10 = 0;
  }
  else if (a4)
  {
    VNErrorForCVMLStatus((id)v17);
    v18 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
  free(v10);
  return v18;
}

- (CGRect)calculateCropRectForInputFace:(id)a3 imageBuffer:(id)a4 options:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = [v9 width];
  unint64_t v12 = [v9 height];
  [v8 unalignedBoundingBox];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  objc_msgSend((id)objc_opt_class(), "faceBoundingBoxScalingFactorForFaceObservation:", objc_msgSend(v8, "requestRevision"));
  v35.size.double width = v18 * (double)v11;
  v35.origin.CGFloat y = v16 * (double)v12;
  v35.size.double height = v20 * (double)v12;
  double v22 = (float)(v21 + -1.0);
  CGFloat v23 = -(v35.size.width * v22) * 0.5;
  CGFloat v24 = -(v35.size.height * v22) * 0.5;
  v35.origin.CGFloat x = v14 * (double)v11;
  CGRect v36 = CGRectInset(v35, v23, v24);
  CGRect v37 = CGRectIntegral(v36);
  CGFloat x = v37.origin.x;
  CGFloat y = v37.origin.y;
  double width = v37.size.width;
  double height = v37.size.height;
  espresso_network_query_blob_dimensions();
  float v29 = fmaxf((float)0, (float)0);
  if (fmax(width, height) < v29)
  {
    [v10 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"VNDetectorInternalProcessOption_RecordImageTooSmallWarning"];
    v30 = [NSNumber numberWithUnsignedLong:vcvtas_u32_f32(v29)];
    [v10 setObject:v30 forKeyedSubscript:@"VNDetectorInternalProcessOption_DesiredMinimumFacePrintingLongDimension"];
  }
  double v31 = x;
  double v32 = y;
  double v33 = width;
  double v34 = height;
  result.size.double height = v34;
  result.size.double width = v33;
  result.origin.CGFloat y = v32;
  result.origin.CGFloat x = v31;
  return result;
}

- (BOOL)_isFaceprintJunk:(shared_ptr<vision::mod::ImageDescriptorBufferAbstract>)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)a3.var0;
  memcpy(__dst, &unk_1A410E0E0, sizeof(__dst));
  if (*(void *)(v3 + 72) != 1 || (*(uint64_t (**)(uint64_t))(*(void *)v3 + 104))(v3) != 512)
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = 5244;
    __cxa_throw(exception, MEMORY[0x1E4FBA3E0], 0);
  }
  float __C = 0.0;
  vDSP_dotpr(*(const float **)(v3 + 56), 1, __dst, 1, &__C, 0x80uLL);
  return (float)(__C + 1.2744) < 0.2;
}

+ (unsigned)networkRequiredInputImagePixelFormatForConfigurationOptions:(id)a3
{
  return 1111970369;
}

+ (float)faceBoundingBoxScalingFactorForFaceObservation:(unint64_t)a3
{
  float result = 1.765;
  float v4 = 1.0;
  if (a3 - 1 < 3) {
    float v4 = 1.765;
  }
  if (a3 - 3737841664u > 6 || ((1 << a3) & 0x75) == 0) {
    return v4;
  }
  return result;
}

@end