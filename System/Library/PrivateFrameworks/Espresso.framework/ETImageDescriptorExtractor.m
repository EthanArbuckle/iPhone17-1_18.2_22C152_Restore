@interface ETImageDescriptorExtractor
+ (id)VisionSceneNet_iOS10_Extractor;
+ (id)VisionSmartCamNet_iOS11_Extractor;
+ (id)inception_v3_Extractor;
+ (id)passthroughExtractor;
- (ETImageDescriptorExtractor)initWithNetwork:(id)a3;
- (float)brightness_range;
- (float)contrast_range;
- (float)extractDescriptorForDataPoint:(vImage_Buffer *)a3 freeWhenDone:(BOOL)a4;
- (float)horizontal_flip;
- (float)rotation_range;
- (float)shear_range;
- (float)zoom_range;
- (id).cxx_construct;
- (int)doBatchnormTuning;
- (int)nAugmentations;
- (int)numberOfChannels;
- (unint64_t)descriptors_file_cache_size;
- (unint64_t)descriptors_mem_cache_size;
- (void)extractForDataPoint:(id)a3;
- (void)setBrightness_range:(float)a3;
- (void)setContrast_range:(float)a3;
- (void)setDescriptors_file_cache_size:(unint64_t)a3;
- (void)setDescriptors_mem_cache_size:(unint64_t)a3;
- (void)setDoBatchnormTuning:(int)a3;
- (void)setHorizontal_flip:(float)a3;
- (void)setNAugmentations:(int)a3;
- (void)setRotation_range:(float)a3;
- (void)setShear_range:(float)a3;
- (void)setZoom_range:(float)a3;
@end

@implementation ETImageDescriptorExtractor

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 392) = 0uLL;
  *((void *)self + 51) = 0;
  return self;
}

- (void).cxx_destruct
{
  if (*((char *)&self->_inputName.__r_.__value_.var0.__l + 23) < 0) {
    operator delete(self->_inputName.__r_.__value_.var0.__l.__data_);
  }
}

- (void)setDescriptors_file_cache_size:(unint64_t)a3
{
  *(void *)&self->_nAugmentations = a3;
}

- (unint64_t)descriptors_file_cache_size
{
  return *(void *)&self->_nAugmentations;
}

- (void)setDescriptors_mem_cache_size:(unint64_t)a3
{
  *(void *)&self->_contrast_range = a3;
}

- (unint64_t)descriptors_mem_cache_size
{
  return *(void *)&self->_contrast_range;
}

- (void)setDoBatchnormTuning:(int)a3
{
  LODWORD(self->_shear_range) = a3;
}

- (int)doBatchnormTuning
{
  return LODWORD(self->_shear_range);
}

- (void)setNAugmentations:(int)a3
{
  LODWORD(self->_zoom_range) = a3;
}

- (int)nAugmentations
{
  return LODWORD(self->_zoom_range);
}

- (void)setBrightness_range:(float)a3
{
  self->_horizontal_flip = a3;
}

- (float)brightness_range
{
  return self->_horizontal_flip;
}

- (void)setContrast_range:(float)a3
{
  self->_rotation_range = a3;
}

- (float)contrast_range
{
  return self->_rotation_range;
}

- (void)setShear_range:(float)a3
{
  *((float *)&self->_inputShape + 1) = a3;
}

- (float)shear_range
{
  return *((float *)&self->_inputShape + 1);
}

- (void)setZoom_range:(float)a3
{
  *(float *)&self->_inputShape = a3;
}

- (float)zoom_range
{
  return *(float *)&self->_inputShape;
}

- (void)setHorizontal_flip:(float)a3
{
  *((float *)&self->_inputName.var0 + 1) = a3;
}

- (float)horizontal_flip
{
  return *((float *)&self->_inputName.var0 + 1);
}

- (void)setRotation_range:(float)a3
{
  *(float *)&self->_inputName.var0 = a3;
}

- (float)rotation_range
{
  return *(float *)&self->_inputName.var0;
}

- (int)numberOfChannels
{
  return self->_outputBlob.channels;
}

