@interface FTCinematicTapToTrack
+ (id)tracker;
- ($E706A39B19176788C9E1ABDE032DDDD0)_unsafeStepTrackingWithFrame:(SEL)a3;
- ($E706A39B19176788C9E1ABDE032DDDD0)predictRectForPoint:(SEL)a3 inColorBuffer:(CGPoint)a4;
- ($E706A39B19176788C9E1ABDE032DDDD0)stepTrackingWithFrame:(SEL)a3;
- (BOOL)_unsafeStartTrackingRect:(CGRect)a3 colorBuffer:(__CVBuffer *)a4;
- (BOOL)isTrackingActive;
- (BOOL)reset;
- (BOOL)startTrackingRect:(CGRect)a3 colorBuffer:(__CVBuffer *)a4;
- (EspressoConfig)_espressoConfigFromDescriptor:(EspressoConfig *__return_ptr)retstr engine:;
- (FTCinematicTapToTrack)initWithEspressoEngine:(int)a3 scalingBackend:(int)a4 commandQueue:(id)a5;
- (basic_string<char,)_resolveNetworkPath:(std::allocator<char>> *__return_ptr)retstr;
- (id).cxx_construct;
- (id)_maybeFetchTrackByCommittingState:(id)a3;
- (void)_preprocessBuffer:(__CVBuffer *)a3 andValidateState:(id)a4 isOp:(int64_t)a5;
- (void)_setupNetworksWithEngine:(const void *)a3;
- (void)_setupScalerWithBackend:(int)a3;
@end

@implementation FTCinematicTapToTrack

+ (id)tracker
{
  v2 = (void *)[objc_alloc((Class)a1) initWithEspressoEngine:10007 scalingBackend:0 commandQueue:0];

  return v2;
}

- (FTCinematicTapToTrack)initWithEspressoEngine:(int)a3 scalingBackend:(int)a4 commandQueue:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)FTCinematicTapToTrack;
  v10 = [(FTCinematicTapToTrack *)&v18 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_commandQueue, a5);
    v12 = objc_alloc_init(FTTapToBox);
    tapToBox = v11->_tapToBox;
    v11->_tapToBox = v12;

    [(FTCinematicTapToTrack *)v11 _setupScalerWithBackend:v6];
    int v16 = a3;
    char v17 = 1;
    [(FTCinematicTapToTrack *)v11 _setupNetworksWithEngine:&v16];
    v14 = v11;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)_setupScalerWithBackend:(int)a3
{
  if (a3 == 1)
  {
    v4 = [[FTVTScaler alloc] initWithCommandQueue:self->_commandQueue];
  }
  else
  {
    if (a3) {
      goto LABEL_6;
    }
    v4 = objc_alloc_init(FTMSRScaler);
  }
  scaler = self->_scaler;
  self->_scaler = (FTScaling *)v4;

LABEL_6:
  self->_preprocessor = [[FTTapToTrackPreprocessor alloc] initWithScaler:self->_scaler];

  MEMORY[0x270F9A758]();
}

- (void)_setupNetworksWithEngine:(const void *)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v5 = +[FTCinematicTracker highPriorityExemplarNetworkDescriptor];
  exemplarNetDesc = self->_exemplarNetDesc;
  self->_exemplarNetDesc = v5;

  [(FTNetworkDescriptor *)self->_exemplarNetDesc name];
  [(FTCinematicTapToTrack *)self _resolveNetworkPath:objc_claimAutoreleasedReturnValue()];
  [(FTCinematicTapToTrack *)self _espressoConfigFromDescriptor:self->_exemplarNetDesc engine:a3];
  operator new();
}

