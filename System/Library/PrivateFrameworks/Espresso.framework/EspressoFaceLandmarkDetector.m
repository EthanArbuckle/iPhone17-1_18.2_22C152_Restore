@interface EspressoFaceLandmarkDetector
- (CGRect)newface;
- (EspressoFaceLandmarkDetector)init;
- (EspressoFaceLandmarkDetector)initWithNetworkAtPath:(id)a3 context:(shared_ptr<Espresso:(int)a5 :(int)a6 abstract_context>)a4 platform:computePath:;
- (EspressoFaceLandmarkDetector)initWithNetworkAtPath:(id)a3 contextObjC:(id)a4 platform:(int)a5 computePath:(int)a6;
- (id).cxx_construct;
- (vector<FaceLandmarkDetectorPoint,)detect:(EspressoFaceLandmarkDetector *)self face:(SEL)a3 sublandmark:(vImage_Buffer *)a4 doFaceRectFix:(CGRect)a5;
- (vector<FaceLandmarkDetectorPoint,)detectInImageRect:(EspressoFaceLandmarkDetector *)self face:(SEL)a3 sublandmark:(vImage_Buffer *)a4;
- (vector<FaceLandmarkDetectorPoint,)extractSubLandmarksFromCrop192:(EspressoFaceLandmarkDetector *)self centers192:(SEL)a3;
- (void)commonInit:(id)a3 context:(shared_ptr<Espresso:(int)a5 :(int)a6 abstract_context>)a4 platform:computePath:;
- (void)dealloc;
- (void)setNewface:(CGRect)a3;
@end

@implementation EspressoFaceLandmarkDetector

- (id).cxx_construct
{
  *((void *)self + 15) = 0;
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  return self;
}

- (void).cxx_destruct
{
  p_nets_sub_landmark = &self->nets_sub_landmark;
  std::vector<std::shared_ptr<Espresso::abstract_blob_container>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_nets_sub_landmark);
  cntrl = self->net_detect.__cntrl_;
  if (cntrl) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)cntrl);
  }
  v4 = self->net.__cntrl_;
  if (v4)
  {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)v4);
  }
}

- (void)setNewface:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_newface, &v3, 32, 1, 0);
}