- (float)extractDescriptorForDataPoint:(vImage_Buffer *)a3 freeWhenDone:(BOOL)a4
{
  BOOL v4 = a4;
  vImagePixelCount width = a3->width;
  size_t rowBytes = a3->rowBytes;
  vImagePixelCount height = a3->height;
  if (width >= height) {
    vImagePixelCount v10 = a3->height;
  }
  else {
    vImagePixelCount v10 = a3->width;
  }
  size_t v11 = rowBytes / width;
  src.data = (char *)a3->data
           + ((height >> 1) - (v10 >> 1)) * rowBytes
           + ((width >> 1) - (v10 >> 1)) * (rowBytes / width);
  src.vImagePixelCount height = v10;
  src.vImagePixelCount width = v10;
  src.size_t rowBytes = rowBytes;
  p_targetWidth = &self->_targetWidth;
  dest.data = malloc_type_malloc(self->_targetWidth * (rowBytes / width) * self->_targetHeight, 0x90CA98F9uLL);
  int8x16_t v13 = *(int8x16_t *)p_targetWidth;
  *(int8x16_t *)&dest.vImagePixelCount height = vextq_s8(v13, v13, 8uLL);
  dest.size_t rowBytes = v13.i64[0] * v11;
  vImageScale_ARGB8888(&src, &dest, 0, 0);
  plan = (uint64_t *)self->_net.plan;
  uint64_t v15 = *(void *)&self->_net.network_index;
  p_inputName = &self->_inputName;
  if (*((char *)&self->_inputName.__r_.__value_.var0.__l + 23) < 0) {
    p_inputName = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)p_inputName->__r_.__value_.var0.__l.__data_;
  }
  vImage_Buffer v20 = dest;
  espresso_network_bind_input_vimagebuffer_bgra8(plan, v15, (uint64_t)p_inputName, 0, (uint64_t)&v20, 0);
  espresso_plan_execute_sync((uint64_t *)self->_plan);
  size_t v17 = 4 * self->_outputBlob.stride_sequence_length;
  v18 = malloc_type_malloc(v17, 0xE1AE1AC3uLL);
  memcpy(v18, self->_outputBlob.data, v17);
  if (v4) {
    free(a3->data);
  }
  free(dest.data);
  return (float *)v18;
}

- (void)extractForDataPoint:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__ETImageDescriptorExtractor_extractForDataPoint___block_invoke;
  v6[3] = &unk_1E57474D8;
  id v7 = v4;
  v8 = self;
  id v5 = v4;
  [v5 iterateBuffersByKey:v6];
}

void __50__ETImageDescriptorExtractor_extractForDataPoint___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  long long v8 = 0u;
  long long v9 = 0u;
  id v5 = *(void **)(a1 + 32);
  if (v5) {
    [v5 imageWithKey:v4];
  }
  v6 = *(void **)(a1 + 40);
  v7[0] = v8;
  v7[1] = v9;
  objc_msgSend(*(id *)(a1 + 32), "setData:size:forKey:freeWhenDone:", objc_msgSend(v6, "extractDescriptorForDataPoint:freeWhenDone:", v7, 0), *(void *)(*(void *)(a1 + 40) + 360), v4, 0);
}

