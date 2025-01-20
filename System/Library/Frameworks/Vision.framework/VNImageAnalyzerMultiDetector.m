@interface VNImageAnalyzerMultiDetector
+ (BOOL)_getAssociatedBoundingBoxGeneratorClass:(Class *)a3 options:(id *)a4 forConfigurationOptions:(id)a5 error:(id *)a6;
+ (BOOL)producesObservationsForMultipleRequestClasses;
+ (Class)detectorClassForConfigurationOptions:(id)a3 error:(id *)a4;
+ (id)_inferenceDescriptorForOptions:(id)a3 error:(id *)a4;
+ (id)_newInferenceDescriptorForModel:(unint64_t)a3 configuredWithOptions:(id)a4 error:(id *)a5;
+ (id)_newSaliencyHeatmapBoundingBoxGeneratorOptionsForOptions:(id)a3;
+ (id)_saliencyHeatmapBoundingBoxGeneratorTypeForOriginatingRequestSpecifier:(id)a3;
+ (id)allPhotosAdjustmentKeys;
+ (id)computeStagesToBindForConfigurationOptions:(id)a3;
+ (id)configurationOptionKeysForDetectorKey;
+ (id)disallowedListForModel:(unint64_t)a3;
+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4;
+ (id)supportedImageSizeSetForOptions:(id)a3 error:(id *)a4;
+ (shared_ptr<vision::mod::ImageClassifier_HierarchicalModel>)createHierarchicalModelForInferenceDescriptor:(id)a3 error:(id *)a4;
+ (shared_ptr<vision::mod::ImageClassifier_HierarchicalModel>)createHierarchicalModelForMultiDetectorModel:(unint64_t)a3 error:(id *)a4;
+ (unint64_t)modelForRequestClass:(Class)a3 revision:(unint64_t)a4;
+ (void)recordDefaultConfigurationOptionsInDictionary:(id)a3;
- (BOOL)canBehaveAsDetectorOfClass:(Class)a3 withConfiguration:(id)a4;
- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4;
- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9;
- (BOOL)hasObjDetNet;
- (BOOL)hasSliderNet;
- (BOOL)shouldBeReplacedByDetectorOfClass:(Class)a3 withConfiguration:(id)a4;
- (BOOL)warmUpSession:(id)a3 withOptions:(id)a4 error:(id *)a5;
- (VNImageAnalyzerMultiDetector)initWithConfigurationOptions:(id)a3;
- (id).cxx_construct;
- (id)_observationsForScenes:(void *)a3 entityNet:(void *)a4 junk:(void *)a5 VNVYvzEtX1JlUdu8xx5qhDI:(void *)a6 landmark:(void *)a7 sceneprints:(void *)a8 compressedSceneprint:(double)a9 fingerprints:(double)a10 aesthetics:(double)a11 saliencyA:(double)a12 saliencyO:(double)a13 recognizeObjects:(double)a14 VN5kJNH3eYuyaLxNpZr5Z7zi:(void *)a15 VNdGg5skzXHSAENO6T3enHE:(void *)a16 cityNatureGating:(void *)a17 photosAdjustments:(void *)a18 pixelBuffer:(void *)a19 withOptions:(void *)a20 originalImageSize:(void *)a21 regionOfInterest:(void *)a22 qosClass:(void *)a23 warningRecorder:(uint64_t)a24 error:(void *)a25;
- (id)_processFullImagePixelBuffer:(const __CVBuffer *)a3 options:(id)a4 regionOfInterest:(CGRect)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9;
- (id)_processLastAnalysisForCityNatureConfiguration:(void *)a3 error:;
- (id)_processLastAnalysisForPhotosAdjustmentsConfiguration:(void *)a3 error:;
- (id)_processLastAnalysisForRecognizeObjectsConfiguration:(uint64_t)a1 error:(void *)a2;
- (id)_processLastAnalysisForSaliencyOConfiguration:(void *)a3 regionOfInterest:(uint64_t)a4 originalImageSize:(void *)a5 options:(void *)a6 qosClass:(double)a7 warningRecorder:(double)a8 error:(double)a9;
- (id)_processLastAnalysisForSignificantEventConfiguration:(void *)a3 error:;
- (id)_processLastAnalysisForVN5kJNH3eYuyaLxNpZr5Z7ziConfiguration:(void *)a3 error:;
- (id)_processSaliencyTensor:(double)a3 regionOfInterest:(double)a4 originalImageSize:(double)a5 options:(double)a6 saliencyConfiguration:(uint64_t)a7 saliencyGeneratorType:(int8x16_t *)a8 startCode:(void *)a9 finishCode:(void *)a10 qosClass:(void *)a11 warningRecorder:(uint64_t)a12 error:(uint64_t)a13;
- (id)allCityNatureIdentifiersWithOptions:(id)a3 error:(id *)a4;
- (id)allJunkIdentifiersForOptions:(id)a3 error:(id *)a4;
- (id)allRecognizedObjectsIdentifiersWithOptions:(id)a3 error:(id *)a4;
- (id)allSceneIdentifiersWithOptions:(id)a3 error:(id *)a4;
- (id)allSignificantEventIdentifiersWithOptions:(id)a3 error:(id *)a4;
- (id)allVN5kJNH3eYuyaLxNpZr5Z7ziIdentifiersWithOptions:(id)a3 error:(id *)a4;
- (id)description;
- (id)internalProcessUsingQualityOfServiceClass:(unsigned int)a3 options:(id)a4 regionOfInterest:(CGRect)a5 warningRecorder:(id)a6 error:(id *)a7 progressHandler:(id)a8;
- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9;
- (id)sceneLabelOperationPointsForOriginatingRequestSpecifier:(id)a3 error:(id *)a4;
- (uint64_t)_analysisTypeForScenes:(void *)a1 entityNet:(void *)a2 junk:(void *)a3 VNVYvzEtX1JlUdu8xx5qhDI:(void *)a4 landmark:(void *)a5 sceneprints:(void *)a6 compressedSceneprint:(void *)a7 fingerprints:(void *)a8 aesthetics:(void *)a9 saliencyA:(void *)a10 saliencyO:(void *)a11 recognizeObjects:(void *)a12 VN5kJNH3eYuyaLxNpZr5Z7zi:(void *)a13 VNdGg5skzXHSAENO6T3enHE:(void *)a14 cityNatureGating:(void *)a15 photosAdjustments:(void *)a16;
- (uint64_t)_performAnalysis:(uint64_t)a3 pixelBuffer:(uint64_t)a4 error:;
- (uint64_t)_populateLeafSceneObservations:(void *)a3 hierarchySceneObservations:(void *)a4 fromLastAnalysisForSceneConfiguration:(void *)a5 error:;
- (uint64_t)_processSceneIdentifier:(void *)a3 withConfidence:(void *)a4 disallowedList:(void *)a5 operationPoints:(void *)a6 originatingRequestSpecifier:(unint64_t *)a7 observationsArray:(uint64_t)a8 optionalTopN:(float)a9 error:;
- (unint64_t)signPostAdditionalParameter;
- (void)_VN5kJNH3eYuyaLxNpZr5Z7ziCustomClassifierAndReturnError:(void *)a3;
- (void)_VNVYvzEtX1JlUdu8xx5qhDICustomClassifierAndReturnError:(void *)a3;
- (void)_VNdGg5skzXHSAENO6T3enHECustomClassifierForOriginatingRequestSpecifier:(void *)a3;
- (void)_cityNatureCustomClassifierAndReturnError:(void *)a3;
- (void)_configureSlidersAdjustmentsInImageAnalyzerOptions:(uint64_t)a1 forConfigurationOptions:(std::vector<std::string> *)a2;
- (void)_getImageCropAndScaleOption:(int32x2_t *)a3 networkRequiredInputImageSize:(void *)a4 forOptions:;
- (void)_isNotConfiguredWithBooleanOptionNamed:(void *)a3 butRequiredByOptions:;
- (void)_junkCustomClassifiersAndReturnError:(void *)a3;
- (void)_lastAnalysisSceneClassifications;
- (void)_loadCustomClassifierWithDescriptor:(void *)a3 error:(void *)a4;
- (void)_potentialLandmarksCustomClassifierAndReturnError:(void *)a3;
@end

@implementation VNImageAnalyzerMultiDetector

+ (unint64_t)modelForRequestClass:(Class)a3 revision:(unint64_t)a4
{
  if (+[VNImageAnalyzerMultiDetector modelForRequestClass:revision:]::onceToken != -1) {
    dispatch_once(&+[VNImageAnalyzerMultiDetector modelForRequestClass:revision:]::onceToken, &__block_literal_global_27557);
  }
  uint64_t v6 = +[VNImageAnalyzerMultiDetector modelForRequestClass:revision:]::ourModelMap;
  v7 = VNRequestClassFromClientSubclass(a3);
  v10 = *(void **)(v6 + 8);
  v9 = (void *)(v6 + 8);
  v8 = v10;
  if (!v10) {
    goto LABEL_20;
  }
  v11 = v9;
  do
  {
    v12 = (void *)v8[4];
    if (v7 == v12) {
      BOOL v13 = v8[5] < a4;
    }
    else {
      BOOL v13 = v12 < v7;
    }
    BOOL v14 = !v13;
    if (v13) {
      v15 = v8 + 1;
    }
    else {
      v15 = v8;
    }
    if (v14) {
      v11 = v8;
    }
    v8 = (void *)*v15;
  }
  while (*v15);
  if (v11 == v9 || ((v16 = (void *)v11[4], v16 != v7) ? (BOOL v17 = v7 < v16) : (BOOL v17 = v11[5] > a4), v17)) {
LABEL_20:
  }
    v11 = v9;

  if ((void *)(+[VNImageAnalyzerMultiDetector modelForRequestClass:revision:]::ourModelMap + 8) == v11) {
    return 0;
  }
  else {
    return v11[6];
  }
}

- (id).cxx_construct
{
  *((void *)self + 12) = 0;
  *((void *)self + 13) = 0;
  *((void *)self + 14) = 0;
  *((void *)self + 15) = 0;
  *((void *)self + 17) = 0;
  *((void *)self + 18) = 0;
  *((void *)self + 16) = 0;
  *((void *)self + 20) = 0;
  *((void *)self + 21) = 0;
  *((void *)self + 22) = 0;
  *((void *)self + 23) = 0;
  *((void *)self + 24) = 0;
  *((void *)self + 25) = 0;
  *((void *)self + 26) = 0;
  *((void *)self + 27) = 0;
  *((void *)self + 28) = 0;
  *((void *)self + 29) = 0;
  *((void *)self + 30) = 0;
  *((void *)self + 31) = 0;
  *((void *)self + 32) = 0;
  *((void *)self + 34) = 0;
  *((void *)self + 35) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_cachedAllSceneClassificationsFromLastAnalysis.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
  }
  v4 = self->_cityNatureCustomClassifier_DO_NOT_ACCESS_DIRECTLY.__cntrl_;
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v4);
  }
  v5 = self->_significantEventCustomClassifier_DO_NOT_ACCESS_DIRECTLY.__cntrl_;
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v5);
  }
  uint64_t v6 = self->_VN5kJNH3eYuyaLxNpZr5Z7ziCustomClassifier.__cntrl_;
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v6);
  }
  v7 = self->_potentialLandmarkCustomClassifier_DO_NOT_ACCESS_DIRECTLY.__cntrl_;
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v7);
  }
  v8 = self->_VNVYvzEtX1JlUdu8xx5qhDICustomClassifier.__cntrl_;
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v8);
  }
  value = self->_imageAnalyzerPCA256_DO_NOT_ACCESS_DIRECTLY.__ptr_.__value_;
  self->_imageAnalyzerPCA256_DO_NOT_ACCESS_DIRECTLY.__ptr_.__value_ = 0;
  if (value) {
    std::default_delete<vision::mod::ImageAnalyzer_PCA>::operator()[abi:ne180100]((uint64_t)value);
  }
  v10 = self->_junkCustomClassifiers_DO_NOT_ACCESS_DIRECTLY.__cntrl_;
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v10);
  }
  objc_storeStrong((id *)&self->_operationPointsCache, 0);
  begin = self->_entityNetIndexesToReport.__begin_;
  if (begin)
  {
    self->_entityNetIndexesToReport.__end_ = begin;
    operator delete(begin);
  }
  v12 = self->_imageAnalyzer.__cntrl_;
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v12);
  }
  BOOL v13 = self->_defaultSceneClassificationHierarchicalModel.__cntrl_;
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v13);
  }
  objc_storeStrong((id *)&self->_inferenceDescriptor, 0);

  objc_storeStrong((id *)&self->_inputImageTilingOptions, 0);
}

- (id)allCityNatureIdentifiersWithOptions:(id)a3 error:(id *)a4
{
  [(VNImageAnalyzerMultiDetector *)&v6 _cityNatureCustomClassifierAndReturnError:a4];
  if (v6)
  {
    v4 = _knownIdentifiersForCustomClassifier(*(vision::mod::ImageAnalyzer_CustomClassifier **)(v6 + 312), *(long long **)(v6 + 320));
  }
  else
  {
    v4 = 0;
  }
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v7);
  }

  return v4;
}

- (void)_cityNatureCustomClassifierAndReturnError:(void *)a3
{
  if (!a2)
  {
    *a1 = 0;
    a1[1] = 0;
    return;
  }
  uint64_t v5 = *(void *)(a2 + 248);
  if (v5) {
    goto LABEL_12;
  }
  v7 = [*(id *)(a2 + 80) cityNatureCustomClassifierDescriptor];
  [(VNImageAnalyzerMultiDetector *)&v12 _loadCustomClassifierWithDescriptor:v7 error:a3];

  v8 = v12;
  if (v12)
  {
    v9 = v13;
    if (v13) {
      atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v10 = *(std::__shared_weak_count **)(a2 + 256);
    *(void *)(a2 + 248) = v8;
    *(void *)(a2 + 256) = v9;
    if (v10) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v10);
    }
    if (!v9) {
      goto LABEL_10;
    }
  }
  else
  {
    *a1 = 0;
    a1[1] = 0;
    v9 = v13;
    if (!v13) {
      goto LABEL_10;
    }
  }
  std::__shared_weak_count::__release_shared[abi:nn180100](v9);
LABEL_10:
  if (!v8) {
    return;
  }
  uint64_t v5 = *(void *)(a2 + 248);
LABEL_12:
  uint64_t v11 = *(void *)(a2 + 256);
  *a1 = v5;
  a1[1] = v11;
  if (v11) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v11 + 8), 1uLL, memory_order_relaxed);
  }
}

