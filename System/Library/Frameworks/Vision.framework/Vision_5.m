void sub_1A406FF5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, void *a13, void *a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,void *a23,void *a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id a32)
{
  void *v32;
  void *v33;

  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__34481(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__34482(uint64_t a1)
{
}

void sub_1A4070180(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A40712F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,void *a25)
{
  _Unwind_Resume(a1);
}

void sub_1A4071724(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A4071844(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A4071964(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A4071B08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A4071E08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A4071F1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A4072020(_Unwind_Exception *a1)
{
  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A407227C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t vision::mod::ImageDescriptor_EspressoSmartCam::getRequiredImageType(vision::mod::ImageDescriptor_EspressoSmartCam *this)
{
  return 6;
}

void vision::mod::ImageDescriptor_EspressoSmartCam::~ImageDescriptor_EspressoSmartCam(vision::mod::ImageDescriptor_EspressoSmartCam *this)
{
  *(void *)this = &unk_1EF752CE0;
  v1 = (std::__shared_weak_count *)*((void *)this + 7);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v1);
  }

  JUMPOUT(0x1A62562C0);
}

{
  std::__shared_weak_count *v1;

  *(void *)this = &unk_1EF752CE0;
  v1 = (std::__shared_weak_count *)*((void *)this + 7);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v1);
  }
}

uint64_t std::__shared_ptr_emplace<vision::mod::ImageDescriptor_EspressoSmartCam>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void std::__shared_ptr_emplace<vision::mod::ImageDescriptor_EspressoSmartCam>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EF753AF0;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x1A62562C0);
}

void std::__shared_ptr_emplace<vision::mod::ImageDescriptor_EspressoSmartCam>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EF753AF0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_1A4072488(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A40725CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A4072630(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A407267C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A4072A04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1A4072B3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A4072BE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void computePhogDescriptor(unsigned char *a1, void **a2)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  v3 = (float *)malloc_type_malloc(0x2400uLL, 0x7AA728CFuLL);
  v4 = malloc_type_malloc(0x2400uLL, 0x81089231uLL);
  v60 = (float *)malloc_type_malloc(0x2400uLL, 0x60497EF4uLL);
  v59 = malloc_type_malloc(0x2400uLL, 0xCBE22EA3uLL);
  v5 = (float *)malloc_type_malloc(0x2400uLL, 0xBECD2043uLL);
  v58 = (float *)malloc_type_malloc(0x2400uLL, 0x76638E7EuLL);
  for (uint64_t i = 0; i != 4; ++i)
  {
    long double v7 = ldexp(1.0, i);
    *(_DWORD *)&v64[4 * i + 32] = (int)v7;
    int v8 = 48 / (int)v7;
    *(_DWORD *)&v64[4 * i + 16] = v8;
    *(_DWORD *)&v64[4 * i] = v8;
  }
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  v11 = a1 + 1;
  v13 = v59;
  v12 = v60;
  do
  {
    for (uint64_t j = 0; j != 47; ++j)
    {
      LOBYTE(v7) = v11[j];
      float v15 = (float)LODWORD(v7);
      v3[v9 + j] = v15;
      LOBYTE(v15) = v11[j - 1];
      *(float *)&long double v7 = (float)LODWORD(v15);
      v4[v9 + 1 + j] = LODWORD(v7);
    }
    uint64_t v16 = 48 * v10 + 47;
    LOBYTE(v7) = a1[v16];
    float v17 = (float)LODWORD(v7);
    v3[v16] = v17;
    LOBYTE(v17) = a1[48 * v10];
    *(float *)&long double v7 = (float)LODWORD(v17);
    v4[48 * v10++] = LODWORD(v7);
    v9 += 48;
    v11 += 48;
  }
  while (v10 != 48);
  for (uint64_t k = 0; k != 2256; ++k)
  {
    LOBYTE(v7) = a1[k + 48];
    float v19 = (float)LODWORD(v7);
    v60[k] = v19;
    LOBYTE(v19) = a1[k];
    *(float *)&long double v7 = (float)LODWORD(v19);
    v59[k + 48] = LODWORD(v7);
  }
  for (uint64_t m = 0; m != 48; ++m)
  {
    LOBYTE(v7) = *a1;
    *(float *)&unsigned int v21 = (float)LODWORD(v7);
    v59[m] = v21;
    LOBYTE(v21) = a1[2256];
    *(float *)&long double v7 = (float)v21;
    v60[m + 2256] = *(float *)&v7;
    ++a1;
  }
  int v22 = 0;
  int v23 = 0;
  int v24 = 0;
  v56 = v4;
  v57 = v3;
  do
  {
    uint64_t v25 = 0;
    int v62 = v23;
    int v61 = v24;
    int v63 = v22;
    unsigned int v26 = v22 - 1;
    v27 = &v13[v24];
    v28 = &v12[v24];
    v29 = (char *)&v4[v24];
    v30 = &v3[v24];
    v31 = &v58[v23];
    v32 = &v5[v23];
    do
    {
      BOOL v33 = v25 == 47 || v25 == 0;
      float v34 = (float)(v30[v25] - *(float *)&v29[4 * v25]) * 0.5;
      if (v33) {
        float v34 = v30[v25] - *(float *)&v29[4 * v25];
      }
      float v35 = (float)(v28[v25] - *(float *)&v27[v25]) * 0.5;
      if (v26 >= 0x2E) {
        float v35 = v28[v25] - *(float *)&v27[v25];
      }
      float v36 = sqrtf((float)(v35 * v35) + (float)(v34 * v34));
      if (v34 == 0.0) {
        float v37 = 0.00001;
      }
      else {
        float v37 = v34;
      }
      float v38 = (atan2f(v35, v37) + 3.14159265) * 180.0 / 3.14159265;
      v32[v25] = v36;
      v31[v25++] = ceilf(v38 / 45.0);
    }
    while (v25 != 48);
    int v23 = v62 + 48;
    int v24 = v61 + 48;
    int v22 = v63 + 1;
    v4 = v56;
    v3 = v57;
    v13 = v59;
    v12 = v60;
  }
  while (v63 != 47);
  bzero(*a2, 0xAA0uLL);
  int v39 = 0;
  LODWORD(v40) = 0;
  do
  {
    int v41 = 0;
    uint64_t v40 = (int)v40;
    do
    {
      uint64_t v42 = 0;
      int v43 = (int)(float)(v58[v40] + -1.0);
      v44 = (float *)*a2;
      do
      {
        float v45 = v5[v40];
        if (v45 > 0.0)
        {
          int v46 = dword_1A410C520[v42]
              + v43
              + 8
              * (v39 / *(_DWORD *)&v64[v42 * 4] + *(_DWORD *)&v64[v42 * 4 + 32] * (v41 / *(_DWORD *)&v64[v42 * 4 + 16]));
          v44[v46] = v45 + v44[v46];
        }
        ++v42;
      }
      while (v42 != 4);
      ++v40;
      ++v41;
    }
    while (v41 != 48);
    ++v39;
  }
  while (v39 != 48);
  uint64_t v47 = 0;
  v48 = (char *)*a2;
  double v49 = 0.0;
  do
  {
    float32x4_t v50 = *(float32x4_t *)&v48[v47];
    float64x2_t v51 = vcvt_hight_f64_f32(v50);
    float64x2_t v52 = vcvtq_f64_f32(*(float32x2_t *)v50.f32);
    double v49 = v49 + v52.f64[0] + v52.f64[1] + v51.f64[0] + v51.f64[1];
    v47 += 16;
  }
  while (v47 != 2720);
  uint64_t v53 = 0;
  float64x2_t v54 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v49, 0);
  do
  {
    *(float32x4_t *)&v48[v53] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vdivq_f64(vcvtq_f64_f32(*(float32x2_t *)&v48[v53]), v54)), vdivq_f64(vcvt_hight_f64_f32(*(float32x4_t *)&v48[v53]), v54));
    v53 += 16;
  }
  while (v53 != 2720);
  free(v57);
  free(v56);
  free(v59);
  free(v60);
  free(v5);

  free(v58);
}

void vision::mod::LandmarkAttributes::init(void *a1, void *a2, char a3)
{
  std::string::basic_string[abi:ne180100]<0>(__p, "scorPdiffParameters");
  v6 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(a2, (unsigned __int8 *)__p);
  long double v7 = v6;
  if (v6)
  {
    if (*((_DWORD *)v6 + 10) == 2)
    {
      uint64_t v9 = *((void *)v6 + 6);
      uint64_t v8 = *((void *)v6 + 7);
      if (v8) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
      }
      uint64_t v10 = (std::__shared_weak_count *)a1[2];
      a1[1] = v9;
      a1[2] = v8;
      if (v10) {
        std::__shared_weak_count::__release_shared[abi:nn180100](v10);
      }
      *a1 = *((void *)v7 + 8);
      LOBYTE(v7) = 1;
    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }
  if (v44 < 0) {
    operator delete(__p[0]);
  }
  if ((v7 & 1) == 0) {
    goto LABEL_80;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "exprParameters");
  v11 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(a2, (unsigned __int8 *)__p);
  v12 = v11;
  if (v11)
  {
    if (*((_DWORD *)v11 + 10) == 2)
    {
      uint64_t v14 = *((void *)v11 + 6);
      uint64_t v13 = *((void *)v11 + 7);
      if (v13) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v13 + 8), 1uLL, memory_order_relaxed);
      }
      float v15 = (std::__shared_weak_count *)a1[12];
      a1[11] = v14;
      a1[12] = v13;
      if (v15) {
        std::__shared_weak_count::__release_shared[abi:nn180100](v15);
      }
      a1[10] = *((void *)v12 + 8);
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }
  if (v44 < 0) {
    operator delete(__p[0]);
  }
  if ((v12 & 1) == 0) {
    goto LABEL_80;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "blinkParametersApp");
  uint64_t v16 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(a2, (unsigned __int8 *)__p);
  float v17 = v16;
  if (v16)
  {
    if (*((_DWORD *)v16 + 10) == 2)
    {
      uint64_t v19 = *((void *)v16 + 6);
      uint64_t v18 = *((void *)v16 + 7);
      if (v18) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v18 + 8), 1uLL, memory_order_relaxed);
      }
      v20 = (std::__shared_weak_count *)a1[21];
      a1[20] = v19;
      a1[21] = v18;
      if (v20) {
        std::__shared_weak_count::__release_shared[abi:nn180100](v20);
      }
      a1[19] = *((void *)v17 + 8);
      LOBYTE(v17) = 1;
    }
    else
    {
      LOBYTE(v17) = 0;
    }
  }
  if (v44 < 0) {
    operator delete(__p[0]);
  }
  if ((v17 & 1) == 0) {
    goto LABEL_80;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "smileBlinkParametersGeo");
  unsigned int v21 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(a2, (unsigned __int8 *)__p);
  int v22 = v21;
  if (v21)
  {
    if (*((_DWORD *)v21 + 10) == 2)
    {
      uint64_t v24 = *((void *)v21 + 6);
      uint64_t v23 = *((void *)v21 + 7);
      if (v23) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v23 + 8), 1uLL, memory_order_relaxed);
      }
      uint64_t v25 = (std::__shared_weak_count *)a1[18];
      a1[17] = v24;
      a1[18] = v23;
      if (v25) {
        std::__shared_weak_count::__release_shared[abi:nn180100](v25);
      }
      a1[16] = *((void *)v22 + 8);
      LOBYTE(v22) = 1;
    }
    else
    {
      LOBYTE(v22) = 0;
    }
  }
  if (v44 < 0) {
    operator delete(__p[0]);
  }
  if ((v22 & 1) == 0) {
    goto LABEL_80;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "lmarkQuality");
  unsigned int v26 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(a2, (unsigned __int8 *)__p);
  v27 = v26;
  if (v26)
  {
    if (*((_DWORD *)v26 + 10) == 2)
    {
      uint64_t v29 = *((void *)v26 + 6);
      uint64_t v28 = *((void *)v26 + 7);
      if (v28) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v28 + 8), 1uLL, memory_order_relaxed);
      }
      v30 = (std::__shared_weak_count *)a1[5];
      a1[4] = v29;
      a1[5] = v28;
      if (v30) {
        std::__shared_weak_count::__release_shared[abi:nn180100](v30);
      }
      a1[3] = *((void *)v27 + 8);
      LOBYTE(v27) = 1;
    }
    else
    {
      LOBYTE(v27) = 0;
    }
  }
  if (v44 < 0) {
    operator delete(__p[0]);
  }
  if ((v27 & 1) == 0) {
    goto LABEL_80;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "exprParamsv1");
  v31 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(a2, (unsigned __int8 *)__p);
  v32 = v31;
  if (v31)
  {
    if (*((_DWORD *)v31 + 10) == 2)
    {
      uint64_t v34 = *((void *)v31 + 6);
      uint64_t v33 = *((void *)v31 + 7);
      if (v33) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v33 + 8), 1uLL, memory_order_relaxed);
      }
      float v35 = (std::__shared_weak_count *)a1[15];
      a1[14] = v34;
      a1[15] = v33;
      if (v35) {
        std::__shared_weak_count::__release_shared[abi:nn180100](v35);
      }
      a1[13] = *((void *)v32 + 8);
      LOBYTE(v32) = 1;
    }
    else
    {
      LOBYTE(v32) = 0;
    }
  }
  if (v44 < 0) {
    operator delete(__p[0]);
  }
  if ((v32 & 1) == 0) {
    goto LABEL_80;
  }
  if ((a3 & 1) == 0)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "pupilMeanStd");
    float v36 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(a2, (unsigned __int8 *)__p);
    if (v36 && (float v37 = v36, *((_DWORD *)v36 + 10) == 2))
    {
      uint64_t v39 = *((void *)v36 + 6);
      uint64_t v38 = *((void *)v36 + 7);
      if (v38) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v38 + 8), 1uLL, memory_order_relaxed);
      }
      uint64_t v40 = (std::__shared_weak_count *)a1[9];
      a1[8] = v39;
      a1[9] = v38;
      if (v40) {
        std::__shared_weak_count::__release_shared[abi:nn180100](v40);
      }
      a1[7] = *((void *)v37 + 8);
      char v41 = 1;
    }
    else
    {
      char v41 = 0;
    }
    if (v44 < 0) {
      operator delete(__p[0]);
    }
    if ((v41 & 1) == 0)
    {
LABEL_80:
      exception = __cxa_allocate_exception(8uLL);
      void *exception = 2936;
      __cxa_throw(exception, MEMORY[0x1E4FBA3E0], 0);
    }
  }
}

vision::mod::LandmarkAttributes *vision::mod::LandmarkAttributes::LandmarkAttributes(vision::mod::LandmarkAttributes *this, char *a2, char a3)
{
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  *((void *)this + 8) = 0;
  *((void *)this + 9) = 0;
  *((void *)this + 11) = 0;
  *((void *)this + 12) = 0;
  *((void *)this + 14) = 0;
  *((void *)this + 15) = 0;
  *((void *)this + 17) = 0;
  *((void *)this + 18) = 0;
  *((void *)this + 20) = 0;
  *((void *)this + 21) = 0;
  *((void *)this + 4) = 0;
  *((void *)this + 5) = 0;
  *((void *)this + 6) = 0;
  memset(v12, 0, sizeof(v12));
  int v13 = 1065353216;
  vision::mod::readBinSerializedModelValues(a2, vision::mod::LandmarkAttributes::sModelFileInfo, v12);
  vision::mod::LandmarkAttributes::init(this, v12, a3);
  if ((a3 & 1) == 0)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F61200]);
    long double v7 = (void *)[objc_alloc(MEMORY[0x1E4F611F0]) initWithPlatform:0];
    uint64_t v8 = [v6 initWithJSFile:a2 binSerializerId:"pupil" context:v7 computePath:0];
    uint64_t v9 = (void *)*((void *)this + 6);
    *((void *)this + 6) = v8;

    if (!*((void *)this + 6))
    {
      exception = __cxa_allocate_exception(8uLL);
      void *exception = 2936;
      __cxa_throw(exception, MEMORY[0x1E4FBA3E0], 0);
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,vision::mod::ModelValues::ValueInfo>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,vision::mod::ModelValues::ValueInfo>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,vision::mod::ModelValues::ValueInfo>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,vision::mod::ModelValues::ValueInfo>>>::~__hash_table((uint64_t)v12);
  return this;
}

void sub_1A4073584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__hash_table<std::__hash_value_type<std::string,vision::mod::ModelValues::ValueInfo>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,vision::mod::ModelValues::ValueInfo>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,vision::mod::ModelValues::ValueInfo>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,vision::mod::ModelValues::ValueInfo>>>::~__hash_table((uint64_t)&a9);
  v11 = *(std::__shared_weak_count **)(v9 + 168);
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v11);
  }
  v12 = *(std::__shared_weak_count **)(v9 + 144);
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v12);
  }
  int v13 = *(std::__shared_weak_count **)(v9 + 120);
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v13);
  }
  uint64_t v14 = *(std::__shared_weak_count **)(v9 + 96);
  if (v14) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v14);
  }
  float v15 = *(std::__shared_weak_count **)(v9 + 72);
  if (v15) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v15);
  }

  uint64_t v16 = *(std::__shared_weak_count **)(v9 + 40);
  if (v16) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v16);
  }
  float v17 = *(std::__shared_weak_count **)(v9 + 16);
  if (v17) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v17);
  }
  _Unwind_Resume(a1);
}

void *vision::mod::LandmarkAttributes::LandmarkAttributes(void *a1, void *a2, char a3)
{
  a1[1] = 0;
  a1[2] = 0;
  a1[8] = 0;
  a1[9] = 0;
  a1[11] = 0;
  a1[12] = 0;
  a1[14] = 0;
  a1[15] = 0;
  a1[17] = 0;
  a1[18] = 0;
  a1[20] = 0;
  a1[21] = 0;
  a1[4] = 0;
  a1[5] = 0;
  a1[6] = 0;
  vision::mod::LandmarkAttributes::init(a1, a2, a3);
  return a1;
}

void sub_1A407364C(_Unwind_Exception *a1)
{
  v3 = *(std::__shared_weak_count **)(v1 + 168);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v3);
  }
  v4 = *(std::__shared_weak_count **)(v1 + 144);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v4);
  }
  v5 = *(std::__shared_weak_count **)(v1 + 120);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v5);
  }
  id v6 = *(std::__shared_weak_count **)(v1 + 96);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v6);
  }
  long double v7 = *(std::__shared_weak_count **)(v1 + 72);
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v7);
  }

  uint64_t v8 = *(std::__shared_weak_count **)(v1 + 40);
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v8);
  }
  uint64_t v9 = *(std::__shared_weak_count **)(v1 + 16);
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v9);
  }
  _Unwind_Resume(a1);
}

void vision::mod::LandmarkAttributes::~LandmarkAttributes(vision::mod::LandmarkAttributes *this)
{
  v2 = (std::__shared_weak_count *)*((void *)this + 21);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v2);
  }
  v3 = (std::__shared_weak_count *)*((void *)this + 18);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v3);
  }
  v4 = (std::__shared_weak_count *)*((void *)this + 15);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v4);
  }
  v5 = (std::__shared_weak_count *)*((void *)this + 12);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v5);
  }
  id v6 = (std::__shared_weak_count *)*((void *)this + 9);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v6);
  }

  long double v7 = (std::__shared_weak_count *)*((void *)this + 5);
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v7);
  }
  uint64_t v8 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v8);
  }
}

float *vision::mod::LandmarkAttributes::computePixelDistanceFeature(void *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = (a3[1] - *a3) >> 3;
  int v21 = 0;
  result = (float *)std::vector<float>::vector(a1, ((unint64_t)((v5 - 1) * v5) >> 1) + 1, &v21);
  LODWORD(v7) = 0;
  uint64_t v8 = *a3;
  unint64_t v9 = a3[1] - *a3;
  uint64_t v10 = *(void *)result;
  if ((int)(v9 >> 3) >= 2)
  {
    uint64_t v11 = 0;
    LODWORD(v7) = 0;
    uint64_t v12 = (v9 >> 3) - 1;
    uint64_t v13 = (int)((uint64_t)v9 >> 3);
    uint64_t v14 = (v9 >> 3) - 1;
    float v15 = (float *)(v8 + 12);
    do
    {
      uint64_t v16 = v11 + 1;
      if (v11 + 1 < v13)
      {
        float v17 = (float *)(v8 + 8 * v11);
        uint64_t v7 = (int)v7;
        result = v15;
        uint64_t v18 = v14;
        do
        {
          float v19 = (float)(*v17 - *(result - 1)) / *(float *)(a2 + 12);
          float v20 = *result;
          result += 2;
          *(float *)(v10 + 4 * v7++) = sqrtf((float)((float)((float)(v17[1] - v20) / *(float *)(a2 + 8))* (float)((float)(v17[1] - v20) / *(float *)(a2 + 8)))+ (float)(v19 * v19));
          --v18;
        }
        while (v18);
      }
      --v14;
      v15 += 2;
      uint64_t v11 = v16;
    }
    while (v16 != v12);
  }
  *(_DWORD *)(v10 + 4 * (int)v7) = 1065353216;
  return result;
}

void sub_1A4073E4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void **tplTrackerResampler_alloc(uint64_t a1, uint64_t a2)
{
  v4 = (int64x2_t *)malloc_type_calloc(1uLL, 0x68uLL, 0x10100405B433AA0uLL);
  uint64_t v5 = (uint64_t *)v4;
  uint64_t v13 = v4;
  if (v4)
  {
    v4[4].i32[2] = 1066192077;
    v4->i64[0] = a1;
    v4->i64[1] = a2;
    v6.i64[0] = a1;
    v6.i64[1] = a2;
    int64x2_t v7 = vaddq_s64((int64x2_t)vcvtq_u64_f64(vcvtq_f64_f32(vrndp_f32(vmul_f32(vmul_f32(vcvt_f32_f64(vcvtq_f64_u64(v6)), (float32x2_t)vdup_n_s32(0x3F8CCCCDu)), (float32x2_t)vdup_n_s32(0x3F99999Au))))), vdupq_n_s64(8uLL));
    v4[1] = v7;
    size_t v8 = v7.i64[0] * v7.i64[1];
    unint64_t v9 = malloc_type_calloc(v7.i64[0] * v7.i64[1], 1uLL, 0x100004077774924uLL);
    v5[6] = (uint64_t)v9;
    if (!v9
      || (uint64_t v10 = malloc_type_calloc(v8, 1uLL, 0x100004077774924uLL), (v5[7] = (uint64_t)v10) == 0)
      || (uint64_t v11 = malloc_type_calloc(v8, 1uLL, 0x100004077774924uLL), (v5[8] = (uint64_t)v11) == 0))
    {
      tplTrackerResampler_free((void ***)&v13);
      return (void **)v13;
    }
  }
  return (void **)v5;
}

void tplTrackerResampler_free(void ***a1)
{
  if (a1)
  {
    v2 = *a1;
    if (*a1)
    {
      free(v2[6]);
      free(v2[7]);
      free(v2[8]);
      free(v2);
    }
    *a1 = 0;
  }
}

