@interface VNTorsoprintGeneratorHumanDetectorBased
+ (const)modelVersionForOptions:(id)a3;
+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3;
- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4;
- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9;
- (id).cxx_construct;
- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9;
- (id)torsoprintForImageBuffer:(__CVBuffer *)a3 requestRevision:(unint64_t)a4 error:(id *)a5;
@end

@implementation VNTorsoprintGeneratorHumanDetectorBased

- (id).cxx_construct
{
  *((void *)self + 11) = 0;
  *((void *)self + 12) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_torsoprintGenerator.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
  }
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  v13 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v12 error:a8];
  if (!v13)
  {
    v19 = 0;
    goto LABEL_15;
  }
  v14 = +[VNValidationUtilities requiredDetectedObjectObservationInOptions:v12 withOptionName:@"VNTorsoprintGeneratorProcessOption_InputDetectedObjectObservation" forObservationClass:objc_opt_class() error:a8];
  v15 = v14;
  if (v14)
  {
    v16 = objc_msgSend(v14, "vn_cloneObject");
    if (v16)
    {
      id v17 = v16;

      v18 = -[VNTorsoprintGeneratorHumanDetectorBased torsoprintForImageBuffer:requestRevision:error:](self, "torsoprintForImageBuffer:requestRevision:error:", a4, [v13 requestRevision], a8);
      if (v18)
      {
        [v17 setTorsoprint:v18];
        v21[0] = v17;
        v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
      }
      else
      {
        v19 = 0;
      }

      goto LABEL_14;
    }
    if (a8)
    {
      *a8 = +[VNError errorForMemoryAllocationFailure];
    }
  }
  id v17 = 0;
  v19 = 0;
LABEL_14:

LABEL_15:

  return v19;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  id v12 = a4;
  v13 = [(VNDetector *)self validatedImageBufferFromOptions:v12 error:a8];
  if (v13)
  {
    v14 = +[VNValidationUtilities requiredDetectedObjectObservationInOptions:v12 withOptionName:@"VNTorsoprintGeneratorProcessOption_InputDetectedObjectObservation" forObservationClass:objc_opt_class() error:a8];
    v15 = v14;
    if (v14)
    {
      [v14 boundingBox];
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      double v23 = v22;
      unint64_t v24 = [v13 width];
      unint64_t v25 = [v13 height];
      [v12 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"VNImageBufferOption_CreateFromPixelBufferPool"];
      v26 = (__CVBuffer *)objc_msgSend(v13, "croppedBufferWithWidth:height:format:cropRect:options:error:", -[VNEspressoModelFileBasedDetector networkRequiredInputImageWidth](self, "networkRequiredInputImageWidth"), -[VNEspressoModelFileBasedDetector networkRequiredInputImageHeight](self, "networkRequiredInputImageHeight"), 1111970369, v12, a8, v17 * (double)v24, v19 * (double)v25, v21 * (double)v24, v23 * (double)v25);
      *a7 = v26;
      BOOL v27 = v26 != 0;
    }
    else
    {
      BOOL v27 = 0;
    }
  }
  else
  {
    BOOL v27 = 1;
  }

  return v27;
}