- (void)_loadCustomClassifierWithDescriptor:(void *)a3 error:(void *)a4
{
  v112[20] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (v7)
  {
    id v89 = v7;
    v8 = [v7 modelFileURL];
    v9 = [v8 VisionCoreFileSystemPathAndReturnError:a4];

    if (!v9)
    {
      *a1 = 0;
      a1[1] = 0;
LABEL_214:

      id v7 = v89;
      goto LABEL_215;
    }
    v10 = [v89 labelsFileURL];
    v86 = a4;
    uint64_t v11 = [v10 VisionCoreFileSystemPathAndReturnError:a4];

    if (!v11)
    {
      *a1 = 0;
      a1[1] = 0;
LABEL_213:

      goto LABEL_214;
    }
    v81 = v11;
    v78 = [v89 inputBlobName];
    v12 = [v89 outputBlobName];
    int v13 = *(_DWORD *)(a2 + 64);
    int v14 = *(_DWORD *)(a2 + 68);
    id v15 = v9;
    id v16 = v11;
    id v17 = v78;
    id v18 = v12;
    v19 = [v15 lastPathComponent];
    id v80 = v15;
    v82 = v9;
    std::string::basic_string[abi:ne180100]<0>(&v96, (char *)[v80 UTF8String]);
    id v88 = v17;
    std::string::basic_string[abi:ne180100]<0>(&v95, (char *)[v88 UTF8String]);
    id v87 = v18;
    std::string::basic_string[abi:ne180100]<0>(&v94, (char *)[v87 UTF8String]);
    id v85 = v16;
    std::string::basic_string[abi:ne180100]<0>(&v93, (char *)[v85 UTF8String]);
    id v84 = v19;
    std::string::basic_string[abi:ne180100]<0>(&v92, (char *)[v84 UTF8String]);
    std::string::basic_string[abi:ne180100]<0>(&v91, "");
    v83 = a1;
    std::string::basic_string[abi:ne180100]<0>(&v90, "");
    memset(__p, 0, sizeof(__p));
    if (SHIBYTE(v96.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&v98, v96.__r_.__value_.__l.__data_, v96.__r_.__value_.__l.__size_);
    }
    else {
      std::string v98 = v96;
    }
    if (SHIBYTE(v95.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&v99, v95.__r_.__value_.__l.__data_, v95.__r_.__value_.__l.__size_);
    }
    else {
      std::string v99 = v95;
    }
    if (SHIBYTE(v94.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&v100, v94.__r_.__value_.__l.__data_, v94.__r_.__value_.__l.__size_);
    }
    else {
      std::string v100 = v94;
    }
    if (SHIBYTE(v93.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&v101, v93.__r_.__value_.__l.__data_, v93.__r_.__value_.__l.__size_);
    }
    else {
      std::string v101 = v93;
    }
    if (SHIBYTE(v91.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&v102, v91.__r_.__value_.__l.__data_, v91.__r_.__value_.__l.__size_);
    }
    else {
      std::string v102 = v91;
    }
    if (SHIBYTE(v92.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&__s, v92.__r_.__value_.__l.__data_, v92.__r_.__value_.__l.__size_);
    }
    else {
      std::string __s = v92;
    }
    if (SHIBYTE(v90.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&v104, v90.__r_.__value_.__l.__data_, v90.__r_.__value_.__l.__size_);
    }
    else {
      std::string v104 = v90;
    }
    *(void *)((char *)&v105 + 4) = 0x1001000000000;
    LODWORD(v105) = v13;
    HIDWORD(v105) = v14;
    if (SHIBYTE(v98.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&v107, v98.__r_.__value_.__l.__data_, v98.__r_.__value_.__l.__size_);
    }
    else {
      std::string v107 = v98;
    }
    if (SHIBYTE(v102.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&v106, v102.__r_.__value_.__l.__data_, v102.__r_.__value_.__l.__size_);
    }
    else {
      std::string v106 = v102;
    }
    std::string::size_type size = HIBYTE(v106.__r_.__value_.__r.__words[2]);
    if ((v106.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      std::string::size_type size = v106.__r_.__value_.__l.__size_;
    }
    if (size)
    {
      std::string::basic_string[abi:ne180100]<0>(&v108, ":");
      if ((v107.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v21 = &v107;
      }
      else {
        v21 = (std::string *)v107.__r_.__value_.__r.__words[0];
      }
      if ((v107.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v22 = HIBYTE(v107.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v22 = v107.__r_.__value_.__l.__size_;
      }
      v23 = std::string::insert(&v108, 0, (const std::string::value_type *)v21, v22);
      long long v24 = *(_OWORD *)&v23->__r_.__value_.__l.__data_;
      v110.__r_.__value_.__r.__words[2] = v23->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v110.__r_.__value_.__l.__data_ = v24;
      v23->__r_.__value_.__l.__size_ = 0;
      v23->__r_.__value_.__r.__words[2] = 0;
      v23->__r_.__value_.__r.__words[0] = 0;
      if ((v106.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v25 = &v106;
      }
      else {
        v25 = (std::string *)v106.__r_.__value_.__r.__words[0];
      }
      if ((v106.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v26 = HIBYTE(v106.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v26 = v106.__r_.__value_.__l.__size_;
      }
      v27 = std::string::append(&v110, (const std::string::value_type *)v25, v26);
      std::string::value_type v28 = v27->__r_.__value_.__s.__data_[0];
      v109[0] = *(_OWORD *)((char *)&v27->__r_.__value_.__l.__data_ + 1);
      *(void *)((char *)v109 + 14) = *(std::string::size_type *)((char *)&v27->__r_.__value_.__r.__words[1] + 7);
      char v29 = HIBYTE(v27->__r_.__value_.__r.__words[2]);
      v27->__r_.__value_.__l.__size_ = 0;
      v27->__r_.__value_.__r.__words[2] = 0;
      v27->__r_.__value_.__r.__words[0] = 0;
      if (SHIBYTE(v110.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v110.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v108.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v108.__r_.__value_.__l.__data_);
      }
    }
    else
    {
      std::string::value_type v28 = v107.__r_.__value_.__s.__data_[0];
      v109[0] = *(_OWORD *)((char *)&v107.__r_.__value_.__l.__data_ + 1);
      *(void *)((char *)v109 + 14) = *(std::string::size_type *)((char *)&v107.__r_.__value_.__r.__words[1] + 7);
      char v29 = HIBYTE(v107.__r_.__value_.__r.__words[2]);
      memset(&v107, 0, sizeof(v107));
    }
    if (SHIBYTE(__p[2]) < 0) {
      operator delete(__p[0]);
    }
    LOBYTE(__p[0]) = v28;
    *(_OWORD *)((char *)__p + 1) = v109[0];
    *(void **)((char *)&__p[1] + 7) = *(void **)((char *)v109 + 14);
    HIBYTE(__p[2]) = v29;
    if (SHIBYTE(v106.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v106.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v107.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v107.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v90.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v90.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v91.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v91.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v92.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v92.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v93.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v93.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v94.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v94.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v95.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v95.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v96.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v96.__r_.__value_.__l.__data_);
    }
    v30 = (std::string *)operator new(0x2A0uLL, MEMORY[0x1E4FBA2D0]);
    if (!v30)
    {
      *(void *)&v109[0] = 0;
      uint64_t v32 = 8571;
LABEL_210:
      uint64_t v11 = v81;
      if (v86)
      {
        VNErrorForCVMLStatus((id)v32);
        void *v86 = (id)objc_claimAutoreleasedReturnValue();
      }
      *a1 = 0;
      a1[1] = 0;
      vision::mod::ImageAnalyzer_CustomClassifierOptions::~ImageAnalyzer_CustomClassifierOptions(__p);

      goto LABEL_213;
    }
    v31 = v30;
    if (SHIBYTE(__p[2]) < 0)
    {
      std::string::__init_copy_ctor_external(v30, (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
    }
    else
    {
      *(_OWORD *)&v30->__r_.__value_.__l.__data_ = *(_OWORD *)__p;
      v30->__r_.__value_.__r.__words[2] = (std::string::size_type)__p[2];
    }
    if (SHIBYTE(v98.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(v31 + 1, v98.__r_.__value_.__l.__data_, v98.__r_.__value_.__l.__size_);
    }
    else {
      v31[1] = v98;
    }
    v33 = v31 + 2;
    v79 = v31 + 2;
    if (SHIBYTE(v99.__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::__init_copy_ctor_external(v33, v99.__r_.__value_.__l.__data_, v99.__r_.__value_.__l.__size_);
    }
    else
    {
      *(_OWORD *)&v33->__r_.__value_.__l.__data_ = *(_OWORD *)&v99.__r_.__value_.__l.__data_;
      v31[2].__r_.__value_.__r.__words[2] = v99.__r_.__value_.__r.__words[2];
    }
    v34 = v31 + 3;
    if (SHIBYTE(v100.__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::__init_copy_ctor_external(v31 + 3, v100.__r_.__value_.__l.__data_, v100.__r_.__value_.__l.__size_);
    }
    else
    {
      *(_OWORD *)&v34->__r_.__value_.__l.__data_ = *(_OWORD *)&v100.__r_.__value_.__l.__data_;
      v31[3].__r_.__value_.__r.__words[2] = v100.__r_.__value_.__r.__words[2];
    }
    if (SHIBYTE(v101.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(v31 + 4, v101.__r_.__value_.__l.__data_, v101.__r_.__value_.__l.__size_);
    }
    else {
      v31[4] = v101;
    }
    if (SHIBYTE(v102.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(v31 + 5, v102.__r_.__value_.__l.__data_, v102.__r_.__value_.__l.__size_);
    }
    else {
      v31[5] = v102;
    }
    if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(v31 + 6, __s.__r_.__value_.__l.__data_, __s.__r_.__value_.__l.__size_);
    }
    else {
      v31[6] = __s;
    }
    v35 = v31 + 7;
    if (SHIBYTE(v104.__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::__init_copy_ctor_external(v35, v104.__r_.__value_.__l.__data_, v104.__r_.__value_.__l.__size_);
    }
    else
    {
      *(_OWORD *)&v35->__r_.__value_.__l.__data_ = *(_OWORD *)&v104.__r_.__value_.__l.__data_;
      v31[7].__r_.__value_.__r.__words[2] = v104.__r_.__value_.__r.__words[2];
    }
    long long v36 = v105;
    v31[8].__r_.__value_.__r.__words[2] = 0;
    *(_OWORD *)&v31[8].__r_.__value_.__l.__data_ = v36;
    v31[9].__r_.__value_.__l.__size_ = 0;
    *(_OWORD *)&v31[10].__r_.__value_.__r.__words[1] = 0u;
    LODWORD(v31[9].__r_.__value_.__l.__data_) = 0;
    v31[9].__r_.__value_.__r.__words[2] = 0;
    v31[10].__r_.__value_.__s.__data_[0] = 0;
    *(_OWORD *)&v31[11].__r_.__value_.__l.__data_ = 0u;
    *(_OWORD *)&v31[11].__r_.__value_.__r.__words[2] = 0u;
    *(_OWORD *)&v31[12].__r_.__value_.__r.__words[1] = 0u;
    *(_OWORD *)&v31[13].__r_.__value_.__l.__data_ = 0u;
    *(_OWORD *)&v31[13].__r_.__value_.__r.__words[2] = 0u;
    *(_OWORD *)&v31[14].__r_.__value_.__r.__words[1] = 0u;
    *(_OWORD *)&v31[15].__r_.__value_.__l.__data_ = 0u;
    *(_OWORD *)&v31[15].__r_.__value_.__r.__words[2] = 0u;
    *(_OWORD *)&v31[16].__r_.__value_.__r.__words[1] = 0u;
    *(_OWORD *)&v31[17].__r_.__value_.__l.__data_ = 0u;
    *(_OWORD *)&v31[17].__r_.__value_.__r.__words[2] = 0u;
    *(_OWORD *)&v31[18].__r_.__value_.__r.__words[1] = 0u;
    *(_OWORD *)&v31[19].__r_.__value_.__l.__data_ = 0u;
    v31[27].__r_.__value_.__r.__words[2] = 0;
    *(_OWORD *)&v31[19].__r_.__value_.__r.__words[2] = 0u;
    *(_OWORD *)&v31[20].__r_.__value_.__r.__words[1] = 0u;
    *(_OWORD *)&v31[21].__r_.__value_.__l.__data_ = 0u;
    *(_OWORD *)&v31[21].__r_.__value_.__r.__words[2] = 0u;
    *(_OWORD *)&v31[22].__r_.__value_.__r.__words[1] = 0u;
    *(_OWORD *)&v31[23].__r_.__value_.__l.__data_ = 0u;
    *(_OWORD *)&v31[23].__r_.__value_.__r.__words[2] = 0u;
    *(_OWORD *)&v31[24].__r_.__value_.__r.__words[1] = 0u;
    *(_OWORD *)&v31[25].__r_.__value_.__l.__data_ = 0u;
    *(_OWORD *)&v31[25].__r_.__value_.__r.__words[2] = 0u;
    *(_OWORD *)&v31[26].__r_.__value_.__r.__words[1] = 0u;
    *(_OWORD *)&v31[27].__r_.__value_.__l.__data_ = 0u;
    if (SHIBYTE(v101.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&v107, v101.__r_.__value_.__l.__data_, v101.__r_.__value_.__l.__size_);
    }
    else {
      std::string v107 = v101;
    }
    std::string::size_type v37 = HIBYTE(v107.__r_.__value_.__r.__words[2]);
    if ((v107.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      std::string::size_type v37 = v107.__r_.__value_.__l.__size_;
    }
    if (!v37) {
      goto LABEL_153;
    }
    memset(&v108, 0, sizeof(v108));
    uint64_t v38 = MEMORY[0x1E4FBA460] + 64;
    v112[0] = MEMORY[0x1E4FBA460] + 64;
    std::string::size_type v39 = *(void *)(MEMORY[0x1E4FBA3F8] + 16);
    v110.__r_.__value_.__r.__words[0] = *(void *)(MEMORY[0x1E4FBA3F8] + 8);
    *(std::string::size_type *)((char *)v110.__r_.__value_.__r.__words
                              + *(void *)(v110.__r_.__value_.__r.__words[0] - 24)) = v39;
    v110.__r_.__value_.__l.__size_ = 0;
    v40 = (std::ios_base *)((char *)&v110 + *(void *)(v110.__r_.__value_.__r.__words[0] - 24));
    std::ios_base::init(v40, &v110.__r_.__value_.__r.__words[2]);
    uint64_t v41 = MEMORY[0x1E4FBA460] + 24;
    v40[1].__vftable = 0;
    v40[1].__fmtflags_ = -1;
    v110.__r_.__value_.__r.__words[0] = v41;
    v112[0] = v38;
    MEMORY[0x1A6256000](&v110.__r_.__value_.__r.__words[2]);
    if (!std::filebuf::open()) {
      std::ios_base::clear((std::ios_base *)((char *)&v110 + *(void *)(v110.__r_.__value_.__r.__words[0] - 24)), *(_DWORD *)&v111[*(void *)(v110.__r_.__value_.__r.__words[0] - 24)] | 4);
    }
    v42 = (std::locale::id *)MEMORY[0x1E4FBA258];
    uint64_t v43 = MEMORY[0x1E4F14390];
    while (1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)&v110 + *(void *)(v110.__r_.__value_.__r.__words[0] - 24)));
      v44 = std::locale::use_facet((const std::locale *)&v106, v42);
      unsigned __int8 v45 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v44->__vftable[2].~facet_0)(v44, 10);
      std::locale::~locale((std::locale *)&v106);
      std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&v110, (uint64_t)&v108, v45);
      if ((v111[*(void *)(v110.__r_.__value_.__r.__words[0] - 24)] & 5) != 0) {
        break;
      }
      if ((v108.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v46 = &v108;
      }
      else {
        v46 = (std::string *)v108.__r_.__value_.__r.__words[0];
      }
      if ((v108.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v47 = HIBYTE(v108.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v47 = v108.__r_.__value_.__l.__size_;
      }
      if (!v47) {
        goto LABEL_136;
      }
      v48 = (std::string *)((char *)v46 + v47);
      do
      {
        uint64_t v49 = v46->__r_.__value_.__s.__data_[0];
        if (v46->__r_.__value_.__s.__data_[0] < 0
           ? __maskrune(v49, 0x4000uLL)
           : *(_DWORD *)(v43 + 4 * v49 + 60) & 0x4000)
        {
          break;
        }
        v46 = (std::string *)((char *)v46 + 1);
        --v47;
      }
      while (v47);
      if (v46 == v48 || (std::string *)((char *)&v46->__r_.__value_.__l.__data_ + 1) == v48)
      {
LABEL_136:
        v48 = v46;
      }
      else
      {
        uint64_t v51 = 1;
        v48 = v46;
        do
        {
          uint64_t v52 = v46->__r_.__value_.__s.__data_[v51];
          if (v46->__r_.__value_.__s.__data_[v51] < 0) {
            int v53 = __maskrune(v52, 0x4000uLL);
          }
          else {
            int v53 = *(_DWORD *)(v43 + 4 * v52 + 60) & 0x4000;
          }
          if (!v53)
          {
            v48->__r_.__value_.__s.__data_[0] = v46->__r_.__value_.__s.__data_[v51];
            v48 = (std::string *)((char *)v48 + 1);
          }
          ++v51;
        }
        while (v47 != v51);
      }
      v54 = (char *)&v108 + HIBYTE(v108.__r_.__value_.__r.__words[2]);
      if ((v108.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      {
        v55 = &v108;
      }
      else
      {
        v54 = (char *)(v108.__r_.__value_.__r.__words[0] + v108.__r_.__value_.__l.__size_);
        v55 = (std::string *)v108.__r_.__value_.__r.__words[0];
      }
      std::string::erase(&v108, (char *)v48 - (char *)v55, v54 - (char *)v48);
      std::string::size_type v56 = HIBYTE(v108.__r_.__value_.__r.__words[2]);
      if ((v108.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        std::string::size_type v56 = v108.__r_.__value_.__l.__size_;
      }
      if (v56)
      {
        std::string::size_type v57 = v31[13].__r_.__value_.__l.__size_;
        if (v57 >= v31[13].__r_.__value_.__r.__words[2])
        {
          std::vector<std::string>::pointer v59 = std::vector<std::string>::__push_back_slow_path<std::string const&>((std::vector<std::string> *)&v31[13], (long long *)&v108);
        }
        else
        {
          if (SHIBYTE(v108.__r_.__value_.__r.__words[2]) < 0)
          {
            std::string::__init_copy_ctor_external((std::string *)v31[13].__r_.__value_.__l.__size_, v108.__r_.__value_.__l.__data_, v108.__r_.__value_.__l.__size_);
          }
          else
          {
            long long v58 = *(_OWORD *)&v108.__r_.__value_.__l.__data_;
            *(void *)(v57 + 16) = *((void *)&v108.__r_.__value_.__l + 2);
            *(_OWORD *)std::string::size_type v57 = v58;
          }
          std::vector<std::string>::pointer v59 = (std::vector<std::string>::pointer)(v57 + 24);
          v31[13].__r_.__value_.__l.__size_ = v57 + 24;
        }
        v31[13].__r_.__value_.__l.__size_ = (std::string::size_type)v59;
      }
    }
    std::string::pointer data = v31[13].__r_.__value_.__l.__data_;
    std::string::size_type v60 = v31[13].__r_.__value_.__l.__size_;
    v110.__r_.__value_.__r.__words[0] = *MEMORY[0x1E4FBA3F8];
    *(std::string::size_type *)((char *)v110.__r_.__value_.__r.__words
                              + *(void *)(v110.__r_.__value_.__r.__words[0] - 24)) = *(void *)(MEMORY[0x1E4FBA3F8]
                                                                                                 + 24);
    MEMORY[0x1A6256010](&v110.__r_.__value_.__r.__words[2]);
    std::istream::~istream();
    MEMORY[0x1A6256200](v112);
    if (SHIBYTE(v108.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v108.__r_.__value_.__l.__data_);
    }
    v34 = v31 + 3;
    if ((std::string::pointer)v60 == data) {
      uint64_t v32 = 8565;
    }
    else {
LABEL_153:
    }
      uint64_t v32 = 8576;
    v9 = v82;
    a1 = v83;
    if (SHIBYTE(v107.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v107.__r_.__value_.__l.__data_);
    }
    if ((v32 & 0xF5) != 0x80) {
      goto LABEL_209;
    }
    if (SHIBYTE(v31->__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&v110, v31->__r_.__value_.__l.__data_, v31->__r_.__value_.__l.__size_);
    }
    else {
      std::string v110 = *v31;
    }
    std::string::size_type v62 = HIBYTE(v110.__r_.__value_.__r.__words[2]);
    char v63 = HIBYTE(v110.__r_.__value_.__r.__words[2]);
    if ((v110.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      std::string::size_type v62 = v110.__r_.__value_.__l.__size_;
    }
    if (!v62)
    {
      uint64_t v32 = 8568;
      a1 = v83;
LABEL_192:
      v70 = v31 + 2;
      if (v63 < 0)
      {
        operator delete(v110.__r_.__value_.__l.__data_);
        v70 = v31 + 2;
      }
      if (v32 != 128) {
        goto LABEL_209;
      }
      if (SHIBYTE(v31[2].__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&v110, v31[2].__r_.__value_.__l.__data_, v31[2].__r_.__value_.__l.__size_);
      }
      else {
        std::string v110 = *v70;
      }
      int blob_dimensions = espresso_network_query_blob_dimensions();
      if (SHIBYTE(v110.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v110.__r_.__value_.__l.__data_);
      }
      if (blob_dimensions) {
        goto LABEL_207;
      }
      if (SHIBYTE(v31[3].__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&v110, v31[3].__r_.__value_.__l.__data_, v31[3].__r_.__value_.__l.__size_);
      }
      else {
        std::string v110 = *v34;
      }
      int v72 = espresso_network_query_blob_dimensions();
      if (SHIBYTE(v110.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v110.__r_.__value_.__l.__data_);
      }
      if (v72)
      {
LABEL_207:
        espresso_plan_get_error_info();
        uint64_t v32 = 8539;
      }
      else
      {
        std::string::size_type v73 = v31[11].__r_.__value_.__r.__words[2];
        if (v73 <= v31[12].__r_.__value_.__l.__size_) {
          std::string::size_type v73 = v31[12].__r_.__value_.__l.__size_;
        }
        if (0xAAAAAAAAAAAAAAABLL
           * ((uint64_t)(v31[13].__r_.__value_.__l.__size_ - v31[13].__r_.__value_.__r.__words[0]) >> 3) == v73)
        {
          if (SHIBYTE(v31[2].__r_.__value_.__r.__words[2]) < 0)
          {
            std::string::__init_copy_ctor_external(&v110, v31[2].__r_.__value_.__l.__data_, v31[2].__r_.__value_.__l.__size_);
          }
          else
          {
            *(_OWORD *)&v110.__r_.__value_.__l.__data_ = *(_OWORD *)&v79->__r_.__value_.__l.__data_;
            v110.__r_.__value_.__r.__words[2] = v31[2].__r_.__value_.__r.__words[2];
          }
          int v74 = espresso_network_bind_buffer();
          if (SHIBYTE(v110.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v110.__r_.__value_.__l.__data_);
          }
          if (v74) {
            goto LABEL_234;
          }
          if (SHIBYTE(v31[3].__r_.__value_.__r.__words[2]) < 0) {
            std::string::__init_copy_ctor_external(&v110, v31[3].__r_.__value_.__l.__data_, v31[3].__r_.__value_.__l.__size_);
          }
          else {
            std::string v110 = *v34;
          }
          int v75 = espresso_network_bind_buffer();
          if (SHIBYTE(v110.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v110.__r_.__value_.__l.__data_);
          }
          if (v75)
          {
LABEL_234:
            espresso_plan_get_error_info();
            v76 = &CVML_status_EspressoError;
          }
          else
          {
            v76 = &CVML_status_ok;
          }
          uint64_t v77 = *v76 + 128;
          if (v77 == 128) {
            uint64_t v32 = 8576;
          }
          else {
            uint64_t v32 = v77 | 0x2100;
          }
          a1 = v83;
          if (v32 == 128)
          {
            *(void *)&v109[0] = v31;
            *v83 = v31;
            operator new();
          }
          goto LABEL_209;
        }
        uint64_t v32 = 8574;
      }
      a1 = v83;
LABEL_209:
      *(void *)&v109[0] = 0;
      vision::mod::ImageAnalyzer_CustomClassifier::~ImageAnalyzer_CustomClassifier((vision::mod::ImageAnalyzer_CustomClassifier *)v31);
      MEMORY[0x1A62562C0]();
      goto LABEL_210;
    }
    if (SHIBYTE(v31[2].__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::__init_copy_ctor_external(&v108, v31[2].__r_.__value_.__l.__data_, v31[2].__r_.__value_.__l.__size_);
    }
    else
    {
      *(_OWORD *)&v108.__r_.__value_.__l.__data_ = *(_OWORD *)&v79->__r_.__value_.__l.__data_;
      v108.__r_.__value_.__r.__words[2] = v31[2].__r_.__value_.__r.__words[2];
    }
    a1 = v83;
    if (SHIBYTE(v31[3].__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&v107, v31[3].__r_.__value_.__l.__data_, v31[3].__r_.__value_.__l.__size_);
    }
    else {
      std::string v107 = *v34;
    }
    std::string::size_type v64 = HIBYTE(v108.__r_.__value_.__r.__words[2]);
    if ((v108.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      std::string::size_type v64 = v108.__r_.__value_.__l.__size_;
    }
    if (!v64) {
      goto LABEL_181;
    }
    std::string::size_type v65 = HIBYTE(v107.__r_.__value_.__r.__words[2]);
    if ((v107.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      std::string::size_type v65 = v107.__r_.__value_.__l.__size_;
    }
    if (v65)
    {
      uint64_t context = espresso_create_context();
      v31[9].__r_.__value_.__l.__size_ = context;
      if (context)
      {
        uint64_t plan = espresso_create_plan();
        v31[9].__r_.__value_.__r.__words[2] = plan;
        if (plan)
        {
          if (!espresso_plan_add_network()
            && !espresso_network_declare_input()
            && !espresso_network_declare_output()
            && !espresso_plan_build())
          {
            v68 = &CVML_status_ok;
            goto LABEL_187;
          }
          espresso_plan_get_error_info();
        }
      }
      v68 = &CVML_status_EspressoError;
    }
    else
    {
LABEL_181:
      v68 = &CVML_status_missingOption;
    }
LABEL_187:
    uint64_t v69 = *v68;
    if (SHIBYTE(v107.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v107.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v108.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v108.__r_.__value_.__l.__data_);
    }
    char v63 = HIBYTE(v110.__r_.__value_.__r.__words[2]);
    uint64_t v32 = (v69 + 128) | 0x2100;
    goto LABEL_192;
  }
  if (a4)
  {
    *a4 = +[VNError errorForInvalidModelWithLocalizedDescription:@"custom classifier descriptor not provided"];
    id v7 = 0;
  }
  *a1 = 0;
  a1[1] = 0;
LABEL_215:
}

- (id)allSignificantEventIdentifiersWithOptions:(id)a3 error:(id *)a4
{
  [(VNImageAnalyzerMultiDetector *)&v6 _VNdGg5skzXHSAENO6T3enHECustomClassifierForOriginatingRequestSpecifier:a4];
  if (v6)
  {
    v4 = _knownIdentifiersForCustomClassifier(*(vision::mod::ImageAnalyzer_CustomClassifier **)(v6 + 312), *(long long **)(v6 + 320));
  }
  else
  {
    v4 = 0;
  }
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v7);
  }

  return v4;
}

- (void)_VNdGg5skzXHSAENO6T3enHECustomClassifierForOriginatingRequestSpecifier:(void *)a3
{
  if (!a2)
  {
    *a1 = 0;
    a1[1] = 0;
    return;
  }
  uint64_t v5 = *(void *)(a2 + 232);
  if (v5) {
    goto LABEL_12;
  }
  id v7 = [*(id *)(a2 + 80) VNdGg5skzXHSAENO6T3enHECustomClassifierDescriptor];
  [(VNImageAnalyzerMultiDetector *)&v12 _loadCustomClassifierWithDescriptor:v7 error:a3];

  v8 = v12;
  if (v12)
  {
    v9 = v13;
    if (v13) {
      atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v10 = *(std::__shared_weak_count **)(a2 + 240);
    *(void *)(a2 + 232) = v8;
    *(void *)(a2 + 240) = v9;
    if (v10) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v10);
    }
    if (!v9) {
      goto LABEL_10;
    }
  }
  else
  {
    *a1 = 0;
    a1[1] = 0;
    v9 = v13;
    if (!v13) {
      goto LABEL_10;
    }
  }
  std::__shared_weak_count::__release_shared[abi:nn180100](v9);
LABEL_10:
  if (!v8) {
    return;
  }
  uint64_t v5 = *(void *)(a2 + 232);
LABEL_12:
  uint64_t v11 = *(void *)(a2 + 240);
  *a1 = v5;
  a1[1] = v11;
  if (v11) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v11 + 8), 1uLL, memory_order_relaxed);
  }
}

- (id)allVN5kJNH3eYuyaLxNpZr5Z7ziIdentifiersWithOptions:(id)a3 error:(id *)a4
{
  [(VNImageAnalyzerMultiDetector *)&v6 _VN5kJNH3eYuyaLxNpZr5Z7ziCustomClassifierAndReturnError:a4];
  if (v6)
  {
    v4 = _knownIdentifiersForCustomClassifier(*(vision::mod::ImageAnalyzer_CustomClassifier **)(v6 + 312), *(long long **)(v6 + 320));
  }
  else
  {
    v4 = 0;
  }
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v7);
  }

  return v4;
}

- (void)_VN5kJNH3eYuyaLxNpZr5Z7ziCustomClassifierAndReturnError:(void *)a3
{
  if (!a2)
  {
    *a1 = 0;
    a1[1] = 0;
    return;
  }
  uint64_t v5 = *(void *)(a2 + 216);
  if (v5) {
    goto LABEL_12;
  }
  id v7 = [*(id *)(a2 + 80) VN5kJNH3eYuyaLxNpZr5Z7ziCustomClassifierDescriptor];
  [(VNImageAnalyzerMultiDetector *)&v12 _loadCustomClassifierWithDescriptor:v7 error:a3];

  v8 = v12;
  if (v12)
  {
    v9 = v13;
    if (v13) {
      atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v10 = *(std::__shared_weak_count **)(a2 + 224);
    *(void *)(a2 + 216) = v8;
    *(void *)(a2 + 224) = v9;
    if (v10) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v10);
    }
    if (!v9) {
      goto LABEL_10;
    }
  }
  else
  {
    *a1 = 0;
    a1[1] = 0;
    v9 = v13;
    if (!v13) {
      goto LABEL_10;
    }
  }
  std::__shared_weak_count::__release_shared[abi:nn180100](v9);
LABEL_10:
  if (!v8) {
    return;
  }
  uint64_t v5 = *(void *)(a2 + 216);
LABEL_12:
  uint64_t v11 = *(void *)(a2 + 224);
  *a1 = v5;
  a1[1] = v11;
  if (v11) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v11 + 8), 1uLL, memory_order_relaxed);
  }
}

- (id)allRecognizedObjectsIdentifiersWithOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[VNValidationUtilities requiredObjectOfClass:objc_opt_class() forKey:@"VNImageAnalyzerMultiDetectorOption_RecognizeObjectsConfiguration" inOptions:v6 error:a4];
  v8 = v7;
  if (v7)
  {
    v9 = [v7 observationsRecipient];
    v10 = [v9 originatingRequestSpecifier];

    LabelsList = (long long **)vision::mod::ImageAnalyzer::getLabelsList((uint64_t)self->_imageAnalyzer.__ptr_, [v8 labelsListType]);
    memset(&v53, 0, sizeof(v53));
    std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>((std::string *)&v53, *LabelsList, LabelsList[1], 0xAAAAAAAAAAAAAAABLL * (((char *)LabelsList[1] - (char *)*LabelsList) >> 3));
    if (objc_msgSend(v10, "specifiesRequestClass:withAnyRevision:", objc_opt_class(), 1, 3737841667, 0))
    {
      std::vector<std::string>::pointer begin = v53.__begin_;
      end = v53.__end_;
      if (v53.__begin_ == v53.__end_)
      {
        std::vector<std::string>::pointer v14 = v53.__begin_;
      }
      else
      {
        std::vector<std::string>::pointer v14 = v53.__begin_;
        while (1)
        {
          std::string::size_type size = HIBYTE(v14->__r_.__value_.__r.__words[2]);
          int v16 = (char)size;
          if ((size & 0x80u) != 0) {
            std::string::size_type size = v14->__r_.__value_.__l.__size_;
          }
          if (size == 5)
          {
            std::vector<std::string>::pointer v17 = v16 >= 0 ? v14 : (std::vector<std::string>::pointer)v14->__r_.__value_.__r.__words[0];
            int data = (int)v17->__r_.__value_.__l.__data_;
            int v19 = v17->__r_.__value_.__s.__data_[4];
            if (data == 1769304678 && v19 == 116) {
              break;
            }
          }
          if (++v14 == v53.__end_)
          {
            std::vector<std::string>::pointer v14 = v53.__end_;
            break;
          }
        }
      }
      if (v14 != v53.__end_)
      {
        std::string::basic_string[abi:ne180100]<0>(__p, "vegetables");
        std::vector<std::string>::pointer v22 = v53.__end_;
        if (v53.__end_ >= v53.__end_cap_.__value_)
        {
          unint64_t v24 = 0xAAAAAAAAAAAAAAABLL * (((char *)v53.__end_ - (char *)v53.__begin_) >> 3);
          unint64_t v25 = v24 + 1;
          if (v24 + 1 > 0xAAAAAAAAAAAAAAALL) {
            std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
          }
          if (0x5555555555555556 * (((char *)v53.__end_cap_.__value_ - (char *)v53.__begin_) >> 3) > v25) {
            unint64_t v25 = 0x5555555555555556 * (((char *)v53.__end_cap_.__value_ - (char *)v53.__begin_) >> 3);
          }
          if (0xAAAAAAAAAAAAAAABLL * (((char *)v53.__end_cap_.__value_ - (char *)v53.__begin_) >> 3) >= 0x555555555555555) {
            unint64_t v26 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v26 = v25;
          }
          __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v53.__end_cap_;
          if (v26) {
            unint64_t v26 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<CGPoint>>>(v26);
          }
          else {
            uint64_t v27 = 0;
          }
          std::string::value_type v28 = (std::string *)(v26 + 24 * v24);
          __v.__first_ = (std::__split_buffer<std::string>::pointer)v26;
          __v.__begin_ = v28;
          __v.__end_cap_.__value_ = (std::string *)(v26 + 24 * v27);
          long long v29 = *(_OWORD *)__p;
          v28->__r_.__value_.__r.__words[2] = v52;
          *(_OWORD *)&v28->__r_.__value_.__l.__data_ = v29;
          __p[1] = 0;
          std::string::size_type v52 = 0;
          __p[0] = 0;
          __v.__end_ = v28 + 1;
          std::vector<std::string>::__swap_out_circular_buffer(&v53, &__v);
          end = v53.__end_;
          std::__split_buffer<std::string>::~__split_buffer(&__v);
          v53.__end_ = end;
          if (SHIBYTE(v52) < 0)
          {
            operator delete(__p[0]);
            end = v53.__end_;
          }
        }
        else
        {
          long long v23 = *(_OWORD *)__p;
          v53.__end_->__r_.__value_.__r.__words[2] = v52;
          *(_OWORD *)&v22->__r_.__value_.__l.__data_ = v23;
          end = v22 + 1;
          v53.__end_ = v22 + 1;
        }
        std::vector<std::string>::pointer begin = v53.__begin_;
      }
      std::vector<std::string>::pointer v30 = begin;
      if (begin != end)
      {
        std::vector<std::string>::pointer v30 = begin;
        while (1)
        {
          std::string::size_type v31 = HIBYTE(v30->__r_.__value_.__r.__words[2]);
          int v32 = (char)v31;
          if ((v31 & 0x80u) != 0) {
            std::string::size_type v31 = v30->__r_.__value_.__l.__size_;
          }
          if (v31 == 4)
          {
            v33 = v32 >= 0 ? v30 : (_DWORD *)v30->__r_.__value_.__r.__words[0];
            if (*v33 == 1752394086) {
              break;
            }
          }
          if (++v30 == end)
          {
            std::vector<std::string>::pointer v30 = end;
            break;
          }
        }
      }
      if (v30 != end)
      {
        std::string::basic_string[abi:ne180100]<0>(__p, "seafood");
        std::vector<std::string>::pointer v34 = v53.__end_;
        if (v53.__end_ >= v53.__end_cap_.__value_)
        {
          unint64_t v36 = 0xAAAAAAAAAAAAAAABLL * (((char *)v53.__end_ - (char *)v53.__begin_) >> 3);
          unint64_t v37 = v36 + 1;
          if (v36 + 1 > 0xAAAAAAAAAAAAAAALL) {
            std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
          }
          if (0x5555555555555556 * (((char *)v53.__end_cap_.__value_ - (char *)v53.__begin_) >> 3) > v37) {
            unint64_t v37 = 0x5555555555555556 * (((char *)v53.__end_cap_.__value_ - (char *)v53.__begin_) >> 3);
          }
          if (0xAAAAAAAAAAAAAAABLL * (((char *)v53.__end_cap_.__value_ - (char *)v53.__begin_) >> 3) >= 0x555555555555555) {
            unint64_t v38 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v38 = v37;
          }
          __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v53.__end_cap_;
          if (v38) {
            unint64_t v38 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<CGPoint>>>(v38);
          }
          else {
            uint64_t v39 = 0;
          }
          v40 = (std::string *)(v38 + 24 * v36);
          __v.__first_ = (std::__split_buffer<std::string>::pointer)v38;
          __v.__begin_ = v40;
          __v.__end_cap_.__value_ = (std::string *)(v38 + 24 * v39);
          long long v41 = *(_OWORD *)__p;
          v40->__r_.__value_.__r.__words[2] = v52;
          *(_OWORD *)&v40->__r_.__value_.__l.__data_ = v41;
          __p[1] = 0;
          std::string::size_type v52 = 0;
          __p[0] = 0;
          __v.__end_ = v40 + 1;
          std::vector<std::string>::__swap_out_circular_buffer(&v53, &__v);
          v42 = v53.__end_;
          std::__split_buffer<std::string>::~__split_buffer(&__v);
          v53.__end_ = v42;
          if (SHIBYTE(v52) < 0) {
            operator delete(__p[0]);
          }
        }
        else
        {
          long long v35 = *(_OWORD *)__p;
          v53.__end_->__r_.__value_.__r.__words[2] = v52;
          *(_OWORD *)&v34->__r_.__value_.__l.__data_ = v35;
          v53.__end_ = v34 + 1;
        }
      }
    }
    uint64_t v43 = [v8 disallowedList];
    id v44 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v21 = (void *)[v44 initWithCapacity:0xAAAAAAAAAAAAAAABLL * (((char *)v53.__end_ - (char *)v53.__begin_) >> 3)];
    std::vector<std::string>::pointer v45 = v53.__begin_;
    for (std::vector<std::string>::pointer i = v53.__end_; v45 != i; ++v45)
    {
      id v47 = [NSString alloc];
      std::vector<std::string>::pointer v48 = v45;
      if (SHIBYTE(v45->__r_.__value_.__r.__words[2]) < 0) {
        std::vector<std::string>::pointer v48 = (std::vector<std::string>::pointer)v45->__r_.__value_.__r.__words[0];
      }
      uint64_t v49 = (NSString *)[v47 initWithUTF8String:v48];
      if (_isAcceptableClassificationIdentifier(v49, v43)) {
        [v21 addObject:v49];
      }
    }
    __v.__first_ = (std::__split_buffer<std::string>::pointer)&v53;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)allJunkIdentifiersForOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [(VNImageAnalyzerMultiDetector *)&v15 _junkCustomClassifiersAndReturnError:a4];
  id v7 = v15;
  if (v15)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v9 = *v7;
    v10 = v7[1];
    if (*v7 != v10)
    {
      do
      {
        uint64_t v11 = *v9;
        v12 = (std::__shared_weak_count *)v9[1];
        if (v12) {
          atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        int v13 = _knownIdentifiersForCustomClassifier(*(vision::mod::ImageAnalyzer_CustomClassifier **)(v11 + 312), *(long long **)(v11 + 320));
        [v8 addObjectsFromArray:v13];

        if (v12) {
          std::__shared_weak_count::__release_shared[abi:nn180100](v12);
        }
        v9 += 2;
      }
      while (v9 != v10);
    }
  }
  else
  {
    id v8 = 0;
  }
  if (v16) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v16);
  }

  return v8;
}

- (void)_junkCustomClassifiersAndReturnError:(void *)a3
{
  if (!a2)
  {
    *a1 = 0;
    a1[1] = 0;
    return;
  }
  uint64_t v5 = *(void *)(a2 + 160);
  if (v5) {
    goto LABEL_3;
  }
  id v8 = [*(id *)(a2 + 80) junkLeafCustomClassifierDescriptor];
  [(VNImageAnalyzerMultiDetector *)(std::string **)&v15 _loadCustomClassifierWithDescriptor:v8 error:a3];

  if ((void)v15)
  {
    v9 = [*(id *)(a2 + 80) junkHierarchicalCustomClassifierDescriptor];
    [(VNImageAnalyzerMultiDetector *)(std::string **)&v14 _loadCustomClassifierWithDescriptor:v9 error:a3];

    if ((void)v14)
    {
      v10 = operator new(0x30uLL);
      v10[1] = 0;
      v10[2] = 0;
      void *v10 = &unk_1EF753BD0;
      v10[3] = 0;
      uint64_t v11 = (uint64_t)(v10 + 3);
      v10[4] = 0;
      v10[5] = 0;
      v12 = *(std::__shared_weak_count **)(a2 + 168);
      *(void *)(a2 + 160) = v10 + 3;
      *(void *)(a2 + 168) = v10;
      if (v12)
      {
        std::__shared_weak_count::__release_shared[abi:nn180100](v12);
        uint64_t v11 = *(void *)(a2 + 160);
      }
      std::vector<std::shared_ptr<vision::mod::ImageAnalyzer_CustomClassifier>>::push_back[abi:ne180100](v11, &v15);
      std::vector<std::shared_ptr<vision::mod::ImageAnalyzer_CustomClassifier>>::push_back[abi:ne180100](*(void *)(a2 + 160), &v14);
      int v13 = 0;
    }
    else
    {
      *a1 = 0;
      a1[1] = 0;
      int v13 = 1;
    }
    if (*((void *)&v14 + 1)) {
      std::__shared_weak_count::__release_shared[abi:nn180100](*((std::__shared_weak_count **)&v14 + 1));
    }
  }
  else
  {
    *a1 = 0;
    a1[1] = 0;
    int v13 = 1;
  }
  if (*((void *)&v15 + 1)) {
    std::__shared_weak_count::__release_shared[abi:nn180100](*((std::__shared_weak_count **)&v15 + 1));
  }
  if (!v13)
  {
    uint64_t v5 = *(void *)(a2 + 160);
LABEL_3:
    uint64_t v6 = *(void *)(a2 + 168);
    *a1 = v5;
    a1[1] = v6;
    if (v6) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
    }
  }
}

- (id)sceneLabelOperationPointsForOriginatingRequestSpecifier:(id)a3 error:(id *)a4
{
  v4 = [(_VNImageAnalyzerMultiDetectorSceneOperationPointsCache *)self->_operationPointsCache sceneLabelOperationPointsForOriginatingRequestSpecifier:a3 error:a4];

  return v4;
}

- (id)allSceneIdentifiersWithOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x3032000000;
  std::string::size_type v57 = __Block_byref_object_copy__27394;
  long long v58 = __Block_byref_object_dispose__27395;
  id v59 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__VNImageAnalyzerMultiDetector_allSceneIdentifiersWithOptions_error___block_invoke;
  aBlock[3] = &unk_1E5B1ECE0;
  std::vector<std::string> v53 = &v54;
  id v8 = v7;
  id v52 = v8;
  v9 = (void (**)(void *, void *))_Block_copy(aBlock);
  v10 = [v6 objectForKeyedSubscript:@"VNImageAnalyzerMultiDetectorOption_SceneConfigurations"];
  uint64_t v11 = [v6 objectForKeyedSubscript:@"VNImageAnalyzerMultiDetectorOption_EntityNetConfiguration"];
  v12 = v11;
  if (v10)
  {
    if (!+[VNValidationUtilities validateArray:v10 named:@"VNImageAnalyzerMultiDetectorOption_SceneConfigurations" hasElementsOfClass:objc_opt_class() requiredMinimumCount:1 allowedMaximumCount:1 error:a4])
    {
      id v42 = 0;
      goto LABEL_49;
    }
    id v47 = v12;
    v46 = [v10 firstObject];
    uint64_t v13 = [v46 disallowedList];
    long long v14 = (void *)v55[5];
    v55[5] = v13;

    unsigned int v45 = [v46 labelsListType];
    ptr = self->_defaultSceneClassificationHierarchicalModel.__ptr_;
    *(_OWORD *)__p = 0u;
    long long v49 = 0u;
    int v50 = 1065353216;
    for (std::vector<std::string>::pointer i = (uint64_t *)*((void *)ptr->var0 + 2); i; std::vector<std::string>::pointer i = (uint64_t *)*i)
    {
      if (*((char *)i + 39) < 0) {
        std::string::__init_copy_ctor_external(&v60, (const std::string::value_type *)i[2], i[3]);
      }
      else {
        std::string v60 = *(std::string *)(i + 2);
      }
      uint64_t v17 = i[5];
      uint64_t v61 = v17;
      if (*(_DWORD *)(v17 + 84) != 1 && *(void *)(v17 + 64) != *(void *)(v17 + 56))
      {
        int64_t size = HIBYTE(v60.__r_.__value_.__r.__words[2]);
        if ((v60.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        {
          int v19 = &v60;
        }
        else
        {
          int64_t size = v60.__r_.__value_.__l.__size_;
          int v19 = (std::string *)v60.__r_.__value_.__r.__words[0];
        }
        if (size >= 13)
        {
          v20 = (std::string *)((char *)v19 + size);
          v21 = v19;
          do
          {
            std::vector<std::string>::pointer v22 = (std::string *)memchr(v21, 67, size - 12);
            if (!v22) {
              break;
            }
            if (v22->__r_.__value_.__r.__words[0] == 0x4B4E555F4C4D5643
              && *(std::string::size_type *)((char *)v22->__r_.__value_.__r.__words + 5) == 0x5F4E574F4E4B4E55)
            {
              if (v22 != v20 && v22 == v19) {
                goto LABEL_24;
              }
              break;
            }
            v21 = (std::string *)((char *)&v22->__r_.__value_.__l.__data_ + 1);
            int64_t size = (char *)v20 - (char *)v21;
          }
          while ((char *)v20 - (char *)v21 >= 13);
        }
        std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__emplace_unique_key_args<std::string,std::string const&>((uint64_t)__p, (unsigned __int8 *)&v60, (uint64_t)&v60);
      }
LABEL_24:
      if (SHIBYTE(v60.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v60.__r_.__value_.__l.__data_);
      }
    }
    LabelsList = vision::mod::ImageAnalyzer::getLabelsList((uint64_t)self->_imageAnalyzer.__ptr_, v45);
    DisallowedLabels = vision::mod::ImageAnalyzer::getDisallowedLabels((uint64_t)self->_imageAnalyzer.__ptr_, v45);
    uint64_t v27 = (unsigned __int8 *)*LabelsList;
    unint64_t v26 = (unsigned __int8 *)LabelsList[1];
    if ((unsigned __int8 *)*LabelsList != v26)
    {
      std::string::value_type v28 = DisallowedLabels;
      do
      {
        if (!std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v28, v27))std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__emplace_unique_key_args<std::string,std::string const&>((uint64_t)__p, v27, (uint64_t)v27); {
        v27 += 24;
        }
      }
      while (v27 != v26);
    }
    long long v29 = (uint64_t *)v49;
    if ((void)v49)
    {
      do
      {
        id v30 = [NSString alloc];
        std::string::size_type v31 = v29 + 2;
        if (*((char *)v29 + 39) < 0) {
          std::string::size_type v31 = (void *)*v31;
        }
        int v32 = (void *)[v30 initWithUTF8String:v31];
        v9[2](v9, v32);

        long long v29 = (uint64_t *)*v29;
      }
      while (v29);
      v33 = (void **)v49;
    }
    else
    {
      v33 = 0;
    }
    std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__deallocate_node(v33);
    uint64_t v43 = __p[0];
    __p[0] = 0;
    if (v43) {
      operator delete(v43);
    }
  }
  else
  {
    id v47 = v11;
    if (v11)
    {
      uint64_t v34 = [v11 disallowedList];
      long long v35 = (void *)v55[5];
      v55[5] = v34;

      unint64_t v36 = vision::mod::ImageAnalyzer::getLabelsList((uint64_t)self->_imageAnalyzer.__ptr_, [v47 labelsListType]);
      uint64_t v37 = *v36;
      uint64_t v38 = v36[1];
      if (*v36 != v38)
      {
        do
        {
          id v39 = [NSString alloc];
          uint64_t v40 = v37;
          if (*(char *)(v37 + 23) < 0) {
            uint64_t v40 = *(void *)v37;
          }
          long long v41 = (void *)[v39 initWithUTF8String:v40];
          v9[2](v9, v41);

          v37 += 24;
        }
        while (v37 != v38);
      }
    }
  }
  v12 = v47;
  [v8 sortUsingSelector:sel_compare_];
  id v42 = v8;
LABEL_49:

  _Block_object_dispose(&v54, 8);

  return v42;
}

void __69__VNImageAnalyzerMultiDetector_allSceneIdentifiersWithOptions_error___block_invoke(uint64_t a1, void *a2)
{
  v3 = a2;
  if (_isAcceptableClassificationIdentifier(v3, *(VNDisallowedList **)(*(void *)(*(void *)(a1 + 40) + 8) + 40)))[*(id *)(a1 + 32) addObject:v3]; {
}
  }

- (BOOL)hasSliderNet
{
  return *((void *)self->_imageAnalyzer.__ptr_ + 43) != *((void *)self->_imageAnalyzer.__ptr_ + 42);
}

- (BOOL)hasObjDetNet
{
  ptr = self->_imageAnalyzer.__ptr_;
  if (*((char *)ptr + 415) < 0) {
    uint64_t v3 = *((void *)ptr + 50);
  }
  else {
    uint64_t v3 = *((unsigned __int8 *)ptr + 415);
  }
  return v3 != 0;
}

- (id)_processFullImagePixelBuffer:(const __CVBuffer *)a3 options:(id)a4 regionOfInterest:(CGRect)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  std::vector<std::string> v53 = a3;
  id v17 = a4;
  id v47 = a7;
  std::vector<std::string>::pointer v48 = [(VNDetector *)self validatedImageBufferFromOptions:v17 error:a8];
  if (v48)
  {
    uint64_t v38 = [v17 objectForKeyedSubscript:@"VNImageAnalyzerMultiDetectorOption_SceneConfigurations"];
    uint64_t v37 = [v17 objectForKeyedSubscript:@"VNImageAnalyzerMultiDetectorOption_EntityNetConfiguration"];
    unint64_t v36 = [v17 objectForKeyedSubscript:@"VNImageAnalyzerMultiDetectorOption_SceneprintConfigurations"];
    long long v35 = [v17 objectForKeyedSubscript:@"VNImageAnalyzerMultiDetectorOption_CompressedSceneprintConfiguration"];
    uint64_t v34 = [v17 objectForKeyedSubscript:@"VNImageAnalyzerMultiDetectorOption_AestheticsConfiguration"];
    uint64_t v40 = [v17 objectForKeyedSubscript:@"VNImageAnalyzerMultiDetectorOption_SaliencyAConfiguration"];
    id v39 = [v17 objectForKeyedSubscript:@"VNImageAnalyzerMultiDetectorOption_SaliencyOConfiguration"];
    long long v41 = [v17 objectForKeyedSubscript:@"VNImageAnalyzerMultiDetectorOption_RecognizeObjectsConfiguration"];
    id v42 = [v17 objectForKeyedSubscript:@"VNImageAnalyzerMultiDetectorOption_VN1JC7R3k4455fKQz0dY1VhQConfiguration"];
    uint64_t v43 = [v17 objectForKeyedSubscript:@"VNImageAnalyzerMultiDetectorOption_ImageFingerprintsConfiguration"];
    id v44 = [v17 objectForKeyedSubscript:@"VNImageAnalyzerMultiDetectorOption_JunkConfiguration"];
    unsigned int v45 = [v17 objectForKeyedSubscript:@"VNImageAnalyzerMultiDetectorOption_VNVYvzEtX1JlUdu8xx5qhDIConfiguration"];
    v46 = [v17 objectForKeyedSubscript:@"VNImageAnalyzerMultiDetectorOption_PotentialLandmarkConfiguration"];
    id v18 = [v17 objectForKeyedSubscript:@"VNImageAnalyzerMultiDetectorOption_VN5kJNH3eYuyaLxNpZr5Z7ziConfiguration"];
    int v19 = [v17 objectForKeyedSubscript:@"VNImageAnalyzerMultiDetectorOption_VN6Mb1ME89lyW3HpahkEygIGConfiguration"];
    v20 = [v17 objectForKeyedSubscript:@"VNImageAnalyzerMultiDetectorOption_CityNatureGatingConfiguration"];
    v21 = [v17 objectForKeyedSubscript:@"VNImageAnalyzerMultiDetectorProcessingOption_TilingIsRequired"];
    int v22 = [v21 BOOLValue];

    unint64_t v23 = [v48 width];
    unint64_t v24 = [v48 height];
    if (v22) {
      unint64_t v25 = 0;
    }
    else {
      unint64_t v25 = v38;
    }
    -[VNImageAnalyzerMultiDetector _observationsForScenes:entityNet:junk:VNVYvzEtX1JlUdu8xx5qhDI:landmark:sceneprints:compressedSceneprint:fingerprints:aesthetics:saliencyA:saliencyO:recognizeObjects:VN5kJNH3eYuyaLxNpZr5Z7zi:VNdGg5skzXHSAENO6T3enHE:cityNatureGating:photosAdjustments:pixelBuffer:withOptions:originalImageSize:regionOfInterest:qosClass:warningRecorder:error:]((uint64_t)self, v25, v37, v44, v45, v46, v36, v35, (double)v23, (double)v24, x, y, width, height, v43, v34, v40, v39, v41,
      v18,
      v19,
      v20,
      v42,
      (uint64_t)&v53,
      v17,
      a6,
      v47,
    unint64_t v26 = a8);
    uint64_t v27 = v26;
    if (v26)
    {
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v28 = v26;
      uint64_t v29 = [v28 countByEnumeratingWithState:&v49 objects:v54 count:16];
      if (v29)
      {
        uint64_t v30 = *(void *)v50;
        do
        {
          for (uint64_t i = 0; i != v29; ++i)
          {
            if (*(void *)v50 != v30) {
              objc_enumerationMutation(v28);
            }
            [(VNDetector *)self recordImageCropQuickLookInfoFromOptions:v17 toObservation:*(void *)(*((void *)&v49 + 1) + 8 * i)];
          }
          uint64_t v29 = [v28 countByEnumeratingWithState:&v49 objects:v54 count:16];
        }
        while (v29);
      }

      int v32 = (void *)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      int v32 = 0;
    }
  }
  else
  {
    int v32 = 0;
  }

  return v32;
}

- (id)_observationsForScenes:(void *)a3 entityNet:(void *)a4 junk:(void *)a5 VNVYvzEtX1JlUdu8xx5qhDI:(void *)a6 landmark:(void *)a7 sceneprints:(void *)a8 compressedSceneprint:(double)a9 fingerprints:(double)a10 aesthetics:(double)a11 saliencyA:(double)a12 saliencyO:(double)a13 recognizeObjects:(double)a14 VN5kJNH3eYuyaLxNpZr5Z7zi:(void *)a15 VNdGg5skzXHSAENO6T3enHE:(void *)a16 cityNatureGating:(void *)a17 photosAdjustments:(void *)a18 pixelBuffer:(void *)a19 withOptions:(void *)a20 originalImageSize:(void *)a21 regionOfInterest:(void *)a22 qosClass:(void *)a23 warningRecorder:(uint64_t)a24 error:(void *)a25
{
  uint64_t v341 = *MEMORY[0x1E4F143B8];
  id v283 = a2;
  id v282 = a3;
  id v281 = a4;
  id v280 = a5;
  id v270 = a6;
  id v284 = a7;
  id v34 = a8;
  id v35 = a15;
  id v36 = a16;
  id v37 = a17;
  id v38 = a18;
  id v39 = a19;
  id v40 = a20;
  id v41 = a21;
  id v42 = a22;
  id v43 = a23;
  id v264 = a25;
  id v257 = a27;
  v258 = v38;
  v265 = v35;
  v266 = v34;
  v263 = v36;
  v259 = v37;
  v255 = v40;
  v256 = v39;
  v253 = v42;
  v254 = v41;
  v252 = v43;
  if (!a1) {
    goto LABEL_60;
  }
  int v44 = -[VNImageAnalyzerMultiDetector _analysisTypeForScenes:entityNet:junk:VNVYvzEtX1JlUdu8xx5qhDI:landmark:sceneprints:compressedSceneprint:fingerprints:aesthetics:saliencyA:saliencyO:recognizeObjects:VN5kJNH3eYuyaLxNpZr5Z7zi:VNdGg5skzXHSAENO6T3enHE:cityNatureGating:photosAdjustments:](v283, v282, v281, v280, v270, v284, v34, v35, v36, v37, v38, v39, v40, v41, v42, v43);
  if (!v44)
  {
    id v88 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_313;
  }
  if (-[VNImageAnalyzerMultiDetector _performAnalysis:pixelBuffer:error:](a1, v44, a24, (uint64_t)a28))
  {
    id v249 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v45 = [v284 count];
    if (v34 || v45)
    {
      id v46 = v284;
      id v241 = v34;
      id v239 = v264;
      id v250 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      vision::mod::ImageAnalyzer::getSceneRepresentation((vision::mod::ImageAnalyzer *)&v337, *(void *)(a1 + 112));
      vision::mod::ImageAnalyzer_Tensor1D<float>::getVectorFromTensor(&__p, (unint64_t *)&v337);
      vision::mod::ImageAnalyzer_Tensor1D<float>::~ImageAnalyzer_Tensor1D((uint64_t)&v337);
      memset(v332, 0, sizeof(v332));
      long long v333 = 0u;
      long long v334 = 0u;
      id obj = v46;
      uint64_t v47 = [obj countByEnumeratingWithState:v332 objects:&v337 count:16];
      if (!v47) {
        goto LABEL_36;
      }
      id v275 = **(id **)&v332[1];
LABEL_8:
      uint64_t v48 = 0;
      uint64_t v271 = v47;
      while (1)
      {
        if (**(id **)&v332[1] != v275) {
          objc_enumerationMutation(obj);
        }
        long long v49 = *(void **)(*((void *)&v332[0] + 1) + 8 * v48);
        v285 = [v49 observationsRecipient];
        long long v50 = [v285 originatingRequestSpecifier];
        [v50 requestClassCode];
        [v50 requestRevision];
        kdebug_trace();
        long long v51 = v320;
        long long v52 = __p;
        id v53 = objc_alloc(MEMORY[0x1E4F1C9B8]);
        uint64_t v54 = (void *)[v53 initWithBytes:__p length:v51 - v52];
        uint64_t v55 = v285;
        if (v54) {
          break;
        }
        int v70 = 1;
LABEL_33:

        if (v70)
        {

          goto LABEL_62;
        }
        if (++v48 == v271)
        {
          uint64_t v47 = [obj countByEnumeratingWithState:v332 objects:&v337 count:16];
          if (v47) {
            goto LABEL_8;
          }
LABEL_36:

          if (!v241)
          {
            id v88 = v250;
            goto LABEL_63;
          }
          int v75 = [v241 observationsRecipient];
          v76 = [v75 originatingRequestSpecifier];
          [v76 requestClassCode];
          uint64_t v77 = [v76 requestRevision];
          kdebug_trace();
          if (v77 != 3737841666)
          {
            if (a28)
            {
              *a28 = +[VNError errorForUnsupportedRevision:v77 ofRequestClass:objc_opt_class()];
            }
            goto LABEL_343;
          }
          uint64_t v78 = *(void *)(a1 + 176);
          if (v78) {
            goto LABEL_339;
          }
          v79 = [*(id *)(a1 + 80) pca256FileURL];
          id v80 = [v79 VisionCoreFileSystemPathAndReturnError:0];
          v81 = v80;
          if (!v80)
          {
            if (a28)
            {
              v225 = (void *)[[NSString alloc] initWithFormat:@"unable to locate %@", @"pca256"];
              *a28 = +[VNError errorForInvalidOperationWithLocalizedDescription:v225];
            }
            v83 = 0;
            goto LABEL_336;
          }
          std::string::basic_string[abi:ne180100]<0>(v324, (char *)[v80 UTF8String]);
          std::string::basic_string[abi:ne180100]<0>(v322, (char *)[@"pca256" UTF8String]);
          v327 = 0;
          id v326 = 0;
          uint64_t v328 = 0;
          if (v325 >= 0) {
            v82 = v324;
          }
          else {
            v82 = (void **)v324[0];
          }
          v83 = fopen((const char *)v82, "rb");
          if (!v83)
          {
            uint64_t v84 = 8565;
            goto LABEL_327;
          }
          LODWORD(v317[0]) = 0;
          std::string::basic_string[abi:ne180100]<0>(&v329, "origDim");
          uint64_t v84 = vision::mod::_readBinSerializerBlob(v83, &v329, (float *)v317, 1);
          if (SHIBYTE(v329.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v329.__r_.__value_.__l.__data_);
          }
          if (v84 == 128)
          {
            unint64_t v85 = (unint64_t)*(float *)v317;
            if (!(unint64_t)*(float *)v317) {
              goto LABEL_325;
            }
            std::string::basic_string[abi:ne180100]<0>(&v329, "pcaDim");
            uint64_t v84 = vision::mod::_readBinSerializerBlob(v83, &v329, (float *)v317, 1);
            if (SHIBYTE(v329.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v329.__r_.__value_.__l.__data_);
            }
            if (v84 == 128)
            {
              unint64_t v86 = (unint64_t)*(float *)v317;
              if ((unint64_t)*(float *)v317 - 1 < v85)
              {
                std::vector<float>::resize((char **)&v326, v86 * v85);
                if (v323 >= 0) {
                  id v87 = (char *)v322;
                }
                else {
                  id v87 = (char *)v322[0];
                }
                std::string::basic_string[abi:ne180100]<0>(&v329, v87);
                uint64_t v84 = vision::mod::_readBinSerializerBlob(v83, &v329, (float *)v326, v86 * v85);
                if (SHIBYTE(v329.__r_.__value_.__r.__words[2]) < 0) {
                  operator delete(v329.__r_.__value_.__l.__data_);
                }
                if (v84 == 128)
                {
                  fclose(v83);
                  uint64_t v84 = 8576;
LABEL_323:
                  v226 = (FILE *)operator new(0x28uLL, MEMORY[0x1E4FBA2D0]);
                  v83 = v226;
                  if (v226)
                  {
                    v226->_p = 0;
                    *(void *)&v226->_r = 0;
                    *(void *)&v226->_flags = 0;
                    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v226, v326, (uint64_t)v327, ((char *)v327 - (unsigned char *)v326) >> 2);
                    v83->_bf._base = (unsigned __int8 *)v85;
                    *(void *)&v83->_bf._int64_t size = v86;
                  }
                  else
                  {
                    uint64_t v84 = 8571;
                  }
LABEL_327:
                  if (v326) {
                    operator delete(v326);
                  }
                  if (v323 < 0) {
                    operator delete(v322[0]);
                  }
                  if (v325 < 0) {
                    operator delete(v324[0]);
                  }
                  if (!v83 && a28)
                  {
                    VNErrorForCVMLStatus((id)v84);
                    *a28 = (id)objc_claimAutoreleasedReturnValue();
                  }
LABEL_336:

                  uint64_t v227 = *(void *)(a1 + 176);
                  *(void *)(a1 + 176) = v83;
                  if (v227) {
                    std::default_delete<vision::mod::ImageAnalyzer_PCA>::operator()[abi:ne180100](v227);
                  }

                  uint64_t v78 = *(void *)(a1 + 176);
                  if (v78)
                  {
LABEL_339:
                    if ((v320 - (unsigned char *)__p) >> 2 == *(void *)(v78 + 24)) {
                      operator new();
                    }
                    if (a28)
                    {
                      VNErrorForCVMLStatus((id)0x217C);
                      *a28 = (id)objc_claimAutoreleasedReturnValue();
                    }
                  }
LABEL_343:

LABEL_62:
                  id v88 = 0;
LABEL_63:
                  if (__p)
                  {
                    v320 = __p;
                    operator delete(__p);
                  }

                  if (v88)
                  {
                    [v249 addObjectsFromArray:v88];

                    goto LABEL_67;
                  }
                  goto LABEL_312;
                }
                std::vector<float>::resize((char **)&v326, 0);
LABEL_322:
                fclose(v83);
                if (v84 == 128) {
                  goto LABEL_323;
                }
LABEL_326:
                v83 = 0;
                goto LABEL_327;
              }
LABEL_325:
              uint64_t v84 = 8564;
              fclose(v83);
              goto LABEL_326;
            }
          }
          else
          {
            unint64_t v85 = 0;
          }
          unint64_t v86 = 0;
          goto LABEL_322;
        }
      }
      id v56 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      if ([v54 length])
      {
        v267 = v56;
        int v57 = [v49 includeLabelsAndConfidences];
        long long v58 = (void *)MEMORY[0x1E4F1CC08];
        if (v57)
        {
          [(VNImageAnalyzerMultiDetector *)&v326 _lastAnalysisSceneClassifications];
          id v59 = objc_alloc(MEMORY[0x1E4F1CA60]);
          std::string v60 = (long long **)v326;
          uint64_t v61 = (void *)[v59 initWithCapacity:(uint64_t)(*((void *)v326 + 1) - *(void *)v326) >> 5];
          char v63 = *v60;
          std::string::size_type v62 = v60[1];
          while (v63 != v62)
          {
            if (*((char *)v63 + 23) < 0)
            {
              std::string::__init_copy_ctor_external(&v329, *(const std::string::value_type **)v63, *((void *)v63 + 1));
            }
            else
            {
              long long v64 = *v63;
              v329.__r_.__value_.__r.__words[2] = *((void *)v63 + 2);
              *(_OWORD *)&v329.__r_.__value_.__l.__data_ = v64;
            }
            int v330 = *((_DWORD *)v63 + 6);
            char v331 = *((unsigned char *)v63 + 28);
            id v65 = [NSString alloc];
            if ((v329.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              v66 = &v329;
            }
            else {
              v66 = (std::string *)v329.__r_.__value_.__r.__words[0];
            }
            v67 = (void *)[v65 initWithUTF8String:v66];
            LODWORD(v68) = v330;
            uint64_t v69 = [NSNumber numberWithFloat:v68];
            [v61 setObject:v69 forKeyedSubscript:v67];

            if (SHIBYTE(v329.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v329.__r_.__value_.__l.__data_);
            }
            v63 += 2;
          }
          long long v58 = (void *)[v61 copy];

          if (v327) {
            std::__shared_weak_count::__release_shared[abi:nn180100](v327);
          }
        }
        v71 = [*(id *)(a1 + 80) VNSceneprintFromData:v54 labelsAndConfidences:v58 originatingRequestSpecifier:v50 error:a28];
        if (!v71)
        {

          int v70 = 1;
          id v56 = v267;
          goto LABEL_32;
        }
        int v72 = [VNSceneObservation alloc];
        v335[0] = v71;
        std::string::size_type v73 = [MEMORY[0x1E4F1C978] arrayWithObjects:v335 count:1];
        int v74 = [(VNSceneObservation *)v72 initWithOriginatingRequestSpecifier:v50 sceneprints:v73];

        [v267 addObject:v74];
        uint64_t v55 = v285;
        id v56 = v267;
      }
      kdebug_trace();
      [v55 receiveObservations:v56];
      [v250 addObjectsFromArray:v56];
      int v70 = 0;
LABEL_32:

      goto LABEL_33;
    }
LABEL_67:
    if (v265)
    {
      id v272 = v265;
      id v89 = [v272 observationsRecipient];
      v286 = v89;
      id v276 = [v89 originatingRequestSpecifier];
      [v276 requestClassCode];
      [v276 requestRevision];
      kdebug_trace();
      v327 = 0;
      id v326 = 0;
      uint64_t v328 = 0;
      uint64_t v90 = *(void *)(a1 + 112);
      LODWORD(v329.__r_.__value_.__l.__data_) = 1024;
      if (!*((unsigned char *)std::__hash_table<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,BOOL>,std::__unordered_map_hasher<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,BOOL>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::__unordered_map_equal<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,BOOL>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::allocator<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,BOOL>>>::__emplace_unique_key_args<vision::mod::ImageAnalyzer_AnalysisType,std::piecewise_construct_t const&,std::tuple<vision::mod::ImageAnalyzer_AnalysisType&&>,std::tuple<>>(v90 + 824, 0x400u, &v329)+ 20))
      {
        exception = __cxa_allocate_exception(8uLL);
        void *exception = 8574;
        __cxa_throw(exception, MEMORY[0x1E4FBA3E0], 0);
      }
      LODWORD(v329.__r_.__value_.__l.__data_) = 1024;
      std::string v91 = std::__hash_table<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,espresso_buffer_t>,std::__unordered_map_hasher<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,espresso_buffer_t>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::__unordered_map_equal<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,espresso_buffer_t>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::allocator<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,espresso_buffer_t>>>::__emplace_unique_key_args<vision::mod::ImageAnalyzer_AnalysisType,std::piecewise_construct_t const&,std::tuple<vision::mod::ImageAnalyzer_AnalysisType&&>,std::tuple<>>(v90 + 784, 0x400u, &v329);
      vision::mod::ImageAnalyzer_Tensor1D<float>::ImageAnalyzer_Tensor1D((uint64_t)&v337, (long long *)(v91 + 24), 1);
      vision::mod::ImageAnalyzer_Tensor1D<float>::getVectorFromTensor(v332, (unint64_t *)&v337);
      v324[0] = 0;
      std::vector<long long>::vector(&v329, 1uLL, v324);
      long long v92 = v332[0];
      std::string v93 = (std::__shared_weak_count *)operator new(0x90uLL);
      v93->__shared_owners_ = 0;
      v93->__shared_weak_owners_ = 0;
      v93->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EF7539A0;
      vision::mod::ImageDescriptorBufferAbstract::ImageDescriptorBufferAbstract((uint64_t)&v93[1], &v329, (void *)v92, *((void *)&v92 + 1) - v92, 1, 0);
      v93[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_1EF752918;
      LODWORD(v93[5].__shared_owners_) = 1;
      v93[5].__shared_weak_owners_ = 0;
      v93[5].__vftable = (std::__shared_weak_count_vtbl *)((*((void *)&v92 + 1) - (void)v92) >> 2);
      if ((*(uint64_t (**)(void, std::__shared_weak_count *, id *))(**(void **)(v90 + 1056) + 168))(*(void *)(v90 + 1056), v93 + 1, &v326) != 3712)
      {
        v229 = __cxa_allocate_exception(8uLL);
        void *v229 = 8574;
        __cxa_throw(v229, MEMORY[0x1E4FBA3E0], 0);
      }
      std::__shared_weak_count::__release_shared[abi:nn180100](v93);
      if (v329.__r_.__value_.__r.__words[0])
      {
        v329.__r_.__value_.__l.__size_ = v329.__r_.__value_.__r.__words[0];
        operator delete(v329.__r_.__value_.__l.__data_);
      }
      if (*(void *)&v332[0])
      {
        *((void *)&v332[0] + 1) = *(void *)&v332[0];
        operator delete(*(void **)&v332[0]);
      }
      vision::mod::ImageAnalyzer_Tensor1D<float>::~ImageAnalyzer_Tensor1D((uint64_t)&v337);
      id v94 = objc_alloc(MEMORY[0x1E4F1CA48]);
      std::string v95 = (void *)[v94 initWithCapacity:0xAAAAAAAAAAAAAAABLL * (((char *)v327 - (unsigned char *)v326) >> 3)];
      std::string v96 = (float **)v326;
      v97 = v327;
      if (v326 != v327)
      {
        do
        {
          std::string v99 = *v96;
          std::string v98 = v96[1];
          uint64_t v100 = (char *)v98 - (char *)*v96;
          if (v98 == *v96)
          {
            std::string v101 = 0;
            std::string v102 = 0;
          }
          else
          {
            if (v100 < 0) {
              std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
            }
            std::string v101 = operator new(v100 >> 2);
            std::string v102 = v101;
            do
            {
              float v103 = *v99++;
              *v102++ = (int)v103;
            }
            while (v99 != v98);
          }
          id v89 = v286;
          std::string v104 = [[VNFingerprintHash alloc] initWithBooleanBytes:v101 length:v102 - v101];
          [v95 addObject:v104];

          if (v101) {
            operator delete(v101);
          }
          v96 += 3;
        }
        while (v96 != (float **)v97);
      }
      long long v105 = [[VNImageFingerprintsObservation alloc] initWithOriginatingRequestSpecifier:v276 fingerprintHashes:v95];
      kdebug_trace();
      v329.__r_.__value_.__r.__words[0] = (std::string::size_type)v105;
      id v88 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v329 count:1];
      [v89 receiveObservations:v88];

      v337.i64[0] = (uint64_t)&v326;
      std::vector<std::vector<long long>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v337);

      if (!v88) {
        goto LABEL_312;
      }
      [v249 addObjectsFromArray:v88];
    }
    if (v283)
    {
      id v106 = v283;
      memset(v332, 0, sizeof(v332));
      long long v333 = 0u;
      long long v334 = 0u;
      id v277 = v106;
      id v107 = 0;
      uint64_t v108 = [v277 countByEnumeratingWithState:v332 objects:&v337 count:16];
      if (v108)
      {
        uint64_t v287 = **(void **)&v332[1];
        while (2)
        {
          for (uint64_t i = 0; i != v108; ++i)
          {
            if (**(void **)&v332[1] != v287) {
              objc_enumerationMutation(v277);
            }
            std::string v110 = *(void **)(*((void *)&v332[0] + 1) + 8 * i);
            v111 = [v110 observationsRecipient];
            v112 = [v111 originatingRequestSpecifier];
            [v112 requestClassCode];
            [v112 requestRevision];
            kdebug_trace();
            id v113 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            if ((-[VNImageAnalyzerMultiDetector _populateLeafSceneObservations:hierarchySceneObservations:fromLastAnalysisForSceneConfiguration:error:](a1, v113, v113, v110, a28) & 1) == 0)
            {

              v117 = 0;
              goto LABEL_100;
            }
            id v114 = &__block_literal_global_128_38097;
            [v113 sortWithOptions:16 usingComparator:&__block_literal_global_128_38097];

            kdebug_trace();
            v115 = [v110 observationsRecipient];
            [v115 receiveObservations:v113];

            if (v107)
            {
              uint64_t v116 = [v107 arrayByAddingObjectsFromArray:v113];

              id v107 = (id)v116;
            }
            else
            {
              id v107 = v113;
            }
          }
          uint64_t v108 = [v277 countByEnumeratingWithState:v332 objects:&v337 count:16];
          if (v108) {
            continue;
          }
          break;
        }
      }

      id v107 = v107;
      v117 = v107;
LABEL_100:

      if (!v117) {
        goto LABEL_311;
      }
      [v249 addObjectsFromArray:v117];
    }
    if (v282)
    {
      id v118 = v282;
      id v278 = v118;
      v288 = [v118 observationsRecipient];
      v119 = [v288 originatingRequestSpecifier];
      [v119 requestClassCode];
      [v119 requestRevision];
      kdebug_trace();
      v120 = [(id)a1 sceneLabelOperationPointsForOriginatingRequestSpecifier:v119 error:a28];
      if (v120)
      {
        v273 = [v118 disallowedList];
        [v118 minimumConfidence];
        float v122 = v121;
        v324[0] = (void *)[v118 maximumLabels];
        uint64_t v123 = *(void *)(a1 + 112);
        memset(v332, 0, sizeof(v332));
        LODWORD(v333) = 1065353216;
        v337.i32[0] = 4096;
        if (!*((unsigned char *)std::__hash_table<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,BOOL>,std::__unordered_map_hasher<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,BOOL>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::__unordered_map_equal<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,BOOL>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::allocator<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,BOOL>>>::__emplace_unique_key_args<vision::mod::ImageAnalyzer_AnalysisType,std::piecewise_construct_t const&,std::tuple<vision::mod::ImageAnalyzer_AnalysisType&&>,std::tuple<>>(v123 + 824, 0x1000u, &v337)+ 20))
        {
          v230 = __cxa_allocate_exception(8uLL);
          void *v230 = 8574;
          __cxa_throw(v230, MEMORY[0x1E4FBA3E0], 0);
        }
        LODWORD(v326) = 4096;
        v124 = std::__hash_table<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,espresso_buffer_t>,std::__unordered_map_hasher<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,espresso_buffer_t>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::__unordered_map_equal<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,espresso_buffer_t>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::allocator<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,espresso_buffer_t>>>::__emplace_unique_key_args<vision::mod::ImageAnalyzer_AnalysisType,std::piecewise_construct_t const&,std::tuple<vision::mod::ImageAnalyzer_AnalysisType&&>,std::tuple<>>(v123 + 784, 0x1000u, &v326);
        vision::mod::ImageAnalyzer_Tensor1D<float>::ImageAnalyzer_Tensor1D((uint64_t)&v337, (long long *)(v124 + 24), 1);
        vision::mod::ImageAnalyzer_Tensor1D<float>::getVectorFromTensor(&v329, (unint64_t *)&v337);
        vision::mod::ImageAnalyzer_Tensor1D<float>::~ImageAnalyzer_Tensor1D((uint64_t)&v337);
        int8x16_t v337 = 0uLL;
        uint64_t v338 = 0;
        v125 = std::__hash_table<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::__unordered_map_hasher<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::__unordered_map_equal<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::allocator<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>>>::find<vision::mod::ImageAnalyzer_AnalysisType>((void *)(v123 + 744), 0x1000u);
        if (v125)
        {
          LODWORD(v326) = 4096;
          v126 = std::__hash_table<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,vision::mod::ImageAnalyzer_PostProcessor>,std::__unordered_map_hasher<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,vision::mod::ImageAnalyzer_PostProcessor>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::__unordered_map_equal<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,vision::mod::ImageAnalyzer_PostProcessor>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::allocator<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,vision::mod::ImageAnalyzer_PostProcessor>>>::__emplace_unique_key_args<vision::mod::ImageAnalyzer_AnalysisType,std::piecewise_construct_t const&,std::tuple<vision::mod::ImageAnalyzer_AnalysisType&&>,std::tuple<>>((void *)(v123 + 744), 0x1000u, &v326);
          vision::mod::ImageAnalyzer_PostProcessor::process((uint64_t)(v126 + 3), (uint64_t)&v329, (uint64_t)&v337);
        }
        v127 = *(uint64_t **)(a1 + 128);
        for (j = *(uint64_t **)(a1 + 136); v127 != j; ++v127)
        {
          uint64_t v129 = *v127;
          if (v125) {
            v130 = (std::string *)&v337;
          }
          else {
            v130 = &v329;
          }
          float v131 = *(float *)(v130->__r_.__value_.__r.__words[0] + 4 * v129);
          if (fabsf(v131) >= v122)
          {
            LODWORD(v322[0]) = 4096;
            id v326 = (id)(std::__hash_table<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::__unordered_map_hasher<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::__unordered_map_equal<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::allocator<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>>>::__emplace_unique_key_args<vision::mod::ImageAnalyzer_AnalysisType,std::piecewise_construct_t const&,std::tuple<vision::mod::ImageAnalyzer_AnalysisType&&>,std::tuple<>>(v123 + 864, 0x1000u, v322)[3]+ 24 * v129);
            *((float *)std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)v332, (unsigned __int8 *)v326, (long long **)&v326)+ 10) = v131;
          }
        }
        if (v337.i64[0])
        {
          v337.i64[1] = v337.i64[0];
          operator delete((void *)v337.i64[0]);
        }
        if (v329.__r_.__value_.__r.__words[0])
        {
          v329.__r_.__value_.__l.__size_ = v329.__r_.__value_.__r.__words[0];
          operator delete(v329.__r_.__value_.__l.__data_);
        }
        id v132 = objc_alloc(MEMORY[0x1E4F1CA48]);
        v133 = (void *)[v132 initWithCapacity:*((void *)&v332[1] + 1)];
        v134 = *(uint64_t **)&v332[1];
        if (*(void *)&v332[1])
        {
          while (1)
          {
            float v135 = *((float *)v134 + 10);
            id v136 = [NSString alloc];
            v137 = v134 + 2;
            if (*((char *)v134 + 39) < 0) {
              v137 = (void *)*v137;
            }
            v138 = (void *)[v136 initWithUTF8String:v137];
            v139 = v324[0] == (void *)0x7FFFFFFFFFFFFFFFLL ? 0 : (unint64_t *)v324;
            int v140 = -[VNImageAnalyzerMultiDetector _processSceneIdentifier:withConfidence:disallowedList:operationPoints:originatingRequestSpecifier:observationsArray:optionalTopN:error:](a1, v138, v273, v120, v119, v133, v139, (uint64_t)a28, v135);

            if (!v140) {
              break;
            }
            v134 = (uint64_t *)*v134;
            if (!v134) {
              goto LABEL_126;
            }
          }
          id v142 = 0;
        }
        else
        {
LABEL_126:
          id v141 = &__block_literal_global_128_38097;
          [v133 sortWithOptions:16 usingComparator:&__block_literal_global_128_38097];

          kdebug_trace();
          [v288 receiveObservations:v133];
          id v142 = v133;
        }

        std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__deallocate_node(*(void ***)&v332[1]);
        v143 = *(void **)&v332[0];
        *(void *)&v332[0] = 0;
        if (v143) {
          operator delete(v143);
        }
      }
      else
      {
        id v142 = 0;
      }

      if (!v142) {
        goto LABEL_311;
      }
      [v249 addObjectsFromArray:v142];
    }
    if (v281)
    {
      id obja = v281;
      v268 = [obja observationsRecipient];
      v144 = [v268 originatingRequestSpecifier];
      [v144 requestClassCode];
      [v144 requestRevision];
      kdebug_trace();
      [(VNImageAnalyzerMultiDetector *)&v329 _junkCustomClassifiersAndReturnError:a28];
      v145 = (void *)v329.__r_.__value_.__r.__words[0];
      if (v329.__r_.__value_.__r.__words[0])
      {
        vision::mod::ImageAnalyzer::getSceneRepresentation((vision::mod::ImageAnalyzer *)&v337, *(void *)(a1 + 112));
        id v146 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        if (*v145 != v145[1])
        {
          uint64_t v147 = *(void *)(*v145 + 8);
          if (v147) {
            atomic_fetch_add_explicit((atomic_ullong *volatile)(v147 + 8), 1uLL, memory_order_relaxed);
          }
          id v326 = 0;
          vision::mod::ImageAnalyzer_CustomClassifier::performInference();
        }
        id v148 = &__block_literal_global_128_38097;
        [v146 sortWithOptions:16 usingComparator:&__block_literal_global_128_38097];

        kdebug_trace();
        [v268 receiveObservations:v146];
        id v149 = v146;

        vision::mod::ImageAnalyzer_Tensor1D<float>::~ImageAnalyzer_Tensor1D((uint64_t)&v337);
      }
      else
      {
        id v149 = 0;
      }
      if (v329.__r_.__value_.__l.__size_) {
        std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v329.__r_.__value_.__l.__size_);
      }

      if (!v149) {
        goto LABEL_311;
      }
      [v249 addObjectsFromArray:v149];
    }
    if (v280)
    {
      id v150 = v280;
      [(VNImageAnalyzerMultiDetector *)v332 _VNVYvzEtX1JlUdu8xx5qhDICustomClassifierAndReturnError:a28];
      if (*(void *)&v332[0])
      {
        vision::mod::ImageAnalyzer::getSceneRepresentation((vision::mod::ImageAnalyzer *)&v337, *(void *)(a1 + 112));
        v329.__r_.__value_.__r.__words[0] = 0;
        vision::mod::ImageAnalyzer_CustomClassifier::performInference();
      }
      if (*((void *)&v332[0] + 1)) {
        std::__shared_weak_count::__release_shared[abi:nn180100](*((std::__shared_weak_count **)&v332[0] + 1));
      }
LABEL_154:

LABEL_311:
      id v88 = 0;
      goto LABEL_312;
    }
    if (v270)
    {
      id v150 = v270;
      [(VNImageAnalyzerMultiDetector *)&v329 _potentialLandmarksCustomClassifierAndReturnError:a28];
      if (v329.__r_.__value_.__r.__words[0])
      {
        vision::mod::ImageAnalyzer::getSceneRepresentation((vision::mod::ImageAnalyzer *)&v337, *(void *)(a1 + 112));
        id v326 = 0;
        vision::mod::ImageAnalyzer_CustomClassifier::performInference();
      }
      if (v329.__r_.__value_.__l.__size_) {
        std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v329.__r_.__value_.__l.__size_);
      }
      goto LABEL_154;
    }
    if (v263)
    {
      id v151 = v263;
      v152 = [v151 observationsRecipient];
      v153 = [v152 originatingRequestSpecifier];
      [v153 requestClassCode];
      [v153 requestRevision];
      kdebug_trace();
      uint64_t v154 = *(void *)(a1 + 112);
      v337.i32[0] = 8;
      if (!*((unsigned char *)std::__hash_table<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,BOOL>,std::__unordered_map_hasher<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,BOOL>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::__unordered_map_equal<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,BOOL>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::allocator<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,BOOL>>>::__emplace_unique_key_args<vision::mod::ImageAnalyzer_AnalysisType,std::piecewise_construct_t const&,std::tuple<vision::mod::ImageAnalyzer_AnalysisType&&>,std::tuple<>>(v154 + 824, 8u, &v337)+ 20))
      {
        v231 = __cxa_allocate_exception(8uLL);
        void *v231 = 8574;
        __cxa_throw(v231, MEMORY[0x1E4FBA3E0], 0);
      }
      LODWORD(v332[0]) = 8;
      v155 = std::__hash_table<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,espresso_buffer_t>,std::__unordered_map_hasher<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,espresso_buffer_t>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::__unordered_map_equal<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,espresso_buffer_t>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::allocator<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,espresso_buffer_t>>>::__emplace_unique_key_args<vision::mod::ImageAnalyzer_AnalysisType,std::piecewise_construct_t const&,std::tuple<vision::mod::ImageAnalyzer_AnalysisType&&>,std::tuple<>>(v154 + 784, 8u, v332);
      vision::mod::ImageAnalyzer_Tensor1D<float>::ImageAnalyzer_Tensor1D((uint64_t)&v337, (long long *)(v155 + 24), 0);
      float v157 = vision::mod::ImageAnalyzer_Tensor1D<float>::operator[]((uint64_t)&v337, 0, v156);
      vision::mod::ImageAnalyzer_Tensor1D<float>::~ImageAnalyzer_Tensor1D((uint64_t)&v337);
      uint64_t v158 = *(void *)(a1 + 112);
      memset(v332, 0, sizeof(v332));
      LODWORD(v333) = 1065353216;
      v337.i32[0] = 4;
      if (!*((unsigned char *)std::__hash_table<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,BOOL>,std::__unordered_map_hasher<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,BOOL>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::__unordered_map_equal<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,BOOL>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::allocator<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,BOOL>>>::__emplace_unique_key_args<vision::mod::ImageAnalyzer_AnalysisType,std::piecewise_construct_t const&,std::tuple<vision::mod::ImageAnalyzer_AnalysisType&&>,std::tuple<>>(v158 + 824, 4u, &v337)+ 20))
      {
        v232 = __cxa_allocate_exception(8uLL);
        void *v232 = 8574;
        __cxa_throw(v232, MEMORY[0x1E4FBA3E0], 0);
      }
      LODWORD(v326) = 4;
      v159 = std::__hash_table<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,espresso_buffer_t>,std::__unordered_map_hasher<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,espresso_buffer_t>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::__unordered_map_equal<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,espresso_buffer_t>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::allocator<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,espresso_buffer_t>>>::__emplace_unique_key_args<vision::mod::ImageAnalyzer_AnalysisType,std::piecewise_construct_t const&,std::tuple<vision::mod::ImageAnalyzer_AnalysisType&&>,std::tuple<>>(v158 + 784, 4u, &v326);
      vision::mod::ImageAnalyzer_Tensor1D<float>::ImageAnalyzer_Tensor1D((uint64_t)&v337, (long long *)(v159 + 24), 1);
      vision::mod::ImageAnalyzer_Tensor1D<float>::getVectorFromTensor(&v329, (unint64_t *)&v337);
      vision::mod::ImageAnalyzer_Tensor1D<float>::~ImageAnalyzer_Tensor1D((uint64_t)&v337);
      int8x16_t v337 = 0uLL;
      uint64_t v338 = 0;
      v160 = std::__hash_table<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::__unordered_map_hasher<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::__unordered_map_equal<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::allocator<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>>>::find<vision::mod::ImageAnalyzer_AnalysisType>((void *)(v158 + 744), 4u);
      if (v160)
      {
        LODWORD(v326) = 4;
        v161 = std::__hash_table<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,vision::mod::ImageAnalyzer_PostProcessor>,std::__unordered_map_hasher<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,vision::mod::ImageAnalyzer_PostProcessor>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::__unordered_map_equal<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,vision::mod::ImageAnalyzer_PostProcessor>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::allocator<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,vision::mod::ImageAnalyzer_PostProcessor>>>::__emplace_unique_key_args<vision::mod::ImageAnalyzer_AnalysisType,std::piecewise_construct_t const&,std::tuple<vision::mod::ImageAnalyzer_AnalysisType&&>,std::tuple<>>((void *)(v158 + 744), 4u, &v326);
        vision::mod::ImageAnalyzer_PostProcessor::process((uint64_t)(v161 + 3), (uint64_t)&v329, (uint64_t)&v337);
      }
      int64_t size = (void *)v329.__r_.__value_.__r.__words[0];
      if (v329.__r_.__value_.__l.__size_ == v329.__r_.__value_.__r.__words[0])
      {
        int64_t size = (void *)v329.__r_.__value_.__l.__size_;
      }
      else
      {
        uint64_t v163 = 0;
        unint64_t v164 = 0;
        do
        {
          uint64_t v165 = v337.i64[0];
          if (!v160) {
            uint64_t v165 = (uint64_t)size;
          }
          int v166 = *(_DWORD *)(v165 + 4 * v164);
          LODWORD(v324[0]) = 4;
          id v326 = (id)(std::__hash_table<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::__unordered_map_hasher<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::__unordered_map_equal<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::allocator<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>>>::__emplace_unique_key_args<vision::mod::ImageAnalyzer_AnalysisType,std::piecewise_construct_t const&,std::tuple<vision::mod::ImageAnalyzer_AnalysisType&&>,std::tuple<>>(v158 + 864, 4u, v324)[3]+ v163);
          *((_DWORD *)std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)v332, (unsigned __int8 *)v326, (long long **)&v326)+ 10) = v166;
          int64_t size = (void *)v329.__r_.__value_.__r.__words[0];
          ++v164;
          v163 += 24;
        }
        while (v164 < (uint64_t)(v329.__r_.__value_.__l.__size_ - v329.__r_.__value_.__r.__words[0]) >> 2);
      }
      if (v337.i64[0])
      {
        v337.i64[1] = v337.i64[0];
        operator delete((void *)v337.i64[0]);
        int64_t size = (void *)v329.__r_.__value_.__r.__words[0];
      }
      if (size)
      {
        v329.__r_.__value_.__l.__size_ = (std::string::size_type)size;
        operator delete(size);
      }
      std::string::basic_string[abi:ne180100]<0>(&v337, "subject_framing");
      v167 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v332, (unsigned __int8 *)&v337);
      if (v167) {
        int v168 = *((_DWORD *)v167 + 10);
      }
      else {
        int v168 = 0;
      }
      std::string::basic_string[abi:ne180100]<0>(&v329, "background");
      v169 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v332, (unsigned __int8 *)&v329);
      if (v169) {
        int v170 = *((_DWORD *)v169 + 10);
      }
      else {
        int v170 = 0;
      }
      std::string::basic_string[abi:ne180100]<0>(&v326, "blur");
      v171 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v332, (unsigned __int8 *)&v326);
      if (v171) {
        int v172 = *((_DWORD *)v171 + 10);
      }
      else {
        int v172 = 0;
      }
      std::string::basic_string[abi:ne180100]<0>(v324, "subject_sharpness");
      v173 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v332, (unsigned __int8 *)v324);
      if (v173) {
        int v174 = *((_DWORD *)v173 + 10);
      }
      else {
        int v174 = 0;
      }
      std::string::basic_string[abi:ne180100]<0>(v322, "timing");
      v175 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v332, (unsigned __int8 *)v322);
      if (v175) {
        int v176 = *((_DWORD *)v175 + 10);
      }
      else {
        int v176 = 0;
      }
      std::string::basic_string[abi:ne180100]<0>(&__p, "lightning");
      v177 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v332, (unsigned __int8 *)&__p);
      if (v177) {
        int v178 = *((_DWORD *)v177 + 10);
      }
      else {
        int v178 = 0;
      }
      std::string::basic_string[abi:ne180100]<0>(v335, "reflections");
      v179 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v332, (unsigned __int8 *)v335);
      if (v179) {
        int v180 = *((_DWORD *)v179 + 10);
      }
      else {
        int v180 = 0;
      }
      std::string::basic_string[abi:ne180100]<0>(v317, "color_harmony");
      v181 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v332, (unsigned __int8 *)v317);
      if (v181) {
        unsigned int v182 = *((_DWORD *)v181 + 10);
      }
      else {
        unsigned int v182 = 0;
      }
      unsigned int v289 = v182;
      std::string::basic_string[abi:ne180100]<0>(v315, "color_brightness");
      v183 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v332, (unsigned __int8 *)v315);
      if (v183) {
        unsigned int v184 = *((_DWORD *)v183 + 10);
      }
      else {
        unsigned int v184 = 0;
      }
      unsigned int v279 = v184;
      std::string::basic_string[abi:ne180100]<0>(v313, "symmetry");
      v185 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v332, (unsigned __int8 *)v313);
      if (v185) {
        unsigned int v186 = *((_DWORD *)v185 + 10);
      }
      else {
        unsigned int v186 = 0;
      }
      unsigned int v274 = v186;
      std::string::basic_string[abi:ne180100]<0>(v311, "repetition");
      v187 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v332, (unsigned __int8 *)v311);
      if (v187) {
        unsigned int v188 = *((_DWORD *)v187 + 10);
      }
      else {
        unsigned int v188 = 0;
      }
      unsigned int v269 = v188;
      std::string::basic_string[abi:ne180100]<0>(v309, "immersive_feeling");
      v189 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v332, (unsigned __int8 *)v309);
      if (v189) {
        unsigned int v190 = *((_DWORD *)v189 + 10);
      }
      else {
        unsigned int v190 = 0;
      }
      unsigned int objb = v190;
      std::string::basic_string[abi:ne180100]<0>(v307, "perspective");
      v191 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v332, (unsigned __int8 *)v307);
      if (v191) {
        unsigned int v192 = *((_DWORD *)v191 + 10);
      }
      else {
        unsigned int v192 = 0;
      }
      unsigned int v251 = v192;
      std::string::basic_string[abi:ne180100]<0>(v305, "post_processing");
      v193 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v332, (unsigned __int8 *)v305);
      if (v193) {
        unsigned int v194 = *((_DWORD *)v193 + 10);
      }
      else {
        unsigned int v194 = 0;
      }
      unsigned int v242 = v194;
      std::string::basic_string[abi:ne180100]<0>(v303, "noise");
      v195 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v332, (unsigned __int8 *)v303);
      if (v195) {
        unsigned int v196 = *((_DWORD *)v195 + 10);
      }
      else {
        unsigned int v196 = 0;
      }
      unsigned int v240 = v196;
      std::string::basic_string[abi:ne180100]<0>(v301, "failure");
      v197 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v332, (unsigned __int8 *)v301);
      if (v197) {
        unsigned int v198 = *((_DWORD *)v197 + 10);
      }
      else {
        unsigned int v198 = 0;
      }
      unsigned int v238 = v198;
      std::string::basic_string[abi:ne180100]<0>(v299, "composition");
      v199 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v332, (unsigned __int8 *)v299);
      if (v199) {
        unsigned int v200 = *((_DWORD *)v199 + 10);
      }
      else {
        unsigned int v200 = 0;
      }
      unsigned int v237 = v200;
      std::string::basic_string[abi:ne180100]<0>(v297, "interestingness");
      v201 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v332, (unsigned __int8 *)v297);
      if (v201) {
        unsigned int v202 = *((_DWORD *)v201 + 10);
      }
      else {
        unsigned int v202 = 0;
      }
      unsigned int v236 = v202;
      std::string::basic_string[abi:ne180100]<0>(v295, "object_intrusion");
      float v235 = v157;
      v203 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v332, (unsigned __int8 *)v295);
      if (v203) {
        unsigned int v204 = *((_DWORD *)v203 + 10);
      }
      else {
        unsigned int v204 = 0;
      }
      std::string::basic_string[abi:ne180100]<0>(v293, "tilt");
      int v234 = v180;
      v205 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v332, (unsigned __int8 *)v293);
      if (v205) {
        unsigned int v206 = *((_DWORD *)v205 + 10);
      }
      else {
        unsigned int v206 = 0;
      }
      std::string::basic_string[abi:ne180100]<0>(v291, "low_light");
      v207 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v332, (unsigned __int8 *)v291);
      if (v207) {
        LODWORD(v208) = *((_DWORD *)v207 + 10);
      }
      else {
        double v208 = 0.0;
      }
      unint64_t v233 = __PAIR64__(LODWORD(v208), v206);
      LODWORD(v215) = v234;
      *(float *)&double v208 = v235;
      LODWORD(v209) = v168;
      LODWORD(v210) = v170;
      LODWORD(v211) = v172;
      LODWORD(v212) = v174;
      LODWORD(v213) = v176;
      LODWORD(v214) = v178;
      +[VNImageAestheticsObservation observationForOriginatingRequestSpecifier:overallAestheticScore:wellFramedSubjectScore:wellChosenBackgroundScore:tastefullyBlurredScore:sharplyFocusedSubjectScore:wellTimedShotScore:pleasantLightingScore:pleasantReflectionsScore:harmoniousColorScore:livelyColorScore:pleasantSymmetryScore:pleasantPatternScore:immersivenessScore:pleasantPerspectiveScore:pleasantPostProcessingScore:noiseScore:failureScore:pleasantCompositionScore:interestingSubjectScore:intrusiveObjectPresenceScore:pleasantCameraTiltScore:lowKeyLightingScore:error:](VNImageAestheticsObservation, "observationForOriginatingRequestSpecifier:overallAestheticScore:wellFramedSubjectScore:wellChosenBackgroundScore:tastefullyBlurredScore:sharplyFocusedSubjectScore:wellTimedShotScore:pleasantLightingScore:pleasantReflectionsScore:harmoniousColorScore:livelyColorScore:pleasantSymmetryScore:pleasantPatternScore:immersivenessScore:pleasantPerspectiveScore:pleasantPostProcessingScore:noiseScore:failureScore:pleasantCompositionScore:interestingSubjectScore:intrusiveObjectPresenceScore:pleasantCameraTiltScore:lowKeyLightingScore:error:", v153, a28, v208, v209, v210, v211, v212, v213, v214, v215, __PAIR64__(v279, v289), __PAIR64__(v269, v274), __PAIR64__(v251, objb),
        __PAIR64__(v240, v242),
        __PAIR64__(v237, v238),
        __PAIR64__(v204, v236),
      v216 = v233);
      if (v292 < 0) {
        operator delete(v291[0]);
      }
      if (v294 < 0) {
        operator delete(v293[0]);
      }
      if (v296 < 0) {
        operator delete(v295[0]);
      }
      if (v298 < 0) {
        operator delete(v297[0]);
      }
      if (v300 < 0) {
        operator delete(v299[0]);
      }
      if (v302 < 0) {
        operator delete(v301[0]);
      }
      if (v304 < 0) {
        operator delete(v303[0]);
      }
      if (v306 < 0) {
        operator delete(v305[0]);
      }
      if (v308 < 0) {
        operator delete(v307[0]);
      }
      if (v310 < 0) {
        operator delete(v309[0]);
      }
      if (v312 < 0) {
        operator delete(v311[0]);
      }
      if (v314 < 0) {
        operator delete(v313[0]);
      }
      if (v316 < 0) {
        operator delete(v315[0]);
      }
      if (v318 < 0) {
        operator delete(v317[0]);
      }
      if (v336 < 0) {
        operator delete(v335[0]);
      }
      if (v321 < 0) {
        operator delete(__p);
      }
      if (v323 < 0) {
        operator delete(v322[0]);
      }
      if (v325 < 0) {
        operator delete(v324[0]);
      }
      if (SHIBYTE(v328) < 0) {
        operator delete(v326);
      }
      if (SHIBYTE(v329.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v329.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v338) < 0) {
        operator delete((void *)v337.i64[0]);
      }
      if (v216)
      {
        kdebug_trace();
        v337.i64[0] = (uint64_t)v216;
        v217 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v337 count:1];
        [v152 receiveObservations:v217];
        id v218 = v217;
      }
      else
      {
        id v218 = 0;
      }

      std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__deallocate_node(*(void ***)&v332[1]);
      v219 = *(void **)&v332[0];
      *(void *)&v332[0] = 0;
      if (v219) {
        operator delete(v219);
      }

      if (!v218) {
        goto LABEL_311;
      }
      [v249 addObjectsFromArray:v218];
    }
    if (v259)
    {
      id v220 = v259;
      id v221 = v264;
      id v222 = v257;
      vision::mod::ImageAnalyzer::getSceneSaliency((vision::mod::ImageAnalyzer *)&v337, *(void *)(a1 + 112));
      v223 = [(VNImageAnalyzerMultiDetector *)a11 _processSaliencyTensor:a13, a14, a9, a10, a1, &v337, v221, v220, @"VNAttentionBasedSaliencyHeatmapBoundingBoxGeneratorType", 723845552, 723845556, a26, v222, a28 regionOfInterest originalImageSize options saliencyConfiguration saliencyGeneratorType startCode finishCode qosClass warningRecorder error];
      free(v339);
      free(v340);

      if (!v223) {
        goto LABEL_311;
      }
      [v249 addObjectsFromArray:v223];
    }
    if (v258)
    {
      -[VNImageAnalyzerMultiDetector _processLastAnalysisForSaliencyOConfiguration:regionOfInterest:originalImageSize:options:qosClass:warningRecorder:error:](a1, v258, v264, a26, v257, a28, a11, a12, a13, a14, a9, a10);
      id v88 = (id)objc_claimAutoreleasedReturnValue();
      if (!v88) {
        goto LABEL_312;
      }
      [v249 addObjectsFromArray:v88];
    }
    if (v256)
    {
      -[VNImageAnalyzerMultiDetector _processLastAnalysisForRecognizeObjectsConfiguration:error:](a1, v256);
      id v88 = (id)objc_claimAutoreleasedReturnValue();
      if (!v88) {
        goto LABEL_312;
      }
      [v249 addObjectsFromArray:v88];
    }
    if (v255)
    {
      -[VNImageAnalyzerMultiDetector _processLastAnalysisForVN5kJNH3eYuyaLxNpZr5Z7ziConfiguration:error:](a1, v255, a28);
      id v88 = (id)objc_claimAutoreleasedReturnValue();
      if (!v88) {
        goto LABEL_312;
      }
      [v249 addObjectsFromArray:v88];
    }
    if (v254)
    {
      -[VNImageAnalyzerMultiDetector _processLastAnalysisForSignificantEventConfiguration:error:](a1, v254, a28);
      id v88 = (id)objc_claimAutoreleasedReturnValue();
      if (!v88) {
        goto LABEL_312;
      }
      [v249 addObjectsFromArray:v88];
    }
    if (v253)
    {
      -[VNImageAnalyzerMultiDetector _processLastAnalysisForCityNatureConfiguration:error:](a1, v253, a28);
      id v88 = (id)objc_claimAutoreleasedReturnValue();
      if (!v88) {
        goto LABEL_312;
      }
      [v249 addObjectsFromArray:v88];
    }
    if (v252)
    {
      -[VNImageAnalyzerMultiDetector _processLastAnalysisForPhotosAdjustmentsConfiguration:error:](a1, v252, a28);
      id v88 = (id)objc_claimAutoreleasedReturnValue();
      if (!v88) {
        goto LABEL_312;
      }
      [v249 addObjectsFromArray:v88];
    }
    id v88 = v249;