uint64_t tplTrackerResampler_setImage(uint64_t a1, CVPixelBufferRef pixelBuffer, double *a3)
{
  if (!a1) {
    goto LABEL_169;
  }
  if (CVPixelBufferLockBaseAddress(pixelBuffer, 1uLL))
  {
    uint64_t v6 = 6782;
    goto LABEL_170;
  }
  BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 0);
  v171[0] = BaseAddressOfPlane;
  size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(pixelBuffer, 0);
  v171[1] = HeightOfPlane;
  size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(pixelBuffer, 0);
  v171[2] = WidthOfPlane;
  size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 0);
  v171[3] = BytesPerRowOfPlane;
  uint64_t v11 = CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 1uLL);
  v170[0] = v11;
  v170[1] = CVPixelBufferGetHeightOfPlane(pixelBuffer, 1uLL);
  v170[2] = CVPixelBufferGetWidthOfPlane(pixelBuffer, 1uLL);
  size_t v12 = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 1uLL);
  v170[3] = v12;
  if (!*(void *)a1) {
    goto LABEL_169;
  }
  unint64_t v13 = *(void *)(a1 + 8);
  if (!v13) {
    goto LABEL_169;
  }
  uint64_t v14 = v12;
  uint64_t v169 = (uint64_t)v11;
  double v15 = a3[4];
  double v16 = a3[5];
  double v17 = a3[1];
  float v18 = v15 - *a3 + 1.0;
  float v19 = v16 - v17 + 1.0;
  float v20 = *(float *)(a1 + 72) + -1.0;
  float v21 = v18 / (float)*(unint64_t *)a1;
  float v22 = v19 / (float)v13;
  double v23 = (float)((float)(v20 * v18) * 0.5);
  float v24 = *a3 - v23;
  unsigned int v25 = vcvtms_s32_f32(v24);
  double v26 = (float)((float)(v20 * v19) * 0.5);
  float v27 = v17 - v26;
  unsigned int v28 = vcvtms_s32_f32(v27);
  if (v21 >= v22) {
    float v29 = v21;
  }
  else {
    float v29 = v22;
  }
  float v30 = v15 + v23;
  unsigned int v31 = vcvtps_s32_f32(v30);
  float v32 = v16 + v26;
  unsigned int v33 = vcvtps_s32_f32(v32);
  if (v29 < 1.2)
  {
    unint64_t v34 = (v28 & 0xFFFFFFFE) - 2;
    unint64_t v35 = HeightOfPlane - 1;
    if (HeightOfPlane - 1 < v34) {
      LODWORD(v34) = HeightOfPlane - 1;
    }
    signed int v36 = v25 & 0xFFFFFFFE;
    if ((int)(v28 & 0xFFFFFFFE) <= 2) {
      uint64_t v37 = 0;
    }
    else {
      uint64_t v37 = v34;
    }
    unint64_t v38 = (v36 - 2);
    unint64_t v39 = WidthOfPlane - 1;
    if (WidthOfPlane - 1 < v38) {
      LODWORD(v38) = WidthOfPlane - 1;
    }
    if (v36 <= 2) {
      LODWORD(v38) = 0;
    }
    signed int v40 = v31 & 0xFFFFFFFE;
    if (v39 >= (v31 & 0xFFFFFFFE) + 4) {
      LODWORD(v39) = v40 + 4;
    }
    if (v40 <= -4) {
      LODWORD(v39) = 0;
    }
    signed int v41 = v33 & 0xFFFFFFFE;
    if (v35 >= (v33 & 0xFFFFFFFE) + 4) {
      LODWORD(v35) = v41 + 4;
    }
    if (v41 <= -4) {
      int v42 = 0;
    }
    else {
      int v42 = v35;
    }
    int v43 = v39 - v38;
    int v44 = v39 - v38 + 1;
    if (*(void *)(a1 + 16) >= (unint64_t)v44)
    {
      int v45 = v42 - v37;
      int v46 = v45 + 1;
      if (*(void *)(a1 + 24) >= (unint64_t)(v45 + 1))
      {
        *(void *)(a1 + 32) = v44;
        *(void *)(a1 + 40) = v46;
        *(void *)(a1 + 76) = 0x400000003F800000;
        *(float *)(a1 + 84) = (float)(int)v38;
        *(float *)(a1 + 88) = (float)(int)v37;
        *(float *)(a1 + 92) = (float)(int)v38 + 0.5;
        *(float *)(a1 + 96) = (float)(int)v37 + 0.5;
        *(unsigned char *)(a1 + 100) = 1;
        if (v45 != -1)
        {
          uint64_t v47 = 0;
          uint64_t v48 = *(void *)(a1 + 48);
          double v49 = &BaseAddressOfPlane[BytesPerRowOfPlane * v37 + v38];
          do
          {
            if (v44)
            {
              for (uint64_t i = 0; i != v44; ++i)
                *(unsigned char *)(v48 + i) = v49[i];
            }
            v49 += BytesPerRowOfPlane;
            v48 += v44;
            ++v47;
          }
          while (v47 != v46);
          int v51 = v44 + (v44 < 0);
          int v52 = v46 >= 0 ? v45 + 1 : v45 + 2;
          if ((v45 + 2) >= 3)
          {
            uint64_t v53 = 0;
            uint64_t v54 = (uint64_t)v51 >> 1;
            uint64_t v55 = (uint64_t)v52 >> 1;
            uint64_t v57 = *(void *)(a1 + 56);
            uint64_t v56 = *(void *)(a1 + 64);
            uint64_t v58 = (v38 & 0xFFFFFFFE) + v14 * (v37 >> 1);
            unsigned int v59 = v43 + 2;
            uint64_t v60 = v58 + v169 + 1;
            uint64_t v6 = 6784;
            do
            {
              if (v59 >= 3)
              {
                uint64_t v61 = 0;
                int v62 = (char *)v60;
                do
                {
                  *(unsigned char *)(v57 + v61) = *(v62 - 1);
                  char v63 = *v62;
                  v62 += 2;
                  *(unsigned char *)(v56 + v61++) = v63;
                }
                while (v54 != v61);
              }
              v57 += v54;
              v56 += v54;
              ++v53;
              v60 += v14;
            }
            while (v53 != v55);
            goto LABEL_170;
          }
        }
LABEL_110:
        uint64_t v6 = 6784;
        goto LABEL_170;
      }
    }
LABEL_169:
    uint64_t v6 = 6780;
    goto LABEL_170;
  }
  if (v29 >= 2.4)
  {
    if (v29 < 4.8)
    {
      unint64_t v94 = (v28 & 0xFFFFFFFC) - 4;
      unint64_t v95 = HeightOfPlane - 1;
      if (HeightOfPlane - 1 < v94) {
        LODWORD(v94) = HeightOfPlane - 1;
      }
      signed int v96 = v25 & 0xFFFFFFFC;
      if ((int)(v28 & 0xFFFFFFFC) <= 4) {
        uint64_t v97 = 0;
      }
      else {
        uint64_t v97 = v94;
      }
      unint64_t v98 = (v96 - 4);
      size_t v99 = WidthOfPlane - 1;
      if (WidthOfPlane - 1 < v98) {
        LODWORD(v98) = WidthOfPlane - 1;
      }
      if (v96 <= 4) {
        uint64_t v100 = 0;
      }
      else {
        uint64_t v100 = v98;
      }
      size_t v101 = (v31 & 0xFFFFFFFC) + 8;
      if (v99 < v101) {
        LODWORD(v101) = v99;
      }
      if ((int)(v31 & 0xFFFFFFFC) <= -8) {
        LODWORD(v101) = 0;
      }
      signed int v102 = v33 & 0xFFFFFFFC;
      if (v95 >= (v33 & 0xFFFFFFFC) + 8) {
        LODWORD(v95) = v102 + 8;
      }
      if (v102 <= -8) {
        int v103 = 0;
      }
      else {
        int v103 = v95;
      }
      int v104 = v101 - v100 + 1;
      if (*(void *)(a1 + 16) >= (unint64_t)(v104 >> 2))
      {
        int v105 = v103 - v97 + 1;
        if (*(void *)(a1 + 24) >= (unint64_t)(v105 >> 2))
        {
          *(void *)(a1 + 32) = (uint64_t)v104 >> 2;
          *(void *)(a1 + 40) = (uint64_t)v105 >> 2;
          __asm { FMOV            V0.2S, #4.0 }
          *(void *)(a1 + 76) = _D0;
          *(float *)&_D0 = (float)(int)v100 + 1.5;
          float v110 = (float)(int)v97 + 1.5;
          *(_DWORD *)(a1 + 84) = _D0;
          *(float *)(a1 + 88) = v110;
          *(_DWORD *)(a1 + 92) = _D0;
          *(float *)(a1 + 96) = v110;
          *(unsigned char *)(a1 + 100) = 0;
          tplTrackerResampler_lumaDownscale4((uint64_t)BaseAddressOfPlane, BytesPerRowOfPlane, v100, v97, v104, v105, *(void *)(a1 + 48));
          if (v104 >= 0) {
            int v111 = v104;
          }
          else {
            int v111 = v104 + 1;
          }
          unint64_t v112 = (uint64_t)v111 >> 1;
          if (v105 >= 0) {
            int v113 = v105;
          }
          else {
            int v113 = v105 + 1;
          }
          tplTrackerResampler_chromaDownscale2(v169, v14, v100 >> 1, v97 >> 1, v112, (uint64_t)v113 >> 1, *(void *)(a1 + 56), *(void *)(a1 + 64));
          goto LABEL_110;
        }
      }
      goto LABEL_169;
    }
    if (v29 <= 9.6)
    {
      unint64_t v151 = (v28 & 0xFFFFFFF8) - 8;
      unint64_t v152 = HeightOfPlane - 1;
      if (HeightOfPlane - 1 < v151) {
        LODWORD(v151) = HeightOfPlane - 1;
      }
      signed int v153 = v25 & 0xFFFFFFF8;
      if ((int)(v28 & 0xFFFFFFF8) <= 8) {
        uint64_t v154 = 0;
      }
      else {
        uint64_t v154 = v151;
      }
      unint64_t v155 = (v153 - 8);
      size_t v156 = WidthOfPlane - 1;
      if (WidthOfPlane - 1 < v155) {
        LODWORD(v155) = WidthOfPlane - 1;
      }
      if (v153 <= 8) {
        uint64_t v157 = 0;
      }
      else {
        uint64_t v157 = v155;
      }
      size_t v158 = (v31 & 0xFFFFFFF8) + 16;
      if (v156 < v158) {
        LODWORD(v158) = v156;
      }
      if ((int)(v31 & 0xFFFFFFF8) <= -16) {
        LODWORD(v158) = 0;
      }
      signed int v159 = v33 & 0xFFFFFFF8;
      if (v152 >= (v33 & 0xFFFFFFF8) + 16) {
        LODWORD(v152) = v159 + 16;
      }
      if (v159 <= -16) {
        int v160 = 0;
      }
      else {
        int v160 = v152;
      }
      int v161 = v158 - v157 + 1;
      if (*(void *)(a1 + 16) < (unint64_t)(v161 >> 3)) {
        goto LABEL_169;
      }
      int v162 = v160 - v154 + 1;
      if (*(void *)(a1 + 24) < (unint64_t)(v162 >> 3)) {
        goto LABEL_169;
      }
      *(void *)(a1 + 32) = (uint64_t)v161 >> 3;
      *(void *)(a1 + 40) = (uint64_t)v162 >> 3;
      *(void *)(a1 + 76) = 0x4100000041000000;
      float v164 = (float)(int)v157 + 3.5;
      float v165 = (float)(int)v154 + 3.5;
      *(float *)(a1 + 84) = v164;
      *(float *)(a1 + 88) = v165;
      *(float *)(a1 + 92) = v164;
      *(float *)(a1 + 96) = v165;
      *(unsigned char *)(a1 + 100) = 0;
      uint64_t v6 = tplTrackerResampler_lumaDownscale8N(v171, v157, v154, v161, v162, 1, *(void *)(a1 + 48));
      if (v6 == 128)
      {
        if (v161 >= 0) {
          int v166 = v161;
        }
        else {
          int v166 = v161 + 1;
        }
        unint64_t v167 = (uint64_t)v166 >> 1;
        if (v162 >= 0) {
          int v168 = v162;
        }
        else {
          int v168 = v162 + 1;
        }
        tplTrackerResampler_chromaDownscale4(v169, v14, v157 >> 1, v154 >> 1, v167, (uint64_t)v168 >> 1, *(void *)(a1 + 56), *(void *)(a1 + 64));
      }
    }
    else
    {
      unsigned int v114 = v33;
      char v115 = vcvtps_s32_f32(log2f(v29 / 1.2));
      int v116 = 1 << v115;
      int v117 = -(1 << v115);
      size_t v118 = HeightOfPlane - 1;
      unsigned int v119 = (2 << v115) + v114;
      unint64_t v120 = v119 & v117;
      _VF = __OFSUB__(HeightOfPlane - 1, v120);
      if (HeightOfPlane - 1 < v120) {
        LODWORD(v120) = HeightOfPlane - 1;
      }
      char v122 = ((v119 & v117 & 0x80000000) != 0) ^ _VF | ((v119 & v117) == 0);
      unsigned int v123 = (2 << v115) + v31;
      if (v122) {
        int v124 = 0;
      }
      else {
        int v124 = v120;
      }
      size_t v125 = WidthOfPlane - 1;
      unint64_t v126 = v123 & v117;
      BOOL v127 = __OFSUB__(WidthOfPlane - 1, v126);
      if (WidthOfPlane - 1 < v126) {
        LODWORD(v126) = WidthOfPlane - 1;
      }
      if (((v123 & v117 & 0x80000000) != 0) ^ v127 | ((v123 & v117) == 0)) {
        int v128 = 0;
      }
      else {
        int v128 = v126;
      }
      unsigned int v129 = v28 - v116;
      size_t v130 = (v28 - v116) & v117;
      BOOL v131 = __OFSUB__(v118, v130);
      if (v118 >= v130) {
        LODWORD(v118) = v129 & v117;
      }
      if (((v129 & v117 & 0x80000000) != 0) ^ v131 | ((v129 & v117) == 0)) {
        int v132 = 0;
      }
      else {
        int v132 = v118;
      }
      unsigned int v133 = v25 - v116;
      size_t v134 = (v25 - v116) & v117;
      BOOL v135 = __OFSUB__(v125, v134);
      if (v125 >= v134) {
        LODWORD(v125) = v133 & v117;
      }
      if (((v133 & v117 & 0x80000000) != 0) ^ v135 | ((v133 & v117) == 0)) {
        int v136 = 0;
      }
      else {
        int v136 = v125;
      }
      int v137 = v128 - v136 + 1;
      int v138 = v137 >> v115;
      if (*(void *)(a1 + 16) < (unint64_t)(v137 >> v115)) {
        goto LABEL_169;
      }
      int v139 = v124 - v132 + 1;
      int v140 = v139 >> v115;
      if (*(void *)(a1 + 24) < (unint64_t)v140) {
        goto LABEL_169;
      }
      *(void *)(a1 + 32) = v138;
      *(void *)(a1 + 40) = v140;
      *(float *)(a1 + 76) = (float)v116;
      *(float *)(a1 + 80) = (float)v116;
      float v141 = (float)v116 + -1.0;
      float v142 = (float)v136 + (float)(v141 * 0.5);
      float v143 = (float)v132 + (float)(v141 * 0.5);
      *(float *)(a1 + 84) = v142;
      *(float *)(a1 + 88) = v143;
      *(float *)(a1 + 92) = v142;
      *(float *)(a1 + 96) = v143;
      *(unsigned char *)(a1 + 100) = 0;
      uint64_t v6 = tplTrackerResampler_lumaDownscale8N(v171, v136, v132, v137, v139, (uint64_t)v116 >> 3, *(void *)(a1 + 48));
      if (v6 == 128)
      {
        if (v136 >= 0) {
          int v144 = v136;
        }
        else {
          int v144 = v136 + 1;
        }
        uint64_t v145 = (uint64_t)v144 >> 1;
        if (v132 >= 0) {
          int v146 = v132;
        }
        else {
          int v146 = v132 + 1;
        }
        uint64_t v147 = (uint64_t)v146 >> 1;
        if (v137 >= 0) {
          int v148 = v137;
        }
        else {
          int v148 = v137 + 1;
        }
        unint64_t v149 = (uint64_t)v148 >> 1;
        if (v139 >= 0) {
          int v150 = v139;
        }
        else {
          int v150 = v139 + 1;
        }
        uint64_t v6 = tplTrackerResampler_chromaDownscale8N(v170, v145, v147, v149, (uint64_t)v150 >> 1, (uint64_t)v116 >> 4, *(void *)(a1 + 56), *(void *)(a1 + 64));
      }
    }
  }
  else
  {
    unint64_t v64 = (v28 & 0xFFFFFFFE) - 2;
    unint64_t v65 = HeightOfPlane - 1;
    if (HeightOfPlane - 1 < v64) {
      LODWORD(v64) = HeightOfPlane - 1;
    }
    signed int v66 = v25 & 0xFFFFFFFE;
    if ((int)(v28 & 0xFFFFFFFE) <= 2) {
      uint64_t v67 = 0;
    }
    else {
      uint64_t v67 = v64;
    }
    unint64_t v68 = (v66 - 2);
    size_t v69 = WidthOfPlane - 1;
    if (WidthOfPlane - 1 < v68) {
      LODWORD(v68) = WidthOfPlane - 1;
    }
    if (v66 <= 2) {
      uint64_t v70 = 0;
    }
    else {
      uint64_t v70 = v68;
    }
    size_t v71 = (v31 & 0xFFFFFFFE) + 4;
    if (v69 < v71) {
      LODWORD(v71) = v69;
    }
    if ((int)(v31 & 0xFFFFFFFE) <= -4) {
      int v72 = 0;
    }
    else {
      int v72 = v71;
    }
    signed int v73 = v33 & 0xFFFFFFFE;
    if (v65 >= (v33 & 0xFFFFFFFE) + 4) {
      LODWORD(v65) = v73 + 4;
    }
    if (v73 <= -4) {
      int v74 = 0;
    }
    else {
      int v74 = v65;
    }
    int v75 = v72 - v70;
    int v76 = v72 - v70 + 1;
    int v77 = v75 + 2;
    if (v75 >= -1) {
      int v77 = v75 + 1;
    }
    if (*(void *)(a1 + 16) < (unint64_t)(v77 >> 1)) {
      goto LABEL_169;
    }
    int v78 = v74 - v67;
    int v79 = v74 - v67 + 1;
    int v80 = v78 >= -1 ? v79 : v79 + 1;
    if (*(void *)(a1 + 24) < (unint64_t)(v80 >> 1)) {
      goto LABEL_169;
    }
    uint64_t v81 = (uint64_t)v77 >> 1;
    uint64_t v82 = (uint64_t)v80 >> 1;
    *(void *)(a1 + 32) = v81;
    *(void *)(a1 + 40) = v82;
    *(void *)(a1 + 76) = 0x4000000040000000;
    float v83 = (float)(int)v70 + 0.5;
    float v84 = (float)(int)v67 + 0.5;
    *(float *)(a1 + 84) = v83;
    *(float *)(a1 + 88) = v84;
    *(float *)(a1 + 92) = v83;
    *(float *)(a1 + 96) = v84;
    *(unsigned char *)(a1 + 100) = 0;
    uint64_t v85 = BytesPerRowOfPlane;
    int v86 = v78;
    tplTrackerResampler_lumaDownscale2((uint64_t)BaseAddressOfPlane, v85, v70, v67, v76, v79, *(void *)(a1 + 48));
    if ((v86 + 2) < 3) {
      goto LABEL_110;
    }
    uint64_t v87 = 0;
    uint64_t v89 = *(void *)(a1 + 56);
    uint64_t v88 = *(void *)(a1 + 64);
    uint64_t v90 = (v70 & 0xFFFFFFFE) + v14 * (v67 >> 1) + v169 + 1;
    uint64_t v6 = 6784;
    do
    {
      if ((v75 + 2) >= 3)
      {
        uint64_t v91 = 0;
        v92 = (char *)v90;
        do
        {
          *(unsigned char *)(v89 + v91) = *(v92 - 1);
          char v93 = *v92;
          v92 += 2;
          *(unsigned char *)(v88 + v91++) = v93;
        }
        while (v81 != v91);
      }
      v89 += v81;
      v88 += v81;
      ++v87;
      v90 += v14;
    }
    while (v87 != v82);
  }
LABEL_170:
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
  return v6;
}

void tplTrackerResampler_resample(uint64_t a1, double *a2, unsigned int a3, int a4, uint64_t a5, unsigned char *a6, unsigned char *a7, int *a8, float a9, float a10)
{
  int v10 = a4;
  if ((int)a3 < 1)
  {
    int v13 = 0;
    int v70 = 0;
    goto LABEL_56;
  }
  uint64_t v12 = 0;
  int v13 = 0;
  int v76 = 0;
  float v14 = *(float *)(a1 + 76);
  float v15 = *(float *)(a1 + 80);
  float v16 = a10 / v14;
  float v17 = a9 / v14;
  float v18 = a10 / v15;
  char v19 = *(unsigned char *)(a1 + 100);
  size_t v71 = a8;
  unint64_t v72 = *(void *)(a1 + 32);
  unint64_t v20 = v72 >> v19;
  unint64_t v21 = *(void *)(a1 + 40) >> v19;
  float v22 = (a2[1] - *(float *)(a1 + 96)) / v15;
  int v77 = a3;
  uint64_t v23 = a3;
  int v24 = a4;
  float v25 = a9 / v15;
  uint64_t v75 = a3;
  do
  {
    signed int v26 = vcvtms_s32_f32(v22);
    int v27 = v26 + 1;
    if (v22 >= 0.0 && v21 > v27)
    {
      if ((int)v12 >= v77) {
        int v32 = v77;
      }
      else {
        int v32 = v12;
      }
      int v77 = v32;
      if ((int)v12 <= v76) {
        int v33 = v76;
      }
      else {
        int v33 = v12;
      }
      int v76 = v33;
      if (v10 >= 1)
      {
        uint64_t v34 = 0;
        unsigned int v35 = (float)((float)((float)((float)v27 - v22) * 255.0) + 0.5);
        unsigned int v36 = 255 - v35;
        unint64_t v37 = v20 * v26;
        unint64_t v38 = *(void *)(a1 + 56) + v37;
        unint64_t v39 = *(void *)(a1 + 64) + v37;
        float v40 = (*a2 - *(float *)(a1 + 92)) / *(float *)(a1 + 80);
        do
        {
          unsigned int v41 = vcvtms_s32_f32(v40);
          if ((v41 & 0x80000000) != 0 || (uint64_t v42 = v41 + 1, v20 <= v42))
          {
            a6[v34] = 0x80;
            a7[v34] = 0x80;
          }
          else
          {
            float v43 = (float)((float)((float)(int)v42 - v40) * 255.0) + 0.5;
            unsigned int v44 = 255 - v43;
            unsigned int v45 = (v44 * *(unsigned __int8 *)(v38 + v42) + *(unsigned __int8 *)(v38 + v41) * v43 + 191) >> 8;
            unsigned int v46 = (v44 * *(unsigned __int8 *)(v38 + v20 + v42)
                 + *(unsigned __int8 *)(v38 + v20 + v41) * v43
                 + 191) >> 8;
            unsigned int v47 = (v44 * *(unsigned __int8 *)(v39 + v42) + *(unsigned __int8 *)(v39 + v41) * v43 + 191) >> 8;
            unsigned int v48 = (v44 * *(unsigned __int8 *)(v39 + v20 + v42)
                 + *(unsigned __int8 *)(v39 + v20 + v41) * v43
                 + 191) >> 8;
            unsigned int v49 = v46 * v36 + v45 * v35 + 191;
            unsigned int v50 = HIWORD(v49);
            unsigned int v51 = v49 >> 8;
            if (v50) {
              LOBYTE(v51) = -1;
            }
            a6[v34] = v51;
            unsigned int v52 = v48 * v36 + v47 * v35 + 191;
            unsigned int v53 = HIWORD(v52);
            unsigned int v54 = v52 >> 8;
            if (v53) {
              LOBYTE(v54) = -1;
            }
            a7[v34] = v54;
            if ((int)v34 < v24) {
              int v24 = v34;
            }
            if ((int)v34 > v13) {
              int v13 = v34;
            }
          }
          float v40 = v18 + v40;
          ++v34;
        }
        while (v10 != v34);
        uint64_t v23 = a3;
      }
    }
    else if (v10 >= 1)
    {
      float v29 = a6;
      float v30 = a7;
      uint64_t v31 = v10;
      do
      {
        *v29++ = 0x80;
        *v30++ = 0x80;
        --v31;
      }
      while (v31);
    }
    float v22 = v25 + v22;
    ++v12;
    a7 += v10;
    a6 += v10;
  }
  while (v12 != v23);
  uint64_t v55 = 0;
  float v56 = (a2[1] - *(float *)(a1 + 88)) / *(float *)(a1 + 76);
  uint64_t v57 = a5;
  do
  {
    if (v55 < v77
      || v55 > v76
      || v56 < 0.0
      || (signed int v58 = vcvtms_s32_f32(v56), *(void *)(a1 + 40) <= (unint64_t)(v58 + 1)))
    {
      if (v10 >= 1)
      {
        bzero((void *)(a5 + (int)v55 * v10), v10);
        uint64_t v23 = v75;
      }
    }
    else if (v10 >= 1)
    {
      uint64_t v59 = 0;
      unsigned int v60 = (float)((float)((float)((float)(v58 + 1) - v56) * 255.0) + 0.5);
      uint64_t v61 = *(void *)(a1 + 48) + v72 * v58;
      float v62 = (*a2 - *(float *)(a1 + 84)) / *(float *)(a1 + 76);
      do
      {
        if (v59 < v24) {
          goto LABEL_48;
        }
        char v63 = 0;
        if (v59 > v13) {
          goto LABEL_49;
        }
        unsigned int v64 = vcvtms_s32_f32(v62);
        if ((v64 & 0x80000000) != 0) {
          goto LABEL_49;
        }
        uint64_t v65 = v64 + 1;
        if (*(void *)(a1 + 32) <= (unint64_t)v65)
        {
LABEL_48:
          char v63 = 0;
        }
        else
        {
          unsigned int v66 = (float)((float)((float)((float)(int)v65 - v62) * 255.0) + 0.5);
          unsigned int v67 = (((255 - v66) * *(unsigned __int8 *)(v61 + v72 + v65) + *(unsigned __int8 *)(v61 + v72 + v64) * v66 + 191) >> 8)
              * (255 - v60)
              + (((255 - v66) * *(unsigned __int8 *)(v61 + v65) + *(unsigned __int8 *)(v61 + v64) * v66 + 191) >> 8)
              * v60
              + 191;
          unsigned int v68 = HIWORD(v67);
          unsigned int v69 = v67 >> 8;
          if (v68) {
            char v63 = -1;
          }
          else {
            char v63 = v69;
          }
        }
LABEL_49:
        *(unsigned char *)(v57 + v59) = v63;
        float v62 = v16 + v62;
        ++v59;
      }
      while (v10 != v59);
    }
    float v56 = v17 + v56;
    ++v55;
    v57 += v10;
  }
  while (v55 != v23);
  int v10 = v24;
  a8 = v71;
  int v70 = v76;
  a3 = v77;
LABEL_56:
  *a8 = v10;
  a8[1] = a3;
  a8[2] = v13;
  a8[3] = v70;
}

void sub_1A40755C4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  objc_begin_catch(a1);
  JUMPOUT(0x1A4075560);
}

void sub_1A4075990(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double VNAffineTransformForVisionToTopLeftOriginOrientation@<D0>(int a1@<W0>, int a2@<W1>, uint64_t a3@<X8>)
{
  if (a1)
  {
    *(void *)(a3 + 8) = 0;
    *(void *)(a3 + 16) = 0;
    *(void *)a3 = 0x3FF0000000000000;
    *(void *)&long long v5 = 0xBFF0000000000000;
    *(_OWORD *)(a3 + 24) = xmmword_1A410C170;
    *(void *)(a3 + 40) = 0x3FF0000000000000;
  }
  else
  {
    uint64_t v6 = MEMORY[0x1E4F1DAB8];
    long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)a3 = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)(a3 + 16) = v7;
    long long v5 = *(_OWORD *)(v6 + 32);
    *(_OWORD *)(a3 + 32) = v5;
  }
  if ((a2 - 2) <= 6)
  {
    long long v8 = *(_OWORD *)(a3 + 16);
    *(_OWORD *)&t1.a = *(_OWORD *)a3;
    *(_OWORD *)&t1.c = v8;
    *(_OWORD *)&t1.tx = *(_OWORD *)(a3 + 32);
    CGAffineTransformMakeTranslation(&t2, -0.5, -0.5);
    CGAffineTransformConcat((CGAffineTransform *)a3, &t1, &t2);
    char v9 = kVisionToOrientationRotationMirrorState[2 * a2];
    if (v9)
    {
      long long v10 = *(_OWORD *)(a3 + 16);
      *(_OWORD *)&v22.a = *(_OWORD *)a3;
      *(_OWORD *)&v22.c = v10;
      *(_OWORD *)&v22.tx = *(_OWORD *)(a3 + 32);
      CGAffineTransformMakeRotation(&v21, (double)v9 * 90.0 * 0.0174532925);
      CGAffineTransformConcat(&v23, &v22, &v21);
      long long v11 = *(_OWORD *)&v23.c;
      *(_OWORD *)a3 = *(_OWORD *)&v23.a;
      *(_OWORD *)(a3 + 16) = v11;
      *(_OWORD *)(a3 + 32) = *(_OWORD *)&v23.tx;
    }
    if (((0x14BuLL >> a2) & 1) == 0)
    {
      long long v12 = *(_OWORD *)(a3 + 16);
      *(_OWORD *)&v20.a = *(_OWORD *)a3;
      *(_OWORD *)&v20.c = v12;
      *(_OWORD *)&v20.tx = *(_OWORD *)(a3 + 32);
      CGAffineTransformMakeScale(&v19, -1.0, 1.0);
      CGAffineTransformConcat(&v23, &v20, &v19);
      long long v13 = *(_OWORD *)&v23.c;
      *(_OWORD *)a3 = *(_OWORD *)&v23.a;
      *(_OWORD *)(a3 + 16) = v13;
      *(_OWORD *)(a3 + 32) = *(_OWORD *)&v23.tx;
    }
    long long v14 = *(_OWORD *)(a3 + 16);
    *(_OWORD *)&v18.a = *(_OWORD *)a3;
    *(_OWORD *)&v18.c = v14;
    *(_OWORD *)&v18.tx = *(_OWORD *)(a3 + 32);
    CGAffineTransformMakeTranslation(&v17, 0.5, 0.5);
    CGAffineTransformConcat(&v23, &v18, &v17);
    long long v15 = *(_OWORD *)&v23.c;
    *(_OWORD *)a3 = *(_OWORD *)&v23.a;
    *(_OWORD *)(a3 + 16) = v15;
    *(CGFloat *)&long long v5 = v23.tx;
    *(_OWORD *)(a3 + 32) = *(_OWORD *)&v23.tx;
  }
  return *(double *)&v5;
}

void sub_1A4075CCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A4075DA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A4075F9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A40762CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_1A4076750(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_1A4076838(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A407696C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A40769D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A4076A20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A4076C18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A4076D84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A40770FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A40771C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A40773A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A40775B0(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v4);
  operator delete(v6);

  _Unwind_Resume(a1);
}

void sub_1A40778D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, std::__shared_weak_count *a12, uint64_t a13, std::__shared_weak_count *a14)
{
  if (a12) {
    std::__shared_weak_count::__release_shared[abi:nn180100](a12);
  }

  if (a14) {
    std::__shared_weak_count::__release_shared[abi:nn180100](a14);
  }

  _Unwind_Resume(a1);
}

void sub_1A4077B24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A4077D30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

void sub_1A40784D4(_Unwind_Exception *a1)
{
  std::ostream::~ostream();
  std::streambuf::~streambuf();

  _Unwind_Resume(a1);
}

void sub_1A407889C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, vision::mod::FaceID3Model *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,id a43)
{
  std::unique_ptr<vision::mod::FaceID3Model>::reset[abi:ne180100](&a12);
  std::istream::~istream();

  std::streambuf::~streambuf();
  _Unwind_Resume(a1);
}

void ___ZL54_serialNumberToPersonUniqueIdentifierDictionaryClassesv_block_invoke_35489()
{
  v0 = (void *)MEMORY[0x1A6257080]();
  uint64_t v1 = VNEntityUniqueIdentifierClasses();
  v2 = (void *)[v1 mutableCopy];

  [v2 addObject:objc_opt_class()];
  uint64_t v3 = [v2 copy];
  v4 = (void *)_serialNumberToPersonUniqueIdentifierDictionaryClasses(void)::classes;
  _serialNumberToPersonUniqueIdentifierDictionaryClasses(void)::classes = v3;
}

void sub_1A40789F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A4078BB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A4078D78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A4079080(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,id a38)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a33, 8);

  _Block_object_dispose((const void *)(v40 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__17(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__18(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy__35495(uint64_t result, uint64_t a2)
{
  *(void *)(result + 48) = &unk_1EF752200;
  *(void *)(result + 56) = *(void *)(a2 + 56);
  return result;
}

void sub_1A40794AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void **a15, void *a16, uint64_t a17, char a18)
{
  std::__tree<std::__value_type<long long,int>,std::__map_value_compare<long long,std::__value_type<long long,int>,std::less<long long>,true>,std::allocator<std::__value_type<long long,int>>>::destroy(a16);
  a15 = (void **)&a18;
  std::vector<std::map<int,double>>::__destroy_vector::operator()[abi:ne180100](&a15);

  _Unwind_Resume(a1);
}

void sub_1A40795A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A4079748(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A40798B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A407A064(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,std::__shared_weak_count *a35,uint64_t a36,std::__shared_weak_count *a37,void *__p,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42)
{
  if (__p) {
    operator delete(__p);
  }
  if (a37) {
    std::__shared_weak_count::__release_shared[abi:nn180100](a37);
  }
  if (a35) {
    std::__shared_weak_count::__release_shared[abi:nn180100](a35);
  }
  _Block_object_dispose((const void *)(v45 - 224), 8);

  _Block_object_dispose((const void *)(v45 - 168), 8);
  if (v44) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v44);
  }

  unsigned int v47 = *(void **)(v45 - 248);
  if (v47)
  {
    *(void *)(v45 - 240) = v47;
    operator delete(v47);
  }
  if (v43) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v43);
  }

  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__90(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[3];
  a1[3] = result;
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  return result;
}

void __Block_byref_object_dispose__91(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 56);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v1);
  }
}

uint64_t ___ZL15_newFaceIDModelP27VNPersonsModelConfigurationPU15__autoreleasingP7NSError_block_invoke(uint64_t a1)
{
  std::allocate_shared[abi:ne180100]<vision::mod::FaceID3Model,std::allocator<vision::mod::FaceID3Model>,int const&,int const&,int const&,vision::mod::FaceIDIndexMode const&,void>(&v5, *(_DWORD *)(a1 + 40), *(_DWORD *)(a1 + 44), *(_DWORD *)(a1 + 48), *(_DWORD *)(a1 + 52));
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = *(std::__shared_weak_count **)(v2 + 56);
  *(_OWORD *)(v2 + 48) = v5;
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v3);
  }
  return 1;
}

void sub_1A407A5D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  operator delete(v12);

  _Unwind_Resume(a1);
}

void sub_1A407A69C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A407A778(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A407A820(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A407A86C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A407A8D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A407AAD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A407ABC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A407AC68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A407AE04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A407AEB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A407B004(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A407B388(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void vision::mod::PetprintGenerator::~PetprintGenerator(vision::mod::PetprintGenerator *this)
{
  vision::mod::PetprintGenerator::~PetprintGenerator(this);

  JUMPOUT(0x1A62562C0);
}

{
  std::__shared_weak_count *v2;
  void *v3;

  *(void *)this = &unk_1EF7523D0;
  if (*((unsigned char *)this + 60))
  {
    espresso_plan_destroy();
    *((void *)this + 9) = 0;
    espresso_context_destroy();
    *((void *)this + 8) = 0;
  }
  std::unique_ptr<vision::mod::ImageProcessing_Preprocessor>::reset[abi:ne180100]((uint64_t *)this + 57, 0);
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 56);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v2);
  }
  uint64_t v3 = (void *)*((void *)this + 2);
  if (v3)
  {
    *((void *)this + 3) = v3;
    operator delete(v3);
  }
}

char *std::vector<float>::__assign_with_size[abi:ne180100]<float const*,float const*>(char *result, char *__src, uint64_t a3)
{
  long long v5 = result;
  uint64_t v6 = *((void *)result + 2);
  long long v7 = *(char **)result;
  if ((unint64_t)(v6 - *(void *)result) < 0xC)
  {
    if (v7)
    {
      *((void *)result + 1) = v7;
      operator delete(v7);
      uint64_t v6 = 0;
      void *v5 = 0;
      v5[1] = 0;
      v5[2] = 0;
    }
    uint64_t v8 = v6 >> 1;
    if ((unint64_t)(v6 >> 1) <= 3) {
      uint64_t v8 = 3;
    }
    if ((unint64_t)v6 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v9 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v9 = v8;
    }
    __n128 result = std::vector<float>::__vallocate[abi:ne180100](v5, v9);
    long long v11 = (char *)v5[1];
    long long v10 = (void **)(v5 + 1);
    long long v7 = v11;
LABEL_15:
    size_t v15 = a3 - (void)__src;
    if (v15)
    {
      float v16 = v7;
      CGAffineTransform v17 = __src;
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  long long v10 = (void **)(result + 8);
  long long v12 = (unsigned char *)*((void *)result + 1);
  size_t v13 = v12 - v7;
  if ((unint64_t)(v12 - v7) > 0xB) {
    goto LABEL_15;
  }
  long long v14 = &__src[v13];
  if (v12 != v7)
  {
    __n128 result = (char *)memmove(*(void **)result, __src, v13);
    long long v7 = (char *)*v10;
  }
  size_t v15 = a3 - (void)v14;
  if (v15)
  {
    float v16 = v7;
    CGAffineTransform v17 = v14;
LABEL_17:
    __n128 result = (char *)memmove(v16, v17, v15);
  }
LABEL_18:
  void *v10 = &v7[v15];
  return result;
}

void vision::mod::PetprintGeneratorConcrete::~PetprintGeneratorConcrete(vision::mod::PetprintGeneratorConcrete *this)
{
  vision::mod::PetprintGenerator::~PetprintGenerator(this);

  JUMPOUT(0x1A62562C0);
}

uint64_t std::__shared_ptr_emplace<vision::mod::PetprintGeneratorConcrete>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void std::__shared_ptr_emplace<vision::mod::PetprintGeneratorConcrete>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EF753850;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x1A62562C0);
}

void std::__shared_ptr_emplace<vision::mod::PetprintGeneratorConcrete>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EF753850;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void vision::mod::PetprintGenerator::getPetPrint(uint64_t a1, float **a2)
{
  v4 = *a2;
  long long v5 = a2[1];
  if (v5 != *a2)
  {
    a2[1] = v4;
    long long v5 = v4;
  }
  if (*(int *)(a1 + 44) >= 1)
  {
    uint64_t v6 = 0;
    float v7 = 0.0;
    do
    {
      float v8 = *(float *)(*(void *)(a1 + 96) + 4 * v6);
      unint64_t v9 = (unint64_t)a2[2];
      if ((unint64_t)v5 >= v9)
      {
        long long v11 = *a2;
        uint64_t v12 = v5 - *a2;
        unint64_t v13 = v12 + 1;
        if ((unint64_t)(v12 + 1) >> 62) {
          std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v14 = v9 - (void)v11;
        if (v14 >> 1 > v13) {
          unint64_t v13 = v14 >> 1;
        }
        if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v15 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v15 = v13;
        }
        if (v15)
        {
          unint64_t v15 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v15);
          long long v11 = *a2;
          long long v5 = a2[1];
        }
        else
        {
          uint64_t v16 = 0;
        }
        CGAffineTransform v17 = (float *)(v15 + 4 * v12);
        float *v17 = v8;
        long long v10 = v17 + 1;
        while (v5 != v11)
        {
          int v18 = *((_DWORD *)v5-- - 1);
          *((_DWORD *)v17-- - 1) = v18;
        }
        *a2 = v17;
        a2[1] = v10;
        a2[2] = (float *)(v15 + 4 * v16);
        if (v11) {
          operator delete(v11);
        }
      }
      else
      {
        float *v5 = v8;
        long long v10 = v5 + 1;
      }
      a2[1] = v10;
      float v7 = v7 + v8;
      ++v6;
      long long v5 = v10;
    }
    while (v6 < *(int *)(a1 + 44));
    if (*(unsigned char *)(a1 + 8))
    {
      uint64_t v19 = *(unsigned int *)(a1 + 44);
      if ((int)v19 >= 1)
      {
        int v20 = *(unsigned __int8 *)(a1 + 9);
        CGAffineTransform v21 = *a2;
        float v22 = 0.0;
        uint64_t v23 = *(unsigned int *)(a1 + 44);
        do
        {
          float v24 = *v21;
          if (v20)
          {
            float v24 = v24 - (float)(v7 / (float)(int)v19);
            *CGAffineTransform v21 = v24;
          }
          float v22 = v22 + (float)(v24 * v24);
          ++v21;
          --v23;
        }
        while (v23);
        float v25 = *a2;
        float v26 = sqrtf(v22);
        do
        {
          float *v25 = *v25 / v26;
          ++v25;
          --v19;
        }
        while (v19);
      }
    }
  }
}

