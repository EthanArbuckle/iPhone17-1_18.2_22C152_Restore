@interface EspressoImage2Image
+ (BOOL)loadStylesConfigAtDefaultsKey:(id)a3;
+ (BOOL)loadStylesConfigAtPath:(id)a3;
+ (id)getStylesKeys;
+ (int)featureVersion;
+ (void)gpuSync:(id)a3 tex:(id)a4;
+ (void)setDefaultOption:(id)a3 toValue:(id)a4;
+ (void)tuneNetworks:(id)a3;
+ (void)tuneNetworksWGWindowSize:(id)a3;
- ($C4732ECC957FA13B9B3DF4A51A95735B)getEspressoNetwork;
- (EspressoImage2Image)init;
- (EspressoImage2Image)initWithQueue:(id)a3;
- (float)benchmark;
- (id).cxx_construct;
- (id)getInternalDataForKey:(id)a3;
- (id)newOutputTexture;
- (id)setupWithQueue:(id)a3;
- (id)styleName;
- (int)_reshapeToResolutionPreset:(int64_t)a3;
- (int)_reshapeToWidth:(int)a3 andHeight:(int)a4;
- (int)encodeToCommandBuffer:(id)a3 sourceTexture:(id)a4 destinationTexture:(id)a5 cropRect:(id *)a6;
- (int)encodeToCommandBuffer:(id)a3 sourceTexture:(id)a4 destinationTexture:(id)a5 cropRect:(id *)a6 destinationRect:(id *)a7;
- (int)flip_y;
- (int)height;
- (int)load:(id)a3;
- (int)load:(id)a3 resolutionPreset:(int64_t)a4;
- (int)reload;
- (int)reshapeToResolutionPreset:(int64_t)a3;
- (int)reshapeToResolutionPreset:(int64_t)a3 aspectRatio:(float)a4;
- (int)reshapeToWidth:(int)a3 andHeight:(int)a4;
- (int)rotation_degrees;
- (int)submitToQueueWithSourceTexture:(id)a3 destinationTexture:(id)a4;
- (int)submitToQueueWithSourceTexture:(id)a3 destinationTexture:(id)a4 cropRect:(id *)a5;
- (int)wasReshaped;
- (int)width;
- (pair<int,)resolutionForPreset:(int64_t)a3;
- (void)_resetTemporalState;
- (void)_tune;
- (void)addNoiseLayer;
- (void)aggregateWisdom:(void *)a3;
- (void)dealloc;
- (void)postProcess:(id)a3 cameraSourceTexture:(id)a4 inputTexture:(id)a5 destinationTexture:(id)a6;
- (void)resetTemporalState;
- (void)setFlip_y:(int)a3;
- (void)setRotation_degrees:(int)a3;
- (void)simpleLinearResize:(id)a3 sourceTexture:(id)a4 destinationTexture:(id)a5;
- (void)tune;
- (void)tweak:(id)a3 value:(float)a4;
@end

@implementation EspressoImage2Image

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0uLL;
  *((void *)self + 7) = 0;
  *((void *)self + 27) = 0;
  *((void *)self + 26) = 0;
  *((void *)self + 25) = (char *)self + 208;
  *((_OWORD *)self + 14) = 0u;
  *((_OWORD *)self + 15) = 0u;
  *((_OWORD *)self + 16) = 0u;
  *((void *)self + 34) = 0x3E99999A00000000;
  *((void *)self + 35) = 0;
  *((_OWORD *)self + 18) = xmmword_192DCA2A0;
  *((_DWORD *)self + 76) = 0;
  *(_OWORD *)((char *)self + 308) = xmmword_192DCA2B0;
  *(_OWORD *)((char *)self + 324) = xmmword_192DCA2C0;
  *(_OWORD *)((char *)self + 340) = xmmword_192DCA2D0;
  *((_DWORD *)self + 89) = 960;
  *((void *)self + 45) = 0x3F8000003DA3D70ALL;
  *((_DWORD *)self + 92) = 0;
  *(_OWORD *)((char *)self + 372) = xmmword_192DCA2E0;
  *(void *)((char *)self + 388) = 0x3F8000003F79999ALL;
  *((unsigned char *)self + 396) = 0;
  *((void *)self + 56) = 0;
  *((void *)self + 57) = 0;
  *((_OWORD *)self + 25) = 0u;
  *((_OWORD *)self + 26) = 0u;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->precomputed_noise.__ptr_, 0);
  currentResolutionPreset = (std::__shared_weak_count *)self->currentResolutionPreset;
  if (currentResolutionPreset) {
    nitro::nitro_function::nitro_function(currentResolutionPreset);
  }
  objc_storeStrong((id *)&self->noise_load_constant_kernel.__ptr_, 0);
  cntrl = self->noise_k.__cntrl_;
  if (cntrl) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)cntrl);
  }
  v5 = *(std::__shared_weak_count **)&self->_anon_108[128];
  if (v5) {
    nitro::nitro_function::nitro_function(v5);
  }
  if (*((char *)&self->current_postprocessing_settings.name.__r_.var1 + 3) < 0) {
    operator delete((void *)self->current_postprocessing_settings.name.__r_.__value_.var0.__l.__size_);
  }
  if (self->current_postprocessing_settings.name.__r_.__value_.var0.__s.__data_[7] < 0) {
    operator delete(self->tweaks.__tree_.__pair1_.__value_.__left_);
  }
  std::__tree<std::__value_type<std::string,std::pair<int,int>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::pair<int,int>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::pair<int,int>>>>::destroy((char *)self->smallOldResultTexture);
  objc_storeStrong((id *)&self->defaultWidth, 0);
  objc_storeStrong((id *)&self->queue, 0);
  objc_storeStrong((id *)&self->output_layer_name.var0, 0);
  objc_storeStrong((id *)&self->output_layer_name.__r_.var0, 0);
  if (*((char *)&self->output_layer_name.__r_.__value_.var0.__l + 23) < 0)
  {
    data = self->output_layer_name.__r_.__value_.var0.__l.__data_;
    operator delete(data);
  }
}

- (void)setFlip_y:(int)a3
{
  HIDWORD(self->precomputed_noise.__cntrl_) = a3;
}

- (int)flip_y
{
  return HIDWORD(self->precomputed_noise.__cntrl_);
}

- (void)setRotation_degrees:(int)a3
{
  LODWORD(self->precomputed_noise.__cntrl_) = a3;
}

- (int)rotation_degrees
{
  return (int)self->precomputed_noise.__cntrl_;
}

- (float)benchmark
{
  id v3 = [(EspressoImage2Image *)self newOutputTexture];
  id v4 = [(EspressoImage2Image *)self newOutputTexture];
  id v5 = (id)[self->output_layer_name.var0 newCommandQueue];
  [v5 setBackgroundGPUPriority:2];
  [v5 setGPUPriority:2];
  v6 = [v5 commandBuffer];
  memset(v16, 0, sizeof(v16));
  uint64_t v17 = 0;
  uint64_t v18 = 1;
  [(EspressoImage2Image *)self encodeToCommandBuffer:v6 sourceTexture:v3 destinationTexture:v4 cropRect:v16];
  [v6 commit];
  [v6 waitUntilCompleted];

  v7 = [v5 commandBuffer];
  int v8 = 50;
  do
  {
    memset(v13, 0, sizeof(v13));
    uint64_t v14 = 0;
    uint64_t v15 = 1;
    [(EspressoImage2Image *)self encodeToCommandBuffer:v7 sourceTexture:v3 destinationTexture:v4 cropRect:v13];
    --v8;
  }
  while (v8);
  [v7 commit];
  [v7 waitUntilCompleted];
  [v7 GPUEndTime];
  double v10 = v9;
  [v7 GPUStartTime];
  *(float *)&double v10 = (v10 - v11) * 1000.0 / 50.0;

  return *(float *)&v10;
}

- (void)aggregateWisdom:(void *)a3
{
  Espresso::get_internal_network((uint64_t)self->net.plan, *(void *)&self->net.network_index, (uint64_t)&v14);
  uint64_t v4 = *(void *)(*(void *)(v14 + 16) + 24);
  id v5 = *(long long **)(v4 + 88);
  v6 = (long long *)(v4 + 96);
  if (v5 != (long long *)(v4 + 96))
  {
    do
    {
      std::pair<std::string const,std::vector<int>>::pair[abi:ne180100](&v11, v5 + 2);
      v16 = &v11;
      v7 = (char *)(std::__tree<std::__value_type<std::string,std::vector<int>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<int>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<int>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)a3 + 11, &v11, (long long **)&v16)+ 7);
      if (v7 != (char *)&__p) {
        std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int *,unsigned int *>(v7, (char *)__p, (uint64_t)v13, (v13 - (unsigned char *)__p) >> 2);
      }
      if (__p)
      {
        v13 = __p;
        operator delete(__p);
      }
      if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v11.__r_.__value_.__l.__data_);
      }
      int v8 = (long long *)*((void *)v5 + 1);
      if (v8)
      {
        do
        {
          double v9 = v8;
          int v8 = *(long long **)v8;
        }
        while (v8);
      }
      else
      {
        do
        {
          double v9 = (long long *)*((void *)v5 + 2);
          BOOL v10 = *(void *)v9 == (void)v5;
          id v5 = v9;
        }
        while (!v10);
      }
      id v5 = v9;
    }
    while (v9 != v6);
  }
  Espresso::wisdom_trainer2::save((Espresso::wisdom_trainer2 *)a3, "/tmp/wisdom.plist");
  if (v15) {
    nitro::nitro_function::nitro_function(v15);
  }
}

- (void)_tune
{
  Espresso::get_internal_network((uint64_t)self->net.plan, *(void *)&self->net.network_index, (uint64_t)&v7);
  uint64_t v2 = v7;
  uint64_t v3 = *(void *)(*(void *)(v7 + 16) + 24);
  *(_DWORD *)(v3 + 8) = 1;
  std::__tree<std::__value_type<std::string,std::vector<int>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<int>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<int>>>>::destroy(*(void **)(v3 + 96));
  *(void *)(v3 + 88) = v3 + 96;
  *(void *)(v3 + 104) = 0;
  *(void *)(v3 + 96) = 0;
  uint64_t v4 = v8;
  v6[0] = v2;
  v6[1] = v8;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  Espresso::wisdom_trainer2::tune_network(v3, (uint64_t)v6);
  if (v4) {
    nitro::nitro_function::nitro_function(v4);
  }
  id v5 = Espresso::wisdom_trainer2::to_dict((Espresso::wisdom_trainer2 *)v3);
  NSLog(&cfstr_WisdomCountD.isa, [v5 count]);

  if (v4)
  {
    nitro::nitro_function::nitro_function(v4);
  }
}

- (void)tune
{
  pthread_mutex_locker::pthread_mutex_locker((pthread_mutex_locker *)&v3, (_opaque_pthread_mutex_t *)a2);
  [(EspressoImage2Image *)self _tune];
  pthread_mutex_locker::~pthread_mutex_locker(&v3);
}

- (id)newOutputTexture
{
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F35330], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 80, -[EspressoImage2Image width](self, "width"), -[EspressoImage2Image height](self, "height"), 0);
  [v3 setResourceOptions:0];
  [v3 setStorageMode:0];
  [v3 setUsage:3];
  uint64_t v4 = (void *)[self->output_layer_name.var0 newTextureWithDescriptor:v3];

  return v4;
}

- (void)postProcess:(id)a3 cameraSourceTexture:(id)a4 inputTexture:(id)a5 destinationTexture:(id)a6
{
  id v46 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  Espresso::get_internal_context((uint64_t **)self->ctx, lpsrc);
  if (*(void *)lpsrc)
  {
    if (v13 && *(void *)&lpsrc[2])
    {
      v43 = *(std::__shared_weak_count **)&lpsrc[2];
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&lpsrc[2] + 8), 1uLL, memory_order_relaxed);
      goto LABEL_7;
    }
  }
  else
  {
    v13 = 0;
  }
  v43 = 0;
LABEL_7:
  if (*(void *)&lpsrc[2]) {
    nitro::nitro_function::nitro_function(*(std::__shared_weak_count **)&lpsrc[2]);
  }
  v45 = v11;
  uint64_t v14 = (MTLFunctionConstantValues *)objc_opt_new();
  uint64_t v15 = objc_opt_new();
  float v16 = *(float *)&self->_anon_108[16];
  LOWORD(lpsrc[0]) = v16 > 0.001;
  objc_msgSend(v15, "appendFormat:", @"%d:%d_", 5, v16 > 0.001);
  [(MTLFunctionConstantValues *)v14 setConstantValue:lpsrc type:41 atIndex:5];
  float v17 = *(float *)&self->_anon_108[12];
  LOWORD(lpsrc[0]) = v17 > 0.001;
  objc_msgSend(v15, "appendFormat:", @"%d:%d_", 6, v17 > 0.001);
  [(MTLFunctionConstantValues *)v14 setConstantValue:lpsrc type:41 atIndex:6];
  float v18 = fabsf(*(float *)&self->_anon_108[24]);
  LOWORD(lpsrc[0]) = v18 > 0.001;
  objc_msgSend(v15, "appendFormat:", @"%d:%d_", 7, v18 > 0.001);
  [(MTLFunctionConstantValues *)v14 setConstantValue:lpsrc type:41 atIndex:7];
  float v19 = *(float *)&self->_anon_108[20];
  LOWORD(lpsrc[0]) = v19 > 0.001;
  objc_msgSend(v15, "appendFormat:", @"%d:%d_", 8, v19 > 0.001);
  [(MTLFunctionConstantValues *)v14 setConstantValue:lpsrc type:41 atIndex:8];
  if (LODWORD(self->current_postprocessing_settings.name.var0))
  {
    __int16 v20 = [(EspressoImage2Image *)self rotation_degrees];
    unsigned __int16 v21 = [(EspressoImage2Image *)self flip_y];
    LOWORD(lpsrc[0]) = v20;
    objc_msgSend(v15, "appendFormat:", @"%d:%d_", 0, v20);
    [(MTLFunctionConstantValues *)v14 setConstantValue:lpsrc type:37 atIndex:0];
    uint64_t var0_low = LODWORD(self->current_postprocessing_settings.name.var0);
    LOWORD(lpsrc[0]) = self->current_postprocessing_settings.name.var0;
    objc_msgSend(v15, "appendFormat:", @"%d:%d_", 1, var0_low);
    [(MTLFunctionConstantValues *)v14 setConstantValue:lpsrc type:41 atIndex:1];
    uint64_t v23 = *(unsigned int *)self->_anon_108;
    LOWORD(lpsrc[0]) = *(_DWORD *)self->_anon_108;
    objc_msgSend(v15, "appendFormat:", @"%d:%d_", 2, v23);
    [(MTLFunctionConstantValues *)v14 setConstantValue:lpsrc type:41 atIndex:2];
    uint64_t v24 = *(unsigned int *)&self->_anon_108[4];
    LOWORD(lpsrc[0]) = *(_DWORD *)&self->_anon_108[4];
    objc_msgSend(v15, "appendFormat:", @"%d:%d_", 3, v24);
    [(MTLFunctionConstantValues *)v14 setConstantValue:lpsrc type:41 atIndex:3];
    LOWORD(lpsrc[0]) = v21;
    objc_msgSend(v15, "appendFormat:", @"%d:%d_", 4, v21);
    [(MTLFunctionConstantValues *)v14 setConstantValue:lpsrc type:41 atIndex:4];
    if ([v11 textureType] == 3) {
      v25 = @"image2image_postprocessing_blend_texarray";
    }
    else {
      v25 = @"image2image_postprocessing_blend";
    }
  }
  else if ([v11 textureType] == 3)
  {
    v25 = @"process_output";
  }
  else
  {
    v25 = @"process_output_t2d";
  }
  uint64_t v44 = Espresso::context_metal::kernel_for_function(v13, &v25->isa, (NSString *)v15, v14);
  v26 = (void *)v44;
  if (!v44)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "shader not found");
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  v27 = v46;
  if (!v46)
  {
    v27 = [*(id *)&self->output_layer_name.__r_.var0 commandBuffer];
  }
  v28 = [v27 computeCommandEncoder];
  [v28 setLabel:@"output_texture_array_to_texture"];
  [v28 setComputePipelineState:v44];
  [v28 setTexture:v45 atIndex:0];
  [v28 setTexture:v12 atIndex:1];
  [v28 setTexture:v10 atIndex:3];
  v62[0] = [v12 width];
  v62[1] = [v12 height];
  v62[2] = 1056997505;
  v62[3] = HIDWORD(self->current_postprocessing_settings.name.var0);
  uint64_t v63 = 0;
  uint64_t v64 = 0;
  float v29 = 1.0 / *(float *)&self->_anon_108[12];
  int v65 = *(_DWORD *)&self->_anon_108[16];
  float v66 = v29;
  int32x2_t v67 = vrev64_s32(*(int32x2_t *)&self->_anon_108[20]);
  if (LODWORD(self->current_postprocessing_settings.name.var0))
  {
    [v28 setTexture:v10 atIndex:2];
    v42 = v10;
    lpsrc[0] = 1065353216;
    *(void *)&lpsrc[5] = 0;
    lpsrc[7] = 0;
    *(_OWORD *)&lpsrc[1] = 0x100000000uLL;
    uint64_t v54 = 0;
    uint64_t v55 = 0;
    uint64_t v51 = 0;
    uint64_t v52 = 0;
    __asm { FMOV            V0.2S, #1.0 }
    uint64_t v53 = _D0;
    int v56 = 0;
    int v57 = 0;
    __int16 v58 = 0;
    uint64_t v60 = 0;
    uint64_t v61 = 0;
    uint64_t v59 = 0;
    int v35 = [(EspressoImage2Image *)self rotation_degrees];
    LODWORD(v59) = v35;
    int v36 = [v12 width];
    int v37 = [v12 height];
    if (v35 == 270 || v35 == 90)
    {
      int v38 = v37;
    }
    else
    {
      int v38 = v36;
      int v36 = v37;
    }
    id v10 = v42;
    unint64_t src_crop_rect = Espresso::abstract_blob_container::get_src_crop_rect([v42 width], objc_msgSend(v42, "height"), lpsrc, v38, v36);
    float v40 = (float)(int)src_crop_rect / (float)(unint64_t)[v42 width];
    *(float *)&uint64_t v63 = v40;
    *((float *)&v63 + 1) = (float)SHIDWORD(src_crop_rect) / (float)(unint64_t)[v42 height];
    *(float *)&uint64_t v64 = (float)(v40 * -2.0) + 1.0;
    *((float *)&v64 + 1) = (float)(*((float *)&v63 + 1) * -2.0) + 1.0;
    v26 = (void *)v44;
  }
  [v28 setBytes:v62 length:48 atIndex:0];
  v49[0] = (unint64_t)([v12 width] + 15) >> 4;
  v49[1] = (unint64_t)([v12 height] + 15) >> 4;
  v49[2] = 1;
  int64x2_t v47 = vdupq_n_s64(0x10uLL);
  uint64_t v48 = 1;
  [v28 dispatchThreadgroups:v49 threadsPerThreadgroup:&v47];
  [v28 endEncoding];
  if (LOBYTE(self->device)) {
    [(EspressoImage2Image *)self simpleLinearResize:v27 sourceTexture:v12 destinationTexture:*(void *)&self->defaultWidth];
  }
  if (!v46) {
    [v27 commit];
  }

  if (v43) {
    nitro::nitro_function::nitro_function(v43);
  }
}