LABEL_312:
  }
  else
  {
LABEL_60:
    id v88 = 0;
  }
LABEL_313:

  return v88;
}

- (uint64_t)_analysisTypeForScenes:(void *)a1 entityNet:(void *)a2 junk:(void *)a3 VNVYvzEtX1JlUdu8xx5qhDI:(void *)a4 landmark:(void *)a5 sceneprints:(void *)a6 compressedSceneprint:(void *)a7 fingerprints:(void *)a8 aesthetics:(void *)a9 saliencyA:(void *)a10 saliencyO:(void *)a11 recognizeObjects:(void *)a12 VN5kJNH3eYuyaLxNpZr5Z7zi:(void *)a13 VNdGg5skzXHSAENO6T3enHE:(void *)a14 cityNatureGating:(void *)a15 photosAdjustments:(void *)a16
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v38 = a1;
  id v39 = a2;
  id v46 = a3;
  id v47 = a4;
  id v48 = a5;
  id v37 = a6;
  id v41 = a7;
  id v40 = a8;
  id v42 = a9;
  id v43 = a10;
  id v44 = a11;
  id v45 = a12;
  id v23 = a13;
  id v24 = a14;
  id v25 = a15;
  id v26 = a16;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v27 = v38;
  uint64_t v28 = 0;
  uint64_t v29 = [v27 countByEnumeratingWithState:&v53 objects:v58 count:16];
  if (v29)
  {
    uint64_t v30 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v54 != v30) {
          objc_enumerationMutation(v27);
        }
        uint64_t v28 = objc_msgSend(*(id *)(*((void *)&v53 + 1) + 8 * i), "analysisTypes", v37) | v28;
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v53 objects:v58 count:16];
    }
    while (v29);
  }

  if (v46) {
    uint64_t v28 = [v46 analysisTypes] | v28;
  }
  if (v47) {
    uint64_t v28 = [v47 analysisTypes] | v28;
  }
  if (v48) {
    uint64_t v28 = [v48 analysisTypes] | v28;
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v32 = v37;
  uint64_t v33 = [v32 countByEnumeratingWithState:&v49 objects:v57 count:16];
  if (v33)
  {
    uint64_t v34 = *(void *)v50;
    do
    {
      for (uint64_t j = 0; j != v33; ++j)
      {
        if (*(void *)v50 != v34) {
          objc_enumerationMutation(v32);
        }
        uint64_t v28 = objc_msgSend(*(id *)(*((void *)&v49 + 1) + 8 * j), "analysisTypes", v37) | v28;
      }
      uint64_t v33 = [v32 countByEnumeratingWithState:&v49 objects:v57 count:16];
    }
    while (v33);
  }

  if (v41) {
    uint64_t v28 = [v41 analysisTypes] | v28;
  }
  if (v23) {
    uint64_t v28 = [v23 analysisTypes] | v28;
  }
  if (v24) {
    uint64_t v28 = [v24 analysisTypes] | v28;
  }
  if (v25) {
    uint64_t v28 = [v25 analysisTypes] | v28;
  }
  if (v39) {
    uint64_t v28 = [v39 analysisTypes] | v28;
  }
  if (v40) {
    uint64_t v28 = [v40 analysisTypes] | v28;
  }
  if (v42) {
    uint64_t v28 = [v42 analysisTypes] | v28;
  }
  if (v43) {
    uint64_t v28 = [v43 analysisTypes] | v28;
  }
  if (v44) {
    uint64_t v28 = [v44 analysisTypes] | v28;
  }
  if (v45) {
    uint64_t v28 = [v45 analysisTypes] | v28;
  }
  if (v26) {
    uint64_t v28 = [v26 analysisTypes] | v28;
  }

  return v28;
}

