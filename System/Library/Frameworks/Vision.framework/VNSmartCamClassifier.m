@interface VNSmartCamClassifier
+ (Class)espressoModelImageprintClass;
+ (NSString)returnAllResultsOptionKey;
+ (id)classifierResourceTypesToNamesForOriginatingRequestSpecifier:(id)a3;
+ (id)createObservationWithDescriptors:(id)a3 forOriginatingRequestSpecifier:(id)a4;
+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4;
+ (shared_ptr<vision::mod::ImageClassifierAbstract>)createClassifierWithDescriptor:(shared_ptr<vision:(const char *)a4 :(int)a5 mod:(int)a6 :(const char *)a7 ImageDescriptorProcessorAbstract>)a3 classifierAbsolutePath:(Options *)a8 computePlatform:computePath:labelsFilename:options:;
+ (shared_ptr<vision::mod::ImageDescriptorProcessorAbstract>)createDescriprorProcessorWithModelPath:(const char *)a3 nBatch:(int)a4 computePlatform:(int)a5 computePath:(int)a6 options:(Options *)a7;
+ (void)initDumpDebugIntermediates:(id *)a3 debugInfo:(id *)a4;
- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4;
@end

@implementation VNSmartCamClassifier

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  v5.receiver = self;
  v5.super_class = (Class)VNSmartCamClassifier;
  return [(VNEspressoModelClassifier *)&v5 completeInitializationForSession:a3 error:a4];
}

+ (void)initDumpDebugIntermediates:(id *)a3 debugInfo:(id *)a4
{
  id v12 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v6 = [v12 BOOLForKey:@"VN_DEBUG_DUMP_SMARTCAM_INTERMEDIATES"];
  if (a3) {
    char v7 = v6;
  }
  else {
    char v7 = 0;
  }

  if (a4 && (v7 & 1) != 0)
  {
    v8 = NSTemporaryDirectory();
    id v13 = [v8 stringByAppendingString:@"VN_smartcam_classifier_debug_intermediates/"];

    v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    v10 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v13];
    int v11 = [v9 createDirectoryAtURL:v10 withIntermediateDirectories:1 attributes:0 error:0];

    if (v11) {
      *a3 = v13;
    }
    *a4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
}

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  char v7 = @"VNComputeStageMain";
  v4 = +[VNComputeDeviceUtilities allGPUComputeDevices];
  v8[0] = v4;
  objc_super v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

+ (id)createObservationWithDescriptors:(id)a3 forOriginatingRequestSpecifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  char v7 = [[VNSmartCamObservation alloc] initWithOriginatingRequestSpecifier:v6 smartCamprints:v5];

  return v7;
}

+ (NSString)returnAllResultsOptionKey
{
  return (NSString *)@"VNSmartCamClassifierProcessOption_ReturnAllResults";
}

+ (Class)espressoModelImageprintClass
{
  return (Class)objc_opt_class();
}

+ (id)classifierResourceTypesToNamesForOriginatingRequestSpecifier:(id)a3
{
  id v3 = a3;
  if (+[VNSmartCamClassifier classifierResourceTypesToNamesForOriginatingRequestSpecifier:]::onceToken != -1) {
    dispatch_once(&+[VNSmartCamClassifier classifierResourceTypesToNamesForOriginatingRequestSpecifier:]::onceToken, &__block_literal_global_8292);
  }
  v4 = [(id)+[VNSmartCamClassifier classifierResourceTypesToNamesForOriginatingRequestSpecifier:]::classifierResourceTypesToNames objectForKeyedSubscript:v3];

  return v4;
}