- (CGRect)newface
{
  objc_copyStruct(v6, &self->_newface, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)dealloc
{
  free(self->crop_scaled.data);
  free(self->crop_192.data);
  v3.receiver = self;
  v3.super_class = (Class)EspressoFaceLandmarkDetector;
  [(EspressoFaceLandmarkDetector *)&v3 dealloc];
}

- (void)commonInit:(id)a3 context:(shared_ptr<Espresso:(int)a5 :(int)a6 abstract_context>)a4 platform:computePath:
{
  uint64_t v6 = *(void *)&a5;
  unsigned int cntrl = a4.__cntrl_;
  ptr = a4.__ptr_;
  id v9 = a3;
  NSLog(&cfstr_Np.isa, v9);
  v10 = v9;
  v11 = v9;
  v37 = v9;
  v12 = v9;
  if (!v9)
  {
    v13 = [MEMORY[0x1E4F28B50] mainBundle];
    v12 = [v13 pathForResource:@"landmarks_8c_.espresso.local.bin" ofType:&stru_1EE39BDB0];

    v14 = [MEMORY[0x1E4F28B50] mainBundle];
    v37 = [v14 pathForResource:@"faceDetector-current.bin" ofType:&stru_1EE39BDB0];

    v15 = [MEMORY[0x1E4F28B50] mainBundle];
    id v9 = [v15 pathForResource:@"landmarks_p0_.espresso.local.bin" ofType:&stru_1EE39BDB0];

    v16 = [MEMORY[0x1E4F28B50] mainBundle];
    v10 = [v16 pathForResource:@"landmarks_p1_.espresso.local.bin" ofType:&stru_1EE39BDB0];

    v17 = [MEMORY[0x1E4F28B50] mainBundle];
    v11 = [v17 pathForResource:@"landmarks_p3_.espresso.local.bin" ofType:&stru_1EE39BDB0];

    if (!v12)
    {
      v35 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v34 = [v35 pathForResource:@"landmarks_8c_.espresso.local.bin" ofType:&stru_1EE39BDB0];
      uint64_t v33 = [v35 pathForResource:@"faceDetector-current.bin" ofType:&stru_1EE39BDB0];

      uint64_t v18 = [v35 pathForResource:@"landmarks_p0_.espresso.local.bin" ofType:&stru_1EE39BDB0];

      uint64_t v19 = [v35 pathForResource:@"landmarks_p1_.espresso.local.bin" ofType:&stru_1EE39BDB0];

      uint64_t v20 = [v35 pathForResource:@"landmarks_p3_.espresso.local.bin" ofType:&stru_1EE39BDB0];

      id v9 = (id)v18;
      v10 = (void *)v19;
      v11 = (void *)v20;
      v12 = (void *)v34;
      v37 = (void *)v33;
    }
  }
  MEMORY[0x192FF2B50](&self->crop_scaled, 28, 28, 32, 0);
  MEMORY[0x192FF2B50](&self->crop_192, 192, 192, 32, 0);
  p_nets_sub_landmark = &self->nets_sub_landmark;
  std::vector<std::shared_ptr<Espresso::abstract_blob_container>>::resize((uint64_t *)&self->nets_sub_landmark, 3uLL);
  id v22 = v12;
  std::string::basic_string[abi:ne180100]<0>(v42, (char *)[v22 UTF8String]);
  std::string::basic_string[abi:ne180100]<0>(__p, "landmarks_8c_");
  Espresso::load_network_binserializer((uint64_t)v42, (const void **)__p, ptr, v6, 1, (uint64_t *)&v44);
  v23 = self->net.__cntrl_;
  self->net = v44;
  if (v23) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)v23);
  }
  if (v41 < 0) {
    operator delete(__p[0]);
  }
  if (v43 < 0) {
    operator delete(v42[0]);
  }
  id v24 = v9;
  std::string::basic_string[abi:ne180100]<0>(v42, (char *)[v24 UTF8String]);
  std::string::basic_string[abi:ne180100]<0>(__p, "landmarks_p0_");
  Espresso::load_network_binserializer((uint64_t)v42, (const void **)__p, ptr, v6, 1, (uint64_t *)&v44);
  v25 = (std::__shared_weak_count *)*((void *)p_nets_sub_landmark->__begin_ + 1);
  *(shared_ptr<Espresso::net> *)p_nets_sub_landmark->__begin_ = v44;
  if (v25) {
    nitro::nitro_function::nitro_function(v25);
  }
  if (v41 < 0) {
    operator delete(__p[0]);
  }
  if (v43 < 0) {
    operator delete(v42[0]);
  }
  id v26 = v10;
  std::string::basic_string[abi:ne180100]<0>(v42, (char *)[v26 UTF8String]);
  std::string::basic_string[abi:ne180100]<0>(__p, "landmarks_p1_");
  Espresso::load_network_binserializer((uint64_t)v42, (const void **)__p, ptr, v6, 1, (uint64_t *)&v44);
  v27 = (std::__shared_weak_count *)*((void *)p_nets_sub_landmark->__begin_ + 3);
  *((shared_ptr<Espresso::net> *)p_nets_sub_landmark->__begin_ + 1) = v44;
  if (v27) {
    nitro::nitro_function::nitro_function(v27);
  }
  if (v41 < 0) {
    operator delete(__p[0]);
  }
  if (v43 < 0) {
    operator delete(v42[0]);
  }
  id v28 = v11;
  std::string::basic_string[abi:ne180100]<0>(v42, (char *)[v28 UTF8String]);
  std::string::basic_string[abi:ne180100]<0>(__p, "landmarks_p3_");
  Espresso::load_network_binserializer((uint64_t)v42, (const void **)__p, ptr, v6, 1, (uint64_t *)&v44);
  v29 = (std::__shared_weak_count *)*((void *)p_nets_sub_landmark->__begin_ + 5);
  *((shared_ptr<Espresso::net> *)p_nets_sub_landmark->__begin_ + 2) = v44;
  if (v29) {
    nitro::nitro_function::nitro_function(v29);
  }
  if (v41 < 0) {
    operator delete(__p[0]);
  }
  if (v43 < 0) {
    operator delete(v42[0]);
  }
  id v30 = v37;
  std::string::basic_string[abi:ne180100]<0>(v42, (char *)[v30 UTF8String]);
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  Espresso::load_network_binserializer((uint64_t)v42, (const void **)__p, ptr, v6, 1, (uint64_t *)&v44);
  v31 = self->net_detect.__cntrl_;
  self->net_detect = v44;
  if (v31) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)v31);
  }
  if (v41 < 0) {
    operator delete(__p[0]);
  }
  if (v43 < 0) {
    operator delete(v42[0]);
  }
  if (!*(void *)p_nets_sub_landmark->__begin_ && v22)
  {
    v32 = (std::__shared_weak_count *)*((void *)ptr + 1);
    uint64_t v38 = *(void *)ptr;
    v39 = v32;
    if (v32) {
      atomic_fetch_add_explicit(&v32->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    [(EspressoFaceLandmarkDetector *)self commonInit:0 context:&v38 platform:cntrl computePath:v6];
    if (v39) {
      nitro::nitro_function::nitro_function(v39);
    }
  }
}

- (EspressoFaceLandmarkDetector)init
{
  v7.receiver = self;
  v7.super_class = (Class)EspressoFaceLandmarkDetector;
  double v2 = [(EspressoFaceLandmarkDetector *)&v7 init];
  int v4 = 0;
  Espresso::create_context(&v4, &v5);
  [(EspressoFaceLandmarkDetector *)v2 commonInit:0 context:&v5 platform:0 computePath:0];
  if (v6) {
    nitro::nitro_function::nitro_function(v6);
  }
  return v2;
}

- (EspressoFaceLandmarkDetector)initWithNetworkAtPath:(id)a3 contextObjC:(id)a4 platform:(int)a5 computePath:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a4;
  v16.receiver = self;
  v16.super_class = (Class)EspressoFaceLandmarkDetector;
  v12 = [(EspressoFaceLandmarkDetector *)&v16 init];
  if (v11)
  {
    [v11 ctx];
  }
  else
  {
    uint64_t v14 = 0;
    v15 = 0;
  }
  [(EspressoFaceLandmarkDetector *)v12 commonInit:v10 context:&v14 platform:v7 computePath:v6];
  if (v15) {
    nitro::nitro_function::nitro_function(v15);
  }

  return v12;
}