- (uint64_t)_performAnalysis:(uint64_t)a3 pixelBuffer:(uint64_t)a4 error:
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__VNImageAnalyzerMultiDetector__performAnalysis_pixelBuffer_error___block_invoke;
  aBlock[3] = &unk_1E5B1EAD8;
  int v9 = a2;
  void aBlock[4] = a1;
  aBlock[5] = a3;
  uint64_t v5 = _Block_copy(aBlock);
  kdebug_trace();
  uint64_t v6 = VNExecuteBlock(v5, a4);
  if (v6) {
    kdebug_trace();
  }

  return v6;
}

- (id)_processLastAnalysisForSaliencyOConfiguration:(void *)a3 regionOfInterest:(uint64_t)a4 originalImageSize:(void *)a5 options:(void *)a6 qosClass:(double)a7 warningRecorder:(double)a8 error:(double)a9
{
  id v23 = a2;
  id v24 = a3;
  id v25 = a5;
  uint64_t v26 = *(void *)(a1 + 112);
  int v34 = 128;
  if (!*((unsigned char *)std::__hash_table<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,BOOL>,std::__unordered_map_hasher<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,BOOL>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::__unordered_map_equal<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,BOOL>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::allocator<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,BOOL>>>::__emplace_unique_key_args<vision::mod::ImageAnalyzer_AnalysisType,std::piecewise_construct_t const&,std::tuple<vision::mod::ImageAnalyzer_AnalysisType&&>,std::tuple<>>(v26 + 824, 0x80u, &v34)+ 20))
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = 8574;
    __cxa_throw(exception, MEMORY[0x1E4FBA3E0], 0);
  }
  int v34 = 128;
  id v27 = std::__hash_table<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,espresso_buffer_t>,std::__unordered_map_hasher<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,espresso_buffer_t>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::__unordered_map_equal<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,espresso_buffer_t>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::allocator<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,espresso_buffer_t>>>::__emplace_unique_key_args<vision::mod::ImageAnalyzer_AnalysisType,std::piecewise_construct_t const&,std::tuple<vision::mod::ImageAnalyzer_AnalysisType&&>,std::tuple<>>(v26 + 784, 0x80u, &v34);
  vision::mod::ImageAnalyzer_Tensor2D::ImageAnalyzer_Tensor2D((uint64_t)v31, (long long *)(v27 + 24));
  uint64_t v28 = [(VNImageAnalyzerMultiDetector *)a7 _processSaliencyTensor:a9, a10, a11, a12, a1, v31, v24, v23, @"VNObjectnessBasedSaliencyHeatmapBoundingBoxGeneratorType", 723845584, 723845588, a4, v25, a6 regionOfInterest originalImageSize options saliencyConfiguration saliencyGeneratorType startCode finishCode qosClass warningRecorder error];
  free(v32);
  free(v33);

  return v28;
}

- (id)_processLastAnalysisForRecognizeObjectsConfiguration:(uint64_t)a1 error:(void *)a2
{
  v371[1] = *MEMORY[0x1E4F143B8];
  id v305 = a2;
  char v304 = [v305 observationsRecipient];
  char v310 = [v304 originatingRequestSpecifier];
  [v310 requestClassCode];
  uint64_t v2 = [v310 requestRevision];
  kdebug_trace();
  kdebug_trace();
  uint64_t v307 = v2;
  uint64_t v312 = *(void *)(a1 + 112);
  [v305 minimumDetectionConfidence];
  float v4 = v3;
  [v305 nonMaximumSuppressionThreshold];
  float v6 = v5;
  long long v348 = 0u;
  long long v349 = 0u;
  int v350 = 1065353216;
  int8x8_t v7 = *(int8x8_t *)(v312 + 832);
  if (!*(void *)&v7) {
    goto LABEL_17;
  }
  uint8x8_t v8 = (uint8x8_t)vcnt_s8(v7);
  v8.i16[0] = vaddlv_u8(v8);
  if (v8.u32[0] > 1uLL)
  {
    uint64_t v9 = 64;
    if (*(void *)&v7 <= 0x40uLL) {
      uint64_t v9 = 0x40uLL % *(void *)&v7;
    }
  }
  else
  {
    uint64_t v9 = (v7.i8[0] - 1) & 0x40;
  }
  v10 = *(uint64_t ***)(*(void *)(v312 + 824) + 8 * v9);
  if (!v10 || (uint64_t v11 = *v10) == 0)
  {
LABEL_17:
    exception = __cxa_allocate_exception(8uLL);
    void *exception = 8574;
    __cxa_throw(exception, MEMORY[0x1E4FBA3E0], 0);
  }
  while (1)
  {
    unint64_t v12 = v11[1];
    if (v12 == 64) {
      break;
    }
    if (v8.u32[0] > 1uLL)
    {
      if (v12 >= *(void *)&v7) {
        v12 %= *(void *)&v7;
      }
    }
    else
    {
      v12 &= *(void *)&v7 - 1;
    }
    if (v12 != v9) {
      goto LABEL_17;
    }
LABEL_16:
    uint64_t v11 = (uint64_t *)*v11;
    if (!v11) {
      goto LABEL_17;
    }
  }
  if (*((_DWORD *)v11 + 4) != 64) {
    goto LABEL_16;
  }
  long long v14 = (void *)(v312 + 864);
  v311 = (void *)(v312 + 864);
  long long v15 = (void *)(v312 + 864);
  if (*(unsigned char *)(v312 + 461))
  {
    int v16 = std::__hash_table<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::__unordered_map_hasher<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::__unordered_map_equal<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::allocator<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>>>::find<vision::mod::ImageAnalyzer_AnalysisType>(v15, 0x40u);
    if (v16)
    {
      memset(&v369, 0, sizeof(v369));
      std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v369, (long long *)v16[3], (long long *)v16[4], 0xAAAAAAAAAAAAAAABLL * ((v16[4] - v16[3]) >> 3));
      std::string::size_type size = v369.__r_.__value_.__l.__size_;
      for (std::string::size_type i = v369.__r_.__value_.__r.__words[0]; i != size; i += 24)
      {
        if (*(char *)(i + 23) < 0)
        {
          std::string::__init_copy_ctor_external(&v359, *(const std::string::value_type **)i, *(void *)(i + 8));
        }
        else
        {
          long long v19 = *(_OWORD *)i;
          v359.__r_.__value_.__r.__words[2] = *(void *)(i + 16);
          *(_OWORD *)&v359.__r_.__value_.__l.__data_ = v19;
        }
        *(void *)&v358[0] = &v359;
        v20 = std::__hash_table<std::__hash_value_type<std::string,std::vector<std::tuple<float,_Geometry2D_rect2D_>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<std::tuple<float,_Geometry2D_rect2D_>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<std::tuple<float,_Geometry2D_rect2D_>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<std::tuple<float,_Geometry2D_rect2D_>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)&v348, (unsigned __int8 *)&v359, (long long **)v358);
        std::vector<std::tuple<float,_Geometry2D_rect2D_>>::reserve((uint64_t)(v20 + 40));
        if (SHIBYTE(v359.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v359.__r_.__value_.__l.__data_);
        }
      }
      if (*(float *)(v312 + 452) < v4) {
        float v4 = *(float *)(v312 + 452);
      }
      *(float *)&v370 = v4;
      v21 = std::__hash_table<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::__unordered_map_hasher<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::__unordered_map_equal<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::allocator<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>>>::find<vision::mod::ImageAnalyzer_AnalysisType>(v14, 0x40u);
      if (!v21) {
        std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
      }
      int v22 = -1431655765 * ((v21[4] - v21[3]) >> 3);
      std::vector<float>::vector(&v366, v22, &v370);
      if (v22 >= 2)
      {
        uint64_t v23 = 0;
        for (uint64_t j = 1; j != v22; ++j)
        {
          id v25 = std::__hash_table<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::__unordered_map_hasher<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::__unordered_map_equal<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::allocator<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>>>::find<vision::mod::ImageAnalyzer_AnalysisType>(v311, 0x40u);
          if (!v25) {
            std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
          }
          uint64_t v26 = v25[3] + v23;
          id v27 = (const std::string::value_type **)(v26 + 24);
          if (*(char *)(v26 + 47) < 0)
          {
            std::string::__init_copy_ctor_external(&v359, *v27, *(void *)(v26 + 32));
          }
          else
          {
            *(_OWORD *)&v359.__r_.__value_.__l.__data_ = *(_OWORD *)v27;
            v359.__r_.__value_.__r.__words[2] = *(void *)(v26 + 40);
          }
          uint64_t v28 = (float *)std::__tree<std::__value_type<std::string,std::vector<float>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<float>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<float>>>>::find<std::string>(v312 + 560, &v359);
          if ((float *)(v312 + 568) != v28)
          {
            float v29 = v28[14];
            if (v4 >= v29) {
              float v29 = v4;
            }
            v366[j] = v29;
          }
          if (SHIBYTE(v359.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v359.__r_.__value_.__l.__data_);
          }
          v23 += 24;
        }
      }
      uint64_t v30 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>((void *)(v312 + 968), (unsigned __int8 *)(v312 + 216));
      if (!v30) {
        std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
      }
      vision::mod::ImageAnalyzer_Tensor3D::ImageAnalyzer_Tensor3D((uint64_t)&v359, (long long *)(v30 + 40));
      std::string::size_type v31 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>((void *)(v312 + 968), (unsigned __int8 *)(v312 + 240));
      if (!v31) {
        std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
      }
      vision::mod::ImageAnalyzer_Tensor3D::ImageAnalyzer_Tensor3D((uint64_t)v358, (long long *)(v31 + 40));
      memset(&v357, 0, sizeof(v357));
      memset(&v356, 0, sizeof(v356));
      memset(&v355, 0, sizeof(v355));
      memset(&v354, 0, sizeof(v354));
      uint64_t v33 = v366;
      id v32 = v367;
      unint64_t v317 = v361;
      std::string::size_type v34 = v359.__r_.__value_.__r.__words[0];
      uint64_t v35 = v360;
      std::vector<int>::reserve(&v357, 0x3E8uLL);
      std::vector<int>::reserve(&v356, 0x3E8uLL);
      std::vector<int>::reserve(&v355, 0x3E8uLL);
      std::vector<float>::reserve((void **)&v354.__begin_, 0x3E8uLL);
      if (v317)
      {
        uint64_t v36 = (int)(v32 - v33);
        unint64_t v37 = (unint64_t)(((char *)v32 - (char *)v33) << 30) >> 33;
        uint64_t v325 = v35;
        uint64_t v321 = 0;
        unint64_t v323 = v37;
        do
        {
          if (v35)
          {
            uint64_t v38 = 0;
            uint64_t v39 = 0;
            std::vector<int>::pointer begin = v357.__begin_;
            value = v356.__end_cap_.__value_;
            v343 = v357.__end_cap_.__value_;
            std::vector<int>::pointer v41 = v356.__begin_;
            id v42 = v355.__begin_;
            int v330 = v354.__end_cap_.__value_;
            long long v334 = v355.__end_cap_.__value_;
            __p = v354.__begin_;
            std::string::size_type v319 = v34;
            do
            {
              float v43 = *(float *)(v34 + 4 * v363 * v39);
              if (v43 < (float)(1.0 - v4) && v37 != 0)
              {
                unsigned int v45 = 0;
                float v46 = (float)(1.0 - v43) * 0.5;
                id v47 = (float *)(v34 + v363 * v38 + 4 * v365);
                float v48 = -3.4028e38;
                uint64_t v49 = 1;
                do
                {
                  if (*v47 > v46)
                  {
                    float v48 = *v47;
                    unsigned int v45 = v49;
                    if (!v49) {
                      goto LABEL_133;
                    }
                    goto LABEL_61;
                  }
                  if (*v47 > v48 && *v47 > v4)
                  {
                    float v48 = *v47;
                    unsigned int v45 = v49;
                  }
                  ++v49;
                  v47 += v365;
                }
                while (v36 != v49);
                if (!v45) {
                  goto LABEL_133;
                }
LABEL_61:
                if (v48 <= v366[v45]) {
                  goto LABEL_133;
                }
                std::vector<int>::pointer end = v357.__end_;
                if (v357.__end_ >= v343)
                {
                  uint64_t v52 = v357.__end_ - begin;
                  unint64_t v53 = v52 + 1;
                  if ((unint64_t)(v52 + 1) >> 62) {
                    goto LABEL_427;
                  }
                  if (((char *)v343 - (char *)begin) >> 1 > v53) {
                    unint64_t v53 = ((char *)v343 - (char *)begin) >> 1;
                  }
                  if ((unint64_t)((char *)v343 - (char *)begin) >= 0x7FFFFFFFFFFFFFFCLL) {
                    unint64_t v54 = 0x3FFFFFFFFFFFFFFFLL;
                  }
                  else {
                    unint64_t v54 = v53;
                  }
                  if (v54) {
                    unint64_t v54 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v54);
                  }
                  else {
                    uint64_t v55 = 0;
                  }
                  long long v56 = (int *)(v54 + 4 * v52);
                  *long long v56 = v321;
                  long long v51 = v56 + 1;
                  while (end != begin)
                  {
                    int v57 = *--end;
                    *--long long v56 = v57;
                  }
                  v343 = (int *)(v54 + 4 * v55);
                  v357.__end_ = v51;
                  if (begin) {
                    operator delete(begin);
                  }
                  std::vector<int>::pointer begin = v56;
                  unint64_t v37 = v323;
                  uint64_t v35 = v325;
                }
                else
                {
                  *v357.__end_ = v321;
                  long long v51 = end + 1;
                }
                v357.__end_ = v51;
                std::vector<int>::pointer v58 = v356.__end_;
                if (v356.__end_ >= value)
                {
                  uint64_t v60 = v356.__end_ - v41;
                  unint64_t v61 = v60 + 1;
                  if ((unint64_t)(v60 + 1) >> 62) {
                    goto LABEL_427;
                  }
                  if (((char *)value - (char *)v41) >> 1 > v61) {
                    unint64_t v61 = ((char *)value - (char *)v41) >> 1;
                  }
                  if ((unint64_t)((char *)value - (char *)v41) >= 0x7FFFFFFFFFFFFFFCLL) {
                    unint64_t v62 = 0x3FFFFFFFFFFFFFFFLL;
                  }
                  else {
                    unint64_t v62 = v61;
                  }
                  if (v62) {
                    unint64_t v62 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v62);
                  }
                  else {
                    uint64_t v63 = 0;
                  }
                  long long v64 = (int *)(v62 + 4 * v60);
                  *long long v64 = v39;
                  uint64_t v59 = v64 + 1;
                  while (v58 != v41)
                  {
                    int v65 = *--v58;
                    *--long long v64 = v65;
                  }
                  value = (int *)(v62 + 4 * v63);
                  v356.__end_ = v59;
                  if (v41) {
                    operator delete(v41);
                  }
                  std::vector<int>::pointer v41 = v64;
                  unint64_t v37 = v323;
                  uint64_t v35 = v325;
                }
                else
                {
                  *v356.__end_ = v39;
                  uint64_t v59 = v58 + 1;
                }
                v356.__end_ = v59;
                std::vector<int>::pointer v66 = v355.__end_;
                if (v355.__end_ >= v334)
                {
                  uint64_t v68 = v355.__end_ - v42;
                  unint64_t v69 = v68 + 1;
                  if ((unint64_t)(v68 + 1) >> 62)
                  {
LABEL_427:
                    v357.__end_cap_.__value_ = v343;
                    v356.__end_cap_.__value_ = value;
                    v357.__begin_ = begin;
                    v355.__end_cap_.__value_ = v334;
                    v356.__begin_ = v41;
                    v354.__end_cap_.__value_ = v330;
                    v355.__begin_ = v42;
                    v354.__begin_ = __p;
                    std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
                  }
                  if (((char *)v334 - (char *)v42) >> 1 > v69) {
                    unint64_t v69 = ((char *)v334 - (char *)v42) >> 1;
                  }
                  if ((unint64_t)((char *)v334 - (char *)v42) >= 0x7FFFFFFFFFFFFFFCLL) {
                    unint64_t v70 = 0x3FFFFFFFFFFFFFFFLL;
                  }
                  else {
                    unint64_t v70 = v69;
                  }
                  if (v70) {
                    unint64_t v70 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v70);
                  }
                  else {
                    uint64_t v71 = 0;
                  }
                  int v72 = (int *)(v70 + 4 * v68);
                  *int v72 = v45;
                  v67 = v72 + 1;
                  while (v66 != v42)
                  {
                    int v73 = *--v66;
                    *--int v72 = v73;
                  }
                  long long v334 = (int *)(v70 + 4 * v71);
                  v355.__end_ = v67;
                  if (v42) {
                    operator delete(v42);
                  }
                  id v42 = v72;
                  unint64_t v37 = v323;
                  uint64_t v35 = v325;
                }
                else
                {
                  *v355.__end_ = v45;
                  v67 = v66 + 1;
                }
                v355.__end_ = v67;
                std::vector<int>::pointer v74 = v354.__end_;
                if (v354.__end_ >= v330)
                {
                  uint64_t v76 = v354.__end_ - __p;
                  unint64_t v77 = v76 + 1;
                  if ((unint64_t)(v76 + 1) >> 62)
                  {
                    v357.__end_cap_.__value_ = v343;
                    v356.__end_cap_.__value_ = value;
                    v357.__begin_ = begin;
                    v355.__end_cap_.__value_ = v334;
                    v356.__begin_ = v41;
                    v354.__end_cap_.__value_ = v330;
                    v355.__begin_ = v42;
                    v354.__begin_ = __p;
                    std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
                  }
                  if (((char *)v330 - (char *)__p) >> 1 > v77) {
                    unint64_t v77 = ((char *)v330 - (char *)__p) >> 1;
                  }
                  if ((unint64_t)((char *)v330 - (char *)__p) >= 0x7FFFFFFFFFFFFFFCLL) {
                    unint64_t v78 = 0x3FFFFFFFFFFFFFFFLL;
                  }
                  else {
                    unint64_t v78 = v77;
                  }
                  if (v78) {
                    unint64_t v78 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v78);
                  }
                  else {
                    uint64_t v79 = 0;
                  }
                  id v80 = (float *)(v78 + 4 * v76);
                  *id v80 = v48;
                  int v75 = (int *)(v80 + 1);
                  if (v74 == __p)
                  {
                    v81 = __p;
                  }
                  else
                  {
                    v81 = __p;
                    do
                    {
                      int v82 = *--v74;
                      *((_DWORD *)v80-- - 1) = v82;
                    }
                    while (v74 != __p);
                  }
                  int v330 = (int *)(v78 + 4 * v79);
                  v354.__end_ = v75;
                  if (v81) {
                    operator delete(v81);
                  }
                  __p = (int *)v80;
                  unint64_t v37 = v323;
                  uint64_t v35 = v325;
                }
                else
                {
                  *(float *)v354.__end_ = v48;
                  int v75 = v74 + 1;
                }
                v354.__end_ = v75;
                std::string::size_type v34 = v319;
              }
LABEL_133:
              ++v39;
              v38 += 4;
            }
            while (v39 != v35);
            v357.__end_cap_.__value_ = v343;
            v356.__end_cap_.__value_ = value;
            v357.__begin_ = begin;
            v355.__end_cap_.__value_ = v334;
            v356.__begin_ = v41;
            v354.__end_cap_.__value_ = v330;
            v355.__begin_ = v42;
            v354.__begin_ = __p;
          }
          v34 += 4 * v364;
          ++v321;
        }
        while (v321 != v317);
      }
      if ((int)((unint64_t)((char *)v357.__end_ - (char *)v357.__begin_) >> 2) > 0)
      {
        uint64_t v83 = 0;
        uint64_t v84 = ((unint64_t)((char *)v357.__end_ - (char *)v357.__begin_) >> 2);
        do
        {
          uint64_t v85 = v356.__begin_[v83];
          uint64_t v86 = v357.__begin_[v83];
          int v87 = v355.__begin_[v83];
          int v88 = v354.__begin_[v83];
          float v89 = vision::mod::ImageAnalyzer_Tensor3D::valueAt((vision::mod::ImageAnalyzer_Tensor3D *)v358, v86, v85, 0);
          float v90 = vision::mod::ImageAnalyzer_Tensor3D::valueAt((vision::mod::ImageAnalyzer_Tensor3D *)v358, v86, v85, 1);
          float v91 = vision::mod::ImageAnalyzer_Tensor3D::valueAt((vision::mod::ImageAnalyzer_Tensor3D *)v358, v86, v85, 2);
          float v92 = vision::mod::ImageAnalyzer_Tensor3D::valueAt((vision::mod::ImageAnalyzer_Tensor3D *)v358, v86, v85, 3);
          std::string v93 = std::__hash_table<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::__unordered_map_hasher<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::__unordered_map_equal<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::allocator<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>>>::find<vision::mod::ImageAnalyzer_AnalysisType>(v311, 0x40u);
          if (!v93) {
            std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
          }
          v351 = (void *)(v93[3] + 24 * v87);
          id v94 = std::__hash_table<std::__hash_value_type<std::string,std::vector<std::tuple<float,_Geometry2D_rect2D_>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<std::tuple<float,_Geometry2D_rect2D_>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<std::tuple<float,_Geometry2D_rect2D_>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<std::tuple<float,_Geometry2D_rect2D_>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)&v348, (unsigned __int8 *)v351, (long long **)&v351);
          std::string v95 = v94;
          float v96 = v92 - v90;
          float v97 = v91 - v89;
          unint64_t v98 = *((void *)v94 + 6);
          unint64_t v99 = *((void *)v94 + 7);
          if (v98 >= v99)
          {
            uint64_t v101 = *((void *)v94 + 5);
            unint64_t v102 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v98 - v101) >> 2);
            unint64_t v103 = v102 + 1;
            if (v102 + 1 > 0xCCCCCCCCCCCCCCCLL) {
              std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
            }
            unint64_t v104 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v99 - v101) >> 2);
            if (2 * v104 > v103) {
              unint64_t v103 = 2 * v104;
            }
            if (v104 >= 0x666666666666666) {
              unint64_t v105 = 0xCCCCCCCCCCCCCCCLL;
            }
            else {
              unint64_t v105 = v103;
            }
            if (v105) {
              unint64_t v105 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::tuple<float,_Geometry2D_rect2D_>>>(v105);
            }
            else {
              uint64_t v106 = 0;
            }
            unint64_t v107 = v105 + 20 * v102;
            *(_DWORD *)unint64_t v107 = v88;
            *(float *)(v107 + 4) = v90;
            *(float *)(v107 + 8) = v89;
            *(float *)(v107 + 12) = v97;
            *(float *)(v107 + 16) = v96;
            v109 = (char *)*((void *)v95 + 5);
            uint64_t v108 = (char *)*((void *)v95 + 6);
            unint64_t v110 = v107;
            if (v108 != v109)
            {
              do
              {
                long long v111 = *(_OWORD *)(v108 - 20);
                *(_DWORD *)(v110 - 4) = *((_DWORD *)v108 - 1);
                *(_OWORD *)(v110 - 20) = v111;
                v110 -= 20;
                v108 -= 20;
              }
              while (v108 != v109);
              uint64_t v108 = (char *)*((void *)v95 + 5);
            }
            unint64_t v100 = v107 + 20;
            *((void *)v95 + 5) = v110;
            *((void *)v95 + 6) = v107 + 20;
            *((void *)v95 + 7) = v105 + 20 * v106;
            if (v108) {
              operator delete(v108);
            }
          }
          else
          {
            *(_DWORD *)unint64_t v98 = v88;
            *(float *)(v98 + 4) = v90;
            *(float *)(v98 + 8) = v89;
            *(float *)(v98 + 12) = v97;
            unint64_t v100 = v98 + 20;
            *(float *)(v98 + 16) = v96;
          }
          *((void *)v95 + 6) = v100;
          ++v83;
        }
        while (v83 != v84);
      }
      if (v354.__begin_) {
        operator delete(v354.__begin_);
      }
      uint64_t v112 = v312;
      if (v355.__begin_) {
        operator delete(v355.__begin_);
      }
      if (v356.__begin_) {
        operator delete(v356.__begin_);
      }
      if (v357.__begin_) {
        operator delete(v357.__begin_);
      }
      vision::mod::ImageAnalyzer_Tensor3D::~ImageAnalyzer_Tensor3D((vision::mod::ImageAnalyzer_Tensor3D *)v358);
      vision::mod::ImageAnalyzer_Tensor3D::~ImageAnalyzer_Tensor3D((vision::mod::ImageAnalyzer_Tensor3D *)&v359);
      if (v366)
      {
        v367 = v366;
        operator delete(v366);
      }
      goto LABEL_337;
    }
