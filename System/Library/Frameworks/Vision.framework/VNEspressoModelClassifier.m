@interface VNEspressoModelClassifier
+ (id)classifierResourceTypesToNamesForOriginatingRequestSpecifier:(id)a3;
+ (id)configurationOptionKeysForDetectorKey;
+ (id)createObservationWithDescriptors:(id)a3 forOriginatingRequestSpecifier:(id)a4;
+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4;
+ (shared_ptr<vision::mod::ImageClassifierAbstract>)createClassifierWithDescriptor:(shared_ptr<vision:(const char *)a4 :(int)a5 mod:(int)a6 :(const char *)a7 ImageDescriptorProcessorAbstract>)a3 classifierAbsolutePath:(Options *)a8 computePlatform:computePath:labelsFilename:options:;
+ (shared_ptr<vision::mod::ImageClassifier_HierarchicalModel>)createHierarchicalModelForOriginatingRequestSpecifier:(id)a3 error:(id *)a4;
+ (shared_ptr<vision::mod::ImageDescriptorProcessorAbstract>)createDescriprorProcessorWithModelPath:(const char *)a3 nBatch:(int)a4 computePlatform:(int)a5 computePath:(int)a6 options:(Options *)a7;
+ (void)convertRelationships:(id)a3 toStdRelationships:(void *)a4;
- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4;
- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9;
- (id).cxx_construct;
- (id)boundComputeStageDevices;
- (id)calculateImageDescriptors:(id)a3 regionOfInterest:(CGRect)a4 warningRecorder:(id)a5 canceller:(id)a6 error:(id *)a7;
- (id)disallowedIdentifiers;
- (id)getLabels;
- (id)internalProcessUsingQualityOfServiceClass:(unsigned int)a3 options:(id)a4 regionOfInterest:(CGRect)a5 warningRecorder:(id)a6 error:(id *)a7 progressHandler:(id)a8;
- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9;
@end

@implementation VNEspressoModelClassifier

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7 = @"VNComputeStageMain";
  v4 = +[VNComputeDeviceUtilities espressoV1ModelComputeDevices];
  v8[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

+ (id)configurationOptionKeysForDetectorKey
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__VNEspressoModelClassifier_configurationOptionKeysForDetectorKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNEspressoModelClassifier configurationOptionKeysForDetectorKey]::onceToken != -1) {
    dispatch_once(&+[VNEspressoModelClassifier configurationOptionKeysForDetectorKey]::onceToken, block);
  }
  v2 = (void *)+[VNEspressoModelClassifier configurationOptionKeysForDetectorKey]::configurationOptionKeys;

  return v2;
}

void __66__VNEspressoModelClassifier_configurationOptionKeysForDetectorKey__block_invoke(uint64_t a1)
{
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___VNEspressoModelClassifier;
  v1 = objc_msgSendSuper2(&v5, sel_configurationOptionKeysForDetectorKey);
  v2 = (void *)[v1 mutableCopy];

  [v2 addObject:@"VNDetectorOption_MetalContextPriority"];
  [v2 addObject:@"VNDetectorOption_PreferBackgroundProcessing"];
  uint64_t v3 = [v2 copy];
  v4 = (void *)+[VNEspressoModelClassifier configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNEspressoModelClassifier configurationOptionKeysForDetectorKey]::configurationOptionKeys = v3;
}

+ (id)classifierResourceTypesToNamesForOriginatingRequestSpecifier:(id)a3
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (void)convertRelationships:(id)a3 toStdRelationships:(void *)a4
{
  id v5 = a3;
  uint64_t v6 = [NSString defaultCStringEncoding];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__VNEspressoModelClassifier_convertRelationships_toStdRelationships___block_invoke;
  v7[3] = &__block_descriptor_48_e34_v32__0__NSString_8__NSArray_16_B24l;
  v7[4] = v6;
  v7[5] = a4;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
}