- (void)simpleLinearResize:(id)a3 sourceTexture:(id)a4 destinationTexture:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  Espresso::get_internal_context((uint64_t **)self->ctx, &lpsrc);
  if (!lpsrc)
  {
    id v11 = 0;
    goto LABEL_6;
  }
  if (!v11)
  {
LABEL_6:
    id v12 = 0;
    goto LABEL_7;
  }
  id v12 = v23;
  if (v23) {
    atomic_fetch_add_explicit(&v23->__shared_owners_, 1uLL, memory_order_relaxed);
  }
LABEL_7:
  if (v23) {
    nitro::nitro_function::nitro_function(v23);
  }
  v13 = [v11[20] kernelForFunction:"linear_resize_t2d" cacheString:0 withConstants:0];
  if (!v13)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "shader not found");
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  uint64_t v14 = [v8 computeCommandEncoder];
  [v14 setLabel:@"linear_resize_t2d"];
  [v14 setComputePipelineState:v13];
  [v14 setTexture:v9 atIndex:0];
  [v14 setTexture:v10 atIndex:1];
  int v15 = *(_DWORD *)&self->_anon_108[8];
  std::string::basic_string[abi:ne180100]<0>(&lpsrc, "temporal_alpha");
  smallOldResultTexture = self->smallOldResultTexture;
  if (!smallOldResultTexture)
  {
LABEL_15:
    char v17 = 1;
    goto LABEL_17;
  }
  while (std::operator<[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&lpsrc, (void *)smallOldResultTexture + 4))
  {
LABEL_14:
    smallOldResultTexture = *(MTLTexture **)smallOldResultTexture;
    if (!smallOldResultTexture) {
      goto LABEL_15;
    }
  }
  if (std::operator<[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((void *)smallOldResultTexture + 4, &lpsrc))
  {
    smallOldResultTexture = (MTLTexture *)((char *)smallOldResultTexture + 8);
    goto LABEL_14;
  }
  char v17 = 0;
LABEL_17:
  if (v24 < 0)
  {
    operator delete(lpsrc);
    if (v17) {
      goto LABEL_23;
    }
  }
  else if (v17)
  {
    goto LABEL_23;
  }
  std::string::basic_string[abi:ne180100]<0>(&lpsrc, "temporal_alpha");
  int v15 = *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)&self->t0, &lpsrc, (uint64_t)&lpsrc)+ 14);
  if (v24 < 0) {
    operator delete(lpsrc);
  }
LABEL_23:
  LODWORD(lpsrc) = [v10 width];
  HIDWORD(lpsrc) = [v10 height];
  LODWORD(v23) = 1065353216;
  HIDWORD(v23) = v15;
  [v14 setBytes:&lpsrc length:16 atIndex:0];
  v21[0] = (unint64_t)([v10 width] + 15) >> 4;
  v21[1] = (unint64_t)([v10 height] + 15) >> 4;
  v21[2] = 1;
  int64x2_t v19 = vdupq_n_s64(0x10uLL);
  uint64_t v20 = 1;
  [v14 dispatchThreadgroups:v21 threadsPerThreadgroup:&v19];
  [v14 endEncoding];

  if (v12) {
    nitro::nitro_function::nitro_function(v12);
  }
}

- (int)encodeToCommandBuffer:(id)a3 sourceTexture:(id)a4 destinationTexture:(id)a5 cropRect:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  dispatch_queue = self->dispatch_queue;
  uint64_t v14 = *(void *)&self->is_temporal_model;
  v40[0] = 1;
  uint64_t v48 = 0;
  uint64_t v49 = 0;
  v42 = dispatch_queue;
  uint64_t v43 = v14;
  uint64_t v44 = [v11 width];
  uint64_t v45 = [v11 height];
  uint64_t v46 = [v12 width];
  uint64_t v47 = [v12 height];
  int v41 = 723714088;
  kdebug_trace();
  pthread_mutex_locker::pthread_mutex_locker((pthread_mutex_locker *)&v39, v15);
  if (*(void *)&self->_anon_108[120])
  {
    if (Espresso::time_seconds(void)::onceToken != -1) {
      dispatch_once(&Espresso::time_seconds(void)::onceToken, &__block_literal_global_439);
    }
    float v16 = ((double)(std::chrono::steady_clock::now().__d_.__rep_ - Espresso::time_seconds(void)::t0) * 0.000000001
         - *(float *)&self->dim_small[4])
        * *(float *)&self->_anon_108[92];
    uint64_t v17 = *(void *)&self->_anon_108[120];
    *(float *)(v17 + 400) = v16;
    *(_DWORD *)(v17 + 404) = *(_DWORD *)&self->_anon_108[84];
  }
  unint64_t v18 = a6->var1.var0 | a6->var1.var1;
  if (*(_OWORD *)&a6->var1.var0 != 0)
  {
    int32x4_t v38 = vuzp1q_s32(*(int32x4_t *)&a6->var0.var0, *(int32x4_t *)&a6->var1.var0);
    LODWORD(v18) = 3;
  }
  v37[0] = v18;
  v37[1] = [(EspressoImage2Image *)self rotation_degrees];
  int v19 = [(EspressoImage2Image *)self flip_y];
  int v20 = self->_anon_108[116];
  v37[2] = v19;
  v37[3] = v20;
  v37[4] = 0;
  int8x16_t v21 = (int8x16_t)vrev64q_s32(*(int32x4_t *)&self->_anon_108[96]);
  int8x16_t v35 = vextq_s8(v21, v21, 0xCuLL);
  char v36 = 0;
  p_output_layer_name = &self->output_layer_name;
  if (*((char *)&self->output_layer_name.__r_.__value_.var0.__l + 23) < 0) {
    p_output_layer_name = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)p_output_layer_name->__r_.__value_.var0.__l.__data_;
  }
  espresso_network_bind_buffer((uint64_t *)self->net.plan, *(void *)&self->net.network_index, (uint64_t)p_output_layer_name, (uint64_t)v34, 0x20000, 0x10000, 0x80000);
  if (LOBYTE(self->device))
  {
    long long v33 = xmmword_192DBFE30;
    float v23 = *(float *)&self->_anon_108[80];
    float v29 = *(float *)&self->_anon_108[112] * (float)(v23 * -0.5);
    float v30 = v23;
    *(float *)v28 = v29;
    *(float *)&v28[1] = v29;
    char v31 = 0;
    int v24 = espresso_network_bind_input_metaltexture((uint64_t *)self->net.plan, *(void *)&self->net.network_index, (uint64_t)"data1", 0, *(void **)&self->defaultWidth, (uint64_t)v28, (uint64_t)v32);
    if (v24) {
      goto LABEL_21;
    }
    int v24 = espresso_network_bind_input_metaltexture((uint64_t *)self->net.plan, *(void *)&self->net.network_index, (uint64_t)"data0", 0, v11, (uint64_t)&v35, (uint64_t)v37);
    if (v24) {
      goto LABEL_21;
    }
    int v25 = espresso_network_bind_input_metaltexture((uint64_t *)self->net.plan, *(void *)&self->net.network_index, (uint64_t)"data2", 0, v11, (uint64_t)&v35, (uint64_t)v37);
  }
  else
  {
    int v24 = espresso_network_bind_input_metaltexture((uint64_t *)self->net.plan, *(void *)&self->net.network_index, (uint64_t)"data0", 0, v11, (uint64_t)&v35, (uint64_t)v37);
    if (v24) {
      goto LABEL_21;
    }
    int v25 = espresso_network_bind_input_metaltexture((uint64_t *)self->net.plan, *(void *)&self->net.network_index, (uint64_t)"data1", 0, v11, (uint64_t)&v35, (uint64_t)v37);
  }
  int v24 = v25;
  if (!v25)
  {
    if (v10) {
      int v26 = espresso_plan_submit_with_args((uint64_t *)self->plan, self->queue, (uint64_t)v10, 0, &__block_literal_global_1240);
    }
    else {
      int v26 = espresso_plan_submit_with_args((uint64_t *)self->plan, self->queue, 0, 0, &__block_literal_global_242);
    }
    int v24 = v26;
    if (!v26)
    {
      [(EspressoImage2Image *)self postProcess:v10 cameraSourceTexture:v11 inputTexture:v34[0] destinationTexture:v12];
      int v24 = 0;
    }
  }
LABEL_21:
  pthread_mutex_locker::~pthread_mutex_locker(&v39);
  Espresso_scoped_signpost::~Espresso_scoped_signpost((Espresso_scoped_signpost *)v40);

  return v24;
}

- (int)submitToQueueWithSourceTexture:(id)a3 destinationTexture:(id)a4 cropRect:(id *)a5
{
  long long v5 = *(_OWORD *)&a5->var0.var2;
  v7[0] = *(_OWORD *)&a5->var0.var0;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&a5->var1.var1;
  return [(EspressoImage2Image *)self encodeToCommandBuffer:0 sourceTexture:a3 destinationTexture:a4 cropRect:v7];
}

- (void)tweak:(id)a3 value:(float)a4
{
  id v6 = a3;
  NSLog(&cfstr_TweakingF.isa, v6, a4);
  id v7 = v6;
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v7 UTF8String]);
  *((float *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)&self->t0, &__p, (uint64_t)&__p)+ 14) = a4;
  if (v17 < 0) {
    operator delete(__p);
  }
  if ([v7 isEqualToString:@"saturation"])
  {
    *(float *)&self->_anon_108[16] = a4;
    goto LABEL_32;
  }
  if ([v7 isEqualToString:@"gamma"])
  {
    *(float *)&self->_anon_108[12] = a4;
    goto LABEL_32;
  }
  if ([v7 isEqualToString:@"brightness"])
  {
    *(float *)&self->_anon_108[24] = a4;
    goto LABEL_32;
  }
  if ([v7 isEqualToString:@"contrast"])
  {
    *(float *)&self->_anon_108[20] = a4;
    goto LABEL_32;
  }
  if ([v7 isEqualToString:@"old_frame_scale"])
  {
    *(float *)&self->_anon_108[80] = a4;
    goto LABEL_32;
  }
  if ([v7 isEqualToString:@"hq_scaling"])
  {
    BOOL v8 = roundf(a4) != 0.0;
    self->_anon_108[116] = v8;
    NSLog(&cfstr_TweakingHqD.isa, v8);
    goto LABEL_32;
  }
  if ([v7 isEqualToString:@"instancenorm_subsampling"])
  {
    Espresso::get_internal_context((uint64_t **)self->ctx, &v13);
    id v9 = v14;
    std::dynamic_pointer_cast[abi:ne180100]<Espresso::V9Engine::context,Espresso::abstract_context>(&__p, v13, (uint64_t)v14);
    if (v9) {
      nitro::nitro_function::nitro_function(v9);
    }
    if (__p)
    {
      *((_DWORD *)__p + 58) = llroundf(a4);
      NSLog(&cfstr_TweakingSubsam.isa, self->_anon_108[116]);
    }
    goto LABEL_30;
  }
  if (![v7 isEqualToString:@"winograd"]) {
    goto LABEL_32;
  }
  Espresso::get_internal_context((uint64_t **)self->ctx, &v13);
  id v10 = v14;
  std::dynamic_pointer_cast[abi:ne180100]<Espresso::V9Engine::context,Espresso::abstract_context>(&__p, v13, (uint64_t)v14);
  if (v10) {
    nitro::nitro_function::nitro_function(v10);
  }
  id v12 = __p;
  if (!__p) {
    goto LABEL_30;
  }
  LODWORD(v11) = llroundf(a4);
  *((_DWORD *)__p + 57) = v11;
  if (v11 == 3)
  {
    uint64_t v11 = 2;
    goto LABEL_28;
  }
  if (v11 == 5)
  {
    uint64_t v11 = 4;
LABEL_28:
    v12[57] = v11;
  }
  NSLog(&cfstr_TweakingWgD.isa, v11);
  [(EspressoImage2Image *)self reload];
LABEL_30:
  if (v16) {
    nitro::nitro_function::nitro_function(v16);
  }
LABEL_32:
}

- (int)submitToQueueWithSourceTexture:(id)a3 destinationTexture:(id)a4
{
  memset(v5, 0, sizeof(v5));
  uint64_t v6 = 0;
  uint64_t v7 = 1;
  return [(EspressoImage2Image *)self submitToQueueWithSourceTexture:a3 destinationTexture:a4 cropRect:v5];
}