LABEL_434:
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  id v113 = std::__hash_table<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::__unordered_map_hasher<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::__unordered_map_equal<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::allocator<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>>>::find<vision::mod::ImageAnalyzer_AnalysisType>(v15, 0x40u);
  if (!v113) {
    goto LABEL_434;
  }
  memset(&v369, 0, sizeof(v369));
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v369, (long long *)v113[3], (long long *)v113[4], 0xAAAAAAAAAAAAAAABLL * ((v113[4] - v113[3]) >> 3));
  std::string::size_type v115 = v369.__r_.__value_.__l.__size_;
  for (std::string::size_type k = v369.__r_.__value_.__r.__words[0]; k != v115; k += 24)
  {
    if (*(char *)(k + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&v359, *(const std::string::value_type **)k, *(void *)(k + 8));
    }
    else
    {
      long long v116 = *(_OWORD *)k;
      v359.__r_.__value_.__r.__words[2] = *(void *)(k + 16);
      *(_OWORD *)&v359.__r_.__value_.__l.__data_ = v116;
    }
    *(void *)&v358[0] = &v359;
    v117 = std::__hash_table<std::__hash_value_type<std::string,std::vector<std::tuple<float,_Geometry2D_rect2D_>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<std::tuple<float,_Geometry2D_rect2D_>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<std::tuple<float,_Geometry2D_rect2D_>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<std::tuple<float,_Geometry2D_rect2D_>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)&v348, (unsigned __int8 *)&v359, (long long **)v358);
    std::vector<std::tuple<float,_Geometry2D_rect2D_>>::reserve((uint64_t)(v117 + 40));
    if (SHIBYTE(v359.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v359.__r_.__value_.__l.__data_);
    }
  }
  if (*(float *)(v312 + 452) >= v4) {
    float v118 = v4;
  }
  else {
    float v118 = *(float *)(v312 + 452);
  }
  float v368 = v118;
  v119 = std::__hash_table<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::__unordered_map_hasher<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::__unordered_map_equal<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::allocator<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>>>::find<vision::mod::ImageAnalyzer_AnalysisType>(v14, 0x40u);
  if (!v119) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  int v120 = -1431655765 * ((v119[4] - v119[3]) >> 3);
  std::vector<float>::vector(&v366, v120, &v368);
  if (v120 >= 2)
  {
    uint64_t v121 = 0;
    for (uint64_t m = 1; m != v120; ++m)
    {
      uint64_t v123 = std::__hash_table<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::__unordered_map_hasher<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::__unordered_map_equal<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::allocator<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>>>::find<vision::mod::ImageAnalyzer_AnalysisType>(v311, 0x40u);
      if (!v123) {
        std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
      }
      uint64_t v124 = v123[3] + v121;
      v125 = (const std::string::value_type **)(v124 + 24);
      if (*(char *)(v124 + 47) < 0)
      {
        std::string::__init_copy_ctor_external(&v359, *v125, *(void *)(v124 + 32));
      }
      else
      {
        *(_OWORD *)&v359.__r_.__value_.__l.__data_ = *(_OWORD *)v125;
        v359.__r_.__value_.__r.__words[2] = *(void *)(v124 + 40);
      }
      v126 = (float *)std::__tree<std::__value_type<std::string,std::vector<float>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<float>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<float>>>>::find<std::string>(v312 + 560, &v359);
      if ((float *)(v312 + 568) != v126)
      {
        float v127 = v126[14];
        if (v118 >= v127) {
          float v127 = v118;
        }
        v366[m] = v127;
      }
      if (SHIBYTE(v359.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v359.__r_.__value_.__l.__data_);
      }
      v121 += 24;
    }
  }
  uint64_t v112 = v312;
  if (*(void *)(v312 + 432))
  {
    uint64_t v128 = 0;
    do
    {
      uint64_t v129 = (long long **)(*(void *)(v112 + 944) + 24 * v128);
      vision::mod::ImageAnalyzer_Tensor3D::ImageAnalyzer_Tensor3D((uint64_t)&v359, (long long *)((char *)*v129 + 168));
      uint64_t v308 = v128;
      vision::mod::ImageAnalyzer_Tensor3D::ImageAnalyzer_Tensor3D((uint64_t)v358, *v129);
      memset(&v357, 0, sizeof(v357));
      memset(&v356, 0, sizeof(v356));
      memset(&v355, 0, sizeof(v355));
      memset(&v354, 0, sizeof(v354));
      v351 = 0;
      v352 = 0;
      unint64_t v353 = 0;
      float v130 = v368;
      id v132 = v366;
      float v131 = v367;
      std::string::size_type v133 = v359.__r_.__value_.__r.__words[0];
      uint64_t v314 = v360;
      unint64_t v309 = v361;
      unint64_t v134 = v362;
      std::vector<int>::reserve(&v357, 0x3E8uLL);
      std::vector<int>::reserve(&v356, 0x3E8uLL);
      std::vector<int>::reserve(&v355, 0x3E8uLL);
      std::vector<int>::reserve(&v354, 0x3E8uLL);
      std::vector<float>::reserve(&v351, 0x3E8uLL);
      if (v309)
      {
        uint64_t v316 = 0;
        unint64_t v135 = ((char *)v131 - (char *)v132) << 30;
        unint64_t v136 = (int)(v131 - v132);
        unint64_t v313 = v134 / v136;
        unint64_t v137 = (v134 / v136);
        __pa = (void *)v137;
        unint64_t v331 = v135;
        do
        {
          if (v314)
          {
            uint64_t v138 = 0;
            std::string::size_type v315 = v133;
            do
            {
              if ((int)v313 >= 1)
              {
                uint64_t v139 = 0;
                int v140 = 0;
                std::vector<int>::pointer v141 = v357.__begin_;
                v324 = v356.__end_cap_.__value_;
                id v326 = v357.__end_cap_.__value_;
                std::vector<int>::pointer v142 = v356.__begin_;
                std::vector<int>::pointer v143 = v355.__begin_;
                v320 = v354.__end_cap_.__value_;
                v322 = v355.__end_cap_.__value_;
                v144 = v354.__begin_;
                unint64_t v318 = v353;
                v145 = (VNDisallowedList *)v351;
                uint64_t v335 = v138;
                do
                {
                  unint64_t v146 = v361 * v360;
                  float v147 = *(float *)(v133 + 4 * (v138 + v361 * v360 * (void)v140 * v136));
                  if (v147 < (float)(1.0 - v130) && v135 >> 33 != 0)
                  {
                    v344 = v144;
                    unsigned int v149 = 0;
                    float v150 = (float)(1.0 - v147) * 0.5;
                    uint64_t v151 = 4 * v146;
                    v152 = (float *)(v133 + 4 * v146 + 4 * (v138 + v146 * v139));
                    float v153 = -3.4028e38;
                    uint64_t v154 = 1;
                    do
                    {
                      if (*v152 > v150)
                      {
                        float v153 = *v152;
                        unsigned int v149 = v154;
                        if (!v154) {
                          goto LABEL_215;
                        }
                        goto LABEL_212;
                      }
                      if (*v152 > v153 && *v152 > v130)
                      {
                        float v153 = *v152;
                        unsigned int v149 = v154;
                      }
                      ++v154;
                      v152 = (float *)((char *)v152 + v151);
                    }
                    while (v136 != v154);
                    if (!v149)
                    {
LABEL_215:
                      v144 = v344;
                      goto LABEL_300;
                    }
LABEL_212:
                    if (v153 <= v366[v149]) {
                      goto LABEL_215;
                    }
                    std::vector<int>::pointer v155 = v357.__end_;
                    v339 = v145;
                    if (v357.__end_ >= v326)
                    {
                      uint64_t v157 = v357.__end_ - v141;
                      unint64_t v158 = v157 + 1;
                      if ((unint64_t)(v157 + 1) >> 62) {
                        goto LABEL_423;
                      }
                      if (((char *)v326 - (char *)v141) >> 1 > v158) {
                        unint64_t v158 = ((char *)v326 - (char *)v141) >> 1;
                      }
                      if ((unint64_t)((char *)v326 - (char *)v141) >= 0x7FFFFFFFFFFFFFFCLL) {
                        unint64_t v159 = 0x3FFFFFFFFFFFFFFFLL;
                      }
                      else {
                        unint64_t v159 = v158;
                      }
                      if (v159) {
                        unint64_t v159 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v159);
                      }
                      else {
                        uint64_t v160 = 0;
                      }
                      v161 = (int *)(v159 + 4 * v157);
                      int *v161 = v316;
                      float v156 = v161 + 1;
                      while (v155 != v141)
                      {
                        int v162 = *--v155;
                        *--v161 = v162;
                      }
                      id v326 = (int *)(v159 + 4 * v160);
                      v357.__end_ = v156;
                      if (v141) {
                        operator delete(v141);
                      }
                      std::vector<int>::pointer v141 = v161;
                      uint64_t v138 = v335;
                      v145 = v339;
                      unint64_t v137 = (unint64_t)__pa;
                      unint64_t v135 = v331;
                    }
                    else
                    {
                      *v357.__end_ = v316;
                      float v156 = v155 + 1;
                    }
                    v357.__end_ = v156;
                    std::vector<int>::pointer v163 = v356.__end_;
                    if (v356.__end_ >= v324)
                    {
                      uint64_t v165 = v356.__end_ - v142;
                      unint64_t v166 = v165 + 1;
                      if ((unint64_t)(v165 + 1) >> 62) {
                        goto LABEL_423;
                      }
                      if (((char *)v324 - (char *)v142) >> 1 > v166) {
                        unint64_t v166 = ((char *)v324 - (char *)v142) >> 1;
                      }
                      if ((unint64_t)((char *)v324 - (char *)v142) >= 0x7FFFFFFFFFFFFFFCLL) {
                        unint64_t v167 = 0x3FFFFFFFFFFFFFFFLL;
                      }
                      else {
                        unint64_t v167 = v166;
                      }
                      if (v167) {
                        unint64_t v167 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v167);
                      }
                      else {
                        uint64_t v168 = 0;
                      }
                      v169 = (int *)(v167 + 4 * v165);
                      int *v169 = v335;
                      unint64_t v164 = v169 + 1;
                      while (v163 != v142)
                      {
                        int v170 = *--v163;
                        *--v169 = v170;
                      }
                      v324 = (int *)(v167 + 4 * v168);
                      v356.__end_ = v164;
                      if (v142) {
                        operator delete(v142);
                      }
                      std::vector<int>::pointer v142 = v169;
                      uint64_t v138 = v335;
                      v145 = v339;
                      unint64_t v137 = (unint64_t)__pa;
                      unint64_t v135 = v331;
                    }
                    else
                    {
                      *v356.__end_ = v138;
                      unint64_t v164 = v163 + 1;
                    }
                    v356.__end_ = v164;
                    std::vector<int>::pointer v171 = v355.__end_;
                    if (v355.__end_ >= v322)
                    {
                      uint64_t v173 = v355.__end_ - v143;
                      unint64_t v174 = v173 + 1;
                      if ((unint64_t)(v173 + 1) >> 62) {
                        goto LABEL_423;
                      }
                      if (((char *)v322 - (char *)v143) >> 1 > v174) {
                        unint64_t v174 = ((char *)v322 - (char *)v143) >> 1;
                      }
                      if ((unint64_t)((char *)v322 - (char *)v143) >= 0x7FFFFFFFFFFFFFFCLL) {
                        unint64_t v175 = 0x3FFFFFFFFFFFFFFFLL;
                      }
                      else {
                        unint64_t v175 = v174;
                      }
                      if (v175) {
                        unint64_t v175 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v175);
                      }
                      else {
                        uint64_t v176 = 0;
                      }
                      v177 = (int *)(v175 + 4 * v173);
                      int *v177 = (int)v140;
                      int v172 = v177 + 1;
                      while (v171 != v143)
                      {
                        int v178 = *--v171;
                        *--v177 = v178;
                      }
                      v322 = (int *)(v175 + 4 * v176);
                      v355.__end_ = v172;
                      if (v143) {
                        operator delete(v143);
                      }
                      std::vector<int>::pointer v143 = v177;
                      unint64_t v137 = (unint64_t)__pa;
                      unint64_t v135 = v331;
                      uint64_t v138 = v335;
                    }
                    else
                    {
                      *v355.__end_ = (int)v140;
                      int v172 = v171 + 1;
                    }
                    v355.__end_ = v172;
                    std::vector<int>::pointer v179 = v354.__end_;
                    if (v354.__end_ >= v320)
                    {
                      v145 = v339;
                      uint64_t v181 = v354.__end_ - v344;
                      unint64_t v182 = v181 + 1;
                      if ((unint64_t)(v181 + 1) >> 62)
                      {
LABEL_423:
                        v357.__end_cap_.__value_ = v326;
                        v356.__end_cap_.__value_ = v324;
                        v357.__begin_ = v141;
                        v355.__end_cap_.__value_ = v322;
                        v356.__begin_ = v142;
                        v354.__end_cap_.__value_ = v320;
                        v355.__begin_ = v143;
                        v354.__begin_ = v344;
                        unint64_t v353 = v318;
                        v351 = v145;
                        std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
                      }
                      if (((char *)v320 - (char *)v344) >> 1 > v182) {
                        unint64_t v182 = ((char *)v320 - (char *)v344) >> 1;
                      }
                      if ((unint64_t)((char *)v320 - (char *)v344) >= 0x7FFFFFFFFFFFFFFCLL) {
                        unint64_t v183 = 0x3FFFFFFFFFFFFFFFLL;
                      }
                      else {
                        unint64_t v183 = v182;
                      }
                      if (v183) {
                        unint64_t v183 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v183);
                      }
                      else {
                        uint64_t v184 = 0;
                      }
                      v185 = (int *)(v183 + 4 * v181);
                      int *v185 = v149;
                      int v180 = v185 + 1;
                      while (v179 != v344)
                      {
                        int v186 = *--v179;
                        *--v185 = v186;
                      }
                      v320 = (int *)(v183 + 4 * v184);
                      v354.__end_ = v180;
                      if (v344) {
                        operator delete(v344);
                      }
                      v344 = v185;
                      uint64_t v138 = v335;
                      v145 = v339;
                      unint64_t v137 = (unint64_t)__pa;
                      unint64_t v135 = v331;
                    }
                    else
                    {
                      *v354.__end_ = v149;
                      int v180 = v179 + 1;
                      v145 = v339;
                    }
                    v354.__end_ = v180;
                    v187 = v352;
                    if ((unint64_t)v352 >= v318)
                    {
                      uint64_t v189 = ((char *)v352 - (char *)v145) >> 2;
                      unint64_t v190 = v189 + 1;
                      if ((unint64_t)(v189 + 1) >> 62)
                      {
                        v357.__end_cap_.__value_ = v326;
                        v356.__end_cap_.__value_ = v324;
                        v357.__begin_ = v141;
                        v355.__end_cap_.__value_ = v322;
                        v356.__begin_ = v142;
                        v354.__end_cap_.__value_ = v320;
                        v355.__begin_ = v143;
                        unint64_t v353 = v318;
                        v354.__begin_ = v344;
                        v351 = v145;
                        std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
                      }
                      if ((uint64_t)(v318 - (void)v145) >> 1 > v190) {
                        unint64_t v190 = (uint64_t)(v318 - (void)v145) >> 1;
                      }
                      if (v318 - (unint64_t)v145 >= 0x7FFFFFFFFFFFFFFCLL) {
                        unint64_t v191 = 0x3FFFFFFFFFFFFFFFLL;
                      }
                      else {
                        unint64_t v191 = v190;
                      }
                      if (v191) {
                        unint64_t v191 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v191);
                      }
                      else {
                        uint64_t v192 = 0;
                      }
                      v193 = (float *)(v191 + 4 * v189);
                      float *v193 = v153;
                      unsigned int v188 = v193 + 1;
                      while (v187 != (float *)v145)
                      {
                        int v194 = *((_DWORD *)v187-- - 1);
                        *((_DWORD *)v193-- - 1) = v194;
                      }
                      unint64_t v318 = v191 + 4 * v192;
                      v352 = v188;
                      if (v145) {
                        operator delete(v145);
                      }
                      v145 = (VNDisallowedList *)v193;
                      unint64_t v137 = (unint64_t)__pa;
                      unint64_t v135 = v331;
                      v144 = v344;
                      uint64_t v138 = v335;
                    }
                    else
                    {
                      float *v352 = v153;
                      unsigned int v188 = v187 + 1;
                      v144 = v344;
                    }
                    v352 = v188;
                    std::string::size_type v133 = v315;
                  }
LABEL_300:
                  int v140 = (char *)v140 + 1;
                  v139 += v136;
                }
                while (v140 != (void *)v137);
                v357.__end_cap_.__value_ = v326;
                v356.__end_cap_.__value_ = v324;
                v357.__begin_ = v141;
                v355.__end_cap_.__value_ = v322;
                v356.__begin_ = v142;
                v354.__end_cap_.__value_ = v320;
                v355.__begin_ = v143;
                unint64_t v353 = v318;
                v354.__begin_ = v144;
                v351 = v145;
              }
              ++v138;
            }
            while (v138 != v314);
          }
          v133 += 4 * v364;
          ++v316;
        }
        while (v316 != v309);
      }
      if ((int)((unint64_t)((char *)v357.__end_ - (char *)v357.__begin_) >> 2) > 0)
      {
        uint64_t v195 = 0;
        float v332 = 1.0 / (float)v309;
        uint64_t v196 = ((unint64_t)((char *)v357.__end_ - (char *)v357.__begin_) >> 2);
        do
        {
          uint64_t v197 = v356.__begin_[v195];
          uint64_t v198 = v357.__begin_[v195];
          uint64_t v199 = v355.__begin_[v195];
          int v200 = v354.__begin_[v195];
          int v201 = *((_DWORD *)v351 + v195);
          unsigned int v202 = *(float **)(*(void *)(*(void *)(v312 + 536) + 24 * v308) + 24 * (int)v199);
          float v204 = *v202;
          float v203 = v202[1];
          int v205 = 4 * v199;
          float v206 = vision::mod::ImageAnalyzer_Tensor3D::valueAt((vision::mod::ImageAnalyzer_Tensor3D *)v358, v198, v197, 4 * v199);
          float v207 = vision::mod::ImageAnalyzer_Tensor3D::valueAt((vision::mod::ImageAnalyzer_Tensor3D *)v358, v198, v197, v205 | 1);
          float v208 = vision::mod::ImageAnalyzer_Tensor3D::valueAt((vision::mod::ImageAnalyzer_Tensor3D *)v358, v198, v197, v205 | 2);
          float v345 = v207;
          float v209 = vision::mod::ImageAnalyzer_Tensor3D::valueAt((vision::mod::ImageAnalyzer_Tensor3D *)v358, v198, v197, v205 | 3);
          float v340 = v203;
          int v336 = v201;
          double v210 = *(float **)(v312 + 464);
          float v211 = *v210;
          float v212 = v210[1];
          float v213 = expf(v208 * v210[2]);
          float v214 = expf(v209 * v210[3]);
          double v215 = std::__hash_table<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::__unordered_map_hasher<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::__unordered_map_equal<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::allocator<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>>>::find<vision::mod::ImageAnalyzer_AnalysisType>(v311, 0x40u);
          if (!v215) {
            std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
          }
          v370 = (unsigned __int8 *)(v215[3] + 24 * v200);
          v216 = std::__hash_table<std::__hash_value_type<std::string,std::vector<std::tuple<float,_Geometry2D_rect2D_>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<std::tuple<float,_Geometry2D_rect2D_>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<std::tuple<float,_Geometry2D_rect2D_>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<std::tuple<float,_Geometry2D_rect2D_>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)&v348, v370, (long long **)&v370);
          v217 = v216;
          float v218 = (float)(v332 * (float)((float)(int)v197 + 0.5)) + (float)((float)(v204 * v206) * v211);
          float v219 = (float)(v332 * (float)((float)(int)v198 + 0.5)) + (float)((float)(v340 * v345) * v212);
          float v220 = v204 * v213;
          float v221 = v340 * v214;
          float v222 = v218 - (float)((float)(v204 * v213) * 0.5);
          float v223 = v219 - (float)((float)(v340 * v214) * 0.5);
          unint64_t v224 = *((void *)v216 + 6);
          unint64_t v225 = *((void *)v216 + 7);
          if (v224 >= v225)
          {
            uint64_t v227 = *((void *)v216 + 5);
            unint64_t v228 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v224 - v227) >> 2);
            unint64_t v229 = v228 + 1;
            if (v228 + 1 > 0xCCCCCCCCCCCCCCCLL) {
              std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
            }
            unint64_t v230 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v225 - v227) >> 2);
            if (2 * v230 > v229) {
              unint64_t v229 = 2 * v230;
            }
            if (v230 >= 0x666666666666666) {
              unint64_t v231 = 0xCCCCCCCCCCCCCCCLL;
            }
            else {
              unint64_t v231 = v229;
            }
            if (v231) {
              unint64_t v231 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::tuple<float,_Geometry2D_rect2D_>>>(v231);
            }
            else {
              uint64_t v232 = 0;
            }
            unint64_t v233 = v231 + 20 * v228;
            *(_DWORD *)unint64_t v233 = v336;
            *(float *)(v233 + 4) = v222;
            *(float *)(v233 + 8) = v223;
            *(float *)(v233 + 12) = v221;
            *(float *)(v233 + 16) = v220;
            float v235 = (char *)*((void *)v217 + 5);
            int v234 = (char *)*((void *)v217 + 6);
            unint64_t v236 = v233;
            if (v234 != v235)
            {
              do
              {
                long long v237 = *(_OWORD *)(v234 - 20);
                *(_DWORD *)(v236 - 4) = *((_DWORD *)v234 - 1);
                *(_OWORD *)(v236 - 20) = v237;
                v236 -= 20;
                v234 -= 20;
              }
              while (v234 != v235);
              int v234 = (char *)*((void *)v217 + 5);
            }
            unint64_t v226 = v233 + 20;
            *((void *)v217 + 5) = v236;
            *((void *)v217 + 6) = v233 + 20;
            *((void *)v217 + 7) = v231 + 20 * v232;
            if (v234) {
              operator delete(v234);
            }
          }
          else
          {
            *(_DWORD *)unint64_t v224 = v336;
            *(float *)(v224 + 4) = v222;
            *(float *)(v224 + 8) = v223;
            *(float *)(v224 + 12) = v221;
            unint64_t v226 = v224 + 20;
            *(float *)(v224 + 16) = v220;
          }
          *((void *)v217 + 6) = v226;
          ++v195;
        }
        while (v195 != v196);
      }
      if (v351) {
        operator delete(v351);
      }
      uint64_t v112 = v312;
      if (v354.__begin_) {
        operator delete(v354.__begin_);
      }
      if (v355.__begin_) {
        operator delete(v355.__begin_);
      }
      if (v356.__begin_) {
        operator delete(v356.__begin_);
      }
      if (v357.__begin_) {
        operator delete(v357.__begin_);
      }
      vision::mod::ImageAnalyzer_Tensor3D::~ImageAnalyzer_Tensor3D((vision::mod::ImageAnalyzer_Tensor3D *)v358);
      vision::mod::ImageAnalyzer_Tensor3D::~ImageAnalyzer_Tensor3D((vision::mod::ImageAnalyzer_Tensor3D *)&v359);
      uint64_t v128 = v308 + 1;
    }
    while ((unint64_t)(v308 + 1) < *(void *)(v312 + 432));
  }
  if (v366)
  {
    v367 = v366;
    operator delete(v366);
  }
LABEL_337:
  v359.__r_.__value_.__r.__words[0] = (std::string::size_type)&v369;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v359);
  if (*(unsigned char *)(v112 + 460))
  {
    unsigned int v238 = (char **)v349;
    if ((void)v349)
    {
      while (2)
      {
        unint64_t v239 = (unint64_t)v238[5];
        unsigned int v240 = (int *)v238[6];
        id v241 = v238 + 5;
        if (v240 == (int *)v239) {
          goto LABEL_389;
        }
        v359.__r_.__value_.__r.__words[0] = (std::string::size_type)vision::mod::sortDetectionsByConfidence;
        std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(std::tuple<float,_Geometry2D_rect2D_>,std::tuple<float,_Geometry2D_rect2D_>),std::tuple<float,_Geometry2D_rect2D_>*,false>(v239, v240, (uint64_t (**)(long long *, long long *))&v359, 126 - 2 * __clz(0xCCCCCCCCCCCCCCCDLL * ((uint64_t)((uint64_t)v240 - v239) >> 2)), 1);
        v243 = v238[5];
        unsigned int v242 = v238[6];
        memset(&v359, 0, sizeof(v359));
        uint64_t v244 = v242 - v243;
        __pb = v238;
        if (!v244)
        {
          uint64_t v341 = 0;
          unint64_t v250 = 0;
          goto LABEL_385;
        }
        unint64_t v245 = 0xCCCCCCCCCCCCCCCDLL * (v244 >> 2);
        std::vector<BOOL>::__vallocate[abi:ne180100](&v359, v245);
        std::string::size_type v246 = v359.__r_.__value_.__l.__size_;
        unint64_t v247 = v359.__r_.__value_.__l.__size_ + v245;
        v359.__r_.__value_.__l.__size_ += v245;
        if (v246)
        {
          unint64_t v248 = v247 - 1;
          if (((v247 - 1) ^ (v246 - 1)) <= 0x3F)
          {
            std::string::size_type v249 = v359.__r_.__value_.__r.__words[0];
LABEL_350:
            *(void *)&v358[0] = v249 + 8 * (v246 >> 6);
            DWORD2(v358[0]) = v246 & 0x3F;
            std::__fill_n[abi:ne180100]<false,std::vector<BOOL>>((uint64_t)v358, v245);
            uint64_t v341 = 0;
            v346 = 0;
            unint64_t v250 = 0;
            unint64_t v253 = 0;
            if (v245 <= 1) {
              uint64_t v254 = 1;
            }
            else {
              uint64_t v254 = v245;
            }
            uint64_t v255 = 24;
            uint64_t v256 = 1;
            uint64_t v333 = v254;
            int8x16_t v337 = v238 + 5;
            do
            {
              if ((*(void *)(v359.__r_.__value_.__r.__words[0] + ((v253 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v253))
              {
                ++v253;
              }
              else
              {
                uint64_t v257 = (uint64_t)&(*v241)[20 * v253];
                if (v250 >= (unint64_t)v346)
                {
                  unint64_t v259 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v250 - (void)v341) >> 2) + 1;
                  if (v259 > 0xCCCCCCCCCCCCCCCLL) {
                    std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
                  }
                  if (0x999999999999999ALL * ((v346 - (unsigned char *)v341) >> 2) > v259) {
                    unint64_t v259 = 0x999999999999999ALL * ((v346 - (unsigned char *)v341) >> 2);
                  }
                  if (0xCCCCCCCCCCCCCCCDLL * ((v346 - (unsigned char *)v341) >> 2) >= 0x666666666666666) {
                    unint64_t v260 = 0xCCCCCCCCCCCCCCCLL;
                  }
                  else {
                    unint64_t v260 = v259;
                  }
                  if (v260) {
                    unint64_t v260 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::tuple<float,_Geometry2D_rect2D_>>>(v260);
                  }
                  else {
                    uint64_t v261 = 0;
                  }
                  long long v262 = *(_OWORD *)v257;
                  unint64_t v263 = v260 + 4 * ((uint64_t)(v250 - (void)v341) >> 2);
                  *(_DWORD *)(v263 + 16) = *(_DWORD *)(v257 + 16);
                  *(_OWORD *)unint64_t v263 = v262;
                  if ((VNDisallowedList *)v250 == v341)
                  {
                    v265 = (VNDisallowedList *)(v260 + 4 * ((uint64_t)(v250 - (void)v341) >> 2));
                  }
                  else
                  {
                    unint64_t v264 = v260 + 4 * ((uint64_t)(v250 - (void)v341) >> 2);
                    do
                    {
                      v265 = (VNDisallowedList *)(v264 - 20);
                      long long v266 = *(_OWORD *)(v250 - 20);
                      *(_DWORD *)(v264 - 4) = *(_DWORD *)(v250 - 4);
                      *(_OWORD *)(v264 - 20) = v266;
                      v250 -= 20;
                      v264 -= 20;
                    }
                    while ((VNDisallowedList *)v250 != v341);
                  }
                  v346 = (unsigned char *)(v260 + 20 * v261);
                  unint64_t v250 = v263 + 20;
                  if (v341) {
                    operator delete(v341);
                  }
                  uint64_t v341 = v265;
                }
                else
                {
                  long long v258 = *(_OWORD *)v257;
                  *(_DWORD *)(v250 + 16) = *(_DWORD *)(v257 + 16);
                  *(_OWORD *)unint64_t v250 = v258;
                  v250 += 20;
                }
                v267 = *v241;
                v358[0] = *(_OWORD *)&(*v241)[20 * v253++ + 4];
                if (v245 > v253)
                {
                  std::string::size_type v268 = v359.__r_.__value_.__r.__words[0];
                  unsigned int v269 = &v267[v255];
                  unint64_t v270 = v256;
                  do
                  {
                    if ((*(void *)(v268 + 8 * (v270 >> 6)) & (1 << v270)) == 0)
                    {
                      *(_OWORD *)&v369.__r_.__value_.__l.__data_ = *(_OWORD *)v269;
                      uint64_t v271 = *((void *)&v358[0] + 1);
                      std::string::size_type v272 = v369.__r_.__value_.__l.__size_;
                      Geometry2D_intersectRect2D((float *)v358, (float *)&v369);
                      float v275 = (float)((float)(*((float *)&v272 + 1) * *(float *)&v272)
                                   + (float)(*((float *)&v271 + 1) * *(float *)&v271))
                           - (float)(v274 * v273);
                      float v276 = (float)(v274 * v273) / v275;
                      if (v275 <= 0.0) {
                        float v276 = NAN;
                      }
                      if (v276 > v6) {
                        *(void *)(v268 + 8 * (v270 >> 6)) |= 1 << v270;
                      }
                    }
                    ++v270;
                    v269 += 20;
                  }
                  while (v245 > v270);
                }
                uint64_t v254 = v333;
                id v241 = v337;
              }
              ++v256;
              v255 += 20;
            }
            while (v253 != v254);
LABEL_385:
            unsigned int v238 = __pb;
            __pb[6] = __pb[5];
            std::vector<std::tuple<float,_Geometry2D_rect2D_>>::__assign_with_size[abi:ne180100]<std::tuple<float,_Geometry2D_rect2D_>*,std::tuple<float,_Geometry2D_rect2D_>*>(v241, (long long *)v341, (long long *)v250, 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v250 - (void)v341) >> 2));
            if (v341) {
              operator delete(v341);
            }
            if (v359.__r_.__value_.__r.__words[0]) {
              operator delete(v359.__r_.__value_.__l.__data_);
            }
LABEL_389:
            unsigned int v238 = (char **)*v238;
            if (!v238) {
              goto LABEL_390;
            }
            continue;
          }
        }
        else
        {
          unint64_t v248 = v247 - 1;
        }
        break;
      }
      std::string::size_type v249 = v359.__r_.__value_.__r.__words[0];
      unint64_t v251 = v248 >> 6;
      if (v247 >= 0x41) {
        unint64_t v252 = v251;
      }
      else {
        unint64_t v252 = 0;
      }
      *(void *)(v359.__r_.__value_.__r.__words[0] + 8 * v252) = 0;
      goto LABEL_350;
    }
  }
LABEL_390:
  uint64_t v277 = *((void *)&v349 + 1);
  kdebug_trace();
  id v347 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v277];
  if (v277)
  {
    if (v307 == 1 || v307 == 3737841667)
    {
      std::string::basic_string[abi:ne180100]<0>(&v359, "fruit");
      id v278 = std::__hash_table<std::__hash_value_type<std::string,vision::mod::ImageClassfier_GraphNode *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,vision::mod::ImageClassfier_GraphNode *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,vision::mod::ImageClassfier_GraphNode *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,vision::mod::ImageClassfier_GraphNode *>>>::find<std::string>(&v348, (unsigned __int8 *)&v359);
      unsigned int v279 = (long long **)v278;
      if (SHIBYTE(v359.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(v359.__r_.__value_.__l.__data_);
        if (!v279) {
          goto LABEL_401;
        }
      }
      else if (!v278)
      {
        goto LABEL_401;
      }
      std::string::basic_string[abi:ne180100]<0>(&v359, "vegetable");
      *(void *)&v358[0] = &v359;
      id v280 = (char **)std::__hash_table<std::__hash_value_type<std::string,std::vector<std::tuple<float,_Geometry2D_rect2D_>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<std::tuple<float,_Geometry2D_rect2D_>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<std::tuple<float,_Geometry2D_rect2D_>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<std::tuple<float,_Geometry2D_rect2D_>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&v348, (unsigned __int8 *)&v359, (long long **)v358);
      if (v280 != (char **)v279) {
        std::vector<std::tuple<float,_Geometry2D_rect2D_>>::__assign_with_size[abi:ne180100]<std::tuple<float,_Geometry2D_rect2D_>*,std::tuple<float,_Geometry2D_rect2D_>*>(v280 + 5, v279[5], v279[6], 0xCCCCCCCCCCCCCCCDLL * (((char *)v279[6] - (char *)v279[5]) >> 2));
      }
      if (SHIBYTE(v359.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v359.__r_.__value_.__l.__data_);
      }
LABEL_401:
      std::string::basic_string[abi:ne180100]<0>(&v359, "fish");
      id v281 = std::__hash_table<std::__hash_value_type<std::string,vision::mod::ImageClassfier_GraphNode *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,vision::mod::ImageClassfier_GraphNode *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,vision::mod::ImageClassfier_GraphNode *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,vision::mod::ImageClassfier_GraphNode *>>>::find<std::string>(&v348, (unsigned __int8 *)&v359);
      id v282 = (long long **)v281;
      if (SHIBYTE(v359.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(v359.__r_.__value_.__l.__data_);
        if (!v282) {
          goto LABEL_409;
        }
      }
      else if (!v281)
      {
        goto LABEL_409;
      }
      std::string::basic_string[abi:ne180100]<0>(&v359, "seafood");
      *(void *)&v358[0] = &v359;
      id v283 = (char **)std::__hash_table<std::__hash_value_type<std::string,std::vector<std::tuple<float,_Geometry2D_rect2D_>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<std::tuple<float,_Geometry2D_rect2D_>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<std::tuple<float,_Geometry2D_rect2D_>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<std::tuple<float,_Geometry2D_rect2D_>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&v348, (unsigned __int8 *)&v359, (long long **)v358);
      if (v283 != (char **)v282) {
        std::vector<std::tuple<float,_Geometry2D_rect2D_>>::__assign_with_size[abi:ne180100]<std::tuple<float,_Geometry2D_rect2D_>*,std::tuple<float,_Geometry2D_rect2D_>*>(v283 + 5, v282[5], v282[6], 0xCCCCCCCCCCCCCCCDLL * (((char *)v282[6] - (char *)v282[5]) >> 2));
      }
      if (SHIBYTE(v359.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v359.__r_.__value_.__l.__data_);
      }
    }
LABEL_409:
    v342 = [v305 disallowedList];
    for (n = (uint64_t *)v349; n; n = (uint64_t *)*n)
    {
      if (n[6] != n[5])
      {
        id v285 = [NSString alloc];
        v286 = n + 2;
        if (*((char *)n + 39) < 0) {
          v286 = (void *)*v286;
        }
        uint64_t v287 = (NSString *)[v285 initWithUTF8String:v286];
        if (_isAcceptableClassificationIdentifier(v287, v342))
        {
          unsigned int v289 = (float *)n[5];
          v288 = (int *)n[6];
          while (v289 != (float *)v288)
          {
            v373.origin.double x = v289[1];
            v373.size.double height = v289[3];
            v373.size.double width = v289[4];
            v373.origin.double y = 1.0 - (v289[2] + v373.size.height);
            v375.origin.double x = 0.0;
            v375.origin.double y = 0.0;
            v375.size.double width = 1.0;
            v375.size.double height = 1.0;
            CGRect v374 = CGRectIntersection(v373, v375);
            double x = v374.origin.x;
            double y = v374.origin.y;
            double width = v374.size.width;
            double height = v374.size.height;
            float v294 = *v289;
            v295 = [VNClassificationObservation alloc];
            *(float *)&double v296 = v294;
            v297 = [(VNClassificationObservation *)v295 initWithOriginatingRequestSpecifier:v310 identifier:v287 confidence:v296];
            char v298 = [VNRecognizedObjectObservation alloc];
            v371[0] = v297;
            v299 = [MEMORY[0x1E4F1C978] arrayWithObjects:v371 count:1];
            *(float *)&double v300 = v294;
            v301 = -[VNRecognizedObjectObservation initWithOriginatingRequestSpecifier:boundingBox:confidence:labels:segmentationMask:groupId:](v298, "initWithOriginatingRequestSpecifier:boundingBox:confidence:labels:segmentationMask:groupId:", v310, v299, 0, 0, x, y, width, height, v300);

            [v347 addObject:v301];
            v289 += 5;
          }
        }
      }
    }
    id v302 = &__block_literal_global_133;
    [v347 sortWithOptions:16 usingComparator:&__block_literal_global_133];
  }
  kdebug_trace();
  [v304 receiveObservations:v347];
  std::__hash_table<std::__hash_value_type<std::string,std::vector<float>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<float>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<float>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<float>>>>::~__hash_table((uint64_t)&v348);

  return v347;
}

- (id)_processLastAnalysisForVN5kJNH3eYuyaLxNpZr5Z7ziConfiguration:(void *)a3 error:
{
  id v5 = a2;
  float v6 = [v5 observationsRecipient];
  int8x8_t v7 = [v6 originatingRequestSpecifier];
  [v7 requestClassCode];
  [v7 requestRevision];
  kdebug_trace();
  [(VNImageAnalyzerMultiDetector *)&v11 _VN5kJNH3eYuyaLxNpZr5Z7ziCustomClassifierAndReturnError:a3];
  uint8x8_t v8 = v11;
  if (v11)
  {
    vision::mod::ImageAnalyzer::getSceneRepresentation((vision::mod::ImageAnalyzer *)v10, *(void *)(a1 + 112));
    vision::mod::ImageAnalyzer_CustomClassifier::performInference();
  }
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v12);
  }

  return v8;
}

- (id)_processLastAnalysisForSignificantEventConfiguration:(void *)a3 error:
{
  id v5 = a2;
  float v6 = [v5 observationsRecipient];
  int8x8_t v7 = [v6 originatingRequestSpecifier];
  [v7 requestClassCode];
  [v7 requestRevision];
  kdebug_trace();
  [(VNImageAnalyzerMultiDetector *)&v11 _VNdGg5skzXHSAENO6T3enHECustomClassifierForOriginatingRequestSpecifier:a3];
  uint8x8_t v8 = v11;
  if (v11)
  {
    vision::mod::ImageAnalyzer::getSceneRepresentation((vision::mod::ImageAnalyzer *)v10, *(void *)(a1 + 112));
    vision::mod::ImageAnalyzer_CustomClassifier::performInference();
  }
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v12);
  }

  return v8;
}

- (id)_processLastAnalysisForCityNatureConfiguration:(void *)a3 error:
{
  id v5 = a2;
  float v6 = [v5 observationsRecipient];
  int8x8_t v7 = [v6 originatingRequestSpecifier];
  [v7 requestClassCode];
  [v7 requestRevision];
  kdebug_trace();
  [(VNImageAnalyzerMultiDetector *)&v11 _cityNatureCustomClassifierAndReturnError:a3];
  uint8x8_t v8 = v11;
  if (v11)
  {
    vision::mod::ImageAnalyzer::getSceneRepresentation((vision::mod::ImageAnalyzer *)v10, *(void *)(a1 + 112));
    vision::mod::ImageAnalyzer_CustomClassifier::performInference();
  }
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v12);
  }

  return v8;
}

- (id)_processLastAnalysisForPhotosAdjustmentsConfiguration:(void *)a3 error:
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v34 = a2;
  id v5 = [*(id *)(a1 + 80) sliderNetBlobNamePrefix];
  if (v5)
  {
    float v6 = v5;
    id v33 = v5;
    uint64_t v35 = [v5 length];
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v6 UTF8String]);
    vision::mod::ImageAnalyzer::getSlidersAdjustments((vision::mod::ImageAnalyzer *)v37, *(void **)(a1 + 112));
    id v7 = objc_alloc(MEMORY[0x1E4F1CA60]);
    uint64_t v36 = (void *)[v7 initWithCapacity:v39];
    for (std::string::size_type i = v38; i; std::string::size_type i = (uint64_t *)*i)
    {
      uint64_t v9 = i + 2;
      char v10 = *((unsigned char *)i + 39);
      if (v10 < 0)
      {
        uint64_t v11 = (char *)i[2];
        uint64_t v12 = i[3];
      }
      else
      {
        uint64_t v11 = (char *)(i + 2);
        uint64_t v12 = *((unsigned __int8 *)i + 39);
      }
      if ((v41 & 0x80u) == 0) {
        uint64_t v13 = __p;
      }
      else {
        uint64_t v13 = (void **)__p[0];
      }
      if ((v41 & 0x80u) == 0) {
        int64_t v14 = v41;
      }
      else {
        int64_t v14 = (int64_t)__p[1];
      }
      uint64_t v15 = v35;
      if (v14)
      {
        if (v12 >= v14)
        {
          int v22 = &v11[v12];
          int v23 = *(char *)v13;
          id v24 = v11;
          do
          {
            uint64_t v25 = v12 - v14;
            if (v25 == -1) {
              break;
            }
            uint64_t v26 = (char *)memchr(v24, v23, v25 + 1);
            if (!v26) {
              break;
            }
            id v27 = v26;
            if (!memcmp(v26, v13, v14))
            {
              if (v27 != v22)
              {
                uint64_t v15 = v35;
                if (v27 - v11 != -1) {
                  goto LABEL_15;
                }
              }
              break;
            }
            id v24 = v27 + 1;
            uint64_t v12 = v22 - (v27 + 1);
          }
          while (v12 >= v14);
        }
        uint64_t v15 = 0;
      }
LABEL_15:
      if (v10 < 0) {
        uint64_t v9 = (void *)*v9;
      }
      int v16 = (void *)[[NSString alloc] initWithUTF8String:(char *)v9 + v15];
      id v17 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:(i[6] - i[5]) >> 2];
      long long v19 = (_DWORD *)i[5];
      v20 = (_DWORD *)i[6];
      while (v19 != v20)
      {
        LODWORD(v18) = *v19;
        v21 = [NSNumber numberWithFloat:v18];
        [v17 addObject:v21];

        ++v19;
      }
      [v36 setObject:v17 forKey:v16];
    }
    uint64_t v28 = [v34 observationsRecipient];
    float v29 = [v28 originatingRequestSpecifier];
    uint64_t v30 = [[VN1vLyVSh30UQ26TGBoV8MHv alloc] initWithOriginatingRequestSpecifier:v29 adjustments:v36];
    v42[0] = v30;
    std::string::size_type v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:1];
    [v28 receiveObservations:v31];

    std::__hash_table<std::__hash_value_type<std::string,std::vector<float>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<float>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<float>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<float>>>>::~__hash_table((uint64_t)v37);
    if ((char)v41 < 0) {
      operator delete(__p[0]);
    }
    goto LABEL_35;
  }
  if (a3)
  {
    id v33 = 0;
    +[VNError errorForDataUnavailableWithLocalizedDescription:@"adjustments prefix is not available"];
    std::string::size_type v31 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_35:
    id v5 = v33;
    goto LABEL_36;
  }
  std::string::size_type v31 = 0;
LABEL_36:

  return v31;
}

