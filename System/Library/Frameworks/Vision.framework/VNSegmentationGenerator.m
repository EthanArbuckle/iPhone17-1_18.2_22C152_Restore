@interface VNSegmentationGenerator
+ (BOOL)supportsTiling;
+ (NSArray)outputConfidenceBlobNames;
+ (NSDictionary)outputMaskBlobNameToFeatureName;
+ (NSDictionary)requestKeyToRequestInfo;
+ (id)configurationOptionKeysForDetectorKey;
+ (id)requestInfoForRequest:(id)a3;
+ (id)supportedOutputPixelFormatsForOptions:(id)a3 error:(id *)a4;
- (BOOL)bindOutputConfidenceBuffersAndReturnError:(id *)a3;
- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4;
- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9;
- (BOOL)validateMaskForBlobName:(id)a3 options:(id)a4 maskConfidence:(float *)a5 maskAcceptable:(BOOL *)a6 error:(id *)a7;
- (BufferSize)outputMaskSize;
- (__CVBuffer)renderCIImage:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5 format:(unsigned int)a6 computeDevice:(id)a7 session:(id)a8 error:(id *)a9;
- (const)espressoInputImageSize;
- (const)espressoInputMaskSize;
- (const)espressoMaskOutputBufferSizes;
- (const)espressoMaskOutputBuffers;
- (id).cxx_construct;
- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9;
- (optional<std::tuple<std::unordered_map<NSString)processLockedImageBuffer:(std:(espresso_buffer_t>>> *__return_ptr)retstr :(VNSegmentationGenerator *)self unordered_map<NSString *) inputMaskObservation:(SEL)a3 options:(__CVBuffer *)a4 qosClass:(id)a5 error:(id)a6;
@end

@implementation VNSegmentationGenerator

+ (BOOL)supportsTiling
{
  return 0;
}

+ (NSArray)outputConfidenceBlobNames
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

+ (NSDictionary)outputMaskBlobNameToFeatureName
{
  return 0;
}

+ (id)configurationOptionKeysForDetectorKey
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__VNSegmentationGenerator_configurationOptionKeysForDetectorKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNSegmentationGenerator configurationOptionKeysForDetectorKey]::onceToken != -1) {
    dispatch_once(&+[VNSegmentationGenerator configurationOptionKeysForDetectorKey]::onceToken, block);
  }
  v2 = (void *)+[VNSegmentationGenerator configurationOptionKeysForDetectorKey]::configurationOptionKeys;

  return v2;
}

void __64__VNSegmentationGenerator_configurationOptionKeysForDetectorKey__block_invoke(uint64_t a1)
{
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___VNSegmentationGenerator;
  v1 = objc_msgSendSuper2(&v5, sel_configurationOptionKeysForDetectorKey);
  v2 = (void *)[v1 mutableCopy];

  [v2 addObject:@"VNEspressoModelFileBasedDetectorOption_NetworkConfiguration"];
  uint64_t v3 = [v2 copy];
  v4 = (void *)+[VNSegmentationGenerator configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNSegmentationGenerator configurationOptionKeysForDetectorKey]::configurationOptionKeys = v3;
}

+ (NSDictionary)requestKeyToRequestInfo
{
  if (+[VNSegmentationGenerator requestKeyToRequestInfo]::onceToken != -1) {
    dispatch_once(&+[VNSegmentationGenerator requestKeyToRequestInfo]::onceToken, &__block_literal_global_74);
  }
  v2 = (void *)+[VNSegmentationGenerator requestKeyToRequestInfo]::requestKeyToRequestInfo;

  return (NSDictionary *)v2;
}

void __50__VNSegmentationGenerator_requestKeyToRequestInfo__block_invoke()
{
  v15[4] = *MEMORY[0x1E4F143B8];
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  v14[0] = v1;
  v2 = [[VNMultiDetectorOriginalRequestInfo alloc] initWithOriginatingRequestSpecifierProcessingOptionKey:@"VNSegmentationGeneratorProcessOption_PersonSegmentationDetectorOriginatingRequestSpecifier" originalRequestResultsIndex:0];
  v15[0] = v2;
  uint64_t v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v14[1] = v4;
  objc_super v5 = [[VNMultiDetectorOriginalRequestInfo alloc] initWithOriginatingRequestSpecifierProcessingOptionKey:@"VNSegmentationGeneratorProcessOption_SkySegmentationDetectorOriginatingRequestSpecifier" originalRequestResultsIndex:1];
  v15[1] = v5;
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v14[2] = v7;
  v8 = [[VNMultiDetectorOriginalRequestInfo alloc] initWithOriginatingRequestSpecifierProcessingOptionKey:@"VNSegmentationGeneratorProcessOption_HumanAttributesSegmentationDetectorOriginatingRequestSpecifier" originalRequestResultsIndex:2];
  v15[2] = v8;
  v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  v14[3] = v10;
  v11 = [[VNMultiDetectorOriginalRequestInfo alloc] initWithOriginatingRequestSpecifierProcessingOptionKey:@"VNSegmentationGeneratorProcessOption_GlassesSegmentationDetectorOriginatingRequestSpecifier" originalRequestResultsIndex:3];
  v15[3] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
  v13 = (void *)+[VNSegmentationGenerator requestKeyToRequestInfo]::requestKeyToRequestInfo;
  +[VNSegmentationGenerator requestKeyToRequestInfo]::requestKeyToRequestInfo = v12;
}

+ (id)requestInfoForRequest:(id)a3
{
  id v4 = a3;
  objc_super v5 = [a1 requestKeyToRequestInfo];
  v6 = +[VNMultiDetectorOriginalRequestInfo requestKeyFromRequest:v4];
  v7 = [v5 objectForKeyedSubscript:v6];

  return v7;
}