- (int)encodeToCommandBuffer:(id)a3 sourceTexture:(id)a4 destinationTexture:(id)a5 cropRect:(id *)a6 destinationRect:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  int v15 = v14;
  if (a7->var0.var0) {
    BOOL v16 = 0;
  }
  else {
    BOOL v16 = a7->var0.var1 == 0;
  }
  unint64_t var0 = a7->var1.var0;
  if (var0) {
    BOOL v18 = 0;
  }
  else {
    BOOL v18 = a7->var1.var1 == 0;
  }
  if (var0 == [v14 width])
  {
    unint64_t var1 = a7->var1.var1;
    BOOL v20 = var1 == [v15 height];
  }
  else
  {
    BOOL v20 = 0;
  }
  if (!v16 || !v18 && !v20)
  {
    uint64_t v23 = [self->precomputed_noise.__ptr_ width];
    unint64_t v24 = a7->var1.var0;
    if (v23 == v24)
    {
      uint64_t v25 = [self->precomputed_noise.__ptr_ height];
      unint64_t v26 = a7->var1.var1;
      if (v25 == v26)
      {
LABEL_17:
        ptr = self->precomputed_noise.__ptr_;
        long long v32 = *(_OWORD *)&a6->var0.var2;
        v42[0] = *(_OWORD *)&a6->var0.var0;
        v42[1] = v32;
        v42[2] = *(_OWORD *)&a6->var1.var1;
        int v22 = [(EspressoImage2Image *)self encodeToCommandBuffer:v12 sourceTexture:v13 destinationTexture:ptr cropRect:v42];
        long long v33 = [v12 blitCommandEncoder];
        v34 = self->precomputed_noise.__ptr_;
        memset(v41, 0, sizeof(v41));
        uint64_t v35 = [v34 width];
        uint64_t v36 = [self->precomputed_noise.__ptr_ height];
        v40[0] = v35;
        v40[1] = v36;
        v40[2] = 1;
        long long v38 = *(_OWORD *)&a7->var0.var0;
        unint64_t var2 = a7->var0.var2;
        [v33 copyFromTexture:v34 sourceSlice:0 sourceLevel:0 sourceOrigin:v41 sourceSize:v40 toTexture:v15 destinationSlice:0 destinationLevel:0 destinationOrigin:&v38];
        [v33 endEncoding];

        goto LABEL_18;
      }
      unint64_t v24 = a7->var1.var0;
    }
    else
    {
      unint64_t v26 = a7->var1.var1;
    }
    v27 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:80 width:v24 height:v26 mipmapped:0];
    [v27 setResourceOptions:0];
    [v27 setStorageMode:0];
    v28 = (void *)MEMORY[0x192FF2020]([v27 setUsage:3]);
    float v29 = (void *)[self->output_layer_name.var0 newTextureWithDescriptor:v27];
    float v30 = self->precomputed_noise.__ptr_;
    self->precomputed_noise.__ptr_ = v29;

    goto LABEL_17;
  }
  long long v21 = *(_OWORD *)&a6->var0.var2;
  v43[0] = *(_OWORD *)&a6->var0.var0;
  v43[1] = v21;
  v43[2] = *(_OWORD *)&a6->var1.var1;
  int v22 = [(EspressoImage2Image *)self encodeToCommandBuffer:v12 sourceTexture:v13 destinationTexture:v15 cropRect:v43];
LABEL_18:

  return v22;
}

- (int)_reshapeToWidth:(int)a3 andHeight:(int)a4
{
  v21[0] = 1;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  int v22 = 723714080;
  kdebug_trace();
  ptr = self->noise_k.__ptr_;
  if (ptr)
  {
    int v8 = HIDWORD(self->dim_small[4]);
    *(_DWORD *)(*(uint64_t (**)(v9_noise_kernel *))(*(void *)ptr + 384))(ptr) = a3 / v8;
    int v9 = HIDWORD(self->dim_small[4]);
    *(_DWORD *)((*(uint64_t (**)(v9_noise_kernel *))(*(void *)self->noise_k.__ptr_ + 384))(self->noise_k.__ptr_)
              + 4) = a4 / v9;
  }
  int v10 = espresso_plan_build_clean((uint64_t *)self->plan);
  if (!v10)
  {
    if (LOBYTE(self->device))
    {
      uint64_t v11 = operator new(0x20uLL);
      *(_OWORD *)uint64_t v11 = xmmword_1E5746E00;
      *((_OWORD *)v11 + 1) = *(_OWORD *)&off_1E5746E10;
      int v12 = HIDWORD(self->dim_small[4]);
      id v13 = operator new(0x10uLL);
      _DWORD *v13 = a3 / v12;
      v13[1] = a3 / v12;
      _OWORD v13[2] = a3;
      v13[3] = 1;
      id v14 = operator new(0x10uLL);
      *id v14 = a4 / v12;
      v14[1] = a4 / v12;
      v14[2] = a4;
      v14[3] = 1;
      int v15 = operator new(0x10uLL);
      *(_OWORD *)int v15 = xmmword_192DCA2F0;
      BOOL v16 = operator new(0x10uLL);
      *(void *)&long long v17 = 0x100000001;
      *((void *)&v17 + 1) = 0x100000001;
      *(_OWORD *)BOOL v16 = v17;
      if (espresso_network_change_input_blob_shapes(self->net.plan, *(void *)&self->net.network_index, 4, (uint64_t)v11, (uint64_t)v13, (uint64_t)v14, (uint64_t)v15, (uint64_t)v16))
      {
        int v18 = espresso_network_change_input_blob_shapes(self->net.plan, *(void *)&self->net.network_index, 3, (uint64_t)v11, (uint64_t)v13, (uint64_t)v14, (uint64_t)v15, (uint64_t)v16);
LABEL_9:
        int v10 = v18;
LABEL_11:
        operator delete(v16);
        operator delete(v15);
        operator delete(v14);
        operator delete(v13);
        operator delete(v11);
        if (!v10)
        {
          int v10 = espresso_plan_build((uint64_t *)self->plan);
          if (!v10) {
            int v10 = [(EspressoImage2Image *)self wasReshaped];
          }
        }
        goto LABEL_14;
      }
    }
    else
    {
      uint64_t v11 = operator new(0x18uLL);
      *(_OWORD *)uint64_t v11 = xmmword_1E5746E20;
      v11[2] = "data2";
      int v19 = HIDWORD(self->dim_small[4]);
      id v13 = operator new(0xCuLL);
      _DWORD *v13 = a3 / v19;
      v13[1] = a3;
      _OWORD v13[2] = 1;
      id v14 = operator new(0xCuLL);
      *id v14 = a4 / v19;
      v14[1] = a4;
      v14[2] = 1;
      int v15 = operator new(0xCuLL);
      *(void *)int v15 = 0x300000003;
      v15[2] = 1;
      BOOL v16 = operator new(0xCuLL);
      *(void *)BOOL v16 = 0x100000001;
      _OWORD v16[2] = 1;
      if (espresso_network_change_input_blob_shapes(self->net.plan, *(void *)&self->net.network_index, 3, (uint64_t)v11, (uint64_t)v13, (uint64_t)v14, (uint64_t)v15, (uint64_t)v16))
      {
        int v18 = espresso_network_change_input_blob_shapes(self->net.plan, *(void *)&self->net.network_index, 2, (uint64_t)v11, (uint64_t)v13, (uint64_t)v14, (uint64_t)v15, (uint64_t)v16);
        goto LABEL_9;
      }
    }
    int v10 = 0;
    goto LABEL_11;
  }
LABEL_14:
  Espresso_scoped_signpost::~Espresso_scoped_signpost((Espresso_scoped_signpost *)v21);
  return v10;
}

- (int)reshapeToWidth:(int)a3 andHeight:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  pthread_mutex_locker::pthread_mutex_locker((pthread_mutex_locker *)&v8, (_opaque_pthread_mutex_t *)a2);
  self->noise_load_constant_kernel.__cntrl_ = 0;
  LODWORD(v4) = [(EspressoImage2Image *)self _reshapeToWidth:v5 andHeight:v4];
  pthread_mutex_locker::~pthread_mutex_locker(&v8);
  return v4;
}

- (int)_reshapeToResolutionPreset:(int64_t)a3
{
  if (![(EspressoImage2Image *)self resolutionForPreset:a3]) {
    return -6;
  }

  return -[EspressoImage2Image _reshapeToWidth:andHeight:](self, "_reshapeToWidth:andHeight:");
}

- (int)reshapeToResolutionPreset:(int64_t)a3 aspectRatio:(float)a4
{
  pthread_mutex_locker::pthread_mutex_locker((pthread_mutex_locker *)&v18, (_opaque_pthread_mutex_t *)a2);
  self->noise_load_constant_kernel.__cntrl_ = (__shared_weak_count *)a3;
  pair<int, int> v7 = [(EspressoImage2Image *)self resolutionForPreset:a3];
  float v8 = (float)v7.var0 / a4;
  int v9 = (int)v8 + 2;
  if ((int)v8 >= 1) {
    int v9 = (int)v8 - 1;
  }
  unsigned int v10 = (v9 & 0xFFFFFFFC) + 4;
  float v11 = (float)v7.var1 * a4;
  int v12 = (int)v11 + 2;
  if ((int)v11 >= 1) {
    int v12 = (int)v11 - 1;
  }
  unsigned int v13 = (v12 & 0xFFFFFFFC) + 4;
  if (a4 < 1.0) {
    uint64_t var0 = v7.var0;
  }
  else {
    uint64_t var0 = v10;
  }
  if (a4 < 1.0) {
    uint64_t var1 = v13;
  }
  else {
    uint64_t var1 = v7.var1;
  }
  int v16 = [(EspressoImage2Image *)self _reshapeToWidth:var0 andHeight:var1];
  pthread_mutex_locker::~pthread_mutex_locker(&v18);
  return v16;
}

- (pair<int,)resolutionForPreset:(int64_t)a3
{
  if ((unint64_t)a3 > 6) {
    return (pair<int, int>)0;
  }
  else {
    return (pair<int, int>)(*(unsigned int *)((char *)&self->super.isa + qword_192DCD6B0[a3]) | ((unint64_t)*(unsigned int *)((char *)&self->super.isa + qword_192DCD6E8[a3]) << 32));
  }
}

- (int)reshapeToResolutionPreset:(int64_t)a3
{
  pthread_mutex_locker::pthread_mutex_locker((pthread_mutex_locker *)&v6, (_opaque_pthread_mutex_t *)a2);
  self->noise_load_constant_kernel.__cntrl_ = (__shared_weak_count *)a3;
  LODWORD(a3) = [(EspressoImage2Image *)self _reshapeToResolutionPreset:a3];
  pthread_mutex_locker::~pthread_mutex_locker(&v6);
  return a3;
}