void __69__VNEspressoModelClassifier_convertRelationships_toStdRelationships___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = a3;
  uint64_t v6 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v33 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        long long v31 = 0u;
        memset(v30, 0, sizeof(v30));
        std::string::basic_string[abi:ne180100]<0>(&v29, (char *)[v5 cStringUsingEncoding:*(void *)(a1 + 32)]);
        std::string::basic_string[abi:ne180100]<0>(&__str, (char *)[v9 cStringUsingEncoding:*(void *)(a1 + 32)]);
        std::string::operator=((std::string *)v30, &__str);
        std::string::operator=((std::string *)&v30[24], &v29);
        v10 = *(std::__split_buffer<std::pair<std::string, std::string>>::pointer **)(a1 + 40);
        v11 = v10[1];
        unint64_t v12 = (unint64_t)v10[2];
        if ((unint64_t)v11 >= v12)
        {
          unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * (((char *)v11 - (char *)*v10) >> 4);
          unint64_t v15 = v14 + 1;
          if (v14 + 1 > 0x555555555555555) {
            std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
          }
          unint64_t v16 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v12 - (void)*v10) >> 4);
          if (2 * v16 > v15) {
            unint64_t v15 = 2 * v16;
          }
          if (v16 >= 0x2AAAAAAAAAAAAAALL) {
            unint64_t v17 = 0x555555555555555;
          }
          else {
            unint64_t v17 = v15;
          }
          v36.__end_cap_.__value_ = (std::allocator<std::pair<std::string, std::string>> *)(v10 + 2);
          if (v17) {
            unint64_t v17 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<std::string,std::vector<BOOL>>>>(v17);
          }
          else {
            uint64_t v18 = 0;
          }
          v36.__first_ = (std::__split_buffer<std::pair<std::string, std::string>>::pointer)v17;
          v36.__begin_ = (std::__split_buffer<std::pair<std::string, std::string>>::pointer)(v17 + 48 * v14);
          v36.__end_ = v36.__begin_;
          v36.__end_cap_.__value_ = (std::pair<std::string, std::string> *)(v17 + 48 * v18);
          std::pair<std::string,std::string>::pair[abi:ne180100](&v36.__begin_->first, (long long *)v30);
          std::__split_buffer<std::pair<std::string, std::string>>::pointer v20 = *v10;
          unint64_t v19 = (unint64_t)v10[1];
          std::__split_buffer<std::pair<std::string, std::string>>::pointer begin = v36.__begin_;
          std::__split_buffer<std::pair<std::string, std::string>>::pointer end = v36.__end_;
          if ((std::__split_buffer<std::pair<std::string, std::string>>::pointer)v19 == *v10)
          {
            int64x2_t v25 = vdupq_n_s64(v19);
          }
          else
          {
            do
            {
              long long v23 = *(_OWORD *)(v19 - 48);
              begin[-1].first.__r_.__value_.__r.__words[2] = *(void *)(v19 - 32);
              *(_OWORD *)&begin[-1].first.__r_.__value_.__l.__data_ = v23;
              *(void *)(v19 - 40) = 0;
              *(void *)(v19 - 32) = 0;
              *(void *)(v19 - 48) = 0;
              long long v24 = *(_OWORD *)(v19 - 24);
              begin[-1].second.__r_.__value_.__r.__words[2] = *(void *)(v19 - 8);
              *(_OWORD *)&begin[-1].second.__r_.__value_.__l.__data_ = v24;
              --begin;
              *(void *)(v19 - 16) = 0;
              *(void *)(v19 - 8) = 0;
              *(void *)(v19 - 24) = 0;
              v19 -= 48;
            }
            while ((std::__split_buffer<std::pair<std::string, std::string>>::pointer)v19 != v20);
            int64x2_t v25 = *(int64x2_t *)v10;
          }
          std::__split_buffer<std::pair<std::string, std::string>>::pointer v13 = end + 1;
          std::__split_buffer<std::pair<std::string, std::string>>::pointer *v10 = begin;
          v10[1] = end + 1;
          *(int64x2_t *)&v36.__begin_ = v25;
          v26 = v10[2];
          v10[2] = v36.__end_cap_.__value_;
          v36.__end_cap_.__value_ = v26;
          v36.__first_ = (std::__split_buffer<std::pair<std::string, std::string>>::pointer)v25.i64[0];
          std::__split_buffer<std::pair<std::string,std::string>>::~__split_buffer(&v36);
        }
        else
        {
          std::pair<std::string,std::string>::pair[abi:ne180100](&v10[1]->first, (long long *)v30);
          std::__split_buffer<std::pair<std::string, std::string>>::pointer v13 = v11 + 1;
          v10[1] = v13;
        }
        v10[1] = v13;
        if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__str.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v29.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v31) < 0) {
          operator delete(*(void **)&v30[24]);
        }
        if ((v30[23] & 0x80000000) != 0) {
          operator delete(*(void **)v30);
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v6);
  }
}

+ (shared_ptr<vision::mod::ImageClassifier_HierarchicalModel>)createHierarchicalModelForOriginatingRequestSpecifier:(id)a3 error:(id *)a4
{
  uint64_t v7 = v4;
  id v8 = a3;
  v9 = [a1 classifierResourceTypesToNamesForOriginatingRequestSpecifier:v8];
  if (v9)
  {
    v10 = VNFrameworkBundle();
    v11 = [v9 objectForKeyedSubscript:@"espresso-classifier-labels"];
    unint64_t v12 = [v10 pathForResource:v11 ofType:@"csv"];
    if (v12)
    {
      std::__split_buffer<std::pair<std::string, std::string>>::pointer v13 = [v9 objectForKeyedSubscript:@"espresso-classifier-relationships"];

      unint64_t v14 = [v9 objectForKeyedSubscript:@"espresso-classifier-relationships"];
      unint64_t v15 = [v10 pathForResource:v14 ofType:@"txt"];

      if (v15)
      {
        uint64_t v33 = 0;
        long long v34 = &v33;
        uint64_t v35 = 0x4012000000;
        std::__split_buffer<std::pair<std::string, std::string>> v36 = __Block_byref_object_copy__12210;
        v37 = __Block_byref_object_dispose__12211;
        uint64_t v38 = "";
        uint64_t v39 = 0;
        v40 = 0;
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __89__VNEspressoModelClassifier_createHierarchicalModelForOriginatingRequestSpecifier_error___block_invoke;
        aBlock[3] = &unk_1E5B1ECB8;
        id v30 = v12;
        long long v32 = &v33;
        id v31 = v15;
        unint64_t v16 = _Block_copy(aBlock);
        if (VNExecuteBlock(v16, (uint64_t)a4))
        {
          uint64_t v17 = v34[7];
          void *v7 = v34[6];
          v7[1] = v17;
          if (v17) {
            atomic_fetch_add_explicit((atomic_ullong *volatile)(v17 + 8), 1uLL, memory_order_relaxed);
          }
        }
        else
        {
          void *v7 = 0;
          v7[1] = 0;
        }

        _Block_object_dispose(&v33, 8);
        if (v40) {
          std::__shared_weak_count::__release_shared[abi:nn180100](v40);
        }
      }
      else
      {
        if (a4)
        {
          long long v24 = NSString;
          int64x2_t v25 = [v13 stringByAppendingPathExtension:@"txt"];
          v26 = [v24 stringWithFormat:@"could not locate the resource file \"%@\"", v25];

          *a4 = +[VNError errorForInvalidModelWithLocalizedDescription:v26];
        }
        void *v7 = 0;
        v7[1] = 0;
      }

      v11 = v13;
    }
    else
    {
      if (a4)
      {
        v21 = NSString;
        v22 = [v11 stringByAppendingPathExtension:@"csv"];
        long long v23 = [v21 stringWithFormat:@"could not locate the resource file \"%@\"", v22];

        *a4 = +[VNError errorForInvalidModelWithLocalizedDescription:v23];
      }
      void *v7 = 0;
      v7[1] = 0;
    }
  }
  else
  {
    if (a4)
    {
      uint64_t v18 = NSString;
      unint64_t v19 = NSStringFromClass((Class)a1);
      std::__split_buffer<std::pair<std::string, std::string>>::pointer v20 = [v18 stringWithFormat:@"%@ must implement classifierResourceTypesToNamesForOriginatingRequestSpecifier: for %@", v19, v8];

      *a4 = +[VNError errorForUnimplementedFunctionWithLocalizedDescription:v20];
    }
    void *v7 = 0;
    v7[1] = 0;
  }

  result.__cntrl_ = v28;
  result.__ptr_ = v27;
  return result;
}