void __85__VNSmartCamClassifier_classifierResourceTypesToNamesForOriginatingRequestSpecifier___block_invoke()
{
  v7[4] = *MEMORY[0x1E4F143B8];
  v6[0] = @"espresso-descriptor";
  v6[1] = @"espresso-classifier";
  v7[0] = @"smartcam-descriptor";
  v7[1] = @"smartcam-classifier";
  v6[2] = @"espresso-classifier-labels";
  v6[3] = @"espresso-classifier-relationships";
  v7[2] = @"smartcam-classifier-labels";
  v7[3] = @"smartcam-classifier-relationships";
  v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:4];
  v1 = +[VNRequestSpecifier specifierForRequestClass:objc_opt_class() revision:1 error:0];
  v4 = v1;
  id v5 = v0;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  id v3 = (void *)+[VNSmartCamClassifier classifierResourceTypesToNamesForOriginatingRequestSpecifier:]::classifierResourceTypesToNames;
  +[VNSmartCamClassifier classifierResourceTypesToNamesForOriginatingRequestSpecifier:]::classifierResourceTypesToNames = v2;
}

+ (shared_ptr<vision::mod::ImageDescriptorProcessorAbstract>)createDescriprorProcessorWithModelPath:(const char *)a3 nBatch:(int)a4 computePlatform:(int)a5 computePath:(int)a6 options:(Options *)a7
{
  id v13 = v7;
  long long v25 = *(_OWORD *)&a7->var0;
  id v14 = a7->var2;
  id v23 = a7->var3;
  id v24 = v14;
  v15 = (char *)operator new(0x58uLL);
  *((void *)v15 + 1) = 0;
  *((void *)v15 + 2) = 0;
  *(void *)v15 = &unk_1EF753AF0;
  long long v26 = v25;
  id v16 = v14;
  id v17 = v23;
  id v18 = v16;
  id v27 = v18;
  id v19 = v17;
  id v28 = v19;
  vision::mod::ImageDescriptorProcessorEspresso::ImageDescriptorProcessorEspresso((uint64_t)(v15 + 24), (unsigned __int8 *)&v26, a3, "smartcam", a5, a6);
  *((void *)v15 + 3) = &unk_1EF752D90;

  if (a5)
  {
    if (a4 <= 0)
    {
      syslog(5, "ERROR: ImageDescriptorProcessorEspresso::setNetworkBatchNumber nBatch>0", v23, v24);
      exception = __cxa_allocate_exception(8uLL);
      void *exception = 3708;
      __cxa_throw(exception, MEMORY[0x1E4FBA3E0], 0);
    }
    espresso_vision_first_layer_first_source_blob_shape();
    espresso_vision_shape_network();
    *(_DWORD *)(*((void *)v15 + 9) + 8) = a4;
  }
  *((_DWORD *)v15 + 9) = 1065353216;
  *(void *)(v15 + 52) = 0;
  *(void *)(v15 + 44) = 0;
  *(_DWORD *)(v15 + 59) = 0;
  *id v13 = v15 + 24;
  v13[1] = v15;

  result.__cntrl_ = v21;
  result.__ptr_ = v20;
  return result;
}