+ (id)supportedOutputPixelFormatsForOptions:(id)a3 error:(id *)a4
{
  if (+[VNSegmentationGenerator supportedOutputPixelFormatsForOptions:error:]::onceToken != -1) {
    dispatch_once(&+[VNSegmentationGenerator supportedOutputPixelFormatsForOptions:error:]::onceToken, &__block_literal_global_10421);
  }
  id v4 = (void *)+[VNSegmentationGenerator supportedOutputPixelFormatsForOptions:error:]::outputPixelFormats;

  return v4;
}

void __71__VNSegmentationGenerator_supportedOutputPixelFormatsForOptions_error___block_invoke()
{
  v0 = (void *)+[VNSegmentationGenerator supportedOutputPixelFormatsForOptions:error:]::outputPixelFormats;
  +[VNSegmentationGenerator supportedOutputPixelFormatsForOptions:error:]::outputPixelFormats = (uint64_t)&unk_1EF7A7D00;
}

- (id).cxx_construct
{
  *((void *)self + 11) = 0;
  *((void *)self + 12) = 0;
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 120) = 0u;
  *((_DWORD *)self + 34) = 1065353216;
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 10) = 0u;
  *((_DWORD *)self + 44) = 1065353216;
  *((void *)self + 23) = 0;
  *((void *)self + 24) = 0;
  *((void *)self + 25) = 0;
  *((void *)self + 26) = 0;
  return self;
}

- (void).cxx_destruct
{
  p_espressoMaskOutputBufferSizes = &self->_espressoMaskOutputBufferSizes;
  next = (id *)self->_espressoMaskOutputBufferSizes.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      objc_super v5 = (id *)*next;

      operator delete(next);
      next = v5;
    }
    while (v5);
  }
  value = p_espressoMaskOutputBufferSizes->__table_.__bucket_list_.__ptr_.__value_;
  p_espressoMaskOutputBufferSizes->__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value) {
    operator delete(value);
  }

  std::__hash_table<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>>>::~__hash_table((uint64_t)&self->_espressoMaskOutputBuffers);
}

- (const)espressoMaskOutputBufferSizes
{
  return &self->_espressoMaskOutputBufferSizes;
}

- (const)espressoMaskOutputBuffers
{
  return &self->_espressoMaskOutputBuffers;
}

- (BOOL)bindOutputConfidenceBuffersAndReturnError:(id *)a3
{
  return 1;
}

- (BOOL)validateMaskForBlobName:(id)a3 options:(id)a4 maskConfidence:(float *)a5 maskAcceptable:(BOOL *)a6 error:(id *)a7
{
  if (a5) {
    BOOL v9 = a6 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  uint64_t v10 = !v9;
  +[VNError VNAssert:v10 log:@"One or more of output parameters is/are NULL"];
  *a5 = 1.0;
  *a6 = 1;
  return 1;
}

- (__CVBuffer)renderCIImage:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5 format:(unsigned int)a6 computeDevice:(id)a7 session:(id)a8 error:(id *)a9
{
  uint64_t v11 = *(void *)&a6;
  id v14 = a3;
  id v15 = a7;
  id v16 = a8;
  v17 = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, a4, a5, v11, a9);
  if (v17)
  {
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    v24 = __89__VNSegmentationGenerator_renderCIImage_width_height_format_computeDevice_session_error___block_invoke;
    v25 = &unk_1E5B1E4B8;
    id v26 = v14;
    v27 = v17;
    v18 = _Block_copy(&v22);
    v19 = objc_msgSend(v16, "vnciContextManager", v22, v23, v24, v25);
    char v20 = -[VNCIContextManager performBlock:usingAvailableContextForComputeDevice:error:]((uint64_t)v19, v18, v15, a9);

    if ((v20 & 1) == 0)
    {
      CVPixelBufferRelease(v17);
      v17 = 0;
    }
  }
  return v17;
}

uint64_t __89__VNSegmentationGenerator_renderCIImage_width_height_format_computeDevice_session_error___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    uint64_t v3 = *(void **)(a2 + 8);
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;
  [v4 render:*(void *)(a1 + 32) toCVPixelBuffer:*(void *)(a1 + 40)];

  return 1;
}