- (int)load:(id)a3 resolutionPreset:(int64_t)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  pthread_mutex_locker::pthread_mutex_locker((pthread_mutex_locker *)&v37, v8);
  objc_storeStrong((id *)&self->noise_load_constant_kernel.__ptr_, a3);
  self->noise_load_constant_kernel.__cntrl_ = (__shared_weak_count *)a4;
  self->dim_small[3] = 0;
  cntrl = self->noise_k.__cntrl_;
  self->noise_k.__ptr_ = 0;
  self->noise_k.__cntrl_ = 0;
  if (cntrl) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)cntrl);
  }
  unsigned int v10 = *(std::__shared_weak_count **)&self->_anon_108[128];
  *(void *)&self->_anon_108[120] = 0;
  *(void *)&self->_anon_108[128] = 0;
  if (v10) {
    nitro::nitro_function::nitro_function(v10);
  }
  plan = self->plan;
  if (plan) {
    espresso_plan_destroy((std::string::size_type)plan);
  }
  p_pair1 = &self->tweaks.__tree_.__pair1_;
  if (self->current_postprocessing_settings.name.__r_.__value_.var0.__s.__data_[7] < 0) {
    operator delete(p_pair1->__value_.__left_);
  }
  p_size = &self->current_postprocessing_settings.name.__r_.__value_.var0.__l.__size_;
  p_pair1->__value_.__left_ = 0;
  self->tweaks.__tree_.__pair3_.__value_ = 0;
  self->current_postprocessing_settings.name.__r_.__value_.var0.__l.__data_ = 0;
  if (*((char *)&self->current_postprocessing_settings.name.__r_.var1 + 3) < 0) {
    operator delete((void *)*p_size);
  }
  unint64_t *p_size = 0;
  *((void *)&self->current_postprocessing_settings.name.__r_.__value_.var0.__l + 2) = 0;
  LODWORD(self->current_postprocessing_settings.name.var0) = 0;
  *(void *)&self->current_postprocessing_settings.name.__r_.uint64_t var0 = 0;
  HIDWORD(self->current_postprocessing_settings.name.var0) = 1050253722;
  *(void *)self->_anon_108 = 0;
  *(_OWORD *)&self->_anon_108[8] = xmmword_192DCA2A0;
  *(_DWORD *)&self->_anon_108[24] = 0;
  *(_OWORD *)&self->_anon_108[28] = xmmword_192DCA2B0;
  *(_OWORD *)&self->_anon_108[44] = xmmword_192DCA2C0;
  *(_OWORD *)&self->_anon_108[60] = xmmword_192DCA2D0;
  *(_DWORD *)&self->_anon_108[76] = 960;
  *(void *)&self->_anon_108[80] = 0x3F8000003DA3D70ALL;
  *(_DWORD *)&self->_anon_108[88] = 0;
  *(_OWORD *)&self->_anon_108[92] = xmmword_192DCA2E0;
  *(void *)&self->_anon_108[108] = 0x3F8000003F79999ALL;
  self->_anon_108[116] = 0;
  objc_msgSend(v7, "lastPathComponent", 0xC2D000003C23D70ALL, 0xC2F60000C2EA0000, 0xBF8000003F800000, 0xBF800000BF800000);
  id v14 = objc_claimAutoreleasedReturnValue();
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v14 UTF8String]);

  if (Espresso::Image2Image::settings_t::shared(void)::onceToken != -1) {
    dispatch_once(&Espresso::Image2Image::settings_t::shared(void)::onceToken, &__block_literal_global_20416);
  }
  for (i = *(void **)(Espresso::Image2Image::settings_t::shared(void)::global + 8); i; i = (void *)*i)
  {
    if (!std::operator<[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(__p, i + 4))
    {
      if (!std::operator<[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(i + 4, __p))
      {
        int v16 = (uint64_t **)Espresso::Image2Image::settings_t::shared(void)::global;
        long long v17 = (void **)std::__tree<std::__value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__find_equal<std::string>(Espresso::Image2Image::settings_t::shared(void)::global, &v38, __p);
        int v18 = (char *)*v17;
        if (!*v17)
        {
          int v19 = (uint64_t **)v17;
          int v18 = (char *)operator new(0xE8uLL);
          v39[0] = (uint64_t)v18;
          v39[1] = (uint64_t)(v16 + 1);
          char v40 = 0;
          BOOL v20 = (std::string *)(v18 + 32);
          if (SHIBYTE(v36) < 0)
          {
            std::string::__init_copy_ctor_external(v20, (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
          }
          else
          {
            *(_OWORD *)&v20->__r_.__value_.__l.__data_ = *(_OWORD *)__p;
            *((void *)v18 + 6) = v36;
          }
          *(_OWORD *)(v18 + 104) = 0u;
          *(_OWORD *)(v18 + 152) = 0u;
          *(_OWORD *)(v18 + 136) = 0u;
          *(_OWORD *)(v18 + 168) = 0u;
          *(_OWORD *)(v18 + 184) = 0u;
          *(_OWORD *)(v18 + 216) = 0u;
          *(_OWORD *)(v18 + 200) = 0u;
          *(_OWORD *)(v18 + 88) = 0u;
          *(_OWORD *)(v18 + 72) = 0u;
          *(_OWORD *)(v18 + 56) = 0u;
          *((_DWORD *)v18 + 27) = 1050253722;
          *(_OWORD *)(v18 + 120) = v34;
          *((_OWORD *)v18 + 9) = xmmword_192DCA300;
          *((_OWORD *)v18 + 10) = xmmword_192DCA310;
          *((_OWORD *)v18 + 11) = xmmword_192DCA320;
          *((void *)v18 + 24) = 0x3F8000003DA3D70ALL;
          *(_OWORD *)(v18 + 204) = v33;
          *(void *)(v18 + 220) = 0x3F8000003F79999ALL;
          char v40 = 1;
          std::__tree<std::__value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__insert_node_at(v16, v38, v19, (uint64_t *)v18);
          v39[0] = 0;
          std::unique_ptr<std::__tree_node<std::__value_type<std::string,Espresso::Image2Image::postprocessing_settings_t>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,Espresso::Image2Image::postprocessing_settings_t>,void *>>>>::reset[abi:ne180100](v39);
        }
        std::string::operator=((std::string *)&self->tweaks.__tree_.__pair1_, (const std::string *)(v18 + 56));
        std::string::operator=((std::string *)&self->current_postprocessing_settings.name.__r_.__value_.var0.__l.__size_, (const std::string *)(v18 + 80));
        long long v21 = *(_OWORD *)(v18 + 104);
        long long v22 = *(_OWORD *)(v18 + 120);
        long long v23 = *(_OWORD *)(v18 + 152);
        *(_OWORD *)&self->_anon_108[24] = *(_OWORD *)(v18 + 136);
        *(_OWORD *)&self->_anon_108[40] = v23;
        *(_OWORD *)&self->current_postprocessing_settings.name.uint64_t var0 = v21;
        *(_OWORD *)&self->_anon_108[8] = v22;
        long long v24 = *(_OWORD *)(v18 + 168);
        long long v25 = *(_OWORD *)(v18 + 184);
        long long v26 = *(_OWORD *)(v18 + 200);
        *(_OWORD *)&self->_anon_108[101] = *(_OWORD *)(v18 + 213);
        *(_OWORD *)&self->_anon_108[72] = v25;
        *(_OWORD *)&self->_anon_108[88] = v26;
        *(_OWORD *)&self->_anon_108[56] = v24;
        break;
      }
      ++i;
    }
  }
  if (*((char *)&self->current_postprocessing_settings.name.__r_.var1 + 3) < 0)
  {
    if (!*((void *)&self->current_postprocessing_settings.name.__r_.__value_.var0.__l + 2)) {
      goto LABEL_32;
    }
  }
  else if (!*((unsigned char *)&self->current_postprocessing_settings.name.__r_.var1 + 3))
  {
    goto LABEL_32;
  }
  v27 = [(id)plistPath stringByDeletingLastPathComponent];
  if (*((char *)&self->current_postprocessing_settings.name.__r_.var1 + 3) < 0) {
    p_size = (unint64_t *)*p_size;
  }
  v28 = [NSString stringWithUTF8String:p_size];
  uint64_t v29 = [v27 stringByAppendingPathComponent:v28];

  id v7 = (id)v29;
LABEL_32:
  float v30 = (unsigned char *)espresso_create_plan((void *)self->ctx, 0);
  self->plan = v30;
  if (v30)
  {
    int v31 = espresso_plan_add_network(v30, (char *)[v7 UTF8String], 65552, (uint64_t)&self->net);
    if (!v31)
    {
      int v31 = espresso_plan_build((uint64_t *)self->plan);
      if (!v31)
      {
        int v31 = [(EspressoImage2Image *)self wasReshaped];
        if (!v31)
        {
          LOBYTE(self->device) = espresso_network_query_blob_dimensions((uint64_t *)self->net.plan, *(void *)&self->net.network_index, (uint64_t)"data3", (uint64_t)v39) == 0;
          int v31 = [(EspressoImage2Image *)self _reshapeToResolutionPreset:a4];
        }
      }
    }
  }
  else
  {
    int v31 = -1;
  }
  if (SHIBYTE(v36) < 0) {
    operator delete(__p[0]);
  }
  pthread_mutex_locker::~pthread_mutex_locker(&v37);

  return v31;
}

- (int)reload
{
  return [(EspressoImage2Image *)self load:self->noise_load_constant_kernel.__ptr_ resolutionPreset:self->noise_load_constant_kernel.__cntrl_];
}

- (int)load:(id)a3
{
  return [(EspressoImage2Image *)self load:a3 resolutionPreset:0];
}

- (void)resetTemporalState
{
  pthread_mutex_locker::pthread_mutex_locker((pthread_mutex_locker *)&v3, (_opaque_pthread_mutex_t *)a2);
  [(EspressoImage2Image *)self _resetTemporalState];
  pthread_mutex_locker::~pthread_mutex_locker(&v3);
}

- (void)_resetTemporalState
{
  objc_msgSend(MEMORY[0x1E4F35330], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 80, -[EspressoImage2Image width](self, "width") / SHIDWORD(self->dim_small[4]), -[EspressoImage2Image height](self, "height") / SHIDWORD(self->dim_small[4]), 0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setResourceOptions:32];
  [v5 setUsage:3];
  uint64_t v3 = [self->output_layer_name.var0 newTextureWithDescriptor:v5];
  uint64_t v4 = *(void **)&self->defaultWidth;
  *(void *)&self->defaultWidth = v3;
}

- (int)wasReshaped
{
  uint64_t v3 = (void *)MEMORY[0x192FF2020](self, a2);
  uint64_t v4 = *(void **)&self->defaultWidth;
  *(void *)&self->defaultWidth = 0;

  p_output_layer_name = &self->output_layer_name;
  MEMORY[0x192FF0F50](&self->output_layer_name, "id4");
  int result = espresso_network_query_blob_dimensions((uint64_t *)self->net.plan, *(void *)&self->net.network_index, (uint64_t)"data0", (uint64_t)&self->dim[3]);
  if (!result)
  {
    if (*((char *)&self->output_layer_name.__r_.__value_.var0.__l + 23) < 0) {
      p_output_layer_name = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)p_output_layer_name->__r_.__value_.var0.__l.__data_;
    }
    int result = espresso_network_query_blob_dimensions((uint64_t *)self->net.plan, *(void *)&self->net.network_index, (uint64_t)p_output_layer_name, (uint64_t)&self->dispatch_queue);
    if (!result)
    {
      if (!LODWORD(self->dim_small[3]))
      {
        int32x2_t v7 = vmovn_s64(*(int64x2_t *)&self->dispatch_queue);
        self->dim_small[3] = (unint64_t)v7;
        HIDWORD(self->dim_small[4]) = v7.i32[0] / SLODWORD(self->dim[3]);
      }
      [(EspressoImage2Image *)self addNoiseLayer];
      [(EspressoImage2Image *)self _resetTemporalState];
      return 0;
    }
  }
  return result;
}

- (void)addNoiseLayer
{
  v175[0] = *MEMORY[0x1E4F143B8];
  Espresso::get_internal_network((uint64_t)self->net.plan, *(void *)&self->net.network_index, (uint64_t)&v161);
  uint64_t v3 = v161;
  uint64_t v4 = *(uint64_t **)(v161 + 32);
  uint64_t v5 = *v4;
  uint64_t v6 = *(void **)(*v4 + 64);
  if (v6
  {
    uint64_t v7 = *(void *)(v5 + 72);
    if (v7) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  float v8 = *(std::__shared_weak_count **)&self->_anon_108[128];
  *(void *)&self->_anon_108[120] = v6;
  *(void *)&self->_anon_108[128] = v7;
  if (v8) {
    nitro::nitro_function::nitro_function(v8);
  }
  int v9 = *(uint64_t **)(v3 + 32);
  uint64_t v10 = *v9;
  float v11 = *(v9_noise_kernel **)(*v9 + 64);
  if (v11
  {
    uint64_t v12 = *(void *)(v10 + 72);
    if (v12) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v12 + 8), 1uLL, memory_order_relaxed);
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  cntrl = self->noise_k.__cntrl_;
  self->noise_k.__ptr_ = v11;
  self->noise_k.__cntrl_ = (__shared_weak_count *)v12;
  if (cntrl) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)cntrl);
  }
  long long v159 = xmmword_192DC3600;
  unint64_t v160 = 0xFFFFFFFF00000001;
  LODWORD(v159) = [(EspressoImage2Image *)self width] / SHIDWORD(self->dim_small[4]);
  int v14 = [(EspressoImage2Image *)self height] / SHIDWORD(self->dim_small[4]);
  DWORD1(v159) = v14;
  *((void *)&v159 + 1) = 0x100000003;
  if (!v159 || !v14)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Inconsistent state: 0 blob");
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  if (*(void *)&self->_anon_108[120])
  {
    int v15 = 0;
  }
  else
  {
    int v15 = *(_DWORD *)&self->_anon_108[88];
    if (v15)
    {
      Espresso::abstract_engine_factory::shared(&v165);
      int v16 = (uint64_t *)v165;
      std::string::basic_string[abi:ne180100]<0>(__p, "noise");
      LODWORD(lpsrc[0]) = (***(uint64_t (****)(void))(*(void *)(v3 + 16) + 8))(*(void *)(*(void *)(v3 + 16) + 8));
      LODWORD(p_str) = 1;
      Espresso::abstract_engine_factory::make_kernel_priv((uint64_t)v16, v3 + 16, (uint64_t)__p, (uint64_t)&v159, (int *)lpsrc);
      long long v17 = (void *)__str.__r_.__value_.__r.__words[0];
      if (__str.__r_.__value_.__r.__words[0]
      {
        std::string::size_type size = __str.__r_.__value_.__l.__size_;
        if (__str.__r_.__value_.__l.__size_) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(__str.__r_.__value_.__l.__size_ + 8), 1uLL, memory_order_relaxed);
        }
      }
      else
      {
        std::string::size_type size = 0;
      }
      int v19 = *(std::__shared_weak_count **)&self->_anon_108[128];
      *(void *)&self->_anon_108[120] = v17;
      *(void *)&self->_anon_108[128] = size;
      if (v19) {
        nitro::nitro_function::nitro_function(v19);
      }
      if (__str.__r_.__value_.__l.__size_) {
        nitro::nitro_function::nitro_function((std::__shared_weak_count *)__str.__r_.__value_.__l.__size_);
      }
      if ((__p[23] & 0x80000000) != 0) {
        operator delete(*(void **)__p);
      }
      if (v166) {
        nitro::nitro_function::nitro_function((std::__shared_weak_count *)v166);
      }
      *(_DWORD *)__p = 0;
      memset(&__p[8], 0, 32);
      *(_OWORD *)v157 = 0u;
      long long v158 = 0u;
      *(unsigned char *)(*(void *)&self->_anon_108[120] + 376) = 0;
      BOOL v20 = (char *)operator new(0xF8uLL);
      *((void *)v20 + 1) = 0;
      *((void *)v20 + 2) = 0;
      *(void *)BOOL v20 = &unk_1EE389DF0;
      *((void *)v20 + 3) = &unk_1EE36C758;
      *(_OWORD *)(v20 + 56) = 0u;
      *(_OWORD *)(v20 + 72) = 0u;
      *(_OWORD *)(v20 + 88) = 0u;
      *(_OWORD *)(v20 + 104) = 0u;
      *(_OWORD *)(v20 + 120) = 0u;
      *(_OWORD *)(v20 + 136) = 0u;
      *(_OWORD *)(v20 + 152) = 0u;
      *(_OWORD *)(v20 + 40) = 0u;
      *(_OWORD *)(v20 + 161) = 0u;
      *((_OWORD *)v20 + 13) = 0u;
      *((_OWORD *)v20 + 14) = 0u;
      *((void *)v20 + 30) = 0;
      *(void *)&__p[8] = v20 + 24;
      *(void *)&__p[16] = v20;
      MEMORY[0x192FF0F50](v20 + 40, "noise_const");
      MEMORY[0x192FF0F50](*(void *)&__p[8] + 40, "noise");
      uint64_t v21 = *(void *)&__p[8];
      uint64_t v23 = *(void *)&self->_anon_108[120];
      uint64_t v22 = *(void *)&self->_anon_108[128];
      if (v22) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v22 + 8), 1uLL, memory_order_relaxed);
      }
      long long v24 = *(std::__shared_weak_count **)(v21 + 72);
      *(void *)(v21 + 64) = v23;
      *(void *)(v21 + 72) = v22;
      if (v24) {
        nitro::nitro_function::nitro_function(v24);
      }
      int v25 = (***(uint64_t (****)(void))(*(void *)(v3 + 16) + 8))(*(void *)(*(void *)(v3 + 16) + 8));
      uint64_t v26 = *(void *)&__p[8];
      *(_DWORD *)(*(void *)&__p[8] + 8) = v25;
      *(_DWORD *)(v26 + 12) = 1;
      std::string::basic_string[abi:ne180100]<0>(&__str, "noise");
      std::vector<std::string>::__assign_with_size[abi:ne180100]<std::string const*,std::string const*>((std::vector<std::string> *)&v157[1], &__str, &v171, 1uLL);
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__str.__r_.__value_.__l.__data_);
      }
      std::vector<std::string>::__assign_with_size[abi:ne180100]<std::string const*,std::string const*>((std::vector<std::string> *)&__p[24], 0, 0, 0);
      *(_DWORD *)__p = -1;
      LODWORD(__str.__r_.__value_.__l.__data_) = -1;
      *(_OWORD *)&__str.__r_.__value_.__r.__words[1] = *(_OWORD *)&__p[8];
      if (*(void *)&__p[16]) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&__p[16] + 8), 1uLL, memory_order_relaxed);
      }
      long long v171 = 0uLL;
      uint64_t v172 = 0;
      std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v171, *(uint64_t *)&__p[24], *(uint64_t *)&__p[32], 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)&__p[32] - *(void *)&__p[24]) >> 3));
      long long v173 = 0uLL;
      uint64_t v174 = 0;
      std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v173, (uint64_t)v157[1], v158, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v158 - (unint64_t)v157[1]) >> 3));
      v165 = 0;
      uint64_t v166 = 0;
      uint64_t v167 = 0;
      lpsrc[0] = &v165;
      LOBYTE(lpsrc[1]) = 0;
      v165 = (std::__shared_weak_count *)operator new(0x48uLL);
      uint64_t v166 = (uint64_t)v165;
      uint64_t v167 = (uint64_t)&v165[3];
      uint64_t v166 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<Espresso::net::new_layer_info>,Espresso::net::new_layer_info const*,Espresso::net::new_layer_info const*,Espresso::net::new_layer_info*>((uint64_t)&v167, (uint64_t)&__str, (uint64_t)v175, (uint64_t)v165);
      Espresso::net::insert_layers(v3, (uint64_t **)&v165);
      lpsrc[0] = &v165;
      std::vector<Espresso::net::new_layer_info>::__destroy_vector::operator()[abi:ne180100]((void ***)lpsrc);
      lpsrc[0] = &v173;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)lpsrc);
      lpsrc[0] = &v171;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)lpsrc);
      if (__str.__r_.__value_.__r.__words[2]) {
        nitro::nitro_function::nitro_function((std::__shared_weak_count *)__str.__r_.__value_.__r.__words[2]);
      }
      __str.__r_.__value_.__r.__words[0] = (std::string::size_type)&v157[1];
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__str);
      __str.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p[24];
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__str);
      if (*(void *)&__p[16]) {
        nitro::nitro_function::nitro_function(*(std::__shared_weak_count **)&__p[16]);
      }
      int v15 = 1;
    }
  }
  ptr = self->noise_k.__ptr_;
  if (ptr || *(_DWORD *)&self->_anon_108[88])
  {
    if (!v15) {
      goto LABEL_86;
    }
  }
  else
  {
    Espresso::abstract_engine_factory::shared(&v165);
    long long v32 = (uint64_t *)v165;
    std::string::basic_string[abi:ne180100]<0>(__p, "load_constant");
    LODWORD(lpsrc[0]) = (***(uint64_t (****)(void))(*(void *)(v3 + 16) + 8))(*(void *)(*(void *)(v3 + 16) + 8));
    LODWORD(p_str) = 1;
    Espresso::abstract_engine_factory::make_kernel_priv((uint64_t)v32, v3 + 16, (uint64_t)__p, (uint64_t)&v159, (int *)lpsrc);
    long long v33 = (v9_noise_kernel *)__str.__r_.__value_.__r.__words[0];
    if (__str.__r_.__value_.__r.__words[0]
    {
      long long v34 = (__shared_weak_count *)__str.__r_.__value_.__l.__size_;
      if (__str.__r_.__value_.__l.__size_) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(__str.__r_.__value_.__l.__size_ + 8), 1uLL, memory_order_relaxed);
      }
    }
    else
    {
      long long v34 = 0;
    }
    v137 = self->noise_k.__cntrl_;
    self->noise_k.__ptr_ = v33;
    self->noise_k.__cntrl_ = v34;
    if (v137) {
      nitro::nitro_function::nitro_function((std::__shared_weak_count *)v137);
    }
    if (__str.__r_.__value_.__l.__size_) {
      nitro::nitro_function::nitro_function((std::__shared_weak_count *)__str.__r_.__value_.__l.__size_);
    }
    if ((__p[23] & 0x80000000) != 0) {
      operator delete(*(void **)__p);
    }
    if (v166) {
      nitro::nitro_function::nitro_function((std::__shared_weak_count *)v166);
    }
    *(_DWORD *)__p = 0;
    memset(&__p[8], 0, 32);
    *(_OWORD *)v157 = 0u;
    long long v158 = 0u;
    *((unsigned char *)self->noise_k.__ptr_ + 376) = 0;
    v138 = (char *)operator new(0xF8uLL);
    *((void *)v138 + 1) = 0;
    *((void *)v138 + 2) = 0;
    *(void *)v138 = &unk_1EE389DF0;
    *((void *)v138 + 3) = &unk_1EE36C758;
    *(_OWORD *)(v138 + 56) = 0u;
    *(_OWORD *)(v138 + 72) = 0u;
    *(_OWORD *)(v138 + 88) = 0u;
    *(_OWORD *)(v138 + 104) = 0u;
    *(_OWORD *)(v138 + 120) = 0u;
    *(_OWORD *)(v138 + 136) = 0u;
    *(_OWORD *)(v138 + 152) = 0u;
    *(_OWORD *)(v138 + 40) = 0u;
    *(_OWORD *)(v138 + 161) = 0u;
    *((_OWORD *)v138 + 13) = 0u;
    *((_OWORD *)v138 + 14) = 0u;
    *((void *)v138 + 30) = 0;
    *(void *)&__p[8] = v138 + 24;
    *(void *)&__p[16] = v138;
    MEMORY[0x192FF0F50](v138 + 40, "noise_const");
    MEMORY[0x192FF0F50](*(void *)&__p[8] + 40, "load_constant");
    uint64_t v139 = *(void *)&__p[8];
    v141 = self->noise_k.__ptr_;
    v140 = self->noise_k.__cntrl_;
    if (v140) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)v140 + 1, 1uLL, memory_order_relaxed);
    }
    v142 = *(std::__shared_weak_count **)(v139 + 72);
    *(void *)(v139 + 64) = v141;
    *(void *)(v139 + 72) = v140;
    if (v142) {
      nitro::nitro_function::nitro_function(v142);
    }
    int v143 = (***(uint64_t (****)(void))(*(void *)(v3 + 16) + 8))(*(void *)(*(void *)(v3 + 16) + 8));
    uint64_t v144 = *(void *)&__p[8];
    *(_DWORD *)(*(void *)&__p[8] + 8) = v143;
    *(_DWORD *)(v144 + 12) = 1;
    std::string::basic_string[abi:ne180100]<0>(&__str, "noise");
    std::vector<std::string>::__assign_with_size[abi:ne180100]<std::string const*,std::string const*>((std::vector<std::string> *)&v157[1], &__str, &v171, 1uLL);
    if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__str.__r_.__value_.__l.__data_);
    }
    std::vector<std::string>::__assign_with_size[abi:ne180100]<std::string const*,std::string const*>((std::vector<std::string> *)&__p[24], 0, 0, 0);
    *(_DWORD *)__p = -1;
    LODWORD(__str.__r_.__value_.__l.__data_) = -1;
    *(_OWORD *)&__str.__r_.__value_.__r.__words[1] = *(_OWORD *)&__p[8];
    if (*(void *)&__p[16]) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&__p[16] + 8), 1uLL, memory_order_relaxed);
    }
    long long v171 = 0uLL;
    uint64_t v172 = 0;
    std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v171, *(uint64_t *)&__p[24], *(uint64_t *)&__p[32], 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)&__p[32] - *(void *)&__p[24]) >> 3));
    long long v173 = 0uLL;
    uint64_t v174 = 0;
    std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v173, (uint64_t)v157[1], v158, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v158 - (unint64_t)v157[1]) >> 3));
    v165 = 0;
    uint64_t v166 = 0;
    uint64_t v167 = 0;
    lpsrc[0] = &v165;
    LOBYTE(lpsrc[1]) = 0;
    v165 = (std::__shared_weak_count *)operator new(0x48uLL);
    uint64_t v166 = (uint64_t)v165;
    uint64_t v167 = (uint64_t)&v165[3];
    uint64_t v166 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<Espresso::net::new_layer_info>,Espresso::net::new_layer_info const*,Espresso::net::new_layer_info const*,Espresso::net::new_layer_info*>((uint64_t)&v167, (uint64_t)&__str, (uint64_t)v175, (uint64_t)v165);
    Espresso::net::insert_layers(v3, (uint64_t **)&v165);
    lpsrc[0] = &v165;
    std::vector<Espresso::net::new_layer_info>::__destroy_vector::operator()[abi:ne180100]((void ***)lpsrc);
    lpsrc[0] = &v173;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)lpsrc);
    lpsrc[0] = &v171;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)lpsrc);
    if (__str.__r_.__value_.__r.__words[2]) {
      nitro::nitro_function::nitro_function((std::__shared_weak_count *)__str.__r_.__value_.__r.__words[2]);
    }
    __str.__r_.__value_.__r.__words[0] = (std::string::size_type)&v157[1];
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__str);
    __str.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p[24];
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__str);
    if (*(void *)&__p[16]) {
      nitro::nitro_function::nitro_function(*(std::__shared_weak_count **)&__p[16]);
    }
  }
  *(_DWORD *)__p = 0;
  memset(&__p[8], 0, 32);
  *(_OWORD *)v157 = 0u;
  long long v158 = 0u;
  v165 = 0;
  uint64_t v166 = 1065353216;
  uint64_t v167 = 897988541;
  char v168 = 0;
  uint64_t v169 = 0;
  Espresso::abstract_engine_factory::shared(&p_str);
  v28 = p_str;
  std::string::basic_string[abi:ne180100]<0>(&__str, "elementwise");
  int v29 = (***(uint64_t (****)(void))(*(void *)(v3 + 16) + 8))(*(void *)(*(void *)(v3 + 16) + 8));
  unsigned int v154 = 1;
  int v155 = v29;
  Espresso::abstract_engine_factory::make_kernel_priv((uint64_t)v28, v3 + 16, (uint64_t)&__str, (uint64_t)&v165, &v155);
  if (lpsrc[0])
  {
    if (v30)
    {
      int v31 = (std::__shared_weak_count *)lpsrc[1];
      if (lpsrc[1]) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)lpsrc[1] + 1, 1uLL, memory_order_relaxed);
      }
    }
    else
    {
      int v31 = 0;
    }
  }
  else
  {
    int v31 = 0;
    float v30 = 0;
  }
  if (lpsrc[1]) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)lpsrc[1]);
  }
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
  if (v164) {
    nitro::nitro_function::nitro_function(v164);
  }
  uint64_t v35 = (char *)operator new(0xF8uLL);
  *((void *)v35 + 1) = 0;
  *((void *)v35 + 2) = 0;
  *(void *)uint64_t v35 = &unk_1EE389DF0;
  uint64_t v36 = v35 + 24;
  *((void *)v35 + 3) = &unk_1EE36C758;
  *(_OWORD *)(v35 + 40) = 0u;
  *(_OWORD *)(v35 + 56) = 0u;
  *(_OWORD *)(v35 + 72) = 0u;
  *(_OWORD *)(v35 + 88) = 0u;
  *(_OWORD *)(v35 + 104) = 0u;
  *(_OWORD *)(v35 + 120) = 0u;
  *(_OWORD *)(v35 + 136) = 0u;
  *(_OWORD *)(v35 + 152) = 0u;
  *(_OWORD *)(v35 + 161) = 0u;
  *((_OWORD *)v35 + 13) = 0u;
  *((_OWORD *)v35 + 14) = 0u;
  *((void *)v35 + 30) = 0;
  int v37 = *(std::__shared_weak_count **)&__p[16];
  *(void *)&__p[8] = v35 + 24;
  *(void *)&__p[16] = v35;
  if (v37)
  {
    nitro::nitro_function::nitro_function(v37);
    uint64_t v36 = *(char **)&__p[8];
  }
  if (v31) {
    atomic_fetch_add_explicit(&v31->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v38 = (std::__shared_weak_count *)*((void *)v36 + 9);
  *((void *)v36 + 8) = v30;
  *((void *)v36 + 9) = v31;
  if (v38) {
    nitro::nitro_function::nitro_function(v38);
  }
  MEMORY[0x192FF0F50](*(void *)&__p[8] + 16, "add_noise");
  MEMORY[0x192FF0F50](*(void *)&__p[8] + 40, "elementwise");
  int v39 = (***(uint64_t (****)(void))(*(void *)(v3 + 16) + 8))(*(void *)(*(void *)(v3 + 16) + 8));
  uint64_t v40 = *(void *)&__p[8];
  *(_DWORD *)(*(void *)&__p[8] + 8) = v39;
  *(_DWORD *)(v40 + 12) = 1;
  *(_DWORD *)__p = 0;
  std::string::basic_string[abi:ne180100]<0>(&__str, "data0");
  std::string::basic_string[abi:ne180100]<0>(&v171, "noise");
  std::vector<std::string>::__assign_with_size[abi:ne180100]<std::string const*,std::string const*>((std::vector<std::string> *)&__p[24], &__str, &v173, 2uLL);
  for (uint64_t i = 0; i != -48; i -= 24)
  {
    if (*((char *)&v172 + i + 7) < 0) {
      operator delete(*(void **)((char *)&__str + i + 24));
    }
  }
  std::string::basic_string[abi:ne180100]<0>(&__str, "data0_plus_noise");
  std::vector<std::string>::__assign_with_size[abi:ne180100]<std::string const*,std::string const*>((std::vector<std::string> *)&v157[1], &__str, &v171, 1uLL);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
  LODWORD(__str.__r_.__value_.__l.__data_) = *(_DWORD *)__p;
  *(_OWORD *)&__str.__r_.__value_.__r.__words[1] = *(_OWORD *)&__p[8];
  if (*(void *)&__p[16]) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&__p[16] + 8), 1uLL, memory_order_relaxed);
  }
  long long v171 = 0uLL;
  uint64_t v172 = 0;
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v171, *(uint64_t *)&__p[24], *(uint64_t *)&__p[32], 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)&__p[32] - *(void *)&__p[24]) >> 3));
  long long v173 = 0uLL;
  uint64_t v174 = 0;
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v173, (uint64_t)v157[1], v158, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v158 - (unint64_t)v157[1]) >> 3));
  lpsrc[0] = 0;
  lpsrc[1] = 0;
  v153 = 0;
  p_str = (long long *)lpsrc;
  LOBYTE(v164) = 0;
  lpsrc[0] = operator new(0x48uLL);
  lpsrc[1] = lpsrc[0];
  v153 = (char *)lpsrc[0] + 72;
  lpsrc[1] = (void *)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<Espresso::net::new_layer_info>,Espresso::net::new_layer_info const*,Espresso::net::new_layer_info const*,Espresso::net::new_layer_info*>((uint64_t)&v153, (uint64_t)&__str, (uint64_t)v175, (uint64_t)lpsrc[0]);
  Espresso::net::insert_layers(v3, (uint64_t **)lpsrc);
  p_str = (long long *)lpsrc;
  std::vector<Espresso::net::new_layer_info>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_str);
  p_str = &v173;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_str);
  p_str = &v171;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_str);
  if (__str.__r_.__value_.__r.__words[2]) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)__str.__r_.__value_.__r.__words[2]);
  }
  if (v31) {
    nitro::nitro_function::nitro_function(v31);
  }
  __str.__r_.__value_.__r.__words[0] = (std::string::size_type)&v157[1];
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__str);
  __str.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p[24];
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__str);
  if (*(void *)&__p[16]) {
    nitro::nitro_function::nitro_function(*(std::__shared_weak_count **)&__p[16]);
  }
  *(void *)__p = 2;
  v42 = std::__hash_table<std::__hash_value_type<unsigned long,std::vector<std::string>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<std::string>>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long &&>,std::tuple<>>(v3 + 56, 2uLL, __p);
  MEMORY[0x192FF0F50](v42[3], "data0_plus_noise");
  ptr = self->noise_k.__ptr_;