- (id)_processSaliencyTensor:(double)a3 regionOfInterest:(double)a4 originalImageSize:(double)a5 options:(double)a6 saliencyConfiguration:(uint64_t)a7 saliencyGeneratorType:(int8x16_t *)a8 startCode:(void *)a9 finishCode:(void *)a10 qosClass:(void *)a11 warningRecorder:(uint64_t)a12 error:(uint64_t)a13
{
  v50[1] = *MEMORY[0x1E4F143B8];
  id v45 = a9;
  id v25 = a10;
  id v44 = a11;
  unsigned __int8 v41 = v25;
  id v42 = a15;
  float v43 = [v25 observationsRecipient];
  uint64_t v26 = [v43 originatingRequestSpecifier];
  [v26 requestClassCode];
  [v26 requestRevision];
  kdebug_trace();
  int v48 = 0;
  memset(v47, 0, sizeof(v47));
  vision::mod::ImageAnalyzer_Tensor2D::getVImageBufferFromTensor((uint64_t)v47, a8, &v48);
  unsigned int v46 = 0;
  CVPixelBufferRef DeepCopyCVPixelBufferFromVImageBuffer = ImageProcessing_createDeepCopyCVPixelBufferFromVImageBuffer((char **)v47, v48, (int *)&v46);
  if (DeepCopyCVPixelBufferFromVImageBuffer)
  {
    uint64_t v28 = DeepCopyCVPixelBufferFromVImageBuffer;
    float v29 = +[VNValidationUtilities requiredSessionInOptions:v45 error:a16];
    if (v29)
    {
      uint64_t v30 = (void *)[(id)objc_opt_class() _newSaliencyHeatmapBoundingBoxGeneratorOptionsForOptions:v45];
      id v40 = [v29 detectorOfType:v44 configuredWithOptions:v30 error:a16];
      if (v40)
      {
        std::string::size_type v31 = [VNImageBuffer alloc];
        uint64_t v39 = [(VNImageBuffer *)v31 initWithCVPixelBuffer:v28 orientation:1 options:MEMORY[0x1E4F1CC08] session:v29];
        v50[0] = v39;
        id v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:1];
        [v30 setObject:v32 forKeyedSubscript:@"VNDetectorProcessOption_InputImageBuffers"];

        [v30 setObject:v26 forKeyedSubscript:@"VNDetectorOption_OriginatingRequestSpecifier"];
        if ([v26 observationProvidesBoundsNormalizedToROI]) {
          double v34 = 0.0;
        }
        else {
          double v34 = a1;
        }
        uint64_t v35 = [v40 processUsingQualityOfServiceClass:a14 options:v30 regionOfInterest:0 warningRecorder:a16 error:0 progressHandler:v34];
        if (v35)
        {
          uint64_t v36 = -[VNSaliencyImageObservation initWithOriginatingRequestSpecifier:rawSaliencyImage:originalImageSize:salientObjectBoundingBoxes:]([VNSaliencyImageObservation alloc], "initWithOriginatingRequestSpecifier:rawSaliencyImage:originalImageSize:salientObjectBoundingBoxes:", v26, v28, v35, a3 * (double)(unint64_t)a5, a4 * (double)(unint64_t)a6);
          kdebug_trace();
          uint64_t v49 = v36;
          unint64_t v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
          [v43 receiveObservations:v37];
        }
        else
        {
          unint64_t v37 = 0;
        }
      }
      else
      {
        unint64_t v37 = 0;
      }
    }
    else
    {
      unint64_t v37 = 0;
    }

    CVPixelBufferRelease(v28);
  }
  else if (a16)
  {
    +[VNError errorForOSStatus:v46 localizedDescription:@"failed to create saliency heat map image"];
    unint64_t v37 = 0;
    *a16 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unint64_t v37 = 0;
  }

  return v37;
}

- (void)_potentialLandmarksCustomClassifierAndReturnError:(void *)a3
{
  if (!a2)
  {
    *a1 = 0;
    a1[1] = 0;
    return;
  }
  uint64_t v5 = *(void *)(a2 + 200);
  if (v5) {
    goto LABEL_12;
  }
  id v7 = [*(id *)(a2 + 80) potentialLandmarksCustomClassifierDescriptor];
  [(VNImageAnalyzerMultiDetector *)&v12 _loadCustomClassifierWithDescriptor:v7 error:a3];

  uint8x8_t v8 = v12;
  if (v12)
  {
    uint64_t v9 = v13;
    if (v13) {
      atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    char v10 = *(std::__shared_weak_count **)(a2 + 208);
    *(void *)(a2 + 200) = v8;
    *(void *)(a2 + 208) = v9;
    if (v10) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v10);
    }
    if (!v9) {
      goto LABEL_10;
    }
  }
  else
  {
    *a1 = 0;
    a1[1] = 0;
    uint64_t v9 = v13;
    if (!v13) {
      goto LABEL_10;
    }
  }
  std::__shared_weak_count::__release_shared[abi:nn180100](v9);
LABEL_10:
  if (!v8) {
    return;
  }
  uint64_t v5 = *(void *)(a2 + 200);
LABEL_12:
  uint64_t v11 = *(void *)(a2 + 208);
  *a1 = v5;
  a1[1] = v11;
  if (v11) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v11 + 8), 1uLL, memory_order_relaxed);
  }
}

- (void)_VNVYvzEtX1JlUdu8xx5qhDICustomClassifierAndReturnError:(void *)a3
{
  if (!a2)
  {
    *a1 = 0;
    a1[1] = 0;
    return;
  }
  uint64_t v5 = *(void *)(a2 + 184);
  if (v5) {
    goto LABEL_12;
  }
  id v7 = [*(id *)(a2 + 80) VNVYvzEtX1JlUdu8xx5qhDICustomClassifierDescriptor];
  [(VNImageAnalyzerMultiDetector *)&v12 _loadCustomClassifierWithDescriptor:v7 error:a3];

  uint8x8_t v8 = v12;
  if (v12)
  {
    uint64_t v9 = v13;
    if (v13) {
      atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    char v10 = *(std::__shared_weak_count **)(a2 + 192);
    *(void *)(a2 + 184) = v8;
    *(void *)(a2 + 192) = v9;
    if (v10) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v10);
    }
    if (!v9) {
      goto LABEL_10;
    }
  }
  else
  {
    *a1 = 0;
    a1[1] = 0;
    uint64_t v9 = v13;
    if (!v13) {
      goto LABEL_10;
    }
  }
  std::__shared_weak_count::__release_shared[abi:nn180100](v9);
LABEL_10:
  if (!v8) {
    return;
  }
  uint64_t v5 = *(void *)(a2 + 184);
LABEL_12:
  uint64_t v11 = *(void *)(a2 + 192);
  *a1 = v5;
  a1[1] = v11;
  if (v11) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v11 + 8), 1uLL, memory_order_relaxed);
  }
}

- (uint64_t)_processSceneIdentifier:(void *)a3 withConfidence:(void *)a4 disallowedList:(void *)a5 operationPoints:(void *)a6 originatingRequestSpecifier:(unint64_t *)a7 observationsArray:(uint64_t)a8 optionalTopN:(float)a9 error:
{
  id v17 = a2;
  double v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  if (!a1)
  {
    uint64_t v29 = 0;
    goto LABEL_39;
  }
  if (_isAcceptableClassificationIdentifier((NSString *)v17, v18))
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __167__VNImageAnalyzerMultiDetector__processSceneIdentifier_withConfidence_disallowedList_operationPoints_originatingRequestSpecifier_observationsArray_optionalTopN_error___block_invoke;
    aBlock[3] = &unk_1E5B1EB00;
    id v48 = v19;
    id v49 = v17;
    id v50 = v20;
    float v51 = a9;
    int v22 = _Block_copy(aBlock);
    if (a7)
    {
      unint64_t v45 = *a7;
      unsigned int v46 = v22;
      unint64_t v23 = [v21 count];
      id v24 = (void (**)(void, void))v46;
      if (v23)
      {
        id v25 = [v21 lastObject];
        [v25 confidence];
        if (v26 < a9)
        {
          id v44 = [v21 firstObject];
          if (v23 >= 3 && ([v44 confidence], v27 >= a9))
          {
            unsigned __int8 v41 = v25;
            id v42 = v20;
            id v43 = v19;
            char v31 = flsl(v23);
            uint64_t v32 = 0;
            unsigned int v33 = 0;
            uint64_t v34 = 2 << v31;
            do
            {
              if (v34 >= 0) {
                uint64_t v35 = v34;
              }
              else {
                uint64_t v35 = v34 + 1;
              }
              unint64_t v28 = v32 + (v35 >> 1);
              if (v28 < v23)
              {
                uint64_t v36 = [v21 objectAtIndex:v32 + (v35 >> 1)];
                [v36 confidence];
                float v38 = v37;

                if (v38 >= a9)
                {
                  if (v38 <= a9) {
                    goto LABEL_35;
                  }
                  unsigned int v33 = -1;
                  v32 += v35 >> 1;
                }
                else
                {
                  unsigned int v33 = 1;
                }
              }
              BOOL v39 = v34 <= 1;
              uint64_t v34 = v35 >> 1;
            }
            while (!v39);
            unint64_t v28 = v32 + (v33 >> 31);
LABEL_35:
            id v20 = v42;
            id v19 = v43;
            id v24 = (void (**)(void, void))v46;
            id v25 = v41;
            if (v28 == 0x7FFFFFFFFFFFFFFFLL) {
              goto LABEL_36;
            }
          }
          else
          {
            unint64_t v28 = 0;
          }
          uint64_t v29 = v24[2](v24, a8);
          if (!v29)
          {
LABEL_37:

            goto LABEL_38;
          }
          [v21 insertObject:v29 atIndex:v28];
          if (v23 + 1 > v45) {
            [v21 removeObjectAtIndex:v23];
          }

LABEL_36:
          uint64_t v29 = 1;
          goto LABEL_37;
        }
        if (v23 < v45)
        {
          uint64_t v30 = (*((void (**)(void *, uint64_t))v46 + 2))(v46, a8);
          if (v30)
          {
            id v44 = (void *)v30;
            objc_msgSend(v21, "addObject:");
            goto LABEL_36;
          }
          goto LABEL_22;
        }
LABEL_21:
        uint64_t v29 = 1;
LABEL_38:

        goto LABEL_39;
      }
      id v25 = (*((void (**)(void *, uint64_t))v46 + 2))(v46, a8);
      if (v25)
      {
LABEL_15:
        [v21 addObject:v25];
        goto LABEL_21;
      }
    }
    else
    {
      id v24 = (void (**)(void, void))v22;
      id v25 = (*((void (**)(void *, uint64_t))v22 + 2))(v22, a8);
      if (v25) {
        goto LABEL_15;
      }
    }
LABEL_22:
    uint64_t v29 = 0;
    goto LABEL_38;
  }
  uint64_t v29 = 1;
LABEL_39:

  return v29;
}

VNClassificationObservation *__167__VNImageAnalyzerMultiDetector__processSceneIdentifier_withConfidence_disallowedList_operationPoints_originatingRequestSpecifier_observationsArray_optionalTopN_error___block_invoke(uint64_t a1, uint64_t a2)
{
  float v3 = *(void **)(a1 + 32);
  if (!v3)
  {
    id v5 = 0;
    goto LABEL_5;
  }
  id v10 = 0;
  int v4 = [v3 getClassificationMetrics:&v10 forClassificationIdentifier:*(void *)(a1 + 40) error:a2];
  id v5 = v10;
  float v6 = 0;
  if (v4)
  {
LABEL_5:
    id v7 = [VNClassificationObservation alloc];
    LODWORD(v8) = *(_DWORD *)(a1 + 56);
    float v6 = [(VNClassificationObservation *)v7 initWithOriginatingRequestSpecifier:*(void *)(a1 + 48) identifier:*(void *)(a1 + 40) confidence:v5 classificationMetrics:v8];
  }

  return v6;
}

- (uint64_t)_populateLeafSceneObservations:(void *)a3 hierarchySceneObservations:(void *)a4 fromLastAnalysisForSceneConfiguration:(void *)a5 error:
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = [v10 observationsRecipient];
  uint64_t v12 = [v11 originatingRequestSpecifier];

  [v12 requestClassCode];
  uint64_t v13 = [v12 requestRevision];
  kdebug_trace();
  [v10 minimumConfidence];
  float v15 = v14;
  uint64_t v64 = 0;
  uint64_t v16 = [v10 maximumLeafLabels];
  uint64_t v17 = v16 & 0x7FFFFFFFFFFFFFFFLL;
  if ((v16 & 0x7FFFFFFFFFFFFFFFLL) == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v18 = -1;
  }
  else {
    uint64_t v18 = v16;
  }
  uint64_t v64 = v18;
  id v19 = [[_VNImageAnalyzerMultiDetectorSceneOperationPointsProvider alloc] initWithOperationPointsCache:*(void *)(a1 + 152) originatingRequestSpecifier:v12];
  id v20 = [(_VNImageAnalyzerMultiDetectorSceneOperationPointsProvider *)v19 operationPointsAndReturnError:a5];
  if (v20)
  {
    uint64_t v46 = v13;
    id v48 = v19;
    id v49 = v12;
    id v50 = v9;
    float v51 = v8;
    id v47 = v20;
    id v21 = [v10 disallowedList];
    if (v17 == 0x7FFFFFFFFFFFFFFFLL) {
      int v22 = 0;
    }
    else {
      int v22 = (unint64_t *)&v64;
    }
    id v52 = v21;
    id v23 = v12;
    id v24 = v20;
    id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(VNImageAnalyzerMultiDetector *)&v66 _lastAnalysisSceneClassifications];
    float v27 = *v66;
    float v26 = (uint64_t *)v66[1];
    if (*v66 == (float *)v26)
    {
LABEL_15:
      id v33 = v25;
    }
    else
    {
      while (1)
      {
        if (!*((unsigned char *)v27 + 28))
        {
          float v28 = v27[6];
          if (v28 >= v15)
          {
            id v29 = [NSString alloc];
            uint64_t v30 = (uint64_t *)v27;
            if (*((char *)v27 + 23) < 0) {
              uint64_t v30 = *(uint64_t **)v27;
            }
            char v31 = (void *)[v29 initWithUTF8String:v30];
            char v32 = -[VNImageAnalyzerMultiDetector _processSceneIdentifier:withConfidence:disallowedList:operationPoints:originatingRequestSpecifier:observationsArray:optionalTopN:error:](a1, v31, v52, v24, v23, v25, v22, (uint64_t)a5, v28);

            if ((v32 & 1) == 0) {
              break;
            }
          }
        }
        v27 += 8;
        if (v27 == (float *)v26) {
          goto LABEL_15;
        }
      }
      id v33 = 0;
    }
    id v9 = v50;
    id v8 = v51;
    if (v67) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v67);
    }

    if (!v33)
    {
      uint64_t v42 = 0;
LABEL_45:

      id v19 = v48;
      uint64_t v12 = v49;
      id v20 = v47;
      goto LABEL_46;
    }
    id v45 = v33;
    [v51 addObjectsFromArray:v33];
    uint64_t v35 = *(float ***)(a1 + 96);
    uint64_t v34 = *(std::__shared_weak_count **)(a1 + 104);
    if (v34) {
      atomic_fetch_add_explicit(&v34->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v36 = [v10 customHierarchy];
    float v37 = v36;
    if (!v36) {
      goto LABEL_27;
    }
    if ([v36 requestRevision] == v46)
    {
      [v37 hierarchicalModelAndReturnError:a5];
      uint64_t v35 = v66;
      float v38 = v67;
      std::vector<int>::pointer v66 = 0;
      v67 = 0;
      if (v34)
      {
        std::__shared_weak_count::__release_shared[abi:nn180100](v34);
        if (v67) {
          std::__shared_weak_count::__release_shared[abi:nn180100](v67);
        }
      }
      uint64_t v34 = v38;
      if (v35)
      {
LABEL_27:

        unint64_t v39 = [v10 maximumHierarchicalLabels];
        uint64_t v40 = 0x7FFFFFFFLL;
        if (v39 <= 0x7FFFFFFE) {
          uint64_t v40 = v39;
        }
        if (!v40) {
          goto LABEL_37;
        }
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3321888768;
        aBlock[2] = __134__VNImageAnalyzerMultiDetector__populateLeafSceneObservations_hierarchySceneObservations_fromLastAnalysisForSceneConfiguration_error___block_invoke;
        aBlock[3] = &unk_1EF754108;
        void aBlock[4] = a1;
        uint64_t v59 = v35;
        uint64_t v60 = v34;
        if (v34) {
          atomic_fetch_add_explicit(&v34->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        BOOL v63 = v39 > 0x7FFFFFFE;
        uint64_t v61 = v40;
        float v62 = v15;
        id v55 = v52;
        id v56 = v23;
        id v57 = v24;
        id v58 = v50;
        unsigned __int8 v41 = _Block_copy(aBlock);
        uint64_t v42 = VNExecuteBlock(v41, (uint64_t)a5);
        if ((v42 & 1) == 0) {
          unsigned __int8 v65 = 0;
        }

        if (v60) {
          std::__shared_weak_count::__release_shared[abi:nn180100](v60);
        }
        if (v42)
        {
LABEL_37:
          kdebug_trace();
          uint64_t v42 = 1;
          unsigned __int8 v65 = 1;
        }
        goto LABEL_43;
      }
    }
    else if (a5)
    {
      id v43 = objc_msgSend(NSString, "stringWithFormat:", @"custom hierarchy created for revision %lu cannot be used with a detector for revision %lu", objc_msgSend(v37, "requestRevision"), v46);
      *a5 = +[VNError errorForInvalidOperationWithLocalizedDescription:v43];
    }
    unsigned __int8 v65 = 0;

    uint64_t v42 = 0;
LABEL_43:
    id v33 = v45;
    if (v34)
    {
      std::__shared_weak_count::__release_shared[abi:nn180100](v34);
      uint64_t v42 = v65;
    }
    goto LABEL_45;
  }
  uint64_t v42 = 0;
LABEL_46:

  return v42;
}

BOOL __134__VNImageAnalyzerMultiDetector__populateLeafSceneObservations_hierarchySceneObservations_fromLastAnalysisForSceneConfiguration_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v25 = a2;
  [(VNImageAnalyzerMultiDetector *)&v31 _lastAnalysisSceneClassifications];
  *(_OWORD *)float v28 = 0u;
  *(_OWORD *)id v29 = 0u;
  int v30 = 1065353216;
  float v3 = *(_DWORD **)v31;
  int v4 = *(_DWORD **)(v31 + 8);
  while (v3 != v4)
  {
    int v5 = v3[6];
    __p[0] = v3;
    *((_DWORD *)std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)v28, (unsigned __int8 *)v3, (long long **)__p)+ 10) = v5;
    v3 += 8;
  }
  vision::mod::ImageClassifier_HierarchicalModel::infer((uint64_t)__p, *(uint64_t ***)(a1 + 72), v28, 0);
  if (*(unsigned char *)(a1 + 100)) {
    float v6 = 0;
  }
  else {
    float v6 = (unint64_t *)(a1 + 88);
  }
  float v7 = *(float *)(a1 + 96);
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(a1 + 48);
  id v10 = *(void **)(a1 + 56);
  id v11 = *(id *)(a1 + 40);
  id v12 = v9;
  id v13 = v10;
  if (v8)
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    float v15 = (char *)v27;
    if (v27)
    {
      while (1)
      {
        float v16 = *((float *)v15 + 10);
        if (v16 >= v7)
        {
          id v17 = [NSString alloc];
          uint64_t v18 = v15 + 16;
          if (v15[39] < 0) {
            uint64_t v18 = (void *)*v18;
          }
          id v19 = objc_msgSend(v17, "initWithUTF8String:", v18, v25);
          char v20 = -[VNImageAnalyzerMultiDetector _processSceneIdentifier:withConfidence:disallowedList:operationPoints:originatingRequestSpecifier:observationsArray:optionalTopN:error:](v8, v19, v11, v13, v12, v14, v6, v25, v16);

          if ((v20 & 1) == 0) {
            break;
          }
        }
        float v15 = *(char **)v15;
        if (!v15) {
          goto LABEL_14;
        }
      }
      id v21 = 0;
    }
    else
    {
LABEL_14:
      id v21 = v14;
    }
  }
  else
  {
    id v21 = 0;
  }

  if (v21) {
    [*(id *)(a1 + 64) addObjectsFromArray:v21];
  }

  std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__deallocate_node((void **)v27);
  int v22 = __p[0];
  __p[0] = 0;
  if (v22) {
    operator delete(v22);
  }
  std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__deallocate_node((void **)v29[0]);
  id v23 = v28[0];
  v28[0] = 0;
  if (v23) {
    operator delete(v23);
  }
  if (v32) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v32);
  }
  return v21 != 0;
}

- (void)_lastAnalysisSceneClassifications
{
  uint64_t v2 = a1;
  if (a2)
  {
    float v3 = a2;
    os_unfair_lock_lock(a2 + 66);
    uint64_t v4 = *(void *)&v3[68]._os_unfair_lock_opaque;
    if (!v4)
    {
      uint64_t v5 = *(void *)&v3[28]._os_unfair_lock_opaque;
      uint64_t v46 = 0;
      long long v45 = 0uLL;
      id v44 = v3;
      if (*(unsigned char *)(v5 + 384))
      {
        exception = __cxa_allocate_exception(8uLL);
        void *exception = 8575;
        __cxa_throw(exception, MEMORY[0x1E4FBA3E0], 0);
      }
      LODWORD(v47.__r_.__value_.__l.__data_) = 2;
      float v6 = std::__hash_table<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,espresso_buffer_t>,std::__unordered_map_hasher<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,espresso_buffer_t>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::__unordered_map_equal<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,espresso_buffer_t>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::allocator<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,espresso_buffer_t>>>::__emplace_unique_key_args<vision::mod::ImageAnalyzer_AnalysisType,std::piecewise_construct_t const&,std::tuple<vision::mod::ImageAnalyzer_AnalysisType&&>,std::tuple<>>(v5 + 784, 2u, &v47);
      vision::mod::ImageAnalyzer_Tensor1D<float>::ImageAnalyzer_Tensor1D((uint64_t)&v53, (long long *)(v6 + 24), 0);
      vision::mod::ImageAnalyzer_Tensor1D<float>::getVectorFromTensor(&v57, (unint64_t *)&v53);
      vision::mod::ImageAnalyzer_Tensor1D<float>::~ImageAnalyzer_Tensor1D((uint64_t)&v53);
      __p = 0;
      float v51 = 0;
      uint64_t v52 = 0;
      float v7 = std::__hash_table<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::__unordered_map_hasher<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::__unordered_map_equal<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::allocator<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>>>::find<vision::mod::ImageAnalyzer_AnalysisType>((void *)(v5 + 744), 2u);
      if (v7)
      {
        LODWORD(v53) = 2;
        uint64_t v8 = std::__hash_table<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,vision::mod::ImageAnalyzer_PostProcessor>,std::__unordered_map_hasher<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,vision::mod::ImageAnalyzer_PostProcessor>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::__unordered_map_equal<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,vision::mod::ImageAnalyzer_PostProcessor>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::allocator<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,vision::mod::ImageAnalyzer_PostProcessor>>>::__emplace_unique_key_args<vision::mod::ImageAnalyzer_AnalysisType,std::piecewise_construct_t const&,std::tuple<vision::mod::ImageAnalyzer_AnalysisType&&>,std::tuple<>>((void *)(v5 + 744), 2u, &v53);
        vision::mod::ImageAnalyzer_PostProcessor::process((uint64_t)(v8 + 3), (uint64_t)&v57, (uint64_t)&__p);
      }
      DisallowedLabels = vision::mod::ImageAnalyzer::getDisallowedLabels(v5, 2u);
      id v43 = v2;
      id v11 = v57;
      id v10 = v58;
      LODWORD(v53) = 2;
      id v12 = std::__hash_table<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::__unordered_map_hasher<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::__unordered_map_equal<vision::mod::ImageAnalyzer_AnalysisType,std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>,std::equal_to<vision::mod::ImageAnalyzer_AnalysisType>,std::hash<vision::mod::ImageAnalyzer_AnalysisType>,true>,std::allocator<std::__hash_value_type<vision::mod::ImageAnalyzer_AnalysisType,std::vector<std::string>>>>::__emplace_unique_key_args<vision::mod::ImageAnalyzer_AnalysisType,std::piecewise_construct_t const&,std::tuple<vision::mod::ImageAnalyzer_AnalysisType&&>,std::tuple<>>(v5 + 864, 2u, &v53);
      if (v10 != v11)
      {
        id v13 = v12;
        uint64_t v14 = 0;
        if ((unint64_t)((v10 - v11) >> 2) <= 1) {
          uint64_t v15 = 1;
        }
        else {
          uint64_t v15 = (v10 - v11) >> 2;
        }
        do
        {
          uint64_t v16 = v13[3] + 24 * v14;
          p_p = (void **)&v57;
          if (v7) {
            p_p = &__p;
          }
          int v18 = *((_DWORD *)*p_p + v14);
          BOOL v19 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(DisallowedLabels, (unsigned __int8 *)(v13[3] + 24 * v14)) != 0;
          if (*(char *)(v16 + 23) < 0) {
            std::string::__init_copy_ctor_external(&v47, *(const std::string::value_type **)v16, *(void *)(v16 + 8));
          }
          else {
            std::string v47 = *(std::string *)v16;
          }
          int v48 = v18;
          BOOL v49 = v19;
          uint64_t v20 = *((void *)&v45 + 1);
          if (*((void *)&v45 + 1) >= (unint64_t)v46)
          {
            unint64_t v22 = v45;
            uint64_t v23 = (uint64_t)(*((void *)&v45 + 1) - v45) >> 5;
            unint64_t v24 = v23 + 1;
            if ((unint64_t)(v23 + 1) >> 59) {
              std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v25 = (uint64_t)v46 - v45;
            if ((uint64_t)((uint64_t)v46 - v45) >> 4 > v24) {
              unint64_t v24 = v25 >> 4;
            }
            if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFE0) {
              unint64_t v26 = 0x7FFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v26 = v24;
            }
            id v56 = &v46;
            if (v26)
            {
              if (v26 >> 59) {
                std::__throw_bad_array_new_length[abi:ne180100]();
              }
              float v27 = (void **)operator new(32 * v26);
            }
            else
            {
              float v27 = 0;
            }
            id v29 = &v27[4 * v23];
            unint64_t v53 = v27;
            v54.i64[0] = (uint64_t)v29;
            v54.i64[1] = (uint64_t)v29;
            id v55 = &v27[4 * v26];
            if (SHIBYTE(v47.__r_.__value_.__r.__words[2]) < 0)
            {
              std::string::__init_copy_ctor_external((std::string *)v29, v47.__r_.__value_.__l.__data_, v47.__r_.__value_.__l.__size_);
              int v30 = v48;
              BOOL v19 = v49;
              uint64_t v20 = *((void *)&v45 + 1);
              unint64_t v22 = v45;
              char v32 = (void **)v54.i64[1];
              uint64_t v31 = (void **)v54.i64[0];
            }
            else
            {
              int v30 = v18;
              *(std::string *)id v29 = v47;
              uint64_t v31 = v29;
              char v32 = v29;
            }
            *((_DWORD *)v29 + 6) = v30;
            *((unsigned char *)v29 + 28) = v19;
            uint64_t v28 = (uint64_t)(v32 + 4);
            v54.i64[1] = (uint64_t)(v32 + 4);
            if (v20 == v22)
            {
              int64x2_t v37 = vdupq_n_s64(v22);
            }
            else
            {
              unint64_t v33 = 0;
              do
              {
                uint64_t v34 = &v31[v33 / 8];
                uint64_t v35 = v20 + v33;
                long long v36 = *(_OWORD *)(v20 + v33 - 32);
                *(v34 - 2) = *(void **)(v20 + v33 - 16);
                *((_OWORD *)v34 - 2) = v36;
                *(void *)(v35 - 24) = 0;
                *(void *)(v35 - 16) = 0;
                *(void *)(v35 - 32) = 0;
                *((_DWORD *)v34 - 2) = *(_DWORD *)(v20 + v33 - 8);
                *((unsigned char *)v34 - 4) = *(unsigned char *)(v20 + v33 - 4);
                v33 -= 32;
              }
              while (v20 + v33 != v22);
              uint64_t v31 = (void **)((char *)v31 + v33);
              int64x2_t v37 = (int64x2_t)v45;
              uint64_t v28 = v54.i64[1];
            }
            *(void *)&long long v45 = v31;
            *((void *)&v45 + 1) = v28;
            int64x2_t v54 = v37;
            float v38 = v46;
            uint64_t v46 = v55;
            id v55 = v38;
            unint64_t v53 = (void **)v37.i64[0];
            std::__split_buffer<std::pair<std::string,float>>::~__split_buffer((uint64_t)&v53);
            char v21 = HIBYTE(v47.__r_.__value_.__r.__words[2]);
          }
          else
          {
            char v21 = HIBYTE(v47.__r_.__value_.__r.__words[2]);
            if (SHIBYTE(v47.__r_.__value_.__r.__words[2]) < 0)
            {
              std::string::__init_copy_ctor_external(*((std::string **)&v45 + 1), v47.__r_.__value_.__l.__data_, v47.__r_.__value_.__l.__size_);
            }
            else
            {
              **((_OWORD **)&v45 + 1) = *(_OWORD *)&v47.__r_.__value_.__l.__data_;
              *(void *)(v20 + 16) = *((void *)&v47.__r_.__value_.__l + 2);
            }
            *(_DWORD *)(v20 + 24) = v18;
            *(unsigned char *)(v20 + 28) = v19;
            uint64_t v28 = v20 + 32;
          }
          *((void *)&v45 + 1) = v28;
          if (v21 < 0) {
            operator delete(v47.__r_.__value_.__l.__data_);
          }
          ++v14;
        }
        while (v14 != v15);
      }
      if (__p)
      {
        float v51 = __p;
        operator delete(__p);
      }
      uint64_t v2 = v43;
      float v3 = v44;
      if (v57)
      {
        id v58 = v57;
        operator delete(v57);
      }
      unint64_t v39 = (char *)operator new(0x30uLL);
      *((void *)v39 + 1) = 0;
      *((void *)v39 + 2) = 0;
      *(void *)unint64_t v39 = &unk_1EF7533B8;
      *(_OWORD *)(v39 + 24) = v45;
      *((void *)v39 + 5) = v46;
      long long v45 = 0uLL;
      uint64_t v46 = 0;
      uint64_t v40 = *(std::__shared_weak_count **)&v44[70]._os_unfair_lock_opaque;
      *(void *)&v44[68]._os_unfair_lock_opaque = v39 + 24;
      *(void *)&v44[70]._os_unfair_lock_opaque = v39;
      if (v40) {
        std::__shared_weak_count::__release_shared[abi:nn180100](v40);
      }
      unint64_t v53 = (void **)&v45;
      std::vector<std::pair<std::string,BOOL>>::__destroy_vector::operator()[abi:ne180100](&v53);
      uint64_t v4 = *(void *)&v44[68]._os_unfair_lock_opaque;
    }
    uint64_t v41 = *(void *)&v3[70]._os_unfair_lock_opaque;
    *uint64_t v2 = v4;
    v2[1] = v41;
    if (v41) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v41 + 8), 1uLL, memory_order_relaxed);
    }
    os_unfair_lock_unlock(v3 + 66);
  }
  else
  {
    *a1 = 0;
    a1[1] = 0;
  }
}

uint64_t __67__VNImageAnalyzerMultiDetector__performAnalysis_pixelBuffer_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 264));
  float v3 = *(std::__shared_weak_count **)(v2 + 280);
  *(void *)(v2 + 272) = 0;
  *(void *)(v2 + 280) = 0;
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v3);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 264));
  vision::mod::ImageAnalyzer::analyzeUsingCVPixelBuffer(*(vision::mod::ImageAnalyzer **)(*(void *)(a1 + 32) + 112), *(_DWORD *)(a1 + 48), **(__CVBuffer ***)(a1 + 40));
  return 1;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v18 = a5;
  id v19 = a7;
  id v20 = a9;
  uint64_t v45 = 0;
  uint64_t v46 = &v45;
  uint64_t v47 = 0x3032000000;
  int v48 = __Block_byref_object_copy__27394;
  BOOL v49 = __Block_byref_object_dispose__27395;
  id v50 = 0;
  uint64_t v39 = 0;
  uint64_t v40 = &v39;
  uint64_t v41 = 0x3032000000;
  uint64_t v42 = __Block_byref_object_copy__27394;
  id v43 = __Block_byref_object_dispose__27395;
  id v44 = 0;
  char v21 = [(VNDetector *)self synchronizationQueue];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __130__VNImageAnalyzerMultiDetector_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke;
  v28[3] = &unk_1E5B1EC90;
  char v32 = &v45;
  v28[4] = self;
  unsigned int v38 = a6;
  id v22 = v18;
  id v29 = v22;
  CGFloat v34 = x;
  CGFloat v35 = y;
  CGFloat v36 = width;
  CGFloat v37 = height;
  id v23 = v19;
  id v30 = v23;
  unint64_t v33 = &v39;
  id v24 = v20;
  id v31 = v24;
  [v21 dispatchSyncByPreservingQueueCapacity:v28];
  uint64_t v25 = (void *)v46[5];
  if (v25)
  {
    id v26 = v25;
  }
  else if (a8)
  {
    *a8 = (id) v40[5];
  }

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v45, 8);

  return v25;
}

void __130__VNImageAnalyzerMultiDetector_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 112);
  float v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  double v6 = *(double *)(a1 + 80);
  double v7 = *(double *)(a1 + 88);
  double v8 = *(double *)(a1 + 96);
  double v9 = *(double *)(a1 + 104);
  uint64_t v10 = *(void *)(*(void *)(a1 + 72) + 8);
  id obj = *(id *)(v10 + 40);
  uint64_t v11 = objc_msgSend(v3, "internalProcessUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v2, v4, v5, &obj, *(void *)(a1 + 56), v6, v7, v8, v9);
  objc_storeStrong((id *)(v10 + 40), obj);
  uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v16 = a4;
  id v17 = [(VNDetector *)self validatedImageBufferFromOptions:v16 error:a8];
  if (!v17)
  {
    LOBYTE(v27) = 0;
    goto LABEL_21;
  }
  uint64_t v39 = 2;
  int32x2_t v38 = vdup_n_s32(0x7FC00000u);
  -[VNImageAnalyzerMultiDetector _getImageCropAndScaleOption:networkRequiredInputImageSize:forOptions:]((uint64_t)self, &v39, &v38, v16);
  v42.origin.double x = 0.0;
  v42.origin.double y = 0.0;
  v42.size.double width = 1.0;
  v42.size.double height = 1.0;
  v41.origin.double x = x;
  v41.origin.double y = y;
  v41.size.double width = width;
  v41.size.double height = height;
  BOOL v18 = CGRectEqualToRect(v41, v42);
  BOOL v19 = v18;
  CGFloat v35 = a7;
  if (v18) {
    id v20 = &v37;
  }
  else {
    id v20 = 0;
  }
  if (v18) {
    id v37 = 0;
  }
  uint64_t v21 = v39;
  int32x2_t v22 = v38;
  id v36 = v17;
  id v23 = v16;
  id v24 = v23;
  if (self)
  {
    uint64_t v25 = [v23 objectForKeyedSubscript:@"VNImageAnalyzerMultiDetectorProcessingOption_SkipInputImageScaling"];
    int v26 = [v25 BOOLValue];

    if (!v26)
    {
      id v29 = (void *)[v24 mutableCopy];
      [v29 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"VNImageBufferOption_CreateFromPixelBufferPool"];
      uint64_t cachedInferenceImagePixelFormatType = self->_cachedInferenceImagePixelFormatType;
      id v40 = 0;
      CGFloat v34 = v20;
      uint64_t v28 = v36;
      uint64_t v27 = objc_msgSend(v36, "cropAndScaleBufferWithWidth:height:cropRect:format:imageCropAndScaleOption:options:error:calculatedNormalizedOriginOffset:calculatedScaleX:calculatedScaleY:pixelBufferRepsCacheKey:", (unint64_t)*(float *)&v22.i32[1], (unint64_t)*(float *)v22.i32, cachedInferenceImagePixelFormatType, v21, v29, &v40, x, y, width, height, 0, 0, 0, v34);
      id v31 = v40;
      if (a8 && !v27)
      {
        *a8 = +[VNError errorWithCode:9 message:@"Failed to scale the input image" underlyingError:v31];
      }

      goto LABEL_16;
    }
    uint64_t v27 = objc_msgSend(v36, "croppedBufferWithWidth:height:format:cropRect:options:error:pixelBufferRepsCacheKey:", (unint64_t)width, (unint64_t)height, self->_cachedInferenceImagePixelFormatType, v24, a8, v20, x, y, width, height);
  }
  else
  {
    uint64_t v27 = 0;
  }
  uint64_t v28 = v36;
LABEL_16:

  if (v19)
  {
    id v32 = v37;
    void *v35 = (__CVBuffer *)v27;
    if (v27)
    {
      [(VNDetector *)self recordImageCropQuickLookInfoToOptions:v24 cacheKey:v32 imageBuffer:v28];
      LOBYTE(v27) = 1;
    }
  }
  else
  {
    id v32 = 0;
    void *v35 = (__CVBuffer *)v27;
    LOBYTE(v27) = v27 != 0;
  }

LABEL_21:
  return v27;
}

- (void)_getImageCropAndScaleOption:(int32x2_t *)a3 networkRequiredInputImageSize:(void *)a4 forOptions:
{
  id v7 = a4;
  if (a1)
  {
    double v8 = *(uint64x2_t **)(a1 + 112);
    int v9 = v8[24].u8[1];
    *a3 = vrev64_s32((int32x2_t)vcvt_f32_f64(vcvtq_f64_u64(v8[42])));
    id v15 = v7;
    uint64_t v10 = [v7 objectForKeyedSubscript:@"VNDetectorProcessOption_ImageCropAndScaleOption"];
    uint64_t v11 = v10;
    if (v10) {
      uint64_t v12 = [v10 unsignedIntegerValue];
    }
    else {
      uint64_t v12 = 2;
    }
    if (v12 == 2 && v9 == 0) {
      uint64_t v14 = 0;
    }
    else {
      uint64_t v14 = v12;
    }
    *a2 = v14;

    id v7 = v15;
  }
}

