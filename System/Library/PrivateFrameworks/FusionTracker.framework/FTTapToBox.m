@interface FTTapToBox
+ ($E706A39B19176788C9E1ABDE032DDDD0)postProcessNetworkOutput:(SEL)a3;
+ (BOOL)preprocessForTap:(CGPoint)a3 inSourceImageBuffer:(__CVBuffer *)a4 destinationImageBuffer:(__CVBuffer *)a5 tapBuffer:(__CVBuffer *)a6 scaler:(id)a7;
+ (BOOL)renderTap:(CGPoint)a3 inBuffer:(__CVBuffer *)a4;
+ (CGSize)networkInputImageSize;
+ (CGSize)networkInputTapImageSize;
+ (double)defaultConfidenceThreshold;
+ (id)networkDescriptor;
+ (id)networkPath;
+ (void)networkPath;
- ($E706A39B19176788C9E1ABDE032DDDD0)predictionForTap:(SEL)a3 inBuffer:(CGPoint)a4 scaler:(__CVBuffer *)a5;
- (CGRect)predictBoxForTap:(CGPoint)a3 inBuffer:(__CVBuffer *)a4 scaler:(id)a5;
- (FTTapToBox)init;
- (id).cxx_construct;
@end

@implementation FTTapToBox

- (FTTapToBox)init
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v13.receiver = self;
  v13.super_class = (Class)FTTapToBox;
  v2 = [(FTTapToBox *)&v13 init];

  if (v2)
  {
    +[FTTapToBox networkDescriptor];
    v3 = [(id)objc_claimAutoreleasedReturnValue() outputNames];
    id v4 = [v3 firstObject];
    v5 = (const char *)[v4 UTF8String];
    size_t v6 = strlen(v5);
    if (v6 >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    std::string::size_type v7 = v6;
    if (v6 >= 0x17)
    {
      uint64_t v9 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v6 | 7) != 0x17) {
        uint64_t v9 = v6 | 7;
      }
      uint64_t v10 = v9 + 1;
      p_dst = (std::string *)operator new(v9 + 1);
      __dst.__r_.__value_.__l.__size_ = v7;
      __dst.__r_.__value_.__r.__words[2] = v10 | 0x8000000000000000;
      __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
    }
    else
    {
      *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v6;
      p_dst = &__dst;
      if (!v6)
      {
LABEL_10:
        p_dst->__r_.__value_.__s.__data_[v7] = 0;

        +[FTTapToBox networkPath];
        [ objc_claimAutoreleasedReturnValue() UTF8String];
        if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
          std::string::__init_copy_ctor_external(&v28, __dst.__r_.__value_.__l.__data_, __dst.__r_.__value_.__l.__size_);
        }
        else {
          std::string v28 = __dst;
        }
        std::vector<std::string>::vector[abi:ne180100](&__str, (uint64_t)&v28, 1uLL);
        char v15 = 0;
        char v16 = 0;
        uint64_t v17 = -4294901744;
        int v18 = 0;
        char v19 = 0;
        LOBYTE(v20) = 0;
        char v21 = 0;
        char v22 = 0;
        long long v23 = 0u;
        long long v24 = 0u;
        LODWORD(v25) = 1065353216;
        char v27 = 0;
        LOBYTE(__p) = 0;
        std::make_unique[abi:ne180100]<ik::EspressoNet,char const*,ik::EspressoConfig>();
      }
    }
    memmove(p_dst, v5, v7);
    goto LABEL_10;
  }

  return 0;
}