- (ETImageDescriptorExtractor)initWithNetwork:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)ETImageDescriptorExtractor;
  id v5 = [(ETImageDescriptorExtractor *)&v51 init];
  if (!v5) {
    goto LABEL_57;
  }
  context = (void *)espresso_create_context(5u, -1);
  *((void *)v5 + 4) = context;
  plan = (unsigned char *)espresso_create_plan(context, 0);
  *((void *)v5 + 1) = plan;
  if (espresso_plan_add_network(plan, (char *)[v4 UTF8String], 65552, (uint64_t)(v5 + 16)))
  {
    espresso_plan_get_error_info(*((void *)v5 + 1));
    NSLog(&cfstr_S_0.isa, v8);
  }
  Espresso::get_internal_network(*((void *)v5 + 2), *((void *)v5 + 3), (uint64_t)&v49);
  uint64_t v9 = v49;
  uint64_t v11 = *(void *)(v49 + 32);
  uint64_t v10 = *(void *)(v49 + 40);
  *(void *)buf = 0;
  v12 = std::__hash_table<std::__hash_value_type<unsigned long,std::vector<std::string>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<std::string>>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long &&>,std::tuple<>>(v49 + 56, 0, buf);
  int8x16_t v13 = (char **)(v5 + 392);
  std::string::operator=((std::string *)(v5 + 392), (const std::string *)v12[3]);
  int v14 = ((unint64_t)(v10 - v11) >> 4) - 1;
  uint64_t v15 = *(void *)(v9 + 32);
  uint64_t v16 = (*(void *)(v9 + 40) - v15) >> 4;
  if ((int)v16 >= 3)
  {
    uint64_t v17 = (v16 - 1);
    uint64_t v18 = *(void *)(v15 + 16 * v17);
    v19 = *(const void **)(v18 + 64);
    if (v19)
    {
      if (v20)
      {
        v21 = *(std::__shared_weak_count **)(v18 + 72);
        if (v21)
        {
          atomic_fetch_add_explicit(&v21->__shared_owners_, 1uLL, memory_order_relaxed);
          uint64_t v15 = *(void *)(v9 + 32);
        }
LABEL_11:
        uint64_t v22 = *(void *)(v15 + 16 * (v16 - 2));
        v23 = *(void **)(v22 + 64);
        if (v23
        {
          v24 = *(std::__shared_weak_count **)(v22 + 72);
          if (v24) {
            atomic_fetch_add_explicit(&v24->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          if (v20) {
            goto LABEL_16;
          }
        }
        else
        {
          v24 = 0;
          if (v20)
          {
LABEL_16:
            if (v23) {
              int v25 = -3;
            }
            else {
              int v25 = -2;
            }
            int v14 = v25 + ((*(void *)(v9 + 40) - *(void *)(v9 + 32)) >> 4);
LABEL_22:
            if (v24) {
              nitro::nitro_function::nitro_function(v24);
            }
            if (v21) {
              nitro::nitro_function::nitro_function(v21);
            }
            goto LABEL_26;
          }
        }
        if (!v23)
        {
          uint64_t v44 = *(void *)(v9 + 32);
          uint64_t v45 = *(void *)(v44 + 16 * v17);
          v46 = *(const void **)(v45 + 64);
          if (v46)
          {
            {
              v47 = *(std::__shared_weak_count **)(v45 + 72);
              if (v47)
              {
                atomic_fetch_add_explicit(&v47->__shared_owners_, 1uLL, memory_order_relaxed);
                nitro::nitro_function::nitro_function(v47);
                uint64_t v44 = *(void *)(v9 + 32);
              }
              int v14 = ((unint64_t)(*(void *)(v9 + 40) - v44) >> 4) - 2;
            }
          }
        }
        goto LABEL_22;
      }
    }
    else
    {
      vImage_Buffer v20 = 0;
    }
    v21 = 0;
    goto LABEL_11;
  }
LABEL_26:
  *(void *)buf = v14;
  v26 = (long long *)std::__hash_table<std::__hash_value_type<unsigned long,std::vector<std::string>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<std::string>>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long &&>,std::tuple<>>(v9 + 96, v14, buf)[3];
  if (*((char *)v26 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&v48, *(const std::string::value_type **)v26, *((void *)v26 + 1));
  }
  else
  {
    long long v27 = *v26;
    v48.__r_.__value_.__r.__words[2] = *((void *)v26 + 2);
    *(_OWORD *)&v48.__r_.__value_.__l.__data_ = v27;
  }
  v28 = v5 + 392;
  if (v5[415] < 0) {
    v28 = *v13;
  }
  if (espresso_network_declare_input(*((EspressoLight::espresso_plan **)v5 + 2), *((void *)v5 + 3), v28))
  {
    espresso_plan_get_error_info(*((void *)v5 + 1));
    NSLog(&cfstr_S_0.isa, v29);
  }
  if ((v48.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v30 = &v48;
  }
  else {
    v30 = (std::string *)v48.__r_.__value_.__r.__words[0];
  }
  if (espresso_network_declare_output(*((EspressoLight::espresso_plan **)v5 + 2), *((void *)v5 + 3), (char *)v30))
  {
    espresso_plan_get_error_info(*((void *)v5 + 1));
    NSLog(&cfstr_S_0.isa, v31);
  }
  if (espresso_plan_build(*((uint64_t **)v5 + 1)))
  {
    espresso_plan_get_error_info(*((void *)v5 + 1));
    NSLog(&cfstr_S_0.isa, v32);
  }
  uint64_t v33 = (uint64_t)(v5 + 392);
  if (v5[415] < 0) {
    uint64_t v33 = (uint64_t)*v13;
  }
  espresso_network_query_blob_dimensions(*((uint64_t **)v5 + 2), *((void *)v5 + 3), v33, (uint64_t)&v61);
  *(_OWORD *)(v5 + 376) = v61;
  if ((v48.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v34 = &v48;
  }
  else {
    v34 = (std::string *)v48.__r_.__value_.__r.__words[0];
  }
  v35 = (Espresso *)espresso_network_bind_buffer(*((uint64_t **)v5 + 2), *((void *)v5 + 3), (uint64_t)v34, (uint64_t)(v5 + 208), 0x20000, 0x10000, 0x10000);
  if (v35)
  {
    espresso_plan_get_error_info(*((void *)v5 + 1));
    NSLog(&cfstr_S_0.isa, v37);
  }
  v38 = Espresso::espresso_os_log_subsystem(v35, v36);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    if (v5[415] < 0) {
      int8x16_t v13 = (char **)*v13;
    }
    v39 = &v48;
    if ((v48.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      v39 = (std::string *)v48.__r_.__value_.__r.__words[0];
    }
    uint64_t v40 = *((void *)v5 + 36);
    uint64_t v41 = *((void *)v5 + 37);
    uint64_t v42 = *((void *)v5 + 38);
    *(_DWORD *)buf = 136316162;
    *(void *)&buf[4] = v13;
    __int16 v53 = 2080;
    v54 = v39;
    __int16 v55 = 2048;
    uint64_t v56 = v40;
    __int16 v57 = 2048;
    uint64_t v58 = v41;
    __int16 v59 = 2048;
    uint64_t v60 = v42;
    _os_log_impl(&dword_1920CB000, v38, OS_LOG_TYPE_INFO, "[ETImageDescriptorExtractor] input=%s output=%s (%zu %zu %zu)", buf, 0x34u);
  }

  if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v48.__r_.__value_.__l.__data_);
  }
  if (v50) {
    nitro::nitro_function::nitro_function(v50);
  }
LABEL_57:

  return (ETImageDescriptorExtractor *)v5;
}

+ (id)VisionSmartCamNet_iOS11_Extractor
{
  return 0;
}

+ (id)passthroughExtractor
{
  return 0;
}

+ (id)inception_v3_Extractor
{
  v2 = getenv("ESPRESSO_ROOT");
  std::string::basic_string[abi:ne180100]<0>(&v8, v2);
  std::string::append(&v8, "/espresso_test_data/EspressoTrainTestData/networks/inception_v3_keras1/arch.json.espresso.net");
  v3 = [ETImageDescriptorExtractor alloc];
  if ((v8.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    id v4 = &v8;
  }
  else {
    id v4 = (std::string *)v8.__r_.__value_.__r.__words[0];
  }
  id v5 = [NSString stringWithUTF8String:v4];
  v6 = [(ETImageDescriptorExtractor *)v3 initWithNetwork:v5];

  if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v8.__r_.__value_.__l.__data_);
  }

  return v6;
}

+ (id)VisionSceneNet_iOS10_Extractor
{
  v2 = [[ETImageDescriptorExtractor alloc] initWithNetwork:@"/System/Library/Frameworks/Vision.framework/Versions/A/Resources/scene-descriptor.bin:apple_scenes"];

  return v2;
}

@end