LABEL_86:
  if (ptr)
  {
    uint64_t v43 = (*(uint64_t (**)(v9_noise_kernel *))(*(void *)ptr + 384))(ptr);
    long long v44 = v159;
    *(void *)(v43 + 16) = v160;
    *(_OWORD *)uint64_t v43 = v44;
    currentNetworkPath = self->currentNetworkPath;
    if (currentNetworkPath) {
      unint64_t v46 = *((int *)currentNetworkPath + 2);
    }
    else {
      unint64_t v46 = 0;
    }
    int v50 = DWORD1(v159) * v159 * DWORD2(v159) * HIDWORD(v159);
    if (v50 <= 750000) {
      unint64_t v51 = 750000;
    }
    else {
      unint64_t v51 = v50;
    }
    if (v46 < v51)
    {
      std::allocate_shared[abi:ne180100]<Espresso::blob<float,1>,std::allocator<Espresso::blob<float,1>>,int &,int &,int &,int &,Espresso::blob<float,1>::UnitializedBlobType,void>(__p, v51, 1, 1, 1);
      uint64_t v52 = *(NSString **)__p;
      currentResolutionPreset = (std::__shared_weak_count *)self->currentResolutionPreset;
      *(_OWORD *)&self->currentNetworkPath = *(_OWORD *)__p;
      if (currentResolutionPreset)
      {
        nitro::nitro_function::nitro_function(currentResolutionPreset);
        currentNetworkPath = self->currentNetworkPath;
      }
      else
      {
        currentNetworkPath = v52;
      }
      uint64_t v54 = *((int *)currentNetworkPath + 2);
      if (v54)
      {
        int v55 = 0;
        float v56 = *(float *)&self->_anon_108[84];
        int v57 = (float *)currentNetworkPath[2];
        unsigned int v58 = 1993;
        do
        {
          if (v55)
          {
            int v55 = 0;
            float v59 = *(float *)&v52;
          }
          else
          {
            do
            {
              unsigned int v60 = 48271 * (v58 % 0xADC8);
              unsigned int v61 = 3399 * (v58 / 0xADC8);
              BOOL v62 = v60 >= v61;
              unsigned int v63 = v60 - v61;
              if (v62) {
                int v64 = 0;
              }
              else {
                int v64 = 0x7FFFFFFF;
              }
              unsigned int v65 = v64 + v63;
              float v66 = (float)(v65 - 1) * 4.6566e-10;
              unsigned int v67 = v65 / 0xADC8;
              unsigned int v68 = 48271 * (v65 % 0xADC8);
              v67 *= 3399;
              BOOL v62 = v68 >= v67;
              unsigned int v69 = v68 - v67;
              if (v62) {
                int v70 = 0;
              }
              else {
                int v70 = 0x7FFFFFFF;
              }
              unsigned int v58 = v70 + v69;
              float v71 = (float)(v66 * 2.0) + -1.0;
              float v72 = (float)((float)((float)(v70 + v69 - 1) * 4.6566e-10) * 2.0) + -1.0;
              float v73 = (float)(v72 * v72) + (float)(v71 * v71);
            }
            while (v73 > 1.0 || v73 == 0.0);
            float v74 = sqrtf((float)(logf((float)(v72 * v72) + (float)(v71 * v71)) * -2.0) / v73);
            *(float *)&uint64_t v52 = v72 * v74;
            float v59 = v71 * v74;
            int v55 = 1;
          }
          *v57++ = (float)(v59 * v56) + 0.0;
          --v54;
        }
        while (v54);
      }
    }
    v75 = (std::__shared_weak_count *)operator new(0x60uLL);
    v75->__shared_weak_owners_ = 0;
    v75->__shared_owners_ = 0;
    v75->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EE3899C8;
    v76 = (std::__shared_weak_count_vtbl *)currentNetworkPath[2];
    v75[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_1EE36BF10;
    *(_OWORD *)&v75[2].__shared_weak_owners_ = 0u;
    *(_OWORD *)&v75[3].__shared_owners_ = 0u;
    *(_OWORD *)&v75[1].__shared_owners_ = v159;
    v75[2].__vftable = v76;
    LOBYTE(v75[2].__shared_owners_) = 0;
    v77 = self->noise_k.__ptr_;
    v151[0] = v75 + 1;
    v151[1] = v75;
    atomic_fetch_add_explicit(&v75->__shared_owners_, 1uLL, memory_order_relaxed);
    Espresso::generic_load_constant_kernel::set_constant_blob(v77, (uint64_t)v151);
    nitro::nitro_function::nitro_function(v75);
    nitro::nitro_function::nitro_function(v75);
  }
  else
  {
    uint64_t v47 = *(void *)&self->_anon_108[120];
    if (v47)
    {
      uint64_t v48 = (*(uint64_t (**)(uint64_t))(*(void *)v47 + 384))(v47);
      long long v49 = v159;
      *(void *)(v48 + 16) = v160;
      *(_OWORD *)uint64_t v48 = v49;
    }
  }
  *(void *)&long long v158 = 0;
  *(_OWORD *)v157 = 0u;
  *(_OWORD *)&__p[24] = 0u;
  *(_OWORD *)__p = v159;
  *(void *)&__p[16] = 0xFFFFFFFF00000001;
  std::string::basic_string[abi:ne180100]<0>(&__str, "noise");
  v78 = std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,int>>>::find<std::string>((void *)(v3 + 136), (unsigned __int8 *)&__str);
  v79 = v78;
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__str.__r_.__value_.__l.__data_);
    if (v79) {
      goto LABEL_171;
    }
  }
  else if (v78)
  {
    goto LABEL_171;
  }
  char v80 = 0;
  uint64_t v81 = 0;
  v165 = (std::__shared_weak_count *)"noise";
  uint64_t v166 = (uint64_t)"data0_plus_noise";
  do
  {
    char v82 = v80;
    v83 = (char *)*(&v165 + v81);
    std::string::basic_string[abi:ne180100]<0>(&__str, v83);
    lpsrc[0] = &__str;
    v84 = std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)(v3 + 184), &__str, (_OWORD **)lpsrc);
    long long v85 = *(_OWORD *)&__p[16];
    *(_OWORD *)((char *)v84 + 56) = *(_OWORD *)__p;
    *(_OWORD *)((char *)v84 + 72) = v85;
    *((void *)v84 + 11) = *(void *)&__p[32];
    if ((char *)v84 + 56 != __p) {
      std::vector<unsigned int>::__assign_with_size[abi:ne180100]<unsigned int *,unsigned int *>((char *)v84 + 96, (char *)v157[0], (uint64_t)v157[1], ((char *)v157[1] - (char *)v157[0]) >> 2);
    }
    if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__str.__r_.__value_.__l.__data_);
    }
    int v86 = (***(uint64_t (****)(void))(*(void *)(v3 + 16) + 8))(*(void *)(*(void *)(v3 + 16) + 8));
    unsigned int v154 = 1;
    int v155 = v86;
    Espresso::abstract_blob_container::make(v3 + 16, &v155, &v154, lpsrc);
    std::string::basic_string[abi:ne180100]<0>(&__str, v83);
    p_str = (long long *)&__str;
    v87 = (char *)std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v3 + 136, (unsigned __int8 *)&__str, &p_str);
    long long v88 = *(_OWORD *)lpsrc;
    lpsrc[0] = 0;
    lpsrc[1] = 0;
    v89 = (std::__shared_weak_count *)*((void *)v87 + 6);
    *(_OWORD *)(v87 + 40) = v88;
    if (v89) {
      nitro::nitro_function::nitro_function(v89);
    }
    if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__str.__r_.__value_.__l.__data_);
    }
    if (lpsrc[1]) {
      nitro::nitro_function::nitro_function((std::__shared_weak_count *)lpsrc[1]);
    }
    char v80 = 1;
    uint64_t v81 = 1;
  }
  while ((v82 & 1) == 0);
  uint64_t v90 = *(void *)(v3 + 32);
  if (*(void *)(v3 + 40) != v90)
  {
    unint64_t v91 = 0;
    do
    {
      v92 = (void *)(v90 + 16 * v91);
      v94 = (void *)*v92;
      v93 = (std::__shared_weak_count *)v92[1];
      if (v93) {
        atomic_fetch_add_explicit(&v93->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      v146 = v93;
      v95 = v94 + 13;
      if (v94[14] == v94[13])
      {
        __str.__r_.__value_.__r.__words[0] = v91;
        v96 = std::__hash_table<std::__hash_value_type<unsigned long,std::vector<std::string>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<std::string>>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long &&>,std::tuple<>>(v3 + 96, v91, &__str);
        v97 = (unsigned __int8 *)v96[3];
        v98 = (unsigned __int8 *)v96[4];
        if (v97 != v98)
        {
          uint64_t v99 = v161 + 136;
          do
          {
            __str.__r_.__value_.__r.__words[0] = (std::string::size_type)v97;
            v100 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v99, v97, (long long **)&__str);
            v101 = v100;
            v102 = (void *)v94[14];
            unint64_t v103 = v94[15];
            if ((unint64_t)v102 >= v103)
            {
              uint64_t v106 = ((uint64_t)v102 - *v95) >> 4;
              unint64_t v107 = v106 + 1;
              if ((unint64_t)(v106 + 1) >> 60) {
                std::vector<std::shared_ptr<E5RT::PrecompiledComputeOpCreateOptions>>::__throw_length_error[abi:ne180100]();
              }
              uint64_t v108 = v103 - *v95;
              if (v108 >> 3 > v107) {
                unint64_t v107 = v108 >> 3;
              }
              if ((unint64_t)v108 >= 0x7FFFFFFFFFFFFFF0) {
                unint64_t v109 = 0xFFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v109 = v107;
              }
              *((void *)&v171 + 1) = v94 + 15;
              v110 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<Espresso::abstract_blob_container>>>(v109);
              v111 = &v110[16 * v106];
              __str.__r_.__value_.__r.__words[0] = (std::string::size_type)v110;
              __str.__r_.__value_.__l.__size_ = (std::string::size_type)v111;
              *(void *)&long long v171 = &v110[16 * v112];
              long long v113 = *(_OWORD *)(v101 + 40);
              *(_OWORD *)v111 = v113;
              if (*((void *)&v113 + 1)) {
                atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v113 + 1) + 8), 1uLL, memory_order_relaxed);
              }
              __str.__r_.__value_.__r.__words[2] = (std::string::size_type)(v111 + 16);
              std::vector<std::shared_ptr<Espresso::abstract_blob_container>>::__swap_out_circular_buffer(v94 + 13, &__str);
              v105 = (void *)v94[14];
              std::__split_buffer<std::shared_ptr<Espresso::abstract_blob_container>>::~__split_buffer((uint64_t)&__str);
            }
            else
            {
              void *v102 = *((void *)v100 + 5);
              uint64_t v104 = *((void *)v100 + 6);
              v102[1] = v104;
              if (v104) {
                atomic_fetch_add_explicit((atomic_ullong *volatile)(v104 + 8), 1uLL, memory_order_relaxed);
              }
              v105 = v102 + 2;
              v94[14] = v102 + 2;
            }
            v94[14] = v105;
            v97 += 24;
          }
          while (v97 != v98);
        }
      }
      v114 = v94 + 10;
      if (v94[11] == v94[10])
      {
        uint64_t v115 = v161;
        __str.__r_.__value_.__r.__words[0] = v91;
        v116 = std::__hash_table<std::__hash_value_type<unsigned long,std::vector<std::string>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<std::string>>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long &&>,std::tuple<>>(v161 + 56, v91, &__str);
        v117 = (unsigned __int8 *)v116[3];
        v118 = (unsigned __int8 *)v116[4];
        if (v117 != v118)
        {
          uint64_t v119 = v115 + 136;
          do
          {
            __str.__r_.__value_.__r.__words[0] = (std::string::size_type)v117;
            v120 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v119, v117, (long long **)&__str);
            v121 = v120;
            v122 = (void *)v94[11];
            unint64_t v123 = v94[12];
            if ((unint64_t)v122 >= v123)
            {
              uint64_t v126 = ((uint64_t)v122 - *v114) >> 4;
              unint64_t v127 = v126 + 1;
              if ((unint64_t)(v126 + 1) >> 60) {
                std::vector<std::shared_ptr<E5RT::PrecompiledComputeOpCreateOptions>>::__throw_length_error[abi:ne180100]();
              }
              uint64_t v128 = v123 - *v114;
              if (v128 >> 3 > v127) {
                unint64_t v127 = v128 >> 3;
              }
              if ((unint64_t)v128 >= 0x7FFFFFFFFFFFFFF0) {
                unint64_t v129 = 0xFFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v129 = v127;
              }
              *((void *)&v171 + 1) = v94 + 12;
              v130 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<Espresso::abstract_blob_container>>>(v129);
              v131 = &v130[16 * v126];
              __str.__r_.__value_.__r.__words[0] = (std::string::size_type)v130;
              __str.__r_.__value_.__l.__size_ = (std::string::size_type)v131;
              *(void *)&long long v171 = &v130[16 * v132];
              long long v133 = *(_OWORD *)(v121 + 40);
              *(_OWORD *)v131 = v133;
              if (*((void *)&v133 + 1)) {
                atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v133 + 1) + 8), 1uLL, memory_order_relaxed);
              }
              __str.__r_.__value_.__r.__words[2] = (std::string::size_type)(v131 + 16);
              std::vector<std::shared_ptr<Espresso::abstract_blob_container>>::__swap_out_circular_buffer(v94 + 10, &__str);
              v125 = (void *)v94[11];
              std::__split_buffer<std::shared_ptr<Espresso::abstract_blob_container>>::~__split_buffer((uint64_t)&__str);
            }
            else
            {
              void *v122 = *((void *)v120 + 5);
              uint64_t v124 = *((void *)v120 + 6);
              v122[1] = v124;
              if (v124) {
                atomic_fetch_add_explicit((atomic_ullong *volatile)(v124 + 8), 1uLL, memory_order_relaxed);
              }
              v125 = v122 + 2;
              v94[11] = v122 + 2;
            }
            v94[11] = v125;
            v117 += 24;
          }
          while (v117 != v118);
        }
      }
      if (v146) {
        nitro::nitro_function::nitro_function(v146);
      }
      ++v91;
      uint64_t v3 = v161;
      uint64_t v90 = *(void *)(v161 + 32);
    }
    while (v91 < (*(void *)(v161 + 40) - v90) >> 4);
  }