- (EspressoFaceLandmarkDetector)initWithNetworkAtPath:(id)a3 context:(shared_ptr<Espresso:(int)a5 :(int)a6 abstract_context>)a4 platform:computePath:
{
  uint64_t v6 = *(void *)&a5;
  unsigned int cntrl = a4.__cntrl_;
  ptr = a4.__ptr_;
  id v10 = a3;
  v17.receiver = self;
  v17.super_class = (Class)EspressoFaceLandmarkDetector;
  id v11 = [(EspressoFaceLandmarkDetector *)&v17 init];
  v12 = v11;
  v13 = (std::__shared_weak_count *)*((void *)ptr + 1);
  uint64_t v15 = *(void *)ptr;
  objc_super v16 = v13;
  if (v13) {
    atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  [(EspressoFaceLandmarkDetector *)v11 commonInit:v10 context:&v15 platform:cntrl computePath:v6];
  if (v16) {
    nitro::nitro_function::nitro_function(v16);
  }

  return v12;
}

- (vector<FaceLandmarkDetectorPoint,)detectInImageRect:(EspressoFaceLandmarkDetector *)self face:(SEL)a3 sublandmark:(vImage_Buffer *)a4
{
  void (***v26)(uint64_t *__return_ptr, void);
  uint64_t v27;
  void *v28;
  std::__shared_weak_count *v29;
  uint64_t v30;
  net *ptr;
  void *v32;
  net *v33;
  void *v34;
  uint64_t v35;
  net *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void (***v40)(uint64_t *__return_ptr, void);
  net *v41;
  void *v42;
  FaceLandmarkDetectorPoint *var1;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  int *v47;
  int v48;
  int v49;
  FaceLandmarkDetectorPoint *var0;
  FaceLandmarkDetectorPoint *v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  unint64_t v57;
  FaceLandmarkDetectorPoint *v58;
  uint64_t v59;
  long long v60;
  uint64_t *data;
  vImagePixelCount v62;
  FaceLandmarkDetectorPoint *v63;
  uint64_t v64;
  FaceLandmarkDetectorPoint *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  FaceLandmarkDetectorPoint *v71;
  FaceLandmarkDetectorPoint *v72;
  FaceLandmarkDetectorPoint *v73;
  uint64_t v74;
  FaceLandmarkDetectorPoint *v75;
  float v76;
  float v77;
  vector<FaceLandmarkDetectorPoint, std::allocator<FaceLandmarkDetectorPoint>> *result;
  int v79;
  int v80;
  int v81;
  BOOL v82;
  _OWORD v83[2];
  void v84[5];
  void *__p;
  std::__shared_weak_count *v86;
  char v87;
  uint64_t v88;
  std::__shared_weak_count *v89;
  vImage_Buffer *p_src;
  std::__shared_weak_count *v91;
  void v92[5];
  _OWORD v93[2];
  vImage_Buffer src;
  unsigned char v95[64];
  long long *v96[2];
  CGRect v97;
  CGRect v98;
  CGRect v99;

  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  Espresso::scoped_timer::scoped_timer((Espresso::scoped_timer *)v95, "FaceLandmark", a5.origin.x);
  float v14 = (float)(int)width;
  float v15 = (float)(int)height;
  int v16 = (int)(float)(v14 * 1.04);
  v97.origin.double x = (double)(int)(float)((float)(int)x + (float)((float)(v14 * -0.04) * 0.5));
  v97.origin.double y = (double)(int)(float)((float)(int)y + (float)((float)(v15 * -0.04) * 0.5));
  v97.size.double width = (double)v16;
  v97.size.double height = (double)(int)(float)(v15 * 1.04);
  v99.size.double width = (double)a4->width;
  v99.size.double height = (double)a4->height;
  v99.origin.double x = 0.0;
  v99.origin.double y = 0.0;
  v98 = CGRectIntersection(v97, v99);
  int v17 = (int)v98.origin.x;
  int v18 = (int)v98.origin.y;
  if ((int)v98.size.height >= (int)v98.size.width) {
    int v19 = (int)v98.size.width;
  }
  else {
    int v19 = (int)v98.size.height;
  }
  size_t rowBytes = a4->rowBytes;
  src.data = (char *)a4->data + 4 * v17 + rowBytes * v18;
  src.double height = v19;
  src.double width = v19;
  src.size_t rowBytes = rowBytes;
  vImageScale_ARGB8888(&src, &self->crop_192, 0, 0x20u);
  vImageScale_ARGB8888(&self->crop_192, &self->crop_scaled, 0, 0x20u);
  uint64_t v21 = **((void **)self->net_detect.__ptr_ + 4);
  id v22 = Espresso::layer_data::get_blob<Espresso::blob_cpu>(*(void *)(v21 + 80), *(void *)(v21 + 88), 0);
  v81 = v18;
  v80 = v17;
  v79 = v19;
  v82 = a6;
  if (v22)
  {
    uint64_t v23 = *((void *)v22 + 20);
    id v24 = (std::__shared_weak_count *)*((void *)v22 + 21);
    if (v24) {
      atomic_fetch_add_explicit(&v24->__shared_owners_, 1uLL, memory_order_relaxed);
    }
  }
  else
  {
    uint64_t v23 = 0;
    id v24 = 0;
  }
  long long v25 = *(_OWORD *)&self->crop_scaled.width;
  v93[0] = *(_OWORD *)&self->crop_scaled.data;
  v93[1] = v25;
  copy_to_blobrgb(v93, v23, -90.686, *(float *)&v25);
  id v26 = (void (***)(uint64_t *__return_ptr, void))*((void *)self->net_detect.__ptr_ + 2);
  v92[0] = MEMORY[0x1E4F143A8];
  v92[1] = 3221225472;
  v92[2] = __67__EspressoFaceLandmarkDetector_detectInImageRect_face_sublandmark___block_invoke;
  v92[3] = &unk_1E57472C8;
  v92[4] = self;
  Espresso::abstract_context::compute_batch_sync(v26, v92);
  v27 = **((void **)self->net.__ptr_ + 4);
  id v28 = Espresso::layer_data::get_blob<Espresso::blob_cpu>(*(void *)(v27 + 80), *(void *)(v27 + 88), 0);
  if (v28)
  {
    id v30 = *((void *)v28 + 20);
    v29 = (std::__shared_weak_count *)*((void *)v28 + 21);
    if (v29) {
      atomic_fetch_add_explicit(&v29->__shared_owners_, 1uLL, memory_order_relaxed);
    }
  }
  else
  {
    id v30 = 0;
    v29 = 0;
  }
  ptr = self->net_detect.__ptr_;
  std::string::basic_string[abi:ne180100]<0>(&src, "prob_student");
  __p = &src;
  v32 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)ptr + 136, (unsigned __int8 *)&src, (long long **)&__p);
  Espresso::inline_get_cpu_blob<Espresso::blob<float,4>,true>(&p_src, *((void **)v32 + 5), *((std::__shared_weak_count **)v32 + 6));
  if (SHIBYTE(src.width) < 0) {
    operator delete(src.data);
  }
  if (*(float *)(p_src->rowBytes + 4) < 0.99996875) {
    NSLog(&cfstr_DcnLndmrkSkipN.isa, *(float *)(p_src->rowBytes + 4));
  }
  std::vector<int>::vector((std::vector<int> *)&src, 1uLL);
  uint64_t v33 = self->net_detect.__ptr_;
  std::string::basic_string[abi:ne180100]<0>(&__p, "pool5_student");
  v96[0] = (long long *)&__p;
  uint64_t v34 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)v33 + 136, (unsigned __int8 *)&__p, v96);
  Espresso::inline_get_cpu_blob<Espresso::blob<float,4>,true>(&v88, *((void **)v34 + 5), *((std::__shared_weak_count **)v34 + 6));
  if (v87 < 0) {
    operator delete(__p);
  }
  *(_DWORD *)src.data = 0;
  if (v89) {
    nitro::nitro_function::nitro_function(v89);
  }
  v35 = *(void *)(v30 + 24);
  v36 = self->net_detect.__ptr_;
  std::string::basic_string[abi:ne180100]<0>(&__p, "pool5_student");
  v96[0] = (long long *)&__p;
  v37 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)v36 + 136, (unsigned __int8 *)&__p, v96);
  Espresso::inline_get_cpu_blob<Espresso::blob<float,4>,true>(&v88, *((void **)v37 + 5), *((std::__shared_weak_count **)v37 + 6));
  if (v87 < 0) {
    operator delete(__p);
  }
  uint64_t v38 = 0;
  v39 = *(int *)(v88 + 8);
  do
  {
    v39 *= *(int *)(v88 + 12 + v38);
    v38 += 4;
  }
  while (v38 != 12);
  memcpy((void *)(v35 + 4 * *(int *)src.data), *(const void **)(v88 + 24), 4 * v39);
  if (v89) {
    nitro::nitro_function::nitro_function(v89);
  }
  if (src.data)
  {
    src.double height = (vImagePixelCount)src.data;
    operator delete(src.data);
  }
  if (v91) {
    nitro::nitro_function::nitro_function(v91);
  }
  v40 = (void (***)(uint64_t *__return_ptr, void))*((void *)self->net.__ptr_ + 2);
  v84[0] = MEMORY[0x1E4F143A8];
  v84[1] = 3221225472;
  v84[2] = __67__EspressoFaceLandmarkDetector_detectInImageRect_face_sublandmark___block_invoke_2;
  v84[3] = &unk_1E57472C8;
  v84[4] = self;
  Espresso::abstract_context::compute_batch_sync(v40, v84);
  char v41 = self->net.__ptr_;
  std::string::basic_string[abi:ne180100]<0>(&src, "fc2");
  p_src = &src;
  v42 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)v41 + 136, (unsigned __int8 *)&src, (long long **)&p_src);
  Espresso::inline_get_cpu_blob<Espresso::blob<float,4>,true>(&__p, *((void **)v42 + 5), *((std::__shared_weak_count **)v42 + 6));
  if (SHIBYTE(src.width) < 0) {
    operator delete(src.data);
  }
  var1 = 0;
  shared_ptr<Espresso::net> v44 = 0;
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  while (1)
  {
    v45 = 0;
    v46 = *((int *)__p + 2);
    do
    {
      v46 *= *(int *)((char *)__p + v45 + 12);
      v45 += 4;
    }
    while (v45 != 12);
    if (v44 >= v46 >> 1) {
      break;
    }
    v47 = (int *)(*((void *)__p + 3) + 8 * v44);
    v49 = *v47;
    v48 = v47[1];
    var0 = retstr->var2.var0;
    if (var1 >= var0)
    {
      v51 = retstr->var0;
      v52 = (var1 - retstr->var0) >> 3;
      v53 = v52 + 1;
      if ((unint64_t)(v52 + 1) >> 61) {
        std::vector<std::shared_ptr<E5RT::PrecompiledComputeOpCreateOptions>>::__throw_length_error[abi:ne180100]();
      }
      v54 = var0 - v51;
      if (v54 >> 2 > v53) {
        v53 = v54 >> 2;
      }
      if ((unint64_t)v54 >= 0x7FFFFFFFFFFFFFF8) {
        v55 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        v55 = v53;
      }
      if (v55)
      {
        v55 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v55);
        v51 = retstr->var0;
        var1 = retstr->var1;
      }
      else
      {
        v56 = 0;
      }
      v57 = v55 + 8 * v52;
      *(_DWORD *)v57 = v49;
      *(_DWORD *)(v57 + 4) = v48;
      v58 = (FaceLandmarkDetectorPoint *)v57;
      if (var1 != v51)
      {
        do
        {
          v59 = *((void *)var1 - 1);
          var1 = (FaceLandmarkDetectorPoint *)((char *)var1 - 8);
          *((void *)v58 - 1) = v59;
          v58 = (FaceLandmarkDetectorPoint *)((char *)v58 - 8);
        }
        while (var1 != v51);
        v51 = retstr->var0;
      }
      var1 = (FaceLandmarkDetectorPoint *)(v57 + 8);
      retstr->var0 = v58;
      retstr->var1 = (FaceLandmarkDetectorPoint *)(v57 + 8);
      retstr->var2.var0 = (FaceLandmarkDetectorPoint *)(v55 + 8 * v56);
      if (v51) {
        operator delete(v51);
      }
    }
    else
    {
      *(_DWORD *)var1 = v49;
      *((_DWORD *)var1 + 1) = v48;
      var1 = (FaceLandmarkDetectorPoint *)((char *)var1 + 8);
    }
    retstr->var1 = var1;
    ++v44;
  }
  if (v82)
  {
    v60 = *(_OWORD *)&self->crop_192.width;
    v83[0] = *(_OWORD *)&self->crop_192.data;
    v83[1] = v60;
    [(EspressoFaceLandmarkDetector *)self extractSubLandmarksFromCrop192:v83 centers192:retstr];
    data = (uint64_t *)src.data;
    v62 = src.height;
    if (src.data != (void *)src.height)
    {
      v63 = retstr->var1;
      do
      {
        v64 = *data;
        v65 = retstr->var2.var0;
        if (v63 >= v65)
        {
          v66 = (v63 - retstr->var0) >> 3;
          if ((unint64_t)(v66 + 1) >> 61) {
            std::vector<std::shared_ptr<E5RT::PrecompiledComputeOpCreateOptions>>::__throw_length_error[abi:ne180100]();
          }
          v67 = v65 - retstr->var0;
          v68 = v67 >> 2;
          if (v67 >> 2 <= (unint64_t)(v66 + 1)) {
            v68 = v66 + 1;
          }
          if ((unint64_t)v67 >= 0x7FFFFFFFFFFFFFF8) {
            v69 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            v69 = v68;
          }
          if (v69) {
            v69 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v69);
          }
          else {
            v70 = 0;
          }
          v71 = (FaceLandmarkDetectorPoint *)(v69 + 8 * v66);
          *(void *)v71 = v64;
          v63 = (FaceLandmarkDetectorPoint *)((char *)v71 + 8);
          v73 = retstr->var0;
          v72 = retstr->var1;
          if (v72 != retstr->var0)
          {
            do
            {
              v74 = *((void *)v72 - 1);
              v72 = (FaceLandmarkDetectorPoint *)((char *)v72 - 8);
              *((void *)v71 - 1) = v74;
              v71 = (FaceLandmarkDetectorPoint *)((char *)v71 - 8);
            }
            while (v72 != v73);
            v72 = retstr->var0;
          }
          retstr->var0 = v71;
          retstr->var1 = v63;
          retstr->var2.var0 = (FaceLandmarkDetectorPoint *)(v69 + 8 * v70);
          if (v72) {
            operator delete(v72);
          }
        }
        else
        {
          *(void *)v63 = v64;
          v63 = (FaceLandmarkDetectorPoint *)((char *)v63 + 8);
        }
        retstr->var1 = v63;
        ++data;
      }
      while (data != (uint64_t *)v62);
      data = (uint64_t *)src.data;
    }
    if (data)
    {
      src.double height = (vImagePixelCount)data;
      operator delete(data);
    }
    var1 = retstr->var1;
  }
  v75 = retstr->var0;
  if (retstr->var0 != var1)
  {
    v76 = (float)v79;
    do
    {
      v77 = (float)v81 + (float)((float)(*((float *)v75 + 1) / 192.0) * v76);
      *(float *)v75 = (float)v80 + (float)((float)(*(float *)v75 / 192.0) * v76);
      *((float *)v75 + 1) = v77;
      v75 = (FaceLandmarkDetectorPoint *)((char *)v75 + 8);
    }
    while (v75 != var1);
  }
  if (v86) {
    nitro::nitro_function::nitro_function(v86);
  }
  if (v29) {
    nitro::nitro_function::nitro_function(v29);
  }
  if (v24) {
    nitro::nitro_function::nitro_function(v24);
  }
  Espresso::scoped_timer::~scoped_timer((Espresso::scoped_timer *)v95);
  return result;
}