- (id)internalProcessUsingQualityOfServiceClass:(unsigned int)a3 options:(id)a4 regionOfInterest:(CGRect)a5 warningRecorder:(id)a6 error:(id *)a7 progressHandler:(id)a8
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  CGFloat x = a5.origin.x;
  uint64_t v303 = *MEMORY[0x1E4F143B8];
  id v16 = a4;
  id v175 = a6;
  id v174 = a8;
  val = self;
  float v204 = a7;
  int v205 = v16;
  id v17 = [(VNDetector *)self validatedImageBufferFromOptions:v16 error:a7];
  uint64_t v173 = v17;
  if (!v17)
  {
    id v25 = 0;
    goto LABEL_97;
  }
  uint64_t v298 = 2;
  int32x2_t v297 = vdup_n_s32(0x7FC00000u);
  -[VNImageAnalyzerMultiDetector _getImageCropAndScaleOption:networkRequiredInputImageSize:forOptions:]((uint64_t)self, &v298, &v297, v16);
  *(double *)&to = x;
  unint64_t v18 = [v17 width];
  double v19 = (double)(unint64_t)[v17 height];
  double v194 = (double)(unint64_t)(double)v18;
  double v20 = height;
  double v192 = (double)(unint64_t)v19;
  double v21 = height * v192;
  float v22 = *(float *)&v297.i32[1];
  float v23 = *(float *)v297.i32;
  if (*(float *)&v297.i32[1] >= *(float *)v297.i32) {
    __int32 v24 = v297.i32[0];
  }
  else {
    __int32 v24 = v297.i32[1];
  }
  double v197 = v21;
  double v199 = width * v194;
  if (width * v194 < v21) {
    double v21 = width * v194;
  }
  if (v21 < 1.0)
  {
    id v25 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_97;
  }
  double v190 = width;
  float v26 = v21;
  if (*(float *)&v24 > v26)
  {
    if (v190 >= v20) {
      double v27 = v20;
    }
    else {
      double v27 = v190;
    }
    float v28 = *(float *)&v24;
    if (v27 > 0.0) {
      float v28 = *(float *)&v24 / v27;
    }
    VNRecordImageTooSmallWarningWithImageMinimumShortDimension(v175, (unint64_t)v28);
  }
  uint64_t v29 = [v16 objectForKeyedSubscript:@"VNImageAnalyzerMultiDetectorOption_SceneConfigurations"];
  int v170 = (void *)v29;
  if (*(float *)&v24 > v26 || v29 == 0)
  {
    BOOL v36 = 0;
    uint64_t v189 = 0;
    double v32 = v20;
    CGFloat v35 = to;
  }
  else
  {
    double v31 = (float)(v22 / v23);
    double v32 = v20;
    unint64_t v33 = +[VNRegionOfInterestTiling tilingForRegionOfInterest:inPixelWidth:height:tileAspectRatio:options:](VNRegionOfInterestTiling, "tilingForRegionOfInterest:inPixelWidth:height:tileAspectRatio:options:", (unint64_t)(double)v18, (unint64_t)v19, self->_inputImageTilingOptions, *(double *)&to, y, v190, v20, v31);
    unint64_t v34 = [v33 tileCount];
    CGFloat v35 = to;
    BOOL v36 = v34 > 1;
    if (v34 < 2)
    {
      uint64_t v189 = 0;
    }
    else
    {
      uint64_t v189 = [v33 tiles];
      unint64_t v37 = [v33 tileColumnsCount];
      uint64_t v38 = [v33 tileRowsCount];
      long long v296 = 0u;
      long long v295 = 0u;
      long long v294 = 0u;
      long long v293 = 0u;
      uint64_t v39 = [v205 objectForKeyedSubscript:@"VNImageAnalyzerMultiDetectorProcessingOption_TilingWarningRecorders"];
      uint64_t v40 = [v39 countByEnumeratingWithState:&v293 objects:v302 count:16];
      if (v40)
      {
        uint64_t v41 = *(void *)v294;
        do
        {
          for (uint64_t i = 0; i != v40; ++i)
          {
            if (*(void *)v294 != v41) {
              objc_enumerationMutation(v39);
            }
            VNRecordImageTilingWarning(*(void **)(*((void *)&v293 + 1) + 8 * i), v37, v38);
          }
          uint64_t v40 = [v39 countByEnumeratingWithState:&v293 objects:v302 count:16];
        }
        while (v40);
      }
    }
  }
  id v43 = [NSNumber numberWithBool:v36];
  [v205 setObject:v43 forKeyedSubscript:@"VNImageAnalyzerMultiDetectorProcessingOption_TilingIsRequired"];

  id v169 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v287 = 0;
  v288 = &v287;
  uint64_t v289 = 0x3032000000;
  v290 = __Block_byref_object_copy__27394;
  v291 = __Block_byref_object_dispose__27395;
  id v292 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v285[0] = 0;
  v285[1] = v285;
  v285[2] = 0x3812000000;
  v285[3] = __Block_byref_object_copy__405;
  v285[4] = __Block_byref_object_dispose__406;
  v285[5] = "";
  int v286 = 0;
  objc_initWeak(&location, val);
  id v44 = objc_opt_class();
  int v45 = [v44 VNClassCode];
  uint64_t v168 = [v44 detectorCropCreationAsyncTasksQueue];
  dispatch_group_t v196 = dispatch_group_create();
  unint64_t v167 = [v44 detectorCropProcessingAsyncTasksQueue];
  dispatch_group_t v166 = dispatch_group_create();
  v282[0] = 0;
  v282[1] = v282;
  v282[2] = 0x3032000000;
  v282[3] = __Block_byref_object_copy__27394;
  v282[4] = __Block_byref_object_dispose__27395;
  id v283 = 0;
  v280[0] = 0;
  v280[1] = v280;
  v280[2] = 0x3032000000;
  v280[3] = __Block_byref_object_copy__27394;
  v280[4] = __Block_byref_object_dispose__27395;
  id v281 = 0;
  v279[0] = 0;
  v279[1] = v279;
  v279[2] = 0x2020000000;
  v279[3] = 0;
  uint64_t v46 = (void *)[v205 mutableCopy];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __137__VNImageAnalyzerMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke;
  block[3] = &unk_1E5B1EB50;
  objc_copyWeak(v275, &location);
  float v273 = v282;
  int v276 = v45;
  uint64_t v47 = v166;
  std::string::size_type v268 = v47;
  unsigned int v277 = a3;
  *(double *)&v275[1] = *(double *)&v35 * v194;
  *(double *)&v275[2] = y * v192;
  v275[3] = *(id *)&v199;
  v275[4] = *(id *)&v197;
  id v48 = v46;
  id v269 = v48;
  id v49 = v175;
  id v270 = v49;
  float v274 = v279;
  id v50 = v174;
  id v272 = v50;
  BOOL v278 = v36;
  id v195 = v168;
  id v271 = v195;
  dispatch_block_t v51 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, (dispatch_qos_class_t)a3, 0, block);
  v250[0] = MEMORY[0x1E4F143A8];
  v250[1] = 3221225472;
  v250[2] = __137__VNImageAnalyzerMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_3;
  v250[3] = &unk_1E5B1EBC8;
  objc_copyWeak(v263, &location);
  long long v258 = v282;
  unsigned int v264 = a3;
  std::vector<int>::pointer v171 = v51;
  uint64_t v256 = v171;
  int v265 = v45;
  uint64_t v198 = v47;
  unint64_t v251 = v198;
  unint64_t v259 = v280;
  unint64_t v260 = v279;
  id v165 = v48;
  id v252 = v165;
  v263[1] = v35;
  v263[2] = *(id *)&y;
  v263[3] = *(id *)&v190;
  v263[4] = *(id *)&v32;
  id v183 = v49;
  id v253 = v183;
  id v181 = v50;
  id v257 = v181;
  uint64_t v261 = v285;
  long long v262 = &v287;
  id v191 = v169;
  id v254 = v191;
  BOOL v266 = v36;
  id v193 = v167;
  id v255 = v193;
  int v172 = (void (**)(void))dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, (dispatch_qos_class_t)a3, 0, v250);
  if (!v36)
  {
    VNValidatedLog(1, @"Performing createScaledFullImageForProcessingBlock; %@",
      v52,
      v53,
      v54,
      v55,
      v56,
      v57,
      (uint64_t)val);
    v171[2]();
    VNValidatedLog(1, @"Performing processScaledFullImagePixelBufferBlock; %@",
      v151,
      v152,
      v153,
      v154,
      v155,
      v156,
      (uint64_t)val);
    v172[2]();
    VNValidatedLog(1, @"Finish processing createScaledFullImageForProcessingBlock and processScaledFullImagePixelBufferBlock. currentDetector: %@", v157, v158, v159, v160, v161, v162, (uint64_t)val);
    if (+[VNValidationUtilities validateAsyncStatusResults:v191 error:v204])
    {
      id v25 = (id)v288[5];
    }
    else
    {
      id v25 = 0;
    }
    goto LABEL_96;
  }
  VNValidatedLog(1, @"Scheduling createScaledFullImageForProcessingBlock; %@",
    v52,
    v53,
    v54,
    v55,
    v56,
    v57,
    (uint64_t)val);
  [v195 dispatchGroupAsyncByPreservingQueueCapacity:v196 block:v171];
  VNValidatedLog(1, @"Scheduling processScaledFullImagePixelBufferBlock; %@",
    v58,
    v59,
    v60,
    v61,
    v62,
    v63,
    (uint64_t)val);
  [v193 dispatchGroupAsyncByPreservingQueueCapacity:v198 block:v172];
  uint64_t v64 = [_VNImageAnalyzerMultiDetectorTilingSceneConfiguration alloc];
  unsigned __int8 v65 = [v170 firstObject];
  std::vector<int>::pointer v66 = [v65 observationsRecipient];
  int v180 = [(_VNImageAnalyzerMultiDetectorTilingSceneConfiguration *)v64 initWithObservationsRecipient:v66];

  id v185 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v186 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v187 = [v189 count];
  kdebug_trace();
  VNValidatedLog(1, @"Start processing chunksProcessingGroup. currentDetector: %@", v67, v68, v69, v70, v71, v72, (uint64_t)val);
  if (v187)
  {
    for (uint64_t j = 0; j != (char *)v187; ++j)
    {
      id v80 = [v189 objectAtIndexedSubscript:j];
      [v80 pixelCropRect];
      int v82 = v81;
      uint64_t v84 = v83;
      uint64_t v86 = v85;
      int v88 = v87;

      v248[0] = 0;
      v248[1] = v248;
      v248[2] = 0x3032000000;
      v248[3] = __Block_byref_object_copy__27394;
      v248[4] = __Block_byref_object_dispose__27395;
      id v249 = 0;
      v247[0] = 0;
      v247[1] = v247;
      v247[2] = 0x2020000000;
      v247[3] = 0;
      float v89 = (void *)[v205 mutableCopy];
      v236[0] = MEMORY[0x1E4F143A8];
      v236[1] = 3221225472;
      v236[2] = __137__VNImageAnalyzerMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_6;
      v236[3] = &unk_1E5B1EBF0;
      objc_copyWeak(v244, &location);
      int v245 = v45;
      unsigned int v242 = v248;
      v244[1] = j;
      float v90 = v196;
      long long v237 = v90;
      unsigned int v246 = a3;
      v244[2] = v82;
      v244[3] = v84;
      v244[4] = v86;
      v244[5] = v88;
      id v200 = v89;
      id v238 = v200;
      id v239 = v183;
      v243 = v247;
      id v241 = v181;
      id v91 = v195;
      id v240 = v91;
      dispatch_block_t v92 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, (dispatch_qos_class_t)a3, 0, v236);
      v221[0] = MEMORY[0x1E4F143A8];
      v221[1] = 3221225472;
      v221[2] = __137__VNImageAnalyzerMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_8;
      v221[3] = &unk_1E5B1EC68;
      objc_copyWeak(v233, &location);
      unint64_t v230 = v248;
      unsigned int v234 = a3;
      id v93 = v92;
      int v235 = v45;
      id v229 = v93;
      v233[1] = j;
      id v94 = v198;
      float v222 = v94;
      float v223 = val;
      unint64_t v231 = v247;
      unint64_t v224 = v180;
      uint64_t v232 = v285;
      id v225 = v185;
      id v226 = v186;
      id v227 = v191;
      id v95 = v193;
      id v228 = v95;
      dispatch_block_t v96 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, (dispatch_qos_class_t)a3, 0, v221);
      VNValidatedLog(1, @"Scheduling createTileCropForProcessingBlock. currentDetector: %@", v97, v98, v99, v100, v101, v102, (uint64_t)val);
      [v91 dispatchGroupAsyncByPreservingQueueCapacity:v90 block:v93];
      VNValidatedLog(1, @"Scheduling processTileBlock. currentDetector: %@", v103, v104, v105, v106, v107, v108, (uint64_t)val);
      [v95 dispatchGroupAsyncByPreservingQueueCapacity:v94 block:v96];

      objc_destroyWeak(v233);
      objc_destroyWeak(v244);

      _Block_object_dispose(v247, 8);
      _Block_object_dispose(v248, 8);
    }
  }
  VNValidatedLog(1, @"Waiting for cropCreationGroup. currentDetector: %@; group: %@",
    v73,
    v74,
    v75,
    v76,
    v77,
    v78,
    (uint64_t)val);
  if (([v195 dispatchGroupWait:v196 error:v204] & 1) == 0)
  {
    std::vector<int>::pointer v163 = @"Timed out waiting for image analyzer cropCreationGroup when processing full image and %lu tiles. currentDetector: %@; group: %@";
LABEL_93:
    VNValidatedLog(4, (uint64_t)v163, v109, v110, v111, v112, v113, v114, v187);
    goto LABEL_94;
  }
  VNValidatedLog(1, @"Waiting for cropProcessingGroup. currentDetector: %@; group: %@",
    v109,
    v110,
    v111,
    v112,
    v113,
    v114,
    (uint64_t)val);
  if (([v193 dispatchGroupWait:v198 error:v204] & 1) == 0)
  {
    std::vector<int>::pointer v163 = @"Timed out waiting for image analyzer cropProcessingGroup when processing full image and %lu tiles. currentDetector: %@; group: %@";
    goto LABEL_93;
  }
  VNValidatedLog(1, @"Finish processing cropCreationGroup and cropCreationGroup. currentDetector: %@; cropCreationGroup: %@; cropProcessingGroup: %@",
    v109,
    v110,
    v111,
    v112,
    v113,
    v114,
    (uint64_t)val);
  kdebug_trace();
  if (+[VNValidationUtilities validateAsyncStatusResults:v191 error:v204])
  {
    v177 = [v185 allValues];
    uint64_t v176 = [v186 allValues];
    long long v219 = 0u;
    long long v220 = 0u;
    long long v217 = 0u;
    long long v218 = 0u;
    id obj = v170;
    uint64_t v115 = [obj countByEnumeratingWithState:&v217 objects:v301 count:16];
    if (v115)
    {
      uint64_t v182 = *(void *)v218;
      while (2)
      {
        uint64_t v179 = v115;
        uint64_t v116 = 0;
        do
        {
          if (*(void *)v218 != v182) {
            objc_enumerationMutation(obj);
          }
          v117 = *(void **)(*((void *)&v217 + 1) + 8 * v116);
          unsigned int v188 = [v117 observationsRecipient];
          float v207 = [v188 originatingRequestSpecifier];
          float v118 = -[VNImageAnalyzerMultiDetector sceneLabelOperationPointsForOriginatingRequestSpecifier:error:](val, "sceneLabelOperationPointsForOriginatingRequestSpecifier:error:");
          uint64_t v184 = v116;
          if (v118)
          {
            toa = [v117 disallowedList];
            [v117 minimumConfidence];
            float v120 = v119;
            id v201 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            v248[0] = 0;
            uint64_t v121 = [v117 maximumLeafLabels];
            uint64_t v122 = v121 & 0x7FFFFFFFFFFFFFFFLL;
            if ((v121 & 0x7FFFFFFFFFFFFFFFLL) == 0x7FFFFFFFFFFFFFFFLL) {
              uint64_t v123 = -1;
            }
            else {
              uint64_t v123 = v121;
            }
            v248[0] = v123;
            if (v123)
            {
              id v124 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              long long v215 = 0u;
              long long v216 = 0u;
              long long v213 = 0u;
              long long v214 = 0u;
              id v125 = v177;
              uint64_t v126 = [v125 countByEnumeratingWithState:&v213 objects:v300 count:16];
              if (v126)
              {
                uint64_t v127 = *(void *)v214;
                if (v122 == 0x7FFFFFFFFFFFFFFFLL) {
                  uint64_t v128 = 0;
                }
                else {
                  uint64_t v128 = v248;
                }
                while (2)
                {
                  for (uint64_t k = 0; k != v126; ++k)
                  {
                    if (*(void *)v214 != v127) {
                      objc_enumerationMutation(v125);
                    }
                    float v130 = *(void **)(*((void *)&v213 + 1) + 8 * k);
                    [v130 confidence];
                    float v132 = v131;
                    if (v131 >= v120)
                    {
                      std::string::size_type v133 = [v130 identifier];
                      char v134 = -[VNImageAnalyzerMultiDetector _processSceneIdentifier:withConfidence:disallowedList:operationPoints:originatingRequestSpecifier:observationsArray:optionalTopN:error:]((uint64_t)val, v133, toa, v118, v207, v124, v128, (uint64_t)v204, v132);

                      if ((v134 & 1) == 0)
                      {

LABEL_82:
                        int v150 = 1;
                        goto LABEL_83;
                      }
                    }
                  }
                  uint64_t v126 = [v125 countByEnumeratingWithState:&v213 objects:v300 count:16];
                  if (v126) {
                    continue;
                  }
                  break;
                }
              }

              [v201 addObjectsFromArray:v124];
            }
            v247[0] = 0;
            unint64_t v135 = [v117 maximumHierarchicalLabels];
            unint64_t v136 = v135;
            uint64_t v137 = 0x7FFFFFFFLL;
            if (v135 < 0x7FFFFFFF) {
              uint64_t v137 = v135;
            }
            v247[0] = v137;
            if (v137)
            {
              id v138 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              long long v211 = 0u;
              long long v212 = 0u;
              long long v209 = 0u;
              long long v210 = 0u;
              id v139 = v176;
              uint64_t v140 = [v139 countByEnumeratingWithState:&v209 objects:v299 count:16];
              if (v140)
              {
                uint64_t v141 = *(void *)v210;
                if (v136 >= 0x7FFFFFFF) {
                  std::vector<int>::pointer v142 = 0;
                }
                else {
                  std::vector<int>::pointer v142 = v247;
                }
                while (2)
                {
                  for (uint64_t m = 0; m != v140; ++m)
                  {
                    if (*(void *)v210 != v141) {
                      objc_enumerationMutation(v139);
                    }
                    v144 = *(void **)(*((void *)&v209 + 1) + 8 * m);
                    [v144 confidence];
                    float v146 = v145;
                    if (v145 >= v120)
                    {
                      float v147 = [v144 identifier];
                      char v148 = -[VNImageAnalyzerMultiDetector _processSceneIdentifier:withConfidence:disallowedList:operationPoints:originatingRequestSpecifier:observationsArray:optionalTopN:error:]((uint64_t)val, v147, toa, v118, v207, v138, v142, (uint64_t)v204, v146);

                      if ((v148 & 1) == 0)
                      {

                        goto LABEL_82;
                      }
                    }
                  }
                  uint64_t v140 = [v139 countByEnumeratingWithState:&v209 objects:v299 count:16];
                  if (v140) {
                    continue;
                  }
                  break;
                }
              }

              [v201 addObjectsFromArray:v138];
            }
            id v149 = &__block_literal_global_128_38097;
            [v201 sortWithOptions:16 usingComparator:&__block_literal_global_128_38097];

            [v188 receiveObservations:v201];
            [(id)v288[5] addObjectsFromArray:v201];
            int v150 = 0;
LABEL_83:
          }
          else
          {
            int v150 = 1;
          }

          if (v150)
          {

            id v25 = 0;
            goto LABEL_101;
          }
          uint64_t v116 = v184 + 1;
        }
        while (v184 + 1 != v179);
        uint64_t v115 = [obj countByEnumeratingWithState:&v217 objects:v301 count:16];
        if (v115) {
          continue;
        }
        break;
      }
    }

    id v25 = (id)v288[5];
LABEL_101:

    goto LABEL_95;
  }
LABEL_94:
  id v25 = 0;
LABEL_95:

LABEL_96:
  objc_destroyWeak(v263);

  objc_destroyWeak(v275);
  _Block_object_dispose(v279, 8);
  _Block_object_dispose(v280, 8);

  _Block_object_dispose(v282, 8);
  objc_destroyWeak(&location);
  _Block_object_dispose(v285, 8);
  _Block_object_dispose(&v287, 8);

LABEL_97:

  return v25;
}

void __137__VNImageAnalyzerMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  if (WeakRetained)
  {
    kdebug_trace();
    VNValidatedLog(1, @"createScaledFullImageForProcessingBlock: start processing; currentDetector: %@",
      v3,
      v4,
      v5,
      v6,
      v7,
      v8,
      (uint64_t)WeakRetained);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __137__VNImageAnalyzerMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_2;
    aBlock[3] = &unk_1E5B1FE10;
    int v42 = *(_DWORD *)(a1 + 132);
    id v9 = WeakRetained;
    id v35 = v9;
    long long v10 = *(_OWORD *)(a1 + 112);
    long long v40 = *(_OWORD *)(a1 + 96);
    long long v41 = v10;
    id v36 = *(id *)(a1 + 40);
    id v11 = *(id *)(a1 + 48);
    uint64_t v12 = *(void *)(a1 + 80);
    id v37 = v11;
    uint64_t v39 = v12;
    id v38 = *(id *)(a1 + 64);
    id v13 = (uint64_t (**)(void *, id *, double, double, double, double))_Block_copy(aBlock);
    double v14 = *(double *)(a1 + 96);
    double v15 = *(double *)(a1 + 104);
    double v16 = *(double *)(a1 + 112);
    double v17 = *(double *)(a1 + 120);
    id v33 = 0;
    uint64_t v18 = v13[2](v13, &v33, v14, v15, v16, v17);
    id v19 = v33;
    double v20 = [[VNAsyncStatus alloc] initWithStatus:v18 error:v19];
    uint64_t v21 = *(void *)(*(void *)(a1 + 72) + 8);
    float v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = v20;

    VNValidatedLog(1, @"createScaledFullImageForProcessingBlock: finish processing; currentDetector: %@",
      v23,
      v24,
      v25,
      v26,
      v27,
      v28,
      (uint64_t)v9);
    kdebug_trace();
    if (*(unsigned char *)(a1 + 136)) {
      [*(id *)(a1 + 56) dispatchReportBlockCompletion];
    }
  }
  else
  {
    uint64_t v29 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Currently executed Detector should not be nil"];
    id v30 = [[VNAsyncStatus alloc] initWithStatus:0 error:v29];
    uint64_t v31 = *(void *)(*(void *)(a1 + 72) + 8);
    double v32 = *(void **)(v31 + 40);
    *(void *)(v31 + 40) = v30;
  }
}

void __137__VNImageAnalyzerMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 128));
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    VNValidatedLog(1, @"processScaledFullImagePixelBufferBlock: start processing; currentDetector: %@",
      v3,
      v4,
      v5,
      v6,
      v7,
      v8,
      (uint64_t)WeakRetained);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __137__VNImageAnalyzerMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_4;
    aBlock[3] = &unk_1E5B1EBA0;
    id v33 = *(id *)(a1 + 72);
    id v10 = v9;
    id v29 = v10;
    int v39 = *(_DWORD *)(a1 + 172);
    id v30 = *(id *)(a1 + 32);
    int v40 = *(_DWORD *)(a1 + 168);
    long long v35 = *(_OWORD *)(a1 + 88);
    uint64_t v36 = *(void *)(a1 + 104);
    id v31 = *(id *)(a1 + 40);
    long long v37 = *(_OWORD *)(a1 + 136);
    long long v38 = *(_OWORD *)(a1 + 152);
    id v32 = *(id *)(a1 + 48);
    id v34 = *(id *)(a1 + 80);
    id v11 = _Block_copy(aBlock);
    id v27 = 0;
    uint64_t v12 = VNExecuteBlock(v11, (uint64_t)&v27);
    id v13 = v27;
    double v14 = [[VNAsyncStatus alloc] initWithStatus:v12 error:v13];
    uint64_t v15 = *(void *)(*(void *)(a1 + 88) + 8);
    double v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 112) + 8) + 48));
    [*(id *)(*(void *)(*(void *)(a1 + 120) + 8) + 40) addObjectsFromArray:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40)];
    [*(id *)(a1 + 56) addObject:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 112) + 8) + 48));
    VNValidatedLog(1, @"processScaledFullImagePixelBufferBlock: finish processing; currentDetector: %@",
      v17,
      v18,
      v19,
      v20,
      v21,
      v22,
      (uint64_t)v10);
    kdebug_trace();
    if (*(unsigned char *)(a1 + 176)) {
      [*(id *)(a1 + 64) dispatchReportBlockCompletion];
    }
  }
  else
  {
    uint64_t v23 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Currently executed Detector should not be nil"];
    uint64_t v24 = [[VNAsyncStatus alloc] initWithStatus:0 error:v23];
    uint64_t v25 = *(void *)(*(void *)(a1 + 88) + 8);
    uint64_t v26 = *(void **)(v25 + 40);
    *(void *)(v25 + 40) = v24;
  }
  CVPixelBufferRelease(*(CVPixelBufferRef *)(*(void *)(*(void *)(a1 + 104) + 8) + 24));
  *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = 0;
}

void __137__VNImageAnalyzerMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  if (WeakRetained)
  {
    kdebug_trace();
    VNValidatedLog(1, @"createRegionOfInterestCropForProcessingBlock: start processing; currentDetector: %@",
      v3,
      v4,
      v5,
      v6,
      v7,
      v8,
      (uint64_t)WeakRetained);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __137__VNImageAnalyzerMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_7;
    aBlock[3] = &unk_1E5B1FE10;
    int v41 = *(_DWORD *)(a1 + 140);
    id v9 = WeakRetained;
    id v34 = v9;
    long long v39 = *(_OWORD *)(a1 + 104);
    long long v40 = *(_OWORD *)(a1 + 120);
    id v35 = *(id *)(a1 + 40);
    id v10 = *(id *)(a1 + 48);
    uint64_t v11 = *(void *)(a1 + 80);
    id v36 = v10;
    uint64_t v38 = v11;
    id v37 = *(id *)(a1 + 64);
    uint64_t v12 = (uint64_t (**)(void *, id *, double, double, double, double))_Block_copy(aBlock);
    double v13 = *(double *)(a1 + 104);
    double v14 = *(double *)(a1 + 112);
    double v15 = *(double *)(a1 + 120);
    double v16 = *(double *)(a1 + 128);
    id v32 = 0;
    uint64_t v17 = v12[2](v12, &v32, v13, v14, v15, v16);
    id v18 = v32;
    uint64_t v19 = [[VNAsyncStatus alloc] initWithStatus:v17 error:v18];
    uint64_t v20 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;

    VNValidatedLog(1, @"createRegionOfInterestCropForProcessingBlock: finish processing; currentDetector: %@",
      v22,
      v23,
      v24,
      v25,
      v26,
      v27,
      (uint64_t)v9);
    kdebug_trace();
    [*(id *)(a1 + 56) dispatchReportBlockCompletion];
  }
  else
  {
    uint64_t v28 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Currently executed Detector should not be nil"];
    id v29 = [[VNAsyncStatus alloc] initWithStatus:0 error:v28];
    uint64_t v30 = *(void *)(*(void *)(a1 + 72) + 8);
    id v31 = *(void **)(v30 + 40);
    *(void *)(v30 + 40) = v29;
  }
}

void __137__VNImageAnalyzerMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    VNValidatedLog(1, @"processRegionOfInterestBlock: start processing; currentDetector: %@",
      v3,
      v4,
      v5,
      v6,
      v7,
      v8,
      (uint64_t)WeakRetained);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __137__VNImageAnalyzerMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_9;
    aBlock[3] = &unk_1E5B1EC40;
    id v41 = *(id *)(a1 + 88);
    id v10 = v9;
    int v45 = *(_DWORD *)(a1 + 140);
    uint64_t v11 = *(void *)(a1 + 128);
    id v35 = v10;
    uint64_t v44 = v11;
    id v12 = *(id *)(a1 + 32);
    int v46 = *(_DWORD *)(a1 + 136);
    uint64_t v13 = *(void *)(a1 + 40);
    double v14 = *(void **)(a1 + 48);
    id v36 = v12;
    uint64_t v37 = v13;
    long long v42 = *(_OWORD *)(a1 + 96);
    id v15 = v14;
    uint64_t v16 = *(void *)(a1 + 112);
    id v38 = v15;
    uint64_t v43 = v16;
    id v39 = *(id *)(a1 + 56);
    id v40 = *(id *)(a1 + 64);
    uint64_t v17 = _Block_copy(aBlock);
    id v33 = 0;
    uint64_t v18 = VNExecuteBlock(v17, (uint64_t)&v33);
    id v19 = v33;
    uint64_t v20 = [[VNAsyncStatus alloc] initWithStatus:v18 error:v19];
    uint64_t v21 = *(void *)(*(void *)(a1 + 96) + 8);
    uint64_t v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = v20;

    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 112) + 8) + 48));
    [*(id *)(a1 + 72) addObject:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40)];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 112) + 8) + 48));
    VNValidatedLog(1, @"processRegionOfInterestBlock: finish processing; currentDetector: %@",
      v23,
      v24,
      v25,
      v26,
      v27,
      v28,
      (uint64_t)v10);
    kdebug_trace();
    [*(id *)(a1 + 80) dispatchReportBlockCompletion];
  }
  else
  {
    id v29 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Currently executed Detector should not be nil"];
    uint64_t v30 = [[VNAsyncStatus alloc] initWithStatus:0 error:v29];
    uint64_t v31 = *(void *)(*(void *)(a1 + 96) + 8);
    id v32 = *(void **)(v31 + 40);
    *(void *)(v31 + 40) = v30;
  }
  CVPixelBufferRelease(*(CVPixelBufferRef *)(*(void *)(*(void *)(a1 + 104) + 8) + 24));
  *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = 0;
}

BOOL __137__VNImageAnalyzerMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_9(uint64_t a1, void *a2)
{
  if (dispatch_block_wait(*(dispatch_block_t *)(a1 + 80), 0xFFFFFFFFFFFFFFFFLL))
  {
    if (a2)
    {
      uint64_t v4 = +[VNError errorForExecutionTimeoutWithLocalizedDescription:@"Timed out waiting for dependent task execution"];
LABEL_8:
      BOOL v18 = 0;
      *a2 = v4;
      return v18;
    }
    return 0;
  }
  kdebug_trace();
  VNValidatedLog(1, @"processRegionOfInterestBlock: start processing (crop is ready); currentDetector: %@",
    v5,
    v6,
    v7,
    v8,
    v9,
    v10,
    *(void *)(a1 + 32));
  if (([*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) completed] & 1) == 0)
  {
    if (a2)
    {
      uint64_t v4 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) error];
      goto LABEL_8;
    }
    return 0;
  }
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 1;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __137__VNImageAnalyzerMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_10;
  aBlock[3] = &unk_1E5B1EC18;
  id v21 = *(id *)(a1 + 32);
  int v30 = *(_DWORD *)(a1 + 120);
  id v11 = *(id *)(a1 + 40);
  int v31 = *(_DWORD *)(a1 + 124);
  uint64_t v12 = *(void *)(a1 + 48);
  uint64_t v13 = *(void **)(a1 + 56);
  id v22 = v11;
  uint64_t v23 = v12;
  uint64_t v14 = *(void *)(a1 + 96);
  uint64_t v27 = &v32;
  uint64_t v28 = v14;
  id v15 = v13;
  uint64_t v16 = *(void *)(a1 + 104);
  id v24 = v15;
  uint64_t v29 = v16;
  id v25 = *(id *)(a1 + 64);
  id v26 = *(id *)(a1 + 72);
  uint64_t v17 = _Block_copy(aBlock);
  CVPixelBufferLockBaseAddress(*(CVPixelBufferRef *)(*(void *)(*(void *)(a1 + 96) + 8) + 24), 1uLL);
  [(id)objc_opt_class() runSuccessReportingBlockSynchronously:v17 detector:*(void *)(a1 + 32) qosClass:*(unsigned int *)(a1 + 124) error:a2];
  CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(*(void *)(*(void *)(a1 + 96) + 8) + 24), 1uLL);
  BOOL v18 = *((unsigned char *)v33 + 24) != 0;

  _Block_object_dispose(&v32, 8);
  return v18;
}

BOOL __137__VNImageAnalyzerMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_10(uint64_t a1, void *a2)
{
  v31[1] = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  VNValidatedLog(1, @"processRegionOfInterest Netto: start processing; currentDetector: %@",
    v4,
    v5,
    v6,
    v7,
    v8,
    v9,
    *(void *)(a1 + 32));
  uint64_t v10 = *(void *)(*(void *)(a1 + 88) + 8);
  uint64_t v11 = *(void *)(a1 + 48);
  id v12 = *(id *)(a1 + 56);
  uint64_t v13 = v12;
  if (v11)
  {
    v31[0] = v12;
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
    int v15 = -[VNImageAnalyzerMultiDetector _analysisTypeForScenes:entityNet:junk:VNVYvzEtX1JlUdu8xx5qhDI:landmark:sceneprints:compressedSceneprint:fingerprints:aesthetics:saliencyA:saliencyO:recognizeObjects:VN5kJNH3eYuyaLxNpZr5Z7zi:VNdGg5skzXHSAENO6T3enHE:cityNatureGating:photosAdjustments:](v14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

    if (-[VNImageAnalyzerMultiDetector _performAnalysis:pixelBuffer:error:](v11, v15, v10 + 24, (uint64_t)a2))
    {
      id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      LOBYTE(v11) = -[VNImageAnalyzerMultiDetector _populateLeafSceneObservations:hierarchySceneObservations:fromLastAnalysisForSceneConfiguration:error:](v11, v16, v17, v13, a2);
      if (v11)
      {
        id v18 = v16;
        id v19 = v17;
      }
      else
      {
        id v18 = 0;
        id v19 = 0;
      }
    }
    else
    {
      id v18 = 0;
      id v19 = 0;
      LOBYTE(v11) = 0;
    }
  }
  else
  {
    id v18 = 0;
    id v19 = 0;
  }

  id v20 = v18;
  id v21 = v19;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = v11;
  VNValidatedLog(1, @"processRegionOfInterest Netto: finish processing; currentDetector: %@",
    v22,
    v23,
    v24,
    v25,
    v26,
    v27,
    *(void *)(a1 + 32));
  kdebug_trace();
  uint64_t v28 = *(void *)(*(void *)(a1 + 80) + 8);
  int v29 = *(unsigned __int8 *)(v28 + 24);
  if (*(unsigned char *)(v28 + 24))
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 96) + 8) + 48));
    _recordBestClassificationObservations(*(void **)(a1 + 64), v20);
    _recordBestClassificationObservations(*(void **)(a1 + 72), v21);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 96) + 8) + 48));
  }

  return v29 != 0;
}

uint64_t __137__VNImageAnalyzerMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_7(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "createRegionOfInterestCrop:options:qosClass:warningRecorder:pixelBuffer:error:progressHandler:", *(void *)(a1 + 40), *(unsigned int *)(a1 + 104), *(void *)(a1 + 48), *(void *)(*(void *)(a1 + 64) + 8) + 24, a2, *(void *)(a1 + 56), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
}

BOOL __137__VNImageAnalyzerMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_4(uint64_t a1, void *a2)
{
  if (dispatch_block_wait(*(dispatch_block_t *)(a1 + 64), 0xFFFFFFFFFFFFFFFFLL))
  {
    if (a2)
    {
      uint64_t v4 = +[VNError errorForExecutionTimeoutWithLocalizedDescription:@"Timed out waiting for dependent task execution"];
LABEL_8:
      BOOL v12 = 0;
      *a2 = v4;
      return v12;
    }
    return 0;
  }
  kdebug_trace();
  VNValidatedLog(1, @"processRegionOfInterestBlock: start processing (crop is ready); currentDetector: %@",
    v5,
    v6,
    v7,
    v8,
    v9,
    v10,
    *(void *)(a1 + 32));
  if (([*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) completed] & 1) == 0)
  {
    if (a2)
    {
      uint64_t v4 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) error];
      goto LABEL_8;
    }
    return 0;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __137__VNImageAnalyzerMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_5;
  aBlock[3] = &unk_1E5B1EB78;
  id v15 = *(id *)(a1 + 32);
  int v23 = *(_DWORD *)(a1 + 136);
  id v16 = *(id *)(a1 + 40);
  int v24 = *(_DWORD *)(a1 + 140);
  long long v20 = *(_OWORD *)(a1 + 88);
  id v17 = *(id *)(a1 + 48);
  long long v21 = *(_OWORD *)(a1 + 104);
  long long v22 = *(_OWORD *)(a1 + 120);
  id v18 = *(id *)(a1 + 56);
  id v19 = *(id *)(a1 + 72);
  uint64_t v11 = _Block_copy(aBlock);
  CVPixelBufferLockBaseAddress(*(CVPixelBufferRef *)(*(void *)(*(void *)(a1 + 96) + 8) + 24), 1uLL);
  [(id)objc_opt_class() runSuccessReportingBlockSynchronously:v11 detector:*(void *)(a1 + 32) qosClass:*(unsigned int *)(a1 + 140) error:a2];
  CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(*(void *)(*(void *)(a1 + 96) + 8) + 24), 1uLL);
  BOOL v12 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) != 0;

  return v12;
}

BOOL __137__VNImageAnalyzerMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_5(uint64_t a1, uint64_t a2)
{
  kdebug_trace();
  VNValidatedLog(1, @"processRegionOfInterest Netto: start processing; currentDetector: %@",
    v4,
    v5,
    v6,
    v7,
    v8,
    v9,
    *(void *)(a1 + 32));
  uint64_t v10 = objc_msgSend(*(id *)(a1 + 32), "_processFullImagePixelBuffer:options:regionOfInterest:qosClass:warningRecorder:error:progressHandler:", *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24), *(void *)(a1 + 48), *(unsigned int *)(a1 + 124), *(void *)(a1 + 56), a2, *(void *)(a1 + 64), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112));
  uint64_t v11 = *(void *)(*(void *)(a1 + 72) + 8);
  BOOL v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  VNValidatedLog(1, @"processRegionOfInterest Netto: finish processing; currentDetector: %@",
    v13,
    v14,
    v15,
    v16,
    v17,
    v18,
    *(void *)(a1 + 32));
  kdebug_trace();
  return *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) != 0;
}