LABEL_171:
  std::string::basic_string[abi:ne180100]<0>(&__str, "noise");
  v165 = (std::__shared_weak_count *)&__str;
  uint64_t v134 = *((void *)std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v3 + 136, (unsigned __int8 *)&__str, (long long **)&v165)+ 5);
  uint64_t v149 = 0;
  v150 = 0;
  (*(void (**)(uint64_t, unsigned char *, uint64_t *))(*(void *)v134 + 16))(v134, __p, &v149);
  if (v150) {
    nitro::nitro_function::nitro_function(v150);
  }
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
  uint64_t v135 = v161;
  std::string::basic_string[abi:ne180100]<0>(&__str, "data0_plus_noise");
  v165 = (std::__shared_weak_count *)&__str;
  uint64_t v136 = *((void *)std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v135 + 136, (unsigned __int8 *)&__str, (long long **)&v165)+ 5);
  uint64_t v147 = 0;
  v148 = 0;
  (*(void (**)(uint64_t, unsigned char *, uint64_t *))(*(void *)v136 + 16))(v136, __p, &v147);
  if (v148) {
    nitro::nitro_function::nitro_function(v148);
  }
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
  if (v157[0])
  {
    v157[1] = v157[0];
    operator delete(v157[0]);
  }
  if (v162) {
    nitro::nitro_function::nitro_function(v162);
  }
}

- (int)height
{
  return *(_DWORD *)&self->is_temporal_model;
}

- (int)width
{
  return (int)self->dispatch_queue;
}

- (void)dealloc
{
  pthread_mutex_locker::pthread_mutex_locker((pthread_mutex_locker *)&v5, (_opaque_pthread_mutex_t *)a2);
  plan = self->plan;
  if (plan) {
    espresso_plan_destroy((std::string::size_type)plan);
  }
  espresso_context_destroy((void *)self->ctx);
  pthread_mutex_locker::~pthread_mutex_locker(&v5);
  v4.receiver = self;
  v4.super_class = (Class)EspressoImage2Image;
  [(EspressoImage2Image *)&v4 dealloc];
}

- (EspressoImage2Image)init
{
  v6.receiver = self;
  v6.super_class = (Class)EspressoImage2Image;
  uint64_t v2 = [(EspressoImage2Image *)&v6 init];
  uint64_t v3 = v2;
  if (v2)
  {
    objc_super v4 = [(EspressoImage2Image *)v2 setupWithQueue:0];
  }
  else
  {
    objc_super v4 = 0;
  }

  return v4;
}

- (EspressoImage2Image)initWithQueue:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EspressoImage2Image;
  uint64_t v5 = [(EspressoImage2Image *)&v9 init];
  objc_super v6 = v5;
  if (v5)
  {
    uint64_t v7 = [(EspressoImage2Image *)v5 setupWithQueue:v4];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)setupWithQueue:(id)a3
{
  id v5 = a3;
  HIDWORD(self->dim_small[4]) = 2;
  pthread_mutex_locker::pthread_mutex_locker((pthread_mutex_locker *)&v56, v6);
  if (Espresso::time_seconds(void)::onceToken != -1) {
    dispatch_once(&Espresso::time_seconds(void)::onceToken, &__block_literal_global_439);
  }
  float v7 = (double)(std::chrono::steady_clock::now().__d_.__rep_ - Espresso::time_seconds(void)::t0) * 0.000000001;
  *(float *)&self->dim_small[4] = v7;
  float v8 = (MTLCommandQueue *)dispatch_queue_create("com.apple.EspressoImage2ImageQ", 0);
  queue = self->queue;
  self->queue = v8;

  if (v5)
  {
    objc_storeStrong((id *)&self->output_layer_name.__r_.var0, a3);
    int64_t v10 = [v5 device];
    uint64_t var0 = (void *)self->output_layer_name.var0;
    self->output_layer_name.uint64_t var0 = v10;

    unsigned int v12 = default_engine;
    id v13 = *(id *)&self->output_layer_name.__r_.var0;
    context_with_args = (void *)espresso_create_context_with_args(v12, -1);
  }
  else
  {
    id v15 = MTLCreateSystemDefaultDevice();
    int v16 = (void *)self->output_layer_name.var0;
    self->output_layer_name.uint64_t var0 = (int64_t)v15;

    uint64_t v17 = [self->output_layer_name.var0 newCommandQueue];
    int v18 = *(void **)&self->output_layer_name.__r_.var0;
    *(void *)&self->output_layer_name.__r_.uint64_t var0 = v17;

    context_with_args = (void *)espresso_create_context(default_engine, -1);
  }
  self->ctx = context_with_args;
  Espresso::get_internal_context((uint64_t **)context_with_args, lpsrc);
  if (!lpsrc[0])
  {
    int v19 = 0;
    goto LABEL_11;
  }
  if (!v19)
  {
LABEL_11:
    BOOL v20 = 0;
    goto LABEL_12;
  }
  BOOL v20 = (std::__shared_weak_count *)lpsrc[1];
  if (lpsrc[1]) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)lpsrc[1] + 1, 1uLL, memory_order_relaxed);
  }