- ($E706A39B19176788C9E1ABDE032DDDD0)predictionForTap:(SEL)a3 inBuffer:(CGPoint)a4 scaler:(__CVBuffer *)a5
{
  double y = a4.y;
  double x = a4.x;
  id v11 = a6;
  if (+[FTTapToBox preprocessForTap:inSourceImageBuffer:destinationImageBuffer:tapBuffer:scaler:](FTTapToBox, "preprocessForTap:inSourceImageBuffer:destinationImageBuffer:tapBuffer:scaler:", a5, *((void *)self->_inputImageTensor.storage_.__ptr_ + 1), *((void *)self->_inputTapTensor.storage_.__ptr_ + 1), v11, x, y))
  {
    value = self->_net.__ptr_.__value_;
    uint64_t v13 = *((void *)value + 1);
    uint64_t v15 = *(void *)(v13 + 56);
    uint64_t v16 = *(void *)(v13 + 64);
    v14 = (long long **)(v13 + 56);
    if (v15 == v16)
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Model has no pre-declared outputs.");
      exception->__vftable = (std::runtime_error_vtbl *)&unk_26C78E4F0;
    }
    ik::EspressoNet::Predict((uint64_t)value, (uint64_t)&self->_inputMap, v14, (uint64_t)v29);
    std::__hash_table<std::__hash_value_type<std::string,ik::EspressoTensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::EspressoTensor>>>::~__hash_table((uint64_t)v29);
    double v28 = 0.0;
    CGPoint v26 = (CGPoint)0;
    CGSize v27 = (CGSize)0;
    +[FTTapToBox postProcessNetworkOutput:(char *)self->_outputTensor.storage_.__ptr_ + 8];
    uint64_t v17 = (ft *)+[FTTapToBox defaultConfidenceThreshold];
    if (v18 <= 0.0)
    {
      CGSize v22 = v27;
      retstr->var0.origin = v26;
      retstr->var0.size = v22;
      retstr->var1 = v28;
      goto LABEL_10;
    }
    char v19 = ft::GetOsLog(v17);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v25 = 0;
      _os_log_impl(&dword_21762A000, v19, OS_LOG_TYPE_INFO, "TapToBox prediction below threshold.", v25, 2u);
    }

    uint64_t v20 = MEMORY[0x263F001A8];
  }
  else
  {
    uint64_t v20 = MEMORY[0x263F001A0];
  }
  CGSize v21 = *(CGSize *)(v20 + 16);
  retstr->var0.origin = *(CGPoint *)v20;
  retstr->var0.size = v21;
  retstr->var1 = 0.0;
LABEL_10:

  return result;
}

- (CGRect)predictBoxForTap:(CGPoint)a3 inBuffer:(__CVBuffer *)a4 scaler:(id)a5
{
  -[FTTapToBox predictionForTap:inBuffer:scaler:](self, "predictionForTap:inBuffer:scaler:", a4, a5, a3.x, a3.y);
  double v5 = v9;
  double v6 = v10;
  double v7 = v11;
  double v8 = v12;
  result.size.height = v8;
  result.size.width = v7;
  result.origin.double y = v6;
  result.origin.double x = v5;
  return result;
}

+ (id)networkPath
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = [a1 networkDescriptor];
  v3 = [v2 name];

  id v4 = FTResolveEspressoNetPath(v3);
  double v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    double v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v6 = [v7 pathForResource:v3 ofType:@"espresso.net"];

    if (!v6)
    {
      double v9 = ft::GetOsLog(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        +[FTTapToBox networkPath]([v3 UTF8String], v11, v9);
      }

      id v6 = 0;
    }
  }

  return v6;
}

+ (CGSize)networkInputImageSize
{
  double v2 = 360.0;
  double v3 = 360.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (CGSize)networkInputTapImageSize
{
  double v2 = 90.0;
  double v3 = 90.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (id)networkDescriptor
{
  v8[2] = *MEMORY[0x263EF8340];
  double v3 = objc_alloc_init(FTNetworkDescriptor);
  [a1 networkInputImageSize];
  id v4 = +[FTImageTensorDescriptor bgraImageWithName:size:](FTImageTensorDescriptor, "bgraImageWithName:size:", @"input_color_image");
  v8[0] = v4;
  [a1 networkInputTapImageSize];
  double v5 = +[FTImageTensorDescriptor descriptorWithName:size:pixelFormat:](FTImageTensorDescriptor, "descriptorWithName:size:pixelFormat:", @"input_tap_image", 1278226488);
  v8[1] = v5;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];
  [(FTNetworkDescriptor *)v3 setInputImages:v6];

  [(FTNetworkDescriptor *)v3 setOutputNames:&unk_26C790B58];
  [(FTNetworkDescriptor *)v3 setName:@"tap_to_box_v2_fp16"];

  return v3;
}

+ (BOOL)renderTap:(CGPoint)a3 inBuffer:(__CVBuffer *)a4
{
  double y = a3.y;
  double x = a3.x;
  if (CVPixelBufferLockBaseAddress(a4, 0))
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Failed to lock pixel buffer.");
    goto LABEL_26;
  }
  size_t Width = CVPixelBufferGetWidth(a4);
  size_t Height = CVPixelBufferGetHeight(a4);
  double v10 = (ft *)[a1 networkInputTapImageSize];
  if (Width != (unint64_t)v12 || Height != (unint64_t)v11)
  {
    v14 = ft::GetOsLog(v10);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[FTTapToBox renderTap:inBuffer:]();
    }
LABEL_21:

    BOOL v18 = 0;
    goto LABEL_22;
  }
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(a4);
  if (!BaseAddress)
  {
    v14 = ft::GetOsLog(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[FTTapToBox renderTap:inBuffer:]();
    }
    goto LABEL_21;
  }
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a4);
  bzero(BaseAddress, BytesPerRow * Height);
  if (x > 1.0 || x < 0.0 || y < 0.0 || y > 1.0)
  {
    v14 = ft::GetOsLog(v17);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[FTTapToBox renderTap:inBuffer:]();
    }
    goto LABEL_21;
  }
  BOOL v18 = 1;
  memset(&BaseAddress[BytesPerRow * vcvtad_u64_f64(y * (double)(Height - 1))], 1, BytesPerRow);
  if (Height)
  {
    char v19 = &BaseAddress[vcvtad_u64_f64(x * (double)(Width - 1))];
    do
    {
      *char v19 = 1;
      v19 += BytesPerRow;
      --Height;
    }
    while (Height);
  }