void sub_1A407B9D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A407BA9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A407C4E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,void *__p)
{
  if (v40) {
    operator delete(v40);
  }
  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_1A407C8D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A407CADC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A407CBAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  long long v11 = v10;

  a9.super_class = (Class)VNFaceBBoxAligner;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1A407CCF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1A407D044(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
}

void std::__shared_ptr_emplace<vision::mod::FaceBoxPoseAligner<signed char>>::__on_zero_shared(uint64_t a1)
{
  std::__tree<std::__value_type<long long,std::vector<long long>>,std::__map_value_compare<long long,std::__value_type<long long,std::vector<long long>>,std::less<long long>,true>,std::allocator<std::__value_type<long long,std::vector<long long>>>>::destroy(*(void **)(a1 + 144));
  v4 = (void **)(a1 + 112);
  std::vector<vision::mod::ERTTree>::__destroy_vector::operator()[abi:ne180100](&v4);
  uint64_t v2 = *(void **)(a1 + 88);
  if (v2)
  {
    *(void *)(a1 + 96) = v2;
    operator delete(v2);
  }
  uint64_t v3 = *(void **)(a1 + 64);
  if (v3)
  {
    *(void *)(a1 + 72) = v3;
    operator delete(v3);
  }
}

void std::__shared_ptr_emplace<vision::mod::FaceBoxPoseAligner<signed char>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EF7535E8;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x1A62562C0);
}

void std::__shared_ptr_emplace<vision::mod::FaceBoxPoseAligner<signed char>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EF7535E8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_1A407D5C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, void **a13)
{
  a13 = (void **)&a10;
  std::vector<vision::mod::DetectedObject>::__destroy_vector::operator()[abi:ne180100](&a13);

  _Unwind_Resume(a1);
}

void *std::vector<vision::mod::DetectedObject>::vector(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<vision::mod::DetectedObject>::__vallocate[abi:ne180100](a1, a2);
    v4 = (int32x2_t *)a1[1];
    long long v5 = &v4[10 * a2];
    uint64_t v6 = 80 * a2;
    int32x2_t v7 = vdup_n_s32(0x7FC00000u);
    do
    {
      std::string::basic_string[abi:ne180100]<0>(v4, "unknown");
      v4[3] = v7;
      v4[6].i32[1] = 0;
      v4[7].i8[0] = 0;
      v4[7].i32[1] = 0;
      v4[4] = 0;
      v4[5] = 0;
      v4[6].i16[0] = 0;
      v4 += 10;
      v6 -= 80;
    }
    while (v6);
    a1[1] = v5;
  }
  return a1;
}

void sub_1A407D704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
}

void sub_1A407DA84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,void *__p,uint64_t a32,int a33,__int16 a34,char a35,char a36)
{
  _Unwind_Resume(a1);
}

void sub_1A407DBF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A407DD64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A407E15C(_Unwind_Exception *a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);

  _Block_object_dispose(va, 8);
  *(void *)(v15 - 144) = a4;
  std::vector<vision::mod::DetectedObject>::__destroy_vector::operator()[abi:ne180100]((void ***)(v15 - 144));

  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__35941(__n128 *a1, __n128 *a2)
{
  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  __n128 result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

void __Block_byref_object_dispose__35942(uint64_t a1)
{
  uint64_t v1 = (void **)(a1 + 48);
  std::vector<vision::mod::DetectedObject>::__destroy_vector::operator()[abi:ne180100](&v1);
}

void sub_1A407E324(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A407E5E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  *(void *)(v25 - 88) = v23;
  std::vector<vision::mod::DetectedObject>::__destroy_vector::operator()[abi:ne180100]((void ***)(v25 - 88));
  *(void *)(v25 - 88) = &a19;
  std::vector<vision::mod::DetectedObject>::__destroy_vector::operator()[abi:ne180100]((void ***)(v25 - 88));

  _Unwind_Resume(a1);
}

void sub_1A407E70C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __destroy_helper_block_ea8_48c69_ZTSNSt3__16vectorIN6vision3mod14DetectedObjectENS_9allocatorIS3_EEEE(uint64_t a1)
{
  uint64_t v1 = (void **)(a1 + 48);
  std::vector<vision::mod::DetectedObject>::__destroy_vector::operator()[abi:ne180100](&v1);
}

void *__copy_helper_block_ea8_48c69_ZTSNSt3__16vectorIN6vision3mod14DetectedObjectENS_9allocatorIS3_EEEE(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0;
  uint64_t v2 = (void *)(a1 + 48);
  v2[2] = 0;
  return std::vector<vision::mod::DetectedObject>::__init_with_size[abi:ne180100]<vision::mod::DetectedObject*,vision::mod::DetectedObject*>(v2, *(void *)(a2 + 48), *(void *)(a2 + 56), 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*(void *)(a2 + 56) - *(void *)(a2 + 48)) >> 4));
}

void sub_1A407EB34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A407ECF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A407EDF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A407F060(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A4080398(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A4080754(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1A40808F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A4080AF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A4080C04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A4080E10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A4080EB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A40810F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A4081280(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A40814A8(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {

    objc_begin_catch(exception_object);
    JUMPOUT(0x1A408143CLL);
  }
  _Unwind_Resume(exception_object);
}

void sub_1A40816DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_1A4081CB8()
{
}

void sub_1A4081CE4()
{
}

void sub_1A4081CF4()
{
}

void sub_1A4081CFC(void *a1)
{
}

void sub_1A4081D58()
{
}

void sub_1A4081D60()
{
  JUMPOUT(0x1A4081D74);
}

uint64_t std::__shared_ptr_pointer<unsigned char *,void (*)(void *),std::allocator<unsigned char>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), 0x80000001A41251B2)) {
    return a1 + 32;
  }
  else {
    return 0;
  }
}

uint64_t std::__shared_ptr_pointer<unsigned char *,void (*)(void *),std::allocator<unsigned char>>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))(*(void *)(a1 + 24));
}

void std::__shared_ptr_pointer<unsigned char *,void (*)(void *),std::allocator<unsigned char>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x1A62562C0);
}

void sub_1A40830A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20,void *a21,uint64_t a22,void *a23,void *a24,void *a25,void *a26,void *a27,void *a28,void *a29,uint64_t a30,uint64_t a31,void *a32,uint64_t a33,uint64_t a34,uint64_t a35,id *a36,id *a37,uint64_t a38,uint64_t a39,void *a40,void *a41,void *a42)
{
  objc_destroyWeak((id *)&STACK[0x2B8]);
  _Block_object_dispose(&STACK[0x2C0], 8);

  _Block_object_dispose(&STACK[0x2F8], 8);
  STACK[0x2C0] = a14;
  std::vector<GazeFollowOutputsPerFace>::__destroy_vector::operator()[abi:ne180100]((void ***)&STACK[0x2C0]);
  _Block_object_dispose(&STACK[0x340], 8);
  unsigned int v44 = (void *)STACK[0x370];
  if (STACK[0x370])
  {
    STACK[0x378] = (unint64_t)v44;
    operator delete(v44);
  }

  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__36458(__n128 *a1, __n128 *a2)
{
  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  __n128 result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

void __Block_byref_object_dispose__36459(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(void *)(a1 + 56) = v2;
    operator delete(v2);
  }
}

void *std::vector<CamGaze_output_label>::vector(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2 >> 62) {
    std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
  }
  size_t v4 = 4 * a2;
  long long v5 = (char *)operator new(4 * a2);
  *a1 = v5;
  a1[2] = &v5[4 * a2];
  bzero(v5, v4);
  a1[1] = &v5[v4];
  return a1;
}

void sub_1A40833D4(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

__n128 __Block_byref_object_copy__55(__n128 *a1, __n128 *a2)
{
  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  __n128 result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

void __Block_byref_object_dispose__56(uint64_t a1)
{
  uint64_t v1 = (void **)(a1 + 48);
  std::vector<GazeFollowOutputsPerFace>::__destroy_vector::operator()[abi:ne180100](&v1);
}

void *std::vector<GazeFollowOutputsPerFace>::vector(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2 >= 0x1E1E1E1E1E1E1E2) {
    std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v3 = 17 * a2;
  uint64_t v4 = 136 * a2;
  long long v5 = (char *)operator new(136 * a2);
  uint64_t v6 = 0;
  *a1 = v5;
  a1[1] = v5;
  long long v10 = &v5[8 * v3];
  a1[2] = v10;
  int32x4_t v11 = vdupq_n_s32(0x7FC00000u);
  do
  {
    int32x2_t v7 = &v5[v6];
    *((_OWORD *)v7 + 2) = 0u;
    *((_OWORD *)v7 + 3) = 0u;
    *((void *)v7 + 10) = 0;
    *(_OWORD *)int32x2_t v7 = 0u;
    *((_OWORD *)v7 + 1) = 0u;
    *((_DWORD *)v7 + 4) = -1;
    *(void *)&v5[v6 + 24] = 0;
    *((void *)v7 + 4) = 0;
    *((void *)v7 + 5) = 0;
    *((_DWORD *)v7 + 12) = -1082130432;
    *(void *)(v7 + 52) = -1;
    *((_DWORD *)v7 + 15) = -1;
    *((int32x4_t *)v7 + 4) = v11;
    *((_DWORD *)v7 + 20) = 2143289344;
    *(_OWORD *)&v5[v6 + 88] = 0u;
    *(_OWORD *)(v7 + 104) = 0u;
    *(_OWORD *)(v7 + 120) = 0u;
    float v8 = operator new(8uLL);
    *((void *)v7 + 15) = v8 + 1;
    *((void *)v7 + 16) = v8 + 1;
    *float v8 = 0;
    v6 += 136;
    *((void *)v7 + 14) = v8;
  }
  while (v4 != v6);
  a1[1] = v10;
  return a1;
}

void sub_1A4083570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  std::vector<GazeFollowOutputsPerFace>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__59(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(result + 48) = *(_DWORD *)(a2 + 48);
  return result;
}

uint64_t __Block_byref_object_copy__65(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__66(uint64_t a1)
{
}

void sub_1A4083804(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A4083AFC()
{
}

void sub_1A4083B20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, uint64_t a17, void *a18, void *a19, void *a20)
{
  objc_end_catch();

  JUMPOUT(0x1A4083B94);
}

void sub_1A4083B34(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x1A4083ABCLL);
}

void sub_1A4083B40(_Unwind_Exception *a1)
{
}

void std::vector<GazeFollowOutputsPerFace>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (char *)**a1;
  if (v2)
  {
    uint64_t v4 = (char *)v1[1];
    long long v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        uint64_t v6 = (void *)*((void *)v4 - 3);
        if (v6)
        {
          *((void *)v4 - 2) = v6;
          operator delete(v6);
        }
        int32x2_t v7 = (void **)(v4 - 48);
        std::vector<std::vector<long long>>::__destroy_vector::operator()[abi:ne180100](&v7);
        int32x2_t v7 = (void **)(v4 - 112);
        std::vector<std::vector<long long>>::__destroy_vector::operator()[abi:ne180100](&v7);
        v4 -= 136;
      }
      while (v4 != v2);
      long long v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void sub_1A4083F58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, void *a17, void *a18)
{
  _Block_object_dispose((const void *)(v19 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A4084B48(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22)
{
  if (a2)
  {
    if (__p) {
      operator delete(__p);
    }
    objc_begin_catch(exception_object);
    JUMPOUT(0x1A40844C0);
  }
  _Unwind_Resume(exception_object);
}

void sub_1A4084DB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A40855F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32)
{
  _Unwind_Resume(a1);
}

void sub_1A40857C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A408588C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A4085B24(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_1A4085B3C(_Unwind_Exception *a1)
{
}

void sub_1A4085E88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A4085FC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A408610C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A4086320(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1A4086530(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__36784(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__36785(uint64_t a1)
{
}

void sub_1A40866F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A4086B2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A4086C74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A4086EF0(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A40870A0(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1A40872E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1A4087508(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1A40876F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A40878DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A4087BC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A4087D6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4088278(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A4088484(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A40884CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A408854C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A4088598(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A4088654(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A40886E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A408880C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A40888C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A4088950(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A4088A0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A4088B0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A4088B9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A4088CE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A4088FC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1A4089164(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A40891E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A408931C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A4089890(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A4089B0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A4089C64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A4089D98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void vision::mod::RPNTrackerOptions::clone(vision::mod::RPNTrackerOptions *this)
{
}

uint64_t vision::mod::ObjectTrackerRPN::free(vision::mod::ObjectTrackerRPN *this)
{
  *((void *)this + 4) = 0;
  return 6784;
}

void vision::mod::ObjectTrackerRPN::init(const void **this)
{
  {
    operator new();
  }
  __cxa_bad_cast();
}

uint64_t vision::mod::ObjectTrackerRPN::mapRPNErrorCodesToCVMLStatus(int a1)
{
  if (vision::mod::ObjectTrackerRPN::mapRPNErrorCodesToCVMLStatus(NtReturn)::onceToken != -1) {
    dispatch_once(&vision::mod::ObjectTrackerRPN::mapRPNErrorCodesToCVMLStatus(NtReturn)::onceToken, &__block_literal_global_37306);
  }
  uint64_t v2 = *(void *)(vision::mod::ObjectTrackerRPN::mapRPNErrorCodesToCVMLStatus(NtReturn)::mapRPNErrorCodesToCVMLStatus
                 + 8);
  if (!v2) {
    return 6782;
  }
  uint64_t v3 = vision::mod::ObjectTrackerRPN::mapRPNErrorCodesToCVMLStatus(NtReturn)::mapRPNErrorCodesToCVMLStatus + 8;
  do
  {
    int v4 = *(_DWORD *)(v2 + 32);
    BOOL v5 = v4 < a1;
    if (v4 >= a1) {
      uint64_t v6 = (uint64_t *)v2;
    }
    else {
      uint64_t v6 = (uint64_t *)(v2 + 8);
    }
    if (!v5) {
      uint64_t v3 = v2;
    }
    uint64_t v2 = *v6;
  }
  while (*v6);
  if (v3 != vision::mod::ObjectTrackerRPN::mapRPNErrorCodesToCVMLStatus(NtReturn)::mapRPNErrorCodesToCVMLStatus + 8
    && *(_DWORD *)(v3 + 32) <= a1)
  {
    return *(void *)(v3 + 40);
  }
  else
  {
    return 6782;
  }
}

void ___ZN6vision3mod16ObjectTrackerRPN28mapRPNErrorCodesToCVMLStatusE8NtReturn_block_invoke()
{
  uint64_t v0 = *MEMORY[0x1E4F143B8];
  operator new();
}

void sub_1A408A5E0(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<long long,int>,std::__map_value_compare<long long,std::__value_type<long long,int>,std::less<long long>,true>,std::allocator<std::__value_type<long long,int>>>::destroy(*(void **)(v1 + 8));
  MEMORY[0x1A62562C0](v1, 0x1020C4062D53EE8);
  _Unwind_Resume(a1);
}

uint64_t vision::mod::ObjectTrackerRPN::update(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 16))(a1);
  if (result == 128)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)a1 + 24))(a1, a2, a3);
    if (result == 128) {
      return 6784;
    }
  }
  return result;
}

uint64_t vision::mod::ObjectTrackerRPN::track(uint64_t a1, __CVBuffer *a2, uint64_t *a3)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(a1 + 32)) {
    return 6751;
  }
  if (!v6) {
    __cxa_bad_cast();
  }
  uint64_t v28 = 0;
  float v29 = &v28;
  uint64_t v30 = 0x2000000000;
  int v31 = 0;
  uint64_t v20 = 0;
  CGAffineTransform v21 = (double *)&v20;
  uint64_t v22 = 0x5002000000;
  uint64_t v23 = __Block_byref_object_copy__37310;
  float v24 = __Block_byref_object_dispose__37311;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v27 = 0;
  int32x2_t v7 = *((void *)v6 + 12);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 0x40000000;
  block[2] = ___ZN6vision3mod16ObjectTrackerRPN5trackEP10__CVBufferRNSt3__16vectorINS0_14DetectedObjectENS4_9allocatorIS6_EEEE_block_invoke;
  block[3] = &unk_1E5B20010;
  block[6] = a1;
  block[7] = a2;
  block[4] = &v28;
  block[5] = &v20;
  dispatch_sync(v7, block);
  uint64_t v8 = vision::mod::ObjectTrackerRPN::mapRPNErrorCodesToCVMLStatus(*((_DWORD *)v29 + 6));
  if (v8 == 128)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "unknown");
    unint64_t v34 = (unint64_t)vdup_n_s32(0x7FC00000u);
    int v38 = 0;
    char v39 = 0;
    int v40 = 0;
    unint64_t v35 = 0;
    uint64_t v36 = 0;
    __int16 v37 = 0;
    unint64_t v9 = v21;
    size_t Height = CVPixelBufferGetHeight(a2);
    std::string::basic_string[abi:ne180100]<0>(&v41, "unknown");
    int v49 = 0;
    char v50 = 0;
    int v51 = 0;
    uint64_t v47 = 0;
    __int16 v48 = 0;
    float v11 = v9[5];
    float v12 = v9[6];
    float v13 = v9[8];
    float v14 = v9[7];
    float v45 = v13;
    float v46 = v14;
    float v15 = (float)Height - (float)(v12 + v13);
    float v43 = v11;
    float v44 = v15;
    if (v42 < 0) {
      operator delete(v41);
    }
    unint64_t v34 = __PAIR64__(LODWORD(v15), LODWORD(v11));
    unint64_t v35 = __PAIR64__(LODWORD(v14), LODWORD(v13));
    int v40 = *((_DWORD *)v21 + 19);
    unint64_t v16 = a3[1];
    if (v16 >= a3[2])
    {
      uint64_t v17 = std::vector<vision::mod::DetectedObject>::__push_back_slow_path<vision::mod::DetectedObject const&>(a3, (uint64_t)__p);
    }
    else
    {
      vision::mod::DetectedObject::DetectedObject(a3[1], (uint64_t)__p);
      uint64_t v17 = v16 + 80;
      a3[1] = v16 + 80;
    }
    a3[1] = v17;
    if (v33 < 0) {
      operator delete(__p[0]);
    }
    uint64_t v8 = 6784;
  }
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v28, 8);
  return v8;
}

void sub_1A408A968(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,void *__p,uint64_t a33,int a34,__int16 a35,char a36,char a37)
{
  if (a37 < 0) {
    operator delete(__p);
  }
  _Block_object_dispose(&a18, 8);
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__37310(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 40);
  long long v3 = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(_OWORD *)(a1 + 56) = v3;
  *(__n128 *)(a1 + 40) = result;
  return result;
}

uint64_t ___ZN6vision3mod16ObjectTrackerRPN5trackEP10__CVBufferRNSt3__16vectorINS0_14DetectedObjectENS4_9allocatorIS6_EEEE_block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(_DWORD **)(*(void *)(result + 48) + 32);
  if (v2 && *v2 == -1430532899)
  {
    long long v3 = *(__CVBuffer **)(result + 56);
    uint64_t v4 = *(void *)(*(void *)(result + 40) + 8);
    *(_DWORD *)(v4 + 72) = 3;
    NtLockCvPixelBuffers((uint64_t)v2);
    CVPixelBufferLockBaseAddress(v3, 1uLL);
    if (TtTrkRpnInstancePreProcess(*((void *)v2 + 138), (uint64_t)(v2 + 278), (uint64_t)(v2 + 879), (float32x2_t *)((char *)v2 + 1125), (uint64_t)(v2 + 801), (uint64_t)(v2 + 819), (uint64_t)(v2 + 840)))goto LABEL_5; {
    uint64_t v18 = v4;
    }
    uint64_t v19 = (unsigned __int8 *)(v2 + 879);
    BaseAddress = CVPixelBufferGetBaseAddress(v3);
    int Height = CVPixelBufferGetHeight(v3);
    int v7 = 4 * CVPixelBufferGetWidth(v3);
    int BytesPerRow = CVPixelBufferGetBytesPerRow(v3);
    uint64_t v9 = *((void *)v2 + 138);
    uint64_t v20 = BaseAddress;
    int v21 = Height;
    int v22 = v7;
    int v23 = BytesPerRow;
    int v24 = 1;
    if (TtTrkRpnPreProcessCropResizeRef(v9, (uint64_t)(v2 + 278), (uint64_t)&v20, (uint64_t)(v2 + 819), (uint64_t)(v2 + 876), (uint64_t)v2 + 1125, (uint64_t)(v2 + 801)))
    {
LABEL_5:
      CVPixelBufferUnlockBaseAddress(v3, 1uLL);
      CVPixelBufferUnlockBaseAddress(*((CVPixelBufferRef *)v2 + 509), 0);
      __n128 result = CVPixelBufferUnlockBaseAddress(*((CVPixelBufferRef *)v2 + 507), 0);
      int v10 = -8;
    }
    else
    {
      uint64_t v17 = CVPixelBufferGetBaseAddress(*((CVPixelBufferRef *)v2 + 507));
      unsigned int Width = CVPixelBufferGetWidth(*((CVPixelBufferRef *)v2 + 507));
      uint64_t v12 = CVPixelBufferGetHeight(*((CVPixelBufferRef *)v2 + 507));
      uint64_t v13 = Width;
      uint64_t v14 = CVPixelBufferGetBytesPerRow(*((CVPixelBufferRef *)v2 + 507));
      memcpy(*((void **)v2 + 51), (char *)v2 + 4090, 0x28000uLL);
      memcpy(*((void **)v2 + 72), (char *)v2 + 167930, 0x14000uLL);
      long long v25 = v17;
      uint64_t v26 = v12;
      uint64_t v27 = v13;
      uint64_t v28 = v14;
      __n128 result = espresso_network_bind_input_vimagebuffer_bgra8();
      if (result
        || (!*((unsigned char *)v2 + 4089)
          ? (__n128 result = espresso_plan_execute_sync(), v2[270] = result)
          : (dispatch_sync_f(*((dispatch_queue_t *)v2 + 137), v2, (dispatch_function_t)EspressoInstancePlanExecuteSynced), __n128 result = v2[270]), result))
      {
        int v10 = -9;
      }
      else
      {
        TtTrkRpnInstancePostProcess(*((void *)v2 + 138), v2 + 278, (uint64_t)(v2 + 801), (uint64_t)(v2 + 819), (_DWORD *)((char *)v2 + 1125), v19);
        if (*((unsigned char *)v2 + 4088))
        {
          if (v2[924])
          {
            uint64_t v15 = v18;
            *(float64x2_t *)(v18 + 40) = vcvtq_f64_f32(*(float32x2_t *)(v2 + 927));
            *(float64x2_t *)(v18 + 56) = vcvtq_f64_f32(*(float32x2_t *)(v2 + 929));
            *(float *)(v18 + 76) = (float)v2[931] / 1000.0;
            int v16 = v2[946] != 1;
          }
          else
          {
            int v16 = 2;
            uint64_t v15 = v18;
          }
          *(_DWORD *)(v15 + 72) = v16;
          *uint64_t v19 = 0;
        }
        CVPixelBufferUnlockBaseAddress(v3, 1uLL);
        CVPixelBufferUnlockBaseAddress(*((CVPixelBufferRef *)v2 + 509), 0);
        __n128 result = CVPixelBufferUnlockBaseAddress(*((CVPixelBufferRef *)v2 + 507), 0);
        int v10 = 0;
      }
    }
  }
  else
  {
    int v10 = -4;
  }
  *(_DWORD *)(*(void *)(*(void *)(v1 + 32) + 8) + 24) = v10;
  return result;
}

uint64_t vision::mod::ObjectTrackerRPN::setTargetObjects(uint64_t a1, __CVBuffer *a2, float32x2_t **a3)
{
  if (!*(void *)(a1 + 32)) {
    return 6751;
  }
  long long v3 = *a3;
  if ((char *)a3[1] - (char *)*a3 != 80) {
    return 6780;
  }
  if (!v6) {
    __cxa_bad_cast();
  }
  int v7 = v6;
  CVPixelBufferGetHeight(a2);
  float64x2_t v8 = vcvtq_f64_f32(v3[3]);
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2000000000;
  int v20 = 0;
  uint64_t v9 = *((void *)v7 + 11);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 0x40000000;
  block[2] = ___ZN6vision3mod16ObjectTrackerRPN16setTargetObjectsEP10__CVBufferRKNSt3__16vectorINS0_14DetectedObjectENS4_9allocatorIS6_EEEE_block_invoke;
  block[3] = &unk_1E5B1FFE8;
  block[6] = a2;
  float64x2_t v15 = v8;
  int8x16_t v10 = (int8x16_t)vcvtq_f64_f32(v3[4]);
  block[4] = &v17;
  block[5] = a1;
  int8x16_t v16 = vextq_s8(v10, v10, 8uLL);
  dispatch_sync(v9, block);
  uint64_t v11 = vision::mod::ObjectTrackerRPN::mapRPNErrorCodesToCVMLStatus(*((_DWORD *)v18 + 6));
  if (v11 == 128) {
    uint64_t v12 = 6784;
  }
  else {
    uint64_t v12 = v11;
  }
  _Block_object_dispose(&v17, 8);
  return v12;
}

void sub_1A408AE3C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t ___ZN6vision3mod16ObjectTrackerRPN16setTargetObjectsEP10__CVBufferRKNSt3__16vectorINS0_14DetectedObjectENS4_9allocatorIS6_EEEE_block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(_DWORD **)(*(void *)(result + 40) + 32);
  if (!v2 || *v2 != -1430532899)
  {
    int v4 = -4;
    goto LABEL_8;
  }
  long long v3 = *(__CVBuffer **)(result + 48);
  float64x2_t v17 = *(float64x2_t *)(result + 56);
  float64x2_t v18 = *(float64x2_t *)(result + 72);
  NtLockCvPixelBuffers((uint64_t)v2);
  __n128 result = CVPixelBufferLockBaseAddress(v3, 1uLL);
  if (result) {
    goto LABEL_6;
  }
  *(float32x4_t *)(v2 + 927) = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v17), v18);
  v2[924] = 1;
  v2[279] = CVPixelBufferGetHeight(v3);
  v2[278] = CVPixelBufferGetWidth(v3);
  if (TtTrkRpnExemplarPreProcess(*((void *)v2 + 138), (uint64_t)(v2 + 278), (uint64_t)(v2 + 879), (_DWORD *)((char *)v2 + 1125), (uint64_t)(v2 + 801), (uint64_t)(v2 + 819), (uint64_t)(v2 + 840)))goto LABEL_5; {
  BaseAddress = CVPixelBufferGetBaseAddress(v3);
  }
  int Height = CVPixelBufferGetHeight(v3);
  int v7 = 4 * CVPixelBufferGetWidth(v3);
  int BytesPerRow = CVPixelBufferGetBytesPerRow(v3);
  uint64_t v9 = *((void *)v2 + 138);
  uint64_t v19 = BaseAddress;
  int v20 = Height;
  int v21 = v7;
  int v22 = BytesPerRow;
  int v23 = 1;
  int v10 = TtTrkRpnPreProcessCropResizeRef(v9, (uint64_t)(v2 + 278), (uint64_t)&v19, (uint64_t)(v2 + 819), (uint64_t)(v2 + 876), (uint64_t)v2 + 1125, (uint64_t)(v2 + 801));
  if (!BaseAddress || v10 || (uint64_t v11 = CVPixelBufferGetBaseAddress(*((CVPixelBufferRef *)v2 + 509))) == 0)
  {
LABEL_5:
    CVPixelBufferUnlockBaseAddress(v3, 1uLL);
    CVPixelBufferUnlockBaseAddress(*((CVPixelBufferRef *)v2 + 509), 0);
    __n128 result = CVPixelBufferUnlockBaseAddress(*((CVPixelBufferRef *)v2 + 507), 0);
LABEL_6:
    int v4 = -8;
    goto LABEL_8;
  }
  uint64_t v12 = v11;
  unsigned int Width = CVPixelBufferGetWidth(*((CVPixelBufferRef *)v2 + 509));
  unsigned int v14 = CVPixelBufferGetHeight(*((CVPixelBufferRef *)v2 + 509));
  unsigned int v15 = CVPixelBufferGetBytesPerRow(*((CVPixelBufferRef *)v2 + 509));
  if (v14
    && Width
    && v15
    && (int v24 = v12, v25 = v14, v26 = Width, v27 = v15, !espresso_network_bind_input_vimagebuffer_bgra8())
    && (!*((unsigned char *)v2 + 4089)
      ? (int v16 = espresso_plan_execute_sync(), v2[270] = v16)
      : (dispatch_sync_f(*((dispatch_queue_t *)v2 + 136), v2, (dispatch_function_t)EspressoExemplarPlanExecuteSynced),
         int v16 = v2[270]),
        !v16))
  {
    memcpy((char *)v2 + 4090, *((const void **)v2 + 5), 0x28000uLL);
    memcpy((char *)v2 + 167930, *((const void **)v2 + 26), 0x14000uLL);
    if (!TtTrkRpnExemplarPostProcess(*((void *)v2 + 138), (uint64_t)(v2 + 278), (uint64_t)(v2 + 801), (uint64_t)(v2 + 819), (_DWORD *)((char *)v2 + 1125), (unsigned __int8 *)v2 + 3516))*((unsigned char *)v2 + 4088) = 1; {
    CVPixelBufferUnlockBaseAddress(v3, 1uLL);
    }
    CVPixelBufferUnlockBaseAddress(*((CVPixelBufferRef *)v2 + 509), 0);
    __n128 result = CVPixelBufferUnlockBaseAddress(*((CVPixelBufferRef *)v2 + 507), 0);
    int v4 = 0;
  }
  else
  {
    CVPixelBufferUnlockBaseAddress(v3, 1uLL);
    CVPixelBufferUnlockBaseAddress(*((CVPixelBufferRef *)v2 + 509), 0);
    __n128 result = CVPixelBufferUnlockBaseAddress(*((CVPixelBufferRef *)v2 + 507), 0);
    int v4 = -9;
  }
LABEL_8:
  *(_DWORD *)(*(void *)(*(void *)(v1 + 32) + 8) + 24) = v4;
  return result;
}

void vision::mod::ObjectTrackerRPN::~ObjectTrackerRPN(vision::mod::ObjectTrackerRPN *this)
{
  vision::mod::ObjectTrackerRPN::~ObjectTrackerRPN(this);

  JUMPOUT(0x1A62562C0);
}

{
  std::__shared_weak_count *v2;

  *(void *)this = &unk_1EF752380;
  NtDestroyTracker(*((void *)this + 4));
  *((void *)this + 4) = 0;
  *(void *)this = &unk_1EF7525F8;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 3);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v2);
  }
}