void __89__VNEspressoModelClassifier_createHierarchicalModelForOriginatingRequestSpecifier_error___block_invoke(uint64_t a1)
{
  v25[2] = *MEMORY[0x1E4F143B8];
  ImageClassifier_loadLabelsAndBooleanFlags(v22, (const char *)[*(id *)(a1 + 32) UTF8String]);
  uint64_t v17 = a1;
  uint64_t v19 = 0;
  unint64_t v20 = 0;
  unint64_t v21 = 0;
  uint64_t v2 = *(void *)v22;
  uint64_t v3 = v23;
  if (*(void *)v22 != v23)
  {
    unint64_t v4 = 0;
    do
    {
      id v5 = *(unsigned __int8 **)(v2 + 24);
      if (*(char *)(v2 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&v18, *(const std::string::value_type **)v2, *(void *)(v2 + 8));
        unint64_t v4 = v20;
      }
      else
      {
        std::string v18 = *(std::string *)v2;
      }
      v25[0] = v18.__r_.__value_.__l.__size_;
      std::string::size_type v6 = v18.__r_.__value_.__r.__words[0];
      *(void *)((char *)v25 + 7) = *(std::string::size_type *)((char *)&v18.__r_.__value_.__r.__words[1] + 7);
      char v7 = HIBYTE(v18.__r_.__value_.__r.__words[2]);
      memset(&v18, 0, sizeof(v18));
      int v8 = (*v5 >> 1) & 1;
      if (v4 >= v21)
      {
        uint64_t v10 = (uint64_t)(v4 - v19) >> 5;
        if ((unint64_t)(v10 + 1) >> 59) {
          std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v11 = (uint64_t)(v21 - v19) >> 4;
        if (v11 <= v10 + 1) {
          unint64_t v11 = v10 + 1;
        }
        if (v21 - v19 >= 0x7FFFFFFFFFFFFFE0) {
          unint64_t v12 = 0x7FFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v12 = v11;
        }
        v24[4] = &v21;
        std::__split_buffer<std::pair<std::string, std::string>>::pointer v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<vImage_Buffer>>(v12);
        unint64_t v14 = &v13[32 * v10];
        v24[0] = v13;
        v24[1] = v14;
        v24[3] = &v13[32 * v15];
        uint64_t v16 = v25[0];
        *(void *)unint64_t v14 = v6;
        *((void *)v14 + 1) = v16;
        *(void *)(v14 + 15) = *(void *)((char *)v25 + 7);
        v14[23] = v7;
        v14[24] = v8;
        v24[2] = v14 + 32;
        std::vector<std::pair<std::string,BOOL>>::__swap_out_circular_buffer(&v19, v24);
        unint64_t v4 = v20;
        std::__split_buffer<std::pair<std::string,float>>::~__split_buffer((uint64_t)v24);
      }
      else
      {
        *(void *)unint64_t v4 = v6;
        uint64_t v9 = *(void *)((char *)v25 + 7);
        *(void *)(v4 + 8) = v25[0];
        *(void *)(v4 + 15) = v9;
        *(unsigned char *)(v4 + 23) = v7;
        *(unsigned char *)(v4 + 24) = v8;
        v4 += 32;
      }
      unint64_t v20 = v4;
      v2 += 48;
    }
    while (v2 != v3);
  }
  std::allocate_shared[abi:ne180100]<vision::mod::ImageClassifier_HierarchicalModel,std::allocator<vision::mod::ImageClassifier_HierarchicalModel>,char const*,decltype(nullptr),std::vector<std::pair<std::string,BOOL>> &,void>((uint64_t)v24, [*(id *)(v17 + 40) UTF8String], &v19);
}

+ (id)createObservationWithDescriptors:(id)a3 forOriginatingRequestSpecifier:(id)a4
{
  return 0;
}

+ (shared_ptr<vision::mod::ImageDescriptorProcessorAbstract>)createDescriprorProcessorWithModelPath:(const char *)a3 nBatch:(int)a4 computePlatform:(int)a5 computePath:(int)a6 options:(Options *)a7
{
  void *v7 = 0;
  v7[1] = 0;

  id var2 = a7->var2;

  result.__cntrl_ = v11;
  result.__ptr_ = v10;
  return result;
}

+ (shared_ptr<vision::mod::ImageClassifierAbstract>)createClassifierWithDescriptor:(shared_ptr<vision:(const char *)a4 :(int)a5 mod:(int)a6 :(const char *)a7 ImageDescriptorProcessorAbstract>)a3 classifierAbsolutePath:(Options *)a8 computePlatform:computePath:labelsFilename:options:
{
  *int v8 = 0;
  v8[1] = 0;

  uint64_t v10 = (void *)*((void *)a7 + 2);

  result.__cntrl_ = v12;
  result.__ptr_ = v11;
  return result;
}

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 9) = 0;
  *((void *)self + 10) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disallowedIdentifiers, 0);
  objc_storeStrong((id *)&self->_computeDevice, 0);
  cntrl = self->mClassifier.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
  }
  unint64_t v4 = self->mDescriptorProcessor.__cntrl_;
  if (v4)
  {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v4);
  }
}