+ (shared_ptr<vision::mod::ImageClassifierAbstract>)createClassifierWithDescriptor:(shared_ptr<vision:(const char *)a4 :(int)a5 mod:(int)a6 :(const char *)a7 ImageDescriptorProcessorAbstract>)a3 classifierAbsolutePath:(Options *)a8 computePlatform:computePath:labelsFilename:options:
{
  v10 = *(const char **)&a6;
  int v12 = (int)a4;
  v38 = v8;
  cntrl = a3.__cntrl_;
  var0 = a3.__ptr_->var0;
  id v13 = (std::__shared_weak_count *)a3.__ptr_[1].var0;
  if (v13) {
    atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  int v40 = *(unsigned __int8 *)a7;
  uint64_t v41 = *((void *)a7 + 1);
  id v15 = *((id *)a7 + 2);
  id v37 = *((id *)a7 + 3);
  id v16 = (char *)operator new(0xA0uLL);
  *(_OWORD *)(v16 + 8) = 0u;
  *(void *)id v16 = &unk_1EF7537A8;
  id v44 = v15;
  id v43 = v37;
  *((_OWORD *)v16 + 9) = 0u;
  id v17 = (void ****)(v16 + 144);
  *((_OWORD *)v16 + 2) = 0u;
  *((_OWORD *)v16 + 3) = 0u;
  *((_OWORD *)v16 + 4) = 0u;
  *((void *)v16 + 10) = 0;
  *((_DWORD *)v16 + 22) = 1065353216;
  *((void *)v16 + 12) = 0;
  *(_OWORD *)(v16 + 104) = 0u;
  *((_DWORD *)v16 + 30) = 1;
  *(int32x2_t *)(v16 + 124) = vdup_n_s32(0x3DCCCCCDu);
  *(void *)(v16 + 132) = 5;
  *((void *)v16 + 3) = &unk_1EF752700;
  vision::mod::ImageClassifierAbstract::initLabels((vision::mod::ImageClassifierAbstract *)(v16 + 24), v10);
  id v18 = (char *)operator new(0x48uLL);
  *((void *)v18 + 1) = 0;
  *((void *)v18 + 2) = 0;
  *(_OWORD *)(v18 + 24) = 0u;
  id v19 = (void ***)(v18 + 24);
  *(void *)id v18 = &unk_1EF753770;
  *(_OWORD *)(v18 + 40) = 0u;
  *(_OWORD *)(v18 + 56) = 0u;
  v20 = (std::__shared_weak_count *)*((void *)v16 + 19);
  *((void *)v16 + 18) = v18 + 24;
  *((void *)v16 + 19) = v18;
  if (v20)
  {
    std::__shared_weak_count::__release_shared[abi:nn180100](v20);
    id v19 = *v17;
  }
  if (v13) {
    atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v21 = (std::__shared_weak_count *)v19[1];
  *id v19 = var0;
  v19[1] = (void **)&v13->__vftable;
  if (v21) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v21);
  }
  v22 = *v17;
  id v42 = v44;
  id v23 = v43;
  if (v12 == 1) {
    uint64_t v24 = 20000;
  }
  else {
    uint64_t v24 = 0;
  }
  if (a5 == 3) {
    uint64_t v25 = 2;
  }
  else {
    uint64_t v25 = a5 == 2;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "smartcam_onlyfc");
  if ((v46 & 0x80u) == 0) {
    unint64_t v26 = v46;
  }
  else {
    unint64_t v26 = (unint64_t)__p[1];
  }
  if ((char)v46 < 0) {
    operator delete(__p[0]);
  }
  id v27 = v42;
  id v28 = v27;
  if (!v27) {
    id v28 = (void *)[objc_alloc(MEMORY[0x1E4F611F0]) initWithPlatform:v24];
  }
  if ([v28 platform] != v24)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1A6255EF0](exception, "Inconsistent platform");
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  LODWORD(v29) = 4.0;
  objc_msgSend(v28, "set_priority:low_priority_max_ms_per_command_buffer:gpu_priority:", v40 != 0, v41, v29);
  if (v26) {
    uint64_t v30 = [objc_alloc(MEMORY[0x1E4F61200]) initWithJSFile:cntrl binSerializerId:"smartcam_onlyfc" context:v28 computePath:v25];
  }
  else {
    uint64_t v30 = [objc_alloc(MEMORY[0x1E4F61200]) initWithJSFile:cntrl context:v28 computePath:v25];
  }
  v31 = v22[2];
  v22[2] = (void **)v30;

  if (!v22[2])
  {
    v36 = __cxa_allocate_exception(8uLL);
    void *v36 = 3964;
    __cxa_throw(v36, MEMORY[0x1E4FBA3E0], 0);
  }

  *(void *)&long long v32 = v16 + 24;
  *((void *)&v32 + 1) = v16;
  _OWORD *v38 = v32;

  if (v13) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v13);
  }

  result.__cntrl_ = v34;
  result.__ptr_ = v33;
  return result;
}

@end