void sub_1A408B2CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A408B4E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A408B6F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A408B7C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A408B884(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A408B9D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A408BA8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A408BB2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A408BBD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A408BC68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A408BD38(_Unwind_Exception *a1)
{
  uint64_t v6 = v5;

  _Unwind_Resume(a1);
}

void sub_1A408BDF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A408BEA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A408BF60(_Unwind_Exception *a1)
{
  BOOL v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1A408C008(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A408C0DC(_Unwind_Exception *a1)
{
  uint64_t v6 = v5;

  _Unwind_Resume(a1);
}

void sub_1A408C19C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A408C24C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A408C304(_Unwind_Exception *a1)
{
  BOOL v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1A408C3AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A408C480(_Unwind_Exception *a1)
{
  uint64_t v6 = v5;

  _Unwind_Resume(a1);
}

void sub_1A408C540(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A408C5F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A408C6A8(_Unwind_Exception *a1)
{
  BOOL v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1A408C750(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A408C818(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A408C8CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A408C96C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A408CA14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A408CAA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A408CB6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A408CC20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A408CCC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A408CD70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A408CE04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A408CED0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A408D130(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A408D29C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A408D488(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A408D864(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A408DAFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1A408DC24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A408DE9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  float64x2_t v18 = v15;

  _Unwind_Resume(a1);
}

void sub_1A408DFB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A408E034(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A408E110(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A408E1FC(_Unwind_Exception *a1)
{
  int v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A408E310(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A408E898(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16)
{
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)&STACK[0x230]);
  _Unwind_Resume(a1);
}

char *std::__hash_table<std::__hash_value_type<void *,espresso_buffer_t>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,espresso_buffer_t>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,espresso_buffer_t>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,espresso_buffer_t>>>::__emplace_unique_key_args<void *,std::piecewise_construct_t const&,std::tuple<void *&&>,std::tuple<>>(float *a1, unint64_t a2, void *a3)
{
  unint64_t v6 = 0x9DDFEA08EB382D69 * (((8 * a2) + 8) ^ HIDWORD(a2));
  unint64_t v7 = 0x9DDFEA08EB382D69 * (HIDWORD(a2) ^ (v6 >> 47) ^ v6);
  unint64_t v8 = 0x9DDFEA08EB382D69 * (v7 ^ (v7 >> 47));
  unint64_t v9 = *((void *)a1 + 1);
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v3 = 0x9DDFEA08EB382D69 * (v7 ^ (v7 >> 47));
      if (v8 >= v9) {
        unint64_t v3 = v8 % v9;
      }
    }
    else
    {
      unint64_t v3 = v8 & (v9 - 1);
    }
    uint64_t v11 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v11)
    {
      uint64_t v12 = (char *)*v11;
      if (*v11)
      {
        do
        {
          unint64_t v13 = *((void *)v12 + 1);
          if (v13 == v8)
          {
            if (*((void *)v12 + 2) == a2) {
              return v12;
            }
          }
          else
          {
            if (v10.u32[0] > 1uLL)
            {
              if (v13 >= v9) {
                v13 %= v9;
              }
            }
            else
            {
              v13 &= v9 - 1;
            }
            if (v13 != v3) {
              break;
            }
          }
          uint64_t v12 = *(char **)v12;
        }
        while (v12);
      }
    }
  }
  uint64_t v12 = (char *)operator new(0xC0uLL);
  *(void *)uint64_t v12 = 0;
  *((void *)v12 + 1) = v8;
  *((void *)v12 + 2) = *a3;
  *(_OWORD *)(v12 + 24) = 0u;
  *(_OWORD *)(v12 + 40) = 0u;
  *(_OWORD *)(v12 + 56) = 0u;
  *(_OWORD *)(v12 + 72) = 0u;
  *(_OWORD *)(v12 + 88) = 0u;
  *(_OWORD *)(v12 + 104) = 0u;
  *(_OWORD *)(v12 + 120) = 0u;
  *(_OWORD *)(v12 + 136) = 0u;
  *(_OWORD *)(v12 + 152) = 0u;
  *(_OWORD *)(v12 + 168) = 0u;
  *((void *)v12 + 23) = 0;
  float v14 = (float)(unint64_t)(*((void *)a1 + 3) + 1);
  float v15 = a1[8];
  if (!v9 || (float)(v15 * (float)v9) < v14)
  {
    BOOL v16 = 1;
    if (v9 >= 3) {
      BOOL v16 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v17 = v16 | (2 * v9);
    unint64_t v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18) {
      int8x8_t prime = (int8x8_t)v18;
    }
    else {
      int8x8_t prime = (int8x8_t)v17;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      unint64_t v9 = *((void *)a1 + 1);
    }
    if (*(void *)&prime > v9) {
      goto LABEL_30;
    }
    if (*(void *)&prime < v9)
    {
      unint64_t v26 = vcvtps_u32_f32((float)*((unint64_t *)a1 + 3) / a1[8]);
      if (v9 < 3 || (uint8x8_t v27 = (uint8x8_t)vcnt_s8((int8x8_t)v9), v27.i16[0] = vaddlv_u8(v27), v27.u32[0] > 1uLL))
      {
        unint64_t v26 = std::__next_prime(v26);
      }
      else
      {
        uint64_t v28 = 1 << -(char)__clz(v26 - 1);
        if (v26 >= 2) {
          unint64_t v26 = v28;
        }
      }
      if (*(void *)&prime <= v26) {
        int8x8_t prime = (int8x8_t)v26;
      }
      if (*(void *)&prime >= v9)
      {
        unint64_t v9 = *((void *)a1 + 1);
      }
      else
      {
        if (prime)
        {
LABEL_30:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          int v20 = operator new(8 * *(void *)&prime);
          int v21 = *(void **)a1;
          *(void *)a1 = v20;
          if (v21) {
            operator delete(v21);
          }
          uint64_t v22 = 0;
          *((int8x8_t *)a1 + 1) = prime;
          do
            *(void *)(*(void *)a1 + 8 * v22++) = 0;
          while (*(void *)&prime != v22);
          int v23 = (void *)*((void *)a1 + 2);
          if (v23)
          {
            unint64_t v24 = v23[1];
            uint8x8_t v25 = (uint8x8_t)vcnt_s8(prime);
            v25.i16[0] = vaddlv_u8(v25);
            if (v25.u32[0] > 1uLL)
            {
              if (v24 >= *(void *)&prime) {
                v24 %= *(void *)&prime;
              }
            }
            else
            {
              v24 &= *(void *)&prime - 1;
            }
            *(void *)(*(void *)a1 + 8 * v24) = a1 + 4;
            float v29 = (void *)*v23;
            if (*v23)
            {
              do
              {
                unint64_t v30 = v29[1];
                if (v25.u32[0] > 1uLL)
                {
                  if (v30 >= *(void *)&prime) {
                    v30 %= *(void *)&prime;
                  }
                }
                else
                {
                  v30 &= *(void *)&prime - 1;
                }
                if (v30 != v24)
                {
                  if (!*(void *)(*(void *)a1 + 8 * v30))
                  {
                    *(void *)(*(void *)a1 + 8 * v30) = v23;
                    goto LABEL_55;
                  }
                  *int v23 = *v29;
                  void *v29 = **(void **)(*(void *)a1 + 8 * v30);
                  **(void **)(*(void *)a1 + 8 * v30) = v29;
                  float v29 = v23;
                }
                unint64_t v30 = v24;
LABEL_55:
                int v23 = v29;
                float v29 = (void *)*v29;
                unint64_t v24 = v30;
              }
              while (v29);
            }
          }
          unint64_t v9 = (unint64_t)prime;
          goto LABEL_59;
        }
        unint64_t v35 = *(void **)a1;
        *(void *)a1 = 0;
        if (v35) {
          operator delete(v35);
        }
        unint64_t v9 = 0;
        *((void *)a1 + 1) = 0;
      }
    }
LABEL_59:
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9) {
        unint64_t v3 = v8 % v9;
      }
      else {
        unint64_t v3 = v8;
      }
    }
    else
    {
      unint64_t v3 = (v9 - 1) & v8;
    }
  }
  int v31 = *(void **)a1;
  int v32 = *(void **)(*(void *)a1 + 8 * v3);
  if (v32)
  {
    *(void *)uint64_t v12 = *v32;
LABEL_72:
    void *v32 = v12;
    goto LABEL_73;
  }
  *(void *)uint64_t v12 = *((void *)a1 + 2);
  *((void *)a1 + 2) = v12;
  v31[v3] = a1 + 4;
  if (*(void *)v12)
  {
    unint64_t v33 = *(void *)(*(void *)v12 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v33 >= v9) {
        v33 %= v9;
      }
    }
    else
    {
      v33 &= v9 - 1;
    }
    int v32 = (void *)(*(void *)a1 + 8 * v33);
    goto LABEL_72;
  }
LABEL_73:
  ++*((void *)a1 + 3);
  return v12;
}

void sub_1A408EDE0(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_1A408EF80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A408F064(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t eraseContourPixels(uint64_t result, uint64_t a2, int a3)
{
  if (!result) {
    __assert_rtn("eraseContourPixels", "ConnectedComponents.c", 17, "deque != NULL");
  }
  uint64_t v3 = *(int *)(result + 8);
  uint64_t v4 = (*(_DWORD *)(result + 12) - v3 + 1);
  if ((int)v4 >= 1)
  {
    BOOL v5 = (__int16 *)(*(void *)(result + 16) + 4 * v3 + 2);
    do
    {
      *(unsigned char *)(a2 + *(v5 - 1) + *v5 * a3) = 0;
      v5 += 2;
      --v4;
    }
    while (v4);
  }
  return result;
}

uint64_t allocSegments(int *a1, int a2)
{
  uint64_t v2 = *((void *)a1 + 1);
  int v3 = a1[1];
  int v4 = *a1;
  int v5 = *a1 + a2;
  *a1 = v5;
  if (v5 > v3) {
    __assert_rtn("allocSegments", "Segments.c", 16, "sdb->nSegments <= sdb->maxSegments");
  }
  uint64_t result = v2 + 48 * v4;
  uint64_t v7 = result;
  if (a2 >= 2)
  {
    int v8 = a2 - 1;
    uint64_t v9 = result;
    do
    {
      uint64_t v7 = v9 + 48;
      *(void *)uint64_t v9 = v9 + 48;
      *(unsigned char *)(v9 + 8) = 1;
      v9 += 48;
      --v8;
    }
    while (v8);
  }
  *(void *)uint64_t v7 = 0;
  *(unsigned char *)(v7 + 8) = 1;
  return result;
}

float segmentSinCos(int a1, __int16 *a2, int a3, __int16 *a4, float *a5, float *a6)
{
  unint64_t v6 = &a2[2 * a1 - 2];
  uint64_t v7 = &a4[2 * a3 - 2];
  int v8 = *v6 - *a2;
  int v9 = v6[1] - a2[1];
  LODWORD(v6) = *v7 - *a4;
  int v10 = v7[1] - a4[1];
  float v11 = 1.0 / sqrtf((float)(v8 * v8 + v9 * v9) * (float)((int)v6 * (int)v6 + v10 * v10));
  *a5 = v11 * (float)((int)v6 * v9 - v10 * v8);
  float result = v11 * (float)((int)v6 * v8 + v10 * v9);
  *a6 = result;
  return result;
}

float segmentSinCosLen2(int a1, __int16 *a2, int a3, __int16 *a4, float *a5, float *a6, int *a7)
{
  uint64_t v7 = &a2[2 * a1 - 2];
  int v8 = &a4[2 * a3 - 2];
  int v9 = *v7 - *a2;
  int v10 = v7[1] - a2[1];
  LODWORD(v7) = *v8 - *a4;
  int v11 = v8[1] - a4[1];
  int v12 = v7 * v7 + v11 * v11;
  float v13 = 1.0 / sqrtf((float)(v9 * v9 + v10 * v10) * (float)v12);
  *a5 = v13 * (float)((int)v7 * v10 - v11 * v9);
  float result = v13 * (float)((int)v7 * v9 + v11 * v10);
  *a6 = result;
  *a7 = v12;
  return result;
}

void sub_1A408F6A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A408F788(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A408F840(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A408F964(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A408FA58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A408FB14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A408FBBC(_Unwind_Exception *a1)
{
  int v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1A408FCE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A408FD4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A408FE38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t vision::mod::ImageDescriptorProcessorHasher::computeHashesInBase64(_DWORD *a1, uint64_t a2, std::vector<std::string> *a3)
{
  (*(void (**)(void **__return_ptr))(*(void *)a1 + 64))(&v16);
  std::dynamic_pointer_cast[abi:ne180100]<vision::mod::ImageDescriptorBufferFloat32,vision::mod::ImageDescriptorBufferAbstract>((void **)&v18, &v16);
  if (v17) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v17);
  }
  unint64_t v6 = v18;
  if (v18)
  {
    (*(void (**)(_DWORD *, uint64_t, void *))(*(void *)a1 + 160))(a1, a2, v18);
    uint64_t v7 = v6[7];
    std::vector<std::string>::resize(a3, (int)a1[4]);
    int v8 = a1[3];
    int v9 = &CVML_status_internalError;
    if (v8)
    {
      int v10 = a1[4];
      if (v10)
      {
        if (v8 == v8 / v10 * v10)
        {
          uint64_t v11 = 0;
          unint64_t v12 = 0;
          uint64_t v13 = 4 * (v8 / v10);
          int v9 = &CVML_status_ok;
          do
          {
            (*(void (**)(_DWORD *, uint64_t, std::string *))(*(void *)a1 + 192))(a1, v7, &a3->__begin_[v11]);
            ++v12;
            ++v11;
            v7 += v13;
          }
          while (v12 < a1[4]);
        }
      }
    }
  }
  else
  {
    int v9 = &CVML_status_internalError;
  }
  uint64_t v14 = *v9;
  if (v19) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v19);
  }
  return (v14 + 128) | 0xE00;
}

void sub_1A408FFD0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12)
{
  if (a12) {
    std::__shared_weak_count::__release_shared[abi:nn180100](a12);
  }
  _Unwind_Resume(exception_object);
}

void *std::dynamic_pointer_cast[abi:ne180100]<vision::mod::ImageDescriptorBufferFloat32,vision::mod::ImageDescriptorBufferAbstract>(void **a1, void **a2)
{
  float result = *a2;
  if (*a2 {
    && (int v4 = a2,
  }
  {
    int v5 = v4[1];
    *a1 = result;
    a1[1] = v5;
  }
  else
  {
    int v4 = a1;
  }
  void *v4 = 0;
  v4[1] = 0;
  return result;
}

uint64_t vision::mod::ImageDescriptorProcessorHasher::computeHashes(_DWORD *a1, uint64_t a2, void *a3)
{
  (*(void (**)(unint64_t *__return_ptr))(*(void *)a1 + 64))(&v26);
  std::dynamic_pointer_cast[abi:ne180100]<vision::mod::ImageDescriptorBufferFloat32,vision::mod::ImageDescriptorBufferAbstract>((void **)&v24, (void **)&v26);
  if (v27) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v27);
  }
  unint64_t v6 = v24;
  if (!v24) {
    goto LABEL_25;
  }
  uint64_t v7 = (*(uint64_t (**)(_DWORD *, uint64_t, void *))(*(void *)a1 + 160))(a1, a2, v24);
  if (v7 != 128) {
    goto LABEL_26;
  }
  int v8 = (char *)v6[7];
  if (v8)
  {
    int v9 = a1[3];
    int v10 = &CVML_status_internalError;
    if (v9)
    {
      int v11 = a1[4];
      if (v11)
      {
        int v12 = v9 / v11;
        if (v9 == v9 / v11 * v11)
        {
          unsigned int v13 = 0;
          unint64_t v14 = v12;
          float v15 = a3 + 2;
          BOOL v16 = (void *)a3[1];
          uint64_t v17 = 4 * v12;
          do
          {
            if ((unint64_t)v16 >= *v15)
            {
              unint64_t v18 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v16 - *a3) >> 3);
              unint64_t v19 = v18 + 1;
              if (v18 + 1 > 0xAAAAAAAAAAAAAAALL) {
                std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
              }
              if (0x5555555555555556 * ((uint64_t)(*v15 - *a3) >> 3) > v19) {
                unint64_t v19 = 0x5555555555555556 * ((uint64_t)(*v15 - *a3) >> 3);
              }
              if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*v15 - *a3) >> 3) >= 0x555555555555555) {
                unint64_t v20 = 0xAAAAAAAAAAAAAAALL;
              }
              else {
                unint64_t v20 = v19;
              }
              unint64_t v30 = a3 + 2;
              if (v20) {
                unint64_t v20 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<CGPoint>>>(v20);
              }
              else {
                uint64_t v21 = 0;
              }
              uint64_t v22 = (std::__shared_weak_count *)(v20 + 24 * v18);
              unint64_t v26 = v20;
              uint8x8_t v27 = v22;
              uint64_t v28 = v22;
              unint64_t v29 = v20 + 24 * v21;
              v22->__vftable = 0;
              v22->__shared_owners_ = 0;
              v22->__shared_weak_owners_ = 0;
              std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v22, v8, (uint64_t)&v8[v17], v14);
              ++v28;
              std::vector<std::vector<CGPoint>>::__swap_out_circular_buffer(a3, &v26);
              BOOL v16 = (void *)a3[1];
              std::__split_buffer<std::vector<long long>>::~__split_buffer((uint64_t)&v26);
            }
            else
            {
              void *v16 = 0;
              v16[1] = 0;
              v16[2] = 0;
              std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v16, v8, (uint64_t)&v8[v17], v14);
              v16 += 3;
              a3[1] = v16;
            }
            a3[1] = v16;
            ++v13;
            v8 += v17;
          }
          while (v13 < a1[4]);
          int v10 = &CVML_status_ok;
        }
      }
    }
    uint64_t v7 = (*v10 + 128) | 0xE00;
  }
  else
  {
LABEL_25:
    uint64_t v7 = 3710;
  }
LABEL_26:
  if (v25) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v25);
  }
  return v7;
}

void sub_1A40902E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::__shared_weak_count *a11, char a12)
{
  if (a11) {
    std::__shared_weak_count::__release_shared[abi:nn180100](a11);
  }
  _Unwind_Resume(exception_object);
}

uint64_t vision::mod::ImageDescriptorProcessorHasher::hashFeature(vision::mod::ImageDescriptorProcessorHasher *this, const vision::mod::ImageDescriptorBufferAbstract *lpsrc, vision::mod::ImageDescriptorBufferAbstract *a3)
{
  uint64_t result = 3708;
  if (v6 && v7)
  {
    if (v6[12] == *((_DWORD *)this + 2) && v7[12] == *((_DWORD *)this + 3))
    {
      vision::mod::ImageDescriptorBufferAbstract::resizeForDescriptorsCount(a3, 1uLL, 0);
      (*(void (**)(vision::mod::ImageDescriptorProcessorHasher *, void, void))(*(void *)this + 184))(this, *((void *)lpsrc + 7), *((void *)a3 + 7));
      return 3712;
    }
    else
    {
      return 3708;
    }
  }
  return result;
}

double vision::mod::ImageDescriptorProcessorHasher::createDescriptorBuffer(vision::mod::ImageDescriptorProcessorHasher *this, uint64_t a2)
{
  int v4 = operator new(0x90uLL);
  v4[1] = 0;
  v4[2] = 0;
  void *v4 = &unk_1EF7539A0;
  v4[4] = 0;
  v4[5] = 0;
  v4[9] = 0;
  v4[8] = 0;
  v4[6] = 0;
  v4[7] = v4 + 8;
  double result = 0.0;
  *((_OWORD *)v4 + 5) = 0u;
  *((_OWORD *)v4 + 6) = 0u;
  *((unsigned char *)v4 + 112) = 0;
  v4[3] = &unk_1EF752918;
  *((_DWORD *)v4 + 32) = 1;
  v4[17] = 0;
  v4[15] = *(int *)(a2 + 12);
  *(void *)this = v4 + 3;
  *((void *)this + 1) = v4;
  return result;
}

void vision::mod::ImageDescriptorProcessorHasher::getBase64(std::string *this, uint64_t a2, int a3)
{
  std::string::basic_string[abi:ne180100]<0>(this, "");
  if (a3 >= 25)
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = 3708;
    __cxa_throw(exception, MEMORY[0x1E4FBA3E0], 0);
  }
  unint64_t v6 = a2 << (24 - a3);
  std::string::push_back(this, vision::mod::ImageDescriptorProcessorHasher::b64chrs[(v6 >> 18) & 0x3F]);
  int v7 = vcvtd_n_s64_f64(ceil((double)a3 * 0.125), 3uLL);
  if (v7 < 7) {
    std::string::value_type v8 = 61;
  }
  else {
    std::string::value_type v8 = vision::mod::ImageDescriptorProcessorHasher::b64chrs[(v6 >> 12) & 0x3F];
  }
  std::string::push_back(this, v8);
  if (v7 < 13) {
    std::string::value_type v9 = 61;
  }
  else {
    std::string::value_type v9 = vision::mod::ImageDescriptorProcessorHasher::b64chrs[(v6 >> 6) & 0x3F];
  }
  std::string::push_back(this, v9);
  if (v7 < 19) {
    std::string::value_type v10 = 61;
  }
  else {
    std::string::value_type v10 = vision::mod::ImageDescriptorProcessorHasher::b64chrs[v6 & 0x3F];
  }
  std::string::push_back(this, v10);
}

void sub_1A4090630(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void vision::mod::ImageDescriptorProcessorHasher::base64EncodeHash(float *a1, unsigned int a2, int a3, uint64_t a4)
{
  if (*(char *)(a4 + 23) < 0)
  {
    *(void *)(a4 + 8) = 0;
    int v7 = *(unsigned char **)a4;
  }
  else
  {
    *(unsigned char *)(a4 + 23) = 0;
    int v7 = (unsigned char *)a4;
  }
  *int v7 = 0;
  int v8 = vcvtpd_s64_f64(log2((double)(2 * a3)));
  if (v8 >= 25)
  {
    exception = __cxa_allocate_exception(8uLL);
    uint64_t v20 = 3708;
    goto LABEL_32;
  }
  unint64_t v9 = 0;
  if (a2)
  {
    int v10 = 24;
    uint64_t v11 = a2;
    while (1)
    {
      unint64_t v12 = (unint64_t)*a1;
      if (*a1 != (float)v12) {
        break;
      }
      if (v10 >= v8)
      {
        unint64_t v9 = (v9 << v8) | v12;
        v10 -= v8;
      }
      else
      {
        int v13 = v8 - v10;
        vision::mod::ImageDescriptorProcessorHasher::getBase64(&__p, (v12 >> (v8 - v10)) | (v9 << v10), 24);
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          p_p = &__p;
        }
        else {
          p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
        }
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
        }
        else {
          std::string::size_type size = __p.__r_.__value_.__l.__size_;
        }
        std::string::append((std::string *)a4, (const std::string::value_type *)p_p, size);
        double v16 = ldexp(1.0, v13);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
        unint64_t v9 = (unint64_t)(v16 + -1.0) & v12;
        int v10 = 24 - v13;
      }
      ++a1;
      if (!--v11) {
        goto LABEL_22;
      }
    }
    exception = __cxa_allocate_exception(8uLL);
    uint64_t v20 = 3700;
LABEL_32:
    void *exception = v20;
    __cxa_throw(exception, MEMORY[0x1E4FBA3E0], 0);
  }
  int v10 = 24;
LABEL_22:
  vision::mod::ImageDescriptorProcessorHasher::getBase64(&__p, v9, 24 - v10);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v17 = &__p;
  }
  else {
    uint64_t v17 = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v18 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v18 = __p.__r_.__value_.__l.__size_;
  }
  std::string::append((std::string *)a4, (const std::string::value_type *)v17, v18);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_1A4090810(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1A409098C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A4090A74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A4090B7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A4090C88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A4090D94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A4090E8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A4090F9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A4091084(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A40911D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A409129C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A409133C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A40913F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A40914A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A4091560(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A409160C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A40916C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A4091768(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A4091868(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A40918E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A4091988(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A4091A0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A4091A7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A4091AE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

BOOL VNNormalizedRectIsIdentityRect(CGRect normalizedRect)
{
  v2.origin.x = 0.0;
  v2.origin.y = 0.0;
  v2.size.width = 1.0;
  v2.size.height = 1.0;
  return CGRectEqualToRect(normalizedRect, v2);
}

CGPoint VNImagePointForNormalizedPointUsingRegionOfInterest(CGPoint normalizedPoint, size_t imageWidth, size_t imageHeight, CGRect roi)
{
  VisionCoreImagePointForNormalizedPoint();
  result.y = v5;
  result.x = v4;
  return result;
}

CGPoint VNNormalizedPointForImagePointUsingRegionOfInterest(CGPoint imagePoint, size_t imageWidth, size_t imageHeight, CGRect roi)
{
  if (imageWidth && imageHeight)
  {
    double v4 = (imagePoint.x - roi.origin.x * (double)imageWidth) / (roi.size.width * (double)imageWidth);
    double v5 = (imagePoint.y - roi.origin.y * (double)imageHeight) / (roi.size.height * (double)imageHeight);
  }
  else
  {
    double v4 = *MEMORY[0x1E4F1DAD8];
    double v5 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  result.y = v5;
  result.x = v4;
  return result;
}

CGRect VNImageRectForNormalizedRect(CGRect normalizedRect, size_t imageWidth, size_t imageHeight)
{
  double v3 = normalizedRect.origin.x * (double)imageWidth;
  double v4 = normalizedRect.size.width * (double)imageWidth;
  double v5 = normalizedRect.origin.y * (double)imageHeight;
  double v6 = normalizedRect.size.height * (double)imageHeight;
  result.size.height = v6;
  result.size.width = v4;
  result.origin.y = v5;
  result.origin.x = v3;
  return result;
}

CGRect VNImageRectForNormalizedRectUsingRegionOfInterest(CGRect normalizedRect, size_t imageWidth, size_t imageHeight, CGRect roi)
{
  double height = roi.size.height;
  double width = roi.size.width;
  double v8 = normalizedRect.size.height;
  double v9 = normalizedRect.size.width;
  VisionCoreImagePointForNormalizedPoint();
  double v12 = v9 * width * (double)imageWidth;
  double v13 = v8 * height * (double)imageHeight;
  result.size.double height = v13;
  result.size.double width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

CGRect VNNormalizedRectForImageRect(CGRect imageRect, size_t imageWidth, size_t imageHeight)
{
  double width = imageRect.size.width;
  double y = imageRect.origin.y;
  double x = imageRect.origin.x;
  double v6 = 0.0;
  double v7 = 0.0;
  double v8 = 0.0;
  if (imageWidth)
  {
    double v7 = x / (double)imageWidth;
    double v8 = width / (double)imageWidth;
  }
  double v9 = 0.0;
  if (imageHeight)
  {
    double v6 = y / (double)imageHeight;
    double v9 = imageRect.size.height / (double)imageHeight;
  }
  double v10 = v9;
  result.size.double height = v10;
  result.size.double width = v8;
  result.origin.double y = v6;
  result.origin.double x = v7;
  return result;
}

CGRect VNNormalizedRectForImageRectUsingRegionOfInterest(CGRect imageRect, size_t imageWidth, size_t imageHeight, CGRect roi)
{
  if (imageWidth && imageHeight)
  {
    CGFloat height = imageRect.size.height;
    CGFloat width = imageRect.size.width;
    CGFloat y = imageRect.origin.y;
    CGFloat x = imageRect.origin.x;
    CGFloat v18 = roi.origin.y * (double)imageHeight;
    CGFloat v19 = roi.origin.x * (double)imageWidth;
    CGFloat v8 = roi.size.width * (double)imageWidth;
    CGFloat v9 = roi.size.height * (double)imageHeight;
    double v10 = (imageRect.origin.x - v19) / v8;
    double v11 = (imageRect.origin.y - v18) / v9;
    double MaxX = CGRectGetMaxX(imageRect);
    v20.origin.CGFloat x = x;
    v20.origin.CGFloat y = y;
    v20.size.CGFloat width = width;
    v20.size.CGFloat height = height;
    CGFloat MaxY = CGRectGetMaxY(v20);
    double v13 = (MaxX - v19) / v8 - v10;
    double v14 = (MaxY - v18) / v9 - v11;
  }
  else
  {
    double v10 = *MEMORY[0x1E4F1DB28];
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  double v15 = v10;
  double v16 = v11;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

CGPoint VNNormalizedFaceBoundingBoxPointForLandmarkPoint(vector_float2 faceLandmarkPoint, CGRect faceBoundingBox, size_t imageWidth, size_t imageHeight)
{
  double v4 = faceBoundingBox.size.height * (double)imageHeight * faceLandmarkPoint.f32[1];
  double v5 = faceBoundingBox.size.width * (double)imageWidth * faceLandmarkPoint.f32[0];
  result.CGFloat y = v4;
  result.CGFloat x = v5;
  return result;
}

CGPoint VNImagePointForFaceLandmarkPoint(vector_float2 faceLandmarkPoint, CGRect faceBoundingBox, size_t imageWidth, size_t imageHeight)
{
  CGFloat v4 = faceBoundingBox.origin.y * (double)imageHeight;
  CGFloat v5 = faceBoundingBox.origin.x * (double)imageWidth
     + faceLandmarkPoint.f32[0] * (faceBoundingBox.size.width * (double)imageWidth);
  double v6 = v4 + faceLandmarkPoint.f32[1] * (faceBoundingBox.size.height * (double)imageHeight);
  double v7 = v5;
  result.CGFloat y = v6;
  result.CGFloat x = v7;
  return result;
}

double VNNormalizedRectForPixelRectInBounds(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  if (a7 <= 0.0 || a8 <= 0.0) {
    return *MEMORY[0x1E4F1DB20];
  }
  else {
    return (a1 - a5) / a7;
  }
}

double VNPixelRectForNormalizedRectInBounds(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  if (a7 <= 0.0 || a8 <= 0.0) {
    return *MEMORY[0x1E4F1DB20];
  }
  v9.origin.CGFloat x = a5 + a1 * a7;
  v9.origin.CGFloat y = a6 + a2 * a8;
  v9.size.CGFloat width = a3 * a7;
  v9.size.CGFloat height = a4 * a8;
  *(void *)&double result = (unint64_t)CGRectIntegral(v9);
  return result;
}

double VNLargestCentralSquareOfRect(double result, double a2, double a3, double a4)
{
  if (a3 >= a4) {
    return result + (a3 - a4) * 0.5;
  }
  return result;
}

double VNNormalizedImageRectForNormalizedRegionOfInterestRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  unint64_t v14 = (unint64_t)a1;
  double result = 0.0;
  if (v14) {
    return (a3 * (double)v14 + a9 * (double)(unint64_t)(a5 * (double)v14)) / (double)v14;
  }
  return result;
}

CGFloat VNIntersectionOverUnion(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  CGRect v13 = CGRectIntersection(*(CGRect *)&a1, *(CGRect *)&a5);
  return v13.size.width * v13.size.height / (a3 * a4 + a7 * a8 - v13.size.width * v13.size.height);
}

uint64_t VNVisionCoreE5RTComputeDeviceTypesForMLComputeDevices(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v1 = a1;
  uint64_t v2 = 0;
  uint64_t v3 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v1);
        }
        id v6 = *(id *)(*((void *)&v9 + 1) + 8 * v5);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v7 = 4;
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v7 = 2;
          }
          else
          {
            objc_opt_class();
            uint64_t v7 = objc_opt_isKindOfClass() & 1;
          }
        }

        v2 |= v7;
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v3);
  }

  return v2;
}

void sub_1A40920C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id VNMethodSignatureStringForObjectAndSelector(void *a1, const char *a2)
{
  id v3 = a1;
  uint64_t v4 = v3;
  uint64_t v5 = 0;
  if (v3 && a2)
  {
    BOOL isClass = object_isClass(v3);
    Class = object_getClass(v4);
    id v8 = [NSString alloc];
    if (isClass) {
      uint64_t v9 = 43;
    }
    else {
      uint64_t v9 = 45;
    }
    long long v10 = NSStringFromClass(Class);
    long long v11 = NSStringFromSelector(a2);
    uint64_t v5 = (void *)[v8 initWithFormat:@"%c[%@ %@]", v9, v10, v11];
  }

  return v5;
}

void sub_1A40921D8(_Unwind_Exception *a1)
{
  uint64_t v4 = v2;

  _Unwind_Resume(a1);
}

__CFString *VNElementTypeToString(unint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"VNElementType(%lu)", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_1E5B20258[a1];
  }

  return v1;
}

__CFString *VNImageCropAndScaleOptionToString(uint64_t a1)
{
  if (a1 > 1)
  {
    if (a1 == 2)
    {
      uint64_t v2 = @"VNImageCropAndScaleOptionScaleFill";
    }
    else
    {
      if (a1 != 257)
      {
LABEL_12:
        objc_msgSend(NSString, "stringWithFormat:", @"VNImageCropAndScaleOption(%lu)", a1);
        uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
        return v2;
      }
      uint64_t v2 = @"VNImageCropAndScaleOptionScaleFitRotate90CCW";
    }
  }
  else
  {
    if (a1)
    {
      if (a1 == 1)
      {
        uint64_t v2 = @"VNImageCropAndScaleOptionScaleFit";
        return v2;
      }
      goto LABEL_12;
    }
    uint64_t v2 = @"VNImageCropAndScaleOptionCenterCrop";
  }
  return v2;
}

id VNHumanReadableCGRect(double a1, double a2, double a3, double a4)
{
  id v6 = NSString;
  uint64_t v7 = [NSString stringWithFormat:@"(%g, %g)", *(void *)&a1, *(void *)&a2];
  id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%g x %g", *(void *)&a3, *(void *)&a4);
  uint64_t v9 = [v6 stringWithFormat:@"[%@ %@]", v7, v8];

  return v9;
}

void sub_1A40923F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___Z71_featureCropOrientationsFromSuperpositionOfFeatureWithImageOrientationsv_block_invoke()
{
  v27[8] = *MEMORY[0x1E4F143B8];
  v24[0] = &unk_1EF7A7B98;
  v24[1] = &unk_1EF7A7BB0;
  v25[0] = &unk_1EF7A7B98;
  v25[1] = &unk_1EF7A7BB0;
  v24[2] = &unk_1EF7A7BC8;
  v24[3] = &unk_1EF7A7BE0;
  v25[2] = &unk_1EF7A7BC8;
  v25[3] = &unk_1EF7A7BE0;
  v26[0] = &unk_1EF7A7B98;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:4];
  v27[0] = v9;
  v26[1] = &unk_1EF7A7BF8;
  v22[0] = &unk_1EF7A7B98;
  v22[1] = &unk_1EF7A7BB0;
  v23[0] = &unk_1EF7A7BF8;
  v23[1] = &unk_1EF7A7C10;
  v22[2] = &unk_1EF7A7BC8;
  v22[3] = &unk_1EF7A7BE0;
  v23[2] = &unk_1EF7A7C28;
  v23[3] = &unk_1EF7A7C40;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:4];
  v27[1] = v8;
  v26[2] = &unk_1EF7A7BC8;
  v20[0] = &unk_1EF7A7B98;
  v20[1] = &unk_1EF7A7BB0;
  v21[0] = &unk_1EF7A7BC8;
  v21[1] = &unk_1EF7A7BE0;
  v20[2] = &unk_1EF7A7BC8;
  v20[3] = &unk_1EF7A7BE0;
  v21[2] = &unk_1EF7A7B98;
  v21[3] = &unk_1EF7A7BB0;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:4];
  v27[2] = v7;
  v26[3] = &unk_1EF7A7C28;
  v18[0] = &unk_1EF7A7B98;
  v18[1] = &unk_1EF7A7BB0;
  v19[0] = &unk_1EF7A7C28;
  v19[1] = &unk_1EF7A7C40;
  v18[2] = &unk_1EF7A7BC8;
  v18[3] = &unk_1EF7A7BE0;
  v19[2] = &unk_1EF7A7BF8;
  v19[3] = &unk_1EF7A7C10;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:4];
  v27[3] = v6;
  v26[4] = &unk_1EF7A7C40;
  v16[0] = &unk_1EF7A7B98;
  v16[1] = &unk_1EF7A7BB0;
  v17[0] = &unk_1EF7A7C40;
  v17[1] = &unk_1EF7A7BF8;
  v16[2] = &unk_1EF7A7BC8;
  v16[3] = &unk_1EF7A7BE0;
  v17[2] = &unk_1EF7A7C10;
  v17[3] = &unk_1EF7A7C28;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];
  v27[4] = v5;
  v26[5] = &unk_1EF7A7BB0;
  v14[0] = &unk_1EF7A7B98;
  v14[1] = &unk_1EF7A7BB0;
  v15[0] = &unk_1EF7A7BB0;
  v15[1] = &unk_1EF7A7BC8;
  v14[2] = &unk_1EF7A7BC8;
  v14[3] = &unk_1EF7A7BE0;
  v15[2] = &unk_1EF7A7BE0;
  v15[3] = &unk_1EF7A7B98;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
  v27[5] = v0;
  v26[6] = &unk_1EF7A7C10;
  v12[0] = &unk_1EF7A7B98;
  v12[1] = &unk_1EF7A7BB0;
  v13[0] = &unk_1EF7A7C10;
  v13[1] = &unk_1EF7A7C28;
  _OWORD v12[2] = &unk_1EF7A7BC8;
  v12[3] = &unk_1EF7A7BE0;
  v13[2] = &unk_1EF7A7C40;
  v13[3] = &unk_1EF7A7BF8;
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:4];
  v27[6] = v1;
  v26[7] = &unk_1EF7A7BE0;
  v10[0] = &unk_1EF7A7B98;
  v10[1] = &unk_1EF7A7BB0;
  v11[0] = &unk_1EF7A7BE0;
  v11[1] = &unk_1EF7A7B98;
  v10[2] = &unk_1EF7A7BC8;
  v10[3] = &unk_1EF7A7BE0;
  v11[2] = &unk_1EF7A7BB0;
  v11[3] = &unk_1EF7A7BC8;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:4];
  v27[7] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:8];
  uint64_t v4 = (void *)_featureCropOrientationsFromSuperpositionOfFeatureWithImageOrientations(void)::featureCropOrientationsFromSuperpositionOfFeatureWithImageOrientations;
  _featureCropOrientationsFromSuperpositionOfFeatureWithImageOrientations(void)::featureCropOrientationsFromSuperpositionOfFeatureWithImageOrientations = v3;
}