uint64_t __137__VNImageAnalyzerMultiDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "createRegionOfInterestCrop:options:qosClass:warningRecorder:pixelBuffer:error:progressHandler:", *(void *)(a1 + 40), *(unsigned int *)(a1 + 104), *(void *)(a1 + 48), *(void *)(*(void *)(a1 + 64) + 8) + 24, a2, *(void *)(a1 + 56), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v85.receiver = self;
  v85.super_class = (Class)VNImageAnalyzerMultiDetector;
  if ([(VNDetector *)&v85 completeInitializationForSession:v6 error:a4])
  {
    uint64_t v7 = objc_alloc_init(VNRegionOfInterestTilingOptions);
    inputImageTilingOptions = self->_inputImageTilingOptions;
    self->_inputImageTilingOptions = v7;

    [(VNRegionOfInterestTilingOptions *)self->_inputImageTilingOptions setTileOverflowCount:16];
    [(VNRegionOfInterestTilingOptions *)self->_inputImageTilingOptions setTileOverlapPercentage:0.5];
    [(VNRegionOfInterestTilingOptions *)self->_inputImageTilingOptions setRegionOfInterestAspectRatioThreshold:2.0];
    uint64_t v9 = +[VNComputeDeviceUtilities mostPerformantCPUComputeDevice];
    self->_customClassifierEspressoEngine = +[VNEspressoHelpers espressoEngineForComputeDevice:v9];
    self->_customClassifierEspressoDeviceID = +[VNEspressoHelpers espressoDeviceIDForComputeDevice:v9];
    [(VNDetector *)self configurationOptions];
    uint64_t v64 = __str.__r_.__value_.__r.__words[0] = 0;
    if (!+[VNValidationUtilities getNSUIntegerValue:forKey:inOptions:error:](VNValidationUtilities, "getNSUIntegerValue:forKey:inOptions:error:", &__str, @"VNImageAnalyzerMultiDetectorInitializationOption_Model"))goto LABEL_64; {
    self->_model = __str.__r_.__value_.__r.__words[0];
    }
    uint64_t v63 = objc_opt_class();
    uint64_t v10 = (VisionCoreSceneNetInferenceNetworkDescriptor *)[v63 _newInferenceDescriptorForModel:self->_model configuredWithOptions:v64 error:a4];
    inferenceDescriptor = self->_inferenceDescriptor;
    self->_inferenceDescriptor = v10;

    BOOL v12 = self->_inferenceDescriptor;
    if (!v12) {
      goto LABEL_64;
    }
    uint64_t v13 = [(VisionCoreSceneNetInferenceNetworkDescriptor *)v12 onlyInputImage];
    self->_signed int cachedInferenceImagePixelFormatType = [v13 pixelFormatType];

    uint64_t v14 = [[_VNImageAnalyzerMultiDetectorSceneOperationPointsCache alloc] initWithInferenceNetworkDescriptor:self->_inferenceDescriptor];
    operationPointsCache = self->_operationPointsCache;
    self->_operationPointsCache = v14;

    uint64_t v16 = [(VNDetector *)self boundComputeDeviceForComputeStage:@"VNComputeStageMain" error:a4];
    if (!v16)
    {
LABEL_63:

LABEL_64:
      goto LABEL_65;
    }
    id v62 = [(VisionCoreSceneNetInferenceNetworkDescriptor *)self->_inferenceDescriptor modelPathForComputeDevice:v16 error:a4];
    if (!v62)
    {
      long long v21 = 0;
LABEL_62:

      goto LABEL_63;
    }
    vision::mod::ImageAnalyzer_Options::ImageAnalyzer_Options((vision::mod::ImageAnalyzer_Options *)&__str);
    id v17 = [(VisionCoreSceneNetInferenceNetworkDescriptor *)self->_inferenceDescriptor analyzerName];
    std::string::__assign_external(&__str, (const std::string::value_type *)[v17 UTF8String]);

    int v71 = +[VNEspressoHelpers espressoDeviceIDForComputeDevice:v16];
    int v70 = +[VNEspressoHelpers espressoStorageTypeForComputeDevice:v16];
    int v68 = +[VNEspressoHelpers espressoEngineForComputeDevice:v16];
    int v69 = 0;
    id v18 = [(VisionCoreSceneNetInferenceNetworkDescriptor *)self->_inferenceDescriptor inputImageBlobName];
    std::string::__assign_external(&v73, (const std::string::value_type *)[v18 UTF8String]);

    signed int cachedInferenceImagePixelFormatType = self->_cachedInferenceImagePixelFormatType;
    if (cachedInferenceImagePixelFormatType <= 1094862673)
    {
      if (cachedInferenceImagePixelFormatType == 8)
      {
        int v20 = 1;
        goto LABEL_22;
      }
      if (cachedInferenceImagePixelFormatType == 32)
      {
        int v20 = 8;
        goto LABEL_22;
      }
    }
    else
    {
      switch(cachedInferenceImagePixelFormatType)
      {
        case 1380401729:
          int v20 = 2;
          goto LABEL_22;
        case 1111970369:
          int v20 = 4;
          goto LABEL_22;
        case 1094862674:
          int v20 = 16;
          goto LABEL_22;
      }
    }
    int v20 = 0;
LABEL_22:
    int v72 = v20;
    __int16 v82 = 256;
    long long v22 = [v64 objectForKeyedSubscript:@"VNDetectorInitOption_MemoryPoolId"];
    uint64_t v84 = [v22 unsignedLongLongValue];

    int v23 = [(VisionCoreSceneNetInferenceNetworkDescriptor *)self->_inferenceDescriptor shouldInitializeAdditionalModelHeads];
    id v61 = [(VisionCoreSceneNetInferenceNetworkDescriptor *)self->_inferenceDescriptor sceneRepresentationBlobName];
    if (v61) {
      std::string::__assign_external(&v74, (const std::string::value_type *)[v61 UTF8String]);
    }
    int v24 = [(VisionCoreSceneNetInferenceNetworkDescriptor *)self->_inferenceDescriptor sceneLabelsFileURL];
    uint64_t v25 = [v24 VisionCoreFileSystemPathAndReturnError:0];

    id v60 = (id)v25;
    if (v25)
    {
      id v26 = [(VisionCoreSceneNetInferenceNetworkDescriptor *)self->_inferenceDescriptor sceneClassificationLabelsBlobName];
      std::string::__assign_external(&v76, (const std::string::value_type *)[v26 UTF8String]);
    }
    uint64_t v27 = [(VisionCoreSceneNetInferenceNetworkDescriptor *)self->_inferenceDescriptor aestheticsLabelsFileURL];
    uint64_t v28 = [v27 VisionCoreFileSystemPathAndReturnError:0];

    if (v28)
    {
      id v29 = [(VisionCoreSceneNetInferenceNetworkDescriptor *)self->_inferenceDescriptor aestheticsScoresBlobName];
      std::string::__assign_external(&v78, (const std::string::value_type *)[v29 UTF8String]);

      id v30 = [(VisionCoreSceneNetInferenceNetworkDescriptor *)self->_inferenceDescriptor aestheticsAttributesBlobName];
      std::string::__assign_external(&v77, (const std::string::value_type *)[v30 UTF8String]);
    }
    int v56 = v23;
    int v31 = [(VisionCoreSceneNetInferenceNetworkDescriptor *)self->_inferenceDescriptor saliencyAHeatMapBlobName];
    id v59 = v31;
    if (v31)
    {
      std::string::__assign_external(v79, (const std::string::value_type *)[v31 UTF8String]);
      uint64_t v32 = (void *)[(id)objc_opt_class() _newSaliencyHeatmapBoundingBoxGeneratorOptionsForOptions:v64];
      id v33 = [v6 detectorOfType:@"VNAttentionBasedSaliencyHeatmapBoundingBoxGeneratorType" configuredWithOptions:v32 error:a4];

      uint64_t v34 = v59;
      if (!v33)
      {
        long long v21 = v62;
        long long v42 = v60;
LABEL_61:

        vision::mod::ImageAnalyzer_Options::~ImageAnalyzer_Options((vision::mod::ImageAnalyzer_Options *)&__str);
        goto LABEL_62;
      }
    }
    char v35 = [(VisionCoreSceneNetInferenceNetworkDescriptor *)self->_inferenceDescriptor saliencyOHeatMapBlobName];
    id v58 = v35;
    if (v35)
    {
      std::string::__assign_external(v80, (const std::string::value_type *)[v35 UTF8String]);
      id v36 = (void *)[(id)objc_opt_class() _newSaliencyHeatmapBoundingBoxGeneratorOptionsForOptions:v64];
      uint64_t v37 = [v6 detectorOfType:@"VNObjectnessBasedSaliencyHeatmapBoundingBoxGeneratorType" configuredWithOptions:v36 error:a4];

      id v38 = v58;
      if (!v37)
      {
        long long v21 = v62;
        long long v42 = v60;
LABEL_60:

        uint64_t v34 = v59;
        goto LABEL_61;
      }
    }
    id v39 = [(VisionCoreSceneNetInferenceNetworkDescriptor *)self->_inferenceDescriptor entityNetLabelsFileURL];
    uint64_t v55 = v39;
    if (v39)
    {
      uint64_t v40 = [v39 VisionCoreFileSystemPathAndReturnError:a4];
      if (!v40) {
        goto LABEL_59;
      }
      id v54 = (id)v40;
      id v41 = [(VisionCoreSceneNetInferenceNetworkDescriptor *)self->_inferenceDescriptor entityNetLabelsBlobName];
      std::string::__assign_external(&v81, (const std::string::value_type *)[v41 UTF8String]);
    }
    else
    {
      id v54 = 0;
    }
    if (v56)
    {
      uint64_t v43 = [(VisionCoreSceneNetInferenceNetworkDescriptor *)self->_inferenceDescriptor objectDetectorLabelsFileURL];
      uint64_t v44 = [v43 VisionCoreFileSystemPathAndReturnError:a4];

      if (!v44)
      {
        uint64_t v52 = 0;
LABEL_58:

LABEL_59:
        long long v21 = v62;
        long long v42 = v60;

        id v38 = v58;
        goto LABEL_60;
      }
      id v57 = (id)v44;
      if (self->_model == 1)
      {
        id v45 = [(VisionCoreSceneNetInferenceNetworkDescriptor *)self->_inferenceDescriptor objectDetectorOutputBlobBaseName];
        std::string::__assign_external(v83, (const std::string::value_type *)[v45 UTF8String]);

        _configureImageAnalyzerOptionsForSceneNetV3ObjDetNet((vision::mod::ImageAnalyzer_Options *)&__str);
        -[VNImageAnalyzerMultiDetector _configureSlidersAdjustmentsInImageAnalyzerOptions:forConfigurationOptions:]((uint64_t)self, (std::vector<std::string> *)&__str);
      }
    }
    else
    {
      id v57 = 0;
      if (!v25) {
        goto LABEL_53;
      }
    }
    if (v63)
    {
      [v63 createHierarchicalModelForInferenceDescriptor:self->_inferenceDescriptor error:a4];
      shared_ptr<vision::mod::ImageClassifier_HierarchicalModel> v46 = *(shared_ptr<vision::mod::ImageClassifier_HierarchicalModel> *)__p;
    }
    else
    {
      shared_ptr<vision::mod::ImageClassifier_HierarchicalModel> v46 = (shared_ptr<vision::mod::ImageClassifier_HierarchicalModel>)0;
    }
    __p[0] = 0;
    __p[1] = 0;
    cntrl = self->_defaultSceneClassificationHierarchicalModel.__cntrl_;
    self->_defaultSceneClassificationHierarchicalModel = v46;
    if (cntrl)
    {
      std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
      if (__p[1]) {
        std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)__p[1]);
      }
      ptr = self->_defaultSceneClassificationHierarchicalModel.__ptr_;
    }
    else
    {
      ptr = v46.__ptr_;
    }
    if (ptr)
    {
LABEL_53:
      id v49 = [(VisionCoreSceneNetInferenceNetworkDescriptor *)self->_inferenceDescriptor fingerprintsHasherFileURL];
      uint64_t v50 = [v49 VisionCoreFileSystemPathAndReturnError:0];

      if (v50)
      {
        id v51 = [(VisionCoreSceneNetInferenceNetworkDescriptor *)self->_inferenceDescriptor fingerprintsOutputBlobName];
        std::string::__assign_external(&v75, (const std::string::value_type *)[v51 UTF8String]);
      }
      id v66 = (id)8576;
      vision::mod::ImageAnalyzer::createImageAnalyzer((vision::mod::ImageAnalyzer *)__p, (uint64_t *)&v66, (char *)[v62 UTF8String], (const char *)objc_msgSend(objc_retainAutorelease(v60), "UTF8String"), (const char *)objc_msgSend(objc_retainAutorelease(v28), "UTF8String"), 0, (const char *)objc_msgSend(objc_retainAutorelease(v57), "UTF8String"), (const char *)objc_msgSend(objc_retainAutorelease(v54), "UTF8String"), &__str, (const char *)v16, (const vision::mod::ImageAnalyzer_Options *)v28);
    }
    uint64_t v52 = v57;
    goto LABEL_58;
  }
LABEL_65:

  return 0;
}

- (void)_configureSlidersAdjustmentsInImageAnalyzerOptions:(uint64_t)a1 forConfigurationOptions:(std::vector<std::string> *)a2
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v4 = a2 + 14;
    std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)&a2[14]);
    uint64_t v5 = [*(id *)(a1 + 80) sliderNetBlobNamePrefix];
    id v6 = v5;
    if (v5)
    {
      std::string::basic_string[abi:ne180100]<0>(&v22, (char *)[v5 UTF8String]);
      [(id)objc_opt_class() allPhotosAdjustmentKeys];
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v19;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v19 != v9) {
              objc_enumerationMutation(v7);
            }
            uint64_t v11 = *(void **)(*((void *)&v18 + 1) + 8 * v10);
            if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0) {
              std::string::__init_copy_ctor_external(&__p, v22.__r_.__value_.__l.__data_, v22.__r_.__value_.__l.__size_);
            }
            else {
              std::string __p = v22;
            }
            BOOL v12 = (const char *)[v11 UTF8String];
            std::string::size_type v13 = strlen(v12);
            std::string::append(&__p, v12, v13);
            std::vector<std::string>::pointer end = a2[14].__end_;
            if (end >= a2[14].__end_cap_.__value_)
            {
              std::vector<std::string>::pointer v16 = std::vector<std::string>::__push_back_slow_path<std::string const&>(v4, (long long *)&__p);
            }
            else
            {
              if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
              {
                std::string::__init_copy_ctor_external(a2[14].__end_, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
              }
              else
              {
                long long v15 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
                end->__r_.__value_.__r.__words[2] = __p.__r_.__value_.__r.__words[2];
                *(_OWORD *)&end->__r_.__value_.__l.__data_ = v15;
              }
              std::vector<std::string>::pointer v16 = end + 1;
              a2[14].__end_ = end + 1;
            }
            a2[14].__end_ = v16;
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(__p.__r_.__value_.__l.__data_);
            }
            ++v10;
          }
          while (v8 != v10);
          uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
        }
        while (v8);
      }

      if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v22.__r_.__value_.__l.__data_);
      }
    }
  }
}

- (VNImageAnalyzerMultiDetector)initWithConfigurationOptions:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VNImageAnalyzerMultiDetector;
  result = [(VNDetector *)&v4 initWithConfigurationOptions:a3];
  if (result) {
    result->_cachedAllSceneClassificationsFromLastAnalysisAccessLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (BOOL)warmUpSession:(id)a3 withOptions:(id)a4 error:(id *)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v51.receiver = self;
  v51.super_class = (Class)VNImageAnalyzerMultiDetector;
  if (![(VNDetector *)&v51 warmUpSession:v8 withOptions:v9 error:a5]) {
    goto LABEL_39;
  }
  uint64_t v10 = [v9 objectForKeyedSubscript:@"VNImageAnalyzerMultiDetectorOption_JunkConfiguration"];
  BOOL v11 = v10 == 0;

  if (v11) {
    goto LABEL_6;
  }
  [(VNImageAnalyzerMultiDetector *)&v49 _junkCustomClassifiersAndReturnError:a5];
  BOOL v12 = v49;
  if (v50) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v50);
  }
  if (v12)
  {
LABEL_6:
    [v9 objectForKeyedSubscript:@"VNImageAnalyzerMultiDetectorOption_SceneConfigurations"];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v13 countByEnumeratingWithState:&v45 objects:v52 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v46;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v46 != v15) {
            objc_enumerationMutation(v13);
          }
          uint64_t v17 = [*(id *)(*((void *)&v45 + 1) + 8 * i) observationsRecipient];
          long long v18 = [(id)v17 originatingRequestSpecifier];

          long long v19 = [(VNImageAnalyzerMultiDetector *)self sceneLabelOperationPointsForOriginatingRequestSpecifier:v18 error:a5];
          LOBYTE(v17) = v19 == 0;

          if (v17)
          {

            LOBYTE(v40) = 0;
            goto LABEL_43;
          }
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v45 objects:v52 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __64__VNImageAnalyzerMultiDetector_warmUpSession_withOptions_error___block_invoke;
    aBlock[3] = &unk_1E5B1EB28;
    void aBlock[4] = self;
    id v20 = v9;
    id v43 = v20;
    id v44 = v8;
    long long v21 = (uint64_t (**)(void *, __CFString *, id *))_Block_copy(aBlock);
    std::string v22 = [v20 objectForKeyedSubscript:@"VNImageAnalyzerMultiDetectorOption_SaliencyAConfiguration"];
    BOOL v23 = v22 == 0;

    if (!v23 && (v21[2](v21, @"VNAttentionBasedSaliencyHeatmapBoundingBoxGeneratorType", a5) & 1) == 0) {
      goto LABEL_41;
    }
    uint64_t v24 = [v20 objectForKeyedSubscript:@"VNImageAnalyzerMultiDetectorOption_SaliencyOConfiguration"];
    BOOL v25 = v24 == 0;

    if (!v25 && !v21[2](v21, @"VNObjectnessBasedSaliencyHeatmapBoundingBoxGeneratorType", a5)) {
      goto LABEL_41;
    }
    id v26 = [v20 objectForKeyedSubscript:@"VNImageAnalyzerMultiDetectorOption_VNVYvzEtX1JlUdu8xx5qhDIConfiguration"];
    BOOL v27 = v26 == 0;

    if (!v27)
    {
      [(VNImageAnalyzerMultiDetector *)&v49 _VNVYvzEtX1JlUdu8xx5qhDICustomClassifierAndReturnError:a5];
      BOOL v28 = v49;
      if (v50) {
        std::__shared_weak_count::__release_shared[abi:nn180100](v50);
      }
      if (!v28) {
        goto LABEL_41;
      }
    }
    id v29 = [v20 objectForKeyedSubscript:@"VNImageAnalyzerMultiDetectorOption_PotentialLandmarkConfiguration"];
    BOOL v30 = v29 == 0;

    if (!v30)
    {
      [(VNImageAnalyzerMultiDetector *)&v49 _potentialLandmarksCustomClassifierAndReturnError:a5];
      BOOL v31 = v49;
      if (v50) {
        std::__shared_weak_count::__release_shared[abi:nn180100](v50);
      }
      if (!v31) {
        goto LABEL_41;
      }
    }
    uint64_t v32 = [v20 objectForKeyedSubscript:@"VNImageAnalyzerMultiDetectorOption_VN5kJNH3eYuyaLxNpZr5Z7ziConfiguration"];
    BOOL v33 = v32 == 0;

    if (!v33)
    {
      [(VNImageAnalyzerMultiDetector *)&v49 _VN5kJNH3eYuyaLxNpZr5Z7ziCustomClassifierAndReturnError:a5];
      BOOL v34 = v49;
      if (v50) {
        std::__shared_weak_count::__release_shared[abi:nn180100](v50);
      }
      if (!v34) {
        goto LABEL_41;
      }
    }
    char v35 = [v20 objectForKeyedSubscript:@"VNImageAnalyzerMultiDetectorOption_VN6Mb1ME89lyW3HpahkEygIGConfiguration"];
    BOOL v36 = v35 == 0;

    if (v36) {
      goto LABEL_34;
    }
    [(VNImageAnalyzerMultiDetector *)&v49 _VNdGg5skzXHSAENO6T3enHECustomClassifierForOriginatingRequestSpecifier:a5];
    BOOL v37 = v49;
    if (v50) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v50);
    }
    if (v37)
    {
LABEL_34:
      id v38 = [v20 objectForKeyedSubscript:@"VNImageAnalyzerMultiDetectorOption_CityNatureGatingConfiguration"];
      BOOL v39 = v38 == 0;

      if (v39) {
        goto LABEL_38;
      }
      [(VNImageAnalyzerMultiDetector *)&v49 _cityNatureCustomClassifierAndReturnError:a5];
      BOOL v40 = v49;
      if (v50) {
        std::__shared_weak_count::__release_shared[abi:nn180100](v50);
      }
      if (v40) {
LABEL_38:
      }
        LOBYTE(v40) = 1;
    }
    else
    {
LABEL_41:
      LOBYTE(v40) = 0;
    }

LABEL_43:
  }
  else
  {
LABEL_39:
    LOBYTE(v40) = 0;
  }

  return v40;
}

uint64_t __64__VNImageAnalyzerMultiDetector_warmUpSession_withOptions_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = (void *)[(id)objc_opt_class() _newSaliencyHeatmapBoundingBoxGeneratorOptionsForOptions:*(void *)(a1 + 40)];
  id v7 = [*(id *)(a1 + 48) detectorOfType:v5 configuredWithOptions:v6 error:a3];
  id v8 = v7;
  if (v7) {
    uint64_t v9 = [v7 warmUpSession:*(void *)(a1 + 48) withOptions:*(void *)(a1 + 40) error:a3];
  }
  else {
    uint64_t v9 = 0;
  }

  return v9;
}

- (BOOL)shouldBeReplacedByDetectorOfClass:(Class)a3 withConfiguration:(id)a4
{
  id v6 = a4;
  if ((Class)objc_opt_class() == a3)
  {
    if (-[VNImageAnalyzerMultiDetector _isNotConfiguredWithBooleanOptionNamed:butRequiredByOptions:](self, @"VNImageAnalyzerMultiDetectorInitializationOption_RequireObjDetNet", v6))unsigned __int8 v7 = 1; {
    else
    }
      unsigned __int8 v7 = -[VNImageAnalyzerMultiDetector _isNotConfiguredWithBooleanOptionNamed:butRequiredByOptions:](self, @"VNImageAnalyzerMultiDetectorInitializationOption_RequireSliderNet", v6);
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (void)_isNotConfiguredWithBooleanOptionNamed:(void *)a3 butRequiredByOptions:
{
  id v5 = a2;
  id v6 = a3;
  unsigned __int8 v7 = v6;
  if (a1)
  {
    id v8 = [v6 objectForKey:v5];
    char v9 = [v8 BOOLValue];

    if (v9)
    {
      uint64_t v10 = [a1 configurationOptions];
      BOOL v11 = [v10 objectForKey:v5];
      int v12 = [v11 BOOLValue];

      a1 = (void *)(v12 ^ 1u);
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (BOOL)canBehaveAsDetectorOfClass:(Class)a3 withConfiguration:(id)a4
{
  id v6 = a4;
  if ((Class)objc_opt_class() != a3
    || (-[VNImageAnalyzerMultiDetector _isNotConfiguredWithBooleanOptionNamed:butRequiredByOptions:](self, @"VNImageAnalyzerMultiDetectorInitializationOption_RequireObjDetNet", v6) & 1) != 0|| (-[VNImageAnalyzerMultiDetector _isNotConfiguredWithBooleanOptionNamed:butRequiredByOptions:](self, @"VNImageAnalyzerMultiDetectorInitializationOption_RequireSliderNet", v6) & 1) != 0)
  {
    BOOL v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)VNImageAnalyzerMultiDetector;
    BOOL v7 = [(VNDetector *)&v9 canBehaveAsDetectorOfClass:a3 withConfiguration:v6];
  }

  return v7;
}

- (unint64_t)signPostAdditionalParameter
{
  unint64_t model = self->_model;
  return [(VisionCoreSceneNetInferenceNetworkDescriptor *)self->_inferenceDescriptor shouldInitializeAdditionalModelHeads] | (model << 56);
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)VNImageAnalyzerMultiDetector;
  uint64_t v2 = [(VNDetector *)&v6 description];
  uint64_t v3 = NSStringFromVisionCoreSceneNetInferenceNetworkModel();
  objc_super v4 = [v2 stringByAppendingFormat:@" %@", v3];

  return v4;
}

+ (id)allPhotosAdjustmentKeys
{
  return &unk_1EF7A7E80;
}

+ (id)supportedImageSizeSetForOptions:(id)a3 error:(id *)a4
{
  objc_super v6 = objc_msgSend(a1, "_inferenceDescriptorForOptions:error:", a3);
  BOOL v7 = v6;
  if (v6)
  {
    id v8 = [v6 URL];
    objc_super v9 = [v8 VisionCoreFileSystemPathAndReturnError:a4];

    if (v9)
    {
      uint64_t v10 = [v7 inputImageBlobName];
      BOOL v11 = [v7 onlyInputImage];
      int v12 = objc_msgSend(a1, "supportedImageSizeSetForEspressoModelAtPath:inputImageBlobName:analysisPixelFormatType:error:", v9, v10, objc_msgSend(v11, "pixelFormatType"), a4);
    }
    else
    {
      int v12 = 0;
    }
  }
  else
  {
    int v12 = 0;
  }

  return v12;
}

+ (shared_ptr<vision::mod::ImageClassifier_HierarchicalModel>)createHierarchicalModelForMultiDetectorModel:(unint64_t)a3 error:(id *)a4
{
  id v8 = v4;
  id v12 = [a1 fullyPopulatedConfigurationOptionsWithOverridingOptions:MEMORY[0x1E4F1CC08]];
  objc_super v9 = objc_msgSend(a1, "_newInferenceDescriptorForModel:configuredWithOptions:error:", a3);
  if (v9)
  {
    [a1 createHierarchicalModelForInferenceDescriptor:v9 error:a4];
  }
  else
  {
    void *v8 = 0;
    v8[1] = 0;
  }

  result.__cntrl_ = v11;
  result.__ptr_ = v10;
  return result;
}

+ (shared_ptr<vision::mod::ImageClassifier_HierarchicalModel>)createHierarchicalModelForInferenceDescriptor:(id)a3 error:(id *)a4
{
  objc_super v6 = v4;
  id v7 = a3;
  id v8 = [v7 sceneLabelsFileURL];
  objc_super v9 = [v8 VisionCoreFileSystemPathAndReturnError:a4];

  if (v9)
  {
    uint64_t v10 = [v7 sceneLabelRelationshipsFileURL];
    BOOL v11 = [v10 VisionCoreFileSystemPathAndReturnError:a4];

    if (v11)
    {
      uint64_t v20 = 0;
      long long v21 = &v20;
      uint64_t v22 = 0x4012000000;
      BOOL v23 = __Block_byref_object_copy__510;
      uint64_t v24 = __Block_byref_object_dispose__511;
      BOOL v25 = "";
      uint64_t v26 = 0;
      BOOL v27 = 0;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __84__VNImageAnalyzerMultiDetector_createHierarchicalModelForInferenceDescriptor_error___block_invoke;
      aBlock[3] = &unk_1E5B1ECB8;
      id v17 = v9;
      long long v19 = &v20;
      id v18 = v11;
      id v12 = _Block_copy(aBlock);
      if (VNExecuteBlock(v12, (uint64_t)a4))
      {
        uint64_t v13 = v21[7];
        *objc_super v6 = v21[6];
        v6[1] = v13;
        if (v13) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(v13 + 8), 1uLL, memory_order_relaxed);
        }
      }
      else
      {
        *objc_super v6 = 0;
        v6[1] = 0;
      }

      _Block_object_dispose(&v20, 8);
      if (v27) {
        std::__shared_weak_count::__release_shared[abi:nn180100](v27);
      }
    }
    else
    {
      *objc_super v6 = 0;
      v6[1] = 0;
    }
  }
  else
  {
    *objc_super v6 = 0;
    v6[1] = 0;
  }

  result.__cntrl_ = v15;
  result.__ptr_ = v14;
  return result;
}

void __84__VNImageAnalyzerMultiDetector_createHierarchicalModelForInferenceDescriptor_error___block_invoke(uint64_t a1)
{
  ImageClassifier_loadLabelsAndBooleanFlags(v17, (const char *)[*(id *)(a1 + 32) UTF8String]);
  uint64_t v14 = 0;
  unint64_t v15 = 0;
  unint64_t v16 = 0;
  uint64_t v2 = *(void *)v17;
  uint64_t v3 = v18;
  if (*(void *)v17 != v18)
  {
    unint64_t v4 = 0;
    do
    {
      if (*(void *)(v2 + 32) < 2uLL) {
        LOBYTE(v5) = 1;
      }
      else {
        int v5 = (**(unsigned __int8 **)(v2 + 24) >> 1) & 1;
      }
      if (*(char *)(v2 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&v13, *(const std::string::value_type **)v2, *(void *)(v2 + 8));
        unint64_t v4 = v15;
      }
      else
      {
        std::string v13 = *(std::string *)v2;
      }
      if (v4 >= v16)
      {
        uint64_t v7 = (uint64_t)(v4 - v14) >> 5;
        if ((unint64_t)(v7 + 1) >> 59) {
          std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v8 = (uint64_t)(v16 - v14) >> 4;
        if (v8 <= v7 + 1) {
          unint64_t v8 = v7 + 1;
        }
        if (v16 - v14 >= 0x7FFFFFFFFFFFFFE0) {
          unint64_t v9 = 0x7FFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v9 = v8;
        }
        v19[4] = &v16;
        uint64_t v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<vImage_Buffer>>(v9);
        BOOL v11 = (std::string *)&v10[32 * v7];
        v19[0] = v10;
        v19[1] = v11;
        v19[3] = &v10[32 * v12];
        std::string *v11 = v13;
        memset(&v13, 0, sizeof(v13));
        v11[1].__r_.__value_.__s.__data_[0] = v5;
        v19[2] = (char *)v11 + 32;
        std::vector<std::pair<std::string,BOOL>>::__swap_out_circular_buffer(&v14, v19);
        unint64_t v4 = v15;
        std::__split_buffer<std::pair<std::string,float>>::~__split_buffer((uint64_t)v19);
      }
      else
      {
        long long v6 = *(_OWORD *)&v13.__r_.__value_.__l.__data_;
        *(void *)(v4 + 16) = *((void *)&v13.__r_.__value_.__l + 2);
        *(_OWORD *)unint64_t v4 = v6;
        *(unsigned char *)(v4 + 24) = v5;
        v4 += 32;
      }
      unint64_t v15 = v4;
      v2 += 48;
    }
    while (v2 != v3);
  }
  std::allocate_shared[abi:ne180100]<vision::mod::ImageClassifier_HierarchicalModel,std::allocator<vision::mod::ImageClassifier_HierarchicalModel>,char const*,decltype(nullptr),std::vector<std::pair<std::string,BOOL>> &,void>((uint64_t)v19, [*(id *)(a1 + 40) UTF8String], &v14);
}

+ (id)disallowedListForModel:(unint64_t)a3
{
  if (a3 == 1)
  {
    int v5 = +[VNDisallowedList sceneNetV3];
  }
  else
  {
    int v5 = 0;
  }
  return v5;
}

void __62__VNImageAnalyzerMultiDetector_modelForRequestClass_revision___block_invoke()
{
}

+ (Class)detectorClassForConfigurationOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  unint64_t v8 = [v6 allKeys];
  unint64_t v9 = (void *)[v7 initWithArray:v8];

  uint64_t v10 = [a1 configurationOptionKeysForDetectorKey];
  if ([v10 isSubsetOfSet:v9])
  {
    v14.receiver = a1;
    v14.super_class = (Class)&OBJC_METACLASS___VNImageAnalyzerMultiDetector;
    objc_msgSendSuper2(&v14, sel_detectorClassForConfigurationOptions_error_, v6, a4);
    a4 = (id *)objc_claimAutoreleasedReturnValue();
  }
  else if (a4)
  {
    BOOL v11 = (void *)[v10 mutableCopy];
    [v11 minusSet:v9];
    uint64_t v12 = [v11 anyObject];
    *a4 = +[VNError errorForMissingOptionNamed:v12];

    a4 = 0;
  }

  return (Class)a4;
}

+ (id)configurationOptionKeysForDetectorKey
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__VNImageAnalyzerMultiDetector_configurationOptionKeysForDetectorKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (+[VNImageAnalyzerMultiDetector configurationOptionKeysForDetectorKey]::onceToken != -1) {
    dispatch_once(&+[VNImageAnalyzerMultiDetector configurationOptionKeysForDetectorKey]::onceToken, block);
  }
  uint64_t v2 = (void *)+[VNImageAnalyzerMultiDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;

  return v2;
}

void __69__VNImageAnalyzerMultiDetector_configurationOptionKeysForDetectorKey__block_invoke(uint64_t a1)
{
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___VNImageAnalyzerMultiDetector;
  v1 = objc_msgSendSuper2(&v5, sel_configurationOptionKeysForDetectorKey);
  uint64_t v2 = (void *)[v1 mutableCopy];

  [v2 addObject:@"VNImageAnalyzerMultiDetectorInitializationOption_Model"];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = (void *)+[VNImageAnalyzerMultiDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNImageAnalyzerMultiDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys = v3;
}

+ (void)recordDefaultConfigurationOptionsInDictionary:(id)a3
{
  id v4 = a3;
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___VNImageAnalyzerMultiDetector;
  objc_msgSendSuper2(&v5, sel_recordDefaultConfigurationOptionsInDictionary_, v4);
  [v4 setObject:&unk_1EF7A76E8 forKeyedSubscript:@"VNImageAnalyzerMultiDetectorInitializationOption_Model"];
}

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v6 error:a4];
  if (v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v9 = +[VNComputeDeviceUtilities espressoV1ModelComputeDevices];
    [v8 setObject:v9 forKeyedSubscript:@"VNComputeStageMain"];

    id v16 = 0;
    id v17 = 0;
    LOBYTE(v9) = [a1 _getAssociatedBoundingBoxGeneratorClass:&v17 options:&v16 forConfigurationOptions:v6 error:a4];
    id v10 = v16;
    if (v9)
    {
      if (!v17)
      {
LABEL_6:
        id v14 = v8;
LABEL_8:

        goto LABEL_10;
      }
      BOOL v11 = [v17 supportedComputeStageDevicesForOptions:v6 error:a4];
      uint64_t v12 = v11;
      if (v11)
      {
        std::string v13 = [v11 objectForKeyedSubscript:@"VNComputeStageMain"];
        [v8 setObject:v13 forKeyedSubscript:@"VNComputeStagePostProcessing"];

        goto LABEL_6;
      }
    }
    id v14 = 0;
    goto LABEL_8;
  }
  id v14 = 0;
LABEL_10:

  return v14;
}

+ (id)computeStagesToBindForConfigurationOptions:(id)a3
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = @"VNComputeStageMain";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

+ (BOOL)producesObservationsForMultipleRequestClasses
{
  return 1;
}

+ (BOOL)_getAssociatedBoundingBoxGeneratorClass:(Class *)a3 options:(id *)a4 forConfigurationOptions:(id)a5 error:(id *)a6
{
  id v10 = a5;
  BOOL v11 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v10 error:a6];
  if (v11)
  {
    uint64_t v12 = [a1 _saliencyHeatmapBoundingBoxGeneratorTypeForOriginatingRequestSpecifier:v11];
    if (v12)
    {
      id v18 = 0;
      std::string v13 = (void *)[a1 _newSaliencyHeatmapBoundingBoxGeneratorOptionsForOptions:v10];
      id v14 = +[VNDetector detectorClassAndConfigurationOptions:&v18 forDetectorType:v12 options:v13 error:a6];
      id v15 = v18;

      BOOL v16 = v14 != 0;
      if (v14)
      {
        *a3 = v14;
        if (a4) {
          *a4 = v15;
        }
      }
    }
    else
    {
      *a3 = 0;
      if (a4) {
        *a4 = 0;
      }
      BOOL v16 = 1;
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

+ (id)_newSaliencyHeatmapBoundingBoxGeneratorOptionsForOptions:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[v3 mutableCopy];
  objc_super v5 = [v3 objectForKeyedSubscript:@"VNDetectorOption_ComputeStageDeviceAssignments"];
  if ([v5 count])
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    id v7 = [v5 objectForKeyedSubscript:@"VNComputeStagePostProcessing"];
    id v8 = objc_msgSend(v6, "initWithObjectsAndKeys:", v7, @"VNComputeStageMain", 0);

    [v4 setObject:v8 forKeyedSubscript:@"VNDetectorOption_ComputeStageDeviceAssignments"];
  }

  return v4;
}

+ (id)_saliencyHeatmapBoundingBoxGeneratorTypeForOriginatingRequestSpecifier:(id)a3
{
  id v3 = a3;
  if ([v3 specifiesRequestClass:objc_opt_class()])
  {
    id v4 = VNAttentionBasedSaliencyHeatmapBoundingBoxGeneratorType;
LABEL_5:
    objc_super v5 = *v4;
    goto LABEL_7;
  }
  if ([v3 specifiesRequestClass:objc_opt_class()])
  {
    id v4 = VNObjectnessBasedSaliencyHeatmapBoundingBoxGeneratorType;
    goto LABEL_5;
  }
  objc_super v5 = 0;
LABEL_7:

  return v5;
}

+ (id)_inferenceDescriptorForOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v6 error:a4];
  id v8 = v7;
  if (!v7) {
    goto LABEL_7;
  }
  uint64_t v9 = [v7 requestClassAndReturnError:a4];
  if (!v9) {
    goto LABEL_7;
  }
  uint64_t v10 = objc_msgSend(a1, "modelForRequestClass:revision:", v9, objc_msgSend(v8, "requestRevision"));
  if (v10)
  {
    BOOL v11 = (void *)[a1 _newInferenceDescriptorForModel:v10 configuredWithOptions:v6 error:a4];
    goto LABEL_8;
  }
  if (a4)
  {
    +[VNError errorForUnsupportedRequestSpecifier:v8];
    BOOL v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_7:
    BOOL v11 = 0;
  }
LABEL_8:

  return v11;
}

+ (id)_newInferenceDescriptorForModel:(unint64_t)a3 configuredWithOptions:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = [v7 objectForKeyedSubscript:@"VNImageAnalyzerMultiDetectorInitializationOption_RequireObjDetNet"];
  uint64_t v9 = [v8 BOOLValue];

  uint64_t v10 = [v7 objectForKeyedSubscript:@"VNImageAnalyzerMultiDetectorInitializationOption_RequireSliderNet"];
  uint64_t v11 = [v10 BOOLValue];

  uint64_t v12 = [MEMORY[0x1E4FB3F18] descriptorForModel:a3 requireObjDetNet:v9 requireSliderNet:v11 error:a5];
  std::string v13 = v12;
  if (v12) {
    id v14 = v12;
  }

  return v13;
}

@end