- (id)disallowedIdentifiers
{
  return self->_disallowedIdentifiers;
}

- (id)getLabels
{
  ptr = self->mClassifier.__ptr_;
  memset(&v10, 0, sizeof(v10));
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v10, *((long long **)ptr + 1), *((long long **)ptr + 2), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)ptr + 2) - *((void *)ptr + 1)) >> 3));
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  unint64_t v4 = (void *)[v3 initWithCapacity:0xAAAAAAAAAAAAAAABLL* ((uint64_t)(v10.__r_.__value_.__l.__size_ - v10.__r_.__value_.__r.__words[0]) >> 3)];
  std::string::size_type size = v10.__r_.__value_.__l.__size_;
  for (std::string::size_type i = v10.__r_.__value_.__r.__words[0]; i != size; i += 24)
  {
    std::string::size_type v7 = i;
    if (*(char *)(i + 23) < 0) {
      std::string::size_type v7 = *(void *)i;
    }
    int v8 = [NSString stringWithUTF8String:v7];
    [v4 addObject:v8];
  }
  unint64_t v11 = &v10;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v11);

  return v4;
}

- (id)calculateImageDescriptors:(id)a3 regionOfInterest:(CGRect)a4 warningRecorder:(id)a5 canceller:(id)a6 error:(id *)a7
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v84[1] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v71 = a5;
  id v16 = a6;
  id v82 = 0;
  id v83 = 0;
  v67 = objc_opt_class();
  [v67 initDumpDebugIntermediates:&v83 debugInfo:&v82];
  id v17 = v83;
  id v18 = v82;
  if (v17) {
    [v15 setObject:v17 forKeyedSubscript:@"VNImageClassifierProcessingOption_DebugIntermediatesDumpPath"];
  }
  if (v18) {
    [v15 setObject:v18 forKeyedSubscript:@"VNImageClassifierProcessingOption_DebugInfo"];
  }
  v69 = v17;
  v70 = v18;
  v68 = a7;
  uint64_t v19 = [(VNDetector *)self validatedImageBufferFromOptions:v15 error:a7];
  if (!v19) {
    goto LABEL_21;
  }
  float v20 = (*((float (**)(ImageDescriptorProcessorAbstract *))self->mDescriptorProcessor.__ptr_->var0 + 19))(self->mDescriptorProcessor.__ptr_);
  if (v21 >= v20) {
    float v22 = v20;
  }
  else {
    float v22 = v21;
  }
  unint64_t v23 = [v19 width];
  unint64_t v24 = [v19 height];
  unint64_t v25 = (unint64_t)v22;
  if (v23 >= v24) {
    unint64_t v23 = v24;
  }
  if (v23 < v25)
  {
    VNRecordImageTooSmallWarningWithImageMinimumShortDimension(v71, (unint64_t)v22);
    if (v23 < v25 >> 2)
    {
      v26 = (void *)MEMORY[0x1E4F1CBF0];
      goto LABEL_67;
    }
  }
  CVPixelBufferRef v81 = 0;
  if (!+[VNImageClassifier computeImageCropWithImage:regionOfInterest:usingDescriptorProcessor:scalingImage:options:pixelBuffer:error:](VNImageClassifier, "computeImageCropWithImage:regionOfInterest:usingDescriptorProcessor:scalingImage:options:pixelBuffer:error:", v19, self->mDescriptorProcessor.__ptr_, 1, v15, &v81, a7, x, y, width, height))
  {
LABEL_21:
    v26 = 0;
    goto LABEL_67;
  }
  CVPixelBufferLockBaseAddress(v81, 1uLL);
  (*((void (**)(const void **__return_ptr))self->mDescriptorProcessor.__ptr_->var0 + 8))(&v79);
  uint64_t v27 = [v15 objectForKeyedSubscript:@"VNEspressoModelClassifierProcessOption_CenterTileOnly"];
  uint64_t v28 = [(id)v27 BOOLValue];

  id v78 = v16;
  LOBYTE(v27) = [(VNDetector *)self getOptionalCanceller:&v78 inOptions:v15 error:a7];
  id v66 = v78;

  if (v27)
  {
    uint64_t v76 = 0;
    unint64_t v77 = 0;
    CVPixelBufferRef v29 = v81;
    ptr = self->mDescriptorProcessor.__ptr_;
    id v31 = v79;
    long long v32 = [(VNDetector *)self metalContext];
    LOBYTE(ptr) = +[VNImageClassifier computeImageDescriptorsWithImage:pixelBuffer:regionOfInterest:usingDescriptorProcessor:tileCount:augmentationMode:resultantDescriptorBuffer:options:metalContext:canceller:tileColumns:tileRows:error:](VNImageClassifier, "computeImageDescriptorsWithImage:pixelBuffer:regionOfInterest:usingDescriptorProcessor:tileCount:augmentationMode:resultantDescriptorBuffer:options:metalContext:canceller:tileColumns:tileRows:error:", v19, v29, ptr, v28, 0, v31, x, y, width, height, v15, v32, v66, &v77, &v76, a7);

    CVPixelBufferUnlockBaseAddress(v81, 1uLL);
    CVPixelBufferRelease(v81);
    v26 = 0;
    CVPixelBufferRef v81 = 0;
    if (ptr)
    {
      VNRecordImageTilingWarning(v71, v77, v76);
      memset(v75, 0, sizeof(v75));
      uint64_t v33 = [v67 returnAllResultsOptionKey];
      v57 = (void *)v33;
      if (v33
        && ([v15 objectForKeyedSubscript:v33],
            long long v34 = objc_claimAutoreleasedReturnValue(),
            int v35 = [v34 BOOLValue],
            v34,
            v35))
      {
        std::__split_buffer<std::pair<std::string, std::string>> v36 = self->mClassifier.__ptr_;
        v37 = v79;
        uint64_t v38 = [(VNDetector *)self metalContext];
        id v74 = 0;
        BOOL v39 = +[VNImageClassifier computeLabelsAndConfidence:v36 usingDescriptorBuffer:v37 populateLabelsAndConfidence:v75 options:v15 metalContext:v38 error:&v74];
        id v40 = v74;

        if (!v39)
        {
          if (a7)
          {
            *a7 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Could not compute raw labels and confidence for image" underlyingError:v40];
          }

          goto LABEL_55;
        }

        int v64 = 1;
      }
      else
      {
        int v64 = 0;
      }
      if (v79) {
      else
      }
        v41 = 0;
      uint64_t v42 = *((void *)v41 + 9);
      if (v42)
      {
        v65 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:*((void *)v41 + 9)];
        uint64_t v61 = (*(uint64_t (**)(vision::mod::ImageDescriptorBufferAbstract *))(*(void *)v41 + 104))(v41);
        uint64_t v60 = *((void *)v41 + 12);
        v62 = (objc_class *)[v67 espressoModelImageprintClass];
        v43 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v15 error:a7];
        if (v43)
        {
          uint64_t v58 = v42;
          v59 = v41;
          id v63 = v43;
          unint64_t v44 = 0;
          while (1)
          {
            if (v64)
            {
              uint64_t v45 = v75[0] + 40 * v44;
              v46 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:*(void *)(v45 + 24)];
              for (std::string::size_type i = *(uint64_t **)(v45 + 16); i; std::string::size_type i = (uint64_t *)*i)
              {
                if (*((char *)i + 39) < 0) {
                  std::string::__init_copy_ctor_external(&v72, (const std::string::value_type *)i[2], i[3]);
                }
                else {
                  std::string v72 = *(std::string *)(i + 2);
                }
                int v73 = *((_DWORD *)i + 10);
                id v48 = [NSString alloc];
                if ((v72.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                  v49 = &v72;
                }
                else {
                  v49 = (std::string *)v72.__r_.__value_.__r.__words[0];
                }
                v50 = (void *)[v48 initWithUTF8String:v49];
                LODWORD(v51) = v73;
                v52 = [NSNumber numberWithFloat:v51];
                [v46 setObject:v52 forKey:v50];

                if (SHIBYTE(v72.__r_.__value_.__r.__words[2]) < 0) {
                  operator delete(v72.__r_.__value_.__l.__data_);
                }
              }
            }
            else
            {
              v46 = 0;
            }
            v53 = objc_msgSend([v62 alloc], "initWithData:elementCount:elementType:lengthInBytes:labelsAndConfidence:requestRevision:", vision::mod::ImageDescriptorBufferAbstract::getDataForKthDescriptor(v59, v44), v60, 1, v61, v46, objc_msgSend(v63, "requestRevision"));
            if (!v53) {
              break;
            }
            [v65 addObject:v53];

            if (++v44 == v58)
            {
              uint64_t v54 = [v67 createObservationWithDescriptors:v65 forOriginatingRequestSpecifier:v63];
              v46 = (void *)v54;
              if (v54)
              {
                v84[0] = v54;
                v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:1];
                goto LABEL_61;
              }
              if (v68)
              {
                v55 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Cannot create observation object"];
                v46 = 0;
                goto LABEL_58;
              }
              v46 = 0;
              goto LABEL_60;
            }
          }
          if (v68)
          {
            v55 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Cannot create image print"];
LABEL_58:
            v26 = 0;
            id *v68 = v55;
            goto LABEL_61;
          }
LABEL_60:
          v26 = 0;
LABEL_61:

          v43 = v63;
        }
        else
        {
          v26 = 0;
        }

        goto LABEL_63;
      }
      if (a7)
      {
        +[VNError errorForInternalErrorWithLocalizedDescription:@"Cannot calculate classification image descriptor"];
        v26 = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_63:

        v72.__r_.__value_.__r.__words[0] = (std::string::size_type)v75;
        std::vector<std::unordered_map<std::string,float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v72);
        goto LABEL_64;
      }