void __67__EspressoFaceLandmarkDetector_detectInImageRect_face_sublandmark___block_invoke(uint64_t a1, void *a2)
{
}

void __67__EspressoFaceLandmarkDetector_detectInImageRect_face_sublandmark___block_invoke_2(uint64_t a1, void *a2)
{
}

- (vector<FaceLandmarkDetectorPoint,)detect:(EspressoFaceLandmarkDetector *)self face:(SEL)a3 sublandmark:(vImage_Buffer *)a4 doFaceRectFix:(CGRect)a5
{
  BOOL v7 = a6;
  if (a7)
  {
    long long v10 = *(_OWORD *)&a4->width;
    v20[0] = *(_OWORD *)&a4->data;
    v20[1] = v10;
    -[EspressoFaceLandmarkDetector detectInImageRect:face:sublandmark:](self, "detectInImageRect:face:sublandmark:", v20, 0, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
    float v11 = *((float *)__p + 2);
    float v12 = vabds_f32(*(float *)__p, v11) * 2.5;
    double v13 = *(float *)__p * 0.3333333 + *((float *)__p + 4) * 0.3333333 + v11 * 0.3333333 + (float)(v12 * -0.5);
    double v14 = *((float *)__p + 1) * 0.125
        + *((float *)__p + 5) * 0.5
        + *((float *)__p + 3) * 0.125
        + *((float *)__p + 7) * 0.125
        + *((float *)__p + 9) * 0.125
        + (float)(v12 * -0.6);
    double v15 = v12;
    -[EspressoFaceLandmarkDetector setNewface:](self, "setNewface:", v13, v14, v15, v15);
    long long v16 = *(_OWORD *)&a4->width;
    v19[0] = *(_OWORD *)&a4->data;
    v19[1] = v16;
    -[EspressoFaceLandmarkDetector detectInImageRect:face:sublandmark:](self, "detectInImageRect:face:sublandmark:", v19, v7, v13, v14, v15, v15);
    CGRect result = (vector<FaceLandmarkDetectorPoint, std::allocator<FaceLandmarkDetectorPoint>> *)__p;
    if (__p)
    {
      id v22 = __p;
      operator delete(__p);
    }
  }
  else
  {
    long long v18 = *(_OWORD *)&a4->width;
    v23[0] = *(_OWORD *)&a4->data;
    v23[1] = v18;
    return -[EspressoFaceLandmarkDetector detectInImageRect:face:sublandmark:](self, "detectInImageRect:face:sublandmark:", v23, a6, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  }
  return result;
}

- (vector<FaceLandmarkDetectorPoint,)extractSubLandmarksFromCrop192:(EspressoFaceLandmarkDetector *)self centers192:(SEL)a3
{
  void (***v56)(uint64_t *__return_ptr, void);
  void *v57;
  unint64_t v58;
  float32x2_t v59;
  uint64_t v60;
  unint64_t v61;
  float32x2_t v62;
  float32x2_t v63;
  FaceLandmarkDetectorPoint *var0;
  FaceLandmarkDetectorPoint *var1;
  FaceLandmarkDetectorPoint *v66;
  FaceLandmarkDetectorPoint *v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  FaceLandmarkDetectorPoint *v73;
  uint64_t v74;
  vector<FaceLandmarkDetectorPoint, std::allocator<FaceLandmarkDetectorPoint>> *result;
  int32x2_t v78;
  long long v79;
  void *__p[2];
  char v81;
  uint64_t v82;
  std::__shared_weak_count *v83;
  void v84[4];
  long long v85;
  vImage_Buffer v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  unsigned char v96[64];
  void **v97;
  vImage_Buffer dest;
  vImage_Buffer src;
  double *v100;
  double *v101;
  double *v102;
  double *v103;
  double *v104;
  void v105[3];

  v105[0] = *MEMORY[0x1E4F143B8];
  Espresso::scoped_timer::scoped_timer((Espresso::scoped_timer *)v96, "  >> SubLandmark", v5);
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  v8 = *(float **)a5;
  float v9 = *v8;
  float v10 = v8[1];
  float v11 = (double *)operator new(0x10uLL);
  src.double height = (vImagePixelCount)(v11 + 2);
  src.double width = (vImagePixelCount)(v11 + 2);
  double *v11 = v9;
  v11[1] = (float)(v10 + -4.0);
  src.data = v11;
  float v12 = v8[2];
  float v13 = v8[3];
  src.size_t rowBytes = 0;
  v100 = 0;
  v101 = 0;
  double v14 = (double *)operator new(0x10uLL);
  v100 = v14 + 2;
  v101 = v14 + 2;
  double *v14 = v12;
  v14[1] = (float)(v13 + -4.0);
  src.size_t rowBytes = (size_t)v14;
  float v15 = v8[6];
  float v16 = v8[7];
  float v17 = v8[8];
  float v18 = v8[9];
  v102 = 0;
  v103 = 0;
  v104 = 0;
  int v19 = (double *)operator new(0x10uLL);
  v103 = v19 + 2;
  v104 = v19 + 2;
  *int v19 = (float)((float)(v15 + v17) * 0.5);
  v19[1] = (float)((float)((float)(v16 + v18) * 0.5) + 8.0);
  v102 = v19;
  v94 = 0;
  v95 = 0;
  v93 = 0;
  v90 = &v93;
  LOBYTE(v91) = 0;
  uint64_t v20 = 0;
  v93 = operator new(0x48uLL);
  v94 = v93;
  v95 = v93 + 9;
  v87 = v93;
  __p[0] = v93;
  dest.data = &v95;
  dest.double height = (vImagePixelCount)__p;
  dest.double width = (vImagePixelCount)&v87;
  uint64_t v21 = v93;
  LOBYTE(dest.rowBytes) = 0;
  do
  {
    *uint64_t v21 = 0;
    v21[1] = 0;
    v21[2] = 0;
    uint64_t v23 = *(void **)((char *)&src.data + v20);
    id v22 = *(unsigned char **)((char *)&src.height + v20);
    int64_t v24 = v22 - v23;
    if (v22 != v23)
    {
      std::vector<double>::__vallocate[abi:ne180100](v21, v24 >> 3);
      long long v25 = (char *)v21[1];
      memmove(v25, v23, v24);
      v21[1] = &v25[8 * (v24 >> 3)];
      uint64_t v21 = v87;
    }
    v21 += 3;
    v87 = v21;
    v20 += 24;
  }
  while (v20 != 72);
  LOBYTE(dest.rowBytes) = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<int>>,std::vector<int>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&dest);
  uint64_t v26 = 0;
  v94 = v21;
  do
  {
    v27 = (&v102)[v26];
    if (v27)
    {
      (&v103)[v26] = v27;
      operator delete(v27);
    }
    v26 -= 3;
  }
  while (v26 != -9);
  id v28 = operator new(8uLL);
  src.data = v28;
  *id v28 = 0x2800000028;
  src.double height = (vImagePixelCount)(v28 + 1);
  src.double width = (vImagePixelCount)(v28 + 1);
  src.size_t rowBytes = 0;
  v100 = 0;
  v101 = 0;
  v29 = operator new(8uLL);
  src.size_t rowBytes = (size_t)v29;
  void *v29 = 0x2800000028;
  v100 = (double *)(v29 + 1);
  v101 = (double *)(v29 + 1);
  v102 = 0;
  v103 = 0;
  v104 = 0;
  id v30 = (double *)operator new(8uLL);
  v102 = v30;
  *(void *)id v30 = 0x280000003CLL;
  v103 = v30 + 1;
  v104 = v30 + 1;
  v91 = 0;
  v92 = 0;
  v90 = 0;
  dest.data = &v90;
  LOBYTE(dest.height) = 0;
  v90 = operator new(0x48uLL);
  v91 = v90;
  v92 = v90 + 9;
  uint64_t v31 = 0;
  v91 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<int>>,std::vector<int> const*,std::vector<int> const*,std::vector<int>*>((uint64_t)&v92, (uint64_t)&src, (uint64_t)v105, v90);
  do
  {
    v32 = (&v102)[v31];
    if (v32)
    {
      (&v103)[v31] = v32;
      operator delete(v32);
    }
    v31 -= 3;
  }
  while (v31 != -9);
  uint64_t v33 = operator new(8uLL);
  src.data = v33;
  *uint64_t v33 = 0x2000000020;
  src.double height = (vImagePixelCount)(v33 + 1);
  src.double width = (vImagePixelCount)(v33 + 1);
  src.size_t rowBytes = 0;
  v100 = 0;
  v101 = 0;
  uint64_t v34 = operator new(8uLL);
  src.size_t rowBytes = (size_t)v34;
  *uint64_t v34 = 0x2000000020;
  v100 = (double *)(v34 + 1);
  v101 = (double *)(v34 + 1);
  v102 = 0;
  v103 = 0;
  v104 = 0;
  v35 = (double *)operator new(8uLL);
  v102 = v35;
  *(void *)v35 = 0x2000000030;
  v103 = v35 + 1;
  v104 = v35 + 1;
  v88 = 0;
  v89 = 0;
  v87 = 0;
  dest.data = &v87;
  LOBYTE(dest.height) = 0;
  v87 = operator new(0x48uLL);
  v88 = v87;
  v89 = v87 + 9;
  uint64_t v36 = 0;
  v88 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<int>>,std::vector<int> const*,std::vector<int> const*,std::vector<int>*>((uint64_t)&v89, (uint64_t)&src, (uint64_t)v105, v87);
  do
  {
    v37 = (&v102)[v36];
    if (v37)
    {
      (&v103)[v36] = v37;
      operator delete(v37);
    }
    v36 -= 3;
  }
  while (v36 != -9);
  uint64_t v38 = v93;
  if (v94 != v93)
  {
    unint64_t v39 = 0;
    do
    {
      float64x2_t v40 = *(float64x2_t *)v38[3 * v39];
      uint64_t v41 = *(void *)v90[3 * v39];
      v42.i64[0] = (int)v41;
      v42.i64[1] = SHIDWORD(v41);
      float64x2_t v43 = vcvtq_f64_s64(v42);
      int32x2_t v44 = vrev64_s32(vmovn_s64(*(int64x2_t *)&a4->height));
      int32x2_t v45 = vmin_s32(vmax_s32(vmovn_s64(vcvtq_s64_f64(vsubq_f64(v40, v43))), 0), v44);
      size_t rowBytes = a4->rowBytes;
      v47 = (char *)a4->data + 4 * v45.i32[0] + rowBytes * v45.i32[1];
      v78 = v45;
      int8x16_t v48 = (int8x16_t)vsubl_s32(vmin_s32(vmax_s32(vmovn_s64(vcvtq_s64_f64(vaddq_f64(v40, v43))), 0), v44), v45);
      *(int8x16_t *)&src.double height = vextq_s8(v48, v48, 8uLL);
      src.data = v47;
      src.size_t rowBytes = rowBytes;
      MEMORY[0x192FF2B50](&dest, *(int *)(v87[3 * v39] + 4), *(int *)v87[3 * v39], 32, 0);
      vImageScale_ARGB8888(&src, &dest, 0, 0);
      begin = self->nets_sub_landmark.__begin_;
      long long v50 = begin[v39];
      v51 = (std::__shared_weak_count *)*((void *)&begin[v39] + 1);
      if (v51) {
        atomic_fetch_add_explicit(&v51->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      v79 = v50;
      uint64_t v52 = v50;
      v53 = Espresso::layer_data::get_blob<Espresso::blob_cpu>(*(void *)(**(void **)(v50 + 32) + 80), *(void *)(**(void **)(v50 + 32) + 88), 0);
      if (v53)
      {
        uint64_t v54 = *((void *)v53 + 20);
        v55 = (std::__shared_weak_count *)*((void *)v53 + 21);
        if (v55) {
          atomic_fetch_add_explicit(&v55->__shared_owners_, 1uLL, memory_order_relaxed);
        }
      }
      else
      {
        uint64_t v54 = 0;
        v55 = 0;
      }
      v86 = dest;
      copy_to_blobrgb(&v86, v54, 0.0, *(float *)&dest.width);
      v56 = *(void (****)(uint64_t *__return_ptr, void))(v52 + 16);
      v84[0] = MEMORY[0x1E4F143A8];
      v84[1] = 3321888768;
      v84[2] = __74__EspressoFaceLandmarkDetector_extractSubLandmarksFromCrop192_centers192___block_invoke;
      v84[3] = &__block_descriptor_48_ea8_32c41_ZTSNSt3__110shared_ptrIN8Espresso3netEEE_e10_v16__0r_v8l;
      v85 = v79;
      if (v51) {
        atomic_fetch_add_explicit(&v51->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      Espresso::abstract_context::compute_batch_sync(v56, v84);
      std::string::basic_string[abi:ne180100]<0>(__p, "fc2");
      v97 = __p;
      v57 = std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<Espresso::abstract_blob_container>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v52 + 136, (unsigned __int8 *)__p, (long long **)&v97);
      Espresso::inline_get_cpu_blob<Espresso::blob<float,4>,true>(&v82, *((void **)v57 + 5), *((std::__shared_weak_count **)v57 + 6));
      if (v81 < 0) {
        operator delete(__p[0]);
      }
      v58 = 0;
      v59 = vcvt_f32_s32(v78);
      while (1)
      {
        v60 = 0;
        v61 = *(int *)(v82 + 8);
        do
        {
          v61 *= *(int *)(v82 + 12 + v60);
          v60 += 4;
        }
        while (v60 != 12);
        if (v58 >= v61 >> 1) {
          break;
        }
        v62 = vmul_f32(*(float32x2_t *)(*(void *)(v82 + 24) + 8 * v58), vcvt_f32_s32(*(int32x2_t *)v90[3 * v39]));
        v63 = vadd_f32(vdiv_f32(vadd_f32(v62, v62), vcvt_f32_s32(*(int32x2_t *)v87[3 * v39])), v59);
        var1 = retstr->var1;
        var0 = retstr->var2.var0;
        if (var1 >= var0)
        {
          v67 = retstr->var0;
          v68 = (var1 - retstr->var0) >> 3;
          v69 = v68 + 1;
          if ((unint64_t)(v68 + 1) >> 61) {
            std::vector<std::shared_ptr<E5RT::PrecompiledComputeOpCreateOptions>>::__throw_length_error[abi:ne180100]();
          }
          v70 = var0 - v67;
          if (v70 >> 2 > v69) {
            v69 = v70 >> 2;
          }
          if ((unint64_t)v70 >= 0x7FFFFFFFFFFFFFF8) {
            v71 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            v71 = v69;
          }
          if (v71) {
            v71 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v71);
          }
          else {
            v72 = 0;
          }
          v73 = (FaceLandmarkDetectorPoint *)(v71 + 8 * v68);
          *(float32x2_t *)v73 = v63;
          v66 = (FaceLandmarkDetectorPoint *)((char *)v73 + 8);
          if (var1 != v67)
          {
            do
            {
              v74 = *((void *)var1 - 1);
              var1 = (FaceLandmarkDetectorPoint *)((char *)var1 - 8);
              *((void *)v73 - 1) = v74;
              v73 = (FaceLandmarkDetectorPoint *)((char *)v73 - 8);
            }
            while (var1 != v67);
            var1 = retstr->var0;
          }
          retstr->var0 = v73;
          retstr->var1 = v66;
          retstr->var2.var0 = (FaceLandmarkDetectorPoint *)(v71 + 8 * v72);
          if (var1) {
            operator delete(var1);
          }
        }
        else
        {
          *(float32x2_t *)var1 = v63;
          v66 = (FaceLandmarkDetectorPoint *)((char *)var1 + 8);
        }
        retstr->var1 = v66;
        ++v58;
      }
      free(dest.data);
      if (v83) {
        nitro::nitro_function::nitro_function(v83);
      }
      if (*((void *)&v85 + 1)) {
        nitro::nitro_function::nitro_function(*((std::__shared_weak_count **)&v85 + 1));
      }
      if (v55) {
        nitro::nitro_function::nitro_function(v55);
      }
      if (v51) {
        nitro::nitro_function::nitro_function(v51);
      }
      ++v39;
      uint64_t v38 = v93;
    }
    while (0xAAAAAAAAAAAAAAABLL * (v94 - v93) > v39);
  }
  src.data = &v87;
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)&src);
  src.data = &v90;
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)&src);
  src.data = &v93;
  std::vector<std::vector<unsigned long>>::__destroy_vector::operator()[abi:ne180100]((void ***)&src);
  Espresso::scoped_timer::~scoped_timer((Espresso::scoped_timer *)v96);
  return result;
}

void __74__EspressoFaceLandmarkDetector_extractSubLandmarksFromCrop192_centers192___block_invoke(uint64_t a1, void *a2)
{
}

@end