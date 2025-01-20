@interface VNFaceLandmarkDetectorDNN
+ (NSArray)inputBlobNames;
+ (NSArray)outputBlobNames;
+ (id)configurationOptionKeysForDetectorKey;
+ (int)_detectorConstellationForRequestConstellation:(unint64_t)a3;
+ (void)recordDefaultConfigurationOptionsInDictionary:(id)a3;
- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9;
- (BOOL)getLandmarkErrorEstimates:(void *)a3 forRequestConstellation:(unint64_t)a4 error:(id *)a5;
- (BOOL)getLandmarkPoints:(void *)a3 forRequestConstellation:(unint64_t)a4 error:(id *)a5;
- (BOOL)requestConstellation:(unint64_t *)a3 cvmlConstellation:(int *)a4 fromOptions:(id)a5 error:(id *)a6;
- (BOOL)translateAndNormalizeLandmarkPointsWrtLLCofAlignedFaceBBox:(void *)a3 imageBuffer:(id)a4 outputFace:(id)a5 error:(id *)a6;
- (id).cxx_construct;
- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9;
- (void)landmarkPoints65;
- (void)releaseResources;
@end

@implementation VNFaceLandmarkDetectorDNN

+ (int)_detectorConstellationForRequestConstellation:(unint64_t)a3
{
  if (+[VNFaceLandmarkDetectorDNN _detectorConstellationForRequestConstellation:]::onceToken != -1) {
    dispatch_once(&+[VNFaceLandmarkDetectorDNN _detectorConstellationForRequestConstellation:]::onceToken, &__block_literal_global_30716);
  }
  v4 = *(void **)(+[VNFaceLandmarkDetectorDNN _detectorConstellationForRequestConstellation:]::map + 8);
  if (!v4) {
    return 0;
  }
  uint64_t v5 = +[VNFaceLandmarkDetectorDNN _detectorConstellationForRequestConstellation:]::map + 8;
  do
  {
    unint64_t v6 = v4[4];
    BOOL v7 = v6 >= a3;
    if (v6 >= a3) {
      v8 = v4;
    }
    else {
      v8 = v4 + 1;
    }
    if (v7) {
      uint64_t v5 = (uint64_t)v4;
    }
    v4 = (void *)*v8;
  }
  while (*v8);
  if (v5 != +[VNFaceLandmarkDetectorDNN _detectorConstellationForRequestConstellation:]::map + 8
    && *(void *)(v5 + 32) <= a3)
  {
    return *(_DWORD *)(v5 + 40);
  }
  else
  {
    return 0;
  }
}

void __75__VNFaceLandmarkDetectorDNN__detectorConstellationForRequestConstellation___block_invoke()
{
}

+ (NSArray)outputBlobNames
{
  vision::mod::LandmarkDetectorDNN_Options::LandmarkDetectorDNN_Options((uint64_t)v10, [a1 landmarkDetectorDNNVersion]);
  vision::mod::LandmarkDetectorDNN_Options::getBlobNamesOutput(&v9, v10);
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  std::vector<std::string>::pointer begin = v9.__begin_;
  for (std::vector<std::string>::pointer i = v9.__end_; begin != i; ++begin)
  {
    id v5 = [NSString alloc];
    std::vector<std::string>::pointer v6 = begin;
    if (SHIBYTE(begin->__r_.__value_.__r.__words[2]) < 0) {
      std::vector<std::string>::pointer v6 = (std::vector<std::string>::pointer)begin->__r_.__value_.__r.__words[0];
    }
    BOOL v7 = (void *)[v5 initWithUTF8String:v6];
    [v2 addObject:v7];
  }
  v15 = &v9;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v15);
  std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::destroy(v14);
  std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::destroy(v13);
  std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::destroy(v12);
  if (v11 < 0) {
    operator delete(v10[3]);
  }

  return (NSArray *)v2;
}