- (basic_string<char,)_resolveNetworkPath:(std::allocator<char>> *__return_ptr)retstr
{
  id v15 = v1;
  v3 = FTResolveEspressoNetPath(v15);
  if (!v3)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::string::basic_string[abi:ne180100]<0>(&v16, "Unable to locate model: ");
    v13 = std::string::append(&v16, (const std::string::value_type *)[v15 UTF8String]);
    long long v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
    v17.__r_.__value_.__r.__words[2] = v13->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v17.__r_.__value_.__l.__data_ = v14;
    v13->__r_.__value_.__l.__size_ = 0;
    v13->__r_.__value_.__r.__words[2] = 0;
    v13->__r_.__value_.__r.__words[0] = 0;
    std::runtime_error::runtime_error(exception, &v17);
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  id v4 = v3;
  v5 = (const char *)[v4 UTF8String];
  size_t v6 = strlen(v5);
  if (v6 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  unint64_t v7 = v6;
  if (v6 >= 0x17)
  {
    uint64_t v8 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17) {
      uint64_t v8 = v6 | 7;
    }
    uint64_t v9 = v8 + 1;
    v10 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)operator new(v8 + 1);
    retstr->var0.var0.var0.var1.var1 = v7;
    *((void *)&retstr->var0.var0.var0.var1 + 2) = v9 | 0x8000000000000000;
    retstr->var0.var0.var0.var1.var0 = (char *)v10;
    retstr = v10;
    goto LABEL_9;
  }
  *((unsigned char *)&retstr->var0.var0.var0.var1 + 23) = v6;
  if (v6) {
LABEL_9:
  }
    memmove(retstr, v5, v7);
  retstr->var0.var0.var0.var0.var0[v7] = 0;

  return result;
}

- (EspressoConfig)_espressoConfigFromDescriptor:(EspressoConfig *__return_ptr)retstr engine:
{
  v3 = v2;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = v1;
  retstr->var0.var1 = 0;
  retstr->var0.var2.var0 = 0;
  retstr->var0.var0 = 0;
  retstr->var1 = *v3;
  *(void *)&retstr->var2 = -4294901744;
  retstr->var4 = 0;
  retstr->var5.var0.var0 = 0;
  retstr->var5.var1 = 0;
  retstr->var6.var0.var0 = 0;
  retstr->var6.var1 = 0;
  retstr->var7.var0.var0 = 0u;
  *(_OWORD *)&retstr->var7.var0.var1.var0.var0 = 0u;
  retstr->var7.var0.var3.var0 = 1.0;
  *((unsigned char *)&retstr->var8.var0.var0.var0.var1 + 23) = 0;
  retstr->var8.var0.var0.var0.var0.var0[0] = 0;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v21 = v5;
  size_t v6 = [v5 outputNames];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v6);
        }
        v11 = (const char *)[*(id *)(*((void *)&v24 + 1) + 8 * i) UTF8String];
        size_t v12 = strlen(v11);
        if (v12 >= 0x7FFFFFFFFFFFFFF8) {
          std::string::__throw_length_error[abi:ne180100]();
        }
        size_t v13 = v12;
        if (v12 >= 0x17)
        {
          uint64_t v16 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v12 | 7) != 0x17) {
            uint64_t v16 = v12 | 7;
          }
          uint64_t v17 = v16 + 1;
          p_dst = (long long *)operator new(v16 + 1);
          *((void *)&__dst + 1) = v13;
          unint64_t v23 = v17 | 0x8000000000000000;
          *(void *)&long long __dst = p_dst;
        }
        else
        {
          HIBYTE(v23) = v12;
          p_dst = &__dst;
          if (!v12)
          {
            LOBYTE(__dst) = 0;
            var1 = retstr->var0.var1;
            if (var1 < retstr->var0.var2.var0) {
              goto LABEL_4;
            }
            goto LABEL_17;
          }
        }
        memmove(p_dst, v11, v13);
        *((unsigned char *)p_dst + v13) = 0;
        var1 = retstr->var0.var1;
        if (var1 < retstr->var0.var2.var0)
        {
LABEL_4:
          long long v10 = __dst;
          var1[2] = v23;
          *(_OWORD *)var1 = v10;
          retstr->var0.var1 = var1 + 3;
          continue;
        }