LABEL_55:
      v26 = 0;
      goto LABEL_63;
    }
  }
  else
  {
    v26 = 0;
  }
LABEL_64:
  if (v80) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v80);
  }
  id v16 = v66;
LABEL_67:

  return v26;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v73[1] = *MEMORY[0x1E4F143B8];
  id v18 = a5;
  id v62 = a7;
  id v61 = a9;
  int v64 = v18;
  (*((void (**)(const void **__return_ptr))self->mDescriptorProcessor.__ptr_->var0 + 8))(&v71);
  uint64_t v19 = [v18 objectForKeyedSubscript:@"VNEspressoModelClassifierProcessOption_CenterTileOnly"];
  uint64_t v20 = [(id)v19 BOOLValue];

  id v70 = 0;
  LOBYTE(v19) = [(VNDetector *)self getOptionalCanceller:&v70 inOptions:v18 error:a8];
  id v63 = v70;
  if ((v19 & 1) == 0)
  {
    int v35 = 0;
    goto LABEL_53;
  }
  float v21 = [(VNDetector *)self validatedImageBufferFromOptions:v18 error:a8];
  if (v21)
  {
    id v57 = v21;
    uint64_t v68 = 0;
    unint64_t v69 = 0;
    ptr = self->mDescriptorProcessor.__ptr_;
    unint64_t v23 = v71;
    unint64_t v24 = [(VNDetector *)self metalContext];
    BOOL v25 = +[VNImageClassifier computeImageDescriptorsWithImage:pixelBuffer:regionOfInterest:usingDescriptorProcessor:tileCount:augmentationMode:resultantDescriptorBuffer:options:metalContext:canceller:tileColumns:tileRows:error:](VNImageClassifier, "computeImageDescriptorsWithImage:pixelBuffer:regionOfInterest:usingDescriptorProcessor:tileCount:augmentationMode:resultantDescriptorBuffer:options:metalContext:canceller:tileColumns:tileRows:error:", v57, a4, ptr, v20, 0, v23, x, y, width, height, v64, v24, v63, &v69, &v68, a8);

    if (!v25)
    {
      int v35 = 0;
LABEL_51:
      float v21 = v57;
      goto LABEL_52;
    }
    VNRecordImageTilingWarning(v62, v69, v68);
    memset(v67, 0, sizeof(v67));
    v26 = objc_opt_class();
    uint64_t v27 = [v26 returnAllResultsOptionKey];
    v53 = (void *)v27;
    if (v27)
    {
      uint64_t v28 = [v64 objectForKeyedSubscript:v27];
      CVPixelBufferRef v29 = v26;
      int v30 = [v28 BOOLValue];

      if (v30)
      {
        id v31 = self->mClassifier.__ptr_;
        long long v32 = v71;
        uint64_t v33 = [(VNDetector *)self metalContext];
        BOOL v34 = +[VNImageClassifier computeLabelsAndConfidence:v31 usingDescriptorBuffer:v32 populateLabelsAndConfidence:v67 options:v64 metalContext:v33 error:a8];

        if (!v34) {
          goto LABEL_39;
        }
        int v59 = 1;
      }
      else
      {
        int v59 = 0;
      }
      v26 = v29;
    }
    else
    {
      int v59 = 0;
    }
    if (v71) {
    else
    }
      std::__split_buffer<std::pair<std::string, std::string>> v36 = 0;
    uint64_t v37 = *((void *)v36 + 9);
    if (v37)
    {
      uint64_t v60 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:*((void *)v36 + 9)];
      uint64_t v55 = (*(uint64_t (**)(vision::mod::ImageDescriptorBufferAbstract *))(*(void *)v36 + 104))(v36);
      uint64_t v54 = *((void *)v36 + 12);
      v56 = (objc_class *)[v26 espressoModelImageprintClass];
      uint64_t v38 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v64 error:a8];
      if (v38)
      {
        v52 = v26;
        id v58 = v38;
        unint64_t v39 = 0;
        while (1)
        {
          if (v59)
          {
            uint64_t v40 = v67[0] + 40 * v39;
            v41 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:*(void *)(v40 + 24)];
            for (std::string::size_type i = *(uint64_t **)(v40 + 16); i; std::string::size_type i = (uint64_t *)*i)
            {
              if (*((char *)i + 39) < 0) {
                std::string::__init_copy_ctor_external(&v65, (const std::string::value_type *)i[2], i[3]);
              }
              else {
                std::string v65 = *(std::string *)(i + 2);
              }
              int v66 = *((_DWORD *)i + 10);
              id v43 = [NSString alloc];
              if ((v65.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                unint64_t v44 = &v65;
              }
              else {
                unint64_t v44 = (std::string *)v65.__r_.__value_.__r.__words[0];
              }
              uint64_t v45 = (void *)[v43 initWithUTF8String:v44];
              LODWORD(v46) = v66;
              v47 = [NSNumber numberWithFloat:v46];
              [v41 setObject:v47 forKey:v45];

              if (SHIBYTE(v65.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v65.__r_.__value_.__l.__data_);
              }
            }
          }
          else
          {
            v41 = 0;
          }
          id v48 = objc_msgSend([v56 alloc], "initWithData:elementCount:elementType:lengthInBytes:labelsAndConfidence:requestRevision:", vision::mod::ImageDescriptorBufferAbstract::getDataForKthDescriptor(v36, v39), v54, 1, v55, v41, objc_msgSend(v58, "requestRevision"));
          if (!v48) {
            break;
          }
          [v60 addObject:v48];

          if (++v39 == v37)
          {
            uint64_t v49 = [v52 createObservationWithDescriptors:v60 forOriginatingRequestSpecifier:v58];
            v41 = (void *)v49;
            if (v49)
            {
              v73[0] = v49;
              int v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:1];
              goto LABEL_48;
            }
            if (a8)
            {
              v50 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Cannot create observation object"];
              v41 = 0;
              goto LABEL_45;
            }
            v41 = 0;
            goto LABEL_47;
          }
        }
        if (a8)
        {
          v50 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Cannot create image print"];
LABEL_45:
          int v35 = 0;
          *a8 = v50;
          goto LABEL_48;
        }