+ (NSArray)inputBlobNames
{
  vision::mod::LandmarkDetectorDNN_Options::LandmarkDetectorDNN_Options((uint64_t)v14, [a1 landmarkDetectorDNNVersion]);
  char v11 = 0;
  v12 = 0;
  v13 = 0;
  v20 = &v11;
  char v21 = 0;
  id v2 = (std::string *)operator new(0x18uLL);
  char v11 = v2;
  v12 = v2;
  v3 = v2 + 1;
  v13 = v2 + 1;
  if (SHIBYTE(v16) < 0)
  {
    std::string::__init_copy_ctor_external(v2, (const std::string::value_type *)__p, *((std::string::size_type *)&__p + 1));
  }
  else
  {
    *(_OWORD *)&v2->__r_.__value_.__l.__data_ = __p;
    v2->__r_.__value_.__r.__words[2] = v16;
  }
  v12 = v3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = v11;
  for (std::vector<std::string>::pointer i = v12; v5 != i; ++v5)
  {
    id v7 = [NSString alloc];
    v8 = v5;
    if (SHIBYTE(v5->__r_.__value_.__r.__words[2]) < 0) {
      v8 = (std::string *)v5->__r_.__value_.__r.__words[0];
    }
    std::vector<std::string> v9 = objc_msgSend(v7, "initWithUTF8String:", v8, v11);
    [v4 addObject:v9];
  }
  v20 = &v11;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v20);
  std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::destroy(v19);
  std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::destroy(v18);
  std::__tree<std::__value_type<unsigned char,std::string>,std::__map_value_compare<unsigned char,std::__value_type<unsigned char,std::string>,std::less<unsigned char>,true>,std::allocator<std::__value_type<unsigned char,std::string>>>::destroy(v17);
  if (SHIBYTE(v16) < 0) {
    operator delete((void *)__p);
  }

  return (NSArray *)v4;
}

+ (id)configurationOptionKeysForDetectorKey
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__VNFaceLandmarkDetectorDNN_configurationOptionKeysForDetectorKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNFaceLandmarkDetectorDNN configurationOptionKeysForDetectorKey]::onceToken != -1) {
    dispatch_once(&+[VNFaceLandmarkDetectorDNN configurationOptionKeysForDetectorKey]::onceToken, block);
  }
  id v2 = (void *)+[VNFaceLandmarkDetectorDNN configurationOptionKeysForDetectorKey]::configurationOptionKeys;

  return v2;
}

void __66__VNFaceLandmarkDetectorDNN_configurationOptionKeysForDetectorKey__block_invoke(uint64_t a1)
{
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___VNFaceLandmarkDetectorDNN;
  v1 = objc_msgSendSuper2(&v5, sel_configurationOptionKeysForDetectorKey);
  id v2 = (void *)[v1 mutableCopy];

  [v2 addObject:@"VNFaceLandmarkDetectorDNNProcessOption_Constellation"];
  uint64_t v3 = [v2 copy];
  id v4 = (void *)+[VNFaceLandmarkDetectorDNN configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNFaceLandmarkDetectorDNN configurationOptionKeysForDetectorKey]::configurationOptionKeys = v3;
}

+ (void)recordDefaultConfigurationOptionsInDictionary:(id)a3
{
  id v4 = a3;
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___VNFaceLandmarkDetectorDNN;
  objc_msgSendSuper2(&v7, sel_recordDefaultConfigurationOptionsInDictionary_, v4);
  objc_super v5 = [a1 inputBlobNames];
  [v4 setObject:v5 forKeyedSubscript:@"VNEspressoModelFileBasedDetectorOption_InputBlobNames"];

  std::vector<std::string>::pointer v6 = [a1 outputBlobNames];
  [v4 setObject:v6 forKeyedSubscript:@"VNEspressoModelFileBasedDetectorOption_OutputBlobNames"];

  [v4 setObject:&unk_1EF7A7790 forKeyedSubscript:@"VNFaceLandmarkDetectorDNNProcessOption_Constellation"];
}

- (id).cxx_construct
{
  *((void *)self + 14) = 0;
  *((void *)self + 15) = 0;
  *((void *)self + 17) = 0;
  *((void *)self + 18) = 0;
  *((void *)self + 16) = 0;
  return self;
}

- (void).cxx_destruct
{
  p_landmarkPoints65 = &self->_landmarkPoints65;
  std::vector<std::string>::pointer begin = self->_landmarkPoints65.__begin_;
  if (begin)
  {
    p_landmarkPoints65->__end_ = begin;
    operator delete(begin);
  }
  cntrl = self->_landmarkDetector.__cntrl_;
  if (cntrl)
  {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
  }
}