LABEL_22:
  if (CVPixelBufferUnlockBaseAddress(a4, 0))
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Failed to unlock pixel buffer.");
LABEL_26:
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  return v18;
}

+ (BOOL)preprocessForTap:(CGPoint)a3 inSourceImageBuffer:(__CVBuffer *)a4 destinationImageBuffer:(__CVBuffer *)a5 tapBuffer:(__CVBuffer *)a6 scaler:(id)a7
{
  double y = a3.y;
  double x = a3.x;
  id v13 = a7;
  v14 = (ft *)objc_msgSend(a1, "renderTap:inBuffer:", a6, x, y);
  if ((v14 & 1) == 0)
  {
    uint64_t v20 = ft::GetOsLog(v14);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      +[FTTapToBox preprocessForTap:inSourceImageBuffer:destinationImageBuffer:tapBuffer:scaler:]();
    }
    goto LABEL_8;
  }
  size_t Width = CVPixelBufferGetWidth(a4);
  size_t Height = CVPixelBufferGetHeight(a4);
  size_t v17 = CVPixelBufferGetWidth(a5);
  BOOL v18 = (ft *)objc_msgSend(v13, "scaleSourceBuffer:toDestinationBuffer:sourceROI:destinationROI:", a4, a5, 0.0, 0.0, (double)Width, (double)Height, 0.0, 0.0, (double)v17, (double)CVPixelBufferGetHeight(a5));
  if ((v18 & 1) == 0)
  {
    uint64_t v20 = ft::GetOsLog(v18);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      +[FTTapToBox preprocessForTap:inSourceImageBuffer:destinationImageBuffer:tapBuffer:scaler:]();
    }
LABEL_8:

    BOOL v19 = 0;
    goto LABEL_9;
  }
  BOOL v19 = 1;
LABEL_9:

  return v19;
}

+ ($E706A39B19176788C9E1ABDE032DDDD0)postProcessNetworkOutput:(SEL)a3
{
  float v5 = *(float *)a4->var0;
  float v6 = *((float *)a4->var0 + 4);
  double v7 = *((float *)a4->var0 + 3);
  double v8 = *((float *)a4->var0 + 1) + v7 * -0.5;
  double v9 = v6;
  double v10 = *((float *)a4->var0 + 2) + v6 * -0.5;
  retstr->var0.origin.double x = v8;
  retstr->var0.origin.double y = v10;
  retstr->var0.size.width = v7;
  retstr->var0.size.height = v6;
  double v11 = v5;
  if (v5 < 0.9 && v11 >= 0.7)
  {
    v13.origin.double x = v8;
    v13.origin.double y = v10;
    v13.size.width = v7;
    v13.size.height = v6;
    if (CGRectGetMinX(v13) < 0.1)
    {
      v14.origin.double x = v8;
      v14.origin.double y = v10;
      v14.size.width = v7;
      v14.size.height = v9;
      if (CGRectGetMaxX(v14) > 0.9)
      {
        v15.origin.double x = v8;
        v15.origin.double y = v10;
        v15.size.width = v7;
        v15.size.height = v9;
        if (CGRectGetMinY(v15) < 0.1)
        {
          v16.origin.double x = v8;
          v16.origin.double y = v10;
          v16.size.width = v7;
          v16.size.height = v9;
          if (CGRectGetMaxY(v16) > 0.9) {
            double v11 = 0.35;
          }
        }
      }
    }
  }
  retstr->var1 = v11;
  return result;
}