LABEL_47:
        int v35 = 0;
LABEL_48:

        uint64_t v38 = v58;
      }
      else
      {
        int v35 = 0;
      }

      goto LABEL_50;
    }
    if (a8)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:@"Cannot calculate classification image descriptor"];
      int v35 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_50:

      v65.__r_.__value_.__r.__words[0] = (std::string::size_type)v67;
      std::vector<std::unordered_map<std::string,float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v65);
      goto LABEL_51;
    }
LABEL_39:
    int v35 = 0;
    goto LABEL_50;
  }
  int v35 = 0;
LABEL_52:

LABEL_53:
  if (v72) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v72);
  }

  return v35;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v16 = a4;
  id v17 = [(VNDetector *)self validatedImageBufferFromOptions:v16 error:a8];
  if (v17) {
    BOOL v18 = +[VNImageClassifier computeImageCropWithImage:regionOfInterest:usingDescriptorProcessor:scalingImage:options:pixelBuffer:error:](VNImageClassifier, "computeImageCropWithImage:regionOfInterest:usingDescriptorProcessor:scalingImage:options:pixelBuffer:error:", v17, self->mDescriptorProcessor.__ptr_, 1, v16, a7, a8, x, y, width, height);
  }
  else {
    BOOL v18 = 0;
  }

  return v18;
}