- (void)releaseResources
{
  p_landmarkDetector = &self->_landmarkDetector;
  cntrl = self->_landmarkDetector.__cntrl_;
  p_landmarkDetector->__ptr_ = 0;
  p_landmarkDetector->__cntrl_ = 0;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
  }
  self->_landmarkPoints65.__end_ = self->_landmarkPoints65.__begin_;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  VNCloneFaceObservationFromOptions((uint64_t)v12, a8);
  if (objc_claimAutoreleasedReturnValue())
  {
    CVPixelBufferGetWidth(a4);
    CVPixelBufferGetHeight(a4);
    v20 = [(VNEspressoModelFileBasedDetector *)self espressoResources];
    uint64_t v13 = [v20 network];
    uint64_t v15 = v14;
    uint64_t v16 = [v20 plan];
    int v17 = [(id)objc_opt_class() landmarkDetectorDNNVersion];
    v18 = (char *)operator new(0x110uLL);
    *((void *)v18 + 1) = 0;
    *((void *)v18 + 2) = 0;
    *(void *)v18 = &unk_1EF753658;
    vision::mod::LandmarkDetectorDNN_Options::LandmarkDetectorDNN_Options((uint64_t)v21, v17);
    v18[24] = 0;
    *((void *)v18 + 4) = v13;
    *((void *)v18 + 5) = v15;
    *((void *)v18 + 6) = 0;
    *((void *)v18 + 7) = v16;
    *((_OWORD *)v18 + 4) = *(_OWORD *)v21;
    *((_DWORD *)v18 + 20) = v22;
    if (SHIBYTE(v24) < 0)
    {
      std::string::__init_copy_ctor_external((std::string *)(v18 + 88), (const std::string::value_type *)__p, *((std::string::size_type *)&__p + 1));
    }
    else
    {
      *(_OWORD *)(v18 + 88) = __p;
      *((void *)v18 + 13) = v24;
    }
    std::map<vision::mod::_constellationType,std::pair<std::string,BOOL>>::map[abi:ne180100]((uint64_t)(v18 + 112), &v25);
    std::map<vision::mod::_constellationType,std::pair<std::string,BOOL>>::map[abi:ne180100]((uint64_t)(v18 + 136), &v26);
    std::map<vision::mod::_constellationType,std::pair<std::string,BOOL>>::map[abi:ne180100]((uint64_t)(v18 + 160), &v27);
    *((_OWORD *)v18 + 14) = 0u;
    *((void *)v18 + 24) = 0;
    *((void *)v18 + 23) = v18 + 192;
    *((void *)v18 + 25) = 0;
    *((_OWORD *)v18 + 15) = 0u;
    *(_OWORD *)(v18 + 249) = 0u;
    LOWORD(v28[0]) = 2;
    BYTE2(v28[0]) = 0;
    *(void *)&v28[1] = 0x437F000000000000;
    v28[3] = 32;
    char v29 = 0;
    operator new();
  }

  return 0;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  v32[2] = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  uint64_t v13 = [(VNDetector *)self validatedImageBufferFromOptions:v12 error:a8];
  if (v13)
  {
    uint64_t v14 = +[VNValidationUtilities requiredFaceObservationInOptions:v12 error:a8];
    if (!v14) {
      goto LABEL_5;
    }
    unint64_t v15 = [v13 width];
    unint64_t v16 = [v13 height];
    [(VNFaceLandmarkDetector *)self normalizedFaceBBoxForLandmarks:v14];
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    unsigned int v30 = -1;
    if ([v14 getFaceEXIFOrientation:&v30 error:a8])
    {
      v31[0] = @"VNImageBufferOption_FeatureOrientationRelativeToUpRight";
      uint64_t v25 = [NSNumber numberWithInt:v30];
      v31[1] = @"VNImageBufferOption_CreateFromPixelBufferPool";
      v32[0] = v25;
      v32[1] = MEMORY[0x1E4F1CC38];
      uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];

      uint64_t v27 = (__CVBuffer *)objc_msgSend(v13, "croppedBufferWithWidth:height:format:cropRect:options:error:", -[VNEspressoModelFileBasedDetector networkRequiredInputImageWidth](self, "networkRequiredInputImageWidth"), -[VNEspressoModelFileBasedDetector networkRequiredInputImageHeight](self, "networkRequiredInputImageHeight"), 1111970369, v26, a8, v18 * (double)v15, v20 * (double)v16, v22 * (double)v15, v24 * (double)v16);
      *a7 = v27;
      BOOL v28 = v27 != 0;
    }
    else
    {
LABEL_5:
      BOOL v28 = 0;
    }
  }
  else
  {
    BOOL v28 = 0;
  }

  return v28;
}