- (optional<std::tuple<std::unordered_map<NSString)processLockedImageBuffer:(std:(espresso_buffer_t>>> *__return_ptr)retstr :(VNSegmentationGenerator *)self unordered_map<NSString *) inputMaskObservation:(SEL)a3 options:(__CVBuffer *)a4 qosClass:(id)a5 error:(id)a6
{
  id v13 = a5;
  id v14 = a6;
  if (self)
  {
    id v15 = [(VNDetector *)self computeDeviceForComputeStage:@"VNComputeStageMain" processingOptions:v14 error:a8];
    if (v15)
    {
      uint64_t v32 = 0;
      v33 = &v32;
      uint64_t v34 = 0x5812000000;
      v35 = __Block_byref_object_copy__10470;
      long long v37 = 0u;
      long long v38 = 0u;
      v36 = __Block_byref_object_dispose__10471;
      uint64_t v39 = 0;
      int v40 = 1065353216;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __96__VNSegmentationGenerator__processNonTiledLockedImageBuffer_inputMaskObservation_options_error___block_invoke;
      aBlock[3] = &unk_1E5B1FF30;
      aBlock[4] = self;
      v31 = a4;
      id v27 = v13;
      id v28 = v14;
      id v29 = v15;
      v30 = &v32;
      id v16 = _Block_copy(aBlock);
      if (VNExecuteBlock(v16, (uint64_t)a8))
      {
        std::unordered_map<NSString * {__strong},__CVBuffer *>::unordered_map((uint64_t)v22, (uint64_t)(v33 + 6));
        *(_OWORD *)__p = 0u;
        long long v24 = 0u;
        int v25 = 1065353216;
        std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__rehash<true>((uint64_t)__p, 0);
        std::__hash_table<std::__hash_value_type<NSString * {__strong},__CVBuffer *>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},__CVBuffer *>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},__CVBuffer *>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},__CVBuffer *>>>::__hash_table((uint64_t)retstr, (uint64_t *)v22);
        std::__hash_table<std::__hash_value_type<NSString * {__strong},__CVBuffer *>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},__CVBuffer *>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},__CVBuffer *>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},__CVBuffer *>>>::__hash_table((uint64_t)&retstr->var0.var1.var0.var1, (uint64_t *)__p);
        retstr->var1 = 1;
        std::__hash_table<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>>>::__deallocate_node((id *)v24);
        v17 = __p[0];
        __p[0] = 0;
        if (v17) {
          operator delete(v17);
        }
        std::__hash_table<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>>>::__deallocate_node((id *)v22[2]);
        v18 = v22[0];
        v22[0] = 0;
        if (v18) {
          operator delete(v18);
        }
      }
      else
      {
        for (i = (uint64_t **)v33[8]; i; i = (uint64_t **)*i)
        {
          CVPixelBufferRelease((CVPixelBufferRef)i[3]);
          i[3] = 0;
        }
        retstr->var0.var0 = 0;
        retstr->var1 = 0;
      }

      std::__hash_table<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>>>::__deallocate_node(0);
      _Block_object_dispose(&v32, 8);
      std::__hash_table<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>>>::__deallocate_node(*((id **)&v38 + 1));
      char v20 = (void *)*((void *)&v37 + 1);
      *((void *)&v37 + 1) = 0;
      if (v20) {
        operator delete(v20);
      }
    }
    else
    {
      retstr->var0.var0 = 0;
      retstr->var1 = 0;
    }
  }
  else
  {
    *(void *)&retstr->var1 = 0;
    *(_OWORD *)&retstr->var0.var1.var0.var1.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = 0u;
    *(_OWORD *)&retstr->var0.var1.var0.var1.__table_.__p2_.__value_ = 0u;
    *(_OWORD *)&retstr->var0.var1.var0.var0.var0.var1.var0.var0 = 0u;
    *(_OWORD *)&retstr->var0.var1.var0.var0.var0.var3.var0 = 0u;
    *(_OWORD *)&retstr->var0.var0 = 0u;
  }

  return result;
}

uint64_t __96__VNSegmentationGenerator__processNonTiledLockedImageBuffer_inputMaskObservation_options_error___block_invoke(uint64_t a1, void *a2)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 72);
  v6 = [(id)objc_opt_class() inputImageBlobName];
  LOBYTE(v4) = [v4 bindLockedPixelBuffer:v5 toNetworkInputBlobName:v6 error:a2];

  if ((v4 & 1) == 0) {
    return 0;
  }
  v7 = (__CVBuffer *)[*(id *)(a1 + 40) pixelBuffer];
  if (!v7) {
    goto LABEL_21;
  }
  v8 = v7;
  unint64_t v9 = *(void *)(*(void *)(a1 + 32) + 88);
  unint64_t v10 = *(void *)(*(void *)(a1 + 32) + 96);
  size_t Width = CVPixelBufferGetWidth(v7);
  size_t Height = CVPixelBufferGetHeight(v8);
  id v13 = [MEMORY[0x1E4F1E050] imageWithCVPixelBuffer:v8];
  unint64_t v14 = *(void *)(*(void *)(a1 + 32) + 200);
  unint64_t v15 = *(void *)(*(void *)(a1 + 32) + 208);
  [v13 extent];
  double v16 = (double)v14 / (double)v15;
  double v19 = v17 / v18;
  BOOL v20 = v16 >= 1.0 || v19 < 1.0;
  if (!v20 || (v16 >= 1.0 ? (BOOL v21 = v19 < 1.0) : (BOOL v21 = 0), v21))
  {
    uint64_t v23 = [v13 imageByApplyingCGOrientation:8];

    size_t v22 = Width;
    id v13 = (void *)v23;
  }
  else
  {
    size_t v22 = Height;
    size_t Height = Width;
  }
  if (Height != v9 || v22 != v10)
  {
    memset(&v46, 0, sizeof(v46));
    [v13 extent];
    double v25 = v24;
    [v13 extent];
    CGAffineTransformMakeScale(&v46, (double)v9 / v25, (double)v10 / v26);
    CGAffineTransform v55 = v46;
    uint64_t v27 = [v13 imageByApplyingTransform:&v55];

    id v13 = (void *)v27;
  }
  id v28 = [(id)objc_opt_class() inputMaskBlobName];
  uint64_t v54 = 0;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v47 = 0u;
  memset(&v46, 0, sizeof(v46));
  if (([*(id *)(a1 + 32) bindBuffer:&v46 toNetworkInputBlobName:v28 error:a2] & 1) == 0) {
    goto LABEL_27;
  }
  id v29 = +[VNValidationUtilities requiredSessionInOptions:*(void *)(a1 + 48) error:a2];
  if (!v29) {
    goto LABEL_27;
  }
  uint64_t v30 = *(void *)(a1 + 32);
  CGFloat a = v46.a;
  v45 = v29;
  v31 = *(void **)(a1 + 56);
  uint64_t v32 = [v29 vnciContextManager];
  id v33 = v13;
  id v34 = v31;
  id v35 = v32;
  v36 = v35;
  if (!v30)
  {

LABEL_27:
    return 0;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __119__VNSegmentationGenerator__renderCIImage_toBuffer_width_height_rowBytes_format_computeDevice_vnciContextManager_error___block_invoke;
  aBlock[3] = &unk_1E5B1D570;
  CGFloat v58 = a;
  unint64_t v59 = v10;
  unint64_t v60 = v9;
  uint64_t v61 = 4 * v9;
  id v37 = v33;
  id v57 = v37;
  int v62 = 1278226534;
  long long v38 = _Block_copy(aBlock);
  char v39 = -[VNCIContextManager performBlock:usingAvailableContextForComputeDevice:error:]((uint64_t)v36, v38, v34, a2);

  if ((v39 & 1) == 0) {
    return 0;
  }
LABEL_21:
  uint64_t result = [*(id *)(a1 + 32) executePlanAndReturnError:a2];
  if (result)
  {
    v41 = *(id **)(*(void *)(a1 + 32) + 120);
    if (v41)
    {
      while (1)
      {
        v42 = +[VNEspressoHelpers createCVPixelBufferWithPixelFormat:1278226534 fromImageInEspressoBuffer:v41 + 3 error:a2];
        uint64_t result = v42 != 0;
        if (!v42) {
          break;
        }
        uint64_t v43 = *(void *)(*(void *)(a1 + 64) + 8) + 48;
        *(void *)&v46.CGFloat a = v41 + 2;
        std::__hash_table<std::__hash_value_type<NSString * {__strong},__CVBuffer *>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},__CVBuffer *>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},__CVBuffer *>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},__CVBuffer *>>>::__emplace_unique_key_args<NSString * {__strong},std::piecewise_construct_t const&,std::tuple<NSString * const {__strong}&>,std::tuple<>>(v43, v41 + 2, (id **)&v46)[3] = v42;
        v41 = (id *)*v41;
        if (!v41) {
          return 1;
        }
      }
    }
    else
    {
      return 1;
    }
  }
  return result;
}