- (id)internalProcessUsingQualityOfServiceClass:(unsigned int)a3 options:(id)a4 regionOfInterest:(CGRect)a5 warningRecorder:(id)a6 error:(id *)a7 progressHandler:(id)a8
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v16 = a4;
  id v17 = a6;
  id v18 = a8;
  id v32 = 0;
  id v33 = 0;
  [(id)objc_opt_class() initDumpDebugIntermediates:&v33 debugInfo:&v32];
  id v19 = v33;
  id v20 = v32;
  if (v19) {
    [v16 setObject:v19 forKeyedSubscript:@"VNImageClassifierProcessingOption_DebugIntermediatesDumpPath"];
  }
  if (v20) {
    [v16 setObject:v20 forKeyedSubscript:@"VNImageClassifierProcessingOption_DebugInfo"];
  }
  float v21 = [(VNDetector *)self validatedImageBufferFromOptions:v16 error:a7];
  if (v21)
  {
    float v22 = (*((float (**)(ImageDescriptorProcessorAbstract *))self->mDescriptorProcessor.__ptr_->var0 + 19))(self->mDescriptorProcessor.__ptr_);
    if (v23 >= v22) {
      float v24 = v22;
    }
    else {
      float v24 = v23;
    }
    unint64_t v25 = [v21 width];
    unint64_t v26 = [v21 height];
    unint64_t v27 = (unint64_t)v24;
    if (v25 >= v26) {
      unint64_t v25 = v26;
    }
    if (v25 >= v27
      || (VNRecordImageTooSmallWarningWithImageMinimumShortDimension(v17, (unint64_t)v24), v25 >= v27 >> 2))
    {
      v31.receiver = self;
      v31.super_class = (Class)VNEspressoModelClassifier;
      uint64_t v28 = -[VNDetector internalProcessUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:](&v31, sel_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler_, a3, v16, v17, a7, v18, x, y, width, height);
    }
    else
    {
      uint64_t v28 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    uint64_t v28 = 0;
  }

  return v28;
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  v32.receiver = self;
  v32.super_class = (Class)VNEspressoModelClassifier;
  if (-[VNDetector completeInitializationForSession:error:](&v32, sel_completeInitializationForSession_error_, a3))
  {
    std::string::size_type v6 = [(VNDetector *)self configurationOptions];
    std::string::size_type v7 = [(id)objc_opt_class() computeDeviceForComputeStage:@"VNComputeStageMain" configurationOptions:v6 error:a4];
    computeDevice = self->_computeDevice;
    self->_computeDevice = v7;

    if (!self->_computeDevice)
    {
      char v18 = 0;
LABEL_24:

      return v18;
    }
    uint64_t v9 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v6 error:a4];
    if (!v9)
    {
      char v18 = 0;
LABEL_23:

      goto LABEL_24;
    }
    std::string v10 = objc_opt_class();
    unint64_t v11 = [v10 classifierResourceTypesToNamesForOriginatingRequestSpecifier:v9];
    if (v11)
    {
      unint64_t v12 = [v6 objectForKeyedSubscript:@"VNDetectorOption_PreferBackgroundProcessing"];
      char v13 = [v12 BOOLValue];

      unint64_t v14 = VNFrameworkBundle();
      id v15 = _modelBundlePathForClassifierResource(v14, v11, @"espresso-descriptor", @"bin", a4);
      if (v15)
      {
        float v23 = _modelBundlePathForClassifierResource(v14, v11, @"espresso-classifier", @"bin", a4);
        if (v23)
        {
          id v16 = _modelBundlePathForClassifierResource(v14, v11, @"espresso-classifier-labels", @"csv", a4);
          if (v16)
          {
            aBlock[0] = MEMORY[0x1E4F143A8];
            aBlock[1] = 3221225472;
            aBlock[2] = __68__VNEspressoModelClassifier_completeInitializationForSession_error___block_invoke;
            aBlock[3] = &unk_1E5B1D2B0;
            id v25 = v6;
            unint64_t v26 = self;
            char v31 = v13;
            int v30 = v10;
            id v27 = v23;
            id v28 = v16;
            id v29 = v15;
            id v17 = _Block_copy(aBlock);
            char v18 = VNExecuteBlock(v17, (uint64_t)a4);
          }
          else
          {
            char v18 = 0;
          }
          float v21 = v23;
        }
        else
        {
          char v18 = 0;
          float v21 = 0;
        }
      }
      else
      {
        char v18 = 0;
      }
    }
    else
    {
      if (!a4)
      {
        char v18 = 0;
LABEL_22:

        goto LABEL_23;
      }
      id v19 = NSString;
      id v20 = NSStringFromClass((Class)v10);
      unint64_t v14 = [v19 stringWithFormat:@"%@ must implement +classifierResourceTypesToNamesForOriginatingRequestSpecifier: for %@", v20, v9];

      +[VNError errorForUnimplementedFunctionWithLocalizedDescription:v14];
      char v18 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_22;
  }
  return 0;
}