LABEL_12:
  uint64_t v21 = (std::__shared_weak_count *)lpsrc[1];
  if (lpsrc[1]) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)lpsrc[1]);
  }
  if (v19)
  {
    int v22 = v9_force_instancenorm_subsampling;
    v19[57] = 1;
    v19[58] = v22;
    char v23 = v9_optimizations_disabled_bitfield;
    if (v9_optimizations_disabled_bitfield)
    {
      int16x8_t v24 = (int16x8_t)vceqzq_s32((int32x4_t)vandq_s8((int8x16_t)vdupq_n_s32(v9_optimizations_disabled_bitfield), (int8x16_t)xmmword_192DCA330));
      *(int8x8_t *)v24.i8 = vand_s8((int8x8_t)vmovn_s32((int32x4_t)v24), (int8x8_t)0x1000100010001);
      v19[55] = vmovn_s16(v24).u32[0];
      *((unsigned char *)v19 + 224) = (v23 & 0x10) == 0;
    }
  }
  if (v20) {
    nitro::nitro_function::nitro_function(v20);
  }
  if (experimental_mode)
  {
    Espresso::get_internal_context((uint64_t **)self->ctx, lpsrc);
    int v25 = (std::__shared_weak_count *)lpsrc[1];
    *((unsigned char *)lpsrc[0] + 53) = 1;
    if (v25) {
      nitro::nitro_function::nitro_function(v25);
    }
    Espresso::get_internal_context((uint64_t **)self->ctx, lpsrc);
    uint64_t v21 = (std::__shared_weak_count *)lpsrc[1];
    *((unsigned char *)lpsrc[0] + 44) = 0;
    if (v21) {
      nitro::nitro_function::nitro_function(v21);
    }
  }
  ctx = self->ctx;
  if (ctx)
  {
    if (*ctx != 0x50FBC8A8A6F7B03CLL)
    {
      EspressoLight::very_bad_client((EspressoLight *)v21);
      __break(1u);
      return result;
    }
    uint64_t v27 = ctx[2];
    v28 = *(const void **)v27;
    int v29 = *(std::__shared_weak_count **)(v27 + 8);
    if (v29) {
      atomic_fetch_add_explicit(&v29->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    if (v28
    {
      int v31 = v30;
      if (!v29)
      {
        long long v33 = 0;
        goto LABEL_34;
      }
      atomic_fetch_add_explicit(&v29->__shared_owners_, 1uLL, memory_order_relaxed);
      long long v32 = v29;
    }
    else
    {
      long long v32 = 0;
      int v31 = 0;
      long long v33 = 0;
      if (!v29)
      {
LABEL_34:
        *((_DWORD *)v31 + 17) = 1;
        long long v34 = (Espresso::wisdom_trainer2 *)*((void *)v31 + 3);
        if ([self->output_layer_name.var0 supportsFeatureSet:11])
        {
          *((unsigned char *)v34 + 12) = 1;
          if (Espresso::Image2Image::settings_t::shared(void)::onceToken != -1) {
            dispatch_once(&Espresso::Image2Image::settings_t::shared(void)::onceToken, &__block_literal_global_20416);
          }
          uint64_t v35 = *(void *)(Espresso::Image2Image::settings_t::shared(void)::global + 32);
          if (*(char *)(Espresso::Image2Image::settings_t::shared(void)::global + 47) >= 0) {
            uint64_t v35 = *(unsigned __int8 *)(Espresso::Image2Image::settings_t::shared(void)::global + 47);
          }
          if (v35)
          {
            uint64_t v36 = Espresso::Image2Image::settings_t::shared(void)::global;
            if (*(char *)(Espresso::Image2Image::settings_t::shared(void)::global + 71) >= 0) {
              size_t v37 = *(unsigned __int8 *)(Espresso::Image2Image::settings_t::shared(void)::global + 71);
            }
            else {
              size_t v37 = *(void *)(Espresso::Image2Image::settings_t::shared(void)::global + 56);
            }
            uint64_t v38 = &v53;
            std::string::basic_string[abi:ne180100]((uint64_t)&v53, v37 + 1);
            if ((v53.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
              uint64_t v38 = (std::string *)v53.__r_.__value_.__r.__words[0];
            }
            if (v37)
            {
              if (*(char *)(v36 + 71) >= 0) {
                int v39 = (const void *)(v36 + 48);
              }
              else {
                int v39 = *(const void **)(v36 + 48);
              }
              memmove(v38, v39, v37);
            }
            *(_WORD *)((char *)&v38->__r_.__value_.__l.__data_ + v37) = 47;
            if (Espresso::Image2Image::settings_t::shared(void)::onceToken != -1) {
              dispatch_once(&Espresso::Image2Image::settings_t::shared(void)::onceToken, &__block_literal_global_20416);
            }
            int v40 = *(char *)(Espresso::Image2Image::settings_t::shared(void)::global + 47);
            if (v40 >= 0) {
              uint64_t v41 = (const std::string::value_type *)(Espresso::Image2Image::settings_t::shared(void)::global + 24);
            }
            else {
              uint64_t v41 = *(const std::string::value_type **)(Espresso::Image2Image::settings_t::shared(void)::global + 24);
            }
            if (v40 >= 0) {
              std::string::size_type v42 = *(unsigned __int8 *)(Espresso::Image2Image::settings_t::shared(void)::global + 47);
            }
            else {
              std::string::size_type v42 = *(void *)(Espresso::Image2Image::settings_t::shared(void)::global + 32);
            }
            uint64_t v43 = std::string::append(&v53, v41, v42);
            long long v44 = *(_OWORD *)&v43->__r_.__value_.__l.__data_;
            int64_t v55 = v43->__r_.__value_.__r.__words[2];
            *(_OWORD *)lpsrc = v44;
            v43->__r_.__value_.__l.__size_ = 0;
            v43->__r_.__value_.__r.__words[2] = 0;
            v43->__r_.__value_.__r.__words[0] = 0;
            if (SHIBYTE(v53.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v53.__r_.__value_.__l.__data_);
            }
            if (v55 >= 0) {
              uint64_t v45 = lpsrc;
            }
            else {
              uint64_t v45 = (void **)lpsrc[0];
            }
            Espresso::wisdom_trainer2::load(v34, (const char *)v45);
            if (experimental_mode)
            {
              int v46 = SHIBYTE(v55);
              uint64_t v47 = (void **)lpsrc[0];
              uint64_t v48 = Espresso::wisdom_trainer2::to_dict(v34);
              long long v49 = (void *)v48;
              int v50 = lpsrc;
              if (v46 < 0) {
                int v50 = v47;
              }
              NSLog(&cfstr_LoadedWisdomS.isa, v50, v48);
            }
            if (SHIBYTE(v55) < 0) {
              operator delete(lpsrc[0]);
            }
          }
          else
          {
            Espresso::wisdom_trainer2::from_dict(v34, (NSDictionary *)&unk_1EE3AF250);
          }
        }
        unint64_t v51 = self;
        if (v33) {
          nitro::nitro_function::nitro_function(v33);
        }
        goto LABEL_73;
      }
    }
    nitro::nitro_function::nitro_function(v29);
    long long v33 = v32;
    goto LABEL_34;
  }
  unint64_t v51 = 0;
LABEL_73:
  pthread_mutex_locker::~pthread_mutex_locker(&v56);

  return v51;
}

- (id)styleName
{
  p_pair1 = &self->tweaks.__tree_.__pair1_;
  if (self->current_postprocessing_settings.name.__r_.__value_.var0.__s.__data_[7] < 0) {
    p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, float>, void *>>> *)p_pair1->__value_.__left_;
  }
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%s", p_pair1);
}

- (id)getInternalDataForKey:(id)a3
{
  id v4 = a3;
  if (![v4 isEqualToString:@"averagegputime"])
  {
    float v7 = 0;
    goto LABEL_16;
  }
  Espresso::get_internal_context((uint64_t **)self->ctx, &lpsrc);
  if (lpsrc)
  {
    if (v5)
    {
      objc_super v6 = v12;
      if (v12) {
        atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      goto LABEL_9;
    }
  }
  else
  {
    id v5 = 0;
  }
  objc_super v6 = 0;
LABEL_9:
  if (v12) {
    nitro::nitro_function::nitro_function(v12);
  }
  int v8 = *((_DWORD *)v5 + 54);
  if (v8) {
    double v9 = v5[25] / (double)v8;
  }
  else {
    double v9 = 0.0;
  }
  v5[25] = 0.0;
  v5[26] = 0.0;
  *((_DWORD *)v5 + 54) = 0;
  float v7 = [NSNumber numberWithDouble:v9];
  if (v6) {
    nitro::nitro_function::nitro_function(v6);
  }
LABEL_16:

  return v7;
}

- ($C4732ECC957FA13B9B3DF4A51A95735B)getEspressoNetwork
{
  uint64_t v2 = *(void *)&self->net.network_index;
  plan = self->net.plan;
  result.uint64_t var1 = v2;
  result.uint64_t var0 = plan;
  return result;
}

+ (void)tuneNetworksWGWindowSize:(id)a3
{
  void (***v9)(void **__return_ptr, void *);
  uint64_t v10;
  id v11;
  uint64_t v12;
  int v13;
  void *v14;
  std::__shared_weak_count *v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  const void *v20;
  void *v21;
  std::__shared_weak_count *v22;
  uint64_t v23;
  long long v24;
  long long v25;
  long long v26;
  long long v27;
  long long v28;
  long long v29;
  long long v30;
  long long v31;
  char *v32;
  char *v33;
  unsigned char *v34;
  uint64_t v35;
  int v36;
  float v37;
  float v38;
  int v39;
  std::__shared_weak_count *v40;
  uint64_t v41;
  void *v42;
  int v43;
  id obj;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  int v50;
  void *context;
  std::__shared_weak_count *v52;
  id v53;
  _OWORD v54[2];
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  std::__shared_weak_count *v60;
  uint64_t v61;
  std::__shared_weak_count *v62;
  std::string *v63;
  std::string *v64;
  std::string *v65;
  std::string *v66;
  std::string *v67;
  std::string *v68;
  void *v69;
  std::__shared_weak_count *v70;
  char v71;
  void *v72;
  std::__shared_weak_count *v73;
  char v74;
  uint64_t v75;
  std::__shared_weak_count *v76;
  uint64_t v77[2];
  uint64_t v78[2];
  long long v79;
  void *v80[7];
  char v81;
  std::__shared_weak_count *v82;
  std::__shared_weak_count *v83;
  std::__shared_weak_count *v84;
  uint64_t v85;
  unint64_t v86;
  int v87;
  void *__p;
  void *v89;
  _OWORD v90[2];
  uint64_t v91;
  void *v92;
  unsigned char *v93;
  _OWORD v94[2];
  long long v95;
  long long v96;
  long long v97;
  long long v98;
  long long v99;
  long long v100;
  long long v101;
  long long v102;
  uint64_t v103;
  long long v104;
  long long v105;
  long long v106;
  long long v107;
  long long v108;
  std::string **v109;
  char v110;
  void *v111[2];
  char v112;
  void *v113[2];
  char v114;
  long long v115;
  unsigned char v116[128];
  uint64_t v117;

  v117 = *MEMORY[0x1E4F143B8];
  v105 = 0u;
  uint64_t v106 = 0u;
  unint64_t v107 = 0u;
  uint64_t v108 = 0u;
  obj = a3;
  uint64_t v3 = [obj countByEnumeratingWithState:&v105 objects:v116 count:16];
  if (v3)
  {
    int v46 = *(void *)v106;
    do
    {
      uint64_t v4 = 0;
      uint64_t v47 = v3;
      do
      {
        if (*(void *)v106 != v46) {
          objc_enumerationMutation(obj);
        }
        std::string v53 = *(id *)(*((void *)&v105 + 1) + 8 * v4);
        context = (void *)MEMORY[0x192FF2020]();
        uint64_t v5 = [v53 getEspressoNetwork];
        Espresso::get_internal_network(v5, v6, (uint64_t)&v104);
        uint64_t v7 = v104;
        int v8 = *(const void **)(v104 + 16);
        if (v8)
        {
          if (v9 && (int64_t v10 = *(void *)(v7 + 24)) != 0)
          {
            uint64_t v52 = *(std::__shared_weak_count **)(v7 + 24);
            atomic_fetch_add_explicit((atomic_ullong *volatile)(v10 + 8), 1uLL, memory_order_relaxed);
          }
          else
          {
            uint64_t v52 = 0;
          }
        }
        else
        {
          uint64_t v52 = 0;
          double v9 = 0;
        }
        int v50 = *((_DWORD *)v9 + 57);
        *((_DWORD *)v9 + 57) = -1;
        [v53 reload];
        [v53 reshapeToResolutionPreset:2];
        float v11 = [v53 styleName];
        printf("WG-tuning %s %d %d\n", (const char *)[v11 UTF8String], objc_msgSend(v53, "width"), objc_msgSend(v53, "height"));

        unsigned int v12 = [v53 getEspressoNetwork];
        long long v49 = v4;
        Espresso::get_internal_network(v12, v13, (uint64_t)&v79);
        int v14 = (void *)v79;
        id v15 = (std::__shared_weak_count *)*((void *)&v104 + 1);
        uint64_t v104 = v79;
        if (v15)
        {
          uint64_t v48 = (void *)v79;
          nitro::nitro_function::nitro_function(v15);
          int v14 = v48;
        }
        int v16 = v14;
        uint64_t v17 = v14[4];
        if (v14[5] != v17)
        {
          int v18 = 0;
          while (1)
          {
            int v19 = *(void *)(v17 + 16 * v18);
            BOOL v20 = *(const void **)(v19 + 64);
            if (v20)
            {
              if (v21) {
                break;
              }
            }
LABEL_30:
            ++v18;
            uint64_t v17 = v16[4];
            if (v18 >= (v16[5] - v17) >> 4) {
              goto LABEL_84;
            }
          }
          int v22 = *(std::__shared_weak_count **)(v19 + 72);
          if (v22) {
            atomic_fetch_add_explicit(&v22->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          char v23 = (*(uint64_t (**)(void *))(*(void *)v21 + 384))(v21);
          int16x8_t v24 = *(_OWORD *)v23;
          int v25 = *(_OWORD *)(v23 + 32);
          v94[1] = *(_OWORD *)(v23 + 16);
          v95 = v25;
          v94[0] = v24;
          uint64_t v26 = *(_OWORD *)(v23 + 48);
          uint64_t v27 = *(_OWORD *)(v23 + 64);
          v28 = *(_OWORD *)(v23 + 96);
          v98 = *(_OWORD *)(v23 + 80);
          uint64_t v99 = v28;
          v96 = v26;
          v97 = v27;
          int v29 = *(_OWORD *)(v23 + 112);
          float v30 = *(_OWORD *)(v23 + 128);
          int v31 = *(_OWORD *)(v23 + 144);
          unint64_t v103 = *(void *)(v23 + 160);
          v101 = v30;
          v102 = v31;
          v100 = v29;
          int v86 = v18;
          *(void *)&v79 = std::__hash_table<std::__hash_value_type<unsigned long,std::vector<std::string>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<std::string>>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long &&>,std::tuple<>>((uint64_t)(v16 + 7), v18, &v86)[3];
          long long v32 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)(v16 + 17), (unsigned __int8 *)v79, (long long **)&v79);
          Espresso::abstract_blob_container::shape((char *)v90, *((void *)v32 + 5));
          int v16 = (void *)v104;
          float v72 = (void *)v18;
          *(void *)&v79 = std::__hash_table<std::__hash_value_type<unsigned long,std::vector<std::string>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<std::string>>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long &&>,std::tuple<>>(v104 + 96, v18, &v72)[3];
          long long v33 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)(v16 + 17), (unsigned __int8 *)v79, (long long **)&v79);
          Espresso::abstract_blob_container::shape((char *)&v86, *((void *)v33 + 5));
          if (WORD6(v98) == 1 && HIWORD(v98) == 1 && (void)v96 == 0x300000003 && v87 >= 5)
          {
            printf("\tilayer=%d (%d %d %d -> %d %d %d) C=%d\n", v18, LODWORD(v90[0]), DWORD1(v90[0]), DWORD2(v90[0]), v86, HIDWORD(v86), v87, DWORD2(v95));
            uint64_t v35 = 0;
            uint64_t v36 = 0;
            uint64_t v115 = xmmword_192DCA340;
            size_t v37 = 0.0;
            uint64_t v38 = -1.0;
            do
            {
              int v39 = *(_DWORD *)&v116[4 * v35 - 16];
              *((_DWORD *)v9 + 57) = v39;
              DWORD1(v102) = v39;
              int v40 = (std::__shared_weak_count *)v16[3];
              v78[0] = v16[2];
              v78[1] = (uint64_t)v40;
              if (v40) {
                atomic_fetch_add_explicit(&v40->__shared_owners_, 1uLL, memory_order_relaxed);
              }
              v77[0] = 0;
              v77[1] = 0;
              Espresso::sequential_builder::sequential_builder((uint64_t)&v79, v78, 1, v77);
              if (v40) {
                nitro::nitro_function::nitro_function(v40);
              }
              std::string::basic_string[abi:ne180100]<0>(&v72, "convolution");
              std::string::basic_string[abi:ne180100]<0>(&v69, "conv");
              std::string::basic_string[abi:ne180100]<0>(v113, "data");
              float v66 = 0;
              unsigned int v67 = 0;
              unsigned int v68 = 0;
              v111[0] = &v66;
              LOBYTE(v111[1]) = 0;
              float v66 = (std::string *)operator new(0x18uLL);
              unsigned int v67 = v66;
              unsigned int v68 = v66 + 1;
              unsigned int v67 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v68, (long long *)v113, &v115, v66);
              std::string::basic_string[abi:ne180100]<0>(v111, "conv");
              unsigned int v63 = 0;
              int v64 = 0;
              unsigned int v65 = 0;
              unint64_t v109 = &v63;
              v110 = 0;
              unsigned int v63 = (std::string *)operator new(0x18uLL);
              int v64 = v63;
              unsigned int v65 = v63 + 1;
              int v64 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v65, (long long *)v111, (long long *)v113, v63);
              Espresso::sequential_builder::add_t<Espresso::generic_convolution_kernel,Espresso::convolution_uniforms>(&v75, (uint64_t *)&v79, (uint64_t)&v72, (uint64_t)&v69, (uint64_t)v94, (uint64_t *)&v66, (uint64_t *)&v63);
              unint64_t v109 = &v63;
              std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v109);
              if (v112 < 0) {
                operator delete(v111[0]);
              }
              v111[0] = &v66;
              std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v111);
              if (v114 < 0) {
                operator delete(v113[0]);
              }
              if (v71 < 0) {
                operator delete(v69);
              }
              if (v74 < 0) {
                operator delete(v72);
              }
              uint64_t v41 = v75;
              (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(void *)v75 + 472))(&v61, v75);
              (*(void (**)(uint64_t, uint64_t *))(*(void *)v41 + 400))(v41, &v61);
              if (v62) {
                nitro::nitro_function::nitro_function(v62);
              }
              (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(void *)v41 + 488))(&v59, v41);
              (*(void (**)(uint64_t, uint64_t *))(*(void *)v41 + 392))(v41, &v59);
              if (v60) {
                nitro::nitro_function::nitro_function(v60);
              }
              v54[0] = v90[0];
              v54[1] = v90[1];
              int64_t v55 = v91;
              int v57 = 0;
              unsigned int v58 = 0;
              float v56 = 0;
              std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(&v56, v92, (uint64_t)v93, (v93 - (unsigned char *)v92) >> 2);
              Espresso::sequential_builder::build_from_data_shape((uint64_t)&v79, (char *)v54, &v72);
              if (v56)
              {
                int v57 = v56;
                operator delete(v56);
              }
              (**v9)(&v69, v9);
              std::string::size_type v42 = v72;
              Espresso::net::__forward((uint64_t)v72, &v69, 0, 0xFFFFFFFFLL);
              (*(void (**)(void *))(*(void *)v69 + 24))(v69);
              (**v9)(v113, v9);
              uint64_t v43 = 32;
              do
              {
                Espresso::net::__forward((uint64_t)v42, v113, 0, 0xFFFFFFFFLL);
                --v43;
              }
              while (v43);
              (*(void (**)(void *))(*(void *)v113[0] + 24))(v113[0]);
              if (v39 == -1)
              {
                size_t v37 = (float)(*((float *)v113[0] + 14) * 0.03125) * 1000.0;
              }
              else if ((float)((float)(*((float *)v113[0] + 14) * 0.03125) * 1000.0) < v38 || v36 == 0)
              {
                uint64_t v36 = v39;
                uint64_t v38 = (float)(*((float *)v113[0] + 14) * 0.03125) * 1000.0;
              }
              if (v113[1]) {
                nitro::nitro_function::nitro_function((std::__shared_weak_count *)v113[1]);
              }
              if (v70) {
                nitro::nitro_function::nitro_function(v70);
              }
              if (v73) {
                nitro::nitro_function::nitro_function(v73);
              }
              if (v76) {
                nitro::nitro_function::nitro_function(v76);
              }
              std::deque<std::pair<std::shared_ptr<Espresso::abstract_context>,Espresso::compute_path>>::~deque[abi:ne180100]((uint64_t)&v85);
              if (v84) {
                nitro::nitro_function::nitro_function(v84);
              }
              if (v83) {
                nitro::nitro_function::nitro_function(v83);
              }
              if (v82) {
                nitro::nitro_function::nitro_function(v82);
              }
              if (v81 < 0) {
                operator delete(v80[5]);
              }
              std::__tree<std::__value_type<Espresso::AOT::BackendIdentifier,double>,std::__map_value_compare<Espresso::AOT::BackendIdentifier,std::__value_type<Espresso::AOT::BackendIdentifier,double>,std::less<Espresso::AOT::BackendIdentifier>,true>,std::allocator<std::__value_type<Espresso::AOT::BackendIdentifier,double>>>::destroy((uint64_t)v80, v80[1]);
              if (*((void *)&v79 + 1)) {
                nitro::nitro_function::nitro_function(*((std::__shared_weak_count **)&v79 + 1));
              }
              ++v35;
            }
            while (v35 != 4);
            printf("\tilayer=%d wg=%d dt=%.4f speedup=%.2f (%d %d %d -> %d %d %d)\n", v18, v36, v38, (float)(v37 / v38), LODWORD(v90[0]), DWORD1(v90[0]), DWORD2(v90[0]), v86, HIDWORD(v86), v87);
            if (__p)
            {
              v89 = __p;
              operator delete(__p);
            }
            long long v34 = v92;
            uint64_t v3 = v47;
            if (v92)
            {
LABEL_27:
              v93 = v34;
              operator delete(v34);
            }
          }
          else
          {
            if (__p)
            {
              v89 = __p;
              operator delete(__p);
            }
            long long v34 = v92;
            if (v92) {
              goto LABEL_27;
            }
          }
          if (v22) {
            nitro::nitro_function::nitro_function(v22);
          }
          goto LABEL_30;
        }