uint64_t __119__VNSegmentationGenerator__renderCIImage_toBuffer_width_height_rowBytes_format_computeDevice_vnciContextManager_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  long long v7 = *(_OWORD *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 64);
  return -[VNCIContext renderCIImage:buffer:format:error:](a2, v4, &v6, *(_DWORD *)(a1 + 72), a3);
}

- (BufferSize)outputMaskSize
{
  next = self->_espressoMaskOutputBufferSizes.__table_.__p1_.__value_.__next_;
  unint64_t v3 = next[3];
  unint64_t v4 = next[4];
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v43 = a5;
  id v13 = objc_opt_class();
  char v14 = [v13 supportsTiling];
  v42 = [v13 inputMaskBlobName];
  v41 = [v13 outputMaskBlobNames];
  unint64_t v15 = +[VNValidationUtilities requiredObjectOfClass:objc_opt_class() forKey:@"VNSegmentationGeneratorProcessOption_KeepRawOutputMask" inOptions:v43 error:a8];
  if (!v15)
  {
    id v21 = 0;
    double v16 = v43;
    goto LABEL_44;
  }
  double v16 = v43;
  char v39 = v15;
  long long v38 = +[VNValidationUtilities requiredObjectOfClass:objc_opt_class() forKey:@"VNSegmentationGeneratorProcessOption_OutputPixelFormat" inOptions:v43 error:a8];
  if (v38)
  {
    id v37 = +[VNValidationUtilities requiredSessionInOptions:v43 error:a8];
    if (!v37)
    {
      id v21 = 0;
LABEL_42:

      goto LABEL_43;
    }
    v36 = [(VNDetector *)self computeDeviceForComputeStage:@"VNComputeStageMain" processingOptions:v43 error:a8];
    if (!v36)
    {
      id v21 = 0;
LABEL_41:

      goto LABEL_42;
    }
    id v34 = [v43 objectForKeyedSubscript:@"VNSegmentationGeneratorProcessOption_MaskImageObservations"];
    if (!v34 && v42)
    {
      uint64_t v71 = 0;
      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v66 = 0u;
      memset(v65, 0, sizeof(v65));
      if (![(VNEspressoModelFileBasedDetector *)self bindBuffer:v65 toNetworkInputBlobName:v42 error:a8])
      {
        id v21 = 0;
LABEL_40:

        goto LABEL_41;
      }
      bzero(*(void **)&v65[0], 4 * v66 * *((void *)&v66 + 1));
    }
    id v33 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v43 error:a8];
    if (!v33)
    {
      id v21 = 0;
LABEL_39:

      goto LABEL_40;
    }
    uint64_t v32 = [v13 requestKeyToRequestInfo];
    uint64_t v17 = [v32 count];
    id v40 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v31 = [v13 outputMaskBlobNameToRequestKey];
    double v18 = [v13 outputMaskBlobNameToFeatureName];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __125__VNSegmentationGenerator_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke;
    aBlock[3] = &unk_1E5B1D0F8;
    uint64_t v61 = v17;
    int v62 = a4;
    void aBlock[4] = self;
    id v51 = v43;
    unsigned int v63 = a6;
    id v52 = v41;
    id v53 = v15;
    id v54 = v38;
    char v64 = v14;
    id v55 = v36;
    id v56 = v37;
    id v30 = v18;
    id v57 = v30;
    id v27 = v33;
    id v58 = v27;
    id v29 = v31;
    id v59 = v29;
    id v28 = v32;
    id v60 = v28;
    double v19 = _Block_copy(aBlock);
    BOOL v20 = (void (**)(void, void, void))v19;
    if (v34)
    {
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v21 = v34;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v46 objects:v72 count:16];
      if (v22)
      {
        id obj = v21;
        uint64_t v23 = *(void *)v47;
        while (2)
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v47 != v23) {
              objc_enumerationMutation(obj);
            }
            double v25 = ((void (**)(void, void, id *))v20)[2](v20, *(void *)(*((void *)&v46 + 1) + 8 * i), a8);
            if (!v25)
            {
              id v21 = 0;
              goto LABEL_37;
            }
            if ([v40 count])
            {
              v44[0] = MEMORY[0x1E4F143A8];
              v44[1] = 3221225472;
              v44[2] = __125__VNSegmentationGenerator_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke_2;
              v44[3] = &unk_1E5B1DCF0;
              id v45 = v25;
              [v40 enumerateObjectsUsingBlock:v44];
            }
            else
            {
              [v40 addObjectsFromArray:v25];
            }
          }
          uint64_t v22 = [obj countByEnumeratingWithState:&v46 objects:v72 count:16];
          if (v22) {
            continue;
          }
          break;
        }
        id v21 = obj;
      }
    }
    else
    {
      (*((void (**)(void *, void, id *))v19 + 2))(v19, 0, a8);
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      if (!v21)
      {
LABEL_38:

        goto LABEL_39;
      }
      [v40 addObjectsFromArray:v21];
    }

    if ([v40 count])
    {
      if ([v27 specifiesRequestClass:objc_opt_class()])
      {
        id v21 = (id)[v40 copy];
      }
      else
      {
        id obj = [v40 firstObject];
        id v21 = (id)[obj copy];
LABEL_37:
      }
    }
    else
    {
      id v21 = (id)MEMORY[0x1E4F1CBF0];
    }
    goto LABEL_38;
  }
  id v21 = 0;