- (BOOL)translateAndNormalizeLandmarkPointsWrtLLCofAlignedFaceBBox:(void *)a3 imageBuffer:(id)a4 outputFace:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  unint64_t v12 = [v10 width];
  unint64_t v13 = [v10 height];
  [(VNFaceLandmarkDetector *)self normalizedFaceBBoxForLandmarks:v11];
  double v57 = v14;
  double v58 = v15;
  double v17 = v16;
  double v19 = v18;
  [v11 alignedBoundingBoxAsCGRect];
  double v21 = v20 * (double)v12;
  double v23 = v22 * (double)v12;
  double v25 = v24 * (double)v13;
  double v27 = v26 * (double)v13;
  v62.origin.x = v21;
  v62.origin.y = v25;
  v62.size.width = v23;
  v62.size.height = v27;
  BOOL v28 = CGRectEqualToRect(v62, *MEMORY[0x1E4F1DB28]);
  double v29 = v17 * (double)v12;
  double v30 = v19 * (double)v13;
  if (v28) {
    double v31 = v19 * (double)v13;
  }
  else {
    double v31 = v27;
  }
  if (v28) {
    double v32 = v17 * (double)v12;
  }
  else {
    double v32 = v23;
  }
  if (v28) {
    double v33 = v58 * (double)v13;
  }
  else {
    double v33 = v25;
  }
  if (v28) {
    double v21 = v57 * (double)v12;
  }
  double v34 = v57 * (double)v12;
  int v61 = -1;
  char v35 = [v11 getFaceEXIFOrientation:&v61 error:a6];
  if (v35)
  {
    unint64_t v36 = [(VNEspressoModelFileBasedDetector *)self networkRequiredInputImageWidth];
    unint64_t v37 = [(VNEspressoModelFileBasedDetector *)self networkRequiredInputImageHeight];
    memset(&v60, 0, sizeof(v60));
    switch(v61)
    {
      case 2:
        v59.double b = 0.0;
        v59.double c = 0.0;
        v59.double a = -1.0;
        __asm { FMOV            V0.2D, #1.0 }
        *(_OWORD *)&v59.double d = _Q0;
        v59.double ty = 0.0;
        break;
      case 3:
        v59.double b = 0.0;
        v59.double c = 0.0;
        v59.double a = -1.0;
        *(_OWORD *)&v59.double d = xmmword_1A410C430;
        goto LABEL_18;
      case 4:
        v59.double b = 0.0;
        v59.double c = 0.0;
        v59.double a = 1.0;
        *(_OWORD *)&v59.double d = xmmword_1A410C170;
LABEL_18:
        v59.double ty = 1.0;
        break;
      case 5:
        *(_OWORD *)&v59.double a = xmmword_1A410C160;
        *(_OWORD *)&v59.double c = xmmword_1A410C170;
        __asm { FMOV            V0.2D, #1.0 }
        goto LABEL_24;
      case 6:
        *(_OWORD *)&v59.double a = xmmword_1A410C160;
        v59.double c = 1.0;
        v59.double d = 0.0;
        v59.double tx = 0.0;
        v59.double ty = 1.0;
        break;
      case 7:
        *(_OWORD *)&v59.double a = xmmword_1A410C150;
        v59.double c = 1.0;
        v59.double d = 0.0;
        goto LABEL_22;
      case 8:
        *(_OWORD *)&v59.double a = xmmword_1A410C150;
        *(_OWORD *)&v59.double c = xmmword_1A410C170;
        _Q0 = xmmword_1A410C440;
LABEL_24:
        *(_OWORD *)&v59.double tx = _Q0;
        break;
      default:
        v59.double a = 1.0;
        v59.double b = 0.0;
        v59.double c = 0.0;
        v59.double d = 1.0;
LABEL_22:
        v59.double tx = 0.0;
        v59.double ty = 0.0;
        break;
    }
    CGAffineTransformInvert(&v60, &v59);
    v44 = *(float **)a3;
    v45 = (float *)*((void *)a3 + 1);
    if (*(float **)a3 != v45)
    {
      double a = v60.a;
      double b = v60.b;
      double c = v60.c;
      double d = v60.d;
      double tx = v60.tx;
      double ty = v60.ty;
      do
      {
        double v52 = 1.0 / (double)v36 * *v44;
        double v53 = 1.0 / (double)v37 * v44[1];
        double v54 = tx + v53 * c + a * v52;
        double v55 = ty + v53 * d + b * v52;
        *(float *)&double v53 = (v29 * v54 - (v21 - v34)) / v32;
        *(float *)&double v55 = (v30 * v55 - (v33 - v58 * (double)v13)) / v31;
        float *v44 = *(float *)&v53;
        v44[1] = *(float *)&v55;
        v44 += 2;
      }
      while (v44 != v45);
    }
  }

  return v35;
}

- (BOOL)getLandmarkErrorEstimates:(void *)a3 forRequestConstellation:(unint64_t)a4 error:(id *)a5
{
  unsigned int v8 = [(id)objc_opt_class() _detectorConstellationForRequestConstellation:a4];
  std::vector<std::string> v9 = std::map<vision::mod::_constellationType,std::pair<std::string,BOOL>>::at(*((uint64_t **)self->_landmarkDetector.__ptr_ + 15), v8);
  uint64_t v10 = *((unsigned __int8 *)v9 + 23);
  if ((v10 & 0x80u) != 0) {
    uint64_t v10 = v9[1];
  }
  if (!v10) {
    return 1;
  }
  ptr = self->_landmarkDetector.__ptr_;
  if (!*(unsigned char *)ptr)
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = 2932;
    __cxa_throw(exception, MEMORY[0x1E4FBA3E0], 0);
  }
  uint64_t v12 = (uint64_t)ptr + 160;
  unint64_t v13 = std::map<vision::mod::_constellationType,std::pair<std::string,BOOL>>::at(*((uint64_t **)ptr + 15), v8);
  double v14 = (int **)std::map<std::string,std::vector<float>>::at(v12, v13);
  double v15 = *v14;
  unint64_t v16 = (unint64_t)v14[12];
  vision::mod::LandmarkDetectorDNN::checkConstellation(v16, v8);
  std::vector<float>::vector(&__p, v16);
  if (v16)
  {
    double v17 = __p;
    do
    {
      int v18 = *v15++;
      *v17++ = v18;
      --v16;
    }
    while (v16);
  }
  if (v8 <= 2) {
    unint64_t v19 = vision::mod::constellationTypeSize[v8];
  }
  else {
    unint64_t v19 = 0;
  }
  BOOL v20 = v19 == (v26 - (unsigned char *)__p) >> 2;
  if (v19 == (v26 - (unsigned char *)__p) >> 2)
  {
    if (&__p != a3) {
      std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>((char *)a3, (char *)__p, (uint64_t)v26, v19);
    }
  }
  else if (a5)
  {
    id v21 = [NSString alloc];
    double v22 = objc_msgSend(v21, "initWithFormat:", @"Unexpected number of error estimates for Landmark points (%lu) while processing Face Landmarks request. Expected: %lu", (v26 - (unsigned char *)__p) >> 2, v19);
    *a5 = +[VNError errorForInternalErrorWithLocalizedDescription:v22];
  }
  if (__p)
  {
    double v26 = __p;
    operator delete(__p);
  }
  return v20;
}