LABEL_84:
        *((_DWORD *)v9 + 57) = v50;
        if (v52) {
          nitro::nitro_function::nitro_function(v52);
        }
        if (*((void *)&v104 + 1)) {
          nitro::nitro_function::nitro_function(*((std::__shared_weak_count **)&v104 + 1));
        }

        uint64_t v4 = v49 + 1;
      }
      while (v49 + 1 != v3);
      uint64_t v3 = [obj countByEnumeratingWithState:&v105 objects:v116 count:16];
    }
    while (v3);
  }
}

+ (void)tuneNetworks:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  std::string::basic_string[abi:ne180100]<0>(&__p, "");
  Espresso::wisdom_trainer2::wisdom_trainer2((uint64_t)v23, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  uint64_t v3 = 0;
  long long v32 = xmmword_192DCA340;
  do
  {
    uint64_t v14 = v3;
    int v4 = *((_DWORD *)&v32 + v3);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    obuint64_t j = v13;
    uint64_t v17 = [obj countByEnumeratingWithState:&v18 objects:v31 count:16];
    if (v17)
    {
      uint64_t v16 = *(void *)v19;
      float v5 = (float)v4;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v19 != v16) {
            objc_enumerationMutation(obj);
          }
          id v7 = *(id *)(*((void *)&v18 + 1) + 8 * i);
          int v8 = (void *)MEMORY[0x192FF2020]();
          for (uint64_t j = 0; j != 7; ++j)
          {
            uint64_t v10 = qword_192DCD678[j];
            [v7 reshapeToResolutionPreset:v10];
            float v11 = [v7 styleName];
            NSLog(&cfstr_TuningDDXD.isa, v11, v10, [v7 width], objc_msgSend(v7, "height"));

            *(float *)&double v12 = v5;
            [v7 tweak:@"winograd" value:v12];
            [v7 tune];
            [v7 aggregateWisdom:v23];
          }
        }
        uint64_t v17 = [obj countByEnumeratingWithState:&v18 objects:v31 count:16];
      }
      while (v17);
    }

    uint64_t v3 = v14 + 1;
  }
  while (v14 != 3);
  if (v29)
  {
    float v30 = v29;
    operator delete(v29);
  }
  std::__tree<std::__value_type<std::string,std::vector<int>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<int>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<int>>>>::destroy(v28);
  if (v27 < 0) {
    operator delete(v26);
  }
  if (v25 < 0) {
    operator delete(v24);
  }
}

+ (void)gpuSync:(id)a3 tex:(id)a4
{
  id v4 = a3;
  [v4 commit];
  [v4 waitUntilCompleted];
}

+ (int)featureVersion
{
  return 1;
}

+ (id)getStylesKeys
{
  uint64_t v2 = objc_opt_new();
  if (Espresso::Image2Image::settings_t::shared(void)::onceToken != -1) {
    dispatch_once(&Espresso::Image2Image::settings_t::shared(void)::onceToken, &__block_literal_global_20416);
  }
  uint64_t v3 = Espresso::Image2Image::settings_t::shared(void)::global + 8;
  id v4 = *(void **)Espresso::Image2Image::settings_t::shared(void)::global;
  if (*(void *)Espresso::Image2Image::settings_t::shared(void)::global != Espresso::Image2Image::settings_t::shared(void)::global
                                                                           + 8)
  {
    do
    {
      if (*((char *)v4 + 55) < 0) {
        std::string::__init_copy_ctor_external(&v14, (const std::string::value_type *)v4[4], v4[5]);
      }
      else {
        std::string v14 = *(std::string *)(v4 + 4);
      }
      if (*((char *)v4 + 79) < 0) {
        std::string::__init_copy_ctor_external(&v15, (const std::string::value_type *)v4[7], v4[8]);
      }
      else {
        std::string v15 = *(std::string *)(v4 + 7);
      }
      if (*((char *)v4 + 103) < 0) {
        std::string::__init_copy_ctor_external(&__p, (const std::string::value_type *)v4[10], v4[11]);
      }
      else {
        std::string __p = *(std::string *)(v4 + 10);
      }
      long long v5 = *(_OWORD *)(v4 + 23);
      long long v21 = *(_OWORD *)(v4 + 21);
      long long v22 = v5;
      v23[0] = *(_OWORD *)(v4 + 25);
      *(_OWORD *)((char *)v23 + 13) = *(_OWORD *)((char *)v4 + 213);
      long long v6 = *(_OWORD *)(v4 + 15);
      long long v17 = *(_OWORD *)(v4 + 13);
      long long v18 = v6;
      long long v7 = *(_OWORD *)(v4 + 19);
      long long v19 = *(_OWORD *)(v4 + 17);
      long long v20 = v7;
      if ((v14.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        int v8 = &v14;
      }
      else {
        int v8 = (std::string *)v14.__r_.__value_.__r.__words[0];
      }
      double v9 = objc_msgSend(NSString, "stringWithUTF8String:", v8, *(_OWORD *)&v14.__r_.__value_.__l.__data_, v14.__r_.__value_.__r.__words[2]);
      [v2 addObject:v9];

      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v15.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v14.__r_.__value_.__l.__data_);
      }
      uint64_t v10 = (void *)v4[1];
      if (v10)
      {
        do
        {
          float v11 = v10;
          uint64_t v10 = (void *)*v10;
        }
        while (v10);
      }
      else
      {
        do
        {
          float v11 = (void *)v4[2];
          BOOL v12 = *v11 == (void)v4;
          id v4 = v11;
        }
        while (!v12);
      }
      id v4 = v11;
    }
    while (v11 != (void *)v3);
  }

  return v2;
}

+ (BOOL)loadStylesConfigAtDefaultsKey:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  long long v5 = [v4 persistentDomainForName:*MEMORY[0x1E4F283E0]];

  long long v6 = [v5 objectForKeyedSubscript:v3];
  if (Espresso::Image2Image::settings_t::shared(void)::onceToken != -1) {
    dispatch_once(&Espresso::Image2Image::settings_t::shared(void)::onceToken, &__block_literal_global_20416);
  }
  Espresso::Image2Image::settings_t::load_style_settings_from_dict((uint64_t **)Espresso::Image2Image::settings_t::shared(void)::global, v6);

  return 1;
}

+ (BOOL)loadStylesConfigAtPath:(id)a3
{
  id v4 = a3;
  objc_storeStrong((id *)&plistPath, a3);
  long long v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v4];
  if (Espresso::Image2Image::settings_t::shared(void)::onceToken != -1) {
    dispatch_once(&Espresso::Image2Image::settings_t::shared(void)::onceToken, &__block_literal_global_20416);
  }
  Espresso::Image2Image::settings_t::load_style_settings_from_dict((uint64_t **)Espresso::Image2Image::settings_t::shared(void)::global, v5);
  id v6 = [v4 stringByDeletingLastPathComponent];
  uint64_t v7 = [v6 UTF8String];
  if (Espresso::Image2Image::settings_t::shared(void)::onceToken != -1) {
    dispatch_once(&Espresso::Image2Image::settings_t::shared(void)::onceToken, &__block_literal_global_20416);
  }
  MEMORY[0x192FF0F50](Espresso::Image2Image::settings_t::shared(void)::global + 48, v7);

  return 1;
}

+ (void)setDefaultOption:(id)a3 toValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  pthread_mutex_locker::pthread_mutex_locker((pthread_mutex_locker *)&v10, v8);
  if ([v6 isEqualToString:@"engine"])
  {
    default_engine = [v7 intValue];
  }
  else if ([v6 isEqualToString:@"experimental_mode"])
  {
    experimental_mode = [v7 intValue];
  }
  else if (([v6 isEqualToString:@"settings"] & 1) != 0 {
         || [v6 isEqualToString:@"config"])
  }
  {
    double v9 = [v7 stringValue];
    [a1 loadStylesConfigAtPath:v9];
  }
  else if ([v6 isEqualToString:@"v9_optimizations_disabled_bitfield"])
  {
    v9_optimizations_disabled_bitfield = [v7 unsignedIntValue];
  }
  else if ([v6 isEqualToString:@"v9_force_instancenorm_subsampling"])
  {
    v9_force_instancenorm_subsampling = [v7 intValue];
  }
  pthread_mutex_locker::~pthread_mutex_locker(&v10);
}

@end