LABEL_43:

  unint64_t v15 = v39;
LABEL_44:

  return v21;
}

id __125__VNSegmentationGenerator_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v25 = a2;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(void *)(a1 + 120)];
  if (*(void *)(a1 + 120))
  {
    unint64_t v6 = 0;
    do
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [v5 addObject:v7];

      ++v6;
    }
    while (v6 < *(void *)(a1 + 120));
  }
  uint64_t v8 = *(void **)(a1 + 32);
  if (v8)
  {
    [v8 processLockedImageBuffer:*(void *)(a1 + 128) inputMaskObservation:v25 options:*(void *)(a1 + 40) qosClass:*(unsigned int *)(a1 + 136) error:a3];
    if ((_BYTE)v43)
    {
      std::unordered_map<NSString * {__strong},__CVBuffer *>::unordered_map((uint64_t)&v36, (uint64_t)v42);
      char v41 = 1;
      unint64_t v9 = v36;
      unint64_t v10 = v37;
      v36 = 0;
      unint64_t v37 = 0;
      __p = v9;
      unint64_t v32 = v10;
      uint64_t v11 = v39;
      id v33 = v38;
      uint64_t v34 = v39;
      int v35 = v40;
      if (v39)
      {
        unint64_t v12 = (unint64_t)v38[1];
        if ((v10 & (v10 - 1)) != 0)
        {
          if (v12 >= v10) {
            v12 %= v10;
          }
        }
        else
        {
          v12 &= v10 - 1;
        }
        *((void *)v9 + v12) = &v33;
        long long v38 = 0;
        uint64_t v39 = 0;
      }
      if (v11 == [*(id *)(a1 + 48) count])
      {
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id obj = *(id *)(a1 + 48);
        uint64_t v14 = [obj countByEnumeratingWithState:&v26 objects:v44 count:16];
        if (v14)
        {
          uint64_t v24 = *(void *)v27;
          while (2)
          {
            uint64_t v23 = v14;
            for (uint64_t i = 0; i != v23; ++i)
            {
              if (*(void *)v27 != v24) {
                objc_enumerationMutation(obj);
              }
              uint64_t v30 = *(void *)(*((void *)&v26 + 1) + 8 * i);
              if ((objc_msgSend(*(id *)(a1 + 32), "validateMaskForBlobName:options:maskConfidence:maskAcceptable:error:") & 1) == 0)
              {

                id v13 = 0;
                goto LABEL_28;
              }
            }
            uint64_t v14 = [obj countByEnumeratingWithState:&v26 objects:v44 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }

        id v13 = v5;
LABEL_28:
        for (j = v33; j; j = (id *)*j)
        {
          CVPixelBufferRelease((CVPixelBufferRef)j[3]);
          j[3] = 0;
        }
        if (v34)
        {
          std::__hash_table<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>>>::__deallocate_node(v33);
          id v33 = 0;
          unint64_t v17 = v32;
          if (v32)
          {
            uint64_t v18 = 0;
            do
              *((void *)__p + v18++) = 0;
            while (v17 != v18);
          }
          uint64_t v34 = 0;
        }
      }
      else if (a3)
      {
        +[VNError errorForInternalErrorWithLocalizedDescription:@"Unexpected number for masks returned"];
        id v13 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v13 = 0;
      }
      std::__hash_table<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>>>::__deallocate_node(v33);
      double v19 = __p;
      __p = 0;
      if (v19) {
        operator delete(v19);
      }
      if (v41)
      {
        std::__hash_table<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>>>::__deallocate_node(v38);
        BOOL v20 = v36;
        v36 = 0;
        if (v20) {
          operator delete(v20);
        }
      }
    }
    else
    {
      id v13 = 0;
    }
  }
  else
  {
    id v13 = 0;
    uint64_t v43 = 0;
    memset(v42, 0, sizeof(v42));
  }
  std::__optional_destruct_base<std::tuple<std::unordered_map<NSString * {__strong},__CVBuffer *>,std::unordered_map<NSString * {__strong},espresso_buffer_t>>,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)v42);

  return v13;
}