LABEL_17:
        objc_super v18 = std::vector<std::string>::__push_back_slow_path<std::string>(&retstr->var0.var0, (uint64_t)&__dst);
        int v19 = SHIBYTE(v23);
        retstr->var0.var1 = v18;
        if (v19 < 0) {
          operator delete((void *)__dst);
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v7);
  }

  return result;
}

- ($E706A39B19176788C9E1ABDE032DDDD0)predictRectForPoint:(SEL)a3 inColorBuffer:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  result = ($E706A39B19176788C9E1ABDE032DDDD0 *)[(FTTapToTrackPreprocessor *)self->_preprocessor preprocessBuffer:a5];
  if (result)
  {
    tapToBodouble x = self->_tapToBox;
    result = [(FTTapToTrackPreprocessor *)self->_preprocessor bgraPixelBuffer];
    if (tapToBox)
    {
      return -[FTTapToBox predictionForTap:inBuffer:scaler:](tapToBox, "predictionForTap:inBuffer:scaler:", result, self->_scaler, x, y);
    }
    else
    {
      retstr->var1 = 0.0;
      retstr->var0.origin = 0u;
      retstr->var0.size = 0u;
    }
  }
  else
  {
    CGSize v11 = *(CGSize *)(MEMORY[0x263F001A0] + 16);
    retstr->var0.origin = (CGPoint)*MEMORY[0x263F001A0];
    retstr->var0.size = v11;
    retstr->var1 = 0.0;
  }
  return result;
}