- (BOOL)getLandmarkPoints:(void *)a3 forRequestConstellation:(unint64_t)a4 error:(id *)a5
{
  unsigned int v8 = [(id)objc_opt_class() _detectorConstellationForRequestConstellation:a4];
  std::vector<std::string> v9 = std::map<vision::mod::_constellationType,std::pair<std::string,BOOL>>::at(*((uint64_t **)self->_landmarkDetector.__ptr_ + 12), v8);
  uint64_t v10 = *((unsigned __int8 *)v9 + 23);
  if ((v10 & 0x80u) != 0) {
    uint64_t v10 = v9[1];
  }
  if (v10)
  {
    ptr = self->_landmarkDetector.__ptr_;
    if (!*(unsigned char *)ptr)
    {
      exception = __cxa_allocate_exception(8uLL);
      void *exception = 2932;
      __cxa_throw(exception, MEMORY[0x1E4FBA3E0], 0);
    }
    unint64_t v13 = *((void *)ptr + 25);
    unint64_t v12 = *((void *)ptr + 26);
    double v14 = std::map<vision::mod::_constellationType,std::pair<std::string,BOOL>>::at(*((uint64_t **)ptr + 12), v8);
    double v15 = (uint64_t *)std::map<std::string,std::vector<float>>::at((uint64_t)ptr + 160, v14);
    uint64_t v16 = *v15;
    unint64_t v17 = v15[12];
    vision::mod::LandmarkDetectorDNN::checkConstellation(v17 >> 1, v8);
    v43 = 0;
    v44 = 0;
    uint64_t v45 = 0;
    Geometry2D_mallocCart2D(&v43, v17 >> 1);
    if (v17 >= 2)
    {
      float v19 = (float)v12;
      BOOL v20 = (float *)v43;
      id v21 = (float *)v44;
      if (v17 >> 1 <= 1) {
        uint64_t v22 = 1;
      }
      else {
        uint64_t v22 = v17 >> 1;
      }
      double v23 = (float *)(v16 + 4);
      uint64_t v24 = v22;
      do
      {
        *v20++ = *(v23 - 1) * (float)v13;
        float v25 = *v23;
        v23 += 2;
        *v21++ = v25 * v19;
        --v24;
      }
      while (v24);
      v40 = 0;
      v41 = 0;
      uint64_t v42 = 0;
      vision::mod::ImageProcessing_Preprocessor::mapCoordinatesDestinationToSource((uint64_t)&v40, *((float **)ptr + 29), (uint64_t)&v43);
      free(v43);
      v43 = 0;
      free(v44);
      v44 = 0;
      LODWORD(v45) = 0;
      std::vector<_Geometry2D_point2D_>::vector(&__p, v17 >> 1);
      double v26 = (int *)v40;
      double v27 = (float *)v41;
      BOOL v28 = (float *)((char *)__p + 4);
      do
      {
        int v29 = *v26++;
        int v30 = v29;
        float v31 = *v27++;
        float v32 = *((float *)ptr + 48) - v31;
        *((_DWORD *)v28 - 1) = v30;
        *BOOL v28 = v32;
        v28 += 2;
        --v22;
      }
      while (v22);
    }
    else
    {
      v40 = 0;
      v41 = 0;
      uint64_t v42 = 0;
      vision::mod::ImageProcessing_Preprocessor::mapCoordinatesDestinationToSource((uint64_t)&v40, *((float **)ptr + 29), (uint64_t)&v43);
      free(v43);
      v43 = 0;
      free(v44);
      v44 = 0;
      LODWORD(v45) = 0;
      std::vector<_Geometry2D_point2D_>::vector(&__p, v17 >> 1);
    }
    free(v40);
    v40 = 0;
    free(v41);
    uint64_t v33 = 0;
    uint64_t v34 = (v39 - (unsigned char *)__p) >> 3;
    if (v8 <= 2) {
      uint64_t v33 = vision::mod::constellationTypeSize[v8];
    }
    BOOL v18 = v34 == v33;
    if (v34 == v33)
    {
      if (&__p != a3) {
        std::vector<long long>::__assign_with_size[abi:ne180100]<long long *,long long *>((char *)a3, (char *)__p, (uint64_t)v39, (v39 - (unsigned char *)__p) >> 3);
      }
    }
    else if (a5)
    {
      char v35 = objc_msgSend([NSString alloc], "initWithFormat:", @"Unexpected number of Landmark points (%lu) while processing Face Landmarks request. Expected: %lu", v34, v33);
      *a5 = +[VNError errorForInternalErrorWithLocalizedDescription:v35];
    }
    if (__p)
    {
      v39 = __p;
      operator delete(__p);
    }
  }
  else if (a5)
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:@"Could not compute Landmarks using Landmark Detector due to internal error"];
    BOOL v18 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    return 0;
  }
  return v18;
}

- (BOOL)requestConstellation:(unint64_t *)a3 cvmlConstellation:(int *)a4 fromOptions:(id)a5 error:(id *)a6
{
  id v9 = a5;
  if (a3) {
    BOOL v10 = a4 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  uint64_t v11 = !v10;
  +[VNError VNAssert:v11 log:@"Input parameter cannot be NULL"];
  unint64_t v14 = 0;
  BOOL v12 = +[VNValidationUtilities getNSUIntegerValue:&v14 forKey:@"VNFaceLandmarkDetectorDNNProcessOption_Constellation" inOptions:v9 error:a6];
  if (v12)
  {
    *a3 = v14;
    *a4 = [(id)objc_opt_class() _detectorConstellationForRequestConstellation:v14];
  }

  return v12;
}

- (void)landmarkPoints65
{
  return &self->_landmarkPoints65;
}

@end