void __125__VNSegmentationGenerator_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  uint64_t v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  [v6 addObjectsFromArray:v5];
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v16 = a4;
  unint64_t v17 = objc_opt_class();
  uint64_t v18 = [(VNDetector *)self validatedImageBufferFromOptions:v16 error:a8];
  double v19 = v18;
  if (!v18) {
    goto LABEL_28;
  }
  unint64_t v20 = [v18 width];
  unint64_t v21 = [v19 height];
  double v22 = x * (double)v20;
  double v23 = width * (double)v20;
  double v24 = y * (double)v21;
  double v25 = height * (double)v21;
  *(double *)v44 = v22;
  *(double *)&v44[1] = v24;
  *(double *)&v44[2] = v23;
  *(double *)&v44[3] = v25;
  long long v26 = [MEMORY[0x1E4F29238] valueWithBytes:v44 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  [v16 setObject:v26 forKeyedSubscript:@"VNSegmentationGeneratorProcessOption_ImageROI"];

  unint64_t v27 = [(VNSegmentationGenerator *)self outputMaskSize];
  double v29 = (double)v27 / (double)v28;
  double v30 = v23 / v25;
  BOOL v31 = v29 >= 1.0 || v30 < 1.0;
  if (!v31 || (v29 >= 1.0 ? (BOOL v32 = v30 < 1.0) : (BOOL v32 = 0), v32)) {
    uint64_t v33 = [(id)objc_opt_class() rotateImageToMatchNetworkOrientation];
  }
  else {
    uint64_t v33 = 0;
  }
  uint64_t v34 = [NSNumber numberWithBool:v33];
  [v16 setObject:v34 forKeyedSubscript:@"VNSegmentationGeneratorProcessOption_ImageRotated"];

  id v35 = v16;
  if (!self)
  {
LABEL_27:

LABEL_28:
    BOOL v40 = 0;
    goto LABEL_29;
  }
  v36 = objc_opt_class();
  unint64_t v37 = [v36 inputMaskBlobName];

  if (!v37) {
    goto LABEL_20;
  }
  if ([v36 inputMaskRequired])
  {
    id v38 = +[VNValidationUtilities requiredObjectOfClass:objc_opt_class() forKey:@"VNSegmentationGeneratorProcessOption_MaskImageObservations" inOptions:v35 error:a8];
    if (!v38) {
      goto LABEL_27;
    }
    goto LABEL_19;
  }
  id v45 = 0;
  BOOL v39 = +[VNValidationUtilities getOptionalObject:&v45 ofClass:objc_opt_class() forKey:@"VNSegmentationGeneratorProcessOption_MaskImageObservations" inOptions:v35 error:a8];
  id v38 = v45;
  if (!v39)
  {

    goto LABEL_27;
  }
LABEL_19:

LABEL_20:
  if ([v17 supportsTiling])
  {
    BOOL v40 = 1;
  }
  else
  {
    [v35 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"VNImageBufferOption_CreateFromPixelBufferPool"];
    if (v33) {
      uint64_t v41 = 258;
    }
    else {
      uint64_t v41 = 2;
    }
    v42 = (__CVBuffer *)objc_msgSend(v19, "cropAndScaleBufferWithWidth:height:cropRect:format:imageCropAndScaleOption:options:error:calculatedNormalizedOriginOffset:calculatedScaleX:calculatedScaleY:", self->_espressoInputImageSize.width, self->_espressoInputImageSize.height, 1111970369, v41, v35, a8, v22, v24, v23, v25, 0, 0, 0);
    *a7 = v42;
    BOOL v40 = v42 != 0;
  }
LABEL_29:

  return v40;
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = objc_opt_class();
  v84.receiver = self;
  v84.super_class = (Class)VNSegmentationGenerator;
  if ([(VNEspressoModelFileBasedDetector *)&v84 completeInitializationForSession:v7 error:a4])
  {
    uint64_t v61 = [v8 inputImageBlobName];
    id v60 = [v8 inputMaskBlobName];
    id v57 = [v8 outputMaskBlobNames];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __66__VNSegmentationGenerator_completeInitializationForSession_error___block_invoke;
    aBlock[3] = &unk_1E5B1D0D0;
    void aBlock[4] = self;
    id v59 = _Block_copy(aBlock);
    unint64_t v9 = v59;
    if (((*((uint64_t (**)(void *, void *, BufferSize *, id *))v59 + 2))(v59, v61, &self->_espressoInputImageSize, a4) & 1) == 0|| !(*((unsigned int (**)(void *, void *, BufferSize *, id *))v59 + 2))(v59, v60, &self->_espressoInputMaskSize, a4)|| v60&& ![(VNEspressoModelFileBasedDetector *)self getWidth:&self->_espressoMaskInputBufferSize height:&self->_espressoMaskInputBufferSize.height ofEspressoModelNetworkBlobNamed:v60 error:a4])
    {
      goto LABEL_107;
    }
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id obj = v57;
    uint64_t v10 = [obj countByEnumeratingWithState:&v79 objects:v86 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v80;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v80 != v11) {
            objc_enumerationMutation(obj);
          }
          id v67 = *(id *)(*((void *)&v79 + 1) + 8 * i);
          long long v68 = 0u;
          long long v69 = 0u;
          long long v70 = 0u;
          long long v71 = 0u;
          long long v72 = 0u;
          long long v73 = 0u;
          long long v74 = 0u;
          long long v75 = 0u;
          long long v76 = 0u;
          long long v77 = 0u;
          uint64_t v78 = 0;
          uint64_t v4 = (uint64_t)std::__hash_table<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::hash<NSString * {__strong}>,std::equal_to<NSString * {__strong}>,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},espresso_buffer_t>,std::equal_to<NSString * {__strong}>,std::hash<NSString * {__strong}>,true>,std::allocator<std::__hash_value_type<NSString * {__strong},espresso_buffer_t>>>::__emplace_unique_key_args<NSString * {__strong},std::pair<NSString * {__strong},espresso_buffer_t>>((uint64_t)&self->_espressoMaskOutputBuffers, &v67, (uint64_t *)&v67);

          if (![(VNEspressoModelFileBasedDetector *)self bindBuffer:v4 + 24 toNetworkOutputBlobName:*(void *)(v4 + 16) error:a4])goto LABEL_110; {
        }
          }
        uint64_t v10 = [obj countByEnumeratingWithState:&v79 objects:v86 count:16];
      }
      while (v10);
    }

    unint64_t v9 = v59;
    if ([(VNSegmentationGenerator *)self bindOutputConfidenceBuffersAndReturnError:a4])
    {
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      id v51 = obj;
      uint64_t v13 = [v51 countByEnumeratingWithState:&v63 objects:v85 count:16];
      if (v13)
      {
        uint64_t v54 = *(void *)v64;
        id v52 = v7;
LABEL_17:
        uint64_t v14 = 0;
        uint64_t v53 = v13;
        while (1)
        {
          if (*(void *)v64 != v54) {
            objc_enumerationMutation(v51);
          }
          unint64_t v15 = *(void **)(*((void *)&v63 + 1) + 8 * v14);
          id v67 = 0;
          uint64_t v62 = 0;
          if (![(VNEspressoModelFileBasedDetector *)self getWidth:&v67 height:&v62 ofEspressoModelNetworkBlobNamed:v15 error:a4])
          {
LABEL_110:
            BOOL v49 = 0;
            goto LABEL_111;
          }
          uint64_t v56 = v14;
          id v16 = v67;
          uint64_t v17 = v62;
          unint64_t v18 = [v15 hash];
          unint64_t v19 = v18;
          p_espressoMaskOutputBufferSizes = &self->_espressoMaskOutputBufferSizes;
          unint64_t value = self->_espressoMaskOutputBufferSizes.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
          if (value)
          {
            uint8x8_t v22 = (uint8x8_t)vcnt_s8((int8x8_t)value);
            v22.i16[0] = vaddlv_u8(v22);
            if (v22.u32[0] > 1uLL)
            {
              uint64_t v4 = v18;
              if (v18 >= value) {
                uint64_t v4 = v18 % value;
              }
            }
            else
            {
              uint64_t v4 = (value - 1) & v18;
            }
            double v23 = p_espressoMaskOutputBufferSizes->__table_.__bucket_list_.__ptr_.__value_[v4];
            if (v23)
            {
              for (j = (void *)*v23; j; j = (void *)*j)
              {
                unint64_t v25 = j[1];
                if (v25 == v18)
                {
                  if ((void *)j[2] == v15) {
                    goto LABEL_93;
                  }
                }
                else
                {
                  if (v22.u32[0] > 1uLL)
                  {
                    if (v25 >= value) {
                      v25 %= value;
                    }
                  }
                  else
                  {
                    v25 &= value - 1;
                  }
                  if (v25 != v4) {
                    break;
                  }
                }
              }
            }
          }
          long long v26 = operator new(0x28uLL);
          p_p1 = &self->_espressoMaskOutputBufferSizes.__table_.__p1_;
          *long long v26 = 0;
          v26[1] = v19;
          v26[2] = v15;
          v26[3] = v16;
          v26[4] = v17;
          float v27 = (float)(self->_espressoMaskOutputBufferSizes.__table_.__p2_.__value_ + 1);
          float v28 = self->_espressoMaskOutputBufferSizes.__table_.__p3_.__value_;
          if (!value || (float)(v28 * (float)value) < v27) {
            break;
          }
LABEL_83:
          v44 = p_espressoMaskOutputBufferSizes->__table_.__bucket_list_.__ptr_.__value_;
          id v45 = (void **)p_espressoMaskOutputBufferSizes->__table_.__bucket_list_.__ptr_.__value_[v4];
          if (v45)
          {
            *long long v26 = *v45;
          }
          else
          {
            *long long v26 = p_p1->__value_.__next_;
            p_p1->__value_.__next_ = v26;
            v44[v4] = p_p1;
            if (!*v26) {
              goto LABEL_92;
            }
            unint64_t v46 = *(void *)(*v26 + 8);
            if ((value & (value - 1)) != 0)
            {
              if (v46 >= value) {
                v46 %= value;
              }
            }
            else
            {
              v46 &= value - 1;
            }
            id v45 = &p_espressoMaskOutputBufferSizes->__table_.__bucket_list_.__ptr_.__value_[v46];
          }
          void *v45 = v26;
LABEL_92:
          ++self->_espressoMaskOutputBufferSizes.__table_.__p2_.__value_;
LABEL_93:
          uint64_t v14 = v56 + 1;
          id v7 = v52;
          if (v56 + 1 == v53)
          {
            uint64_t v48 = [v51 countByEnumeratingWithState:&v63 objects:v85 count:16];
            uint64_t v13 = v48;
            BOOL v49 = 1;
            if (!v48) {
              goto LABEL_111;
            }
            goto LABEL_17;
          }
        }
        BOOL v29 = (value & (value - 1)) != 0;
        if (value < 3) {
          BOOL v29 = 1;
        }
        unint64_t v30 = v29 | (2 * value);
        unint64_t v31 = vcvtps_u32_f32(v27 / v28);
        if (v30 <= v31) {
          int8x8_t prime = (int8x8_t)v31;
        }
        else {
          int8x8_t prime = (int8x8_t)v30;
        }
        if (*(void *)&prime == 1)
        {
          int8x8_t prime = (int8x8_t)2;
        }
        else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
        {
          int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
        }
        unint64_t value = self->_espressoMaskOutputBufferSizes.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
        if (*(void *)&prime > value) {
          goto LABEL_49;
        }
        if (*(void *)&prime < value)
        {
          unint64_t v39 = vcvtps_u32_f32((float)self->_espressoMaskOutputBufferSizes.__table_.__p2_.__value_/ self->_espressoMaskOutputBufferSizes.__table_.__p3_.__value_);
          if (value < 3 || (uint8x8_t v40 = (uint8x8_t)vcnt_s8((int8x8_t)value), v40.i16[0] = vaddlv_u8(v40), v40.u32[0] > 1uLL))
          {
            unint64_t v39 = std::__next_prime(v39);
          }
          else
          {
            uint64_t v41 = 1 << -(char)__clz(v39 - 1);
            if (v39 >= 2) {
              unint64_t v39 = v41;
            }
          }
          if (*(void *)&prime <= v39) {
            int8x8_t prime = (int8x8_t)v39;
          }
          if (*(void *)&prime >= value)
          {
            unint64_t value = self->_espressoMaskOutputBufferSizes.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
          }
          else
          {
            if (prime)
            {
LABEL_49:
              if (*(void *)&prime >> 61) {
                std::__throw_bad_array_new_length[abi:ne180100]();
              }
              uint64_t v33 = (void **)operator new(8 * *(void *)&prime);
              uint64_t v34 = p_espressoMaskOutputBufferSizes->__table_.__bucket_list_.__ptr_.__value_;
              p_espressoMaskOutputBufferSizes->__table_.__bucket_list_.__ptr_.__value_ = v33;
              if (v34) {
                operator delete(v34);
              }
              uint64_t v35 = 0;
              self->_espressoMaskOutputBufferSizes.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = (unint64_t)prime;
              do
                p_espressoMaskOutputBufferSizes->__table_.__bucket_list_.__ptr_.__value_[v35++] = 0;
              while (*(void *)&prime != v35);
              next = p_p1->__value_.__next_;
              if (p_p1->__value_.__next_)
              {
                unint64_t v37 = next[1];
                uint8x8_t v38 = (uint8x8_t)vcnt_s8(prime);
                v38.i16[0] = vaddlv_u8(v38);
                if (v38.u32[0] > 1uLL)
                {
                  if (v37 >= *(void *)&prime) {
                    v37 %= *(void *)&prime;
                  }
                }
                else
                {
                  v37 &= *(void *)&prime - 1;
                }
                p_espressoMaskOutputBufferSizes->__table_.__bucket_list_.__ptr_.__value_[v37] = p_p1;
                v42 = (void *)*next;
                if (*next)
                {
                  do
                  {
                    unint64_t v43 = v42[1];
                    if (v38.u32[0] > 1uLL)
                    {
                      if (v43 >= *(void *)&prime) {
                        v43 %= *(void *)&prime;
                      }
                    }
                    else
                    {
                      v43 &= *(void *)&prime - 1;
                    }
                    if (v43 != v37)
                    {
                      if (!p_espressoMaskOutputBufferSizes->__table_.__bucket_list_.__ptr_.__value_[v43])
                      {
                        p_espressoMaskOutputBufferSizes->__table_.__bucket_list_.__ptr_.__value_[v43] = next;
                        goto LABEL_74;
                      }
                      void *next = *v42;
                      void *v42 = *(void *)p_espressoMaskOutputBufferSizes->__table_.__bucket_list_.__ptr_.__value_[v43];
                      *(void *)p_espressoMaskOutputBufferSizes->__table_.__bucket_list_.__ptr_.__value_[v43] = v42;
                      v42 = next;
                    }
                    unint64_t v43 = v37;
LABEL_74:
                    next = v42;
                    v42 = (void *)*v42;
                    unint64_t v37 = v43;
                  }
                  while (v42);
                }
              }
              unint64_t value = (unint64_t)prime;
              goto LABEL_78;
            }
            long long v47 = p_espressoMaskOutputBufferSizes->__table_.__bucket_list_.__ptr_.__value_;
            p_espressoMaskOutputBufferSizes->__table_.__bucket_list_.__ptr_.__value_ = 0;
            if (v47) {
              operator delete(v47);
            }
            unint64_t value = 0;
            self->_espressoMaskOutputBufferSizes.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = 0;
          }
        }
LABEL_78:
        if ((value & (value - 1)) != 0)
        {
          if (v19 >= value) {
            uint64_t v4 = v19 % value;
          }
          else {
            uint64_t v4 = v19;
          }
        }
        else
        {
          uint64_t v4 = (value - 1) & v19;
        }
        goto LABEL_83;
      }
      BOOL v49 = 1;
LABEL_111:

      unint64_t v9 = v59;
    }
    else
    {
LABEL_107:
      BOOL v49 = 0;
    }
  }
  else
  {
    BOOL v49 = 0;
  }

  return v49;
}

uint64_t __66__VNSegmentationGenerator_completeInitializationForSession_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) getWidth:a3 height:a3 + 8 ofEspressoModelNetworkBlobNamed:a2 error:a4];
}

- (const)espressoInputMaskSize
{
  return &self->_espressoInputMaskSize;
}

- (const)espressoInputImageSize
{
  return &self->_espressoInputImageSize;
}

@end