void sub_1A40926C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14)
{
  uint64_t v17 = v15;

  _Unwind_Resume(a1);
}

uint64_t VNCalculateFeatureCropOrientationFromSuperpositionOfFeatureWithImageOrientations(uint64_t a1, uint64_t a2, _DWORD *a3, int a4, void *a5)
{
  if (a3)
  {
    if (_featureCropOrientationsFromSuperpositionOfFeatureWithImageOrientations(void)::onceToken != -1) {
      dispatch_once(&_featureCropOrientationsFromSuperpositionOfFeatureWithImageOrientations(void)::onceToken, &__block_literal_global_38031);
    }
    id v10 = (id)_featureCropOrientationsFromSuperpositionOfFeatureWithImageOrientations(void)::featureCropOrientationsFromSuperpositionOfFeatureWithImageOrientations;
    long long v11 = [NSNumber numberWithInt:a1];
    long long v12 = [v10 objectForKeyedSubscript:v11];

    if (v12)
    {
      CGRect v13 = [NSNumber numberWithInt:a2];
      uint64_t v14 = [v12 objectForKeyedSubscript:v13];

      if (v14)
      {
        uint64_t v15 = [v14 integerValue];
        *a3 = v15;
        if (a4) {
          *a3 = *(_DWORD *)((char *)&VNCalculateFeatureCropOrientationFromSuperpositionOfFeatureWithImageOrientations::rotatedOrientations90CCW
        }
                          + (((v15 << 32) - 0x100000000) >> 30));
        uint64_t v16 = 1;
      }
      else
      {
        if (a5)
        {
          uint64_t v17 = [NSNumber numberWithInt:a1];
          *a5 = +[VNError errorForInvalidArgument:v17 named:@"feature orientation"];
        }
        uint64_t v14 = 0;
        uint64_t v16 = 0;
      }
    }
    else
    {
      if (!a5)
      {
        uint64_t v16 = 0;
        goto LABEL_17;
      }
      uint64_t v14 = [NSNumber numberWithInt:a1];
      +[VNError errorForInvalidArgument:v14 named:@"image orientation"];
      uint64_t v16 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_17:
    return v16;
  }
  if (!a5) {
    return 0;
  }
  +[VNError errorForInternalErrorWithLocalizedDescription:@"Face crop orientation is a mandatory parameter"];
  uint64_t v16 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
  return v16;
}

void sub_1A4092948(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t VNSetFaceOrientationInOptionsDictionary(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  if (v6)
  {
    unsigned int v10 = -1;
    uint64_t v7 = [v5 getFaceEXIFOrientation:&v10 error:a3];
    if (v7)
    {
      id v8 = [NSNumber numberWithInt:v10];
      [v6 setObject:v8 forKeyedSubscript:@"VNImageBufferOption_FeatureOrientationRelativeToUpRight"];
    }
  }
  else if (a3)
  {
    +[VNError errorForInvalidArgument:0 named:@"options"];
    uint64_t v7 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

void sub_1A4092A78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id VNCloneFaceObservationFromOptions(uint64_t a1, void *a2)
{
  uint64_t v3 = +[VNValidationUtilities requiredFaceObservationInOptions:a1 error:a2];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = objc_msgSend(v3, "vn_cloneObject");
    id v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else if (a2)
    {
      *a2 = +[VNError errorForMemoryAllocationFailure];
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void sub_1A4092B40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t VNFaceObservationsCollectionIsSubsetOfFaceObservationsCollection(void *a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  id v5 = v4;
  if (v3 == v4)
  {
    uint64_t v6 = 1;
  }
  else
  {
    uint64_t v6 = 0;
    if (v3 && v4)
    {
      unint64_t v7 = [v3 count];
      if (v7 <= [v5 count])
      {
        id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v9 = v5;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
        if (v10)
        {
          uint64_t v11 = *(void *)v26;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v26 != v11) {
                objc_enumerationMutation(v9);
              }
              CGRect v13 = [*(id *)(*((void *)&v25 + 1) + 8 * v12) uuid];
              [v8 addObject:v13];

              ++v12;
            }
            while (v10 != v12);
            uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
          }
          while (v10);
        }

        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v14 = v3;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v15)
        {
          uint64_t v16 = *(void *)v22;
          while (2)
          {
            uint64_t v17 = 0;
            do
            {
              if (*(void *)v22 != v16) {
                objc_enumerationMutation(v14);
              }
              CGFloat v18 = [*(id *)(*((void *)&v21 + 1) + 8 * v17) uuid];
              char v19 = [v8 containsObject:v18];

              if ((v19 & 1) == 0)
              {
                uint64_t v6 = 0;
                goto LABEL_24;
              }
              ++v17;
            }
            while (v15 != v17);
            uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
            if (v15) {
              continue;
            }
            break;
          }
        }
        uint64_t v6 = 1;
LABEL_24:
      }
      else
      {
        uint64_t v6 = 0;
      }
    }
  }

  return v6;
}

void sub_1A4092D8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void __VNRequestClasses_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __VNRequestClasses_block_invoke_2;
  v4[3] = &unk_1E5B20118;
  id v1 = v0;
  id v5 = v1;
  +[VNClassRegistrar enumerateEntriesUsingBlock:v4];
  uint64_t v2 = [v1 copy];
  id v3 = (void *)VNRequestClasses::ourRequestClasses;
  VNRequestClasses::ourRequestClasses = v2;
}

void sub_1A4092E9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void __VNRequestClasses_block_invoke_2(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  aClassName = a4;
  if ((a2 - 1) <= 1)
  {
    Class v6 = NSClassFromString(aClassName);
    if (v6) {
      [*(id *)(a1 + 32) addObject:v6];
    }
  }
}

void sub_1A4092F24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t __VNDefaultObservationsSortingComparator_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (v4 == v5)
  {
    uint64_t v9 = 0;
  }
  else
  {
    [v4 confidence];
    float v7 = v6;
    [v5 confidence];
    if (v7 > v8) {
      uint64_t v9 = -1;
    }
    else {
      uint64_t v9 = v7 < v8;
    }
  }

  return v9;
}

void sub_1A4092FB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __VNDefaultClassificationObservationsSortingComparator_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (v4 == v5)
  {
    uint64_t v9 = 0;
  }
  else
  {
    [v4 confidence];
    float v7 = v6;
    [v5 confidence];
    if (v7 > v8) {
      uint64_t v9 = -1;
    }
    else {
      uint64_t v9 = v7 < v8;
    }
    if (!v9)
    {
      uint64_t v10 = [v4 identifier];
      uint64_t v11 = [v5 identifier];
      uint64_t v9 = [v10 compare:v11 options:129];
    }
  }

  return v9;
}

void sub_1A409308C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __VNDefaultRecognizedObjectObservationsSortingComparator_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (v4 == v5)
  {
    uint64_t v9 = 0;
  }
  else
  {
    [v4 confidence];
    float v7 = v6;
    [v5 confidence];
    if (v7 > v8) {
      uint64_t v9 = -1;
    }
    else {
      uint64_t v9 = v7 < v8;
    }
    if (!v9)
    {
      [v4 boundingBox];
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      double v15 = v14;
      double v17 = v16;
      CGFloat v18 = [v4 labels];
      unint64_t v19 = [v18 count];
      [v5 boundingBox];
      CGFloat v21 = v20;
      CGFloat v23 = v22;
      double v25 = v24;
      double v27 = v26;
      long long v28 = [v5 labels];
      uint64_t v29 = [v28 count];
      if (v15 * v17 > v25 * v27)
      {
LABEL_7:
        uint64_t v9 = -1;
LABEL_16:

        goto LABEL_17;
      }
      if (v15 * v17 >= v25 * v27)
      {
        unint64_t v30 = v29;
        v33.origin.CGFloat x = v11;
        v33.origin.CGFloat y = v13;
        v33.size.CGFloat width = v15;
        v33.size.CGFloat height = v17;
        v34.origin.CGFloat x = v21;
        v34.origin.CGFloat y = v23;
        v34.size.CGFloat width = v25;
        v34.size.CGFloat height = v27;
        if (!CGRectIntersectsRect(v33, v34)) {
          goto LABEL_15;
        }
        if (v19 > v30) {
          goto LABEL_7;
        }
        if (v19 >= v30)
        {
LABEL_15:
          uint64_t v9 = 0;
          goto LABEL_16;
        }
      }
      uint64_t v9 = 1;
      goto LABEL_16;
    }
  }
LABEL_17:

  return v9;
}

void sub_1A409321C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id VNRequestRevisionString(objc_class *a1, unint64_t a2)
{
  id v3 = VNRequestClassFromClientSubclass(a1);
  id v4 = v3;
  if (a2 < 0xDECAF000
    || ([(objc_class *)v3 descriptionForPrivateRevision:a2],
        (id v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v6 = [NSString alloc];
    float v7 = NSStringFromClass(v4);
    id v5 = (void *)[v6 initWithFormat:@"%@Revision%lu", v7, a2];
  }

  return v5;
}

void sub_1A40932F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

NSUInteger VNElementTypeSize(VNElementType elementType)
{
  if (elementType == VNElementTypeFloat) {
    return 4;
  }
  else {
    return 8 * (elementType == VNElementTypeDouble);
  }
}

id VNBinModelFilePathFromModelNameAndThrow(void *a1)
{
  id v1 = a1;
  uint64_t v2 = VNFrameworkBundle();
  id v3 = [v2 pathForResource:v1 ofType:@"bin"];
  if (!v3)
  {
    uint64_t v5 = [[NSString alloc] initWithFormat:@"Model file %@.bin is missing", v1];
    id v6 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"Loading Resource Error" reason:v5 userInfo:0];
    objc_exception_throw(v6);
  }

  return v3;
}

void sub_1A40933E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t VNExecuteBlockWithPixelBuffer(__CVBuffer *a1, CVPixelBufferLockFlags a2, void *a3, void *a4)
{
  id v7 = a3;
  if (+[VNCVPixelBufferHelper lockPixelBuffer:lockFlags:error:]((uint64_t)VNCVPixelBufferHelper, a1, a2, a4))
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __VNExecuteBlockWithPixelBuffer_block_invoke;
    v13[3] = &unk_1E5B201A0;
    id v14 = v7;
    double v15 = a1;
    float v8 = _Block_copy(v13);
    unsigned int v9 = VNExecuteBlock(v8, (uint64_t)a4);
    if (v9) {
      double v10 = a4;
    }
    else {
      double v10 = 0;
    }
    uint64_t v11 = +[VNCVPixelBufferHelper unlockPixelBuffer:lockFlags:error:]((uint64_t)VNCVPixelBufferHelper, a1, a2, v10) & v9;
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

void sub_1A4093514(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

uint64_t __VNExecuteBlockWithPixelBuffer_block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40), a2);
}

id VNFloat32DataForFloat16Data(void *a1, void *a2)
{
  id v3 = a1;
  size_t v4 = [v3 length];
  if (v4)
  {
    if (a2)
    {
      +[VNError errorForInvalidArgumentWithLocalizedDescription:@"float16 data was not a length multiple of 2"];
      float v8 = 0;
      *a2 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      float v8 = 0;
    }
  }
  else
  {
    vImagePixelCount v5 = v4 >> 1;
    src.data = (void *)[v3 bytes];
    src.CGFloat height = 1;
    src.CGFloat width = v4 >> 1;
    src.rowBytes = v4;
    id v6 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:4 * (v4 >> 1)];
    v10.data = (void *)[v6 mutableBytes];
    v10.CGFloat height = 1;
    v10.CGFloat width = v5;
    v10.rowBytes = 4 * v5;
    vImage_Error v7 = vImageConvert_Planar16FtoPlanarF(&src, &v10, 0);
    if (v7)
    {
      if (a2)
      {
        +[VNError errorForVImageError:v7 localizedDescription:0];
        float v8 = 0;
        *a2 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        float v8 = 0;
      }
    }
    else
    {
      float v8 = (void *)[v6 copy];
    }
  }

  return v8;
}

void sub_1A409368C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id VNFloat16DataForFloat32Data(void *a1, void *a2)
{
  id v3 = a1;
  size_t v4 = [v3 length];
  if ((v4 & 3) != 0)
  {
    if (a2)
    {
      +[VNError errorForInvalidArgumentWithLocalizedDescription:@"float32 data was not a length multiple of 4"];
      vImagePixelCount v5 = 0;
      *a2 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      vImagePixelCount v5 = 0;
    }
  }
  else
  {
    vImagePixelCount v6 = v4 >> 2;
    src.data = (void *)[v3 bytes];
    src.CGFloat height = 1;
    src.CGFloat width = v4 >> 2;
    src.rowBytes = v4;
    id v7 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:2 * (v4 >> 2)];
    v10.data = (void *)[v7 mutableBytes];
    v10.CGFloat height = 1;
    v10.CGFloat width = v6;
    v10.rowBytes = 2 * v6;
    vImage_Error v8 = vImageConvert_PlanarFtoPlanar16F(&src, &v10, 0);
    if (v8)
    {
      if (a2)
      {
        +[VNError errorForVImageError:v8 localizedDescription:0];
        vImagePixelCount v5 = 0;
        *a2 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        vImagePixelCount v5 = 0;
      }
    }
    else
    {
      vImagePixelCount v5 = (void *)[v7 copy];
    }
  }

  return v5;
}

void sub_1A40937F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

CFTypeRef VNDebugColorFromValues(const CGFloat *a1)
{
  uint64_t v2 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
  CGColorRef v3 = CGColorCreate(v2, a1);
  CGColorSpaceRelease(v2);

  return CFAutorelease(v3);
}

CFTypeRef VNDebugContrastOutlineColor()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = xmmword_1A4125508;
  v1[1] = unk_1A4125518;
  return VNDebugColorFromValues((const CGFloat *)v1);
}

CFTypeRef VNDebugPathColor()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = xmmword_1A4125528;
  v1[1] = unk_1A4125538;
  return VNDebugColorFromValues((const CGFloat *)v1);
}

CFTypeRef VNDebugQuadColor()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = xmmword_1A4125548;
  v1[1] = unk_1A4125558;
  return VNDebugColorFromValues((const CGFloat *)v1);
}

CFTypeRef VNDebugBoundingBoxColor()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = xmmword_1A4125568;
  v1[1] = unk_1A4125578;
  return VNDebugColorFromValues((const CGFloat *)v1);
}

CFTypeRef VNDebugFeatureColor()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = xmmword_1A4125588;
  v1[1] = unk_1A4125598;
  return VNDebugColorFromValues((const CGFloat *)v1);
}

uint64_t VNDebugColorFromCGColor(CGColor *a1)
{
  Class v2 = NSClassFromString(&cfstr_Nscolor.isa);
  SEL v3 = NSSelectorFromString(&cfstr_Colorwithcgcol.isa);
  size_t v4 = (uint64_t (*)(Class, SEL, CGColor *))[(objc_class *)v2 methodForSelector:v3];

  return v4(v2, v3, a1);
}

uint64_t VNGetRequestConcurrentTasksProcessingPolicyLimits(void *a1, void *a2, void *a3, uint64_t *a4)
{
  if (a1 && a2 && a3 && a4)
  {
    *a1 = +[VNRequestPerformingPriorityGroup1AsyncTasksQueueCache maximumAllowedTasksInTheQueue];
    *a2 = +[VNRequestPerformingPriorityGroup2AsyncTasksQueueCache maximumAllowedTasksInTheQueue];
    *a3 = +[VNRequestAsyncTasksQueueCache maximumAllowedTasksInTheQueue];
    uint64_t result = +[VNDetectorAsyncTasksQueueCache maximumAllowedTasksInTheQueue];
    *a4 = result;
  }
  else
  {
    return +[VNError VNAssert:0 log:@"One of the output parameters is null"];
  }
  return result;
}

uint64_t VNUpgradeFaceprint(void *a1, void *a2, void *a3, void *a4, _DWORD *a5, void *a6)
{
  v25[3] = *MEMORY[0x1E4F143B8];
  id v11 = a1;
  id v12 = a2;
  id v13 = a3;
  if (a4)
  {
    if (a5)
    {
      if (__VNUpgradeFaceprint_block_invoke(v11, @"previousFaceprint", a6)
        && __VNUpgradeFaceprint_block_invoke(v12, @"newLowResolutionFaceprint", a6)
        && __VNUpgradeFaceprint_block_invoke(v13, @"session", a6))
      {
        v25[0] = v13;
        v24[0] = @"VNDetectorProcessOption_Session";
        v24[1] = @"VNEspressoprintUpgradeDetectorProcessOption_EspressoprintClass";
        v24[2] = @"VNDetectorOption_ComputeStageDeviceAssignments";
        v25[1] = objc_opt_class();
        v25[2] = MEMORY[0x1E4F1CC08];
        id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:3];
        double v15 = [v13 detectorOfType:@"VNEspressoprintUpgradeDetectorType" configuredWithOptions:v14 error:a6];
        if (!v15)
        {
          uint64_t v21 = 0;
LABEL_22:

          goto LABEL_16;
        }
        double v16 = (void *)[v14 mutableCopy];
        [v16 setObject:v11 forKeyedSubscript:@"VNEspressoprintUpgradeDetectorProcessOption_FromEspressoprint"];
        [v16 setObject:v12 forKeyedSubscript:@"VNEspressoprintUpgradeDetectorProcessOption_ToEspressoprint"];
        double v17 = objc_msgSend(v15, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", qos_class_self(), v16, 0, a6, 0, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
        CGFloat v18 = v17;
        if (v17)
        {
          if ([v17 count] == 2)
          {
            *a4 = [v18 objectAtIndex:0];
            unint64_t v19 = [v18 objectAtIndex:1];
            [v19 floatValue];
            *a5 = v20;

            uint64_t v21 = 1;
LABEL_21:

            goto LABEL_22;
          }
          if (a6)
          {
            +[VNError errorForInternalErrorWithLocalizedDescription:@"Unexpected number of faceprints returned"];
            uint64_t v21 = 0;
            *a6 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_21;
          }
        }
        uint64_t v21 = 0;
        goto LABEL_21;
      }
      goto LABEL_15;
    }
    if (a6)
    {
      id v22 = +[VNError errorForInvalidArgument:0 named:@"sigmaOut"];
      goto LABEL_14;
    }
LABEL_15:
    uint64_t v21 = 0;
    goto LABEL_16;
  }
  if (!a6) {
    goto LABEL_15;
  }
  id v22 = +[VNError errorForInvalidArgument:0 named:@"newHighResolutionFaceprintOut"];
LABEL_14:
  uint64_t v21 = 0;
  *a6 = v22;
LABEL_16:

  return v21;
}

void sub_1A4093E64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL __VNUpgradeFaceprint_block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  if (!v5 && a3)
  {
    *a3 = +[VNError errorForInvalidArgument:0 named:v6];
  }

  return v5 != 0;
}

void sub_1A4093F44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t VNUpgradeTorsoprint(void *a1, void *a2, void *a3, void *a4, _DWORD *a5, void *a6)
{
  v25[3] = *MEMORY[0x1E4F143B8];
  id v11 = a1;
  id v12 = a2;
  id v13 = a3;
  if (a4)
  {
    if (a5)
    {
      if (__VNUpgradeTorsoprint_block_invoke(v11, @"previousFaceprint", a6)
        && __VNUpgradeTorsoprint_block_invoke(v12, @"newLowResolutionFaceprint", a6)
        && __VNUpgradeTorsoprint_block_invoke(v13, @"session", a6))
      {
        v25[0] = v13;
        v24[0] = @"VNDetectorProcessOption_Session";
        v24[1] = @"VNEspressoprintUpgradeDetectorProcessOption_EspressoprintClass";
        v24[2] = @"VNDetectorOption_ComputeStageDeviceAssignments";
        v25[1] = objc_opt_class();
        v25[2] = MEMORY[0x1E4F1CC08];
        id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:3];
        double v15 = [v13 detectorOfType:@"VNEspressoprintUpgradeDetectorType" configuredWithOptions:v14 error:a6];
        if (!v15)
        {
          uint64_t v21 = 0;
LABEL_22:

          goto LABEL_16;
        }
        double v16 = (void *)[v14 mutableCopy];
        [v16 setObject:v11 forKeyedSubscript:@"VNEspressoprintUpgradeDetectorProcessOption_FromEspressoprint"];
        [v16 setObject:v12 forKeyedSubscript:@"VNEspressoprintUpgradeDetectorProcessOption_ToEspressoprint"];
        double v17 = objc_msgSend(v15, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", qos_class_self(), v16, 0, a6, 0, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
        CGFloat v18 = v17;
        if (v17)
        {
          if ([v17 count] == 2)
          {
            *a4 = [v18 objectAtIndex:0];
            unint64_t v19 = [v18 objectAtIndex:1];
            [v19 floatValue];
            *a5 = v20;

            uint64_t v21 = 1;
LABEL_21:

            goto LABEL_22;
          }
          if (a6)
          {
            +[VNError errorForInternalErrorWithLocalizedDescription:@"Unexpected number of faceprints returned"];
            uint64_t v21 = 0;
            *a6 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_21;
          }
        }
        uint64_t v21 = 0;
        goto LABEL_21;
      }
      goto LABEL_15;
    }
    if (a6)
    {
      id v22 = +[VNError errorForInvalidArgument:0 named:@"sigmaOut"];
      goto LABEL_14;
    }
LABEL_15:
    uint64_t v21 = 0;
    goto LABEL_16;
  }
  if (!a6) {
    goto LABEL_15;
  }
  id v22 = +[VNError errorForInvalidArgument:0 named:@"newHighResolutionFaceprintOut"];
LABEL_14:
  uint64_t v21 = 0;
  *a6 = v22;
LABEL_16:

  return v21;
}

void sub_1A4094234(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL __VNUpgradeTorsoprint_block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  if (!v5 && a3)
  {
    *a3 = +[VNError errorForInvalidArgument:0 named:v6];
  }

  return v5 != 0;
}

