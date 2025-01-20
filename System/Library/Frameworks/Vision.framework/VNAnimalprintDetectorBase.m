@interface VNAnimalprintDetectorBase
+ (Class)detectorClassForConfigurationOptions:(id)a3 error:(id *)a4;
+ (const)modelVersionForOptions:(id)a3;
+ (float)_animalBoundingBoxScalingFactorForAnimalDetectorRevision:(unint64_t)a3;
+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3;
+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4;
- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4;
- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9;
- (id).cxx_construct;
- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9;
@end

@implementation VNAnimalprintDetectorBase

- (id).cxx_construct
{
  *((void *)self + 11) = 0;
  *((void *)self + 12) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_petprintGenerator.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
  }
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  v81[1] = *MEMORY[0x1E4F143B8];
  id v13 = a5;
  id v14 = a7;
  id v64 = a9;
  v66 = v13;
  v65 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v13 error:a8];
  if (!v65)
  {
    v17 = 0;
    goto LABEL_34;
  }
  v15 = +[VNValidationUtilities requiredObjectOfClass:objc_opt_class() forKey:@"VNAnimalprintDetectorProcessOption_InputAnimalObservation" inOptions:v13 error:a8];
  if (!v15) {
    goto LABEL_7;
  }
  uint64_t v16 = CVPixelBufferLockBaseAddress(a4, 1uLL);
  if (!v16)
  {
    ptr = self->_petprintGenerator.__ptr_;
    v19 = (std::__shared_weak_count *)operator new(0x90uLL);
    v19->__shared_owners_ = 0;
    v19->__shared_weak_owners_ = 0;
    v19->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EF7539A0;
    v19[1].__shared_owners_ = 0;
    v19[1].__shared_weak_owners_ = 0;
    v19[3].__vftable = 0;
    v19[2].__shared_weak_owners_ = 0;
    v19[2].__vftable = 0;
    v19[2].__shared_owners_ = (uint64_t)&v19[2].__shared_weak_owners_;
    *(_OWORD *)&v19[3].__shared_owners_ = 0u;
    v19[4].std::__shared_count = 0u;
    LOBYTE(v19[4].__shared_weak_owners_) = 0;
    v60 = (char *)&v19[1];
    v61 = v19;
    v19[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_1EF752918;
    LODWORD(v19[5].__shared_owners_) = 1;
    v19[5].__shared_weak_owners_ = 0;
    v19[5].__vftable = (std::__shared_weak_count_vtbl *)*((int *)ptr + 11);
    *(void *)&long long v67 = CVPixelBufferGetBaseAddress(a4);
    *((void *)&v67 + 1) = CVPixelBufferGetHeight(a4);
    size_t Width = CVPixelBufferGetWidth(a4);
    size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a4);
    v20 = self->_petprintGenerator.__ptr_;
    *((_DWORD *)v20 + 14) = 0;
    uint64_t v21 = vision::mod::ImageDescriptorAugmenterAbstract::augment(*((void **)v20 + 55), &v67, 4u);
    if ((v21 & 0x80) != 0)
    {
      vision::mod::ImageDescriptorAugmenterAbstract::getAugmentedImages((vision::mod::ImageDescriptorAugmenterAbstract *)v71, *((void *)v20 + 55));
      __p = *(void **)&v71[0];
      uint64_t v59 = (uint64_t)(*((void *)&v71[0] + 1) - *(void *)&v71[0]) >> 5;
      if (*((void *)&v71[0] + 1) == *(void *)&v71[0])
      {
        uint64_t v21 = (*(uint64_t (**)(void, void, char *))(**((void **)v20 + 55) + 24))(*((void *)v20 + 55), 0, v60);
        if ((v21 & 0x80) != 0) {
          *((float *)v20 + 14) = *((float *)v20 + 14) / (float)(unint64_t)v59;
        }
      }
      else
      {
        long long v79 = **(_OWORD **)&v71[0];
        long long v80 = *(_OWORD *)(*(void *)&v71[0] + 16);
        memset(v78, 0, sizeof(v78));
        LODWORD(v77) = 0;
        uint64_t v22 = *((void *)v20 + 2);
        v75 = *(void **)v22;
        int v23 = *((_DWORD *)v20 + 3);
        LODWORD(v76) = *(_DWORD *)(v22 + 8);
        HIDWORD(v76) = v23;
        LOBYTE(v77) = *((unsigned char *)v20 + 40);
        v71[0] = v79;
        v71[1] = v80;
        int v24 = espresso_network_bind_input_vimagebuffer_bgra8();
        v25 = &CVML_status_internalError;
        if (!v24)
        {
          int v26 = espresso_plan_execute_sync();
          v25 = &CVML_status_internalError;
          if (!v26) {
            v25 = &CVML_status_ok;
          }
        }
        uint64_t v27 = *v25 + 128;
        if ((v27 & 0x80) != 0)
        {
          vision::mod::PetprintGenerator::getPetPrint((uint64_t)v20, v78);
          if (*((unsigned char *)v20 + 10)) {
            float v28 = **((float **)v20 + 33);
          }
          else {
            float v28 = 1.0;
          }
          *((float *)v20 + 14) = v28 + *((float *)v20 + 14);
          v75 = 0;
          v76 = 0;
          v77 = 0;
          v29 = operator new(8uLL);
          void *v29 = 0;
          v76 = v29 + 1;
          v77 = v29 + 1;
          uint64_t v30 = *((int *)v20 + 11);
          v75 = v29;
          vision::mod::ImageDescriptorBufferAbstract::ImageDescriptorBufferAbstract((uint64_t)v71, &v75, v78[0], 4 * v30, 1, 0);
          int v73 = 1;
          v74 = 0;
          *(void *)&v71[0] = &unk_1EF752918;
          uint64_t v72 = v30 & 0x3FFFFFFFFFFFFFFFLL;
          uint64_t DeepCopy = vision::mod::ImageDescriptorBufferAbstract::createDeepCopy((vision::mod::ImageDescriptorBufferAbstract *)v71);
          std::shared_ptr<vision::mod::ImageDescriptorBufferAbstract>::shared_ptr[abi:ne180100]<vision::mod::ImageDescriptorBufferAbstract,void>(&v70, DeepCopy);
        }
        uint64_t v21 = v27 | 0x2800;
      }
      if (__p) {
        operator delete(__p);
      }
    }
    if (v21 == 128)
    {
      v32 = self->_petprintGenerator.__ptr_;
      int v33 = 0;
      if (*((unsigned char *)v32 + 10)) {
        float v34 = *((float *)v32 + 14);
      }
      else {
        float v34 = 1.0;
      }
    }
    else
    {
      float v34 = 0.0;
      if (a8)
      {
        VNErrorForCVMLStatus((id)v21);
        *a8 = (id)objc_claimAutoreleasedReturnValue();
      }
      int v33 = 1;
    }
    CVPixelBufferUnlockBaseAddress(a4, 1uLL);
    if (v33) {
      goto LABEL_31;
    }
    unint64_t v36 = (*(uint64_t (**)(char *))(*(void *)v60 + 104))(v60);
    unint64_t v37 = v36 >> 2;
    if (v36 >> 2 == *((_DWORD *)self->_petprintGenerator.__ptr_ + 11))
    {
      LODWORD(v67) = 0;
      std::vector<float>::vector(&v79, v37, &v67);
      vision::mod::PetprintGenerator::getPetPrint((uint64_t)self->_petprintGenerator.__ptr_, (float **)&v79);
      v38 = [VNAnimalprint alloc];
      uint64_t v39 = v79;
      uint64_t v40 = [v65 requestRevision];
      *(float *)&double v41 = v34;
      v42 = [(VNAnimalprint *)v38 initWithData:v39 elementCount:v37 elementType:1 lengthInBytes:v36 confidence:v40 requestRevision:v41];
      v43 = [VNAnimalObservation alloc];
      [v15 boundingBox];
      double v45 = v44;
      double v47 = v46;
      double v49 = v48;
      double v51 = v50;
      [v15 confidence];
      int v53 = v52;
      v54 = [v15 labels];
      v55 = [v15 groupId];
      LODWORD(v56) = v53;
      v57 = -[VNAnimalObservation initWithOriginatingRequestSpecifier:boundingBox:confidence:labels:groupId:animalprint:](v43, "initWithOriginatingRequestSpecifier:boundingBox:confidence:labels:groupId:animalprint:", v65, v54, v55, v42, v45, v47, v49, v51, v56);

      v58 = [v15 uuid];
      [(VNObservation *)v57 setUUID:v58];

      v81[0] = v57;
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:1];

      if ((void)v79)
      {
        *((void *)&v79 + 1) = v79;
        operator delete((void *)v79);
      }
      goto LABEL_32;
    }
    if (!a8)
    {
LABEL_31:
      v17 = 0;
    }
    else
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:@"Unexpected size of animalprint descriptor"];
      v17 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_32:
    std::__shared_weak_count::__release_shared[abi:nn180100](v61);
    goto LABEL_33;
  }
  if (!a8)
  {
LABEL_7:
    v17 = 0;
    goto LABEL_33;
  }
  +[VNError errorForCVReturnCode:v16 localizedDescription:@"could not lock cropped image"];
  v17 = 0;
  *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_33:

LABEL_34:

  return v17;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  id v12 = a4;
  id v13 = [(VNDetector *)self validatedImageBufferFromOptions:v12 error:a8];
  if (v13)
  {
    id v14 = +[VNValidationUtilities requiredObjectOfClass:objc_opt_class() forKey:@"VNAnimalprintDetectorProcessOption_InputAnimalObservation" inOptions:v12 error:a8];
    if (v14)
    {
      unint64_t v15 = [v13 width];
      unint64_t v16 = [v13 height];
      [v14 boundingBox];
      double v18 = v17;
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;
      objc_msgSend((id)objc_opt_class(), "_animalBoundingBoxScalingFactorForAnimalDetectorRevision:", objc_msgSend(v14, "requestRevision"));
      v38.size.double width = v22 * (double)v15;
      v38.origin.double y = v20 * (double)v16;
      v38.size.double height = v24 * (double)v16;
      double v26 = (float)(v25 + -1.0);
      CGFloat v27 = -(v38.size.width * v26) * 0.5;
      CGFloat v28 = -(v38.size.height * v26) * 0.5;
      v38.origin.double x = v18 * (double)v15;
      CGRect v39 = CGRectInset(v38, v27, v28);
      CGRect v40 = CGRectIntegral(v39);
      v42.origin.double x = 0.0;
      v42.origin.double y = 0.0;
      v42.size.double width = (double)v15;
      v42.size.double height = (double)v16;
      CGRect v41 = CGRectIntersection(v40, v42);
      double x = v41.origin.x;
      double y = v41.origin.y;
      double width = v41.size.width;
      double height = v41.size.height;
      ptr = self->_petprintGenerator.__ptr_;
      LODWORD(v22) = *((_DWORD *)ptr + 12);
      float v34 = *((float *)ptr + 13);
      [v12 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"VNImageBufferOption_CreateFromPixelBufferPool"];
      v35 = (__CVBuffer *)objc_msgSend(v13, "croppedBufferWithWidth:height:format:cropRect:options:error:", (unint64_t)v34, (unint64_t)*(float *)&v22, 1111970369, v12, a8, x, y, width, height);
      *a7 = v35;
      BOOL v36 = v35 != 0;
    }
    else
    {
      BOOL v36 = 0;
    }
  }
  else
  {
    BOOL v36 = 0;
  }

  return v36;
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v49.receiver = self;
  v49.super_class = (Class)VNAnimalprintDetectorBase;
  if ([(VNEspressoModelFileBasedDetector *)&v49 completeInitializationForSession:v6 error:a4])
  {
    uint64_t v7 = [(VNDetector *)self configurationOptions];
    v8 = objc_opt_class();
    double v44 = [(VNEspressoModelFileBasedDetector *)self espressoResources];
    v9 = [v8 espressoModelFileNameForConfigurationOptions:v7];
    std::string::basic_string[abi:ne180100]<0>(&v48, v9);
    uint64_t v10 = [v8 modelVersionForOptions:v7];
    size_t v11 = *(void *)(v10 + 8);
    if (v11 >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    id v12 = *(const void **)v10;
    if (v11 >= 0x17)
    {
      uint64_t v14 = (v11 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v11 | 7) != 0x17) {
        uint64_t v14 = v11 | 7;
      }
      uint64_t v15 = v14 + 1;
      p_dst = operator new(v14 + 1);
      size_t v46 = v11;
      int64_t v47 = v15 | 0x8000000000000000;
      __dst = p_dst;
    }
    else
    {
      HIBYTE(v47) = *(void *)(v10 + 8);
      p_dst = &__dst;
      if (!v11)
      {
LABEL_11:
        *((unsigned char *)p_dst + v11) = 0;
        uint64_t v16 = [v44 network];
        uint64_t v18 = v17;
        uint64_t v19 = [v44 plan];
        double v20 = (char *)operator new(0x1F0uLL);
        *(_OWORD *)(v20 + 8) = 0u;
        *(void *)double v20 = &unk_1EF753850;
        *((void *)v20 + 3) = &unk_1EF7523D0;
        *((_WORD *)v20 + 16) = 257;
        v20[34] = 0;
        *((_DWORD *)v20 + 9) = 1065353216;
        *((void *)v20 + 5) = 0;
        double v21 = v20 + 40;
        *((_OWORD *)v20 + 3) = 0u;
        double v22 = operator new(0xCuLL);
        *((void *)v20 + 6) = v22 + 3;
        *((void *)v20 + 7) = v22 + 3;
        *(void *)double v22 = 0;
        v22[2] = 0;
        *((void *)v20 + 5) = v22;
        v20[64] = 0;
        *(void *)(v20 + 76) = 0;
        *(void *)(v20 + 68) = 0;
        v20[84] = 0;
        *((void *)v20 + 11) = 0;
        *((void *)v20 + 12) = v19;
        *((void *)v20 + 13) = v16;
        *((void *)v20 + 14) = v18;
        *((void *)v20 + 59) = 0;
        *((void *)v20 + 60) = 0;
        *((void *)v20 + 58) = 0;
        *((_DWORD *)v20 + 122) = 1065353216;
        size_t v23 = HIBYTE(v47);
        int v24 = SHIBYTE(v47);
        if (v47 < 0) {
          size_t v23 = v46;
        }
        *((void *)v20 + 3) = &unk_1EF7527E8;
        if (v23 == 17)
        {
          CGFloat v28 = __dst;
          if (v24 >= 0) {
            CGFloat v28 = &__dst;
          }
          if (*v28 == 0x705F3376646F6E61 && v28[1] == 0x646D5F31765F7465 && *((unsigned char *)v28 + 16) == 50)
          {
            *((_DWORD *)v20 + 122) = 1065353216;
            *((_DWORD *)v20 + 9) = 1065353216;
            *(void *)__src = 0x8000000080000000;
            *(_DWORD *)&__src[8] = 0x80000000;
            std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v21, __src, (uint64_t)&v51);
            char v27 = 0;
            char v26 = 1;
            goto LABEL_52;
          }
          BOOL v32 = *v28 == 0x705F3476646F6E61 && v28[1] == 0x646D5F32765F7465 && *((unsigned char *)v28 + 16) == 49;
          if (v32
            || (*v28 == 0x705F3476646F6E61 ? (BOOL v33 = v28[1] == 0x646D5F32765F7465) : (BOOL v33 = 0),
                v33 ? (BOOL v34 = *((unsigned char *)v28 + 16) == 50) : (BOOL v34 = 0),
                v34))
          {
            *((_DWORD *)v20 + 122) = 1067869798;
            *((_DWORD *)v20 + 9) = 998277249;
            *(void *)__src = 0x8000000080000000;
            *(_DWORD *)&__src[8] = 0x80000000;
            std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v21, __src, (uint64_t)&v51);
            char v40 = 0;
            char v27 = 0;
            char v26 = 1;
            goto LABEL_54;
          }
          uint64_t v35 = *v28;
          uint64_t v36 = v28[1];
          int v37 = *((unsigned __int8 *)v28 + 16);
          if (v35 == 0x705F3476646F6E61 && v36 == 0x646D5F32765F7465 && v37 == 51)
          {
            *((_DWORD *)v20 + 122) = 1067869798;
            *((_DWORD *)v20 + 9) = 998277249;
            *(void *)__src = 0x8000000080000000;
            *(_DWORD *)&__src[8] = 0x80000000;
            std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v21, __src, (uint64_t)&v51);
            char v40 = 0;
            char v26 = 1;
            char v27 = 1;
LABEL_54:
            v20[32] = 1;
            v20[64] = v26;
            v20[33] = v40;
            v20[34] = v27;
          }
        }
        else if (v23 == 2)
        {
          float v25 = __dst;
          if (v24 >= 0) {
            float v25 = &__dst;
          }
          if (*v25 == 12662)
          {
            *((_DWORD *)v20 + 122) = 1065353216;
            *((_DWORD *)v20 + 9) = 998277249;
            *(void *)__src = 0xBEE978D5BECFDF3BLL;
            *(_DWORD *)&__src[8] = -1091022356;
            std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(v21, __src, (uint64_t)&v51);
            char v26 = 0;
            char v27 = 0;
LABEL_52:
            char v40 = 1;
            goto LABEL_54;
          }
        }
        *((_DWORD *)v20 + 114) = 0;
        CGRect v41 = (char *)operator new(0x48uLL);
        *((void *)v41 + 1) = 0;
        *((void *)v41 + 2) = 0;
        *(void *)CGRect v41 = &unk_1EF753968;
        *(_OWORD *)(v41 + 40) = 0u;
        *(_OWORD *)(v41 + 56) = 0u;
        *((void *)v41 + 3) = &unk_1EF7528E8;
        *((void *)v41 + 4) = 1;
        CGRect v42 = (std::__shared_weak_count *)*((void *)v20 + 59);
        *((void *)v20 + 58) = v41 + 24;
        *((void *)v20 + 59) = v41;
        if (v42) {
          std::__shared_weak_count::__release_shared[abi:nn180100](v42);
        }
        *(_WORD *)__src = 2;
        __src[2] = 0;
        *(void *)&__src[4] = 0x437F000000000000;
        int v51 = 32;
        char v52 = 0;
        operator new();
      }
    }
    memmove(p_dst, v12, v11);
    goto LABEL_11;
  }

  return 0;
}