- (id)torsoprintForImageBuffer:(__CVBuffer *)a3 requestRevision:(unint64_t)a4 error:(id *)a5
{
  uint64_t v9 = CVPixelBufferLockBaseAddress(a3, 1uLL);
  if (!v9)
  {
    *(void *)&long long v58 = CVPixelBufferGetBaseAddress(a3);
    *((void *)&v58 + 1) = CVPixelBufferGetHeight(a3);
    size_t Width = CVPixelBufferGetWidth(a3);
    pixelBuffer = a3;
    size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
    ptr = self->_torsoprintGenerator.__ptr_;
    id v12 = (std::__shared_weak_count *)operator new(0x90uLL);
    v12->__shared_owners_ = 0;
    v12->__shared_weak_owners_ = 0;
    v12->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EF7539A0;
    v12[1].__shared_owners_ = 0;
    v12[1].__shared_weak_owners_ = 0;
    v12[2].__shared_weak_owners_ = 0;
    v12[3].__vftable = 0;
    *(_OWORD *)&v12[3].__shared_owners_ = 0u;
    v12[2].__vftable = 0;
    v12[2].__shared_owners_ = (uint64_t)&v12[2].__shared_weak_owners_;
    v12[4].std::__shared_count = 0u;
    LOBYTE(v12[4].__shared_weak_owners_) = 0;
    v56 = (char *)&v12[1];
    v12[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_1EF752918;
    LODWORD(v12[5].__shared_owners_) = 1;
    v12[5].__shared_weak_owners_ = 0;
    v12[5].__vftable = (std::__shared_weak_count_vtbl *)*((int *)ptr + 9);
    *((_DWORD *)ptr + 12) = 0;
    uint64_t v13 = vision::mod::ImageDescriptorAugmenterAbstract::augment(*((void **)ptr + 1), &v58, 4u);
    if ((v13 & 0x80) != 0)
    {
      vision::mod::ImageDescriptorAugmenterAbstract::getAugmentedImages((vision::mod::ImageDescriptorAugmenterAbstract *)v62, *((void *)ptr + 1));
      v15 = *(void **)&v62[0];
      uint64_t v54 = (uint64_t)(*((void *)&v62[0] + 1) - *(void *)&v62[0]) >> 5;
      if (*((void *)&v62[0] + 1) == *(void *)&v62[0])
      {
        uint64_t v55 = (*(uint64_t (**)(void, void, char *))(**((void **)ptr + 1) + 24))(*((void *)ptr + 1), 0, v56);
        if ((v55 & 0x80) != 0) {
          *((float *)ptr + 12) = *((float *)ptr + 12) / (float)(unint64_t)v54;
        }
      }
      else
      {
        long long v16 = *(_OWORD *)(*(void *)&v62[0] + 16);
        long long v69 = **(_OWORD **)&v62[0];
        long long v70 = v16;
        LODWORD(v68) = 0;
        v66 = 0;
        v67 = 0;
        HIDWORD(v67) = *((_DWORD *)ptr + 7);
        LOBYTE(v68) = *((unsigned char *)ptr + 24);
        v62[0] = v69;
        v62[1] = v16;
        int v17 = espresso_network_bind_input_vimagebuffer_bgra8();
        double v18 = &CVML_status_IOError;
        if (!v17)
        {
          int v19 = espresso_plan_execute_sync();
          double v18 = &CVML_status_IOError;
          if (!v19) {
            double v18 = &CVML_status_ok;
          }
        }
        uint64_t v20 = *v18;
        if (((v20 + 128) & 0x80) != 0)
        {
          if (*((int *)ptr + 9) < 1)
          {
            double v23 = 0;
          }
          else
          {
            unint64_t v21 = 0;
            double v22 = 0;
            double v23 = 0;
            uint64_t v24 = 0;
            float v25 = 0.0;
            do
            {
              float v26 = *(float *)(*((void *)ptr + 11) + 4 * v24);
              if ((unint64_t)v22 >= v21)
              {
                uint64_t v28 = v22 - v23;
                unint64_t v29 = v28 + 1;
                if ((unint64_t)(v28 + 1) >> 62) {
                  std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
                }
                if ((uint64_t)(v21 - (void)v23) >> 1 > v29) {
                  unint64_t v29 = (uint64_t)(v21 - (void)v23) >> 1;
                }
                if (v21 - (unint64_t)v23 >= 0x7FFFFFFFFFFFFFFCLL) {
                  unint64_t v30 = 0x3FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v30 = v29;
                }
                if (v30) {
                  unint64_t v30 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v30);
                }
                else {
                  uint64_t v31 = 0;
                }
                v32 = (float *)(v30 + 4 * v28);
                float *v32 = v26;
                BOOL v27 = v32 + 1;
                while (v22 != v23)
                {
                  int v33 = *((_DWORD *)v22-- - 1);
                  *((_DWORD *)v32-- - 1) = v33;
                }
                unint64_t v21 = v30 + 4 * v31;
                if (v23) {
                  operator delete(v23);
                }
                double v23 = v32;
              }
              else
              {
                *double v22 = v26;
                BOOL v27 = v22 + 1;
              }
              float v25 = v25 + v26;
              ++v24;
              double v22 = v27;
            }
            while (v24 < *((int *)ptr + 9));
            if (*((unsigned char *)ptr + 25))
            {
              uint64_t v34 = *((unsigned int *)ptr + 9);
              if ((int)v34 >= 1)
              {
                int v35 = *((unsigned __int8 *)ptr + 26);
                float v36 = 0.0;
                v37 = v23;
                uint64_t v38 = *((unsigned int *)ptr + 9);
                do
                {
                  float v39 = *v37;
                  if (v35)
                  {
                    float v39 = v39 - (float)(v25 / (float)(int)v34);
                    float *v37 = v39;
                  }
                  float v36 = v36 + (float)(v39 * v39);
                  ++v37;
                  --v38;
                }
                while (v38);
                v40 = v23;
                float v41 = sqrtf(v36);
                do
                {
                  float *v40 = *v40 / v41;
                  ++v40;
                  --v34;
                }
                while (v34);
              }
            }
          }
          if (*((unsigned char *)ptr + 33)) {
            float v42 = **((float **)ptr + 53);
          }
          else {
            float v42 = 1.0;
          }
          *((float *)ptr + 12) = v42 + *((float *)ptr + 12);
          v43 = operator new(8uLL);
          void *v43 = 0;
          v67 = v43 + 1;
          v68 = v43 + 1;
          uint64_t v44 = *((int *)ptr + 9);
          v66 = v43;
          vision::mod::ImageDescriptorBufferAbstract::ImageDescriptorBufferAbstract((uint64_t)v62, &v66, v23, 4 * v44, 1, 0);
          int v64 = 1;
          v65 = 0;
          *(void *)&v62[0] = &unk_1EF752918;
          uint64_t v63 = v44 & 0x3FFFFFFFFFFFFFFFLL;
          uint64_t DeepCopy = vision::mod::ImageDescriptorBufferAbstract::createDeepCopy((vision::mod::ImageDescriptorBufferAbstract *)v62);
          std::shared_ptr<vision::mod::ImageDescriptorBufferAbstract>::shared_ptr[abi:ne180100]<vision::mod::ImageDescriptorBufferAbstract,void>(&v61, DeepCopy);
        }
        uint64_t v55 = (v20 + 128) | 0x2500;
      }
      v14 = pixelBuffer;
      if (v15) {
        operator delete(v15);
      }
      uint64_t v13 = v55;
    }
    else
    {
      v14 = pixelBuffer;
    }
    uint64_t v46 = CVPixelBufferUnlockBaseAddress(v14, 1uLL);
    if (v13 == 128)
    {
      if (v46)
      {
        if (a5)
        {
          v47 = +[VNError errorForCVReturnCode:v46 localizedDescription:@"unable to lock base address of pixel buffer"];
LABEL_58:
          v10 = 0;
          *a5 = v47;
LABEL_67:
          std::__shared_weak_count::__release_shared[abi:nn180100](v12);
          goto LABEL_68;
        }
      }
      else
      {
        unint64_t v48 = (*(uint64_t (**)(char *))(*(void *)v56 + 104))(v56);
        v49 = self->_torsoprintGenerator.__ptr_;
        if (v48 >> 2 == *((_DWORD *)v49 + 9))
        {
          if (*((unsigned char *)v49 + 33)) {
            float v50 = *((float *)v49 + 12);
          }
          else {
            float v50 = 1.0;
          }
          v51 = [VNTorsoprint alloc];
          *(float *)&double v52 = v50;
          v10 = [(VNTorsoprint *)v51 initWithData:v12[3].__shared_owners_ elementCount:v48 >> 2 elementType:1 lengthInBytes:v48 confidence:a4 requestRevision:v52];
          goto LABEL_67;
        }
        if (a5)
        {
          v47 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Unexpected size of torsoprint descriptor"];
          goto LABEL_58;
        }
      }
    }
    else if (a5)
    {
      v47 = VNErrorForCVMLStatus((id)v13);
      goto LABEL_58;
    }
    v10 = 0;
    goto LABEL_67;
  }
  if (a5)
  {
    +[VNError errorForCVReturnCode:v9 localizedDescription:@"unable to lock base address of pixel buffer"];
    v10 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
LABEL_68:

  return v10;
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v77.receiver = self;
  v77.super_class = (Class)VNTorsoprintGeneratorHumanDetectorBased;
  if ([(VNEspressoModelFileBasedDetector *)&v77 completeInitializationForSession:v6 error:a4])
  {
    v7 = [(VNEspressoModelFileBasedDetector *)self espressoResources];
    uint64_t v8 = [(VNDetector *)self configurationOptions];
    uint64_t v9 = [(id)objc_opt_class() modelVersionForOptions:v8];
    size_t v10 = *(void *)(v9 + 8);
    if (v10 >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    v11 = *(const void **)v9;
    if (v10 >= 0x17)
    {
      uint64_t v13 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v10 | 7) != 0x17) {
        uint64_t v13 = v10 | 7;
      }
      uint64_t v14 = v13 + 1;
      p_dst = operator new(v13 + 1);
      size_t v75 = v10;
      int64_t v76 = v14 | 0x8000000000000000;
      __dst = p_dst;
    }
    else
    {
      HIBYTE(v76) = *(void *)(v9 + 8);
      p_dst = &__dst;
      if (!v10)
      {
LABEL_11:
        *((unsigned char *)p_dst + v10) = 0;
        uint64_t v15 = [v7 network];
        uint64_t v17 = v16;
        uint64_t v18 = [v7 plan];
        int v19 = (char *)operator new(0x290uLL);
        *(_OWORD *)(v19 + 8) = 0u;
        *(void *)int v19 = &unk_1EF7538C0;
        *((void *)v19 + 3) = &unk_1EF752408;
        *((_OWORD *)v19 + 2) = 0u;
        *((_WORD *)v19 + 24) = 257;
        v19[50] = 0;
        *((_DWORD *)v19 + 13) = 1065353216;
        *((_WORD *)v19 + 28) = 0;
        *(_OWORD *)(v19 + 60) = 0u;
        v19[76] = 0;
        *((void *)v19 + 10) = 0;
        *((void *)v19 + 11) = v18;
        *((void *)v19 + 12) = v15;
        *((void *)v19 + 13) = v17;
        v78[0] = 0;
        std::vector<float>::vector((void *)v19 + 77, 4uLL, v78);
        *((void *)v19 + 81) = 0;
        *((void *)v19 + 3) = &unk_1EF752898;
        size_t v20 = HIBYTE(v76);
        unint64_t v21 = __dst;
        if (v76 < 0) {
          size_t v20 = v75;
        }
        switch(v20)
        {
          case 4uLL:
            if (v76 >= 0) {
              unint64_t v21 = &__dst;
            }
            long long v24 = xmmword_1A410C400;
            if (*(_DWORD *)v21 != 841888374)
            {
              if (*(_DWORD *)v21 != 808334198) {
                goto LABEL_84;
              }
              char v38 = 0;
              char v40 = 0;
              float v25 = 0.0039216;
LABEL_87:
              *(_OWORD *)*((void *)v19 + 77) = v24;
              v19[56] = v38;
              v19[48] = v40;
              *((float *)v19 + 13) = v25;
LABEL_88:
              v19[57] = 0;
              size_t v41 = HIBYTE(v76);
              int v42 = SHIBYTE(v76);
              if (v76 < 0) {
                size_t v41 = v75;
              }
              if (v41 == 19)
              {
                v43 = __dst;
                if (v76 >= 0) {
                  v43 = (uint64_t *)&__dst;
                }
                if (*v43 == 0x745F3376646F6E61
                  && v43[1] == 0x5F34765F6F73726FLL
                  && *(uint64_t *)((char *)v43 + 11) == 0x31646D5F34765F6FLL)
                {
                  goto LABEL_122;
                }
                BOOL v46 = *v43 == 0x745F3376646F6E61 && v43[1] == 0x5F34765F6F73726FLL;
                BOOL v47 = v46 && *(uint64_t *)((char *)v43 + 11) == 0x32646D5F34765F6FLL;
                if (v47
                  || (*v43 == 0x745F3376646F6E61 ? (BOOL v48 = v43[1] == 0x5F35765F6F73726FLL) : (BOOL v48 = 0),
                      v48 ? (BOOL v49 = *(uint64_t *)((char *)v43 + 11) == 0x31646D5F35765F6FLL) : (BOOL v49 = 0),
                      v49
                   || ((uint64_t v50 = *v43, v51 = v43[1], v52 = *(uint64_t *)((char *)v43 + 11), v50 == 0x745F3376646F6E61)
                     ? (BOOL v53 = v51 == 0x5F35765F6F73726FLL)
                     : (BOOL v53 = 0),
                       v53 ? (BOOL v54 = v52 == 0x32646D5F35765F6FLL) : (BOOL v54 = 0),
                       v54)))
                {
LABEL_122:
                  v19[57] = 1;
                }
                v19[50] = 0;
                BOOL v55 = v42 < 0;
                v56 = (uint64_t *)&__dst;
                if (v55) {
                  v56 = __dst;
                }
                if (*v56 != 0x745F3376646F6E61
                  || v56[1] != 0x5F33765F6F73726FLL
                  || *(uint64_t *)((char *)v56 + 11) != 0x32646D5F33765F6FLL)
                {
                  BOOL v59 = *v56 == 0x745F3376646F6E61 && v56[1] == 0x5F33765F6F73726FLL;
                  if (!v59 || *(uint64_t *)((char *)v56 + 11) != 0x33646D5F33765F6FLL)
                  {
                    uint64_t v61 = *v56;
                    uint64_t v62 = v56[1];
                    uint64_t v63 = *(uint64_t *)((char *)v56 + 11);
                    BOOL v64 = v61 == 0x745F3376646F6E61 && v62 == 0x5F33765F6F73726FLL;
                    if (!v64 || v63 != 0x34646D5F33765F6FLL) {
                      goto LABEL_163;
                    }
                  }
                }
LABEL_162:
                v19[50] = 1;
                goto LABEL_163;
              }
              v19[50] = 0;
              if (v41 == 10)
              {
                v67 = __dst;
                if (v42 >= 0) {
                  v67 = (uint64_t *)&__dst;
                }
                uint64_t v68 = *v67;
                int v69 = *((unsigned __int16 *)v67 + 4);
                if (v68 == 0x616D735F322E3276 && v69 == 27756) {
                  goto LABEL_162;
                }
              }
              else if (v41 == 4)
              {
                v66 = __dst;
                if (v42 >= 0) {
                  v66 = &__dst;
                }
                if (*v66 == 841888374 || *v66 == 808334198) {
                  goto LABEL_162;
                }
              }
LABEL_163:
              *((_DWORD *)v19 + 160) = 0;
              v71 = (char *)operator new(0x48uLL);
              *((void *)v71 + 1) = 0;
              *((void *)v71 + 2) = 0;
              *(void *)v71 = &unk_1EF753968;
              *(_OWORD *)(v71 + 40) = 0u;
              *(_OWORD *)(v71 + 56) = 0u;
              *((void *)v71 + 3) = &unk_1EF7528E8;
              *((void *)v71 + 4) = 1;
              v72 = (std::__shared_weak_count *)*((void *)v19 + 5);
              *((void *)v19 + 4) = v71 + 24;
              *((void *)v19 + 5) = v71;
              if (v72) {
                std::__shared_weak_count::__release_shared[abi:nn180100](v72);
              }
              LOWORD(v78[0]) = 2;
              BYTE2(v78[0]) = 0;
              *(void *)&v78[1] = 0x437F000000000000;
              v78[3] = 32;
              char v79 = 0;
              operator new();
            }
            break;
          case 0xAuLL:
            if (v76 >= 0) {
              unint64_t v21 = &__dst;
            }
            if (*v21 != 0x616D735F322E3276 || *((_WORD *)v21 + 4) != 27756) {
              goto LABEL_84;
            }
            long long v24 = xmmword_1A410C400;
            break;
          case 0x13uLL:
            if (v76 >= 0) {
              unint64_t v21 = &__dst;
            }
            BOOL v23 = *v21 == 0x745F3376646F6E61
               && v21[1] == 0x5F33765F6F73726FLL
               && *(void *)((char *)v21 + 11) == 0x32646D5F33765F6FLL;
            long long v24 = xmmword_1A410C3F0;
            float v25 = 1.0;
            if (!v23)
            {
              BOOL v26 = *v21 == 0x745F3376646F6E61 && v21[1] == 0x5F33765F6F73726FLL;
              if (!v26 || *(void *)((char *)v21 + 11) != 0x33646D5F33765F6FLL)
              {
                BOOL v28 = *v21 == 0x745F3376646F6E61 && v21[1] == 0x5F33765F6F73726FLL;
                if (!v28 || *(void *)((char *)v21 + 11) != 0x34646D5F33765F6FLL)
                {
                  BOOL v30 = *v21 == 0x745F3376646F6E61 && v21[1] == 0x5F34765F6F73726FLL;
                  if (!v30 || *(void *)((char *)v21 + 11) != 0x31646D5F34765F6FLL)
                  {
                    BOOL v32 = *v21 == 0x745F3376646F6E61 && v21[1] == 0x5F34765F6F73726FLL;
                    if (!v32 || *(void *)((char *)v21 + 11) != 0x32646D5F34765F6FLL)
                    {
                      BOOL v34 = *v21 == 0x745F3376646F6E61 && v21[1] == 0x5F35765F6F73726FLL;
                      if (!v34 || *(void *)((char *)v21 + 11) != 0x31646D5F35765F6FLL)
                      {
                        BOOL v36 = *v21 == 0x745F3376646F6E61 && v21[1] == 0x5F35765F6F73726FLL;
                        if (!v36 || *(void *)((char *)v21 + 11) != 0x32646D5F35765F6FLL)
                        {
LABEL_84:
                          syslog(5, "[Error] Failed to find the default network options for version . %s", (const char *)v21);
                          goto LABEL_88;
                        }
                      }
                    }
                  }
                }
              }
            }
            char v38 = 0;
            goto LABEL_86;
          default:
            if (v76 >= 0) {
              unint64_t v21 = &__dst;
            }
            goto LABEL_84;
        }
        float v25 = 1.0;
        char v38 = 1;
LABEL_86:
        char v40 = 1;
        goto LABEL_87;
      }
    }
    memmove(p_dst, v11, v10);
    goto LABEL_11;
  }

  return 0;
}

+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3
{
  v3 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", "torso__0");

  return v3;
}

+ (const)modelVersionForOptions:(id)a3
{
  return &+[VNTorsoprintGeneratorHumanDetectorBased modelVersionForOptions:]::emptyModelVersion;
}

@end