void sub_1A4094314(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void VNGetRequestConcurrentTasksProcessingPolicy(void *a1, void *a2, void *a3, void *a4)
{
  if (a1 && a2 && a3 && a4)
  {
    vImage_Error v8 = +[VNRequestPerformingPriorityGroup1AsyncTasksQueueCache sharedCache];
    *a1 = [v8 maximumTasksCount];
    unsigned int v9 = +[VNRequestPerformingPriorityGroup2AsyncTasksQueueCache sharedCache];

    *a2 = [v9 maximumTasksCount];
    vImage_Buffer v10 = +[VNRequestAsyncTasksQueueCache sharedCache];

    *a3 = [v10 maximumTasksCount];
    id v11 = +[VNDetectorAsyncTasksQueueCache sharedCache];

    *a4 = [v11 maximumTasksCount];
  }
  else
  {
    +[VNError VNAssert:0 log:@"One of the output parameters is null"];
  }
}

void sub_1A4094470(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void VNSetRequestConcurrentTasksProcessingPolicy(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  vImage_Error v8 = +[VNRequestPerformingPriorityGroup1AsyncTasksQueueCache sharedCache];
  [v8 setMaximumTasksCount:a1];
  unsigned int v9 = +[VNRequestPerformingPriorityGroup2AsyncTasksQueueCache sharedCache];

  [v9 setMaximumTasksCount:a2];
  vImage_Buffer v10 = +[VNRequestAsyncTasksQueueCache sharedCache];

  [v10 setMaximumTasksCount:a3];
  id v11 = +[VNDetectorAsyncTasksQueueCache sharedCache];

  [v11 setMaximumTasksCount:a4];
}

void sub_1A4094580(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL VNCheckRatioMismatch(double a1, double a2, double a3, double a4)
{
  double v4 = a1 / a2;
  double v5 = a3 / a4;
  if (v4 < 1.0 && v5 >= 1.0) {
    return 1;
  }
  if (v5 < 1.0) {
    return v4 >= 1.0;
  }
  return 0;
}

int64_t VNGetRequestConcurrentTasksProcessingTimeout()
{
  return +[VNControlledCapacityTasksQueue tasksTimeout];
}

uint64_t VNDebugImageFromCGImage(uint64_t a1)
{
  if (load_uikit(void)::once != -1) {
    dispatch_once(&load_uikit(void)::once, &__block_literal_global_248);
  }
  Class v2 = NSClassFromString(&cfstr_Uiimage.isa);
  SEL v3 = NSSelectorFromString(&cfstr_Imagewithcgima.isa);
  double v4 = (uint64_t (*)(Class, SEL, uint64_t))[(objc_class *)v2 methodForSelector:v3];

  return v4(v2, v3, a1);
}

void *___ZL10load_uikitv_block_invoke()
{
  uint64_t result = dlopen("/System/Library/Frameworks/UIKit.framework/UIKit", 1);
  load_uikit(void)::uikitHandle = (uint64_t)result;
  return result;
}

double VNDebugFallbackSizeWhenImagesizeIsUnknown()
{
  return 512.0;
}

id VNDebugPathFromNormalizedCGPath(uint64_t a1, CGFloat a2, CGFloat a3)
{
  memset(&v9, 0, sizeof(v9));
  CGAffineTransformMakeScale(&v9, a2, a3);
  double v4 = (const CGPath *)MEMORY[0x1A62553C0](a1, &v9);
  if (load_uikit(void)::once != -1) {
    dispatch_once(&load_uikit(void)::once, &__block_literal_global_248);
  }
  Class v5 = NSClassFromString(&cfstr_Uibezierpath.isa);
  SEL v6 = NSSelectorFromString(&cfstr_Bezierpathwith.isa);
  id v7 = (id)((uint64_t (*)(Class, SEL, const CGPath *))[(objc_class *)v5 methodForSelector:v6])(v5, v6, v4);
  CGPathRelease(v4);

  return v7;
}

void sub_1A4094788(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double VNDebugImageSizeFromObject(void *a1)
{
  id v1 = a1;
  if (load_uikit(void)::once != -1) {
    dispatch_once(&load_uikit(void)::once, &__block_literal_global_248);
  }
  NSClassFromString(&cfstr_Uiimage.isa);
  if (objc_opt_isKindOfClass())
  {
    [v1 size];
    double v3 = v2;
  }
  else
  {
    NSClassFromString(&cfstr_Uibezierpath.isa);
    if (objc_opt_isKindOfClass())
    {
      [v1 bounds];
      double v3 = v4;
    }
    else
    {
      double v3 = *MEMORY[0x1E4F1DB30];
    }
  }

  return v3;
}

void sub_1A4094864(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void (*VNDebugImageRenderNormalizedCGPathOnImage(uint64_t a1, void *a2, CGColor *a3))(uint64_t)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  SEL v6 = (void *)MEMORY[0x1A6257080]();
  if (load_uikit(void)::once != -1) {
    dispatch_once(&load_uikit(void)::once, &__block_literal_global_248);
  }
  id v7 = (void *)load_uikit(void)::uikitHandle;
  vImage_Error v8 = (void (*)(uint64_t))dlsym((void *)load_uikit(void)::uikitHandle, "UIGraphicsBeginImageContext");
  dlsym(v7, "UIGraphicsGetCurrentContext");
  CGAffineTransform v9 = (void (*)(uint64_t))dlsym(v7, "UIGraphicsGetImageFromCurrentImageContext");
  vImage_Buffer v10 = (void (*)(void))dlsym(v7, "UIGraphicsEndImageContext");
  NSClassFromString(&cfstr_Uiimage.isa);
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = [v5 size];
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    v8(v11);
    objc_msgSend(v5, "drawAtPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    double v16 = VNDebugPathFromNormalizedCGPath(a1, v13, v15);
    memset(&v25, 0, sizeof(v25));
    CGAffineTransformMakeScale(&v25, 1.0, -1.0);
    CGAffineTransform v24 = v25;
    CGAffineTransformTranslate(&v26, &v24, 0.0, -v15);
    CGAffineTransform v25 = v26;
    CGAffineTransform v23 = v26;
    [v16 applyTransform:&v23];
    double v17 = VNDebugColorFromCGColor(a3);
    *(_OWORD *)&v26.a = xmmword_1A4125508;
    *(_OWORD *)&v26.c = unk_1A4125518;
    CGFloat v18 = (CGColor *)VNDebugColorFromValues(&v26.a);
    unint64_t v19 = VNDebugColorFromCGColor(v18);
    [v19 setStroke];
    [v16 setLineWidth:3.0];
    [v16 stroke];
    [v17 setStroke];
    [v16 setLineWidth:2.0];
    v9([v16 stroke]);
    CGAffineTransform v9 = (void (*)(uint64_t))objc_claimAutoreleasedReturnValue();
    v10();

LABEL_7:
    int v21 = 0;
    goto LABEL_9;
  }
  NSClassFromString(&cfstr_Uibezierpath.isa);
  if (objc_opt_isKindOfClass())
  {
    CGAffineTransform v9 = (void (*)(uint64_t))v5;
    int v20 = VNDebugPathFromNormalizedCGPath(a1, 512.0, 512.0);
    [v9 appendPath:v20];

    goto LABEL_7;
  }
  int v21 = 1;
LABEL_9:
  if (v21)
  {
    CGAffineTransform v9 = [NSString stringWithFormat:@"Could not render path on image %@", v5];
  }

  return v9;
}

void sub_1A4094B64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZL28AppleNeuralEngineLibraryCorePPc_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AppleNeuralEngineLibraryCore(char **)::frameworkLibrarCGFloat y = result;
  return result;
}

__CFString *VNANEArchitectureSubTypeVariantName()
{
  if (VisionCoreHasANE())
  {
    id v0 = [get_ANEDeviceInfoClass() aneSubTypeVariant];
    id v1 = [v0 uppercaseString];
  }
  else
  {
    id v1 = &stru_1EF75C0C0;
  }

  return v1;
}

void sub_1A4094CBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *VNANEArchitectureSubTypeProductVariantName()
{
  if (VisionCoreHasANE())
  {
    id v0 = [get_ANEDeviceInfoClass() aneSubTypeProductVariant];
    id v1 = [v0 uppercaseString];
  }
  else
  {
    id v1 = &stru_1EF75C0C0;
  }

  return v1;
}

void sub_1A4094D30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id VNANEGenerationNumberForArchitectureName(uint64_t a1, uint64_t a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __VNANEGenerationNumberForArchitectureName_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a2;
  if (VNANEGenerationNumberForArchitectureName::onceToken != -1) {
    dispatch_once(&VNANEGenerationNumberForArchitectureName::onceToken, block);
  }
  double v2 = (void *)VNANEGenerationNumberForArchitectureName::aneGenerationNumber;

  return v2;
}

void __VNANEGenerationNumberForArchitectureName_block_invoke(uint64_t a1)
{
  uint64_t v9 = -1;
  double v2 = (void *)MEMORY[0x1E4F28FE8];
  double v3 = VNANEArchitectureName();
  double v4 = [v2 scannerWithString:v3];

  id v5 = [MEMORY[0x1E4F28B88] letterCharacterSet];
  [v4 setCharactersToBeSkipped:v5];

  if [v4 scanInteger:&v9] && (objc_msgSend(v4, "isAtEnd"))
  {
    id v6 = objc_alloc(NSNumber);
    uint64_t v7 = [v6 initWithInteger:v9];
    vImage_Error v8 = (void *)VNANEGenerationNumberForArchitectureName::aneGenerationNumber;
    VNANEGenerationNumberForArchitectureName::aneGenerationNumber = v7;
  }
  else if (*(void *)(a1 + 32))
  {
    **(void **)(a1 + 32) = +[VNError errorForInternalErrorWithLocalizedDescription:@"ANE generation cannot be determined"];
  }
}

void sub_1A4094EDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL VNANEComputeDeviceSupportsExecution(uint64_t a1)
{
  double v2 = VNANEArchitectureName();
  double v3 = VNANEGenerationNumberForArchitectureName((uint64_t)v2, 0);
  BOOL v4 = [v3 integerValue] >= a1;

  return v4;
}

void sub_1A4094F60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double calculateCropSizeOfPixelBuffer(__CVBuffer *a1, void *a2, float a3)
{
  id v5 = a1;
  CVPixelBufferLockBaseAddress(a1, 1uLL);
  size_t Width = CVPixelBufferGetWidth(v5);
  size_t Height = CVPixelBufferGetHeight(v5);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(v5);
  BaseAddress = CVPixelBufferGetBaseAddress(v5);
  uint64_t v9 = [(VNControlledCapacityTasksQueue *)[VNControlledCapacitySyncTasksQueue alloc] initWithDispatchQueueLabel:@"com.apple.VN.observationSyncTasksQueue.VNInstanceMaskObservationProcessing" maximumTasksCount:15];
  unint64_t v10 = [(VNControlledCapacityTasksQueue *)v9 maximumTasksCount];
  unint64_t v11 = v10;
  if (v10)
  {
    uint64_t v36 = v5;
    if (v10 >= 0x555555555555556) {
      std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v12 = 48 * v10;
    CGFloat v13 = (char *)operator new(48 * v10);
    unint64_t v35 = a2;
    uint64_t v14 = 0;
    do
    {
      CGFloat v15 = &v13[v14];
      *(void *)CGFloat v15 = -1;
      *((void *)v15 + 1) = -1;
      *((void *)v15 + 4) = 0;
      *((void *)v15 + 5) = 0;
      v14 += 48;
      *((void *)v15 + 2) = 0;
      *((void *)v15 + 3) = 0;
    }
    while (v12 != v14);
    CGRect v34 = &v13[48 * v11];
    double v16 = v9;
    size_t v17 = 0;
    size_t v18 = 0;
    __int16 v37 = v13;
    unint64_t v19 = v13 + 40;
    do
    {
      size_t v20 = Height / v11 - 1 + v18;
      if (v17 < Height % v11) {
        size_t v20 = Height / v11 + v18;
      }
      *(v19 - 1) = v18;
      *unint64_t v19 = v20;
      size_t v18 = v20 + 1;
      ++v17;
      v19 += 6;
    }
    while (v11 != v17);
    dispatch_group_t v21 = dispatch_group_create();
    uint64_t v22 = MEMORY[0x1E4F143A8];
    CGAffineTransform v23 = v37;
    do
    {
      v39[0] = v22;
      v39[1] = 3221225472;
      v39[2] = __calculateCropSizeOfPixelBuffer_block_invoke;
      v39[3] = &unk_1E5B201F8;
      unsigned int v41 = v23;
      char v42 = BaseAddress;
      size_t v43 = Height;
      size_t v44 = Width;
      size_t v45 = BytesPerRow;
      size_t v46 = Width;
      float v47 = a3;
      int v40 = v16;
      [(VNControlledCapacityTasksQueue *)v40 dispatchGroupAsyncByPreservingQueueCapacity:v21 block:v39];

      v23 += 6;
      --v11;
    }
    while (v11);
    uint64_t v9 = v16;
    a2 = v35;
    id v5 = v36;
    CGAffineTransform v24 = v37;
    CGAffineTransform v25 = (unint64_t *)v34;
  }
  else
  {
    dispatch_group_t v21 = dispatch_group_create();
    CGAffineTransform v25 = 0;
    CGAffineTransform v24 = 0;
  }
  if (-[VNControlledCapacityTasksQueue dispatchGroupWait:error:](v9, "dispatchGroupWait:error:", v21, a2, v34))
  {
    if (v24 != v25)
    {
      unint64_t v26 = 0;
      unint64_t v27 = 0;
      unint64_t v28 = -1;
      uint64_t v29 = v24;
      unint64_t v30 = -1;
      do
      {
        if (*v29 < v28) {
          unint64_t v28 = *v29;
        }
        if (v29[1] < v30) {
          unint64_t v30 = v29[1];
        }
        if (v27 <= v29[2]) {
          unint64_t v27 = v29[2];
        }
        if (v26 <= v29[3]) {
          unint64_t v26 = v29[3];
        }
        v29 += 6;
      }
      while (v29 != v25);
      if (v27 && v26 != 0)
      {
        double v33 = (double)v28;
        goto LABEL_33;
      }
    }
    if (a2)
    {
      *a2 = +[VNError errorForInternalErrorWithLocalizedDescription:@"No pixels meet or exceed alpha threshold"];
    }
  }
  double v33 = *MEMORY[0x1E4F1DB20];
LABEL_33:

  if (v24) {
    operator delete(v24);
  }

  CVPixelBufferUnlockBaseAddress(v5, 1uLL);
  return v33;
}

void sub_1A40952AC(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  if (v18) {
    operator delete(v18);
  }

  objc_begin_catch(a1);
  JUMPOUT(0x1A4095224);
}

uint64_t __calculateCropSizeOfPixelBuffer_block_invoke(uint64_t a1)
{
  id v1 = *(uint64x2_t **)(a1 + 40);
  unint64_t v2 = v1[2].u64[0];
  unint64_t v3 = v1[2].u64[1];
  if (v2 <= v3)
  {
    uint64_t v4 = *(void *)(a1 + 80);
    uint64_t v5 = *(void *)(a1 + 72) >> 2;
    uint64_t v6 = *(void *)(a1 + 48) + 4 * v2 * v5;
    uint64_t v7 = 4 * v5;
    do
    {
      if (v4)
      {
        uint64_t v8 = 0;
        float v9 = *(float *)(a1 + 88);
        do
        {
          if (*(float *)(v6 + 4 * v8) > v9)
          {
            v10.i64[0] = v8;
            v10.i64[1] = v2;
            int8x16_t v11 = vbslq_s8((int8x16_t)vcgtq_u64(*v1, v10), (int8x16_t)v10, *(int8x16_t *)v1);
            int8x16_t v12 = vbslq_s8((int8x16_t)vcgtq_u64(v1[1], v10), (int8x16_t)v1[1], (int8x16_t)v10);
            uint64x2_t *v1 = (uint64x2_t)v11;
            v1[1] = (uint64x2_t)v12;
          }
          ++v8;
        }
        while (v4 != v8);
      }
      ++v2;
      v6 += v7;
    }
    while (v2 <= v3);
  }
  return [*(id *)(a1 + 32) dispatchReportBlockCompletion];
}

void sub_1A409592C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1A40959BC()
{
  return MEMORY[0x1F40E2E10]();
}

uint64_t sub_1A40959CC()
{
  return MEMORY[0x1F40E3198]();
}

uint64_t sub_1A40959DC()
{
  return MEMORY[0x1F40E31C8]();
}

uint64_t sub_1A40959EC()
{
  return MEMORY[0x1F40E31D0]();
}

uint64_t sub_1A40959FC()
{
  return MEMORY[0x1F40E3250]();
}

uint64_t sub_1A4095A0C()
{
  return MEMORY[0x1F40E3268]();
}

uint64_t sub_1A4095A1C()
{
  return MEMORY[0x1F40E3280]();
}

uint64_t sub_1A4095A2C()
{
  return MEMORY[0x1F40E3318]();
}

uint64_t sub_1A4095A3C()
{
  return MEMORY[0x1F40E3420]();
}

uint64_t sub_1A4095A4C()
{
  return MEMORY[0x1F40E37C0]();
}

uint64_t sub_1A4095A5C()
{
  return MEMORY[0x1F40E37E0]();
}

uint64_t sub_1A4095A6C()
{
  return MEMORY[0x1F40E37F0]();
}

uint64_t sub_1A4095A7C()
{
  return MEMORY[0x1F40E3800]();
}

uint64_t sub_1A4095A8C()
{
  return MEMORY[0x1F40E3818]();
}

uint64_t sub_1A4095A9C()
{
  return MEMORY[0x1F40E3830]();
}

uint64_t sub_1A4095AAC()
{
  return MEMORY[0x1F40E3A90]();
}

uint64_t sub_1A4095ABC()
{
  return MEMORY[0x1F40E3A98]();
}

uint64_t sub_1A4095ACC()
{
  return MEMORY[0x1F40E3AC0]();
}

uint64_t sub_1A4095ADC()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1A4095AEC()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1A4095AFC()
{
  return MEMORY[0x1F40E4898]();
}

uint64_t sub_1A4095B0C()
{
  return MEMORY[0x1F40E48E8]();
}

uint64_t sub_1A4095B1C()
{
  return MEMORY[0x1F40E48F0]();
}

uint64_t sub_1A4095B2C()
{
  return MEMORY[0x1F40E4938]();
}

uint64_t sub_1A4095B3C()
{
  return MEMORY[0x1F40E4970]();
}

uint64_t sub_1A4095B4C()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_1A4095B5C()
{
  return MEMORY[0x1F40E4A50]();
}

uint64_t sub_1A4095B6C()
{
  return MEMORY[0x1F40E4A58]();
}

uint64_t sub_1A4095B7C()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t sub_1A4095B8C()
{
  return MEMORY[0x1F40E4AA8]();
}

uint64_t sub_1A4095B9C()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1A4095BAC()
{
  return MEMORY[0x1F40E4BC8]();
}

uint64_t sub_1A4095BBC()
{
  return MEMORY[0x1F40E4BF0]();
}

uint64_t sub_1A4095BCC()
{
  return MEMORY[0x1F40E4C00]();
}

uint64_t sub_1A4095BDC()
{
  return MEMORY[0x1F40E4C08]();
}

uint64_t sub_1A4095BEC()
{
  return MEMORY[0x1F40E4C30]();
}

uint64_t sub_1A4095BFC()
{
  return MEMORY[0x1F40E4C80]();
}

uint64_t sub_1A4095C0C()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1A4095C1C()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1A4095C2C()
{
  return MEMORY[0x1F40E4DB8]();
}

uint64_t sub_1A4095C3C()
{
  return MEMORY[0x1F40E53C8]();
}

uint64_t sub_1A4095C4C()
{
  return MEMORY[0x1F40E53E8]();
}

uint64_t sub_1A4095C5C()
{
  return MEMORY[0x1F40E53F8]();
}

uint64_t sub_1A4095C6C()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t sub_1A4095C7C()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1A4095C8C()
{
  return MEMORY[0x1F40E5568]();
}

uint64_t sub_1A4095C9C()
{
  return MEMORY[0x1F40E5578]();
}

uint64_t sub_1A4095CAC()
{
  return MEMORY[0x1F40E56C0]();
}

uint64_t sub_1A4095CBC()
{
  return MEMORY[0x1F40E56C8]();
}

uint64_t sub_1A4095CCC()
{
  return MEMORY[0x1F40E5700]();
}

uint64_t sub_1A4095CDC()
{
  return MEMORY[0x1F40E57D8]();
}

uint64_t sub_1A4095CEC()
{
  return MEMORY[0x1F40E57E8]();
}

uint64_t sub_1A4095CFC()
{
  return MEMORY[0x1F40E5800]();
}

uint64_t sub_1A4095D0C()
{
  return MEMORY[0x1F40E5840]();
}

uint64_t sub_1A4095D1C()
{
  return MEMORY[0x1F40E5BA0]();
}

uint64_t sub_1A4095D2C()
{
  return MEMORY[0x1F40E5BC0]();
}

uint64_t sub_1A4095D3C()
{
  return MEMORY[0x1F40E5CA8]();
}

uint64_t sub_1A4095D4C()
{
  return MEMORY[0x1F40E5E68]();
}

uint64_t sub_1A4095D5C()
{
  return MEMORY[0x1F40E5EA0]();
}

uint64_t sub_1A4095D6C()
{
  return MEMORY[0x1F4182D60]();
}

uint64_t sub_1A4095D7C()
{
  return MEMORY[0x1F4130128]();
}

uint64_t sub_1A4095D8C()
{
  return MEMORY[0x1F4130130]();
}

uint64_t sub_1A4095D9C()
{
  return MEMORY[0x1F4130148]();
}

uint64_t sub_1A4095DAC()
{
  return MEMORY[0x1F4130188]();
}

uint64_t sub_1A4095DBC()
{
  return MEMORY[0x1F41301A0]();
}

uint64_t sub_1A4095DCC()
{
  return MEMORY[0x1F41301B8]();
}

uint64_t sub_1A4095DDC()
{
  return MEMORY[0x1F4130200]();
}

uint64_t sub_1A4095DEC()
{
  return MEMORY[0x1F4130210]();
}

uint64_t sub_1A4095DFC()
{
  return MEMORY[0x1F4130218]();
}

uint64_t sub_1A4095E0C()
{
  return MEMORY[0x1F4130230]();
}

uint64_t sub_1A4095E1C()
{
  return MEMORY[0x1F4130250]();
}

uint64_t sub_1A4095E2C()
{
  return MEMORY[0x1F4130270]();
}

uint64_t sub_1A4095E3C()
{
  return MEMORY[0x1F4130278]();
}

uint64_t sub_1A4095E4C()
{
  return MEMORY[0x1F4130280]();
}

uint64_t sub_1A4095E5C()
{
  return MEMORY[0x1F4130288]();
}

uint64_t sub_1A4095E6C()
{
  return MEMORY[0x1F41302A0]();
}

uint64_t sub_1A4095E7C()
{
  return MEMORY[0x1F4186958]();
}

uint64_t sub_1A4095E8C()
{
  return MEMORY[0x1F4186968]();
}

uint64_t sub_1A4095E9C()
{
  return MEMORY[0x1F4186978]();
}

uint64_t sub_1A4095EAC()
{
  return MEMORY[0x1F4188570]();
}

uint64_t sub_1A4095EBC()
{
  return MEMORY[0x1F4188578]();
}

uint64_t sub_1A4095ECC()
{
  return MEMORY[0x1F4188580]();
}

uint64_t sub_1A4095EDC()
{
  return MEMORY[0x1F41885B0]();
}

uint64_t sub_1A4095EEC()
{
  return MEMORY[0x1F41885C0]();
}

uint64_t sub_1A4095EFC()
{
  return MEMORY[0x1F41885D0]();
}

uint64_t sub_1A4095F0C()
{
  return MEMORY[0x1F41885E0]();
}

uint64_t sub_1A4095F1C()
{
  return MEMORY[0x1F4188650]();
}

uint64_t sub_1A4095F2C()
{
  return MEMORY[0x1F4188658]();
}

uint64_t sub_1A4095F3C()
{
  return MEMORY[0x1F4188660]();
}

uint64_t sub_1A4095F4C()
{
  return MEMORY[0x1F4188668]();
}

uint64_t sub_1A4095F5C()
{
  return MEMORY[0x1F40DB6E8]();
}

uint64_t sub_1A4095F6C()
{
  return MEMORY[0x1F40DB6F0]();
}

uint64_t sub_1A4095F7C()
{
  return MEMORY[0x1F40DB6F8]();
}

uint64_t sub_1A4095F8C()
{
  return MEMORY[0x1F40DB700]();
}

uint64_t sub_1A4095F9C()
{
  return MEMORY[0x1F40DB740]();
}

uint64_t sub_1A4095FAC()
{
  return MEMORY[0x1F40DB748]();
}

uint64_t sub_1A4095FBC()
{
  return MEMORY[0x1F40DB750]();
}

uint64_t sub_1A4095FCC()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1A4095FDC()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1A4095FEC()
{
  return MEMORY[0x1F4183270]();
}

uint64_t sub_1A4095FFC()
{
  return MEMORY[0x1F40E5FD8]();
}

uint64_t sub_1A409600C()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1A409601C()
{
  return MEMORY[0x1F40E6008]();
}

uint64_t sub_1A409602C()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1A409603C()
{
  return MEMORY[0x1F4183318]();
}

uint64_t sub_1A409604C()
{
  return MEMORY[0x1F4183320]();
}

uint64_t sub_1A409605C()
{
  return MEMORY[0x1F4183338]();
}

uint64_t sub_1A409606C()
{
  return MEMORY[0x1F4183358]();
}

uint64_t sub_1A409607C()
{
  return MEMORY[0x1F4183398]();
}

uint64_t sub_1A409608C()
{
  return MEMORY[0x1F41834A0]();
}

uint64_t sub_1A409609C()
{
  return MEMORY[0x1F41834A8]();
}

uint64_t sub_1A40960AC()
{
  return MEMORY[0x1F41834F8]();
}

uint64_t sub_1A40960BC()
{
  return MEMORY[0x1F4183500]();
}

uint64_t sub_1A40960CC()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_1A40960DC()
{
  return MEMORY[0x1F41835C8]();
}

uint64_t sub_1A40960EC()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_1A40960FC()
{
  return MEMORY[0x1F4183738]();
}

uint64_t sub_1A409610C()
{
  return MEMORY[0x1F4183748]();
}

uint64_t sub_1A409611C()
{
  return MEMORY[0x1F4183750]();
}

uint64_t sub_1A409612C()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1A409613C()
{
  return MEMORY[0x1F40E6068]();
}

uint64_t sub_1A409614C()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1A409615C()
{
  return MEMORY[0x1F40E61B8]();
}

uint64_t sub_1A409616C()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t sub_1A409617C()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1A409619C()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1A40961AC()
{
  return MEMORY[0x1F41838B8]();
}

uint64_t sub_1A40961BC()
{
  return MEMORY[0x1F4183908]();
}

uint64_t sub_1A40961CC()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1A40961DC()
{
  return MEMORY[0x1F41839F0]();
}

uint64_t sub_1A40961EC()
{
  return MEMORY[0x1F41839F8]();
}

uint64_t sub_1A40961FC()
{
  return MEMORY[0x1F4183A08]();
}

uint64_t sub_1A409620C()
{
  return MEMORY[0x1F4183A28]();
}

uint64_t sub_1A409621C()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1A409622C()
{
  return MEMORY[0x1F4183A60]();
}

uint64_t sub_1A409623C()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1A409624C()
{
  return MEMORY[0x1F4183B58]();
}

uint64_t sub_1A409625C()
{
  return MEMORY[0x1F4183B90]();
}

uint64_t sub_1A409626C()
{
  return MEMORY[0x1F4183BA0]();
}

uint64_t sub_1A409627C()
{
  return MEMORY[0x1F4183BA8]();
}

uint64_t sub_1A409628C()
{
  return MEMORY[0x1F4183C18]();
}

uint64_t sub_1A409629C()
{
  return MEMORY[0x1F4183D70]();
}

uint64_t sub_1A40962AC()
{
  return MEMORY[0x1F4183D80]();
}

uint64_t sub_1A40962BC()
{
  return MEMORY[0x1F4183DD8]();
}

uint64_t sub_1A40962CC()
{
  return MEMORY[0x1F4183DF8]();
}

uint64_t sub_1A40962DC()
{
  return MEMORY[0x1F4183E50]();
}

uint64_t sub_1A40962EC()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1A40962FC()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1A409630C()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1A409631C()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t sub_1A409632C()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1A409633C()
{
  return MEMORY[0x1F4183EA8]();
}

uint64_t sub_1A409634C()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1A409635C()
{
  return MEMORY[0x1F4183EF0]();
}

uint64_t sub_1A409636C()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t sub_1A409637C()
{
  return MEMORY[0x1F4183F18]();
}

uint64_t sub_1A409638C()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1A409639C()
{
  return MEMORY[0x1F4183F40]();
}

uint64_t sub_1A40963AC()
{
  return MEMORY[0x1F4183F60]();
}

uint64_t sub_1A40963BC()
{
  return MEMORY[0x1F4183F68]();
}

uint64_t sub_1A40963CC()
{
  return MEMORY[0x1F4183F78]();
}

uint64_t sub_1A40963DC()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_1A40963EC()
{
  return MEMORY[0x1F4183FB8]();
}

uint64_t sub_1A409640C()
{
  return MEMORY[0x1F4183FD8]();
}

uint64_t sub_1A409641C()
{
  return MEMORY[0x1F4183FF0]();
}

uint64_t sub_1A409642C()
{
  return MEMORY[0x1F40E6388]();
}

uint64_t sub_1A409643C()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1A409644C()
{
  return MEMORY[0x1F4187C38]();
}

uint64_t sub_1A409648C()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1A409649C()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1A40964AC()
{
  return MEMORY[0x1F4187D38]();
}

uint64_t sub_1A40964BC()
{
  return MEMORY[0x1F4187D40]();
}

uint64_t sub_1A40964CC()
{
  return MEMORY[0x1F4187D50]();
}

uint64_t sub_1A40964FC()
{
  return MEMORY[0x1F4187D78]();
}

uint64_t sub_1A409650C()
{
  return MEMORY[0x1F4187DD8]();
}

uint64_t sub_1A409651C()
{
  return MEMORY[0x1F4187E28]();
}

uint64_t sub_1A409653C()
{
  return MEMORY[0x1F4187E68]();
}

uint64_t sub_1A409654C()
{
  return MEMORY[0x1F4187EA0]();
}

uint64_t sub_1A409655C()
{
  return MEMORY[0x1F4187EB0]();
}

uint64_t sub_1A409656C()
{
  return MEMORY[0x1F4187EB8]();
}

uint64_t sub_1A409657C()
{
  return MEMORY[0x1F4187EC0]();
}

uint64_t sub_1A409658C()
{
  return MEMORY[0x1F4187EC8]();
}

uint64_t sub_1A409659C()
{
  return MEMORY[0x1F4187EF8]();
}

uint64_t sub_1A40965AC()
{
  return MEMORY[0x1F4187F00]();
}

uint64_t sub_1A40965BC()
{
  return MEMORY[0x1F40E63C8]();
}

uint64_t sub_1A40965CC()
{
  return MEMORY[0x1F4184008]();
}

uint64_t sub_1A40965DC()
{
  return MEMORY[0x1F40E6410]();
}

uint64_t sub_1A40965EC()
{
  return MEMORY[0x1F41840C0]();
}

uint64_t sub_1A40965FC()
{
  return MEMORY[0x1F40E6458]();
}

uint64_t sub_1A409660C()
{
  return MEMORY[0x1F40E6478]();
}

uint64_t sub_1A409661C()
{
  return MEMORY[0x1F41842D0]();
}

uint64_t sub_1A409662C()
{
  return MEMORY[0x1F41842F8]();
}

uint64_t sub_1A409663C()
{
  return MEMORY[0x1F4184338]();
}

uint64_t sub_1A409664C()
{
  return MEMORY[0x1F4184348]();
}

uint64_t sub_1A409665C()
{
  return MEMORY[0x1F4184398]();
}

uint64_t sub_1A409666C()
{
  return MEMORY[0x1F41843D0]();
}

uint64_t sub_1A409667C()
{
  return MEMORY[0x1F4184440]();
}

uint64_t sub_1A409668C()
{
  return MEMORY[0x1F4186A10]();
}

uint64_t sub_1A409669C()
{
  return MEMORY[0x1F4186A18]();
}

uint64_t sub_1A40966AC()
{
  return MEMORY[0x1F4186A28]();
}

uint64_t sub_1A40966BC()
{
  return MEMORY[0x1F4186A30]();
}

uint64_t sub_1A40966CC()
{
  return MEMORY[0x1F4186A40]();
}

uint64_t sub_1A40966DC()
{
  return MEMORY[0x1F4186A48]();
}

uint64_t sub_1A40966EC()
{
  return MEMORY[0x1F40DB768]();
}

uint64_t sub_1A40966FC()
{
  return MEMORY[0x1F40DB7A8]();
}

uint64_t sub_1A409670C()
{
  return MEMORY[0x1F40D9720]();
}

uint64_t sub_1A409671C()
{
  return MEMORY[0x1F4186A88]();
}

uint64_t sub_1A409672C()
{
  return MEMORY[0x1F4186AA0]();
}

uint64_t sub_1A409673C()
{
  return MEMORY[0x1F40E66C8]();
}

uint64_t sub_1A409674C()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_1A409675C()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_1A409676C()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_1A409677C()
{
  return MEMORY[0x1F4188708]();
}

uint64_t sub_1A409678C()
{
  return MEMORY[0x1F4188710]();
}

uint64_t sub_1A409679C()
{
  return MEMORY[0x1F4188718]();
}

uint64_t sub_1A40967BC()
{
  return MEMORY[0x1F4186B00]();
}

uint64_t sub_1A40967CC()
{
  return MEMORY[0x1F4186B08]();
}

uint64_t sub_1A40967DC()
{
  return MEMORY[0x1F4186B10]();
}

uint64_t sub_1A40967FC()
{
  return MEMORY[0x1F4186B20]();
}

uint64_t sub_1A409680C()
{
  return MEMORY[0x1F4186B38]();
}

uint64_t sub_1A409681C()
{
  return MEMORY[0x1F4186B48]();
}

uint64_t sub_1A409682C()
{
  return MEMORY[0x1F40D9740]();
}

uint64_t sub_1A409683C()
{
  return MEMORY[0x1F40E6828]();
}

uint64_t sub_1A409684C()
{
  return MEMORY[0x1F40E68F8]();
}

uint64_t sub_1A409685C()
{
  return MEMORY[0x1F40E6910]();
}

uint64_t sub_1A409686C()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_1A409687C()
{
  return MEMORY[0x1F41874D0]();
}

uint64_t sub_1A409688C()
{
  return MEMORY[0x1F40E6978]();
}

uint64_t sub_1A409689C()
{
  return MEMORY[0x1F40E6B20]();
}

uint64_t sub_1A40968AC()
{
  return MEMORY[0x1F40E6B30]();
}

uint64_t sub_1A40968BC()
{
  return MEMORY[0x1F40E6B40]();
}

uint64_t sub_1A40968CC()
{
  return MEMORY[0x1F40E6B48]();
}

uint64_t sub_1A40968DC()
{
  return MEMORY[0x1F40E6B60]();
}

uint64_t sub_1A40968EC()
{
  return MEMORY[0x1F4188720]();
}

uint64_t sub_1A40968FC()
{
  return MEMORY[0x1F4188730]();
}

uint64_t sub_1A409690C()
{
  return MEMORY[0x1F4188738]();
}

uint64_t sub_1A409691C()
{
  return MEMORY[0x1F4184638]();
}

uint64_t sub_1A409692C()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1A409693C()
{
  return MEMORY[0x1F4184788]();
}

uint64_t sub_1A409694C()
{
  return MEMORY[0x1F41847A0]();
}

uint64_t sub_1A409695C()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1A409696C()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1A409697C()
{
  return MEMORY[0x1F40E6BF0]();
}

uint64_t sub_1A409698C()
{
  return MEMORY[0x1F40E6C80]();
}

uint64_t sub_1A409699C()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1A40969AC()
{
  return MEMORY[0x1F4184AA0]();
}

uint64_t sub_1A40969CC()
{
  return MEMORY[0x1F4184B10]();
}

uint64_t sub_1A40969DC()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1A40969EC()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1A40969FC()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_1A4096A0C()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1A4096A1C()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1A4096A2C()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1A4096A3C()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1A4096A4C()
{
  return MEMORY[0x1F4184D00]();
}

uint64_t sub_1A4096A5C()
{
  return MEMORY[0x1F4184D48]();
}

uint64_t sub_1A4096A6C()
{
  return MEMORY[0x1F4184D50]();
}

uint64_t sub_1A4096A7C()
{
  return MEMORY[0x1F4184D78]();
}

uint64_t sub_1A4096A8C()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1A4096A9C()
{
  return MEMORY[0x1F4184D88]();
}

uint64_t sub_1A4096AAC()
{
  return MEMORY[0x1F4184DD0]();
}

uint64_t sub_1A4096ABC()
{
  return MEMORY[0x1F4184DF0]();
}

uint64_t sub_1A4096ACC()
{
  return MEMORY[0x1F4184E28]();
}

uint64_t sub_1A4096ADC()
{
  return MEMORY[0x1F4184E38]();
}

uint64_t sub_1A4096AEC()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1A4096B0C()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1A4096B1C()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1A4096B2C()
{
  return MEMORY[0x1F4184EE8]();
}

uint64_t sub_1A4096B3C()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t sub_1A4096B4C()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1A4096B5C()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1A4096B6C()
{
  return MEMORY[0x1F4184F48]();
}

uint64_t sub_1A4096B7C()
{
  return MEMORY[0x1F4184F68]();
}

uint64_t sub_1A4096B8C()
{
  return MEMORY[0x1F4184F70]();
}

uint64_t sub_1A4096B9C()
{
  return MEMORY[0x1F4185048]();
}

uint64_t sub_1A4096BAC()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1A4096BBC()
{
  return MEMORY[0x1F4185068]();
}

uint64_t sub_1A4096BCC()
{
  return MEMORY[0x1F4185180]();
}

uint64_t sub_1A4096BDC()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1A4096BEC()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1A4096BFC()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1A4096C0C()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1A4096C1C()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1A4096C2C()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1A4096C3C()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1A4096C5C()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1A4096C7C()
{
  return MEMORY[0x1F41854D8]();
}

uint64_t sub_1A4096C8C()
{
  return MEMORY[0x1F41854E0]();
}

uint64_t sub_1A4096C9C()
{
  return MEMORY[0x1F41854F8]();
}

uint64_t sub_1A4096CAC()
{
  return MEMORY[0x1F4185528]();
}

uint64_t sub_1A4096CBC()
{
  return MEMORY[0x1F4185568]();
}

uint64_t sub_1A4096CCC()
{
  return MEMORY[0x1F4185570]();
}

uint64_t sub_1A4096CDC()
{
  return MEMORY[0x1F4185580]();
}

uint64_t sub_1A4096CEC()
{
  return MEMORY[0x1F4185588]();
}

uint64_t sub_1A4096CFC()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_1A4096D0C()
{
  return MEMORY[0x1F41855B0]();
}

uint64_t sub_1A4096D1C()
{
  return MEMORY[0x1F41855B8]();
}

uint64_t sub_1A4096D2C()
{
  return MEMORY[0x1F41855D0]();
}

uint64_t sub_1A4096D3C()
{
  return MEMORY[0x1F41855E0]();
}

uint64_t sub_1A4096D4C()
{
  return MEMORY[0x1F41855E8]();
}

uint64_t sub_1A4096D5C()
{
  return MEMORY[0x1F4185608]();
}

uint64_t sub_1A4096D6C()
{
  return MEMORY[0x1F4185658]();
}

uint64_t sub_1A4096D7C()
{
  return MEMORY[0x1F4185690]();
}

uint64_t sub_1A4096D8C()
{
  return MEMORY[0x1F4185698]();
}

uint64_t sub_1A4096D9C()
{
  return MEMORY[0x1F41856A8]();
}

uint64_t sub_1A4096DAC()
{
  return MEMORY[0x1F41856B0]();
}

uint64_t sub_1A4096DBC()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_1A4096DCC()
{
  return MEMORY[0x1F41856D8]();
}

uint64_t sub_1A4096DDC()
{
  return MEMORY[0x1F41856E0]();
}

uint64_t sub_1A4096DEC()
{
  return MEMORY[0x1F41856F8]();
}

uint64_t sub_1A4096DFC()
{
  return MEMORY[0x1F4185740]();
}

uint64_t sub_1A4096E0C()
{
  return MEMORY[0x1F4185748]();
}

uint64_t sub_1A4096E1C()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1A4096E2C()
{
  return MEMORY[0x1F41859E8]();
}

uint64_t sub_1A4096E3C()
{
  return MEMORY[0x1F41859F0]();
}

uint64_t sub_1A4096E4C()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_1A4096E5C()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1A4096E6C()
{
  return MEMORY[0x1F4185B98]();
}

uint64_t sub_1A4096E7C()
{
  return MEMORY[0x1F4185D10]();
}

uint64_t sub_1A4096E8C()
{
  return MEMORY[0x1F4185D68]();
}

uint64_t sub_1A4096E9C()
{
  return MEMORY[0x1F4185DB8]();
}

uint64_t sub_1A4096EAC()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1A4096EBC()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1A4096ECC()
{
  return MEMORY[0x1F40E6E30]();
}

uint64_t sub_1A4096EDC()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1A4096EEC()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1A4096EFC()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1A4096F0C()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1A4096F1C()
{
  return MEMORY[0x1F4185E90]();
}

uint64_t sub_1A4096F2C()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1A4096F3C()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1A4096F4C()
{
  return MEMORY[0x1F4185ED0]();
}

uint64_t sub_1A4096F5C()
{
  return MEMORY[0x1F4185EE0]();
}

uint64_t sub_1A4096F6C()
{
  return MEMORY[0x1F4185EE8]();
}

uint64_t sub_1A4096F7C()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1A4096F8C()
{
  return MEMORY[0x1F4185F10]();
}

uint64_t sub_1A4096F9C()
{
  return MEMORY[0x1F4185F40]();
}

uint64_t sub_1A4096FAC()
{
  return MEMORY[0x1F4185F48]();
}

uint64_t sub_1A4096FBC()
{
  return MEMORY[0x1F4185F68]();
}

uint64_t sub_1A4096FCC()
{
  return MEMORY[0x1F40E6EA8]();
}

uint64_t sub_1A4096FDC()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_1A4096FEC()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t sub_1A409701C()
{
  return MEMORY[0x1F4186318]();
}

uint64_t ACBSConfigCreate()
{
  return MEMORY[0x1F41475A0]();
}

uint64_t ACBSConfigFree()
{
  return MEMORY[0x1F41475A8]();
}

uint64_t ACBSConfigSetFailedLocationsEnabled()
{
  return MEMORY[0x1F41475B0]();
}

uint64_t ACBSConfigSetLocateMode()
{
  return MEMORY[0x1F41475B8]();
}

uint64_t ACBSConfigSetMaxQRModuleSamples()
{
  return MEMORY[0x1F41475C0]();
}

uint64_t ACBSConfigSetStopsAtFirstPyramidWith2DCode()
{
  return MEMORY[0x1F41475C8]();
}

uint64_t ACBSConfigSetSymbologiesEnabled()
{
  return MEMORY[0x1F41475D0]();
}

uint64_t ACBSCreateFrameInfoBySearchingForBarcodesInCVPixelBuffer()
{
  return MEMORY[0x1F41475D8]();
}

uint64_t ACBSCreateSymbolDescriptorFromBasicDescriptor()
{
  return MEMORY[0x1F41475E0]();
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x1F40C9718](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x1F40C9720](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9728](c, data, *(void *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1F40D7170](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1F40D72D8](arg);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x1F40D77A8](cf);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1F40D77E8](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1F40D7860]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

Boolean CFDictionaryContainsValue(CFDictionaryRef theDict, const void *value)
{
  return MEMORY[0x1F40D7970](theDict, value);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7978](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D79A8](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1F40D79C0](theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x1F40D7A80](err);
}

CFIndex CFGetRetainCount(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B68](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1F40D7BA0](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x1F40D8498](alloc, formatOptions, format, arguments);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1F40D8848](allocator, buffer, bufLen, isDirectory);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1F40D9790](retstr, t1, t2);
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return MEMORY[0x1F40D97A0](t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97A8](retstr, t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97C8](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D8](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97E8](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F0](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F8](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1F40D9808](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1F40D9818](context);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1F40D9970](space, components);
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF0]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF8]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B60](name);
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9BE0](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextAddLineToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextBeginPath(CGContextRef c)
{
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextFillPath(CGContextRef c)
{
}

void CGContextMoveToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
}

void CGContextSetGrayFillColor(CGContextRef c, CGFloat gray, CGFloat alpha)
{
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetRGBStrokeColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
}

void CGContextSetShouldAntialias(CGContextRef c, BOOL shouldAntialias)
{
}

void CGContextStrokeRect(CGContextRef c, CGRect rect)
{
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA310](info, data, size, releaseData);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1F40DA868](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(void *)&bitmapInfo, provider);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x1F40DA890](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9758](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1F40E9760](idst);
}