+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3
{
  v3 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", "input");

  return v3;
}

+ (float)_animalBoundingBoxScalingFactorForAnimalDetectorRevision:(unint64_t)a3
{
  float result = 1.3;
  float v4 = 1.0;
  if (a3 - 1 < 2) {
    float v4 = 1.3;
  }
  if (a3 - 3737841664u >= 3) {
    return v4;
  }
  return result;
}

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ((id)objc_opt_class() == a1)
  {
    id v13 = @"VNComputeStageMain";
    v8 = +[VNComputeDeviceUtilities mostPerformantComputeDevice];
    id v12 = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
    v14[0] = v9;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  }
  else
  {
    v11.receiver = a1;
    v11.super_class = (Class)&OBJC_METACLASS___VNAnimalprintDetectorBase;
    uint64_t v7 = objc_msgSendSuper2(&v11, sel_supportedComputeStageDevicesForOptions_error_, v6, a4);
  }

  return v7;
}

+ (Class)detectorClassForConfigurationOptions:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v5 error:a4];
  if (!v6)
  {
LABEL_7:
    v8 = 0;
    goto LABEL_9;
  }
  if (![v6 specifiesRequestClass:objc_opt_class()]
    || (uint64_t v7 = [v6 requestRevision], v7 != 1) && v7 != 3737841667)
  {
    if (a4)
    {
      +[VNError errorForUnsupportedRequestSpecifier:v6];
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  v8 = objc_opt_class();
LABEL_9:

  return (Class)v8;
}

+ (const)modelVersionForOptions:(id)a3
{
  return &+[VNAnimalprintDetectorBase modelVersionForOptions:]::emptyString;
}

@end