- (id)_maybeFetchTrackByCommittingState:(id)a3
{
  id v3 = a3;
  id v4 = [v3 commit];
  id v5 = v4;
  if (!v4)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Tracking result was nil.");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  size_t v6 = [v4 tracks];
  unint64_t v7 = [v6 count];

  if (v7 >= 2)
  {
    size_t v12 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::to_string(&v15, v7);
    size_t v13 = std::string::insert(&v15, 0, "Unexpected number of tracks detected. Expected at most one. Found: ");
    long long v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
    v16.__r_.__value_.__r.__words[2] = v13->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v16.__r_.__value_.__l.__data_ = v14;
    v13->__r_.__value_.__l.__size_ = 0;
    v13->__r_.__value_.__r.__words[2] = 0;
    v13->__r_.__value_.__r.__words[0] = 0;
    std::runtime_error::runtime_error(v12, &v16);
    __cxa_throw(v12, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  if (v7 == 1)
  {
    uint64_t v8 = [v5 tracks];
    uint64_t v9 = [v8 firstObject];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)_preprocessBuffer:(__CVBuffer *)a3 andValidateState:(id)a4 isOp:(int64_t)a5
{
  id v8 = a4;
  id v17 = v8;
  if (!v8)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Tracking state was nil.");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  uint64_t v9 = [v8 highPriorityTrackerState];
  long long v10 = v9;
  if (!v9)
  {
    size_t v12 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v12, "High priority tracking state was nil.");
    goto LABEL_12;
  }
  if ([v9 op] != a5)
  {
    size_t v13 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    long long v14 = [v10 opDescription];
    std::string::basic_string[abi:ne180100]<0>(&v18, v14);
    std::string v15 = std::string::insert(&v18, 0, "Invalid high priority tracking op encountered: ");
    long long v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
    v19.__r_.__value_.__r.__words[2] = v15->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v19.__r_.__value_.__l.__data_ = v16;
    v15->__r_.__value_.__l.__size_ = 0;
    v15->__r_.__value_.__r.__words[2] = 0;
    v15->__r_.__value_.__r.__words[0] = 0;
    std::runtime_error::runtime_error(v13, &v19);
    __cxa_throw(v13, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  if (![(FTTapToTrackPreprocessor *)self->_preprocessor preprocessBuffer:a3])
  {
    size_t v12 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v12, "Color buffer preprocessing failed");
LABEL_12:
    __cxa_throw(v12, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
}

- (BOOL)_unsafeStartTrackingRect:(CGRect)a3 colorBuffer:(__CVBuffer *)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v49 = *MEMORY[0x263EF8340];
  long long v10 = objc_alloc_init(FTCinematicConfig);
  CGSize v11 = [[FTCinematicTracker alloc] initWithConfig:v10];
  tracker = self->_tracker;
  self->_tracker = v11;

  size_t v13 = objc_alloc_init(FTCinematicInput);
  CMTimeMake(&v42, 1, 1);
  [(FTCinematicInput *)v13 setSourceFrameTimestamp:&v42];
  long long v14 = objc_alloc_init(FTCinematicTapRequest);
  v50.origin.double x = x;
  v50.origin.double y = y;
  v50.size.double width = width;
  v50.size.double height = height;
  double MidX = CGRectGetMidX(v50);
  v51.origin.double x = x;
  v51.origin.double y = y;
  v51.size.double width = width;
  v51.size.double height = height;
  -[FTCinematicTapRequest setTapPoint:](v14, "setTapPoint:", MidX, CGRectGetMidY(v51));
  [(FTCinematicInput *)v13 setTapRequest:v14];
  long long v16 = [(FTCinematicTracker *)self->_tracker computeTrackingStateForInput:v13];
  id v17 = [v16 highPriorityTrackerState];
  [(FTCinematicTapToTrack *)self _preprocessBuffer:a4 andValidateState:v16 isOp:3];
  std::string v18 = [(FTTapToTrackPreprocessor *)self->_preprocessor bgraPixelBuffer];
  uint64_t v19 = *((void *)self->_exemplarCrop.storage_.__ptr_ + 1);
  [(FTTapToTrackPreprocessor *)self->_preprocessor meanPixel];
  if ((objc_msgSend(v17, "preProcessExemplarInputFromSourceBuffer:toDestinationBuffer:forTargetRect:meanPixel:scaler:", v18, v19, vmovn_s16(v20).u32[0], self->_scaler, x, y, width, height) & 1) == 0)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Exemplar preprocessing failed.");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  value = self->_exemplarNet.__ptr_.__value_;
  v22 = [(FTNetworkDescriptor *)self->_exemplarNetDesc onlyImageInput];
  unint64_t v23 = [v22 name];
  AsString(__p, v23);
  std::pair<std::string const,ik::Tensor>::pair[abi:ne180100]<std::string,ik::PixelBufferTensor &,0>((uint64_t)&v43, (long long *)__p, (uint64_t)&self->_exemplarCrop);
  memset(v39, 0, sizeof(v39));
  int v40 = 1065353216;
  std::__hash_table<std::__hash_value_type<std::string,ik::Tensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::Tensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::Tensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::Tensor>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,ik::Tensor> const&>((uint64_t)v39, (uint64_t)&v43, &v43);
  uint64_t v24 = *((void *)value + 1);
  uint64_t v26 = *(void *)(v24 + 56);
  uint64_t v27 = *(void *)(v24 + 64);
  long long v25 = (long long **)(v24 + 56);
  if (v26 == v27)
  {
    v35 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v35, "Model has no pre-declared outputs.");
    v35->__vftable = (std::runtime_error_vtbl *)&unk_26C78E4F0;
  }
  ik::EspressoNet::Predict((uint64_t)value, (uint64_t)v39, v25, (uint64_t)v41);
  std::__hash_table<std::__hash_value_type<std::string,ik::EspressoTensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::EspressoTensor>>>::~__hash_table((uint64_t)v39);
  v45 = &unk_26C78E630;
  v28 = v48;
  if (v48 && !atomic_fetch_add(&v48->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
    std::__shared_weak_count::__release_weak(v28);
  }
  if (v46)
  {
    v47 = v46;
    operator delete(v46);
  }
  if (v44 < 0)
  {
    operator delete((void *)v43);
    if ((v38 & 0x80000000) == 0) {
      goto LABEL_10;
    }
  }
  else if ((v38 & 0x80000000) == 0)
  {
    goto LABEL_10;
  }
  operator delete(__p[0]);
LABEL_10:

  uint64_t v29 = AsEspressoBufferDictionary((uint64_t)v41);
  char v30 = objc_msgSend(v17, "postProcessExemplarOutputs:forTargetRect:", v29, x, y, width, height);

  if ((v30 & 1) == 0)
  {
    v36 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v36, "Tracker preprocessing failed.");
    __cxa_throw(v36, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  v31 = [(FTCinematicTapToTrack *)self _maybeFetchTrackByCommittingState:v16];
  BOOL v32 = v31 != 0;

  std::__hash_table<std::__hash_value_type<std::string,ik::EspressoTensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::EspressoTensor>>>::~__hash_table((uint64_t)v41);
  return v32;
}

- ($E706A39B19176788C9E1ABDE032DDDD0)_unsafeStepTrackingWithFrame:(SEL)a3
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  if (!self->_tracker)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "No active tracking session present.");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  v52 = objc_alloc_init(FTCinematicInput);
  CMTimeMake(&v74, 1, 1);
  [(FTCinematicInput *)v52 setSourceFrameTimestamp:&v74];
  v54 = [(FTCinematicTracker *)self->_tracker computeTrackingStateForInput:v52];
  v55 = [v54 highPriorityTrackerState];
  [(FTCinematicTapToTrack *)self _preprocessBuffer:a4 andValidateState:v54 isOp:2];
  size_t v6 = [(FTTapToTrackPreprocessor *)self->_preprocessor bgraPixelBuffer];
  uint64_t v7 = *((void *)self->_instanceCrop.storage_.__ptr_ + 1);
  [(FTTapToTrackPreprocessor *)self->_preprocessor meanPixel];
  if (([v55 preProcessInstanceInputFromSourceBuffer:v6 toDestinationBuffer:v7 meanPixel:vmovn_s16(v8).u32[0] scaler:self->_scaler] & 1) == 0)
  {
    uint64_t v49 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v49, "Instance preprocessing failed.");
    __cxa_throw(v49, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  memset(v72, 0, sizeof(v72));
  int v73 = 1065353216;
  uint64_t v9 = [(FTNetworkDescriptor *)self->_instanceNetDesc onlyImageInput];
  long long v10 = [v9 name];
  AsString(&__p, v10);
  v60[0] = &__p;
  CGSize v11 = std::__hash_table<std::__hash_value_type<std::string,ik::Tensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::Tensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::Tensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::Tensor>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)v72, (uint64_t)&__p, (uint64_t)&std::piecewise_construct, (long long **)v60);
  size_t v12 = v11;
  *((_DWORD *)v11 + 12) = self->_instanceCrop.type_;
  if (v11 + 40 != (unsigned __int8 *)&self->_instanceCrop) {
    std::vector<unsigned long>::__assign_with_size[abi:ne180100]<unsigned long *,unsigned long *>((void *)v11 + 7, (char *)self->_instanceCrop.shape_.sizes_.__begin_, (char *)self->_instanceCrop.shape_.sizes_.__end_, self->_instanceCrop.shape_.sizes_.__end_ - self->_instanceCrop.shape_.sizes_.__begin_);
  }
  ptr = self->_instanceCrop.storage_.__ptr_;
  cntrl = self->_instanceCrop.storage_.__cntrl_;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  std::string v15 = (std::__shared_weak_count *)*((void *)v12 + 11);
  *((void *)v12 + 10) = ptr;
  *((void *)v12 + 11) = cntrl;
  if (v15 && !atomic_fetch_add(&v15->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
    std::__shared_weak_count::__release_weak(v15);
    v53 = retstr;
    if ((SHIBYTE(v64) & 0x80000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  v53 = retstr;
  if (SHIBYTE(v64) < 0) {
LABEL_10:
  }
    operator delete(__p);
LABEL_11:

  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id obj = [(FTNetworkDescriptor *)self->_instanceNetDesc inputReferences];
  uint64_t v16 = [obj countByEnumeratingWithState:&v68 objects:v76 count:16];
  if (!v16) {
    goto LABEL_37;
  }
  uint64_t v17 = *(void *)v69;
  do
  {
    uint64_t v18 = 0;
    do
    {
      if (*(void *)v69 != v17) {
        objc_enumerationMutation(obj);
      }
      uint64_t v19 = *(void **)(*((void *)&v68 + 1) + 8 * v18);
      value = self->_exemplarNet.__ptr_.__value_;
      id v21 = objc_msgSend(v19, "sourceOutputName", v52);
      AsString(v60, v21);
      ik::core::GetOutput((uint64_t)&__p, *((void *)value + 1), (uint64_t)v60);
      v22 = [v19 destinationInputName];
      AsString(v58, v22);
      v75 = v58;
      unint64_t v23 = std::__hash_table<std::__hash_value_type<std::string,ik::Tensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::Tensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::Tensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::Tensor>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)v72, (uint64_t)v58, (uint64_t)&std::piecewise_construct, (long long **)&v75);
      uint64_t v24 = v23;
      *((_DWORD *)v23 + 12) = v63;
      if (v23 + 40 != (unsigned __int8 *)&__p) {
        std::vector<unsigned long>::__assign_with_size[abi:ne180100]<unsigned long *,unsigned long *>((void *)v23 + 7, v64, v65, (v65 - v64) >> 3);
      }
      uint64_t v26 = v66;
      long long v25 = v67;
      if (v67) {
        atomic_fetch_add_explicit(&v67->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      uint64_t v27 = (std::__shared_weak_count *)*((void *)v24 + 11);
      *((void *)v24 + 10) = v26;
      *((void *)v24 + 11) = v25;
      if (v27 && !atomic_fetch_add(&v27->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
        std::__shared_weak_count::__release_weak(v27);
        if ((v59 & 0x80000000) == 0) {
          goto LABEL_24;
        }
LABEL_23:
        operator delete(v58[0]);
        goto LABEL_24;
      }
      if (v59 < 0) {
        goto LABEL_23;
      }
LABEL_24:

      __p = &unk_26C78E630;
      v28 = v67;
      if (!v67 || atomic_fetch_add(&v67->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        uint64_t v29 = v64;
        if (!v64) {
          goto LABEL_28;
        }
LABEL_27:
        v65 = v29;
        operator delete(v29);
        goto LABEL_28;
      }
      ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
      std::__shared_weak_count::__release_weak(v28);
      uint64_t v29 = v64;
      if (v64) {
        goto LABEL_27;
      }
LABEL_28:
      if (v61 < 0) {
        operator delete(v60[0]);
      }

      ++v18;
    }
    while (v16 != v18);
    uint64_t v30 = [obj countByEnumeratingWithState:&v68 objects:v76 count:16];
    uint64_t v16 = v30;
  }
  while (v30);
LABEL_37:

  v31 = self->_instanceNet.__ptr_.__value_;
  uint64_t v32 = *((void *)v31 + 1);
  uint64_t v34 = *(void *)(v32 + 56);
  uint64_t v35 = *(void *)(v32 + 64);
  v33 = (long long **)(v32 + 56);
  if (v34 == v35)
  {
    CGRect v50 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v50, "Model has no pre-declared outputs.");
    v50->__vftable = (std::runtime_error_vtbl *)&unk_26C78E4F0;
  }
  ik::EspressoNet::Predict((uint64_t)v31, (uint64_t)v72, v33, (uint64_t)&__p);
  v36 = AsEspressoBufferDictionary((uint64_t)&__p);
  char v37 = [v55 postProcessInstanceOutputs:v36];

  if ((v37 & 1) == 0)
  {
    CGRect v51 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v51, "Instance post-processing failed.");
    __cxa_throw(v51, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  char v38 = [(FTCinematicTapToTrack *)self _maybeFetchTrackByCommittingState:v54];
  v39 = v38;
  if (v38)
  {
    [v38 box];
    v53->var0.origin.double x = v40;
    v53->var0.origin.double y = v41;
    v53->var0.size.double width = v42;
    v53->var0.size.double height = v43;
    [v39 boxConfidence];
    v53->var1 = v44;
  }
  else
  {
    tracker = self->_tracker;
    self->_tracker = 0;

    CGSize v46 = *(CGSize *)(MEMORY[0x263F001A0] + 16);
    v53->var0.origin = (CGPoint)*MEMORY[0x263F001A0];
    v53->var0.size = v46;
    v53->var1 = 0.0;
  }

  std::__hash_table<std::__hash_value_type<std::string,ik::EspressoTensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::EspressoTensor>>>::~__hash_table((uint64_t)&__p);
  std::__hash_table<std::__hash_value_type<std::string,ik::EspressoTensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::EspressoTensor>>>::~__hash_table((uint64_t)v72);

  return result;
}

- (BOOL)startTrackingRect:(CGRect)a3 colorBuffer:(__CVBuffer *)a4
{
  return -[FTCinematicTapToTrack _unsafeStartTrackingRect:colorBuffer:](self, "_unsafeStartTrackingRect:colorBuffer:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- ($E706A39B19176788C9E1ABDE032DDDD0)stepTrackingWithFrame:(SEL)a3
{
  return [(FTCinematicTapToTrack *)self _unsafeStepTrackingWithFrame:a4];
}

- (BOOL)reset
{
  tracker = self->_tracker;
  self->_tracker = 0;

  return 1;
}

- (BOOL)isTrackingActive
{
  return self->_tracker != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_tapToBox, 0);
  self->_instanceCrop._vptr$Tensor = (void **)&unk_26C78E630;
  cntrl = self->_instanceCrop.storage_.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)cntrl + 16))(cntrl);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    begin = self->_instanceCrop.shape_.sizes_.__begin_;
    if (!begin) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  begin = self->_instanceCrop.shape_.sizes_.__begin_;
  if (begin)
  {
LABEL_4:
    self->_instanceCrop.shape_.sizes_.__end_ = begin;
    operator delete(begin);
  }
LABEL_5:
  self->_exemplarCrop._vptr$Tensor = (void **)&unk_26C78E630;
  id v5 = self->_exemplarCrop.storage_.__cntrl_;
  if (!v5 || atomic_fetch_add((atomic_ullong *volatile)v5 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    size_t v6 = self->_exemplarCrop.shape_.sizes_.__begin_;
    if (!v6) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  (*(void (**)(__shared_weak_count *))(*(void *)v5 + 16))(v5);
  std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v5);
  size_t v6 = self->_exemplarCrop.shape_.sizes_.__begin_;
  if (v6)
  {
LABEL_8:
    self->_exemplarCrop.shape_.sizes_.__end_ = v6;
    operator delete(v6);
  }
LABEL_9:
  value = self->_instanceNet.__ptr_.__value_;
  self->_instanceNet.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(EspressoNet *))(*(void *)value + 8))(value);
  }
  int16x8_t v8 = self->_exemplarNet.__ptr_.__value_;
  self->_exemplarNet.__ptr_.__value_ = 0;
  if (v8) {
    (*(void (**)(EspressoNet *))(*(void *)v8 + 8))(v8);
  }
  objc_storeStrong((id *)&self->_instanceNetDesc, 0);
  objc_storeStrong((id *)&self->_exemplarNetDesc, 0);
  objc_storeStrong((id *)&self->_preprocessor, 0);
  objc_storeStrong((id *)&self->_scaler, 0);

  objc_storeStrong((id *)&self->_commandQueue, 0);
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0;
  *((void *)self + 7) = 0;
  *((_DWORD *)self + 18) = 1;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((void *)self + 8) = &unk_26C78E518;
  *((_DWORD *)self + 32) = 1;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  *((void *)self + 21) = 0;
  *((void *)self + 14) = 0;
  *((void *)self + 15) = &unk_26C78E518;
  return self;
}

- (void)initWithEspressoEngine:scalingBackend:commandQueue:.cold.1()
{
  OUTLINED_FUNCTION_3();
  (*(void (**)(void))(v0 + 16))();
  OUTLINED_FUNCTION_1(&dword_21762A000, v1, v2, "FTCinematicTapToTrack error: %s", v3, v4, v5, v6, 2u);
}

@end