CGImageAlphaInfo CGImageGetAlphaInfo(CGImageRef image)
{
  return MEMORY[0x1F40DA8D0](image);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x1F40DA8D8](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x1F40DA8E0](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x1F40DA8E8](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x1F40DA8F0](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x1F40DA908](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1F40DA948](image);
}

uint64_t CGImageGetImageProvider()
{
  return MEMORY[0x1F40DA958]();
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1F40DA9B8](image);
}

uint64_t CGImageProviderGetAlphaInfo()
{
  return MEMORY[0x1F40DAA20]();
}

uint64_t CGImageProviderGetColorSpace()
{
  return MEMORY[0x1F40DAA38]();
}

uint64_t CGImageProviderGetComponentType()
{
  return MEMORY[0x1F40DAA40]();
}

uint64_t CGImageProviderGetPixelSize()
{
  return MEMORY[0x1F40DAA58]();
}

void CGImageRelease(CGImageRef image)
{
}

CFDictionaryRef CGImageSourceCopyAuxiliaryDataInfoAtIndex(CGImageSourceRef isrc, size_t index, CFStringRef auxiliaryImageDataType)
{
  return (CFDictionaryRef)MEMORY[0x1F40E9908](isrc, index, auxiliaryImageDataType);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1F40E9938](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1F40E9968](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E9998](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E99C8](url, options);
}

void CGPathAddCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)
{
}

void CGPathAddEllipseInRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathAddLines(CGMutablePathRef path, const CGAffineTransform *m, const CGPoint *points, size_t count)
{
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
}

CGPathRef CGPathCreateCopyByTransformingPath(CGPathRef path, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1F40DB048](path, transform);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1F40DB068]();
}

CGPathRef CGPathCreateWithRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1F40DB0A8](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathRelease(CGPathRef path)
{
}

BOOL CGPointMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGPoint *point)
{
  return MEMORY[0x1F40DB210](dict, point);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x1F40DB220](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1F40DB228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB230]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return (CFDictionaryRef)MEMORY[0x1F40DB238]((__n128)a1.origin, *(__n128 *)&a1.origin.y, (__n128)a1.size, *(__n128 *)&a1.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x1F40DB268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x1F40DB270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x1F40DB280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x1F40DB288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x1F40DB298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x1F40DB2A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2B8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x1F40DB2C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v2;
  result.origin.CGFloat x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB2C8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB2D0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1F40DB2D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x1F40DB2E0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1F40DB2E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return MEMORY[0x1F40DB2F0](dict, rect);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

CGRect CGRectStandardize(CGRect rect)
{
  MEMORY[0x1F40DB300]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v2;
  result.origin.CGFloat x = v1;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB310]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

CFDictionaryRef CGSizeCreateDictionaryRepresentation(CGSize size)
{
  return (CFDictionaryRef)MEMORY[0x1F40DB4C8]((__n128)size, *(__n128 *)&size.height);
}

BOOL CGSizeMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGSize *size)
{
  return MEMORY[0x1F40DB4E0](dict, size);
}

CFTypeRef CMGetAttachment(CMAttachmentBearerRef target, CFStringRef key, CMAttachmentMode *attachmentModeOut)
{
  return (CFTypeRef)MEMORY[0x1F40DBBF0](target, key, attachmentModeOut);
}

Boolean CMSampleBufferDataIsReady(CMSampleBufferRef sbuf)
{
  return MEMORY[0x1F40DBD80](sbuf);
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return (CVImageBufferRef)MEMORY[0x1F40DBDC8](sbuf);
}

CMTime *__cdecl CMSampleBufferGetPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x1F40DBDF8](retstr, sbuf);
}

OSStatus CMSampleBufferGetSampleTimingInfo(CMSampleBufferRef sbuf, CMItemIndex sampleIndex, CMSampleTimingInfo *timingInfoOut)
{
  return MEMORY[0x1F40DBE18](sbuf, sampleIndex, timingInfoOut);
}

Boolean CMSampleBufferIsValid(CMSampleBufferRef sbuf)
{
  return MEMORY[0x1F40DBE50](sbuf);
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1F40DC088](retstr, lhs, rhs);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x1F40DC0C8](time1, time2);
}

CFStringRef CMTimeCopyDescription(CFAllocatorRef allocator, CMTime *time)
{
  return (CFStringRef)MEMORY[0x1F40DC0E8](allocator, time);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x1F40DC100](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x1F40DC108](retstr, value, *(void *)&timescale);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x1F40DC120](retstr, *(void *)&preferredTimescale, seconds);
}

CMTime *__cdecl CMTimeMultiply(CMTime *__return_ptr retstr, CMTime *time, int32_t multiplier)
{
  return (CMTime *)MEMORY[0x1F40DC170](retstr, time, *(void *)&multiplier);
}

CFDictionaryRef CMTimeRangeCopyAsDictionary(CMTimeRange *range, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x1F40DC1A0](range, allocator);
}

CFStringRef CMTimeRangeCopyDescription(CFAllocatorRef allocator, CMTimeRange *range)
{
  return (CFStringRef)MEMORY[0x1F40DC1A8](allocator, range);
}

Boolean CMTimeRangeEqual(CMTimeRange *range1, CMTimeRange *range2)
{
  return MEMORY[0x1F40DC1B0](range1, range2);
}

CMTimeRange *__cdecl CMTimeRangeFromTimeToTime(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *end)
{
  return (CMTimeRange *)MEMORY[0x1F40DC1B8](retstr, start, end);
}

CMTimeRange *__cdecl CMTimeRangeGetIntersection(CMTimeRange *__return_ptr retstr, CMTimeRange *range, CMTimeRange *otherRange)
{
  return (CMTimeRange *)MEMORY[0x1F40DC1C8](retstr, range, otherRange);
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return (CMTimeRange *)MEMORY[0x1F40DC1D8](retstr, start, duration);
}

CMTimeRange *__cdecl CMTimeRangeMakeFromDictionary(CMTimeRange *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTimeRange *)MEMORY[0x1F40DC1E0](retstr, dictionaryRepresentation);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1F40DC1F0](retstr, lhs, rhs);
}

CFTypeRef CVBufferCopyAttachment(CVBufferRef buffer, CFStringRef key, CVAttachmentMode *attachmentMode)
{
  return (CFTypeRef)MEMORY[0x1F40DFB48](buffer, key, attachmentMode);
}

CFDictionaryRef CVBufferCopyAttachments(CVBufferRef buffer, CVAttachmentMode attachmentMode)
{
  return (CFDictionaryRef)MEMORY[0x1F40DFB50](buffer, *(void *)&attachmentMode);
}

Boolean CVBufferHasAttachment(CVBufferRef buffer, CFStringRef key)
{
  return MEMORY[0x1F40DFB68](buffer, key);
}

void CVBufferSetAttachment(CVBufferRef buffer, CFStringRef key, CFTypeRef value, CVAttachmentMode attachmentMode)
{
}

void CVBufferSetAttachments(CVBufferRef buffer, CFDictionaryRef theAttachments, CVAttachmentMode attachmentMode)
{
}

CVReturn CVMetalTextureCacheCreate(CFAllocatorRef allocator, CFDictionaryRef cacheAttributes, id metalDevice, CFDictionaryRef textureAttributes, CVMetalTextureCacheRef *cacheOut)
{
  return MEMORY[0x1F40DFC78](allocator, cacheAttributes, metalDevice, textureAttributes, cacheOut);
}

CVReturn CVMetalTextureCacheCreateTextureFromImage(CFAllocatorRef allocator, CVMetalTextureCacheRef textureCache, CVImageBufferRef sourceImage, CFDictionaryRef textureAttributes, MTLPixelFormat pixelFormat, size_t width, size_t height, size_t planeIndex, CVMetalTextureRef *textureOut)
{
  return MEMORY[0x1F40DFC80](allocator, textureCache, sourceImage, textureAttributes, pixelFormat, width, height, planeIndex);
}

id CVMetalTextureGetTexture(CVMetalTextureRef image)
{
  return (id)MEMORY[0x1F40DFC98](image);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1F40DFCE0](allocator, width, height, *(void *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

CVReturn CVPixelBufferCreateWithBytes(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, void *baseAddress, size_t bytesPerRow, CVPixelBufferReleaseBytesCallback releaseCallback, void *releaseRefCon, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1F40DFD00](allocator, width, height, *(void *)&pixelFormatType, baseAddress, bytesPerRow, releaseCallback, releaseRefCon);
}

CVReturn CVPixelBufferCreateWithIOSurface(CFAllocatorRef allocator, IOSurfaceRef surface, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1F40DFD08](allocator, surface, pixelBufferAttributes, pixelBufferOut);
}

uint64_t CVPixelBufferGetAttributes()
{
  return MEMORY[0x1F40DFD20]();
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x1F40DFD28](pixelBuffer);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return (void *)MEMORY[0x1F40DFD30](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD40](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1F40DFD48](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD68](pixelBuffer);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1F40DFD70](pixelBuffer, planeIndex);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x1F40DFD78](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD80](pixelBuffer);
}

size_t CVPixelBufferGetPlaneCount(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD88](pixelBuffer);
}

CFTypeID CVPixelBufferGetTypeID(void)
{
  return MEMORY[0x1F40DFD90]();
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD98](pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1F40DFDA0](pixelBuffer, planeIndex);
}

Boolean CVPixelBufferIsPlanar(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFDB0](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x1F40DFDB8](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferPoolCreate(CFAllocatorRef allocator, CFDictionaryRef poolAttributes, CFDictionaryRef pixelBufferAttributes, CVPixelBufferPoolRef *poolOut)
{
  return MEMORY[0x1F40DFDC0](allocator, poolAttributes, pixelBufferAttributes, poolOut);
}

CVReturn CVPixelBufferPoolCreatePixelBuffer(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1F40DFDC8](allocator, pixelBufferPool, pixelBufferOut);
}

CFDictionaryRef CVPixelBufferPoolGetAttributes(CVPixelBufferPoolRef pool)
{
  return (CFDictionaryRef)MEMORY[0x1F40DFDE0](pool);
}

void CVPixelBufferPoolRelease(CVPixelBufferPoolRef pixelBufferPool)
{
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x1F40DFE40](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x1F40DFE48](pixelBuffer, unlockFlags);
}

CFDictionaryRef CVPixelFormatDescriptionCreateWithPixelFormatType(CFAllocatorRef allocator, OSType pixelFormat)
{
  return (CFDictionaryRef)MEMORY[0x1F40DFE50](allocator, *(void *)&pixelFormat);
}

uint64_t DDScannerCopyResultsWithOptions()
{
  return MEMORY[0x1F4117318]();
}

uint64_t DDScannerCreate()
{
  return MEMORY[0x1F4117320]();
}

uint64_t DDScannerScanString()
{
  return MEMORY[0x1F4117350]();
}

uint64_t FCRFaceDetectionParameters()
{
  return MEMORY[0x1F4103648]();
}

uint64_t FCRFastFaceDetectionParameters()
{
  return MEMORY[0x1F4103650]();
}

uint64_t FCRKeypointTrackingParameters()
{
  return MEMORY[0x1F4103658]();
}

uint64_t FCRPreciseDetectionParameters()
{
  return MEMORY[0x1F4103660]();
}

uint64_t FCRStandardTrackingParameters()
{
  return MEMORY[0x1F4103668]();
}

uint64_t ICAnalysisAddFrame()
{
  return MEMORY[0x1F4124CA8]();
}

uint64_t ICAnalysisInit()
{
  return MEMORY[0x1F4124CB0]();
}

uint64_t ICDestroyResult()
{
  return MEMORY[0x1F4124CF8]();
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x1F40E9308](properties);
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9350](buffer);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x1F40E9358](buffer);
}

size_t IOSurfaceGetHeightOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x1F40E9450](buffer, planeIndex);
}

CFTypeID IOSurfaceGetTypeID(void)
{
  return MEMORY[0x1F40E94E0]();
}

size_t IOSurfaceGetWidthOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x1F40E9508](buffer, planeIndex);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1F40E9540](buffer, *(void *)&options, seed);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1F40E9630](buffer, *(void *)&options, seed);
}

NSArray *MLAllComputeDevices(void)
{
  return (NSArray *)MEMORY[0x1F40DB7D0]();
}

uint64_t MRCContextCopySupportedComputeDevicesForDecoderUsingOptions()
{
  return MEMORY[0x1F41475E8]();
}

uint64_t MRCContextCreateWithOptions()
{
  return MEMORY[0x1F41475F0]();
}

uint64_t MRCContextPreflightForDecoderUsingOptions()
{
  return MEMORY[0x1F41475F8]();
}

uint64_t MRCDecoderCreateWithOptions()
{
  return MEMORY[0x1F4147600]();
}

uint64_t MRCDecoderDecodeSample()
{
  return MEMORY[0x1F4147608]();
}

uint64_t MRCDecoderDecodeSampleWithRegions()
{
  return MEMORY[0x1F4147610]();
}

uint64_t MRCDecoderDecodeSampleWithSegmentationMask()
{
  return MEMORY[0x1F4147618]();
}

uint64_t MRCDecoderResultGetDescriptorAtIndex()
{
  return MEMORY[0x1F4147620]();
}

uint64_t MRCDecoderResultGetDescriptorCount()
{
  return MEMORY[0x1F4147628]();
}

uint64_t MRCDescriptorCopyAttribute()
{
  return MEMORY[0x1F4147630]();
}

uint64_t MRCDescriptorCopyAttributes()
{
  return MEMORY[0x1F4147638]();
}

uint64_t MRCDescriptorCreateWithAttributes()
{
  return MEMORY[0x1F4147640]();
}

uint64_t MRCDescriptorDecodePayloadAndSupplementalPayload()
{
  return MEMORY[0x1F4147650]();
}

uint64_t MRCRegionCreate()
{
  return MEMORY[0x1F4147658]();
}

uint64_t MRCSampleCreateByGeneratingPyramid()
{
  return MEMORY[0x1F4147660]();
}

uint64_t MRCSampleCreateWithCVPixelBuffer()
{
  return MEMORY[0x1F4147668]();
}

uint64_t MRCSegmentationMaskCreate()
{
  return MEMORY[0x1F4147670]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x1F40EDE00]();
}

NSArray *__cdecl NSAllMapTableKeys(NSMapTable *table)
{
  return (NSArray *)MEMORY[0x1F40E6FD8](table);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSUInteger NSCountMapTable(NSMapTable *table)
{
  return MEMORY[0x1F40E7040](table);
}

void NSLog(NSString *format, ...)
{
}

void NSMapInsertKnownAbsent(NSMapTable *table, const void *key, const void *value)
{
}

BOOL NSMapMember(NSMapTable *table, const void *key, void **originalKey, void **value)
{
  return MEMORY[0x1F40E7198](table, key, originalKey, value);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x1F40E7298](proto);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

uint64_t NSStringFromVisionCoreSceneNetInferenceNetworkModel()
{
  return MEMORY[0x1F4167970]();
}

uint64_t NSStringFromVisionCoreTensorDataType()
{
  return MEMORY[0x1F4167978]();
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

int32_t NSVersionOfLinkTimeLibrary(const char *libraryName)
{
  return MEMORY[0x1F40C99B0](libraryName);
}

int32_t NSVersionOfRunTimeLibrary(const char *libraryName)
{
  return MEMORY[0x1F40C99B8](libraryName);
}

OSStatus VTCreateCGImageFromCVPixelBuffer(CVPixelBufferRef pixelBuffer, CFDictionaryRef options, CGImageRef *imageOut)
{
  return MEMORY[0x1F4103190](pixelBuffer, options, imageOut);
}

uint64_t VTPixelRotationSessionCreateWithRotationAndFlip()
{
  return MEMORY[0x1F4103498]();
}

void VTPixelRotationSessionInvalidate(VTPixelRotationSessionRef session)
{
}

OSStatus VTPixelRotationSessionRotateImage(VTPixelRotationSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x1F41034A8](session, sourceBuffer, destinationBuffer);
}

uint64_t VTPixelRotationSessionRotateSubImage()
{
  return MEMORY[0x1F41034B0]();
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return MEMORY[0x1F41034D0](allocator, pixelTransferSessionOut);
}

void VTPixelTransferSessionInvalidate(VTPixelTransferSessionRef session)
{
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x1F41034F0](session, sourceBuffer, destinationBuffer);
}

OSStatus VTSessionSetProperty(VTSessionRef session, CFStringRef propertyKey, CFTypeRef propertyValue)
{
  return MEMORY[0x1F4103538](session, propertyKey, propertyValue);
}

uint64_t VisionCoreBoundingBoxForQuadrilateralPoints()
{
  return MEMORY[0x1F4167980]();
}

uint64_t VisionCoreCurrentANEGeneration()
{
  return MEMORY[0x1F4167988]();
}

uint64_t VisionCoreEqualOrNilObjects()
{
  return MEMORY[0x1F4167990]();
}

uint64_t VisionCoreEquivalentOrNilUnorderedArrays()
{
  return MEMORY[0x1F4167998]();
}

uint64_t VisionCoreFourCharCodeToString()
{
  return MEMORY[0x1F41679A8]();
}

uint64_t VisionCoreHasANE()
{
  return MEMORY[0x1F41679B0]();
}

uint64_t VisionCoreImagePointForNormalizedPoint()
{
  return MEMORY[0x1F41679B8]();
}

uint64_t VisionCoreNormalizedPointForImagePoint()
{
  return MEMORY[0x1F41679C0]();
}

uint64_t VisionCoreTensorDataTypeGetElementSize()
{
  return MEMORY[0x1F41679C8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t espresso_vision_compute()
{
  return MEMORY[0x1F4117CC0]();
}

uint64_t espresso_vision_compute_batch()
{
  return MEMORY[0x1F4117CD0]();
}

uint64_t espresso_vision_shape_network()
{
  return MEMORY[0x1F4117CD8]();
}

uint64_t espresso_vision_compute_pupil_position()
{
  return MEMORY[0x1F4117CE8]();
}

uint64_t espresso_vision_compute_dropout_augment()
{
  return MEMORY[0x1F4117CF0]();
}

uint64_t espresso_vision_util_update_metal_priority()
{
  return MEMORY[0x1F4117CF8]();
}

uint64_t espresso_vision_first_layer_number_of_input_blobs()
{
  return MEMORY[0x1F4117D00]();
}

uint64_t espresso_vision_classify_descriptor_handler_nsdata()
{
  return MEMORY[0x1F4117D08]();
}

uint64_t espresso_vision_first_layer_first_source_blob_shape()
{
  return MEMORY[0x1F4117D10]();
}

uint64_t espresso_vision_last_layer_first_destination_blob_shape()
{
  return MEMORY[0x1F4117D20]();
}

uint64_t Espresso::load_network_shape()
{
  return MEMORY[0x1F4117E90]();
}

int std::string::compare(const std::string *this, const std::string::value_type *__s)
{
  return MEMORY[0x1F417E390](this, __s);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1F417E408](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1F417E418](this);
}

const char *__cdecl std::exception::what(const std::exception *this)
{
  return (const char *)MEMORY[0x1F417E430](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::string *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E450](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x1F417E4B8](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::runtime_error *a2)
{
  return (std::runtime_error *)MEMORY[0x1F417E4C8](this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
}

std::runtime_error *__cdecl std::runtime_error::operator=(std::runtime_error *this, const std::runtime_error *a2)
{
  return (std::runtime_error *)MEMORY[0x1F417E4F8](this, a2);
}

void std::invalid_argument::~invalid_argument(std::invalid_argument *this)
{
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1F417E588](__n);
}

void std::string::__grow_by_and_replace(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add, const std::string::value_type *__p_new_stuff)
{
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E5A0](this, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E5C0](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E608](this, __pos, __s, __n);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
}

std::string *__cdecl std::string::replace(std::string *this, std::string::size_type __pos, std::string::size_type __n1, const std::string::value_type *__s, std::string::size_type __n2)
{
  return (std::string *)MEMORY[0x1F417E628](this, __pos, __n1, __s, __n2);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x1F417E660](this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1F417E670](this, __str);
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x1F417E728]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x1F417E740]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x1F417E748]();
}

uint64_t std::istream::read()
{
  return MEMORY[0x1F417E768]();
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x1F417E7A0]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x1F417E7B8]();
}

{
  return MEMORY[0x1F417E7C0]();
}

uint64_t std::ostream::put()
{
  return MEMORY[0x1F417E830]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x1F417E838]();
}

uint64_t std::ostream::write()
{
  return MEMORY[0x1F417E840]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1F417E848]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1F417E850]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x1F417E858]();
}

{
  return MEMORY[0x1F417E860]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1F417E890]();
}

{
  return MEMORY[0x1F417E898]();
}

{
  return MEMORY[0x1F417E8B0]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x1F417E940]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1F417E978]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1F417E980]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

float std::stof(const std::string *__str, size_t *__idx)
{
  MEMORY[0x1F417EBD8](__str, __idx);
  return result;
}

void std::mutex::lock(std::mutex *this)
{
}

void std::mutex::unlock(std::mutex *this)
{
}

void std::mutex::~mutex(std::mutex *this)
{
}

uint64_t std::__sort<std::__less<double,double> &,double *>()
{
  return MEMORY[0x1F417EC38]();
}

std::chrono::steady_clock::time_point std::chrono::steady_clock::now(void)
{
  return (std::chrono::steady_clock::time_point)MEMORY[0x1F417EC90]();
}

std::chrono::system_clock::time_point std::chrono::system_clock::now(void)
{
  return (std::chrono::system_clock::time_point)MEMORY[0x1F417ECA0]();
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x1F417EE40]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x1F417EE70](retstr, *(void *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x1F417EE88](retstr, __val);
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x1F417EEA0]();
}