+ (double)defaultConfidenceThreshold
{
  return 0.7;
}

- (void).cxx_destruct
{
  self->_outputTensor._vptr$Tensor = (void **)&unk_26C78E630;
  cntrl = self->_outputTensor.storage_.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(void *)cntrl + 16))(cntrl, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    begin = self->_outputTensor.shape_.sizes_.__begin_;
    if (!begin) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  begin = self->_outputTensor.shape_.sizes_.__begin_;
  if (begin)
  {
LABEL_4:
    self->_outputTensor.shape_.sizes_.__end_ = begin;
    operator delete(begin);
  }
LABEL_5:
  std::__hash_table<std::__hash_value_type<std::string,ik::EspressoTensor>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ik::EspressoTensor>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ik::EspressoTensor>>>::~__hash_table((uint64_t)&self->_inputMap);
  self->_inputTapTensor._vptr$Tensor = (void **)&unk_26C78E630;
  float v5 = self->_inputTapTensor.storage_.__cntrl_;
  if (v5 && !atomic_fetch_add((atomic_ullong *volatile)v5 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)v5 + 16))(v5);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v5);
    float v6 = self->_inputTapTensor.shape_.sizes_.__begin_;
    if (!v6) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  float v6 = self->_inputTapTensor.shape_.sizes_.__begin_;
  if (v6)
  {
LABEL_8:
    self->_inputTapTensor.shape_.sizes_.__end_ = v6;
    operator delete(v6);
  }
LABEL_9:
  self->_inputImageTensor._vptr$Tensor = (void **)&unk_26C78E630;
  double v7 = self->_inputImageTensor.storage_.__cntrl_;
  if (!v7 || atomic_fetch_add((atomic_ullong *volatile)v7 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    double v8 = self->_inputImageTensor.shape_.sizes_.__begin_;
    if (!v8) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  (*(void (**)(__shared_weak_count *))(*(void *)v7 + 16))(v7);
  std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v7);
  double v8 = self->_inputImageTensor.shape_.sizes_.__begin_;
  if (v8)
  {
LABEL_12:
    self->_inputImageTensor.shape_.sizes_.__end_ = v8;
    operator delete(v8);
  }
LABEL_13:
  value = self->_net.__ptr_.__value_;
  self->_net.__ptr_.__value_ = 0;
  if (value)
  {
    double v10 = *(void (**)(void))(*(void *)value + 8);
    v10();
  }
}

- (id).cxx_construct
{
  *((_DWORD *)self + 6) = 1;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((void *)self + 1) = 0;
  *((void *)self + 2) = &unk_26C78E518;
  *((_DWORD *)self + 20) = 1;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *((void *)self + 15) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 9) = &unk_26C78E518;
  *((_OWORD *)self + 8) = 0u;
  *((_OWORD *)self + 9) = 0u;
  *((_DWORD *)self + 40) = 1065353216;
  *((_DWORD *)self + 44) = 1;
  *(_OWORD *)((char *)self + 184) = 0u;
  *(_OWORD *)((char *)self + 200) = 0u;
  *((void *)self + 27) = 0;
  *((void *)self + 21) = &unk_26C78E4D0;
  return self;
}

+ (void)networkPath
{
  *(_DWORD *)buf = 136315138;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_21762A000, log, OS_LOG_TYPE_ERROR, "Network not found: %s", buf, 0xCu);
}

+ (void)renderTap:inBuffer:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21762A000, v0, v1, "Tap buffer size mismatch.", v2, v3, v4, v5, v6);
}

+ (void)renderTap:inBuffer:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21762A000, v0, v1, "Failed to get tap buffer base address.", v2, v3, v4, v5, v6);
}

+ (void)renderTap:inBuffer:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21762A000, v0, v1, "Tap coordinates are out of bounds.", v2, v3, v4, v5, v6);
}

+ (void)preprocessForTap:inSourceImageBuffer:destinationImageBuffer:tapBuffer:scaler:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21762A000, v0, v1, "TapToBox preprocessing resample failed.", v2, v3, v4, v5, v6);
}

+ (void)preprocessForTap:inSourceImageBuffer:destinationImageBuffer:tapBuffer:scaler:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21762A000, v0, v1, "TapToBox tap rendering failed.", v2, v3, v4, v5, v6);
}

@end