uint64_t __68__VNEspressoModelClassifier_completeInitializationForSession_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v55 = 1;
  if (!+[VNValidationUtilities getMTLGPUPriority:&v55 forKey:@"VNDetectorOption_MetalContextPriority" inOptions:*(void *)(a1 + 32) withDefaultValue:1 error:a2])
  {
LABEL_25:
    char v18 = 0;
    goto LABEL_26;
  }
  if (+[VNComputeDeviceUtilities isCPUComputeDevice:*(void *)(*(void *)(a1 + 40) + 88)])
  {
    id v43 = 0;
    char v4 = 0;
    uint64_t v5 = 0;
    uint64_t v6 = 1;
    uint64_t v7 = 1;
    goto LABEL_8;
  }
  if (!+[VNComputeDeviceUtilities isGPUComputeDevice:*(void *)(*(void *)(a1 + 40) + 88)])
  {
    if (a2)
    {
      id v27 = +[VNError errorForUnsupportedComputeDevice:*(void *)(*(void *)(a1 + 40) + 88)];
      char v18 = 0;
      goto LABEL_24;
    }
    goto LABEL_25;
  }
  uint64_t v8 = [*(id *)(a1 + 40) metalContext];
  id v9 = objc_alloc(MEMORY[0x1E4F611F0]);
  if (v8)
  {
    id v10 = *(id *)(v8 + 8);
    unint64_t v11 = *(void **)(v8 + 40);
  }
  else
  {
    id v10 = 0;
    unint64_t v11 = 0;
  }
  id v12 = v11;
  char v13 = (void *)[v9 initWithDevice:v10 andWisdomParams:v12];

  id v43 = v13;
  char v4 = *(unsigned char *)(a1 + 80);
  uint64_t v6 = v55;

  uint64_t v5 = 1;
  uint64_t v7 = 2;
LABEL_8:
  unint64_t v14 = *(void **)(a1 + 72);
  uint64_t v53 = 0;
  uint64_t v54 = 0;
  uint64_t v15 = [*(id *)(a1 + 48) UTF8String];
  uint64_t v16 = [*(id *)(a1 + 56) UTF8String];
  v49[0] = v4;
  uint64_t v50 = v6;
  id v17 = v43;
  char v18 = v17;
  id v51 = v17;
  uint64_t v52 = 0;
  if (v14)
  {
    [v14 createClassifierWithDescriptor:&v53 classifierAbsolutePath:v15 computePlatform:v5 computePath:v7 labelsFilename:v16 options:v49];
    long long v19 = *(_OWORD *)v44;
  }
  else
  {

    long long v19 = 0uLL;
  }
  uint64_t v20 = *(void *)(a1 + 40) + 72;
  memset(v44, 0, sizeof(v44));
  float v21 = *(std::__shared_weak_count **)(v20 + 8);
  *(_OWORD *)uint64_t v20 = v19;
  if (v21) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v21);
  }
  if (*(void *)&v44[8]) {
    std::__shared_weak_count::__release_shared[abi:nn180100](*(std::__shared_weak_count **)&v44[8]);
  }
  if (v54) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v54);
  }
  if (!*(void *)(*(void *)(a1 + 40) + 72))
  {
    if (a2)
    {
      id v27 = +[VNError errorForMemoryAllocationFailure];
LABEL_24:
      uint64_t v28 = 0;
      *a2 = v27;
      goto LABEL_44;
    }
LABEL_26:
    uint64_t v28 = 0;
    goto LABEL_44;
  }
  float v22 = *(void **)(a1 + 72);
  uint64_t v23 = [*(id *)(a1 + 64) UTF8String];
  v45[0] = v4;
  uint64_t v46 = v6;
  id v24 = v18;
  id v25 = v24;
  id v47 = v24;
  uint64_t v48 = 0;
  if (v22)
  {
    [v22 createDescriprorProcessorWithModelPath:v23 nBatch:v5 computePlatform:v5 computePath:2 options:v45];
    long long v26 = *(_OWORD *)v44;
  }
  else
  {

    long long v26 = 0uLL;
  }
  uint64_t v29 = *(void *)(a1 + 40) + 56;
  memset(v44, 0, sizeof(v44));
  int v30 = *(std::__shared_weak_count **)(v29 + 8);
  *(_OWORD *)uint64_t v29 = v26;
  if (v30) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v30);
  }
  if (*(void *)&v44[8]) {
    std::__shared_weak_count::__release_shared[abi:nn180100](*(std::__shared_weak_count **)&v44[8]);
  }
  uint64_t v31 = *(void *)(a1 + 40);
  if (*(void *)(v31 + 56))
  {
    (*(void (**)(void))(**(void **)(v31 + 72) + 32))(*(void *)(v31 + 72));
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 72) + 112) = 2;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 72) + 96) = 1;
    ImageClassifier_loadLabelsAndBooleanFlags(v44, (const char *)[*(id *)(a1 + 56) UTF8String]);
    objc_super v32 = (void *)MEMORY[0x1A6257080]();
    id v33 = [MEMORY[0x1E4F1CA80] setWithCapacity:0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)&v44[8] - *(void *)v44) >> 4)];
    BOOL v34 = *(uint64_t **)v44;
    for (std::string::size_type i = *(uint64_t **)&v44[8]; v34 != i; v34 += 6)
    {
      if ((*(unsigned char *)v34[3] & 1) == 0)
      {
        id v36 = [NSString alloc];
        uint64_t v37 = v34;
        if (*((char *)v34 + 23) < 0) {
          uint64_t v37 = (uint64_t *)*v34;
        }
        uint64_t v38 = (void *)[v36 initWithUTF8String:v37];
        [v33 addObject:v38];
      }
    }
    uint64_t v39 = [v33 copy];
    uint64_t v40 = *(void *)(a1 + 40);
    v41 = *(void **)(v40 + 96);
    *(void *)(v40 + 96) = v39;

    v56 = (void **)v44;
    std::vector<std::pair<std::string,std::vector<BOOL>>>::__destroy_vector::operator()[abi:ne180100](&v56);
    uint64_t v28 = 1;
  }
  else if (a2)
  {
    +[VNError errorForMemoryAllocationFailure];
    uint64_t v28 = 0;
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v28 = 0;
  }
  char v18 = v25;
LABEL_44:

  return v28;
}

- (id)boundComputeStageDevices
{
  v6[1] = *MEMORY[0x1E4F143B8];
  computeDevice = self->_computeDevice;
  uint64_t v5 = @"VNComputeStageMain";
  v6[0] = computeDevice;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

@end