std::bad_alloc *__cdecl std::bad_alloc::bad_alloc(std::bad_alloc *this)
{
  return (std::bad_alloc *)MEMORY[0x1F417EEC8](this);
}

{
  return (std::bad_alloc *)MEMORY[0x1F417EED0](this);
}

void std::bad_alloc::~bad_alloc(std::bad_alloc *this)
{
}

void std::exception::~exception(std::exception *this)
{
}

{
  MEMORY[0x1F417EEF0](this);
}

void std::terminate(void)
{
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new[](size_t __sz, const std::nothrow_t *a2)
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz, const std::nothrow_t *a2)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x1F40C9B60](lpfunc, obj, lpdso_handle);
}

void __cxa_bad_cast(void)
{
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void *__cxa_get_exception_ptr(void *a1)
{
  return (void *)MEMORY[0x1F417EF70](a1);
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1F417EF80](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x1F417EFA8](lpsrc, lpstype, lpdtype, s2d);
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

simd_float3x3 __invert_f3(simd_float3x3 a1)
{
  MEMORY[0x1F40C9BF8]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2]);
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

simd_float4x4 __invert_f4(simd_float4x4 a1)
{
  MEMORY[0x1F40C9C00]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2], (__n128)a1.columns[3]);
  result.columns[3].i64[1] = v8;
  result.columns[3].i64[0] = v7;
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1F40C9C18](*(void *)&a1, a2);
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x1F40C9C80](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x1F40C9C88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1F40C9CF8](*(void *)&a1);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

simd_float4 _simd_exp_f4(simd_float4 x)
{
  MEMORY[0x1F40CA160]((__n128)x);
  return result;
}

simd_float4 _simd_pow_f4(simd_float4 x, simd_float4 y)
{
  MEMORY[0x1F40CA188]((__n128)x, (__n128)y);
  return result;
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

void abort(void)
{
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

float acosf(float a1)
{
  MEMORY[0x1F40CA340](a1);
  return result;
}

float asinf(float a1)
{
  MEMORY[0x1F40CA3D8](a1);
  return result;
}

long double atan(long double __x)
{
  MEMORY[0x1F40CA450](__x);
  return result;
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x1F40CA460](__y, __x);
  return result;
}

float atan2f(float a1, float a2)
{
  MEMORY[0x1F40CA468](a1, a2);
  return result;
}

float atanf(float a1)
{
  MEMORY[0x1F40CA470](a1);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

void catlas_daxpby(const int __N, const double __alpha, const double *__X, const int __incX, const double __beta, double *__Y, const int __incY)
{
}

double cblas_dasum(const int __N, const double *__X, const int __incX)
{
  MEMORY[0x1F40D1530](*(void *)&__N, __X, *(void *)&__incX);
  return result;
}

void cblas_daxpy(const int __N, const double __alpha, const double *__X, const int __incX, double *__Y, const int __incY)
{
}

void cblas_dcopy(const int __N, const double *__X, const int __incX, double *__Y, const int __incY)
{
}

double cblas_ddot(const int __N, const double *__X, const int __incX, const double *__Y, const int __incY)
{
  MEMORY[0x1F40D1560](*(void *)&__N, __X, *(void *)&__incX, __Y, *(void *)&__incY);
  return result;
}

void cblas_dgemm(const CBLAS_ORDER __Order, const CBLAS_TRANSPOSE __TransA, const CBLAS_TRANSPOSE __TransB, const int __M, const int __N, const int __K, const double __alpha, const double *__A, const int __lda, const double *__B, const int __ldb, const double __beta, double *__C, const int __ldc)
{
}

void cblas_dgemv(const CBLAS_ORDER __Order, const CBLAS_TRANSPOSE __TransA, const int __M, const int __N, const double __alpha, const double *__A, const int __lda, const double *__X, const int __incX, const double __beta, double *__Y, const int __incY)
{
}

void cblas_drot(const int __N, double *__X, const int __incX, double *__Y, const int __incY, const double __c, const double __s)
{
}

void cblas_drotg(double *__a, double *__b, double *__c, double *__s)
{
}

float cblas_sasum(const int __N, const float *__X, const int __incX)
{
  MEMORY[0x1F40D15D0](*(void *)&__N, __X, *(void *)&__incX);
  return result;
}

void cblas_saxpy(const int __N, const float __alpha, const float *__X, const int __incX, float *__Y, const int __incY)
{
}

float cblas_sdot(const int __N, const float *__X, const int __incX, const float *__Y, const int __incY)
{
  MEMORY[0x1F40D15F8](*(void *)&__N, __X, *(void *)&__incX, __Y, *(void *)&__incY);
  return result;
}

void cblas_sgemm(const CBLAS_ORDER __Order, const CBLAS_TRANSPOSE __TransA, const CBLAS_TRANSPOSE __TransB, const int __M, const int __N, const int __K, const float __alpha, const float *__A, const int __lda, const float *__B, const int __ldb, const float __beta, float *__C, const int __ldc)
{
}

void cblas_sgemv(const CBLAS_ORDER __Order, const CBLAS_TRANSPOSE __TransA, const int __M, const int __N, const float __alpha, const float *__A, const int __lda, const float *__X, const int __incX, const float __beta, float *__Y, const int __incY)
{
}

float cblas_snrm2(const int __N, const float *__X, const int __incX)
{
  MEMORY[0x1F40D1668](*(void *)&__N, __X, *(void *)&__incX);
  return result;
}

BOOL class_conformsToProtocol(Class cls, Protocol *protocol)
{
  return MEMORY[0x1F41814E0](cls, protocol);
}

Method *__cdecl class_copyMethodList(Class cls, unsigned int *outCount)
{
  return (Method *)MEMORY[0x1F41814F8](cls, outCount);
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x1F4181500](cls, outCount);
}

Method class_getClassMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1F4181518](cls, name);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1F4181528](cls, name);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x1F4181558](cls);
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x1F417F0A0](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(void *)&algorithm);
}

long double cos(long double __x)
{
  MEMORY[0x1F40CB8A8](__x);
  return result;
}

float cosf(float a1)
{
  MEMORY[0x1F40CB8B0](a1);
  return result;
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
}

void dispatch_apply_f(size_t iterations, dispatch_queue_t queue, void *context, void (__cdecl *work)(void *, size_t))
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C8](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CB9F8](block, timeout);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_group_async_f(dispatch_group_t group, dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1F40CBBD8](queue);
}

void dispatch_release(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_sync_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

int dpotrs_(char *__uplo, __CLPK_integer *__n, __CLPK_integer *__nrhs, __CLPK_doublereal *__a, __CLPK_integer *__lda, __CLPK_doublereal *__b, __CLPK_integer *__ldb, __CLPK_integer *__info)
{
  return MEMORY[0x1F40D1790](__uplo, __n, __nrhs, __a, __lda, __b, __ldb, __info);
}

int dtrtrs_(char *__uplo, char *__trans, char *__diag, __CLPK_integer *__n, __CLPK_integer *__nrhs, __CLPK_doublereal *__a, __CLPK_integer *__lda, __CLPK_doublereal *__b, __CLPK_integer *__ldb, __CLPK_integer *__info)
{
  return MEMORY[0x1F40D17A8](__uplo, __trans, __diag, __n, __nrhs, __a, __lda, __b);
}

uint64_t e5rt_buffer_object_create_from_iosurface()
{
  return MEMORY[0x1F4118068]();
}

uint64_t e5rt_buffer_object_release()
{
  return MEMORY[0x1F4118098]();
}

uint64_t e5rt_e5_compiler_compile()
{
  return MEMORY[0x1F41180B8]();
}

uint64_t e5rt_e5_compiler_create()
{
  return MEMORY[0x1F41180D0]();
}

uint64_t e5rt_e5_compiler_options_create()
{
  return MEMORY[0x1F41180E0]();
}

uint64_t e5rt_e5_compiler_options_release()
{
  return MEMORY[0x1F4118100]();
}

uint64_t e5rt_e5_compiler_options_set_compute_device_types_mask()
{
  return MEMORY[0x1F4118118]();
}

uint64_t e5rt_e5_compiler_release()
{
  return MEMORY[0x1F41181A0]();
}

uint64_t e5rt_error_code_get_string()
{
  return MEMORY[0x1F41181A8]();
}

uint64_t e5rt_execution_stream_create()
{
  return MEMORY[0x1F41181C8]();
}

uint64_t e5rt_execution_stream_encode_operation()
{
  return MEMORY[0x1F41181E0]();
}

uint64_t e5rt_execution_stream_execute_sync()
{
  return MEMORY[0x1F41181E8]();
}

uint64_t e5rt_execution_stream_operation_create_precompiled_compute_operation_with_options()
{
  return MEMORY[0x1F4118238]();
}

uint64_t e5rt_execution_stream_operation_release()
{
  return MEMORY[0x1F41182B0]();
}

uint64_t e5rt_execution_stream_operation_retain_input_port()
{
  return MEMORY[0x1F41182D8]();
}

uint64_t e5rt_execution_stream_operation_retain_output_port()
{
  return MEMORY[0x1F41182E8]();
}

uint64_t e5rt_execution_stream_prewire_in_use_allocations()
{
  return MEMORY[0x1F4118300]();
}

uint64_t e5rt_execution_stream_release()
{
  return MEMORY[0x1F4118308]();
}

uint64_t e5rt_execution_stream_reset()
{
  return MEMORY[0x1F4118320]();
}

uint64_t e5rt_execution_stream_submit_async()
{
  return MEMORY[0x1F4118340]();
}

uint64_t e5rt_io_port_bind_buffer_object()
{
  return MEMORY[0x1F4118360]();
}

uint64_t e5rt_io_port_bind_surface_object()
{
  return MEMORY[0x1F4118370]();
}

uint64_t e5rt_io_port_is_surface()
{
  return MEMORY[0x1F4118388]();
}

uint64_t e5rt_io_port_is_tensor()
{
  return MEMORY[0x1F4118390]();
}

uint64_t e5rt_io_port_release()
{
  return MEMORY[0x1F4118398]();
}

uint64_t e5rt_io_port_retain_surface_desc()
{
  return MEMORY[0x1F41183B0]();
}

uint64_t e5rt_io_port_retain_tensor_desc()
{
  return MEMORY[0x1F41183C0]();
}

uint64_t e5rt_precompiled_compute_op_create_options_create_with_program_function()
{
  return MEMORY[0x1F41183E8]();
}

uint64_t e5rt_precompiled_compute_op_create_options_release()
{
  return MEMORY[0x1F4118400]();
}

uint64_t e5rt_program_function_get_extern_input_names()
{
  return MEMORY[0x1F4118430]();
}

uint64_t e5rt_program_function_get_extern_output_names()
{
  return MEMORY[0x1F4118438]();
}

uint64_t e5rt_program_function_get_num_extern_inputs()
{
  return MEMORY[0x1F4118440]();
}

uint64_t e5rt_program_function_get_num_extern_outputs()
{
  return MEMORY[0x1F4118448]();
}

uint64_t e5rt_program_function_release()
{
  return MEMORY[0x1F4118458]();
}

uint64_t e5rt_program_library_create()
{
  return MEMORY[0x1F4118468]();
}

uint64_t e5rt_program_library_get_function_metadata()
{
  return MEMORY[0x1F4118470]();
}

uint64_t e5rt_program_library_get_function_names()
{
  return MEMORY[0x1F4118478]();
}

uint64_t e5rt_program_library_get_num_functions()
{
  return MEMORY[0x1F4118480]();
}

uint64_t e5rt_program_library_release()
{
  return MEMORY[0x1F4118498]();
}

uint64_t e5rt_program_library_retain_program_function()
{
  return MEMORY[0x1F41184A0]();
}

uint64_t e5rt_surface_desc_get_format()
{
  return MEMORY[0x1F41184B8]();
}

uint64_t e5rt_surface_desc_get_height()
{
  return MEMORY[0x1F41184C0]();
}

uint64_t e5rt_surface_desc_get_width()
{
  return MEMORY[0x1F41184D0]();
}

uint64_t e5rt_surface_desc_release()
{
  return MEMORY[0x1F41184D8]();
}

uint64_t e5rt_surface_object_create_from_iosurface()
{
  return MEMORY[0x1F41184E8]();
}

uint64_t e5rt_tensor_desc_dtype_get_component_dtype()
{
  return MEMORY[0x1F4118538]();
}

uint64_t e5rt_tensor_desc_dtype_get_component_size()
{
  return MEMORY[0x1F4118550]();
}

uint64_t e5rt_tensor_desc_dtype_release()
{
  return MEMORY[0x1F4118570]();
}

uint64_t e5rt_tensor_desc_get_shape()
{
  return MEMORY[0x1F4118590]();
}

uint64_t e5rt_tensor_desc_get_size()
{
  return MEMORY[0x1F4118598]();
}

uint64_t e5rt_tensor_desc_get_strides()
{
  return MEMORY[0x1F41185A0]();
}

uint64_t e5rt_tensor_desc_release()
{
  return MEMORY[0x1F41185B0]();
}

uint64_t e5rt_tensor_desc_retain_dtype()
{
  return MEMORY[0x1F41185B8]();
}

uint64_t espresso_buffer_pack_tensor_shape()
{
  return MEMORY[0x1F4118628]();
}

uint64_t espresso_context_destroy()
{
  return MEMORY[0x1F4118648]();
}

uint64_t espresso_create_context()
{
  return MEMORY[0x1F4118668]();
}

uint64_t espresso_create_plan()
{
  return MEMORY[0x1F4118678]();
}

uint64_t espresso_device_id_for_metal_device()
{
  return MEMORY[0x1F4118688]();
}

uint64_t espresso_get_status_string()
{
  return MEMORY[0x1F41186D8]();
}

uint64_t espresso_network_bind_buffer()
{
  return MEMORY[0x1F41186E0]();
}

uint64_t espresso_network_bind_cvpixelbuffer()
{
  return MEMORY[0x1F41186F8]();
}

uint64_t espresso_network_bind_input_cvpixelbuffer()
{
  return MEMORY[0x1F4118708]();
}

uint64_t espresso_network_bind_input_vimagebuffer_bgra8()
{
  return MEMORY[0x1F4118718]();
}

uint64_t espresso_network_bind_input_vimagebuffer_planar8()
{
  return MEMORY[0x1F4118720]();
}

uint64_t espresso_network_change_input_blob_shapes()
{
  return MEMORY[0x1F4118738]();
}

uint64_t espresso_network_declare_input()
{
  return MEMORY[0x1F4118760]();
}

uint64_t espresso_network_declare_output()
{
  return MEMORY[0x1F4118770]();
}

uint64_t espresso_network_query_blob_dimensions()
{
  return MEMORY[0x1F4118788]();
}

uint64_t espresso_network_select_configuration()
{
  return MEMORY[0x1F41187A0]();
}

uint64_t espresso_network_set_memory_pool_id()
{
  return MEMORY[0x1F41187C0]();
}

uint64_t espresso_plan_add_network()
{
  return MEMORY[0x1F41187D8]();
}

uint64_t espresso_plan_build()
{
  return MEMORY[0x1F41187F0]();
}

uint64_t espresso_plan_build_clean()
{
  return MEMORY[0x1F41187F8]();
}

uint64_t espresso_plan_destroy()
{
  return MEMORY[0x1F4118818]();
}

uint64_t espresso_plan_execute_sync()
{
  return MEMORY[0x1F4118828]();
}

uint64_t espresso_plan_get_error_info()
{
  return MEMORY[0x1F4118838]();
}

uint64_t espresso_plan_get_phase()
{
  return MEMORY[0x1F4118848]();
}

uint64_t espresso_plan_set_priority()
{
  return MEMORY[0x1F4118858]();
}

long double exp(long double __x)
{
  MEMORY[0x1F40CBFE0](__x);
  return result;
}

float expf(float a1)
{
  MEMORY[0x1F40CBFF8](a1);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x1F40CC050](a1);
}

int flsl(uint64_t a1)
{
  return MEMORY[0x1F40CC180](a1);
}

float fmodf(float a1, float a2)
{
  MEMORY[0x1F40CC1A8](a1, a2);
  return result;
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1F40CC1C0](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC200](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x1F40CC290](a1, a2, *(void *)&a3);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1F40CC2B8](*(void *)&a1, a2);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x1F40CC2E0](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC338](__ptr, __size, __nitems, __stream);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

long double ldexp(long double __x, int __e)
{
  MEMORY[0x1F40CC800](*(void *)&__e, __x);
  return result;
}

long double log(long double __x)
{
  MEMORY[0x1F40CC878](__x);
  return result;
}

long double log2(long double __x)
{
  MEMORY[0x1F40CC8A8](__x);
  return result;
}

float log2f(float a1)
{
  MEMORY[0x1F40CC8B0](a1);
  return result;
}

float logf(float a1)
{
  MEMORY[0x1F40CC8C0](a1);
  return result;
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1F40CC8F8](*(void *)&a1, a2, *(void *)&a3);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

int madvise(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1F40CCB08](a1, a2, *(void *)&a3);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl malloc_type_aligned_alloc(size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB88](alignment, size, type_id);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCBA8](ptr, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCD8](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

void memset_pattern4(void *__b, const void *__pattern4, size_t __len)
{
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x1F41815F8](m);
}

SEL method_getName(Method m)
{
  return (SEL)MEMORY[0x1F4181600](m);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1F40CCE40](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

float modff(float a1, float *a2)
{
  MEMORY[0x1F40CCE50](a2, a1);
  return result;
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1F40CCE88](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyCppObjectAtomic(void *dest, const void *src, void (__cdecl *copyHelper)(void *, const void *))
{
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1F4181A58](a1);
}

BOOL object_isClass(id obj)
{
  return MEMORY[0x1F4181A88](obj);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  return MEMORY[0x1F40CD5F0](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

float powf(float a1, float a2)
{
  MEMORY[0x1F40CD828](a1, a2);
  return result;
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1F40CD838](a1);
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x1F4181AD0](property);
}

int puts(const char *a1)
{
  return MEMORY[0x1F40CDBB8](a1);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1F40CDBD8]();
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

int rand(void)
{
  return MEMORY[0x1F40CDC08]();
}

uint64_t random(void)
{
  return MEMORY[0x1F40CDC18]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1F40CDC50](*(void *)&a1, a2, a3);
}

int sgels_(char *__trans, __CLPK_integer *__m, __CLPK_integer *__n, __CLPK_integer *__nrhs, __CLPK_real *__a, __CLPK_integer *__lda, __CLPK_real *__b, __CLPK_integer *__ldb, __CLPK_real *__work, __CLPK_integer *__lwork, __CLPK_integer *__info)
{
  return MEMORY[0x1F40D17D0](__trans, __m, __n, __nrhs, __a, __lda, __b, __ldb);
}

int sgetrf_(__CLPK_integer *__m, __CLPK_integer *__n, __CLPK_real *__a, __CLPK_integer *__lda, __CLPK_integer *__ipiv, __CLPK_integer *__info)
{
  return MEMORY[0x1F40D1808](__m, __n, __a, __lda, __ipiv, __info);
}

int sgetri_(__CLPK_integer *__n, __CLPK_real *__a, __CLPK_integer *__lda, __CLPK_integer *__ipiv, __CLPK_real *__work, __CLPK_integer *__lwork, __CLPK_integer *__info)
{
  return MEMORY[0x1F40D1810](__n, __a, __lda, __ipiv, __work, __lwork, __info);
}

float sinf(float a1)
{
  MEMORY[0x1F40CE060](a1);
  return result;
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int sposv_(char *__uplo, __CLPK_integer *__n, __CLPK_integer *__nrhs, __CLPK_real *__a, __CLPK_integer *__lda, __CLPK_real *__b, __CLPK_integer *__ldb, __CLPK_integer *__info)
{
  return MEMORY[0x1F40D1900](__uplo, __n, __nrhs, __a, __lda, __b, __ldb, __info);
}

void srand(unsigned int a1)
{
}

int ssyevx_(char *__jobz, char *__range, char *__uplo, __CLPK_integer *__n, __CLPK_real *__a, __CLPK_integer *__lda, __CLPK_real *__vl, __CLPK_real *__vu, __CLPK_integer *__il, __CLPK_integer *__iu, __CLPK_real *__abstol, __CLPK_integer *__m, __CLPK_real *__w, __CLPK_real *__z__, __CLPK_integer *__ldz, __CLPK_real *__work, __CLPK_integer *__lwork, __CLPK_integer *__iwork, __CLPK_integer *__ifail, __CLPK_integer *__info)
{
  return MEMORY[0x1F40D1930](__jobz, __range, __uplo, __n, __a, __lda, __vl, __vu);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1F41863F0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1F4186420]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1F4186428]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1F4186460]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x1F4186478]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1F41881F0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1F4186488]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1F4188218]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1F4188220]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x1F41864B0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1F41864C0]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x1F41864D0]();
}

uint64_t swift_dynamicCastMetatypeUnconditional()
{
  return MEMORY[0x1F41864D8]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
}

uint64_t swift_dynamicCastUnknownClassUnconditional()
{
  return MEMORY[0x1F4186510]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1F4186538]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1F4186540]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x1F4186568]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1F4186580]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x1F4186618]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1F4186638]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1F4186650]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1F4186688]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1F4186690]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x1F41866C0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1F41866F8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1F4186710]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1F4186760]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1F4186778]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1F4186790]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1F41867B8]();
}

uint64_t swift_taskGroup_addPending()
{
  return MEMORY[0x1F4188248]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1F4188258]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1F41867D8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1F41867E8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1F41867F8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x1F41868E8]();
}

void syslog(int a1, const char *a2, ...)
{
}

float tanhf(float a1)
{
  MEMORY[0x1F40CE438](a1);
  return result;
}

void uuid_generate(uuid_t out)
{
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

FFTSetup vDSP_create_fftsetup(vDSP_Length __Log2n, FFTRadix __Radix)
{
  return (FFTSetup)MEMORY[0x1F40D19F0](__Log2n, *(void *)&__Radix);
}

void vDSP_ctoz(const DSPComplex *__C, vDSP_Stride __IC, const DSPSplitComplex *__Z, vDSP_Stride __IZ, vDSP_Length __N)
{
}

void vDSP_destroy_fftsetup(FFTSetup __setup)
{
}

void vDSP_distancesq(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Length __N)
{
}

void vDSP_dotpr(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Length __N)
{
}

void vDSP_f5x5(const float *__A, vDSP_Length __NR, vDSP_Length __NC, const float *__F, float *__C)
{
}

void vDSP_fft2d_zip(FFTSetup __Setup, const DSPSplitComplex *__C, vDSP_Stride __IC0, vDSP_Stride __IC1, vDSP_Length __Log2N0, vDSP_Length __Log2N1, FFTDirection __Direction)
{
}

void vDSP_fft2d_zrip(FFTSetup __Setup, const DSPSplitComplex *__C, vDSP_Stride __IC0, vDSP_Stride __IC1, vDSP_Length __Log2N0, vDSP_Length __Log2N1, FFTDirection __Direction)
{
}

void vDSP_fft2d_zrop(FFTSetup __Setup, const DSPSplitComplex *__A, vDSP_Stride __IA0, vDSP_Stride __IA1, const DSPSplitComplex *__C, vDSP_Stride __IC0, vDSP_Stride __IC1, vDSP_Length __Log2N0, vDSP_Length __Log2N1, FFTDirection __Direction)
{
}

void vDSP_maxv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
}

void vDSP_meanv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
}

void vDSP_mmul(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __M, vDSP_Length __N, vDSP_Length __P)
{
}

void vDSP_sve(const float *__A, vDSP_Stride __I, float *__C, vDSP_Length __N)
{
}

void vDSP_svesq(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
}

void vDSP_vadd(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vclip(const float *__A, vDSP_Stride __IA, const float *__B, const float *__C, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
}

void vDSP_vdist(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vdiv(const float *__B, vDSP_Stride __IB, const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vfill(const float *__A, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vfixr16(const float *__A, vDSP_Stride __IA, __int16 *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vfixru16(const float *__A, vDSP_Stride __IA, unsigned __int16 *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vfixru8(const float *__A, vDSP_Stride __IA, unsigned __int8 *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vflt32(const int *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vfltu16(const unsigned __int16 *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vfltu8(const unsigned __int8 *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vma(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, const float *__C, vDSP_Stride __IC, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
}

void vDSP_vmaxmg(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vmma(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, const float *__C, vDSP_Stride __IC, const float *__D, vDSP_Stride __ID, float *__E, vDSP_Stride __IE, vDSP_Length __N)
{
}

void vDSP_vmul(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vpythg(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, const float *__C, vDSP_Stride __IC, const float *__D, vDSP_Stride __ID, float *__E, vDSP_Stride __IE, vDSP_Length __N)
{
}

void vDSP_vsadd(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsdiv(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsma(const float *__A, vDSP_Stride __IA, const float *__B, const float *__C, vDSP_Stride __IC, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
}

void vDSP_vsmsa(const float *__A, vDSP_Stride __IA, const float *__B, const float *__C, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
}

void vDSP_vsmul(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsort(float *__C, vDSP_Length __N, int __Order)
{
}

void vDSP_vsorti(const float *__C, vDSP_Length *__I, vDSP_Length *__Temporary, vDSP_Length __N, int __Order)
{
}

void vDSP_vspdp(const float *__A, vDSP_Stride __IA, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsub(const float *__B, vDSP_Stride __IB, const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vthrsc(const float *__A, vDSP_Stride __IA, const float *__B, const float *__C, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
}

void vDSP_ztoc(const DSPSplitComplex *__Z, vDSP_Stride __IZ, DSPComplex *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_zvcmul(const DSPSplitComplex *__A, vDSP_Stride __IA, const DSPSplitComplex *__B, vDSP_Stride __IB, const DSPSplitComplex *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_zvmags(const DSPSplitComplex *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_zvmul(const DSPSplitComplex *__A, vDSP_Stride __IA, const DSPSplitComplex *__B, vDSP_Stride __IB, const DSPSplitComplex *__C, vDSP_Stride __IC, vDSP_Length __N, int __Conjugate)
{
}

void vDSP_zvzsml(const DSPSplitComplex *__A, vDSP_Stride __IA, const DSPSplitComplex *__B, const DSPSplitComplex *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

vImage_Error vImageAffineWarp_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, const vImage_AffineTransform *transform, const Pixel_8888 backColor, vImage_Flags flags)
{
  return MEMORY[0x1F40D2218](src, dest, tempBuffer, transform, backColor, *(void *)&flags);
}

vImage_Error vImageBoxConvolve_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImagePixelCount srcOffsetToROI_X, vImagePixelCount srcOffsetToROI_Y, uint32_t kernel_height, uint32_t kernel_width, Pixel_8 backgroundColor, vImage_Flags flags)
{
  return MEMORY[0x1F40D2268](src, dest, tempBuffer, srcOffsetToROI_X, srcOffsetToROI_Y, *(void *)&kernel_height, *(void *)&kernel_width, backgroundColor);
}

vImage_Error vImageBufferFill_ARGB8888(const vImage_Buffer *dest, const Pixel_8888 color, vImage_Flags flags)
{
  return MEMORY[0x1F40D2278](dest, color, *(void *)&flags);
}

vImage_Error vImageBuffer_Init(vImage_Buffer *buf, vImagePixelCount height, vImagePixelCount width, uint32_t pixelBits, vImage_Flags flags)
{
  return MEMORY[0x1F40D22A0](buf, height, width, *(void *)&pixelBits, *(void *)&flags);
}

vImage_Error vImageBuffer_InitWithCGImage(vImage_Buffer *buf, vImage_CGImageFormat *format, const CGFloat *backgroundColor, CGImageRef image, vImage_Flags flags)
{
  return MEMORY[0x1F40D22B8](buf, format, backgroundColor, image, *(void *)&flags);
}

vImage_Error vImageConvert_ARGB8888toPlanar8(const vImage_Buffer *srcARGB, const vImage_Buffer *destA, const vImage_Buffer *destR, const vImage_Buffer *destG, const vImage_Buffer *destB, vImage_Flags flags)
{
  return MEMORY[0x1F40D2528](srcARGB, destA, destR, destG, destB, *(void *)&flags);
}

vImage_Error vImageConvert_Planar16FtoPlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D25B0](src, dest, *(void *)&flags);
}

vImage_Error vImageConvert_Planar8toPlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, Pixel_F maxFloat, Pixel_F minFloat, vImage_Flags flags)
{
  return MEMORY[0x1F40D2618](src, dest, *(void *)&flags, maxFloat, minFloat);
}

vImage_Error vImageConvert_PlanarFtoPlanar16F(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D2648](src, dest, *(void *)&flags);
}

vImage_Error vImageConvolve_PlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImagePixelCount srcOffsetToROI_X, vImagePixelCount srcOffsetToROI_Y, const float *kernel, uint32_t kernel_height, uint32_t kernel_width, Pixel_F backgroundColor, vImage_Flags flags)
{
  return MEMORY[0x1F40D2850](src, dest, tempBuffer, srcOffsetToROI_X, srcOffsetToROI_Y, kernel, *(void *)&kernel_height, *(void *)&kernel_width, backgroundColor);
}

vImage_Error vImageCopyBuffer(const vImage_Buffer *src, const vImage_Buffer *dest, size_t pixelSize, vImage_Flags flags)
{
  return MEMORY[0x1F40D2858](src, dest, pixelSize, *(void *)&flags);
}

vImage_Error vImageHorizontalReflect_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D29A0](src, dest, *(void *)&flags);
}

vImage_Error vImageHorizontalReflect_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D29C0](src, dest, *(void *)&flags);
}

vImage_Error vImageMatrixMultiply_ARGB8888ToPlanar8(const vImage_Buffer *src, const vImage_Buffer *dest, const int16_t matrix[4], int32_t divisor, const int16_t pre_bias[4], int32_t post_bias, vImage_Flags flags)
{
  return MEMORY[0x1F40D2A60](src, dest, matrix, *(void *)&divisor, pre_bias, *(void *)&post_bias, *(void *)&flags);
}

vImage_Error vImageRotate90_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, uint8_t rotationConstant, const Pixel_8888 backColor, vImage_Flags flags)
{
  return MEMORY[0x1F40D2C48](src, dest, rotationConstant, backColor, *(void *)&flags);
}

vImage_Error vImageRotate90_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, uint8_t rotationConstant, Pixel_8 backColor, vImage_Flags flags)
{
  return MEMORY[0x1F40D2C78](src, dest, rotationConstant, backColor, *(void *)&flags);
}

vImage_Error vImageScale_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x1F40D2CD8](src, dest, tempBuffer, *(void *)&flags);
}

vImage_Error vImageScale_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x1F40D2D08](src, dest, tempBuffer, *(void *)&flags);
}

vImage_Error vImageScale_PlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x1F40D2D10](src, dest, tempBuffer, *(void *)&flags);
}

vImage_Error vImageVerticalReflect_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D2D98](src, dest, *(void *)&flags);
}

vImage_Error vImageVerticalReflect_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D2DB8](src, dest, *(void *)&flags);
}

int vfprintf(FILE *a1, const char *a2, va_list a3)
{
  return MEMORY[0x1F40CE690](a1, a2, a3);
}

void vvexpf(float *a1, const float *a2, const int *a3)
{
}

void vvintf(float *a1, const float *a2, const int *a3)
{
}

void vvnintf(float *a1, const float *a2, const int *a3)
{
}

void vvsqrtf(float *a1, const float *a2, const int *a3)
{
}

__int32 *__cdecl wmemchr(__int32 *__s, __int32 __c, size_t __n)
{
  return (__int32 *)MEMORY[0x1F40CE8B0](__s, *(void *)&__c, __n);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1F40CE928](*(void *)&__fd, __buf, __nbyte);
}