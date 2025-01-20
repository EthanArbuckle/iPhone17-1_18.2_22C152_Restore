void sub_21F07F4E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  std::shared_ptr<vision::mod::LivenessCheck_Options>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t std::shared_ptr<vision::mod::LivenessCheck_Options>::~shared_ptr[abi:ne180100](uint64_t result)
{
  uint64_t v1 = result;
  v2 = *(std::__shared_weak_count **)(result + 8);
  if (v2)
  {
    if (!atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
      return v1;
    }
  }
  return result;
}

void sub_21F07FC08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,uint64_t a25,void *__p,uint64_t a27)
{
  std::vector<std::vector<float>>::~vector[abi:ne180100](&a14);
  if (a17)
  {
    a18 = (uint64_t)a17;
    operator delete(a17);
    v31 = a20;
    if (!a20)
    {
LABEL_3:
      v32 = a23;
      if (!a23) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    v31 = a20;
    if (!a20) {
      goto LABEL_3;
    }
  }
  a21 = (uint64_t)v31;
  operator delete(v31);
  v32 = a23;
  if (!a23)
  {
LABEL_4:
    v33 = __p;
    if (!__p) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_9:
  a24 = (uint64_t)v32;
  operator delete(v32);
  v33 = __p;
  if (!__p)
  {
LABEL_6:

    _Unwind_Resume(a1);
  }
LABEL_5:
  a27 = (uint64_t)v33;
  operator delete(v33);
  goto LABEL_6;
}

uint64_t LivenessActionFromGesture(unint64_t a1)
{
  if (a1 < 0xB && ((0x73Fu >> a1) & 1) != 0) {
    return dword_21F0CB1D4[a1];
  }
  unint64_t v3 = a1;
  if (!___ZL25LivenessActionFromGesture18PADLivenessGesture_block_invoke_2()) {
    return 0xFFFFFFFFLL;
  }
  os_log_t v1 = os_log_create("com.apple.CoreIDV", "RGBLiveness");
  if (!os_log_type_enabled(v1, OS_LOG_TYPE_FAULT))
  {

    return 0xFFFFFFFFLL;
  }
  LivenessActionFromGesture((uint64_t *)&v3, v1);

  return 0xFFFFFFFFLL;
}

void NSArrayAsVector(void *a1, void *a2)
{
  id v3 = a2;
  a1[1] = 0;
  a1[2] = 0;
  *a1 = 0;
  id v8 = v3;
  unint64_t v4 = [v3 count];
  if (v4) {
    std::vector<float>::__append((uint64_t)a1, v4);
  }
  for (unint64_t i = 0; i < [v8 count]; ++i)
  {
    v6 = [v8 objectAtIndexedSubscript:i];
    [v6 floatValue];
    *(_DWORD *)(*a1 + 4 * i) = v7;
  }
}

void sub_21F07FEB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  v12 = *(void **)v10;
  if (*(void *)v10)
  {
    *(void *)(v10 + 8) = v12;
    operator delete(v12);
  }

  _Unwind_Resume(a1);
}

void **std::vector<std::vector<float>>::~vector[abi:ne180100](void **a1)
{
  v2 = (char *)*a1;
  if (*a1)
  {
    id v3 = (char *)a1[1];
    unint64_t v4 = *a1;
    if (v3 != v2)
    {
      v5 = (char *)a1[1];
      do
      {
        int v7 = (void *)*((void *)v5 - 3);
        v5 -= 24;
        v6 = v7;
        if (v7)
        {
          *((void *)v3 - 2) = v6;
          operator delete(v6);
        }
        id v3 = v5;
      }
      while (v5 != v2);
      unint64_t v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

void sub_21F08058C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,uint64_t a27,void *__p,uint64_t a29)
{
  std::vector<std::vector<float>>::~vector[abi:ne180100](&a16);
  if (a19)
  {
    a20 = (uint64_t)a19;
    operator delete(a19);
    v33 = a22;
    if (!a22)
    {
LABEL_3:
      v34 = a25;
      if (!a25) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    v33 = a22;
    if (!a22) {
      goto LABEL_3;
    }
  }
  a23 = (uint64_t)v33;
  operator delete(v33);
  v34 = a25;
  if (!a25)
  {
LABEL_4:
    v35 = __p;
    if (!__p) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_9:
  a26 = (uint64_t)v34;
  operator delete(v34);
  v35 = __p;
  if (!__p)
  {
LABEL_6:

    _Unwind_Resume(a1);
  }
LABEL_5:
  a29 = (uint64_t)v35;
  operator delete(v35);
  goto LABEL_6;
}

void sub_21F0808A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17)
{
  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_21F080988(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21F080AF0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_21F080DB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21F081018(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21F081624(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  if (__p) {
    operator delete(__p);
  }
  std::vector<std::vector<float>>::~vector[abi:ne180100](&a15);

  _Unwind_Resume(a1);
}

id PADVNFaceprintInit(VNFaceObservation *a1)
{
  os_log_t v1 = a1;
  v2 = [(VNFaceObservation *)v1 faceprint];
  uint64_t v3 = [v2 elementCount];

  if (v3)
  {
    unint64_t v4 = [(VNFaceObservation *)v1 faceprint];
    id v5 = [v4 descriptorData];
    v6 = (_DWORD *)[v5 bytes];

    int v7 = [MEMORY[0x263EFF980] arrayWithCapacity:v3];
    do
    {
      LODWORD(v8) = *v6;
      v9 = [NSNumber numberWithFloat:v8];
      [v7 addObject:v9];

      ++v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    uint64_t v10 = os_log_create("com.apple.CoreIDV", "RGBLiveness");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      PADVNFaceprintInit(v10, v11, v12, v13, v14, v15, v16, v17);
    }

    int v7 = 0;
  }

  return v7;
}

void sub_21F081908(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21F081960(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21F081978(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZL25LivenessActionFromGesture18PADLivenessGesture_block_invoke(uint64_t a1)
{
  if (___ZL25LivenessActionFromGesture18PADLivenessGesture_block_invoke_2())
  {
    v2 = os_log_create("com.apple.CoreIDV", "RGBLiveness");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
      ___ZL25LivenessActionFromGesture18PADLivenessGesture_block_invoke_cold_1(a1, v2);
    }
  }
}

uint64_t ___ZL25LivenessActionFromGesture18PADLivenessGesture_block_invoke_2()
{
  if (!os_variant_has_internal_content()) {
    return 0;
  }
  v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  os_log_t v1 = [v0 persistentDomainForName:*MEMORY[0x263F08100]];

  v2 = [v1 objectForKeyedSubscript:@"CIDVPAD.use-verbose-logging"];
  uint64_t v3 = v2;
  if (!v2) {
    v2 = (void *)MEMORY[0x263EFFA80];
  }
  uint64_t v4 = [v2 BOOLValue];

  return v4;
}

void sub_21F081AA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21F081AC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  os_log_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void std::__shared_ptr_emplace<vision::mod::LivenessCheck_Options>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26D0A5C98;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<vision::mod::LivenessCheck_Options>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26D0A5C98;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x223C42A60);
}

void std::__shared_ptr_emplace<vision::mod::LivenessCheckPredictor>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26D0A5CE8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<vision::mod::LivenessCheckPredictor>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26D0A5CE8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x223C42A60);
}

void std::__shared_ptr_emplace<vision::mod::LivenessCheckPredictor>::__on_zero_shared(uint64_t a1)
{
}

void std::vector<float>::__append(uint64_t a1, unint64_t a2)
{
  id v5 = *(char **)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 16);
  v6 = v5;
  if (a2 <= (v4 - (uint64_t)v5) >> 2)
  {
    if (a2)
    {
      bzero(v5, 4 * a2);
      v6 = &v5[4 * a2];
    }
    *(void *)(a1 + 8) = v6;
  }
  else
  {
    int v7 = *(char **)a1;
    uint64_t v8 = (uint64_t)&v5[-*(void *)a1];
    uint64_t v9 = v8 >> 2;
    unint64_t v10 = (v8 >> 2) + a2;
    if (v10 >> 62) {
      std::vector<float>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = v4 - (void)v7;
    if (v11 >> 1 > v10) {
      unint64_t v10 = v11 >> 1;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v12 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v10;
    }
    if (v12)
    {
      if (v12 >> 62) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      uint64_t v13 = operator new(4 * v12);
    }
    else
    {
      uint64_t v13 = 0;
    }
    uint64_t v14 = &v13[4 * v9];
    size_t v15 = 4 * a2;
    uint64_t v16 = &v13[4 * v12];
    bzero(v14, v15);
    uint64_t v17 = &v14[v15];
    if (v5 != v7)
    {
      unint64_t v18 = v5 - v7 - 4;
      if (v18 < 0x2C) {
        goto LABEL_31;
      }
      if ((unint64_t)(v5 - v13 - v8) < 0x20) {
        goto LABEL_31;
      }
      uint64_t v19 = (v18 >> 2) + 1;
      uint64_t v20 = 4 * (v19 & 0x7FFFFFFFFFFFFFF8);
      v6 = &v5[-v20];
      v14 -= v20;
      v21 = &v13[4 * v9 - 16];
      v22 = v5 - 16;
      uint64_t v23 = v19 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        long long v24 = *(_OWORD *)v22;
        *(v21 - 1) = *((_OWORD *)v22 - 1);
        _OWORD *v21 = v24;
        v21 -= 2;
        v22 -= 32;
        v23 -= 8;
      }
      while (v23);
      if (v19 != (v19 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_31:
        do
        {
          int v25 = *((_DWORD *)v6 - 1);
          v6 -= 4;
          *((_DWORD *)v14 - 1) = v25;
          v14 -= 4;
        }
        while (v6 != v7);
      }
    }
    *(void *)a1 = v14;
    *(void *)(a1 + 8) = v17;
    *(void *)(a1 + 16) = v16;
    if (v7)
    {
      operator delete(v7);
    }
  }
}

void std::vector<float>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_264501960, MEMORY[0x263F8C060]);
}

void sub_21F081E14(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void std::vector<std::vector<float>>::__append(uint64_t a1, unint64_t a2)
{
  id v5 = *(void **)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 16);
  if (0xAAAAAAAAAAAAAAABLL * ((v4 - (uint64_t)v5) >> 3) >= a2)
  {
    if (a2)
    {
      size_t v12 = 24 * ((24 * a2 - 24) / 0x18) + 24;
      bzero(*(void **)(a1 + 8), v12);
      id v5 = (void *)((char *)v5 + v12);
    }
    *(void *)(a1 + 8) = v5;
  }
  else
  {
    v6 = *(void **)a1;
    unint64_t v7 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v5 - *(void *)a1) >> 3);
    unint64_t v8 = v7 + a2;
    if (v7 + a2 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<float>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v9 = 0xAAAAAAAAAAAAAAABLL * ((v4 - (uint64_t)v6) >> 3);
    if (2 * v9 > v8) {
      unint64_t v8 = 2 * v9;
    }
    if (v9 >= 0x555555555555555) {
      unint64_t v10 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v10 = v8;
    }
    if (v10)
    {
      if (v10 > 0xAAAAAAAAAAAAAAALL) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      uint64_t v11 = (char *)operator new(24 * v10);
    }
    else
    {
      uint64_t v11 = 0;
    }
    uint64_t v13 = &v11[24 * v7];
    uint64_t v14 = &v11[24 * v10];
    size_t v15 = 24 * ((24 * a2 - 24) / 0x18) + 24;
    bzero(v13, v15);
    uint64_t v16 = &v13[v15];
    if (v5 == v6)
    {
      *(void *)a1 = v13;
      *(void *)(a1 + 8) = v16;
      *(void *)(a1 + 16) = v14;
      if (!v5) {
        return;
      }
      goto LABEL_24;
    }
    do
    {
      uint64_t v17 = v13;
      *((void *)v13 - 2) = 0;
      *((void *)v13 - 1) = 0;
      long long v18 = *(_OWORD *)(v5 - 3);
      v5 -= 3;
      *(_OWORD *)(v13 - 24) = v18;
      v13 -= 24;
      *((void *)v17 - 1) = v5[2];
      void *v5 = 0;
      v5[1] = 0;
      v5[2] = 0;
    }
    while (v5 != v6);
    uint64_t v19 = *(void **)a1;
    id v5 = *(void **)(a1 + 8);
    *(void *)a1 = v13;
    *(void *)(a1 + 8) = v16;
    *(void *)(a1 + 16) = v14;
    if (v5 != v19)
    {
      uint64_t v20 = v5;
      do
      {
        v22 = (void *)*(v20 - 3);
        v20 -= 3;
        v21 = v22;
        if (v22)
        {
          *(v5 - 2) = v21;
          operator delete(v21);
        }
        id v5 = v20;
      }
      while (v20 != v19);
      id v5 = v19;
    }
    if (v5)
    {
LABEL_24:
      operator delete(v5);
    }
  }
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

vision::mod::LivenessCheckPredictor *vision::mod::LivenessCheckPredictor::LivenessCheckPredictor(vision::mod::LivenessCheckPredictor *this, const LivenessCheck_Options *a2)
{
  long long v3 = *(_OWORD *)a2;
  long long v4 = *((_OWORD *)a2 + 2);
  *((_OWORD *)this + 1) = *((_OWORD *)a2 + 1);
  *((_OWORD *)this + 2) = v4;
  *(_OWORD *)this = v3;
  long long v5 = *((_OWORD *)a2 + 3);
  long long v6 = *((_OWORD *)a2 + 4);
  long long v7 = *((_OWORD *)a2 + 6);
  *((_OWORD *)this + 5) = *((_OWORD *)a2 + 5);
  *((_OWORD *)this + 6) = v7;
  *((_OWORD *)this + 3) = v5;
  *((_OWORD *)this + 4) = v6;
  *((_DWORD *)this + 28) = 0;
  *(_OWORD *)((char *)this + 120) = 0u;
  *((_WORD *)this + 58) = 0;
  unint64_t v8 = (void ***)((char *)this + 488);
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 168) = 0u;
  *(_OWORD *)((char *)this + 184) = 0u;
  *(_OWORD *)((char *)this + 200) = 0u;
  *(_OWORD *)((char *)this + 216) = 0u;
  *(_OWORD *)((char *)this + 232) = 0u;
  *(_OWORD *)((char *)this + 248) = 0u;
  *((_DWORD *)this + 74) = 0;
  *(_OWORD *)((char *)this + 264) = 0u;
  *(_OWORD *)((char *)this + 280) = 0u;
  *((void *)this + 61) = 0;
  *((void *)this + 62) = 0;
  *((_DWORD *)this + 128) = 0;
  *((void *)this + 63) = 0;
  *((_DWORD *)this + 130) = 1041865114;
  *((unsigned char *)this + 524) = 0;
  uint64_t v9 = *((int *)a2 + 24);
  *((_DWORD *)this + 76) = v9;
  *((_DWORD *)this + 77) = *((_DWORD *)a2 + 25);
  *((_DWORD *)this + 129) = *((_DWORD *)a2 + 22);
  *((int32x2_t *)this + 66) = vrev64_s32(*(int32x2_t *)((char *)a2 + 104));
  MEMORY[0x223C433C0]((char *)this + 312, v9);
  *((void *)this + 42) = 4 * *((int *)this + 77);
  MEMORY[0x223C433C0]((char *)this + 344, *((int *)this + 76));
  *((void *)this + 46) = 3 * *((int *)this + 77);
  MEMORY[0x223C433C0]((char *)this + 376, *((int *)this + 76));
  *((void *)this + 50) = 12 * *((_DWORD *)this + 77);
  MEMORY[0x223C433C0]((char *)this + 408, *((int *)this + 76));
  *((void *)this + 54) = 12 * *((_DWORD *)this + 77);
  MEMORY[0x223C433C0]((char *)this + 440, *((int *)this + 76));
  *((void *)this + 58) = 12 * *((_DWORD *)this + 77);
  *((_DWORD *)this + 128) = 0;
  unint64_t v10 = *((int *)this + 133);
  unint64_t v11 = *((int *)this + 132);
  size_t v12 = operator new(0xCuLL);
  v32 = v12 + 3;
  v33 = (char *)(v12 + 3);
  *(void *)size_t v12 = 0;
  v12[2] = 0;
  v31 = v12;
  std::vector<std::vector<float>>::vector(&__p, v11, (uint64_t)&v31);
  std::vector<std::vector<std::vector<float>>>::vector(&v36, v10, (uint64_t *)&__p);
  uint64_t v13 = *v8;
  if (*v8)
  {
    uint64_t v14 = (void **)*((void *)this + 62);
    size_t v15 = *v8;
    if (v14 != v13)
    {
      uint64_t v16 = (void **)*((void *)this + 62);
      do
      {
        uint64_t v19 = (char *)*(v16 - 3);
        v16 -= 3;
        long long v18 = v19;
        if (v19)
        {
          uint64_t v20 = (char *)*(v14 - 2);
          uint64_t v17 = v18;
          if (v20 != v18)
          {
            v21 = (char *)*(v14 - 2);
            do
            {
              uint64_t v23 = (void *)*((void *)v21 - 3);
              v21 -= 24;
              v22 = v23;
              if (v23)
              {
                *((void *)v20 - 2) = v22;
                operator delete(v22);
              }
              uint64_t v20 = v21;
            }
            while (v21 != v18);
            uint64_t v17 = *v16;
          }
          *(v14 - 2) = v18;
          operator delete(v17);
        }
        uint64_t v14 = v16;
      }
      while (v16 != v13);
      size_t v15 = *v8;
    }
    *((void *)this + 62) = v13;
    operator delete(v15);
    *unint64_t v8 = 0;
    v8[1] = 0;
    v8[2] = 0;
  }
  *(_OWORD *)unint64_t v8 = v36;
  *((void *)this + 63) = v37;
  uint64_t v37 = 0;
  long long v36 = 0uLL;
  long long v24 = (char *)__p;
  if (__p)
  {
    int v25 = v35;
    v26 = __p;
    if (v35 != __p)
    {
      v27 = v35;
      do
      {
        v29 = (void *)*((void *)v27 - 3);
        v27 -= 24;
        v28 = v29;
        if (v29)
        {
          *((void *)v25 - 2) = v28;
          operator delete(v28);
        }
        int v25 = v27;
      }
      while (v27 != v24);
      v26 = __p;
    }
    v35 = v24;
    operator delete(v26);
  }
  if (v31)
  {
    v32 = v31;
    operator delete(v31);
  }
  return this;
}

void sub_21F082364(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12)
{
  std::vector<std::vector<float>>::~vector[abi:ne180100](&a12);
  if (__p)
  {
    operator delete(__p);
    std::vector<std::vector<std::vector<float>>>::~vector[abi:ne180100](v13);
    uint64_t v16 = (void *)v12[34];
    if (!v16)
    {
LABEL_3:
      uint64_t v17 = (void *)v12[18];
      if (!v17) {
        goto LABEL_4;
      }
      goto LABEL_8;
    }
  }
  else
  {
    std::vector<std::vector<std::vector<float>>>::~vector[abi:ne180100](v13);
    uint64_t v16 = (void *)v12[34];
    if (!v16) {
      goto LABEL_3;
    }
  }
  v12[35] = v16;
  operator delete(v16);
  uint64_t v17 = (void *)v12[18];
  if (!v17)
  {
LABEL_4:
    long long v18 = *v14;
    if (!*v14) {
      goto LABEL_5;
    }
    goto LABEL_9;
  }
LABEL_8:
  v12[19] = v17;
  operator delete(v17);
  long long v18 = *v14;
  if (!*v14) {
LABEL_5:
  }
    _Unwind_Resume(a1);
LABEL_9:
  v12[16] = v18;
  operator delete(v18);
  _Unwind_Resume(a1);
}

void *std::vector<std::vector<std::vector<float>>>::vector(void *a1, unint64_t a2, uint64_t *a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    if (a2 >= 0xAAAAAAAAAAAAAABLL) {
      std::vector<float>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v5 = 3 * a2;
    long long v6 = operator new(24 * a2);
    *a1 = v6;
    a1[1] = v6;
    long long v7 = &v6[v5];
    a1[2] = &v6[v5];
    do
    {
      std::vector<std::vector<float>>::vector(v6, a3);
      v6 += 3;
      v5 -= 3;
    }
    while (v5 * 8);
    a1[1] = v7;
  }
  return a1;
}

void sub_21F0824C0(_Unwind_Exception *exception_object)
{
  if (*v1) {
    std::vector<std::vector<std::vector<float>>>::vector(v1 + 1, *v1, (void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void ***std::vector<std::vector<std::vector<float>>>::~vector[abi:ne180100](void ***a1)
{
  v2 = *a1;
  if (*a1)
  {
    long long v3 = a1[1];
    long long v4 = *a1;
    if (v3 != v2)
    {
      uint64_t v5 = a1[1];
      do
      {
        unint64_t v8 = (char *)*(v5 - 3);
        v5 -= 3;
        long long v7 = v8;
        if (v8)
        {
          uint64_t v9 = (char *)*(v3 - 2);
          long long v6 = v7;
          if (v9 != v7)
          {
            unint64_t v10 = (char *)*(v3 - 2);
            do
            {
              size_t v12 = (void *)*((void *)v10 - 3);
              v10 -= 24;
              unint64_t v11 = v12;
              if (v12)
              {
                *((void *)v9 - 2) = v11;
                operator delete(v11);
              }
              uint64_t v9 = v10;
            }
            while (v10 != v7);
            long long v6 = *v5;
          }
          *(v3 - 2) = v7;
          operator delete(v6);
        }
        long long v3 = v5;
      }
      while (v5 != v2);
      long long v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

void vision::mod::LivenessCheckPredictor::~LivenessCheckPredictor(vision::mod::LivenessCheckPredictor *this)
{
  v2 = (void **)*((void *)this + 61);
  if (v2)
  {
    long long v3 = (void **)*((void *)this + 62);
    long long v4 = (void *)*((void *)this + 61);
    if (v3 != v2)
    {
      uint64_t v5 = (void **)*((void *)this + 62);
      do
      {
        unint64_t v8 = (char *)*(v5 - 3);
        v5 -= 3;
        long long v7 = v8;
        if (v8)
        {
          uint64_t v9 = (char *)*(v3 - 2);
          long long v6 = v7;
          if (v9 != v7)
          {
            unint64_t v10 = (char *)*(v3 - 2);
            do
            {
              size_t v12 = (void *)*((void *)v10 - 3);
              v10 -= 24;
              unint64_t v11 = v12;
              if (v12)
              {
                *((void *)v9 - 2) = v11;
                operator delete(v11);
              }
              uint64_t v9 = v10;
            }
            while (v10 != v7);
            long long v6 = *v5;
          }
          *(v3 - 2) = v7;
          operator delete(v6);
        }
        long long v3 = v5;
      }
      while (v5 != v2);
      long long v4 = (void *)*((void *)this + 61);
    }
    *((void *)this + 62) = v2;
    operator delete(v4);
  }
  uint64_t v13 = (void *)*((void *)this + 34);
  if (v13)
  {
    *((void *)this + 35) = v13;
    operator delete(v13);
  }
  uint64_t v14 = (void *)*((void *)this + 18);
  if (v14)
  {
    *((void *)this + 19) = v14;
    operator delete(v14);
  }
  size_t v15 = (void *)*((void *)this + 15);
  if (v15)
  {
    *((void *)this + 16) = v15;
    operator delete(v15);
  }
}

void *vision::mod::LivenessCheckPredictor::getRaiseEyebrowsReferenceIndex@<X0>(void *this@<X0>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  long long v4 = (unsigned char *)this[18];
  long long v3 = (unsigned char *)this[19];
  int64_t v5 = v3 - v4;
  if (v3 != v4)
  {
    if (v5 < 0) {
      std::vector<float>::__throw_length_error[abi:ne180100]();
    }
    long long v6 = (char *)operator new(v3 - v4);
    *a2 = v6;
    long long v7 = &v6[4 * (v5 >> 2)];
    a2[2] = v7;
    this = memcpy(v6, v4, v5);
    a2[1] = v7;
  }
  return this;
}

void sub_21F082708(_Unwind_Exception *exception_object)
{
  long long v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *vision::mod::LivenessCheckPredictor::getIDmatchingFrameIndex@<X0>(void *this@<X0>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  long long v4 = (unsigned char *)this[15];
  long long v3 = (unsigned char *)this[16];
  int64_t v5 = v3 - v4;
  if (v3 != v4)
  {
    if (v5 < 0) {
      std::vector<float>::__throw_length_error[abi:ne180100]();
    }
    long long v6 = (char *)operator new(v3 - v4);
    *a2 = v6;
    long long v7 = &v6[4 * (v5 >> 2)];
    a2[2] = v7;
    this = memcpy(v6, v4, v5);
    a2[1] = v7;
  }
  return this;
}

void sub_21F082798(_Unwind_Exception *exception_object)
{
  long long v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t vision::mod::LivenessCheckPredictor::getActionFinish(vision::mod::LivenessCheckPredictor *this)
{
  return *((unsigned __int8 *)this + 117);
}

float vision::mod::LivenessCheckPredictor::getNonStitchProb(vision::mod::LivenessCheckPredictor *this)
{
  return *((float *)this + 67);
}

float vision::mod::LivenessCheckPredictor::getIDmatchingScore(vision::mod::LivenessCheckPredictor *this)
{
  return *((float *)this + 74);
}

uint64_t vision::mod::LivenessCheckPredictor::getSpoofType(vision::mod::LivenessCheckPredictor *this)
{
  return *((unsigned int *)this + 75);
}

float vision::mod::LivenessCheckPredictor::Euclidian_distance(vision::mod::LivenessCheckPredictor *this, float a2, float a3, float a4, float a5)
{
  float v5 = (float)(a2 - a4) * (float)(a2 - a4) + (float)(a3 - a5) * (float)(a3 - a5);
  return sqrtf(v5);
}

float vision::mod::LivenessCheckPredictor::computeMouthHeight(uint64_t a1, float32x2_t **a2)
{
  float64x2_t v2 = vcvtq_f64_f32(vsub_f32((*a2)[34], (*a2)[39]));
  *(float *)v2.f64 = vaddvq_f64(vmulq_f64(v2, v2));
  float64x2_t v3 = vcvtq_f64_f32(vsub_f32((*a2)[35], (*a2)[38]));
  *(float *)v3.f64 = vaddvq_f64(vmulq_f64(v3, v3));
  *(float *)v2.f64 = (float)(sqrtf(*(float *)v2.f64) + 0.0) + sqrtf(*(float *)v3.f64);
  float64x2_t v4 = vcvtq_f64_f32(vsub_f32((*a2)[36], (*a2)[37]));
  *(float *)v4.f64 = vaddvq_f64(vmulq_f64(v4, v4));
  v2.f64[0] = (float)(*(float *)v2.f64 + sqrtf(*(float *)v4.f64));
  float64x2_t v5 = vcvtq_f64_f32(vsub_f32((*a2)[33], (*a2)[29]));
  *(float *)v5.f64 = vaddvq_f64(vmulq_f64(v5, v5));
  return v2.f64[0] / (sqrtf(*(float *)v5.f64) * 3.0);
}

float vision::mod::LivenessCheckPredictor::computeEyebrow2EyeHeight(uint64_t a1, float32x2_t **a2)
{
  float64x2_t v2 = vcvtq_f64_f32(vsub_f32((*a2)[1], (*a2)[15]));
  *(float *)v2.f64 = vaddvq_f64(vmulq_f64(v2, v2));
  float64x2_t v3 = vcvtq_f64_f32(vsub_f32((*a2)[2], (*a2)[14]));
  *(float *)v3.f64 = vaddvq_f64(vmulq_f64(v3, v3));
  *(float *)v2.f64 = (float)(sqrtf(*(float *)v2.f64) + 0.0) + sqrtf(*(float *)v3.f64);
  float64x2_t v4 = vcvtq_f64_f32(vsub_f32((*a2)[5], (*a2)[23]));
  *(float *)v4.f64 = vaddvq_f64(vmulq_f64(v4, v4));
  *(float *)v2.f64 = *(float *)v2.f64 + sqrtf(*(float *)v4.f64);
  float64x2_t v5 = vcvtq_f64_f32(vsub_f32((*a2)[6], (*a2)[22]));
  *(float *)v5.f64 = vaddvq_f64(vmulq_f64(v5, v5));
  return (float)(*(float *)v2.f64 + sqrtf(*(float *)v5.f64)) * 0.25;
}

float vision::mod::LivenessCheckPredictor::computeEyeAspectRatio(uint64_t a1, uint64_t a2)
{
  v2.i32[0] = *(_DWORD *)(*(void *)a2 + 72);
  v3.i32[0] = *(_DWORD *)(*(void *)a2 + 76);
  v4.i32[0] = *(_DWORD *)(*(void *)a2 + 120);
  v5.i32[0] = *(_DWORD *)(*(void *)a2 + 124);
  v7.i32[0] = *(_DWORD *)(*(void *)a2 + 88);
  v6.i32[0] = *(_DWORD *)(*(void *)a2 + 92);
  v9.i32[0] = *(_DWORD *)(*(void *)a2 + 112);
  v8.i32[0] = *(_DWORD *)(*(void *)a2 + 116);
  v11.i32[0] = *(_DWORD *)(*(void *)a2 + 64);
  v10.i32[0] = *(_DWORD *)(*(void *)a2 + 68);
  v13.i32[0] = *(_DWORD *)(*(void *)a2 + 104);
  v12.i32[0] = *(_DWORD *)(*(void *)a2 + 108);
  v2.i32[1] = *(_DWORD *)(*(void *)a2 + 136);
  v4.i32[1] = *(_DWORD *)(*(void *)a2 + 184);
  v3.i32[1] = *(_DWORD *)(*(void *)a2 + 140);
  v5.i32[1] = *(_DWORD *)(*(void *)a2 + 188);
  float64x2_t v14 = vcvtq_f64_f32(vsub_f32(v2, v4));
  float64x2_t v15 = vcvtq_f64_f32(vsub_f32(v3, v5));
  v7.i32[1] = *(_DWORD *)(*(void *)a2 + 152);
  v9.i32[1] = *(_DWORD *)(*(void *)a2 + 168);
  v6.i32[1] = *(_DWORD *)(*(void *)a2 + 156);
  v8.i32[1] = *(_DWORD *)(*(void *)a2 + 172);
  float32x2_t v16 = vsub_f32(v6, v8);
  float64x2_t v17 = vcvtq_f64_f32(vsub_f32(v7, v9));
  float64x2_t v18 = vcvtq_f64_f32(v16);
  v11.i32[1] = *(_DWORD *)(*(void *)a2 + 128);
  v13.i32[1] = *(_DWORD *)(*(void *)a2 + 160);
  v10.i32[1] = *(_DWORD *)(*(void *)a2 + 132);
  v12.i32[1] = *(_DWORD *)(*(void *)a2 + 164);
  float32x2_t v19 = vsub_f32(v10, v12);
  float64x2_t v20 = vcvtq_f64_f32(vsub_f32(v11, v13));
  float64x2_t v21 = vcvtq_f64_f32(v19);
  float64x2_t v22 = vcvtq_f64_f32(vsqrt_f32(vcvt_f32_f64(vaddq_f64(vmulq_f64(v20, v20), vmulq_f64(v21, v21)))));
  return vaddv_f32(vcvt_f32_f64(vdivq_f64(vcvtq_f64_f32(vadd_f32(vadd_f32(vsqrt_f32(vcvt_f32_f64(vaddq_f64(vmulq_f64(v14, v14), vmulq_f64(v15, v15)))), 0), vsqrt_f32(vcvt_f32_f64(vaddq_f64(vmulq_f64(v17, v17), vmulq_f64(v18, v18)))))), vmaxnmq_f64(vaddq_f64(v22, v22), (float64x2_t)vdupq_n_s64(0x3DDB7CDFD9D7BDBBuLL)))))* 0.5;
}

uint64_t vision::mod::LivenessCheckPredictor::getMaxAngle(vision::mod::LivenessCheckPredictor *this, float a2, float a3, float a4)
{
  float v4 = fabsf(a2);
  float v5 = fabsf(a3);
  float v6 = fabsf(a4);
  if (v4 > v5)
  {
    BOOL v7 = v4 == v6;
    BOOL v8 = v4 < v6;
  }
  else
  {
    BOOL v7 = 1;
    BOOL v8 = 0;
  }
  if (!v8 && !v7) {
    return 0;
  }
  if (v5 > v4)
  {
    BOOL v9 = v5 == v6;
    BOOL v10 = v5 < v6;
  }
  else
  {
    BOOL v9 = 1;
    BOOL v10 = 0;
  }
  if (!v10 && !v9) {
    return 1;
  }
  if (v6 > v5)
  {
    BOOL v11 = v6 == v4;
    BOOL v12 = v6 < v4;
  }
  else
  {
    BOOL v11 = 1;
    BOOL v12 = 0;
  }
  if (v12 || v11) {
    return 0;
  }
  else {
    return 2;
  }
}

uint64_t vision::mod::LivenessCheckPredictor::runStitchDetector(vision::mod::LivenessCheckPredictor *this, const vImage_Buffer *src, BOOL *a3, float *a4, int a5)
{
  BOOL v9 = (const vImage_Buffer *)((char *)this + 312);
  vImageScale_ARGB8888(src, (const vImage_Buffer *)((char *)this + 312), 0, 8u);
  vImageConvert_RGBA8888toRGB888(v9, (const vImage_Buffer *)((char *)this + 344), 0x100u);
  *((void *)this + 45) *= 3;
  *((void *)this + 49) *= 3;
  vImageConvert_Planar8toPlanarF((const vImage_Buffer *)((char *)this + 344), (const vImage_Buffer *)((char *)this + 376), 255.0, 0.0, 0x100u);
  *((void *)this + 45) /= 3uLL;
  *((void *)this + 49) /= 3uLL;
  uint64_t __StandardDeviation = 0;
  vDSP_normalize(*((const float **)this + 47), 1, *((float **)this + 4 * *((unsigned __int8 *)this + 524) + 51), 1, (float *)&__StandardDeviation + 1, (float *)&__StandardDeviation, 3 * *((_DWORD *)this + 77) * *((_DWORD *)this + 76));
  float __C = 0.0;
  unint64_t v10 = *((int *)this + 133);
  uint64_t v11 = *((int *)this + 132);
  v50 = 0;
  v51 = 0;
  __p = 0;
  if (v11)
  {
    if ((v11 & 0x80000000) != 0) {
      std::vector<float>::__throw_length_error[abi:ne180100]();
    }
    __p = operator new(4 * v11);
    v51 = (char *)__p + 4 * v11;
    bzero(__p, 4 * v11);
    v50 = v51;
  }
  std::vector<std::vector<float>>::vector(&v52, v10, (uint64_t)&__p);
  if (__p)
  {
    v50 = __p;
    operator delete(__p);
  }
  int v12 = *((_DWORD *)this + 76);
  float v13 = 0.0;
  if (v12 >= 1)
  {
    LODWORD(v14) = *((_DWORD *)this + 132);
    if ((int)v14 >= 1)
    {
      for (int i = 0; i < v12; ++i)
      {
        if ((int)v14 >= 1)
        {
          int v16 = 0;
          uint64_t v17 = 0;
          do
          {
            int v18 = *((_DWORD *)this + 77);
            vDSP_dotpr((const float *)(*((void *)this + 51) + 4 * 3 * i * v18 + 4 * (v16 * v18 / (int)v14)), 1, (const float *)(*((void *)this + 55) + 4 * 3 * i * v18 + 4 * (v16 * v18 / (int)v14)), 1, &__C, 3 * v18 / (int)v14);
            int v12 = *((_DWORD *)this + 76);
            uint64_t v19 = *((void *)v52 + 3 * (*((_DWORD *)this + 133) * i / v12));
            *(float *)(v19 + 4 * v17) = __C + *(float *)(v19 + 4 * v17);
            float v13 = v13 + __C;
            ++v17;
            uint64_t v14 = *((int *)this + 132);
            v16 += 3;
          }
          while (v17 < v14);
        }
      }
    }
  }
  uint64_t v20 = *((unsigned int *)this + 133);
  if ((int)v20 >= 1)
  {
    uint64_t v21 = *((unsigned int *)this + 132);
    if ((int)v21 >= 1)
    {
      uint64_t v22 = 0;
      uint64_t v23 = v52;
      uint64_t v24 = *((void *)this + 61);
      float v25 = (float)(3 * v12 * *((_DWORD *)this + 77) / (int)v21 / (int)v20);
      do
      {
        v26 = *(void ***)(v24 + 24 * v22);
        v27 = (_DWORD *)v23[3 * v22];
        uint64_t v28 = v21;
        do
        {
          v30 = *v26;
          v26 += 3;
          v29 = (float *)v30;
          void *v30 = *(void *)((char *)v30 + 4);
          LODWORD(v30) = *v27++;
          v29[2] = *(float *)&v30 / v25;
          --v28;
        }
        while (v28);
        ++v22;
      }
      while (v22 != v20);
    }
  }
  float v31 = *((float *)this + 119);
  *((float *)this + 118) = v31;
  float v32 = *((float *)this + 120);
  *((float *)this + 119) = v32;
  float v33 = v13 / (float)(3 * v12 * *((_DWORD *)this + 77));
  *((float *)this + 120) = v33;
  int v34 = *((_DWORD *)this + 128);
  *((_DWORD *)this + 128) = v34 + 1;
  if (v34 < 3)
  {
    *a3 = 0;
    *((unsigned char *)this + 524) ^= 1u;
    v42 = (char *)v52;
    if (!v52) {
      return 0;
    }
    goto LABEL_35;
  }
  float v35 = 0.0;
  if ((int)v20 >= 1 && *((int *)this + 132) >= 1)
  {
    for (uint64_t j = 0; j != v20; ++j)
    {
      uint64_t v37 = *(float ***)(*((void *)this + 61) + 24 * j);
      uint64_t v38 = *((unsigned int *)this + 132);
      do
      {
        v39 = *v37;
        v37 += 3;
        float v40 = (float)(*v39 + (float)(v39[1] * -2.0)) + v39[2];
        if (v40 > v35) {
          float v35 = v40;
        }
        --v38;
      }
      while (v38);
    }
  }
  if (a5)
  {
    float v41 = *((float *)this + 129);
  }
  else
  {
    float v35 = (float)(v31 + (float)(v32 * -2.0)) + v33;
    float v41 = *((float *)this + 130);
  }
  *a3 = v35 >= v41;
  *a4 = v35;
  *((unsigned char *)this + 524) ^= 1u;
  v42 = (char *)v52;
  if (v52)
  {
LABEL_35:
    v43 = v53;
    v44 = v42;
    if (v53 != v42)
    {
      v45 = v53;
      do
      {
        v47 = (void *)*((void *)v45 - 3);
        v45 -= 24;
        v46 = v47;
        if (v47)
        {
          *((void *)v43 - 2) = v46;
          operator delete(v46);
        }
        v43 = v45;
      }
      while (v45 != v42);
      v44 = v52;
    }
    v53 = v42;
    operator delete(v44);
  }
  return 0;
}

void sub_21F082EDC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_21F082EFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  std::vector<std::vector<float>>::~vector[abi:ne180100]((void **)va);
  _Unwind_Resume(a1);
}

uint64_t vision::mod::LivenessCheckPredictor::processFacePoseData(uint64_t a1, uint64_t a2, uint64_t *a3, void *a4, void *a5, void *a6, int *a7)
{
  uint64_t v7 = *(void *)(a1 + 120);
  v113 = (void **)(a1 + 120);
  *(_WORD *)(a1 + 116) = 0;
  *(void *)(a1 + 128) = v7;
  v108 = (void **)(a1 + 144);
  *(void *)(a1 + 152) = *(void *)(a1 + 144);
  *(_DWORD *)(a1 + 4 * *a7 + 208) = 0;
  uint64_t v8 = *a3;
  if (a3[1] != *a3)
  {
    uint64_t v11 = a5;
    int v12 = a4;
    unint64_t v15 = 0;
    while (1)
    {
      uint64_t v16 = *a7;
      uint64_t v17 = a1 + 4 * v16;
      int v20 = *(_DWORD *)(v17 + 208);
      int v18 = (_DWORD *)(v17 + 208);
      int v19 = v20;
      if (v20 <= 1
        && fabsf(*(float *)(v8 + 4 * v15)) < 10.0
        && fabsf(*(float *)(*v11 + 4 * v15)) < 10.0
        && fabsf(*(float *)(*v12 + 4 * v15)) < 10.0)
      {
        break;
      }
LABEL_36:
      if (v16 != 9) {
        goto LABEL_4;
      }
      if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a6[1] - *a6) >> 3) <= v15) {
        goto LABEL_4;
      }
      uint64_t v50 = *a6 + 24 * v15;
      v52 = *(const void **)v50;
      uint64_t v51 = *(void *)(v50 + 8);
      if (v51 == *(void *)v50) {
        goto LABEL_4;
      }
      int v53 = *(_DWORD *)(a1 + 256);
      if (v53 > 9) {
        goto LABEL_4;
      }
      if (fabsf(*(float *)(*a3 + 4 * v15)) >= 10.0
        || fabsf(*(float *)(*v11 + 4 * v15)) >= 5.0
        || fabsf(*(float *)(*v12 + 4 * v15)) >= 5.0)
      {
        if (v53) {
          goto LABEL_4;
        }
        int v33 = *(_DWORD *)(a1 + 260);
        if (v33 > 4) {
          goto LABEL_4;
        }
        if (v33)
        {
          float v34 = *(float *)(a1 + 252);
          size_t v35 = v51 - (void)v52;
          if (v51 - (uint64_t)v52 < 0) {
            std::vector<float>::__throw_length_error[abi:ne180100]();
          }
          long long v36 = (float32x2_t *)operator new(v51 - (void)v52);
          memcpy(v36, v52, v35);
          float64x2_t v37 = vcvtq_f64_f32(vsub_f32(v36[1], v36[15]));
          *(float *)v37.f64 = vaddvq_f64(vmulq_f64(v37, v37));
          float64x2_t v38 = vcvtq_f64_f32(vsub_f32(v36[2], v36[14]));
          *(float *)v38.f64 = vaddvq_f64(vmulq_f64(v38, v38));
          *(float *)v37.f64 = (float)(sqrtf(*(float *)v37.f64) + 0.0) + sqrtf(*(float *)v38.f64);
          float64x2_t v39 = vcvtq_f64_f32(vsub_f32(v36[5], v36[23]));
          *(float *)v39.f64 = vaddvq_f64(vmulq_f64(v39, v39));
          *(float *)v37.f64 = *(float *)v37.f64 + sqrtf(*(float *)v39.f64);
          float64x2_t v40 = vcvtq_f64_f32(vsub_f32(v36[6], v36[22]));
          *(float *)v40.f64 = vaddvq_f64(vmulq_f64(v40, v40));
          *(float *)(a1 + 252) = fminf(v34, (float)(*(float *)v37.f64 + sqrtf(*(float *)v40.f64)) * 0.25);
        }
        else
        {
          size_t v61 = v51 - (void)v52;
          if (v51 - (uint64_t)v52 < 0) {
            std::vector<float>::__throw_length_error[abi:ne180100]();
          }
          long long v36 = (float32x2_t *)operator new(v51 - (void)v52);
          memcpy(v36, v52, v61);
          float64x2_t v62 = vcvtq_f64_f32(vsub_f32(v36[1], v36[15]));
          *(float *)v62.f64 = vaddvq_f64(vmulq_f64(v62, v62));
          float64x2_t v63 = vcvtq_f64_f32(vsub_f32(v36[2], v36[14]));
          *(float *)v63.f64 = vaddvq_f64(vmulq_f64(v63, v63));
          *(float *)v62.f64 = (float)(sqrtf(*(float *)v62.f64) + 0.0) + sqrtf(*(float *)v63.f64);
          float64x2_t v64 = vcvtq_f64_f32(vsub_f32(v36[5], v36[23]));
          *(float *)v64.f64 = vaddvq_f64(vmulq_f64(v64, v64));
          *(float *)v62.f64 = *(float *)v62.f64 + sqrtf(*(float *)v64.f64);
          float64x2_t v65 = vcvtq_f64_f32(vsub_f32(v36[6], v36[22]));
          *(float *)v65.f64 = vaddvq_f64(vmulq_f64(v65, v65));
          *(float *)(a1 + 252) = (float)(*(float *)v62.f64 + sqrtf(*(float *)v65.f64)) * 0.25;
        }
        operator delete(v36);
        ++*(_DWORD *)(a1 + 260);
        v67 = *(char **)(a1 + 152);
        unint64_t v66 = *(void *)(a1 + 160);
        if ((unint64_t)v67 >= v66)
        {
          v68 = (char *)*v108;
          uint64_t v69 = v67 - (unsigned char *)*v108;
          uint64_t v70 = v69 >> 2;
          unint64_t v71 = (v69 >> 2) + 1;
          if (v71 >> 62) {
            goto LABEL_95;
          }
          uint64_t v72 = v66 - (void)v68;
          if (v72 >> 1 > v71) {
            unint64_t v71 = v72 >> 1;
          }
          if ((unint64_t)v72 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v71 = 0x3FFFFFFFFFFFFFFFLL;
          }
          unint64_t v110 = v71;
          if (v71)
          {
            if (v71 >> 62) {
              goto LABEL_94;
            }
            v73 = operator new(4 * v71);
            v74 = &v73[4 * v70];
            _DWORD *v74 = v15;
            uint64_t v75 = (uint64_t)(v74 + 1);
            if (v67 != v68)
            {
LABEL_57:
              unint64_t v76 = v67 - 4 - v68;
              unint64_t v77 = v110;
              if (v76 < 0x2C) {
                goto LABEL_102;
              }
              if ((unint64_t)(v67 - &v73[v69]) < 0x20) {
                goto LABEL_102;
              }
              uint64_t v78 = (v76 >> 2) + 1;
              uint64_t v79 = 4 * (v78 & 0x7FFFFFFFFFFFFFF8);
              v80 = &v67[-v79];
              v74 = (_DWORD *)((char *)v74 - v79);
              v81 = &v73[4 * v70 - 16];
              v82 = v67 - 16;
              uint64_t v83 = v78 & 0x7FFFFFFFFFFFFFF8;
              do
              {
                long long v84 = *(_OWORD *)v82;
                *(v81 - 1) = *((_OWORD *)v82 - 1);
                _OWORD *v81 = v84;
                v81 -= 2;
                v82 -= 32;
                v83 -= 8;
              }
              while (v83);
              v67 = v80;
              if (v78 != (v78 & 0x7FFFFFFFFFFFFFF8))
              {
LABEL_102:
                do
                {
                  int v85 = *((_DWORD *)v67 - 1);
                  v67 -= 4;
                  *--v74 = v85;
                }
                while (v67 != v68);
              }
LABEL_79:
              *(void *)(a1 + 144) = v74;
              *(void *)(a1 + 152) = v75;
              *(void *)(a1 + 160) = &v73[4 * v77];
              if (v68) {
LABEL_80:
              }
                operator delete(v68);
LABEL_81:
              uint64_t v11 = a5;
              goto LABEL_82;
            }
          }
          else
          {
            v73 = 0;
            v74 = (_DWORD *)(4 * v70);
            *(_DWORD *)(4 * v70) = v15;
            uint64_t v75 = 4 * v70 + 4;
            if (v67 != v68) {
              goto LABEL_57;
            }
          }
          unint64_t v77 = v110;
          goto LABEL_79;
        }
      }
      else
      {
        if (v53)
        {
          float v54 = *(float *)(a1 + 248);
          size_t v55 = v51 - (void)v52;
          if (v51 - (uint64_t)v52 < 0) {
            std::vector<float>::__throw_length_error[abi:ne180100]();
          }
          v56 = (float32x2_t *)operator new(v51 - (void)v52);
          memcpy(v56, v52, v55);
          float64x2_t v57 = vcvtq_f64_f32(vsub_f32(v56[1], v56[15]));
          *(float *)v57.f64 = vaddvq_f64(vmulq_f64(v57, v57));
          float64x2_t v58 = vcvtq_f64_f32(vsub_f32(v56[2], v56[14]));
          *(float *)v58.f64 = vaddvq_f64(vmulq_f64(v58, v58));
          *(float *)v57.f64 = (float)(sqrtf(*(float *)v57.f64) + 0.0) + sqrtf(*(float *)v58.f64);
          float64x2_t v59 = vcvtq_f64_f32(vsub_f32(v56[5], v56[23]));
          *(float *)v59.f64 = vaddvq_f64(vmulq_f64(v59, v59));
          *(float *)v57.f64 = *(float *)v57.f64 + sqrtf(*(float *)v59.f64);
          float64x2_t v60 = vcvtq_f64_f32(vsub_f32(v56[6], v56[22]));
          *(float *)v60.f64 = vaddvq_f64(vmulq_f64(v60, v60));
          *(float *)(a1 + 248) = fminf(v54, (float)(*(float *)v57.f64 + sqrtf(*(float *)v60.f64)) * 0.25);
        }
        else
        {
          size_t v86 = v51 - (void)v52;
          if (v51 - (uint64_t)v52 < 0) {
            std::vector<float>::__throw_length_error[abi:ne180100]();
          }
          v56 = (float32x2_t *)operator new(v51 - (void)v52);
          memcpy(v56, v52, v86);
          float64x2_t v87 = vcvtq_f64_f32(vsub_f32(v56[1], v56[15]));
          *(float *)v87.f64 = vaddvq_f64(vmulq_f64(v87, v87));
          float64x2_t v88 = vcvtq_f64_f32(vsub_f32(v56[2], v56[14]));
          *(float *)v88.f64 = vaddvq_f64(vmulq_f64(v88, v88));
          *(float *)v87.f64 = (float)(sqrtf(*(float *)v87.f64) + 0.0) + sqrtf(*(float *)v88.f64);
          float64x2_t v89 = vcvtq_f64_f32(vsub_f32(v56[5], v56[23]));
          *(float *)v89.f64 = vaddvq_f64(vmulq_f64(v89, v89));
          *(float *)v87.f64 = *(float *)v87.f64 + sqrtf(*(float *)v89.f64);
          float64x2_t v90 = vcvtq_f64_f32(vsub_f32(v56[6], v56[22]));
          *(float *)v90.f64 = vaddvq_f64(vmulq_f64(v90, v90));
          *(float *)(a1 + 248) = (float)(*(float *)v87.f64 + sqrtf(*(float *)v90.f64)) * 0.25;
        }
        operator delete(v56);
        ++*(_DWORD *)(a1 + 256);
        v67 = *(char **)(a1 + 152);
        unint64_t v91 = *(void *)(a1 + 160);
        if ((unint64_t)v67 >= v91)
        {
          v68 = (char *)*v108;
          uint64_t v92 = v67 - (unsigned char *)*v108;
          uint64_t v93 = v92 >> 2;
          unint64_t v94 = (v92 >> 2) + 1;
          if (v94 >> 62) {
LABEL_95:
          }
            std::vector<float>::__throw_length_error[abi:ne180100]();
          uint64_t v95 = v91 - (void)v68;
          if (v95 >> 1 > v94) {
            unint64_t v94 = v95 >> 1;
          }
          if ((unint64_t)v95 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v94 = 0x3FFFFFFFFFFFFFFFLL;
          }
          unint64_t v111 = v94;
          if (v94)
          {
            if (v94 >> 62) {
LABEL_94:
            }
              std::__throw_bad_array_new_length[abi:ne180100]();
            v96 = operator new(4 * v94);
            v97 = &v96[4 * v93];
            _DWORD *v97 = v15;
            uint64_t v75 = (uint64_t)(v97 + 1);
            if (v67 == v68)
            {
LABEL_90:
              *(void *)(a1 + 144) = v97;
              *(void *)(a1 + 152) = v75;
              *(void *)(a1 + 160) = &v96[4 * v111];
              if (v68) {
                goto LABEL_80;
              }
              goto LABEL_81;
            }
          }
          else
          {
            v96 = 0;
            v97 = (_DWORD *)(4 * v93);
            *(_DWORD *)(4 * v93) = v15;
            uint64_t v75 = 4 * v93 + 4;
            if (v67 == v68) {
              goto LABEL_90;
            }
          }
          unint64_t v98 = v67 - 4 - v68;
          if (v98 < 0x2C) {
            goto LABEL_103;
          }
          if ((unint64_t)(v67 - &v96[v92]) < 0x20) {
            goto LABEL_103;
          }
          uint64_t v99 = (v98 >> 2) + 1;
          uint64_t v100 = 4 * (v99 & 0x7FFFFFFFFFFFFFF8);
          v101 = &v67[-v100];
          v97 = (_DWORD *)((char *)v97 - v100);
          v102 = &v96[4 * v93 - 16];
          v103 = v67 - 16;
          uint64_t v104 = v99 & 0x7FFFFFFFFFFFFFF8;
          do
          {
            long long v105 = *(_OWORD *)v103;
            *(v102 - 1) = *((_OWORD *)v103 - 1);
            _OWORD *v102 = v105;
            v102 -= 2;
            v103 -= 32;
            v104 -= 8;
          }
          while (v104);
          v67 = v101;
          if (v99 != (v99 & 0x7FFFFFFFFFFFFFF8))
          {
LABEL_103:
            do
            {
              int v106 = *((_DWORD *)v67 - 1);
              v67 -= 4;
              *--v97 = v106;
            }
            while (v67 != v68);
          }
          goto LABEL_90;
        }
      }
      *(_DWORD *)v67 = v15;
      uint64_t v75 = (uint64_t)(v67 + 4);
LABEL_82:
      *(void *)(a1 + 152) = v75;
      int v12 = a4;
LABEL_4:
      ++v15;
      uint64_t v8 = *a3;
      if (v15 >= (a3[1] - *a3) >> 2) {
        return 0;
      }
    }
    _DWORD *v18 = v19 + 1;
    uint64_t v22 = *(char **)(a1 + 128);
    unint64_t v21 = *(void *)(a1 + 136);
    if ((unint64_t)v22 < v21)
    {
      *(_DWORD *)uint64_t v22 = v15;
      uint64_t v23 = (uint64_t)(v22 + 4);
LABEL_35:
      *(void *)(a1 + 128) = v23;
      LODWORD(v16) = *a7;
      goto LABEL_36;
    }
    uint64_t v24 = (char *)*v113;
    uint64_t v25 = v22 - (unsigned char *)*v113;
    uint64_t v26 = v25 >> 2;
    unint64_t v27 = (v25 >> 2) + 1;
    if (v27 >> 62) {
      std::vector<float>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v28 = v21 - (void)v24;
    if (v28 >> 1 > v27) {
      unint64_t v27 = v28 >> 1;
    }
    if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v27 = 0x3FFFFFFFFFFFFFFFLL;
    }
    unint64_t v109 = v27;
    if (v27)
    {
      if (v27 >> 62) {
        goto LABEL_94;
      }
      v29 = operator new(4 * v27);
      v30 = &v29[4 * v26];
      _DWORD *v30 = v15;
      uint64_t v23 = (uint64_t)(v30 + 1);
      if (v22 != v24) {
        goto LABEL_19;
      }
    }
    else
    {
      v29 = 0;
      v30 = (_DWORD *)(4 * v26);
      *(_DWORD *)(4 * v26) = v15;
      uint64_t v23 = 4 * v26 + 4;
      if (v22 != v24)
      {
LABEL_19:
        unint64_t v31 = v22 - 4 - v24;
        unint64_t v32 = v109;
        if (v31 >= 0x2C)
        {
          unint64_t v41 = v22 - &v29[v25];
          int v12 = a4;
          if (v41 >= 0x20)
          {
            uint64_t v42 = (v31 >> 2) + 1;
            uint64_t v43 = 4 * (v42 & 0x7FFFFFFFFFFFFFF8);
            v44 = &v22[-v43];
            v30 = (_DWORD *)((char *)v30 - v43);
            v45 = &v29[4 * v26 - 16];
            v46 = v22 - 16;
            uint64_t v47 = v42 & 0x7FFFFFFFFFFFFFF8;
            do
            {
              long long v48 = *(_OWORD *)v46;
              *(v45 - 1) = *((_OWORD *)v46 - 1);
              _OWORD *v45 = v48;
              v45 -= 2;
              v46 -= 32;
              v47 -= 8;
            }
            while (v47);
            uint64_t v22 = v44;
            if (v42 == (v42 & 0x7FFFFFFFFFFFFFF8)) {
              goto LABEL_32;
            }
          }
        }
        else
        {
          int v12 = a4;
        }
        do
        {
          int v49 = *((_DWORD *)v22 - 1);
          v22 -= 4;
          *--v30 = v49;
        }
        while (v22 != v24);
LABEL_32:
        *(void *)(a1 + 120) = v30;
        *(void *)(a1 + 128) = v23;
        *(void *)(a1 + 136) = &v29[4 * v32];
        if (v24) {
          operator delete(v24);
        }
        uint64_t v11 = a5;
        goto LABEL_35;
      }
    }
    int v12 = a4;
    unint64_t v32 = v109;
    goto LABEL_32;
  }
  return 0;
}

void sub_21F083850(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *__p,uint64_t a24)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<float>::vector(void *a1, uint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  float v4 = *(const void **)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  int64_t v5 = v3 - *(void *)a2;
  if (v3 != *(void *)a2)
  {
    if (v5 < 0) {
      std::vector<float>::__throw_length_error[abi:ne180100]();
    }
    float v6 = (char *)operator new(v3 - *(void *)a2);
    *a1 = v6;
    a1[1] = v6;
    uint64_t v7 = &v6[4 * (v5 >> 2)];
    a1[2] = v7;
    memcpy(v6, v4, v5);
    a1[1] = v7;
  }
  return a1;
}

void sub_21F083920(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t vision::mod::LivenessCheckPredictor::runFaceActionClassification(char *a1, void *a2, uint64_t *a3, void *a4, void *a5, uint64_t *a6, int *a7)
{
  uint64_t v8 = *((void *)a1 + 15);
  v164 = (void **)(a1 + 120);
  *((_WORD *)a1 + 58) = 0;
  *((void *)a1 + 16) = v8;
  *((void *)a1 + 19) = *((void *)a1 + 18);
  *(_DWORD *)&a1[4 * *a7 + 208] = 0;
  uint64_t v9 = *a3;
  if (a3[1] == *a3)
  {
LABEL_186:
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x263F8C100], (uint64_t)"Buffer Processed for SIML gesture ", 34);
    v155 = (void *)std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v155, (uint64_t)", max action consecutive: ", 26);
    v156 = (void *)std::ostream::operator<<();
    std::ios_base::getloc((const std::ios_base *)((char *)v156 + *(void *)(*v156 - 24)));
    v157 = std::locale::use_facet(&v188, MEMORY[0x263F8C108]);
    ((void (*)(const std::locale::facet *, uint64_t))v157->__vftable[2].~facet_0)(v157, 10);
    std::locale::~locale(&v188);
    std::ostream::put();
    std::ostream::flush();
    return 0;
  }
  unint64_t v10 = a6;
  uint64_t v11 = a5;
  float v13 = a1;
  v159 = (void **)(a1 + 144);
  unint64_t v14 = 0;
  int v15 = 0;
  v166 = a4;
  while (2)
  {
    uint64_t v16 = *a7;
    uint64_t v17 = &v13[4 * v16];
    int v20 = *((_DWORD *)v17 + 52);
    int v18 = v17 + 208;
    int v19 = v20;
    if (v20 <= 1
      && fabsf(*(float *)(v9 + 4 * v14)) < 10.0
      && fabsf(*(float *)(*v11 + 4 * v14)) < 10.0
      && fabsf(*(float *)(*a4 + 4 * v14)) < 10.0)
    {
      _DWORD *v18 = v19 + 1;
      uint64_t v22 = (char *)*((void *)v13 + 16);
      unint64_t v21 = *((void *)v13 + 17);
      if ((unint64_t)v22 < v21)
      {
        *(_DWORD *)uint64_t v22 = v14;
        uint64_t v23 = (uint64_t)(v22 + 4);
LABEL_29:
        *((void *)v13 + 16) = v23;
        LODWORD(v16) = *a7;
        goto LABEL_30;
      }
      int v162 = v15;
      uint64_t v24 = (char *)*v164;
      uint64_t v25 = v22 - (unsigned char *)*v164;
      uint64_t v26 = v25 >> 2;
      unint64_t v27 = (v25 >> 2) + 1;
      if (v27 >> 62) {
        std::vector<float>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v28 = v21 - (void)v24;
      if (v28 >> 1 > v27) {
        unint64_t v27 = v28 >> 1;
      }
      if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v29 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v29 = v27;
      }
      if (v29)
      {
        if (v29 >> 62) {
          goto LABEL_189;
        }
        a1 = (char *)operator new(4 * v29);
        a4 = v166;
        v30 = &a1[4 * v26];
        *(_DWORD *)v30 = v14;
        uint64_t v23 = (uint64_t)(v30 + 4);
        if (v22 == v24) {
          goto LABEL_26;
        }
      }
      else
      {
        a1 = 0;
        v30 = (char *)(4 * v26);
        *(_DWORD *)(4 * v26) = v14;
        uint64_t v23 = 4 * v26 + 4;
        if (v22 == v24)
        {
LABEL_26:
          *((void *)v13 + 15) = v30;
          *((void *)v13 + 16) = v23;
          *((void *)v13 + 17) = &a1[4 * v29];
          if (v24)
          {
            operator delete(v24);
            a4 = v166;
          }
          int v15 = v162;
          unint64_t v10 = a6;
          uint64_t v11 = a5;
          goto LABEL_29;
        }
      }
      unint64_t v31 = v22 - 4 - v24;
      if (v31 < 0x2C) {
        goto LABEL_199;
      }
      if ((unint64_t)(v22 - &a1[v25]) < 0x20) {
        goto LABEL_199;
      }
      uint64_t v32 = (v31 >> 2) + 1;
      uint64_t v33 = 4 * (v32 & 0x7FFFFFFFFFFFFFF8);
      float v34 = &v22[-v33];
      v30 -= v33;
      size_t v35 = &a1[4 * v26 - 16];
      long long v36 = v22 - 16;
      uint64_t v37 = v32 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        long long v38 = *(_OWORD *)v36;
        *((_OWORD *)v35 - 1) = *((_OWORD *)v36 - 1);
        *(_OWORD *)size_t v35 = v38;
        v35 -= 32;
        v36 -= 32;
        v37 -= 8;
      }
      while (v37);
      uint64_t v22 = v34;
      if (v32 != (v32 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_199:
        do
        {
          int v39 = *((_DWORD *)v22 - 1);
          v22 -= 4;
          *((_DWORD *)v30 - 1) = v39;
          v30 -= 4;
        }
        while (v22 != v24);
      }
      goto LABEL_26;
    }
LABEL_30:
    switch((int)v16)
    {
      case 0:
        float v40 = *(float *)(*a4 + 4 * v14);
        if (v40 <= *((float *)v13 + 1)) {
          goto LABEL_183;
        }
        goto LABEL_70;
      case 1:
        float v40 = *(float *)(*a4 + 4 * v14);
        if (v40 >= *(float *)v13) {
          goto LABEL_183;
        }
LABEL_70:
        float v67 = fabsf(*(float *)(*v11 + 4 * v14));
        float v68 = fabsf(*(float *)(*a3 + 4 * v14));
        float v69 = fabsf(v40);
        if (v67 <= v69 || v67 <= v68)
        {
          BOOL v71 = v68 <= v67 || v68 <= v69;
          BOOL v72 = !v71 || v69 <= v67;
          if (!v72 && v69 > v68) {
            goto LABEL_100;
          }
        }
        goto LABEL_183;
      case 2:
        float v52 = *(float *)(*a3 + 4 * v14);
        if (v52 >= *((float *)v13 + 2)) {
          goto LABEL_183;
        }
        goto LABEL_49;
      case 3:
        float v52 = *(float *)(*a3 + 4 * v14);
        if (v52 <= *((float *)v13 + 3)) {
          goto LABEL_183;
        }
LABEL_49:
        float v53 = fabsf(*(float *)(*v11 + 4 * v14));
        float v54 = fabsf(v52);
        float v55 = fabsf(*(float *)(*a4 + 4 * v14));
        if ((v53 <= v54 || v53 <= v55) && v54 > v53 && v54 > v55) {
          goto LABEL_100;
        }
        goto LABEL_183;
      case 4:
        if (fabsf(*(float *)(*a3 + 4 * v14)) > 33.0
          || fabsf(*(float *)(*a4 + 4 * v14)) > 39.0
          || *(float *)(*v11 + 4 * v14) >= *((float *)v13 + 5))
        {
          goto LABEL_183;
        }
        goto LABEL_100;
      case 5:
        if (fabsf(*(float *)(*a3 + 4 * v14)) > 33.0
          || fabsf(*(float *)(*a4 + 4 * v14)) > 39.0
          || *(float *)(*v11 + 4 * v14) <= *((float *)v13 + 5))
        {
          goto LABEL_183;
        }
        goto LABEL_100;
      case 6:
        if (fabsf(*(float *)(*a3 + 4 * v14)) > 33.0
          || fabsf(*(float *)(*a4 + 4 * v14)) > 39.0
          || fabsf(*(float *)(*v11 + 4 * v14)) > 27.0
          || *(float *)(*a2 + 4 * v14) <= 0.9)
        {
          goto LABEL_183;
        }
        goto LABEL_100;
      case 7:
        if (fabsf(*(float *)(*v11 + 4 * v14)) > 27.0
          || fabsf(*(float *)(*a3 + 4 * v14)) > 33.0
          || fabsf(*(float *)(*a4 + 4 * v14)) > 39.0)
        {
          goto LABEL_183;
        }
        uint64_t v59 = *v10 + 24 * v14;
        v186 = 0;
        v187 = 0;
        v185 = 0;
        size_t v61 = *(unsigned char **)v59;
        float64x2_t v60 = *(unsigned char **)(v59 + 8);
        int64_t v62 = v60 - v61;
        if (v60 == v61)
        {
          float v65 = vision::mod::LivenessCheckPredictor::computeEyeAspectRatio((uint64_t)a1, (uint64_t)&v185);
          float v66 = *((float *)v13 + 7);
          uint64_t v11 = a5;
        }
        else
        {
          if (v62 < 0) {
            std::vector<float>::__throw_length_error[abi:ne180100]();
          }
          float64x2_t v63 = (char *)operator new(v60 - v61);
          v185 = v63;
          v187 = &v63[4 * (v62 >> 2)];
          float64x2_t v64 = memcpy(v63, v61, v62);
          v186 = &v63[4 * (v62 >> 2)];
          float v65 = vision::mod::LivenessCheckPredictor::computeEyeAspectRatio((uint64_t)v64, (uint64_t)&v185);
          float v66 = *((float *)v13 + 7);
          uint64_t v11 = a5;
          if (v63)
          {
            v186 = v63;
            operator delete(v63);
          }
        }
        a4 = v166;
        if (v65 >= v66) {
          goto LABEL_183;
        }
        goto LABEL_100;
      case 8:
        if (fabsf(*(float *)(*v11 + 4 * v14)) <= 27.0
          && fabsf(*(float *)(*a3 + 4 * v14)) <= 33.0
          && fabsf(*(float *)(*a4 + 4 * v14)) <= 39.0)
        {
          uint64_t v74 = *v10;
          v183 = 0;
          v184 = 0;
          v182 = 0;
          long long v75 = *(_OWORD *)(v74 + 24 * v14);
          uint64_t v76 = *(void *)(v74 + 24 * v14 + 8);
          unint64_t v77 = (const void *)v75;
          size_t v78 = v76 - v75;
          if (v76 - (uint64_t)v75 < 0) {
            std::vector<float>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v79 = (float32x2_t *)operator new(v76 - v75);
          v182 = v79;
          v184 = (char *)v79 + v78;
          memcpy(v79, v77, v78);
          float64x2_t v80 = vcvtq_f64_f32(vsub_f32(v79[34], v79[39]));
          *(float *)v80.f64 = vaddvq_f64(vmulq_f64(v80, v80));
          float64x2_t v81 = vcvtq_f64_f32(vsub_f32(v79[35], v79[38]));
          *(float *)v81.f64 = vaddvq_f64(vmulq_f64(v81, v81));
          *(float *)v80.f64 = (float)(sqrtf(*(float *)v80.f64) + 0.0) + sqrtf(*(float *)v81.f64);
          float64x2_t v82 = vcvtq_f64_f32(vsub_f32(v79[36], v79[37]));
          *(float *)v82.f64 = vaddvq_f64(vmulq_f64(v82, v82));
          v80.f64[0] = (float)(*(float *)v80.f64 + sqrtf(*(float *)v82.f64));
          float64x2_t v83 = vcvtq_f64_f32(vsub_f32(v79[33], v79[29]));
          *(float *)v83.f64 = vaddvq_f64(vmulq_f64(v83, v83));
          float v84 = v80.f64[0] / (sqrtf(*(float *)v83.f64) * 3.0);
          float v85 = *((float *)v13 + 8);
          v183 = v79;
          operator delete(v79);
          uint64_t v11 = a5;
          a4 = v166;
          if (v85 < v84) {
            goto LABEL_100;
          }
        }
        goto LABEL_183;
      case 9:
        if (0xAAAAAAAAAAAAAAABLL * ((v10[1] - *v10) >> 3) <= v14) {
          goto LABEL_183;
        }
        unint64_t v41 = (const void **)(*v10 + 24 * v14);
        uint64_t v43 = *v41;
        uint64_t v42 = v41[1];
        if (v42 == *v41) {
          goto LABEL_183;
        }
        int v44 = *((_DWORD *)v13 + 64);
        if (v44 > 9) {
          goto LABEL_164;
        }
        if (fabsf(*(float *)(*a3 + 4 * v14)) < 10.0
          && fabsf(*(float *)(*v11 + 4 * v14)) < 5.0
          && fabsf(*(float *)(*a4 + 4 * v14)) < 5.0)
        {
          if (v44)
          {
            float v45 = *((float *)v13 + 62);
            v179 = 0;
            v180 = 0;
            v178 = 0;
            size_t v46 = v42 - v43;
            if (v42 - v43 < 0) {
              std::vector<float>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v47 = (float32x2_t *)operator new(v42 - v43);
            v178 = v47;
            v180 = (char *)v47 + v46;
            memcpy(v47, v43, v46);
            float64x2_t v48 = vcvtq_f64_f32(vsub_f32(v47[1], v47[15]));
            *(float *)v48.f64 = vaddvq_f64(vmulq_f64(v48, v48));
            float64x2_t v49 = vcvtq_f64_f32(vsub_f32(v47[2], v47[14]));
            *(float *)v49.f64 = vaddvq_f64(vmulq_f64(v49, v49));
            *(float *)v48.f64 = (float)(sqrtf(*(float *)v48.f64) + 0.0) + sqrtf(*(float *)v49.f64);
            float64x2_t v50 = vcvtq_f64_f32(vsub_f32(v47[5], v47[23]));
            *(float *)v50.f64 = vaddvq_f64(vmulq_f64(v50, v50));
            *(float *)v48.f64 = *(float *)v48.f64 + sqrtf(*(float *)v50.f64);
            float64x2_t v51 = vcvtq_f64_f32(vsub_f32(v47[6], v47[22]));
            *(float *)v51.f64 = vaddvq_f64(vmulq_f64(v51, v51));
            *((float *)v13 + 62) = fminf(v45, (float)(*(float *)v48.f64 + sqrtf(*(float *)v51.f64)) * 0.25);
            v179 = v47;
LABEL_131:
            operator delete(v47);
          }
          else
          {
            long long v105 = std::vector<float>::vector(v181, (uint64_t)v41);
            *((float *)v13 + 62) = vision::mod::LivenessCheckPredictor::computeEyebrow2EyeHeight((uint64_t)v105, v181);
            uint64_t v47 = v181[0];
            if (v181[0])
            {
              v181[1] = v181[0];
              goto LABEL_131;
            }
          }
          ++*((_DWORD *)v13 + 64);
          unint64_t v98 = (char *)*((void *)v13 + 19);
          unint64_t v106 = *((void *)v13 + 20);
          if ((unint64_t)v98 < v106)
          {
LABEL_133:
            *(_DWORD *)unint64_t v98 = v14;
            v107 = v98 + 4;
LABEL_163:
            *((void *)v13 + 19) = v107;
            uint64_t v11 = a5;
            a4 = v166;
            goto LABEL_164;
          }
          int v163 = v15;
          uint64_t v99 = (char *)*v159;
          uint64_t v108 = v98 - (unsigned char *)*v159;
          uint64_t v109 = v108 >> 2;
          unint64_t v110 = (v108 >> 2) + 1;
          if (v110 >> 62) {
LABEL_193:
          }
            std::vector<float>::__throw_length_error[abi:ne180100]();
          uint64_t v111 = v106 - (void)v99;
          if (v111 >> 1 > v110) {
            unint64_t v110 = v111 >> 1;
          }
          if ((unint64_t)v111 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v104 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v104 = v110;
          }
          if (v104)
          {
            if (v104 >> 62) {
LABEL_189:
            }
              std::__throw_bad_array_new_length[abi:ne180100]();
            a1 = (char *)operator new(4 * v104);
          }
          else
          {
            a1 = 0;
          }
          v112 = &a1[4 * v109];
          *(_DWORD *)v112 = v14;
          v107 = v112 + 4;
          if (v98 != v99)
          {
            unint64_t v122 = v98 - 4 - v99;
            if (v122 < 0x2C) {
              goto LABEL_200;
            }
            if ((unint64_t)(v98 - &a1[v108]) < 0x20) {
              goto LABEL_200;
            }
            uint64_t v123 = (v122 >> 2) + 1;
            uint64_t v124 = 4 * (v123 & 0x7FFFFFFFFFFFFFF8);
            v125 = &v98[-v124];
            v112 -= v124;
            v126 = &a1[4 * v109 - 16];
            v127 = v98 - 16;
            uint64_t v128 = v123 & 0x7FFFFFFFFFFFFFF8;
            do
            {
              long long v129 = *(_OWORD *)v127;
              *((_OWORD *)v126 - 1) = *((_OWORD *)v127 - 1);
              *(_OWORD *)v126 = v129;
              v126 -= 32;
              v127 -= 32;
              v128 -= 8;
            }
            while (v128);
            unint64_t v98 = v125;
            if (v123 != (v123 & 0x7FFFFFFFFFFFFFF8))
            {
LABEL_200:
              do
              {
                int v130 = *((_DWORD *)v98 - 1);
                v98 -= 4;
                *((_DWORD *)v112 - 1) = v130;
                v112 -= 4;
              }
              while (v98 != v99);
            }
          }
LABEL_160:
          *((void *)v13 + 18) = v112;
          *((void *)v13 + 19) = v107;
          *((void *)v13 + 20) = &a1[4 * v104];
          if (v99) {
            operator delete(v99);
          }
          int v15 = v163;
          unint64_t v10 = a6;
          goto LABEL_163;
        }
        if (!v44)
        {
          int v88 = *((_DWORD *)v13 + 65);
          if (v88 <= 4)
          {
            if (v88)
            {
              float v89 = *((float *)v13 + 63);
              v175 = 0;
              v176 = 0;
              v174 = 0;
              size_t v90 = v42 - v43;
              if (v42 - v43 < 0) {
                std::vector<float>::__throw_length_error[abi:ne180100]();
              }
              unint64_t v91 = (float32x2_t *)operator new(v42 - v43);
              v174 = v91;
              v176 = (char *)v91 + v90;
              memcpy(v91, v43, v90);
              float64x2_t v92 = vcvtq_f64_f32(vsub_f32(v91[1], v91[15]));
              *(float *)v92.f64 = vaddvq_f64(vmulq_f64(v92, v92));
              float64x2_t v93 = vcvtq_f64_f32(vsub_f32(v91[2], v91[14]));
              *(float *)v93.f64 = vaddvq_f64(vmulq_f64(v93, v93));
              *(float *)v92.f64 = (float)(sqrtf(*(float *)v92.f64) + 0.0) + sqrtf(*(float *)v93.f64);
              float64x2_t v94 = vcvtq_f64_f32(vsub_f32(v91[5], v91[23]));
              *(float *)v94.f64 = vaddvq_f64(vmulq_f64(v94, v94));
              *(float *)v92.f64 = *(float *)v92.f64 + sqrtf(*(float *)v94.f64);
              float64x2_t v95 = vcvtq_f64_f32(vsub_f32(v91[6], v91[22]));
              *(float *)v95.f64 = vaddvq_f64(vmulq_f64(v95, v95));
              *((float *)v13 + 63) = fminf(v89, (float)(*(float *)v92.f64 + sqrtf(*(float *)v95.f64)) * 0.25);
              v175 = v91;
LABEL_118:
              operator delete(v91);
            }
            else
            {
              v96 = std::vector<float>::vector(v177, (uint64_t)v41);
              *((float *)v13 + 63) = vision::mod::LivenessCheckPredictor::computeEyebrow2EyeHeight((uint64_t)v96, v177);
              unint64_t v91 = v177[0];
              if (v177[0])
              {
                v177[1] = v177[0];
                goto LABEL_118;
              }
            }
            ++*((_DWORD *)v13 + 65);
            unint64_t v98 = (char *)*((void *)v13 + 19);
            unint64_t v97 = *((void *)v13 + 20);
            if ((unint64_t)v98 < v97) {
              goto LABEL_133;
            }
            int v163 = v15;
            uint64_t v99 = (char *)*v159;
            uint64_t v100 = v98 - (unsigned char *)*v159;
            uint64_t v101 = v100 >> 2;
            unint64_t v102 = (v100 >> 2) + 1;
            if (v102 >> 62) {
              goto LABEL_193;
            }
            uint64_t v103 = v97 - (void)v99;
            if (v103 >> 1 > v102) {
              unint64_t v102 = v103 >> 1;
            }
            if ((unint64_t)v103 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v104 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v104 = v102;
            }
            if (v104)
            {
              if (v104 >> 62) {
                goto LABEL_189;
              }
              a1 = (char *)operator new(4 * v104);
            }
            else
            {
              a1 = 0;
            }
            v112 = &a1[4 * v101];
            *(_DWORD *)v112 = v14;
            v107 = v112 + 4;
            if (v98 != v99)
            {
              unint64_t v113 = v98 - 4 - v99;
              if (v113 < 0x2C) {
                goto LABEL_201;
              }
              if ((unint64_t)(v98 - &a1[v100]) < 0x20) {
                goto LABEL_201;
              }
              uint64_t v114 = (v113 >> 2) + 1;
              uint64_t v115 = 4 * (v114 & 0x7FFFFFFFFFFFFFF8);
              v116 = &v98[-v115];
              v112 -= v115;
              v117 = &a1[4 * v101 - 16];
              v118 = v98 - 16;
              uint64_t v119 = v114 & 0x7FFFFFFFFFFFFFF8;
              do
              {
                long long v120 = *(_OWORD *)v118;
                *((_OWORD *)v117 - 1) = *((_OWORD *)v118 - 1);
                *(_OWORD *)v117 = v120;
                v117 -= 32;
                v118 -= 32;
                v119 -= 8;
              }
              while (v119);
              unint64_t v98 = v116;
              if (v114 != (v114 & 0x7FFFFFFFFFFFFFF8))
              {
LABEL_201:
                do
                {
                  int v121 = *((_DWORD *)v98 - 1);
                  v98 -= 4;
                  *((_DWORD *)v112 - 1) = v121;
                  v112 -= 4;
                }
                while (v98 != v99);
              }
            }
            goto LABEL_160;
          }
        }
LABEL_164:
        if (fabsf(*(float *)(*v11 + 4 * v14)) > 27.0
          || fabsf(*(float *)(*a3 + 4 * v14)) > 33.0
          || fabsf(*(float *)(*a4 + 4 * v14)) > 39.0)
        {
          goto LABEL_183;
        }
        uint64_t v131 = *v10 + 24 * v14;
        v172 = 0;
        v173 = 0;
        v171 = 0;
        v133 = *(unsigned char **)v131;
        v132 = *(unsigned char **)(v131 + 8);
        int64_t v134 = v132 - v133;
        if (v132 == v133)
        {
          float v137 = vision::mod::LivenessCheckPredictor::computeEyeAspectRatio((uint64_t)a1, (uint64_t)&v171);
          float v138 = *((float *)v13 + 7);
          uint64_t v11 = a5;
        }
        else
        {
          if (v134 < 0) {
            std::vector<float>::__throw_length_error[abi:ne180100]();
          }
          v135 = (char *)operator new(v132 - v133);
          v171 = v135;
          v173 = &v135[4 * (v134 >> 2)];
          v136 = memcpy(v135, v133, v134);
          v172 = &v135[4 * (v134 >> 2)];
          float v137 = vision::mod::LivenessCheckPredictor::computeEyeAspectRatio((uint64_t)v136, (uint64_t)&v171);
          float v138 = *((float *)v13 + 7);
          uint64_t v11 = a5;
          if (v135)
          {
            v172 = v135;
            operator delete(v135);
          }
        }
        a4 = v166;
        if (v137 < v138) {
          goto LABEL_183;
        }
        float v139 = *((float *)v13 + 62);
        if (v139 == 0.0) {
          goto LABEL_176;
        }
        uint64_t v140 = *v10;
        v169 = 0;
        v170 = 0;
        v168 = 0;
        long long v141 = *(_OWORD *)(v140 + 24 * v14);
        uint64_t v142 = *(void *)(v140 + 24 * v14 + 8);
        v143 = (const void *)v141;
        size_t v144 = v142 - v141;
        if (v142 - (uint64_t)v141 < 0) {
          std::vector<float>::__throw_length_error[abi:ne180100]();
        }
        v145 = (float32x2_t *)operator new(v142 - v141);
        v168 = v145;
        v170 = (char *)v145 + v144;
        memcpy(v145, v143, v144);
        float64x2_t v146 = vcvtq_f64_f32(vsub_f32(v145[1], v145[15]));
        *(float *)v146.f64 = vaddvq_f64(vmulq_f64(v146, v146));
        float64x2_t v147 = vcvtq_f64_f32(vsub_f32(v145[2], v145[14]));
        *(float *)v147.f64 = vaddvq_f64(vmulq_f64(v147, v147));
        *(float *)v146.f64 = (float)(sqrtf(*(float *)v146.f64) + 0.0) + sqrtf(*(float *)v147.f64);
        float64x2_t v148 = vcvtq_f64_f32(vsub_f32(v145[5], v145[23]));
        *(float *)v148.f64 = vaddvq_f64(vmulq_f64(v148, v148));
        *(float *)v146.f64 = *(float *)v146.f64 + sqrtf(*(float *)v148.f64);
        float64x2_t v149 = vcvtq_f64_f32(vsub_f32(v145[6], v145[22]));
        *(float *)v149.f64 = vaddvq_f64(vmulq_f64(v149, v149));
        float v150 = (float)(*(float *)v146.f64 + sqrtf(*(float *)v149.f64)) * 0.25;
        float v151 = v139 * *((float *)v13 + 6);
        v169 = v145;
        operator delete(v145);
        uint64_t v11 = a5;
        a4 = v166;
        if (v150 > v151) {
          goto LABEL_100;
        }
        float v139 = *((float *)v13 + 62);
LABEL_176:
        if (v139 == 0.0 && *((float *)v13 + 63) != 0.0)
        {
          v152 = std::vector<float>::vector(__p, *v10 + 24 * v14);
          float v153 = vision::mod::LivenessCheckPredictor::computeEyebrow2EyeHeight((uint64_t)v152, (float32x2_t **)__p);
          float v154 = *((float *)v13 + 6) * *((float *)v13 + 63);
          a1 = (char *)__p[0];
          if (__p[0])
          {
            __p[1] = __p[0];
            operator delete(__p[0]);
          }
          a4 = v166;
          if (v153 > v154)
          {
LABEL_100:
            ++*(_DWORD *)&v13[4 * *a7 + 168];
            uint64_t v86 = *a7;
            int v87 = *(_DWORD *)&v13[4 * v86 + 168];
            if (v87 > v15) {
              int v15 = *(_DWORD *)&v13[4 * v86 + 168];
            }
            if (v86 == 9 || v86 == 7)
            {
              if (v87 < *((_DWORD *)v13 + 10)) {
                goto LABEL_108;
              }
LABEL_107:
              v13[117] = 1;
              goto LABEL_108;
            }
            if (v87 >= *((_DWORD *)v13 + 9)) {
              goto LABEL_107;
            }
LABEL_108:
            ++v14;
            uint64_t v9 = *a3;
            if (v14 >= (a3[1] - *a3) >> 2) {
              goto LABEL_186;
            }
            continue;
          }
        }
        if (*((float *)v13 + 62) != 0.0 || *((float *)v13 + 63) != 0.0)
        {
LABEL_183:
          *(_DWORD *)&v13[4 * *a7 + 168] = 0;
          ++v14;
          uint64_t v9 = *a3;
          if (v14 >= (a3[1] - *a3) >> 2) {
            goto LABEL_186;
          }
          continue;
        }
        return 6;
      default:
        goto LABEL_183;
    }
  }
}

void sub_21F0848F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_21F084978(_Unwind_Exception *a1)
{
  std::locale::~locale((std::locale *)(v1 - 160));
  _Unwind_Resume(a1);
}

uint64_t vision::mod::LivenessCheckPredictor::runTrajectoryAnalysis(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v217 = a3;
  uint64_t v240 = *MEMORY[0x263EF8340];
  if (*(int *)(a1 + 52) < 2) {
    return 3;
  }
  uint64_t v5 = a1;
  v237 = 0;
  v238 = 0;
  v239 = 0;
  std::vector<std::vector<float>>::vector(&v235, a2);
  if (*(int *)(v5 + 52) >= 1)
  {
    v219 = a2;
    v221 = 0;
    v220 = 0;
    v222 = 0;
    uint64_t v6 = 0;
    v228 = *(uint64_t ***)(v217 + 8);
    uint64_t v218 = v5;
    while (1)
    {
      char v234 = 2;
      strcpy((char *)__s1, "x1");
      if (!v228) {
LABEL_319:
      }
        std::__throw_out_of_range[abi:ne180100]("map::at:  key not found");
      uint64_t v8 = v228;
      while (1)
      {
        while (1)
        {
          int v9 = *((char *)v8 + 55);
          if (v9 >= 0) {
            unint64_t v10 = *((unsigned __int8 *)v8 + 55);
          }
          else {
            unint64_t v10 = (unint64_t)v8[5];
          }
          if (v9 >= 0) {
            uint64_t v11 = (uint64_t *)(v8 + 4);
          }
          else {
            uint64_t v11 = v8[4];
          }
          if (v10 >= 2) {
            size_t v12 = 2;
          }
          else {
            size_t v12 = v10;
          }
          int v13 = memcmp(__s1, v11, v12);
          BOOL v14 = v13 < 0;
          if (!v13) {
            BOOL v14 = v10 > 2;
          }
          if (!v14) {
            break;
          }
          uint64_t v8 = (uint64_t **)*v8;
          if (!v8) {
            goto LABEL_319;
          }
        }
        int v15 = memcmp(v11, __s1, v12);
        BOOL v16 = v10 < 2;
        if (v15) {
          BOOL v16 = v15 < 0;
        }
        if (!v16) {
          break;
        }
        uint64_t v8 = (uint64_t **)v8[1];
        if (!v8) {
          goto LABEL_319;
        }
      }
      uint64_t v17 = v8[7];
      uint64_t v227 = v6;
      int v18 = *((_DWORD *)v17 + v6);
      char v232 = 2;
      strcpy((char *)__s2, "x0");
      int v19 = v228;
      while (1)
      {
        while (1)
        {
          int v20 = *((char *)v19 + 55);
          if (v20 >= 0) {
            unint64_t v21 = *((unsigned __int8 *)v19 + 55);
          }
          else {
            unint64_t v21 = (unint64_t)v19[5];
          }
          if (v20 >= 0) {
            uint64_t v22 = (uint64_t *)(v19 + 4);
          }
          else {
            uint64_t v22 = v19[4];
          }
          if (v21 >= 2) {
            size_t v23 = 2;
          }
          else {
            size_t v23 = v21;
          }
          int v24 = memcmp(__s2, v22, v23);
          BOOL v25 = v24 < 0;
          if (!v24) {
            BOOL v25 = v21 > 2;
          }
          if (!v25) {
            break;
          }
          int v19 = (uint64_t **)*v19;
          if (!v19) {
            goto LABEL_321;
          }
        }
        int v26 = memcmp(v22, __s2, v23);
        BOOL v27 = v21 < 2;
        if (v26) {
          BOOL v27 = v26 < 0;
        }
        if (!v27) {
          break;
        }
        int v19 = (uint64_t **)v19[1];
        if (!v19) {
LABEL_321:
        }
          std::__throw_out_of_range[abi:ne180100]("map::at:  key not found");
      }
      int v28 = v18 - *((_DWORD *)v19[7] + v227);
      if (v28 < 0) {
        int v28 = *((_DWORD *)v19[7] + v227) - v18;
      }
      float v29 = (float)v28;
      char v230 = 11;
      uint64_t v224 = *(void *)"image_width";
      strcpy(v229, "image_width");
      v30 = v228;
      while (1)
      {
        while (1)
        {
          int v31 = *((char *)v30 + 55);
          if (v31 >= 0) {
            unint64_t v32 = *((unsigned __int8 *)v30 + 55);
          }
          else {
            unint64_t v32 = (unint64_t)v30[5];
          }
          if (v31 >= 0) {
            uint64_t v33 = (uint64_t *)(v30 + 4);
          }
          else {
            uint64_t v33 = v30[4];
          }
          if (v32 >= 0xB) {
            size_t v34 = 11;
          }
          else {
            size_t v34 = v32;
          }
          int v35 = memcmp(v229, v33, v34);
          BOOL v36 = v35 < 0;
          if (!v35) {
            BOOL v36 = v32 > 0xB;
          }
          if (!v36) {
            break;
          }
          v30 = (uint64_t **)*v30;
          if (!v30) {
            goto LABEL_322;
          }
        }
        int v37 = memcmp(v33, v229, v34);
        BOOL v38 = v32 < 0xB;
        if (v37) {
          BOOL v38 = v37 < 0;
        }
        if (!v38) {
          break;
        }
        v30 = (uint64_t **)v30[1];
        if (!v30) {
LABEL_322:
        }
          std::__throw_out_of_range[abi:ne180100]("map::at:  key not found");
      }
      float v39 = (float)*((int *)v30[7] + v227);
      char v234 = 2;
      float v40 = v29 / v39;
      strcpy((char *)__s1, "y1");
      unint64_t v41 = v228;
      while (1)
      {
        while (1)
        {
          int v42 = *((char *)v41 + 55);
          if (v42 >= 0) {
            unint64_t v43 = *((unsigned __int8 *)v41 + 55);
          }
          else {
            unint64_t v43 = (unint64_t)v41[5];
          }
          if (v42 >= 0) {
            int v44 = (uint64_t *)(v41 + 4);
          }
          else {
            int v44 = v41[4];
          }
          if (v43 >= 2) {
            size_t v45 = 2;
          }
          else {
            size_t v45 = v43;
          }
          int v46 = memcmp(__s1, v44, v45);
          BOOL v47 = v46 < 0;
          if (!v46) {
            BOOL v47 = v43 > 2;
          }
          if (!v47) {
            break;
          }
          unint64_t v41 = (uint64_t **)*v41;
          if (!v41) {
            goto LABEL_323;
          }
        }
        int v48 = memcmp(v44, __s1, v45);
        BOOL v49 = v43 < 2;
        if (v48) {
          BOOL v49 = v48 < 0;
        }
        if (!v49) {
          break;
        }
        unint64_t v41 = (uint64_t **)v41[1];
        if (!v41) {
LABEL_323:
        }
          std::__throw_out_of_range[abi:ne180100]("map::at:  key not found");
      }
      int v50 = *((_DWORD *)v41[7] + v227);
      char v232 = 2;
      strcpy((char *)__s2, "y0");
      float64x2_t v51 = v228;
      while (1)
      {
        while (1)
        {
          int v52 = *((char *)v51 + 55);
          if (v52 >= 0) {
            unint64_t v53 = *((unsigned __int8 *)v51 + 55);
          }
          else {
            unint64_t v53 = (unint64_t)v51[5];
          }
          if (v52 >= 0) {
            float v54 = (uint64_t *)(v51 + 4);
          }
          else {
            float v54 = v51[4];
          }
          if (v53 >= 2) {
            size_t v55 = 2;
          }
          else {
            size_t v55 = v53;
          }
          int v56 = memcmp(__s2, v54, v55);
          BOOL v57 = v56 < 0;
          if (!v56) {
            BOOL v57 = v53 > 2;
          }
          if (!v57) {
            break;
          }
          float64x2_t v51 = (uint64_t **)*v51;
          if (!v51) {
            goto LABEL_324;
          }
        }
        int v58 = memcmp(v54, __s2, v55);
        BOOL v59 = v53 < 2;
        if (v58) {
          BOOL v59 = v58 < 0;
        }
        if (!v59) {
          break;
        }
        float64x2_t v51 = (uint64_t **)v51[1];
        if (!v51) {
LABEL_324:
        }
          std::__throw_out_of_range[abi:ne180100]("map::at:  key not found");
      }
      uint64_t v60 = v227;
      int v61 = v50 - *((_DWORD *)v51[7] + v227);
      if (v61 < 0) {
        int v61 = *((_DWORD *)v51[7] + v227) - v50;
      }
      float v62 = (float)v61;
      char v230 = 12;
      uint64_t v223 = *(void *)"image_height";
      strcpy(v229, "image_height");
      float64x2_t v63 = v228;
      while (1)
      {
        while (1)
        {
          int v64 = *((char *)v63 + 55);
          if (v64 >= 0) {
            unint64_t v65 = *((unsigned __int8 *)v63 + 55);
          }
          else {
            unint64_t v65 = (unint64_t)v63[5];
          }
          if (v64 >= 0) {
            float v66 = (uint64_t *)(v63 + 4);
          }
          else {
            float v66 = v63[4];
          }
          if (v65 >= 0xC) {
            size_t v67 = 12;
          }
          else {
            size_t v67 = v65;
          }
          int v68 = memcmp(v229, v66, v67);
          BOOL v69 = v68 < 0;
          if (!v68) {
            BOOL v69 = v65 > 0xC;
          }
          if (!v69) {
            break;
          }
          float64x2_t v63 = (uint64_t **)*v63;
          if (!v63) {
            goto LABEL_325;
          }
        }
        int v70 = memcmp(v66, v229, v67);
        BOOL v71 = v65 < 0xC;
        if (v70) {
          BOOL v71 = v70 < 0;
        }
        if (!v71) {
          break;
        }
        float64x2_t v63 = (uint64_t **)v63[1];
        if (!v63) {
LABEL_325:
        }
          std::__throw_out_of_range[abi:ne180100]("map::at:  key not found");
      }
      float v72 = (float)(v40 + (float)(v62 / (float)*((int *)v63[7] + v227))) * 0.5;
      v73 = v222;
      if (v222 >= v220) {
        break;
      }
      float *v222 = v72;
      uint64_t v74 = v73 + 1;
LABEL_150:
      v222 = v74;
      v238 = v74;
      char v234 = 2;
      strcpy((char *)__s1, "x0");
      if (!v228) {
LABEL_320:
      }
        std::__throw_out_of_range[abi:ne180100]("map::at:  key not found");
      int v88 = v228;
      while (1)
      {
        while (1)
        {
          int v89 = *((char *)v88 + 55);
          if (v89 >= 0) {
            unint64_t v90 = *((unsigned __int8 *)v88 + 55);
          }
          else {
            unint64_t v90 = (unint64_t)v88[5];
          }
          if (v89 >= 0) {
            unint64_t v91 = (uint64_t *)(v88 + 4);
          }
          else {
            unint64_t v91 = v88[4];
          }
          if (v90 >= 2) {
            size_t v92 = 2;
          }
          else {
            size_t v92 = v90;
          }
          int v93 = memcmp(__s1, v91, v92);
          BOOL v94 = v93 < 0;
          if (!v93) {
            BOOL v94 = v90 > 2;
          }
          if (!v94) {
            break;
          }
          int v88 = (uint64_t **)*v88;
          if (!v88) {
            goto LABEL_320;
          }
        }
        int v95 = memcmp(v91, __s1, v92);
        BOOL v96 = v90 < 2;
        if (v95) {
          BOOL v96 = v95 < 0;
        }
        if (!v96) {
          break;
        }
        int v88 = (uint64_t **)v88[1];
        if (!v88) {
          goto LABEL_320;
        }
      }
      double v97 = (double)(int)v40;
      double v98 = -v97;
      int v99 = (int)((double)*((int *)v88[7] + v60) + v97 * -0.1);
      char v234 = 2;
      strcpy((char *)__s1, "y0");
      uint64_t v100 = v228;
      while (1)
      {
        while (1)
        {
          int v101 = *((char *)v100 + 55);
          if (v101 >= 0) {
            unint64_t v102 = *((unsigned __int8 *)v100 + 55);
          }
          else {
            unint64_t v102 = (unint64_t)v100[5];
          }
          if (v101 >= 0) {
            uint64_t v103 = (uint64_t *)(v100 + 4);
          }
          else {
            uint64_t v103 = v100[4];
          }
          if (v102 >= 2) {
            size_t v104 = 2;
          }
          else {
            size_t v104 = v102;
          }
          int v105 = memcmp(__s1, v103, v104);
          BOOL v106 = v105 < 0;
          if (!v105) {
            BOOL v106 = v102 > 2;
          }
          if (!v106) {
            break;
          }
          uint64_t v100 = (uint64_t **)*v100;
          if (!v100) {
            goto LABEL_326;
          }
        }
        int v107 = memcmp(v103, __s1, v104);
        BOOL v108 = v102 < 2;
        if (v107) {
          BOOL v108 = v107 < 0;
        }
        if (!v108) {
          break;
        }
        uint64_t v100 = (uint64_t **)v100[1];
        if (!v100) {
LABEL_326:
        }
          std::__throw_out_of_range[abi:ne180100]("map::at:  key not found");
      }
      int v109 = (int)((double)*((int *)v100[7] + v227) + v98 * 0.1);
      double v110 = fmax((double)v99, 0.0);
      char v234 = 11;
      strcpy((char *)__s1 + 7, "idth");
      __s1[0] = v224;
      uint64_t v111 = v228;
      while (1)
      {
        while (1)
        {
          int v112 = *((char *)v111 + 55);
          if (v112 >= 0) {
            unint64_t v113 = *((unsigned __int8 *)v111 + 55);
          }
          else {
            unint64_t v113 = (unint64_t)v111[5];
          }
          if (v112 >= 0) {
            uint64_t v114 = (uint64_t *)(v111 + 4);
          }
          else {
            uint64_t v114 = v111[4];
          }
          if (v113 >= 0xB) {
            size_t v115 = 11;
          }
          else {
            size_t v115 = v113;
          }
          int v116 = memcmp(__s1, v114, v115);
          BOOL v117 = v116 < 0;
          if (!v116) {
            BOOL v117 = v113 > 0xB;
          }
          if (!v117) {
            break;
          }
          uint64_t v111 = (uint64_t **)*v111;
          if (!v111) {
            goto LABEL_327;
          }
        }
        int v118 = memcmp(v114, __s1, v115);
        BOOL v119 = v113 < 0xB;
        if (v118) {
          BOOL v119 = v118 < 0;
        }
        if (!v119) {
          break;
        }
        uint64_t v111 = (uint64_t **)v111[1];
        if (!v111) {
LABEL_327:
        }
          std::__throw_out_of_range[abi:ne180100]("map::at:  key not found");
      }
      int v120 = (int)fmin(v110, (double)*((int *)v111[7] + v227));
      double v121 = fmax((double)v109, 0.0);
      char v234 = 12;
      strcpy((char *)&__s1[1], "ight");
      __s1[0] = v223;
      unint64_t v122 = v228;
      while (1)
      {
        while (1)
        {
          int v123 = *((char *)v122 + 55);
          if (v123 >= 0) {
            unint64_t v124 = *((unsigned __int8 *)v122 + 55);
          }
          else {
            unint64_t v124 = (unint64_t)v122[5];
          }
          if (v123 >= 0) {
            v125 = (uint64_t *)(v122 + 4);
          }
          else {
            v125 = v122[4];
          }
          if (v124 >= 0xC) {
            size_t v126 = 12;
          }
          else {
            size_t v126 = v124;
          }
          int v127 = memcmp(__s1, v125, v126);
          BOOL v128 = v127 < 0;
          if (!v127) {
            BOOL v128 = v124 > 0xC;
          }
          if (!v128) {
            break;
          }
          unint64_t v122 = (uint64_t **)*v122;
          if (!v122) {
            goto LABEL_328;
          }
        }
        int v129 = memcmp(v125, __s1, v126);
        BOOL v130 = v124 < 0xC;
        if (v129) {
          BOOL v130 = v129 < 0;
        }
        if (!v130) {
          break;
        }
        unint64_t v122 = (uint64_t **)v122[1];
        if (!v122) {
LABEL_328:
        }
          std::__throw_out_of_range[abi:ne180100]("map::at:  key not found");
      }
      uint64_t v131 = (uint64_t *)(*v219 + 24 * v227);
      v133 = v131 + 1;
      uint64_t v132 = v131[1];
      v226 = v131;
      uint64_t v134 = *v131;
      if (v132 == v134)
      {
        uint64_t v7 = v227;
      }
      else
      {
        unint64_t v135 = 0;
        float v136 = (float)(int)fmin(v121, (double)*((int *)v122[7] + v227));
        float v137 = (float)v120;
        v225 = &v235[24 * v227];
        do
        {
          float v138 = *(float *)(v134 + 4 * v135);
          if (v135)
          {
            char v234 = 12;
            strcpy((char *)&__s1[1], "ight");
            __s1[0] = v223;
            if (!v228) {
LABEL_317:
            }
              std::__throw_out_of_range[abi:ne180100]("map::at:  key not found");
            float v139 = v138 + v136;
            uint64_t v140 = v228;
            while (1)
            {
              while (1)
              {
                int v149 = *((char *)v140 + 55);
                if (v149 >= 0) {
                  unint64_t v150 = *((unsigned __int8 *)v140 + 55);
                }
                else {
                  unint64_t v150 = (unint64_t)v140[5];
                }
                if (v149 >= 0) {
                  float v151 = (uint64_t *)(v140 + 4);
                }
                else {
                  float v151 = v140[4];
                }
                if (v150 >= 0xC) {
                  size_t v152 = 12;
                }
                else {
                  size_t v152 = v150;
                }
                int v153 = memcmp(__s1, v151, v152);
                BOOL v154 = v153 < 0;
                if (!v153) {
                  BOOL v154 = v150 > 0xC;
                }
                if (!v154) {
                  break;
                }
                uint64_t v140 = (uint64_t **)*v140;
                if (!v140) {
                  goto LABEL_317;
                }
              }
              int v155 = memcmp(v151, __s1, v152);
              BOOL v156 = v150 < 0xC;
              if (v155) {
                BOOL v156 = v155 < 0;
              }
              if (!v156) {
                break;
              }
              uint64_t v140 = (uint64_t **)v140[1];
              if (!v140) {
                goto LABEL_317;
              }
            }
          }
          else
          {
            char v234 = 11;
            strcpy((char *)__s1 + 7, "idth");
            __s1[0] = v224;
            if (!v228) {
LABEL_318:
            }
              std::__throw_out_of_range[abi:ne180100]("map::at:  key not found");
            float v139 = v138 + v137;
            uint64_t v140 = v228;
            while (1)
            {
              while (1)
              {
                int v141 = *((char *)v140 + 55);
                if (v141 >= 0) {
                  unint64_t v142 = *((unsigned __int8 *)v140 + 55);
                }
                else {
                  unint64_t v142 = (unint64_t)v140[5];
                }
                if (v141 >= 0) {
                  v143 = (uint64_t *)(v140 + 4);
                }
                else {
                  v143 = v140[4];
                }
                if (v142 >= 0xB) {
                  size_t v144 = 11;
                }
                else {
                  size_t v144 = v142;
                }
                int v145 = memcmp(__s1, v143, v144);
                BOOL v146 = v145 < 0;
                if (!v145) {
                  BOOL v146 = v142 > 0xB;
                }
                if (!v146) {
                  break;
                }
                uint64_t v140 = (uint64_t **)*v140;
                if (!v140) {
                  goto LABEL_318;
                }
              }
              int v147 = memcmp(v143, __s1, v144);
              BOOL v148 = v142 < 0xB;
              if (v147) {
                BOOL v148 = v147 < 0;
              }
              if (!v148) {
                break;
              }
              uint64_t v140 = (uint64_t **)v140[1];
              if (!v140) {
                goto LABEL_318;
              }
            }
          }
          uint64_t v7 = v227;
          *(float *)(*(void *)v225 + 4 * v135++) = v139 / (float)*((int *)v140[7] + v227);
          uint64_t v134 = *v226;
        }
        while (v135 < (*v133 - *v226) >> 2);
      }
      uint64_t v6 = v7 + 1;
      uint64_t v5 = v218;
      if (v6 >= *(int *)(v218 + 52)) {
        goto LABEL_276;
      }
    }
    long long v75 = (char *)((char *)v222 - (char *)v221);
    uint64_t v76 = v222 - v221;
    unint64_t v77 = v76 + 1;
    if ((unint64_t)(v76 + 1) >> 62) {
      std::vector<float>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v78 = (char *)v220 - (char *)v221;
    if (((char *)v220 - (char *)v221) >> 1 > v77) {
      unint64_t v77 = v78 >> 1;
    }
    if ((unint64_t)v78 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v79 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v79 = v77;
    }
    if (v79)
    {
      if (v79 >> 62) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      float64x2_t v80 = operator new(4 * v79);
    }
    else
    {
      float64x2_t v80 = 0;
    }
    float64x2_t v81 = v221;
    float64x2_t v82 = v222;
    float64x2_t v83 = (float *)((char *)v80 + 4 * v76);
    *float64x2_t v83 = v72;
    uint64_t v74 = v83 + 1;
    if (v82 == v81)
    {
LABEL_147:
      v237 = v83;
      v238 = v74;
      v220 = (float *)((char *)v80 + 4 * v79);
      v239 = v220;
      if (v81)
      {
        operator delete(v81);
        v228 = *(uint64_t ***)(v217 + 8);
      }
      v221 = v83;
      goto LABEL_150;
    }
    float v84 = v82;
    unint64_t v85 = (char *)(v82 - 1) - (char *)v81;
    if (v85 >= 0xBC)
    {
      if (&v75[(void)v80 - 4 - (v85 & 0xFFFFFFFFFFFFFFFCLL)] <= &v75[(void)v80 - 4]
        && (float *)((char *)v84 - (v85 & 0xFFFFFFFFFFFFFFFCLL) - 4) <= v84 - 1
        && (unint64_t)((char *)v84 - &v75[(void)v80]) >= 0x20)
      {
        uint64_t v157 = (v85 >> 2) + 1;
        uint64_t v158 = 4 * (v157 & 0x7FFFFFFFFFFFFFF8);
        uint64_t v86 = &v222[v158 / 0xFFFFFFFFFFFFFFFCLL];
        float64x2_t v83 = (float *)((char *)v83 - v158);
        v159 = (char *)v80 + 4 * v76 - 16;
        v160 = v222 - 4;
        uint64_t v161 = v157 & 0x7FFFFFFFFFFFFFF8;
        do
        {
          long long v162 = *(_OWORD *)v160;
          *((_OWORD *)v159 - 1) = *((_OWORD *)v160 - 1);
          *(_OWORD *)v159 = v162;
          v159 -= 32;
          v160 -= 8;
          v161 -= 8;
        }
        while (v161);
        BOOL v163 = v157 == (v157 & 0x7FFFFFFFFFFFFFF8);
        float64x2_t v81 = v221;
        if (v163) {
          goto LABEL_147;
        }
        goto LABEL_146;
      }
      uint64_t v86 = v222;
    }
    else
    {
      uint64_t v86 = v84;
    }
    float64x2_t v81 = v221;
    do
    {
LABEL_146:
      int v87 = *((_DWORD *)v86-- - 1);
      *((_DWORD *)v83-- - 1) = v87;
    }
    while (v86 != v81);
    goto LABEL_147;
  }
LABEL_276:
  uint64_t v164 = MEMORY[0x270FA5388](&v216);
  v166 = (char *)&v216 - v165;
  uint64_t v167 = *(unsigned int *)(v5 + 52);
  *(_DWORD *)((char *)&v216 + 4 * (int)v167 - v165 - 4) = -1082130432;
  if ((int)v167 <= 1)
  {
    MEMORY[0x270FA5388](v164);
    v199 = (char *)&v216 - ((v205 + 15) & 0x7FFFFFFF0);
    *(_DWORD *)&v199[4 * v206] = -1054867456;
    *(_DWORD *)v199 = -1054867456;
    goto LABEL_300;
  }
  v168 = v235;
  v169 = v237;
  for (uint64_t i = 1; i != v167; ++i)
  {
    while (1)
    {
      v171 = (float32x4_t **)&v168[24 * i];
      v172 = *v171;
      v173 = v171[1];
      uint64_t v174 = i - 1;
      if (v172 != v173)
      {
        v175 = (float32x4_t **)&v168[24 * v174];
        v176 = *v175;
        v177 = v175[1];
        if (v176 != v177) {
          break;
        }
      }
      *(_DWORD *)&v166[4 * v174] = -1082130432;
      if (++i == v167) {
        goto LABEL_292;
      }
    }
    unint64_t v178 = ((char *)v177 - (char *)v176) >> 2;
    if (v178 <= 1) {
      unint64_t v179 = 1;
    }
    else {
      unint64_t v179 = v178;
    }
    if (v179 < 8)
    {
      unint64_t v180 = 0;
      float v181 = 0.0;
LABEL_289:
      v189 = &v172->f32[v180];
      v190 = &v176->f32[v180];
      unint64_t v191 = v179 - v180;
      do
      {
        float v192 = *v190++;
        float v193 = v192;
        float v194 = *v189++;
        float v181 = v181 + (float)((float)(v193 - v194) * (float)(v193 - v194));
        --v191;
      }
      while (v191);
      goto LABEL_291;
    }
    unint64_t v180 = v179 & 0xFFFFFFFFFFFFFFF8;
    v182 = v176 + 1;
    v183 = v172 + 1;
    float v181 = 0.0;
    unint64_t v184 = v179 & 0xFFFFFFFFFFFFFFF8;
    do
    {
      float32x4_t v185 = vsubq_f32(v182[-1], v183[-1]);
      float32x4_t v186 = vsubq_f32(*v182, *v183);
      float32x4_t v187 = vmulq_f32(v185, v185);
      float32x4_t v188 = vmulq_f32(v186, v186);
      float v181 = (float)((float)((float)((float)((float)((float)((float)(v181 + v187.f32[0]) + v187.f32[1]) + v187.f32[2])
                                           + v187.f32[3])
                                   + v188.f32[0])
                           + v188.f32[1])
                   + v188.f32[2])
           + v188.f32[3];
      v182 += 2;
      v183 += 2;
      v184 -= 8;
    }
    while (v184);
    if (v179 != v180) {
      goto LABEL_289;
    }
LABEL_291:
    *(float *)&v166[4 * v174] = (float)(sqrtf(v181) / (float)v178) / v169[i];
  }
LABEL_292:
  MEMORY[0x270FA5388](v164);
  v199 = (char *)&v216 - ((v198 + 15) & 0x7FFFFFFF0);
  *(_DWORD *)&v199[4 * v197] = -1054867456;
  *(_DWORD *)v199 = -1054867456;
  if ((int)v195 >= 3)
  {
    uint64_t v200 = 0;
    do
    {
      float v201 = *(float *)(v196 + v200 + 4);
      float v202 = -10.0;
      if (v201 != -1.0)
      {
        float v203 = *(float *)(v196 + v200);
        if (v203 != -1.0)
        {
          float v204 = *(float *)(v196 + v200 + 8);
          if (v204 != -1.0) {
            float v202 = (float)-(float)(v203 - (float)(v201 * 2.0)) - v204;
          }
        }
      }
      *(float *)&v199[v200 + 4] = v202;
      v200 += 4;
    }
    while (4 * v197 - 4 != v200);
  }
LABEL_300:
  *(_DWORD *)(v5 + 264) = 0;
  if ((int)v195 < 1)
  {
    int v207 = 0;
  }
  else
  {
    int v207 = 0;
    float v208 = *(float *)(v5 + 56);
    uint64_t v209 = v195;
    do
    {
      if (*(float *)v199 > v208) {
        *(_DWORD *)(v5 + 264) = ++v207;
      }
      v199 += 4;
      --v209;
    }
    while (v209);
  }
  *(float *)(v5 + 268) = 1.0 - (float)((float)v207 / (float)(int)v195);
  v210 = v235;
  if (v235)
  {
    v211 = v236;
    v212 = v235;
    if (v236 != v235)
    {
      v213 = v236;
      do
      {
        v215 = (void *)*((void *)v213 - 3);
        v213 -= 24;
        v214 = v215;
        if (v215)
        {
          *((void *)v211 - 2) = v214;
          operator delete(v214);
        }
        v211 = v213;
      }
      while (v213 != v210);
      v212 = v235;
    }
    v236 = v210;
    operator delete(v212);
  }
  if (v237) {
    operator delete(v237);
  }
  return 0;
}

void sub_21F085B48(_Unwind_Exception *a1)
{
  std::vector<std::vector<float>>::~vector[abi:ne180100]((void **)(v1 - 208));
  uint64_t v3 = *(void **)(v1 - 184);
  if (!v3) {
    _Unwind_Resume(a1);
  }
  *(void *)(v1 - 176) = v3;
  operator delete(v3);
  _Unwind_Resume(a1);
}

uint64_t vision::mod::LivenessCheckPredictor::runIDMatching(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  if (*a2 == a2[1]) {
    return 5;
  }
  uint64_t v4 = *a3;
  uint64_t v3 = a3[1];
  if (*a3 == v3) {
    return 5;
  }
  uint64_t v5 = 0;
  unint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  unint64_t v122 = 0;
  int v123 = 0;
  unint64_t v124 = 0;
  BOOL v119 = 0;
  uint64_t v120 = 0;
  double v121 = 0;
  do
  {
    if (v5 < v7)
    {
      *(_DWORD *)uint64_t v5 = *(_DWORD *)(v4 + 4 * v6);
      uint64_t v9 = (uint64_t)(v5 + 4);
      goto LABEL_5;
    }
    uint64_t v12 = (v5 - v8) >> 2;
    unint64_t v13 = v12 + 1;
    if ((unint64_t)(v12 + 1) >> 62) {
      std::vector<float>::__throw_length_error[abi:ne180100]();
    }
    if ((v7 - v8) >> 1 > v13) {
      unint64_t v13 = (v7 - v8) >> 1;
    }
    if ((unint64_t)(v7 - v8) >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v14 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v14 = v13;
    }
    if (v14)
    {
      if (v14 >> 62) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      uint64_t v15 = v3;
      BOOL v16 = operator new(4 * v14);
      uint64_t v3 = v15;
      uint64_t v17 = &v16[4 * v12];
      _DWORD *v17 = *(_DWORD *)(v4 + 4 * v6);
      uint64_t v9 = (uint64_t)(v17 + 1);
      if (v5 == v8) {
        goto LABEL_21;
      }
    }
    else
    {
      BOOL v16 = 0;
      uint64_t v17 = (_DWORD *)(4 * v12);
      *(_DWORD *)(4 * v12) = *(_DWORD *)(v4 + 4 * v6);
      uint64_t v9 = 4 * v12 + 4;
      if (v5 == v8) {
        goto LABEL_21;
      }
    }
    unint64_t v18 = v5 - 4 - v8;
    if (v18 >= 0xBC)
    {
      if (&v16[v5 - v8 - 4 - (v18 & 0xFFFFFFFFFFFFFFFCLL)] > &v16[v5 - v8 - 4])
      {
        int v19 = v5;
      }
      else if (&v5[-(v18 & 0xFFFFFFFFFFFFFFFCLL) - 4] > v5 - 4)
      {
        int v19 = v5;
      }
      else if ((unint64_t)(v8 - v16) >= 0x20)
      {
        uint64_t v21 = (v18 >> 2) + 1;
        uint64_t v22 = 4 * (v21 & 0x7FFFFFFFFFFFFFF8);
        int v19 = &v5[-v22];
        uint64_t v17 = (_DWORD *)((char *)v17 - v22);
        size_t v23 = &v16[4 * v12 - 16];
        int v24 = v5 - 16;
        uint64_t v25 = v21 & 0x7FFFFFFFFFFFFFF8;
        do
        {
          long long v26 = *(_OWORD *)v24;
          *(v23 - 1) = *((_OWORD *)v24 - 1);
          *size_t v23 = v26;
          v23 -= 2;
          v24 -= 32;
          v25 -= 8;
        }
        while (v25);
        if (v21 == (v21 & 0x7FFFFFFFFFFFFFF8)) {
          goto LABEL_21;
        }
      }
      else
      {
        int v19 = v5;
      }
    }
    else
    {
      int v19 = v5;
    }
    do
    {
      int v20 = *((_DWORD *)v19 - 1);
      v19 -= 4;
      *--uint64_t v17 = v20;
    }
    while (v19 != v8);
LABEL_21:
    uint64_t v7 = &v16[4 * v14];
    BOOL v119 = v17;
    double v121 = v7;
    if (v8)
    {
      operator delete(v8);
      uint64_t v4 = *a3;
      uint64_t v3 = a3[1];
    }
    uint64_t v8 = (char *)v17;
LABEL_5:
    uint64_t v120 = v9;
    ++v6;
    unint64_t v10 = v3 - v4;
    unint64_t v11 = (v3 - v4) >> 2;
    uint64_t v5 = (char *)v9;
  }
  while (v11 > v6);
  uint64_t v28 = a1;
  if (v3 != v4)
  {
    if (v10 < 8)
    {
      unint64_t v29 = 0;
      int32x2_t v30 = 0;
      goto LABEL_41;
    }
    unint64_t v29 = v11 & 0xFFFFFFFFFFFFFFFELL;
    int v31 = (float *)((char *)v119 + 4);
    int32x2_t v30 = 0;
    unint64_t v32 = v11 & 0xFFFFFFFFFFFFFFFELL;
    do
    {
      *(float *)v30.i32 = (float)(*(float *)v30.i32 + (float)(*(v31 - 1) * *(v31 - 1))) + (float)(*v31 * *v31);
      v31 += 2;
      v32 -= 2;
    }
    while (v32);
    if (v11 != v29)
    {
LABEL_41:
      uint64_t v33 = (float *)((char *)v119 + 4 * v29);
      unint64_t v34 = v11 - v29;
      do
      {
        float v35 = *v33++;
        *(float *)v30.i32 = *(float *)v30.i32 + (float)(v35 * v35);
        --v34;
      }
      while (v34);
    }
    BOOL v36 = (char *)v119;
    *(float *)v30.i32 = sqrtf(*(float *)v30.i32);
    if (v10 < 0x20)
    {
      unint64_t v37 = 0;
      goto LABEL_48;
    }
    unint64_t v37 = v11 & 0xFFFFFFFFFFFFFFF8;
    float32x4_t v38 = (float32x4_t)vdupq_lane_s32(v30, 0);
    float v39 = (float32x4_t *)((char *)v119 + 16);
    unint64_t v40 = v11 & 0xFFFFFFFFFFFFFFF8;
    do
    {
      float32x4_t v41 = vdivq_f32(*v39, v38);
      v39[-1] = vdivq_f32(v39[-1], v38);
      float32x4_t *v39 = v41;
      v39 += 2;
      v40 -= 8;
    }
    while (v40);
    if (v11 != v37)
    {
LABEL_48:
      int v42 = (float *)&v36[4 * v37];
      unint64_t v43 = v11 - v37;
      do
      {
        float *v42 = *v42 / *(float *)v30.i32;
        ++v42;
        --v43;
      }
      while (v43);
    }
  }
  int v44 = std::vector<std::vector<float>>::__push_back_slow_path<std::vector<float> const&>((char **)&v122, (uint64_t)&v119);
  int v123 = v44;
  *(_DWORD *)(a1 + 296) = 0;
  uint64_t v45 = *a2;
  if (a2[1] == *a2) {
    goto LABEL_102;
  }
  unint64_t v46 = 0;
  while (2)
  {
    __p = 0;
    BOOL v117 = 0;
    int v118 = 0;
    BOOL v47 = (uint64_t *)(v45 + 24 * v46);
    uint64_t v48 = *v47;
    if (v47[1] != *v47)
    {
      BOOL v49 = 0;
      unint64_t v50 = 0;
      while (1)
      {
        if (v49 < v118)
        {
          *(_DWORD *)BOOL v49 = *(_DWORD *)(v48 + 4 * v50);
          uint64_t v51 = (uint64_t)(v49 + 4);
        }
        else
        {
          float v54 = (char *)__p;
          int64_t v55 = v49 - (unsigned char *)__p;
          uint64_t v56 = (v49 - (unsigned char *)__p) >> 2;
          unint64_t v57 = v56 + 1;
          if ((unint64_t)(v56 + 1) >> 62) {
            std::vector<float>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v58 = v118 - (unsigned char *)__p;
          if ((v118 - (unsigned char *)__p) >> 1 > v57) {
            unint64_t v57 = v58 >> 1;
          }
          if ((unint64_t)v58 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v59 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v59 = v57;
          }
          if (v59)
          {
            if (v59 >> 62) {
              std::__throw_bad_array_new_length[abi:ne180100]();
            }
            uint64_t v60 = operator new(4 * v59);
            int v61 = &v60[4 * v56];
            *int v61 = *(_DWORD *)(v48 + 4 * v50);
            uint64_t v51 = (uint64_t)(v61 + 1);
            if (v49 != v54)
            {
LABEL_67:
              unint64_t v62 = v49 - 4 - v54;
              if (v62 < 0xBC
                || &v60[v55 - 4 - (v62 & 0xFFFFFFFFFFFFFFFCLL)] > &v60[v55 - 4]
                || &v49[-(v62 & 0xFFFFFFFFFFFFFFFCLL) - 4] > v49 - 4
                || (unint64_t)(v49 - &v60[v55]) < 0x20)
              {
                float64x2_t v63 = v49;
              }
              else
              {
                uint64_t v65 = (v62 >> 2) + 1;
                uint64_t v66 = 4 * (v65 & 0x7FFFFFFFFFFFFFF8);
                float64x2_t v63 = &v49[-v66];
                int v61 = (_DWORD *)((char *)v61 - v66);
                size_t v67 = &v60[4 * v56 - 16];
                int v68 = v49 - 16;
                uint64_t v69 = v65 & 0x7FFFFFFFFFFFFFF8;
                do
                {
                  long long v70 = *(_OWORD *)v68;
                  *(v67 - 1) = *((_OWORD *)v68 - 1);
                  _OWORD *v67 = v70;
                  v67 -= 2;
                  v68 -= 32;
                  v69 -= 8;
                }
                while (v69);
                if (v65 == (v65 & 0x7FFFFFFFFFFFFFF8))
                {
LABEL_70:
                  __p = v61;
                  BOOL v117 = (unsigned char *)v51;
                  int v118 = &v60[4 * v59];
                  if (!v54) {
                    goto LABEL_56;
                  }
LABEL_74:
                  operator delete(v54);
                  uint64_t v45 = *a2;
                  goto LABEL_56;
                }
              }
              do
              {
                int v64 = *((_DWORD *)v63 - 1);
                v63 -= 4;
                *--int v61 = v64;
              }
              while (v63 != v54);
              goto LABEL_70;
            }
          }
          else
          {
            uint64_t v60 = 0;
            int v61 = (_DWORD *)(4 * v56);
            *(_DWORD *)(4 * v56) = *(_DWORD *)(v48 + 4 * v50);
            uint64_t v51 = 4 * v56 + 4;
            if (v49 != v54) {
              goto LABEL_67;
            }
          }
          __p = v61;
          BOOL v117 = (unsigned char *)v51;
          int v118 = &v60[4 * v59];
          if (v54) {
            goto LABEL_74;
          }
        }
LABEL_56:
        BOOL v117 = (unsigned char *)v51;
        ++v50;
        int v52 = (uint64_t *)(v45 + 24 * v46);
        uint64_t v48 = *v52;
        unint64_t v53 = (v52[1] - *v52) >> 2;
        BOOL v49 = (char *)v51;
        if (v53 <= v50) {
          goto LABEL_83;
        }
      }
    }
    unint64_t v53 = 0;
LABEL_83:
    if (v53)
    {
      uint64_t v71 = 0;
      int32x2_t v72 = 0;
      do
      {
        *(float *)v72.i32 = *(float *)v72.i32 + (float)(*((float *)__p + v71) * *((float *)__p + v71));
        ++v71;
      }
      while (v53 != v71);
      v73 = (char *)__p;
      *(float *)v72.i32 = sqrtf(*(float *)v72.i32);
      if (v53 < 8)
      {
        unint64_t v74 = 0;
        goto LABEL_91;
      }
      unint64_t v74 = v53 & 0xFFFFFFFFFFFFFFF8;
      float32x4_t v75 = (float32x4_t)vdupq_lane_s32(v72, 0);
      uint64_t v76 = (float32x4_t *)((char *)__p + 16);
      unint64_t v77 = v53 & 0xFFFFFFFFFFFFFFF8;
      do
      {
        float32x4_t v78 = vdivq_f32(*v76, v75);
        v76[-1] = vdivq_f32(v76[-1], v75);
        *uint64_t v76 = v78;
        v76 += 2;
        v77 -= 8;
      }
      while (v77);
      if (v53 != v74)
      {
LABEL_91:
        unint64_t v79 = (float *)&v73[4 * v74];
        unint64_t v80 = v53 - v74;
        do
        {
          *unint64_t v79 = *v79 / *(float *)v72.i32;
          ++v79;
          --v80;
        }
        while (v80);
      }
    }
    float64x2_t v81 = v123;
    if ((unint64_t)v123 >= v124)
    {
      uint64_t v86 = std::vector<std::vector<float>>::__push_back_slow_path<std::vector<float> const&>((char **)&v122, (uint64_t)&__p);
    }
    else
    {
      *(void *)int v123 = 0;
      *((void *)v81 + 1) = 0;
      *((void *)v81 + 2) = 0;
      float64x2_t v82 = __p;
      int64_t v83 = v117 - (unsigned char *)__p;
      if (v117 != __p)
      {
        if (v83 < 0) {
          std::vector<float>::__throw_length_error[abi:ne180100]();
        }
        float v84 = (char *)operator new(v117 - (unsigned char *)__p);
        *(void *)float64x2_t v81 = v84;
        *((void *)v81 + 1) = v84;
        unint64_t v85 = &v84[4 * (v83 >> 2)];
        *((void *)v81 + 2) = v85;
        memcpy(v84, v82, v83);
        *((void *)v81 + 1) = v85;
      }
      uint64_t v86 = v81 + 24;
    }
    int v123 = v86;
    if (__p)
    {
      BOOL v117 = __p;
      operator delete(__p);
    }
    ++v46;
    uint64_t v45 = *a2;
    if (0xAAAAAAAAAAAAAAABLL * ((a2[1] - *a2) >> 3) > v46) {
      continue;
    }
    break;
  }
  int v44 = v123;
  uint64_t v28 = a1;
LABEL_102:
  *(_DWORD *)(v28 + 296) = 1065353216;
  int v87 = (char *)v122;
  unint64_t v88 = 0xAAAAAAAAAAAAAAABLL * ((v44 - (unsigned char *)v122) >> 3);
  if (v88 != 1)
  {
    uint64_t v89 = 0;
    uint64_t v90 = 1;
    float v91 = 1.0;
    do
    {
      uint64_t v92 = v89 + 1;
      if (v88 > v89 + 1)
      {
        int v95 = (float **)&v87[24 * v89];
        int v93 = *v95;
        BOOL v94 = v95[1];
        unint64_t v96 = v94 - *v95;
        if (v96 <= 1) {
          unint64_t v96 = 1;
        }
        if (v94 == v93)
        {
          unint64_t v107 = v88;
          do
            --v107;
          while (v90 != v107);
          *(float *)(v28 + 296) = v91;
        }
        else
        {
          uint64_t v97 = v90;
          do
          {
            double v98 = *(float **)&v87[24 * v97];
            float v99 = 0.0;
            unint64_t v100 = v96;
            int v101 = v93;
            float v102 = 0.0;
            float v103 = 0.0;
            do
            {
              float v104 = *v101++;
              float v105 = v104;
              float v106 = *v98++;
              float v103 = v103 + (float)(v105 * v106);
              float v102 = v102 + (float)(v105 * v105);
              float v99 = v99 + (float)(v106 * v106);
              --v100;
            }
            while (v100);
            float v91 = fminf(v91, (float)((float)(v103 / (float)(sqrtf(v102) * sqrtf(v99))) + 1.0) * 0.5);
            *(float *)(v28 + 296) = v91;
            ++v97;
          }
          while (v97 != v88);
        }
      }
      ++v90;
      uint64_t v89 = v92;
    }
    while (v92 != v88 - 1);
  }
  if (v119)
  {
    uint64_t v120 = (uint64_t)v119;
    operator delete(v119);
    int v87 = (char *)v122;
  }
  if (v87)
  {
    BOOL v108 = v123;
    int v109 = v87;
    if (v123 != v87)
    {
      double v110 = v123;
      do
      {
        int v112 = (void *)*((void *)v110 - 3);
        v110 -= 24;
        uint64_t v111 = v112;
        if (v112)
        {
          *((void *)v108 - 2) = v111;
          operator delete(v111);
        }
        BOOL v108 = v110;
      }
      while (v110 != v87);
      int v109 = v122;
    }
    int v123 = v87;
    operator delete(v109);
  }
  return 0;
}

void sub_21F086380(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, uint64_t a17, void *a18, uint64_t a19)
{
  if (!__p)
  {
    std::vector<std::vector<float>>::~vector[abi:ne180100](&a18);
    _Unwind_Resume(a1);
  }
  operator delete(__p);
  std::vector<std::vector<float>>::~vector[abi:ne180100](&a18);
  _Unwind_Resume(a1);
}

uint64_t vision::mod::LivenessCheckPredictor::runSpoofingClassification(vision::mod::LivenessCheckPredictor *this, const float *a2, float *a3, const float *a4, const float *a5, const float *a6)
{
  float v6 = *a3;
  float v7 = *((float *)this + 16);
  BOOL v8 = *a2 < *((float *)this + 15) || v6 > v7;
  if (v8 || *a5 < *((float *)this + 19) || *a4 >= *((float *)this + 17) || *a6 < *((float *)this + 21))
  {
    if (v6 <= v7)
    {
      if (*a4 < *((float *)this + 17) || *a5 >= *((float *)this + 19))
      {
        if (*a6 >= *((float *)this + 21)) {
          int v10 = 0;
        }
        else {
          int v10 = 2;
        }
        *((_DWORD *)this + 75) = v10;
        return 0;
      }
      else
      {
        *((_DWORD *)this + 75) = 2;
        return 0;
      }
    }
    else
    {
      *((_DWORD *)this + 75) = 2;
      return 0;
    }
  }
  else
  {
    *((_DWORD *)this + 75) = 1;
    return 0;
  }
}

void __clang_call_terminate(void *a1)
{
}

void *std::vector<std::vector<float>>::vector(void *a1, unint64_t a2, uint64_t a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    if (a2 >= 0xAAAAAAAAAAAAAABLL) {
      std::vector<float>::__throw_length_error[abi:ne180100]();
    }
    float v6 = operator new(24 * a2);
    float v7 = v6;
    *a1 = v6;
    a1[1] = v6;
    BOOL v8 = &v6[3 * a2];
    a1[2] = v8;
    uint64_t v9 = *(const void **)a3;
    int64_t v10 = *(void *)(a3 + 8) - *(void *)a3;
    if (v10)
    {
      if (v10 < 0)
      {
        void *v6 = 0;
        v6[1] = 0;
        v6[2] = 0;
        std::vector<float>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v11 = 24 * a2;
      do
      {
        *float v7 = 0;
        v7[1] = 0;
        v7[2] = 0;
        uint64_t v12 = (char *)operator new(v10);
        *float v7 = v12;
        v7[1] = v12;
        unint64_t v13 = &v12[4 * (v10 >> 2)];
        v7[2] = v13;
        memcpy(v12, v9, v10);
        v7[1] = v13;
        v7 += 3;
        v11 -= 24;
      }
      while (v11);
    }
    else
    {
      bzero(v6, 24 * ((24 * a2 - 24) / 0x18) + 24);
    }
    a1[1] = v8;
  }
  return a1;
}

void sub_21F08661C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  uint64_t v12 = *(void **)v10;
  if (*(void *)v10)
  {
    *(void *)(v10 + 8) = v12;
    operator delete(v12);
  }
  *(void *)(v9 + 8) = v10;
  std::__exception_guard_exceptions<std::vector<std::vector<float>>::__destroy_vector>::~__exception_guard_exceptions[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

void sub_21F086644(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
}

void sub_21F086658(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  std::__exception_guard_exceptions<std::vector<std::vector<float>>::__destroy_vector>::~__exception_guard_exceptions[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

void ***std::__exception_guard_exceptions<std::vector<std::vector<float>>::__destroy_vector>::~__exception_guard_exceptions[abi:ne180100](void ***result)
{
  uint64_t v1 = result;
  if (!*((unsigned char *)result + 8))
  {
    float32x2_t v2 = *result;
    uint64_t v3 = (char *)**result;
    if (v3)
    {
      uint64_t v4 = (char *)v2[1];
      uint64_t v5 = **result;
      if (v4 != v3)
      {
        float v6 = (char *)v2[1];
        do
        {
          BOOL v8 = (void *)*((void *)v6 - 3);
          v6 -= 24;
          float v7 = v8;
          if (v8)
          {
            *((void *)v4 - 2) = v7;
            operator delete(v7);
          }
          uint64_t v4 = v6;
        }
        while (v6 != v3);
        uint64_t v5 = **v1;
      }
      v2[1] = v3;
      operator delete(v5);
      return v1;
    }
  }
  return result;
}

void *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(void *a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x223C429C0](v13, a1);
  if (v13[0])
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *(void *)(v6 + 40);
    int v8 = *(_DWORD *)(v6 + 8);
    int v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      uint64_t v10 = std::locale::use_facet(&v14, MEMORY[0x263F8C108]);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20) {
      uint64_t v11 = a2 + a3;
    }
    else {
      uint64_t v11 = a2;
    }
    if (!std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  MEMORY[0x223C429D0](v13);
  return a1;
}

void sub_21F086848(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  MEMORY[0x223C429D0](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x21F086828);
}

void sub_21F08689C(_Unwind_Exception *a1)
{
}

uint64_t std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6 = a1;
  if (a1)
  {
    uint64_t v11 = *(void *)(a5 + 24);
    if (v11 <= a4 - a2) {
      size_t v12 = 0;
    }
    else {
      size_t v12 = v11 - (a4 - a2);
    }
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1) != a3 - a2) {
      return 0;
    }
    if ((uint64_t)v12 >= 1)
    {
      if (v12 >= 0x7FFFFFFFFFFFFFF8) {
        std::string::__throw_length_error[abi:ne180100]();
      }
      if (v12 >= 0x17)
      {
        uint64_t v14 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v12 | 7) != 0x17) {
          uint64_t v14 = v12 | 7;
        }
        uint64_t v15 = v14 + 1;
        unint64_t v13 = (void **)operator new(v14 + 1);
        __b[1] = (void *)v12;
        int64_t v22 = v15 | 0x8000000000000000;
        __b[0] = v13;
      }
      else
      {
        HIBYTE(v22) = v12;
        unint64_t v13 = __b;
      }
      memset(v13, __c, v12);
      *((unsigned char *)v13 + v12) = 0;
      if (v22 >= 0) {
        BOOL v16 = __b;
      }
      else {
        BOOL v16 = (void **)__b[0];
      }
      uint64_t v17 = (*(uint64_t (**)(uint64_t, void **, size_t))(*(void *)v6 + 96))(v6, v16, v12);
      uint64_t v18 = v17;
      if (SHIBYTE(v22) < 0)
      {
        operator delete(__b[0]);
        if (v18 != v12) {
          return 0;
        }
      }
      else if (v17 != v12)
      {
        return 0;
      }
    }
    uint64_t v19 = a4 - a3;
    if (v19 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v6 + 96))(v6, a3, v19) == v19)
    {
      *(void *)(a5 + 24) = 0;
      return v6;
    }
    return 0;
  }
  return v6;
}

void sub_21F086A84(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void *std::vector<std::vector<float>>::vector(void *a1, uint64_t *a2)
{
  a1[2] = 0;
  uint64_t v3 = (uint64_t)(a1 + 2);
  *a1 = 0;
  a1[1] = 0;
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  int64_t v6 = v5 - *a2;
  if (v5 != *a2)
  {
    unint64_t v7 = 0xAAAAAAAAAAAAAAABLL * (v6 >> 3);
    if (v7 >= 0xAAAAAAAAAAAAAABLL) {
      std::vector<float>::__throw_length_error[abi:ne180100]();
    }
    int v8 = operator new(v6);
    *a1 = v8;
    a1[1] = v8;
    a1[2] = &v8[3 * v7];
    a1[1] = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<float>>,std::vector<float>*,std::vector<float>*,std::vector<float>*>(v3, v4, v5, v8);
  }
  return a1;
}

void sub_21F086B64(_Unwind_Exception *exception_object)
{
  *(void *)(v1 + 8) = v2;
  if (*(void *)v1) {
    std::vector<std::vector<float>>::vector((void **)(v1 + 8), *(char **)v1, (void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<float>>,std::vector<float>*,std::vector<float>*,std::vector<float>*>(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a2 != a3)
  {
    uint64_t v6 = a2;
    do
    {
      *a4 = 0;
      a4[1] = 0;
      a4[2] = 0;
      int v9 = *(const void **)v6;
      uint64_t v8 = *(void *)(v6 + 8);
      int64_t v10 = v8 - *(void *)v6;
      if (v8 != *(void *)v6)
      {
        if (v10 < 0) {
          std::vector<float>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v11 = (char *)operator new(v8 - *(void *)v6);
        *a4 = v11;
        a4[1] = v11;
        unint64_t v7 = &v11[4 * (v10 >> 2)];
        a4[2] = v7;
        memcpy(v11, v9, v10);
        a4[1] = v7;
      }
      a4 += 3;
      v6 += 24;
    }
    while (v6 != a3);
  }
  return a4;
}

void sub_21F086C5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_21F086C70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v11 = *(void **)v9;
  if (*(void *)v9)
  {
    *(void *)(v9 + 8) = v11;
    operator delete(v11);
  }
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<float>>,std::vector<float>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<float>>,std::vector<float>*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24))
  {
    uint64_t v3 = **(void **)(a1 + 16);
    uint64_t v4 = **(void **)(a1 + 8);
    if (v3 != v4)
    {
      uint64_t v5 = **(void **)(a1 + 16);
      do
      {
        unint64_t v7 = *(void **)(v5 - 24);
        v5 -= 24;
        uint64_t v6 = v7;
        if (v7)
        {
          *(void *)(v3 - 16) = v6;
          operator delete(v6);
        }
        uint64_t v3 = v5;
      }
      while (v5 != v4);
    }
  }
  return a1;
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_264501968, MEMORY[0x263F8C068]);
}

void sub_21F086D4C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C390] + 16);
  return result;
}

char *std::vector<std::vector<float>>::__push_back_slow_path<std::vector<float> const&>(char **a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  unint64_t v5 = 0xAAAAAAAAAAAAAAABLL * ((v3 - *a1) >> 3);
  unint64_t v6 = v5 + 1;
  if (v5 + 1 > 0xAAAAAAAAAAAAAAALL) {
    std::vector<float>::__throw_length_error[abi:ne180100]();
  }
  if (0x5555555555555556 * ((a1[2] - v4) >> 3) > v6) {
    unint64_t v6 = 0x5555555555555556 * ((a1[2] - v4) >> 3);
  }
  if (0xAAAAAAAAAAAAAAABLL * ((a1[2] - v4) >> 3) >= 0x555555555555555) {
    unint64_t v8 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v8 = v6;
  }
  if (v8)
  {
    if (v8 > 0xAAAAAAAAAAAAAAALL) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    uint64_t v9 = (char *)operator new(24 * v8);
  }
  else
  {
    uint64_t v9 = 0;
  }
  int64_t v10 = &v9[24 * v5];
  uint64_t v11 = &v9[24 * v8];
  *((void *)v10 + 1) = 0;
  size_t v12 = (char **)(v10 + 8);
  *((void *)v10 + 2) = 0;
  *(void *)int64_t v10 = 0;
  unint64_t v13 = *(const void **)a2;
  int64_t v14 = *(void *)(a2 + 8) - *(void *)a2;
  if (v14)
  {
    if (v14 < 0) {
      std::vector<float>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v15 = (char *)operator new(v14);
    *(void *)int64_t v10 = v15;
    void *v12 = v15;
    BOOL v16 = &v15[4 * (v14 >> 2)];
    *((void *)v10 + 2) = v16;
    memcpy(v15, v13, v14);
    void *v12 = v16;
  }
  uint64_t v17 = v10 + 24;
  uint64_t v25 = v10 + 24;
  if (v3 == v4)
  {
    *a1 = v10;
    a1[1] = v17;
    a1[2] = v11;
  }
  else
  {
    do
    {
      uint64_t v18 = v10;
      *((void *)v10 - 2) = 0;
      *((void *)v10 - 1) = 0;
      long long v19 = *(_OWORD *)(v3 - 24);
      v3 -= 24;
      *(_OWORD *)(v10 - 24) = v19;
      v10 -= 24;
      *((void *)v18 - 1) = *((void *)v3 + 2);
      *(void *)uint64_t v3 = 0;
      *((void *)v3 + 1) = 0;
      *((void *)v3 + 2) = 0;
    }
    while (v3 != v4);
    int v20 = *a1;
    uint64_t v3 = a1[1];
    uint64_t v17 = v25;
    *a1 = v10;
    a1[1] = v25;
    a1[2] = v11;
    if (v3 != v20)
    {
      uint64_t v21 = v3;
      do
      {
        size_t v23 = (void *)*((void *)v21 - 3);
        v21 -= 24;
        int64_t v22 = v23;
        if (v23)
        {
          *((void *)v3 - 2) = v22;
          operator delete(v22);
        }
        uint64_t v3 = v21;
      }
      while (v21 != v20);
      uint64_t v3 = v20;
    }
  }
  if (v3) {
    operator delete(v3);
  }
  return v17;
}

void sub_21F086F80(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  unint64_t v5 = *v2;
  if (*v2)
  {
    *uint64_t v3 = v5;
    operator delete(v5);
  }
  std::__split_buffer<std::vector<float>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::__split_buffer<std::vector<float>>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != v3)
  {
    do
    {
      while (1)
      {
        uint64_t v5 = v2 - 24;
        uint64_t v4 = *(void **)(v2 - 24);
        *(void *)(a1 + 16) = v2 - 24;
        if (!v4) {
          break;
        }
        *(void *)(v2 - 16) = v4;
        operator delete(v4);
        uint64_t v2 = *(void *)(a1 + 16);
        if (v2 == v3) {
          goto LABEL_6;
        }
      }
      v2 -= 24;
    }
    while (v5 != v3);
  }
LABEL_6:
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

id VNFaceLandmarkRegion2DGetNormalizedPoints(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 pointCount];
  uint64_t v3 = (void *)[MEMORY[0x263EFFA68] mutableCopy];
  id v4 = v1;
  uint64_t v5 = [v4 normalizedPoints];
  if (v2)
  {
    unint64_t v6 = (double *)(v5 + 8);
    do
    {
      unint64_t v7 = [NSNumber numberWithDouble:*(v6 - 1)];
      [v3 addObject:v7];

      double v8 = *v6;
      v6 += 2;
      uint64_t v9 = [NSNumber numberWithDouble:v8];
      [v3 addObject:v9];

      --v2;
    }
    while (v2);
  }

  return v3;
}

uint64_t VNFaceObservationWithAVFoundationFaceBounds(double a1, double a2, double a3, double a4)
{
  uint64_t v8 = __VNFaceObservationWithAVFoundationFaceBounds_block_invoke();
  uint64_t v9 = (void *)MEMORY[0x263F1EED0];
  return objc_msgSend(v9, "faceObservationWithRequestRevision:boundingBox:roll:yaw:pitch:", v8, 0, 0, 0, a1, a2, a3, a4);
}

uint64_t __VNFaceObservationWithAVFoundationFaceBounds_block_invoke()
{
  uint64_t v0 = MGGetProductType();
  if (v0 <= 2081274471)
  {
    if (v0 > 1060988940)
    {
      if (v0 > 1429914405)
      {
        if (v0 > 1737882205)
        {
          if (v0 != 1737882206)
          {
            if (v0 != 2032616841)
            {
              uint64_t v1 = 2080700391;
              goto LABEL_39;
            }
            return 2;
          }
          return 1;
        }
        if (v0 == 1429914406) {
          return 1;
        }
        uint64_t v2 = 1721691077;
        return v0 == v2;
      }
      if (v0 > 1234705394)
      {
        if (v0 != 1234705395)
        {
          uint64_t v1 = 1371389549;
LABEL_39:
          if (v0 == v1) {
            return 3737841664;
          }
          return 0;
        }
        return 2;
      }
      if (v0 != 1060988941)
      {
        if (v0 != 1169082144) {
          return 0;
        }
        return 3737841666;
      }
      return 3;
    }
    if (v0 <= 502329936)
    {
      if (v0 > 337183580)
      {
        if (v0 == 337183581) {
          return 1;
        }
        uint64_t v2 = 445396642;
      }
      else
      {
        if (v0 == 42878382) {
          return 1;
        }
        uint64_t v2 = 253148925;
      }
      return v0 == v2;
    }
    if (v0 <= 910181309)
    {
      if (v0 == 502329937) {
        return 1;
      }
      uint64_t v4 = 689804742;
LABEL_47:
      if (v0 != v4) {
        return 0;
      }
      return 3;
    }
    if (v0 == 910181310) {
      return 2;
    }
    uint64_t v2 = 952317141;
    return v0 == v2;
  }
  if (v0 > 2722529671)
  {
    if (v0 > 3242623366)
    {
      if (v0 > 3743999267)
      {
        if (v0 == 3743999268) {
          return 2;
        }
        if (v0 != 3885279870 && v0 != 4201643249) {
          return 0;
        }
        return 3737841666;
      }
      if (v0 == 3242623367) {
        return 1;
      }
      uint64_t v4 = 3585085679;
      goto LABEL_47;
    }
    if (v0 > 3001488777)
    {
      if (v0 == 3001488778) {
        return 3737841666;
      }
      uint64_t v2 = 3196805751;
    }
    else
    {
      if (v0 == 2722529672) {
        return 3737841664;
      }
      uint64_t v2 = 2781508713;
    }
    return v0 == v2;
  }
  if (v0 > 2309863437)
  {
    if (v0 > 2336512886)
    {
      if (v0 == 2336512887) {
        return 1;
      }
      uint64_t v2 = 2468178735;
    }
    else
    {
      if (v0 == 2309863438) {
        return 3;
      }
      uint64_t v2 = 2311900306;
    }
    return v0 == v2;
  }
  if (v0 > 2162679682)
  {
    if (v0 == 2162679683) {
      return 1;
    }
    uint64_t v2 = 2270970153;
    return v0 == v2;
  }
  if (v0 == 2081274472) {
    return 1;
  }
  if (v0 == 2159747553) {
    return 3737841666;
  }
  return 0;
}

id PADAuditDataRepositoryDefault()
{
  if (__PADAuditDataRepositoryDefault_block_invoke())
  {
    id WeakRetained = objc_loadWeakRetained(&PADAuditDataRepositoryDefault__sharedInstance);

    if (WeakRetained)
    {
      id v1 = objc_loadWeakRetained(&PADAuditDataRepositoryDefault__sharedInstance);
    }
    else
    {
      uint64_t v3 = objc_alloc_init(_PADAuditDataRepository);
      objc_storeWeak(&PADAuditDataRepositoryDefault__sharedInstance, v3);
      id v1 = v3;
    }
  }
  else
  {
    id v1 = 0;
  }
  return v1;
}

uint64_t __PADAuditDataRepositoryDefault_block_invoke()
{
  uint64_t result = os_variant_has_internal_content();
  if (result)
  {
    id v1 = [MEMORY[0x263EFFA40] standardUserDefaults];
    uint64_t v2 = [v1 persistentDomainForName:*MEMORY[0x263F08100]];

    uint64_t v3 = [v2 objectForKeyedSubscript:@"CIDVPAD.persist-capture-data"];
    uint64_t v4 = v3;
    if (!v3) {
      uint64_t v3 = (void *)MEMORY[0x263EFFA80];
    }
    uint64_t v5 = [v3 BOOLValue];

    return v5;
  }
  return result;
}

id DataFromCGImage(uint64_t a1)
{
  id v1 = [MEMORY[0x263F00650] imageWithCGImage:a1];
  uint64_t v2 = [MEMORY[0x263F00628] context];
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  uint64_t v4 = [v2 JPEGRepresentationOfImage:v1 colorSpace:DeviceRGB options:MEMORY[0x263EFFA78]];
  CGColorSpaceRelease(DeviceRGB);

  return v4;
}

__CFString *PADLivenessGestureToString(unint64_t a1)
{
  if (a1 > 0xA) {
    return @"Unknown";
  }
  else {
    return off_264501AE8[a1];
  }
}

id PADVNFaceprintInit(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 faceprint];
  uint64_t v3 = [v2 elementCount];

  if (v3)
  {
    uint64_t v4 = [v1 faceprint];
    id v5 = [v4 descriptorData];
    unint64_t v6 = (int *)[v5 bytes];

    unint64_t v7 = [MEMORY[0x263EFF980] arrayWithCapacity:v3];
    do
    {
      int v9 = *v6++;
      LODWORD(v8) = v9;
      int64_t v10 = [NSNumber numberWithFloat:v8];
      [v7 addObject:v10];

      --v3;
    }
    while (v3);
  }
  else
  {
    uint64_t v11 = os_log_create("com.apple.CoreIDV", "RGBLiveness");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      PADVNFaceprintInit_cold_1(v11);
    }

    unint64_t v7 = 0;
  }

  return v7;
}

id VNCreateFaceprintRequestInit(void *a1)
{
  id v1 = (objc_class *)MEMORY[0x263F1EE50];
  id v2 = a1;
  uint64_t v3 = (void *)[[v1 alloc] initWithCompletionHandler:v2];

  id v8 = 0;
  char v4 = [v3 setRevision:3737841667 error:&v8];
  id v5 = v8;
  if ((v4 & 1) == 0)
  {
    unint64_t v6 = os_log_create("com.apple.CoreIDV", "RGBLiveness");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      VNCreateFaceprintRequestInit_cold_1((uint64_t)v5, v6);
    }
  }
  return v3;
}

_PADVNFaceprintDetector *PADVNFaceprintDetectorInit()
{
  uint64_t v0 = objc_alloc_init(_PADVNFaceprintDetector);
  return v0;
}

double CGRectUnit()
{
  return 0.0;
}

double CGRectGetArea(double a1, double a2, double a3, double a4)
{
  return a3 * a4;
}

uint64_t CGrectGetDescription(double a1, double a2, double a3, double a4)
{
  return [NSString stringWithFormat:@"{ x:%.3f, y:%.3f, w:%.3f, h:%.3f }", *(void *)&a1, *(void *)&a2, *(void *)&a3, *(void *)&a4];
}

double CGRectUnnormalized(unint64_t a1, double a2)
{
  return a2 * (double)a1;
}

void CGRectRotate(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  memset(&v17, 0, sizeof(v17));
  CGFloat MidX = CGRectGetMidX(*(CGRect *)&a1);
  v18.origin.x = a1;
  v18.origin.y = a2;
  v18.size.width = a3;
  v18.size.height = a4;
  CGFloat MidY = CGRectGetMidY(v18);
  CGAffineTransformMakeTranslation(&v17, MidX, MidY);
  CGAffineTransform v15 = v17;
  memset(&v16, 0, sizeof(v16));
  CGAffineTransformRotate(&v16, &v15, a5);
  memset(&v15, 0, sizeof(v15));
  v19.origin.x = a1;
  v19.origin.y = a2;
  v19.size.width = a3;
  v19.size.height = a4;
  CGFloat v12 = -CGRectGetMidX(v19);
  v20.origin.x = a1;
  v20.origin.y = a2;
  v20.size.width = a3;
  v20.size.height = a4;
  CGFloat v13 = CGRectGetMidY(v20);
  CGAffineTransform v14 = v16;
  CGAffineTransformTranslate(&v15, &v14, v12, -v13);
  CGAffineTransform v14 = v15;
  v21.origin.x = a1;
  v21.origin.y = a2;
  v21.size.width = a3;
  v21.size.height = a4;
  CGRectApplyAffineTransform(v21, &v14);
}

void CGRectTranslate(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  CGAffineTransformMakeTranslation(&v10, a5, a6);
  v11.origin.x = a1;
  v11.origin.y = a2;
  v11.size.width = a3;
  v11.size.height = a4;
  CGRectApplyAffineTransform(v11, &v10);
}

double CGRectCenterScaleUp(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5)
{
  double v10 = -(a5 * CGRectGetWidth(*(CGRect *)&a1)) * 0.5;
  v18.origin.x = a1;
  v18.origin.y = a2;
  v18.size.width = a3;
  v18.size.height = a4;
  double v11 = -(a5 * CGRectGetHeight(v18)) * 0.5;
  CGFloat v12 = a1;
  CGFloat v13 = a2;
  CGFloat v14 = a3;
  CGFloat v15 = a4;
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&v12, v10, v11);
  return result;
}

void CGRectAV2VN(double a1, double a2, double a3, double a4)
{
}

double CGRectVN2AV(double a1, double a2, double a3, double a4)
{
  return 1.0 - a2 - a4;
}

uint64_t PADClassifierFrameOptionsAllEnabled()
{
  return 65793;
}

uint64_t PADClassifierFrameOptionsInit(int a1, int a2, int a3)
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  if (a2) {
    int v4 = 256;
  }
  else {
    int v4 = 0;
  }
  return v4 | a1 | v3;
}

_PADClassifier *PADClassifierInit()
{
  uint64_t v0 = objc_alloc_init(_PADClassifier);
  return v0;
}

void sub_21F08AB34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id a32)
{
}

void type metadata accessor for CGImagePropertyOrientation(uint64_t a1)
{
}

uint64_t initializeBufferWithCopyOfBuffer for PADPrintReplayAssessment(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for PADPrintReplayAssessment(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for PADPrintReplayAssessment(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
}

void type metadata accessor for CVBuffer(uint64_t a1)
{
}

__n128 __swift_memcpy24_4(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t sub_21F08B2C0(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_21F08B2E0(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 24) = v3;
  return result;
}

void type metadata accessor for CMTime(uint64_t a1)
{
}

uint64_t sub_21F08B320()
{
  uint64_t v0 = sub_21F0C8FC8();
  __swift_allocate_value_buffer(v0, qword_267EBAB88);
  __swift_project_value_buffer(v0, (uint64_t)qword_267EBAB88);
  return sub_21F0C8FB8();
}

uint64_t sub_21F08B394(uint64_t a1, unint64_t a2)
{
  return sub_21F08B3A4(a1, a2, 1);
}

uint64_t sub_21F08B39C(uint64_t a1, unint64_t a2)
{
  return sub_21F08B3A4(a1, a2, 3);
}

uint64_t sub_21F08B3A4(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v6 = sub_21F0C8FC8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  int v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = sub_21F0A62AC(a3);
  if (result)
  {
    if (qword_267EBAB80 != -1) {
      swift_once();
    }
    uint64_t v11 = __swift_project_value_buffer(v6, (uint64_t)qword_267EBAB88);
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v11, v6);
    swift_bridgeObjectRetain_n();
    CGFloat v12 = sub_21F0C8FA8();
    os_log_type_t v13 = sub_21F0C9228();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = swift_slowAlloc();
      uint64_t v18 = a1;
      CGFloat v15 = (uint8_t *)v14;
      uint64_t v16 = swift_slowAlloc();
      uint64_t v20 = v16;
      *(_DWORD *)CGFloat v15 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v19 = sub_21F09D6AC(v18, a2, &v20);
      sub_21F0C9308();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21F07C000, v12, v13, "%s", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C43270](v16, -1, -1);
      MEMORY[0x223C43270](v15, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  return result;
}

uint64_t sub_21F08B610(uint64_t a1, uint64_t a2)
{
  return sub_21F08B790(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_21F08B63C(uint64_t a1, id *a2)
{
  uint64_t result = sub_21F0C9058();
  *a2 = 0;
  return result;
}

uint64_t sub_21F08B6B4(uint64_t a1, id *a2)
{
  char v3 = sub_21F0C9068();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_21F08B734@<X0>(uint64_t *a1@<X8>)
{
  sub_21F0C9078();
  uint64_t v2 = sub_21F0C9048();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_21F08B778(uint64_t a1, uint64_t a2)
{
  return sub_21F08B790(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_21F08B790(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_21F0C9078();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_21F08B7D4()
{
  sub_21F0C9078();
  sub_21F0C90B8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21F08B828()
{
  sub_21F0C9078();
  sub_21F0C9628();
  sub_21F0C90B8();
  uint64_t v0 = sub_21F0C9648();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_21F08B8A0()
{
  uint64_t v0 = sub_21F0C9078();
  uint64_t v2 = v1;
  if (v0 == sub_21F0C9078() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_21F0C95D8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_21F08B930(uint64_t a1)
{
  uint64_t v2 = sub_21F08BE18((unint64_t *)&qword_267EBACC0, type metadata accessor for CIImageRepresentationOption);
  uint64_t v3 = sub_21F08BE18(&qword_267EBACC8, type metadata accessor for CIImageRepresentationOption);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_21F08B9EC(uint64_t a1)
{
  uint64_t v2 = sub_21F08BE18((unint64_t *)&qword_267EBACD0, type metadata accessor for MLModelMetadataKey);
  uint64_t v3 = sub_21F08BE18(&qword_267EBACD8, type metadata accessor for MLModelMetadataKey);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_21F08BAA8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_21F0C9048();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_21F08BAF0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_21F0C9078();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_21F08BB1C(uint64_t a1)
{
  uint64_t v2 = sub_21F08BE18(&qword_267EBACE0, type metadata accessor for VNImageOption);
  uint64_t v3 = sub_21F08BE18(&qword_267EBACE8, type metadata accessor for VNImageOption);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void type metadata accessor for CIImageRepresentationOption(uint64_t a1)
{
}

void type metadata accessor for MLModelMetadataKey(uint64_t a1)
{
}

void type metadata accessor for VNImageOption(uint64_t a1)
{
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_21F08BCBC(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_21F08BCDC(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void type metadata accessor for CMTimeFlags(uint64_t a1)
{
}

void sub_21F08BD40(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_21F08BD88()
{
  return sub_21F08BE18(&qword_267EBAC78, type metadata accessor for VNImageOption);
}

uint64_t sub_21F08BDD0()
{
  return sub_21F08BE18(&qword_267EBAC80, type metadata accessor for VNImageOption);
}

uint64_t sub_21F08BE18(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21F08BE60()
{
  return sub_21F08BE18(&qword_267EBAC88, type metadata accessor for MLModelMetadataKey);
}

uint64_t sub_21F08BEA8()
{
  return sub_21F08BE18(&qword_267EBAC90, type metadata accessor for MLModelMetadataKey);
}

uint64_t sub_21F08BEF0()
{
  return sub_21F08BE18(&qword_267EBAC98, type metadata accessor for CIImageRepresentationOption);
}

uint64_t sub_21F08BF38()
{
  return sub_21F08BE18(&qword_267EBACA0, type metadata accessor for CIImageRepresentationOption);
}

uint64_t sub_21F08BF80()
{
  return sub_21F08BE18(&qword_267EBACA8, type metadata accessor for CIImageRepresentationOption);
}

uint64_t sub_21F08BFC8()
{
  return sub_21F08BE18(&qword_267EBACB0, type metadata accessor for MLModelMetadataKey);
}

uint64_t sub_21F08C010()
{
  return sub_21F08BE18(&qword_267EBACB8, type metadata accessor for VNImageOption);
}

char *sub_21F08C068()
{
  uint64_t v0 = sub_21F0C92B8();
  uint64_t v1 = *(void *)(v0 + 16);
  if (v1)
  {
    uint64_t v2 = (double *)(v0 + 40);
    char v3 = (char *)MEMORY[0x263F8EE78];
    do
    {
      double v5 = *(v2 - 1);
      double v4 = *v2;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        char v3 = sub_21F09C814(0, *((void *)v3 + 2) + 1, 1, v3);
      }
      unint64_t v7 = *((void *)v3 + 2);
      unint64_t v6 = *((void *)v3 + 3);
      int64_t v8 = v6 >> 1;
      unint64_t v9 = v7 + 1;
      if (v6 >> 1 <= v7)
      {
        char v3 = sub_21F09C814((char *)(v6 > 1), v7 + 1, 1, v3);
        unint64_t v6 = *((void *)v3 + 3);
        int64_t v8 = v6 >> 1;
      }
      float v10 = v5;
      *((void *)v3 + 2) = v9;
      *(float *)&v3[4 * v7 + 32] = v10;
      int64_t v11 = v7 + 2;
      if (v8 < v11) {
        char v3 = sub_21F09C814((char *)(v6 > 1), v11, 1, v3);
      }
      float v12 = v4;
      *((void *)v3 + 2) = v11;
      *(float *)&v3[4 * v9 + 32] = v12;
      v2 += 2;
      --v1;
    }
    while (v1);
  }
  else
  {
    char v3 = (char *)MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRelease();
  return v3;
}

id sub_21F08C194(void *a1, void *a2)
{
  aBlock[6] = *(id *)MEMORY[0x263EF8340];
  uint64_t v4 = sub_21F0C8FC8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unint64_t v7 = (char *)v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    aBlock[4] = a1;
    aBlock[5] = a2;
    aBlock[0] = (id)MEMORY[0x263EF8330];
    aBlock[1] = (id)1107296256;
    aBlock[2] = sub_21F0B200C;
    aBlock[3] = &block_descriptor_0;
    a1 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
  }
  id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F1EE80]), sel_initWithCompletionHandler_, a1);
  _Block_release(a1);
  aBlock[0] = 0;
  if (objc_msgSend(v8, sel_setRevision_error_, 2, aBlock))
  {
    id v9 = aBlock[0];
  }
  else
  {
    id v10 = aBlock[0];
    int64_t v11 = (void *)sub_21F0C8E78();

    swift_willThrow();
    if (qword_267EBAB80 != -1) {
      swift_once();
    }
    uint64_t v12 = __swift_project_value_buffer(v4, (uint64_t)qword_267EBAB88);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v12, v4);
    id v13 = v11;
    id v14 = v11;
    CGFloat v15 = sub_21F0C8FA8();
    os_log_type_t v16 = sub_21F0C9238();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = swift_slowAlloc();
      uint64_t v24 = v5;
      uint64_t v18 = (uint8_t *)v17;
      uint64_t v19 = (void *)swift_slowAlloc();
      aBlock[0] = v19;
      *(_DWORD *)uint64_t v18 = 136315138;
      v23[1] = v18 + 4;
      swift_getErrorValue();
      uint64_t v20 = sub_21F0C9618();
      uint64_t v25 = sub_21F09D6AC(v20, v21, (uint64_t *)aBlock);
      sub_21F0C9308();
      swift_bridgeObjectRelease();

      swift_arrayDestroy();
      MEMORY[0x223C43270](v19, -1, -1);
      MEMORY[0x223C43270](v18, -1, -1);

      (*(void (**)(char *, uint64_t))(v24 + 8))(v7, v4);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    }
  }
  return v8;
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t PADSWClassifierResult.livenessLabel.getter()
{
  return *(void *)v0;
}

uint64_t PADSWClassifierResult.gestureSequence.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PADSWClassifierResult.assessmentsFAC.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PADSWClassifierResult.assessmentsPRD.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PADSWClassifierResult.assessmentsTA.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PADSWClassifierResult.timestampsFAC.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PADSWClassifierResult.timestampsID.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PADSWClassifierResult.timestampsButtonPressed.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PADSWClassifierResult.faceprintsID.getter()
{
  return swift_bridgeObjectRetain();
}

float PADSWClassifierResult.assessmentFAC.getter()
{
  return *(float *)(v0 + 72);
}

uint64_t PADSWClassifierResult.assessmentTA.getter()
{
  return *(void *)(v0 + 80);
}

float PADSWClassifierResult.assessmentFakePRD.getter()
{
  return *(float *)(v0 + 88);
}

float PADSWClassifierResult.assessmentLivePRD.getter()
{
  return *(float *)(v0 + 92);
}

float PADSWClassifierResult.assessmentID.getter()
{
  return *(float *)(v0 + 96);
}

float PADSWClassifierResult.maxNccLow.getter()
{
  return *(float *)(v0 + 100);
}

float PADSWClassifierResult.maxNccHigh.getter()
{
  return *(float *)(v0 + 104);
}

uint64_t PADSWClassifierResult.ignoredStitches.getter()
{
  return *(void *)(v0 + 112);
}

uint64_t PADSWClassifierResult.deviceInfo.getter()
{
  uint64_t v1 = *(void *)(v0 + 120);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PADSWClassifierResult.ageLabel.getter()
{
  uint64_t v1 = *(void *)(v0 + 136);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PADSWClassifierResult.sexLabel.getter()
{
  uint64_t v1 = *(void *)(v0 + 152);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PADSWClassifierResult.skintoneLabel.getter()
{
  uint64_t v1 = *(void *)(v0 + 168);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PADSWClassifierResult.ethnicityLabel.getter()
{
  uint64_t v1 = *(void *)(v0 + 184);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PADSWClassifierResult.faceHairLabel.getter()
{
  uint64_t v1 = *(void *)(v0 + 200);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PADSWClassifierResult.headgearLabel.getter()
{
  uint64_t v1 = *(void *)(v0 + 216);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PADSWClassifierResult.glassesLabel.getter()
{
  uint64_t v1 = *(void *)(v0 + 232);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PADSWClassifierResult.init(livenessLabel:gestureSequence:assessmentsFAC:assessmentsPRD:assessmentsTA:timestampsFAC:timestampsID:timestampsButtonPressed:faceprintsID:assessmentFAC:assessmentTA:assessmentFakePRD:assessmentLivePRD:assessmentID:maxNccLow:maxNccHigh:ignoredStitches:deviceInfo:ageLabel:sexLabel:skintoneLabel:ethnicityLabel:faceHairLabel:headgearLabel:glassesLabel:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, float a10@<S0>, float a11@<S1>, float a12@<S2>, float a13@<S3>, float a14@<S4>, float a15@<S5>, uint64_t a16, uint64_t a17, long long a18, long long a19, long long a20,long long a21,long long a22,long long a23,long long a24,long long a25,uint64_t a26)
{
  *(void *)a9 = result;
  *(void *)(a9 + 8) = a2;
  *(void *)(a9 + 16) = a3;
  *(void *)(a9 + 24) = a4;
  *(void *)(a9 + 32) = a5;
  *(void *)(a9 + 40) = a6;
  *(void *)(a9 + 48) = a7;
  *(void *)(a9 + 56) = a8;
  *(void *)(a9 + 64) = a16;
  *(float *)(a9 + 72) = a10;
  *(void *)(a9 + 80) = a17;
  *(float *)(a9 + 88) = a11;
  *(float *)(a9 + 92) = a12;
  *(float *)(a9 + 96) = a13;
  *(float *)(a9 + 100) = a14;
  *(float *)(a9 + 104) = a15;
  *(_OWORD *)(a9 + 112) = a18;
  *(_OWORD *)(a9 + 128) = a19;
  *(_OWORD *)(a9 + 144) = a20;
  *(_OWORD *)(a9 + 160) = a21;
  *(_OWORD *)(a9 + 176) = a22;
  *(_OWORD *)(a9 + 192) = a23;
  *(_OWORD *)(a9 + 208) = a24;
  *(_OWORD *)(a9 + 224) = a25;
  *(void *)(a9 + 240) = a26;
  return result;
}

uint64_t sub_21F08C7DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  id v9 = a3;
  uint64_t v10 = *((void *)a3 + 1);
  swift_beginAccess();
  uint64_t v69 = v10;
  uint64_t v11 = *(void *)(a6 + 128);
  uint64_t v12 = *(void *)(a5 + 192);
  uint64_t v13 = *((void *)v9 + 2);
  v76[0] = v13;
  int64_t v14 = *(void *)(v13 + 16);
  uint64_t v62 = v12;
  uint64_t v63 = v11;
  if (v14)
  {
    uint64_t v58 = v9;
    uint64_t v15 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_21F09532C((uint64_t)v76);
    sub_21F0C38F8(0, v14, 0);
    uint64_t v16 = 0;
    uint64_t v70 = v13 + 32;
    do
    {
      uint64_t v17 = *(void *)(v70 + 8 * v16);
      int64_t v18 = *(void *)(v17 + 16);
      if (v18)
      {
        uint64_t v73 = MEMORY[0x263F8EE78];
        swift_bridgeObjectRetain();
        sub_21F0C38D0(0, v18, 0);
        uint64_t v19 = v73;
        unint64_t v20 = *(void *)(v73 + 16);
        uint64_t v21 = 32;
        do
        {
          uint64_t v22 = *(void *)(v17 + v21);
          unint64_t v23 = *(void *)(v73 + 24);
          if (v20 >= v23 >> 1) {
            sub_21F0C38D0(v23 > 1, v20 + 1, 1);
          }
          *(void *)(v73 + 16) = v20 + 1;
          *(void *)(v73 + 8 * v20 + 32) = v22;
          v21 += 24;
          ++v20;
          --v18;
        }
        while (v18);
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v19 = MEMORY[0x263F8EE78];
      }
      unint64_t v25 = *(void *)(v15 + 16);
      unint64_t v24 = *(void *)(v15 + 24);
      if (v25 >= v24 >> 1) {
        sub_21F0C38F8(v24 > 1, v25 + 1, 1);
      }
      ++v16;
      *(void *)(v15 + 16) = v25 + 1;
      *(void *)(v15 + 8 * v25 + 32) = v19;
    }
    while (v16 != v14);
    sub_21F095238((uint64_t)v76);
    id v9 = v58;
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v15 = MEMORY[0x263F8EE78];
  }
  uint64_t v26 = *((void *)v9 + 4);
  uint64_t v75 = v26;
  int64_t v27 = *(void *)(v26 + 16);
  uint64_t v28 = MEMORY[0x263F8EE78];
  if (v27)
  {
    uint64_t v74 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_21F0C38D0(0, v27, 0);
    uint64_t v28 = v74;
    unint64_t v29 = (uint64_t *)(v26 + 32);
    unint64_t v30 = *(void *)(v74 + 16);
    do
    {
      uint64_t v32 = *v29;
      v29 += 3;
      uint64_t v31 = v32;
      unint64_t v33 = *(void *)(v74 + 24);
      if (v30 >= v33 >> 1) {
        sub_21F0C38D0(v33 > 1, v30 + 1, 1);
      }
      *(void *)(v74 + 16) = v30 + 1;
      *(void *)(v74 + 8 * v30++ + 32) = v31;
      --v27;
    }
    while (v27);
    sub_21F095238((uint64_t)&v75);
  }
  uint64_t v34 = *((void *)v9 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_21F095238((uint64_t)v76);
  swift_bridgeObjectRelease();
  sub_21F095238((uint64_t)&v75);
  swift_beginAccess();
  uint64_t v35 = *(void *)(a5 + 160);
  id v36 = *(id *)(a5 + 168);
  sub_21F0C9298();
  sub_21F0C92A8();

  float v37 = sub_21F0BA048();
  float v38 = sub_21F0BA23C();
  uint64_t v39 = *(void *)(a5 + 176);
  swift_beginAccess();
  uint64_t v68 = *(void *)(a5 + 144);
  id v40 = *(id *)(a5 + 152);
  sub_21F0C9298();
  sub_21F0C92A8();

  float32x4_t v41 = (void *)sub_21F0C9048();
  int v42 = (void *)MGGetStringAnswer();

  uint64_t v71 = v35;
  uint64_t v72 = v34;
  if (v42)
  {
    sub_21F0C9068();
  }
  swift_release();
  swift_release();
  int v43 = *v9;
  int v44 = *(_DWORD *)a4;
  uint64_t v45 = *(void *)(a4 + 16);
  uint64_t v46 = *(void *)(a4 + 32);
  uint64_t v59 = *(void *)(a4 + 24);
  uint64_t v61 = *(void *)(a4 + 8);
  uint64_t v47 = *(void *)(a4 + 48);
  uint64_t v48 = *(void *)(a4 + 64);
  uint64_t v56 = *(void *)(a4 + 56);
  uint64_t v57 = *(void *)(a4 + 40);
  uint64_t v49 = *(void *)(a4 + 80);
  uint64_t v50 = *(void *)(a4 + 96);
  uint64_t v54 = *(void *)(a4 + 88);
  uint64_t v55 = *(void *)(a4 + 72);
  uint64_t v51 = *(void *)(a4 + 112);
  uint64_t v53 = *(void *)(a4 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t result = sub_21F095264(a4);
  *(void *)a7 = a1;
  *(void *)(a7 + 8) = a2;
  *(void *)(a7 + 16) = v69;
  *(void *)(a7 + 24) = v63;
  *(void *)(a7 + 32) = v62;
  *(void *)(a7 + 40) = v15;
  *(void *)(a7 + 48) = v28;
  *(void *)(a7 + 56) = MEMORY[0x263F8EE78];
  *(void *)(a7 + 64) = v72;
  *(_DWORD *)(a7 + 72) = v43;
  *(void *)(a7 + 80) = v71;
  *(float *)(a7 + 88) = v37;
  *(float *)(a7 + 92) = v38;
  *(_DWORD *)(a7 + 96) = v44;
  *(void *)(a7 + 100) = v39;
  *(void *)(a7 + 112) = v68;
  *(void *)(a7 + 120) = 0;
  *(void *)(a7 + 128) = 0;
  *(void *)(a7 + 136) = v61;
  *(void *)(a7 + 144) = v45;
  *(void *)(a7 + 152) = v59;
  *(void *)(a7 + 160) = v46;
  *(void *)(a7 + 168) = v57;
  *(void *)(a7 + 176) = v47;
  *(void *)(a7 + 184) = v56;
  *(void *)(a7 + 192) = v48;
  *(void *)(a7 + 200) = v55;
  *(void *)(a7 + 208) = v49;
  *(void *)(a7 + 216) = v54;
  *(void *)(a7 + 224) = v50;
  *(void *)(a7 + 232) = v53;
  *(void *)(a7 + 240) = v51;
  return result;
}

double sub_21F08CD40@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v10 = *((void *)a3 + 1);
  swift_beginAccess();
  uint64_t v56 = a4;
  uint64_t v11 = *(void *)(a5 + 128);
  uint64_t v12 = *(void *)(a4 + 192);
  uint64_t v54 = a3;
  uint64_t v55 = v10;
  uint64_t v13 = *((void *)a3 + 2);
  v63[0] = v13;
  int64_t v14 = *(void *)(v13 + 16);
  uint64_t v50 = v12;
  uint64_t v51 = v11;
  if (v14)
  {
    uint64_t v49 = a6;
    uint64_t v15 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_21F09532C((uint64_t)v63);
    sub_21F0C38F8(0, v14, 0);
    uint64_t v16 = 0;
    uint64_t v17 = v15;
    uint64_t v57 = v13 + 32;
    do
    {
      uint64_t v18 = *(void *)(v57 + 8 * v16);
      int64_t v19 = *(void *)(v18 + 16);
      if (v19)
      {
        uint64_t v58 = v17;
        int64_t v20 = v14;
        uint64_t v60 = MEMORY[0x263F8EE78];
        swift_bridgeObjectRetain();
        sub_21F0C38D0(0, v19, 0);
        uint64_t v21 = v60;
        unint64_t v22 = *(void *)(v60 + 16);
        uint64_t v23 = 32;
        do
        {
          uint64_t v24 = *(void *)(v18 + v23);
          unint64_t v25 = *(void *)(v60 + 24);
          if (v22 >= v25 >> 1) {
            sub_21F0C38D0(v25 > 1, v22 + 1, 1);
          }
          *(void *)(v60 + 16) = v22 + 1;
          *(void *)(v60 + 8 * v22 + 32) = v24;
          v23 += 24;
          ++v22;
          --v19;
        }
        while (v19);
        swift_bridgeObjectRelease();
        a4 = v56;
        int64_t v14 = v20;
        uint64_t v17 = v58;
      }
      else
      {
        uint64_t v21 = MEMORY[0x263F8EE78];
      }
      unint64_t v27 = *(void *)(v17 + 16);
      unint64_t v26 = *(void *)(v17 + 24);
      if (v27 >= v26 >> 1) {
        sub_21F0C38F8(v26 > 1, v27 + 1, 1);
      }
      ++v16;
      *(void *)(v17 + 16) = v27 + 1;
      *(void *)(v17 + 8 * v27 + 32) = v21;
    }
    while (v16 != v14);
    sub_21F095238((uint64_t)v63);
    a6 = v49;
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v17 = MEMORY[0x263F8EE78];
  }
  uint64_t v28 = v54;
  uint64_t v29 = *((void *)v54 + 4);
  uint64_t v62 = v29;
  int64_t v30 = *(void *)(v29 + 16);
  uint64_t v31 = MEMORY[0x263F8EE78];
  if (v30)
  {
    uint64_t v61 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_21F0C38D0(0, v30, 0);
    uint64_t v31 = v61;
    uint64_t v32 = (uint64_t *)(v29 + 32);
    unint64_t v33 = *(void *)(v61 + 16);
    do
    {
      uint64_t v35 = *v32;
      v32 += 3;
      uint64_t v34 = v35;
      unint64_t v36 = *(void *)(v61 + 24);
      if (v33 >= v36 >> 1) {
        sub_21F0C38D0(v36 > 1, v33 + 1, 1);
      }
      *(void *)(v61 + 16) = v33 + 1;
      *(void *)(v61 + 8 * v33++ + 32) = v34;
      --v30;
    }
    while (v30);
    sub_21F095238((uint64_t)&v62);
    uint64_t v28 = v54;
  }
  uint64_t v37 = *((void *)v28 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_21F095238((uint64_t)v63);
  swift_bridgeObjectRelease();
  sub_21F095238((uint64_t)&v62);
  swift_beginAccess();
  uint64_t v59 = *(void *)(a4 + 160);
  id v38 = *(id *)(a4 + 168);
  sub_21F0C9298();
  sub_21F0C92A8();

  float v39 = sub_21F0BA048();
  float v40 = sub_21F0BA23C();
  uint64_t v41 = *(void *)(a4 + 176);
  swift_beginAccess();
  uint64_t v42 = *(void *)(a4 + 144);
  id v43 = *(id *)(a4 + 152);
  sub_21F0C9298();
  sub_21F0C92A8();

  int v44 = (void *)sub_21F0C9048();
  uint64_t v45 = (void *)MGGetStringAnswer();

  sub_21F0C9068();
  swift_release();
  swift_release();
  uint64_t v46 = MEMORY[0x263F8EE78];
  int v47 = *v28;
  *(void *)a6 = a1;
  *(void *)(a6 + 8) = a2;
  *(void *)(a6 + 16) = v55;
  *(void *)(a6 + 24) = v51;
  *(void *)(a6 + 32) = v50;
  *(void *)(a6 + 40) = v17;
  *(void *)(a6 + 48) = v31;
  *(void *)(a6 + 56) = v46;
  *(void *)(a6 + 64) = v37;
  *(_DWORD *)(a6 + 72) = v47;
  *(void *)(a6 + 80) = v59;
  *(float *)(a6 + 88) = v39;
  *(float *)(a6 + 92) = v40;
  *(_DWORD *)(a6 + 96) = -1082130432;
  *(void *)(a6 + 100) = v41;
  *(void *)(a6 + 112) = v42;
  *(void *)(a6 + 120) = 0;
  *(void *)(a6 + 128) = 0;
  double result = 0.0;
  *(_OWORD *)(a6 + 232) = 0u;
  *(_OWORD *)(a6 + 216) = 0u;
  *(_OWORD *)(a6 + 200) = 0u;
  *(_OWORD *)(a6 + 184) = 0u;
  *(_OWORD *)(a6 + 168) = 0u;
  *(_OWORD *)(a6 + 152) = 0u;
  *(_OWORD *)(a6 + 136) = 0u;
  return result;
}

uint64_t sub_21F08D204(char a1)
{
  uint64_t result = 0xD000000000000017;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x5365727574736567;
      break;
    case 2:
    case 3:
    case 4:
    case 10:
      uint64_t result = 0x656D737365737361;
      break;
    case 5:
    case 6:
      uint64_t result = 0x6D617473656D6974;
      break;
    case 7:
      return result;
    case 8:
      uint64_t result = 0x6E69727065636166;
      break;
    case 9:
      uint64_t result = 0x656D737365737361;
      break;
    case 11:
    case 12:
      uint64_t result = 0xD000000000000011;
      break;
    case 13:
      uint64_t result = 0x656D737365737361;
      break;
    case 14:
      uint64_t result = 0x6F4C63634E78616DLL;
      break;
    case 15:
      uint64_t result = 0x694863634E78616DLL;
      break;
    case 16:
      uint64_t result = 0x536465726F6E6769;
      break;
    case 17:
      uint64_t result = 0x6E49656369766564;
      break;
    case 18:
      unsigned int v3 = 1281714017;
      goto LABEL_16;
    case 19:
      unsigned int v3 = 1282958707;
LABEL_16:
      uint64_t result = v3 | 0x6C65626100000000;
      break;
    case 20:
      uint64_t result = 0x656E6F746E696B73;
      break;
    case 21:
      uint64_t result = 0x746963696E687465;
      break;
    case 22:
      uint64_t result = 0x7269614865636166;
      break;
    case 23:
      uint64_t result = 0x7261656764616568;
      break;
    case 24:
      uint64_t result = 0x4C73657373616C67;
      break;
    default:
      uint64_t result = 0x7373656E6576696CLL;
      break;
  }
  return result;
}

BOOL sub_21F08D53C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_21F08D550()
{
  return sub_21F0C9648();
}

uint64_t sub_21F08D598()
{
  return sub_21F0C9638();
}

uint64_t sub_21F08D5C4()
{
  return sub_21F0C9648();
}

uint64_t sub_21F08D608()
{
  return sub_21F08D204(*v0);
}

uint64_t sub_21F08D610@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_21F0930E0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_21F08D638()
{
  return 0;
}

void sub_21F08D644(unsigned char *a1@<X8>)
{
  *a1 = 25;
}

uint64_t sub_21F08D650(uint64_t a1)
{
  unint64_t v2 = sub_21F08E040();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_21F08D68C(uint64_t a1)
{
  unint64_t v2 = sub_21F08E040();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t PADSWClassifierResult.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EBAD58);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v1;
  uint64_t v7 = v1[1];
  uint64_t v26 = v1[2];
  uint64_t v27 = v7;
  uint64_t v25 = v1[3];
  uint64_t v9 = v1[4];
  uint64_t v22 = v1[5];
  uint64_t v23 = v9;
  uint64_t v10 = v1[6];
  uint64_t v20 = v1[7];
  uint64_t v21 = v10;
  uint64_t v11 = v1[8];
  v18[15] = v1[10];
  uint64_t v19 = v11;
  uint64_t v12 = v1[14];
  v18[13] = v1[15];
  v18[14] = v12;
  v18[12] = v1[16];
  v18[1] = v1[17];
  v18[0] = v1[18];
  v18[3] = v1[19];
  v18[2] = v1[20];
  v18[5] = v1[21];
  v18[4] = v1[22];
  v18[7] = v1[23];
  v18[6] = v1[24];
  v18[9] = v1[25];
  v18[8] = v1[26];
  v18[11] = v1[27];
  v18[10] = v1[28];
  uint64_t v13 = v1[30];
  uint64_t v24 = v1[29];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21F08E040();
  sub_21F0C9668();
  uint64_t v30 = v8;
  char v29 = 0;
  sub_21F08E094();
  uint64_t v14 = v28;
  sub_21F0C9598();
  if (!v14)
  {
    uint64_t v16 = v25;
    uint64_t v15 = v26;
    uint64_t v28 = v13;
    uint64_t v30 = v27;
    char v29 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267EBAD70);
    sub_21F08E184(&qword_267EBAD78, &qword_267EBAD70, (void (*)(void))sub_21F08E130);
    sub_21F0C9598();
    uint64_t v30 = v15;
    char v29 = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267EBAD88);
    sub_21F08E184(&qword_267EBAD90, &qword_267EBAD88, (void (*)(void))sub_21F08E1F0);
    sub_21F0C9598();
    uint64_t v30 = v16;
    char v29 = 3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267EBADA0);
    sub_21F08E184(&qword_267EBADA8, &qword_267EBADA0, (void (*)(void))sub_21F08E244);
    sub_21F0C9598();
    uint64_t v30 = v23;
    char v29 = 4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267EBADB8);
    sub_21F08E184(&qword_267EBADC0, &qword_267EBADB8, (void (*)(void))sub_21F08E298);
    sub_21F0C9598();
    uint64_t v30 = v22;
    char v29 = 5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267EBADD0);
    sub_21F08F900(&qword_267EBADD8, &qword_267EBADE0);
    sub_21F0C9598();
    uint64_t v30 = v21;
    char v29 = 6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267EBB4C0);
    sub_21F08F98C(&qword_267EBADE0, &qword_267EBB4C0);
    sub_21F0C9598();
    uint64_t v30 = v20;
    char v29 = 7;
    sub_21F0C9598();
    uint64_t v30 = v19;
    char v29 = 8;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267EBB500);
    sub_21F08E2EC(&qword_267EBADE8, &qword_267EBADF0);
    sub_21F0C9598();
    LOBYTE(v30) = 9;
    sub_21F0C9578();
    LOBYTE(v30) = 10;
    sub_21F0C9588();
    LOBYTE(v30) = 11;
    sub_21F0C9578();
    LOBYTE(v30) = 12;
    sub_21F0C9578();
    LOBYTE(v30) = 13;
    sub_21F0C9578();
    LOBYTE(v30) = 14;
    sub_21F0C9578();
    LOBYTE(v30) = 15;
    sub_21F0C9578();
    LOBYTE(v30) = 16;
    sub_21F0C9588();
    LOBYTE(v30) = 17;
    sub_21F0C9548();
    LOBYTE(v30) = 18;
    sub_21F0C9548();
    LOBYTE(v30) = 19;
    sub_21F0C9548();
    LOBYTE(v30) = 20;
    sub_21F0C9548();
    LOBYTE(v30) = 21;
    sub_21F0C9548();
    LOBYTE(v30) = 22;
    sub_21F0C9548();
    LOBYTE(v30) = 23;
    sub_21F0C9548();
    LOBYTE(v30) = 24;
    sub_21F0C9548();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_21F08E040()
{
  unint64_t result = qword_267EBAD60;
  if (!qword_267EBAD60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EBAD60);
  }
  return result;
}

unint64_t sub_21F08E094()
{
  unint64_t result = qword_267EBAD68;
  if (!qword_267EBAD68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EBAD68);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_21F08E130()
{
  unint64_t result = qword_267EBAD80;
  if (!qword_267EBAD80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EBAD80);
  }
  return result;
}

uint64_t sub_21F08E184(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_21F08E1F0()
{
  unint64_t result = qword_267EBAD98;
  if (!qword_267EBAD98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EBAD98);
  }
  return result;
}

unint64_t sub_21F08E244()
{
  unint64_t result = qword_267EBADB0;
  if (!qword_267EBADB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EBADB0);
  }
  return result;
}

unint64_t sub_21F08E298()
{
  unint64_t result = qword_267EBADC8;
  if (!qword_267EBADC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EBADC8);
  }
  return result;
}

uint64_t sub_21F08E2EC(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_267EBB500);
    sub_21F08F98C(a2, (uint64_t *)&unk_267EBB440);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t PADSWClassifierResult.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EBADF8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a1[3];
  uint64_t v86 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v9);
  sub_21F08E040();
  sub_21F0C9658();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v86);
  }
  LOBYTE(v87) = 0;
  sub_21F08F75C();
  sub_21F0C9538();
  uint64_t v10 = v103[0];
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EBAD70);
  LOBYTE(v87) = 1;
  sub_21F08E184(&qword_267EBAE08, &qword_267EBAD70, (void (*)(void))sub_21F08F7B0);
  sub_21F0C9538();
  uint64_t v74 = v10;
  uint64_t v11 = v103[0];
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EBAD88);
  LOBYTE(v87) = 2;
  sub_21F08E184(&qword_267EBAE18, &qword_267EBAD88, (void (*)(void))sub_21F08F804);
  swift_bridgeObjectRetain();
  sub_21F0C9538();
  uint64_t v73 = v11;
  uint64_t v12 = v103[0];
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EBADA0);
  LOBYTE(v87) = 3;
  sub_21F08E184(&qword_267EBAE28, &qword_267EBADA0, (void (*)(void))sub_21F08F858);
  swift_bridgeObjectRetain();
  sub_21F0C9538();
  uint64_t v72 = v12;
  uint64_t v13 = v103[0];
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EBADB8);
  LOBYTE(v87) = 4;
  sub_21F08E184(&qword_267EBAE38, &qword_267EBADB8, (void (*)(void))sub_21F08F8AC);
  swift_bridgeObjectRetain();
  sub_21F0C9538();
  uint64_t v85 = v13;
  uint64_t v14 = v103[0];
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EBADD0);
  LOBYTE(v87) = 5;
  sub_21F08F900(&qword_267EBAE48, &qword_267EBAE50);
  swift_bridgeObjectRetain();
  sub_21F0C9538();
  uint64_t v71 = v14;
  uint64_t v15 = v103[0];
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EBB4C0);
  LOBYTE(v87) = 6;
  uint64_t v16 = sub_21F08F98C(&qword_267EBAE50, &qword_267EBB4C0);
  swift_bridgeObjectRetain();
  uint64_t v82 = v16;
  sub_21F0C9538();
  uint64_t v84 = v15;
  uint64_t v17 = v103[0];
  LOBYTE(v87) = 7;
  swift_bridgeObjectRetain();
  sub_21F0C9538();
  uint64_t v83 = v17;
  uint64_t v18 = v103[0];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267EBB500);
  LOBYTE(v87) = 8;
  sub_21F08E2EC(&qword_267EBAE58, &qword_267EBAE60);
  uint64_t v82 = v18;
  swift_bridgeObjectRetain();
  sub_21F0C9538();
  uint64_t v19 = v71;
  uint64_t v20 = v103[0];
  LOBYTE(v103[0]) = 9;
  uint64_t v81 = v20;
  swift_bridgeObjectRetain();
  sub_21F0C9518();
  int v22 = v21;
  LOBYTE(v103[0]) = 10;
  uint64_t v23 = sub_21F0C9528();
  LOBYTE(v103[0]) = 11;
  sub_21F0C9518();
  unsigned int v25 = v24;
  LOBYTE(v103[0]) = 12;
  sub_21F0C9518();
  unsigned int v27 = v26;
  LOBYTE(v103[0]) = 13;
  sub_21F0C9518();
  unsigned int v29 = v28;
  LOBYTE(v103[0]) = 14;
  sub_21F0C9518();
  unsigned int v31 = v30;
  LOBYTE(v103[0]) = 15;
  sub_21F0C9518();
  int v33 = v32;
  LOBYTE(v103[0]) = 16;
  uint64_t v70 = sub_21F0C9528();
  LOBYTE(v103[0]) = 17;
  uint64_t v69 = sub_21F0C94E8();
  uint64_t v80 = v34;
  LOBYTE(v103[0]) = 18;
  swift_bridgeObjectRetain();
  uint64_t v68 = sub_21F0C94E8();
  uint64_t v79 = v35;
  LOBYTE(v103[0]) = 19;
  swift_bridgeObjectRetain();
  uint64_t v67 = sub_21F0C94E8();
  uint64_t v75 = v36;
  LOBYTE(v103[0]) = 20;
  swift_bridgeObjectRetain();
  uint64_t v66 = sub_21F0C94E8();
  uint64_t v78 = v37;
  LOBYTE(v103[0]) = 21;
  swift_bridgeObjectRetain();
  uint64_t v65 = sub_21F0C94E8();
  uint64_t v77 = v38;
  LOBYTE(v103[0]) = 22;
  swift_bridgeObjectRetain();
  uint64_t v64 = sub_21F0C94E8();
  uint64_t v76 = v39;
  LOBYTE(v103[0]) = 23;
  swift_bridgeObjectRetain();
  uint64_t v62 = sub_21F0C94E8();
  uint64_t v63 = v40;
  char v128 = 24;
  swift_bridgeObjectRetain();
  uint64_t v41 = sub_21F0C94E8();
  uint64_t v61 = v42;
  uint64_t v43 = v41;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  *(void *)&long long v87 = v74;
  *((void *)&v87 + 1) = v73;
  *(void *)&long long v88 = v72;
  *((void *)&v88 + 1) = v85;
  *(void *)&long long v89 = v19;
  *((void *)&v89 + 1) = v84;
  *(void *)&long long v90 = v83;
  *((void *)&v90 + 1) = v82;
  *(void *)&long long v91 = v81;
  DWORD2(v91) = v22;
  uint64_t v59 = v23;
  *(void *)&long long v92 = v23;
  *((void *)&v92 + 1) = __PAIR64__(v27, v25);
  *(void *)&long long v93 = __PAIR64__(v31, v29);
  DWORD2(v93) = v33;
  *(void *)&long long v94 = v70;
  *((void *)&v94 + 1) = v69;
  *(void *)&long long v95 = v80;
  *((void *)&v95 + 1) = v68;
  *(void *)&long long v96 = v79;
  *((void *)&v96 + 1) = v67;
  *(void *)&long long v97 = v75;
  *((void *)&v97 + 1) = v66;
  *(void *)&long long v98 = v78;
  *((void *)&v98 + 1) = v65;
  *(void *)&long long v99 = v77;
  *((void *)&v99 + 1) = v64;
  *(void *)&long long v100 = v76;
  *((void *)&v100 + 1) = v62;
  *(void *)&long long v101 = v63;
  *((void *)&v101 + 1) = v43;
  uint64_t v60 = v43;
  uint64_t v102 = v61;
  sub_21F08F9EC((uint64_t)&v87);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v44 = v81;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v45 = v75;
  swift_bridgeObjectRelease();
  uint64_t v46 = v78;
  swift_bridgeObjectRelease();
  uint64_t v47 = v77;
  swift_bridgeObjectRelease();
  uint64_t v48 = v76;
  swift_bridgeObjectRelease();
  uint64_t v49 = v63;
  swift_bridgeObjectRelease();
  long long v50 = v100;
  *(_OWORD *)(a2 + 192) = v99;
  *(_OWORD *)(a2 + 208) = v50;
  *(_OWORD *)(a2 + 224) = v101;
  *(void *)(a2 + 240) = v102;
  long long v51 = v96;
  *(_OWORD *)(a2 + 128) = v95;
  *(_OWORD *)(a2 + 144) = v51;
  long long v52 = v98;
  *(_OWORD *)(a2 + 160) = v97;
  *(_OWORD *)(a2 + 176) = v52;
  long long v53 = v92;
  *(_OWORD *)(a2 + 64) = v91;
  *(_OWORD *)(a2 + 80) = v53;
  long long v54 = v94;
  *(_OWORD *)(a2 + 96) = v93;
  *(_OWORD *)(a2 + 112) = v54;
  long long v55 = v88;
  *(_OWORD *)a2 = v87;
  *(_OWORD *)(a2 + 16) = v55;
  long long v56 = v90;
  *(_OWORD *)(a2 + 32) = v89;
  *(_OWORD *)(a2 + 48) = v56;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v86);
  v103[0] = v74;
  v103[1] = v73;
  v103[2] = v72;
  v103[3] = v85;
  v103[4] = v71;
  v103[5] = v84;
  v103[6] = v83;
  v103[7] = v82;
  v103[8] = v44;
  int v104 = v22;
  uint64_t v105 = v59;
  unsigned int v106 = v25;
  unsigned int v107 = v27;
  unsigned int v108 = v29;
  unsigned int v109 = v31;
  int v110 = v33;
  uint64_t v111 = v70;
  uint64_t v112 = v69;
  uint64_t v113 = v80;
  uint64_t v114 = v68;
  uint64_t v115 = v79;
  uint64_t v116 = v67;
  uint64_t v117 = v45;
  uint64_t v118 = v66;
  uint64_t v119 = v46;
  uint64_t v120 = v65;
  uint64_t v121 = v47;
  uint64_t v122 = v64;
  uint64_t v123 = v48;
  uint64_t v124 = v62;
  uint64_t v125 = v49;
  uint64_t v126 = v60;
  uint64_t v127 = v61;
  return sub_21F08FAF0((uint64_t)v103);
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_21F08F75C()
{
  unint64_t result = qword_267EBAE00;
  if (!qword_267EBAE00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EBAE00);
  }
  return result;
}

unint64_t sub_21F08F7B0()
{
  unint64_t result = qword_267EBAE10;
  if (!qword_267EBAE10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EBAE10);
  }
  return result;
}

unint64_t sub_21F08F804()
{
  unint64_t result = qword_267EBAE20;
  if (!qword_267EBAE20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EBAE20);
  }
  return result;
}

unint64_t sub_21F08F858()
{
  unint64_t result = qword_267EBAE30;
  if (!qword_267EBAE30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EBAE30);
  }
  return result;
}

unint64_t sub_21F08F8AC()
{
  unint64_t result = qword_267EBAE40;
  if (!qword_267EBAE40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EBAE40);
  }
  return result;
}

uint64_t sub_21F08F900(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EBADD0);
    sub_21F08F98C(a2, &qword_267EBB4C0);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21F08F98C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21F08F9EC(uint64_t a1)
{
  return a1;
}

uint64_t sub_21F08FAF0(uint64_t a1)
{
  return a1;
}

uint64_t sub_21F08FBF4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return PADSWClassifierResult.init(from:)(a1, a2);
}

uint64_t sub_21F08FC0C(void *a1)
{
  return PADSWClassifierResult.encode(to:)(a1);
}

uint64_t sub_21F08FC24(uint64_t a1, void *a2)
{
  sub_21F08FCE0(a1, (uint64_t)v5);
  uint64_t v3 = *a2 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_delegate;
  swift_beginAccess();
  sub_21F08FDA4((uint64_t)v5, v3);
  return swift_endAccess();
}

uint64_t sub_21F08FC8C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_delegate;
  swift_beginAccess();
  return sub_21F08FCE0(v3, a1);
}

uint64_t sub_21F08FCE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267EBB450);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21F08FD48(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_delegate;
  swift_beginAccess();
  sub_21F08FDA4(a1, v3);
  return swift_endAccess();
}

uint64_t sub_21F08FDA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267EBB450);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*sub_21F08FE0C())()
{
  return j__swift_endAccess;
}

uint64_t sub_21F08FE6C()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_fac);
  swift_beginAccess();
  unint64_t v3 = v1[20];
  uint64_t v2 = (void *)v1[21];
  uint64_t v4 = v1[18];
  id v5 = v2;
  swift_bridgeObjectRetain();
  sub_21F0C9298();
  sub_21F0C92A8();
  if ((v3 & 0x8000000000000000) != 0 || v3 >= *(void *)(v4 + 16))
  {

    swift_bridgeObjectRelease();
    return 10;
  }
  else
  {
    uint64_t v6 = *(void *)(v4 + 8 * v3 + 32);

    swift_bridgeObjectRelease();
  }
  return v6;
}

void sub_21F08FF14(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(*(void *)(v1 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_ta) + 185);
}

unsigned char *sub_21F08FF2C(unsigned char *result)
{
  *(unsigned char *)(*(void *)(v1 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_ta) + 185) = *result;
  return result;
}

unsigned char *(*sub_21F08FF44(uint64_t a1))(unsigned char *result)
{
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_ta);
  *(void *)a1 = v2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(v2 + 185);
  return sub_21F08FF7C;
}

unsigned char *sub_21F08FF7C(unsigned char *result)
{
  *(unsigned char *)(*(void *)result + 185) = result[8];
  return result;
}

void sub_21F08FF8C()
{
  word_267EBAD50 = 257;
  byte_267EBAD52 = 1;
}

uint64_t static PADSWClassifier.FrameProcessingOptions.allEnabled.getter@<X0>(unsigned char *a1@<X8>)
{
  if (qword_267EBABA0 != -1) {
    uint64_t result = swift_once();
  }
  char v2 = HIBYTE(word_267EBAD50);
  char v3 = byte_267EBAD52;
  *a1 = word_267EBAD50;
  a1[1] = v2;
  a1[2] = v3;
  return result;
}

uint64_t PADSWClassifier.__allocating_init(delegate:)(uint64_t a1)
{
  *(void *)(v1 + 264) = a1;
  type metadata accessor for PADModelManager();
  swift_allocObject();
  char v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 272) = v2;
  void *v2 = v1;
  v2[1] = sub_21F0900C0;
  return sub_21F0A54D0();
}

uint64_t sub_21F0900C0(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 280) = a1;
  *(void *)(v3 + 288) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_21F090560;
  }
  else {
    uint64_t v4 = sub_21F0901D4;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_21F0901D4()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0 + 16;
  uint64_t v3 = v0 + 224;
  uint64_t v4 = *(void *)(v0 + 280);
  uint64_t v5 = *(void *)(v1 + 264);
  sub_21F0A7C28(v2);
  type metadata accessor for PADLivenessClassifier();
  uint64_t v6 = swift_allocObject();
  *(void *)(v1 + 296) = v6;
  swift_weakInit();
  swift_retain();
  sub_21F0A6CF0();
  id v7 = objc_allocWithZone((Class)PADAlgorithms);
  sub_21F093AE0();
  uint64_t v8 = (void *)sub_21F0C9018();
  swift_bridgeObjectRelease();
  id v9 = objc_msgSend(v7, sel_initWithPADModelConfiguration_, v8);

  long long v10 = *(_OWORD *)(v1 + 144);
  *(_OWORD *)(v6 + 168) = *(_OWORD *)(v1 + 160);
  long long v11 = *(_OWORD *)(v1 + 192);
  *(_OWORD *)(v6 + 184) = *(_OWORD *)(v1 + 176);
  *(_OWORD *)(v6 + 200) = v11;
  *(_OWORD *)(v6 + 216) = *(_OWORD *)(v1 + 208);
  long long v12 = *(_OWORD *)(v1 + 80);
  *(_OWORD *)(v6 + 104) = *(_OWORD *)(v1 + 96);
  long long v13 = *(_OWORD *)(v1 + 128);
  *(_OWORD *)(v6 + 120) = *(_OWORD *)(v1 + 112);
  *(_OWORD *)(v6 + 136) = v13;
  *(_OWORD *)(v6 + 152) = v10;
  long long v14 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v6 + 40) = *(_OWORD *)(v1 + 32);
  long long v15 = *(_OWORD *)(v1 + 64);
  *(_OWORD *)(v6 + 56) = *(_OWORD *)(v1 + 48);
  *(_OWORD *)(v6 + 72) = v15;
  *(_OWORD *)(v6 + 88) = v12;
  *(void *)(v6 + 16) = v9;
  *(_OWORD *)(v6 + 24) = v14;
  swift_weakAssign();
  swift_release();
  type metadata accessor for PADFaceActionController();
  swift_allocObject();
  swift_retain();
  uint64_t v16 = sub_21F0C52A8(0, 0, v6);
  *(void *)(v1 + 304) = v16;
  sub_21F08FCE0(v5, v3);
  id v17 = objc_allocWithZone((Class)type metadata accessor for PADSWClassifier());
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v18 = (void *)swift_task_alloc();
  *(void *)(v1 + 312) = v18;
  void *v18 = v1;
  v18[1] = sub_21F090438;
  v18[88] = v17;
  v18[87] = v3;
  v18[86] = v6;
  v18[84] = 0;
  v18[85] = 0;
  v18[83] = 0;
  v18[82] = v16;
  v18[81] = v4;
  return MEMORY[0x270FA2498](sub_21F0907A4, 0, 0);
}

uint64_t sub_21F090438(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 320) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_21F0906D4;
  }
  else
  {
    *(void *)(v4 + 328) = a1;
    uint64_t v5 = sub_21F0905CC;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_21F090560()
{
  sub_21F09543C(*(void *)(v0 + 264), (uint64_t *)&unk_267EBB450);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_21F0905CC()
{
  uint64_t v1 = v0[41];
  uint64_t v2 = v0[33];
  swift_release();
  swift_release();
  swift_release();
  sub_21F09543C(v2, (uint64_t *)&unk_267EBB450);
  *(void *)(*(void *)(v1 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_fac) + 136) = &off_26D0A6100;
  swift_unknownObjectWeakAssign();
  *(void *)(*(void *)(v1 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_ta) + 208) = &off_26D0A6130;
  swift_unknownObjectWeakAssign();
  *(void *)(*(void *)(v1 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_selfieAnalyzer) + 152) = &off_26D0A6148;
  swift_unknownObjectWeakAssign();
  uint64_t v3 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v4 = v0[41];
  return v3(v4);
}

uint64_t sub_21F0906D4()
{
  uint64_t v1 = *(void *)(v0 + 264);
  swift_release();
  swift_release();
  swift_release();
  sub_21F09543C(v1, (uint64_t *)&unk_267EBB450);
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_21F090768(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v8[88] = v7;
  v8[87] = a7;
  v8[86] = a6;
  v8[85] = a5;
  v8[84] = a4;
  v8[83] = a3;
  v8[82] = a2;
  v8[81] = a1;
  return MEMORY[0x270FA2498](sub_21F0907A4, 0, 0);
}

uint64_t sub_21F0907A4()
{
  uint64_t v1 = *(char **)(v0 + 704);
  uint64_t v2 = *(void *)(v0 + 696);
  uint64_t v3 = *(void *)(v0 + 648);
  uint64_t v4 = OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_facResult;
  *(void *)(v0 + 712) = OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_facResult;
  uint64_t v5 = &v1[v4];
  *((void *)v5 + 4) = 0;
  *(_OWORD *)uint64_t v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  uint64_t v6 = OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_selfieResult;
  *(void *)(v0 + 720) = OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_selfieResult;
  uint64_t v7 = (uint64_t)&v1[v6];
  sub_21F0953BC((_OWORD *)(v0 + 224));
  sub_21F094F20(v0 + 224, v7);
  uint64_t v8 = OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_request;
  *(void *)(v0 + 728) = OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_request;
  id v9 = &v1[v8];
  *(void *)id v9 = 0;
  *((void *)v9 + 1) = 0;
  uint64_t v10 = OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_delegate;
  *(void *)(v0 + 736) = OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_delegate;
  uint64_t v11 = (uint64_t)&v1[v10];
  *(void *)(v11 + 32) = 0;
  *(_OWORD *)uint64_t v11 = 0u;
  *(_OWORD *)(v11 + 16) = 0u;
  swift_beginAccess();
  long long v12 = v1;
  sub_21F0953D8(v2, v11, (uint64_t *)&unk_267EBB450);
  swift_endAccess();
  if (v3)
  {
    uint64_t v13 = *(void *)(v0 + 688);
    *(void *)(*(void *)(v0 + 704) + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_modelManager) = *(void *)(v0 + 648);
    if (v13)
    {
      uint64_t v14 = *(void *)(v0 + 688);
      swift_retain();
      swift_retain();
    }
    else
    {
      swift_retain();
      swift_retain_n();
      sub_21F0A7C28(v0 + 16);
      type metadata accessor for PADLivenessClassifier();
      uint64_t v14 = swift_allocObject();
      swift_weakInit();
      sub_21F0A6CF0();
      id v17 = objc_allocWithZone((Class)PADAlgorithms);
      sub_21F093AE0();
      uint64_t v18 = (void *)sub_21F0C9018();
      swift_bridgeObjectRelease();
      id v19 = objc_msgSend(v17, sel_initWithPADModelConfiguration_, v18);

      long long v20 = *(_OWORD *)(v0 + 144);
      *(_OWORD *)(v14 + 168) = *(_OWORD *)(v0 + 160);
      long long v21 = *(_OWORD *)(v0 + 192);
      *(_OWORD *)(v14 + 184) = *(_OWORD *)(v0 + 176);
      *(_OWORD *)(v14 + 200) = v21;
      *(_OWORD *)(v14 + 216) = *(_OWORD *)(v0 + 208);
      long long v22 = *(_OWORD *)(v0 + 80);
      *(_OWORD *)(v14 + 104) = *(_OWORD *)(v0 + 96);
      long long v23 = *(_OWORD *)(v0 + 128);
      *(_OWORD *)(v14 + 120) = *(_OWORD *)(v0 + 112);
      *(_OWORD *)(v14 + 136) = v23;
      *(_OWORD *)(v14 + 152) = v20;
      long long v24 = *(_OWORD *)(v0 + 16);
      *(_OWORD *)(v14 + 40) = *(_OWORD *)(v0 + 32);
      long long v25 = *(_OWORD *)(v0 + 64);
      *(_OWORD *)(v14 + 56) = *(_OWORD *)(v0 + 48);
      *(_OWORD *)(v14 + 72) = v25;
      *(_OWORD *)(v14 + 88) = v22;
      *(void *)(v14 + 16) = v19;
      *(_OWORD *)(v14 + 24) = v24;
      swift_weakAssign();
      swift_release();
    }
    uint64_t v26 = *(void *)(v0 + 704);
    uint64_t v27 = *(void *)(v0 + 664);
    uint64_t v28 = *(void *)(v0 + 656);
    *(void *)(v26 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_livenessClassifier) = v14;
    *(void *)(v26 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_fac) = v28;
    if (v27)
    {
      uint64_t v29 = *(void *)(v0 + 664);
      swift_retain();
      swift_retain();
    }
    else
    {
      type metadata accessor for PADTrajectoryAnalysisController();
      uint64_t v30 = swift_allocObject();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      dispatch_semaphore_t v31 = dispatch_semaphore_create(1);
      *(void *)(v30 + 128) = 0;
      *(void *)(v30 + 136) = v31;
      dispatch_semaphore_t v32 = dispatch_semaphore_create(1);
      *(void *)(v30 + 144) = 0;
      *(void *)(v30 + 152) = v32;
      dispatch_semaphore_t v33 = dispatch_semaphore_create(1);
      *(void *)(v30 + 160) = 0;
      *(void *)(v30 + 168) = v33;
      *(void *)(v30 + 176) = 0;
      *(_WORD *)(v30 + 184) = 256;
      *(void *)(v30 + 192) = MEMORY[0x263F8EE78];
      *(void *)(v30 + 208) = 0;
      swift_unknownObjectWeakInit();
      *(void *)(v30 + 208) = 0;
      swift_unknownObjectWeakAssign();
      swift_release();
      uint64_t v29 = sub_21F0AE6D8(v14);
    }
    uint64_t v34 = *(void *)(v0 + 672);
    *(void *)(*(void *)(v0 + 704) + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_ta) = v29;
    if (v34)
    {
      uint64_t v35 = *(void *)(v0 + 672);
      swift_retain();
    }
    else
    {
      type metadata accessor for PADPrintReplayController();
      *(_OWORD *)(v0 + 544) = 0u;
      *(_OWORD *)(v0 + 560) = 0u;
      *(void *)(v0 + 576) = 0;
      uint64_t v36 = swift_allocObject();
      *(void *)(v36 + 128) = MEMORY[0x263F8EE78];
      *(void *)(v36 + 136) = 0;
      *(void *)(v36 + 144) = 0;
      *(void *)(v36 + 152) = 0;
      *(unsigned char *)(v36 + 160) = 1;
      *(_OWORD *)(v36 + 184) = 0u;
      *(void *)(v36 + 200) = 0;
      *(_OWORD *)(v36 + 168) = 0u;
      swift_beginAccess();
      swift_retain();
      swift_retain();
      swift_retain();
      sub_21F0953D8(v0 + 544, v36 + 168, &qword_267EBAEF8);
      swift_endAccess();
      swift_release();
      uint64_t v35 = sub_21F0AE6D8(v14);
      sub_21F09543C(v0 + 544, &qword_267EBAEF8);
    }
    uint64_t v37 = *(void *)(v0 + 680);
    *(void *)(*(void *)(v0 + 704) + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_prd) = v35;
    uint64_t v38 = *(void *)(v0 + 680);
    if (v37)
    {
      swift_retain();
      swift_retain();
      swift_release();
      uint64_t v39 = v38;
    }
    else
    {
      type metadata accessor for PADSelfieAnalysisController();
      uint64_t v40 = (void *)swift_allocObject();
      v40[19] = 0;
      v40[16] = 0;
      v40[17] = 0;
      swift_unknownObjectWeakInit();
      uint64_t v41 = MEMORY[0x263F8EE78];
      v40[19] = 0;
      v40[20] = v41;
      swift_unknownObjectWeakAssign();
      swift_retain();
      uint64_t v42 = swift_retain();
      uint64_t v39 = sub_21F0AE6D8(v42);
      swift_release();
    }
    uint64_t v43 = *(char **)(v0 + 704);
    uint64_t v44 = *(void *)(v0 + 696);
    *(void *)&v43[OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_selfieAnalyzer] = v39;

    uint64_t v45 = type metadata accessor for PADSWClassifier();
    *(void *)(v0 + 632) = v43;
    *(void *)(v0 + 640) = v45;
    id v46 = objc_msgSendSuper2((objc_super *)(v0 + 632), sel_init);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    sub_21F09543C(v44, (uint64_t *)&unk_267EBB450);
    uint64_t v47 = *(uint64_t (**)(id))(v0 + 8);
    return v47(v46);
  }
  else
  {
    type metadata accessor for PADModelManager();
    swift_allocObject();
    long long v15 = (void *)swift_task_alloc();
    *(void *)(v0 + 744) = v15;
    void *v15 = v0;
    v15[1] = sub_21F090DD0;
    return sub_21F0A54D0();
  }
}

uint64_t sub_21F090DD0(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 752) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_21F0913DC;
  }
  else
  {
    *(void *)(v4 + 760) = a1;
    uint64_t v5 = sub_21F090EF8;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_21F090EF8()
{
  uint64_t v1 = *(void *)(v0 + 688);
  *(void *)(*(void *)(v0 + 704) + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_modelManager) = *(void *)(v0 + 760);
  if (v1)
  {
    uint64_t v2 = *(void *)(v0 + 688);
    swift_retain();
    swift_retain();
  }
  else
  {
    swift_retain();
    swift_retain_n();
    sub_21F0A7C28(v0 + 16);
    type metadata accessor for PADLivenessClassifier();
    uint64_t v2 = swift_allocObject();
    swift_weakInit();
    sub_21F0A6CF0();
    id v3 = objc_allocWithZone((Class)PADAlgorithms);
    sub_21F093AE0();
    uint64_t v4 = (void *)sub_21F0C9018();
    swift_bridgeObjectRelease();
    id v5 = objc_msgSend(v3, sel_initWithPADModelConfiguration_, v4);

    long long v6 = *(_OWORD *)(v0 + 144);
    *(_OWORD *)(v2 + 168) = *(_OWORD *)(v0 + 160);
    long long v7 = *(_OWORD *)(v0 + 192);
    *(_OWORD *)(v2 + 184) = *(_OWORD *)(v0 + 176);
    *(_OWORD *)(v2 + 200) = v7;
    *(_OWORD *)(v2 + 216) = *(_OWORD *)(v0 + 208);
    long long v8 = *(_OWORD *)(v0 + 80);
    *(_OWORD *)(v2 + 104) = *(_OWORD *)(v0 + 96);
    long long v9 = *(_OWORD *)(v0 + 128);
    *(_OWORD *)(v2 + 120) = *(_OWORD *)(v0 + 112);
    *(_OWORD *)(v2 + 136) = v9;
    *(_OWORD *)(v2 + 152) = v6;
    long long v10 = *(_OWORD *)(v0 + 16);
    *(_OWORD *)(v2 + 40) = *(_OWORD *)(v0 + 32);
    long long v11 = *(_OWORD *)(v0 + 64);
    *(_OWORD *)(v2 + 56) = *(_OWORD *)(v0 + 48);
    *(_OWORD *)(v2 + 72) = v11;
    *(_OWORD *)(v2 + 88) = v8;
    *(void *)(v2 + 16) = v5;
    *(_OWORD *)(v2 + 24) = v10;
    swift_weakAssign();
    swift_release();
  }
  uint64_t v12 = *(void *)(v0 + 704);
  uint64_t v13 = *(void *)(v0 + 664);
  uint64_t v14 = *(void *)(v0 + 656);
  *(void *)(v12 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_livenessClassifier) = v2;
  *(void *)(v12 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_fac) = v14;
  if (v13)
  {
    uint64_t v15 = *(void *)(v0 + 664);
    swift_retain();
    swift_retain();
  }
  else
  {
    type metadata accessor for PADTrajectoryAnalysisController();
    uint64_t v16 = swift_allocObject();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    dispatch_semaphore_t v17 = dispatch_semaphore_create(1);
    *(void *)(v16 + 128) = 0;
    *(void *)(v16 + 136) = v17;
    dispatch_semaphore_t v18 = dispatch_semaphore_create(1);
    *(void *)(v16 + 144) = 0;
    *(void *)(v16 + 152) = v18;
    dispatch_semaphore_t v19 = dispatch_semaphore_create(1);
    *(void *)(v16 + 160) = 0;
    *(void *)(v16 + 168) = v19;
    *(void *)(v16 + 176) = 0;
    *(_WORD *)(v16 + 184) = 256;
    *(void *)(v16 + 192) = MEMORY[0x263F8EE78];
    *(void *)(v16 + 208) = 0;
    swift_unknownObjectWeakInit();
    *(void *)(v16 + 208) = 0;
    swift_unknownObjectWeakAssign();
    swift_release();
    uint64_t v15 = sub_21F0AE6D8(v2);
  }
  uint64_t v20 = *(void *)(v0 + 672);
  *(void *)(*(void *)(v0 + 704) + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_ta) = v15;
  if (v20)
  {
    uint64_t v21 = *(void *)(v0 + 672);
    swift_retain();
  }
  else
  {
    type metadata accessor for PADPrintReplayController();
    *(_OWORD *)(v0 + 544) = 0u;
    *(_OWORD *)(v0 + 560) = 0u;
    *(void *)(v0 + 576) = 0;
    uint64_t v22 = swift_allocObject();
    *(void *)(v22 + 128) = MEMORY[0x263F8EE78];
    *(void *)(v22 + 136) = 0;
    *(void *)(v22 + 144) = 0;
    *(void *)(v22 + 152) = 0;
    *(unsigned char *)(v22 + 160) = 1;
    *(_OWORD *)(v22 + 184) = 0u;
    *(void *)(v22 + 200) = 0;
    *(_OWORD *)(v22 + 168) = 0u;
    swift_beginAccess();
    swift_retain();
    swift_retain();
    swift_retain();
    sub_21F0953D8(v0 + 544, v22 + 168, &qword_267EBAEF8);
    swift_endAccess();
    swift_release();
    uint64_t v21 = sub_21F0AE6D8(v2);
    sub_21F09543C(v0 + 544, &qword_267EBAEF8);
  }
  uint64_t v23 = *(void *)(v0 + 680);
  *(void *)(*(void *)(v0 + 704) + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_prd) = v21;
  uint64_t v24 = *(void *)(v0 + 680);
  if (v23)
  {
    swift_retain();
    swift_retain();
    swift_release();
    uint64_t v25 = v24;
  }
  else
  {
    type metadata accessor for PADSelfieAnalysisController();
    uint64_t v26 = (void *)swift_allocObject();
    v26[19] = 0;
    v26[16] = 0;
    v26[17] = 0;
    swift_unknownObjectWeakInit();
    uint64_t v27 = MEMORY[0x263F8EE78];
    v26[19] = 0;
    v26[20] = v27;
    swift_unknownObjectWeakAssign();
    swift_retain();
    uint64_t v28 = swift_retain();
    uint64_t v25 = sub_21F0AE6D8(v28);
    swift_release();
  }
  uint64_t v29 = *(char **)(v0 + 704);
  uint64_t v30 = *(void *)(v0 + 696);
  *(void *)&v29[OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_selfieAnalyzer] = v25;

  uint64_t v31 = type metadata accessor for PADSWClassifier();
  *(void *)(v0 + 632) = v29;
  *(void *)(v0 + 640) = v31;
  id v32 = objc_msgSendSuper2((objc_super *)(v0 + 632), sel_init);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_21F09543C(v30, (uint64_t *)&unk_267EBB450);
  dispatch_semaphore_t v33 = *(uint64_t (**)(id))(v0 + 8);
  return v33(v32);
}

uint64_t sub_21F0913DC()
{
  uint64_t v1 = v0[92];
  uint64_t v2 = v0[90];
  uint64_t v3 = v0[89];
  uint64_t v4 = (char *)v0[88];
  uint64_t v5 = v0[87];
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_21F09543C(v5, (uint64_t *)&unk_267EBB450);
  sub_21F095358(*(void *)&v4[v3], *(void *)&v4[v3 + 8]);
  sub_21F094F20((uint64_t)&v4[v2], (uint64_t)(v0 + 48));
  sub_21F0950E8(v0 + 48, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_21F095154);
  swift_bridgeObjectRelease();
  sub_21F09543C((uint64_t)&v4[v1], (uint64_t *)&unk_267EBB450);

  type metadata accessor for PADSWClassifier();
  swift_deallocPartialClassInstance();
  long long v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_21F091540(uint64_t *a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  uint64_t v5 = (uint64_t *)(v1 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_request);
  uint64_t *v5 = *a1;
  v5[1] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (qword_267EBABA8 != -1) {
    swift_once();
  }
  if (qword_267EBAF00) {
    sub_21F09579C();
  }
  uint64_t v6 = *(void *)(v1 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_fac);
  sub_21F0BD5BC(v3, v4);
  *(void *)(v6 + 136) = &off_26D0A6100;
  swift_unknownObjectWeakAssign();
  *(void *)(*(void *)(v2 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_ta) + 208) = &off_26D0A6130;
  swift_unknownObjectWeakAssign();
  *(void *)(*(void *)(v2 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_selfieAnalyzer) + 152) = &off_26D0A6148;
  return swift_unknownObjectWeakAssign();
}

void sub_21F091654()
{
}

uint64_t sub_21F091680()
{
  uint64_t v1 = sub_21F0C8FC8();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *(void *)(v0 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_fac);
  if (qword_267EBAB80 != -1) {
    swift_once();
  }
  uint64_t v6 = __swift_project_value_buffer(v1, (uint64_t)qword_267EBAB88);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v6, v1);
  long long v7 = sub_21F0C8FA8();
  os_log_type_t v8 = sub_21F0C9228();
  if (os_log_type_enabled(v7, v8))
  {
    long long v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)long long v9 = 0;
    _os_log_impl(&dword_21F07C000, v7, v8, "FAC Module: AX has been enabled", v9, 2u);
    MEMORY[0x223C43270](v9, -1, -1);
  }

  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  *(unsigned char *)(v5 + 257) = 1;
  return result;
}

uint64_t sub_21F09182C()
{
  return sub_21F0BE5EC();
}

uint64_t sub_21F091858()
{
  return sub_21F0BDC3C();
}

uint64_t sub_21F091884()
{
  return sub_21F0BDF78();
}

uint64_t sub_21F0918B0()
{
  return sub_21F0BE2B4();
}

void sub_21F0918DC(void *a1, unsigned __int8 *a2)
{
  int v3 = *a2;
  int v4 = a2[1];
  int v5 = a2[2];
  sub_21F0C93B8();
  sub_21F0C90C8();
  type metadata accessor for CMTime(0);
  sub_21F0C90A8();
  sub_21F0C90C8();
  swift_bridgeObjectRelease();
  sub_21F0C90C8();
  sub_21F0C90A8();
  sub_21F0C90C8();
  swift_bridgeObjectRelease();
  sub_21F0C90C8();
  sub_21F0C90C8();
  swift_bridgeObjectRelease();
  sub_21F08B39C(0, 0xE000000000000000);
  swift_bridgeObjectRelease();
  if (v3)
  {
    sub_21F0AE95C(a1);
    if (!v4)
    {
LABEL_3:
      if (!v5) {
        return;
      }
      goto LABEL_4;
    }
  }
  else if (!v4)
  {
    goto LABEL_3;
  }
  sub_21F0AE95C(a1);
  if (!v5) {
    return;
  }
LABEL_4:
  sub_21F0B32D4((char *)a1);
}

uint64_t sub_21F091B18()
{
  uint64_t v1 = sub_21F0C8FC8();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  int v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(v0 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_facResult + 8))
  {
    return sub_21F092734();
  }
  else
  {
    if (qword_267EBAB80 != -1) {
      swift_once();
    }
    uint64_t v6 = __swift_project_value_buffer(v1, (uint64_t)qword_267EBAB88);
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v6, v1);
    long long v7 = sub_21F0C8FA8();
    os_log_type_t v8 = sub_21F0C9228();
    if (os_log_type_enabled(v7, v8))
    {
      long long v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v9 = 0;
      _os_log_impl(&dword_21F07C000, v7, v8, "FAC results are not complete, unable to finish processing without selfie.", v9, 2u);
      MEMORY[0x223C43270](v9, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
}

uint64_t sub_21F091CE4(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_delegate;
  swift_beginAccess();
  sub_21F08FCE0(v3, (uint64_t)v10);
  if (!v11) {
    return sub_21F09543C((uint64_t)v10, (uint64_t *)&unk_267EBB450);
  }
  sub_21F093D74((uint64_t)v10, (uint64_t)v7);
  sub_21F09543C((uint64_t)v10, (uint64_t *)&unk_267EBB450);
  uint64_t v4 = v8;
  uint64_t v5 = v9;
  __swift_project_boxed_opaque_existential_1(v7, v8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 56))(a1, v4, v5);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
}

uint64_t sub_21F091DB4(void *a1)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v5 = a1[4];
  uint64_t v6 = (void *)(v1 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_facResult);
  uint64_t v7 = *(void *)(v1 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_facResult);
  uint64_t v8 = *(void *)(v1 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_facResult + 8);
  void *v6 = *(unsigned int *)a1;
  v6[1] = v2;
  v6[2] = v3;
  v6[3] = v4;
  v6[4] = v5;
  uint64_t v20 = v3;
  uint64_t v21 = v2;
  uint64_t v18 = v5;
  uint64_t v19 = v4;
  sub_21F09532C((uint64_t)&v21);
  sub_21F09532C((uint64_t)&v20);
  sub_21F09532C((uint64_t)&v19);
  sub_21F09532C((uint64_t)&v18);
  sub_21F095358(v7, v8);
  uint64_t v9 = v1 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_delegate;
  swift_beginAccess();
  sub_21F08FCE0(v9, (uint64_t)v16);
  if (!v17) {
    return sub_21F09543C((uint64_t)v16, (uint64_t *)&unk_267EBB450);
  }
  sub_21F093D74((uint64_t)v16, (uint64_t)v13);
  sub_21F09543C((uint64_t)v16, (uint64_t *)&unk_267EBB450);
  uint64_t v10 = v14;
  uint64_t v11 = v15;
  __swift_project_boxed_opaque_existential_1(v13, v14);
  (*(void (**)(uint64_t, uint64_t))(v11 + 40))(v10, v11);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
}

uint64_t sub_21F091EF4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_21F0C8FC8();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  uint64_t v9 = (char *)v39 - v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)v39 - v10;
  uint64_t v12 = *(void *)(v1 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_request);
  if (v12)
  {
    uint64_t v13 = (uint64_t *)(v1 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_facResult);
    uint64_t v14 = *(void *)(v1 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_facResult + 8);
    if (!v14) {
      goto LABEL_4;
    }
    uint64_t v15 = *v13;
    uint64_t v17 = v13[2];
    uint64_t v16 = v13[3];
    uint64_t v18 = v13[4];
    int v50 = v15;
    uint64_t v51 = v14;
    uint64_t v52 = v17;
    v39[4] = v18;
    v39[5] = v16;
    uint64_t v53 = v16;
    uint64_t v54 = v18;
    sub_21F094F20(v1 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_selfieResult, (uint64_t)v48);
    sub_21F094F20((uint64_t)v48, (uint64_t)v49);
    if (sub_21F094F88((uint64_t)v49) != 1)
    {
      v39[1] = v6;
      v55[6] = v49[6];
      v55[7] = v49[7];
      v55[8] = v49[8];
      v55[9] = v49[9];
      v55[2] = v49[2];
      v55[3] = v49[3];
      v55[4] = v49[4];
      v55[5] = v49[5];
      v55[0] = v49[0];
      v55[1] = v49[1];
      uint64_t v28 = v17;
      uint64_t v29 = *(void *)(v1 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_ta);
      v39[3] = *(void *)(v1 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_livenessClassifier);
      swift_beginAccess();
      uint64_t v30 = *(void **)(v29 + 168);
      v39[2] = *(void *)(v29 + 160);
      v39[0] = v28;
      sub_21F094FA0(v15, v14);
      swift_bridgeObjectRetain();
      sub_21F0950E8(v48, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_21F095004);
      id v31 = v30;
      sub_21F0C9298();
      sub_21F0C92A8();

      uint64_t v32 = *(void *)(v1 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_prd);
      float v33 = sub_21F0BA048();
      float v34 = sub_21F0BA23C();
      uint64_t v35 = sub_21F0B9220(*(float *)&v15, v33, v34, *(float *)v49);
      swift_retain();
      swift_retain();
      sub_21F08C7DC(v35, v12, &v50, (uint64_t)v55, v29, v32, (uint64_t)v46);
      uint64_t v36 = v1 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_delegate;
      swift_beginAccess();
      sub_21F08FCE0(v36, (uint64_t)v45);
      if (v45[3])
      {
        sub_21F093D74((uint64_t)v45, (uint64_t)v42);
        sub_21F09543C((uint64_t)v45, (uint64_t *)&unk_267EBB450);
        uint64_t v37 = v43;
        uint64_t v38 = v44;
        __swift_project_boxed_opaque_existential_1(v42, v43);
        v40[12] = v46[12];
        v40[13] = v46[13];
        v40[14] = v46[14];
        uint64_t v41 = v47;
        v40[8] = v46[8];
        v40[9] = v46[9];
        v40[10] = v46[10];
        v40[11] = v46[11];
        v40[4] = v46[4];
        v40[5] = v46[5];
        v40[6] = v46[6];
        v40[7] = v46[7];
        v40[0] = v46[0];
        v40[1] = v46[1];
        v40[2] = v46[2];
        v40[3] = v46[3];
        (*(void (**)(_OWORD *, uint64_t, uint64_t))(v38 + 48))(v40, v37, v38);
        sub_21F08FAF0((uint64_t)v46);
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
      }
      else
      {
        sub_21F08FAF0((uint64_t)v46);
        return sub_21F09543C((uint64_t)v45, (uint64_t *)&unk_267EBB450);
      }
    }
    else
    {
LABEL_4:
      if (qword_267EBAB80 != -1) {
        swift_once();
      }
      uint64_t v19 = __swift_project_value_buffer(v2, (uint64_t)qword_267EBAB88);
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v11, v19, v2);
      uint64_t v20 = sub_21F0C8FA8();
      os_log_type_t v21 = sub_21F0C9238();
      if (os_log_type_enabled(v20, v21))
      {
        uint64_t v22 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v22 = 0;
        _os_log_impl(&dword_21F07C000, v20, v21, "Attempted to finalize liveness results before FAC and selfie processing has completed", v22, 2u);
        MEMORY[0x223C43270](v22, -1, -1);
      }

      return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v11, v2);
    }
  }
  else
  {
    if (qword_267EBAB80 != -1) {
      swift_once();
    }
    uint64_t v24 = __swift_project_value_buffer(v2, (uint64_t)qword_267EBAB88);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v9, v24, v2);
    uint64_t v25 = sub_21F0C8FA8();
    os_log_type_t v26 = sub_21F0C9238();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v27 = 0;
      _os_log_impl(&dword_21F07C000, v25, v26, "Attempted to finalize liveness results without a classifier request set.", v27, 2u);
      MEMORY[0x223C43270](v27, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v9, v2);
  }
}

uint64_t sub_21F092734()
{
  uint64_t v1 = sub_21F0C8FC8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v38 - v5;
  MEMORY[0x270FA5388](v4);
  uint64_t v9 = (char *)v38 - v8;
  uint64_t v10 = *(void *)(v0 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_request);
  if (v10)
  {
    uint64_t v11 = (uint64_t *)(v0 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_facResult);
    uint64_t v12 = *(void *)(v0 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_facResult + 8);
    if (v12)
    {
      v38[1] = v1;
      v38[2] = v2;
      uint64_t v13 = v11[3];
      uint64_t v14 = v11[4];
      uint64_t v15 = v11[2];
      uint64_t v16 = *v11;
      LODWORD(v17) = *v11;
      float v47 = v17;
      uint64_t v48 = v12;
      uint64_t v49 = v15;
      v38[4] = *(void *)(v0 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_livenessClassifier);
      v38[5] = v7;
      uint64_t v50 = v13;
      uint64_t v51 = v14;
      uint64_t v18 = *(void *)(v0 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_ta);
      swift_beginAccess();
      uint64_t v19 = *(void **)(v18 + 168);
      v38[3] = *(void *)(v18 + 160);
      swift_bridgeObjectRetain();
      v38[0] = v15;
      uint64_t v20 = v0;
      sub_21F094FA0(v16, v12);
      id v21 = v19;
      sub_21F0C9298();
      sub_21F0C92A8();

      uint64_t v22 = *(void *)(v20 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_prd);
      float v23 = sub_21F0BA048();
      float v24 = sub_21F0BA23C();
      uint64_t v34 = sub_21F0B9220(v17, v23, v24, -1.0);
      swift_retain();
      swift_retain();
      sub_21F08CD40(v34, v10, (int *)&v47, v18, v22, (uint64_t)v45);
      uint64_t v35 = v20 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_delegate;
      swift_beginAccess();
      sub_21F08FCE0(v35, (uint64_t)v44);
      if (v44[3])
      {
        sub_21F093D74((uint64_t)v44, (uint64_t)v41);
        sub_21F09543C((uint64_t)v44, (uint64_t *)&unk_267EBB450);
        uint64_t v36 = v42;
        uint64_t v37 = v43;
        __swift_project_boxed_opaque_existential_1(v41, v42);
        v39[12] = v45[12];
        v39[13] = v45[13];
        v39[14] = v45[14];
        uint64_t v40 = v46;
        v39[8] = v45[8];
        v39[9] = v45[9];
        v39[10] = v45[10];
        v39[11] = v45[11];
        v39[4] = v45[4];
        v39[5] = v45[5];
        void v39[6] = v45[6];
        v39[7] = v45[7];
        v39[0] = v45[0];
        v39[1] = v45[1];
        v39[2] = v45[2];
        v39[3] = v45[3];
        (*(void (**)(_OWORD *, uint64_t, uint64_t))(v37 + 48))(v39, v36, v37);
        sub_21F08FAF0((uint64_t)v45);
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
      }
      else
      {
        sub_21F08FAF0((uint64_t)v45);
        return sub_21F09543C((uint64_t)v44, (uint64_t *)&unk_267EBB450);
      }
    }
    else
    {
      if (qword_267EBAB80 != -1) {
        swift_once();
      }
      uint64_t v30 = __swift_project_value_buffer(v1, (uint64_t)qword_267EBAB88);
      (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v9, v30, v1);
      id v31 = sub_21F0C8FA8();
      os_log_type_t v32 = sub_21F0C9238();
      if (os_log_type_enabled(v31, v32))
      {
        float v33 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)float v33 = 0;
        _os_log_impl(&dword_21F07C000, v31, v32, "Attempted to finalize liveness results before FAC processing has completed", v33, 2u);
        MEMORY[0x223C43270](v33, -1, -1);
      }

      return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v9, v1);
    }
  }
  else
  {
    if (qword_267EBAB80 != -1) {
      swift_once();
    }
    uint64_t v25 = __swift_project_value_buffer(v1, (uint64_t)qword_267EBAB88);
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v6, v25, v1);
    os_log_type_t v26 = sub_21F0C8FA8();
    os_log_type_t v27 = sub_21F0C9238();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v28 = 0;
      _os_log_impl(&dword_21F07C000, v26, v27, "Attempted to finalize liveness results without a classifier request set.", v28, 2u);
      MEMORY[0x223C43270](v28, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v6, v1);
  }
}

id PADSWClassifier.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void PADSWClassifier.init()()
{
}

id PADSWClassifier.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PADSWClassifier();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_21F0930E0(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x7373656E6576696CLL && a2 == 0xED00006C6562614CLL;
  if (v3 || (sub_21F0C95D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x5365727574736567 && a2 == 0xEF65636E65757165 || (sub_21F0C95D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x656D737365737361 && a2 == 0xEE0043414673746ELL || (sub_21F0C95D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x656D737365737361 && a2 == 0xEE0044525073746ELL || (sub_21F0C95D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x656D737365737361 && a2 == 0xED0000415473746ELL || (sub_21F0C95D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6D617473656D6974 && a2 == 0xED00004341467370 || (sub_21F0C95D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6D617473656D6974 && a2 == 0xEC00000044497370 || (sub_21F0C95D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x800000021F0CE510 || (sub_21F0C95D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x6E69727065636166 && a2 == 0xEC00000044497374 || (sub_21F0C95D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x656D737365737361 && a2 == 0xED0000434146746ELL || (sub_21F0C95D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0x656D737365737361 && a2 == 0xEC0000004154746ELL || (sub_21F0C95D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000021F0CE530 || (sub_21F0C95D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000021F0CE550 || (sub_21F0C95D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 12;
  }
  else if (a1 == 0x656D737365737361 && a2 == 0xEC0000004449746ELL || (sub_21F0C95D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 13;
  }
  else if (a1 == 0x6F4C63634E78616DLL && a2 == 0xE900000000000077 || (sub_21F0C95D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 14;
  }
  else if (a1 == 0x694863634E78616DLL && a2 == 0xEA00000000006867 || (sub_21F0C95D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 15;
  }
  else if (a1 == 0x536465726F6E6769 && a2 == 0xEF73656863746974 || (sub_21F0C95D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 16;
  }
  else if (a1 == 0x6E49656369766564 && a2 == 0xEA00000000006F66 || (sub_21F0C95D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 17;
  }
  else if (a1 == 0x6C6562614C656761 && a2 == 0xE800000000000000 || (sub_21F0C95D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 18;
  }
  else if (a1 == 0x6C6562614C786573 && a2 == 0xE800000000000000 || (sub_21F0C95D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 19;
  }
  else if (a1 == 0x656E6F746E696B73 && a2 == 0xED00006C6562614CLL || (sub_21F0C95D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 20;
  }
  else if (a1 == 0x746963696E687465 && a2 == 0xEE006C6562614C79 || (sub_21F0C95D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 21;
  }
  else if (a1 == 0x7269614865636166 && a2 == 0xED00006C6562614CLL || (sub_21F0C95D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 22;
  }
  else if (a1 == 0x7261656764616568 && a2 == 0xED00006C6562614CLL || (sub_21F0C95D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 23;
  }
  else if (a1 == 0x4C73657373616C67 && a2 == 0xEC0000006C656261)
  {
    swift_bridgeObjectRelease();
    return 24;
  }
  else
  {
    char v6 = sub_21F0C95D8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 24;
    }
    else {
      return 25;
    }
  }
}

unint64_t sub_21F093AE0()
{
  unint64_t result = qword_267EBAE88;
  if (!qword_267EBAE88)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_267EBAE88);
  }
  return result;
}

uint64_t type metadata accessor for PADSWClassifier()
{
  return self;
}

uint64_t sub_21F093B44(void *a1, char a2)
{
  uint64_t v5 = sub_21F0C8FC8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = (uint64_t *)(v2 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_facResult);
  if (*(void *)(v2 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_facResult + 8))
  {
    if (a2)
    {
      uint64_t v10 = v9[3];
      sub_21F094FA0(*v9, *(void *)(v2 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_facResult + 8));
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v10 = 0;
    }
    swift_bridgeObjectRetain();
    id v16 = a1;
    sub_21F0B4138(v16, v10);

    return swift_bridgeObjectRelease_n();
  }
  else
  {
    if (qword_267EBAB80 != -1) {
      swift_once();
    }
    uint64_t v11 = __swift_project_value_buffer(v5, (uint64_t)qword_267EBAB88);
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v11, v5);
    uint64_t v12 = sub_21F0C8FA8();
    os_log_type_t v13 = sub_21F0C9228();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_21F07C000, v12, v13, "FAC not complete; unable to process selfie.", v14, 2u);
      MEMORY[0x223C43270](v14, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
}

uint64_t sub_21F093D74(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_21F093DD8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_delegate;
  swift_beginAccess();
  return sub_21F08FCE0(v3, a2);
}

void *sub_21F093E34@<X0>(void *result@<X0>, unsigned char *a2@<X8>)
{
  *a2 = *(unsigned char *)(*(void *)(*result + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_ta) + 185);
  return result;
}

unsigned char *sub_21F093E50(unsigned char *result, void *a2)
{
  *(unsigned char *)(*(void *)(*a2 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_ta) + 185) = *result;
  return result;
}

uint64_t dispatch thunk of PADSWClassifierDelegate.padClassifierWillStartDetectingGesture(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of PADSWClassifierDelegate.padClassifierDidDetectIncorrectGesture(duringDetectionOfGesture:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of PADSWClassifierDelegate.padClassifierDidDetectGesture(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of PADSWClassifierDelegate.padClassifierDidDetectStitchWhileDetectingFrame(_:shouldBeIgnored:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of PADSWClassifierDelegate.padClassifierDidFinishGestureDetection()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of PADSWClassifierDelegate.padClassifierDidCompleteAssessment(withResult:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of PADSWClassifierDelegate.padClassifierDidCancelWithError(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

void *initializeBufferWithCopyOfBuffer for PADSWClassifierRequest(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for PADSWClassifierRequest()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for PADSWClassifierRequest(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  return a1;
}

void *assignWithTake for PADSWClassifierRequest(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for PADSWClassifierRequest(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PADSWClassifierRequest(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)unint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)unint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PADSWClassifierRequest()
{
  return &type metadata for PADSWClassifierRequest;
}

uint64_t destroy for PADSWClassifierResult()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PADSWClassifierResult(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_DWORD *)(a1 + 72) = *(_DWORD *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_DWORD *)(a1 + 104) = *(_DWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  uint64_t v7 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v7;
  uint64_t v8 = *(void *)(a2 + 152);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = v8;
  uint64_t v9 = *(void *)(a2 + 168);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = v9;
  uint64_t v10 = *(void *)(a2 + 184);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = v10;
  uint64_t v11 = *(void *)(a2 + 200);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = v11;
  uint64_t v12 = *(void *)(a2 + 216);
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  *(void *)(a1 + 216) = v12;
  uint64_t v13 = *(void *)(a2 + 232);
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  *(void *)(a1 + 232) = v13;
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PADSWClassifierResult(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 72) = *(_DWORD *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_DWORD *)(a1 + 88) = *(_DWORD *)(a2 + 88);
  *(_DWORD *)(a1 + 92) = *(_DWORD *)(a2 + 92);
  *(_DWORD *)(a1 + 96) = *(_DWORD *)(a2 + 96);
  *(_DWORD *)(a1 + 100) = *(_DWORD *)(a2 + 100);
  *(_DWORD *)(a1 + 104) = *(_DWORD *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 232) = *(void *)(a2 + 232);
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy248_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[1];
  long long v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  long long v5 = a2[4];
  long long v6 = a2[5];
  long long v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  long long v8 = a2[8];
  long long v9 = a2[9];
  long long v10 = a2[11];
  *(_OWORD *)(a1 + 160) = a2[10];
  *(_OWORD *)(a1 + 176) = v10;
  *(_OWORD *)(a1 + 128) = v8;
  *(_OWORD *)(a1 + 144) = v9;
  __n128 result = (__n128)a2[12];
  long long v12 = a2[13];
  long long v13 = a2[14];
  *(void *)(a1 + 240) = *((void *)a2 + 30);
  *(_OWORD *)(a1 + 208) = v12;
  *(_OWORD *)(a1 + 224) = v13;
  *(__n128 *)(a1 + 192) = result;
  return result;
}

uint64_t assignWithTake for PADSWClassifierResult(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 72) = *(_DWORD *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_DWORD *)(a1 + 104) = *(_DWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 144);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(void *)(a1 + 144) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 160);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(void *)(a1 + 160) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 176);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  *(void *)(a1 + 176) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 192);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  *(void *)(a1 + 192) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 208);
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  *(void *)(a1 + 208) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 224);
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  *(void *)(a1 + 224) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(a2 + 240);
  *(void *)(a1 + 232) = *(void *)(a2 + 232);
  *(void *)(a1 + 240) = v10;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PADSWClassifierResult(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 248)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PADSWClassifierResult(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 248) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 248) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PADSWClassifierResult()
{
  return &type metadata for PADSWClassifierResult;
}

uint64_t method lookup function for PADSWClassifier(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PADSWClassifier);
}

uint64_t dispatch thunk of PADSWClassifier.delegate.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of PADSWClassifier.delegate.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of PADSWClassifier.delegate.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of PADSWClassifier.currentGesture.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of PADSWClassifier.taMode.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of PADSWClassifier.taMode.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of PADSWClassifier.taMode.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of PADSWClassifier.startLivenessDetectionWithRequest(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x130))();
}

uint64_t dispatch thunk of PADSWClassifier.skipGesture()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x138))();
}

uint64_t dispatch thunk of PADSWClassifier.enableAccessibilityOptions()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x140))();
}

uint64_t dispatch thunk of PADSWClassifier.restartGesture()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x148))();
}

uint64_t dispatch thunk of PADSWClassifier.pauseGestureDetection()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x150))();
}

uint64_t dispatch thunk of PADSWClassifier.prepareToResumeGestureDetection()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x158))();
}

uint64_t dispatch thunk of PADSWClassifier.resumeGestureDetection()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of PADSWClassifier.processFrame(_:withProcessingOptions:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x168))();
}

uint64_t dispatch thunk of PADSWClassifier.finishWithSelfie(_:performIDMatching:faceprints:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x170))();
}

uint64_t dispatch thunk of PADSWClassifier.finishWithoutSelfie()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x178))();
}

uint64_t dispatch thunk of PADSWClassifier.cancel(error:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x180))();
}

uint64_t __swift_memcpy3_1(uint64_t result, __int16 *a2)
{
  __int16 v2 = *a2;
  *(unsigned char *)(result + 2) = *((unsigned char *)a2 + 2);
  *(_WORD *)__n128 result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for PADSWClassifier.FrameProcessingOptions(unsigned __int16 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF)
  {
    if ((a2 + 33554177) >> 24)
    {
      int v2 = *((unsigned __int8 *)a1 + 3);
      if (*((unsigned char *)a1 + 3)) {
        return (*a1 | (*((unsigned __int8 *)a1 + 2) << 16) | (v2 << 24)) - 16776961;
      }
    }
    else
    {
      int v2 = *(unsigned __int16 *)((char *)a1 + 3);
      if (*(unsigned __int16 *)((char *)a1 + 3)) {
        return (*a1 | (*((unsigned __int8 *)a1 + 2) << 16) | (v2 << 24)) - 16776961;
      }
    }
  }
  unsigned int v4 = *(unsigned __int8 *)a1;
  BOOL v5 = v4 >= 2;
  int v6 = (v4 + 2147483646) & 0x7FFFFFFF;
  if (!v5) {
    int v6 = -1;
  }
  return (v6 + 1);
}

uint64_t storeEnumTagSinglePayload for PADSWClassifier.FrameProcessingOptions(uint64_t result, unsigned int a2, unsigned int a3)
{
  if ((a3 + 33554177) >> 24) {
    int v3 = 1;
  }
  else {
    int v3 = 2;
  }
  if (a3 <= 0xFE) {
    int v3 = 0;
  }
  if (a2 > 0xFE)
  {
    *(_WORD *)__n128 result = a2 - 255;
    *(unsigned char *)(result + 2) = (a2 - 255) >> 16;
    if (v3)
    {
      unsigned int v4 = ((a2 - 255) >> 24) + 1;
      if (v3 == 2) {
        *(_WORD *)(result + 3) = v4;
      }
      else {
        *(unsigned char *)(result + 3) = v4;
      }
    }
  }
  else
  {
    if (!v3) {
      goto LABEL_10;
    }
    if (v3 == 2)
    {
      *(_WORD *)(result + 3) = 0;
LABEL_10:
      if (!a2) {
        return result;
      }
LABEL_16:
      *(unsigned char *)__n128 result = a2 + 1;
      return result;
    }
    *(unsigned char *)(result + 3) = 0;
    if (a2) {
      goto LABEL_16;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PADSWClassifier.FrameProcessingOptions()
{
  return &type metadata for PADSWClassifier.FrameProcessingOptions;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  std::logic_error *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PADSWClassifierResult.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xE8) {
    goto LABEL_17;
  }
  if (a2 + 24 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 24) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 24;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 24;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 24;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x19;
  int v8 = v6 - 25;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for PADSWClassifierResult.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 24 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 24) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xE8) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xE7)
  {
    unsigned int v6 = ((a2 - 232) >> 8) + 1;
    std::logic_error *result = a2 + 24;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x21F094DD0);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          std::logic_error *result = a2 + 24;
        break;
    }
  }
  return result;
}

uint64_t sub_21F094DF8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_21F094E00(unsigned char *result, char a2)
{
  std::logic_error *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PADSWClassifierResult.CodingKeys()
{
  return &type metadata for PADSWClassifierResult.CodingKeys;
}

unint64_t sub_21F094E1C()
{
  unint64_t result = qword_267EBAED0;
  if (!qword_267EBAED0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EBAED0);
  }
  return result;
}

unint64_t sub_21F094E74()
{
  unint64_t result = qword_267EBAED8;
  if (!qword_267EBAED8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EBAED8);
  }
  return result;
}

unint64_t sub_21F094ECC()
{
  unint64_t result = qword_267EBAEE0;
  if (!qword_267EBAEE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EBAEE0);
  }
  return result;
}

uint64_t sub_21F094F20(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EBAEE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21F094F88(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 120);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

uint64_t sub_21F094FA0(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_21F095004(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  if (a16)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

void *sub_21F0950E8(void *a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))
{
  a2(*a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[14], a1[15], a1[16], a1[17], a1[18],
    a1[19]);
  return a1;
}

uint64_t sub_21F095154(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  uint64_t result = a16;
  if (a16)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_21F095238(uint64_t a1)
{
  return a1;
}

uint64_t sub_21F095264(uint64_t a1)
{
  return a1;
}

uint64_t sub_21F09532C(uint64_t a1)
{
  return a1;
}

uint64_t sub_21F095358(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

double sub_21F0953BC(_OWORD *a1)
{
  double result = 0.0;
  a1[8] = 0u;
  a1[9] = 0u;
  a1[6] = 0u;
  a1[7] = 0u;
  a1[4] = 0u;
  a1[5] = 0u;
  a1[2] = 0u;
  a1[3] = 0u;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

uint64_t sub_21F0953D8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 24))(a2, a1, v5);
  return a2;
}

uint64_t sub_21F09543C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_21F09549C()
{
  type metadata accessor for PADSWAuditDataRecorder();
  uint64_t v0 = swift_allocObject();
  uint64_t v1 = MEMORY[0x263F8EE78];
  *(void *)(v0 + 16) = MEMORY[0x263F8EE78];
  *(void *)(v0 + 24) = v1;
  uint64_t v2 = v0 + OBJC_IVAR____TtC10CoreIDVPAD22PADSWAuditDataRecorder_directory;
  uint64_t v3 = sub_21F0C8F08();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 1, 1, v3);
  uint64_t result = sub_21F0A62AC(0);
  if ((result & 1) == 0)
  {
    uint64_t result = swift_release();
    uint64_t v0 = 0;
  }
  qword_267EBAF00 = v0;
  return result;
}

uint64_t PADSWAuditDataRecorder.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  uint64_t v1 = MEMORY[0x263F8EE78];
  *(void *)(v0 + 16) = MEMORY[0x263F8EE78];
  *(void *)(v0 + 24) = v1;
  uint64_t v2 = v0 + OBJC_IVAR____TtC10CoreIDVPAD22PADSWAuditDataRecorder_directory;
  uint64_t v3 = sub_21F0C8F08();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 1, 1, v3);
  if ((sub_21F0A62AC(0) & 1) == 0)
  {
    swift_release();
    return 0;
  }
  return v0;
}

uint64_t static PADSWAuditDataRecorder.shared.getter()
{
  if (qword_267EBABA8 != -1) {
    swift_once();
  }
  return swift_retain();
}

uint64_t PADSWAuditDataRecorder.init()()
{
  uint64_t v1 = MEMORY[0x263F8EE78];
  *(void *)(v0 + 16) = MEMORY[0x263F8EE78];
  *(void *)(v0 + 24) = v1;
  uint64_t v2 = v0 + OBJC_IVAR____TtC10CoreIDVPAD22PADSWAuditDataRecorder_directory;
  uint64_t v3 = sub_21F0C8F08();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 1, 1, v3);
  if ((sub_21F0A62AC(0) & 1) == 0)
  {
    swift_release();
    return 0;
  }
  return v0;
}

uint64_t PADSWAuditDataRecorder.deinit()
{
  sub_21F09BA74();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21F09543C(v0 + OBJC_IVAR____TtC10CoreIDVPAD22PADSWAuditDataRecorder_directory, &qword_267EBAF10);
  return v0;
}

uint64_t PADSWAuditDataRecorder.__deallocating_deinit()
{
  sub_21F09BA74();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21F09543C(v0 + OBJC_IVAR____TtC10CoreIDVPAD22PADSWAuditDataRecorder_directory, &qword_267EBAF10);
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_21F09579C()
{
  uint64_t v1 = v0;
  uint64_t v86 = *MEMORY[0x263EF8340];
  uint64_t v2 = sub_21F0C8FC8();
  uint64_t v80 = *(void *)(v2 - 8);
  uint64_t v81 = v2;
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  uint64_t v75 = (char *)&v72 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  BOOL v7 = (char *)&v72 - v6;
  MEMORY[0x270FA5388](v5);
  uint64_t v76 = (char *)&v72 - v8;
  uint64_t v78 = sub_21F0C8F98();
  uint64_t v77 = *(void *)(v78 - 8);
  MEMORY[0x270FA5388](v78);
  uint64_t v10 = (char *)&v72 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EBAF10);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v73 = (char *)&v72 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v72 - v14;
  uint64_t v16 = sub_21F0C8F08();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v74 = (char *)&v72 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v79 = (char *)&v72 - v21;
  MEMORY[0x270FA5388](v20);
  uint64_t v82 = (char *)&v72 - v22;
  swift_beginAccess();
  uint64_t v23 = MEMORY[0x263F8EE78];
  *(void *)(v1 + 16) = MEMORY[0x263F8EE78];
  swift_bridgeObjectRelease();
  swift_beginAccess();
  *(void *)(v1 + 24) = v23;
  swift_bridgeObjectRelease();
  float v24 = self;
  id v25 = objc_msgSend(v24, sel_defaultManager);
  id v26 = objc_msgSend(v25, sel_URLsForDirectory_inDomains_, 13, 1);

  uint64_t v27 = sub_21F0C9128();
  if (*(void *)(v27 + 16))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v17 + 16))(v15, v27 + ((*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80)), v16);
    uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56);
    v28(v15, 0, 1, v16);
  }
  else
  {
    uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56);
    v28(v15, 1, 1, v16);
  }
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v82, v15, v16);
    id v84 = 0;
    unint64_t v85 = 0xE000000000000000;
    sub_21F0C93B8();
    swift_bridgeObjectRelease();
    id v84 = (id)0xD000000000000010;
    unint64_t v85 = 0x800000021F0CE8A0;
    sub_21F0C8F88();
    sub_21F0C8F78();
    double v37 = v36;
    (*(void (**)(char *, uint64_t))(v77 + 8))(v10, v78);
    uint64_t v38 = v81;
    if ((~*(void *)&v37 & 0x7FF0000000000000) != 0)
    {
      if (v37 > -9.22337204e18)
      {
        if (v37 < 9.22337204e18)
        {
          uint64_t v78 = v17;
          uint64_t v83 = (uint64_t)v37;
          sub_21F0C95B8();
          sub_21F0C90C8();
          swift_bridgeObjectRelease();
          uint64_t v15 = v79;
          sub_21F0C8EC8();
          swift_bridgeObjectRelease();
          id v39 = objc_msgSend(v24, sel_defaultManager);
          uint64_t v40 = (void *)sub_21F0C8EB8();
          id v84 = 0;
          unsigned int v41 = objc_msgSend(v39, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v40, 1, 0, &v84);

          id v42 = v84;
          if (!v41)
          {
            id v58 = v84;
            uint64_t v59 = (void *)sub_21F0C8E78();

            swift_willThrow();
            if (qword_267EBAB80 != -1) {
              swift_once();
            }
            uint64_t v60 = __swift_project_value_buffer(v38, (uint64_t)qword_267EBAB88);
            uint64_t v61 = v80;
            uint64_t v62 = v75;
            (*(void (**)(char *, uint64_t, uint64_t))(v80 + 16))(v75, v60, v38);
            id v63 = v59;
            id v64 = v59;
            uint64_t v65 = sub_21F0C8FA8();
            os_log_type_t v66 = sub_21F0C9238();
            if (!os_log_type_enabled(v65, v66))
            {

              (*(void (**)(char *, uint64_t))(v61 + 8))(v62, v38);
              uint64_t v57 = *(void (**)(char *, uint64_t))(v78 + 8);
              uint64_t v71 = v15;
              goto LABEL_24;
            }
            uint64_t v67 = (uint8_t *)swift_slowAlloc();
            uint64_t v68 = (void *)swift_slowAlloc();
            id v84 = v68;
            *(_DWORD *)uint64_t v67 = 136315138;
            swift_getErrorValue();
            uint64_t v69 = sub_21F0C9618();
            uint64_t v83 = sub_21F09D6AC(v69, v70, (uint64_t *)&v84);
            sub_21F0C9308();
            swift_bridgeObjectRelease();

            _os_log_impl(&dword_21F07C000, v65, v66, "Could not create Audit Data directory: %s", v67, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x223C43270](v68, -1, -1);
            MEMORY[0x223C43270](v67, -1, -1);

            (*(void (**)(char *, uint64_t))(v61 + 8))(v75, v81);
            uint64_t v57 = *(void (**)(char *, uint64_t))(v78 + 8);
            goto LABEL_21;
          }
          uint64_t v10 = *(char **)(v78 + 16);
          uint64_t v43 = (uint64_t)v73;
          ((void (*)(char *, char *, uint64_t))v10)(v73, v15, v16);
          v28((char *)v43, 0, 1, v16);
          uint64_t v44 = v1 + OBJC_IVAR____TtC10CoreIDVPAD22PADSWAuditDataRecorder_directory;
          swift_beginAccess();
          id v45 = v42;
          sub_21F09F790(v43, v44);
          swift_endAccess();
          if (qword_267EBAB80 == -1)
          {
LABEL_15:
            uint64_t v46 = __swift_project_value_buffer(v38, (uint64_t)qword_267EBAB88);
            uint64_t v47 = v80;
            uint64_t v48 = v76;
            (*(void (**)(char *, uint64_t, uint64_t))(v80 + 16))(v76, v46, v38);
            uint64_t v49 = v74;
            ((void (*)(char *, char *, uint64_t))v10)(v74, v15, v16);
            uint64_t v50 = sub_21F0C8FA8();
            uint64_t v51 = v15;
            os_log_type_t v52 = sub_21F0C9238();
            if (!os_log_type_enabled(v50, v52))
            {

              uint64_t v57 = *(void (**)(char *, uint64_t))(v78 + 8);
              v57(v49, v16);
              (*(void (**)(char *, uint64_t))(v47 + 8))(v48, v38);
              uint64_t v71 = v51;
              goto LABEL_24;
            }
            uint64_t v53 = (uint8_t *)swift_slowAlloc();
            uint64_t v54 = (void *)swift_slowAlloc();
            id v84 = v54;
            *(_DWORD *)uint64_t v53 = 136315138;
            sub_21F09F7F8(&qword_267EBAFF8, MEMORY[0x263F06EA8]);
            uint64_t v55 = sub_21F0C95B8();
            uint64_t v83 = sub_21F09D6AC(v55, v56, (uint64_t *)&v84);
            sub_21F0C9308();
            swift_bridgeObjectRelease();
            uint64_t v57 = *(void (**)(char *, uint64_t))(v78 + 8);
            v57(v49, v16);
            _os_log_impl(&dword_21F07C000, v50, v52, "Will persist Audit Capture Data under: %s", v53, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x223C43270](v54, -1, -1);
            MEMORY[0x223C43270](v53, -1, -1);

            (*(void (**)(char *, uint64_t))(v47 + 8))(v76, v81);
LABEL_21:
            uint64_t v71 = v79;
LABEL_24:
            v57(v71, v16);
            return ((uint64_t (*)(char *, uint64_t))v57)(v82, v16);
          }
LABEL_28:
          swift_once();
          goto LABEL_15;
        }
LABEL_27:
        __break(1u);
        goto LABEL_28;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_27;
  }
  sub_21F09543C((uint64_t)v15, &qword_267EBAF10);
  uint64_t v29 = v81;
  if (qword_267EBAB80 != -1) {
    swift_once();
  }
  uint64_t v30 = __swift_project_value_buffer(v29, (uint64_t)qword_267EBAB88);
  uint64_t v31 = v80;
  (*(void (**)(char *, uint64_t, uint64_t))(v80 + 16))(v7, v30, v29);
  os_log_type_t v32 = sub_21F0C8FA8();
  os_log_type_t v33 = sub_21F0C9238();
  if (os_log_type_enabled(v32, v33))
  {
    uint64_t v34 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v34 = 0;
    _os_log_impl(&dword_21F07C000, v32, v33, "Could not derive base URL for Audit Data directory", v34, 2u);
    MEMORY[0x223C43270](v34, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v7, v29);
}

uint64_t sub_21F096398(long long *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v162 = a2;
  uint64_t v197 = *MEMORY[0x263EF8340];
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EBAF18);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v167 = &v154[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = sub_21F0C8FC8();
  uint64_t v176 = *(void *)(v8 - 8);
  uint64_t v177 = v8;
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v157 = &v154[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  v171 = &v154[-v12];
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  v168 = &v154[-v15];
  MEMORY[0x270FA5388](v14);
  v166 = &v154[-v16];
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EBAF10);
  uint64_t v18 = MEMORY[0x270FA5388](v17 - 8);
  uint64_t v165 = &v154[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = &v154[-v20];
  uint64_t v22 = sub_21F0C8F08();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  uint64_t v164 = &v154[-((v25 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  v175 = &v154[-v27];
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  uint64_t v158 = &v154[-v29];
  uint64_t v30 = MEMORY[0x270FA5388](v28);
  v169 = &v154[-v31];
  uint64_t v32 = MEMORY[0x270FA5388](v30);
  v159 = &v154[-v33];
  uint64_t v34 = MEMORY[0x270FA5388](v32);
  double v36 = &v154[-v35];
  uint64_t v37 = MEMORY[0x270FA5388](v34);
  uint64_t v174 = &v154[-v38];
  uint64_t v163 = v39;
  MEMORY[0x270FA5388](v37);
  unsigned int v41 = &v154[-v40];
  long long v42 = a1[13];
  long long v193 = a1[12];
  long long v194 = v42;
  long long v195 = a1[14];
  uint64_t v196 = *((void *)a1 + 30);
  long long v43 = a1[9];
  long long v189 = a1[8];
  long long v190 = v43;
  long long v44 = a1[11];
  long long v191 = a1[10];
  long long v192 = v44;
  long long v45 = a1[5];
  long long v185 = a1[4];
  long long v186 = v45;
  long long v46 = a1[7];
  long long v187 = a1[6];
  long long v188 = v46;
  long long v47 = a1[1];
  long long v181 = *a1;
  long long v182 = v47;
  long long v48 = a1[3];
  uint64_t v49 = v3 + OBJC_IVAR____TtC10CoreIDVPAD22PADSWAuditDataRecorder_directory;
  long long v183 = a1[2];
  long long v184 = v48;
  swift_beginAccess();
  sub_21F09DD04(v49, (uint64_t)v21);
  uint64_t v50 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v23 + 48);
  if (v50((uint64_t)v21, 1, v22) == 1) {
    return sub_21F09543C((uint64_t)v21, &qword_267EBAF10);
  }
  uint64_t v156 = v23 + 48;
  uint64_t v170 = v23;
  os_log_type_t v52 = *(void (**)(uint64_t, unsigned char *, uint64_t))(v23 + 32);
  uint64_t v172 = v22;
  v160 = v52;
  uint64_t v161 = v23 + 32;
  v52((uint64_t)v41, v21, v22);
  sub_21F0C8EC8();
  unint64_t v53 = 0x267EBA000uLL;
  v173 = v41;
  int v155 = v50;
  if (a3 >> 60 != 15) {
    sub_21F0C8F58();
  }
  uint64_t v54 = v170;
  sub_21F0C8E58();
  swift_allocObject();
  sub_21F0C8E48();
  v179[12] = v193;
  v179[13] = v194;
  v179[14] = v195;
  uint64_t v180 = v196;
  v179[8] = v189;
  v179[9] = v190;
  v179[10] = v191;
  v179[11] = v192;
  v179[4] = v185;
  v179[5] = v186;
  v179[6] = v187;
  v179[7] = v188;
  v179[0] = v181;
  v179[1] = v182;
  v179[2] = v183;
  v179[3] = v184;
  sub_21F09DD6C();
  uint64_t v55 = sub_21F0C8E38();
  unint64_t v57 = v56;
  swift_release();
  sub_21F0C8EC8();
  sub_21F0C8F58();
  (*(void (**)(unsigned char *, uint64_t))(v54 + 8))(v36, v172);
  sub_21F09E288(v55, v57);
  id v58 = v166;
  type metadata accessor for PADSWClassifier();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v60 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v61 = (void *)sub_21F0C9048();
  uint64_t v62 = (void *)sub_21F0C9048();
  id v63 = objc_msgSend(v60, sel_URLForResource_withExtension_, v61, v62);

  id v64 = &selRef_framesFromVideoURL_timestamps_size_error_;
  uint64_t v65 = &selRef_framesFromVideoURL_timestamps_size_error_;
  if (!v63)
  {
    uint64_t v67 = (uint64_t)v165;
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v54 + 56))(v165, 1, 1, v172);
    goto LABEL_11;
  }
  os_log_type_t v66 = v169;
  sub_21F0C8ED8();

  uint64_t v67 = (uint64_t)v165;
  uint64_t v68 = v172;
  v160((uint64_t)v165, v66, v172);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v54 + 56))(v67, 0, 1, v68);
  if (v155(v67, 1, v68) == 1)
  {
LABEL_11:
    sub_21F09543C(v67, &qword_267EBAF10);
LABEL_12:
    if (qword_267EBAB80 != -1) {
      swift_once();
    }
    uint64_t v83 = v177;
    uint64_t v84 = __swift_project_value_buffer(v177, (uint64_t)qword_267EBAB88);
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v176 + 16))(v58, v84, v83);
    unint64_t v85 = sub_21F0C8FA8();
    os_log_type_t v86 = sub_21F0C9228();
    if (os_log_type_enabled(v85, v86))
    {
      long long v87 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v87 = 0;
      _os_log_impl(&dword_21F07C000, v85, v86, "Could not find original SIML params to save to Audit Data directory", v87, 2u);
      MEMORY[0x223C43270](v87, -1, -1);
    }

    (*(void (**)(unsigned char *, uint64_t))(v176 + 8))(v58, v177);
    goto LABEL_17;
  }
  uint64_t v69 = v159;
  v160((uint64_t)v159, (unsigned char *)v67, v68);
  unint64_t v70 = self;
  id v71 = objc_msgSend(v70, sel_defaultManager);
  uint64_t v72 = v68;
  sub_21F0C8EE8();
  uint64_t v73 = (void *)sub_21F0C9048();
  swift_bridgeObjectRelease();
  unsigned int v74 = objc_msgSend(v71, (SEL)&selRef_assessmentLivePRD + 1, v73);

  if (!v74)
  {
    uint64_t v134 = v72;
    uint64_t v54 = v170;
    (*(void (**)(unsigned char *, uint64_t))(v170 + 8))(v69, v134);
    uint64_t v65 = &selRef_framesFromVideoURL_timestamps_size_error_;
    id v64 = &selRef_framesFromVideoURL_timestamps_size_error_;
    goto LABEL_12;
  }
  uint64_t v75 = v158;
  sub_21F0C8EC8();
  id v64 = &selRef_framesFromVideoURL_timestamps_size_error_;
  id v76 = objc_msgSend(v70, sel_defaultManager);
  uint64_t v77 = (void *)sub_21F0C8EB8();
  uint64_t v78 = (void *)sub_21F0C8EB8();
  *(void *)&v179[0] = 0;
  unsigned int v79 = objc_msgSend(v76, sel_copyItemAtURL_toURL_error_, v77, v78, v179);

  if (v79)
  {
    uint64_t v54 = v170;
    uint64_t v80 = *(void (**)(unsigned char *, uint64_t))(v170 + 8);
    id v81 = *(id *)&v179[0];
    uint64_t v82 = v172;
    v80(v75, v172);
    v80(v69, v82);
  }
  else
  {
    id v135 = *(id *)&v179[0];
    float v136 = (void *)sub_21F0C8E78();

    swift_willThrow();
    uint64_t v54 = v170;
    if (qword_267EBAB80 != -1) {
      swift_once();
    }
    uint64_t v137 = v177;
    uint64_t v138 = __swift_project_value_buffer(v177, (uint64_t)qword_267EBAB88);
    float v139 = v157;
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v176 + 16))(v157, v138, v137);
    id v140 = v136;
    id v141 = v136;
    unint64_t v142 = sub_21F0C8FA8();
    os_log_type_t v143 = sub_21F0C9238();
    BOOL v144 = os_log_type_enabled(v142, v143);
    int v145 = v158;
    if (v144)
    {
      BOOL v146 = (uint8_t *)swift_slowAlloc();
      v171 = (unsigned char *)swift_slowAlloc();
      *(void *)&v179[0] = v171;
      int v147 = v146;
      *(_DWORD *)BOOL v146 = 136315138;
      v166 = v146 + 4;
      swift_getErrorValue();
      uint64_t v148 = sub_21F0C9618();
      uint64_t v178 = sub_21F09D6AC(v148, v149, (uint64_t *)v179);
      unint64_t v53 = 0x267EBA000;
      sub_21F0C9308();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_21F07C000, v142, v143, "Could not persist parameters to Audit Data directory: %s", v147, 0xCu);
      unint64_t v150 = v171;
      swift_arrayDestroy();
      MEMORY[0x223C43270](v150, -1, -1);
      MEMORY[0x223C43270](v147, -1, -1);

      (*(void (**)(unsigned char *, uint64_t))(v176 + 8))(v139, v177);
      float v151 = *(void (**)(unsigned char *, uint64_t))(v54 + 8);
      size_t v152 = v158;
    }
    else
    {

      (*(void (**)(unsigned char *, uint64_t))(v176 + 8))(v139, v177);
      float v151 = *(void (**)(unsigned char *, uint64_t))(v54 + 8);
      size_t v152 = v145;
    }
    uint64_t v153 = v172;
    v151(v152, v172);
    v151(v159, v153);
  }
  uint64_t v65 = &selRef_framesFromVideoURL_timestamps_size_error_;
LABEL_17:
  sub_21F0C8EC8();
  id v88 = [self v64[110]];
  sub_21F0C8EE8();
  long long v89 = (void *)sub_21F0C9048();
  swift_bridgeObjectRelease();
  unsigned int v90 = objc_msgSend(v88, v65[111], v89);

  if (v90)
  {
    uint64_t v158 = (unsigned char *)sub_21F0C91C8();
    uint64_t v91 = *((void *)v158 - 1);
    v166 = *(unsigned char **)(v91 + 56);
    v171 = (unsigned char *)(v91 + 56);
    ((void (*)(unsigned char *, uint64_t, uint64_t, unsigned char *))v166)(v167, 1, 1, v158);
    uint64_t v93 = v54 + 16;
    long long v92 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v54 + 16);
    long long v94 = v169;
    uint64_t v95 = v172;
    v92(v169, v175, v172);
    long long v96 = v164;
    v92(v164, v173, v95);
    uint64_t v97 = *(unsigned __int8 *)(v93 + 64);
    uint64_t v98 = (v97 + 280) & ~v97;
    v159 = (unsigned char *)(v97 | 7);
    uint64_t v99 = v98;
    uint64_t v100 = (v163 + v97 + v98) & ~v97;
    uint64_t v162 = v98;
    v163 += v100;
    uint64_t v101 = v100;
    uint64_t v165 = (unsigned char *)v100;
    uint64_t v102 = swift_allocObject();
    *(void *)(v102 + 16) = 0;
    *(void *)(v102 + 24) = 0;
    long long v103 = v194;
    *(_OWORD *)(v102 + 224) = v193;
    *(_OWORD *)(v102 + 240) = v103;
    *(_OWORD *)(v102 + 256) = v195;
    *(void *)(v102 + 272) = v196;
    long long v104 = v190;
    *(_OWORD *)(v102 + 160) = v189;
    *(_OWORD *)(v102 + 176) = v104;
    long long v105 = v192;
    *(_OWORD *)(v102 + 192) = v191;
    *(_OWORD *)(v102 + 208) = v105;
    long long v106 = v186;
    *(_OWORD *)(v102 + 96) = v185;
    *(_OWORD *)(v102 + 112) = v106;
    long long v107 = v188;
    *(_OWORD *)(v102 + 128) = v187;
    *(_OWORD *)(v102 + 144) = v107;
    long long v108 = v182;
    *(_OWORD *)(v102 + 32) = v181;
    *(_OWORD *)(v102 + 48) = v108;
    long long v109 = v184;
    uint64_t v110 = v102 + v99;
    *(_OWORD *)(v102 + 64) = v183;
    *(_OWORD *)(v102 + 80) = v109;
    uint64_t v111 = v160;
    v160(v110, v94, v95);
    v111(v102 + v101, v96, v95);
    sub_21F08F9EC((uint64_t)&v181);
    uint64_t v112 = v167;
    sub_21F0987C8((uint64_t)v167, (uint64_t)&unk_267EBAF30, v102);
    swift_release();
    uint64_t v113 = (uint64_t)v112;
    ((void (*)(unsigned char *, uint64_t, uint64_t, unsigned char *))v166)(v112, 1, 1, v158);
    v92(v94, v173, v95);
    v92(v96, v175, v95);
    uint64_t v114 = swift_allocObject();
    *(void *)(v114 + 16) = 0;
    *(void *)(v114 + 24) = 0;
    long long v115 = v194;
    *(_OWORD *)(v114 + 224) = v193;
    *(_OWORD *)(v114 + 240) = v115;
    *(_OWORD *)(v114 + 256) = v195;
    *(void *)(v114 + 272) = v196;
    long long v116 = v190;
    *(_OWORD *)(v114 + 160) = v189;
    *(_OWORD *)(v114 + 176) = v116;
    long long v117 = v192;
    *(_OWORD *)(v114 + 192) = v191;
    *(_OWORD *)(v114 + 208) = v117;
    long long v118 = v186;
    *(_OWORD *)(v114 + 96) = v185;
    *(_OWORD *)(v114 + 112) = v118;
    long long v119 = v188;
    *(_OWORD *)(v114 + 128) = v187;
    *(_OWORD *)(v114 + 144) = v119;
    long long v120 = v182;
    *(_OWORD *)(v114 + 32) = v181;
    *(_OWORD *)(v114 + 48) = v120;
    long long v121 = v184;
    uint64_t v122 = v114 + v162;
    *(_OWORD *)(v114 + 64) = v183;
    *(_OWORD *)(v114 + 80) = v121;
    v111(v122, v94, v95);
    unint64_t v53 = 0x267EBA000uLL;
    uint64_t v123 = v95;
    uint64_t v54 = v170;
    v111((uint64_t)&v165[v114], v96, v123);
    sub_21F08F9EC((uint64_t)&v181);
    sub_21F09A420(v113, (uint64_t)&unk_267EBAF40, v114);
    swift_release();
  }
  if (*(void *)(v53 + 2944) != -1) {
    swift_once();
  }
  uint64_t v124 = v177;
  uint64_t v125 = __swift_project_value_buffer(v177, (uint64_t)qword_267EBAB88);
  uint64_t v126 = v168;
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v176 + 16))(v168, v125, v124);
  uint64_t v127 = sub_21F0C8FA8();
  os_log_type_t v128 = sub_21F0C9238();
  BOOL v129 = os_log_type_enabled(v127, v128);
  BOOL v130 = v173;
  if (v129)
  {
    uint64_t v131 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v131 = 0;
    _os_log_impl(&dword_21F07C000, v127, v128, "Did persist Audit capture data", v131, 2u);
    MEMORY[0x223C43270](v131, -1, -1);
  }

  (*(void (**)(unsigned char *, uint64_t))(v176 + 8))(v126, v177);
  uint64_t v132 = *(void (**)(unsigned char *, uint64_t))(v54 + 8);
  uint64_t v133 = v172;
  v132(v175, v172);
  v132(v174, v133);
  return ((uint64_t (*)(unsigned char *, uint64_t))v132)(v130, v133);
}

uint64_t sub_21F09785C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[15] = a5;
  v6[16] = a6;
  v6[14] = a4;
  uint64_t v7 = sub_21F0C8FC8();
  v6[17] = v7;
  v6[18] = *(void *)(v7 - 8);
  v6[19] = swift_task_alloc();
  v6[20] = swift_task_alloc();
  v6[21] = swift_task_alloc();
  uint64_t v8 = sub_21F0C8F08();
  v6[22] = v8;
  v6[23] = *(void *)(v8 - 8);
  v6[24] = swift_task_alloc();
  v6[25] = swift_task_alloc();
  v6[26] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_21F0979E0, 0, 0);
}

uint64_t sub_21F0979E0()
{
  uint64_t v22 = v0;
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(v0[14] + 48);
  v0[10] = v1;
  v0[27] = v1;
  int64_t v2 = *(void *)(v1 + 16);
  v0[28] = v2;
  if (v2)
  {
    uint64_t v19 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_21F0C39B0(0, v2, 0);
    uint64_t v3 = (int64_t *)(v1 + 32);
    do
    {
      int64_t v4 = *v3++;
      CMTimeMake(&v20, v4, 1000000000);
      CMTimeValue value = v20.value;
      uint64_t v6 = *(void *)&v20.timescale;
      CMTimeEpoch epoch = v20.epoch;
      unint64_t v9 = *(void *)(v19 + 16);
      unint64_t v8 = *(void *)(v19 + 24);
      if (v9 >= v8 >> 1) {
        sub_21F0C39B0(v8 > 1, v9 + 1, 1);
      }
      v0[29] = v19;
      *(void *)(v19 + 16) = v9 + 1;
      uint64_t v10 = (void *)(v19 + 24 * v9);
      v10[4] = value;
      v10[5] = v6;
      v10[6] = epoch;
      --v2;
    }
    while (v2);
    uint64_t v11 = v0[26];
    uint64_t v12 = v0[22];
    uint64_t v13 = v0[23];
    uint64_t v14 = v0[15];
    sub_21F095238((uint64_t)(v0 + 10));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v11, v14, v12);
    type metadata accessor for PADAVAssetReader();
    swift_allocObject();
    uint64_t v15 = (void *)swift_task_alloc();
    v0[30] = v15;
    void *v15 = v0;
    v15[1] = sub_21F097C78;
    uint64_t v16 = v0[26];
    return sub_21F0A97D4(v16);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v18 = (uint64_t (*)(void))v0[1];
    return v18();
  }
}

uint64_t sub_21F097C78(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 248) = a1;
  *(void *)(v3 + 256) = v1;
  swift_task_dealloc();
  if (v1)
  {
    swift_release();
    int64_t v4 = sub_21F0986EC;
  }
  else
  {
    int64_t v4 = sub_21F097DC8;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_21F097DC8()
{
  unint64_t v57 = v0;
  v56[2] = *MEMORY[0x263EF8340];
  uint64_t v1 = v0[32];
  unint64_t v2 = sub_21F0AB094(v0[29]);
  if (v1)
  {
    swift_release();
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    unint64_t v4 = v2;
    swift_release();
    sub_21F0C8EC8();
    id v5 = objc_msgSend(self, sel_defaultManager);
    uint64_t v6 = (void *)sub_21F0C8EB8();
    v0[9] = 0;
    unsigned __int8 v7 = objc_msgSend(v5, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v6, 1, 0, v0 + 9);

    unint64_t v8 = (void *)v0[9];
    if (v7)
    {
      uint64_t v9 = *(void *)(v4 + 16);
      if (v9)
      {
        uint64_t v10 = v0[18];
        uint64_t v55 = (void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16);
        unint64_t v53 = (void (**)(uint64_t, uint64_t))(v10 + 8);
        uint64_t v51 = (void (**)(void, void))(v0[23] + 8);
        id v11 = v8;
        unint64_t v12 = 0;
        uint64_t v13 = (unint64_t *)(v4 + 40);
        do
        {
          uint64_t v16 = *(v13 - 1);
          unint64_t v17 = *v13;
          if (v12 >= v0[28])
          {
            sub_21F09F738(*(v13 - 1), *v13);
            if (qword_267EBAB80 != -1) {
              swift_once();
            }
            uint64_t v19 = v0[21];
            uint64_t v20 = v0[17];
            uint64_t v21 = __swift_project_value_buffer(v20, (uint64_t)qword_267EBAB88);
            (*v55)(v19, v21, v20);
            uint64_t v22 = sub_21F0C8FA8();
            os_log_type_t v23 = sub_21F0C9238();
            if (os_log_type_enabled(v22, v23))
            {
              uint64_t v24 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)uint64_t v24 = 0;
              _os_log_impl(&dword_21F07C000, v22, v23, "Unable to save ID matching frame to Data Auditing directory: no corresponding timestamp", v24, 2u);
              MEMORY[0x223C43270](v24, -1, -1);
            }
            uint64_t v14 = v0[21];
            uint64_t v15 = v0[17];
            sub_21F09E288(v16, v17);

            (*v53)(v14, v15);
          }
          else
          {
            v0[11] = *(void *)(v0[27] + 8 * v12 + 32);
            sub_21F09F738(v16, v17);
            v56[0] = sub_21F0C95B8();
            v56[1] = v18;
            sub_21F0C90C8();
            sub_21F0C8EC8();
            swift_bridgeObjectRelease();
            sub_21F0C8F58();
            (*v51)(v0[24], v0[22]);
            sub_21F09E288(v16, v17);
          }
          ++v12;
          v13 += 2;
        }
        while (v9 != v12);
      }
      else
      {
        id v46 = v8;
      }
      uint64_t v47 = v0[25];
      uint64_t v48 = v0[22];
      uint64_t v49 = v0[23];
      swift_release();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v47, v48);
    }
    else
    {
      id v25 = v8;
      swift_bridgeObjectRelease();
      uint64_t v26 = (void *)sub_21F0C8E78();

      swift_willThrow();
      if (qword_267EBAB80 != -1) {
        swift_once();
      }
      uint64_t v27 = v0[20];
      uint64_t v28 = v0[17];
      uint64_t v29 = v0[18];
      uint64_t v30 = __swift_project_value_buffer(v28, (uint64_t)qword_267EBAB88);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 16))(v27, v30, v28);
      id v31 = v26;
      id v32 = v26;
      uint64_t v33 = sub_21F0C8FA8();
      os_log_type_t v34 = sub_21F0C9238();
      BOOL v35 = os_log_type_enabled(v33, v34);
      uint64_t v36 = v0[25];
      uint64_t v37 = v0[22];
      uint64_t v38 = v0[23];
      uint64_t v39 = v0[20];
      uint64_t v40 = v0[17];
      uint64_t v41 = v0[18];
      if (v35)
      {
        uint64_t v54 = v0[17];
        long long v42 = (uint8_t *)swift_slowAlloc();
        uint64_t v52 = v39;
        uint64_t v43 = swift_slowAlloc();
        v56[0] = v43;
        *(_DWORD *)long long v42 = 136315138;
        swift_getErrorValue();
        uint64_t v44 = sub_21F0C9618();
        v0[13] = sub_21F09D6AC(v44, v45, v56);
        sub_21F0C9308();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_21F07C000, v33, v34, "Unable to save ID matching frames for Data Auditing: %s", v42, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x223C43270](v43, -1, -1);
        MEMORY[0x223C43270](v42, -1, -1);
        swift_release();

        (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v52, v54);
        (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v36, v37);
      }
      else
      {
        swift_release();

        (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v39, v40);
        (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v36, v37);
      }
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = (uint64_t (*)(void))v0[1];
  }
  return v3();
}

uint64_t sub_21F0986EC()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_21F0987C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_21F0C91C8();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_21F0C91B8();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_21F09543C(a1, &qword_267EBAF18);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_21F0C9198();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_21F098950(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[28] = a5;
  v6[29] = a6;
  v6[27] = a4;
  uint64_t v7 = sub_21F0C8FC8();
  v6[30] = v7;
  v6[31] = *(void *)(v7 - 8);
  v6[32] = swift_task_alloc();
  v6[33] = swift_task_alloc();
  v6[34] = swift_task_alloc();
  v6[35] = swift_task_alloc();
  uint64_t v8 = sub_21F0C8F08();
  v6[36] = v8;
  v6[37] = *(void *)(v8 - 8);
  v6[38] = swift_task_alloc();
  v6[39] = swift_task_alloc();
  v6[40] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_21F098AE0, 0, 0);
}

uint64_t sub_21F098AE0()
{
  uint64_t v38 = v0;
  v37[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(v0[27] + 40);
  v0[26] = v1;
  v0[41] = v1;
  uint64_t v2 = *(void *)(v1 + 16);
  v0[42] = v2;
  if (!v2)
  {
LABEL_12:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v29 = (uint64_t (*)(void))v0[1];
    return v29();
  }
  uint64_t v34 = (uint64_t)(v0 + 26);
  swift_bridgeObjectRetain();
  uint64_t v3 = 0;
  while (1)
  {
    v0[43] = v3;
    uint64_t v4 = *(void *)(v0[41] + 8 * v3 + 32);
    v0[44] = v4;
    if (*(void *)(v4 + 16)) {
      break;
    }
LABEL_4:
    uint64_t v3 = v0[43] + 1;
    if (v3 == v0[42])
    {
      sub_21F095238(v34);
      goto LABEL_12;
    }
  }
  v0[14] = 792936774;
  v0[15] = 0xE400000000000000;
  v0[19] = v3;
  swift_bridgeObjectRetain();
  sub_21F0C95B8();
  sub_21F0C90C8();
  swift_bridgeObjectRelease();
  sub_21F0C8EC8();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(self, sel_defaultManager, v34);
  uint64_t v6 = (void *)sub_21F0C8EB8();
  v0[23] = 0;
  unsigned int v7 = objc_msgSend(v5, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v6, 1, 0, v0 + 23);

  uint64_t v8 = (void *)v0[23];
  if (!v7)
  {
    id v9 = v8;
    swift_bridgeObjectRelease();
    uint64_t v10 = (void *)sub_21F0C8E78();

    swift_willThrow();
    if (qword_267EBAB80 != -1) {
      swift_once();
    }
    uint64_t v11 = v0[33];
    uint64_t v12 = v0[30];
    uint64_t v13 = v0[31];
    uint64_t v14 = __swift_project_value_buffer(v12, (uint64_t)qword_267EBAB88);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v11, v14, v12);
    id v15 = v10;
    id v16 = v10;
    unint64_t v17 = sub_21F0C8FA8();
    os_log_type_t v18 = sub_21F0C9238();
    BOOL v19 = os_log_type_enabled(v17, v18);
    uint64_t v20 = v0[40];
    uint64_t v21 = v0[36];
    uint64_t v22 = v0[37];
    uint64_t v36 = v0[33];
    uint64_t v23 = v0[30];
    uint64_t v24 = v0[31];
    if (v19)
    {
      uint64_t v25 = swift_slowAlloc();
      uint64_t v35 = v21;
      uint64_t v26 = swift_slowAlloc();
      v37[0] = v26;
      *(_DWORD *)uint64_t v25 = 136315138;
      swift_getErrorValue();
      uint64_t v27 = sub_21F0C9618();
      *(void *)(v25 + 4) = sub_21F09D6AC(v27, v28, v37);
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_21F07C000, v17, v18, "Could not create gesture FAC Data Auditing directory: %s", (uint8_t *)v25, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C43270](v26, -1, -1);
      MEMORY[0x223C43270](v25, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v36, v23);
      (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v20, v35);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v36, v23);
      (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v20, v21);
    }
    goto LABEL_4;
  }
  (*(void (**)(void, void, void))(v0[37] + 16))(v0[39], v0[29], v0[36]);
  type metadata accessor for PADAVAssetReader();
  swift_allocObject();
  id v31 = v8;
  id v32 = (void *)swift_task_alloc();
  v0[45] = v32;
  void *v32 = v0;
  v32[1] = sub_21F099034;
  uint64_t v33 = v0[39];
  return sub_21F0A97D4(v33);
}

uint64_t sub_21F099034(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 368) = a1;
  *(void *)(v3 + 376) = v1;
  swift_task_dealloc();
  if (v1)
  {
    swift_bridgeObjectRelease();
    uint64_t v4 = sub_21F099EE4;
  }
  else
  {
    uint64_t v4 = sub_21F099184;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_21F099184()
{
  uint64_t v98 = v0;
  v97[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(v0 + 352);
  int64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    *(void *)(v0 + 144) = MEMORY[0x263F8EE78];
    sub_21F0C39B0(0, v2, 0);
    CMTimeValue v3 = *(void *)(v0 + 144);
    uint64_t v4 = (int64_t *)(v1 + 32);
    do
    {
      int64_t v5 = *v4++;
      CMTimeMake((CMTime *)(v0 + 16), v5, 1000000000);
      uint64_t v6 = *(void *)(v0 + 16);
      uint64_t v7 = *(void *)(v0 + 24);
      uint64_t v8 = *(void *)(v0 + 32);
      *(void *)(v0 + 144) = v3;
      unint64_t v10 = *(void *)(v3 + 16);
      unint64_t v9 = *(void *)(v3 + 24);
      if (v10 >= v9 >> 1)
      {
        sub_21F0C39B0(v9 > 1, v10 + 1, 1);
        CMTimeValue v3 = *(void *)(v0 + 144);
      }
      *(void *)(v3 + 16) = v10 + 1;
      uint64_t v11 = (void *)(v3 + 24 * v10);
      v11[4] = v6;
      v11[5] = v7;
      v11[6] = v8;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    CMTimeValue v3 = MEMORY[0x263F8EE78];
  }
  uint64_t v12 = *(void **)(v0 + 376);
  unint64_t v13 = sub_21F0AB094(v3);
  if (v12)
  {
    swift_bridgeObjectRelease();
    if (qword_267EBAB80 != -1) {
      swift_once();
    }
    uint64_t v14 = *(void *)(v0 + 280);
    uint64_t v15 = *(void *)(v0 + 240);
    uint64_t v16 = *(void *)(v0 + 248);
    uint64_t v17 = __swift_project_value_buffer(v15, (uint64_t)qword_267EBAB88);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v14, v17, v15);
    id v18 = v12;
    id v19 = v12;
    uint64_t v20 = sub_21F0C8FA8();
    os_log_type_t v21 = sub_21F0C9238();
    BOOL v22 = os_log_type_enabled(v20, v21);
    uint64_t v23 = *(void *)(v0 + 320);
    uint64_t v24 = *(void *)(v0 + 288);
    uint64_t v25 = *(void *)(v0 + 296);
    uint64_t v26 = *(void *)(v0 + 280);
    uint64_t v27 = *(void *)(v0 + 240);
    uint64_t v28 = *(void *)(v0 + 248);
    if (v22)
    {
      uint64_t v94 = *(void *)(v0 + 240);
      uint64_t v29 = (uint8_t *)swift_slowAlloc();
      uint64_t v90 = v26;
      uint64_t v30 = swift_slowAlloc();
      v97[0] = v30;
      *(_DWORD *)uint64_t v29 = 136315138;
      swift_getErrorValue();
      uint64_t v31 = sub_21F0C9618();
      *(void *)(v0 + 176) = sub_21F09D6AC(v31, v32, v97);
      sub_21F0C9308();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_21F07C000, v20, v21, "Could not read frames for gesture FAC Data auditing: %s", v29, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C43270](v30, -1, -1);
      MEMORY[0x223C43270](v29, -1, -1);
      swift_release();

      (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v90, v94);
      (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v23, v24);
    }
    else
    {
      swift_release();

      (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v26, v27);
      (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v23, v24);
    }
  }
  else
  {
    unint64_t v33 = v13;
    uint64_t v92 = *(void *)(v3 + 16);
    if (v92)
    {
      unint64_t v34 = 0;
      uint64_t v35 = (void *)(v3 + 32);
      long long v96 = (unint64_t *)(v13 + 40);
      unint64_t v89 = v13;
      do
      {
        uint64_t v43 = *v35;
        v35 += 3;
        uint64_t v42 = v43;
        *(void *)(v0 + 192) = v43;
        *(void *)(v0 + 128) = sub_21F0C95B8();
        *(void *)(v0 + 136) = v44;
        sub_21F0C90C8();
        sub_21F0C8EC8();
        swift_bridgeObjectRelease();
        if (v34 >= *(void *)(v33 + 16))
        {
          if (qword_267EBAB80 != -1) {
            swift_once();
          }
          uint64_t v95 = v35;
          uint64_t v47 = *(void *)(v0 + 272);
          uint64_t v48 = *(void *)(v0 + 240);
          uint64_t v49 = *(void *)(v0 + 248);
          uint64_t v50 = __swift_project_value_buffer(v48, (uint64_t)qword_267EBAB88);
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v49 + 16))(v47, v50, v48);
          uint64_t v51 = sub_21F0C8FA8();
          os_log_type_t v52 = sub_21F0C9238();
          if (os_log_type_enabled(v51, v52))
          {
            uint64_t v53 = swift_slowAlloc();
            *(_DWORD *)uint64_t v53 = 134217984;
            *(void *)(v53 + 4) = v42;
            _os_log_impl(&dword_21F07C000, v51, v52, "Unable to write FAC frame to Data Auditing directory: no frame at timestamp %lld", (uint8_t *)v53, 0xCu);
            MEMORY[0x223C43270](v53, -1, -1);
          }
          uint64_t v37 = *(void *)(v0 + 296);
          uint64_t v36 = *(void *)(v0 + 304);
          uint64_t v38 = *(void *)(v0 + 288);
          uint64_t v39 = *(void *)(v0 + 272);
          uint64_t v40 = *(void *)(v0 + 240);
          uint64_t v41 = *(void *)(v0 + 248);

          (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v39, v40);
          (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v36, v38);
          unint64_t v33 = v89;
          uint64_t v35 = v95;
        }
        else
        {
          uint64_t v46 = *(v96 - 1);
          unint64_t v45 = *v96;
          sub_21F09F738(v46, *v96);
          sub_21F0C8F58();
          (*(void (**)(void, void))(*(void *)(v0 + 296) + 8))(*(void *)(v0 + 304), *(void *)(v0 + 288));
          sub_21F09E288(v46, v45);
        }
        ++v34;
        v96 += 2;
      }
      while (v92 != v34);
    }
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v54 = *(void *)(v0 + 320);
    uint64_t v55 = *(void *)(v0 + 288);
    uint64_t v56 = *(void *)(v0 + 296);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v54, v55);
  }
  uint64_t v57 = *(void *)(v0 + 344) + 1;
  if (v57 == *(void *)(v0 + 336))
  {
LABEL_26:
    sub_21F095238(v0 + 208);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v58 = *(uint64_t (**)(void))(v0 + 8);
    return v58();
  }
  while (1)
  {
    *(void *)(v0 + 344) = v57;
    uint64_t v64 = *(void *)(*(void *)(v0 + 328) + 8 * v57 + 32);
    *(void *)(v0 + 352) = v64;
    if (*(void *)(v64 + 16)) {
      break;
    }
LABEL_31:
    uint64_t v57 = *(void *)(v0 + 344) + 1;
    if (v57 == *(void *)(v0 + 336)) {
      goto LABEL_26;
    }
  }
  *(void *)(v0 + 112) = 792936774;
  *(void *)(v0 + 120) = 0xE400000000000000;
  *(void *)(v0 + 152) = v57;
  swift_bridgeObjectRetain();
  sub_21F0C95B8();
  sub_21F0C90C8();
  swift_bridgeObjectRelease();
  sub_21F0C8EC8();
  swift_bridgeObjectRelease();
  id v65 = objc_msgSend(self, sel_defaultManager);
  os_log_type_t v66 = (void *)sub_21F0C8EB8();
  *(void *)(v0 + 184) = 0;
  unsigned int v67 = objc_msgSend(v65, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v66, 1, 0, v0 + 184);

  uint64_t v68 = *(void **)(v0 + 184);
  if (!v67)
  {
    id v69 = v68;
    swift_bridgeObjectRelease();
    unint64_t v70 = (void *)sub_21F0C8E78();

    swift_willThrow();
    if (qword_267EBAB80 != -1) {
      swift_once();
    }
    uint64_t v71 = *(void *)(v0 + 264);
    uint64_t v72 = *(void *)(v0 + 240);
    uint64_t v73 = *(void *)(v0 + 248);
    uint64_t v74 = __swift_project_value_buffer(v72, (uint64_t)qword_267EBAB88);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v73 + 16))(v71, v74, v72);
    id v75 = v70;
    id v76 = v70;
    uint64_t v77 = sub_21F0C8FA8();
    os_log_type_t v78 = sub_21F0C9238();
    BOOL v79 = os_log_type_enabled(v77, v78);
    uint64_t v80 = *(void *)(v0 + 320);
    uint64_t v81 = *(void *)(v0 + 288);
    uint64_t v82 = *(void *)(v0 + 296);
    uint64_t v83 = *(void *)(v0 + 264);
    uint64_t v85 = *(void *)(v0 + 240);
    uint64_t v84 = *(void *)(v0 + 248);
    if (v79)
    {
      uint64_t v91 = *(void *)(v0 + 264);
      uint64_t v60 = swift_slowAlloc();
      uint64_t v93 = v81;
      uint64_t v61 = swift_slowAlloc();
      v97[0] = v61;
      *(_DWORD *)uint64_t v60 = 136315138;
      swift_getErrorValue();
      uint64_t v62 = sub_21F0C9618();
      *(void *)(v60 + 4) = sub_21F09D6AC(v62, v63, v97);
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_21F07C000, v77, v78, "Could not create gesture FAC Data Auditing directory: %s", (uint8_t *)v60, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C43270](v61, -1, -1);
      MEMORY[0x223C43270](v60, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v84 + 8))(v91, v85);
      (*(void (**)(uint64_t, uint64_t))(v82 + 8))(v80, v93);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v84 + 8))(v83, v85);
      (*(void (**)(uint64_t, uint64_t))(v82 + 8))(v80, v81);
    }
    goto LABEL_31;
  }
  (*(void (**)(void, void, void))(*(void *)(v0 + 296) + 16))(*(void *)(v0 + 312), *(void *)(v0 + 232), *(void *)(v0 + 288));
  type metadata accessor for PADAVAssetReader();
  swift_allocObject();
  id v86 = v68;
  long long v87 = (void *)swift_task_alloc();
  *(void *)(v0 + 360) = v87;
  *long long v87 = v0;
  v87[1] = sub_21F099034;
  uint64_t v88 = *(void *)(v0 + 312);
  return sub_21F0A97D4(v88);
}

uint64_t sub_21F099EE4()
{
  uint64_t v41 = v0;
  v40[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = v0 + 14;
  int64_t v2 = (void *)v0[47];
  unint64_t v3 = 0x267EBA000uLL;
  while (2)
  {
    if (*(void *)(v3 + 2944) != -1) {
      swift_once();
    }
    uint64_t v4 = v0[33];
    uint64_t v5 = v0[30];
    uint64_t v6 = v0[31];
    uint64_t v7 = __swift_project_value_buffer(v5, (uint64_t)qword_267EBAB88);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v4, v7, v5);
    id v8 = v2;
    id v9 = v2;
    unint64_t v10 = sub_21F0C8FA8();
    os_log_type_t v11 = sub_21F0C9238();
    BOOL v12 = os_log_type_enabled(v10, v11);
    uint64_t v13 = v0[40];
    uint64_t v14 = v0[36];
    uint64_t v15 = v0[37];
    uint64_t v39 = v0[33];
    uint64_t v17 = v0[30];
    uint64_t v16 = v0[31];
    if (v12)
    {
      uint64_t v38 = v1;
      uint64_t v18 = swift_slowAlloc();
      uint64_t v37 = v14;
      uint64_t v19 = swift_slowAlloc();
      v40[0] = v19;
      *(_DWORD *)uint64_t v18 = 136315138;
      swift_getErrorValue();
      uint64_t v20 = sub_21F0C9618();
      *(void *)(v18 + 4) = sub_21F09D6AC(v20, v21, v40);
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_21F07C000, v10, v11, "Could not create gesture FAC Data Auditing directory: %s", (uint8_t *)v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C43270](v19, -1, -1);
      uint64_t v22 = v18;
      uint64_t v1 = v38;
      MEMORY[0x223C43270](v22, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v39, v17);
      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v13, v37);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v39, v17);
      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v13, v14);
    }
    uint64_t v23 = v0[43];
    uint64_t v24 = v0[42] - 1;
    do
    {
      if (v24 == v23)
      {
        sub_21F095238((uint64_t)(v0 + 26));
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        unint64_t v32 = (uint64_t (*)(void))v0[1];
        return v32();
      }
      uint64_t v25 = v23 + 1;
      v0[43] = v23 + 1;
      uint64_t v26 = *(void *)(v0[41] + 8 * v23 + 40);
      v0[44] = v26;
      ++v23;
    }
    while (!*(void *)(v26 + 16));
    v0[14] = 792936774;
    v0[15] = 0xE400000000000000;
    v0[19] = v25;
    swift_bridgeObjectRetain();
    sub_21F0C95B8();
    sub_21F0C90C8();
    swift_bridgeObjectRelease();
    sub_21F0C8EC8();
    swift_bridgeObjectRelease();
    id v27 = objc_msgSend(self, sel_defaultManager);
    uint64_t v28 = (void *)sub_21F0C8EB8();
    v0[23] = 0;
    unsigned int v29 = objc_msgSend(v27, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v28, 1, 0, v0 + 23);

    uint64_t v30 = (void *)v0[23];
    if (!v29)
    {
      id v31 = v30;
      swift_bridgeObjectRelease();
      int64_t v2 = (void *)sub_21F0C8E78();

      swift_willThrow();
      unint64_t v3 = 0x267EBA000;
      continue;
    }
    break;
  }
  (*(void (**)(void, void, void))(v0[37] + 16))(v0[39], v0[29], v0[36]);
  type metadata accessor for PADAVAssetReader();
  swift_allocObject();
  id v34 = v30;
  uint64_t v35 = (void *)swift_task_alloc();
  v0[45] = v35;
  void *v35 = v0;
  v35[1] = sub_21F099034;
  uint64_t v36 = v0[39];
  return sub_21F0A97D4(v36);
}

uint64_t sub_21F09A420(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_21F0C91C8();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_21F0C91B8();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_21F09543C(a1, &qword_267EBAF18);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_21F0C9198();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_21F09A5CC()
{
  v44[4] = *(id *)MEMORY[0x263EF8340];
  uint64_t v1 = sub_21F0C8FC8();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EBAF10);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_21F0C8F08();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  BOOL v12 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v38 - v13;
  uint64_t v15 = v0 + OBJC_IVAR____TtC10CoreIDVPAD22PADSWAuditDataRecorder_directory;
  swift_beginAccess();
  sub_21F09DD04(v15, (uint64_t)v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1) {
    return sub_21F09543C((uint64_t)v7, &qword_267EBAF10);
  }
  uint64_t v42 = v2;
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v14, v7, v8);
  sub_21F0C8EC8();
  id v17 = objc_msgSend(self, sel_defaultManager);
  uint64_t v18 = (void *)sub_21F0C8EB8();
  uint64_t v19 = (void *)sub_21F0C8EB8();
  v44[0] = 0;
  unsigned int v20 = objc_msgSend(v17, sel_copyItemAtURL_toURL_error_, v18, v19, v44);

  if (v20)
  {
    unint64_t v21 = *(void (**)(char *, uint64_t))(v9 + 8);
    id v22 = v44[0];
  }
  else
  {
    id v23 = v44[0];
    uint64_t v24 = (void *)sub_21F0C8E78();

    swift_willThrow();
    if (qword_267EBAB80 != -1) {
      swift_once();
    }
    uint64_t v25 = __swift_project_value_buffer(v1, (uint64_t)qword_267EBAB88);
    uint64_t v26 = v42;
    (*(void (**)(char *, uint64_t, uint64_t))(v42 + 16))(v4, v25, v1);
    id v27 = v24;
    id v28 = v24;
    unsigned int v29 = sub_21F0C8FA8();
    os_log_type_t v30 = sub_21F0C9238();
    int v31 = v30;
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v32 = swift_slowAlloc();
      int v40 = v31;
      unint64_t v33 = (uint8_t *)v32;
      uint64_t v41 = (void *)swift_slowAlloc();
      v44[0] = v41;
      *(_DWORD *)unint64_t v33 = 136315138;
      uint64_t v38 = v33 + 4;
      uint64_t v39 = v33;
      swift_getErrorValue();
      uint64_t v34 = sub_21F0C9618();
      uint64_t v43 = sub_21F09D6AC(v34, v35, (uint64_t *)v44);
      sub_21F0C9308();
      swift_bridgeObjectRelease();

      uint64_t v36 = v39;
      _os_log_impl(&dword_21F07C000, v29, (os_log_type_t)v40, "Audit Data Recorder could not persist liveness video: %s", v39, 0xCu);
      uint64_t v37 = v41;
      swift_arrayDestroy();
      MEMORY[0x223C43270](v37, -1, -1);
      MEMORY[0x223C43270](v36, -1, -1);

      (*(void (**)(char *, uint64_t))(v42 + 8))(v4, v1);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v26 + 8))(v4, v1);
    }
    unint64_t v21 = *(void (**)(char *, uint64_t))(v9 + 8);
  }
  v21(v12, v8);
  return ((uint64_t (*)(char *, uint64_t))v21)(v14, v8);
}

uint64_t sub_21F09AB14(void (*a1)(char *, uint64_t), uint64_t a2, char *a3)
{
  uint64_t v52 = a2;
  uint64_t v53 = a3;
  uint64_t v54 = a1;
  uint64_t v4 = sub_21F0C8FC8();
  uint64_t v56 = *(void *)(v4 - 8);
  uint64_t v57 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v55 = (char *)&v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_21F0C8EA8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v50 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EBAF10);
  MEMORY[0x270FA5388](v10 - 8);
  BOOL v12 = (char *)&v50 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_21F0C8F08();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  id v17 = (char *)&v50 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  unsigned int v20 = (char *)&v50 - v19;
  MEMORY[0x270FA5388](v18);
  id v22 = (char *)&v50 - v21;
  uint64_t v23 = v3 + OBJC_IVAR____TtC10CoreIDVPAD22PADSWAuditDataRecorder_directory;
  swift_beginAccess();
  sub_21F09DD04(v23, (uint64_t)v12);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1) {
    return sub_21F09543C((uint64_t)v12, &qword_267EBAF10);
  }
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v22, v12, v13);
  sub_21F0C8EC8();
  uint64_t v25 = v20;
  if ((sub_21F09E7C8((uint64_t)v20) & 1) == 0)
  {
    unint64_t v33 = *(void (**)(char *, uint64_t))(v14 + 8);
    v33(v25, v13);
    uint64_t v34 = v22;
    return ((uint64_t (*)(char *, uint64_t))v33)(v34, v13);
  }
  uint64_t v51 = v22;
  uint64_t v58 = v52;
  uint64_t v59 = v53;
  swift_bridgeObjectRetain();
  sub_21F0C90C8();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F06E50], v6);
  sub_21F09ECA4();
  uint64_t v53 = v20;
  sub_21F0C8EF8();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  swift_bridgeObjectRelease();
  id v26 = objc_allocWithZone(MEMORY[0x263F00650]);
  id v27 = objc_msgSend(v26, sel_initWithCVPixelBuffer_, v54);
  id v28 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F00628]), sel_init);
  objc_msgSend(v27, sel_extent);
  id v29 = objc_msgSend(v28, sel_createCGImage_fromRect_, v27);
  if (v29)
  {
    uint64_t v30 = sub_21F09C4EC();
    if (v31 >> 60 != 15)
    {
      uint64_t v35 = v30;
      unint64_t v36 = v31;
      sub_21F0C8F58();
      sub_21F09ECF8(v35, v36);

      unint64_t v33 = *(void (**)(char *, uint64_t))(v14 + 8);
      v33(v17, v13);
      v33(v53, v13);
      uint64_t v34 = v51;
      return ((uint64_t (*)(char *, uint64_t))v33)(v34, v13);
    }
  }
  id v32 = sub_21F0B1328(0xD00000000000001FLL, 0x800000021F0CE5A0, 0, -10, 0);
  swift_willThrow();

  uint64_t v37 = *(void (**)(char *, uint64_t))(v14 + 8);
  v37(v17, v13);
  if (qword_267EBAB80 != -1) {
    swift_once();
  }
  uint64_t v38 = v57;
  uint64_t v39 = __swift_project_value_buffer(v57, (uint64_t)qword_267EBAB88);
  (*(void (**)(char *, uint64_t, uint64_t))(v56 + 16))(v55, v39, v38);
  id v40 = v32;
  id v41 = v32;
  uint64_t v42 = sub_21F0C8FA8();
  os_log_type_t v43 = sub_21F0C9238();
  if (os_log_type_enabled(v42, v43))
  {
    uint64_t v54 = v37;
    uint64_t v44 = (uint8_t *)swift_slowAlloc();
    unint64_t v45 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v44 = 138412290;
    id v46 = v32;
    uint64_t v47 = _swift_stdlib_bridgeErrorToNSError();
    uint64_t v58 = v47;
    sub_21F0C9308();
    void *v45 = v47;
    uint64_t v37 = v54;

    _os_log_impl(&dword_21F07C000, v42, v43, "Error storing PRD buffer: %@", v44, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267EBAEF0);
    swift_arrayDestroy();
    MEMORY[0x223C43270](v45, -1, -1);
    MEMORY[0x223C43270](v44, -1, -1);
  }
  else
  {
  }
  uint64_t v48 = v51;
  uint64_t v49 = v53;

  (*(void (**)(char *, uint64_t))(v56 + 8))(v55, v57);
  v37(v49, v13);
  return ((uint64_t (*)(char *, uint64_t))v37)(v48, v13);
}

uint64_t sub_21F09B204(uint64_t a1, uint64_t a2, char *a3, void *a4)
{
  uint64_t v5 = v4;
  uint64_t v60 = a1;
  id v61 = a4;
  uint64_t v58 = a2;
  uint64_t v59 = a3;
  uint64_t v6 = sub_21F0C8FC8();
  uint64_t v64 = *(void *)(v6 - 8);
  uint64_t v65 = v6;
  MEMORY[0x270FA5388](v6);
  unint64_t v63 = (char *)&v55 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_21F0C8EA8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v55 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EBAF10);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v55 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_21F0C8F08();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v55 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x270FA5388](v17);
  id v22 = (char *)&v55 - v21;
  MEMORY[0x270FA5388](v20);
  uint64_t v24 = (char *)&v55 - v23;
  uint64_t v62 = v5;
  uint64_t v25 = v5 + OBJC_IVAR____TtC10CoreIDVPAD22PADSWAuditDataRecorder_directory;
  swift_beginAccess();
  sub_21F09DD04(v25, (uint64_t)v14);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) == 1) {
    return sub_21F09543C((uint64_t)v14, &qword_267EBAF10);
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v24, v14, v15);
  sub_21F0C8EC8();
  if (sub_21F09E7C8((uint64_t)v22))
  {
    uint64_t v55 = v24;
    uint64_t v56 = v15;
    uint64_t v57 = v16;
    uint64_t v66 = v58;
    unsigned int v67 = v59;
    swift_bridgeObjectRetain();
    sub_21F0C90C8();
    (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x263F06E50], v8);
    sub_21F09ECA4();
    uint64_t v59 = v22;
    sub_21F0C8EF8();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    swift_bridgeObjectRelease();
    id v27 = objc_allocWithZone(MEMORY[0x263F00650]);
    id v28 = objc_msgSend(v27, sel_initWithCVPixelBuffer_, v60);
    id v29 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F00628]), sel_init);
    objc_msgSend(v28, sel_extent);
    id v30 = objc_msgSend(v29, sel_createCGImage_fromRect_, v28);
    if (v30 && (uint64_t v31 = sub_21F09C4EC(), v32 >> 60 != 15))
    {
      uint64_t v35 = v31;
      unint64_t v36 = v32;
      sub_21F0C8F58();
      sub_21F09ECF8(v35, v36);

      uint64_t v39 = v56;
      uint64_t v38 = *(void (**)(char *, uint64_t))(v57 + 8);
      v38(v19, v56);
      uint64_t v53 = v55;
      uint64_t v54 = v59;
    }
    else
    {
      id v33 = sub_21F0B1328(0xD00000000000001FLL, 0x800000021F0CE5A0, 0, -10, 0);
      swift_willThrow();
      uint64_t v37 = v57;

      uint64_t v38 = *(void (**)(char *, uint64_t))(v37 + 8);
      uint64_t v39 = v56;
      v38(v19, v56);
      if (qword_267EBAB80 != -1) {
        swift_once();
      }
      uint64_t v40 = v65;
      uint64_t v41 = __swift_project_value_buffer(v65, (uint64_t)qword_267EBAB88);
      (*(void (**)(char *, uint64_t, uint64_t))(v64 + 16))(v63, v41, v40);
      id v42 = v33;
      id v43 = v33;
      uint64_t v44 = sub_21F0C8FA8();
      os_log_type_t v45 = sub_21F0C9238();
      if (os_log_type_enabled(v44, v45))
      {
        id v46 = (uint8_t *)swift_slowAlloc();
        uint64_t v47 = (void *)swift_slowAlloc();
        *(_DWORD *)id v46 = 138412290;
        id v48 = v33;
        uint64_t v49 = v38;
        uint64_t v50 = _swift_stdlib_bridgeErrorToNSError();
        uint64_t v66 = v50;
        uint64_t v39 = v56;
        sub_21F0C9308();
        void *v47 = v50;
        uint64_t v38 = v49;

        _os_log_impl(&dword_21F07C000, v44, v45, "Error storing FAC face pose buffer: %@", v46, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_267EBAEF0);
        swift_arrayDestroy();
        MEMORY[0x223C43270](v47, -1, -1);
        MEMORY[0x223C43270](v46, -1, -1);
      }
      else
      {
      }
      uint64_t v53 = v55;
      uint64_t v54 = v59;
      (*(void (**)(char *, uint64_t))(v64 + 8))(v63, v65);
    }
    uint64_t v51 = v62;
    swift_beginAccess();
    id v52 = v61;
    MEMORY[0x223C420C0]();
    if (*(void *)((*(void *)(v51 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v51 + 16) & 0xFFFFFFFFFFFFFF8)
                                                                                        + 0x18) >> 1)
      sub_21F0C9158();
    sub_21F0C9178();
    sub_21F0C9148();
    swift_endAccess();
    v38(v54, v39);
    return ((uint64_t (*)(char *, uint64_t))v38)(v53, v39);
  }
  else
  {
    uint64_t v34 = *(void (**)(char *, uint64_t))(v16 + 8);
    v34(v22, v15);
    return ((uint64_t (*)(char *, uint64_t))v34)(v24, v15);
  }
}

uint64_t sub_21F09B98C(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char v3 = *((unsigned char *)a1 + 8);
  int v4 = *((_DWORD *)a1 + 3);
  uint64_t v5 = (void *)(v1 + 24);
  swift_beginAccess();
  uint64_t v6 = *(void **)(v1 + 24);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v1 + 24) = v6;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v6 = sub_21F09CA4C(0, v6[2] + 1, 1, v6);
    void *v5 = v6;
  }
  unint64_t v9 = v6[2];
  unint64_t v8 = v6[3];
  if (v9 >= v8 >> 1)
  {
    uint64_t v6 = sub_21F09CA4C((void *)(v8 > 1), v9 + 1, 1, v6);
    void *v5 = v6;
  }
  v6[2] = v9 + 1;
  uint64_t v10 = &v6[2 * v9];
  v10[4] = v2;
  *((unsigned char *)v10 + 40) = v3;
  *((_DWORD *)v10 + 11) = v4;
  return swift_endAccess();
}

uint64_t sub_21F09BA74()
{
  v92[4] = *(id *)MEMORY[0x263EF8340];
  uint64_t v1 = sub_21F0C8FC8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  uint64_t v5 = (char *)&v81 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v3);
  unint64_t v8 = (char *)&v81 - v7;
  MEMORY[0x270FA5388](v6);
  unint64_t v89 = (char *)&v81 - v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EBAF10);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v81 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_21F0C8F08();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v90 = (char *)&v81 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v81 - v18;
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v81 - v20;
  uint64_t v22 = v0 + OBJC_IVAR____TtC10CoreIDVPAD22PADSWAuditDataRecorder_directory;
  swift_beginAccess();
  sub_21F09DD04(v22, (uint64_t)v12);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1) {
    return sub_21F09543C((uint64_t)v12, &qword_267EBAF10);
  }
  long long v87 = v5;
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v21, v12, v13);
  id v88 = self;
  id v24 = objc_msgSend(v88, sel_defaultManager);
  sub_21F0C8EE8();
  uint64_t v25 = (void *)sub_21F0C9048();
  swift_bridgeObjectRelease();
  v92[0] = 0;
  id v26 = objc_msgSend(v24, sel_contentsOfDirectoryAtPath_error_, v25, v92);

  id v27 = v92[0];
  if (v26)
  {
    os_log_t v28 = (os_log_t)v2;
    uint64_t v29 = sub_21F0C9128();
    id v30 = v27;
  }
  else
  {
    id v31 = v92[0];
    unint64_t v32 = (void *)sub_21F0C8E78();

    swift_willThrow();
    if (qword_267EBAB80 != -1) {
      swift_once();
    }
    uint64_t v33 = __swift_project_value_buffer(v1, (uint64_t)qword_267EBAB88);
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v8, v33, v1);
    (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v19, v21, v13);
    id v34 = v32;
    id v35 = v32;
    unint64_t v36 = sub_21F0C8FA8();
    os_log_type_t v37 = sub_21F0C9238();
    int v38 = v37;
    if (os_log_type_enabled(v36, v37))
    {
      uint64_t v39 = swift_slowAlloc();
      int v83 = v38;
      uint64_t v40 = v39;
      uint64_t v84 = (void *)swift_slowAlloc();
      v92[0] = v84;
      *(_DWORD *)uint64_t v40 = 136315394;
      os_log_t v85 = (os_log_t)v2;
      os_log_t v82 = v36;
      uint64_t v41 = sub_21F0C8EE8();
      uint64_t v91 = sub_21F09D6AC(v41, v42, (uint64_t *)v92);
      uint64_t v86 = v1;
      sub_21F0C9308();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v14 + 8))(v19, v13);
      *(_WORD *)(v40 + 12) = 2080;
      swift_getErrorValue();
      uint64_t v43 = sub_21F0C9618();
      uint64_t v91 = sub_21F09D6AC(v43, v44, (uint64_t *)v92);
      uint64_t v1 = v86;
      sub_21F0C9308();
      swift_bridgeObjectRelease();

      os_log_t v45 = v82;
      _os_log_impl(&dword_21F07C000, v82, (os_log_type_t)v83, "Could not finalize audit data capture at directory %s: %s", (uint8_t *)v40, 0x16u);
      id v46 = v84;
      swift_arrayDestroy();
      MEMORY[0x223C43270](v46, -1, -1);
      MEMORY[0x223C43270](v40, -1, -1);

      os_log_t v47 = v85;
      os_log_t v28 = v85;
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v14 + 8))(v19, v13);
      os_log_t v28 = (os_log_t)v2;
      os_log_t v47 = (os_log_t)v2;
    }
    ((void (*)(char *, uint64_t))v47[1].isa)(v8, v1);
    uint64_t v29 = MEMORY[0x263F8EE78];
  }
  uint64_t v48 = *(void *)(v29 + 16);
  swift_bridgeObjectRelease();
  if (v48) {
    return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v21, v13);
  }
  id v49 = objc_msgSend(v88, sel_defaultManager);
  uint64_t v50 = (void *)sub_21F0C8EB8();
  v92[0] = 0;
  unsigned int v51 = objc_msgSend(v49, sel_removeItemAtURL_error_, v50, v92);

  if (v51)
  {
    uint64_t v52 = qword_267EBAB80;
    id v53 = v92[0];
    if (v52 != -1) {
      swift_once();
    }
    uint64_t v54 = __swift_project_value_buffer(v1, (uint64_t)qword_267EBAB88);
    uint64_t v55 = v89;
    ((void (*)(char *, uint64_t, uint64_t))v28[2].isa)(v89, v54, v1);
    uint64_t v56 = sub_21F0C8FA8();
    os_log_type_t v57 = sub_21F0C9228();
    if (os_log_type_enabled(v56, v57))
    {
      uint64_t v58 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v58 = 0;
      _os_log_impl(&dword_21F07C000, v56, v57, "Removed Audit Data capture directory because it was empty.", v58, 2u);
      MEMORY[0x223C43270](v58, -1, -1);
    }

    ((void (*)(char *, uint64_t))v28[1].isa)(v55, v1);
    return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v21, v13);
  }
  id v59 = v92[0];
  uint64_t v60 = (void *)sub_21F0C8E78();

  swift_willThrow();
  if (qword_267EBAB80 != -1) {
    swift_once();
  }
  uint64_t v61 = __swift_project_value_buffer(v1, (uint64_t)qword_267EBAB88);
  os_log_t v62 = v28;
  unint64_t v63 = v87;
  ((void (*)(char *, uint64_t, uint64_t))v28[2].isa)(v87, v61, v1);
  uint64_t v64 = v90;
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v90, v21, v13);
  id v65 = v60;
  id v66 = v60;
  unsigned int v67 = sub_21F0C8FA8();
  os_log_type_t v68 = sub_21F0C9238();
  int v69 = v68;
  if (os_log_type_enabled(v67, v68))
  {
    uint64_t v70 = swift_slowAlloc();
    LODWORD(v88) = v69;
    uint64_t v71 = v64;
    uint64_t v72 = v70;
    unint64_t v89 = (char *)swift_slowAlloc();
    v92[0] = v89;
    *(_DWORD *)uint64_t v72 = 136315394;
    os_log_t v85 = v67;
    uint64_t v73 = sub_21F0C8EE8();
    uint64_t v91 = sub_21F09D6AC(v73, v74, (uint64_t *)v92);
    uint64_t v86 = v1;
    sub_21F0C9308();
    swift_bridgeObjectRelease();
    id v75 = *(void (**)(char *, uint64_t))(v14 + 8);
    v75(v71, v13);
    *(_WORD *)(v72 + 12) = 2080;
    swift_getErrorValue();
    uint64_t v76 = sub_21F0C9618();
    uint64_t v91 = sub_21F09D6AC(v76, v77, (uint64_t *)v92);
    sub_21F0C9308();
    swift_bridgeObjectRelease();

    os_log_t v78 = v85;
    _os_log_impl(&dword_21F07C000, v85, (os_log_type_t)v88, "Could not remove Audit Data capture directory at %s: %s", (uint8_t *)v72, 0x16u);
    BOOL v79 = v89;
    swift_arrayDestroy();
    MEMORY[0x223C43270](v79, -1, -1);
    MEMORY[0x223C43270](v72, -1, -1);

    ((void (*)(char *, uint64_t))v62[1].isa)(v87, v86);
    return ((uint64_t (*)(char *, uint64_t))v75)(v21, v13);
  }
  else
  {

    uint64_t v80 = *(void (**)(char *, uint64_t))(v14 + 8);
    v80(v64, v13);

    ((void (*)(char *, uint64_t))v62[1].isa)(v63, v1);
    return ((uint64_t (*)(char *, uint64_t))v80)(v21, v13);
  }
}

uint64_t sub_21F09C4EC()
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F00650]), sel_initWithCGImage_, v0);
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F00628]), sel_init);
  CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceRGB();
  sub_21F0BB414(MEMORY[0x263F8EE78]);
  type metadata accessor for CIImageRepresentationOption(0);
  sub_21F09F7F8((unint64_t *)&qword_267EBACC0, type metadata accessor for CIImageRepresentationOption);
  uint64_t v4 = (void *)sub_21F0C9018();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(v2, sel_JPEGRepresentationOfImage_colorSpace_options_, v1, DeviceRGB, v4);

  if (v5)
  {
    uint64_t v6 = sub_21F0C8F48();
  }
  else
  {

    return 0;
  }
  return v6;
}

uint64_t sub_21F09C640(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_21F09C71C;
  return v6(a1);
}

uint64_t sub_21F09C71C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

char *sub_21F09C814(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_267EBAF88);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 29;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 2);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)MEMORY[0x263F8EE78];
      uint64_t v13 = (char *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 32]) {
          memmove(v13, a4 + 32, 4 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_21F09E2E0(0, v8, v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_21F09C924(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_267EBB000);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[3 * v8 + 4]) {
          memmove(v12, a4 + 4, 24 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v12 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_21F09E3CC(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_21F09CA4C(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_267EBAFD0);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_21F09EF38(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_21F09CB5C(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_21F09CF2C(a1, a2, a3, a4, &qword_267EBAF78);
}

void *sub_21F09CB68(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_267EBAF70);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[3 * v8 + 4]) {
          memmove(v12, a4 + 4, 24 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v12 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_21F09E4DC(0, v8, (char *)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_21F09CC90(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_21F09CCB8(a1, a2, a3, a4, (uint64_t *)&unk_267EBB4D0, (uint64_t *)&unk_267EBB440);
}

void *sub_21F09CCA4(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_21F09CCB8(a1, a2, a3, a4, &qword_267EBAF68, (uint64_t *)&unk_267EBB510);
}

void *sub_21F09CCB8(void *result, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t *a6)
{
  char v8 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v10 = a2;
    goto LABEL_8;
  }
  unint64_t v9 = a4[3];
  uint64_t v10 = v9 >> 1;
  if ((uint64_t)(v9 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v10 + 0x4000000000000000 >= 0)
  {
    uint64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v10 = a2;
    }
LABEL_8:
    uint64_t v11 = a4[2];
    if (v10 <= v11) {
      uint64_t v12 = a4[2];
    }
    else {
      uint64_t v12 = v10;
    }
    if (v12)
    {
      __swift_instantiateConcreteTypeFromMangledName(a5);
      uint64_t v13 = (void *)swift_allocObject();
      int64_t v14 = _swift_stdlib_malloc_size(v13);
      uint64_t v15 = v14 - 32;
      if (v14 < 32) {
        uint64_t v15 = v14 - 25;
      }
      v13[2] = v11;
      void v13[3] = 2 * (v15 >> 3);
      uint64_t v16 = v13 + 4;
      if (v8) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v13 = (void *)MEMORY[0x263F8EE78];
      uint64_t v16 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v13 != a4 || v16 >= &a4[v11 + 4]) {
          memmove(v16, a4 + 4, 8 * v11);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_21F09E5CC(0, v11, (unint64_t)v16, (uint64_t)a4, a6);
LABEL_24:
    swift_bridgeObjectRelease();
    return v13;
  }
  __break(1u);
  return result;
}

void *sub_21F09CDD4(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_21F09CCB8(a1, a2, a3, a4, &qword_267EBAF80, (uint64_t *)&unk_267EBB500);
}

void *sub_21F09CDE8(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_21F09CCB8(a1, a2, a3, a4, &qword_267EBAFA8, &qword_267EBAFB0);
}

void *sub_21F09CDFC(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_21F09CCB8(a1, a2, a3, a4, &qword_267EBAFB8, &qword_267EBAFC0);
}

void *sub_21F09CE10(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_267EBAFF0);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_21F09E6D4(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_21F09CF20(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_21F09CF2C(a1, a2, a3, a4, &qword_267EBAFC8);
}

void *sub_21F09CF2C(void *result, int64_t a2, char a3, void *a4, uint64_t *a5)
{
  char v6 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v8 = a2;
    goto LABEL_8;
  }
  unint64_t v7 = a4[3];
  uint64_t v8 = v7 >> 1;
  if ((uint64_t)(v7 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v8 + 0x4000000000000000 >= 0)
  {
    uint64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v8 = a2;
    }
LABEL_8:
    uint64_t v9 = a4[2];
    if (v8 <= v9) {
      uint64_t v10 = a4[2];
    }
    else {
      uint64_t v10 = v8;
    }
    if (v10)
    {
      __swift_instantiateConcreteTypeFromMangledName(a5);
      int64_t v11 = (void *)swift_allocObject();
      int64_t v12 = _swift_stdlib_malloc_size(v11);
      uint64_t v13 = v12 - 32;
      if (v12 < 32) {
        uint64_t v13 = v12 - 25;
      }
      v11[2] = v9;
      v11[3] = 2 * (v13 >> 3);
      int64_t v14 = v11 + 4;
      if (v6) {
        goto LABEL_15;
      }
    }
    else
    {
      int64_t v11 = (void *)MEMORY[0x263F8EE78];
      int64_t v14 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[v9 + 4]) {
          memmove(v14, a4 + 4, 8 * v9);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_21F09F024(0, v9, (char *)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v11;
  }
  __break(1u);
  return result;
}

void *sub_21F09D038(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_267EBB4B0);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4]) {
          memmove(v13, a4 + 4, 8 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_21F09F024(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_21F09D148(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_267EBAF90);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 1;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4]) {
          memmove(v13, a4 + 4, 32 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_21F09F110(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_21F09D258(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267EBB400);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[5 * v8 + 4]) {
          memmove(v12, a4 + 4, 40 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v12 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_21F09F1FC(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_21F09D37C(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_267EBAF98);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_21F09F310(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_21F09D48C(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_267EBB490);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_21F09F4F8(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_21F09D59C(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_267EBAFA0);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 1;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4]) {
          memmove(v13, a4 + 4, 32 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_21F09F404(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_21F09D6AC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_21F09D780(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_21F09F5EC((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_21F09F5EC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_21F09D780(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_21F0C9318();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_21F09D93C(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_21F0C93F8();
  if (!v8)
  {
    sub_21F0C9468();
    __break(1u);
LABEL_17:
    uint64_t result = sub_21F0C94C8();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_21F09D93C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_21F09D9D4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_21F09DBB4(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_21F09DBB4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_21F09D9D4(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_21F09DB4C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_21F0C93C8();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_21F0C9468();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_21F0C90D8();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_21F0C94C8();
    __break(1u);
LABEL_14:
    uint64_t result = sub_21F0C9468();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_21F09DB4C(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EBAFD8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_21F09DBB4(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267EBAFD8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_21F0C94C8();
  __break(1u);
  return result;
}

uint64_t sub_21F09DD04(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EBAF10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_21F09DD6C()
{
  unint64_t result = qword_267EBAF20;
  if (!qword_267EBAF20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_267EBAF20);
  }
  return result;
}

uint64_t sub_21F09DDC4(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_21F0C8F08() - 8);
  uint64_t v5 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = (v5 + 280) & ~v5;
  uint64_t v7 = *(void *)(v1 + 16);
  uint64_t v8 = *(void *)(v1 + 24);
  uint64_t v9 = v1 + 32;
  uint64_t v10 = v1 + v6;
  uint64_t v11 = v1 + ((*(void *)(v4 + 64) + v5 + v6) & ~v5);
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v12;
  void *v12 = v2;
  v12[1] = sub_21F09DEF0;
  return sub_21F09785C(a1, v7, v8, v9, v10, v11);
}

uint64_t sub_21F09DEF0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t objectdestroyTm()
{
  uint64_t v1 = sub_21F0C8F08();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 280) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  uint64_t v7 = (v5 + v3 + v4) & ~v3;
  uint64_t v8 = v7 + v5;
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v9 = v0 + v4;
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v10(v9, v1);
  v10(v0 + v7, v1);
  return MEMORY[0x270FA0238](v0, v8, v6);
}

uint64_t sub_21F09E15C(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_21F0C8F08() - 8);
  uint64_t v5 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = (v5 + 280) & ~v5;
  uint64_t v7 = *(void *)(v1 + 16);
  uint64_t v8 = *(void *)(v1 + 24);
  uint64_t v9 = v1 + 32;
  uint64_t v10 = v1 + v6;
  uint64_t v11 = v1 + ((*(void *)(v4 + 64) + v5 + v6) & ~v5);
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v12;
  void *v12 = v2;
  v12[1] = sub_21F09DEF0;
  return sub_21F098950(a1, v7, v8, v9, v10, v11);
}

uint64_t sub_21F09E288(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }
  return swift_release();
}

char *sub_21F09E2E0(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + 4 * a1 + 32);
    size_t v6 = 4 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_21F0C94C8();
  __break(1u);
  return result;
}

uint64_t sub_21F09E3CC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 24 * a1 + 32;
    unint64_t v6 = a3 + 24 * v4;
    if (v5 >= v6 || v5 + 24 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_267EBB008);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_21F0C94C8();
  __break(1u);
  return result;
}

char *sub_21F09E4DC(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = (char *)(a4 + 24 * a1 + 32);
    size_t v6 = 24 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_21F0C94C8();
  __break(1u);
  return result;
}

uint64_t sub_21F09E5CC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    unint64_t v6 = a4 + 8 * a1 + 32;
    unint64_t v7 = a3 + 8 * v5;
    if (v6 >= v7 || v6 + 8 * v5 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(a5);
      swift_arrayInitWithCopy();
      return v7;
    }
  }
  uint64_t result = sub_21F0C94C8();
  __break(1u);
  return result;
}

uint64_t sub_21F09E6D4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_21F0C94C8();
  __break(1u);
  return result;
}

uint64_t sub_21F09E7C8(uint64_t a1)
{
  v41[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v2 = sub_21F0C8F08();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  unint64_t v5 = &v34[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = sub_21F0C8FC8();
  uint64_t v37 = *(void *)(v6 - 8);
  uint64_t v38 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = &v34[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  char v40 = 0;
  uint64_t v9 = self;
  id v10 = objc_msgSend(v9, sel_defaultManager);
  sub_21F0C8EE8();
  uint64_t v11 = (void *)sub_21F0C9048();
  swift_bridgeObjectRelease();
  unsigned int v12 = objc_msgSend(v10, sel_fileExistsAtPath_isDirectory_, v11, &v40);

  if (v12 && (v40 & 1) != 0) {
    return 1;
  }
  id v13 = objc_msgSend(v9, sel_defaultManager);
  uint64_t v14 = (void *)sub_21F0C8EB8();
  v41[0] = 0;
  unsigned int v15 = objc_msgSend(v13, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v14, 1, 0, v41);

  if (v15)
  {
    id v16 = v41[0];
    return 1;
  }
  id v18 = v41[0];
  uint64_t v19 = (void *)sub_21F0C8E78();

  swift_willThrow();
  if (qword_267EBAB80 != -1) {
    swift_once();
  }
  uint64_t v20 = v38;
  uint64_t v21 = __swift_project_value_buffer(v38, (uint64_t)qword_267EBAB88);
  uint64_t v22 = v37;
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v37 + 16))(v8, v21, v20);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  id v23 = v19;
  id v24 = v19;
  uint64_t v25 = sub_21F0C8FA8();
  os_log_type_t v26 = sub_21F0C9238();
  int v27 = v26;
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v28 = swift_slowAlloc();
    unint64_t v36 = (void *)swift_slowAlloc();
    v41[0] = v36;
    *(_DWORD *)uint64_t v28 = 136315394;
    int v35 = v27;
    uint64_t v29 = sub_21F0C8EE8();
    uint64_t v39 = sub_21F09D6AC(v29, v30, (uint64_t *)v41);
    sub_21F0C9308();
    swift_bridgeObjectRelease();
    (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
    *(_WORD *)(v28 + 12) = 2080;
    swift_getErrorValue();
    uint64_t v31 = sub_21F0C9618();
    uint64_t v39 = sub_21F09D6AC(v31, v32, (uint64_t *)v41);
    sub_21F0C9308();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_21F07C000, v25, (os_log_type_t)v35, "Could not create Audit Data directory at %s: %s", (uint8_t *)v28, 0x16u);
    uint64_t v33 = v36;
    swift_arrayDestroy();
    MEMORY[0x223C43270](v33, -1, -1);
    MEMORY[0x223C43270](v28, -1, -1);

    (*(void (**)(unsigned char *, uint64_t))(v37 + 8))(v8, v38);
  }
  else
  {

    (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
    (*(void (**)(unsigned char *, uint64_t))(v22 + 8))(v8, v20);
  }
  return 0;
}

unint64_t sub_21F09ECA4()
{
  unint64_t result = qword_267EBAF48;
  if (!qword_267EBAF48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EBAF48);
  }
  return result;
}

uint64_t sub_21F09ECF8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_21F09E288(a1, a2);
  }
  return a1;
}

uint64_t sub_21F09ED0C()
{
  return type metadata accessor for PADSWAuditDataRecorder();
}

uint64_t type metadata accessor for PADSWAuditDataRecorder()
{
  uint64_t result = qword_267EBAF50;
  if (!qword_267EBAF50) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_21F09ED60()
{
  sub_21F09EEE0();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for PADSWAuditDataRecorder(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PADSWAuditDataRecorder);
}

uint64_t dispatch thunk of PADSWAuditDataRecorder.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of PADSWAuditDataRecorder.storeClassifierResult(_:imageData:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of PADSWAuditDataRecorder.storeUnencryptedVideo(atURL:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of PADSWAuditDataRecorder.storePRDBuffer(_:withName:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of PADSWAuditDataRecorder.storeFACPoseBuffer(_:identifier:pose:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of PADSWAuditDataRecorder.storeTAAssessment(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

void sub_21F09EEE0()
{
  if (!qword_267EBAF60)
  {
    sub_21F0C8F08();
    unint64_t v0 = sub_21F0C92F8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_267EBAF60);
    }
  }
}

char *sub_21F09EF38(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = (char *)(a4 + 16 * a1 + 32);
    size_t v6 = 16 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_21F0C94C8();
  __break(1u);
  return result;
}

char *sub_21F09F024(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_21F0C94C8();
  __break(1u);
  return result;
}

char *sub_21F09F110(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = (char *)(a4 + 32 * a1 + 32);
    size_t v6 = 32 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_21F0C94C8();
  __break(1u);
  return result;
}

uint64_t sub_21F09F1FC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 40 * a1 + 32;
    unint64_t v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267EBB240);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_21F0C94C8();
  __break(1u);
  return result;
}

uint64_t sub_21F09F310(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_21F0C94C8();
  __break(1u);
  return result;
}

uint64_t sub_21F09F404(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 32 * a1 + 32;
    unint64_t v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_21F0C94C8();
  __break(1u);
  return result;
}

uint64_t sub_21F09F4F8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_21F0C94C8();
  __break(1u);
  return result;
}

uint64_t sub_21F09F5EC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_21F09F648()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_21F09F680(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_21F09F840;
  unint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_267EBAFE0 + dword_267EBAFE0);
  return v6(a1, v4);
}

uint64_t sub_21F09F738(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_21F09F790(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EBAF10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_21F09F7F8(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

id sub_21F09F844(double a1, double a2, double a3, double a4)
{
  uint64_t v8 = 3737841666;
  uint64_t v9 = MGGetProductType();
  if (v9 <= 2081274471)
  {
    if (v9 > 1060988940)
    {
      if (v9 > 1429914405)
      {
        if (v9 > 1737882205)
        {
          if (v9 != 1737882206)
          {
            if (v9 != 2032616841)
            {
              uint64_t v10 = 2080700391;
              goto LABEL_49;
            }
            goto LABEL_62;
          }
LABEL_58:
          uint64_t v8 = 1;
          goto LABEL_59;
        }
        if (v9 == 1429914406) {
          goto LABEL_58;
        }
        uint64_t v11 = 1721691077;
LABEL_57:
        if (v9 != v11) {
          goto LABEL_62;
        }
        goto LABEL_58;
      }
      if (v9 > 1234705394)
      {
        if (v9 != 1234705395)
        {
          uint64_t v10 = 1371389549;
LABEL_49:
          if (v9 == v10) {
            goto LABEL_50;
          }
        }
LABEL_62:
        uint64_t v8 = 2;
        goto LABEL_59;
      }
      if (v9 != 1060988941)
      {
        if (v9 == 1169082144) {
          goto LABEL_59;
        }
        goto LABEL_62;
      }
LABEL_42:
      uint64_t v8 = 3;
      goto LABEL_59;
    }
    if (v9 <= 502329936)
    {
      if (v9 > 337183580)
      {
        if (v9 == 337183581) {
          goto LABEL_58;
        }
        uint64_t v11 = 445396642;
      }
      else
      {
        if (v9 == 42878382) {
          goto LABEL_58;
        }
        uint64_t v11 = 253148925;
      }
      goto LABEL_57;
    }
    if (v9 > 910181309)
    {
      if (v9 == 910181310) {
        goto LABEL_62;
      }
      uint64_t v11 = 952317141;
      goto LABEL_57;
    }
    if (v9 == 502329937) {
      goto LABEL_58;
    }
    uint64_t v12 = 689804742;
LABEL_41:
    if (v9 != v12) {
      goto LABEL_62;
    }
    goto LABEL_42;
  }
  if (v9 <= 2722529671)
  {
    if (v9 <= 2309863437)
    {
      if (v9 <= 2162679682)
      {
        if (v9 != 2081274472)
        {
          if (v9 == 2159747553) {
            goto LABEL_59;
          }
          goto LABEL_62;
        }
        goto LABEL_58;
      }
      if (v9 == 2162679683) {
        goto LABEL_58;
      }
      uint64_t v11 = 2270970153;
      goto LABEL_57;
    }
    if (v9 > 2336512886)
    {
      if (v9 == 2336512887) {
        goto LABEL_58;
      }
      uint64_t v11 = 2468178735;
      goto LABEL_57;
    }
    if (v9 != 2309863438)
    {
      uint64_t v11 = 2311900306;
      goto LABEL_57;
    }
    goto LABEL_42;
  }
  if (v9 <= 3242623366)
  {
    if (v9 > 3001488777)
    {
      if (v9 == 3001488778) {
        goto LABEL_59;
      }
      uint64_t v11 = 3196805751;
    }
    else
    {
      if (v9 == 2722529672)
      {
LABEL_50:
        uint64_t v8 = 3737841664;
        goto LABEL_59;
      }
      uint64_t v11 = 2781508713;
    }
    goto LABEL_57;
  }
  if (v9 <= 3743999267)
  {
    if (v9 == 3242623367) {
      goto LABEL_58;
    }
    uint64_t v12 = 3585085679;
    goto LABEL_41;
  }
  if (v9 == 3743999268 || v9 != 3885279870 && v9 != 4201643249) {
    goto LABEL_62;
  }
LABEL_59:
  id v13 = objc_msgSend(self, sel_observationWithRequestRevision_boundingBox_, v8, a1, a2, a3, a4);
  return v13;
}

id PADInternalClassifier.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

char *PADInternalClassifier.init()()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EBAF18);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v0[OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_classifier] = 0;
  uint64_t v4 = &v0[OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_gestureStartBlock];
  *(void *)uint64_t v4 = 0;
  *((void *)v4 + 1) = 0;
  unint64_t v5 = &v0[OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_incorrectGestureDetectedBlock];
  *(void *)unint64_t v5 = 0;
  *((void *)v5 + 1) = 0;
  unint64_t v6 = &v0[OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_onGesturesFinishedBlock];
  *(void *)unint64_t v6 = 0;
  *((void *)v6 + 1) = 0;
  uint64_t v7 = &v0[OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_selfieCompletionBlock];
  *(void *)uint64_t v7 = 0;
  *((void *)v7 + 1) = 0;
  uint64_t v8 = OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_selfieCompletionBlockAccessSemaphore;
  uint64_t v9 = v0;
  *(void *)&v0[v8] = dispatch_semaphore_create(1);
  uint64_t v10 = &v9[OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_isClassifierLoading];
  dispatch_semaphore_t v11 = dispatch_semaphore_create(1);
  *(void *)uint64_t v10 = 0;
  *((void *)v10 + 1) = v11;
  uint64_t v12 = &v9[OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_onClassifierLoaded];
  *(void *)uint64_t v12 = 0;
  *((void *)v12 + 1) = 0;

  id v13 = (objc_class *)type metadata accessor for PADInternalClassifier();
  v24.receiver = v9;
  v24.super_class = v13;
  uint64_t v14 = (char *)objc_msgSendSuper2(&v24, sel_init);
  unsigned int v15 = &v14[OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_isClassifierLoading];
  swift_beginAccess();
  id v16 = (void *)*((void *)v15 + 1);
  uint64_t v17 = v14;
  sub_21F0C9298();
  *(void *)unsigned int v15 = 1;
  id v18 = v16;
  sub_21F0C92A8();
  swift_endAccess();

  sub_21F0C91A8();
  uint64_t v19 = sub_21F0C91C8();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v3, 0, 1, v19);
  uint64_t v20 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v21 = (void *)swift_allocObject();
  v21[2] = 0;
  v21[3] = 0;
  v21[4] = v20;
  sub_21F0A04BC((uint64_t)v3, (uint64_t)&unk_267EBB058, (uint64_t)v21);

  swift_release();
  sub_21F09543C((uint64_t)v3, &qword_267EBAF18);
  return v17;
}

uint64_t type metadata accessor for PADInternalClassifier()
{
  return self;
}

uint64_t sub_21F09FE78()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_21F09FEB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 176) = a4;
  return MEMORY[0x270FA2498](sub_21F09FED0, 0, 0);
}

uint64_t sub_21F09FED0()
{
  uint64_t v1 = *(void *)(v0 + 176) + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x223C43330](v1);
  *(void *)(v0 + 184) = v2;
  uint64_t v3 = *(void *)(v0 + 176) + 16;
  if (v2)
  {
    uint64_t v4 = (_OWORD *)(v0 + 16);
    swift_beginAccess();
    uint64_t v5 = MEMORY[0x223C43330](v3);
    if (v5)
    {
      uint64_t v6 = v5;
      *(void *)(v0 + 40) = type metadata accessor for PADInternalClassifier();
      *(void *)(v0 + 48) = &protocol witness table for PADInternalClassifier;
      *(void *)(v0 + 16) = v6;
    }
    else
    {
      *(void *)(v0 + 48) = 0;
      *uint64_t v4 = 0u;
      *(_OWORD *)(v0 + 32) = 0u;
    }
    type metadata accessor for PADSWClassifier();
    id v18 = (void *)swift_task_alloc();
    *(void *)(v0 + 192) = v18;
    void *v18 = v0;
    v18[1] = sub_21F0A0118;
    return PADSWClassifier.__allocating_init(delegate:)((uint64_t)v4);
  }
  else
  {
    swift_beginAccess();
    uint64_t v7 = MEMORY[0x223C43330](v3);
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      uint64_t v9 = (void *)(v7 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_isClassifierLoading);
      swift_beginAccess();
      uint64_t v10 = (void *)v9[1];
      sub_21F0C9298();
      void *v9 = 0;
      id v11 = v10;
      sub_21F0C92A8();
      swift_endAccess();
    }
    uint64_t v12 = *(void *)(v0 + 176) + 16;
    swift_beginAccess();
    uint64_t v13 = MEMORY[0x223C43330](v12);
    if (v13)
    {
      uint64_t v14 = (void *)v13;
      unsigned int v15 = *(void (**)(void))(v13 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_onClassifierLoaded);
      sub_21F0A54A4((uint64_t)v15);

      if (v15)
      {
        v15();
        sub_21F0A46F0((uint64_t)v15);
      }
    }
    id v16 = *(uint64_t (**)(void))(v0 + 8);
    return v16();
  }
}

uint64_t sub_21F0A0118(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 200) = v1;
  swift_task_dealloc();
  if (v1)
  {

    uint64_t v5 = sub_21F0A03B8;
  }
  else
  {
    *(void *)(v4 + 208) = a1;
    uint64_t v5 = sub_21F0A0248;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_21F0A0248()
{
  uint64_t v1 = (char *)v0[23];
  uint64_t v2 = *(void **)&v1[OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_classifier];
  *(void *)&v1[OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_classifier] = v0[26];

  uint64_t v3 = v0[22] + 16;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x223C43330](v3);
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    uint64_t v6 = (void *)(v4 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_isClassifierLoading);
    swift_beginAccess();
    uint64_t v7 = (void *)v6[1];
    sub_21F0C9298();
    void *v6 = 0;
    id v8 = v7;
    sub_21F0C92A8();
    swift_endAccess();
  }
  uint64_t v9 = v0[22] + 16;
  swift_beginAccess();
  uint64_t v10 = MEMORY[0x223C43330](v9);
  if (v10)
  {
    id v11 = (void *)v10;
    uint64_t v12 = *(void (**)(void))(v10 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_onClassifierLoaded);
    sub_21F0A54A4((uint64_t)v12);

    if (v12)
    {
      v12();
      sub_21F0A46F0((uint64_t)v12);
    }
  }
  uint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t sub_21F0A03B8()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21F0A03D0()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_21F0A0410()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_21F09DEF0;
  v3[22] = v2;
  return MEMORY[0x270FA2498](sub_21F09FED0, 0, 0);
}

uint64_t sub_21F0A04BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EBAF18);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21F0A5440(a1, (uint64_t)v7, &qword_267EBAF18);
  uint64_t v8 = sub_21F0C91C8();
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_21F09543C((uint64_t)v7, &qword_267EBAF18);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
  }
  else
  {
    sub_21F0C91B8();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v7, v8);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
  }
  swift_getObjectType();
  swift_unknownObjectRetain();
  uint64_t v10 = sub_21F0C9198();
  uint64_t v12 = v11;
  swift_unknownObjectRelease();
  if (v12 | v10)
  {
    v14[0] = 0;
    v14[1] = 0;
    v14[2] = v10;
    v14[3] = v12;
  }
  return swift_task_create();
}

void sub_21F0A06B0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8 = v7;
  uint64_t v39 = a6;
  uint64_t v40 = a7;
  uint64_t v37 = a2;
  uint64_t v38 = a4;
  uint64_t v12 = sub_21F0C8FC8();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  id v16 = (char *)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  id v18 = (char *)&v36 - v17;
  uint64_t v19 = v7 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_isClassifierLoading;
  swift_beginAccess();
  uint64_t v20 = *(void *)v19;
  id v21 = *(id *)(v19 + 8);
  sub_21F0C9298();
  sub_21F0C92A8();

  if (v20 <= 0)
  {
    if (qword_267EBAB80 != -1) {
      swift_once();
    }
    uint64_t v32 = __swift_project_value_buffer(v12, (uint64_t)qword_267EBAB88);
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v18, v32, v12);
    uint64_t v33 = sub_21F0C8FA8();
    os_log_type_t v34 = sub_21F0C9228();
    if (os_log_type_enabled(v33, v34))
    {
      int v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int v35 = 0;
      MEMORY[0x223C43270](v35, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v13 + 8))(v18, v12);
    sub_21F0A0E50((uint64_t)a1, v37, a3, v38, a5, v39, v40);
  }
  else
  {
    if (qword_267EBAB80 != -1) {
      swift_once();
    }
    uint64_t v22 = __swift_project_value_buffer(v12, (uint64_t)qword_267EBAB88);
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v16, v22, v12);
    uint64_t v23 = sub_21F0C8FA8();
    os_log_type_t v24 = sub_21F0C9228();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v25 = 0;
      MEMORY[0x223C43270](v25, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
    uint64_t v26 = swift_allocObject();
    swift_unknownObjectWeakInit();
    int v27 = (void (*)())swift_allocObject();
    *((void *)v27 + 2) = v26;
    *((void *)v27 + 3) = a1;
    *((void *)v27 + 4) = v37;
    *((void *)v27 + 5) = a3;
    *((void *)v27 + 6) = v38;
    *((void *)v27 + 7) = a5;
    uint64_t v28 = v40;
    *((void *)v27 + 8) = v39;
    *((void *)v27 + 9) = v28;
    uint64_t v29 = (void (**)())(v8 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_onClassifierLoaded);
    uint64_t v30 = *(void *)(v8 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_onClassifierLoaded);
    NSObject *v29 = sub_21F0A46DC;
    v29[1] = v27;
    id v31 = a1;
    swift_retain();
    swift_retain();
    swift_retain();
    sub_21F0A46F0(v30);
  }
}

void sub_21F0A0A6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v33 = a2;
  uint64_t v34 = a3;
  uint64_t v14 = sub_21F0C8FC8();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = a1 + 16;
  if (qword_267EBAB80 != -1) {
    swift_once();
  }
  uint64_t v18 = __swift_project_value_buffer(v14, (uint64_t)qword_267EBAB88);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, v18, v14);
  uint64_t v19 = sub_21F0C8FA8();
  os_log_type_t v20 = sub_21F0C9228();
  if (os_log_type_enabled(v19, v20))
  {
    id v21 = (uint8_t *)swift_slowAlloc();
    uint64_t v32 = a4;
    uint64_t v22 = a5;
    uint64_t v23 = a6;
    uint64_t v24 = a7;
    uint64_t v25 = a8;
    uint64_t v26 = v21;
    *(_WORD *)id v21 = 0;
    _os_log_impl(&dword_21F07C000, v19, v20, "PADInternalClassifier: Classifier loaded. Starting liveness from earlier call.", v21, 2u);
    int v27 = v26;
    a8 = v25;
    a7 = v24;
    a6 = v23;
    a5 = v22;
    a4 = v32;
    MEMORY[0x223C43270](v27, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  uint64_t v28 = v35;
  swift_beginAccess();
  uint64_t v29 = MEMORY[0x223C43330](v28);
  if (v29)
  {
    uint64_t v30 = (void *)v29;
    sub_21F0A0E50(v33, v34, a4, a5, a6, a7, a8);
  }
}

void sub_21F0A0DEC(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = sub_21F0C8E68();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

void sub_21F0A0E50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v30 = a6;
  uint64_t v13 = sub_21F0C8FC8();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = *(void **)(v7 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_classifier);
  if (v17)
  {
    uint64_t v18 = (void *)(v7 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_gestureStartBlock);
    uint64_t v19 = *(void *)(v7 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_gestureStartBlock);
    void *v18 = a2;
    v18[1] = a3;
    id v20 = v17;
    swift_retain();
    sub_21F0A46F0(v19);
    id v21 = (void *)(v7 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_incorrectGestureDetectedBlock);
    uint64_t v22 = *(void *)(v7 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_incorrectGestureDetectedBlock);
    void *v21 = a4;
    v21[1] = a5;
    swift_retain();
    sub_21F0A46F0(v22);
    uint64_t v23 = (void *)(v7 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_onGesturesFinishedBlock);
    uint64_t v24 = *(void *)(v7 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_onGesturesFinishedBlock);
    *uint64_t v23 = v30;
    v23[1] = a7;
    swift_retain();
    sub_21F0A46F0(v24);
    sub_21F0A10D8(v32);
    v31[0] = v32[0];
    v31[1] = v32[1];
    sub_21F091540(v31);
    swift_bridgeObjectRelease();
  }
  else
  {
    if (qword_267EBAB80 != -1) {
      swift_once();
    }
    uint64_t v25 = __swift_project_value_buffer(v13, (uint64_t)qword_267EBAB88);
    (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, v25, v13);
    uint64_t v26 = sub_21F0C8FA8();
    os_log_type_t v27 = sub_21F0C9238();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v28 = 0;
      MEMORY[0x223C43270](v28, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  }
}

id sub_21F0A10D8@<X0>(void *a1@<X8>)
{
  id v3 = objc_msgSend(v1, sel_gestures);
  sub_21F0A5404(0, &qword_267EBAE88);
  unint64_t v4 = sub_21F0C9128();

  if (!(v4 >> 62))
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    id result = (id)swift_bridgeObjectRetain();
    id v15 = v1;
    uint64_t v16 = a1;
    if (v5) {
      goto LABEL_3;
    }
LABEL_19:
    uint64_t v8 = (void *)MEMORY[0x263F8EE78];
LABEL_20:
    swift_bridgeObjectRelease_n();
    id result = objc_msgSend(v15, sel_minNumberOfGestures);
    void *v16 = v8;
    v16[1] = result;
    return result;
  }
  swift_bridgeObjectRetain();
  id result = (id)sub_21F0C9488();
  uint64_t v5 = (uint64_t)result;
  id v15 = v1;
  uint64_t v16 = a1;
  if (!result) {
    goto LABEL_19;
  }
LABEL_3:
  if (v5 >= 1)
  {
    uint64_t v7 = 0;
    uint64_t v8 = (void *)MEMORY[0x263F8EE78];
    do
    {
      if ((v4 & 0xC000000000000001) != 0) {
        id v9 = (id)MEMORY[0x223C42390](v7, v4);
      }
      else {
        id v9 = *(id *)(v4 + 8 * v7 + 32);
      }
      uint64_t v10 = v9;
      unint64_t v11 = (unint64_t)objc_msgSend(v9, sel_integerValue, v15);

      if (v11 <= 0xA && ((1 << v11) & 0x73F) != 0)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v8 = sub_21F09CF20(0, v8[2] + 1, 1, v8);
        }
        unint64_t v14 = v8[2];
        unint64_t v13 = v8[3];
        if (v14 >= v13 >> 1) {
          uint64_t v8 = sub_21F09CF20((void *)(v13 > 1), v14 + 1, 1, v8);
        }
        v8[2] = v14 + 1;
        v8[v14 + 4] = v11;
      }
      ++v7;
    }
    while (v5 != v7);
    goto LABEL_20;
  }
  __break(1u);
  return result;
}

void sub_21F0A12C4(void *a1, int a2, unint64_t a3)
{
  id v6 = a1;
  id v11 = sub_21F0A4B40(v6);

  uint64_t v7 = *(char **)(v3 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_classifier);
  if (v7)
  {
    if (a3 >= 3) {
      char v8 = 1;
    }
    else {
      char v8 = a3;
    }
    *(unsigned char *)(*(void *)&v7[OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_ta] + 185) = v8;
    v12[0] = BYTE1(a2) & 1;
    v12[1] = BYTE2(a2) & 1;
    v12[2] = a2 & 1;
    uint64_t v10 = v7;
    sub_21F0918DC(v11, v12);

    id v9 = v10;
  }
  else
  {
    id v9 = (char *)v11;
  }
}

void sub_21F0A140C()
{
}

void sub_21F0A143C()
{
  uint64_t v1 = sub_21F0C8FC8();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  unint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *(char **)(v0 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_classifier);
  if (v5)
  {
    uint64_t v6 = *(void *)&v5[OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_fac];
    uint64_t v7 = qword_267EBAB80;
    char v8 = v5;
    if (v7 != -1) {
      swift_once();
    }
    uint64_t v9 = __swift_project_value_buffer(v1, (uint64_t)qword_267EBAB88);
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v9, v1);
    uint64_t v10 = sub_21F0C8FA8();
    os_log_type_t v11 = sub_21F0C9228();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_21F07C000, v10, v11, "FAC Module: AX has been enabled", v12, 2u);
      MEMORY[0x223C43270](v12, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    *(unsigned char *)(v6 + 257) = 1;
  }
}

void sub_21F0A1620()
{
}

void sub_21F0A1650()
{
}

void sub_21F0A1680()
{
}

void sub_21F0A16B0()
{
}

void sub_21F0A16C8(void (*a1)(void))
{
  uint64_t v2 = *(void **)(v1 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_classifier);
  if (v2)
  {
    id v4 = v2;
    a1();
  }
}

void sub_21F0A175C(char *a1, uint64_t a2, void (*a3)(void))
{
  uint64_t v3 = *(void **)&a1[OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_classifier];
  if (v3)
  {
    uint64_t v5 = a1;
    id v6 = v3;
    a3();
  }
}

void sub_21F0A17F0(void *a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  sub_21F0C9298();
  uint64_t v10 = (void *)(v4 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_selfieCompletionBlock);
  uint64_t v11 = *(void *)(v4 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_selfieCompletionBlock);
  *uint64_t v10 = a3;
  v10[1] = a4;
  swift_retain();
  sub_21F0A46F0(v11);
  sub_21F0C92A8();
  id v12 = a1;
  id v15 = sub_21F0A4B40(v12);

  uint64_t v13 = *(void **)(v5 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_classifier);
  if (v13)
  {
    id v14 = v13;
    sub_21F093B44(v15, a2 & 1);
  }
}

void sub_21F0A197C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = sub_21F0C8E68();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);
}

void sub_21F0A19EC(uint64_t a1, uint64_t a2)
{
  sub_21F0C9298();
  uint64_t v5 = (void *)(v2 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_selfieCompletionBlock);
  uint64_t v6 = *(void *)(v2 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_selfieCompletionBlock);
  void *v5 = a1;
  v5[1] = a2;
  swift_retain();
  sub_21F0A46F0(v6);
  sub_21F0C92A8();
  uint64_t v7 = *(void **)(v2 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_classifier);
  if (v7)
  {
    id v8 = v7;
    sub_21F091B18();
  }
}

void sub_21F0A1AE8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  sub_21F0C9298();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a1;
  *(void *)(v6 + 24) = a2;
  uint64_t v7 = (uint64_t (**)())(v2 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_selfieCompletionBlock);
  uint64_t v8 = *(void *)(v2 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_selfieCompletionBlock);
  *uint64_t v7 = sub_21F0A4F74;
  v7[1] = (uint64_t (*)())v6;
  swift_retain();
  sub_21F0A46F0(v8);
  sub_21F0C92A8();
  uint64_t v9 = OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_classifier;
  uint64_t v10 = *(void **)(v2 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_classifier);
  if (v10)
  {
    uint64_t v11 = (uint64_t)v10 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_delegate;
    swift_beginAccess();
    sub_21F0A5440(v11, (uint64_t)v19, (uint64_t *)&unk_267EBB450);
    if (v20)
    {
      sub_21F093D74((uint64_t)v19, (uint64_t)v16);
      id v12 = v10;
      sub_21F09543C((uint64_t)v19, (uint64_t *)&unk_267EBB450);
      uint64_t v13 = v17;
      uint64_t v14 = v18;
      __swift_project_boxed_opaque_existential_1(v16, v17);
      (*(void (**)(void, uint64_t, uint64_t))(v14 + 56))(0, v13, v14);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
    }
    else
    {
      sub_21F09543C((uint64_t)v19, (uint64_t *)&unk_267EBB450);
    }
    id v15 = *(void **)(v3 + v9);
  }
  else
  {
    id v15 = 0;
  }
  *(void *)(v3 + v9) = 0;
}

uint64_t sub_21F0A1C9C(void *a1, int a2, void *aBlock, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, uint64_t))
{
  uint64_t v9 = _Block_copy(aBlock);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  id v11 = a1;
  a6(a5, v10);

  return swift_release();
}

id PADInternalClassifier.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PADInternalClassifier();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

Swift::Void __swiftcall PADInternalClassifier.padClassifierDidFinishGestureDetection()()
{
  uint64_t v1 = *(void (**)(void))(v0 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_onGesturesFinishedBlock);
  if (v1)
  {
    swift_retain();
    v1(0);
    sub_21F0A46F0((uint64_t)v1);
  }
}

void PADInternalClassifier.padClassifierWillStartDetectingGesture(_:)()
{
  uint64_t v1 = *(void (**)(void))(v0 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_gestureStartBlock);
  if (v1)
  {
    swift_retain();
    id v2 = (id)sub_21F0C91F8();
    v1();
    sub_21F0A46F0((uint64_t)v1);
  }
}

void PADInternalClassifier.padClassifierDidDetectIncorrectGesture(duringDetectionOfGesture:)()
{
  uint64_t v1 = *(void (**)(uint64_t))(v0
                                      + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_incorrectGestureDetectedBlock);
  if (v1)
  {
    uint64_t v2 = swift_retain();
    v1(v2);
    sub_21F0A46F0((uint64_t)v1);
  }
}

uint64_t PADInternalClassifier.padClassifierDidDetectStitchWhileDetectingFrame(_:shouldBeIgnored:)(uint64_t a1, char a2)
{
  return sub_21F0A48D8(a2);
}

void sub_21F0A1FA0()
{
  id v0 = objc_msgSend(self, sel_defaultCenter);
  id v1 = v0;
  if (qword_267EBABC0 != -1)
  {
    swift_once();
    id v0 = v1;
  }
  objc_msgSend(v0, sel_postNotificationName_object_, qword_267EBB178, 0);
}

uint64_t sub_21F0A2040(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t PADInternalClassifier.padClassifierDidCompleteAssessment(withResult:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_21F0C8FC8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v8 = *(_OWORD *)(a1 + 208);
  v24[12] = *(_OWORD *)(a1 + 192);
  v24[13] = v8;
  v24[14] = *(_OWORD *)(a1 + 224);
  uint64_t v25 = *(void *)(a1 + 240);
  long long v9 = *(_OWORD *)(a1 + 144);
  v24[8] = *(_OWORD *)(a1 + 128);
  v24[9] = v9;
  long long v10 = *(_OWORD *)(a1 + 176);
  v24[10] = *(_OWORD *)(a1 + 160);
  v24[11] = v10;
  long long v11 = *(_OWORD *)(a1 + 80);
  v24[4] = *(_OWORD *)(a1 + 64);
  v24[5] = v11;
  long long v12 = *(_OWORD *)(a1 + 112);
  v24[6] = *(_OWORD *)(a1 + 96);
  v24[7] = v12;
  long long v13 = *(_OWORD *)(a1 + 16);
  v24[0] = *(_OWORD *)a1;
  v24[1] = v13;
  long long v14 = *(_OWORD *)(a1 + 48);
  v24[2] = *(_OWORD *)(a1 + 32);
  v24[3] = v14;
  if (qword_267EBAB80 != -1) {
    swift_once();
  }
  uint64_t v15 = __swift_project_value_buffer(v4, (uint64_t)qword_267EBAB88);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v15, v4);
  uint64_t v16 = sub_21F0C8FA8();
  os_log_type_t v17 = sub_21F0C9228();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v18 = 0;
    _os_log_impl(&dword_21F07C000, v16, v17, "PADInternalClassifier padClassifierDidCompleteAssessment", v18, 2u);
    MEMORY[0x223C43270](v18, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_21F0C9298();
  uint64_t v19 = (uint64_t *)(v2 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_selfieCompletionBlock);
  uint64_t v20 = *(void (**)(id, void))(v2
                                          + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_selfieCompletionBlock);
  if (v20)
  {
    swift_retain();
    id v21 = sub_21F0A22F8();
    v20(v21, 0);
    sub_21F0A46F0((uint64_t)v20);

    uint64_t v22 = *v19;
  }
  else
  {
    uint64_t v22 = 0;
  }
  *uint64_t v19 = 0;
  v19[1] = 0;
  sub_21F0A46F0(v22);
  return sub_21F0C92A8();
}

id sub_21F0A22F8()
{
  uint64_t v1 = *(void *)(v0 + 8);
  uint64_t v3 = *(void *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v4 = *(void *)(v0 + 32);
  uint64_t v127 = *(void *)(v0 + 48);
  uint64_t v129 = *(void *)(v0 + 56);
  uint64_t v124 = *(void *)(v0 + 40);
  uint64_t v125 = *(void *)(v0 + 64);
  int v5 = *(_DWORD *)(v0 + 72);
  int v7 = *(_DWORD *)(v0 + 88);
  int v6 = *(_DWORD *)(v0 + 92);
  int v8 = *(_DWORD *)(v0 + 96);
  int v9 = *(_DWORD *)(v0 + 100);
  int v10 = *(_DWORD *)(v0 + 104);
  uint64_t v122 = *(void *)(v0 + 80);
  uint64_t v123 = *(void *)(v0 + 112);
  uint64_t v121 = *(void *)(v0 + 128);
  id v11 = objc_msgSend(objc_allocWithZone((Class)PADClassifierResult), sel_init);
  long long v12 = (void *)sub_21F0C91F8();
  id v126 = v11;
  objc_msgSend(v11, sel_setLivenessLabel_, v12);

  uint64_t v13 = *(void *)(v1 + 16);
  if (v13)
  {
    time.CMTimeValue value = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_21F0C9428();
    uint64_t v14 = 0;
    do
    {
      uint64_t v15 = v14 + 1;
      sub_21F0C91F8();
      sub_21F0C9408();
      sub_21F0C9438();
      sub_21F0C9448();
      sub_21F0C9418();
      uint64_t v14 = v15;
    }
    while (v13 != v15);
    swift_bridgeObjectRelease();
  }
  sub_21F0A5404(0, &qword_267EBAE88);
  uint64_t v16 = (void *)sub_21F0C9118();
  swift_bridgeObjectRelease();
  objc_msgSend(v126, sel_setGestureSequence_, v16);

  uint64_t v17 = *(void *)(v3 + 16);
  if (v17)
  {
    time.CMTimeValue value = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_21F0C9428();
    uint64_t v18 = 0;
    do
    {
      uint64_t v19 = v18 + 1;
      sub_21F0C91F8();
      sub_21F0C9408();
      sub_21F0C9438();
      sub_21F0C9448();
      sub_21F0C9418();
      uint64_t v18 = v19;
    }
    while (v17 != v19);
    swift_bridgeObjectRelease();
  }
  uint64_t v20 = (void *)sub_21F0C9118();
  swift_bridgeObjectRelease();
  objc_msgSend(v126, sel_setAssessmentsFAC_, v20);

  uint64_t v21 = *(void *)(v2 + 16);
  if (v21)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v22 = v2 + 56;
    uint64_t v23 = (void *)MEMORY[0x263F8EE78];
    do
    {
      uint64_t v24 = (void *)sub_21F0A3780();
      uint64_t v25 = sub_21F0A3C3C();

      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v23 = sub_21F09CDFC(0, v23[2] + 1, 1, v23);
      }
      unint64_t v27 = v23[2];
      unint64_t v26 = v23[3];
      if (v27 >= v26 >> 1) {
        uint64_t v23 = sub_21F09CDFC((void *)(v26 > 1), v27 + 1, 1, v23);
      }
      void v23[2] = v27 + 1;
      v23[v27 + 4] = v25;
      v22 += 32;
      --v21;
    }
    while (v21);
    swift_bridgeObjectRelease_n();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EBAFC0);
  uint64_t v28 = (void *)sub_21F0C9118();
  swift_bridgeObjectRelease();
  objc_msgSend(v126, sel_setAssessmentsPRD_, v28);

  uint64_t v29 = *(void *)(v4 + 16);
  if (v29)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v30 = v4 + 44;
    uint64_t v31 = (void *)MEMORY[0x263F8EE78];
    do
    {
      uint64_t v32 = (void *)sub_21F0A39DC();
      uint64_t v33 = sub_21F0A3C3C();

      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v31 = sub_21F09CDFC(0, v31[2] + 1, 1, v31);
      }
      unint64_t v35 = v31[2];
      unint64_t v34 = v31[3];
      if (v35 >= v34 >> 1) {
        uint64_t v31 = sub_21F09CDFC((void *)(v34 > 1), v35 + 1, 1, v31);
      }
      uint64_t v31[2] = v35 + 1;
      v31[v35 + 4] = v33;
      v30 += 16;
      --v29;
    }
    while (v29);
    swift_bridgeObjectRelease_n();
  }
  uint64_t v36 = v127;
  uint64_t v37 = (void *)sub_21F0C9118();
  swift_bridgeObjectRelease();
  objc_msgSend(v126, sel_setAssessmentsTA_, v37);

  int64_t v38 = *(void *)(v124 + 16);
  uint64_t v39 = (void *)MEMORY[0x263F8EE78];
  if (v38)
  {
    uint64_t v133 = MEMORY[0x263F8EE78];
    uint64_t v40 = (const __CFAllocator **)MEMORY[0x263EFFB08];
    swift_bridgeObjectRetain();
    sub_21F0C3A00(0, v38, 0);
    uint64_t v41 = 0;
    uint64_t v42 = v133;
    CFAllocatorRef v43 = *v40;
    int64_t v128 = v38;
    do
    {
      uint64_t v44 = *(void *)(v124 + 32 + 8 * v41);
      uint64_t v45 = *(void *)(v44 + 16);
      if (v45)
      {
        uint64_t v131 = v42;
        swift_bridgeObjectRetain_n();
        for (uint64_t i = 0; i != v45; ++i)
        {
          CMTimeMake(&time, *(void *)(v44 + 8 * i + 32), 1000000000);
          CFDictionaryRef v47 = CMTimeCopyAsDictionary(&time, v43);
          if (v47)
          {
            CFDictionaryRef v48 = v47;
            time.CMTimeValue value = 0;
            sub_21F0C9028();

            if (time.value)
            {
              uint64_t v49 = sub_21F0A4300(time.value);
              swift_bridgeObjectRelease();
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                uint64_t v39 = sub_21F09CDE8(0, v39[2] + 1, 1, v39);
              }
              unint64_t v51 = v39[2];
              unint64_t v50 = v39[3];
              if (v51 >= v50 >> 1) {
                uint64_t v39 = sub_21F09CDE8((void *)(v50 > 1), v51 + 1, 1, v39);
              }
              v39[2] = v51 + 1;
              v39[v51 + 4] = v49;
            }
          }
        }
        swift_bridgeObjectRelease_n();
        int64_t v38 = v128;
        uint64_t v42 = v131;
      }
      uint64_t v133 = v42;
      unint64_t v53 = *(void *)(v42 + 16);
      unint64_t v52 = *(void *)(v42 + 24);
      if (v53 >= v52 >> 1)
      {
        sub_21F0C3A00(v52 > 1, v53 + 1, 1);
        uint64_t v42 = v133;
      }
      ++v41;
      *(void *)(v42 + 16) = v53 + 1;
      *(void *)(v42 + 8 * v53 + 32) = v39;
      uint64_t v39 = (void *)MEMORY[0x263F8EE78];
    }
    while (v41 != v38);
    swift_bridgeObjectRelease();
    uint64_t v36 = v127;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EBB060);
  uint64_t v54 = (void *)sub_21F0C9118();
  swift_bridgeObjectRelease();
  objc_msgSend(v126, sel_setTimestampsFAC_, v54);

  int64_t v55 = *(void *)(v125 + 16);
  uint64_t v56 = MEMORY[0x263F8EE78];
  if (v55)
  {
    time.CMTimeValue value = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_21F0C39D0(0, v55, 0);
    uint64_t v57 = 0;
    CMTimeValue value = time.value;
    int64_t v130 = v55;
    do
    {
      uint64_t v59 = *(void *)(v125 + 32 + 8 * v57);
      uint64_t v60 = *(void *)(v59 + 16);
      if (v60)
      {
        uint64_t v133 = v56;
        swift_bridgeObjectRetain();
        sub_21F0C9428();
        uint64_t v61 = 0;
        do
        {
          uint64_t v62 = v61 + 1;
          int v63 = *(_DWORD *)(v59 + 4 * v61 + 32);
          id v64 = objc_allocWithZone(NSNumber);
          LODWORD(v65) = v63;
          objc_msgSend(v64, sel_initWithFloat_, v65);
          sub_21F0C9408();
          sub_21F0C9438();
          sub_21F0C9448();
          sub_21F0C9418();
          uint64_t v61 = v62;
        }
        while (v60 != v62);
        uint64_t v66 = v133;
        swift_bridgeObjectRelease();
        uint64_t v56 = MEMORY[0x263F8EE78];
        int64_t v55 = v130;
      }
      else
      {
        uint64_t v66 = v56;
      }
      time.CMTimeValue value = value;
      unint64_t v68 = *(void *)(value + 16);
      unint64_t v67 = *(void *)(value + 24);
      if (v68 >= v67 >> 1)
      {
        sub_21F0C39D0(v67 > 1, v68 + 1, 1);
        CMTimeValue value = time.value;
      }
      ++v57;
      *(void *)(value + 16) = v68 + 1;
      *(void *)(value + 8 * v68 + 32) = v66;
    }
    while (v57 != v55);
    swift_bridgeObjectRelease();
    uint64_t v36 = v127;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EBB068);
  int v69 = (void *)sub_21F0C9118();
  swift_bridgeObjectRelease();
  objc_msgSend(v126, sel_setFaceprintsID_, v69);

  uint64_t v70 = *(void *)(v36 + 16);
  if (v70)
  {
    CFAllocatorRef v71 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    swift_bridgeObjectRetain_n();
    uint64_t v72 = 0;
    uint64_t v73 = (void *)MEMORY[0x263F8EE78];
    do
    {
      CMTimeMake(&time, *(void *)(v36 + 8 * v72 + 32), 1000000000);
      CFDictionaryRef v74 = CMTimeCopyAsDictionary(&time, v71);
      if (v74)
      {
        CFDictionaryRef v75 = v74;
        time.CMTimeValue value = 0;
        sub_21F0C9028();

        if (time.value)
        {
          uint64_t v76 = sub_21F0A4300(time.value);
          swift_bridgeObjectRelease();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v73 = sub_21F09CDE8(0, v73[2] + 1, 1, v73);
          }
          unint64_t v78 = v73[2];
          unint64_t v77 = v73[3];
          if (v78 >= v77 >> 1) {
            uint64_t v73 = sub_21F09CDE8((void *)(v77 > 1), v78 + 1, 1, v73);
          }
          v73[2] = v78 + 1;
          v73[v78 + 4] = v76;
          uint64_t v36 = v127;
        }
      }
      ++v72;
    }
    while (v70 != v72);
    swift_bridgeObjectRelease_n();
  }
  uint64_t v79 = v129;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EBAFB0);
  uint64_t v80 = (void *)sub_21F0C9118();
  swift_bridgeObjectRelease();
  objc_msgSend(v126, sel_setTimestampsID_, v80);

  uint64_t v81 = *(void *)(v129 + 16);
  if (v81)
  {
    CFAllocatorRef v82 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    swift_bridgeObjectRetain_n();
    uint64_t v83 = 0;
    uint64_t v84 = (void *)MEMORY[0x263F8EE78];
    do
    {
      CMTimeMake(&time, *(void *)(v79 + 8 * v83 + 32), 1000000000);
      CFDictionaryRef v85 = CMTimeCopyAsDictionary(&time, v82);
      if (v85)
      {
        CFDictionaryRef v86 = v85;
        time.CMTimeValue value = 0;
        sub_21F0C9028();

        if (time.value)
        {
          uint64_t v87 = sub_21F0A4300(time.value);
          swift_bridgeObjectRelease();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v84 = sub_21F09CDE8(0, v84[2] + 1, 1, v84);
          }
          unint64_t v89 = v84[2];
          unint64_t v88 = v84[3];
          if (v89 >= v88 >> 1) {
            uint64_t v84 = sub_21F09CDE8((void *)(v88 > 1), v89 + 1, 1, v84);
          }
          v84[2] = v89 + 1;
          v84[v89 + 4] = v87;
        }
        uint64_t v79 = v129;
      }
      ++v83;
    }
    while (v81 != v83);
    swift_bridgeObjectRelease_n();
    uint64_t v90 = v121;
  }
  else
  {
    uint64_t v90 = v121;
  }
  uint64_t v91 = (void *)sub_21F0C9118();
  swift_bridgeObjectRelease();
  objc_msgSend(v126, sel_setTimestampsButtonPressed_, v91);

  id v92 = objc_allocWithZone(NSNumber);
  LODWORD(v93) = v5;
  id v94 = objc_msgSend(v92, sel_initWithFloat_, v93);
  objc_msgSend(v126, sel_setAssessmentFAC_, v94);

  id v95 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, v122);
  objc_msgSend(v126, sel_setAssessmentTA_, v95);

  id v96 = objc_allocWithZone(NSNumber);
  LODWORD(v97) = v9;
  id v98 = objc_msgSend(v96, sel_initWithFloat_, v97);
  objc_msgSend(v126, sel_setMaxNccLow_, v98);

  id v99 = objc_allocWithZone(NSNumber);
  LODWORD(v100) = v10;
  id v101 = objc_msgSend(v99, sel_initWithFloat_, v100);
  objc_msgSend(v126, sel_setMaxNccHigh_, v101);

  id v102 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, v123);
  objc_msgSend(v126, sel_setIgnoredStitches_, v102);

  id v103 = objc_allocWithZone(NSNumber);
  LODWORD(v104) = v7;
  id v105 = objc_msgSend(v103, sel_initWithFloat_, v104);
  objc_msgSend(v126, sel_setAssessmentFakePRD_, v105);

  id v106 = objc_allocWithZone(NSNumber);
  LODWORD(v107) = v6;
  id v108 = objc_msgSend(v106, sel_initWithFloat_, v107);
  objc_msgSend(v126, sel_setAssessmentLivePRD_, v108);

  id v109 = objc_allocWithZone(NSNumber);
  LODWORD(v110) = v8;
  id v111 = objc_msgSend(v109, sel_initWithFloat_, v110);
  objc_msgSend(v126, sel_setAssessmentID_, v111);

  if (v90) {
    uint64_t v112 = (void *)sub_21F0C9048();
  }
  else {
    uint64_t v112 = 0;
  }
  objc_msgSend(v126, sel_setDeviceInfo_, v112);

  swift_bridgeObjectRetain();
  uint64_t v113 = (void *)sub_21F0C9048();
  swift_bridgeObjectRelease();
  objc_msgSend(v126, sel_setAgeLabel_, v113);

  swift_bridgeObjectRetain();
  uint64_t v114 = (void *)sub_21F0C9048();
  swift_bridgeObjectRelease();
  objc_msgSend(v126, sel_setSexLabel_, v114);

  swift_bridgeObjectRetain();
  long long v115 = (void *)sub_21F0C9048();
  swift_bridgeObjectRelease();
  objc_msgSend(v126, sel_setSkintoneLabel_, v115);

  swift_bridgeObjectRetain();
  long long v116 = (void *)sub_21F0C9048();
  swift_bridgeObjectRelease();
  objc_msgSend(v126, sel_setEthnicityLabel_, v116);

  swift_bridgeObjectRetain();
  long long v117 = (void *)sub_21F0C9048();
  swift_bridgeObjectRelease();
  objc_msgSend(v126, sel_setFaceHairLabel_, v117);

  swift_bridgeObjectRetain();
  long long v118 = (void *)sub_21F0C9048();
  swift_bridgeObjectRelease();
  objc_msgSend(v126, sel_setHeadgearLabel_, v118);

  swift_bridgeObjectRetain();
  long long v119 = (void *)sub_21F0C9048();
  swift_bridgeObjectRelease();
  objc_msgSend(v126, sel_setGlassesLabel_, v119);

  return v126;
}

uint64_t PADInternalClassifier.padClassifierDidCancelWithError(_:)(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_21F0C8FC8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  int v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_267EBAB80 != -1) {
    swift_once();
  }
  uint64_t v8 = __swift_project_value_buffer(v4, (uint64_t)qword_267EBAB88);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  id v9 = a1;
  id v10 = a1;
  id v11 = sub_21F0C8FA8();
  os_log_type_t v12 = sub_21F0C9228();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v25 = v14;
    *(_DWORD *)uint64_t v13 = 136315138;
    uint64_t v23 = v1;
    if (a1)
    {
      swift_getErrorValue();
      unint64_t v15 = sub_21F0C9618();
      unint64_t v17 = v16;
    }
    else
    {
      unint64_t v17 = 0x800000021F0CE8C0;
      unint64_t v15 = 0xD000000000000017;
    }
    uint64_t v24 = sub_21F09D6AC(v15, v17, &v25);
    sub_21F0C9308();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_21F07C000, v11, v12, "PADInternalClassifier padClassifierDidCancelWithError: %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223C43270](v14, -1, -1);
    MEMORY[0x223C43270](v13, -1, -1);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    uint64_t v2 = v23;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  sub_21F0C9298();
  uint64_t v18 = (uint64_t *)(v2 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_selfieCompletionBlock);
  uint64_t v19 = *(void (**)(void, void *))(v2
                                              + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_selfieCompletionBlock);
  if (v19)
  {
    swift_retain();
    v19(0, a1);
    sub_21F0A46F0((uint64_t)v19);
    uint64_t v20 = *v18;
  }
  else
  {
    uint64_t v20 = 0;
  }
  uint64_t *v18 = 0;
  v18[1] = 0;
  sub_21F0A46F0(v20);
  return sub_21F0C92A8();
}

void sub_21F0A35B8()
{
  uint64_t v1 = *(void (**)(void))(*v0 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_gestureStartBlock);
  if (v1)
  {
    swift_retain();
    id v2 = (id)sub_21F0C91F8();
    v1();
    sub_21F0A46F0((uint64_t)v1);
  }
}

void sub_21F0A3654()
{
  uint64_t v1 = *(void (**)(uint64_t))(*v0
                                      + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_incorrectGestureDetectedBlock);
  if (v1)
  {
    uint64_t v2 = swift_retain();
    v1(v2);
    sub_21F0A46F0((uint64_t)v1);
  }
}

uint64_t sub_21F0A36C0(uint64_t a1, char a2)
{
  return sub_21F0A48D8(a2);
}

void sub_21F0A36C8()
{
  uint64_t v1 = *(void (**)(void))(*v0 + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_onGesturesFinishedBlock);
  if (v1)
  {
    swift_retain();
    v1(0);
    sub_21F0A46F0((uint64_t)v1);
  }
}

uint64_t sub_21F0A3738(uint64_t a1)
{
  return PADInternalClassifier.padClassifierDidCompleteAssessment(withResult:)(a1);
}

uint64_t sub_21F0A375C(void *a1)
{
  return PADInternalClassifier.padClassifierDidCancelWithError(_:)(a1);
}

uint64_t sub_21F0A3780()
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  sub_21F0C8DF8();
  swift_allocObject();
  sub_21F0C8DE8();
  sub_21F08E244();
  uint64_t v0 = sub_21F0C8DD8();
  unint64_t v2 = v1;
  swift_release();
  uint64_t v3 = self;
  uint64_t v4 = (void *)sub_21F0C8F38();
  *(void *)&v16[0] = 0;
  id v5 = objc_msgSend(v3, sel_JSONObjectWithData_options_error_, v4, 4, v16);

  id v6 = *(id *)&v16[0];
  if (v5)
  {
    sub_21F0C9328();
    swift_unknownObjectRelease();
  }
  else
  {
    int v7 = v6;
    uint64_t v8 = (void *)sub_21F0C8E78();

    swift_willThrow();
    memset(v16, 0, sizeof(v16));
  }
  sub_21F0A5440((uint64_t)v16, (uint64_t)&v13, (uint64_t *)&unk_267EBB200);
  if (!v14) {
    goto LABEL_8;
  }
  sub_21F0A52C0(&v13, v12);
  sub_21F09F5EC((uint64_t)v12, (uint64_t)v11);
  sub_21F0A5404(0, &qword_267EBB078);
  if ((swift_dynamicCast() & 1) == 0) {
    uint64_t v15 = 0;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  uint64_t v9 = v15;
  if (!v15)
  {
LABEL_8:
    sub_21F0A5404(0, &qword_267EBB078);
    uint64_t v9 = sub_21F0C9208();
  }
  sub_21F09E288(v0, v2);
  sub_21F09543C((uint64_t)v16, (uint64_t *)&unk_267EBB200);
  return v9;
}

uint64_t sub_21F0A39DC()
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  sub_21F0C8DF8();
  swift_allocObject();
  sub_21F0C8DE8();
  sub_21F08E298();
  uint64_t v0 = sub_21F0C8DD8();
  unint64_t v2 = v1;
  swift_release();
  uint64_t v3 = self;
  uint64_t v4 = (void *)sub_21F0C8F38();
  *(void *)&v16[0] = 0;
  id v5 = objc_msgSend(v3, sel_JSONObjectWithData_options_error_, v4, 4, v16);

  id v6 = *(id *)&v16[0];
  if (v5)
  {
    sub_21F0C9328();
    swift_unknownObjectRelease();
  }
  else
  {
    int v7 = v6;
    uint64_t v8 = (void *)sub_21F0C8E78();

    swift_willThrow();
    memset(v16, 0, sizeof(v16));
  }
  sub_21F0A5440((uint64_t)v16, (uint64_t)&v13, (uint64_t *)&unk_267EBB200);
  if (!v14) {
    goto LABEL_8;
  }
  sub_21F0A52C0(&v13, v12);
  sub_21F09F5EC((uint64_t)v12, (uint64_t)v11);
  sub_21F0A5404(0, &qword_267EBB078);
  if ((swift_dynamicCast() & 1) == 0) {
    uint64_t v15 = 0;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  uint64_t v9 = v15;
  if (!v15)
  {
LABEL_8:
    sub_21F0A5404(0, &qword_267EBB078);
    uint64_t v9 = sub_21F0C9208();
  }
  sub_21F09E288(v0, v2);
  sub_21F09543C((uint64_t)v16, (uint64_t *)&unk_267EBB200);
  return v9;
}

uint64_t sub_21F0A3C3C()
{
  unint64_t v1 = v0;
  uint64_t v2 = sub_21F0C8E98();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  id v5 = (char *)&v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = objc_msgSend(v0, sel_keyEnumerator);
  sub_21F0C9218();

  sub_21F0C8E88();
  if (!v60)
  {
    int v7 = (void *)MEMORY[0x263F8EE80];
LABEL_48:
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return (uint64_t)v7;
  }
  int v7 = (void *)MEMORY[0x263F8EE80];
  while (1)
  {
    sub_21F0A52C0(&v59, &v57);
    sub_21F09F5EC((uint64_t)&v57, (uint64_t)v55);
    if (swift_dynamicCast()) {
      break;
    }
LABEL_4:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v57);
    sub_21F0C8E88();
    if (!v60) {
      goto LABEL_48;
    }
  }
  long long v51 = v53;
  __swift_project_boxed_opaque_existential_1(&v57, v58);
  id v8 = objc_msgSend(v1, sel_objectForKey_, sub_21F0C95C8());
  swift_unknownObjectRelease();
  if (v8)
  {
    sub_21F0C9328();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v53 = 0u;
    long long v54 = 0u;
  }
  sub_21F0A52D0((uint64_t)&v53, (uint64_t)v55);
  if (v56)
  {
    if (swift_dynamicCast())
    {
      id v9 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithDouble_, v52);
      if (v9)
      {
        id v49 = v9;
        id v10 = v1;
        uint64_t v50 = v2;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v55[0] = v7;
        unint64_t v13 = sub_21F0C43B4(v51, *((uint64_t *)&v51 + 1));
        uint64_t v14 = v7[2];
        BOOL v15 = (v12 & 1) == 0;
        uint64_t v16 = v14 + v15;
        if (__OFADD__(v14, v15)) {
          goto LABEL_50;
        }
        char v17 = v12;
        if (v7[3] >= v16)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
            sub_21F0BC7C0();
          }
        }
        else
        {
          sub_21F0BB9E0(v16, isUniquelyReferenced_nonNull_native);
          unint64_t v18 = sub_21F0C43B4(v51, *((uint64_t *)&v51 + 1));
          if ((v17 & 1) != (v19 & 1)) {
            goto LABEL_53;
          }
          unint64_t v13 = v18;
        }
        unint64_t v1 = v10;
        int v7 = (void *)v55[0];
        if (v17)
        {
          uint64_t v37 = *(void *)(v55[0] + 56);

          *(void *)(v37 + 8 * v13) = v49;
          uint64_t v2 = v50;
        }
        else
        {
          *(void *)(v55[0] + 8 * (v13 >> 6) + 64) |= 1 << v13;
          int64_t v38 = (void *)(v7[6] + 16 * v13);
          uint64_t v39 = *((void *)&v51 + 1);
          *int64_t v38 = v51;
          v38[1] = v39;
          *(void *)(v7[7] + 8 * v13) = v49;
          uint64_t v40 = v7[2];
          BOOL v41 = __OFADD__(v40, 1);
          uint64_t v42 = v40 + 1;
          if (v41) {
            goto LABEL_52;
          }
          v7[2] = v42;
          swift_bridgeObjectRetain();
          uint64_t v2 = v50;
        }
        goto LABEL_46;
      }
      swift_bridgeObjectRetain();
      unint64_t v31 = sub_21F0C43B4(v51, *((uint64_t *)&v51 + 1));
      char v33 = v32;
      swift_bridgeObjectRelease();
      if (v33)
      {
        char v34 = swift_isUniquelyReferenced_nonNull_native();
        v55[0] = v7;
        if ((v34 & 1) == 0)
        {
          sub_21F0BC7C0();
          int v7 = (void *)v55[0];
        }
        swift_bridgeObjectRelease();
        unint64_t v35 = *(void **)(v7[7] + 8 * v31);
        sub_21F0A4700(v31, (uint64_t)v7);

        swift_bridgeObjectRelease();
      }
      goto LABEL_28;
    }
  }
  else
  {
    sub_21F09543C((uint64_t)v55, (uint64_t *)&unk_267EBB200);
  }
  __swift_project_boxed_opaque_existential_1(&v57, v58);
  id v20 = objc_msgSend(v1, sel_objectForKey_, sub_21F0C95C8());
  swift_unknownObjectRelease();
  if (v20)
  {
    sub_21F0C9328();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v53 = 0u;
    long long v54 = 0u;
  }
  sub_21F0A52D0((uint64_t)&v53, (uint64_t)v55);
  if (!v56)
  {
    swift_bridgeObjectRelease();
    sub_21F09543C((uint64_t)v55, (uint64_t *)&unk_267EBB200);
    goto LABEL_4;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_28:
    swift_bridgeObjectRelease();
    goto LABEL_4;
  }
  id v49 = v1;
  uint64_t v50 = v2;
  uint64_t v21 = sub_21F0C9188();
  char v22 = swift_isUniquelyReferenced_nonNull_native();
  v55[0] = v7;
  unint64_t v24 = sub_21F0C43B4(v51, *((uint64_t *)&v51 + 1));
  uint64_t v25 = v7[2];
  BOOL v26 = (v23 & 1) == 0;
  uint64_t v27 = v25 + v26;
  if (!__OFADD__(v25, v26))
  {
    char v28 = v23;
    if (v7[3] >= v27)
    {
      if (v22)
      {
        int v7 = (void *)v55[0];
        if ((v23 & 1) == 0) {
          goto LABEL_44;
        }
      }
      else
      {
        sub_21F0BC7C0();
        int v7 = (void *)v55[0];
        if ((v28 & 1) == 0) {
          goto LABEL_44;
        }
      }
    }
    else
    {
      sub_21F0BB9E0(v27, v22);
      unint64_t v29 = sub_21F0C43B4(v51, *((uint64_t *)&v51 + 1));
      if ((v28 & 1) != (v30 & 1)) {
        goto LABEL_53;
      }
      unint64_t v24 = v29;
      int v7 = (void *)v55[0];
      if ((v28 & 1) == 0)
      {
LABEL_44:
        v7[(v24 >> 6) + 8] |= 1 << v24;
        CFAllocatorRef v43 = (void *)(v7[6] + 16 * v24);
        uint64_t v44 = *((void *)&v51 + 1);
        void *v43 = v51;
        v43[1] = v44;
        *(void *)(v7[7] + 8 * v24) = v21;
        uint64_t v45 = v7[2];
        BOOL v41 = __OFADD__(v45, 1);
        uint64_t v46 = v45 + 1;
        if (v41) {
          goto LABEL_51;
        }
        v7[2] = v46;
        swift_bridgeObjectRetain();
        uint64_t v2 = v50;
        unint64_t v1 = v49;
        goto LABEL_46;
      }
    }
    uint64_t v36 = v7[7];

    *(void *)(v36 + 8 * v24) = v21;
    uint64_t v2 = v50;
    unint64_t v1 = v49;
LABEL_46:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_4;
  }
  __break(1u);
LABEL_50:
  __break(1u);
LABEL_51:
  __break(1u);
LABEL_52:
  __break(1u);
LABEL_53:
  uint64_t result = sub_21F0C9608();
  __break(1u);
  return result;
}

uint64_t sub_21F0A4300(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267EBB070);
    uint64_t v2 = sub_21F0C94B8();
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE80];
  }
  uint64_t v26 = a1 + 64;
  uint64_t v3 = 1 << *(unsigned char *)(a1 + 32);
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v27 = (unint64_t)(v3 + 63) >> 6;
  uint64_t v6 = v2 + 64;
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v8 << 6);
      goto LABEL_26;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v13 >= v27) {
      goto LABEL_35;
    }
    unint64_t v14 = *(void *)(v26 + 8 * v13);
    ++v8;
    if (!v14)
    {
      int64_t v8 = v13 + 1;
      if (v13 + 1 >= v27) {
        goto LABEL_35;
      }
      unint64_t v14 = *(void *)(v26 + 8 * v8);
      if (!v14)
      {
        int64_t v8 = v13 + 2;
        if (v13 + 2 >= v27) {
          goto LABEL_35;
        }
        unint64_t v14 = *(void *)(v26 + 8 * v8);
        if (!v14) {
          break;
        }
      }
    }
LABEL_25:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v8 << 6);
LABEL_26:
    uint64_t v16 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v18 = *v16;
    uint64_t v17 = v16[1];
    sub_21F09F5EC(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v39);
    *(void *)&long long v38 = v18;
    *((void *)&v38 + 1) = v17;
    v36[2] = v38;
    v37[0] = v39[0];
    v37[1] = v39[1];
    *(void *)&v36[0] = v18;
    *((void *)&v36[0] + 1) = v17;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_21F0A52C0(v37, v31);
    long long v32 = v28;
    long long v33 = v29;
    uint64_t v34 = v30;
    sub_21F0A52C0(v31, v35);
    long long v28 = v32;
    long long v29 = v33;
    uint64_t v30 = v34;
    sub_21F0A52C0(v35, v36);
    sub_21F0A52C0(v36, &v32);
    uint64_t result = sub_21F0C9358();
    uint64_t v19 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v6 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v20) & ~*(void *)(v6 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v24 = v21 == v23;
        if (v21 == v23) {
          unint64_t v21 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v6 + 8 * v21);
      }
      while (v25 == -1);
      unint64_t v9 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    uint64_t v10 = *(void *)(v2 + 48) + 40 * v9;
    *(_OWORD *)uint64_t v10 = v28;
    *(_OWORD *)(v10 + 16) = v29;
    *(void *)(v10 + 32) = v30;
    uint64_t result = (uint64_t)sub_21F0A52C0(&v32, (_OWORD *)(*(void *)(v2 + 56) + 32 * v9));
    ++*(void *)(v2 + 16);
  }
  int64_t v15 = v13 + 3;
  if (v15 >= v27)
  {
LABEL_35:
    swift_release();
    swift_release();
    return v2;
  }
  unint64_t v14 = *(void *)(v26 + 8 * v15);
  if (v14)
  {
    int64_t v8 = v15;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v8 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v8 >= v27) {
      goto LABEL_35;
    }
    unint64_t v14 = *(void *)(v26 + 8 * v8);
    ++v15;
    if (v14) {
      goto LABEL_25;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_21F0A4684()
{
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 80, 7);
}

void sub_21F0A46DC()
{
  sub_21F0A0A6C(v0[2], v0[3], v0[4], v0[5], v0[6], v0[7], v0[8], v0[9]);
}

uint64_t sub_21F0A46F0(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

unint64_t sub_21F0A4700(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_21F0C9348();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_21F0C9628();
        swift_bridgeObjectRetain();
        sub_21F0C90B8();
        uint64_t v9 = sub_21F0C9648();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          unint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          int64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            _OWORD *v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          int64_t v15 = (void *)(v14 + 8 * v3);
          uint64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            void *v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  uint64_t *v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_21F0A48D8(char a1)
{
  uint64_t v2 = sub_21F0C8FD8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_21F0C8FF8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t result = MEMORY[0x270FA5388](v6);
  unint64_t v10 = (char *)aBlock - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 1) == 0)
  {
    sub_21F0A5404(0, &qword_267EBB080);
    uint64_t v11 = (void *)sub_21F0C9268();
    aBlock[4] = sub_21F0A1FA0;
    aBlock[5] = 0;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_21F0A2040;
    aBlock[3] = &block_descriptor_1;
    unint64_t v12 = _Block_copy(aBlock);
    sub_21F0C8FE8();
    aBlock[0] = MEMORY[0x263F8EE78];
    sub_21F0A5350();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267EBB090);
    sub_21F0A53A8();
    sub_21F0C9338();
    MEMORY[0x223C42230](0, v10, v5, v12);
    _Block_release(v12);

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  return result;
}

id sub_21F0A4B40(void *a1)
{
  id v2 = objc_msgSend(a1, sel_gestureToDetect);
  if (v2)
  {
    uint64_t v3 = v2;
    unint64_t v4 = (unint64_t)objc_msgSend(v2, sel_integerValue);
  }
  else
  {
    unint64_t v4 = 10;
  }
  unint64_t v5 = sub_21F0B1CB4(v4);
  char v7 = v6;
  id v8 = objc_msgSend(a1, sel_faces);
  sub_21F0A5404(0, &qword_267EBB0A0);
  unint64_t v9 = sub_21F0C9128();

  if (v9 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_21F0C9488();
    swift_bridgeObjectRelease();
    if (v10) {
      goto LABEL_6;
    }
LABEL_14:
    swift_bridgeObjectRelease();
    uint64_t v36 = MEMORY[0x263F8EE78];
    goto LABEL_15;
  }
  uint64_t v10 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v10) {
    goto LABEL_14;
  }
LABEL_6:
  uint64_t v48 = MEMORY[0x263F8EE78];
  id result = (id)sub_21F0C9428();
  if (v10 < 0)
  {
    __break(1u);
    return result;
  }
  char v46 = v7;
  uint64_t v12 = 0;
  do
  {
    if ((v9 & 0xC000000000000001) != 0) {
      id v13 = (id)MEMORY[0x223C42390](v12, v9);
    }
    else {
      id v13 = *(id *)(v9 + 8 * v12 + 32);
    }
    uint64_t v14 = v13;
    ++v12;
    objc_msgSend(v13, sel_bounds);
    uint64_t v16 = v15;
    uint64_t v18 = v17;
    uint64_t v20 = v19;
    uint64_t v22 = v21;
    id v23 = objc_msgSend(v14, sel_facePose);
    objc_msgSend(v23, sel_pitch);
    float v25 = v24;
    [v23 yaw];
    float v27 = v26;
    objc_msgSend(v23, sel_roll);
    float v29 = v28;
    uint64_t v30 = (objc_class *)type metadata accessor for PADSWPose();
    unint64_t v31 = (char *)objc_allocWithZone(v30);
    *(double *)&v31[OBJC_IVAR____TtC10CoreIDVPAD9PADSWPose_pitch] = v25;
    *(double *)&v31[OBJC_IVAR____TtC10CoreIDVPAD9PADSWPose_yaw] = v27;
    *(double *)&v31[OBJC_IVAR____TtC10CoreIDVPAD9PADSWPose_roll] = v29;
    v52.receiver = v31;
    v52.super_class = v30;
    id v32 = objc_msgSendSuper2(&v52, sel_init);

    long long v33 = (objc_class *)type metadata accessor for PADSWFace();
    uint64_t v34 = (char *)objc_allocWithZone(v33);
    unint64_t v35 = &v34[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds];
    *(void *)unint64_t v35 = v16;
    *((void *)v35 + 1) = v18;
    *((void *)v35 + 2) = v20;
    *((void *)v35 + 3) = v22;
    *(void *)&v34[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_pose] = v32;
    v51.receiver = v34;
    v51.super_class = v33;
    objc_msgSendSuper2(&v51, sel_init);

    sub_21F0C9408();
    sub_21F0C9438();
    sub_21F0C9448();
    sub_21F0C9418();
  }
  while (v10 != v12);
  uint64_t v36 = v48;
  swift_bridgeObjectRelease();
  char v7 = v46;
LABEL_15:
  if (v7) {
    uint64_t v37 = 10;
  }
  else {
    uint64_t v37 = v5;
  }
  objc_msgSend(a1, sel_time);
  uint64_t v38 = v48;
  uint64_t v39 = v50;
  uint64_t v40 = v49;
  id v41 = objc_msgSend(a1, sel_buffer);
  unsigned int v42 = objc_msgSend(a1, sel_orientation);
  CFAllocatorRef v43 = (objc_class *)type metadata accessor for PADSWFrame();
  uint64_t v44 = (char *)objc_allocWithZone(v43);
  uint64_t v45 = &v44[OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_time];
  *(void *)uint64_t v45 = v38;
  *((void *)v45 + 1) = v40;
  *((void *)v45 + 2) = v39;
  *(void *)&v44[OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_buffer] = v41;
  *(void *)&v44[OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_faces] = v36;
  *(void *)&v44[OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_gesture] = v37;
  *(_DWORD *)&v44[OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_orientation] = v42;
  v47.receiver = v44;
  v47.super_class = v43;
  return objc_msgSendSuper2(&v47, sel_init);
}

uint64_t sub_21F0A4F3C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_21F0A4F74()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t method lookup function for PADInternalClassifier(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PADInternalClassifier);
}

uint64_t dispatch thunk of PADInternalClassifier.startLiveness(_:onGestureStart:onIncorrectGestureDetected:onGesturesFinished:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x138))();
}

uint64_t dispatch thunk of PADInternalClassifier.processLivenessFrame(_:withOptions:taOptions:)(uint64_t a1, int a2)
{
  return (*(uint64_t (**)(uint64_t, void))((*MEMORY[0x263F8EED0] & *v2) + 0x148))(a1, a2 & 0x10101);
}

uint64_t dispatch thunk of PADInternalClassifier.skipLivenessGesture()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x150))();
}

uint64_t dispatch thunk of PADInternalClassifier.enableAccessibilityOptions()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x158))();
}

uint64_t dispatch thunk of PADInternalClassifier.restartLivenessGesture()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of PADInternalClassifier.pauseLiveness()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x168))();
}

uint64_t dispatch thunk of PADInternalClassifier.prepareToResumeLiveness()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x170))();
}

uint64_t dispatch thunk of PADInternalClassifier.resumeLiveness()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x178))();
}

uint64_t dispatch thunk of PADInternalClassifier.finishLivenessWithSelfie(_:performIDMatching:completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x180))();
}

uint64_t dispatch thunk of PADInternalClassifier.finishLivenessStepUp(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x188))();
}

uint64_t dispatch thunk of PADInternalClassifier.cancelWithCompletion(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x190))();
}

uint64_t sub_21F0A5254()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_21F0A528C()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

void sub_21F0A529C(uint64_t a1, uint64_t a2)
{
  sub_21F0A197C(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_21F0A52A4()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

void sub_21F0A52B8(uint64_t a1)
{
  sub_21F0A0DEC(a1, *(void *)(v1 + 16));
}

_OWORD *sub_21F0A52C0(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_21F0A52D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267EBB200);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

unint64_t sub_21F0A5350()
{
  unint64_t result = qword_267EBB088;
  if (!qword_267EBB088)
  {
    sub_21F0C8FD8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EBB088);
  }
  return result;
}

unint64_t sub_21F0A53A8()
{
  unint64_t result = qword_267EBB098;
  if (!qword_267EBB098)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EBB090);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EBB098);
  }
  return result;
}

uint64_t sub_21F0A5404(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_21F0A5440(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_21F0A54A4(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_21F0A54D0()
{
  v1[4] = v0;
  uint64_t v2 = sub_21F0C8F08();
  v1[5] = v2;
  v1[6] = *(void *)(v2 - 8);
  v1[7] = swift_task_alloc();
  uint64_t v3 = sub_21F0C8FC8();
  v1[8] = v3;
  v1[9] = *(void *)(v3 - 8);
  v1[10] = swift_task_alloc();
  v1[11] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_21F0A55FC, 0, 0);
}

uint64_t sub_21F0A55FC()
{
  uint64_t v1 = v0[4];
  *(void *)(v1 + 16) = 0;
  *(void *)(v1 + 24) = 0;
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F00D98]), sel_init);
  v0[12] = v2;
  uint64_t v3 = 2;
  if (sub_21F0A62AC(2))
  {
    if (qword_267EBAB80 != -1) {
      swift_once();
    }
    uint64_t v4 = v0[11];
    uint64_t v5 = v0[8];
    uint64_t v6 = v0[9];
    uint64_t v7 = __swift_project_value_buffer(v5, (uint64_t)qword_267EBAB88);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v4, v7, v5);
    id v8 = sub_21F0C8FA8();
    os_log_type_t v9 = sub_21F0C9228();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_21F07C000, v8, v9, "Processing models with CPU only", v10, 2u);
      MEMORY[0x223C43270](v10, -1, -1);
    }
    uint64_t v11 = v0[11];
    uint64_t v12 = v0[8];
    uint64_t v13 = v0[9];

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
    uint64_t v3 = 0;
  }
  uint64_t v14 = v0[7];
  objc_msgSend(v2, sel_setComputeUnits_, v3);
  v0[13] = type metadata accessor for PADFacePoseModel();
  sub_21F0C7BE8(v14);
  sub_21F0A626C();
  uint64_t v15 = (void *)swift_task_alloc();
  v0[14] = v15;
  void *v15 = v0;
  v15[1] = sub_21F0A5810;
  uint64_t v16 = v0[7];
  return MEMORY[0x270EE7958](v16, v2);
}

uint64_t sub_21F0A5810(uint64_t a1)
{
  uint64_t v4 = *(void **)v2;
  *(void *)(*(void *)v2 + 120) = v1;
  swift_task_dealloc();
  if (v1)
  {
    (*(void (**)(void, void))(v4[6] + 8))(v4[7], v4[5]);
    uint64_t v5 = sub_21F0A5B88;
  }
  else
  {
    v4[16] = a1;
    uint64_t v5 = sub_21F0A594C;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_21F0A594C()
{
  uint64_t v1 = v0[16];
  uint64_t v2 = (void *)v0[12];
  uint64_t v4 = v0[6];
  uint64_t v3 = v0[7];
  uint64_t v6 = v0[4];
  uint64_t v5 = v0[5];
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v1;
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  *(void *)(v6 + 16) = v7;
  swift_release();
  type metadata accessor for PADPrintReplayModelManager();
  swift_allocObject();
  id v8 = v2;
  os_log_type_t v9 = (void *)swift_task_alloc();
  v0[17] = v9;
  void *v9 = v0;
  v9[1] = sub_21F0A5A60;
  uint64_t v10 = v0[12];
  return sub_21F0AB5F8(v10);
}

uint64_t sub_21F0A5A60(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 144) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = sub_21F0A5C24;
  }
  else
  {
    *(void *)(v4 + 152) = a1;
    uint64_t v5 = sub_21F0A5CC0;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_21F0A5B88()
{
  uint64_t v1 = *(void **)(v0 + 96);
  swift_release();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_21F0A5C24()
{
  uint64_t v1 = *(void **)(v0 + 96);
  swift_release();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_21F0A5CC0()
{
  uint64_t v30 = v0;
  *(void *)(*(void *)(v0 + 32) + 24) = *(void *)(v0 + 152);
  swift_release();
  if (qword_267EBAB80 != -1) {
    swift_once();
  }
  uint64_t v2 = *(void *)(v0 + 72);
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v3 = *(void *)(v0 + 64);
  uint64_t v4 = __swift_project_value_buffer(v3, (uint64_t)qword_267EBAB88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  swift_retain_n();
  uint64_t v5 = sub_21F0C8FA8();
  os_log_type_t v6 = sub_21F0C9228();
  if (os_log_type_enabled(v5, v6))
  {
    os_log_type_t v26 = v6;
    uint64_t v7 = *(void *)(v0 + 32);
    uint64_t v8 = swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v29 = v9;
    *(_DWORD *)uint64_t v8 = 136315394;
    uint64_t v10 = sub_21F0A5FFC();
    if (v11)
    {
      unint64_t v12 = v11;
    }
    else
    {
      uint64_t v10 = 0;
      unint64_t v12 = 0xE000000000000000;
    }
    *(void *)(v0 + 16) = sub_21F09D6AC(v10, v12, &v29);
    sub_21F0C9308();
    swift_bridgeObjectRelease();
    swift_release_n();
    *(_WORD *)(v8 + 12) = 2080;
    uint64_t v28 = v9;
    if (!*(void *)(v7 + 24) || (swift_retain(), uint64_t v13 = sub_21F0AB4B4(), v15 = v14, swift_release(), !v15))
    {
      swift_bridgeObjectRelease();
      uint64_t v13 = 0;
      unint64_t v15 = 0xE000000000000000;
    }
    os_log_type_t v16 = v26;
    uint64_t v17 = *(void *)(v0 + 72);
    uint64_t v27 = *(void *)(v0 + 80);
    double v24 = *(void **)(v0 + 96);
    uint64_t v25 = *(void *)(v0 + 64);
    *(void *)(v0 + 24) = sub_21F09D6AC(v13, v15, &v29);
    sub_21F0C9308();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_21F07C000, v5, v16, "Successfully loaded FacePose v%s, PrintReplay v%s", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x223C43270](v28, -1, -1);
    MEMORY[0x223C43270](v8, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v27, v25);
  }
  else
  {
    uint64_t v19 = *(void *)(v0 + 72);
    uint64_t v18 = *(void *)(v0 + 80);
    uint64_t v20 = *(void *)(v0 + 64);

    swift_release_n();
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v20);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v21 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v22 = *(void *)(v0 + 32);
  return v21(v22);
}

uint64_t sub_21F0A5FFC()
{
  uint64_t v1 = *(void *)(v0 + 16);
  if (!v1)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    goto LABEL_13;
  }
  id v2 = objc_msgSend(*(id *)(v1 + 16), sel_modelDescription);
  id v3 = objc_msgSend(v2, sel_metadata);

  type metadata accessor for MLModelMetadataKey(0);
  sub_21F0A61B4();
  uint64_t v4 = sub_21F0C9038();

  if (!*(void *)(v4 + 16))
  {
    long long v10 = 0u;
    long long v11 = 0u;
LABEL_12:
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  id v5 = (id)*MEMORY[0x263F00D08];
  uint64_t v6 = sub_21F0C4470();
  if ((v7 & 1) == 0)
  {
    long long v10 = 0u;
    long long v11 = 0u;

    goto LABEL_12;
  }
  sub_21F09F5EC(*(void *)(v4 + 56) + 32 * v6, (uint64_t)&v10);

  swift_bridgeObjectRelease();
  if (!*((void *)&v11 + 1))
  {
LABEL_13:
    sub_21F0A620C((uint64_t)&v10);
    return 0;
  }
  if (swift_dynamicCast()) {
    return v9;
  }
  else {
    return 0;
  }
}

uint64_t sub_21F0A6150()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t type metadata accessor for PADModelManager()
{
  return self;
}

unint64_t sub_21F0A61B4()
{
  unint64_t result = qword_267EBACD0;
  if (!qword_267EBACD0)
  {
    type metadata accessor for MLModelMetadataKey(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EBACD0);
  }
  return result;
}

uint64_t sub_21F0A620C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267EBB200);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_21F0A626C()
{
  unint64_t result = qword_267EBB0B0;
  if (!qword_267EBB0B0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267EBB0B0);
  }
  return result;
}

uint64_t sub_21F0A62AC(char a1)
{
  uint64_t result = os_variant_has_internal_content();
  if (result)
  {
    id v3 = objc_msgSend(self, sel_standardUserDefaults);
    id v4 = objc_msgSend(v3, sel_persistentDomainForName_, *MEMORY[0x263F08100]);

    if (v4 && (uint64_t v5 = sub_21F0C9038(), v4, v5))
    {
      uint64_t v6 = 0xD00000000000001CLL;
      unint64_t v7 = 0x800000021F0CEB40;
      switch(a1)
      {
        case 1:
          uint64_t v6 = 0xD00000000000001BLL;
          uint64_t v8 = "CIDVPAD.use-verbose-logging";
          goto LABEL_11;
        case 2:
          unint64_t v7 = 0x800000021F0CEB00;
          uint64_t v6 = 0xD000000000000018;
          goto LABEL_8;
        case 3:
          uint64_t v6 = 0xD00000000000001DLL;
          uint64_t v8 = "CIDVPAD.show-padframe-logging";
LABEL_11:
          unint64_t v7 = (unint64_t)(v8 - 32) | 0x8000000000000000;
          if (*(void *)(v5 + 16)) {
            goto LABEL_12;
          }
          goto LABEL_16;
        default:
LABEL_8:
          if (!*(void *)(v5 + 16)) {
            goto LABEL_16;
          }
LABEL_12:
          unint64_t v9 = sub_21F0C43B4(v6, v7);
          if ((v10 & 1) == 0)
          {
LABEL_16:
            long long v12 = 0u;
            long long v13 = 0u;
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            goto LABEL_17;
          }
          sub_21F09F5EC(*(void *)(v5 + 56) + 32 * v9, (uint64_t)&v12);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (!*((void *)&v13 + 1)) {
            goto LABEL_17;
          }
          uint64_t result = swift_dynamicCast();
          if (result) {
            uint64_t result = v11;
          }
          break;
      }
    }
    else
    {
      long long v12 = 0u;
      long long v13 = 0u;
LABEL_17:
      sub_21F0A620C((uint64_t)&v12);
      return 0;
    }
  }
  return result;
}

uint64_t sub_21F0A6498()
{
  return 0;
}

uint64_t sub_21F0A64A0()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t sub_21F0A64D8()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 120))();
}

uint64_t sub_21F0A651C()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 128))();
}

uint64_t sub_21F0A6560(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_21F0C9488();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v3 = MEMORY[0x263F8EE78];
  if (!v2) {
    return v3;
  }
  uint64_t v13 = MEMORY[0x263F8EE78];
  uint64_t result = sub_21F0C3A30(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        MEMORY[0x223C42390](i, a1);
        sub_21F0A687C();
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_21F0C3A30(0, *(void *)(v3 + 16) + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v7 = *(void *)(v3 + 16);
        unint64_t v6 = *(void *)(v3 + 24);
        if (v7 >= v6 >> 1)
        {
          sub_21F0C3A30(v6 > 1, v7 + 1, 1);
          uint64_t v3 = v13;
        }
        *(void *)(v3 + 16) = v7 + 1;
        sub_21F0A52C0(v12, (_OWORD *)(v3 + 32 * v7 + 32));
      }
    }
    else
    {
      uint64_t v8 = (id *)(a1 + 32);
      sub_21F0A687C();
      do
      {
        id v9 = *v8;
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_21F0C3A30(0, *(void *)(v3 + 16) + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v11 = *(void *)(v3 + 16);
        unint64_t v10 = *(void *)(v3 + 24);
        if (v11 >= v10 >> 1)
        {
          sub_21F0C3A30(v10 > 1, v11 + 1, 1);
          uint64_t v3 = v13;
        }
        *(void *)(v3 + 16) = v11 + 1;
        sub_21F0A52C0(v12, (_OWORD *)(v3 + 32 * v11 + 32));
        ++v8;
        --v2;
      }
      while (v2);
    }
    return v3;
  }
  __break(1u);
  return result;
}

id sub_21F0A6794()
{
  id v1 = objc_msgSend(*v0, sel_results);
  if (v1)
  {
    sub_21F0A687C();
    unint64_t v2 = sub_21F0C9128();

    id v1 = (id)sub_21F0A6560(v2);
    swift_bridgeObjectRelease();
  }
  return v1;
}

uint64_t sub_21F0A6804()
{
  return swift_willThrow();
}

uint64_t type metadata accessor for PADModelRequest()
{
  return self;
}

unint64_t sub_21F0A687C()
{
  unint64_t result = qword_267EBB0B8;
  if (!qword_267EBB0B8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267EBB0B8);
  }
  return result;
}

__n128 __swift_memcpy208_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  long long v2 = *(_OWORD *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  long long v5 = *(_OWORD *)(a2 + 80);
  long long v6 = *(_OWORD *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v7;
  *(_OWORD *)(a1 + 8sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = v5;
  *(_OWORD *)(a1 + 96) = v6;
  __n128 result = *(__n128 *)(a2 + 144);
  long long v9 = *(_OWORD *)(a2 + 160);
  long long v10 = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 176) = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 192) = v10;
  *(__n128 *)(a1 + 144) = result;
  *(_OWORD *)(a1 + 16sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = v9;
  return result;
}

uint64_t getEnumTagSinglePayload for PADModelConfiguration(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 208)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for PADModelConfiguration(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 20sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = 0;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 12sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 4sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 208) = v3;
  return result;
}

ValueMetadata *type metadata accessor for PADModelConfiguration()
{
  return &type metadata for PADModelConfiguration;
}

uint64_t sub_21F0A6988(uint64_t a1)
{
  uint64_t v2 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v3 = -1;
  if (v2 < 64) {
    uint64_t v3 = ~(-1 << v2);
  }
  unint64_t v4 = v3 & *(void *)(a1 + 64);
  int64_t v25 = (unint64_t)(v2 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v6 = 0;
  long long v7 = (void *)MEMORY[0x263F8EE78];
  if (v4) {
    goto LABEL_31;
  }
LABEL_6:
  int64_t v8 = v6 + 1;
  if (!__OFADD__(v6, 1))
  {
    if (v8 < v25)
    {
      unint64_t v9 = *(void *)(v24 + 8 * v8);
      ++v6;
      if (v9) {
        goto LABEL_21;
      }
      int64_t v6 = v8 + 1;
      if (v8 + 1 >= v25) {
        goto LABEL_32;
      }
      unint64_t v9 = *(void *)(v24 + 8 * v6);
      if (v9) {
        goto LABEL_21;
      }
      int64_t v6 = v8 + 2;
      if (v8 + 2 >= v25) {
        goto LABEL_32;
      }
      unint64_t v9 = *(void *)(v24 + 8 * v6);
      if (v9) {
        goto LABEL_21;
      }
      int64_t v6 = v8 + 3;
      if (v8 + 3 >= v25) {
        goto LABEL_32;
      }
      unint64_t v9 = *(void *)(v24 + 8 * v6);
      if (v9)
      {
LABEL_21:
        unint64_t v4 = (v9 - 1) & v9;
        for (unint64_t i = __clz(__rbit64(v9)) + (v6 << 6); ; unint64_t i = v23 | (v6 << 6))
        {
          long long v12 = (uint64_t *)(*(void *)(a1 + 48) + 16 * i);
          uint64_t v13 = *v12;
          uint64_t v14 = v12[1];
          sub_21F09F5EC(*(void *)(a1 + 56) + 32 * i, (uint64_t)v31);
          *(void *)&long long v30 = v13;
          *((void *)&v30 + 1) = v14;
          long long v28 = v30;
          v29[0] = v31[0];
          v29[1] = v31[1];
          long long v15 = v30;
          sub_21F09F5EC((uint64_t)v29, (uint64_t)v27);
          swift_bridgeObjectRetain();
          if (swift_dynamicCast())
          {
            id v16 = objc_allocWithZone(NSNumber);
            swift_bridgeObjectRetain();
            id v17 = objc_msgSend(v16, sel_initWithInteger_, *(void *)&v26);
          }
          else
          {
            sub_21F09F5EC((uint64_t)v29, (uint64_t)v27);
            if (!swift_dynamicCast())
            {
              uint64_t result = sub_21F09543C((uint64_t)&v28, &qword_267EBB0F8);
              if (!v4) {
                goto LABEL_6;
              }
              goto LABEL_31;
            }
            id v18 = objc_allocWithZone(NSNumber);
            swift_bridgeObjectRetain();
            id v17 = objc_msgSend(v18, sel_initWithDouble_, v26);
          }
          id v19 = v17;
          sub_21F09543C((uint64_t)&v28, &qword_267EBB0F8);
          uint64_t result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            uint64_t result = (uint64_t)sub_21F09C924(0, v7[2] + 1, 1, v7);
            long long v7 = (void *)result;
          }
          unint64_t v21 = v7[2];
          unint64_t v20 = v7[3];
          if (v21 >= v20 >> 1)
          {
            uint64_t result = (uint64_t)sub_21F09C924((void *)(v20 > 1), v21 + 1, 1, v7);
            long long v7 = (void *)result;
          }
          v7[2] = v21 + 1;
          uint64_t v22 = &v7[3 * v21];
          *((_OWORD *)v22 + 2) = v15;
          v22[6] = v19;
          if (!v4) {
            goto LABEL_6;
          }
LABEL_31:
          unint64_t v23 = __clz(__rbit64(v4));
          v4 &= v4 - 1;
        }
      }
      int64_t v10 = v8 + 4;
      if (v10 < v25)
      {
        unint64_t v9 = *(void *)(v24 + 8 * v10);
        if (v9)
        {
          int64_t v6 = v10;
          goto LABEL_21;
        }
        while (1)
        {
          int64_t v6 = v10 + 1;
          if (__OFADD__(v10, 1)) {
            goto LABEL_34;
          }
          if (v6 >= v25) {
            break;
          }
          unint64_t v9 = *(void *)(v24 + 8 * v6);
          ++v10;
          if (v9) {
            goto LABEL_21;
          }
        }
      }
    }
LABEL_32:
    swift_release();
    return (uint64_t)v7;
  }
  __break(1u);
LABEL_34:
  __break(1u);
  return result;
}

unint64_t sub_21F0A6CF0()
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  sub_21F0C8DF8();
  swift_allocObject();
  sub_21F0C8DE8();
  long long v1 = v0[11];
  v21[10] = v0[10];
  v21[11] = v1;
  v21[12] = v0[12];
  long long v2 = v0[7];
  v21[6] = v0[6];
  v21[7] = v2;
  long long v3 = v0[9];
  v21[8] = v0[8];
  v21[9] = v3;
  long long v4 = v0[3];
  v21[2] = v0[2];
  v21[3] = v4;
  long long v5 = v0[5];
  v21[4] = v0[4];
  v21[5] = v5;
  long long v6 = v0[1];
  v21[0] = *v0;
  v21[1] = v6;
  sub_21F0A9434();
  uint64_t v7 = sub_21F0C8DD8();
  unint64_t v9 = v8;
  swift_release();
  unint64_t v11 = self;
  long long v12 = (void *)sub_21F0C8F38();
  *(void *)&v21[0] = 0;
  id v13 = objc_msgSend(v11, sel_JSONObjectWithData_options_error_, v12, 0, v21);

  if (!v13)
  {
    id v17 = *(id *)&v21[0];
    id v18 = (void *)sub_21F0C8E78();

    swift_willThrow();
    sub_21F09E288(v7, v9);

    return sub_21F0BB2D0(MEMORY[0x263F8EE78]);
  }
  id v14 = *(id *)&v21[0];
  sub_21F0C9328();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EBB0E0);
  if ((swift_dynamicCast() & 1) == 0)
  {
    sub_21F09E288(v7, v9);
    return sub_21F0BB2D0(MEMORY[0x263F8EE78]);
  }
  uint64_t v15 = sub_21F0A6988(v20);
  swift_bridgeObjectRelease();
  if (*(void *)(v15 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267EBB0E8);
    uint64_t v16 = sub_21F0C94B8();
  }
  else
  {
    uint64_t v16 = MEMORY[0x263F8EE80];
  }
  *(void *)&v21[0] = v16;
  id v19 = (void *)swift_bridgeObjectRetain();
  sub_21F0A7898(v19, 1, v21);
  swift_bridgeObjectRelease();
  sub_21F09E288(v7, v9);
  return *(void *)&v21[0];
}

uint64_t sub_21F0A6F74(char a1)
{
  uint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x736F507468676972;
      break;
    case 2:
      uint64_t result = 0x654465736F507075;
      break;
    case 3:
      unsigned int v3 = 1853321060;
      goto LABEL_6;
    case 4:
      uint64_t result = 0x52776F7262657965;
      break;
    case 5:
      uint64_t result = 0x7461526874756F6DLL;
      break;
    case 6:
      uint64_t result = 0x6F69746152657965;
      break;
    case 7:
    case 13:
    case 15:
      return result;
    case 8:
      uint64_t result = 0xD000000000000013;
      break;
    case 9:
    case 10:
      uint64_t result = 0x4146726566667562;
      break;
    case 11:
      uint64_t result = 0xD000000000000012;
      break;
    case 12:
      uint64_t result = 0x4154726566667562;
      break;
    case 14:
      uint64_t result = 0xD000000000000015;
      break;
    case 16:
      uint64_t result = 0xD000000000000015;
      break;
    case 17:
      uint64_t result = 0x7365726854636166;
      break;
    case 18:
      uint64_t result = 0x6873657268546174;
      break;
    case 19:
      uint64_t result = 0x6873657268546469;
      break;
    case 20:
      uint64_t result = 0xD000000000000019;
      break;
    case 21:
      uint64_t result = 0xD000000000000018;
      break;
    case 22:
      uint64_t result = 0xD00000000000001ALL;
      break;
    case 23:
      uint64_t result = 0xD00000000000001BLL;
      break;
    case 24:
      uint64_t result = 0xD000000000000014;
      break;
    case 25:
      uint64_t result = 0xD000000000000014;
      break;
    default:
      unsigned int v3 = 1952867692;
LABEL_6:
      uint64_t result = v3 | 0x65736F5000000000;
      break;
  }
  return result;
}

uint64_t sub_21F0A7240(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EBB0D0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  long long v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21F0A93E0();
  sub_21F0C9668();
  char v9 = 0;
  sub_21F0C9568();
  if (!v1)
  {
    char v9 = 1;
    sub_21F0C9568();
    char v9 = 2;
    sub_21F0C9568();
    char v9 = 3;
    sub_21F0C9568();
    char v9 = 4;
    sub_21F0C9568();
    char v9 = 5;
    sub_21F0C9568();
    char v9 = 6;
    sub_21F0C9568();
    char v9 = 7;
    sub_21F0C9588();
    char v9 = 8;
    sub_21F0C9588();
    char v9 = 9;
    sub_21F0C9588();
    char v9 = 10;
    sub_21F0C9588();
    char v9 = 11;
    sub_21F0C9568();
    char v9 = 12;
    sub_21F0C9588();
    char v9 = 13;
    sub_21F0C9568();
    char v9 = 14;
    sub_21F0C9568();
    char v9 = 15;
    sub_21F0C9568();
    char v9 = 16;
    sub_21F0C9568();
    char v9 = 17;
    sub_21F0C9568();
    char v9 = 18;
    sub_21F0C9588();
    char v9 = 19;
    sub_21F0C9568();
    char v9 = 20;
    sub_21F0C9568();
    char v9 = 21;
    sub_21F0C9568();
    char v9 = 22;
    sub_21F0C9568();
    char v9 = 23;
    sub_21F0C9568();
    char v9 = 24;
    sub_21F0C9588();
    char v9 = 25;
    sub_21F0C9588();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_21F0A7760()
{
  return sub_21F0A6F74(*v0);
}

uint64_t sub_21F0A7768@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_21F0A8418(a1, a2);
  *a3 = result;
  return result;
}

void sub_21F0A7790(unsigned char *a1@<X8>)
{
  *a1 = 26;
}

uint64_t sub_21F0A779C(uint64_t a1)
{
  unint64_t v2 = sub_21F0A93E0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_21F0A77D8(uint64_t a1)
{
  unint64_t v2 = sub_21F0A93E0();
  return MEMORY[0x270FA00B8](a1, v2);
}

__n128 sub_21F0A7814@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_21F0A8DD0(a1, v10);
  if (!v2)
  {
    long long v5 = v10[11];
    *(_OWORD *)(a2 + 16sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = v10[10];
    *(_OWORD *)(a2 + 176) = v5;
    *(_OWORD *)(a2 + 192) = v10[12];
    long long v6 = v10[7];
    *(_OWORD *)(a2 + 96) = v10[6];
    *(_OWORD *)(a2 + 112) = v6;
    long long v7 = v10[9];
    *(_OWORD *)(a2 + 128) = v10[8];
    *(_OWORD *)(a2 + 144) = v7;
    long long v8 = v10[3];
    *(_OWORD *)(a2 + 32) = v10[2];
    *(_OWORD *)(a2 + 48) = v8;
    long long v9 = v10[5];
    *(_OWORD *)(a2 + 64) = v10[4];
    *(_OWORD *)(a2 + 8sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = v9;
    __n128 result = (__n128)v10[1];
    *(_OWORD *)a2 = v10[0];
    *(__n128 *)(a2 + 16) = result;
  }
  return result;
}

uint64_t sub_21F0A7880(void *a1)
{
  return sub_21F0A7240(a1);
}

void sub_21F0A7898(void *a1, char a2, void *a3)
{
  if (!a1[2])
  {
    swift_bridgeObjectRelease();
    return;
  }
  uint64_t v43 = a1[2];
  uint64_t v7 = a1[4];
  uint64_t v6 = a1[5];
  long long v8 = (void *)a1[6];
  swift_bridgeObjectRetain();
  long long v9 = (void *)*a3;
  swift_bridgeObjectRetain();
  id v10 = v8;
  unint64_t v12 = sub_21F0C43B4(v7, v6);
  uint64_t v13 = v9[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14)) {
    goto LABEL_23;
  }
  char v16 = v11;
  if (v9[3] >= v15)
  {
    if (a2)
    {
      if (v11) {
        goto LABEL_10;
      }
    }
    else
    {
      sub_21F0BC7C0();
      if (v16) {
        goto LABEL_10;
      }
    }
LABEL_13:
    unint64_t v21 = (void *)*a3;
    *(void *)(*a3 + 8 * (v12 >> 6) + 64) |= 1 << v12;
    uint64_t v22 = (uint64_t *)(v21[6] + 16 * v12);
    uint64_t *v22 = v7;
    v22[1] = v6;
    *(void *)(v21[7] + 8 * v12) = v10;
    uint64_t v23 = v21[2];
    BOOL v24 = __OFADD__(v23, 1);
    uint64_t v25 = v23 + 1;
    if (v24)
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v21[2] = v25;
    uint64_t v26 = v43 - 1;
    if (v43 == 1)
    {
LABEL_22:
      swift_bridgeObjectRelease_n();
      return;
    }
    uint64_t v27 = (void **)(a1 + 9);
    while (1)
    {
      uint64_t v29 = (uint64_t)*(v27 - 2);
      uint64_t v28 = (uint64_t)*(v27 - 1);
      long long v30 = *v27;
      uint64_t v31 = (void *)*a3;
      swift_bridgeObjectRetain();
      id v10 = v30;
      unint64_t v32 = sub_21F0C43B4(v29, v28);
      uint64_t v34 = v31[2];
      BOOL v35 = (v33 & 1) == 0;
      BOOL v24 = __OFADD__(v34, v35);
      uint64_t v36 = v34 + v35;
      if (v24) {
        break;
      }
      char v37 = v33;
      if (v31[3] < v36)
      {
        sub_21F0BB9E0(v36, 1);
        unint64_t v32 = sub_21F0C43B4(v29, v28);
        if ((v37 & 1) != (v38 & 1)) {
          goto LABEL_25;
        }
      }
      if (v37) {
        goto LABEL_10;
      }
      uint64_t v39 = (void *)*a3;
      *(void *)(*a3 + 8 * (v32 >> 6) + 64) |= 1 << v32;
      uint64_t v40 = (uint64_t *)(v39[6] + 16 * v32);
      *uint64_t v40 = v29;
      v40[1] = v28;
      *(void *)(v39[7] + 8 * v32) = v10;
      uint64_t v41 = v39[2];
      BOOL v24 = __OFADD__(v41, 1);
      uint64_t v42 = v41 + 1;
      if (v24) {
        goto LABEL_24;
      }
      _OWORD v39[2] = v42;
      v27 += 3;
      if (!--v26) {
        goto LABEL_22;
      }
    }
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  sub_21F0BB9E0(v15, a2 & 1);
  unint64_t v17 = sub_21F0C43B4(v7, v6);
  if ((v16 & 1) == (v18 & 1))
  {
    unint64_t v12 = v17;
    if ((v16 & 1) == 0) {
      goto LABEL_13;
    }
LABEL_10:
    id v19 = (void *)swift_allocError();
    swift_willThrow();
    id v20 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267EBB0F0);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease_n();
      return;
    }
    goto LABEL_26;
  }
LABEL_25:
  sub_21F0C9608();
  __break(1u);
LABEL_26:
  sub_21F0C93B8();
  sub_21F0C90C8();
  sub_21F0C9458();
  sub_21F0C90C8();
  sub_21F0C9478();
  __break(1u);
}

uint64_t sub_21F0A7C28@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_21F0C8FC8();
  uint64_t v51 = *(void *)(v2 - 8);
  uint64_t v52 = v2;
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  v48[3] = (char *)v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v50 = (char *)v48 - v5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EBAF10);
  MEMORY[0x270FA5388](v6 - 8);
  long long v8 = (char *)v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_21F0C8F08();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)v48 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v49 = (char *)v48 - v14;
  type metadata accessor for PADSWClassifier();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v16 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  unint64_t v17 = (void *)sub_21F0C9048();
  char v18 = (void *)sub_21F0C9048();
  id v19 = objc_msgSend(v16, sel_URLForResource_withExtension_, v17, v18);

  if (v19)
  {
    sub_21F0C8ED8();

    id v20 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
    v20(v8, v13, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v8, 0, 1, v9);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) != 1)
    {
      v20(v49, v8, v9);
      uint64_t v28 = sub_21F0C8F18();
      unint64_t v30 = v29;
      sub_21F0C8E28();
      swift_allocObject();
      sub_21F0C8E18();
      sub_21F0A9488();
      sub_21F0C8E08();
      (*(void (**)(char *, uint64_t))(v10 + 8))(v49, v9);
      swift_release();
      uint64_t result = sub_21F09E288(v28, v30);
      long long v33 = v53;
      long long v32 = v54;
      long long v34 = v55;
      uint64_t v35 = v56;
      long long v36 = v57;
      long long v37 = v58;
      uint64_t v38 = v59;
      uint64_t v39 = v60;
      long long v40 = v61;
      long long v41 = v62;
      double v42 = v63;
      uint64_t v43 = v64;
      long long v44 = v65;
      long long v45 = v66;
      uint64_t v46 = v67;
      int64x2_t v47 = v68;
      goto LABEL_10;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
  }
  sub_21F09543C((uint64_t)v8, &qword_267EBAF10);
  if (qword_267EBAB80 != -1) {
    swift_once();
  }
  uint64_t v21 = v52;
  uint64_t v22 = __swift_project_value_buffer(v52, (uint64_t)qword_267EBAB88);
  uint64_t v23 = v50;
  uint64_t v24 = v51;
  (*(void (**)(char *, uint64_t, uint64_t))(v51 + 16))(v50, v22, v21);
  uint64_t v25 = sub_21F0C8FA8();
  os_log_type_t v26 = sub_21F0C9228();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v27 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v27 = 0;
    _os_log_impl(&dword_21F07C000, v25, v26, "No PADModelConfiguration plist found in bundle. Using default values.", v27, 2u);
    MEMORY[0x223C43270](v27, -1, -1);
  }

  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v23, v21);
  uint64_t v43 = 0;
  long long v45 = xmmword_21F0CBB30;
  long long v44 = xmmword_21F0CBB40;
  long long v41 = xmmword_21F0CBB50;
  long long v40 = xmmword_21F0CBB60;
  long long v34 = xmmword_21F0CBB70;
  long long v32 = xmmword_21F0CBB80;
  long long v33 = xmmword_21F0CBB90;
  long long v37 = xmmword_21F0CBBA0;
  uint64_t v46 = 0x3FC3333333333333;
  int64x2_t v47 = vdupq_n_s64(3uLL);
  double v42 = 0.5;
  long long v36 = xmmword_21F0CBBB0;
  uint64_t v35 = 0x3FD3333333333333;
  uint64_t v38 = 0x3F966CF41F212D77;
  uint64_t v39 = 10;
LABEL_10:
  *(_OWORD *)a1 = v33;
  *(_OWORD *)(a1 + 16) = v32;
  *(_OWORD *)(a1 + 32) = v34;
  *(void *)(a1 + 48) = v35;
  *(_OWORD *)(a1 + 56) = v36;
  *(_OWORD *)(a1 + 72) = v37;
  *(void *)(a1 + 88) = v38;
  *(void *)(a1 + 96) = v39;
  *(_OWORD *)(a1 + 104) = v40;
  *(_OWORD *)(a1 + 12sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = v41;
  *(double *)(a1 + 136) = v42;
  *(void *)(a1 + 144) = v43;
  *(_OWORD *)(a1 + 152) = v44;
  *(_OWORD *)(a1 + 168) = v45;
  *(void *)(a1 + 184) = v46;
  *(int64x2_t *)(a1 + 192) = v47;
  return result;
}

uint64_t sub_21F0A8418(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x65736F507466656CLL && a2 == 0xEE00656572676544;
  if (v3 || (sub_21F0C95D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x736F507468676972 && a2 == 0xEF65657267654465 || (sub_21F0C95D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x654465736F507075 && a2 == 0xEC00000065657267 || (sub_21F0C95D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x65736F506E776F64 && a2 == 0xEE00656572676544 || (sub_21F0C95D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x52776F7262657965 && a2 == 0xEC0000006F697461 || (sub_21F0C95D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x7461526874756F6DLL && a2 == 0xEA00000000006F69 || (sub_21F0C95D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6F69746152657965 && a2 == 0xE800000000000000 || (sub_21F0C95D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000021F0CEC30 || (sub_21F0C95D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000021F0CEC50 || (sub_21F0C95D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x4146726566667562 && a2 == 0xE900000000000043 || (sub_21F0C95D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0x4146726566667562 && a2 == 0xEC00000065794543 || (sub_21F0C95D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000021F0CEC70 || (sub_21F0C95D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else if (a1 == 0x4154726566667562 && a2 == 0xE800000000000000 || (sub_21F0C95D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 12;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000021F0CEC90 || (sub_21F0C95D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 13;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x800000021F0CECB0 || (sub_21F0C95D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 14;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000021F0CECD0 || (sub_21F0C95D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 15;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x800000021F0CECF0 || (sub_21F0C95D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 16;
  }
  else if (a1 == 0x7365726854636166 && a2 == 0xEC000000646C6F68 || (sub_21F0C95D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 17;
  }
  else if (a1 == 0x6873657268546174 && a2 == 0xEB00000000646C6FLL || (sub_21F0C95D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 18;
  }
  else if (a1 == 0x6873657268546469 && a2 == 0xEB00000000646C6FLL || (sub_21F0C95D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 19;
  }
  else if (a1 == 0xD000000000000019 && a2 == 0x800000021F0CED10 || (sub_21F0C95D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 20;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x800000021F0CED30 || (sub_21F0C95D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 21;
  }
  else if (a1 == 0xD00000000000001ALL && a2 == 0x800000021F0CED50 || (sub_21F0C95D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 22;
  }
  else if (a1 == 0xD00000000000001BLL && a2 == 0x800000021F0CED70 || (sub_21F0C95D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 23;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x800000021F0CED90 || (sub_21F0C95D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 24;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x800000021F0CEDB0)
  {
    swift_bridgeObjectRelease();
    return 25;
  }
  else
  {
    char v6 = sub_21F0C95D8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 25;
    }
    else {
      return 26;
    }
  }
}

uint64_t sub_21F0A8DD0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EBB0C0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  long long v8 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21F0A93E0();
  sub_21F0C9658();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  char v59 = 0;
  sub_21F0C9508();
  uint64_t v10 = v9;
  char v59 = 1;
  sub_21F0C9508();
  uint64_t v12 = v11;
  char v59 = 2;
  sub_21F0C9508();
  uint64_t v14 = v13;
  char v59 = 3;
  sub_21F0C9508();
  uint64_t v16 = v15;
  char v59 = 4;
  sub_21F0C9508();
  uint64_t v18 = v17;
  char v59 = 5;
  sub_21F0C9508();
  uint64_t v20 = v19;
  char v59 = 6;
  sub_21F0C9508();
  uint64_t v22 = v21;
  char v59 = 7;
  uint64_t v23 = sub_21F0C9528();
  char v59 = 8;
  uint64_t v24 = sub_21F0C9528();
  char v59 = 9;
  uint64_t v58 = sub_21F0C9528();
  char v59 = 10;
  uint64_t v57 = sub_21F0C9528();
  char v59 = 11;
  sub_21F0C9508();
  uint64_t v26 = v25;
  char v59 = 12;
  uint64_t v56 = sub_21F0C9528();
  char v59 = 13;
  sub_21F0C9508();
  uint64_t v55 = v27;
  char v59 = 14;
  sub_21F0C9508();
  uint64_t v54 = v28;
  char v59 = 15;
  sub_21F0C9508();
  uint64_t v53 = v29;
  char v59 = 16;
  sub_21F0C9508();
  uint64_t v52 = v30;
  char v59 = 17;
  sub_21F0C9508();
  uint64_t v51 = v31;
  char v59 = 18;
  uint64_t v50 = sub_21F0C9528();
  char v59 = 19;
  sub_21F0C9508();
  uint64_t v49 = v32;
  char v59 = 20;
  sub_21F0C9508();
  uint64_t v48 = v33;
  char v59 = 21;
  sub_21F0C9508();
  uint64_t v47 = v34;
  char v59 = 22;
  sub_21F0C9508();
  uint64_t v46 = v35;
  char v59 = 23;
  sub_21F0C9508();
  uint64_t v45 = v36;
  char v59 = 24;
  uint64_t v44 = sub_21F0C9528();
  char v59 = 25;
  uint64_t v37 = sub_21F0C9528();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  *a2 = v10;
  a2[1] = v12;
  a2[2] = v14;
  a2[3] = v16;
  a2[4] = v18;
  a2[5] = v20;
  a2[6] = v22;
  a2[7] = v23;
  a2[8] = v24;
  uint64_t v39 = v57;
  a2[9] = v58;
  a2[10] = v39;
  a2[11] = v26;
  a2[12] = v56;
  uint64_t v40 = v54;
  a2[13] = v55;
  a2[14] = v40;
  uint64_t v41 = v52;
  a2[15] = v53;
  a2[16] = v41;
  a2[17] = v51;
  a2[18] = v50;
  uint64_t v42 = v48;
  a2[19] = v49;
  a2[20] = v42;
  uint64_t v43 = v46;
  a2[21] = v47;
  a2[22] = v43;
  a2[23] = v45;
  a2[24] = v44;
  a2[25] = v37;
  return result;
}

unint64_t sub_21F0A93E0()
{
  unint64_t result = qword_267EBB0C8;
  if (!qword_267EBB0C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EBB0C8);
  }
  return result;
}

unint64_t sub_21F0A9434()
{
  unint64_t result = qword_267EBB0D8;
  if (!qword_267EBB0D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EBB0D8);
  }
  return result;
}

unint64_t sub_21F0A9488()
{
  unint64_t result = qword_267EBB100;
  if (!qword_267EBB100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EBB100);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for PADModelConfiguration.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xE7) {
    goto LABEL_17;
  }
  if (a2 + 25 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 25) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 25;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 25;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 25;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x1A;
  int v8 = v6 - 26;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for PADModelConfiguration.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 25 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 25) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xE7) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xE6)
  {
    unsigned int v6 = ((a2 - 231) >> 8) + 1;
    char *result = a2 + 25;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x21F0A9638);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          char *result = a2 + 25;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PADModelConfiguration.CodingKeys()
{
  return &type metadata for PADModelConfiguration.CodingKeys;
}

unint64_t sub_21F0A9674()
{
  unint64_t result = qword_267EBB108;
  if (!qword_267EBB108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EBB108);
  }
  return result;
}

unint64_t sub_21F0A96CC()
{
  unint64_t result = qword_267EBB110;
  if (!qword_267EBB110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EBB110);
  }
  return result;
}

unint64_t sub_21F0A9724()
{
  unint64_t result = qword_267EBB118;
  if (!qword_267EBB118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EBB118);
  }
  return result;
}

uint64_t sub_21F0A9778()
{
  return MEMORY[0x270FA0228](v0, 48, 7);
}

uint64_t type metadata accessor for PADAVFrame()
{
  return self;
}

uint64_t sub_21F0A97D4(uint64_t a1)
{
  *(void *)(v2 + 128) = a1;
  *(void *)(v2 + 136) = v1;
  return MEMORY[0x270FA2498](sub_21F0A97F4, 0, 0);
}

uint64_t sub_21F0A97F4()
{
  uint64_t v1 = (void *)sub_21F0C8EB8();
  id v2 = objc_msgSend(self, sel_assetWithURL_, v1);
  v0[18] = v2;

  uint64_t v3 = *MEMORY[0x263EF9D48];
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_21F0A9944;
  uint64_t v4 = swift_continuation_init();
  v0[10] = MEMORY[0x263EF8330];
  v0[11] = 0x40000000;
  v0[12] = sub_21F0A9D28;
  v0[13] = &block_descriptor;
  v0[14] = v4;
  objc_msgSend(v2, sel_loadTracksWithMediaType_completionHandler_, v3, v0 + 10);
  return MEMORY[0x270FA23F0](v0 + 2);
}

uint64_t sub_21F0A9944()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 152) = v1;
  if (v1) {
    id v2 = sub_21F0A9C60;
  }
  else {
    id v2 = sub_21F0A9A54;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

void sub_21F0A9A54()
{
  unint64_t v1 = v0[15];
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_21F0C9488();
    swift_bridgeObjectRelease();
    if (v10) {
      goto LABEL_3;
    }
LABEL_10:
    uint64_t v11 = (void *)v0[18];
    uint64_t v12 = v0[16];
    swift_bridgeObjectRelease();
    sub_21F0B1328(0xD00000000000002BLL, 0x800000021F0CEF20, 0, -2, 0);
    swift_willThrow();

    uint64_t v13 = sub_21F0C8F08();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
    type metadata accessor for PADAVAssetReader();
    swift_deallocPartialClassInstance();
    uint64_t v14 = (void (*)(void))v0[1];
    v14();
    return;
  }
  if (!*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_10;
  }
LABEL_3:
  if ((v1 & 0xC000000000000001) != 0)
  {
    id v2 = (id)MEMORY[0x223C42390](0, v1);
  }
  else
  {
    if (!*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return;
    }
    id v2 = *(id *)(v1 + 32);
  }
  id v3 = v2;
  uint64_t v5 = v0[17];
  uint64_t v4 = v0[18];
  uint64_t v6 = v0[16];
  swift_bridgeObjectRelease();
  uint64_t v7 = sub_21F0C8F08();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = v3;
  int v8 = (void (*)(uint64_t))v0[1];
  uint64_t v9 = v0[17];
  v8(v9);
}

uint64_t sub_21F0A9C60()
{
  unint64_t v1 = (void *)v0[18];
  uint64_t v2 = v0[16];
  swift_willThrow();

  uint64_t v3 = sub_21F0C8F08();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  type metadata accessor for PADAVAssetReader();
  swift_deallocPartialClassInstance();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_21F0A9D28(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267EBB0F0);
    uint64_t v5 = swift_allocError();
    void *v6 = a3;
    id v7 = a3;
    return MEMORY[0x270FA2410](v3, v5);
  }
  else
  {
    sub_21F0AB474();
    **(void **)(*(void *)(v3 + 64) + 4sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = sub_21F0C9128();
    return MEMORY[0x270FA2408](v3);
  }
}

id sub_21F0A9DF4(uint64_t *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v47 = *MEMORY[0x263EF8340];
  uint64_t v9 = *a1;
  uint64_t v10 = a1[1];
  uint64_t v11 = a1[2];
  uint64_t v12 = a1[3];
  uint64_t v13 = a1[4];
  uint64_t v40 = a1[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EBB120);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21F0CBD60;
  *(void *)(inited + 32) = sub_21F0C9078();
  *(void *)(inited + 4sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = v15;
  *(void *)(inited + 72) = MEMORY[0x263F8E8F8];
  *(_DWORD *)(inited + 48) = 1111970369;
  sub_21F0BB2DC(inited);
  if ((a4 & 1) == 0)
  {
    uint64_t v16 = sub_21F0C9078();
    uint64_t v39 = v5;
    uint64_t v17 = a3;
    uint64_t v18 = v12;
    uint64_t v19 = v9;
    uint64_t v21 = v20;
    uint64_t v44 = MEMORY[0x263F8EF38];
    *(void *)&long long v42 = a2;
    sub_21F0A52C0(&v42, v41);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_21F0BC310(v41, v16, v21, isUniquelyReferenced_nonNull_native);
    uint64_t v9 = v19;
    uint64_t v12 = v18;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v23 = sub_21F0C9078();
    uint64_t v25 = v24;
    uint64_t v44 = MEMORY[0x263F8EF38];
    *(void *)&long long v42 = v17;
    uint64_t v5 = v39;
    sub_21F0A52C0(&v42, v41);
    char v26 = swift_isUniquelyReferenced_nonNull_native();
    sub_21F0BC310(v41, v23, v25, v26);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  uint64_t v27 = *(void **)(v5 + 24);
  id v28 = objc_allocWithZone(MEMORY[0x263EFA4D8]);
  id v29 = v27;
  uint64_t v30 = (void *)sub_21F0C9018();
  swift_bridgeObjectRelease();
  id v31 = objc_msgSend(v28, sel_initWithTrack_outputSettings_, v29, v30);

  objc_msgSend(v31, sel_setAlwaysCopiesSampleData_, 0);
  uint64_t v32 = *(void **)(v5 + 16);
  id v33 = objc_allocWithZone(MEMORY[0x263EFA4C0]);
  *(void *)&long long v42 = 0;
  id v34 = v32;
  id v35 = objc_msgSend(v33, sel_initWithAsset_error_, v34, &v42);
  if (!v35)
  {
    id v36 = (id)v42;
    sub_21F0C8E78();

LABEL_8:
    swift_willThrow();

    return v36;
  }
  id v36 = v35;
  id v37 = (id)v42;

  if ((objc_msgSend(v36, sel_canAddOutput_, v31) & 1) == 0)
  {
    sub_21F0B1328(0xD000000000000025, 0x800000021F0CEE40, 0, -2, 0);
    id v34 = v36;
    goto LABEL_8;
  }
  *(void *)&long long v42 = v9;
  *((void *)&v42 + 1) = v10;
  uint64_t v43 = v11;
  uint64_t v44 = v12;
  uint64_t v45 = v13;
  uint64_t v46 = v40;
  objc_msgSend(v36, sel_setTimeRange_, &v42);
  objc_msgSend(v36, sel_addOutput_, v31);
  objc_msgSend(v36, sel_startReading);
  return v36;
}

uint64_t sub_21F0AA190()
{
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t type metadata accessor for PADAVAssetReader()
{
  return self;
}

uint64_t sub_21F0AA1F4(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_21F0AAE90(v2);
  }
  uint64_t v3 = *(void *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  uint64_t result = sub_21F0AA260(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_21F0AA260(void *a1)
{
  uint64_t v2 = a1;
  uint64_t v3 = a1[1];
  uint64_t result = sub_21F0C95A8();
  uint64_t v108 = v3;
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_139;
    }
    if ((unint64_t)v3 >= 2)
    {
      uint64_t v85 = *v2;
      uint64_t v86 = v85 + 40;
      uint64_t v87 = -1;
      uint64_t v88 = 1;
      do
      {
        uint64_t v89 = v87;
        uint64_t v90 = v86;
        do
        {
          uint64_t v91 = v90 - 40;
          uint64_t result = sub_21F0C92C8();
          if ((result & 1) == 0) {
            break;
          }
          if (!v85) {
            goto LABEL_143;
          }
          uint64_t v92 = *(void *)(v90 - 24);
          *(void *)(v90 - 24) = *(void *)v90;
          v90 -= 24;
          uint64_t result = *(void *)(v90 + 8);
          int v93 = *(_DWORD *)(v90 + 16);
          int v94 = *(_DWORD *)(v90 + 20);
          *(_OWORD *)(v91 + 24) = *(_OWORD *)v91;
          *(void *)(v91 + 4sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = v92;
          *(void *)(v90 - 16) = result;
          *(_DWORD *)(v90 - 8) = v93;
          *(_DWORD *)(v90 - 4) = v94;
        }
        while (!__CFADD__(v89++, 1));
        ++v88;
        v86 += 24;
        --v87;
      }
      while (v88 != v108);
    }
    return result;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_148;
  }
  uint64_t v106 = result;
  if (v3 < 2)
  {
    uint64_t v8 = MEMORY[0x263F8EE78];
    __dst = (char *)(MEMORY[0x263F8EE78] + 32);
    if (v3 != 1)
    {
      unint64_t v11 = *(void *)(MEMORY[0x263F8EE78] + 16);
      id v96 = (char *)MEMORY[0x263F8EE78];
LABEL_105:
      uint64_t v105 = v8;
      if (v11 >= 2)
      {
        uint64_t v97 = *v2;
        do
        {
          unint64_t v98 = v11 - 2;
          if (v11 < 2) {
            goto LABEL_134;
          }
          if (!v97) {
            goto LABEL_147;
          }
          id v99 = v96;
          uint64_t v100 = *(void *)&v96[16 * v98 + 32];
          uint64_t v101 = *(void *)&v96[16 * v11 + 24];
          sub_21F0AA9E8((char *)(v97 + 24 * v100), (char *)(v97 + 24 * *(void *)&v96[16 * v11 + 16]), v97 + 24 * v101, __dst);
          if (v1) {
            break;
          }
          if (v101 < v100) {
            goto LABEL_135;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            id v99 = sub_21F0AAE7C((uint64_t)v99);
          }
          if (v98 >= *((void *)v99 + 2)) {
            goto LABEL_136;
          }
          id v102 = &v99[16 * v98 + 32];
          *(void *)id v102 = v100;
          *((void *)v102 + 1) = v101;
          unint64_t v103 = *((void *)v99 + 2);
          if (v11 > v103) {
            goto LABEL_137;
          }
          memmove(&v99[16 * v11 + 16], &v99[16 * v11 + 32], 16 * (v103 - v11));
          id v96 = v99;
          *((void *)v99 + 2) = v103 - 1;
          unint64_t v11 = v103 - 1;
        }
        while (v103 > 2);
      }
LABEL_95:
      swift_bridgeObjectRelease();
      *(void *)(v105 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v105 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v6 = v5 >> 1;
    type metadata accessor for CMTime(0);
    uint64_t v7 = sub_21F0C9168();
    *(void *)(v7 + 16) = v6;
    uint64_t v105 = v7;
    __dst = (char *)(v7 + 32);
  }
  uint64_t v9 = 0;
  double v104 = v2;
  uint64_t v10 = *v2;
  double v110 = (char *)MEMORY[0x263F8EE78];
  while (1)
  {
    uint64_t v12 = v9++;
    if (v9 < v3)
    {
      int v13 = sub_21F0C92C8();
      uint64_t v9 = v12 + 2;
      if (v12 + 2 < v3)
      {
        uint64_t v14 = v10 + 64 + 24 * v12;
        while (((v13 ^ sub_21F0C92C8()) & 1) == 0)
        {
          v14 += 24;
          if (v3 == ++v9)
          {
            uint64_t v9 = v3;
            break;
          }
        }
      }
      if (v13)
      {
        if (v9 < v12) {
          goto LABEL_140;
        }
        if (v12 < v9)
        {
          uint64_t v15 = 24 * v9;
          uint64_t v16 = 24 * v12;
          uint64_t v17 = v9;
          uint64_t v18 = v12;
          do
          {
            if (v18 != --v17)
            {
              if (!v10) {
                goto LABEL_146;
              }
              uint64_t v19 = v10 + v16;
              uint64_t v20 = v10 + v15;
              uint64_t v21 = *(void *)(v10 + v16);
              uint64_t v22 = *(void *)(v10 + v16 + 16);
              uint64_t v23 = *(void *)(v10 + v16 + 8);
              uint64_t v24 = *(void *)(v10 + v15 - 8);
              *(_OWORD *)uint64_t v19 = *(_OWORD *)(v10 + v15 - 24);
              *(void *)(v19 + 16) = v24;
              *(void *)(v20 - 24) = v21;
              *(void *)(v20 - 16) = v23;
              *(void *)(v20 - 8) = v22;
            }
            ++v18;
            v15 -= 24;
            v16 += 24;
          }
          while (v18 < v17);
        }
      }
    }
    if (v9 >= v3) {
      goto LABEL_39;
    }
    if (__OFSUB__(v9, v12)) {
      goto LABEL_138;
    }
    if (v9 - v12 >= v106) {
      goto LABEL_39;
    }
    if (__OFADD__(v12, v106)) {
      goto LABEL_141;
    }
    uint64_t v25 = v12 + v106 >= v3 ? v3 : v12 + v106;
    if (v25 < v12) {
      break;
    }
    if (v9 != v25)
    {
      uint64_t v76 = v10 + 16 + 24 * v9;
      char v26 = v110;
      uint64_t v107 = v25;
      do
      {
        uint64_t v77 = v12;
        uint64_t v78 = v12;
        uint64_t v79 = v76;
        do
        {
          uint64_t v80 = v79 - 40;
          if ((sub_21F0C92C8() & 1) == 0) {
            break;
          }
          if (!v10) {
            goto LABEL_144;
          }
          uint64_t v81 = *(void *)(v79 - 24);
          *(void *)(v79 - 24) = *(void *)v79;
          v79 -= 24;
          uint64_t v82 = *(void *)(v79 + 8);
          int v83 = *(_DWORD *)(v79 + 16);
          int v84 = *(_DWORD *)(v79 + 20);
          *(_OWORD *)(v80 + 24) = *(_OWORD *)v80;
          *(void *)(v80 + 4sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = v81;
          *(void *)(v79 - 16) = v82;
          *(_DWORD *)(v79 - 8) = v83;
          *(_DWORD *)(v79 - 4) = v84;
          ++v78;
        }
        while (v9 != v78);
        ++v9;
        v76 += 24;
        uint64_t v12 = v77;
      }
      while (v9 != v107);
      uint64_t v9 = v107;
      if (v107 < v77) {
        goto LABEL_133;
      }
      goto LABEL_40;
    }
LABEL_39:
    char v26 = v110;
    if (v9 < v12) {
      goto LABEL_133;
    }
LABEL_40:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      char v26 = sub_21F0AACB0(0, *((void *)v26 + 2) + 1, 1, v26);
    }
    unint64_t v28 = *((void *)v26 + 2);
    unint64_t v27 = *((void *)v26 + 3);
    unint64_t v11 = v28 + 1;
    if (v28 >= v27 >> 1) {
      char v26 = sub_21F0AACB0((char *)(v27 > 1), v28 + 1, 1, v26);
    }
    *((void *)v26 + 2) = v11;
    id v29 = v26 + 32;
    uint64_t v30 = &v26[16 * v28 + 32];
    *(void *)uint64_t v30 = v12;
    *((void *)v30 + 1) = v9;
    double v110 = v26;
    if (v28)
    {
      while (1)
      {
        unint64_t v31 = v11 - 1;
        if (v11 >= 4)
        {
          id v36 = &v29[16 * v11];
          uint64_t v37 = *((void *)v36 - 8);
          uint64_t v38 = *((void *)v36 - 7);
          BOOL v42 = __OFSUB__(v38, v37);
          uint64_t v39 = v38 - v37;
          if (v42) {
            goto LABEL_122;
          }
          uint64_t v41 = *((void *)v36 - 6);
          uint64_t v40 = *((void *)v36 - 5);
          BOOL v42 = __OFSUB__(v40, v41);
          uint64_t v34 = v40 - v41;
          char v35 = v42;
          if (v42) {
            goto LABEL_123;
          }
          unint64_t v43 = v11 - 2;
          uint64_t v44 = &v29[16 * v11 - 32];
          uint64_t v46 = *(void *)v44;
          uint64_t v45 = *((void *)v44 + 1);
          BOOL v42 = __OFSUB__(v45, v46);
          uint64_t v47 = v45 - v46;
          if (v42) {
            goto LABEL_125;
          }
          BOOL v42 = __OFADD__(v34, v47);
          uint64_t v48 = v34 + v47;
          if (v42) {
            goto LABEL_128;
          }
          if (v48 >= v39)
          {
            long long v66 = &v29[16 * v31];
            uint64_t v68 = *(void *)v66;
            uint64_t v67 = *((void *)v66 + 1);
            BOOL v42 = __OFSUB__(v67, v68);
            uint64_t v69 = v67 - v68;
            if (v42) {
              goto LABEL_132;
            }
            BOOL v59 = v34 < v69;
            goto LABEL_76;
          }
        }
        else
        {
          if (v11 != 3)
          {
            uint64_t v60 = *((void *)v26 + 4);
            uint64_t v61 = *((void *)v26 + 5);
            BOOL v42 = __OFSUB__(v61, v60);
            uint64_t v53 = v61 - v60;
            char v54 = v42;
            goto LABEL_70;
          }
          uint64_t v33 = *((void *)v26 + 4);
          uint64_t v32 = *((void *)v26 + 5);
          BOOL v42 = __OFSUB__(v32, v33);
          uint64_t v34 = v32 - v33;
          char v35 = v42;
        }
        if (v35) {
          goto LABEL_124;
        }
        unint64_t v43 = v11 - 2;
        uint64_t v49 = &v29[16 * v11 - 32];
        uint64_t v51 = *(void *)v49;
        uint64_t v50 = *((void *)v49 + 1);
        BOOL v52 = __OFSUB__(v50, v51);
        uint64_t v53 = v50 - v51;
        char v54 = v52;
        if (v52) {
          goto LABEL_127;
        }
        uint64_t v55 = &v29[16 * v31];
        uint64_t v57 = *(void *)v55;
        uint64_t v56 = *((void *)v55 + 1);
        BOOL v42 = __OFSUB__(v56, v57);
        uint64_t v58 = v56 - v57;
        if (v42) {
          goto LABEL_130;
        }
        if (__OFADD__(v53, v58)) {
          goto LABEL_131;
        }
        if (v53 + v58 >= v34)
        {
          BOOL v59 = v34 < v58;
LABEL_76:
          if (v59) {
            unint64_t v31 = v43;
          }
          goto LABEL_78;
        }
LABEL_70:
        if (v54) {
          goto LABEL_126;
        }
        long long v62 = &v29[16 * v31];
        uint64_t v64 = *(void *)v62;
        uint64_t v63 = *((void *)v62 + 1);
        BOOL v42 = __OFSUB__(v63, v64);
        uint64_t v65 = v63 - v64;
        if (v42) {
          goto LABEL_129;
        }
        if (v65 < v53) {
          goto LABEL_15;
        }
LABEL_78:
        unint64_t v70 = v31 - 1;
        if (v31 - 1 >= v11)
        {
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
          goto LABEL_142;
        }
        if (!v10) {
          goto LABEL_145;
        }
        CFAllocatorRef v71 = &v29[16 * v70];
        uint64_t v72 = *(void *)v71;
        uint64_t v73 = &v29[16 * v31];
        uint64_t v74 = *((void *)v73 + 1);
        sub_21F0AA9E8((char *)(v10 + 24 * *(void *)v71), (char *)(v10 + 24 * *(void *)v73), v10 + 24 * v74, __dst);
        if (v1) {
          goto LABEL_95;
        }
        if (v74 < v72) {
          goto LABEL_119;
        }
        if (v31 > *((void *)v110 + 2)) {
          goto LABEL_120;
        }
        *(void *)CFAllocatorRef v71 = v72;
        *(void *)&v29[16 * v70 + 8] = v74;
        unint64_t v75 = *((void *)v110 + 2);
        if (v31 >= v75) {
          goto LABEL_121;
        }
        char v26 = v110;
        unint64_t v11 = v75 - 1;
        memmove(&v29[16 * v31], v73 + 16, 16 * (v75 - 1 - v31));
        *((void *)v110 + 2) = v75 - 1;
        if (v75 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v11 = 1;
LABEL_15:
    uint64_t v3 = v108;
    if (v9 >= v108)
    {
      uint64_t v8 = v105;
      id v96 = v110;
      uint64_t v2 = v104;
      goto LABEL_105;
    }
  }
LABEL_142:
  __break(1u);
LABEL_143:
  __break(1u);
LABEL_144:
  __break(1u);
LABEL_145:
  __break(1u);
LABEL_146:
  __break(1u);
LABEL_147:
  __break(1u);
LABEL_148:
  uint64_t result = sub_21F0C9468();
  __break(1u);
  return result;
}

uint64_t sub_21F0AA9E8(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = (a2 - __src) / 24;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = (uint64_t)(a3 - (void)a2) / 24;
  uint64_t v25 = __src;
  uint64_t v24 = __dst;
  if (v9 >= v11)
  {
    if (v10 >= -23)
    {
      if (__dst != a2 || &a2[24 * v11] <= __dst) {
        memmove(__dst, a2, 24 * v11);
      }
      uint64_t v16 = &v4[24 * v11];
      uint64_t v23 = v16;
      uint64_t v25 = v6;
      if (v7 < v6 && v10 >= 24)
      {
        unint64_t v17 = a3 - 24;
        uint64_t v18 = v6;
        while (1)
        {
          uint64_t v19 = (char *)(v17 + 24);
          v18 -= 24;
          if (sub_21F0C92C8())
          {
            if (v19 != v6 || v17 >= (unint64_t)v6)
            {
              long long v20 = *(_OWORD *)v18;
              *(void *)(v17 + 16) = *((void *)v18 + 2);
              *(_OWORD *)unint64_t v17 = v20;
            }
            uint64_t v25 = v18;
            if (v18 <= v7) {
              goto LABEL_38;
            }
          }
          else
          {
            uint64_t v23 = v16 - 24;
            if (v19 < v16 || v17 >= (unint64_t)v16 || v19 != v16)
            {
              long long v21 = *(_OWORD *)(v16 - 24);
              *(void *)(v17 + 16) = *((void *)v16 - 1);
              *(_OWORD *)unint64_t v17 = v21;
            }
            uint64_t v18 = v6;
            v16 -= 24;
            if (v6 <= v7) {
              goto LABEL_38;
            }
          }
          v17 -= 24;
          uint64_t v6 = v18;
          if (v16 <= v4) {
            goto LABEL_38;
          }
        }
      }
      goto LABEL_38;
    }
  }
  else if (v8 >= -23)
  {
    if (__dst != __src || &__src[24 * v9] <= __dst) {
      memmove(__dst, __src, 24 * v9);
    }
    uint64_t v12 = &v4[24 * v9];
    uint64_t v23 = v12;
    if ((unint64_t)v6 < a3 && v8 >= 24)
    {
      do
      {
        if (sub_21F0C92C8())
        {
          int v13 = v6 + 24;
          if (v7 < v6 || v7 >= v13 || v7 != v6)
          {
            long long v14 = *(_OWORD *)v6;
            *((void *)v7 + 2) = *((void *)v6 + 2);
            *(_OWORD *)uint64_t v7 = v14;
          }
        }
        else
        {
          if (v7 != v4)
          {
            long long v15 = *(_OWORD *)v4;
            *((void *)v7 + 2) = *((void *)v4 + 2);
            *(_OWORD *)uint64_t v7 = v15;
          }
          v4 += 24;
          uint64_t v24 = v4;
          int v13 = v6;
        }
        v7 += 24;
        if (v4 >= v12) {
          break;
        }
        uint64_t v6 = v13;
      }
      while ((unint64_t)v13 < a3);
      uint64_t v25 = v7;
    }
LABEL_38:
    sub_21F0AADAC((void **)&v25, (const void **)&v24, &v23);
    return 1;
  }
  uint64_t result = sub_21F0C94C8();
  __break(1u);
  return result;
}

char *sub_21F0AACB0(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267EBB128);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  int v13 = v10 + 32;
  long long v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_21F0AADAC(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  if (v4 <= -24)
  {
    uint64_t result = (char *)sub_21F0C94C8();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v6 = v4 / 24;
    if (result != v3 || result >= &v3[24 * v6])
    {
      return (char *)memmove(result, v3, 24 * v6);
    }
  }
  return result;
}

char *sub_21F0AAE7C(uint64_t a1)
{
  return sub_21F0AACB0(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_21F0AAE90(uint64_t a1)
{
  return sub_21F0C3B10(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_21F0AAEA4(CMTimeValue a1)
{
  v13.start.CMTimeValue value = a1;
  swift_bridgeObjectRetain();
  sub_21F0AA1F4(&v13.start.value);
  if (v1)
  {
    uint64_t result = swift_release();
    __break(1u);
  }
  else
  {
    uint64_t v17 = MEMORY[0x263F8EE78];
    uint64_t v2 = *(void *)(v13.start.value + 16);
    if (v2)
    {
      uint64_t v3 = (CMTimeEpoch *)(v13.start.value + 48);
      do
      {
        CMTimeEpoch v6 = *v3;
        CMTimeValue v7 = *(v3 - 2);
        uint64_t v12 = *(v3 - 1);
        CMTimeMake(&v13.start, 100000, v12);
        CMTime duration = v13.start;
        start.CMTimeValue value = v7;
        *(void *)&start.timescale = v12;
        start.CMTimeEpoch epoch = v6;
        CMTimeRangeMake(&v13, &start, &duration);
        CMTimeRange v16 = v13;
        id v5 = sub_21F0A9DF4(&v16.start.value, 0, 0, 1);
        uint64_t v4 = v8;
        id v9 = objc_msgSend(v8, sel_copyNextSampleBuffer);
        if (v9)
        {
          id v10 = v9;
          MEMORY[0x223C420C0]();
          if (*(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_21F0C9158();
          }
          sub_21F0C9178();
          sub_21F0C9148();

          uint64_t v4 = v5;
          id v5 = v10;
        }
        v3 += 3;

        --v2;
      }
      while (v2);
      swift_release();
      return v17;
    }
    else
    {
      swift_release();
      return MEMORY[0x263F8EE78];
    }
  }
  return result;
}

unint64_t sub_21F0AB094(CMTimeValue a1)
{
  unint64_t result = sub_21F0AAEA4(a1);
  unint64_t v3 = result;
  if (v1) {
    return result;
  }
  if (result >> 62)
  {
    swift_bridgeObjectRetain();
    unint64_t result = sub_21F0C9488();
    uint64_t v4 = result;
    if (result) {
      goto LABEL_4;
    }
LABEL_26:
    uint64_t v32 = (void *)MEMORY[0x263F8EE78];
LABEL_27:
    swift_bridgeObjectRelease_n();
    return (unint64_t)v32;
  }
  uint64_t v4 = *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10);
  unint64_t result = swift_bridgeObjectRetain();
  if (!v4) {
    goto LABEL_26;
  }
LABEL_4:
  if (v4 >= 1)
  {
    uint64_t v5 = 0;
    unint64_t v36 = v3 & 0xC000000000000001;
    uint64_t v32 = (void *)MEMORY[0x263F8EE78];
    uint64_t v33 = v4;
    unint64_t v34 = v3;
    while (1)
    {
      if (v36) {
        CMTimeEpoch v6 = (opaqueCMSampleBuffer *)MEMORY[0x223C42390](v5, v3);
      }
      else {
        CMTimeEpoch v6 = (opaqueCMSampleBuffer *)*(id *)(v3 + 8 * v5 + 32);
      }
      CMTimeValue v7 = v6;
      uint64_t v8 = CMSampleBufferGetImageBuffer(v6);
      if (v8)
      {
        id v9 = v8;
        CVPixelBufferLockBaseAddress(v8, 1uLL);
        BaseAddress = CVPixelBufferGetBaseAddress(v9);
        size_t BytesPerRow = CVPixelBufferGetBytesPerRow(v9);
        size_t Width = CVPixelBufferGetWidth(v9);
        size_t Height = CVPixelBufferGetHeight(v9);
        CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceRGB();
        long long v15 = CGBitmapContextCreate(BaseAddress, Width, Height, 8uLL, BytesPerRow, DeviceRGB, 0x2002u);
        if (v15)
        {
          CMTimeRange v16 = v15;
          CGImageRef Image = CGBitmapContextCreateImage(v15);
          if (Image)
          {
            CGImageRef v18 = Image;
            CVPixelBufferUnlockBaseAddress(v9, 1uLL);
            CGImageRef v31 = v18;
            id v35 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F00650]), sel_initWithCGImage_, v18);
            id v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F00628]), sel_init);
            CGColorSpaceRef v20 = CGColorSpaceCreateDeviceRGB();
            sub_21F0BB414(MEMORY[0x263F8EE78]);
            type metadata accessor for CIImageRepresentationOption(0);
            sub_21F0AB41C();
            long long v21 = (void *)sub_21F0C9018();
            swift_bridgeObjectRelease();
            uint64_t v30 = v19;
            id v22 = objc_msgSend(v19, sel_JPEGRepresentationOfImage_colorSpace_options_, v35, v20, v21);

            if (v22)
            {
              uint64_t v23 = sub_21F0C8F48();
              uint64_t v25 = v24;

              if (swift_isUniquelyReferenced_nonNull_native())
              {
                uint64_t v4 = v33;
                unint64_t v3 = v34;
                char v26 = v32;
              }
              else
              {
                char v26 = sub_21F09CE10(0, v32[2] + 1, 1, v32);
                uint64_t v4 = v33;
                unint64_t v3 = v34;
              }
              unint64_t v28 = v26[2];
              unint64_t v27 = v26[3];
              if (v28 >= v27 >> 1) {
                char v26 = sub_21F09CE10((void *)(v27 > 1), v28 + 1, 1, v26);
              }
              v26[2] = v28 + 1;
              uint64_t v32 = v26;
              id v29 = &v26[2 * v28];
              v29[4] = v23;
              v29[5] = v25;
              goto LABEL_7;
            }
          }
          else
          {
          }
        }
        else
        {
        }
        uint64_t v4 = v33;
        unint64_t v3 = v34;
      }
      else
      {
      }
LABEL_7:
      if (v4 == ++v5) {
        goto LABEL_27;
      }
    }
  }
  __break(1u);
  return result;
}

unint64_t sub_21F0AB41C()
{
  unint64_t result = qword_267EBACC0;
  if (!qword_267EBACC0)
  {
    type metadata accessor for CIImageRepresentationOption(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EBACC0);
  }
  return result;
}

unint64_t sub_21F0AB474()
{
  unint64_t result = qword_267EBB138;
  if (!qword_267EBB138)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_267EBB138);
  }
  return result;
}

uint64_t sub_21F0AB4B4()
{
  id v1 = objc_msgSend(*(id *)(*(void *)(v0 + 16) + 16), sel_modelDescription);
  id v2 = objc_msgSend(v1, sel_metadata);

  type metadata accessor for MLModelMetadataKey(0);
  sub_21F0A61B4();
  uint64_t v3 = sub_21F0C9038();

  if (!*(void *)(v3 + 16))
  {
    long long v9 = 0u;
    long long v10 = 0u;
LABEL_10:
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  id v4 = (id)*MEMORY[0x263F00D08];
  uint64_t v5 = sub_21F0C4470();
  if ((v6 & 1) == 0)
  {
    long long v9 = 0u;
    long long v10 = 0u;

    goto LABEL_10;
  }
  sub_21F09F5EC(*(void *)(v3 + 56) + 32 * v5, (uint64_t)&v9);

  swift_bridgeObjectRelease();
  if (!*((void *)&v10 + 1))
  {
LABEL_11:
    sub_21F0A620C((uint64_t)&v9);
    return 0;
  }
  if (swift_dynamicCast()) {
    return v8;
  }
  else {
    return 0;
  }
}

uint64_t sub_21F0AB5F8(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  uint64_t v3 = sub_21F0C8F08();
  v2[4] = v3;
  v2[5] = *(void *)(v3 - 8);
  v2[6] = swift_task_alloc();
  v2[7] = type metadata accessor for PADPrintReplayS2Model();
  return MEMORY[0x270FA2498](sub_21F0AB6C4, 0, 0);
}

uint64_t sub_21F0AB6C4()
{
  sub_21F0C81E0(v0[6]);
  sub_21F0A5404(0, (unint64_t *)&qword_267EBB0B0);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[8] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_21F0AB784;
  uint64_t v2 = v0[6];
  uint64_t v3 = v0[2];
  return MEMORY[0x270EE7958](v2, v3);
}

uint64_t sub_21F0AB784(uint64_t a1)
{
  id v4 = *(void **)v2;
  *(void *)(*(void *)v2 + 72) = v1;
  swift_task_dealloc();
  if (v1)
  {
    (*(void (**)(void, void))(v4[5] + 8))(v4[6], v4[4]);
    uint64_t v5 = sub_21F0AB984;
  }
  else
  {
    v4[10] = a1;
    uint64_t v5 = sub_21F0AB8C0;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_21F0AB8C0()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[6];
  uint64_t v3 = v0[4];
  uint64_t v4 = v0[5];
  char v6 = (void *)v0[2];
  uint64_t v5 = v0[3];
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v1;
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);

  *(void *)(v5 + 16) = v7;
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v9 = v0[3];
  return v8(v9);
}

uint64_t sub_21F0AB984()
{
  type metadata accessor for PADPrintReplayModelManager();
  swift_deallocPartialClassInstance();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_21F0ABA0C(void *a1)
{
  v22[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(v1 + 16);
  type metadata accessor for PADPrintReplayS2ModelInput();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  id v5 = objc_allocWithZone(MEMORY[0x263F00DC8]);
  id v6 = a1;
  id v7 = objc_msgSend(v5, sel_init);
  uint64_t v8 = *(void **)(v3 + 16);
  v22[0] = 0;
  id v9 = objc_msgSend(v8, sel_predictionFromFeatures_options_error_, v4, v7, v22);
  id v10 = v22[0];
  if (!v9)
  {
    id v21 = v22[0];
    sub_21F0C8E78();

    swift_willThrow();
    swift_release();

    return;
  }
  uint64_t v11 = v9;
  type metadata accessor for PADPrintReplayS2ModelOutput();
  *(void *)(swift_initStackObject() + 16) = v11;
  id v12 = v10;
  swift_release();

  CMTimeRange v13 = (void *)sub_21F0C9048();
  id v14 = objc_msgSend(v11, sel_featureValueForName_, v13);

  if (v14)
  {
    id v15 = objc_msgSend(v14, sel_multiArrayValue);

    if (v15)
    {
      swift_release();
      id v16 = objc_msgSend(v15, sel_numberArray);

      sub_21F0A5404(0, &qword_267EBAE88);
      unint64_t v17 = sub_21F0C9128();

      if (v17 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v18 = sub_21F0C9488();
        swift_bridgeObjectRelease();
        if (v18) {
          goto LABEL_6;
        }
      }
      else
      {
        uint64_t v18 = *(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (v18)
        {
LABEL_6:
          if ((v17 & 0xC000000000000001) != 0)
          {
            id v19 = (id)MEMORY[0x223C42390](0, v17);
          }
          else
          {
            if (!*(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
              __break(1u);
            }
            id v19 = *(id *)(v17 + 32);
          }
          CGColorSpaceRef v20 = v19;
          swift_bridgeObjectRelease();
          objc_msgSend(v20, sel_floatValue);

          goto LABEL_13;
        }
      }
      swift_bridgeObjectRelease();
LABEL_13:
      LOBYTE(v22[0]) = v18 == 0;
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_21F0ABCD4()
{
  swift_release();
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t type metadata accessor for PADPrintReplayModelManager()
{
  return self;
}

uint64_t sub_21F0ABD30(uint64_t a1, uint64_t a2, unint64_t a3)
{
  sub_21F0ABDF0((uint64_t)v9);
  if (*(void *)(v3 + OBJC_IVAR____TtC10CoreIDVPAD30PADInternalAuditDataRepository_dataRecorder))
  {
    v7[12] = v9[12];
    v7[13] = v9[13];
    v7[14] = v9[14];
    uint64_t v8 = v10;
    v7[8] = v9[8];
    v7[9] = v9[9];
    v7[10] = v9[10];
    v7[11] = v9[11];
    v7[4] = v9[4];
    v7[5] = v9[5];
    v7[6] = v9[6];
    v7[7] = v9[7];
    v7[0] = v9[0];
    v7[1] = v9[1];
    v7[2] = v9[2];
    void v7[3] = v9[3];
    sub_21F096398(v7, a2, a3);
  }
  return sub_21F08FAF0((uint64_t)v9);
}

void sub_21F0ABDF0(uint64_t a1@<X8>)
{
  uint64_t v236 = *MEMORY[0x263EF8340];
  id v3 = objc_msgSend(v1, sel_livenessLabel);
  id v208 = objc_msgSend(v3, sel_integerValue);

  id v211 = v1;
  id v4 = objc_msgSend(v1, sel_gestureSequence);
  sub_21F093AE0();
  unint64_t v5 = sub_21F0C9128();

  uint64_t v210 = a1;
  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_21F0C9488();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v7 = MEMORY[0x263F8EE78];
  if (v6)
  {
    *(void *)&v233[0] = MEMORY[0x263F8EE78];
    sub_21F0C3A80(0, v6 & ~(v6 >> 63), 0);
    if (v6 < 0) {
      goto LABEL_149;
    }
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)&v233[0];
    do
    {
      uint64_t v10 = v9;
      if ((v5 & 0xC000000000000001) != 0) {
        id v11 = (id)MEMORY[0x223C42390](v8, v5);
      }
      else {
        id v11 = *(id *)(v5 + 8 * v8 + 32);
      }
      id v12 = v11;
      unint64_t v13 = (unint64_t)objc_msgSend(v11, sel_integerValue);

      if (v13 > 0xA) {
        uint64_t v14 = 10;
      }
      else {
        uint64_t v14 = qword_21F0CBE38[v13];
      }
      uint64_t v9 = v10;
      *(void *)&v233[0] = v10;
      unint64_t v15 = *(void *)(v10 + 16);
      unint64_t v16 = *(void *)(v9 + 24);
      if (v15 >= v16 >> 1)
      {
        sub_21F0C3A80(v16 > 1, v15 + 1, 1);
        uint64_t v9 = *(void *)&v233[0];
      }
      ++v8;
      *(void *)(v9 + 16) = v15 + 1;
      *(void *)(v9 + 8 * v15 + 32) = v14;
    }
    while (v6 != v8);
    uint64_t v207 = v9;
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v207 = MEMORY[0x263F8EE78];
  }
  id v17 = objc_msgSend(v211, sel_assessmentsFAC);
  unint64_t v18 = sub_21F0C9128();

  if (v18 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_21F0C9488();
    swift_bridgeObjectRelease();
    if (v19) {
      goto LABEL_19;
    }
LABEL_33:
    swift_bridgeObjectRelease();
    uint64_t v21 = MEMORY[0x263F8EE78];
    goto LABEL_34;
  }
  uint64_t v19 = *(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v19) {
    goto LABEL_33;
  }
LABEL_19:
  *(void *)&v233[0] = v7;
  sub_21F0C3928(0, v19 & ~(v19 >> 63), 0);
  if (v19 < 0) {
    goto LABEL_150;
  }
  uint64_t v20 = 0;
  uint64_t v21 = *(void *)&v233[0];
  do
  {
    if ((v18 & 0xC000000000000001) != 0) {
      id v22 = (id)MEMORY[0x223C42390](v20, v18);
    }
    else {
      id v22 = *(id *)(v18 + 8 * v20 + 32);
    }
    uint64_t v23 = v22;
    id v24 = objc_msgSend(v22, sel_integerValue);

    if ((unint64_t)v24 >= 5) {
      uint64_t v25 = 2;
    }
    else {
      uint64_t v25 = (uint64_t)v24;
    }
    *(void *)&v233[0] = v21;
    unint64_t v27 = *(void *)(v21 + 16);
    unint64_t v26 = *(void *)(v21 + 24);
    if (v27 >= v26 >> 1)
    {
      sub_21F0C3928(v26 > 1, v27 + 1, 1);
      uint64_t v21 = *(void *)&v233[0];
    }
    ++v20;
    *(void *)(v21 + 16) = v27 + 1;
    *(void *)(v21 + 8 * v27 + 32) = v25;
  }
  while (v19 != v20);
  swift_bridgeObjectRelease();
LABEL_34:
  uint64_t v206 = v21;
  id v28 = objc_msgSend(v211, sel_assessmentsPRD);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EBAFC0);
  uint64_t v29 = sub_21F0C9128();

  uint64_t v30 = *(void *)(v29 + 16);
  if (v30)
  {
    CGImageRef v31 = self;
    swift_bridgeObjectRetain();
    uint64_t v32 = 0;
    uint64_t v216 = (void *)MEMORY[0x263F8EE78];
    do
    {
      swift_bridgeObjectRetain();
      id v35 = (void *)sub_21F0C9018();
      *(void *)&v233[0] = 0;
      id v36 = objc_msgSend(v31, sel_dataWithJSONObject_options_error_, v35, 4, v233);

      id v37 = *(id *)&v233[0];
      if (v36)
      {
        uint64_t v38 = sub_21F0C8F48();
        unint64_t v40 = v39;

        sub_21F0C8DC8();
        swift_allocObject();
        sub_21F0C8DB8();
        sub_21F08F858();
        sub_21F0C8DA8();
        sub_21F09E288(v38, v40);
        swift_bridgeObjectRelease();
        swift_release();
        long long v226 = v233[0];
        long long v221 = v233[1];
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v216 = sub_21F09D148(0, v216[2] + 1, 1, v216);
        }
        unint64_t v42 = v216[2];
        unint64_t v41 = v216[3];
        if (v42 >= v41 >> 1) {
          uint64_t v216 = sub_21F09D148((void *)(v41 > 1), v42 + 1, 1, v216);
        }
        v216[2] = v42 + 1;
        unint64_t v43 = &v216[4 * v42];
        *((_OWORD *)v43 + 2) = v226;
        *((_OWORD *)v43 + 3) = v221;
      }
      else
      {
        uint64_t v33 = v37;
        unint64_t v34 = (void *)sub_21F0C8E78();

        swift_willThrow();
        swift_bridgeObjectRelease();
      }
      ++v32;
    }
    while (v30 != v32);
    swift_bridgeObjectRelease_n();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v216 = (void *)MEMORY[0x263F8EE78];
  }
  id v44 = objc_msgSend(v211, sel_assessmentsTA);
  uint64_t v45 = sub_21F0C9128();

  uint64_t v46 = *(void *)(v45 + 16);
  uint64_t v47 = MEMORY[0x263F8EE78];
  if (v46)
  {
    uint64_t v48 = self;
    swift_bridgeObjectRetain();
    uint64_t v49 = 0;
    v215 = (void *)MEMORY[0x263F8EE78];
    do
    {
      swift_bridgeObjectRetain();
      BOOL v52 = (void *)sub_21F0C9018();
      *(void *)&v233[0] = 0;
      id v53 = objc_msgSend(v48, sel_dataWithJSONObject_options_error_, v52, 4, v233);

      id v54 = *(id *)&v233[0];
      if (v53)
      {
        uint64_t v55 = sub_21F0C8F48();
        unint64_t v57 = v56;

        sub_21F0C8DC8();
        swift_allocObject();
        sub_21F0C8DB8();
        sub_21F08F8AC();
        sub_21F0C8DA8();
        sub_21F09E288(v55, v57);
        swift_bridgeObjectRelease();
        swift_release();
        uint64_t v58 = *(void *)&v233[0];
        char v59 = BYTE8(v233[0]);
        int v60 = HIDWORD(v233[0]);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          v215 = sub_21F09CA4C(0, v215[2] + 1, 1, v215);
        }
        unint64_t v62 = v215[2];
        unint64_t v61 = v215[3];
        if (v62 >= v61 >> 1) {
          v215 = sub_21F09CA4C((void *)(v61 > 1), v62 + 1, 1, v215);
        }
        v215[2] = v62 + 1;
        uint64_t v63 = &v215[2 * v62];
        v63[4] = v58;
        *((unsigned char *)v63 + 4sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = v59;
        *((_DWORD *)v63 + 11) = v60;
      }
      else
      {
        uint64_t v50 = v54;
        uint64_t v51 = (void *)sub_21F0C8E78();

        swift_willThrow();
        swift_bridgeObjectRelease();
      }
      ++v49;
    }
    while (v46 != v49);
    swift_bridgeObjectRelease();
    uint64_t v47 = MEMORY[0x263F8EE78];
  }
  else
  {
    v215 = (void *)MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRelease();
  id v64 = objc_msgSend(v211, sel_timestampsFAC);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EBB060);
  uint64_t v65 = sub_21F0C9128();

  int64_t v66 = *(void *)(v65 + 16);
  uint64_t v67 = (void **)MEMORY[0x263F010D8];
  uint64_t v68 = MEMORY[0x263F8EE58];
  if (v66)
  {
    uint64_t v232 = v47;
    sub_21F0C38F8(0, v66, 0);
    uint64_t v69 = 0;
    uint64_t v217 = v65 + 32;
    unint64_t v70 = *v67;
    uint64_t v71 = MEMORY[0x263F8D310];
    uint64_t v72 = MEMORY[0x263F8D320];
    uint64_t v73 = v68 + 8;
    int64_t v212 = v66;
    while (1)
    {
      uint64_t v222 = v69;
      uint64_t v74 = *(void *)(v217 + 8 * v69);
      uint64_t v75 = *(void *)(v74 + 16);
      if (v75) {
        break;
      }
      uint64_t v227 = (void *)MEMORY[0x263F8EE78];
LABEL_78:
      uint64_t v90 = v232;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_21F0C38F8(0, *(void *)(v232 + 16) + 1, 1);
        uint64_t v90 = v232;
      }
      uint64_t v91 = v222;
      unint64_t v93 = *(void *)(v90 + 16);
      unint64_t v92 = *(void *)(v90 + 24);
      if (v93 >= v92 >> 1)
      {
        sub_21F0C38F8(v92 > 1, v93 + 1, 1);
        uint64_t v91 = v222;
        uint64_t v90 = v232;
      }
      uint64_t v69 = v91 + 1;
      *(void *)(v90 + 16) = v93 + 1;
      *(void *)(v90 + 8 * v93 + 32) = v227;
      if (v69 == v66)
      {
        uint64_t v205 = v90;
        swift_bridgeObjectRelease();
        uint64_t v47 = MEMORY[0x263F8EE78];
        goto LABEL_85;
      }
    }
    swift_bridgeObjectRetain_n();
    uint64_t v76 = 0;
    uint64_t v227 = (void *)MEMORY[0x263F8EE78];
    while (1)
    {
      uint64_t v77 = *(void *)(v74 + 8 * v76 + 32);
      swift_bridgeObjectRetain();
      id v78 = v70;
      id v229 = (id)sub_21F0C9098();
      sub_21F0C9378();
      if (*(void *)(v77 + 16) && (unint64_t v79 = sub_21F0C442C((uint64_t)v233), (v80 & 1) != 0))
      {
        sub_21F09F5EC(*(void *)(v77 + 56) + 32 * v79, (uint64_t)&v234);
      }
      else
      {
        long long v234 = 0u;
        long long v235 = 0u;
      }
      sub_21F0AE43C((uint64_t)v233);
      if (*((void *)&v235 + 1))
      {
        if (swift_dynamicCast())
        {
          uint64_t v81 = v74;
          uint64_t v82 = v75;
          int v83 = v70;
          uint64_t v84 = v73;
          uint64_t v85 = v72;
          uint64_t v86 = v71;
          id v87 = objc_msgSend(v229, sel_longLongValue);
          swift_bridgeObjectRelease();

          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v227 = sub_21F09D038(0, v227[2] + 1, 1, v227);
          }
          unint64_t v89 = v227[2];
          unint64_t v88 = v227[3];
          if (v89 >= v88 >> 1) {
            uint64_t v227 = sub_21F09D038((void *)(v88 > 1), v89 + 1, 1, v227);
          }
          v227[2] = v89 + 1;
          v227[v89 + 4] = v87;
          uint64_t v71 = v86;
          uint64_t v72 = v85;
          uint64_t v73 = v84;
          unint64_t v70 = v83;
          uint64_t v75 = v82;
          uint64_t v74 = v81;
          goto LABEL_64;
        }
      }
      else
      {
        sub_21F0A620C((uint64_t)&v234);
      }
      swift_bridgeObjectRelease();
LABEL_64:
      if (v75 == ++v76)
      {
        swift_bridgeObjectRelease_n();
        int64_t v66 = v212;
        goto LABEL_78;
      }
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v205 = MEMORY[0x263F8EE78];
LABEL_85:
  id v94 = objc_msgSend(v211, sel_faceprintsID);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EBB068);
  uint64_t v95 = sub_21F0C9128();

  int64_t v96 = *(void *)(v95 + 16);
  if (v96)
  {
    *(void *)&v233[0] = v47;
    sub_21F0C3A50(0, v96, 0);
    uint64_t v97 = 0;
    uint64_t v98 = *(void *)&v233[0];
    int64_t v218 = v96;
    uint64_t v223 = v95 + 32;
    while (1)
    {
      unint64_t v99 = *(void *)(v223 + 8 * v97);
      if (v99 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v100 = sub_21F0C9488();
        if (!v100)
        {
LABEL_99:
          swift_bridgeObjectRelease();
          uint64_t v102 = v47;
          goto LABEL_100;
        }
      }
      else
      {
        uint64_t v100 = *(void *)((v99 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (!v100) {
          goto LABEL_99;
        }
      }
      *(void *)&long long v234 = v47;
      sub_21F0C3AA8(0, v100 & ~(v100 >> 63), 0);
      if (v100 < 0)
      {
        __break(1u);
LABEL_149:
        __break(1u);
LABEL_150:
        __break(1u);
      }
      uint64_t v101 = 0;
      uint64_t v102 = v234;
      do
      {
        if ((v99 & 0xC000000000000001) != 0) {
          id v103 = (id)MEMORY[0x223C42390](v101, v99);
        }
        else {
          id v103 = *(id *)(v99 + 8 * v101 + 32);
        }
        double v104 = v103;
        objc_msgSend(v103, sel_floatValue);
        int v106 = v105;

        *(void *)&long long v234 = v102;
        unint64_t v108 = *(void *)(v102 + 16);
        unint64_t v107 = *(void *)(v102 + 24);
        if (v108 >= v107 >> 1)
        {
          sub_21F0C3AA8(v107 > 1, v108 + 1, 1);
          uint64_t v102 = v234;
        }
        ++v101;
        *(void *)(v102 + 16) = v108 + 1;
        *(_DWORD *)(v102 + 4 * v108 + 32) = v106;
      }
      while (v100 != v101);
      swift_bridgeObjectRelease();
      uint64_t v47 = MEMORY[0x263F8EE78];
      int64_t v96 = v218;
LABEL_100:
      *(void *)&v233[0] = v98;
      unint64_t v110 = *(void *)(v98 + 16);
      unint64_t v109 = *(void *)(v98 + 24);
      if (v110 >= v109 >> 1)
      {
        sub_21F0C3A50(v109 > 1, v110 + 1, 1);
        uint64_t v98 = *(void *)&v233[0];
      }
      ++v97;
      *(void *)(v98 + 16) = v110 + 1;
      *(void *)(v98 + 8 * v110 + 32) = v102;
      if (v97 == v96)
      {
        swift_bridgeObjectRelease();
        goto LABEL_105;
      }
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v98 = MEMORY[0x263F8EE78];
LABEL_105:
  uint64_t v228 = v98;
  id v111 = objc_msgSend(v211, sel_timestampsID);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EBAFB0);
  uint64_t v112 = sub_21F0C9128();

  uint64_t v113 = *(void *)(v112 + 16);
  if (v113)
  {
    uint64_t v114 = (void *)*MEMORY[0x263F010D8];
    swift_bridgeObjectRetain();
    uint64_t v115 = 0;
    uint64_t v224 = (void *)MEMORY[0x263F8EE78];
    uint64_t v116 = MEMORY[0x263F8D310];
    uint64_t v117 = MEMORY[0x263F8EE58] + 8;
    uint64_t v219 = v112;
    while (1)
    {
      uint64_t v118 = *(void *)(v112 + 8 * v115 + 32);
      swift_bridgeObjectRetain();
      id v119 = v114;
      id v230 = (id)sub_21F0C9098();
      sub_21F0C9378();
      if (*(void *)(v118 + 16) && (unint64_t v120 = sub_21F0C442C((uint64_t)v233), (v121 & 1) != 0))
      {
        sub_21F09F5EC(*(void *)(v118 + 56) + 32 * v120, (uint64_t)&v234);
      }
      else
      {
        long long v234 = 0u;
        long long v235 = 0u;
      }
      sub_21F0AE43C((uint64_t)v233);
      if (*((void *)&v235 + 1))
      {
        if (swift_dynamicCast())
        {
          uint64_t v122 = v113;
          uint64_t v123 = v114;
          uint64_t v124 = v117;
          uint64_t v125 = v116;
          id v126 = objc_msgSend(v230, sel_longLongValue);
          swift_bridgeObjectRelease();

          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v224 = sub_21F09D038(0, v224[2] + 1, 1, v224);
          }
          unint64_t v128 = v224[2];
          unint64_t v127 = v224[3];
          if (v128 >= v127 >> 1) {
            uint64_t v224 = sub_21F09D038((void *)(v127 > 1), v128 + 1, 1, v224);
          }
          v224[2] = v128 + 1;
          v224[v128 + 4] = v126;
          uint64_t v116 = v125;
          uint64_t v117 = v124;
          uint64_t v114 = v123;
          uint64_t v113 = v122;
          uint64_t v112 = v219;
          goto LABEL_109;
        }
      }
      else
      {
        sub_21F0A620C((uint64_t)&v234);
      }
      swift_bridgeObjectRelease();
LABEL_109:
      if (v113 == ++v115)
      {
        swift_bridgeObjectRelease();
        goto LABEL_123;
      }
    }
  }
  uint64_t v224 = (void *)MEMORY[0x263F8EE78];
LABEL_123:
  swift_bridgeObjectRelease();
  id v129 = objc_msgSend(v211, sel_timestampsButtonPressed);
  uint64_t v130 = sub_21F0C9128();

  uint64_t v131 = *(void *)(v130 + 16);
  uint64_t v132 = MEMORY[0x263F8EE58];
  if (v131)
  {
    uint64_t v133 = (void *)*MEMORY[0x263F010D8];
    swift_bridgeObjectRetain();
    uint64_t v134 = 0;
    v220 = (void *)MEMORY[0x263F8EE78];
    uint64_t v135 = MEMORY[0x263F8D320];
    uint64_t v136 = v132 + 8;
    uint64_t v213 = v130;
    while (1)
    {
      uint64_t v137 = *(void *)(v130 + 8 * v134 + 32);
      swift_bridgeObjectRetain();
      id v138 = v133;
      id v231 = (id)sub_21F0C9098();
      sub_21F0C9378();
      if (*(void *)(v137 + 16) && (unint64_t v139 = sub_21F0C442C((uint64_t)v233), (v140 & 1) != 0))
      {
        sub_21F09F5EC(*(void *)(v137 + 56) + 32 * v139, (uint64_t)&v234);
      }
      else
      {
        long long v234 = 0u;
        long long v235 = 0u;
      }
      sub_21F0AE43C((uint64_t)v233);
      if (*((void *)&v235 + 1))
      {
        if (swift_dynamicCast())
        {
          uint64_t v141 = v131;
          unint64_t v142 = v133;
          uint64_t v143 = v136;
          uint64_t v144 = v135;
          id v145 = objc_msgSend(v231, sel_longLongValue);
          swift_bridgeObjectRelease();

          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            v220 = sub_21F09D038(0, v220[2] + 1, 1, v220);
          }
          unint64_t v147 = v220[2];
          unint64_t v146 = v220[3];
          if (v147 >= v146 >> 1) {
            v220 = sub_21F09D038((void *)(v146 > 1), v147 + 1, 1, v220);
          }
          v220[2] = v147 + 1;
          v220[v147 + 4] = v145;
          uint64_t v135 = v144;
          uint64_t v136 = v143;
          uint64_t v133 = v142;
          uint64_t v131 = v141;
          uint64_t v130 = v213;
          goto LABEL_127;
        }
      }
      else
      {
        sub_21F0A620C((uint64_t)&v234);
      }
      swift_bridgeObjectRelease();
LABEL_127:
      if (v131 == ++v134)
      {
        swift_bridgeObjectRelease();
        goto LABEL_141;
      }
    }
  }
  v220 = (void *)MEMORY[0x263F8EE78];
LABEL_141:
  swift_bridgeObjectRelease();
  id v148 = objc_msgSend(v211, sel_assessmentFAC);
  objc_msgSend(v148, sel_floatValue);
  int v150 = v149;

  id v151 = objc_msgSend(v211, sel_assessmentTA);
  id v225 = objc_msgSend(v151, sel_integerValue);

  id v152 = objc_msgSend(v211, sel_maxNccLow);
  objc_msgSend(v152, sel_floatValue);
  int v154 = v153;

  id v155 = objc_msgSend(v211, sel_maxNccHigh);
  objc_msgSend(v155, sel_floatValue);
  int v157 = v156;

  id v158 = objc_msgSend(v211, sel_ignoredStitches);
  id v159 = objc_msgSend(v158, sel_integerValue);

  id v160 = objc_msgSend(v211, sel_assessmentFakePRD);
  objc_msgSend(v160, sel_floatValue);
  int v162 = v161;

  id v163 = objc_msgSend(v211, sel_assessmentLivePRD);
  objc_msgSend(v163, sel_floatValue);
  int v165 = v164;

  id v166 = objc_msgSend(v211, sel_assessmentID);
  objc_msgSend(v166, sel_floatValue);
  int v168 = v167;

  id v169 = objc_msgSend(v211, sel_deviceInfo);
  id v214 = v159;
  if (v169)
  {
    uint64_t v170 = v169;
    uint64_t v171 = sub_21F0C9078();
    uint64_t v198 = v172;
    uint64_t v199 = v171;
  }
  else
  {
    uint64_t v198 = 0;
    uint64_t v199 = 0;
  }
  if (v208 == (id)2) {
    uint64_t v173 = 2;
  }
  else {
    uint64_t v173 = v208 == (id)1;
  }
  id v174 = objc_msgSend(v211, sel_ageLabel);
  uint64_t v175 = sub_21F0C9078();
  uint64_t v209 = v176;

  id v177 = objc_msgSend(v211, sel_sexLabel);
  uint64_t v178 = sub_21F0C9078();
  uint64_t v203 = v179;
  uint64_t v204 = v178;

  id v180 = objc_msgSend(v211, sel_skintoneLabel);
  uint64_t v181 = sub_21F0C9078();
  uint64_t v201 = v182;
  uint64_t v202 = v181;

  id v183 = objc_msgSend(v211, sel_ethnicityLabel);
  uint64_t v200 = sub_21F0C9078();
  uint64_t v185 = v184;

  id v186 = objc_msgSend(v211, sel_faceHairLabel);
  uint64_t v187 = sub_21F0C9078();
  uint64_t v189 = v188;

  id v190 = objc_msgSend(v211, sel_headgearLabel);
  uint64_t v191 = sub_21F0C9078();
  uint64_t v193 = v192;

  id v194 = objc_msgSend(v211, sel_glassesLabel);
  uint64_t v195 = sub_21F0C9078();
  uint64_t v197 = v196;

  *(void *)uint64_t v210 = v173;
  *(void *)(v210 + 8) = v207;
  *(void *)(v210 + 16) = v206;
  *(void *)(v210 + 24) = v216;
  *(void *)(v210 + 32) = v215;
  *(void *)(v210 + 4sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = v205;
  *(void *)(v210 + 48) = v224;
  *(void *)(v210 + 56) = v220;
  *(void *)(v210 + 64) = v228;
  *(_DWORD *)(v210 + 72) = v150;
  *(void *)(v210 + 8sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = v225;
  *(_DWORD *)(v210 + 88) = v162;
  *(_DWORD *)(v210 + 92) = v165;
  *(_DWORD *)(v210 + 96) = v168;
  *(_DWORD *)(v210 + 10sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = v154;
  *(_DWORD *)(v210 + 104) = v157;
  *(void *)(v210 + 112) = v214;
  *(void *)(v210 + 12sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = v199;
  *(void *)(v210 + 128) = v198;
  *(void *)(v210 + 136) = v175;
  *(void *)(v210 + 144) = v209;
  *(void *)(v210 + 152) = v204;
  *(void *)(v210 + 16sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = v203;
  *(void *)(v210 + 168) = v202;
  *(void *)(v210 + 176) = v201;
  *(void *)(v210 + 184) = v200;
  *(void *)(v210 + 192) = v185;
  *(void *)(v210 + 20sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = v187;
  *(void *)(v210 + 208) = v189;
  *(void *)(v210 + 216) = v191;
  *(void *)(v210 + 224) = v193;
  *(void *)(v210 + 232) = v195;
  *(void *)(v210 + 24sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = v197;
}

uint64_t sub_21F0AD418()
{
  if (*(void *)(v0 + OBJC_IVAR____TtC10CoreIDVPAD30PADInternalAuditDataRepository_dataRecorder)) {
    return sub_21F09A5CC();
  }
  return result;
}

void (*sub_21F0AD540(void (*result)(char *, uint64_t), uint64_t a2, char *a3))(char *, uint64_t)
{
  if (*(void *)(v3 + OBJC_IVAR____TtC10CoreIDVPAD30PADInternalAuditDataRepository_dataRecorder)) {
    return (void (*)(char *, uint64_t))sub_21F09AB14(result, a2, a3);
  }
  return result;
}

void sub_21F0AD600(uint64_t a1, uint64_t a2, char *a3, void *a4)
{
  uint64_t v9 = sub_21F0C8FC8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  id v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = sub_21F0AE018(a4);
  if (v13)
  {
    if (*(void *)(v4 + OBJC_IVAR____TtC10CoreIDVPAD30PADInternalAuditDataRepository_dataRecorder))
    {
      id v20 = v13;
      sub_21F09B204(a1, a2, a3, v13);
      uint64_t v14 = v20;
    }
    else
    {
      MEMORY[0x270F9A828]();
    }
  }
  else
  {
    if (qword_267EBAB80 != -1) {
      swift_once();
    }
    uint64_t v15 = __swift_project_value_buffer(v9, (uint64_t)qword_267EBAB88);
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v15, v9);
    unint64_t v16 = sub_21F0C8FA8();
    os_log_type_t v17 = sub_21F0C9238();
    if (os_log_type_enabled(v16, v17))
    {
      unint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v18 = 0;
      _os_log_impl(&dword_21F07C000, v16, v17, "PADInternalAuditDataRepository: Unable to create Face Pose representation from input dictionary.", v18, 2u);
      MEMORY[0x223C43270](v18, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
}

void sub_21F0AD8D0(void *a1)
{
  uint64_t v3 = sub_21F0C8FC8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21F0ADBB4(a1, &v22);
  char v7 = v23;
  if (v23 == 2)
  {
    if (qword_267EBAB80 != -1) {
      swift_once();
    }
    uint64_t v8 = __swift_project_value_buffer(v3, (uint64_t)qword_267EBAB88);
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v8, v3);
    uint64_t v9 = sub_21F0C8FA8();
    os_log_type_t v10 = sub_21F0C9238();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_21F07C000, v9, v10, "PADInternalAuditDataRepository: Unable to create TA assessment from input dictionary.", v11, 2u);
      MEMORY[0x223C43270](v11, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  else
  {
    uint64_t v12 = *(void *)(v1 + OBJC_IVAR____TtC10CoreIDVPAD30PADInternalAuditDataRepository_dataRecorder);
    if (v12)
    {
      uint64_t v13 = v22;
      unint64_t v14 = HIDWORD(v23);
      uint64_t v15 = (void *)(v12 + 24);
      swift_beginAccess();
      unint64_t v16 = *(void **)(v12 + 24);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(void *)(v12 + 24) = v16;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        unint64_t v16 = sub_21F09CA4C(0, v16[2] + 1, 1, v16);
        void *v15 = v16;
      }
      unint64_t v19 = v16[2];
      unint64_t v18 = v16[3];
      if (v19 >= v18 >> 1)
      {
        unint64_t v16 = sub_21F09CA4C((void *)(v18 > 1), v19 + 1, 1, v16);
        void *v15 = v16;
      }
      _OWORD v16[2] = v19 + 1;
      id v20 = &v16[2 * v19];
      v20[4] = v13;
      *((unsigned char *)v20 + 4sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = v7 & 1;
      *((_DWORD *)v20 + 11) = v14;
      swift_endAccess();
    }
  }
}

void sub_21F0ADBB4(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = (void *)sub_21F0C9048();
  id v5 = objc_msgSend(a1, sel_objectForKey_, v4);

  if (v5)
  {
    sub_21F0C9328();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
  }
  sub_21F0A52D0((uint64_t)&v17, (uint64_t)v19);
  if (!v20) {
    goto LABEL_20;
  }
  sub_21F093AE0();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_21:
    uint64_t v11 = 0;
    unint64_t v15 = 2;
    goto LABEL_22;
  }
  uint64_t v6 = (void *)sub_21F0C9048();
  id v7 = objc_msgSend(a1, sel_objectForKey_, v6);

  if (v7)
  {
    sub_21F0C9328();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
  }
  sub_21F0A52D0((uint64_t)&v17, (uint64_t)v19);
  if (!v20) {
    goto LABEL_19;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {

    goto LABEL_21;
  }
  uint64_t v8 = (void *)sub_21F0C9048();
  id v9 = objc_msgSend(a1, sel_objectForKey_, v8);

  if (v9)
  {
    sub_21F0C9328();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
  }
  sub_21F0A52D0((uint64_t)&v17, (uint64_t)v19);
  if (!v20)
  {

LABEL_19:
LABEL_20:
    sub_21F0A620C((uint64_t)v19);
    goto LABEL_21;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {

    goto LABEL_21;
  }
  objc_msgSend(v16, sel_doubleValue);
  uint64_t v11 = v10;
  unsigned int v12 = objc_msgSend(v16, sel_BOOLValue);
  objc_msgSend(v16, sel_floatValue);
  unsigned int v14 = v13;

  unint64_t v15 = v12 | ((unint64_t)v14 << 32);
LABEL_22:
  *a2 = v11;
  a2[1] = v15;
}

id PADInternalAuditDataRepository.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id PADInternalAuditDataRepository.init()()
{
  uint64_t v1 = OBJC_IVAR____TtC10CoreIDVPAD30PADInternalAuditDataRepository_dataRecorder;
  uint64_t v2 = qword_267EBABA8;
  uint64_t v3 = v0;
  if (v2 != -1) {
    swift_once();
  }
  *(void *)&v3[v1] = qword_267EBAF00;
  swift_retain();

  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for PADInternalAuditDataRepository();
  return objc_msgSendSuper2(&v5, sel_init);
}

id PADInternalAuditDataRepository.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PADInternalAuditDataRepository();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_21F0AE018(void *a1)
{
  objc_super v2 = (void *)sub_21F0C9048();
  id v3 = objc_msgSend(a1, sel_objectForKey_, v2);

  if (v3)
  {
    sub_21F0C9328();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v23 = 0u;
    long long v24 = 0u;
  }
  sub_21F0A52D0((uint64_t)&v23, (uint64_t)v25);
  if (!v26) {
    goto LABEL_20;
  }
  sub_21F093AE0();
  if ((swift_dynamicCast() & 1) == 0) {
    return 0;
  }
  id v4 = v22;
  objc_super v5 = (void *)sub_21F0C9048();
  id v6 = objc_msgSend(a1, sel_objectForKey_, v5);

  if (v6)
  {
    sub_21F0C9328();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v23 = 0u;
    long long v24 = 0u;
  }
  sub_21F0A52D0((uint64_t)&v23, (uint64_t)v25);
  if (!v26) {
    goto LABEL_19;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {

    return 0;
  }
  id v7 = v22;
  uint64_t v8 = (void *)sub_21F0C9048();
  id v9 = objc_msgSend(a1, sel_objectForKey_, v8);

  if (v9)
  {
    sub_21F0C9328();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v23 = 0u;
    long long v24 = 0u;
  }
  sub_21F0A52D0((uint64_t)&v23, (uint64_t)v25);
  if (!v26)
  {

LABEL_19:
LABEL_20:
    sub_21F0A620C((uint64_t)v25);
    return 0;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {

    return 0;
  }
  id v10 = v22;
  objc_msgSend(v22, sel_floatValue);
  float v12 = v11;
  objc_msgSend(v22, sel_floatValue);
  float v14 = v13;
  objc_msgSend(v22, sel_floatValue);
  float v16 = v15;
  long long v17 = (objc_class *)type metadata accessor for PADSWPose();
  long long v18 = (char *)objc_allocWithZone(v17);
  *(double *)&v18[OBJC_IVAR____TtC10CoreIDVPAD9PADSWPose_pitch] = v12;
  *(double *)&v18[OBJC_IVAR____TtC10CoreIDVPAD9PADSWPose_yaw] = v14;
  *(double *)&v18[OBJC_IVAR____TtC10CoreIDVPAD9PADSWPose_roll] = v16;
  v21.receiver = v18;
  v21.super_class = v17;
  id v19 = objc_msgSendSuper2(&v21, sel_init);

  return v19;
}

uint64_t type metadata accessor for PADInternalAuditDataRepository()
{
  return self;
}

uint64_t method lookup function for PADInternalAuditDataRepository(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PADInternalAuditDataRepository);
}

uint64_t dispatch thunk of PADInternalAuditDataRepository.storeClassifierResult(_:imageData:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x58))();
}

uint64_t dispatch thunk of PADInternalAuditDataRepository.storeUnencryptedVideoFrom(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of PADInternalAuditDataRepository.storePRDBuffer(_:name:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of PADInternalAuditDataRepository.storeFACPoseBuffer(_:identifier:values:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of PADInternalAuditDataRepository.storeTAValues(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t sub_21F0AE43C(uint64_t a1)
{
  return a1;
}

void *initializeBufferWithCopyOfBuffer for PADCounter(void *a1, void *a2)
{
  id v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  id v4 = v3;
  return a1;
}

void destroy for PADCounter(uint64_t a1)
{
}

void *assignWithCopy for PADCounter(void *a1, void *a2)
{
  *a1 = *a2;
  id v3 = (void *)a2[1];
  id v4 = (void *)a1[1];
  a1[1] = v3;
  id v5 = v3;

  return a1;
}

void *assignWithTake for PADCounter(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  id v4 = (void *)a1[1];
  *a1 = *a2;
  a1[1] = v3;

  return a1;
}

uint64_t getEnumTagSinglePayload for PADCounter(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PADCounter(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)uint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PADCounter()
{
  return &type metadata for PADCounter;
}

uint64_t sub_21F0AE5D0()
{
  return sub_21F0C95B8();
}

uint64_t (*sub_21F0AE620())()
{
  return j__swift_endAccess;
}

uint64_t sub_21F0AE674(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)(v2 + 16) = 0u;
  *(_OWORD *)(v2 + 32) = 0u;
  uint64_t v5 = MEMORY[0x263F8EE78];
  *(void *)(v2 + 48) = MEMORY[0x263F8EE78];
  *(void *)(v2 + 72) = dispatch_semaphore_create(1);
  *(void *)(v2 + 8sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = v5;
  *(void *)(v2 + 88) = 0;
  *(unsigned char *)(v2 + 96) = 0;
  *(void *)(v2 + 104) = 0;
  *(void *)(v2 + 112) = 0;
  *(void *)(v2 + 56) = a1;
  *(void *)(v2 + 64) = 0;
  *(void *)(v2 + 12sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = a2;
  return v2;
}

uint64_t sub_21F0AE6D8(uint64_t a1)
{
  uint64_t v12 = a1;
  uint64_t v11 = sub_21F0C9258();
  uint64_t v2 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  id v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_21F0C9248();
  MEMORY[0x270FA5388](v5);
  uint64_t v6 = sub_21F0C8FF8();
  MEMORY[0x270FA5388](v6 - 8);
  *(_OWORD *)(v1 + 16) = 0u;
  *(_OWORD *)(v1 + 32) = 0u;
  uint64_t v7 = MEMORY[0x263F8EE78];
  *(void *)(v1 + 48) = MEMORY[0x263F8EE78];
  dispatch_semaphore_t v8 = dispatch_semaphore_create(1);
  *(void *)(v1 + 64) = 0;
  *(void *)(v1 + 72) = v8;
  *(void *)(v1 + 8sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = v7;
  *(void *)(v1 + 88) = 0;
  *(unsigned char *)(v1 + 96) = 0;
  sub_21F0A5404(0, &qword_267EBB080);
  *(void *)(v1 + 104) = 0;
  *(void *)(v1 + 112) = 0;
  sub_21F0C8FE8();
  uint64_t v13 = v7;
  sub_21F0B10A4((unint64_t *)&qword_267EBB520, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EBB158);
  sub_21F0B10EC((unint64_t *)&qword_267EBB530, &qword_267EBB158);
  sub_21F0C9338();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F8F130], v11);
  *(void *)(v1 + 56) = sub_21F0C9288();
  *(void *)(v1 + 12sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = v12;
  return v1;
}

void sub_21F0AE95C(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_21F0C8FD8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_21F0C8FF8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v12 = *(void *)(v1 + 64);
  id v13 = *(id *)(v1 + 72);
  sub_21F0C9298();
  sub_21F0C92A8();

  if (v12 <= 0)
  {
    v18[1] = *(void *)(v2 + 56);
    uint64_t v14 = swift_allocObject();
    swift_weakInit();
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = v14;
    *(void *)(v15 + 24) = a1;
    aBlock[4] = sub_21F0B109C;
    aBlock[5] = v15;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_21F0A2040;
    aBlock[3] = &block_descriptor_49;
    float v16 = _Block_copy(aBlock);
    swift_retain();
    id v17 = a1;
    sub_21F0C8FE8();
    v18[2] = MEMORY[0x263F8EE78];
    sub_21F0B10A4((unint64_t *)&qword_267EBB088, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267EBB090);
    v18[0] = v8;
    sub_21F0B10EC((unint64_t *)&qword_267EBB098, &qword_267EBB090);
    sub_21F0C9338();
    MEMORY[0x223C42230](0, v11, v7, v16);
    _Block_release(v16);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    (*(void (**)(char *, void))(v9 + 8))(v11, v18[0]);
    swift_release();
    swift_release();
  }
}

uint64_t sub_21F0AEC78(uint64_t a1, char *a2)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v4 = result;
    swift_beginAccess();
    uint64_t v5 = *(void *)(v4 + 64);
    id v6 = *(id *)(v4 + 72);
    sub_21F0C9298();
    sub_21F0C92A8();

    if (v5 <= 0 && ((*(uint64_t (**)(char *))(*(void *)v4 + 384))(a2) & 1) != 0) {
      sub_21F0AED50(a2);
    }
    return swift_release();
  }
  return result;
}

void sub_21F0AED50(char *a1)
{
  uint64_t v2 = v1;
  v76[8] = *(id *)MEMORY[0x263EF8340];
  uint64_t v67 = sub_21F0C8FC8();
  uint64_t v65 = *(void *)(v67 - 8);
  MEMORY[0x270FA5388](v67);
  int64_t v66 = (char *)v64 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v1[96] = 1;
  uint64_t v5 = swift_allocObject();
  swift_weakInit();
  id v6 = *(uint64_t (**)(char *, uint64_t (*)(uint64_t, void *), uint64_t))(*(void *)v1 + 400);
  swift_retain();
  uint64_t v7 = v6(a1, sub_21F0B0F30, v5);
  swift_release_n();
  *((void *)v2 + 1sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(*((void *)v2 + 10) + 16);
  v64[2] = v2 + 64;
  swift_beginAccess();
  uint64_t v9 = (void *)*((void *)v2 + 9);
  sub_21F0C9298();
  *((void *)v2 + 8) = v8;
  id v10 = v9;
  sub_21F0C92A8();
  swift_endAccess();

  uint64_t v69 = a1;
  long long v68 = *(_OWORD *)&a1[OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_time];
  uint64_t v11 = *(void *)&a1[OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_time + 16];
  uint64_t v12 = MEMORY[0x263F8EE78];
  unint64_t v13 = sub_21F0BB43C(MEMORY[0x263F8EE78]);
  swift_beginAccess();
  *((_OWORD *)v2 + 1) = v68;
  *((void *)v2 + 4) = v11;
  *((void *)v2 + 5) = v13;
  swift_bridgeObjectRelease();
  uint64_t v71 = (void *)v12;
  unint64_t v72 = v12;
  uint64_t v14 = *((void *)v2 + 10);
  uint64_t v15 = *(void *)(v14 + 16);
  if (v15)
  {
    *(void *)&long long v68 = v2;
    uint64_t v16 = v14 + 32;
    v64[1] = v14;
    swift_bridgeObjectRetain();
    do
    {
      sub_21F093D74(v16, (uint64_t)v76);
      sub_21F093D74((uint64_t)v76, (uint64_t)v73);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267EBB240);
      sub_21F0A5404(0, (unint64_t *)&unk_267EBB410);
      if (swift_dynamicCast())
      {
        id v23 = v70;
        MEMORY[0x223C420C0]();
        if (*(void *)((v72 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v72 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_21F0C9158();
        }
        sub_21F0C9178();
        sub_21F0C9148();
      }
      else
      {
        sub_21F093D74((uint64_t)v76, (uint64_t)v73);
        long long v24 = v71;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          long long v24 = sub_21F09D258(0, v24[2] + 1, 1, v24);
          uint64_t v71 = v24;
        }
        unint64_t v26 = v24[2];
        unint64_t v25 = v24[3];
        if (v26 >= v25 >> 1) {
          uint64_t v71 = sub_21F09D258((void *)(v25 > 1), v26 + 1, 1, v24);
        }
        uint64_t v17 = v74;
        uint64_t v18 = v75;
        uint64_t v19 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v73, v74);
        MEMORY[0x270FA5388](v19);
        objc_super v21 = (char *)v64 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v22 + 16))(v21);
        sub_21F0B0E44(v26, (uint64_t)v21, (uint64_t *)&v71, v17, v18);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v73);
      }
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v76);
      v16 += 40;
      --v15;
    }
    while (v15);
    swift_bridgeObjectRelease();
    uint64_t v12 = (uint64_t)v71;
    uint64_t v2 = (unsigned char *)v68;
  }
  unint64_t v27 = v69;
  sub_21F0AFA94(v12, v69);
  swift_bridgeObjectRelease();
  id v28 = *(void **)&v27[OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_buffer];
  uint64_t v29 = *(unsigned int *)&v27[OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_orientation];
  id v30 = v28;
  sub_21F0BB558(MEMORY[0x263F8EE78]);
  id v31 = objc_allocWithZone(MEMORY[0x263F1EF40]);
  type metadata accessor for VNImageOption(0);
  sub_21F0B10A4(&qword_267EBACE0, type metadata accessor for VNImageOption);
  uint64_t v32 = (void *)sub_21F0C9018();
  swift_bridgeObjectRelease();
  id v33 = objc_msgSend(v31, sel_initWithCVPixelBuffer_orientation_options_, v30, v29, v32);

  sub_21F0A5404(0, (unint64_t *)&unk_267EBB410);
  swift_bridgeObjectRetain();
  unint64_t v34 = (void *)sub_21F0C9118();
  swift_bridgeObjectRelease();
  v76[0] = 0;
  unsigned int v35 = objc_msgSend(v33, sel_performRequests_error_, v34, v76);

  if (v35)
  {
    id v36 = v76[0];

    swift_bridgeObjectRelease();
  }
  else
  {
    id v37 = v76[0];
    uint64_t v38 = (void *)sub_21F0C8E78();

    swift_willThrow();
    if (qword_267EBAB80 != -1) {
      swift_once();
    }
    uint64_t v39 = v67;
    uint64_t v40 = __swift_project_value_buffer(v67, (uint64_t)qword_267EBAB88);
    uint64_t v41 = v65;
    unint64_t v42 = v66;
    (*(void (**)(char *, uint64_t, uint64_t))(v65 + 16))(v66, v40, v39);
    id v43 = v38;
    id v44 = v38;
    uint64_t v45 = sub_21F0C8FA8();
    os_log_type_t v46 = sub_21F0C9238();
    if (os_log_type_enabled(v45, v46))
    {
      uint64_t v47 = (uint8_t *)swift_slowAlloc();
      uint64_t v48 = (void *)swift_slowAlloc();
      *(void *)&long long v68 = v2;
      uint64_t v49 = v48;
      v76[0] = v48;
      *(_DWORD *)uint64_t v47 = 136315138;
      swift_getErrorValue();
      uint64_t v50 = sub_21F0C9618();
      v73[0] = sub_21F09D6AC(v50, v51, (uint64_t *)v76);
      sub_21F0C9308();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_21F07C000, v45, v46, "Error dispatching Vision requests: %s", v47, 0xCu);
      swift_arrayDestroy();
      BOOL v52 = v49;
      uint64_t v2 = (unsigned char *)v68;
      MEMORY[0x223C43270](v52, -1, -1);
      MEMORY[0x223C43270](v47, -1, -1);

      (*(void (**)(char *, uint64_t))(v41 + 8))(v66, v67);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v41 + 8))(v42, v39);
    }
    if (v72 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v53 = sub_21F0C9488();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v53 = *(void *)((v72 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    swift_beginAccess();
    id v54 = (void *)*((void *)v2 + 9);
    sub_21F0C9298();
    uint64_t v55 = *((void *)v2 + 8);
    BOOL v56 = __OFSUB__(v55, v53);
    uint64_t v57 = v55 - v53;
    if (v56) {
      __break(1u);
    }
    *((void *)v2 + 8) = v57;
    id v58 = v54;
    sub_21F0C92A8();
    swift_endAccess();

    char v59 = (void *)*((void *)v2 + 11);
    *((void *)v2 + 11) = v38;
    id v60 = v38;

    uint64_t v61 = *((void *)v2 + 8);
    id v62 = *((id *)v2 + 9);
    sub_21F0C9298();
    sub_21F0C92A8();

    if (v61 <= 0)
    {
      (*(void (**)(void *))(*(void *)v2 + 440))(v38);

      uint64_t v63 = (void *)*((void *)v2 + 11);
      *((void *)v2 + 11) = 0;
    }
    else
    {

      uint64_t v63 = v38;
    }
  }
}

uint64_t sub_21F0AF6AC(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_21F0C8FD8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_21F0C8FF8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    id v19 = *(id *)(result + 56);
    swift_release();
    uint64_t v13 = swift_allocObject();
    uint64_t v20 = v8;
    swift_beginAccess();
    swift_weakLoadStrong();
    swift_weakInit();
    swift_release();
    sub_21F093D74(a1, (uint64_t)v23);
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = v13;
    sub_21F0B0FEC(v23, v14 + 24);
    *(void *)(v14 + 64) = a2;
    aBlock[4] = sub_21F0B104C;
    aBlock[5] = v14;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_21F0A2040;
    aBlock[3] = &block_descriptor_42;
    uint64_t v15 = _Block_copy(aBlock);
    swift_retain();
    id v16 = a2;
    sub_21F0C8FE8();
    uint64_t v21 = MEMORY[0x263F8EE78];
    sub_21F0B10A4((unint64_t *)&qword_267EBB088, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267EBB090);
    sub_21F0B10EC((unint64_t *)&qword_267EBB098, &qword_267EBB090);
    sub_21F0C9338();
    uint64_t v17 = v19;
    MEMORY[0x223C42230](0, v11, v7, v15);
    _Block_release(v15);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v20);
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_21F0AFA20(uint64_t a1, uint64_t a2, void *a3)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_21F0AFEFC(a2, a3);
    return swift_release();
  }
  return result;
}

uint64_t sub_21F0AFA94(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_21F0C8FD8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_21F0C8FF8();
  uint64_t v10 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v12 = (char *)v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18[1] = *(void *)(v3 + 56);
  uint64_t v13 = swift_allocObject();
  swift_weakInit();
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = a1;
  v14[3] = a2;
  void v14[4] = v13;
  aBlock[4] = sub_21F0B0F24;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21F0A2040;
  aBlock[3] = &block_descriptor_34;
  uint64_t v15 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  id v16 = a2;
  swift_retain();
  sub_21F0C8FE8();
  uint64_t v20 = MEMORY[0x263F8EE78];
  sub_21F0B10A4((unint64_t *)&qword_267EBB088, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EBB090);
  sub_21F0B10EC((unint64_t *)&qword_267EBB098, &qword_267EBB090);
  sub_21F0C9338();
  MEMORY[0x223C42230](0, v12, v9, v15);
  _Block_release(v15);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v19);
  swift_release();
  return swift_release();
}

uint64_t sub_21F0AFD88(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 16);
  if (v2)
  {
    uint64_t v4 = result + 32;
    swift_bridgeObjectRetain();
    swift_beginAccess();
    swift_beginAccess();
    do
    {
      sub_21F093D74(v4, (uint64_t)v7);
      uint64_t v5 = v8;
      uint64_t v6 = v9;
      __swift_project_boxed_opaque_existential_1(v7, v8);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(a2, v5, v6);
      if (swift_weakLoadStrong())
      {
        sub_21F0AFEFC((uint64_t)v7, 0);
        swift_release();
      }
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
      v4 += 40;
      --v2;
    }
    while (v2);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_21F0AFEE8()
{
  return 1;
}

uint64_t sub_21F0AFEF0()
{
  return MEMORY[0x263F8EE78];
}

void sub_21F0AFEFC(uint64_t a1, void *a2)
{
  uint64_t v3 = (void (**)(char *, uint64_t, uint64_t))v2;
  uint64_t v6 = sub_21F0C8FC8();
  uint64_t v7 = *(void (***)(char *, uint64_t, uint64_t))(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v81 = (void (**)(char *, uint64_t, uint64_t))((char *)&v77 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v77 - v10;
  uint64_t v12 = v2 + 8;
  swift_beginAccess();
  uint64_t v13 = (void *)v2[9];
  sub_21F0C9298();
  uint64_t v14 = v3[8];
  BOOL v15 = __OFSUB__(v14, 1);
  uint64_t v16 = (uint64_t)v14 - 1;
  if (v15)
  {
    __break(1u);
LABEL_38:
    swift_once();
    goto LABEL_4;
  }
  void *v12 = v16;
  id v17 = v13;
  sub_21F0C92A8();
  swift_endAccess();

  if (!a2) {
    goto LABEL_8;
  }
  id v18 = a2;
  if (qword_267EBAB80 != -1) {
    goto LABEL_38;
  }
LABEL_4:
  uint64_t v19 = __swift_project_value_buffer(v6, (uint64_t)qword_267EBAB88);
  v7[2](v11, v19, v6);
  sub_21F093D74(a1, (uint64_t)v84);
  id v20 = a2;
  id v21 = a2;
  uint64_t v22 = sub_21F0C8FA8();
  os_log_type_t v23 = sub_21F0C9238();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v24 = swift_slowAlloc();
    id v78 = v7;
    uint64_t v25 = v24;
    uint64_t v26 = swift_slowAlloc();
    v85[0] = v26;
    *(_DWORD *)uint64_t v25 = 136315394;
    uint64_t v79 = v6;
    sub_21F093D74((uint64_t)v84, (uint64_t)v82);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267EBB240);
    uint64_t v27 = sub_21F0C90A8();
    uint64_t v80 = a1;
    v82[0] = sub_21F09D6AC(v27, v28, v85);
    sub_21F0C9308();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v84);
    *(_WORD *)(v25 + 12) = 2080;
    swift_getErrorValue();
    uint64_t v29 = sub_21F0C9618();
    v82[0] = sub_21F09D6AC(v29, v30, v85);
    uint64_t v6 = v79;
    a1 = v80;
    sub_21F0C9308();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_21F07C000, v22, v23, "Request %s failed with error: %s", (uint8_t *)v25, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x223C43270](v26, -1, -1);
    uint64_t v31 = v25;
    uint64_t v7 = v78;
    MEMORY[0x223C43270](v31, -1, -1);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v84);
  }
  ((void (*)(char *, uint64_t))v7[1])(v11, v6);
  uint64_t v32 = v3[11];
  v3[11] = (void (*)(char *, uint64_t, uint64_t))a2;

LABEL_8:
  id v33 = v3[11];
  if (v33)
  {
    uint64_t v35 = (uint64_t)v3[8];
    unint64_t v34 = v3[9];
    id v36 = v33;
    id v37 = v34;
    sub_21F0C9298();
    sub_21F0C92A8();

    if (v35 <= 0)
    {
      (*((void (**)(void (*)(char *, uint64_t, uint64_t)))*v3 + 55))(v33);

      uint64_t v38 = v3[11];
      v3[11] = 0;
    }
    else
    {
      uint64_t v38 = v33;
    }
  }
  else
  {
    uint64_t v39 = v3 + 2;
    swift_beginAccess();
    if (v3[5])
    {
      uint64_t v40 = (*((uint64_t (**)(uint64_t))*v3 + 52))(a1);
      uint64_t v41 = v40;
      if (!v40 || !*(void *)(v40 + 16))
      {
        if (qword_267EBAB80 != -1) {
          swift_once();
        }
        uint64_t v42 = __swift_project_value_buffer(v6, (uint64_t)qword_267EBAB88);
        id v43 = v81;
        v7[2]((char *)v81, v42, v6);
        sub_21F093D74(a1, (uint64_t)v84);
        id v44 = sub_21F0C8FA8();
        os_log_type_t v45 = sub_21F0C9238();
        if (os_log_type_enabled(v44, v45))
        {
          uint64_t v80 = a1;
          os_log_type_t v46 = (uint8_t *)swift_slowAlloc();
          uint64_t v47 = swift_slowAlloc();
          id v78 = v3 + 2;
          uint64_t v48 = v7;
          uint64_t v49 = v47;
          uint64_t v83 = v47;
          uint64_t v79 = v6;
          *(_DWORD *)os_log_type_t v46 = 136315138;
          sub_21F093D74((uint64_t)v84, (uint64_t)v82);
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267EBB240);
          uint64_t v50 = sub_21F0C90A8();
          v82[0] = sub_21F09D6AC(v50, v51, &v83);
          a1 = v80;
          sub_21F0C9308();
          swift_bridgeObjectRelease();
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v84);
          _os_log_impl(&dword_21F07C000, v44, v45, "Request %s did not obtain any observations.", v46, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x223C43270](v49, -1, -1);
          MEMORY[0x223C43270](v46, -1, -1);

          ((void (*)(void (**)(char *, uint64_t, uint64_t), uint64_t))v48[1])(v81, v79);
          uint64_t v39 = v78;
        }
        else
        {
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v84);

          ((void (*)(void (**)(char *, uint64_t, uint64_t), uint64_t))v7[1])((void (**)(char *, uint64_t, uint64_t))v43, v6);
        }
      }
      uint64_t v53 = sub_21F0AE620();
      if (*(void *)(v52 + 24))
      {
        uint64_t v54 = v52;
        uint64_t v55 = (void *)a1;
        if (v41) {
          uint64_t v56 = v41;
        }
        else {
          uint64_t v56 = MEMORY[0x263F8EE78];
        }
        __swift_project_boxed_opaque_existential_1(v55, v55[3]);
        uint64_t DynamicType = swift_getDynamicType();
        uint64_t v58 = v55[4];
        v82[0] = DynamicType;
        v82[1] = v58;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267EBB150);
        uint64_t v59 = sub_21F0C90A8();
        uint64_t v61 = v60;
        swift_bridgeObjectRetain();
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v82[0] = *(void *)(v54 + 24);
        *(void *)(v54 + 24) = 0x8000000000000000;
        sub_21F0BC464(v56, v59, v61, isUniquelyReferenced_nonNull_native);
        *(void *)(v54 + 24) = v82[0];
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      ((void (*)(unsigned char *, void))v53)(v84, 0);
      uint64_t v63 = v3[5];
      if (v63 && *((void *)v63 + 2) == *((void *)v3[10] + 2))
      {
        uint64_t v65 = v3[2];
        id v64 = v3[3];
        int64_t v66 = v3[4];
        swift_beginAccess();
        uint64_t v67 = v3[6];
        swift_bridgeObjectRetain_n();
        char v68 = swift_isUniquelyReferenced_nonNull_native();
        v3[6] = v67;
        uint64_t v81 = v3 + 6;
        if ((v68 & 1) == 0)
        {
          uint64_t v67 = (void (*)(char *, uint64_t, uint64_t))sub_21F09D59C(0, *((void *)v67 + 2) + 1, 1, v67);
          v3[6] = v67;
        }
        unint64_t v70 = *((void *)v67 + 2);
        unint64_t v69 = *((void *)v67 + 3);
        if (v70 >= v69 >> 1)
        {
          uint64_t v67 = (void (*)(char *, uint64_t, uint64_t))sub_21F09D59C((void *)(v69 > 1), v70 + 1, 1, v67);
          char *v81 = v67;
        }
        *((void *)v67 + 2) = v70 + 1;
        uint64_t v71 = (void *)((char *)v67 + 32 * v70);
        v71[4] = v65;
        v71[5] = v64;
        v71[6] = v66;
        v71[7] = v63;
        swift_endAccess();
        (*((void (**)(void (*)(char *, uint64_t, uint64_t), void (*)(char *, uint64_t, uint64_t), void (*)(char *, uint64_t, uint64_t), void (*)(char *, uint64_t, uint64_t)))*v3
         + 53))(v65, v64, v66, v63);
        swift_bridgeObjectRelease();
        *(_OWORD *)uint64_t v39 = 0u;
        *((_OWORD *)v39 + 1) = 0u;
        uint64_t v72 = swift_bridgeObjectRelease();
        uint64_t v73 = *((void *)v3[6] + 2);
        if (v73 >= (*((uint64_t (**)(uint64_t))*v3 + 49))(v72))
        {
          uint64_t v74 = (void (*)(void))*((void *)*v3 + 54);
          uint64_t v75 = swift_bridgeObjectRetain();
          v74(v75);
          swift_bridgeObjectRelease();
          if (*((void *)v3[6] + 2))
          {
            uint64_t v76 = v81;
            swift_beginAccess();
            if (*(void *)(*v76 + 16))
            {
              swift_bridgeObjectRetain();
              sub_21F0C5C90(0, 1);
              swift_endAccess();
              swift_bridgeObjectRelease();
            }
            else
            {
              __break(1u);
            }
          }
        }
      }
    }
  }
}

uint64_t sub_21F0B0884(void *a1)
{
  uint64_t v1 = a1[3];
  uint64_t v2 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v2);
}

uint64_t sub_21F0B08D4()
{
  uint64_t v1 = *(void (**)(uint64_t))(v0 + 104);
  *(unsigned char *)(v0 + 96) = 0;
  if (v1)
  {
    uint64_t v2 = swift_retain();
    v1(v2);
    sub_21F0A46F0((uint64_t)v1);
    uint64_t v3 = *(void *)(v0 + 104);
  }
  else
  {
    uint64_t v3 = 0;
  }
  *(void *)(v0 + 104) = 0;
  *(void *)(v0 + 112) = 0;
  return sub_21F0A46F0(v3);
}

uint64_t sub_21F0B0950()
{
  uint64_t v1 = sub_21F0C8FD8();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_21F0C8FF8();
  uint64_t v5 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11[1] = *(void *)(v0 + 56);
  uint64_t v8 = swift_allocObject();
  swift_weakInit();
  aBlock[4] = sub_21F0B0E24;
  aBlock[5] = v8;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21F0A2040;
  aBlock[3] = &block_descriptor_2;
  uint64_t v9 = _Block_copy(aBlock);
  swift_retain();
  sub_21F0C8FE8();
  uint64_t v13 = MEMORY[0x263F8EE78];
  sub_21F0B10A4((unint64_t *)&qword_267EBB088, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EBB090);
  sub_21F0B10EC((unint64_t *)&qword_267EBB098, &qword_267EBB090);
  sub_21F0C9338();
  MEMORY[0x223C42230](0, v7, v4, v9);
  _Block_release(v9);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v12);
  swift_release();
  return swift_release();
}

uint64_t sub_21F0B0C10()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_21F0B0C68();
    return swift_release();
  }
  return result;
}

void sub_21F0B0C68()
{
  uint64_t v1 = v0;
  uint64_t v3 = sub_21F0AE620();
  if (*(void *)(v2 + 24))
  {
    uint64_t v4 = v2;
    swift_bridgeObjectRelease();
    *(void *)(v4 + 24) = MEMORY[0x263F8EE80];
  }
  ((void (*)(unsigned char *, void))v3)(v7, 0);
  swift_beginAccess();
  *(void *)(v1 + 48) = MEMORY[0x263F8EE78];
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v5 = *(void **)(v1 + 72);
  sub_21F0C9298();
  *(void *)(v1 + 64) = 0;
  id v6 = v5;
  sub_21F0C92A8();
  swift_endAccess();

  *(unsigned char *)(v1 + 96) = 0;
}

uint64_t sub_21F0B0D3C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  sub_21F0A46F0(*(void *)(v0 + 104));
  swift_release();
  return v0;
}

uint64_t sub_21F0B0D94()
{
  sub_21F0B0D3C();
  return MEMORY[0x270FA0228](v0, 128, 7);
}

uint64_t type metadata accessor for PADSerialRequestsScheduler()
{
  return self;
}

uint64_t sub_21F0B0DEC()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_21F0B0E24()
{
  return sub_21F0B0C10();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 4sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_21F0B0E44(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v13 = a4;
  uint64_t v14 = a5;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v12);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 32))(boxed_opaque_existential_1, a2, a4);
  uint64_t v10 = *a3;
  *(void *)(v10 + 16) = a1 + 1;
  return sub_21F0B0FEC(&v12, v10 + 40 * a1 + 32);
}

uint64_t sub_21F0B0EDC()
{
  swift_bridgeObjectRelease();

  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_21F0B0F24()
{
  return sub_21F0AFD88(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_21F0B0F30(uint64_t a1, void *a2)
{
  return sub_21F0AF6AC(a1, a2);
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_21F0B0FEC(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_21F0B1004()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);

  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_21F0B104C()
{
  return sub_21F0AFA20(*(void *)(v0 + 16), v0 + 24, *(void **)(v0 + 64));
}

uint64_t sub_21F0B105C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_21F0B109C()
{
  return sub_21F0AEC78(*(void *)(v0 + 16), *(char **)(v0 + 24));
}

uint64_t sub_21F0B10A4(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21F0B10EC(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_21F0B1158()
{
  qword_267EBE070 = 0x726F727245444150;
  *(void *)algn_267EBE078 = 0xE800000000000000;
}

uint64_t PADSWErrorCode.init(rawValue:)(uint64_t a1)
{
  return sub_21F0B12A8(a1);
}

BOOL sub_21F0B119C(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_21F0B11B0()
{
  return sub_21F0C9648();
}

uint64_t sub_21F0B11F8()
{
  return sub_21F0C9638();
}

uint64_t sub_21F0B1224()
{
  return sub_21F0C9648();
}

uint64_t sub_21F0B1268@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_21F0B12A8(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_21F0B129C(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_21F0B12A8(uint64_t result)
{
  if ((unint64_t)(result + 10) >= 0xB) {
    return 0;
  }
  return result;
}

unint64_t sub_21F0B12C4()
{
  unint64_t result = qword_267EBB160;
  if (!qword_267EBB160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EBB160);
  }
  return result;
}

ValueMetadata *type metadata accessor for PADSWErrorCode()
{
  return &type metadata for PADSWErrorCode;
}

id sub_21F0B1328(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, char a5)
{
  sub_21F0BB2DC(MEMORY[0x263F8EE78]);
  uint64_t v10 = sub_21F0C9078();
  uint64_t v12 = v11;
  unint64_t v36 = MEMORY[0x263F8D310];
  *(void *)&long long v35 = a1;
  *((void *)&v35 + 1) = a2;
  sub_21F0A52C0(&v35, v34);
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_21F0BC310(v34, v10, v12, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (a3)
  {
    id v14 = a3;
    BOOL v15 = (void *)sub_21F0C8E68();
    id v16 = objc_msgSend(v15, sel_domain);
    uint64_t v17 = sub_21F0C9078();
    uint64_t v19 = v18;

    if (qword_267EBABB0 != -1) {
      swift_once();
    }
    if (v17 == qword_267EBE070 && v19 == *(void *)algn_267EBE078)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v20 = sub_21F0C95D8();
      swift_bridgeObjectRelease();
      if ((v20 & 1) == 0)
      {
        uint64_t v24 = sub_21F0C9078();
        uint64_t v26 = v25;
        unint64_t v36 = sub_21F0B167C();
        *(void *)&long long v35 = v15;
        sub_21F0A52C0(&v35, v34);
        id v27 = v15;
        char v28 = swift_isUniquelyReferenced_nonNull_native();
        sub_21F0BC310(v34, v24, v26, v28);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        goto LABEL_13;
      }
    }
    swift_bridgeObjectRelease();
    if ((a5 & 1) == 0)
    {
      uint64_t v21 = sub_21F0B12A8((uint64_t)objc_msgSend(v15, sel_code));
      if ((v22 & 1) == 0) {
        a4 = v21;
      }
    }
    id v23 = objc_msgSend(v15, sel_userInfo);
    sub_21F0C9038();
  }
LABEL_13:
  if (qword_267EBABB0 != -1) {
    swift_once();
  }
  id v29 = objc_allocWithZone(MEMORY[0x263F087E8]);
  swift_bridgeObjectRetain();
  unint64_t v30 = (void *)sub_21F0C9048();
  swift_bridgeObjectRelease();
  uint64_t v31 = (void *)sub_21F0C9018();
  swift_bridgeObjectRelease();
  id v32 = objc_msgSend(v29, sel_initWithDomain_code_userInfo_, v30, a4, v31);

  return v32;
}

unint64_t sub_21F0B167C()
{
  unint64_t result = qword_267EBB168;
  if (!qword_267EBB168)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267EBB168);
  }
  return result;
}

unint64_t PADSWGesture.init(rawValue:)(unint64_t a1)
{
  return sub_21F0B1CB4(a1);
}

unint64_t PADSWAssessmentLabel.init(rawValue:)(unint64_t result)
{
  if (result > 2) {
    return 0;
  }
  return result;
}

unint64_t PADSWGestureAssessment.init(rawValue:)(unint64_t a1)
{
  return sub_21F0B1CE4(a1);
}

uint64_t static PADSWGesture.count.getter()
{
  return qword_26D0A5D58;
}

void *static PADSWGesture.allCases.getter()
{
  return &unk_26D0A5D48;
}

uint64_t PADSWGesture.description.getter(unint64_t a1)
{
  if (a1 < 0xB && ((0x73Fu >> a1) & 1) != 0) {
    return *(void *)&aTurnrighturnle[8 * a1];
  }
  uint64_t result = sub_21F0C95E8();
  __break(1u);
  return result;
}

uint64_t PADSWGesture.type.getter(unint64_t a1)
{
  if (a1 > 9) {
    return 3;
  }
  else {
    return qword_21F0CC558[a1];
  }
}

unint64_t sub_21F0B17C0@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_21F0B1CB4(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_21F0B17F4(void *a1@<X8>)
{
  *a1 = &unk_26D0A5D48;
}

uint64_t sub_21F0B1804()
{
  return PADSWGesture.description.getter(*v0);
}

uint64_t sub_21F0B180C()
{
  return sub_21F0C90F8();
}

uint64_t sub_21F0B186C()
{
  return sub_21F0C90E8();
}

unint64_t PADSWGestureType.init(rawValue:)(unint64_t result)
{
  if (result > 3 || result == 1) {
    return 0;
  }
  return result;
}

uint64_t *sub_21F0B18D8@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *result;
  BOOL v3 = (unint64_t)*result > 3 || v2 == 1;
  if (v3) {
    uint64_t v2 = 0;
  }
  char v4 = v3;
  *(void *)a2 = v2;
  *(unsigned char *)(a2 + 8) = v4;
  return result;
}

unint64_t PADSWGestureAssessment.description.getter(uint64_t a1)
{
  unint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 0:
      unint64_t result = 0x64657070696B73;
      break;
    case 1:
      unint64_t result = 0x6465746365746564;
      break;
    case 2:
      unint64_t result = 0x6573657250746F6ELL;
      break;
    case 3:
      unint64_t result = 0x6365746544746F6ELL;
      break;
    case 4:
      return result;
    default:
      sub_21F0C95E8();
      __break(1u);
      JUMPOUT(0x21F0B19E4);
  }
  return result;
}

unint64_t sub_21F0B19F8@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_21F0B1CE4(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

unint64_t sub_21F0B1A2C()
{
  return PADSWGestureAssessment.description.getter(*v0);
}

uint64_t sub_21F0B1A34()
{
  return sub_21F0C90F8();
}

uint64_t sub_21F0B1A94()
{
  return sub_21F0C90E8();
}

uint64_t *sub_21F0B1AE4@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *result;
  BOOL v3 = (unint64_t)*result > 2;
  if ((unint64_t)*result > 2) {
    uint64_t v2 = 0;
  }
  *(void *)a2 = v2;
  *(unsigned char *)(a2 + 8) = v3;
  return result;
}

uint64_t sub_21F0B1B00()
{
  return sub_21F0C90F8();
}

uint64_t sub_21F0B1B60()
{
  return sub_21F0C90E8();
}

uint64_t sub_21F0B1BB0()
{
  uint64_t result = sub_21F0C9048();
  qword_267EBB170 = result;
  return result;
}

id static PADSWNotificationName.frameUnretained.getter()
{
  return sub_21F0B1C68(&qword_267EBABB8, (void **)&qword_267EBB170);
}

uint64_t sub_21F0B1C0C()
{
  uint64_t result = sub_21F0C9048();
  qword_267EBB178 = result;
  return result;
}

id static PADSWNotificationName.stitchDetected.getter()
{
  return sub_21F0B1C68(&qword_267EBABC0, (void **)&qword_267EBB178);
}

id sub_21F0B1C68(void *a1, void **a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  BOOL v3 = *a2;
  return v3;
}

unint64_t sub_21F0B1CB4(unint64_t result)
{
  if (result > 0xA || ((1 << result) & 0x73F) == 0) {
    return 0;
  }
  return result;
}

unint64_t sub_21F0B1CE4(unint64_t result)
{
  if (result > 4) {
    return 0;
  }
  return result;
}

unint64_t sub_21F0B1CF8()
{
  unint64_t result = qword_267EBB180;
  if (!qword_267EBB180)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EBB180);
  }
  return result;
}

unint64_t sub_21F0B1D50()
{
  unint64_t result = qword_267EBB188;
  if (!qword_267EBB188)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EBAD70);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EBB188);
  }
  return result;
}

unint64_t sub_21F0B1DB0()
{
  unint64_t result = qword_267EBB190;
  if (!qword_267EBB190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EBB190);
  }
  return result;
}

unint64_t sub_21F0B1E08()
{
  unint64_t result = qword_267EBB198;
  if (!qword_267EBB198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EBB198);
  }
  return result;
}

unint64_t sub_21F0B1E60()
{
  unint64_t result = qword_267EBB1A0;
  if (!qword_267EBB1A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EBB1A0);
  }
  return result;
}

ValueMetadata *type metadata accessor for PADSWGesture()
{
  return &type metadata for PADSWGesture;
}

ValueMetadata *type metadata accessor for PADSWGestureType()
{
  return &type metadata for PADSWGestureType;
}

ValueMetadata *type metadata accessor for PADSWGestureAssessment()
{
  return &type metadata for PADSWGestureAssessment;
}

ValueMetadata *type metadata accessor for PADSWAssessmentLabel()
{
  return &type metadata for PADSWAssessmentLabel;
}

ValueMetadata *type metadata accessor for PADSWNotificationName()
{
  return &type metadata for PADSWNotificationName;
}

unint64_t sub_21F0B1F04()
{
  unint64_t result = qword_267EBB1A8;
  if (!qword_267EBB1A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EBB1A8);
  }
  return result;
}

unint64_t sub_21F0B1F58()
{
  unint64_t result = qword_267EBB1B0;
  if (!qword_267EBB1B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EBB1B0);
  }
  return result;
}

unint64_t sub_21F0B1FAC()
{
  unint64_t result = qword_267EBB1B8;
  if (!qword_267EBB1B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EBB1B8);
  }
  return result;
}

void sub_21F0B200C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(id, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(v7, a3);
  swift_release();
}

void *sub_21F0B2098(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_21F0C8F68();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (void *)MEMORY[0x263F8EE78];
  switch(a2 >> 62)
  {
    case 1uLL:
      if (__OFSUB__(HIDWORD(a1), a1)) {
        goto LABEL_12;
      }
      uint64_t v9 = HIDWORD(a1) - (int)a1;
LABEL_6:
      if (v9)
      {
        if (v9 >= 1)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_267EBAFD8);
          uint64_t v8 = (void *)swift_allocObject();
          size_t v12 = _swift_stdlib_malloc_size(v8);
          v8[2] = v9;
          v8[3] = 2 * v12 - 64;
        }
        sub_21F09F738(a1, a2);
        uint64_t v13 = sub_21F0C8F28();
        sub_21F09E288(a1, a2);
        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
        if (v13 != v9)
        {
          __break(1u);
LABEL_12:
          __break(1u);
LABEL_13:
          __break(1u);
          JUMPOUT(0x21F0B2244);
        }
      }
      return v8;
    case 2uLL:
      uint64_t v11 = *(void *)(a1 + 16);
      uint64_t v10 = *(void *)(a1 + 24);
      uint64_t v9 = v10 - v11;
      if (!__OFSUB__(v10, v11)) {
        goto LABEL_6;
      }
      goto LABEL_13;
    case 3uLL:
      return v8;
    default:
      uint64_t v9 = BYTE6(a2);
      goto LABEL_6;
  }
}

id sub_21F0B2254(void *a1, void *a2)
{
  void aBlock[6] = *(id *)MEMORY[0x263EF8340];
  uint64_t v4 = sub_21F0C8FC8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&aBlock[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = objc_allocWithZone(MEMORY[0x263F1EE50]);
  aBlock[4] = a1;
  aBlock[5] = a2;
  aBlock[0] = (id)MEMORY[0x263EF8330];
  aBlock[1] = (id)1107296256;
  aBlock[2] = sub_21F0B200C;
  aBlock[3] = &block_descriptor_3;
  uint64_t v9 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  id v10 = objc_msgSend(v8, sel_initWithCompletionHandler_, v9);
  _Block_release(v9);
  aBlock[0] = 0;
  if (objc_msgSend(v10, sel_setRevision_error_, 3737841667, aBlock))
  {
    id v11 = aBlock[0];
  }
  else
  {
    id v12 = aBlock[0];
    uint64_t v13 = (void *)sub_21F0C8E78();

    swift_willThrow();
    if (qword_267EBAB80 != -1) {
      swift_once();
    }
    uint64_t v14 = __swift_project_value_buffer(v4, (uint64_t)qword_267EBAB88);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v14, v4);
    uint64_t v15 = sub_21F0C8FA8();
    os_log_type_t v16 = sub_21F0C9238();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_21F07C000, v15, v16, "Unable to set faceprint request revision to 3_1MD3, falling back to revision2", v17, 2u);
      MEMORY[0x223C43270](v17, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  return v10;
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 4sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

id sub_21F0B252C(void *a1, void *a2)
{
  void aBlock[6] = *(id *)MEMORY[0x263EF8340];
  uint64_t v4 = sub_21F0C8FC8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&aBlock[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = objc_allocWithZone(MEMORY[0x263F1EE10]);
  aBlock[4] = a1;
  aBlock[5] = a2;
  aBlock[0] = (id)MEMORY[0x263EF8330];
  aBlock[1] = (id)1107296256;
  aBlock[2] = sub_21F0B200C;
  aBlock[3] = &block_descriptor_3;
  uint64_t v9 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  id v10 = objc_msgSend(v8, sel_initWithCompletionHandler_, v9);
  _Block_release(v9);
  aBlock[0] = 0;
  if (objc_msgSend(v10, sel_setRevision_error_, 3737841666, aBlock))
  {
    id v11 = aBlock[0];
  }
  else
  {
    id v12 = aBlock[0];
    uint64_t v13 = (void *)sub_21F0C8E78();

    swift_willThrow();
    if (qword_267EBAB80 != -1) {
      swift_once();
    }
    uint64_t v14 = __swift_project_value_buffer(v4, (uint64_t)qword_267EBAB88);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v14, v4);
    uint64_t v15 = sub_21F0C8FA8();
    os_log_type_t v16 = sub_21F0C9238();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_21F07C000, v15, v16, "SelfieAnalysisController failed to set private faceAttributes revision. Using default revision.", v17, 2u);
      MEMORY[0x223C43270](v17, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  return v10;
}

unint64_t sub_21F0B27EC(void *a1)
{
  uint64_t v2 = sub_21F0C8FC8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = objc_msgSend(a1, sel_faceprint);
  if (!v6) {
    goto LABEL_6;
  }
  id v7 = v6;
  if ((uint64_t)objc_msgSend(v6, sel_elementCount) < 1)
  {

LABEL_6:
    if (qword_267EBAB80 != -1) {
      swift_once();
    }
    uint64_t v14 = __swift_project_value_buffer(v2, (uint64_t)qword_267EBAB88);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v14, v2);
    uint64_t v15 = sub_21F0C8FA8();
    os_log_type_t v16 = sub_21F0C9238();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v17 = 0;
      MEMORY[0x223C43270](v17, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return 0;
  }
  id v8 = objc_msgSend(v7, sel_descriptorData);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = sub_21F0C8F48();
    unint64_t v12 = v11;

    sub_21F09F738(v10, v12);
    uint64_t v13 = sub_21F0B2098(v10, v12);
    sub_21F09E288(v10, v12);
    sub_21F09E288(v10, v12);
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t result = (unint64_t)objc_msgSend(v7, sel_elementCount);
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v20 = result;
    if (!result)
    {
      swift_bridgeObjectRelease();
      uint64_t v18 = (char *)MEMORY[0x263F8EE78];
LABEL_23:

      return (unint64_t)v18;
    }
    if (result - 1 < v13[2])
    {
      uint64_t v21 = 0;
      uint64_t v18 = (char *)MEMORY[0x263F8EE78];
      do
      {
        unsigned int v22 = *((unsigned __int8 *)v13 + v21 + 32);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v18 = sub_21F09C814(0, *((void *)v18 + 2) + 1, 1, v18);
        }
        unint64_t v24 = *((void *)v18 + 2);
        unint64_t v23 = *((void *)v18 + 3);
        if (v24 >= v23 >> 1) {
          uint64_t v18 = sub_21F09C814((char *)(v23 > 1), v24 + 1, 1, v18);
        }
        ++v21;
        *((void *)v18 + 2) = v24 + 1;
        *(float *)&v18[4 * v24 + 32] = (float)v22;
      }
      while (v20 != v21);
      swift_bridgeObjectRelease();
      goto LABEL_23;
    }
  }
  __break(1u);
  return result;
}

uint64_t PADTrajectoryAnalysisMode.description.getter()
{
  return qword_21F0CC8C8[*v0];
}

CoreIDVPAD::PADTrajectoryAnalysisMode_optional __swiftcall PADTrajectoryAnalysisMode.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 4;
  if ((unint64_t)rawValue < 4) {
    char v2 = rawValue;
  }
  *uint64_t v1 = v2;
  return (CoreIDVPAD::PADTrajectoryAnalysisMode_optional)rawValue;
}

uint64_t PADTrajectoryAnalysisMode.rawValue.getter()
{
  return *v0;
}

uint64_t sub_21F0B2B60(char a1)
{
  return *(void *)&aTimestamstitch[8 * a1];
}

CoreIDVPAD::PADTrajectoryAnalysisMode_optional sub_21F0B2B80(Swift::Int *a1)
{
  return PADTrajectoryAnalysisMode.init(rawValue:)(*a1);
}

void sub_21F0B2B88(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_21F0B2B98()
{
  return sub_21F0B2B60(*v0);
}

uint64_t sub_21F0B2BA0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_21F0B3F38(a1, a2);
  *a3 = result;
  return result;
}

void sub_21F0B2BC8(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_21F0B2BD4(uint64_t a1)
{
  unint64_t v2 = sub_21F0B2DE8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_21F0B2C10(uint64_t a1)
{
  unint64_t v2 = sub_21F0B2DE8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t PADTrajectoryAnalysisAssessment.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EBB1C0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  id v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21F0B2DE8();
  sub_21F0C9668();
  char v11 = 0;
  sub_21F0C9568();
  if (!v1)
  {
    char v10 = 1;
    sub_21F0C9558();
    char v9 = 2;
    sub_21F0C9578();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_21F0B2DE8()
{
  unint64_t result = qword_267EBB1C8;
  if (!qword_267EBB1C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EBB1C8);
  }
  return result;
}

uint64_t PADTrajectoryAnalysisAssessment.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EBB1D0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21F0B2DE8();
  sub_21F0C9658();
  if (!v2)
  {
    char v18 = 0;
    sub_21F0C9508();
    uint64_t v10 = v9;
    char v17 = 1;
    char v12 = sub_21F0C94F8();
    char v16 = 2;
    sub_21F0C9518();
    int v14 = v13;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *(void *)a2 = v10;
    *(unsigned char *)(a2 + 8) = v12 & 1;
    *(_DWORD *)(a2 + 12) = v14;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_21F0B3018()
{
  unint64_t result = qword_267EBB1D8;
  if (!qword_267EBB1D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EBB1D8);
  }
  return result;
}

uint64_t sub_21F0B306C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return PADTrajectoryAnalysisAssessment.init(from:)(a1, a2);
}

uint64_t sub_21F0B3084(void *a1)
{
  return PADTrajectoryAnalysisAssessment.encode(to:)(a1);
}

uint64_t getEnumTagSinglePayload for PADTrajectoryAnalysisMode(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for PADTrajectoryAnalysisMode(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    char *result = a2 + 3;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x21F0B31F8);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          char *result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PADTrajectoryAnalysisMode()
{
  return &type metadata for PADTrajectoryAnalysisMode;
}

uint64_t getEnumTagSinglePayload for PADTrajectoryAnalysisAssessment(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for PADTrajectoryAnalysisAssessment(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)unint64_t result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PADTrajectoryAnalysisAssessment()
{
  return &type metadata for PADTrajectoryAnalysisAssessment;
}

void sub_21F0B32D4(char *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_21F0C8FC8();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v54[-1] - v8;
  MEMORY[0x270FA5388](v7);
  char v11 = (char *)&v54[-1] - v10;
  int v12 = *(unsigned __int8 *)(v2 + 185);
  if (v12 != 3)
  {
    *(unsigned char *)(v2 + 184) = 1;
    char v17 = v12 == 1;
    id v18 = *(id *)&a1[OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_buffer];
    char v19 = sub_21F0B9164((uint64_t)v18, v17);
    float v21 = v20;

    uint64_t v53 = v2 + 200;
    if (MEMORY[0x223C43330]()) {
      swift_unknownObjectRelease();
    }
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267EBB3F0);
    uint64_t v22 = swift_allocObject();
    uint64_t v23 = MEMORY[0x263F8D5C8];
    *(_OWORD *)(v22 + 16) = xmmword_21F0CBD60;
    uint64_t v24 = MEMORY[0x263F8D648];
    *(void *)(v22 + 56) = v23;
    *(void *)(v22 + 64) = v24;
    *(float *)(v22 + 32) = v21;
    sub_21F0C9088();
    uint64_t v26 = v25;
    time.CMTimeValue value = 0;
    *(void *)&time.timescale = 0xE000000000000000;
    sub_21F0C93B8();
    swift_bridgeObjectRelease();
    time.CMTimeValue value = 0xD000000000000013;
    *(void *)&time.timescale = 0x800000021F0CF280;
    sub_21F0C90C8();
    swift_bridgeObjectRelease();
    sub_21F0C90C8();
    sub_21F0C90C8();
    swift_bridgeObjectRelease();
    sub_21F08B394(time.value, *(unint64_t *)&time.timescale);
    swift_bridgeObjectRelease();
    swift_beginAccess();
    id v27 = *(void **)(v2 + 136);
    sub_21F0C9298();
    uint64_t v28 = *(void *)(v2 + 128);
    BOOL v29 = __OFADD__(v28, 1);
    uint64_t v30 = v28 + 1;
    if (v29)
    {
      __break(1u);
LABEL_36:
      swift_once();
LABEL_26:
      uint64_t v41 = __swift_project_value_buffer(v4, (uint64_t)qword_267EBAB88);
      (*(void (**)(char *, uint64_t, uint64_t))(v26 + 16))(v11, v41, v4);
      uint64_t v42 = a1;
      swift_retain();
      id v43 = sub_21F0C8FA8();
      os_log_type_t v44 = sub_21F0C9238();
      if (os_log_type_enabled(v43, v44))
      {
        uint64_t v45 = swift_slowAlloc();
        *(_DWORD *)uint64_t v45 = 134218496;
        *(double *)&time.CMTimeValue value = v21;
        sub_21F0C9308();
        *(_WORD *)(v45 + 12) = 2048;
        CMTimeEpoch v46 = *(CMTimeEpoch *)((char *)&v42[2].isa + OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_time);
        time.CMTimeValue value = *(CMTimeValue *)((char *)v42 + OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_time);
        *&time.timescale = *((char *)v42 + OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_time + 8);
        time.CMTimeEpoch epoch = v46;
        time.CMTimeValue value = CMTimeGetSeconds(&time);
        sub_21F0C9308();

        *(_WORD *)(v45 + 22) = 1024;
        LODWORD(time.value) = *(unsigned __int8 *)(v2 + 185) == 2;
        uint64_t v26 = v5;
        sub_21F0C9308();
        swift_release();
        _os_log_impl(&dword_21F07C000, v43, v44, "Stitch detected, nccSignal: %f, timestamp: %f, shouldIgnore: %{BOOL}d", (uint8_t *)v45, 0x1Cu);
        MEMORY[0x223C43270](v45, -1, -1);
      }
      else
      {

        swift_release();
        id v43 = v42;
      }

      (*(void (**)(char *, uint64_t))(v26 + 8))(v11, v4);
      uint64_t v47 = MEMORY[0x223C43330](v53);
      if (v47)
      {
        int v48 = *(unsigned __int8 *)(v2 + 185);
        uint64_t v49 = v47 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_delegate;
        swift_beginAccess();
        sub_21F08FCE0(v49, (uint64_t)&time);
        if (v58)
        {
          BOOL v50 = v48 == 2;
          sub_21F093D74((uint64_t)&time, (uint64_t)v54);
          sub_21F0B40D0((uint64_t)&time);
          uint64_t v51 = v55;
          uint64_t v52 = v56;
          __swift_project_boxed_opaque_existential_1(v54, v55);
          (*(void (**)(NSObject *, BOOL, uint64_t, uint64_t))(v52 + 32))(v42, v50, v51, v52);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v54);
        }
        else
        {
          sub_21F0B40D0((uint64_t)&time);
        }
        swift_unknownObjectRelease();
      }
LABEL_34:
      *(unsigned char *)(v2 + 184) = 0;
      return;
    }
    *(void *)(v2 + 128) = v30;
    id v31 = v27;
    sub_21F0C92A8();
    swift_endAccess();

    int v32 = *(unsigned __int8 *)(v2 + 185);
    if (*(unsigned char *)(v2 + 185))
    {
      uint64_t v26 = v5;
      if (v32 == 1)
      {
        float v33 = *(float *)(v2 + 180);
        if (v33 < v21) {
          float v33 = v21;
        }
        *(float *)(v2 + 18sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = v33;
      }
      if ((v19 & 1) == 0) {
        goto LABEL_34;
      }
    }
    else
    {
      float v34 = *(float *)(v2 + 176);
      if (v34 < v21) {
        float v34 = v21;
      }
      *(float *)(v2 + 176) = v34;
      uint64_t v26 = v5;
      if ((v19 & 1) == 0) {
        goto LABEL_34;
      }
    }
    if (v32 == 2)
    {
      long long v35 = (void *)(v2 + 144);
      swift_beginAccess();
      unint64_t v36 = *(void **)(v2 + 152);
      sub_21F0C9298();
      uint64_t v37 = *(void *)(v2 + 144);
      BOOL v29 = __OFADD__(v37, 1);
      uint64_t v38 = v37 + 1;
      if (!v29) {
        goto LABEL_25;
      }
      __break(1u);
    }
    long long v35 = (void *)(v2 + 160);
    swift_beginAccess();
    unint64_t v36 = *(void **)(v2 + 168);
    sub_21F0C9298();
    uint64_t v39 = *(void *)(v2 + 160);
    BOOL v29 = __OFADD__(v39, 1);
    uint64_t v38 = v39 + 1;
    if (v29)
    {
      __break(1u);
      return;
    }
LABEL_25:
    void *v35 = v38;
    id v40 = v36;
    sub_21F0C92A8();
    swift_endAccess();

    if (qword_267EBAB80 == -1) {
      goto LABEL_26;
    }
    goto LABEL_36;
  }
  if (qword_267EBAB80 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v4, (uint64_t)qword_267EBAB88);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v9, v13, v4);
  int v14 = sub_21F0C8FA8();
  os_log_type_t v15 = sub_21F0C9228();
  if (os_log_type_enabled(v14, v15))
  {
    char v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v16 = 0;
    _os_log_impl(&dword_21F07C000, v14, v15, "Trajectory Analysis Controller mode sent to skip. Frame will not be processed by TA.", v16, 2u);
    MEMORY[0x223C43270](v16, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v9, v4);
}

uint64_t sub_21F0B3BC8()
{
  swift_bridgeObjectRelease();
  return sub_21F0B40A8((uint64_t)(v0 + 25));
}

uint64_t sub_21F0B3C10()
{
  uint64_t v0 = (id *)sub_21F0B0D3C();

  swift_bridgeObjectRelease();
  sub_21F0B40A8((uint64_t)(v0 + 25));
  return MEMORY[0x270FA0228](v0, 216, 7);
}

uint64_t type metadata accessor for PADTrajectoryAnalysisController()
{
  return self;
}

uint64_t getEnumTagSinglePayload for PADFaceActionMode(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for PADTrajectoryAnalysisAssessment.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    char *result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x21F0B3DF8);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          char *result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PADTrajectoryAnalysisAssessment.CodingKeys()
{
  return &type metadata for PADTrajectoryAnalysisAssessment.CodingKeys;
}

unint64_t sub_21F0B3E34()
{
  unint64_t result = qword_267EBB1E0;
  if (!qword_267EBB1E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EBB1E0);
  }
  return result;
}

unint64_t sub_21F0B3E8C()
{
  unint64_t result = qword_267EBB1E8;
  if (!qword_267EBB1E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EBB1E8);
  }
  return result;
}

unint64_t sub_21F0B3EE4()
{
  unint64_t result = qword_267EBB1F0;
  if (!qword_267EBB1F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EBB1F0);
  }
  return result;
}

uint64_t sub_21F0B3F38(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x6D617473656D6974 && a2 == 0xE900000000000070 || (sub_21F0C95D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6544686374697473 && a2 == 0xEE00646574636574 || (sub_21F0C95D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x616E67695363636ELL && a2 == 0xE90000000000006CLL)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v5 = sub_21F0C95D8();
    swift_bridgeObjectRelease();
    if (v5) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_21F0B40A8(uint64_t a1)
{
  return a1;
}

uint64_t sub_21F0B40D0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267EBB450);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_21F0B4138(void *a1, uint64_t a2)
{
  if (*(void *)(v2 + 128))
  {
    uint64_t v3 = MEMORY[0x223C43330](v2 + 144);
    if (v3)
    {
      uint64_t v4 = v3;
      id v5 = sub_21F0B1328(0xD000000000000054, 0x800000021F0CF3D0, 0, -1, 0);
      uint64_t v6 = v4 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_delegate;
      swift_beginAccess();
      sub_21F08FCE0(v6, (uint64_t)v14);
      if (v15)
      {
        sub_21F093D74((uint64_t)v14, (uint64_t)v11);
        sub_21F09543C((uint64_t)v14, (uint64_t *)&unk_267EBB450);
        uint64_t v7 = v12;
        uint64_t v8 = v13;
        __swift_project_boxed_opaque_existential_1(v11, v12);
        (*(void (**)(id, uint64_t, uint64_t))(v8 + 56))(v5, v7, v8);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
      }
      else
      {
        sub_21F09543C((uint64_t)v14, (uint64_t *)&unk_267EBB450);
      }
      swift_unknownObjectRelease();
    }
  }
  else
  {
    *(void *)(v2 + 128) = a1;
    *(void *)(v2 + 136) = a2;
    swift_bridgeObjectRetain();
    id v10 = a1;
    sub_21F0B65E4(0);
    sub_21F0AE95C(v10);
  }
}

uint64_t sub_21F0B42B8(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v7 = (uint64_t *)sub_21F0C8FC8();
  uint64_t v8 = (_UNKNOWN **)*(v7 - 1);
  MEMORY[0x270FA5388](v7);
  id v10 = (char *)&v62 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v11 = *(void **)(v3 + 128);
  if (v11)
  {
    uint64_t v67 = v3;
    uint64_t v12 = *(void *)(v3 + 136);
    uint64_t v13 = (void *)swift_allocObject();
    v13[2] = a2;
    void v13[3] = a3;
    sub_21F0B6624(v11);
    swift_retain();
    id v14 = sub_21F0B252C(sub_21F0B6824, v13);
    swift_release();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267EBB400);
    uint64_t v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = xmmword_21F0CBD60;
    uint64_t v8 = &off_26D0A6648;
    *(void *)(v15 + 56) = sub_21F0A5404(0, &qword_267EBB230);
    *(void *)(v15 + 64) = &off_26D0A6648;
    *(void *)(v15 + 32) = v14;
    char v16 = (void *)swift_allocObject();
    _OWORD v16[2] = a2;
    void v16[3] = a3;
    swift_retain();
    id v68 = v14;
    id v17 = sub_21F0B2254(sub_21F0B6834, v16);
    swift_release();
    id v10 = *(char **)(v15 + 16);
    unint64_t v18 = *(void *)(v15 + 24);
    if ((unint64_t)v10 >= v18 >> 1) {
      uint64_t v15 = (uint64_t)sub_21F09D258((void *)(v18 > 1), (int64_t)(v10 + 1), 1, (void *)v15);
    }
    uint64_t v77 = sub_21F0A5404(0, &qword_267EBB238);
    id v78 = &off_26D0A6648;
    *(void *)&long long v76 = v17;
    *(void *)(v15 + 16) = v10 + 1;
    uint64_t v19 = v15 + 32;
    sub_21F0B0FEC(&v76, v15 + 32 + 40 * (void)v10);
    float v20 = (uint64_t *)(a1 + OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_faces);
    swift_beginAccess();
    uint64_t v21 = *v20;
    unint64_t v22 = (unint64_t)*v20 >> 62;
    unint64_t v69 = v20;
    if (v22)
    {
      swift_bridgeObjectRetain();
      uint64_t v23 = sub_21F0C9488();
    }
    else
    {
      uint64_t v23 = *(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
    }
    uint64_t v7 = &OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds;
    if (!v23)
    {
      swift_bridgeObjectRelease();
      goto LABEL_37;
    }
    if ((v21 & 0xC000000000000001) != 0)
    {
      uint64_t v24 = v15;
      uint64_t v25 = (char *)MEMORY[0x223C42390](0, v21);
      goto LABEL_10;
    }
    if (*(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      uint64_t v24 = v15;
      uint64_t v25 = (char *)*(id *)(v21 + 32);
LABEL_10:
      uint64_t v26 = v25;
      swift_bridgeObjectRelease();
      id v27 = sub_21F09F844(*(double *)&v26[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds], *(double *)&v26[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds + 8], *(double *)&v26[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds + 16], *(double *)&v26[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds + 24]);
      uint64_t v28 = *(void *)(v24 + 16);
      if (v28)
      {
        id v62 = v26;
        id v64 = v11;
        uint64_t v65 = v12;
        uint64_t v71 = *MEMORY[0x263F08100];
        uint64_t v63 = v24;
        swift_bridgeObjectRetain();
        uint64_t v70 = MEMORY[0x263F8EE58] + 8;
        uint64_t v66 = 0x800000021F0CEB00;
        long long v72 = xmmword_21F0CC940;
        while (1)
        {
          sub_21F093D74(v19, (uint64_t)&v76);
          sub_21F093D74((uint64_t)&v76, (uint64_t)&v74);
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267EBB240);
          sub_21F0A5404(0, (unint64_t *)&unk_267EBB410);
          if (swift_dynamicCast()) {
            break;
          }
LABEL_24:
          sub_21F093D74((uint64_t)&v76, (uint64_t)&v74);
          __swift_instantiateConcreteTypeFromMangledName(&qword_267EBB2B0);
          if (swift_dynamicCast())
          {
            long long v35 = v73;
            __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267EBB420);
            uint64_t v36 = swift_allocObject();
            *(_OWORD *)(v36 + 16) = v72;
            *(void *)(v36 + 32) = v27;
            *(void *)&long long v74 = v36;
            sub_21F0C9148();
            sub_21F0A5404(0, (unint64_t *)&unk_267EBB210);
            id v37 = v27;
            a2 = (void *)sub_21F0C9118();
            swift_bridgeObjectRelease();
            objc_msgSend(v35, sel_setInputFaceObservations_, a2);
            swift_unknownObjectRelease();
          }
          __swift_destroy_boxed_opaque_existential_1((uint64_t)&v76);
          v19 += 40;
          if (!--v28)
          {

            uint64_t v15 = v63;
            swift_bridgeObjectRelease();
            char v11 = v64;
            uint64_t v7 = &OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds;
            goto LABEL_37;
          }
        }
        a2 = v73;
        if (!os_variant_has_internal_content()) {
          goto LABEL_22;
        }
        id v29 = objc_msgSend(self, sel_standardUserDefaults);
        id v30 = objc_msgSend(v29, sel_persistentDomainForName_, v71);

        if (v30 && (uint64_t v31 = sub_21F0C9038(), v30, v31))
        {
          if (*(void *)(v31 + 16) && (unint64_t v32 = sub_21F0C43B4(0xD000000000000018, v66), (v33 & 1) != 0))
          {
            sub_21F09F5EC(*(void *)(v31 + 56) + 32 * v32, (uint64_t)&v74);
          }
          else
          {
            long long v74 = 0u;
            long long v75 = 0u;
          }
          swift_bridgeObjectRelease();
          if (*((void *)&v75 + 1))
          {
            if (swift_dynamicCast())
            {
              uint64_t v34 = v73;
              goto LABEL_23;
            }
LABEL_22:
            uint64_t v34 = 0;
LABEL_23:
            objc_msgSend(a2, sel_setUsesCPUOnly_, v34);

            goto LABEL_24;
          }
        }
        else
        {
          long long v74 = 0u;
          long long v75 = 0u;
        }
        sub_21F09543C((uint64_t)&v74, (uint64_t *)&unk_267EBB200);
        goto LABEL_22;
      }

      uint64_t v15 = v24;
LABEL_37:
      uint64_t v42 = *v69;
      if ((unint64_t)*v69 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v43 = sub_21F0C9488();
        if (v43)
        {
LABEL_39:
          if ((v42 & 0xC000000000000001) != 0)
          {
            os_log_type_t v44 = (char *)MEMORY[0x223C42390](0, v42);
          }
          else
          {
            if (!*(void *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x10))
            {
              __break(1u);
              goto LABEL_56;
            }
            os_log_type_t v44 = (char *)*(id *)(v42 + 32);
          }
          uint64_t v45 = v44;
          swift_bridgeObjectRelease();
          CGFloat v46 = *(double *)&v45[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds];
          CGFloat v47 = *(double *)&v45[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds + 8];
          CGFloat v48 = *(double *)&v45[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds + 16];
          CGFloat v49 = *(double *)&v45[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds + 24];

          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267EBB3F0);
          uint64_t v50 = swift_allocObject();
          *(_OWORD *)(v50 + 16) = xmmword_21F0CC950;
          uint64_t v51 = MEMORY[0x263F8EF38];
          *(void *)(v50 + 56) = MEMORY[0x263F8EF38];
          unint64_t v52 = sub_21F0B6798();
          *(void *)(v50 + 64) = v52;
          *(CGFloat *)(v50 + 32) = v46;
          *(void *)(v50 + 96) = v51;
          *(void *)(v50 + 104) = v52;
          *(CGFloat *)(v50 + 72) = v47;
          v79.origin.x = v46;
          v79.origin.y = v47;
          v79.size.width = v48;
          v79.size.height = v49;
          CGFloat Width = CGRectGetWidth(v79);
          *(void *)(v50 + 136) = v51;
          *(void *)(v50 + 144) = v52;
          *(CGFloat *)(v50 + 112) = Width;
          v80.origin.x = v46;
          v80.origin.y = v47;
          v80.size.width = v48;
          v80.size.height = v49;
          CGFloat Height = CGRectGetHeight(v80);
          *(void *)(v50 + 176) = v51;
          *(void *)(v50 + 184) = v52;
          *(CGFloat *)(v50 + 152) = Height;
          uint64_t v42 = sub_21F0C9088();
          uint64_t v43 = v55;
          uint64_t v56 = v67;
          uint64_t v7 = (uint64_t *)(v67 + 160);
          swift_beginAccess();
          a2 = *(void **)(v56 + 160);
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          *(void *)(v56 + 16sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = a2;
          if (isUniquelyReferenced_nonNull_native)
          {
LABEL_43:
            unint64_t v59 = a2[2];
            unint64_t v58 = a2[3];
            if (v59 >= v58 >> 1)
            {
              a2 = sub_21F09D37C((void *)(v58 > 1), v59 + 1, 1, a2);
              *uint64_t v7 = (uint64_t)a2;
            }
            a2[2] = v59 + 1;
            uint64_t v60 = &a2[2 * v59];
            v60[4] = v42;
            v60[5] = v43;
            swift_endAccess();

            goto LABEL_49;
          }
LABEL_56:
          a2 = sub_21F09D37C(0, a2[2] + 1, 1, a2);
          *uint64_t v7 = (uint64_t)a2;
          goto LABEL_43;
        }
      }
      else
      {
        uint64_t v43 = *(void *)((v42 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (v43) {
          goto LABEL_39;
        }
      }

      swift_bridgeObjectRelease();
LABEL_49:
      swift_bridgeObjectRelease();
      return v15;
    }
    __break(1u);
    goto LABEL_53;
  }
  if (qword_267EBAB80 != -1) {
LABEL_53:
  }
    swift_once();
  uint64_t v38 = __swift_project_value_buffer((uint64_t)v7, (uint64_t)qword_267EBAB88);
  ((void (*)(char *, uint64_t, uint64_t *))v8[2])(v10, v38, v7);
  uint64_t v39 = sub_21F0C8FA8();
  os_log_type_t v40 = sub_21F0C9238();
  if (os_log_type_enabled(v39, v40))
  {
    uint64_t v41 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v41 = 0;
    _os_log_impl(&dword_21F07C000, v39, v40, "Attempting to run a selfie through the Selfie Analysis Controller without a request set.", v41, 2u);
    MEMORY[0x223C43270](v41, -1, -1);
  }

  ((void (*)(char *, uint64_t *))v8[1])(v10, v7);
  return MEMORY[0x263F8EE78];
}

void sub_21F0B4C48(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_21F0C8FC8();
  uint64_t v162 = *(void *)(v4 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v144 - v7;
  id v10 = (void *)(v2 + 128);
  uint64_t v9 = *(char **)(v2 + 128);
  if (v9)
  {
    uint64_t v11 = *(void *)(v2 + 136);
    if (a1[2])
    {
      uint64_t v157 = v6;
      int v161 = (void *)(v2 + 128);
      uint64_t v159 = v2;
      uint64_t v13 = a1[6];
      uint64_t v12 = a1[7];
      uint64_t v14 = a1[4];
      uint64_t v15 = a1[5];
      uint64_t v16 = v11;
      swift_bridgeObjectRetain();
      id v158 = v9;
      uint64_t v160 = v16;
      sub_21F0B6624(v9);
      uint64_t v17 = sub_21F0BD11C(v14, v15, v13, v12);
      if (v17)
      {
        if (*(void *)(v17 + 16))
        {
          sub_21F09F5EC(v17 + 32, (uint64_t)v176);
          swift_bridgeObjectRelease();
          if (*((void *)&v176[1] + 1))
          {
            sub_21F0A5404(0, (unint64_t *)&unk_267EBB210);
            if (swift_dynamicCast())
            {
              unint64_t v18 = v173[0];
              unint64_t v19 = sub_21F0B27EC(v173[0]);
              if (v19) {
                uint64_t v20 = v19;
              }
              else {
                uint64_t v20 = MEMORY[0x263F8EE78];
              }
              uint64_t v21 = sub_21F0BD274(v14, v15, v13, v12);
              if (v21)
              {
                uint64_t v22 = v159;
                if (*(void *)(v21 + 16)) {
                  sub_21F09F5EC(v21 + 32, (uint64_t)v176);
                }
                else {
                  memset(v176, 0, 32);
                }
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
              }
              else
              {
                memset(v176, 0, 32);
                swift_bridgeObjectRelease();
                uint64_t v22 = v159;
              }
              if (*((void *)&v176[1] + 1))
              {
                if (swift_dynamicCast())
                {
                  uint64_t v50 = v173[0];
                  uint64_t v51 = v160;
                  id v155 = v173[0];
                  int v156 = v18;
                  if (v160)
                  {
                    swift_bridgeObjectRetain();
                    sub_21F0B8CB4(v20, v51);
                    float v61 = v60;
                    swift_bridgeObjectRelease();
                  }
                  else
                  {
                    float v61 = -1.0;
                  }
                  id v62 = &v158[OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_faces];
                  swift_beginAccess();
                  uint64_t v63 = *(void *)v62;
                  if (*(void *)v62 >> 62)
                  {
                    swift_bridgeObjectRetain();
                    if (sub_21F0C9488()) {
                      goto LABEL_56;
                    }
                  }
                  else
                  {
                    uint64_t v64 = *(void *)((v63 & 0xFFFFFFFFFFFFFF8) + 0x10);
                    swift_bridgeObjectRetain();
                    if (v64)
                    {
LABEL_56:
                      if ((v63 & 0xC000000000000001) != 0)
                      {
                        uint64_t v65 = (char *)MEMORY[0x223C42390](0, v63);
                      }
                      else
                      {
                        if (!*(void *)((v63 & 0xFFFFFFFFFFFFFF8) + 0x10))
                        {
                          __break(1u);
                          return;
                        }
                        uint64_t v65 = (char *)*(id *)(v63 + 32);
                      }
                      uint64_t v66 = v65;
                      swift_bridgeObjectRelease();
                      CGFloat v67 = *(double *)&v66[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds];
                      CGFloat v68 = *(double *)&v66[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds + 8];
                      CGFloat v69 = *(double *)&v66[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds + 16];
                      CGFloat v70 = *(double *)&v66[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds + 24];
                      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267EBB3F0);
                      uint64_t v71 = swift_allocObject();
                      *(_OWORD *)(v71 + 16) = xmmword_21F0CC950;
                      uint64_t v72 = MEMORY[0x263F8EF38];
                      *(void *)(v71 + 56) = MEMORY[0x263F8EF38];
                      unint64_t v73 = sub_21F0B6798();
                      *(void *)(v71 + 64) = v73;
                      *(CGFloat *)(v71 + 32) = v67;
                      *(void *)(v71 + 96) = v72;
                      *(void *)(v71 + 104) = v73;
                      *(CGFloat *)(v71 + 72) = v68;
                      v179.origin.x = v67;
                      v179.origin.y = v68;
                      v179.size.width = v69;
                      v179.size.height = v70;
                      CGFloat Width = CGRectGetWidth(v179);
                      *(void *)(v71 + 136) = v72;
                      *(void *)(v71 + 144) = v73;
                      *(CGFloat *)(v71 + 112) = Width;
                      v180.origin.x = v67;
                      v180.origin.y = v68;
                      v180.size.width = v69;
                      v180.size.height = v70;
                      CGFloat Height = CGRectGetHeight(v180);
                      *(void *)(v71 + 176) = v72;
                      *(void *)(v71 + 184) = v73;
                      *(CGFloat *)(v71 + 152) = Height;
                      uint64_t v162 = sub_21F0C9088();
                      uint64_t v157 = v76;

                      goto LABEL_62;
                    }
                  }
                  swift_bridgeObjectRelease();
                  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267EBB3F0);
                  uint64_t v77 = swift_allocObject();
                  *(_OWORD *)(v77 + 16) = xmmword_21F0CC950;
                  uint64_t v78 = MEMORY[0x263F8EF38];
                  *(void *)(v77 + 56) = MEMORY[0x263F8EF38];
                  unint64_t v79 = sub_21F0B6798();
                  *(void *)(v77 + 32) = 0;
                  *(void *)(v77 + 96) = v78;
                  *(void *)(v77 + 104) = v79;
                  *(void *)(v77 + 64) = v79;
                  *(void *)(v77 + 72) = 0;
                  v181.origin.x = 0.0;
                  v181.origin.y = 0.0;
                  v181.size.width = 0.0;
                  v181.size.height = 0.0;
                  CGFloat v80 = CGRectGetWidth(v181);
                  *(void *)(v77 + 136) = v78;
                  *(void *)(v77 + 144) = v79;
                  *(CGFloat *)(v77 + 112) = v80;
                  v182.origin.x = 0.0;
                  v182.origin.y = 0.0;
                  v182.size.width = 0.0;
                  v182.size.height = 0.0;
                  CGFloat v81 = CGRectGetHeight(v182);
                  *(void *)(v77 + 176) = v78;
                  *(void *)(v77 + 184) = v79;
                  *(CGFloat *)(v77 + 152) = v81;
                  uint64_t v162 = sub_21F0C9088();
                  uint64_t v157 = v82;
LABEL_62:
                  id v83 = objc_msgSend(v50, sel_faceAttributes);
                  if (v83)
                  {
                    uint64_t v84 = v83;
                    id v85 = objc_msgSend(v83, sel_ageCategory);

                    id v86 = objc_msgSend(v85, sel_label);
                    id v87 = objc_msgSend(v86, sel_identifier);

                    uint64_t v88 = sub_21F0C9078();
                    uint64_t v153 = v89;
                    uint64_t v154 = v88;
                  }
                  else
                  {
                    uint64_t v153 = 0;
                    uint64_t v154 = 0;
                  }
                  id v90 = objc_msgSend(v50, sel_faceAttributes);
                  if (v90)
                  {
                    uint64_t v91 = v90;
                    id v92 = objc_msgSend(v90, sel_VN7exwFFmQF0AI9P7FjBljwEFu7QYUGCYE);

                    id v93 = objc_msgSend(v92, sel_label);
                    id v94 = objc_msgSend(v93, sel_identifier);

                    uint64_t v95 = sub_21F0C9078();
                    uint64_t v151 = v96;
                    uint64_t v152 = v95;
                  }
                  else
                  {
                    uint64_t v151 = 0;
                    uint64_t v152 = 0;
                  }
                  id v97 = objc_msgSend(v50, sel_faceAttributes);
                  if (v97)
                  {
                    uint64_t v98 = v97;
                    id v99 = objc_msgSend(v97, sel_VN3iT1YRjjnIuELobV1olJiO1vvItN6Kdq);

                    id v100 = objc_msgSend(v99, sel_label);
                    id v101 = objc_msgSend(v100, sel_identifier);

                    uint64_t v102 = sub_21F0C9078();
                    uint64_t v149 = v103;
                    uint64_t v150 = v102;
                  }
                  else
                  {
                    uint64_t v149 = 0;
                    uint64_t v150 = 0;
                  }
                  id v104 = objc_msgSend(v50, sel_faceAttributes);
                  if (v104)
                  {
                    int v105 = v104;
                    id v106 = objc_msgSend(v104, sel_VN1uMyFtnYEWjbrdx3yAuDndKkPeyzNJhB);

                    id v107 = objc_msgSend(v106, sel_label);
                    id v108 = objc_msgSend(v107, sel_identifier);

                    uint64_t v109 = sub_21F0C9078();
                    uint64_t v147 = v110;
                    uint64_t v148 = v109;
                  }
                  else
                  {
                    uint64_t v147 = 0;
                    uint64_t v148 = 0;
                  }
                  id v111 = objc_msgSend(v50, sel_faceAttributes);
                  if (v111)
                  {
                    uint64_t v112 = v111;
                    id v113 = objc_msgSend(v111, sel_faceHairCategory);

                    id v114 = objc_msgSend(v113, sel_label);
                    id v115 = objc_msgSend(v114, sel_identifier);

                    uint64_t v116 = sub_21F0C9078();
                    uint64_t v145 = v117;
                    uint64_t v146 = v116;
                  }
                  else
                  {
                    uint64_t v145 = 0;
                    uint64_t v146 = 0;
                  }
                  id v118 = objc_msgSend(v50, sel_faceAttributes);
                  id v119 = v118;
                  if (v118)
                  {
                    id v120 = objc_msgSend(v118, sel_VN7fiLHgGnvqPqG63cfDUCK4Xm8obUuWoP);

                    id v121 = objc_msgSend(v120, sel_label);
                    id v122 = objc_msgSend(v121, sel_identifier);

                    id v119 = (void *)sub_21F0C9078();
                    uint64_t v124 = v123;
                  }
                  else
                  {
                    uint64_t v124 = 0;
                  }
                  id v125 = objc_msgSend(v50, sel_faceAttributes);
                  if (v125)
                  {
                    id v126 = v125;
                    uint64_t v127 = v20;
                    id v128 = objc_msgSend(v125, sel_glassesCategory);

                    id v129 = objc_msgSend(v128, sel_label);
                    id v130 = objc_msgSend(v129, sel_identifier);

                    uint64_t v131 = sub_21F0C9078();
                    uint64_t v133 = v132;
                  }
                  else
                  {
                    uint64_t v127 = v20;
                    uint64_t v131 = 0;
                    uint64_t v133 = 0;
                  }
                  uint64_t v134 = v159;
                  if (v160) {
                    uint64_t v135 = v160;
                  }
                  else {
                    uint64_t v135 = MEMORY[0x263F8EE78];
                  }
                  swift_beginAccess();
                  uint64_t v136 = *(void *)(v134 + 160);
                  *(float *)uint64_t v176 = v61;
                  *((void *)&v176[0] + 1) = v154;
                  *(void *)&v176[1] = v153;
                  *((void *)&v176[1] + 1) = v152;
                  *(void *)&v176[2] = v151;
                  *((void *)&v176[2] + 1) = v150;
                  *(void *)&v176[3] = v149;
                  *((void *)&v176[3] + 1) = v148;
                  *(void *)&v176[4] = v147;
                  *((void *)&v176[4] + 1) = v146;
                  *(void *)&v176[5] = v145;
                  *((void *)&v176[5] + 1) = v119;
                  *(void *)&v176[6] = v124;
                  *((void *)&v176[6] + 1) = v131;
                  *(void *)&v176[7] = v133;
                  *((void *)&v176[7] + 1) = v127;
                  *(void *)&long long v177 = v162;
                  *((void *)&v177 + 1) = v157;
                  *(void *)&long long v178 = v135;
                  *((void *)&v178 + 1) = v136;
                  uint64_t v137 = MEMORY[0x223C43330](v134 + 144);
                  if (v137)
                  {
                    uint64_t v138 = v137;
                    long long v170 = v176[7];
                    long long v171 = v177;
                    long long v172 = v178;
                    long long v166 = v176[3];
                    long long v167 = v176[4];
                    long long v168 = v176[5];
                    long long v169 = v176[6];
                    long long v163 = v176[0];
                    long long v164 = v176[1];
                    long long v165 = v176[2];
                    nullsub_1(&v163);
                    uint64_t v139 = v138 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_selfieResult;
                    sub_21F094F20(v138 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_selfieResult, (uint64_t)v173);
                    sub_21F094F20((uint64_t)&v163, v139);
                    swift_bridgeObjectRetain();
                    swift_bridgeObjectRetain();
                    sub_21F0B6668((uint64_t)v176);
                    sub_21F0B6734((uint64_t *)v173);
                    sub_21F091EF4();
                    swift_unknownObjectRelease();
                  }
                  else
                  {
                    swift_bridgeObjectRetain();
                    swift_bridgeObjectRetain();
                  }
                  char v140 = v161;
                  unint64_t v142 = v155;
                  uint64_t v141 = v156;
                  uint64_t v143 = *(void **)(v134 + 128);
                  *int v161 = 0;
                  v140[1] = 0;
                  sub_21F0B65E4(v143);
                  swift_bridgeObjectRelease();

                  sub_21F095264((uint64_t)v176);
                  return;
                }
                unint64_t v52 = v18;
                swift_bridgeObjectRelease();
              }
              else
              {
                unint64_t v52 = v18;
                swift_bridgeObjectRelease();
                sub_21F09543C((uint64_t)v176, (uint64_t *)&unk_267EBB200);
              }
              uint64_t v53 = v161;
              id v54 = sub_21F0B1328(0xD00000000000002DLL, 0x800000021F0CF340, 0, -1, 0);
              uint64_t v55 = MEMORY[0x223C43330](v22 + 144);
              if (v55)
              {
                uint64_t v56 = v55 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_delegate;
                swift_beginAccess();
                sub_21F08FCE0(v56, (uint64_t)v176);
                if (*((void *)&v176[1] + 1))
                {
                  sub_21F093D74((uint64_t)v176, (uint64_t)v173);
                  sub_21F09543C((uint64_t)v176, (uint64_t *)&unk_267EBB450);
                  uint64_t v57 = v174;
                  uint64_t v58 = v175;
                  __swift_project_boxed_opaque_existential_1(v173, v174);
                  uint64_t v53 = v161;
                  (*(void (**)(id, uint64_t, uint64_t))(v58 + 56))(v54, v57, v58);
                  __swift_destroy_boxed_opaque_existential_1((uint64_t)v173);
                }
                else
                {
                  sub_21F09543C((uint64_t)v176, (uint64_t *)&unk_267EBB450);
                }
                swift_unknownObjectRelease();
              }
              unint64_t v59 = *(void **)(v22 + 128);
              void *v53 = 0;
              v53[1] = 0;
              sub_21F0B65E4(v59);

LABEL_30:
              swift_bridgeObjectRelease();
              return;
            }
            swift_bridgeObjectRelease();
            uint64_t v37 = v159;
LABEL_23:
            uint64_t v38 = v162;
            if (qword_267EBAB80 != -1) {
              swift_once();
            }
            uint64_t v39 = __swift_project_value_buffer(v4, (uint64_t)qword_267EBAB88);
            (*(void (**)(char *, uint64_t, uint64_t))(v38 + 16))(v8, v39, v4);
            os_log_type_t v40 = sub_21F0C8FA8();
            os_log_type_t v41 = sub_21F0C9238();
            if (os_log_type_enabled(v40, v41))
            {
              uint64_t v42 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)uint64_t v42 = 0;
              _os_log_impl(&dword_21F07C000, v40, v41, "PADSelfieAnalysisController no faceprint observation received. Returning failing result (0.0 ID matching assessment)", v42, 2u);
              MEMORY[0x223C43270](v42, -1, -1);
            }

            (*(void (**)(char *, uint64_t))(v38 + 8))(v8, v4);
            LODWORD(v176[0]) = 0;
            *(_OWORD *)((char *)v176 + 8) = 0u;
            *(_OWORD *)((char *)&v176[1] + 8) = 0u;
            *(_OWORD *)((char *)&v176[2] + 8) = 0u;
            *(_OWORD *)((char *)&v176[3] + 8) = 0u;
            *(_OWORD *)((char *)&v176[4] + 8) = 0u;
            *(_OWORD *)((char *)&v176[5] + 8) = 0u;
            *(_OWORD *)((char *)&v176[6] + 8) = 0u;
            *((void *)&v176[7] + 1) = MEMORY[0x263F8EE78];
            *(void *)&long long v177 = 0;
            *((void *)&v177 + 1) = 0xE000000000000000;
            *(void *)&long long v178 = MEMORY[0x263F8EE78];
            *((void *)&v178 + 1) = MEMORY[0x263F8EE78];
            uint64_t v43 = MEMORY[0x223C43330](v37 + 144);
            if (v43)
            {
              uint64_t v44 = v43;
              long long v170 = v176[7];
              long long v171 = v177;
              long long v172 = v178;
              long long v166 = v176[3];
              long long v167 = v176[4];
              long long v168 = v176[5];
              long long v169 = v176[6];
              long long v163 = v176[0];
              long long v164 = v176[1];
              long long v165 = v176[2];
              nullsub_1(&v163);
              uint64_t v45 = v44 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_selfieResult;
              sub_21F094F20(v44 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_selfieResult, (uint64_t)v173);
              sub_21F094F20((uint64_t)&v163, v45);
              sub_21F0B6668((uint64_t)v176);
              sub_21F0B6734((uint64_t *)v173);
              sub_21F091EF4();
              swift_unknownObjectRelease();
            }
            CGFloat v46 = *(void **)(v37 + 128);
            CGFloat v47 = v161;
            *int v161 = 0;
            v47[1] = 0;
            sub_21F0B65E4(v46);
            sub_21F095264((uint64_t)v176);

            goto LABEL_30;
          }
        }
        else
        {
          memset(v176, 0, 32);
          swift_bridgeObjectRelease();
        }
        swift_bridgeObjectRelease();
        uint64_t v37 = v159;
      }
      else
      {
        memset(v176, 0, 32);
        swift_bridgeObjectRelease();
        uint64_t v37 = v159;
      }
      sub_21F09543C((uint64_t)v176, (uint64_t *)&unk_267EBB200);
      goto LABEL_23;
    }
    swift_bridgeObjectRetain();
    id v30 = v9;
    id v31 = sub_21F0B1328(0xD000000000000039, 0x800000021F0CF390, 0, -1, 0);
    uint64_t v32 = MEMORY[0x223C43330](v2 + 144);
    if (v32)
    {
      uint64_t v33 = v32 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_delegate;
      swift_beginAccess();
      sub_21F08FCE0(v33, (uint64_t)v176);
      if (*((void *)&v176[1] + 1))
      {
        sub_21F093D74((uint64_t)v176, (uint64_t)v173);
        sub_21F09543C((uint64_t)v176, (uint64_t *)&unk_267EBB450);
        uint64_t v34 = v174;
        uint64_t v35 = v175;
        __swift_project_boxed_opaque_existential_1(v173, v174);
        uint64_t v36 = v34;
        id v10 = (void *)(v2 + 128);
        (*(void (**)(id, uint64_t, uint64_t))(v35 + 56))(v31, v36, v35);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v173);
      }
      else
      {
        sub_21F09543C((uint64_t)v176, (uint64_t *)&unk_267EBB450);
      }
      swift_unknownObjectRelease();
    }
    CGFloat v49 = *(void **)(v2 + 128);
    *id v10 = 0;
    v10[1] = 0;
    sub_21F0B65E4(v49);

    swift_bridgeObjectRelease();
  }
  else
  {
    id v23 = sub_21F0B1328(0xD000000000000037, 0x800000021F0CF300, 0, -1, 0);
    uint64_t v24 = MEMORY[0x223C43330](v2 + 144);
    if (v24)
    {
      uint64_t v25 = v24 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_delegate;
      swift_beginAccess();
      sub_21F08FCE0(v25, (uint64_t)v176);
      if (*((void *)&v176[1] + 1))
      {
        sub_21F093D74((uint64_t)v176, (uint64_t)v173);
        sub_21F09543C((uint64_t)v176, (uint64_t *)&unk_267EBB450);
        uint64_t v26 = v174;
        uint64_t v27 = v175;
        __swift_project_boxed_opaque_existential_1(v173, v174);
        uint64_t v28 = *(void (**)(id, uint64_t, uint64_t))(v27 + 56);
        uint64_t v29 = v27;
        id v10 = (void *)(v2 + 128);
        v28(v23, v26, v29);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v173);
      }
      else
      {
        sub_21F09543C((uint64_t)v176, (uint64_t *)&unk_267EBB450);
      }
      swift_unknownObjectRelease();
    }
    CGFloat v48 = *(void **)(v2 + 128);
    *id v10 = 0;
    v10[1] = 0;
    sub_21F0B65E4(v48);
  }
}

uint64_t sub_21F0B5F40()
{
  sub_21F0B65E4(*(void **)(v0 + 128));
  sub_21F0B40A8(v0 + 144);
  return swift_bridgeObjectRelease();
}

uint64_t sub_21F0B5F78()
{
  uint64_t v0 = sub_21F0B0D3C();
  sub_21F0B65E4(*(void **)(v0 + 128));
  sub_21F0B40A8(v0 + 144);
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 168, 7);
}

uint64_t type metadata accessor for PADSelfieAnalysisController()
{
  return self;
}

void *initializeBufferWithCopyOfBuffer for PADSelfieAnalysisControllerRequest(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for PADSelfieAnalysisControllerRequest(id *a1)
{
  return swift_bridgeObjectRelease();
}

uint64_t assignWithCopy for PADSelfieAnalysisControllerRequest(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

id *assignWithTake for PADSelfieAnalysisControllerRequest(id *a1, _OWORD *a2)
{
  *(_OWORD *)a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for PADSelfieAnalysisControllerRequest()
{
  return &type metadata for PADSelfieAnalysisControllerRequest;
}

uint64_t destroy for PADSelfieAnalysisControllerResult()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PADSelfieAnalysisControllerResult(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 4sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  uint64_t v6 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v6;
  uint64_t v7 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 8sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = v7;
  uint64_t v8 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v8;
  uint64_t v9 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v9;
  uint64_t v10 = *(void *)(a2 + 128);
  *(void *)(a1 + 12sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = v10;
  uint64_t v11 = *(void *)(a2 + 144);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(void *)(a1 + 144) = v11;
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PADSelfieAnalysisControllerResult(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 4sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 8sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 12sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = *(void *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy160_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 8sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = v5;
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  __n128 result = *(__n128 *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 112);
  long long v8 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v8;
  *(__n128 *)(a1 + 96) = result;
  *(_OWORD *)(a1 + 112) = v7;
  return result;
}

uint64_t assignWithTake for PADSelfieAnalysisControllerResult(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 4sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 8sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v9;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PADSelfieAnalysisControllerResult(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 160)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 120);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PADSelfieAnalysisControllerResult(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 152) = 0;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 12sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 4sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 16sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 12sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PADSelfieAnalysisControllerResult()
{
  return &type metadata for PADSelfieAnalysisControllerResult;
}

void *sub_21F0B65E4(void *result)
{
  if (result)
  {

    return (void *)swift_bridgeObjectRelease();
  }
  return result;
}

id sub_21F0B6624(id result)
{
  if (result)
  {
    id v1 = result;
    swift_bridgeObjectRetain();
    return v1;
  }
  return result;
}

uint64_t sub_21F0B6668(uint64_t a1)
{
  return a1;
}

uint64_t *sub_21F0B6734(uint64_t *a1)
{
  return a1;
}

unint64_t sub_21F0B6798()
{
  unint64_t result = qword_267EBB220;
  if (!qword_267EBB220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EBB220);
  }
  return result;
}

uint64_t sub_21F0B67EC()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_21F0B6824(void *a1, uint64_t a2)
{
  return sub_21F0BD09C(a1, a2, *(void (**)(void *, uint64_t))(v2 + 16));
}

void PADSWPose.init()()
{
}

uint64_t sub_21F0B6898(char a1)
{
  return *(void *)&aPitch_5[8 * a1];
}

uint64_t sub_21F0B68B8()
{
  return sub_21F0B6898(*v0);
}

uint64_t sub_21F0B68C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_21F0B7C88(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_21F0B68E8(uint64_t a1)
{
  unint64_t v2 = sub_21F0B6B48();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_21F0B6924(uint64_t a1)
{
  unint64_t v2 = sub_21F0B6B48();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t PADSWPose.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EBB2B8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21F0B6B48();
  sub_21F0C9668();
  uint64_t v11 = *(void *)(v3 + OBJC_IVAR____TtC10CoreIDVPAD9PADSWPose_pitch);
  HIBYTE(v1sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = 0;
  sub_21F0B6B9C();
  sub_21F0C9598();
  if (!v2)
  {
    uint64_t v11 = *(void *)(v3 + OBJC_IVAR____TtC10CoreIDVPAD9PADSWPose_yaw);
    HIBYTE(v1sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = 1;
    sub_21F0C9598();
    uint64_t v11 = *(void *)(v3 + OBJC_IVAR____TtC10CoreIDVPAD9PADSWPose_roll);
    HIBYTE(v1sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = 2;
    sub_21F0C9598();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_21F0B6B48()
{
  unint64_t result = qword_267EBB2C0;
  if (!qword_267EBB2C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EBB2C0);
  }
  return result;
}

unint64_t sub_21F0B6B9C()
{
  unint64_t result = qword_267EBB2D0;
  if (!qword_267EBB2D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EBB2D0);
  }
  return result;
}

id PADSWPose.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return PADSWPose.init(from:)(a1);
}

id PADSWPose.init(from:)(void *a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EBB2E8);
  uint64_t v4 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21F0B6B48();
  uint64_t v7 = v1;
  sub_21F0C9658();
  if (v2)
  {

    id v10 = ObjectType;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v8 = v4;
    char v16 = 0;
    sub_21F0B6ED0();
    uint64_t v9 = v13;
    sub_21F0C9538();
    *(void *)&v7[OBJC_IVAR____TtC10CoreIDVPAD9PADSWPose_pitch] = v17;
    char v16 = 1;
    sub_21F0C9538();
    *(void *)&v7[OBJC_IVAR____TtC10CoreIDVPAD9PADSWPose_yaw] = v17;
    char v16 = 2;
    sub_21F0C9538();
    *(void *)&v7[OBJC_IVAR____TtC10CoreIDVPAD9PADSWPose_roll] = v17;

    v15.receiver = v7;
    v15.super_class = ObjectType;
    id v10 = objc_msgSendSuper2(&v15, sel_init);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v9);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v10;
}

unint64_t sub_21F0B6ED0()
{
  unint64_t result = qword_267EBB2F0;
  if (!qword_267EBB2F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EBB2F0);
  }
  return result;
}

id sub_21F0B6F24@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id v6 = objc_allocWithZone(v2);
  id result = PADSWPose.init(from:)(a1);
  if (!v3) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_21F0B6F74(void *a1)
{
  return PADSWPose.encode(to:)(a1);
}

void PADSWFace.init()()
{
}

id _s10CoreIDVPAD9PADSWPoseCfD_0()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id PADSWFrame.__allocating_init(time:buffer:faces:orientation:gesture:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, unint64_t a6, uint64_t a7)
{
  id v15 = objc_allocWithZone(v7);
  id v16 = sub_21F0B7DA8(a1, a2, a3, a4, a5, a6 | ((HIDWORD(a6) & 1) << 32), a7);

  return v16;
}

id PADSWFrame.init(time:buffer:faces:orientation:gesture:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, unint64_t a6, uint64_t a7)
{
  id v8 = sub_21F0B7DA8(a1, a2, a3, a4, a5, a6 | ((HIDWORD(a6) & 1) << 32), a7);

  return v8;
}

id PADSWFrame.__deallocating_deinit()
{
  id v1 = objc_msgSend(self, sel_defaultCenter);
  if (qword_267EBABB8 != -1) {
    swift_once();
  }
  objc_msgSend(v1, sel_postNotificationName_object_, qword_267EBB170, 0);

  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for PADSWFrame();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

void sub_21F0B72E0()
{
  uint64_t v1 = v0;
  uint64_t v45 = *MEMORY[0x263EF8340];
  objc_super v2 = (void *)(v0 + OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_faces);
  swift_beginAccess();
  if (*v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v37 = sub_21F0C9488();
    swift_bridgeObjectRelease();
    if (v37) {
      return;
    }
  }
  else if (*(void *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    return;
  }
  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F1EFF8]), sel_init);
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F1EE90]), sel_init);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267EBB420);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_21F0CC940;
  *(void *)(v5 + 32) = v4;
  id v43 = (id)v5;
  sub_21F0C9148();
  sub_21F0A5404(0, (unint64_t *)&unk_267EBB410);
  id v6 = v4;
  uint64_t v7 = (void *)sub_21F0C9118();
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(v1 + OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_buffer);
  uint64_t v9 = *(unsigned int *)(v1 + OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_orientation);
  id v43 = 0;
  unsigned int v10 = objc_msgSend(v3, sel_performRequests_onCVPixelBuffer_orientation_error_, v7, v8, v9, &v43);

  if (v10)
  {
    id v11 = v43;
    id v12 = objc_msgSend(v6, sel_results);
    if (!v12)
    {
LABEL_21:
      id v43 = 0;
      uint64_t v44 = 0xE000000000000000;
      sub_21F0C93B8();
      sub_21F0C90C8();
      id v38 = objc_msgSend(v6, sel_results);
      if (v38)
      {
        sub_21F0A5404(0, (unint64_t *)&unk_267EBB210);
        unint64_t v39 = sub_21F0C9128();

        if (v39 >> 62)
        {
          swift_bridgeObjectRetain();
          id v38 = (id)sub_21F0C9488();
          swift_bridgeObjectRelease();
        }
        else
        {
          id v38 = *(id *)((v39 & 0xFFFFFFFFFFFFFF8) + 0x10);
        }
        swift_bridgeObjectRelease();
      }
      id v42 = v38;
      sub_21F0C95B8();
      sub_21F0C90C8();
      swift_bridgeObjectRelease();
      sub_21F0B1328((uint64_t)v43, v44, 0, 0, 0);
      swift_bridgeObjectRelease();
      goto LABEL_26;
    }
    uint64_t v13 = v12;
    sub_21F0A5404(0, (unint64_t *)&unk_267EBB210);
    unint64_t v14 = sub_21F0C9128();

    if (v14 >> 62)
    {
      swift_bridgeObjectRetain();
      id v15 = (void *)sub_21F0C9488();
      swift_bridgeObjectRelease();
      if (v15)
      {
LABEL_7:
        if ((v14 & 0xC000000000000001) != 0)
        {
          id v16 = (id)MEMORY[0x223C42390](0, v14);
        }
        else
        {
          if (!*(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            goto LABEL_31;
          }
          id v16 = *(id *)(v14 + 32);
        }
        id v15 = v16;
        swift_bridgeObjectRelease();
        id v17 = objc_msgSend(v6, sel_results);
        if (!v17)
        {
LABEL_16:

          goto LABEL_21;
        }
        unint64_t v18 = v17;
        unint64_t v19 = sub_21F0C9128();

        if (!(v19 >> 62))
        {
          uint64_t v20 = *(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10);
          goto LABEL_13;
        }
LABEL_31:
        swift_bridgeObjectRetain();
        uint64_t v20 = sub_21F0C9488();
        swift_bridgeObjectRelease();
LABEL_13:
        swift_bridgeObjectRelease();
        if (v20 == 1)
        {
          uint64_t v21 = swift_allocObject();
          *(_OWORD *)(v21 + 16) = xmmword_21F0CC940;
          objc_msgSend(v15, sel_boundingBox);
          uint64_t v23 = v22;
          uint64_t v25 = v24;
          uint64_t v27 = v26;
          uint64_t v29 = v28;
          id v30 = (objc_class *)type metadata accessor for PADSWPose();
          id v31 = (char *)objc_allocWithZone(v30);
          *(void *)&v31[OBJC_IVAR____TtC10CoreIDVPAD9PADSWPose_pitch] = 0;
          *(void *)&v31[OBJC_IVAR____TtC10CoreIDVPAD9PADSWPose_yaw] = 0;
          *(void *)&v31[OBJC_IVAR____TtC10CoreIDVPAD9PADSWPose_roll] = 0;
          v41.receiver = v31;
          v41.super_class = v30;
          id v32 = objc_msgSendSuper2(&v41, sel_init);
          uint64_t v33 = (objc_class *)type metadata accessor for PADSWFace();
          uint64_t v34 = (char *)objc_allocWithZone(v33);
          uint64_t v35 = &v34[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds];
          *(void *)uint64_t v35 = v23;
          *((void *)v35 + 1) = v25;
          *((void *)v35 + 2) = v27;
          *((void *)v35 + 3) = v29;
          *(void *)&v34[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_pose] = v32;
          v40.receiver = v34;
          v40.super_class = v33;
          *(void *)(v21 + 32) = objc_msgSendSuper2(&v40, sel_init);
          id v43 = (id)v21;
          sub_21F0C9148();
          void *v2 = v43;

          swift_bridgeObjectRelease();
          return;
        }
        goto LABEL_16;
      }
    }
    else
    {
      id v15 = *(void **)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v15) {
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    goto LABEL_21;
  }
  id v36 = v43;
  sub_21F0C8E78();

LABEL_26:
  swift_willThrow();
}

char *sub_21F0B7860()
{
  v30[4] = *(id *)MEMORY[0x263EF8340];
  uint64_t v1 = &v0[OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_faces];
  swift_beginAccess();
  unint64_t v2 = *(void *)v1;
  if (!(v2 >> 62))
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v3) {
      goto LABEL_3;
    }
LABEL_14:
    swift_bridgeObjectRelease();
    uint64_t v27 = 0xD000000000000033;
    uint64_t v28 = "No faces set for frame, unable to obtain face crop.";
    goto LABEL_15;
  }
  swift_bridgeObjectRetain();
  if (!sub_21F0C9488()) {
    goto LABEL_14;
  }
LABEL_3:
  if ((v2 & 0xC000000000000001) != 0)
  {
    id v4 = (char *)MEMORY[0x223C42390](0, v2);
  }
  else
  {
    if (!*(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      __break(1u);
    }
    id v4 = (char *)*(id *)(v2 + 32);
  }
  uint64_t v5 = v4;
  swift_bridgeObjectRelease();
  CGFloat v6 = *(double *)&v5[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds];
  CGFloat v7 = *(double *)&v5[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds + 8];
  CGFloat v8 = *(double *)&v5[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds + 16];
  CGFloat v9 = *(double *)&v5[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds + 24];

  v31.origin.double x = v6;
  v31.origin.double y = v7;
  v31.size.double width = v8;
  v31.size.double height = v9;
  CGFloat v10 = CGRectGetWidth(v31) * -0.765 * 0.5;
  v32.origin.double x = v6;
  v32.origin.double y = v7;
  v32.size.double width = v8;
  v32.size.double height = v9;
  CGFloat v11 = CGRectGetHeight(v32) * -0.765 * 0.5;
  v33.origin.double x = v6;
  v33.origin.double y = v7;
  v33.size.double width = v8;
  v33.size.double height = v9;
  CGRect v34 = CGRectInset(v33, v10, v11);
  double x = v34.origin.x;
  double y = v34.origin.y;
  double width = v34.size.width;
  double height = v34.size.height;
  v34.origin.double x = 0.0;
  v34.origin.double y = 0.0;
  v34.size.double width = 1.0;
  v34.size.double height = 1.0;
  v39.origin.double x = x;
  v39.origin.double y = y;
  v39.size.double width = width;
  v39.size.double height = height;
  if (CGRectContainsRect(v34, v39))
  {
    v35.origin.double x = 0.0;
    v35.origin.double y = 0.0;
    v35.size.double width = 1.0;
    v35.size.double height = 1.0;
    v40.origin.double x = x;
    v40.origin.double y = y;
    v40.size.double width = width;
    v40.size.double height = height;
    CGRect v36 = CGRectIntersection(v35, v40);
    double x = v36.origin.x;
    double y = v36.origin.y;
    double width = v36.size.width;
    double height = v36.size.height;
  }
  uint64_t v16 = OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_buffer;
  int64_t v17 = CVPixelBufferGetWidth(*(CVPixelBufferRef *)&v0[OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_buffer]);
  CVPixelBufferGetHeight(*(CVPixelBufferRef *)&v0[v16]);
  CVPixelBufferGetWidth(*(CVPixelBufferRef *)&v0[v16]);
  int64_t v18 = CVPixelBufferGetHeight(*(CVPixelBufferRef *)&v0[v16]);
  v37.origin.double x = x * (double)v17;
  v37.size.double width = width * (double)v17;
  v37.origin.double y = y * (double)v18;
  v37.size.double height = height * (double)v18;
  CGRect v38 = CGRectIntegral(v37);
  double v19 = v38.origin.x;
  double v20 = v38.origin.y;
  double v21 = v38.size.width;
  double v22 = v38.size.height;
  id v23 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F1EF38]), sel_initWithCVPixelBuffer_orientation_options_, *(void *)&v0[v16], *(unsigned int *)&v0[OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_orientation], 0);
  if (!v23)
  {
    uint64_t v27 = 0xD000000000000030;
    uint64_t v28 = "Unable to creat VNImageBuffer from CVPixelBuffer";
LABEL_15:
    sub_21F0B1328(v27, (unint64_t)(v28 - 32) | 0x8000000000000000, 0, 0, 0);
    swift_willThrow();
    return v0;
  }
  uint64_t v24 = v23;
  uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(*(CVPixelBufferRef *)&v0[v16]);
  v30[0] = 0;
  uint64_t v0 = (char *)objc_msgSend(v24, sel_cropAndScaleBufferWithWidth_height_cropRect_format_imageCropAndScaleOption_options_error_calculatedNormalizedOriginOffset_calculatedScaleX_calculatedScaleY_, 128, 128, PixelFormatType, 2, 0, v30, v19, v20, v21, v22, 0, 0, 0);
  id v26 = v30[0];
  if (!v0)
  {
    sub_21F0B1328(0xD000000000000027, 0x800000021F0CF590, 0, 0, 0);
    swift_willThrow();
  }

  return v0;
}

id PADSWFrame.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void PADSWFrame.init()()
{
}

uint64_t sub_21F0B7C88(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6863746970 && a2 == 0xE500000000000000;
  if (v3 || (sub_21F0C95D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 7823737 && a2 == 0xE300000000000000 || (sub_21F0C95D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1819045746 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_21F0C95D8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

id sub_21F0B7DA8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  CGFloat v9 = &v7[OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_time];
  *(void *)CGFloat v9 = a1;
  *((void *)v9 + 1) = a2;
  *((void *)v9 + 2) = a3;
  *(void *)&v7[OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_buffer] = a4;
  *(void *)&v7[OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_faces] = a5;
  *(void *)&v7[OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_gesture] = a7;
  if ((a6 & 0x100000000) != 0)
  {
    CMAttachmentMode attachmentModeOut = 0;
    CFStringRef v11 = (const __CFString *)*MEMORY[0x263F0F4C8];
    id v12 = v7;
    CFTypeRef v13 = (id)CMGetAttachment(a4, v11, &attachmentModeOut);
    swift_unknownObjectRelease();
    *(_DWORD *)&v12[OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_orientation] = attachmentModeOut;
  }
  else
  {
    *(_DWORD *)&v7[OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_orientation] = a6;
    id v10 = a4;
  }
  v15.receiver = v7;
  v15.super_class = (Class)type metadata accessor for PADSWFrame();
  return objc_msgSendSuper2(&v15, sel_init);
}

uint64_t type metadata accessor for PADSWFrame()
{
  return self;
}

uint64_t type metadata accessor for PADSWPose()
{
  return self;
}

uint64_t method lookup function for PADSWPose(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PADSWPose);
}

uint64_t dispatch thunk of PADSWPose.__allocating_init(from:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t type metadata accessor for PADSWFace()
{
  return self;
}

uint64_t method lookup function for PADSWFace(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PADSWFace);
}

uint64_t method lookup function for PADSWFrame(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PADSWFrame);
}

uint64_t dispatch thunk of PADSWFrame.__allocating_init(time:buffer:faces:orientation:gesture:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t))(v6 + 256))(a1, a2, a3, a4, a5, a6 | ((HIDWORD(a6) & 1) << 32));
}

unsigned char *storeEnumTagSinglePayload for PADSWPose.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    char *result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x21F0B808CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          char *result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PADSWPose.CodingKeys()
{
  return &type metadata for PADSWPose.CodingKeys;
}

unint64_t sub_21F0B80C8()
{
  unint64_t result = qword_267EBB330;
  if (!qword_267EBB330)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EBB330);
  }
  return result;
}

unint64_t sub_21F0B8120()
{
  unint64_t result = qword_267EBB338;
  if (!qword_267EBB338)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EBB338);
  }
  return result;
}

unint64_t sub_21F0B8178()
{
  unint64_t result = qword_267EBB340;
  if (!qword_267EBB340)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EBB340);
  }
  return result;
}

uint64_t destroy for PADObservationComposite()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PADObservationComposite(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PADObservationComposite(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(_DWORD *)(a1 + 12) = *(_DWORD *)(a2 + 12);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for PADObservationComposite(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  uint64_t v3 = a2[3];
  a1[2] = a2[2];
  a1[3] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PADObservationComposite(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PADObservationComposite(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PADObservationComposite()
{
  return &type metadata for PADObservationComposite;
}

uint64_t sub_21F0B834C(uint64_t a1, unint64_t a2)
{
  return sub_21F0B8A18(a1, a2, (SEL *)&selRef_performFAC_gesture_error_);
}

void *sub_21F0B83A4(uint64_t a1)
{
  unint64_t v2 = &selRef_framesFromVideoURL_timestamps_size_error_;
  id v3 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  unsigned int v4 = v3;
  uint64_t v57 = MEMORY[0x263F8EE78];
  uint64_t v52 = *(void *)(a1 + 16);
  if (!v52)
  {
    id v45 = v3;
    goto LABEL_41;
  }
  uint64_t v51 = a1 + 32;
  uint64_t v50 = type metadata accessor for PADFacePoseRequest();
  id v5 = v4;
  swift_bridgeObjectRetain();
  uint64_t v6 = 0;
  CGFloat v48 = v4;
  do
  {
    uint64_t v7 = v51 + 32 * v6;
    uint64_t v8 = *(void *)v7;
    uint64_t v9 = *(unsigned int *)(v7 + 8);
    uint64_t v10 = *(unsigned int *)(v7 + 12);
    uint64_t v12 = *(void *)(v7 + 16);
    uint64_t v11 = *(void *)(v7 + 24);
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267EBB358);
    uint64_t v13 = sub_21F0C90A8();
    if (!*(void *)(v11 + 16) || (unint64_t v15 = sub_21F0C43B4(v13, v14), (v16 & 1) == 0))
    {
      swift_bridgeObjectRelease();
      long long v55 = 0u;
      long long v56 = 0u;
LABEL_4:
      sub_21F0A620C((uint64_t)&v55);
LABEL_5:
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    uint64_t v17 = *(void *)(*(void *)(v11 + 56) + 8 * v15);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    if (*(void *)(v17 + 16))
    {
      sub_21F09F5EC(v17 + 32, (uint64_t)&v55);
    }
    else
    {
      long long v55 = 0u;
      long long v56 = 0u;
    }
    swift_bridgeObjectRelease();
    if (!*((void *)&v56 + 1)) {
      goto LABEL_4;
    }
    if ((swift_dynamicCast() & 1) == 0) {
      goto LABEL_5;
    }
    id v18 = [objc_allocWithZone((Class)PADAlgorithmFacePoseInput) v2[103]];
    objc_msgSend(v18, sel_setPitch_, v53);
    objc_msgSend(v18, sel_setYaw_, *((float *)&v50 + 1));
    objc_msgSend(v18, sel_setRoll_, *(float *)&v50);
    objc_msgSend(v18, sel_setSmile_, v54);
    uint64_t v19 = v9 | (v10 << 32);
    double v20 = v18;
    double v21 = (void *)sub_21F0B9400(v8, v19, v12, v11, (uint64_t (*)(void))sub_21F0BD290);
    if (v21)
    {
      uint64_t v49 = v19;
      id v22 = v21;
      id v23 = objc_msgSend(v22, sel_landmarks);
      if (v23)
      {
        uint64_t v24 = v23;
        id v25 = objc_msgSend(v23, sel_allPoints);

        if (v25)
        {
          id v26 = sub_21F08C068();

          uint64_t v27 = *((void *)v26 + 2);
          if (v27)
          {
            *(void *)&long long v55 = MEMORY[0x263F8EE78];
            sub_21F0C9428();
            uint64_t v28 = 0;
            do
            {
              uint64_t v29 = v28 + 1;
              int v30 = *(_DWORD *)&v26[4 * v28 + 32];
              id v31 = objc_allocWithZone(NSNumber);
              LODWORD(v32) = v30;
              objc_msgSend(v31, sel_initWithFloat_, v32);
              sub_21F0C9408();
              sub_21F0C9438();
              sub_21F0C9448();
              sub_21F0C9418();
              uint64_t v28 = v29;
            }
            while (v27 != v29);
            swift_bridgeObjectRelease();
            unsigned int v4 = v48;
            unint64_t v2 = &selRef_framesFromVideoURL_timestamps_size_error_;
          }
          else
          {
            swift_bridgeObjectRelease();
            unint64_t v2 = &selRef_framesFromVideoURL_timestamps_size_error_;
          }
          sub_21F0A5404(0, &qword_267EBAE88);
          id v25 = (id)sub_21F0C9118();
          swift_bridgeObjectRelease();
        }
        else
        {
        }
      }
      else
      {

        id v25 = 0;
      }
      uint64_t v19 = v49;
      objc_msgSend(v20, sel_setLandmarks_, v25);
    }
    CGRect v33 = (void *)sub_21F0B9400(v8, v19, v12, v11, (uint64_t (*)(void))sub_21F0BD11C);
    swift_bridgeObjectRelease();
    CGRect v34 = v20;
    unint64_t v35 = 0x263F08000uLL;
    if (v33)
    {
      CGRect v36 = v20;
      unint64_t v37 = sub_21F0B27EC(v33);
      if (v37)
      {
        unint64_t v38 = v37;
        uint64_t v39 = *(void *)(v37 + 16);
        if (v39)
        {
          *(void *)&long long v55 = MEMORY[0x263F8EE78];
          sub_21F0C9428();
          uint64_t v40 = 0;
          do
          {
            uint64_t v41 = v40 + 1;
            int v42 = *(_DWORD *)(v38 + 4 * v40 + 32);
            id v43 = objc_allocWithZone(*(Class *)(v35 + 2584));
            LODWORD(v44) = v42;
            objc_msgSend(v43, sel_initWithFloat_, v44);
            sub_21F0C9408();
            sub_21F0C9438();
            unint64_t v35 = 0x263F08000;
            sub_21F0C9448();
            sub_21F0C9418();
            uint64_t v40 = v41;
          }
          while (v39 != v41);
          swift_bridgeObjectRelease();
          unint64_t v2 = &selRef_framesFromVideoURL_timestamps_size_error_;
          unsigned int v4 = v48;
        }
        else
        {
          swift_bridgeObjectRelease();
        }
        double v20 = v36;
        sub_21F0A5404(0, &qword_267EBAE88);
        CGRect v34 = (void *)sub_21F0C9118();
        swift_bridgeObjectRelease();
      }
      else
      {
        CGRect v34 = 0;
      }
      objc_msgSend(v20, sel_setFaceprint_, v34);
    }
    MEMORY[0x223C420C0]();
    if (*(void *)((v57 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v57 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_21F0C9158();
    }
    sub_21F0C9178();
    sub_21F0C9148();
LABEL_6:
    ++v6;
  }
  while (v6 != v52);
  swift_bridgeObjectRelease();
LABEL_41:
  swift_bridgeObjectRelease();
  sub_21F0A5404(0, &qword_267EBB360);
  CGFloat v46 = (void *)sub_21F0C9118();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, sel_setFacePoseValues_, v46);

  return v4;
}

uint64_t sub_21F0B89C0(uint64_t a1, unint64_t a2)
{
  return sub_21F0B8A18(a1, a2, (SEL *)&selRef_processFacePoseInput_gesture_error_);
}

uint64_t sub_21F0B8A18(uint64_t a1, unint64_t a2, SEL *a3)
{
  uint64_t v5 = v3;
  v17[2] = *(id *)MEMORY[0x263EF8340];
  if (a2 == 9 || a2 == 4) {
    uint64_t v7 = (void *)(v3 + 104);
  }
  else {
    uint64_t v7 = (void *)(v3 + 96);
  }
  if (*(void *)(a1 + 16) < *v7)
  {
    sub_21F0C93B8();
    sub_21F0C90C8();
    id v8 = (id)MEMORY[0x263F8D738];
    sub_21F0C95B8();
    sub_21F0C90C8();
    swift_bridgeObjectRelease();
    sub_21F0C90C8();
    sub_21F0C95B8();
    sub_21F0C90C8();
    swift_bridgeObjectRelease();
    sub_21F0C90C8();
    sub_21F0B1328(0, 0xE000000000000000, 0, -5, 0);
    swift_bridgeObjectRelease();
    swift_willThrow();
    return (uint64_t)v8;
  }
  sub_21F0A5404(0, &qword_267EBB348);
  uint64_t v9 = swift_bridgeObjectRetain();
  uint64_t v10 = sub_21F0B83A4(v9);
  if (a2 < 6 || a2 - 8 < 3)
  {
    uint64_t v11 = *(void **)(v5 + 16);
    v17[0] = 0;
    id v12 = objc_msgSend(v11, *a3, v10, a2, v17);
    id v8 = v17[0];
    if (v12)
    {
      uint64_t v13 = v12;
      id v14 = v17[0];
      id v8 = (id)sub_21F0B94C8(v13);
    }
    else
    {
      id v15 = v17[0];
      sub_21F0C8E78();

      swift_willThrow();
    }

    return (uint64_t)v8;
  }
  uint64_t result = sub_21F0C95E8();
  __break(1u);
  return result;
}

void sub_21F0B8CB4(uint64_t a1, uint64_t a2)
{
  v28[2] = *(id *)MEMORY[0x263EF8340];
  int64_t v3 = *(void *)(a2 + 16);
  if (!v3)
  {
    uint64_t v7 = 0xD00000000000003BLL;
    id v8 = "ID matching frame faceprints must contain at least 1 value.";
LABEL_10:
    sub_21F0B1328(v7, (unint64_t)(v8 - 32) | 0x8000000000000000, 0, -1, 0);
LABEL_12:
    swift_willThrow();
    return;
  }
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
    uint64_t v7 = 0xD000000000000034;
    id v8 = "Selfie Faceprint must contain at least one dimension";
    goto LABEL_10;
  }
  uint64_t v26 = a2 + 32;
  if (*(void *)(*(void *)(a2 + 32) + 16) != v4)
  {
LABEL_11:
    v28[0] = 0;
    v28[1] = (id)0xE000000000000000;
    sub_21F0C93B8();
    sub_21F0C90C8();
    sub_21F0C95B8();
    sub_21F0C90C8();
    swift_bridgeObjectRelease();
    sub_21F0C90C8();
    sub_21F0B1328(0, 0xE000000000000000, 0, -1, 0);
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  uint64_t v5 = 0;
  while (v3 - 1 != v5)
  {
    uint64_t v6 = *(void *)(*(void *)(a2 + 40 + 8 * v5++) + 16);
    if (v6 != v4) {
      goto LABEL_11;
    }
  }
  v28[0] = (id)MEMORY[0x263F8EE78];
  sub_21F0C39D0(0, v3, 0);
  uint64_t v9 = 0;
  uint64_t v10 = v28[0];
  int64_t v25 = v3;
  do
  {
    uint64_t v11 = *(void *)(v26 + 8 * v9);
    uint64_t v12 = *(void *)(v11 + 16);
    if (v12)
    {
      uint64_t v27 = MEMORY[0x263F8EE78];
      swift_bridgeObjectRetain();
      sub_21F0C9428();
      uint64_t v13 = 0;
      do
      {
        uint64_t v14 = v13 + 1;
        int v15 = *(_DWORD *)(v11 + 4 * v13 + 32);
        id v16 = objc_allocWithZone(NSNumber);
        LODWORD(v17) = v15;
        objc_msgSend(v16, sel_initWithFloat_, v17);
        sub_21F0C9408();
        sub_21F0C9438();
        sub_21F0C9448();
        sub_21F0C9418();
        uint64_t v13 = v14;
      }
      while (v12 != v14);
      uint64_t v18 = v27;
      swift_bridgeObjectRelease();
      int64_t v3 = v25;
    }
    else
    {
      uint64_t v18 = MEMORY[0x263F8EE78];
    }
    v28[0] = v10;
    unint64_t v20 = v10[2];
    unint64_t v19 = v10[3];
    if (v20 >= v19 >> 1)
    {
      sub_21F0C39D0(v19 > 1, v20 + 1, 1);
      uint64_t v10 = v28[0];
    }
    ++v9;
    v10[2] = v20 + 1;
    v10[v20 + 4] = v18;
  }
  while (v9 != v3);
  sub_21F0B9094(a1);
  double v21 = *(void **)(v2 + 16);
  sub_21F0A5404(0, &qword_267EBAE88);
  id v22 = (void *)sub_21F0C9118();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EBB068);
  id v23 = (void *)sub_21F0C9118();
  swift_bridgeObjectRelease();
  v28[0] = 0;
  objc_msgSend(v21, sel_performIDMatching_toFaceprints_error_, v22, v23, v28);

  if (v28[0])
  {
    v28[0];
    goto LABEL_12;
  }
}

uint64_t sub_21F0B9094(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = MEMORY[0x263F8EE78];
  if (v2)
  {
    uint64_t v8 = MEMORY[0x263F8EE78];
    sub_21F0C9428();
    uint64_t v4 = (int *)(a1 + 32);
    do
    {
      int v5 = *v4++;
      id v6 = objc_allocWithZone(NSNumber);
      LODWORD(v7) = v5;
      objc_msgSend(v6, sel_initWithFloat_, v7);
      sub_21F0C9408();
      sub_21F0C9438();
      sub_21F0C9448();
      sub_21F0C9418();
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_21F0B9164(uint64_t a1, char a2)
{
  v9[1] = *MEMORY[0x263EF8340];
  v9[0] = 0xBFF0000000000000;
  char v8 = 0;
  uint64_t v4 = *(void **)(v2 + 16);
  id v7 = 0;
  objc_msgSend(v4, sel_performTA_nccSignal_stitchDetected_isSensitive_error_, a1, v9, &v8, a2 & 1, &v7);
  if (v7)
  {
    v7;
    swift_willThrow();
  }
  else
  {
    char v5 = v8;
  }
  return v5 & 1;
}

uint64_t sub_21F0B9220(float a1, float a2, float a3, float a4)
{
  v25[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v9 = *(void **)(v4 + 16);
  id v10 = objc_allocWithZone(NSNumber);
  *(float *)&double v11 = a1;
  id v12 = objc_msgSend(v10, sel_initWithFloat_, v11);
  uint64_t v13 = (void *)sub_21F0C91F8();
  id v14 = objc_allocWithZone(NSNumber);
  *(float *)&double v15 = a2;
  id v16 = objc_msgSend(v14, sel_initWithFloat_, v15);
  id v17 = objc_allocWithZone(NSNumber);
  *(float *)&double v18 = a3;
  id v19 = objc_msgSend(v17, sel_initWithFloat_, v18);
  id v20 = objc_allocWithZone(NSNumber);
  *(float *)&double v21 = a4;
  id v22 = objc_msgSend(v20, sel_initWithFloat_, v21);
  v25[0] = 0;
  id v23 = objc_msgSend(v9, sel_performSC_assessmentTA_assessmentFakePRD_assessmentLivePRD_assessmentID_error_, v12, v13, v16, v19, v22, v25);

  if (v25[0])
  {
    v25[0];
    return swift_willThrow();
  }
  else if (v23 == (id)2)
  {
    return 2;
  }
  else
  {
    return v23 == (id)1;
  }
}

uint64_t sub_21F0B939C()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0228](v0, 240, 7);
}

uint64_t type metadata accessor for PADLivenessClassifier()
{
  return self;
}

uint64_t sub_21F0B9400(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v5 = a5();
  if (!v5)
  {
    long long v8 = 0u;
    long long v9 = 0u;
    goto LABEL_9;
  }
  if (!*(void *)(v5 + 16))
  {
    long long v8 = 0u;
    long long v9 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  sub_21F09F5EC(v5 + 32, (uint64_t)&v8);
  swift_bridgeObjectRelease();
  if (!*((void *)&v9 + 1))
  {
LABEL_9:
    sub_21F0A620C((uint64_t)&v8);
    return 0;
  }
  sub_21F0A5404(0, (unint64_t *)&unk_267EBB210);
  if (swift_dynamicCast()) {
    return v7;
  }
  else {
    return 0;
  }
}

uint64_t sub_21F0B94C8(void *a1)
{
  id v1 = objc_msgSend(a1, sel_assessment);
  if (v1)
  {
    uint64_t v2 = v1;
    unint64_t v3 = (unint64_t)objc_msgSend(v1, sel_integerValue);
  }
  else
  {
    unint64_t v3 = -1;
  }
  unint64_t v4 = sub_21F0B1CE4(v3);
  LOBYTE(v6) = v5;
  id v7 = objc_msgSend(a1, sel_faceprints);
  sub_21F0A5404(0, &qword_267EBB350);
  unint64_t v8 = sub_21F0C9128();

  if (v8 >> 62) {
    goto LABEL_42;
  }
  uint64_t v9 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_6:
  uint64_t v10 = MEMORY[0x263F8EE78];
  unint64_t v39 = v4;
  char v38 = v6;
  if (v9)
  {
    uint64_t v47 = MEMORY[0x263F8EE78];
    uint64_t result = sub_21F0C3AF0(0, v9 & ~(v9 >> 63), 0);
    if ((v9 & 0x8000000000000000) == 0)
    {
      uint64_t v12 = 0;
      uint64_t v43 = v9;
      unint64_t v44 = v8 & 0xC000000000000001;
      uint64_t v13 = v47;
      unint64_t v41 = v8 + 32;
      unint64_t v42 = v8;
      while (1)
      {
        if (v12 == v9)
        {
          __break(1u);
LABEL_41:
          __break(1u);
LABEL_42:
          swift_bridgeObjectRetain();
          uint64_t v9 = sub_21F0C9488();
          swift_bridgeObjectRelease();
          goto LABEL_6;
        }
        if (v44) {
          id v14 = (id)MEMORY[0x223C42390](v12, v8);
        }
        else {
          id v14 = *(id *)(v41 + 8 * v12);
        }
        unint64_t v4 = (unint64_t)v14;
        id v15 = objc_msgSend(v14, sel_faceprint);
        sub_21F0A5404(0, &qword_267EBAE88);
        unint64_t v6 = sub_21F0C9128();

        if (v6 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v16 = sub_21F0C9488();
          swift_bridgeObjectRelease();
          id v46 = (id)v4;
          if (!v16)
          {
LABEL_25:
            swift_bridgeObjectRelease();
            uint64_t v18 = v10;
            goto LABEL_26;
          }
        }
        else
        {
          uint64_t v16 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
          id v46 = (id)v4;
          if (!v16) {
            goto LABEL_25;
          }
        }
        uint64_t v45 = v13;
        sub_21F0C3AA8(0, v16 & ~(v16 >> 63), 0);
        if (v16 < 0) {
          goto LABEL_41;
        }
        uint64_t v17 = 0;
        uint64_t v18 = v10;
        do
        {
          if ((v6 & 0xC000000000000001) != 0) {
            id v19 = (id)MEMORY[0x223C42390](v17, v6);
          }
          else {
            id v19 = *(id *)(v6 + 8 * v17 + 32);
          }
          id v20 = v19;
          objc_msgSend(v19, sel_floatValue);
          int v22 = v21;

          unint64_t v24 = *(void *)(v10 + 16);
          unint64_t v23 = *(void *)(v10 + 24);
          if (v24 >= v23 >> 1) {
            sub_21F0C3AA8(v23 > 1, v24 + 1, 1);
          }
          ++v17;
          *(void *)(v10 + 16) = v24 + 1;
          *(_DWORD *)(v10 + 4 * v24 + 32) = v22;
        }
        while (v16 != v17);
        swift_bridgeObjectRelease();
        uint64_t v13 = v45;
        uint64_t v10 = MEMORY[0x263F8EE78];
        unint64_t v8 = v42;
LABEL_26:
        id v25 = objc_msgSend(v46, sel_index);

        unint64_t v6 = *(void *)(v13 + 16);
        unint64_t v26 = *(void *)(v13 + 24);
        unint64_t v4 = v6 + 1;
        if (v6 >= v26 >> 1) {
          sub_21F0C3AF0(v26 > 1, v6 + 1, 1);
        }
        ++v12;
        *(void *)(v13 + 16) = v4;
        uint64_t v27 = v13 + 16 * v6;
        *(void *)(v27 + 32) = v18;
        *(void *)(v27 + 4sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = v25;
        uint64_t v9 = v43;
        if (v12 == v43) {
          goto LABEL_29;
        }
      }
    }
    __break(1u);
    goto LABEL_48;
  }
LABEL_29:
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_isHeadMovementDetected);
  id v28 = objc_msgSend(a1, sel_referenceFrameIndices);
  sub_21F0A5404(0, &qword_267EBAE88);
  unint64_t v29 = sub_21F0C9128();

  if (v29 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v30 = sub_21F0C9488();
    swift_bridgeObjectRelease();
    if (!v30) {
      goto LABEL_44;
    }
  }
  else
  {
    uint64_t v30 = *(void *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v30) {
      goto LABEL_44;
    }
  }
  uint64_t result = sub_21F0C3AC8(0, v30 & ~(v30 >> 63), 0);
  if (v30 < 0)
  {
LABEL_48:
    __break(1u);
    return result;
  }
  uint64_t v31 = 0;
  uint64_t v32 = v10;
  do
  {
    if ((v29 & 0xC000000000000001) != 0) {
      id v33 = (id)MEMORY[0x223C42390](v31, v29);
    }
    else {
      id v33 = *(id *)(v29 + 8 * v31 + 32);
    }
    CGRect v34 = v33;
    id v35 = objc_msgSend(v33, sel_integerValue);

    unint64_t v37 = *(void *)(v32 + 16);
    unint64_t v36 = *(void *)(v32 + 24);
    if (v37 >= v36 >> 1) {
      sub_21F0C3AC8(v36 > 1, v37 + 1, 1);
    }
    ++v31;
    *(void *)(v32 + 16) = v37 + 1;
    *(void *)(v32 + 8 * v37 + 32) = v35;
  }
  while (v30 != v31);
LABEL_44:
  swift_bridgeObjectRelease();

  if (v38) {
    return 3;
  }
  else {
    return v39;
  }
}

ValueMetadata *type metadata accessor for PADFaceActionClassifierFaceprintResult()
{
  return &type metadata for PADFaceActionClassifierFaceprintResult;
}

unint64_t sub_21F0B9A14(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6863746970;
      break;
    case 2:
      unint64_t result = 1819045746;
      break;
    case 3:
      unint64_t result = 7823737;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_21F0B9A98()
{
  return sub_21F0B9A14(*v0);
}

uint64_t sub_21F0B9AA0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_21F0BB0E8(a1, a2);
  *a3 = result;
  return result;
}

void sub_21F0B9AC8(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_21F0B9AD4(uint64_t a1)
{
  unint64_t v2 = sub_21F0B9D58();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_21F0B9B10(uint64_t a1)
{
  unint64_t v2 = sub_21F0B9D58();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t PADPrintReplayAssessment.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EBB368);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v1;
  uint64_t v8 = v1[1];
  uint64_t v11 = v1[2];
  uint64_t v10 = v1[3];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21F0B9D58();
  sub_21F0C9668();
  uint64_t v14 = v9;
  HIBYTE(v13) = 0;
  sub_21F0B6B9C();
  sub_21F0C9598();
  if (!v2)
  {
    uint64_t v14 = v8;
    HIBYTE(v13) = 1;
    sub_21F0C9598();
    uint64_t v14 = v11;
    HIBYTE(v13) = 2;
    sub_21F0C9598();
    uint64_t v14 = v10;
    HIBYTE(v13) = 3;
    sub_21F0C9598();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_21F0B9D58()
{
  unint64_t result = qword_267EBB370;
  if (!qword_267EBB370)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EBB370);
  }
  return result;
}

uint64_t PADPrintReplayAssessment.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EBB378);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21F0B9D58();
  sub_21F0C9658();
  if (!v2)
  {
    HIBYTE(v14) = 0;
    sub_21F0B6ED0();
    sub_21F0C9538();
    uint64_t v9 = v15;
    HIBYTE(v14) = 1;
    sub_21F0C9538();
    uint64_t v10 = v15;
    HIBYTE(v14) = 2;
    sub_21F0C9538();
    uint64_t v12 = v15;
    HIBYTE(v14) = 3;
    sub_21F0C9538();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    uint64_t v13 = v15;
    *a2 = v9;
    a2[1] = v10;
    a2[2] = v12;
    a2[3] = v13;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_21F0BA008@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return PADPrintReplayAssessment.init(from:)(a1, a2);
}

uint64_t sub_21F0BA020(void *a1)
{
  return PADPrintReplayAssessment.encode(to:)(a1);
}

ValueMetadata *type metadata accessor for PADPrintReplayAssessment()
{
  return &type metadata for PADPrintReplayAssessment;
}

float sub_21F0BA048()
{
  uint64_t v1 = sub_21F0C8FC8();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v5 = *(void *)(v0 + 128);
  uint64_t v6 = *(void *)(v5 + 16);
  if (v6)
  {
    uint64_t v7 = (double *)(v5 + 32);
    float v8 = 0.0;
    uint64_t v9 = v6;
    do
    {
      double v10 = *v7;
      v7 += 4;
      if (*(double *)(*(void *)(v0 + 120) + 136) < v10) {
        float v8 = v8 + 1.0;
      }
      --v9;
    }
    while (v9);
    return v8 / (float)v6;
  }
  else
  {
    if (qword_267EBAB80 != -1) {
      swift_once();
    }
    uint64_t v12 = __swift_project_value_buffer(v1, (uint64_t)qword_267EBAB88);
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v12, v1);
    uint64_t v13 = sub_21F0C8FA8();
    os_log_type_t v14 = sub_21F0C9238();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v15 = 0;
      MEMORY[0x223C43270](v15, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    return -1.0;
  }
}

float sub_21F0BA23C()
{
  uint64_t v1 = sub_21F0C8FC8();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v5 = *(void *)(v0 + 128);
  uint64_t v6 = *(void *)(v5 + 16);
  if (v6)
  {
    uint64_t v7 = (double *)(v5 + 32);
    float v8 = 0.0;
    uint64_t v9 = v6;
    do
    {
      double v10 = *v7;
      v7 += 4;
      if (v10 < *(double *)(*(void *)(v0 + 120) + 152)) {
        float v8 = v8 + 1.0;
      }
      --v9;
    }
    while (v9);
    return v8 / (float)v6;
  }
  else
  {
    if (qword_267EBAB80 != -1) {
      swift_once();
    }
    uint64_t v12 = __swift_project_value_buffer(v1, (uint64_t)qword_267EBAB88);
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v12, v1);
    uint64_t v13 = sub_21F0C8FA8();
    os_log_type_t v14 = sub_21F0C9238();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v15 = 0;
      MEMORY[0x223C43270](v15, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    return -1.0;
  }
}

BOOL sub_21F0BA430(char *a1)
{
  uint64_t v2 = sub_21F0C8FC8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = &a1[OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_faces];
  swift_beginAccess();
  if (*(void *)v6 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_21F0C9488();
    swift_bridgeObjectRelease();
    if (v7 == 1) {
      return v7 == 1;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((*(void *)v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v7 == 1) {
      return v7 == 1;
    }
  }
  if (qword_267EBAB80 != -1) {
    swift_once();
  }
  uint64_t v8 = __swift_project_value_buffer(v2, (uint64_t)qword_267EBAB88);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v8, v2);
  uint64_t v9 = a1;
  double v10 = sub_21F0C8FA8();
  os_log_type_t v11 = sub_21F0C9238();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 134217984;
    unint64_t v13 = *(void *)v6;
    if (v13 >> 62)
    {
      uint64_t v18 = v3;
      swift_bridgeObjectRetain();
      uint64_t v16 = sub_21F0C9488();
      swift_bridgeObjectRelease();
      uint64_t v14 = v16;
      uint64_t v3 = v18;
    }
    else
    {
      uint64_t v14 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    uint64_t v19 = v14;
    sub_21F0C9308();

    _os_log_impl(&dword_21F07C000, v10, v11, "Found %ld faces in the frame. Skipping PRD.", v12, 0xCu);
    MEMORY[0x223C43270](v12, -1, -1);
  }
  else
  {

    double v10 = v9;
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v7 == 1;
}

uint64_t sub_21F0BA6D8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_time + 16);
  *(_OWORD *)(v1 + 136) = *(_OWORD *)(a1 + OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_time);
  *(void *)(v1 + 152) = v2;
  *(unsigned char *)(v1 + 16sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = 0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267EBB400);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_21F0CCCB0;
  swift_weakLoadStrong();
  uint64_t v4 = type metadata accessor for PADFacePoseRequest();
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 24) = 0u;
  *(_OWORD *)(v5 + 4sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = 0u;
  *(unsigned char *)(v5 + 56) = 1;
  swift_weakInit();
  swift_weakAssign();
  swift_release();
  *(void *)(v3 + 56) = v4;
  *(void *)(v3 + 64) = &off_26D0A6660;
  *(void *)(v3 + 32) = v5;
  swift_weakLoadStrong();
  uint64_t v6 = type metadata accessor for PADPrintReplayRequest();
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 24) = xmmword_21F0CCCC0;
  swift_weakInit();
  swift_weakAssign();
  swift_release();
  *(void *)(v3 + 96) = v6;
  *(void *)(v3 + 104) = &off_26D0A6660;
  *(void *)(v3 + 72) = v7;
  return v3;
}

uint64_t sub_21F0BA81C(uint64_t a1)
{
  swift_beginAccess();
  sub_21F0BB268(v1 + 168, (uint64_t)v9);
  if (!v10) {
    return sub_21F09543C((uint64_t)v9, &qword_267EBAEF8);
  }
  sub_21F093D74((uint64_t)v9, (uint64_t)v6);
  sub_21F09543C((uint64_t)v9, &qword_267EBAEF8);
  uint64_t v3 = v7;
  uint64_t v4 = v8;
  __swift_project_boxed_opaque_existential_1(v6, v7);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 8))(a1, v3, v4);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
}

void sub_21F0BA8E4(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_21F0C8FC8();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v40 - v9;
  swift_beginAccess();
  sub_21F0BB268(v1 + 168, (uint64_t)&v44);
  if (*((void *)&v45 + 1))
  {
    sub_21F093D74((uint64_t)&v44, (uint64_t)&v40);
    sub_21F09543C((uint64_t)&v44, &qword_267EBAEF8);
    uint64_t v11 = v42;
    uint64_t v12 = v43;
    __swift_project_boxed_opaque_existential_1(&v40, v42);
    (*(void (**)(void, uint64_t, uint64_t))(v12 + 8))(0, v11, v12);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v40);
    uint64_t v13 = a1[2];
    if (!v13) {
      goto LABEL_9;
    }
  }
  else
  {
    sub_21F09543C((uint64_t)&v44, &qword_267EBAEF8);
    uint64_t v13 = a1[2];
    if (!v13)
    {
LABEL_9:
      if (qword_267EBAB80 != -1) {
        swift_once();
      }
      uint64_t v20 = __swift_project_value_buffer(v4, (uint64_t)qword_267EBAB88);
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v20, v4);
      swift_bridgeObjectRetain();
      int v21 = sub_21F0C8FA8();
      os_log_type_t v22 = sub_21F0C9238();
      if (os_log_type_enabled(v21, v22))
      {
        unint64_t v23 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)unint64_t v23 = 134217984;
        *(void *)&long long v44 = v13;
        sub_21F0C9308();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_21F07C000, v21, v22, "Received unexpected number of PRD results: %ld. Expected 1.", v23, 0xCu);
        MEMORY[0x223C43270](v23, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease();
      }
      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
      return;
    }
  }
  if (v13 != 1) {
    goto LABEL_9;
  }
  uint64_t v15 = a1[6];
  uint64_t v14 = a1[7];
  uint64_t v18 = a1 + 4;
  uint64_t v16 = a1[4];
  uint64_t v17 = v18[1];
  swift_bridgeObjectRetain();
  uint64_t v19 = sub_21F0BD1C8(v16, v17, v15, v14);
  if (v19)
  {
    if (*(void *)(v19 + 16))
    {
      sub_21F09F5EC(v19 + 32, (uint64_t)&v44);
    }
    else
    {
      long long v44 = 0u;
      long long v45 = 0u;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    long long v44 = 0u;
    long long v45 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((void *)&v45 + 1))
  {
    if (swift_dynamicCast())
    {
      unint64_t v24 = v41;
      if (v41)
      {
        double v25 = *(double *)&v41[OBJC_IVAR____TtC10CoreIDVPAD9PADSWPose_pitch];
        double v26 = *(double *)&v41[OBJC_IVAR____TtC10CoreIDVPAD9PADSWPose_roll];
        double v27 = *(double *)&v41[OBJC_IVAR____TtC10CoreIDVPAD9PADSWPose_yaw];
      }
      else
      {
        double v27 = -1.0;
        double v25 = -1.0;
        double v26 = -1.0;
      }
      float v32 = *(float *)&v40;
      id v33 = (void *)(v2 + 128);
      swift_beginAccess();
      CGRect v34 = *(void **)(v2 + 128);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(void *)(v2 + 128) = v34;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        CGRect v34 = sub_21F09D148(0, v34[2] + 1, 1, v34);
        void *v33 = v34;
      }
      double v36 = v32;
      unint64_t v38 = v34[2];
      unint64_t v37 = v34[3];
      if (v38 >= v37 >> 1)
      {
        CGRect v34 = sub_21F09D148((void *)(v37 > 1), v38 + 1, 1, v34);
        void *v33 = v34;
      }
      _OWORD v34[2] = v38 + 1;
      unint64_t v39 = (double *)&v34[4 * v38];
      v39[4] = v36;
      v39[5] = v25;
      void v39[6] = v26;
      v39[7] = v27;
      swift_endAccess();

      return;
    }
  }
  else
  {
    sub_21F09543C((uint64_t)&v44, (uint64_t *)&unk_267EBB200);
  }
  if (qword_267EBAB80 != -1) {
    swift_once();
  }
  uint64_t v28 = __swift_project_value_buffer(v4, (uint64_t)qword_267EBAB88);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v10, v28, v4);
  unint64_t v29 = sub_21F0C8FA8();
  os_log_type_t v30 = sub_21F0C9238();
  if (os_log_type_enabled(v29, v30))
  {
    uint64_t v31 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v31 = 0;
    _os_log_impl(&dword_21F07C000, v29, v30, "PADPrintReplayRequest did not generate an observation for the current frame.", v31, 2u);
    MEMORY[0x223C43270](v31, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
}

uint64_t sub_21F0BAE34()
{
  swift_bridgeObjectRelease();
  return sub_21F09543C(v0 + 168, &qword_267EBAEF8);
}

uint64_t sub_21F0BAE60()
{
  uint64_t v0 = sub_21F0B0D3C();
  swift_bridgeObjectRelease();
  sub_21F09543C(v0 + 168, &qword_267EBAEF8);
  return MEMORY[0x270FA0228](v0, 208, 7);
}

uint64_t type metadata accessor for PADPrintReplayController()
{
  return self;
}

unsigned char *storeEnumTagSinglePayload for PADPrintReplayAssessment.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    char *result = a2 + 3;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x21F0BAFA8);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          char *result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PADPrintReplayAssessment.CodingKeys()
{
  return &type metadata for PADPrintReplayAssessment.CodingKeys;
}

unint64_t sub_21F0BAFE4()
{
  unint64_t result = qword_267EBB380;
  if (!qword_267EBB380)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EBB380);
  }
  return result;
}

unint64_t sub_21F0BB03C()
{
  unint64_t result = qword_267EBB388;
  if (!qword_267EBB388)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EBB388);
  }
  return result;
}

unint64_t sub_21F0BB094()
{
  unint64_t result = qword_267EBB390;
  if (!qword_267EBB390)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EBB390);
  }
  return result;
}

uint64_t sub_21F0BB0E8(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000010 && a2 == 0x800000021F0CF810 || (sub_21F0C95D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6863746970 && a2 == 0xE500000000000000 || (sub_21F0C95D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1819045746 && a2 == 0xE400000000000000 || (sub_21F0C95D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 7823737 && a2 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v5 = sub_21F0C95D8();
    swift_bridgeObjectRelease();
    if (v5) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_21F0BB268(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EBAEF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_21F0BB2D0(uint64_t a1)
{
  return sub_21F0BB6B0(a1, &qword_267EBB0E8);
}

unint64_t sub_21F0BB2DC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    int v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EBB3C0);
  uint64_t v2 = sub_21F0C94B8();
  int v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_21F0A5440(v6, (uint64_t)&v15, &qword_267EBB3C8);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_21F0C43B4(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_21F0A52C0(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_21F0BB414(uint64_t a1)
{
  return sub_21F0BB580(a1, &qword_267EBB3D0, &qword_267EBB3D8, (uint64_t (*)(uint64_t))sub_21F0C4470);
}

unint64_t sub_21F0BB43C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EBB3A8);
  uint64_t v2 = (void *)sub_21F0C94B8();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_21F0C43B4(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    char v10 = (uint64_t *)(v2[6] + 16 * result);
    *char v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
    v4 += 3;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_21F0BB558(uint64_t a1)
{
  return sub_21F0BB580(a1, &qword_267EBB3B0, &qword_267EBB3B8, (uint64_t (*)(uint64_t))sub_21F0C4470);
}

unint64_t sub_21F0BB580(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t (*a4)(uint64_t))
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v8 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v7 = sub_21F0C94B8();
  uint64_t v8 = (void *)v7;
  uint64_t v9 = *(void *)(a1 + 16);
  if (!v9)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v8;
  }
  uint64_t v10 = v7 + 64;
  uint64_t v11 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_21F0A5440(v11, (uint64_t)&v18, a3);
    uint64_t v12 = v18;
    unint64_t result = a4(v18);
    if (v14) {
      break;
    }
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v8[6] + 8 * result) = v12;
    unint64_t result = (unint64_t)sub_21F0A52C0(&v19, (_OWORD *)(v8[7] + 32 * result));
    uint64_t v15 = v8[2];
    BOOL v16 = __OFADD__(v15, 1);
    uint64_t v17 = v15 + 1;
    if (v16) {
      goto LABEL_11;
    }
    v8[2] = v17;
    v11 += 40;
    if (!--v9)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_21F0BB6B0(uint64_t a1, uint64_t *a2)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v3 = (void *)sub_21F0C94B8();
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  uint64_t v5 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v6 = (uint64_t)*(v5 - 2);
    uint64_t v7 = (uint64_t)*(v5 - 1);
    uint64_t v8 = *v5;
    swift_bridgeObjectRetain();
    id v9 = v8;
    unint64_t result = sub_21F0C43B4(v6, v7);
    if (v11) {
      break;
    }
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v12 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v12 = v6;
    v12[1] = v7;
    *(void *)(v3[7] + 8 * result) = v9;
    uint64_t v13 = v3[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v3[2] = v15;
    v5 += 3;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_21F0BB7C8(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = sub_21F0BB6B0(MEMORY[0x263F8EE78], &qword_267EBB3A0);
  uint64_t v4 = sub_21F0C91F8();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_21F0BC5D4(v4, 0x65727574736567, 0xE700000000000000, isUniquelyReferenced_nonNull_native);
  unint64_t v6 = v3;
  swift_bridgeObjectRelease();
  uint64_t v7 = sub_21F0C91F8();
  char v8 = swift_isUniquelyReferenced_nonNull_native();
  sub_21F0BC5D4(v7, 0x746C75736572, 0xE600000000000000, v8);
  swift_bridgeObjectRelease();
  uint64_t v9 = sub_21F0C91F8();
  char v10 = swift_isUniquelyReferenced_nonNull_native();
  sub_21F0BC5D4(v9, 0x6F43726566667562, 0xEB00000000746E75, v10);
  swift_bridgeObjectRelease();
  if (!a2)
  {
    uint64_t v11 = sub_21F0C9188();
    char v12 = swift_isUniquelyReferenced_nonNull_native();
    sub_21F0BC5D4(v11, 0xD00000000000001FLL, 0x800000021F0CF880, v12);
    swift_bridgeObjectRelease();
  }
  return v6;
}

id sub_21F0BB954(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_21F0BD05C();
    uint64_t v4 = (void *)sub_21F0C9018();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

uint64_t sub_21F0BB9E0(uint64_t a1, char a2)
{
  return sub_21F0BC004(a1, a2, &qword_267EBB0E8);
}

uint64_t sub_21F0BB9EC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EBB3C0);
  uint64_t v6 = sub_21F0C94A8();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    CGRect v34 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v17 = v16 | (v13 << 6);
      }
      else
      {
        int64_t v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33) {
          goto LABEL_34;
        }
        unint64_t v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          int64_t v13 = v18 + 1;
          if (v18 + 1 >= v33) {
            goto LABEL_34;
          }
          unint64_t v19 = v34[v13];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v2;
              if (a2)
              {
                uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
                if (v32 >= 64) {
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v34 = -1 << v32;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v13 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_41;
                }
                if (v13 >= v33) {
                  goto LABEL_34;
                }
                unint64_t v19 = v34[v13];
                ++v20;
                if (v19) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v13 = v20;
          }
        }
LABEL_21:
        unint64_t v10 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      int v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      unint64_t v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_21F0A52C0(v24, v35);
      }
      else
      {
        sub_21F09F5EC((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_21F0C9628();
      sub_21F0C90B8();
      uint64_t result = sub_21F0C9648();
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v30 = v27 == v29;
          if (v27 == v29) {
            unint64_t v27 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        unint64_t v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      uint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      void *v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_21F0A52C0(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_21F0BBCEC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EBB3A8);
  char v36 = a2;
  uint64_t v6 = sub_21F0C94A8();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    unint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_21F0C9628();
    sub_21F0C90B8();
    uint64_t result = sub_21F0C9648();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    int64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    void *v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_21F0BC004(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  char v39 = a2;
  uint64_t v7 = sub_21F0C94A8();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16)) {
    goto LABEL_40;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v38 = v6 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & *(void *)(v6 + 64);
  char v36 = v3;
  int64_t v37 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v7 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v37) {
      break;
    }
    unint64_t v23 = (void *)(v6 + 64);
    unint64_t v24 = *(void *)(v38 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v37) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v38 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v37)
        {
LABEL_33:
          swift_release();
          uint64_t v4 = v36;
          if ((v39 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v38 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v37) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v38 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v11 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = (uint64_t *)(*(void *)(v6 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    uint64_t v33 = *(void **)(*(void *)(v6 + 56) + 8 * v21);
    if ((v39 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v34 = v33;
    }
    sub_21F0C9628();
    sub_21F0C90B8();
    uint64_t result = sub_21F0C9648();
    uint64_t v15 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    unint64_t v19 = (void *)(*(void *)(v8 + 48) + 16 * v18);
    *unint64_t v19 = v32;
    v19[1] = v31;
    *(void *)(*(void *)(v8 + 56) + 8 * v18) = v33;
    ++*(void *)(v8 + 16);
  }
  swift_release();
  uint64_t v4 = v36;
  unint64_t v23 = (void *)(v6 + 64);
  if ((v39 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v35 = 1 << *(unsigned char *)(v6 + 32);
  if (v35 >= 64) {
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v23 = -1 << v35;
  }
  *(void *)(v6 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v4 = v8;
  return result;
}

_OWORD *sub_21F0BC310(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_21F0C43B4(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_21F0BC7CC();
      goto LABEL_7;
    }
    sub_21F0BB9EC(v15, a4 & 1);
    unint64_t v21 = sub_21F0C43B4(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      unint64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = (_OWORD *)sub_21F0C9608();
    __break(1u);
    return result;
  }
LABEL_7:
  unint64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    unint64_t v19 = (_OWORD *)(v18[7] + 32 * v12);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
    return sub_21F0A52C0(a1, v19);
  }
LABEL_13:
  sub_21F0BC754(v12, a2, a3, a1, v18);
  return (_OWORD *)swift_bridgeObjectRetain();
}

uint64_t sub_21F0BC464(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_21F0C43B4(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_21F0BC9B4();
LABEL_7:
    unint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_bridgeObjectRelease();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_21F0BBCEC(v15, a4 & 1);
  unint64_t v21 = sub_21F0C43B4(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = sub_21F0C9608();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  unint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  unint64_t v23 = (uint64_t *)(v18[6] + 16 * v12);
  *unint64_t v23 = a2;
  v23[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v24 = v18[2];
  BOOL v25 = __OFADD__(v24, 1);
  uint64_t v26 = v24 + 1;
  if (v25)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  void v18[2] = v26;
  return swift_bridgeObjectRetain();
}

void sub_21F0BC5D4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_21F0C43B4(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_21F0BCB6C(&qword_267EBB3A0);
LABEL_7:
    unint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];

      *(void *)(v19 + 8 * v12) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_21F0BC004(v15, a4 & 1, &qword_267EBB3A0);
  unint64_t v20 = sub_21F0C43B4(a2, a3);
  if ((v16 & 1) != (v21 & 1))
  {
LABEL_17:
    sub_21F0C9608();
    __break(1u);
    return;
  }
  unint64_t v12 = v20;
  unint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  char v22 = (uint64_t *)(v18[6] + 16 * v12);
  uint64_t *v22 = a2;
  v22[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v23 = v18[2];
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (v24)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  void v18[2] = v25;
  swift_bridgeObjectRetain();
}

_OWORD *sub_21F0BC754(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  void *v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_21F0A52C0(a4, (_OWORD *)(a5[7] + 32 * a1));
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

id sub_21F0BC7C0()
{
  return sub_21F0BCB6C(&qword_267EBB0E8);
}

void *sub_21F0BC7CC()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EBB3C0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_21F0C9498();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v25 = v1;
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    sub_21F09F5EC(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    char v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = v19;
    v21[1] = v18;
    sub_21F0A52C0(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v25;
    goto LABEL_28;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_21F0BC9B4()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EBB3A8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_21F0C9498();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    char v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_21F0BCB6C(uint64_t *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_21F0C9498();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    uint64_t *v2 = v5;
    return result;
  }
  id result = (id)(v4 + 64);
  uint64_t v7 = v3 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8) {
    id result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v23);
    ++v10;
    if (!v24)
    {
      int64_t v10 = v23 + 1;
      if (v23 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v7 + 8 * v10);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 16 * v16;
    uint64_t v18 = (void *)(*(void *)(v3 + 48) + 16 * v16);
    uint64_t v19 = v18[1];
    uint64_t v20 = 8 * v16;
    char v21 = *(void **)(*(void *)(v3 + 56) + v20);
    int64_t v22 = (void *)(*(void *)(v5 + 48) + v17);
    void *v22 = *v18;
    v22[1] = v19;
    *(void *)(*(void *)(v5 + 56) + v2sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = v21;
    swift_bridgeObjectRetain();
    id result = v21;
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v14) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v7 + 8 * v25);
  if (v24)
  {
    int64_t v10 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v10);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void sub_21F0BCD18(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v8 = sub_21F0C8FC8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_267EBAB80 != -1) {
    swift_once();
  }
  uint64_t v12 = __swift_project_value_buffer(v8, (uint64_t)qword_267EBAB88);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v12, v8);
  unint64_t v13 = sub_21F0C8FA8();
  os_log_type_t v14 = sub_21F0C9228();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = swift_slowAlloc();
    *(_DWORD *)uint64_t v15 = 134218752;
    uint64_t v20 = a1;
    aBlock[0] = a1;
    sub_21F0C9308();
    *(_WORD *)(v15 + 12) = 2048;
    aBlock[0] = a2;
    sub_21F0C9308();
    *(_WORD *)(v15 + 22) = 2048;
    aBlock[0] = a3;
    a1 = v20;
    sub_21F0C9308();
    *(_WORD *)(v15 + 32) = 1024;
    LODWORD(aBlock[0]) = a4 & 1;
    sub_21F0C9308();
    _os_log_impl(&dword_21F07C000, v13, v14, "PADAnalytics.sendGestureCompleteEvent gesture = %ld, id result = %ld, bufferCount = %ld, wasSkippedWithAccessibility = %{BOOL}d", (uint8_t *)v15, 0x26u);
    MEMORY[0x223C43270](v15, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  unint64_t v16 = (void *)sub_21F0C9048();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = a1;
  *(void *)(v17 + 24) = a2;
  *(void *)(v17 + 32) = a3;
  *(unsigned char *)(v17 + 4sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = a4 & 1;
  aBlock[4] = sub_21F0BD034;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21F0BB954;
  aBlock[3] = &block_descriptor_4;
  uint64_t v18 = _Block_copy(aBlock);
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v18);
}

uint64_t sub_21F0BD024()
{
  return MEMORY[0x270FA0238](v0, 41, 7);
}

unint64_t sub_21F0BD034()
{
  return sub_21F0BB7C8(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 4sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

unint64_t sub_21F0BD05C()
{
  unint64_t result = qword_267EBB398;
  if (!qword_267EBB398)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267EBB398);
  }
  return result;
}

uint64_t sub_21F0BD09C(void *a1, uint64_t a2, void (*a3)(void *, uint64_t))
{
  v8[3] = sub_21F0A5404(0, (unint64_t *)&unk_267EBB410);
  v8[4] = &off_26D0A6648;
  v8[0] = a1;
  id v6 = a1;
  a3(v8, a2);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

uint64_t sub_21F0BD11C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21F0BD138(a1, a2, a3, a4, &qword_267EBB238, 0x263F1EE50, &qword_267EBB460);
}

uint64_t sub_21F0BD138(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t *a5, uint64_t a6, uint64_t *a7)
{
  sub_21F0A5404(0, a5);
  __swift_instantiateConcreteTypeFromMangledName(a7);
  uint64_t v9 = sub_21F0C90A8();
  if (*(void *)(a4 + 16) && (unint64_t v11 = sub_21F0C43B4(v9, v10), (v12 & 1) != 0))
  {
    uint64_t v13 = *(void *)(*(void *)(a4 + 56) + 8 * v11);
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v13 = 0;
  }
  swift_bridgeObjectRelease();
  return v13;
}

uint64_t sub_21F0BD1C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21F0BD1E8(a1, a2, a3, a4, (void (*)(void))type metadata accessor for PADPrintReplayRequest, &qword_267EBB468);
}

uint64_t sub_21F0BD1E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), uint64_t *a6)
{
  a5(0);
  __swift_instantiateConcreteTypeFromMangledName(a6);
  uint64_t v8 = sub_21F0C90A8();
  if (*(void *)(a4 + 16) && (unint64_t v10 = sub_21F0C43B4(v8, v9), (v11 & 1) != 0))
  {
    uint64_t v12 = *(void *)(*(void *)(a4 + 56) + 8 * v10);
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v12 = 0;
  }
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_21F0BD274(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21F0BD138(a1, a2, a3, a4, &qword_267EBB230, 0x263F1EE10, &qword_267EBB4A8);
}

uint64_t sub_21F0BD290(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21F0BD138(a1, a2, a3, a4, (unint64_t *)&unk_267EBB430, 0x263F1EE80, (uint64_t *)&unk_267EBB498);
}

uint64_t PADFaceActionMode.description.getter()
{
  unint64_t v1 = 0xD000000000000016;
  if (*v0 != 1) {
    unint64_t v1 = 0x646573756170;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x6547746365746564;
  }
}

CoreIDVPAD::PADFaceActionMode_optional __swiftcall PADFaceActionMode.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 3;
  if ((unint64_t)rawValue < 3) {
    char v2 = rawValue;
  }
  *unint64_t v1 = v2;
  return (CoreIDVPAD::PADFaceActionMode_optional)rawValue;
}

uint64_t PADFaceActionMode.rawValue.getter()
{
  return *v0;
}

unint64_t sub_21F0BD334()
{
  unint64_t result = qword_267EBB3E0;
  if (!qword_267EBB3E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EBB3E0);
  }
  return result;
}

CoreIDVPAD::PADFaceActionMode_optional sub_21F0BD388(Swift::Int *a1)
{
  return PADFaceActionMode.init(rawValue:)(*a1);
}

unsigned char *storeEnumTagSinglePayload for PADFaceActionMode(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    void *result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x21F0BD460);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          void *result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PADFaceActionMode()
{
  return &type metadata for PADFaceActionMode;
}

uint64_t sub_21F0BD498()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 264);
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = 0;
    uint64_t v4 = MEMORY[0x263F8EE78];
    do
    {
      if (*(void *)(v1 + 8 * v3 + 32) == 1)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_21F0C3928(0, *(void *)(v4 + 16) + 1, 1);
        }
        unint64_t v6 = *(void *)(v4 + 16);
        unint64_t v5 = *(void *)(v4 + 24);
        if (v6 >= v5 >> 1) {
          sub_21F0C3928(v5 > 1, v6 + 1, 1);
        }
        *(void *)(v4 + 16) = v6 + 1;
        *(void *)(v4 + 8 * v6 + 32) = 1;
      }
      ++v3;
    }
    while (v2 != v3);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = MEMORY[0x263F8EE78];
  }
  uint64_t v7 = *(void *)(v4 + 16);
  swift_release();
  return v7;
}

uint64_t sub_21F0BD5BC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  v3[18] = a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v3[19] = a2;
  int64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = MEMORY[0x263F8EE78];
  if (v6)
  {
    uint64_t v20 = MEMORY[0x263F8EE78];
    sub_21F0C3980(0, v6, 0);
    uint64_t v8 = v20;
    unint64_t v9 = *(void *)(v20 + 16);
    int64_t v10 = v6;
    do
    {
      unint64_t v11 = *(void *)(v20 + 24);
      if (v9 >= v11 >> 1) {
        sub_21F0C3980(v11 > 1, v9 + 1, 1);
      }
      *(void *)(v20 + 16) = v9 + 1;
      *(void *)(v20 + 8 * v9++ + 32) = v7;
      --v10;
    }
    while (v10);
  }
  else
  {
    uint64_t v8 = MEMORY[0x263F8EE78];
  }
  swift_beginAccess();
  v3[34] = v8;
  swift_bridgeObjectRelease();
  uint64_t v12 = v3[34];
  swift_beginAccess();
  v3[35] = v12;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v13 = v3[34];
  swift_beginAccess();
  v3[36] = v13;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v14 = MEMORY[0x263F8EE78];
  if (v6)
  {
    uint64_t v19 = MEMORY[0x263F8EE78];
    sub_21F0C3950(0, v6, 0);
    uint64_t v15 = v19;
    unint64_t v16 = *(void *)(v19 + 16);
    do
    {
      unint64_t v17 = *(void *)(v19 + 24);
      if (v16 >= v17 >> 1) {
        sub_21F0C3950(v17 > 1, v16 + 1, 1);
      }
      *(void *)(v19 + 16) = v16 + 1;
      *(void *)(v19 + 8 * v16++ + 32) = v14;
      --v6;
    }
    while (v6);
  }
  else
  {
    uint64_t v15 = MEMORY[0x263F8EE78];
  }
  swift_beginAccess();
  v3[37] = v15;
  swift_bridgeObjectRelease();
  return sub_21F0C0EB4();
}

uint64_t sub_21F0BD7CC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_21F0C8FC8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  unint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_267EBAB80 != -1) {
    swift_once();
  }
  uint64_t v6 = __swift_project_value_buffer(v2, (uint64_t)qword_267EBAB88);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  uint64_t v7 = sub_21F0C8FA8();
  os_log_type_t v8 = sub_21F0C9228();
  if (os_log_type_enabled(v7, v8))
  {
    unint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v9 = 0;
    _os_log_impl(&dword_21F07C000, v7, v8, "FAC Module: AX has been enabled", v9, 2u);
    MEMORY[0x223C43270](v9, -1, -1);
  }

  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *(unsigned char *)(v1 + 257) = 1;
  return result;
}

void sub_21F0BD96C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_21F0C8FC8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  unint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  unint64_t v6 = *(void *)(v0 + 160);
  uint64_t v7 = *(void *)(v0 + 144);
  id v8 = *(id *)(v0 + 168);
  swift_bridgeObjectRetain();
  sub_21F0C9298();
  sub_21F0C92A8();
  if ((v6 & 0x8000000000000000) != 0 || v6 >= *(void *)(v7 + 16))
  {

    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v9 = *(void *)(v7 + 8 * v6 + 32);

    swift_bridgeObjectRelease();
    if (v9 != 10)
    {
      int v10 = *(unsigned __int8 *)(v1 + 257);
      *(unsigned char *)(v1 + 258) = v10;
      if (v10 != 1)
      {
LABEL_18:
        sub_21F0C1254(0, MEMORY[0x263F8EE78]);
        return;
      }
      unint64_t v11 = *(void *)(v1 + 160);
      uint64_t v12 = *(void *)(v1 + 144);
      id v13 = *(id *)(v1 + 168);
      swift_bridgeObjectRetain();
      sub_21F0C9298();
      sub_21F0C92A8();
      if ((v11 & 0x8000000000000000) != 0 || v11 >= *(void *)(v12 + 16))
      {

        swift_bridgeObjectRelease();
      }
      else
      {
        unint64_t v14 = *(void *)(v12 + 8 * v11 + 32);

        swift_bridgeObjectRelease();
        if (v14 < 0xA)
        {
          uint64_t v15 = qword_21F0CD0E0[v14];
LABEL_17:
          swift_beginAccess();
          sub_21F0C4828(&v21, v15);
          swift_endAccess();
          goto LABEL_18;
        }
      }
      uint64_t v15 = 3;
      goto LABEL_17;
    }
  }
  if (qword_267EBAB80 != -1) {
    swift_once();
  }
  uint64_t v16 = __swift_project_value_buffer(v2, (uint64_t)qword_267EBAB88);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v16, v2);
  unint64_t v17 = sub_21F0C8FA8();
  os_log_type_t v18 = sub_21F0C9228();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v19 = 0;
    _os_log_impl(&dword_21F07C000, v17, v18, "Requested to skip gesture, but no gesture is being monitored currently.", v19, 2u);
    MEMORY[0x223C43270](v19, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_21F0BDC3C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_21F0C8FC8();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  unint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  id v8 = (char *)&v22 - v7;
  swift_beginAccess();
  unint64_t v9 = *(void *)(v0 + 160);
  uint64_t v10 = *(void *)(v0 + 144);
  id v11 = *(id *)(v0 + 168);
  swift_bridgeObjectRetain();
  sub_21F0C9298();
  sub_21F0C92A8();
  if ((v9 & 0x8000000000000000) != 0 || v9 >= *(void *)(v10 + 16))
  {

    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v12 = *(void *)(v10 + 8 * v9 + 32);

    swift_bridgeObjectRelease();
    if (v12 != 10)
    {
      *(unsigned char *)(v1 + 256) = 2;
      if (qword_267EBAB80 != -1) {
        swift_once();
      }
      uint64_t v13 = __swift_project_value_buffer(v2, (uint64_t)qword_267EBAB88);
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v8, v13, v2);
      unint64_t v14 = sub_21F0C8FA8();
      os_log_type_t v15 = sub_21F0C9228();
      if (os_log_type_enabled(v14, v15))
      {
        uint64_t v16 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v16 = 0;
        _os_log_impl(&dword_21F07C000, v14, v15, "Invaliding current FAC buffer", v16, 2u);
        MEMORY[0x223C43270](v16, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
      sub_21F0C0DF8();
      swift_bridgeObjectRelease();
      sub_21F0C5580(MEMORY[0x263F8EE78]);
      return sub_21F0B0950();
    }
  }
  if (qword_267EBAB80 != -1) {
    swift_once();
  }
  uint64_t v18 = __swift_project_value_buffer(v2, (uint64_t)qword_267EBAB88);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v18, v2);
  uint64_t v19 = sub_21F0C8FA8();
  os_log_type_t v20 = sub_21F0C9228();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v21 = 0;
    _os_log_impl(&dword_21F07C000, v19, v20, "Requested to pause gesture detection, but no gesture is being monitored currently.", v21, 2u);
    MEMORY[0x223C43270](v21, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

uint64_t sub_21F0BDF78()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_21F0C8FC8();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  unint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  id v8 = (char *)&v22 - v7;
  swift_beginAccess();
  unint64_t v9 = *(void *)(v0 + 160);
  uint64_t v10 = *(void *)(v0 + 144);
  id v11 = *(id *)(v0 + 168);
  swift_bridgeObjectRetain();
  sub_21F0C9298();
  sub_21F0C92A8();
  if ((v9 & 0x8000000000000000) != 0 || v9 >= *(void *)(v10 + 16))
  {

    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v12 = *(void *)(v10 + 8 * v9 + 32);

    swift_bridgeObjectRelease();
    if (v12 != 10)
    {
      *(unsigned char *)(v1 + 256) = 1;
      if (qword_267EBAB80 != -1) {
        swift_once();
      }
      uint64_t v13 = __swift_project_value_buffer(v2, (uint64_t)qword_267EBAB88);
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v8, v13, v2);
      unint64_t v14 = sub_21F0C8FA8();
      os_log_type_t v15 = sub_21F0C9228();
      if (os_log_type_enabled(v14, v15))
      {
        uint64_t v16 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v16 = 0;
        _os_log_impl(&dword_21F07C000, v14, v15, "Invaliding current FAC buffer", v16, 2u);
        MEMORY[0x223C43270](v16, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
      sub_21F0C0DF8();
      swift_bridgeObjectRelease();
      sub_21F0C5580(MEMORY[0x263F8EE78]);
      return sub_21F0B0950();
    }
  }
  if (qword_267EBAB80 != -1) {
    swift_once();
  }
  uint64_t v18 = __swift_project_value_buffer(v2, (uint64_t)qword_267EBAB88);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v18, v2);
  uint64_t v19 = sub_21F0C8FA8();
  os_log_type_t v20 = sub_21F0C9228();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v21 = 0;
    _os_log_impl(&dword_21F07C000, v19, v20, "Requested to prepare to resume gesture detection, but no gesture is being monitored currently.", v21, 2u);
    MEMORY[0x223C43270](v21, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

uint64_t sub_21F0BE2B4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_21F0C8FC8();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  unint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  id v8 = (char *)&v22 - v7;
  swift_beginAccess();
  unint64_t v9 = *(void *)(v0 + 160);
  uint64_t v10 = *(void *)(v0 + 144);
  id v11 = *(id *)(v0 + 168);
  swift_bridgeObjectRetain();
  sub_21F0C9298();
  sub_21F0C92A8();
  if ((v9 & 0x8000000000000000) != 0 || v9 >= *(void *)(v10 + 16))
  {

    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v12 = *(void *)(v10 + 8 * v9 + 32);

    swift_bridgeObjectRelease();
    if (v12 != 10)
    {
      *(unsigned char *)(v1 + 256) = 0;
      if (qword_267EBAB80 != -1) {
        swift_once();
      }
      uint64_t v13 = __swift_project_value_buffer(v2, (uint64_t)qword_267EBAB88);
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v8, v13, v2);
      unint64_t v14 = sub_21F0C8FA8();
      os_log_type_t v15 = sub_21F0C9228();
      if (os_log_type_enabled(v14, v15))
      {
        uint64_t v16 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v16 = 0;
        _os_log_impl(&dword_21F07C000, v14, v15, "Invaliding current FAC buffer", v16, 2u);
        MEMORY[0x223C43270](v16, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
      sub_21F0C0DF8();
      swift_bridgeObjectRelease();
      sub_21F0C5580(MEMORY[0x263F8EE78]);
      return sub_21F0B0950();
    }
  }
  if (qword_267EBAB80 != -1) {
    swift_once();
  }
  uint64_t v18 = __swift_project_value_buffer(v2, (uint64_t)qword_267EBAB88);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v18, v2);
  uint64_t v19 = sub_21F0C8FA8();
  os_log_type_t v20 = sub_21F0C9228();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v21 = 0;
    _os_log_impl(&dword_21F07C000, v19, v20, "Requested to resume gesture detection, but no gesture is being monitored currently.", v21, 2u);
    MEMORY[0x223C43270](v21, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

uint64_t sub_21F0BE5EC()
{
  uint64_t v1 = sub_21F0C8FC8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v21 - v6;
  swift_beginAccess();
  unint64_t v8 = *(void *)(v0 + 160);
  uint64_t v9 = *(void *)(v0 + 144);
  id v10 = *(id *)(v0 + 168);
  swift_bridgeObjectRetain();
  sub_21F0C9298();
  sub_21F0C92A8();
  if ((v8 & 0x8000000000000000) != 0 || v8 >= *(void *)(v9 + 16))
  {

    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v11 = *(void *)(v9 + 8 * v8 + 32);

    swift_bridgeObjectRelease();
    if (v11 != 10)
    {
      if (qword_267EBAB80 != -1) {
        swift_once();
      }
      uint64_t v12 = __swift_project_value_buffer(v1, (uint64_t)qword_267EBAB88);
      (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v7, v12, v1);
      uint64_t v13 = sub_21F0C8FA8();
      os_log_type_t v14 = sub_21F0C9228();
      if (os_log_type_enabled(v13, v14))
      {
        os_log_type_t v15 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_type_t v15 = 0;
        _os_log_impl(&dword_21F07C000, v13, v14, "Invaliding current FAC buffer", v15, 2u);
        MEMORY[0x223C43270](v15, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
      sub_21F0C0DF8();
      swift_bridgeObjectRelease();
      sub_21F0C5580(MEMORY[0x263F8EE78]);
      return sub_21F0B0950();
    }
  }
  if (qword_267EBAB80 != -1) {
    swift_once();
  }
  uint64_t v17 = __swift_project_value_buffer(v1, (uint64_t)qword_267EBAB88);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v5, v17, v1);
  uint64_t v18 = sub_21F0C8FA8();
  os_log_type_t v19 = sub_21F0C9228();
  if (os_log_type_enabled(v18, v19))
  {
    os_log_type_t v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v20 = 0;
    _os_log_impl(&dword_21F07C000, v18, v19, "Requested to resume gesture detection, but no gesture is being monitored currently.", v20, 2u);
    MEMORY[0x223C43270](v20, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v5, v1);
}

uint64_t sub_21F0BE920(char *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_21F0C8FC8();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  unint64_t v8 = (char *)v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  id v10 = (char *)v27 - v9;
  uint64_t v11 = &a1[OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_faces];
  swift_beginAccess();
  if (!(*(void *)v11 >> 62))
  {
    if (*(void *)((*(void *)v11 & 0xFFFFFFFFFFFFFF8) + 0x10) == 1) {
      goto LABEL_3;
    }
LABEL_6:
    if (qword_267EBAB80 != -1) {
      swift_once();
    }
    uint64_t v16 = __swift_project_value_buffer(v4, (uint64_t)qword_267EBAB88);
    uint64_t v29 = v5;
    BOOL v28 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v28(v10, v16, v4);
    uint64_t v17 = a1;
    uint64_t v18 = sub_21F0C8FA8();
    os_log_type_t v19 = sub_21F0C9238();
    if (os_log_type_enabled(v18, v19))
    {
      v27[0] = v16;
      v27[1] = v2;
      os_log_type_t v20 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v20 = 134217984;
      unint64_t v21 = *(void *)v11;
      if (v21 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v22 = sub_21F0C9488();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v22 = *(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      uint64_t v30 = v22;
      sub_21F0C9308();

      _os_log_impl(&dword_21F07C000, v18, v19, "Found %ld in frame. Invalidating current FAC buffer.", v20, 0xCu);
      MEMORY[0x223C43270](v20, -1, -1);
      uint64_t v16 = v27[0];
    }
    else
    {

      uint64_t v18 = v17;
    }

    int64_t v23 = *(void (**)(char *, uint64_t))(v29 + 8);
    v23(v10, v4);
    v28(v8, v16, v4);
    unint64_t v24 = sub_21F0C8FA8();
    os_log_type_t v25 = sub_21F0C9228();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v26 = 0;
      _os_log_impl(&dword_21F07C000, v24, v25, "Invaliding current FAC buffer", v26, 2u);
      MEMORY[0x223C43270](v26, -1, -1);
    }

    v23(v8, v4);
    sub_21F0C0DF8();
    swift_bridgeObjectRelease();
    sub_21F0C5580(MEMORY[0x263F8EE78]);
    sub_21F0B0950();
    return 0;
  }
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_21F0C9488();
  swift_bridgeObjectRelease();
  if (v15 != 1) {
    goto LABEL_6;
  }
LABEL_3:
  if (*(unsigned char *)(v2 + 256) != 2)
  {
    uint64_t v12 = *(void *)&a1[OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_time + 16];
    uint64_t v13 = *(void *)&a1[OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_time + 8];
    *(void *)(v2 + 224) = *(void *)&a1[OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_time];
    *(void *)(v2 + 232) = v13;
    *(void *)(v2 + 24sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = v12;
    return 1;
  }
  return 0;
}

uint64_t sub_21F0BECE4()
{
  uint64_t v1 = *(void *)(v0 + 120);
  swift_beginAccess();
  unint64_t v2 = *(void *)(v0 + 160);
  uint64_t v3 = *(void *)(v0 + 144);
  id v4 = *(id *)(v0 + 168);
  swift_bridgeObjectRetain();
  sub_21F0C9298();
  sub_21F0C92A8();
  if ((v2 & 0x8000000000000000) != 0 || v2 >= *(void *)(v3 + 16))
  {

    swift_bridgeObjectRelease();
LABEL_10:
    uint64_t v7 = v1 + 96;
    return *(void *)v7;
  }
  uint64_t v5 = *(void *)(v3 + 8 * v2 + 32);

  swift_bridgeObjectRelease();
  if (v5 != 4 && v5 != 9) {
    goto LABEL_10;
  }
  uint64_t v7 = v1 + 104;
  return *(void *)v7;
}

uint64_t sub_21F0BED94(uint64_t a1, uint64_t a2, unint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267EBB400);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_21F0CBD60;
  swift_weakLoadStrong();
  uint64_t v8 = type metadata accessor for PADFacePoseRequest();
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 24) = 0u;
  *(_OWORD *)(v9 + 4sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = 0u;
  *(unsigned char *)(v9 + 56) = 1;
  swift_weakInit();
  swift_weakAssign();
  swift_release();
  *(void *)(v7 + 56) = v8;
  *(void *)(v7 + 64) = &off_26D0A6660;
  *(void *)(v7 + 32) = v9;
  unint64_t v10 = *(void *)(sub_21F0BF520() + 16);
  swift_bridgeObjectRelease();
  if (v10 > 1)
  {
    swift_beginAccess();
    unint64_t v21 = *(void *)(v3 + 160);
    int64_t v15 = *(void *)(v3 + 144);
    id v22 = *(id *)(v3 + 168);
    swift_bridgeObjectRetain();
    sub_21F0C9298();
    sub_21F0C92A8();
    if ((v21 & 0x8000000000000000) != 0 || v21 >= *(void *)(v15 + 16))
    {

      swift_bridgeObjectRelease();
      goto LABEL_15;
    }
    unint64_t v23 = *(void *)(v15 + 8 * v21 + 32);

    swift_bridgeObjectRelease();
    if (v23 > 9 || ((1 << v23) & 0x310) == 0) {
      goto LABEL_15;
    }
    unint64_t v24 = (void *)swift_allocObject();
    v24[2] = a2;
    v24[3] = a3;
    swift_retain();
    id v17 = sub_21F08C194(sub_21F0B6824, v24);
    swift_release();
    unint64_t v19 = *(void *)(v7 + 16);
    unint64_t v25 = *(void *)(v7 + 24);
    a3 = v19 + 1;
    if (v19 >= v25 >> 1) {
      uint64_t v7 = (uint64_t)sub_21F09D258((void *)(v25 > 1), v19 + 1, 1, (void *)v7);
    }
    uint64_t v20 = sub_21F0A5404(0, (unint64_t *)&unk_267EBB430);
    float v54 = &off_26D0A6648;
    goto LABEL_6;
  }
  uint64_t v11 = (void *)swift_allocObject();
  void v11[2] = a2;
  void v11[3] = a3;
  swift_retain();
  id v12 = sub_21F0B2254(sub_21F0B6834, v11);
  swift_release();
  unint64_t v14 = *(void *)(v7 + 16);
  unint64_t v13 = *(void *)(v7 + 24);
  int64_t v15 = v14 + 1;
  if (v14 >= v13 >> 1) {
    goto LABEL_47;
  }
  while (1)
  {
    uint64_t v53 = sub_21F0A5404(0, &qword_267EBB238);
    float v54 = &off_26D0A6648;
    *(void *)&long long v52 = v12;
    *(void *)(v7 + 16) = v15;
    sub_21F0B0FEC(&v52, v7 + 40 * v14 + 32);
    uint64_t v16 = (void *)swift_allocObject();
    _OWORD v16[2] = a2;
    void v16[3] = a3;
    swift_retain();
    id v17 = sub_21F08C194(sub_21F0B6834, v16);
    swift_release();
    unint64_t v19 = *(void *)(v7 + 16);
    unint64_t v18 = *(void *)(v7 + 24);
    a3 = v19 + 1;
    if (v19 >= v18 >> 1) {
      uint64_t v7 = (uint64_t)sub_21F09D258((void *)(v18 > 1), v19 + 1, 1, (void *)v7);
    }
    uint64_t v20 = sub_21F0A5404(0, (unint64_t *)&unk_267EBB430);
    float v54 = &off_26D0A6648;
LABEL_6:
    uint64_t v53 = v20;
    *(void *)&long long v52 = v17;
    *(void *)(v7 + 16) = a3;
    sub_21F0B0FEC(&v52, v7 + 40 * v19 + 32);
LABEL_15:
    uint64_t v26 = (void *)(a1 + OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_faces);
    swift_beginAccess();
    id v12 = (id)*v26;
    if (*v26 >> 62)
    {
      swift_bridgeObjectRetain();
      unint64_t v14 = sub_21F0C9488();
      if (!v14)
      {
LABEL_43:
        swift_bridgeObjectRelease();
        return v7;
      }
    }
    else
    {
      unint64_t v14 = *(void *)(((unint64_t)v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (!v14) {
        goto LABEL_43;
      }
    }
    if (((unint64_t)v12 & 0xC000000000000001) != 0) {
      break;
    }
    unint64_t v13 = *(void *)(((unint64_t)v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v13)
    {
      unint64_t v27 = (char *)*((id *)v12 + 4);
      goto LABEL_20;
    }
    __break(1u);
LABEL_47:
    uint64_t v7 = (uint64_t)sub_21F09D258((void *)(v13 > 1), v15, 1, (void *)v7);
  }
  unint64_t v27 = (char *)MEMORY[0x223C42390](0, v12);
LABEL_20:
  BOOL v28 = v27;
  swift_bridgeObjectRelease();
  double v29 = *(double *)&v28[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds];
  double v30 = *(double *)&v28[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds + 8];
  double v31 = *(double *)&v28[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds + 16];
  double v32 = *(double *)&v28[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds + 24];

  id v33 = sub_21F09F844(v29, v30, v31, v32);
  id v34 = v33;
  uint64_t v35 = *(void *)(v7 + 16);
  if (v35)
  {
    uint64_t v36 = v7 + 32;
    uint64_t v48 = *MEMORY[0x263F08100];
    uint64_t v47 = v7;
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_21F093D74(v36, (uint64_t)&v52);
      sub_21F093D74((uint64_t)&v52, (uint64_t)&v50);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267EBB240);
      sub_21F0A5404(0, (unint64_t *)&unk_267EBB410);
      if (swift_dynamicCast()) {
        break;
      }
LABEL_34:
      sub_21F093D74((uint64_t)&v52, (uint64_t)&v50);
      __swift_instantiateConcreteTypeFromMangledName(&qword_267EBB2B0);
      if (swift_dynamicCast())
      {
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267EBB420);
        uint64_t v43 = swift_allocObject();
        *(_OWORD *)(v43 + 16) = xmmword_21F0CC940;
        *(void *)(v43 + 32) = v34;
        *(void *)&long long v50 = v43;
        sub_21F0C9148();
        sub_21F0A5404(0, (unint64_t *)&unk_267EBB210);
        id v44 = v34;
        long long v45 = (void *)sub_21F0C9118();
        swift_bridgeObjectRelease();
        objc_msgSend(v49, sel_setInputFaceObservations_, v45);
        swift_unknownObjectRelease();
      }
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v52);
      v36 += 40;
      if (!--v35)
      {

        uint64_t v7 = v47;
        goto LABEL_43;
      }
    }
    if (!os_variant_has_internal_content()) {
      goto LABEL_32;
    }
    id v37 = objc_msgSend(self, sel_standardUserDefaults);
    id v38 = objc_msgSend(v37, sel_persistentDomainForName_, v48);

    if (v38 && (uint64_t v39 = sub_21F0C9038(), v38, v39))
    {
      if (*(void *)(v39 + 16) && (unint64_t v40 = sub_21F0C43B4(0xD000000000000018, 0x800000021F0CEB00), (v41 & 1) != 0))
      {
        sub_21F09F5EC(*(void *)(v39 + 56) + 32 * v40, (uint64_t)&v50);
      }
      else
      {
        long long v50 = 0u;
        long long v51 = 0u;
      }
      swift_bridgeObjectRelease();
      if (*((void *)&v51 + 1))
      {
        if (swift_dynamicCast())
        {
          uint64_t v42 = v49;
          goto LABEL_33;
        }
LABEL_32:
        uint64_t v42 = 0;
LABEL_33:
        objc_msgSend(v49, sel_setUsesCPUOnly_, v42, v47);

        goto LABEL_34;
      }
    }
    else
    {
      long long v50 = 0u;
      long long v51 = 0u;
    }
    sub_21F09543C((uint64_t)&v50, (uint64_t *)&unk_267EBB200);
    goto LABEL_32;
  }

  return v7;
}

uint64_t sub_21F0BF520()
{
  swift_beginAccess();
  unint64_t v1 = v0[20];
  unint64_t v2 = (void *)v0[21];
  swift_beginAccess();
  uint64_t v3 = v0[37];
  id v4 = v2;
  swift_bridgeObjectRetain();
  sub_21F0C9298();
  sub_21F0C92A8();
  if ((v1 & 0x8000000000000000) != 0 || v1 >= *(void *)(v3 + 16))
  {

    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v5 = *(void *)(v3 + 8 * v1 + 32);
    swift_bridgeObjectRetain();

    swift_bridgeObjectRelease();
  }
  return v5;
}

uint64_t sub_21F0BF5DC(void *a1)
{
  uint64_t v1 = a1[3];
  uint64_t v2 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v1);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v2);
  if (result)
  {
    if (*(void *)(result + 16) != 1)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
  }
  return result;
}

uint64_t sub_21F0BF644(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = *(void (**)(uint64_t))(v4 + 104);
  *(unsigned char *)(v4 + 96) = 0;
  if (v9)
  {
    uint64_t v10 = swift_retain();
    v9(v10);
    sub_21F0A46F0((uint64_t)v9);
    uint64_t v11 = *(void *)(v4 + 104);
  }
  else
  {
    uint64_t v11 = 0;
  }
  *(void *)(v4 + 104) = 0;
  *(void *)(v4 + 112) = 0;
  sub_21F0A46F0(v11);
  uint64_t v12 = sub_21F0BD1E8(a1, a2, a3, a4, (void (*)(void))type metadata accessor for PADFacePoseRequest, &qword_267EBB358);
  if (!v12)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    return sub_21F09543C((uint64_t)&v20, (uint64_t *)&unk_267EBB200);
  }
  if (!*(void *)(v12 + 16))
  {
    long long v20 = 0u;
    long long v21 = 0u;
    swift_bridgeObjectRelease();
    return sub_21F09543C((uint64_t)&v20, (uint64_t *)&unk_267EBB200);
  }
  sub_21F09F5EC(v12 + 32, (uint64_t)&v20);
  swift_bridgeObjectRelease();
  if (!*((void *)&v21 + 1)) {
    return sub_21F09543C((uint64_t)&v20, (uint64_t *)&unk_267EBB200);
  }
  uint64_t result = swift_dynamicCast();
  if (result)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267EBB3F0);
    uint64_t v14 = swift_allocObject();
    uint64_t v15 = MEMORY[0x263F8D5C8];
    *(_OWORD *)(v14 + 16) = xmmword_21F0CCED0;
    uint64_t v16 = MEMORY[0x263F8D648];
    *(void *)(v14 + 56) = v15;
    *(void *)(v14 + 64) = v16;
    *(_DWORD *)(v14 + 32) = v17;
    *(void *)(v14 + 96) = v15;
    *(void *)(v14 + 104) = v16;
    *(_DWORD *)(v14 + 72) = v19;
    *(void *)(v14 + 136) = v15;
    *(void *)(v14 + 144) = v16;
    *(_DWORD *)(v14 + 112) = v18;
    sub_21F0C9088();
    *(void *)&long long v20 = 0x65736F5065636146;
    *((void *)&v20 + 1) = 0xEA0000000000203ALL;
    sub_21F0C90C8();
    swift_bridgeObjectRelease();
    sub_21F08B394(v20, *((unint64_t *)&v20 + 1));
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_21F0BF858(uint64_t a1)
{
  uint64_t v3 = sub_21F0C8FC8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(unsigned char *)(v1 + 256))
  {
    if (*(unsigned char *)(v1 + 256) == 1)
    {
      sub_21F0BFF7C(a1);
    }
    else
    {
      if (qword_267EBAB80 != -1) {
        swift_once();
      }
      uint64_t v7 = __swift_project_value_buffer(v3, (uint64_t)qword_267EBAB88);
      (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v7, v3);
      uint64_t v8 = sub_21F0C8FA8();
      os_log_type_t v9 = sub_21F0C9228();
      if (os_log_type_enabled(v8, v9))
      {
        uint64_t v10 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl(&dword_21F07C000, v8, v9, "Ignoring FAC composite set: classifier is paused", v10, 2u);
        MEMORY[0x223C43270](v10, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    }
  }
  else
  {
    sub_21F0BFA54(a1);
  }
}

void sub_21F0BFA54(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_21F0C8FC8();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v29 - v7;
  swift_beginAccess();
  unint64_t v9 = *(void *)(v1 + 160);
  uint64_t v10 = *(void *)(v1 + 144);
  id v11 = *(id *)(v1 + 168);
  swift_bridgeObjectRetain();
  sub_21F0C9298();
  sub_21F0C92A8();
  if ((v9 & 0x8000000000000000) != 0 || v9 >= *(void *)(v10 + 16))
  {

    swift_bridgeObjectRelease();
    return;
  }
  uint64_t v30 = v5;
  unint64_t v12 = *(void *)(v10 + 8 * v9 + 32);

  swift_bridgeObjectRelease();
  uint64_t v13 = sub_21F0B834C(a1, v12);
  if (*(void *)(a1 + 16) >= v14[2])
  {
    char v22 = v15;
    uint64_t v23 = v13;
    sub_21F0C0404(v13, v14, 0, v16, a1);
    if (v12 <= 9 && ((1 << v12) & 0x330) != 0)
    {
      int v24 = *(unsigned __int8 *)(v2 + 256);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      BOOL v25 = v24 == 2;
      uint64_t v26 = 2;
    }
    else
    {
      if ((v23 & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v22) {
          uint64_t v27 = 4;
        }
        else {
          uint64_t v27 = 2;
        }
        goto LABEL_17;
      }
      int v28 = *(unsigned __int8 *)(v2 + 256);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      BOOL v25 = v28 == 2;
      uint64_t v26 = 3;
    }
    if (v25) {
      uint64_t v27 = v26;
    }
    else {
      uint64_t v27 = v23;
    }
LABEL_17:
    sub_21F0C1254(v27, a1);
    return;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_267EBAB80 != -1) {
    swift_once();
  }
  uint64_t v17 = __swift_project_value_buffer(v4, (uint64_t)qword_267EBAB88);
  uint64_t v18 = v30;
  (*(void (**)(char *, uint64_t, uint64_t))(v30 + 16))(v8, v17, v4);
  int v19 = sub_21F0C8FA8();
  os_log_type_t v20 = sub_21F0C9238();
  if (os_log_type_enabled(v19, v20))
  {
    long long v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)long long v21 = 0;
    _os_log_impl(&dword_21F07C000, v19, v20, "Received more faceprints than FAC timestamps. Each frame should contain no more than one faceprint.", v21, 2u);
    MEMORY[0x223C43270](v21, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v18 + 8))(v8, v4);
}

uint64_t sub_21F0BFF7C(uint64_t a1)
{
  uint64_t v3 = sub_21F0C8FC8();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v20 - v6;
  swift_beginAccess();
  unint64_t v8 = *(void *)(v1 + 160);
  uint64_t v9 = *(void *)(v1 + 144);
  id v10 = *(id *)(v1 + 168);
  swift_bridgeObjectRetain();
  sub_21F0C9298();
  sub_21F0C92A8();
  if ((v8 & 0x8000000000000000) != 0 || v8 >= *(void *)(v9 + 16))
  {

    swift_bridgeObjectRelease();
    unint64_t v11 = 10;
  }
  else
  {
    unint64_t v11 = *(void *)(v9 + 8 * v8 + 32);

    swift_bridgeObjectRelease();
  }
  uint64_t v12 = sub_21F0B89C0(a1, v11);
  if (*(void *)(a1 + 16) >= v13[2])
  {
    sub_21F0C0404(v12, v13, 0, v14, a1);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_267EBAB80 != -1) {
      swift_once();
    }
    uint64_t v15 = __swift_project_value_buffer(v3, (uint64_t)qword_267EBAB88);
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v15, v3);
    uint64_t v16 = sub_21F0C8FA8();
    os_log_type_t v17 = sub_21F0C9238();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_21F07C000, v16, v17, "Received more faceprints than FAC timestamps. Each frame should contain no more than one faceprint.", v18, 2u);
      MEMORY[0x223C43270](v18, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  }
}

uint64_t sub_21F0C0404(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v84 = a4;
  unint64_t v8 = sub_21F0C8FC8();
  unint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  CGFloat v81 = (char *)v76 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)v76 - v13;
  char v15 = *(unsigned char *)(v5 + 260);
  uint64_t v86 = v5;
  uint64_t v87 = a5;
  uint64_t v83 = v12;
  unint64_t v79 = (void (**)(void, uint64_t))v9;
  if ((v15 & 1) == 0)
  {
    CGFloat v80 = (char *)(v5 + 260);
    if ((*(unsigned char *)(v5 + 261) & 1) == 0 && !a2[2])
    {
      if (qword_267EBAB80 == -1) {
        goto LABEL_43;
      }
      goto LABEL_74;
    }
  }
  if (a2[2])
  {
    *(unsigned char *)(v5 + 261) = 1;
    swift_bridgeObjectRetain();
  }
  else
  {
    a2 = (void *)MEMORY[0x263F8EE78];
  }
LABEL_7:
  uint64_t v16 = a2[2];
  if (v16)
  {
    uint64_t v17 = v87 + 32;
    uint64_t v18 = a2 + 5;
    int v19 = (uint64_t *)MEMORY[0x263F010E0];
    do
    {
      unint64_t v26 = *v18;
      if ((*v18 & 0x8000000000000000) != 0)
      {
        long long v21 = v19;
      }
      else
      {
        BOOL v20 = v26 >= *(void *)(v87 + 16);
        long long v21 = (uint64_t *)(v17 + 32 * v26);
        if (v20) {
          long long v21 = v19;
        }
      }
      v18 += 2;
      uint64_t v22 = v21[1];
      uint64_t v23 = v21[2];
      uint64_t v24 = *v21;
      uint64_t v25 = swift_bridgeObjectRetain();
      sub_21F0C2B04(v25, v24, v22, v23);
      swift_bridgeObjectRelease();
      --v16;
    }
    while (v16);
  }
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v29 = v83;
  uint64_t v28 = v84;
  uint64_t v30 = *(char **)(v84 + 16);
  if (v30)
  {
    swift_bridgeObjectRetain();
    swift_beginAccess();
    uint64_t v82 = v5 + 280;
    swift_beginAccess();
    uint64_t v14 = 0;
    a5 = v87;
    id v85 = (char *)(v87 + 32);
    uint64_t v78 = (void (**)(char *, uint64_t, uint64_t))(v79 + 2);
    ++v79;
    *(void *)&long long v31 = 136315138;
    long long v77 = v31;
    v76[1] = MEMORY[0x263F8EE58] + 8;
    CGFloat v80 = v30;
    while (1)
    {
      unint64_t v32 = *(void *)(v28 + 8 * (void)v14 + 32);
      if ((v32 & 0x8000000000000000) == 0 && v32 < *(void *)(a5 + 16))
      {
        id v33 = &v85[32 * v32];
        uint64_t v34 = *(void *)v33;
        int v36 = *((_DWORD *)v33 + 2);
        int v35 = *((_DWORD *)v33 + 3);
        uint64_t v37 = *((void *)v33 + 2);
        if (sub_21F0C9008())
        {
          unint64_t v38 = *(void *)(v86 + 160);
          uint64_t v39 = *(void *)(v86 + 280);
          id v40 = *(id *)(v86 + 168);
          swift_bridgeObjectRetain();
          sub_21F0C9298();
          sub_21F0C92A8();
          if ((v38 & 0x8000000000000000) != 0 || v38 >= *(void *)(v39 + 16))
          {

            swift_bridgeObjectRelease();
            char v41 = (void *)MEMORY[0x263F8EE78];
          }
          else
          {
            char v41 = *(void **)(v39 + 8 * v38 + 32);
            swift_bridgeObjectRetain();

            swift_bridgeObjectRelease();
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            char v41 = sub_21F09CB68(0, v41[2] + 1, 1, v41);
          }
          unint64_t v9 = v41[2];
          unint64_t v51 = v41[3];
          if (v9 >= v51 >> 1) {
            char v41 = sub_21F09CB68((void *)(v51 > 1), v9 + 1, 1, v41);
          }
          _OWORD v41[2] = v9 + 1;
          long long v52 = &v41[3 * v9];
          v52[4] = v34;
          *((_DWORD *)v52 + 1sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = v36;
          *((_DWORD *)v52 + 11) = v35;
          v52[6] = v37;
          unint64_t v8 = *(void *)(v86 + 160);
          uint64_t v53 = *(void **)(v86 + 168);
          swift_beginAccess();
          id v54 = v53;
          sub_21F0C9298();
          sub_21F0C92A8();
          a5 = v87;
          if ((v8 & 0x8000000000000000) == 0)
          {
            long long v55 = *(void **)v82;
            if (v8 < *(void *)(*(void *)v82 + 16))
            {
              swift_bridgeObjectRetain_n();
              char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
              *(void *)uint64_t v82 = v55;
              if ((isUniquelyReferenced_nonNull_native & 1) == 0)
              {
                long long v55 = sub_21F0C69D0(v55);
                *(void *)uint64_t v82 = v55;
              }
              if (v8 >= v55[2])
              {
                while (1)
                {
                  __break(1u);
LABEL_74:
                  swift_once();
LABEL_43:
                  uint64_t v57 = __swift_project_value_buffer(v8, (uint64_t)qword_267EBAB88);
                  (*(void (**)(char *, uint64_t, unint64_t))(v9 + 16))(v14, v57, v8);
                  uint64_t v58 = sub_21F0C8FA8();
                  os_log_type_t v59 = sub_21F0C9228();
                  if (os_log_type_enabled(v58, v59))
                  {
                    float v60 = (uint8_t *)swift_slowAlloc();
                    *(_WORD *)float v60 = 0;
                    _os_log_impl(&dword_21F07C000, v58, v59, "ID matching frames not selected for gesture. Selecting 2 random frames to use as default.", v60, 2u);
                    MEMORY[0x223C43270](v60, -1, -1);
                  }

                  uint64_t result = (*(uint64_t (**)(char *, unint64_t))(v9 + 8))(v14, v8);
                  unint64_t v9 = *(void *)(a5 + 16);
                  if (!v9) {
                    break;
                  }
                  uint64_t v61 = a5 + 32;
                  id v85 = (char *)sub_21F0A5404(0, &qword_267EBB238);
                  uint64_t v62 = 0;
                  a2 = (void *)MEMORY[0x263F8EE78];
                  uint64_t v63 = -1;
                  unint64_t v64 = -(uint64_t)v9 % v9;
                  uint64_t v82 = MEMORY[0x263F8EE58] + 8;
                  a5 += 32;
                  while (1)
                  {
                    uint64_t v14 = (char *)v62;
                    uint64_t v65 = v63;
                    do
                    {
                      *(void *)&long long v88 = 0;
                      MEMORY[0x223C43280](&v88, 8);
                      uint64_t v63 = ((unint64_t)v88 * (unsigned __int128)v9) >> 64;
                      if (v9 > (unint64_t)v88 * v9 && v64 > (unint64_t)v88 * v9)
                      {
                        do
                        {
                          *(void *)&long long v88 = 0;
                          MEMORY[0x223C43280](&v88, 8);
                        }
                        while (v64 > (unint64_t)v88 * v9);
                        uint64_t v63 = ((unint64_t)v88 * (unsigned __int128)v9) >> 64;
                      }
                    }
                    while (v65 == v63);
                    if (v63 >= (uint64_t)v9) {
                      break;
                    }
                    unint64_t v8 = *(void *)(v61 + 32 * v63 + 24);
                    uint64_t v95 = v85;
                    swift_bridgeObjectRetain();
                    __swift_instantiateConcreteTypeFromMangledName(&qword_267EBB460);
                    uint64_t v66 = sub_21F0C90A8();
                    if (*(void *)(v8 + 16) && (unint64_t v68 = sub_21F0C43B4(v66, v67), (v69 & 1) != 0))
                    {
                      unint64_t v70 = *(void *)(*(void *)(v8 + 56) + 8 * v68);
                      swift_bridgeObjectRetain();
                      swift_bridgeObjectRelease();
                      if (*(void *)(v70 + 16))
                      {
                        sub_21F09F5EC(v70 + 32, (uint64_t)&v88);
                      }
                      else
                      {
                        long long v88 = 0u;
                        long long v89 = 0u;
                      }
                      swift_bridgeObjectRelease();
                      unint64_t v8 = v70;
                      uint64_t v5 = v86;
                      uint64_t v61 = a5;
                    }
                    else
                    {
                      swift_bridgeObjectRelease();
                      long long v88 = 0u;
                      long long v89 = 0u;
                      uint64_t v5 = v86;
                    }
                    swift_bridgeObjectRelease();
                    if (*((void *)&v89 + 1))
                    {
                      sub_21F0A5404(0, (unint64_t *)&unk_267EBB210);
                      if (swift_dynamicCast())
                      {
                        uint64_t v71 = v95;
                        unint64_t v72 = sub_21F0B27EC(v95);
                        if (v72)
                        {
                          unint64_t v73 = v72;
                          char *v80 = 1;
                          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                            a2 = sub_21F09D48C(0, a2[2] + 1, 1, a2);
                          }
                          unint64_t v8 = a2[2];
                          unint64_t v74 = a2[3];
                          if (v8 >= v74 >> 1) {
                            a2 = sub_21F09D48C((void *)(v74 > 1), v8 + 1, 1, a2);
                          }
                          a2[2] = v8 + 1;
                          long long v75 = &a2[2 * v8];
                          v75[4] = v73;
                          v75[5] = v63;

                          uint64_t v5 = v86;
                          uint64_t v61 = a5;
                        }
                        else
                        {

                          uint64_t v5 = v86;
                        }
                      }
                    }
                    else
                    {
                      sub_21F09543C((uint64_t)&v88, (uint64_t *)&unk_267EBB200);
                    }
                    uint64_t v62 = 1;
                    if (v14) {
                      goto LABEL_7;
                    }
                  }
                  __break(1u);
                }
                __break(1u);
                return result;
              }
              swift_bridgeObjectRetain();
              swift_bridgeObjectRelease();
              v55[v8 + 4] = v41;
              swift_bridgeObjectRelease_n();
            }
          }
          swift_endAccess();
          swift_bridgeObjectRelease();

          uint64_t v29 = v83;
          uint64_t v28 = v84;
        }
        else
        {
          if (qword_267EBAB80 != -1) {
            swift_once();
          }
          uint64_t v42 = __swift_project_value_buffer(v29, (uint64_t)qword_267EBAB88);
          uint64_t v43 = v81;
          (*v78)(v81, v42, v29);
          id v44 = sub_21F0C8FA8();
          os_log_type_t v45 = sub_21F0C9228();
          if (os_log_type_enabled(v44, v45))
          {
            uint64_t v46 = swift_slowAlloc();
            uint64_t v47 = swift_slowAlloc();
            uint64_t v93 = v37;
            uint64_t v94 = v47;
            *(_DWORD *)uint64_t v46 = v77;
            uint64_t v90 = v34;
            int v91 = v36;
            int v92 = v35;
            type metadata accessor for CMTime(0);
            uint64_t v48 = sub_21F0C90A8();
            *(void *)(v46 + 4) = sub_21F09D6AC(v48, v49, &v94);
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_21F07C000, v44, v45, "Invalid reference frame timestamp received: %s", (uint8_t *)v46, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x223C43270](v47, -1, -1);
            uint64_t v50 = v46;
            uint64_t v29 = v83;
            uint64_t v28 = v84;
            MEMORY[0x223C43270](v50, -1, -1);
          }

          (*v79)(v43, v29);
          a5 = v87;
          uint64_t v30 = v80;
        }
      }
      if (v30 == ++v14) {
        return swift_bridgeObjectRelease();
      }
    }
  }
  return result;
}

uint64_t sub_21F0C0D3C()
{
  swift_beginAccess();
  unint64_t v1 = v0[20];
  uint64_t v2 = (void *)v0[21];
  swift_beginAccess();
  uint64_t v3 = v0[35];
  id v4 = v2;
  swift_bridgeObjectRetain();
  sub_21F0C9298();
  sub_21F0C92A8();
  if ((v1 & 0x8000000000000000) != 0 || v1 >= *(void *)(v3 + 16))
  {

    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v5 = *(void *)(v3 + 8 * v1 + 32);
    swift_bridgeObjectRetain();

    swift_bridgeObjectRelease();
  }
  return v5;
}

uint64_t sub_21F0C0DF8()
{
  swift_beginAccess();
  unint64_t v1 = v0[20];
  uint64_t v2 = (void *)v0[21];
  swift_beginAccess();
  uint64_t v3 = v0[34];
  id v4 = v2;
  swift_bridgeObjectRetain();
  sub_21F0C9298();
  sub_21F0C92A8();
  if ((v1 & 0x8000000000000000) != 0 || v1 >= *(void *)(v3 + 16))
  {

    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v5 = *(void *)(v3 + 8 * v1 + 32);
    swift_bridgeObjectRetain();

    swift_bridgeObjectRelease();
  }
  return v5;
}

uint64_t sub_21F0C0EB4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_21F0C8FC8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(unsigned char *)(v0 + 258) = 0;
  swift_beginAccess();
  unint64_t v6 = *(void *)(v0 + 160);
  uint64_t v7 = *(void *)(v0 + 144);
  id v8 = *(id *)(v0 + 168);
  swift_bridgeObjectRetain();
  sub_21F0C9298();
  sub_21F0C92A8();
  if ((v6 & 0x8000000000000000) != 0 || v6 >= *(void *)(v7 + 16))
  {

    swift_bridgeObjectRelease();
    return sub_21F0C2F60();
  }
  unint64_t v9 = *(void *)(v7 + 8 * v6 + 32);

  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v10 = *(void *)(v1 + 176);
  uint64_t v11 = *(void *)(v1 + 152);
  id v12 = *(id *)(v1 + 184);
  sub_21F0C9298();
  sub_21F0C92A8();

  if (v10 >= v11) {
    return sub_21F0C2F60();
  }
  unint64_t v25 = v9;
  if (qword_267EBAB80 != -1) {
    swift_once();
  }
  uint64_t v13 = __swift_project_value_buffer(v2, (uint64_t)qword_267EBAB88);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v13, v2);
  uint64_t v14 = sub_21F0C8FA8();
  os_log_type_t v15 = sub_21F0C9228();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    v29[0] = v17;
    *(_DWORD *)uint64_t v16 = 136315138;
    uint64_t v24 = v16 + 4;
    uint64_t v18 = PADSWGesture.description.getter(v25);
    v26[0] = sub_21F09D6AC(v18, v19, v29);
    sub_21F0C9308();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21F07C000, v14, v15, "Will start monitoring gesture %s", v16, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223C43270](v17, -1, -1);
    MEMORY[0x223C43270](v16, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t result = MEMORY[0x223C43330](v1 + 128);
  if (result)
  {
    uint64_t v21 = result + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_delegate;
    swift_beginAccess();
    sub_21F08FCE0(v21, (uint64_t)v29);
    if (v29[3])
    {
      sub_21F093D74((uint64_t)v29, (uint64_t)v26);
      sub_21F09543C((uint64_t)v29, (uint64_t *)&unk_267EBB450);
      uint64_t v22 = v27;
      uint64_t v23 = v28;
      __swift_project_boxed_opaque_existential_1(v26, v27);
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v23 + 8))(v25, v22, v23);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
    }
    else
    {
      sub_21F09543C((uint64_t)v29, (uint64_t *)&unk_267EBB450);
    }
    return swift_unknownObjectRelease();
  }
  return result;
}

void sub_21F0C1254(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v178 = a2;
  uint64_t v5 = sub_21F0C8FC8();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  unint64_t v9 = (char *)&v175 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  id v12 = (char *)&v175 - v11;
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  os_log_type_t v15 = (char *)&v175 - v14;
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  CGRect v181 = (char *)&v175 - v17;
  MEMORY[0x270FA5388](v16);
  unint64_t v19 = (char *)&v175 - v18;
  BOOL v20 = (void *)(v2 + 192);
  swift_beginAccess();
  uint64_t v21 = *(void **)(v2 + 200);
  sub_21F0C9298();
  uint64_t v22 = *(void *)(v3 + 192);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23)
  {
LABEL_108:
    __break(1u);
  }
  else
  {
    *BOOL v20 = v24;
    id v25 = v21;
    sub_21F0C92A8();
    swift_endAccess();

    if ((unint64_t)(a1 - 2) >= 3)
    {
      *(void *)&long long v177 = v15;
      CMTimeValue v176 = (CMTimeValue)v20;
      uint64_t v175 = v12;
      CGRect v182 = v9;
      if (qword_267EBAB80 == -1) {
        goto LABEL_8;
      }
      goto LABEL_110;
    }
    swift_beginAccess();
    unint64_t v26 = *(void **)(v3 + 200);
    sub_21F0C9298();
    uint64_t v27 = *(void *)(v3 + 192);
    BOOL v23 = __OFADD__(v27, 1);
    uint64_t v28 = v27 + 1;
    if (!v23)
    {
      *(void *)(v3 + 192) = v28;
      id v29 = v26;
      sub_21F0C92A8();
      swift_endAccess();

      if (a1 != 4)
      {
        swift_beginAccess();
        uint64_t v30 = *(void **)(v3 + 216);
        sub_21F0C9298();
        *(void *)(v3 + 208) = 0;
        goto LABEL_14;
      }
      swift_beginAccess();
      uint64_t v30 = *(void **)(v3 + 216);
      sub_21F0C9298();
      uint64_t v31 = *(void *)(v3 + 208);
      BOOL v23 = __OFADD__(v31, 1);
      uint64_t v32 = v31 + 1;
      if (!v23)
      {
        *(void *)(v3 + 208) = v32;
LABEL_14:
        id v44 = v30;
        sub_21F0C92A8();
        swift_endAccess();

        swift_beginAccess();
        uint64_t v45 = *(void *)(v3 + 208);
        id v46 = *(id *)(v3 + 216);
        sub_21F0C9298();
        sub_21F0C92A8();

        if (v45 >= 10)
        {
          swift_beginAccess();
          uint64_t v47 = *(void **)(v3 + 216);
          sub_21F0C9298();
          *(void *)(v3 + 208) = 0;
          id v48 = v47;
          sub_21F0C92A8();
          swift_endAccess();

          uint64_t v49 = MEMORY[0x223C43330](v3 + 128);
          if (v49)
          {
            uint64_t v50 = v49;
            swift_beginAccess();
            unint64_t v51 = *(void *)(v3 + 160);
            uint64_t v52 = *(void *)(v3 + 144);
            id v53 = *(id *)(v3 + 168);
            swift_bridgeObjectRetain();
            sub_21F0C9298();
            sub_21F0C92A8();
            if ((v51 & 0x8000000000000000) != 0 || v51 >= *(void *)(v52 + 16))
            {
              swift_bridgeObjectRelease();
              uint64_t v54 = 10;
            }
            else
            {
              uint64_t v54 = *(void *)(v52 + 8 * v51 + 32);
              swift_bridgeObjectRelease();
            }

            uint64_t v172 = v50 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_delegate;
            swift_beginAccess();
            sub_21F08FCE0(v172, (uint64_t)&v193);
            if (v194)
            {
              sub_21F093D74((uint64_t)&v193, (uint64_t)&v189);
              sub_21F09543C((uint64_t)&v193, (uint64_t *)&unk_267EBB450);
              uint64_t v173 = v191;
              uint64_t v174 = v192;
              __swift_project_boxed_opaque_existential_1(&v189, v191);
              (*(void (**)(uint64_t, uint64_t, uint64_t))(v174 + 16))(v54, v173, v174);
              __swift_destroy_boxed_opaque_existential_1((uint64_t)&v189);
            }
            else
            {
              sub_21F09543C((uint64_t)&v193, (uint64_t *)&unk_267EBB450);
            }
            swift_unknownObjectRelease();
          }
        }
        return;
      }
      goto LABEL_113;
    }
  }
  __break(1u);
LABEL_110:
  swift_once();
LABEL_8:
  uint64_t v33 = __swift_project_value_buffer(v5, (uint64_t)qword_267EBAB88);
  uint64_t v34 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  uint64_t v188 = v33;
  uint64_t v187 = v6 + 16;
  id v186 = v34;
  ((void (*)(char *))v34)(v19);
  swift_retain_n();
  int v35 = sub_21F0C8FA8();
  os_log_type_t v36 = sub_21F0C9228();
  BOOL v37 = os_log_type_enabled(v35, v36);
  uint64_t v184 = v5;
  uint64_t v179 = v6;
  *(void *)&long long v180 = a1;
  if (v37)
  {
    uint64_t v38 = swift_slowAlloc();
    CMTimeValue v39 = swift_slowAlloc();
    v193.CMTimeValue value = v39;
    *(_DWORD *)uint64_t v38 = 136315394;
    swift_beginAccess();
    unint64_t v40 = *(void *)(v3 + 160);
    uint64_t v41 = *(void *)(v3 + 144);
    id v42 = *(id *)(v3 + 168);
    swift_bridgeObjectRetain();
    sub_21F0C9298();
    sub_21F0C92A8();
    if ((v40 & 0x8000000000000000) != 0 || v40 >= *(void *)(v41 + 16))
    {

      swift_bridgeObjectRelease();
      unint64_t v43 = 10;
    }
    else
    {
      unint64_t v43 = *(void *)(v41 + 8 * v40 + 32);

      swift_bridgeObjectRelease();
    }
    uint64_t v55 = PADSWGesture.description.getter(v43);
    uint64_t v189 = sub_21F09D6AC(v55, v56, &v193.value);
    sub_21F0C9308();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v38 + 12) = 2080;
    uint64_t v5 = v184;
    uint64_t v32 = v180;
    if ((void)v180)
    {
      if ((void)v180 != 1)
      {
LABEL_114:
        uint64_t v189 = v32;
        sub_21F0C95E8();
        __break(1u);
        return;
      }
      unint64_t v57 = 0xE800000000000000;
      uint64_t v58 = 0x6465746365746564;
    }
    else
    {
      unint64_t v57 = 0xE700000000000000;
      uint64_t v58 = 0x64657070696B73;
    }
    uint64_t v189 = sub_21F09D6AC(v58, v57, &v193.value);
    sub_21F0C9308();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21F07C000, v35, v36, "Did finish monitoring gesture %s with assessment %s", (uint8_t *)v38, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x223C43270](v39, -1, -1);
    MEMORY[0x223C43270](v38, -1, -1);

    uint64_t v6 = v179;
    uint64_t v185 = *(void (**)(char *, uint64_t))(v179 + 8);
    v185(v19, v5);
    a1 = v180;
  }
  else
  {

    swift_release_n();
    uint64_t v185 = *(void (**)(char *, uint64_t))(v6 + 8);
    v185(v19, v5);
  }
  id v183 = (void *)(v3 + 264);
  swift_beginAccess();
  os_log_type_t v59 = *(void **)(v3 + 264);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v3 + 264) = v59;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    os_log_type_t v59 = sub_21F09CB5C(0, v59[2] + 1, 1, v59);
    void *v183 = v59;
  }
  unint64_t v62 = v59[2];
  unint64_t v61 = v59[3];
  if (v62 >= v61 >> 1)
  {
    os_log_type_t v59 = sub_21F09CB5C((void *)(v61 > 1), v62 + 1, 1, v59);
    void *v183 = v59;
  }
  v59[2] = v62 + 1;
  v59[v62 + 4] = a1;
  swift_endAccess();
  if (a1 == 1)
  {
    swift_beginAccess();
    uint64_t v63 = *(void **)(v3 + 184);
    sub_21F0C9298();
    uint64_t v64 = *(void *)(v3 + 176);
    BOOL v23 = __OFADD__(v64, 1);
    uint64_t v32 = v64 + 1;
    if (v23)
    {
LABEL_112:
      __break(1u);
LABEL_113:
      __break(1u);
      goto LABEL_114;
    }
    *(void *)(v3 + 176) = v32;
    id v65 = v63;
    sub_21F0C92A8();
    swift_endAccess();
  }
  uint64_t v66 = v178;
  int64_t v67 = *(void *)(v178 + 16);
  CMTimeValue value = MEMORY[0x263F8EE78];
  if (v67)
  {
    v193.CMTimeValue value = MEMORY[0x263F8EE78];
    sub_21F0C39B0(0, v67, 0);
    CMTimeValue value = v193.value;
    unint64_t v69 = *(void *)(v193.value + 16);
    uint64_t v70 = 24 * v69 + 32;
    uint64_t v71 = (uint64_t *)(v66 + 48);
    do
    {
      uint64_t v72 = *(v71 - 2);
      uint64_t v73 = *(v71 - 1);
      uint64_t v74 = *v71;
      v193.CMTimeValue value = value;
      unint64_t v75 = *(void *)(value + 24);
      unint64_t v76 = v69 + 1;
      if (v69 >= v75 >> 1)
      {
        sub_21F0C39B0(v75 > 1, v69 + 1, 1);
        CMTimeValue value = v193.value;
      }
      v71 += 4;
      *(void *)(value + 16) = v76;
      long long v77 = (void *)(value + v70);
      *long long v77 = v72;
      v77[1] = v73;
      v77[2] = v74;
      v70 += 24;
      unint64_t v69 = v76;
      --v67;
    }
    while (v67);
    uint64_t v5 = v184;
    uint64_t v6 = v179;
    a1 = v180;
  }
  if (a1 == 1)
  {
    sub_21F0C5580(value);
    swift_bridgeObjectRelease();
    uint64_t v78 = sub_21F0C0D3C();
  }
  else
  {
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267EBAF70);
    uint64_t v79 = swift_allocObject();
    *(_OWORD *)(v79 + 16) = xmmword_21F0CBD60;
    uint64_t v80 = *(void *)(v3 + 240);
    *(void *)(v79 + 32) = *(void *)(v3 + 224);
    *(void *)(v79 + 4sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = *(void *)(v3 + 232);
    *(void *)(v79 + 48) = v80;
    sub_21F0C5580(v79);
    swift_bridgeObjectRelease();
    uint64_t v78 = MEMORY[0x263F8EE78];
  }
  sub_21F0C5680(v78);
  swift_bridgeObjectRelease();
  CGFloat v81 = v181;
  v186(v181, v188, v5);
  swift_retain_n();
  uint64_t v82 = sub_21F0C8FA8();
  os_log_type_t v83 = sub_21F0C9228();
  if (os_log_type_enabled(v82, v83))
  {
    uint64_t v84 = (uint8_t *)swift_slowAlloc();
    CMTimeValue v85 = swift_slowAlloc();
    v193.CMTimeValue value = v85;
    *(_DWORD *)uint64_t v84 = 136315138;
    uint64_t v86 = sub_21F0C0DF8();
    type metadata accessor for CMTime(0);
    uint64_t v88 = MEMORY[0x223C420F0](v86, v87);
    unint64_t v90 = v89;
    swift_bridgeObjectRelease();
    uint64_t v189 = sub_21F09D6AC(v88, v90, &v193.value);
    a1 = v180;
    sub_21F0C9308();
    swift_release_n();
    uint64_t v5 = v184;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21F07C000, v82, v83, "Current Gesture Timestamps FAC: %s", v84, 0xCu);
    swift_arrayDestroy();
    CMTimeValue v91 = v85;
    uint64_t v6 = v179;
    MEMORY[0x223C43270](v91, -1, -1);
    MEMORY[0x223C43270](v84, -1, -1);

    int v92 = v181;
  }
  else
  {

    swift_release_n();
    int v92 = v81;
  }
  v185(v92, v5);
  uint64_t v93 = (char *)v177;
  unint64_t v94 = *(void *)(sub_21F0C2918() + 16);
  swift_bridgeObjectRelease();
  if (v94 <= 1)
  {
    v186(v93, v188, v5);
    swift_retain_n();
    uint64_t v95 = sub_21F0C8FA8();
    os_log_type_t v96 = sub_21F0C9238();
    if (os_log_type_enabled(v95, v96))
    {
      id v97 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)id v97 = 134217984;
      CMTimeValue v98 = *(void *)(sub_21F0BF520() + 16);
      swift_release();
      swift_bridgeObjectRelease();
      v193.CMTimeValue value = v98;
      a1 = v180;
      uint64_t v5 = v184;
      sub_21F0C9308();
      swift_release();
      _os_log_impl(&dword_21F07C000, v95, v96, "Obtained less faceprints than expected (%ld)", v97, 0xCu);
      MEMORY[0x223C43270](v97, -1, -1);
    }
    else
    {

      swift_release_n();
    }
    v185(v93, v5);
  }
  uint64_t v99 = v3 + 160;
  swift_beginAccess();
  unint64_t v100 = *(void *)(v3 + 160);
  uint64_t v101 = *(void *)(v3 + 144);
  id v102 = *(id *)(v3 + 168);
  swift_bridgeObjectRetain();
  sub_21F0C9298();
  sub_21F0C92A8();
  if ((v100 & 0x8000000000000000) != 0 || v100 >= *(void *)(v101 + 16))
  {

    swift_bridgeObjectRelease();
    uint64_t v103 = 10;
  }
  else
  {
    uint64_t v103 = *(void *)(v101 + 8 * v100 + 32);

    swift_bridgeObjectRelease();
  }
  uint64_t v104 = *(void *)(v3 + 192);
  id v105 = *(id *)(v3 + 200);
  sub_21F0C9298();
  sub_21F0C92A8();

  uint64_t v178 = v3 + 257;
  sub_21F0BCD18(v103, a1, v104, *(unsigned char *)(v3 + 258));
  sub_21F0C0DF8();
  sub_21F0BF520();
  sub_21F0C2918();
  uint64_t v106 = MEMORY[0x223C43330](v3 + 128);
  if (v106)
  {
    uint64_t v107 = v106;
    unint64_t v108 = *(void *)(v3 + 160);
    uint64_t v109 = *(void *)(v3 + 144);
    id v110 = *(id *)(v3 + 168);
    swift_bridgeObjectRetain();
    sub_21F0C9298();
    sub_21F0C92A8();
    if ((v108 & 0x8000000000000000) != 0 || v108 >= *(void *)(v109 + 16))
    {
      swift_bridgeObjectRelease();
      uint64_t v111 = 10;
    }
    else
    {
      uint64_t v111 = *(void *)(v109 + 8 * v108 + 32);
      swift_bridgeObjectRelease();
    }

    uint64_t v112 = v107 + OBJC_IVAR____TtC10CoreIDVPAD15PADSWClassifier_delegate;
    swift_beginAccess();
    sub_21F08FCE0(v112, (uint64_t)&v193);
    if (v194)
    {
      sub_21F093D74((uint64_t)&v193, (uint64_t)&v189);
      sub_21F09543C((uint64_t)&v193, (uint64_t *)&unk_267EBB450);
      uint64_t v113 = v191;
      uint64_t v114 = v192;
      __swift_project_boxed_opaque_existential_1(&v189, v191);
      id v115 = *(void (**)(uint64_t, uint64_t, uint64_t))(v114 + 24);
      uint64_t v116 = v114;
      uint64_t v6 = v179;
      v115(v111, v113, v116);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v189);
    }
    else
    {
      sub_21F09543C((uint64_t)&v193, (uint64_t *)&unk_267EBB450);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_beginAccess();
  uint64_t v117 = *(void **)(v3 + 168);
  sub_21F0C9298();
  uint64_t v118 = *(void *)(v3 + 160);
  BOOL v23 = __OFADD__(v118, 1);
  uint64_t v32 = v118 + 1;
  uint64_t v5 = v184;
  id v119 = v182;
  if (v23)
  {
    __break(1u);
    goto LABEL_112;
  }
  *(void *)(v3 + 16sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = v32;
  id v120 = v117;
  sub_21F0C92A8();
  swift_endAccess();

  swift_beginAccess();
  id v121 = *(void **)(v3 + 200);
  sub_21F0C9298();
  *(void *)(v3 + 192) = 0;
  id v122 = v121;
  sub_21F0C92A8();
  swift_endAccess();

  sub_21F0BDC3C();
  if (!sub_21F0C29D4())
  {
    uint64_t v123 = *(void *)(v3 + 160);
    uint64_t v124 = *(void *)(*(void *)(v3 + 144) + 16);
    id v125 = *(id *)(v3 + 168);
    sub_21F0C9298();
    sub_21F0C92A8();

    if (v123 < v124)
    {
      unint64_t v19 = (char *)(v6 + 8);
      CGRect v181 = (char *)&v190;
      *(void *)&long long v126 = 136315138;
      long long v180 = v126;
      uint64_t v6 = MEMORY[0x263F8EE78];
      uint64_t v179 = MEMORY[0x263F8EE58] + 8;
      long long v177 = xmmword_21F0CBD60;
      do
      {
        unint64_t v127 = *(void *)(v3 + 160);
        id v128 = *(id *)(v3 + 168);
        sub_21F0C9298();
        sub_21F0C92A8();

        if (!sub_21F0C2D9C(v127)) {
          break;
        }
        unint64_t v129 = *(void *)(v3 + 160);
        id v130 = *(id *)(v3 + 168);
        sub_21F0C9298();
        sub_21F0C92A8();

        if ((v129 & 0x8000000000000000) == 0
          && (uint64_t v131 = *(void *)(v3 + 144), v129 < *(void *)(v131 + 16))
          && *(void *)(v131 + 8 * v129 + 32) == 4
          && *(unsigned char *)v178 == 1
          && !_AXSAttentionAwarenessFeaturesEnabled())
        {
          uint64_t v154 = v175;
          v186(v175, v188, v5);
          swift_retain_n();
          id v155 = sub_21F0C8FA8();
          a1 = sub_21F0C9238();
          if (os_log_type_enabled(v155, (os_log_type_t)a1))
          {
            int v156 = (uint8_t *)swift_slowAlloc();
            CMTimeValue v176 = swift_slowAlloc();
            v193.CMTimeValue value = v176;
            *(_DWORD *)int v156 = v180;
            unint64_t v157 = *(void *)(v3 + 160);
            uint64_t v158 = *(void *)(v3 + 144);
            id v159 = *(id *)(v3 + 168);
            swift_bridgeObjectRetain();
            sub_21F0C9298();
            sub_21F0C92A8();
            if ((v157 & 0x8000000000000000) != 0 || v157 >= *(void *)(v158 + 16))
            {

              swift_bridgeObjectRelease();
              unint64_t v160 = 10;
            }
            else
            {
              unint64_t v160 = *(void *)(v158 + 8 * v157 + 32);

              swift_bridgeObjectRelease();
            }
            uint64_t v161 = PADSWGesture.description.getter(v160);
            uint64_t v189 = sub_21F09D6AC(v161, v162, &v193.value);
            sub_21F0C9308();
            swift_release_n();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_21F07C000, v155, (os_log_type_t)a1, "Skipping gesture %s because attention awareness features are disabled.", v156, 0xCu);
            CMTimeValue v163 = v176;
            swift_arrayDestroy();
            MEMORY[0x223C43270](v163, -1, -1);
            MEMORY[0x223C43270](v156, -1, -1);

            uint64_t v5 = v184;
            v185(v175, v184);
            id v119 = v182;
          }
          else
          {

            swift_release_n();
            v185(v154, v5);
          }
          CMTimeMake(&v193, 1, 1000000000);
          CMTimeValue v164 = v193.value;
          CMTimeEpoch epoch = v193.epoch;
          uint64_t v166 = *(void *)&v193.timescale;
          __swift_instantiateConcreteTypeFromMangledName(&qword_267EBAF70);
          uint64_t v167 = swift_allocObject();
          *(_OWORD *)(v167 + 16) = v177;
          *(void *)(v167 + 32) = v164;
          *(void *)(v167 + 4sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = v166;
          *(void *)(v167 + 48) = epoch;
          sub_21F0C5580(v167);
          swift_bridgeObjectRelease();
          swift_beginAccess();
          long long v168 = *(void **)(v3 + 264);
          char v169 = swift_isUniquelyReferenced_nonNull_native();
          *(void *)(v3 + 264) = v168;
          if ((v169 & 1) == 0)
          {
            long long v168 = sub_21F09CB5C(0, v168[2] + 1, 1, v168);
            void *v183 = v168;
          }
          unint64_t v171 = v168[2];
          unint64_t v170 = v168[3];
          if (v171 >= v170 >> 1)
          {
            long long v168 = sub_21F09CB5C((void *)(v170 > 1), v171 + 1, 1, v168);
            void *v183 = v168;
          }
          v168[2] = v171 + 1;
          v168[v171 + 4] = 3;
        }
        else
        {
          v186(v119, v188, v5);
          swift_retain_n();
          uint64_t v132 = sub_21F0C8FA8();
          a1 = sub_21F0C9228();
          if (os_log_type_enabled(v132, (os_log_type_t)a1))
          {
            uint64_t v133 = v99;
            uint64_t v134 = v19;
            uint64_t v135 = (uint8_t *)swift_slowAlloc();
            CMTimeValue v136 = swift_slowAlloc();
            v193.CMTimeValue value = v136;
            *(_DWORD *)uint64_t v135 = v180;
            unint64_t v137 = *(void *)(v3 + 160);
            uint64_t v138 = *(void *)(v3 + 144);
            id v139 = *(id *)(v3 + 168);
            swift_bridgeObjectRetain();
            sub_21F0C9298();
            sub_21F0C92A8();
            if ((v137 & 0x8000000000000000) != 0 || v137 >= *(void *)(v138 + 16))
            {

              swift_bridgeObjectRelease();
              unint64_t v140 = 10;
            }
            else
            {
              unint64_t v140 = *(void *)(v138 + 8 * v137 + 32);

              swift_bridgeObjectRelease();
            }
            uint64_t v141 = PADSWGesture.description.getter(v140);
            uint64_t v189 = sub_21F09D6AC(v141, v142, &v193.value);
            sub_21F0C9308();
            swift_release_n();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_21F07C000, v132, (os_log_type_t)a1, "Skipping gesture %s because accessibility option is enabled.", v135, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x223C43270](v136, -1, -1);
            MEMORY[0x223C43270](v135, -1, -1);

            id v119 = v182;
            uint64_t v5 = v184;
            unint64_t v19 = v134;
            v185(v182, v184);
            uint64_t v99 = v133;
            uint64_t v6 = MEMORY[0x263F8EE78];
          }
          else
          {

            swift_release_n();
            v185(v119, v5);
          }
          sub_21F0C5580(v6);
          swift_beginAccess();
          uint64_t v143 = *(void **)(v3 + 264);
          char v144 = swift_isUniquelyReferenced_nonNull_native();
          *(void *)(v3 + 264) = v143;
          if ((v144 & 1) == 0)
          {
            uint64_t v143 = sub_21F09CB5C(0, v143[2] + 1, 1, v143);
            void *v183 = v143;
          }
          unint64_t v146 = v143[2];
          unint64_t v145 = v143[3];
          if (v146 >= v145 >> 1)
          {
            uint64_t v143 = sub_21F09CB5C((void *)(v145 > 1), v146 + 1, 1, v143);
            void *v183 = v143;
          }
          v143[2] = v146 + 1;
          v143[v146 + 4] = 0;
        }
        swift_endAccess();
        sub_21F0C5780(v6);
        sub_21F0C5880(v6);
        sub_21F0C5680(v6);
        swift_beginAccess();
        uint64_t v147 = *(void **)(v3 + 168);
        sub_21F0C9298();
        uint64_t v148 = *(void *)(v3 + 160);
        BOOL v23 = __OFADD__(v148, 1);
        uint64_t v149 = v148 + 1;
        if (v23)
        {
          __break(1u);
          goto LABEL_108;
        }
        *(void *)(v3 + 16sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = v149;
        id v150 = v147;
        sub_21F0C92A8();
        swift_endAccess();

        uint64_t v151 = *(void *)(v3 + 160);
        uint64_t v152 = *(void *)(*(void *)(v3 + 144) + 16);
        id v153 = *(id *)(v3 + 168);
        sub_21F0C9298();
        sub_21F0C92A8();
      }
      while (v151 < v152);
    }
  }
  sub_21F0C0EB4();
}

uint64_t sub_21F0C2918()
{
  swift_beginAccess();
  unint64_t v1 = v0[20];
  uint64_t v2 = (void *)v0[21];
  swift_beginAccess();
  uint64_t v3 = v0[36];
  id v4 = v2;
  swift_bridgeObjectRetain();
  sub_21F0C9298();
  sub_21F0C92A8();
  if ((v1 & 0x8000000000000000) != 0 || v1 >= *(void *)(v3 + 16))
  {

    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v5 = *(void *)(v3 + 8 * v1 + 32);
    swift_bridgeObjectRetain();

    swift_bridgeObjectRelease();
  }
  return v5;
}

BOOL sub_21F0C29D4()
{
  uint64_t v1 = v0;
  swift_beginAccess();
  uint64_t v2 = *(void *)(v0 + 264);
  uint64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = 0;
    uint64_t v5 = MEMORY[0x263F8EE78];
    do
    {
      if (*(void *)(v2 + 8 * v4 + 32) == 1)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_21F0C3928(0, *(void *)(v5 + 16) + 1, 1);
        }
        unint64_t v7 = *(void *)(v5 + 16);
        unint64_t v6 = *(void *)(v5 + 24);
        if (v7 >= v6 >> 1) {
          sub_21F0C3928(v6 > 1, v7 + 1, 1);
        }
        *(void *)(v5 + 16) = v7 + 1;
        *(void *)(v5 + 8 * v7 + 32) = 1;
      }
      ++v4;
    }
    while (v3 != v4);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = MEMORY[0x263F8EE78];
  }
  uint64_t v8 = *(void *)(v5 + 16);
  swift_release();
  return v8 >= *(void *)(v1 + 152);
}

uint64_t sub_21F0C2B04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_21F0C2918();
  unint64_t v9 = *(void **)(v8 + 16);
  if (!v9) {
    goto LABEL_9;
  }
  if ((sub_21F0C92D8() & 1) == 0)
  {
    if (v9 != (void *)1)
    {
      uint64_t v10 = v8 + 72;
      uint64_t v11 = 1;
      while (1)
      {
        id v12 = (void *)(v11 + 1);
        if (__OFADD__(v11, 1)) {
          break;
        }
        if (sub_21F0C92D8()) {
          goto LABEL_21;
        }
        v10 += 24;
        ++v11;
        if (v12 == v9) {
          goto LABEL_9;
        }
      }
      __break(1u);
      goto LABEL_25;
    }
LABEL_9:
    swift_bridgeObjectRelease();
    uint64_t v13 = *(void *)(sub_21F0BF520() + 16);
    swift_bridgeObjectRelease();
    if (v13 != 2) {
      goto LABEL_13;
    }
    uint64_t result = sub_21F0BF520();
    uint64_t v21 = result;
    if (*(void *)(result + 16))
    {
      sub_21F0C59B8(0, 1);
      sub_21F0C5780(v21);
      swift_bridgeObjectRelease();
      uint64_t result = sub_21F0C2918();
      uint64_t v22 = result;
      if (*(void *)(result + 16))
      {
        sub_21F0C5B2C(0, 1);
        sub_21F0C5880(v22);
        swift_bridgeObjectRelease();
LABEL_13:
        swift_bridgeObjectRetain();
        unint64_t v9 = (void *)sub_21F0BF520();
        if (swift_isUniquelyReferenced_nonNull_native())
        {
LABEL_14:
          unint64_t v16 = v9[2];
          unint64_t v15 = v9[3];
          if (v16 >= v15 >> 1) {
            unint64_t v9 = sub_21F09CC90((void *)(v15 > 1), v16 + 1, 1, v9);
          }
          void v9[2] = v16 + 1;
          v9[v16 + 4] = a1;
          sub_21F0C5780((uint64_t)v9);
          swift_bridgeObjectRelease();
          uint64_t v17 = (void *)sub_21F0C2918();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v17 = sub_21F09CB68(0, v17[2] + 1, 1, v17);
          }
          unint64_t v19 = v17[2];
          unint64_t v18 = v17[3];
          if (v19 >= v18 >> 1) {
            uint64_t v17 = sub_21F09CB68((void *)(v18 > 1), v19 + 1, 1, v17);
          }
          v17[2] = v19 + 1;
          BOOL v20 = &v17[3 * v19];
          v20[4] = a2;
          v20[5] = a3;
          v20[6] = a4;
          sub_21F0C5880((uint64_t)v17);
          goto LABEL_21;
        }
LABEL_25:
        unint64_t v9 = sub_21F09CC90(0, v9[2] + 1, 1, v9);
        goto LABEL_14;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    return result;
  }
LABEL_21:
  return swift_bridgeObjectRelease();
}

BOOL sub_21F0C2D9C(unint64_t a1)
{
  if ((a1 & 0x8000000000000000) == 0)
  {
    uint64_t v3 = *(void *)(v1 + 144);
    if (*(void *)(v3 + 16) > a1)
    {
      unint64_t v4 = *(void *)(v3 + 8 * a1 + 32);
      swift_beginAccess();
      uint64_t v5 = *(void *)(v1 + 248);
      if (v4 > 9)
      {
        if (!sub_21F0C2E70(3, v5)) {
          goto LABEL_5;
        }
      }
      else if (!sub_21F0C2E70(qword_21F0CD0E0[v4], v5))
      {
LABEL_5:
        uint64_t v6 = *(void *)(v1 + 144);
        if (*(void *)(v6 + 16) > a1 && *(void *)(v6 + 8 * a1 + 32) == 4 && *(unsigned char *)(v1 + 257) == 1) {
          return _AXSAttentionAwarenessFeaturesEnabled() == 0;
        }
        return 0;
      }
      return 1;
    }
  }
  return 0;
}

BOOL sub_21F0C2E70(uint64_t a1, uint64_t a2)
{
  if (!*(void *)(a2 + 16)) {
    return 0;
  }
  sub_21F0C9628();
  sub_21F0C9638();
  uint64_t v4 = sub_21F0C9648();
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = v4 & ~v5;
  uint64_t v7 = a2 + 56;
  if (((*(void *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
    return 0;
  }
  uint64_t v8 = *(void *)(a2 + 48);
  if (*(void *)(v8 + 8 * v6) == a1) {
    return 1;
  }
  uint64_t v10 = ~v5;
  unint64_t v11 = (v6 + 1) & v10;
  if (((*(void *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
    return 0;
  }
  do
  {
    uint64_t v12 = *(void *)(v8 + 8 * v11);
    BOOL result = v12 == a1;
    if (v12 == a1) {
      break;
    }
    unint64_t v11 = (v11 + 1) & v10;
  }
  while (((*(void *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
  return result;
}

uint64_t sub_21F0C2F60()
{
  uint64_t v2 = *(void *)(*(void *)(v0 + 144) + 16);
  uint64_t v3 = (uint64_t *)(v0 + 264);
  swift_beginAccess();
  uint64_t v4 = v2 - *(void *)(*(void *)(v0 + 264) + 16);
  if (v4 < 0)
  {
LABEL_66:
    __break(1u);
LABEL_67:
    uint64_t v1 = (uint64_t)sub_21F09CB5C(0, *(void *)(v1 + 16) + 1, 1, (void *)v1);
    goto LABEL_4;
  }
  if (!v4) {
    goto LABEL_8;
  }
  swift_beginAccess();
  uint64_t v1 = *v3;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v3 = v1;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    goto LABEL_67;
  }
  do
  {
LABEL_4:
    *uint64_t v3 = v1;
    unint64_t v7 = *(void *)(v1 + 16);
    unint64_t v6 = *(void *)(v1 + 24);
    if (v7 >= v6 >> 1)
    {
      uint64_t v1 = (uint64_t)sub_21F09CB5C((void *)(v6 > 1), v7 + 1, 1, (void *)v1);
      *uint64_t v3 = v1;
    }
    *(void *)(v1 + 16) = v7 + 1;
    *(void *)(v1 + 8 * v7 + 32) = 2;
    uint64_t v1 = *v3;
    --v4;
  }
  while (v4);
  swift_endAccess();
LABEL_8:
  uint64_t v8 = v0 + 272;
  swift_beginAccess();
  uint64_t v4 = *(void *)(*(void *)(v0 + 272) + 16);
  unint64_t v9 = (void *)MEMORY[0x263F8EE78];
  unint64_t v40 = (uint64_t *)v0;
  if (v4)
  {
    uint64_t v41 = v0 + 280;
    swift_beginAccess();
    uint64_t v10 = -v4;
    uint64_t v11 = MEMORY[0x263F8EE78];
    uint64_t v1 = 4;
    unint64_t v9 = (void *)MEMORY[0x263F8EE78];
    do
    {
      unint64_t v12 = v1 - 4;
      if ((unint64_t)(v1 - 4) < *(void *)(*v3 + 16) && *(void *)(*v3 + 8 * v1) == 1)
      {
        if (v12 >= *(void *)(*(void *)v41 + 16)) {
          goto LABEL_64;
        }
        if (v12 >= *(void *)(*(void *)v8 + 16))
        {
LABEL_65:
          __break(1u);
          goto LABEL_66;
        }
        v43[0] = *(void *)(*(void *)v41 + 8 * v1);
        swift_bridgeObjectRetain();
        uint64_t v13 = swift_bridgeObjectRetain();
        sub_21F0C5158(v13);
        uint64_t v0 = v43[0];
      }
      else
      {
        uint64_t v0 = v11;
        if (v12 < *(void *)(*(void *)v8 + 16))
        {
          uint64_t v14 = *(void **)(*(void *)v8 + 8 * v1);
          if (v14[2])
          {
            uint64_t v15 = v14[4];
            uint64_t v16 = v14[6];
            __swift_instantiateConcreteTypeFromMangledName(&qword_267EBAF70);
            uint64_t v0 = swift_allocObject();
            uint64_t v17 = v14[5];
            *(_OWORD *)(v0 + 16) = xmmword_21F0CBD60;
            *(void *)(v0 + 32) = v15;
            *(void *)(v0 + 4sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = v17;
            *(void *)(v0 + 48) = v16;
          }
          else
          {
            uint64_t v0 = v11;
          }
        }
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v9 = sub_21F09CCA4(0, v9[2] + 1, 1, v9);
      }
      uint64_t v4 = v9[2];
      unint64_t v18 = v9[3];
      if (v4 >= v18 >> 1) {
        unint64_t v9 = sub_21F09CCA4((void *)(v18 > 1), v4 + 1, 1, v9);
      }
      void v9[2] = v4 + 1;
      v9[v4 + 4] = v0;
      ++v1;
    }
    while (v10 + v1 != 4);
  }
  unint64_t v19 = v40;
  if (v40[19]) {
    float v20 = (float)sub_21F0BD498() / (float)v40[19];
  }
  else {
    float v20 = 0.0;
  }
  uint64_t v21 = v40[33];
  swift_beginAccess();
  uint64_t v0 = v40[37];
  uint64_t v3 = *(uint64_t **)(v0 + 16);
  if (v3)
  {
    uint64_t v42 = v21;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v4 = 0;
    uint64_t v22 = (void *)MEMORY[0x263F8EE78];
    while (1)
    {
      uint64_t v1 = *(void *)(v0 + 8 * v4 + 32);
      uint64_t v23 = *(void *)(v1 + 16);
      int64_t v24 = v22[2];
      int64_t v25 = v24 + v23;
      if (__OFADD__(v24, v23))
      {
        __break(1u);
LABEL_61:
        __break(1u);
LABEL_62:
        __break(1u);
LABEL_63:
        __break(1u);
LABEL_64:
        __break(1u);
        goto LABEL_65;
      }
      swift_bridgeObjectRetain();
      unint64_t v26 = (void *)swift_isUniquelyReferenced_nonNull_native();
      if (v26 && v25 <= v22[3] >> 1)
      {
        if (*(void *)(v1 + 16)) {
          goto LABEL_40;
        }
      }
      else
      {
        if (v24 <= v25) {
          int64_t v27 = v24 + v23;
        }
        else {
          int64_t v27 = v24;
        }
        uint64_t v22 = sub_21F09CC90(v26, v27, 1, v22);
        if (*(void *)(v1 + 16))
        {
LABEL_40:
          uint64_t v28 = v22[2];
          if ((v22[3] >> 1) - v28 < v23) {
            goto LABEL_62;
          }
          unint64_t v29 = (unint64_t)&v22[v28 + 4];
          if (v1 + 32 < v29 + 8 * v23 && v29 < v1 + 32 + 8 * v23)
          {
            uint64_t result = sub_21F0C94C8();
            __break(1u);
            return result;
          }
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267EBB440);
          swift_arrayInitWithCopy();
          if (v23)
          {
            uint64_t v31 = v22[2];
            BOOL v32 = __OFADD__(v31, v23);
            uint64_t v33 = v31 + v23;
            if (v32) {
              goto LABEL_63;
            }
            id v22[2] = v33;
          }
          goto LABEL_30;
        }
      }
      if (v23) {
        goto LABEL_61;
      }
LABEL_30:
      ++v4;
      swift_bridgeObjectRelease();
      if (v3 == (uint64_t *)v4)
      {
        swift_bridgeObjectRelease();
        unint64_t v19 = v40;
        uint64_t v21 = v42;
        goto LABEL_51;
      }
    }
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v22 = (void *)MEMORY[0x263F8EE78];
LABEL_51:
  swift_beginAccess();
  uint64_t v34 = v19[36];
  v43[0] = MEMORY[0x263F8EE78];
  uint64_t v35 = *(void *)(v34 + 16);
  if (v35)
  {
    swift_bridgeObjectRetain_n();
    for (uint64_t i = 0; i != v35; ++i)
    {
      uint64_t v37 = swift_bridgeObjectRetain();
      sub_21F0C5158(v37);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  uint64_t v38 = v43[0];
  *(float *)unint64_t v43 = v20;
  v43[1] = v21;
  v43[2] = v9;
  v43[3] = v22;
  v43[4] = v38;
  if (MEMORY[0x223C43330](v19 + 16))
  {
    sub_21F091DB4(v43);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21F0C351C()
{
  sub_21F0B40A8((uint64_t)(v0 + 16));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

id *sub_21F0C359C()
{
  uint64_t v0 = (id *)sub_21F0B0D3C();
  sub_21F0B40A8((uint64_t)(v0 + 16));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_21F0C3624()
{
  uint64_t v0 = sub_21F0C359C();
  return MEMORY[0x270FA0228](v0, 304, 7);
}

uint64_t type metadata accessor for PADFaceActionController()
{
  return self;
}

uint64_t destroy for PADFaceActionControllerResult()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PADFaceActionControllerResult(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PADFaceActionControllerResult(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for PADFaceActionControllerResult(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PADFaceActionControllerResult(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PADFaceActionControllerResult(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 4sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 4sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PADFaceActionControllerResult()
{
  return &type metadata for PADFaceActionControllerResult;
}

uint64_t sub_21F0C38D0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_21F0C3F8C(a1, a2, a3, *v3, &qword_267EBB4B0);
  *long long v3 = (char *)result;
  return result;
}

uint64_t sub_21F0C38F8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_21F0C3DFC(a1, a2, a3, (void *)*v3, &qword_267EBB4B8, &qword_267EBB4C0);
  *long long v3 = result;
  return result;
}

uint64_t sub_21F0C3928(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_21F0C3F8C(a1, a2, a3, *v3, &qword_267EBAF78);
  *long long v3 = (char *)result;
  return result;
}

uint64_t sub_21F0C3950(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_21F0C3DFC(a1, a2, a3, (void *)*v3, &qword_267EBAF80, (uint64_t *)&unk_267EBB500);
  *long long v3 = result;
  return result;
}

uint64_t sub_21F0C3980(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_21F0C3DFC(a1, a2, a3, (void *)*v3, &qword_267EBAF68, (uint64_t *)&unk_267EBB510);
  *long long v3 = result;
  return result;
}

uint64_t sub_21F0C39B0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_21F0C3B10(a1, a2, a3, *v3);
  *long long v3 = (char *)result;
  return result;
}

uint64_t sub_21F0C39D0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_21F0C3DFC(a1, a2, a3, (void *)*v3, (uint64_t *)&unk_267EBB470, &qword_267EBB068);
  *long long v3 = result;
  return result;
}

uint64_t sub_21F0C3A00(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_21F0C3DFC(a1, a2, a3, (void *)*v3, (uint64_t *)&unk_267EBB4E0, &qword_267EBB060);
  *long long v3 = result;
  return result;
}

uint64_t sub_21F0C3A30(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_21F0C3C8C(a1, a2, a3, *v3);
  *long long v3 = (char *)result;
  return result;
}

uint64_t sub_21F0C3A50(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_21F0C3DFC(a1, a2, a3, (void *)*v3, (uint64_t *)&unk_267EBB4D0, (uint64_t *)&unk_267EBB440);
  *long long v3 = result;
  return result;
}

uint64_t sub_21F0C3A80(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_21F0C3F8C(a1, a2, a3, *v3, &qword_267EBAFC8);
  *long long v3 = (char *)result;
  return result;
}

uint64_t sub_21F0C3AA8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_21F0C40E8(a1, a2, a3, *v3);
  *long long v3 = (char *)result;
  return result;
}

uint64_t sub_21F0C3AC8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_21F0C3F8C(a1, a2, a3, *v3, (uint64_t *)&unk_267EBB480);
  *long long v3 = (char *)result;
  return result;
}

uint64_t sub_21F0C3AF0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_21F0C4248(a1, a2, a3, *v3);
  *long long v3 = (char *)result;
  return result;
}

uint64_t sub_21F0C3B10(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267EBAF70);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[24 * v8]) {
      memmove(v12, v13, 24 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[24 * v8] || v12 >= &v13[24 * v8])
  {
    memcpy(v12, v13, 24 * v8);
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_21F0C94C8();
  __break(1u);
  return result;
}

uint64_t sub_21F0C3C8C(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267EBB4C8);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_21F0C94C8();
  __break(1u);
  return result;
}

uint64_t sub_21F0C3DFC(char a1, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t *a6)
{
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v10 = a2;
      }
    }
  }
  else
  {
    int64_t v10 = a2;
  }
  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (v12)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    uint64_t v13 = (void *)swift_allocObject();
    int64_t v14 = _swift_stdlib_malloc_size(v13);
    uint64_t v15 = v14 - 32;
    if (v14 < 32) {
      uint64_t v15 = v14 - 25;
    }
    v13[2] = v11;
    void v13[3] = 2 * (v15 >> 3);
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v16 = (unint64_t)(v13 + 4);
  unint64_t v17 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v13 != a4 || v16 >= v17 + 8 * v11) {
      memmove(v13 + 4, a4 + 4, 8 * v11);
    }
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v17 >= v16 + 8 * v11 || v16 >= v17 + 8 * v11)
  {
    __swift_instantiateConcreteTypeFromMangledName(a6);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_32:
  uint64_t result = sub_21F0C94C8();
  __break(1u);
  return result;
}

uint64_t sub_21F0C3F8C(char a1, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  if (a3)
  {
    unint64_t v7 = *((void *)a4 + 3);
    int64_t v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v8 = a2;
      }
    }
  }
  else
  {
    int64_t v8 = a2;
  }
  uint64_t v9 = *((void *)a4 + 2);
  if (v8 <= v9) {
    uint64_t v10 = *((void *)a4 + 2);
  }
  else {
    uint64_t v10 = v8;
  }
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    uint64_t v11 = (char *)swift_allocObject();
    int64_t v12 = _swift_stdlib_malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 25;
    }
    *((void *)v11 + 2) = v9;
    *((void *)v11 + 3) = 2 * (v13 >> 3);
  }
  else
  {
    uint64_t v11 = (char *)MEMORY[0x263F8EE78];
  }
  int64_t v14 = v11 + 32;
  uint64_t v15 = a4 + 32;
  if (a1)
  {
    if (v11 != a4 || v14 >= &v15[8 * v9]) {
      memmove(v14, v15, 8 * v9);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v15 >= &v14[8 * v9] || v14 >= &v15[8 * v9])
  {
    memcpy(v14, v15, 8 * v9);
LABEL_30:
    swift_release();
    return (uint64_t)v11;
  }
LABEL_32:
  uint64_t result = sub_21F0C94C8();
  __break(1u);
  return result;
}

uint64_t sub_21F0C40E8(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267EBAF88);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 29;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  int64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8]) {
      memmove(v13, v14, 4 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[4 * v8] || v13 >= &v14[4 * v8])
  {
    memcpy(v13, v14, 4 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_21F0C94C8();
  __break(1u);
  return result;
}

uint64_t sub_21F0C4248(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267EBB490);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  int64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_21F0C94C8();
  __break(1u);
  return result;
}

unint64_t sub_21F0C43B4(uint64_t a1, uint64_t a2)
{
  sub_21F0C9628();
  sub_21F0C90B8();
  uint64_t v4 = sub_21F0C9648();
  return sub_21F0C4504(a1, a2, v4);
}

unint64_t sub_21F0C442C(uint64_t a1)
{
  uint64_t v2 = sub_21F0C9358();
  return sub_21F0C45E8(a1, v2);
}

unint64_t sub_21F0C4474(uint64_t a1)
{
  sub_21F0C9078();
  sub_21F0C9628();
  sub_21F0C90B8();
  uint64_t v2 = sub_21F0C9648();
  swift_bridgeObjectRelease();
  return sub_21F0C46B0(a1, v2);
}

unint64_t sub_21F0C4504(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_21F0C95D8() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_21F0C95D8() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_21F0C45E8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_21F0C5DFC(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x223C42320](v9, a1);
      sub_21F0AE43C((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_21F0C46B0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_21F0C9078();
    uint64_t v8 = v7;
    if (v6 == sub_21F0C9078() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_21F0C95D8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_21F0C9078();
          uint64_t v15 = v14;
          if (v13 == sub_21F0C9078() && v15 == v16) {
            break;
          }
          char v18 = sub_21F0C95D8();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

uint64_t sub_21F0C4828(uint64_t *a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  sub_21F0C9628();
  sub_21F0C9638();
  uint64_t v6 = sub_21F0C9648();
  uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v8 = v6 & ~v7;
  if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v13 = *v2;
    uint64_t *v2 = 0x8000000000000000;
    sub_21F0C4BF4(a2, v8, isUniquelyReferenced_nonNull_native);
    uint64_t *v2 = v13;
    swift_bridgeObjectRelease();
    uint64_t result = 1;
    goto LABEL_8;
  }
  uint64_t v9 = *(void *)(v5 + 48);
  if (*(void *)(v9 + 8 * v8) != a2)
  {
    uint64_t v10 = ~v7;
    do
    {
      unint64_t v8 = (v8 + 1) & v10;
      if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
        goto LABEL_7;
      }
    }
    while (*(void *)(v9 + 8 * v8) != a2);
  }
  uint64_t result = 0;
  a2 = *(void *)(*(void *)(*v2 + 48) + 8 * v8);
LABEL_8:
  *a1 = a2;
  return result;
}

uint64_t sub_21F0C4948()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267EBB4F0);
  uint64_t result = sub_21F0C9398();
  uint64_t v4 = result;
  if (*(void *)(v2 + 16))
  {
    int64_t v5 = 0;
    uint64_t v6 = (void *)(v2 + 56);
    uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v9 = v8 & *(void *)(v2 + 56);
    int64_t v10 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v11 = result + 56;
    while (1)
    {
      if (v9)
      {
        unint64_t v13 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        unint64_t v14 = v13 | (v5 << 6);
      }
      else
      {
        int64_t v15 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v10) {
          goto LABEL_33;
        }
        unint64_t v16 = v6[v15];
        ++v5;
        if (!v16)
        {
          int64_t v5 = v15 + 1;
          if (v15 + 1 >= v10) {
            goto LABEL_33;
          }
          unint64_t v16 = v6[v5];
          if (!v16)
          {
            int64_t v5 = v15 + 2;
            if (v15 + 2 >= v10) {
              goto LABEL_33;
            }
            unint64_t v16 = v6[v5];
            if (!v16)
            {
              int64_t v17 = v15 + 3;
              if (v17 >= v10)
              {
LABEL_33:
                uint64_t v26 = 1 << *(unsigned char *)(v2 + 32);
                if (v26 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v26 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v6 = -1 << v26;
                }
                uint64_t v1 = v0;
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v16 = v6[v17];
              if (!v16)
              {
                while (1)
                {
                  int64_t v5 = v17 + 1;
                  if (__OFADD__(v17, 1)) {
                    goto LABEL_39;
                  }
                  if (v5 >= v10) {
                    goto LABEL_33;
                  }
                  unint64_t v16 = v6[v5];
                  ++v17;
                  if (v16) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v5 = v17;
            }
          }
        }
LABEL_23:
        unint64_t v9 = (v16 - 1) & v16;
        unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
      }
      uint64_t v18 = *(void *)(*(void *)(v2 + 48) + 8 * v14);
      sub_21F0C9628();
      sub_21F0C9638();
      uint64_t result = sub_21F0C9648();
      uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v20 = result & ~v19;
      unint64_t v21 = v20 >> 6;
      if (((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v22 = 0;
        unint64_t v23 = (unint64_t)(63 - v19) >> 6;
        do
        {
          if (++v21 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v24 = v21 == v23;
          if (v21 == v23) {
            unint64_t v21 = 0;
          }
          v22 |= v24;
          uint64_t v25 = *(void *)(v11 + 8 * v21);
        }
        while (v25 == -1);
        unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      *(void *)(*(void *)(v4 + 48) + 8 * v12) = v18;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_21F0C4BF4(uint64_t result, unint64_t a2, char a3)
{
  uint64_t v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_21F0C4948();
  }
  else
  {
    if (v7 > v6)
    {
      uint64_t result = (uint64_t)sub_21F0C4D44();
      goto LABEL_14;
    }
    sub_21F0C4EDC();
  }
  uint64_t v8 = *v3;
  sub_21F0C9628();
  sub_21F0C9638();
  uint64_t result = sub_21F0C9648();
  uint64_t v9 = -1 << *(unsigned char *)(v8 + 32);
  a2 = result & ~v9;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v10 = *(void *)(v8 + 48);
    if (*(void *)(v10 + 8 * a2) == v5)
    {
LABEL_13:
      uint64_t result = sub_21F0C95F8();
      __break(1u);
    }
    else
    {
      uint64_t v11 = ~v9;
      while (1)
      {
        a2 = (a2 + 1) & v11;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        if (*(void *)(v10 + 8 * a2) == v5) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v12 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v12 + 48) + 8 * a2) = v5;
  uint64_t v13 = *(void *)(v12 + 16);
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    *(void *)(v12 + 16) = v15;
  }
  return result;
}

void *sub_21F0C4D44()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267EBB4F0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_21F0C9388();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(void *)(*(void *)(v4 + 48) + 8 * v15) = *(void *)(*(void *)(v2 + 48) + 8 * v15);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_21F0C4EDC()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267EBB4F0);
  uint64_t result = sub_21F0C9398();
  uint64_t v4 = result;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  int64_t v5 = 0;
  uint64_t v6 = v2 + 56;
  uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(v2 + 56);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v14 = v13 | (v5 << 6);
      goto LABEL_24;
    }
    int64_t v15 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      int64_t v5 = v15 + 1;
      if (v15 + 1 >= v10) {
        goto LABEL_33;
      }
      unint64_t v16 = *(void *)(v6 + 8 * v5);
      if (!v16)
      {
        int64_t v5 = v15 + 2;
        if (v15 + 2 >= v10) {
          goto LABEL_33;
        }
        unint64_t v16 = *(void *)(v6 + 8 * v5);
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_24:
    uint64_t v18 = *(void *)(*(void *)(v2 + 48) + 8 * v14);
    sub_21F0C9628();
    sub_21F0C9638();
    uint64_t result = sub_21F0C9648();
    uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v24 = v21 == v23;
        if (v21 == v23) {
          unint64_t v21 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v11 + 8 * v21);
      }
      while (v25 == -1);
      unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    *(void *)(*(void *)(v4 + 48) + 8 * v12) = v18;
    ++*(void *)(v4 + 16);
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v10)
  {
LABEL_33:
    uint64_t result = swift_release();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v17);
  if (v16)
  {
    int64_t v5 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v5 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v5 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v5);
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_21F0C5158(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v14 = v4 + v2;
  }
  else {
    int64_t v14 = v4;
  }
  uint64_t v3 = sub_21F09CB68(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v9 = &v3[3 * v8 + 4];
  if (a1 + 32 < (unint64_t)&v9[3 * v2] && (unint64_t)v9 < a1 + 32 + 24 * v2) {
    goto LABEL_24;
  }
  memcpy(v9, (const void *)(a1 + 32), 24 * v2);
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
  uint64_t v11 = v3[2];
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_21F0C94C8();
  __break(1u);
  return result;
}

uint64_t sub_21F0C52A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v22 = a3;
  uint64_t v23 = a2;
  uint64_t v24 = a1;
  uint64_t v4 = sub_21F0C9258();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_21F0C9248();
  MEMORY[0x270FA5388](v8);
  uint64_t v9 = sub_21F0C8FF8();
  MEMORY[0x270FA5388](v9 - 8);
  *(void *)(v3 + 136) = 0;
  swift_unknownObjectWeakInit();
  uint64_t v10 = MEMORY[0x263F8EE78];
  *(void *)(v3 + 144) = MEMORY[0x263F8EE78];
  *(void *)(v3 + 152) = 3;
  swift_retain();
  dispatch_semaphore_t v11 = dispatch_semaphore_create(1);
  *(void *)(v3 + 16sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = 0;
  *(void *)(v3 + 168) = v11;
  dispatch_semaphore_t v12 = dispatch_semaphore_create(1);
  *(void *)(v3 + 176) = 0;
  *(void *)(v3 + 184) = v12;
  dispatch_semaphore_t v13 = dispatch_semaphore_create(1);
  *(void *)(v3 + 192) = 0;
  *(void *)(v3 + 20sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = v13;
  dispatch_semaphore_t v14 = dispatch_semaphore_create(1);
  *(void *)(v3 + 208) = 0;
  *(void *)(v3 + 216) = v14;
  uint64_t v15 = MEMORY[0x263F010E0];
  uint64_t v16 = *(void *)(MEMORY[0x263F010E0] + 16);
  *(void *)(v3 + 224) = *MEMORY[0x263F010E0];
  uint64_t v17 = *(void *)(v15 + 8);
  uint64_t v18 = MEMORY[0x263F8EE88];
  *(void *)(v3 + 232) = v17;
  *(void *)(v3 + 24sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = v16;
  *(void *)(v3 + 248) = v18;
  *(unsigned char *)(v3 + 256) = 1;
  *(_DWORD *)(v3 + 257) = 0;
  *(unsigned char *)(v3 + 261) = 0;
  *(void *)(v3 + 264) = v10;
  *(void *)(v3 + 272) = v10;
  *(void *)(v3 + 28sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = v10;
  *(void *)(v3 + 288) = v10;
  *(void *)(v3 + 296) = v10;
  swift_release();
  sub_21F0A5404(0, &qword_267EBB080);
  sub_21F0C8FE8();
  uint64_t v25 = v10;
  sub_21F0C5E58();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EBB158);
  sub_21F0C5EB0();
  sub_21F0C9338();
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F8F130], v4);
  uint64_t v19 = sub_21F0C9288();
  uint64_t v20 = sub_21F0AE674(v19, v22);
  *(void *)(v20 + 136) = v23;
  swift_unknownObjectWeakAssign();
  return v20;
}

void sub_21F0C5580(uint64_t a1)
{
  swift_beginAccess();
  unint64_t v4 = *(void *)(v1 + 160);
  uint64_t v3 = *(void **)(v1 + 168);
  uint64_t v5 = v1 + 272;
  swift_beginAccess();
  id v6 = v3;
  sub_21F0C9298();
  sub_21F0C92A8();
  if ((v4 & 0x8000000000000000) != 0) {
    goto LABEL_7;
  }
  uint64_t v7 = *(void **)v5;
  if (v4 >= *(void *)(*(void *)v5 + 16)) {
    goto LABEL_7;
  }
  swift_bridgeObjectRetain_n();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)uint64_t v5 = v7;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v7 = sub_21F0C69D0(v7);
    *(void *)uint64_t v5 = v7;
  }
  if (v4 < v7[2])
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v7[v4 + 4] = a1;
    swift_bridgeObjectRelease_n();
LABEL_7:
    swift_endAccess();

    return;
  }
  __break(1u);
}

void sub_21F0C5680(uint64_t a1)
{
  swift_beginAccess();
  unint64_t v4 = *(void *)(v1 + 160);
  uint64_t v3 = *(void **)(v1 + 168);
  uint64_t v5 = v1 + 280;
  swift_beginAccess();
  id v6 = v3;
  sub_21F0C9298();
  sub_21F0C92A8();
  if ((v4 & 0x8000000000000000) != 0) {
    goto LABEL_7;
  }
  uint64_t v7 = *(void **)v5;
  if (v4 >= *(void *)(*(void *)v5 + 16)) {
    goto LABEL_7;
  }
  swift_bridgeObjectRetain_n();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)uint64_t v5 = v7;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v7 = sub_21F0C69D0(v7);
    *(void *)uint64_t v5 = v7;
  }
  if (v4 < v7[2])
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v7[v4 + 4] = a1;
    swift_bridgeObjectRelease_n();
LABEL_7:
    swift_endAccess();

    return;
  }
  __break(1u);
}

void sub_21F0C5780(uint64_t a1)
{
  swift_beginAccess();
  unint64_t v4 = *(void *)(v1 + 160);
  uint64_t v3 = *(void **)(v1 + 168);
  uint64_t v5 = v1 + 296;
  swift_beginAccess();
  id v6 = v3;
  sub_21F0C9298();
  sub_21F0C92A8();
  if ((v4 & 0x8000000000000000) != 0) {
    goto LABEL_7;
  }
  uint64_t v7 = *(void **)v5;
  if (v4 >= *(void *)(*(void *)v5 + 16)) {
    goto LABEL_7;
  }
  swift_bridgeObjectRetain_n();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)uint64_t v5 = v7;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v7 = sub_21F0C69E4(v7);
    *(void *)uint64_t v5 = v7;
  }
  if (v4 < v7[2])
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v7[v4 + 4] = a1;
    swift_bridgeObjectRelease_n();
LABEL_7:
    swift_endAccess();

    return;
  }
  __break(1u);
}

void sub_21F0C5880(uint64_t a1)
{
  swift_beginAccess();
  unint64_t v4 = *(void *)(v1 + 160);
  uint64_t v3 = *(void **)(v1 + 168);
  uint64_t v5 = v1 + 288;
  swift_beginAccess();
  id v6 = v3;
  sub_21F0C9298();
  sub_21F0C92A8();
  if ((v4 & 0x8000000000000000) != 0) {
    goto LABEL_7;
  }
  uint64_t v7 = *(void **)v5;
  if (v4 >= *(void *)(*(void *)v5 + 16)) {
    goto LABEL_7;
  }
  swift_bridgeObjectRetain_n();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)uint64_t v5 = v7;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v7 = sub_21F0C69D0(v7);
    *(void *)uint64_t v5 = v7;
  }
  if (v4 < v7[2])
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v7[v4 + 4] = a1;
    swift_bridgeObjectRelease_n();
LABEL_7:
    swift_endAccess();

    return;
  }
  __break(1u);
}

uint64_t sub_21F0C5980()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_21F0C59B8(uint64_t a1, int64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  unint64_t v4 = *(void **)v2;
  int64_t v5 = *(void *)(*(void *)v2 + 16);
  if (v5 < a2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v9 > v4[3] >> 1)
  {
    if (v5 <= v9) {
      int64_t v11 = v5 + v8;
    }
    else {
      int64_t v11 = v5;
    }
    unint64_t v4 = sub_21F09CC90(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267EBB440);
  uint64_t result = swift_arrayDestroy();
  if (!v7) {
    goto LABEL_20;
  }
  uint64_t v13 = v4[2];
  BOOL v14 = __OFSUB__(v13, a2);
  uint64_t v15 = v13 - a2;
  if (v14) {
    goto LABEL_26;
  }
  if ((v15 & 0x8000000000000000) == 0)
  {
    uint64_t v16 = (char *)&v4[a2 + 4];
    if (a1 != a2 || &v4[a1 + 4] >= (void *)&v16[8 * v15]) {
      uint64_t result = (uint64_t)memmove(&v4[a1 + 4], v16, 8 * v15);
    }
    uint64_t v17 = v4[2];
    BOOL v14 = __OFADD__(v17, v8);
    uint64_t v18 = v17 - v7;
    if (!v14)
    {
      v4[2] = v18;
LABEL_20:
      *(void *)uint64_t v2 = v4;
      return result;
    }
    goto LABEL_27;
  }
LABEL_28:
  uint64_t result = sub_21F0C94C8();
  __break(1u);
  return result;
}

char *sub_21F0C5B2C(uint64_t a1, int64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v4 = *v2;
  int64_t v5 = *((void *)*v2 + 2);
  if (v5 < a2)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  uint64_t result = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (result && v9 <= *((void *)v4 + 3) >> 1)
  {
    if (!v8) {
      goto LABEL_21;
    }
  }
  else
  {
    if (v5 <= v9) {
      int64_t v11 = v5 + v8;
    }
    else {
      int64_t v11 = v5;
    }
    uint64_t result = (char *)sub_21F09CB68(result, v11, 1, v4);
    unint64_t v4 = result;
    if (!v8) {
      goto LABEL_21;
    }
  }
  uint64_t v12 = *((void *)v4 + 2);
  BOOL v13 = __OFSUB__(v12, a2);
  uint64_t v14 = v12 - a2;
  if (v13) {
    goto LABEL_27;
  }
  if ((v14 & 0x8000000000000000) == 0)
  {
    uint64_t result = &v4[24 * a1 + 32];
    uint64_t v15 = &v4[24 * a2 + 32];
    if (a1 != a2 || result >= &v15[24 * v14]) {
      uint64_t result = (char *)memmove(result, v15, 24 * v14);
    }
    uint64_t v16 = *((void *)v4 + 2);
    BOOL v13 = __OFADD__(v16, v8);
    uint64_t v17 = v16 + v8;
    if (!v13)
    {
      *((void *)v4 + 2) = v17;
LABEL_21:
      uint64_t *v2 = v4;
      return result;
    }
    goto LABEL_28;
  }
LABEL_29:
  uint64_t result = (char *)sub_21F0C94C8();
  __break(1u);
  return result;
}

uint64_t sub_21F0C5C90(uint64_t a1, int64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  unint64_t v4 = *(void **)v2;
  int64_t v5 = *(void *)(*(void *)v2 + 16);
  if (v5 < a2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v9 > v4[3] >> 1)
  {
    if (v5 <= v9) {
      int64_t v11 = v5 + v8;
    }
    else {
      int64_t v11 = v5;
    }
    unint64_t v4 = sub_21F09D59C(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  uint64_t result = swift_arrayDestroy();
  if (!v7) {
    goto LABEL_20;
  }
  uint64_t v13 = v4[2];
  BOOL v14 = __OFSUB__(v13, a2);
  uint64_t v15 = v13 - a2;
  if (v14) {
    goto LABEL_26;
  }
  if ((v15 & 0x8000000000000000) == 0)
  {
    uint64_t v16 = (char *)&v4[4 * a2 + 4];
    if (a1 != a2 || &v4[4 * a1 + 4] >= (void *)&v16[32 * v15]) {
      uint64_t result = (uint64_t)memmove(&v4[4 * a1 + 4], v16, 32 * v15);
    }
    uint64_t v17 = v4[2];
    BOOL v14 = __OFADD__(v17, v8);
    uint64_t v18 = v17 - v7;
    if (!v14)
    {
      v4[2] = v18;
LABEL_20:
      *(void *)uint64_t v2 = v4;
      return result;
    }
    goto LABEL_27;
  }
LABEL_28:
  uint64_t result = sub_21F0C94C8();
  __break(1u);
  return result;
}

uint64_t sub_21F0C5DFC(uint64_t a1, uint64_t a2)
{
  return a2;
}

unint64_t sub_21F0C5E58()
{
  unint64_t result = qword_267EBB520;
  if (!qword_267EBB520)
  {
    sub_21F0C9248();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EBB520);
  }
  return result;
}

unint64_t sub_21F0C5EB0()
{
  unint64_t result = qword_267EBB530;
  if (!qword_267EBB530)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267EBB158);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267EBB530);
  }
  return result;
}

void sub_21F0C5F14(unint64_t a1)
{
  uint64_t v3 = v1;
  unint64_t v4 = a1;
  uint64_t v89 = *MEMORY[0x263EF8340];
  if ((v3[56] & 1) == 0)
  {
    double v5 = *((double *)v3 + 6);
    CMTimeEpoch v6 = *(void *)(a1 + OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_time + 16);
    time.CMTimeValue value = *(void *)(a1 + OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_time);
    *(void *)&time.timescale = *(void *)(a1 + OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_time + 8);
    time.CMTimeEpoch epoch = v6;
    if (v5 == CMTimeGetSeconds(&time))
    {
      sub_21F0B1328(0xD00000000000002DLL, 0x800000021F0CFBA0, 0, -8, 0);
      swift_willThrow();
      return;
    }
  }
  uint64_t v7 = (unint64_t *)(v4 + OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_faces);
  swift_beginAccess();
  if (*v7 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v76 = sub_21F0C9488();
    swift_bridgeObjectRelease();
    if (v76) {
      goto LABEL_6;
    }
  }
  else if (*(void *)((*v7 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_6;
  }
  sub_21F0B72E0();
  if (v2) {
    return;
  }
LABEL_6:
  uint64_t v8 = sub_21F0B7860();
  if (v2) {
    return;
  }
  int64_t v9 = v8;
  uint64_t Strong = swift_weakLoadStrong();
  if (!Strong || (uint64_t v11 = *(void *)(Strong + 16), swift_retain(), swift_release(), !v11))
  {
    sub_21F0B1328(0xD000000000000036, 0x800000021F0CFB60, 0, -9, 0);
    swift_willThrow();

    return;
  }
  type metadata accessor for PADFacePoseModelInput();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v9;
  id v13 = objc_allocWithZone(MEMORY[0x263F00DC8]);
  uint64_t v84 = v9;
  id v14 = objc_msgSend(v13, sel_init);
  uint64_t v15 = *(void **)(v11 + 16);
  v87.CMTimeValue value = 0;
  id v16 = objc_msgSend(v15, sel_predictionFromFeatures_options_error_, v12, v14, &v87);
  float v17 = *(float *)&v11;
  CMTimeValue value = (void *)v87.value;
  if (!v16)
  {
    id v41 = (id)v87.value;
    sub_21F0C8E78();

    swift_willThrow();
    swift_release();
    swift_release();

    return;
  }
  uint64_t v19 = v16;
  float v80 = v17;
  type metadata accessor for PADFacePoseModelOutput();
  *(void *)(swift_initStackObject() + 16) = v19;
  id v20 = value;
  swift_release();

  unint64_t v21 = (void *)sub_21F0C9048();
  id v22 = objc_msgSend(v19, sel_featureValueForName_, v21);

  if (!v22)
  {
    __break(1u);
    goto LABEL_70;
  }
  id v23 = objc_msgSend(v22, sel_multiArrayValue);

  if (!v23)
  {
LABEL_70:
    __break(1u);
    goto LABEL_71;
  }
  id v24 = objc_msgSend(v23, sel_numberArray);

  unint64_t v25 = sub_21F093AE0();
  uint64_t v26 = sub_21F0C9128();

  int64_t v27 = (void *)sub_21F0C9048();
  id v28 = objc_msgSend(v19, sel_featureValueForName_, v27);

  if (!v28)
  {
LABEL_71:
    __break(1u);
    goto LABEL_72;
  }
  id v29 = objc_msgSend(v28, sel_multiArrayValue);

  if (!v29)
  {
LABEL_72:
    __break(1u);
    goto LABEL_73;
  }
  id v30 = objc_msgSend(v29, sel_numberArray);

  uint64_t v79 = sub_21F0C9128();
  uint64_t v31 = (void *)sub_21F0C9048();
  id v32 = objc_msgSend(v19, sel_featureValueForName_, v31);

  if (!v32)
  {
LABEL_73:
    __break(1u);
    goto LABEL_74;
  }
  id v33 = objc_msgSend(v32, sel_multiArrayValue);

  if (!v33)
  {
LABEL_74:
    __break(1u);
    return;
  }
  id v34 = objc_msgSend(v33, sel_numberArray);

  uint64_t v35 = sub_21F0C9128();
  unint64_t v36 = v26 & 0xC000000000000001;
  if ((v26 & 0xC000000000000001) != 0)
  {
    id v37 = (id)MEMORY[0x223C42390](0, v26);
  }
  else
  {
    if (!*(void *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
LABEL_51:
      id v47 = (id)MEMORY[0x223C42390](1, v26);
      goto LABEL_32;
    }
    id v37 = *(id *)(v26 + 32);
  }
  uint64_t v38 = v37;
  unint64_t v25 = 0x264501000uLL;
  objc_msgSend(v37, sel_floatValue);
  float v82 = v39;

  if (v36)
  {
    id v40 = (id)MEMORY[0x223C42390](1, v26);
  }
  else
  {
    if (*(void *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x10) < 2uLL)
    {
LABEL_67:
      __break(1u);
LABEL_68:
      __break(1u);
    }
    id v40 = *(id *)(v26 + 40);
  }
  uint64_t v42 = v40;
  objc_msgSend(v40, sel_floatValue);
  float v81 = v43;

  if (v36)
  {
    id v44 = (id)MEMORY[0x223C42390](2, v26);
  }
  else
  {
    if (*(void *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x10) < 3uLL) {
      goto LABEL_68;
    }
    id v44 = *(id *)(v26 + 48);
  }
  uint64_t v45 = v44;
  swift_bridgeObjectRelease();
  objc_msgSend(v45, sel_floatValue);
  float v80 = v46;

  uint64_t v26 = v79;
  if ((v79 & 0xC000000000000001) != 0) {
    goto LABEL_51;
  }
  if (*(void *)((v79 & 0xFFFFFFFFFFFFFF8) + 0x10) < 2uLL)
  {
    __break(1u);
    goto LABEL_53;
  }
  id v47 = *(id *)(v79 + 40);
LABEL_32:
  id v48 = v47;
  swift_bridgeObjectRelease();
  [v48 *(SEL *)(v25 + 4088)];
  LODWORD(v79) = v49;

  if ((v35 & 0xC000000000000001) != 0)
  {
LABEL_53:
    id v50 = (id)MEMORY[0x223C42390](0, v35);
    goto LABEL_35;
  }
  if (!*(void *)((v35 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    goto LABEL_55;
  }
  id v50 = *(id *)(v35 + 32);
LABEL_35:
  unint64_t v51 = v50;
  swift_bridgeObjectRelease();
  [v51 *(SEL *)(v25 + 4088)];
  unsigned int v53 = v52;

  uint64_t v26 = v4 + OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_time;
  CMTimeEpoch v54 = *(void *)(v4 + OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_time + 16);
  v87.CMTimeValue value = *(void *)(v4 + OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_time);
  *(void *)&v87.timescale = *(void *)(v4 + OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_time + 8);
  v87.CMTimeEpoch epoch = v54;
  Float64 Seconds = CMTimeGetSeconds(&v87);
  v56.i64[0] = LODWORD(v82);
  v56.i64[1] = LODWORD(v80);
  *(int8x16_t *)(v3 + 24) = vorrq_s8((int8x16_t)vshll_n_s32((int32x2_t)__PAIR64__(v79, LODWORD(v81)), 0x20uLL), v56);
  *((void *)v3 + 5) = v53;
  *((Float64 *)v3 + 6) = Seconds;
  v3[56] = 0;
  unint64_t v57 = (objc_class *)type metadata accessor for PADSWPose();
  uint64_t v58 = (char *)objc_allocWithZone(v57);
  *(double *)&v58[OBJC_IVAR____TtC10CoreIDVPAD9PADSWPose_pitch] = v80;
  *(double *)&v58[OBJC_IVAR____TtC10CoreIDVPAD9PADSWPose_yaw] = v81;
  *(double *)&v58[OBJC_IVAR____TtC10CoreIDVPAD9PADSWPose_roll] = v82;
  v86.receiver = v58;
  v86.super_class = v57;
  uint64_t v35 = (uint64_t)&selRef_framesFromVideoURL_timestamps_size_error_;
  uint64_t v3 = (char *)objc_msgSendSuper2(&v86, sel_init);
  unint64_t v4 = *v7;
  if (!(*v7 >> 62))
  {
    uint64_t v59 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    float v60 = v84;
    if (v59) {
      goto LABEL_37;
    }
LABEL_56:
    swift_bridgeObjectRelease();
    goto LABEL_57;
  }
LABEL_55:
  swift_bridgeObjectRetain();
  float v60 = v84;
  if (!sub_21F0C9488()) {
    goto LABEL_56;
  }
LABEL_37:
  if ((v4 & 0xC000000000000001) != 0)
  {
    unint64_t v61 = (char *)MEMORY[0x223C42390](0, v4);
  }
  else
  {
    if (!*(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
LABEL_66:
      __break(1u);
      goto LABEL_67;
    }
    unint64_t v61 = (char *)*(id *)(v4 + 32);
  }
  unint64_t v62 = v61;
  swift_bridgeObjectRelease();
  long long v83 = *(_OWORD *)&v62[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds];
  uint64_t v63 = *(void *)&v62[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds + 16];
  uint64_t v64 = *(void *)&v62[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds + 24];
  id v65 = (objc_class *)type metadata accessor for PADSWFace();
  uint64_t v66 = (char *)objc_allocWithZone(v65);
  int64_t v67 = &v66[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds];
  *(_OWORD *)int64_t v67 = v83;
  *((void *)v67 + 2) = v63;
  *((void *)v67 + 3) = v64;
  *(void *)&v66[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_pose] = v3;
  v85.receiver = v66;
  v85.super_class = v65;
  unint64_t v68 = *(const char **)(v35 + 824);
  unint64_t v69 = v3;
  id v70 = objc_msgSendSuper2(&v85, v68);
  swift_beginAccess();
  unint64_t v71 = *v7;
  id v72 = v70;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v7 = v71;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v71 & 0x8000000000000000) != 0
    || (v71 & 0x4000000000000000) != 0)
  {
    sub_21F0C69F8(v71);
    unint64_t v71 = v74;
    *uint64_t v7 = v74;
  }
  if (!*(void *)((v71 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_66;
  }
  unint64_t v75 = *(void **)((v71 & 0xFFFFFFFFFFFFFF8) + 0x20);
  *(void *)((v71 & 0xFFFFFFFFFFFFFF8) + 0x2sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = v72;

  sub_21F0C9148();
  swift_endAccess();

  float v60 = v84;
LABEL_57:
  if (qword_267EBABA8 != -1) {
    swift_once();
  }
  if (qword_267EBAF00)
  {
    v87.CMTimeValue value = *(void *)v26;
    uint64_t v77 = sub_21F0C95B8();
    sub_21F09B204((uint64_t)v60, v77, v78, v3);
    swift_release();

    swift_bridgeObjectRelease();
  }
  else
  {
    swift_release();
  }
  swift_release();
}

uint64_t sub_21F0C689C()
{
  if (*(unsigned char *)(v0 + 56)) {
    return 0;
  }
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v4 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v5 = *(void *)(v0 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267EBB4C8);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_21F0CBD60;
  *(void *)(v1 + 56) = &type metadata for PADFacePoseObservation;
  uint64_t v6 = swift_allocObject();
  *(void *)(v1 + 32) = v6;
  *(void *)(v6 + 16) = v5;
  *(void *)(v6 + 24) = v4;
  *(_DWORD *)(v6 + 32) = v3;
  *(void *)(v6 + 4sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = v2;
  return v1;
}

uint64_t sub_21F0C6954()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0228](v0, 57, 7);
}

uint64_t type metadata accessor for PADFacePoseRequest()
{
  return self;
}

ValueMetadata *type metadata accessor for PADFacePoseObservation()
{
  return &type metadata for PADFacePoseObservation;
}

uint64_t sub_21F0C69C0()
{
  return MEMORY[0x270FA0238](v0, 48, 7);
}

void *sub_21F0C69D0(void *a1)
{
  return sub_21F09CCA4(0, a1[2], 0, a1);
}

void *sub_21F0C69E4(void *a1)
{
  return sub_21F09CDD4(0, a1[2], 0, a1);
}

void sub_21F0C69F8(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_21F0C9488();
    swift_bridgeObjectRelease();
  }
  JUMPOUT(0x223C423A0);
}

void sub_21F0C6A74(uint64_t a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = (uint64_t *)(a1 + OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_faces);
  swift_beginAccess();
  if ((unint64_t)*v5 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_21F0C9488();
    swift_bridgeObjectRelease();
    if (v13) {
      goto LABEL_3;
    }
  }
  else if (*(void *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  sub_21F0B72E0();
  if (v2) {
    return;
  }
LABEL_3:
  if (!((unint64_t)*v5 >> 62))
  {
    if (*(void *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x10) == 1) {
      goto LABEL_5;
    }
LABEL_17:
    sub_21F0C93B8();
    sub_21F0C90C8();
    if ((unint64_t)*v5 >> 62)
    {
      swift_bridgeObjectRetain();
      sub_21F0C9488();
      swift_bridgeObjectRelease();
    }
    sub_21F0C95B8();
    sub_21F0C90C8();
    swift_bridgeObjectRelease();
    sub_21F0B1328(0, 0xE000000000000000, 0, -6, 0);
    swift_bridgeObjectRelease();
    goto LABEL_20;
  }
  swift_bridgeObjectRetain();
  uint64_t v14 = sub_21F0C9488();
  swift_bridgeObjectRelease();
  if (v14 != 1) {
    goto LABEL_17;
  }
LABEL_5:
  if (!sub_21F0C6D9C())
  {
    sub_21F0B1328(0xD000000000000042, 0x800000021F0CFC40, 0, -6, 0);
LABEL_20:
    swift_willThrow();
    return;
  }
  float v6 = sub_21F0C702C(a1);
  if (v2) {
    return;
  }
  float v7 = v6;
  uint64_t v8 = *v5;
  if ((unint64_t)*v5 >> 62)
  {
    swift_bridgeObjectRetain();
    if (sub_21F0C9488()) {
      goto LABEL_9;
    }
LABEL_23:
    swift_bridgeObjectRelease();
    uint64_t v11 = 0;
    goto LABEL_24;
  }
  uint64_t v9 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v9) {
    goto LABEL_23;
  }
LABEL_9:
  if ((v8 & 0xC000000000000001) != 0)
  {
    uint64_t v17 = MEMORY[0x223C42390](0, v8);
    swift_bridgeObjectRelease();
    uint64_t v11 = *(void **)(v17 + OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_pose);
    id v18 = v11;
    swift_unknownObjectRelease();
    goto LABEL_24;
  }
  if (*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    uint64_t v10 = (char *)*(id *)(v8 + 32);
    swift_bridgeObjectRelease();
    uint64_t v11 = *(void **)&v10[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_pose];
    id v12 = v11;

LABEL_24:
    uint64_t v15 = *(void *)(v3 + 24);
    uint64_t v16 = *(void *)(v3 + 32);
    *(void *)(v3 + 24) = LODWORD(v7);
    *(void *)(v3 + 32) = v11;
    sub_21F0C77F4(v15, v16);
    return;
  }
  __break(1u);
}

BOOL sub_21F0C6D9C()
{
  uint64_t v2 = (unint64_t *)(v0 + OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_faces);
  swift_beginAccess();
  unint64_t v3 = *v2;
  if (!(*v2 >> 62))
  {
    uint64_t v4 = *(char **)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v4) {
      goto LABEL_3;
    }
LABEL_16:
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_bridgeObjectRetain();
  uint64_t v4 = (char *)sub_21F0C9488();
  if (!v4) {
    goto LABEL_16;
  }
LABEL_3:
  if ((v3 & 0xC000000000000001) != 0)
  {
    uint64_t v5 = (char *)MEMORY[0x223C42390](0, v3);
  }
  else
  {
    if (!*(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
LABEL_19:
      uint64_t v11 = v1;
      swift_bridgeObjectRetain();
      uint64_t v12 = sub_21F0C9488();
      swift_bridgeObjectRelease();
      if (v12 == 1) {
        goto LABEL_9;
      }
      goto LABEL_20;
    }
    uint64_t v5 = (char *)*(id *)(v3 + 32);
  }
  uint64_t v4 = v5;
  swift_bridgeObjectRelease();
  uint64_t v1 = *(char **)&v4[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_pose];
  if (!v1)
  {

    return 0;
  }
  unint64_t v6 = *v2;
  if (v6 >> 62) {
    goto LABEL_19;
  }
  uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v8 = v1;
  if (v7 != 1)
  {
LABEL_20:

    return 0;
  }
LABEL_9:
  if (fabs(*(double *)&v1[OBJC_IVAR____TtC10CoreIDVPAD9PADSWPose_pitch]) <= 15.0
    || fabs(*(double *)&v1[OBJC_IVAR____TtC10CoreIDVPAD9PADSWPose_roll]) <= 15.0
    || fabs(*(double *)&v1[OBJC_IVAR____TtC10CoreIDVPAD9PADSWPose_yaw]) <= 15.0)
  {

    return 1;
  }
  else
  {
    double Height = CGRectGetHeight(*(CGRect *)&v4[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds]);

    return Height > 0.15;
  }
}

uint64_t sub_21F0C6FA8()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = *(void **)(v0 + 32);
  if (v2 == (void *)1)
  {
    uint64_t v3 = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267EBB4C8);
    uint64_t v3 = swift_allocObject();
    *(_OWORD *)(v3 + 16) = xmmword_21F0CBD60;
    *(void *)(v3 + 56) = &type metadata for PADPrintReplayObservation;
    *(_DWORD *)(v3 + 32) = v1;
    *(void *)(v3 + 4sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CEB90, 0, 0, 0) = v2;
  }
  sub_21F0C7804(v1, v2);
  return v3;
}

float sub_21F0C702C(uint64_t a1)
{
  uint64_t v6 = v1;
  v45[4] = *(id *)MEMORY[0x263EF8340];
  uint64_t Strong = swift_weakLoadStrong();
  if (!Strong || (uint64_t v9 = *(void *)(Strong + 24), swift_retain(), swift_release(), !v9))
  {
    sub_21F0B1328(0xD000000000000019, 0x800000021F0CFC90, 0, -9, 0);
    swift_willThrow();
    return *(float *)&v5;
  }
  uint64_t v10 = (id **)(a1 + OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_faces);
  swift_beginAccess();
  uint64_t v11 = *v10;
  if (!((unint64_t)*v10 >> 62))
  {
    uint64_t v12 = *(void *)(((unint64_t)v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v12) {
      goto LABEL_5;
    }
LABEL_25:
    swift_bridgeObjectRelease();
    sub_21F0B1328(0xD000000000000035, 0x800000021F0CFD60, 0, -6, 0);
    swift_willThrow();
    goto LABEL_26;
  }
  swift_bridgeObjectRetain();
  if (!sub_21F0C9488()) {
    goto LABEL_25;
  }
LABEL_5:
  if (((unint64_t)v11 & 0xC000000000000001) != 0)
  {
    uint64_t v13 = (char *)MEMORY[0x223C42390](0, v11);
  }
  else
  {
    if (!*(void *)(((unint64_t)v11 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
LABEL_30:
      swift_once();
      goto LABEL_13;
    }
    uint64_t v13 = (char *)v11[4];
  }
  uint64_t v2 = v13;
  swift_bridgeObjectRelease();
  CGFloat v14 = *(double *)&v2[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds];
  CGFloat v15 = *(double *)&v2[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds + 8];
  CGFloat v16 = *(double *)&v2[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds + 16];
  CGFloat v17 = *(double *)&v2[OBJC_IVAR____TtC10CoreIDVPAD9PADSWFace_bounds + 24];
  v46.origin.double x = v14;
  v46.origin.double y = v15;
  v46.size.double width = v16;
  v46.size.double height = v17;
  CGFloat v18 = CGRectGetWidth(v46) * -0.544375 * 0.5;
  v47.origin.double x = v14;
  v47.origin.double y = v15;
  v47.size.double width = v16;
  v47.size.double height = v17;
  CGFloat v19 = CGRectGetHeight(v47) * -0.544375 * 0.5;
  v48.origin.double x = v14;
  v48.origin.double y = v15;
  v48.size.double width = v16;
  v48.size.double height = v17;
  CGRect v49 = CGRectInset(v48, v18, v19);
  double x = v49.origin.x;
  double y = v49.origin.y;
  double width = v49.size.width;
  double height = v49.size.height;
  v49.origin.double x = 0.0;
  v49.origin.double y = 0.0;
  v49.size.double width = 1.0;
  v49.size.double height = 1.0;
  v54.origin.double x = x;
  v54.origin.double y = y;
  v54.size.double width = width;
  v54.size.double height = height;
  if (!CGRectContainsRect(v49, v54))
  {
    v50.origin.double x = 0.0;
    v50.origin.double y = 0.0;
    v50.size.double width = 1.0;
    v50.size.double height = 1.0;
    v55.origin.double x = x;
    v55.origin.double y = y;
    v55.size.double width = width;
    v55.size.double height = height;
    CGRect v51 = CGRectIntersection(v50, v55);
    double x = v51.origin.x;
    double y = v51.origin.y;
    double width = v51.size.width;
    double height = v51.size.height;
  }
  uint64_t v24 = OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_buffer;
  int64_t v25 = CVPixelBufferGetWidth(*(CVPixelBufferRef *)(a1 + OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_buffer));
  CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1 + v24));
  CVPixelBufferGetWidth(*(CVPixelBufferRef *)(a1 + v24));
  int64_t v26 = CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1 + v24));
  v52.origin.double x = x * (double)v25;
  v52.size.double width = width * (double)v25;
  v52.origin.double y = y * (double)v26;
  v52.size.double height = height * (double)v26;
  CGRect v53 = CGRectIntegral(v52);
  CGFloat v5 = v53.origin.x;
  double v27 = v53.origin.y;
  double v28 = v53.size.width;
  double v29 = v53.size.height;
  id v30 = (id *)objc_msgSend(objc_allocWithZone(MEMORY[0x263F1EF38]), sel_initWithCVPixelBuffer_orientation_options_, *(void *)(a1 + v24), *(unsigned int *)(a1 + OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_orientation), 0);
  if (!v30)
  {
    sub_21F0B1328(0xD00000000000003BLL, 0x800000021F0CFCB0, 0, -6, 0);
    swift_willThrow();

LABEL_26:
    swift_release();
    return *(float *)&v5;
  }
  uint64_t v11 = v30;
  uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(*(CVPixelBufferRef *)(a1 + v24));
  v45[0] = 0;
  id v32 = (void (*)(char *, uint64_t))objc_msgSend(v11, sel_cropAndScaleBufferWithWidth_height_cropRect_format_imageCropAndScaleOption_options_error_calculatedNormalizedOriginOffset_calculatedScaleX_calculatedScaleY_pixelBufferRepsCacheKey_, 224, 224, PixelFormatType, 2, 0, v45, v5, v27, v28, v29, 0, 0, 0, 0);
  id v33 = v45[0];
  if (!v32)
  {
    id v43 = v45[0];
    sub_21F0B1328(0xD00000000000002ELL, 0x800000021F0CFCF0, v33, -6, 0);

    swift_willThrow();
LABEL_23:

    swift_release();
    return *(float *)&v5;
  }
  uint64_t v3 = v32;
  uint64_t v34 = qword_267EBABA8;
  id v4 = v45[0];
  if (v34 != -1) {
    goto LABEL_30;
  }
LABEL_13:
  if (qword_267EBAF00)
  {
    v45[0] = *(id *)(a1 + OBJC_IVAR____TtC10CoreIDVPAD10PADSWFrame_time);
    uint64_t v35 = sub_21F0C95B8();
    sub_21F09AB14(v3, v35, v36);
    swift_bridgeObjectRelease();
  }
  sub_21F0ABA0C(v3);
  if (v6) {
    goto LABEL_22;
  }
  if ((v37 & 0x100000000) != 0)
  {
    sub_21F0B1328(0xD00000000000003CLL, 0x800000021F0CFD20, 0, -6, 0);
    swift_willThrow();
LABEL_22:

    goto LABEL_23;
  }
  *(float *)&CGFloat v5 = 1.0 - *(float *)&v37;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267EBB3F0);
  uint64_t v38 = swift_allocObject();
  uint64_t v39 = MEMORY[0x263F8D5C8];
  *(_OWORD *)(v38 + 16) = xmmword_21F0CBD60;
  uint64_t v40 = MEMORY[0x263F8D648];
  *(void *)(v38 + 56) = v39;
  *(void *)(v38 + 64) = v40;
  *(_DWORD *)(v38 + 32) = LODWORD(v5);
  uint64_t v41 = sub_21F0C9088();
  sub_21F08B394(v41, v42);

  swift_bridgeObjectRelease();
  swift_release();

  return *(float *)&v5;
}

uint64_t sub_21F0C7618()
{
  return sub_21F0C77F4(*(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_21F0C7620()
{
  swift_weakDestroy();
  sub_21F0C77F4(*(void *)(v0 + 24), *(void *)(v0 + 32));
  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t type metadata accessor for PADPrintReplayRequest()
{
  return self;
}

uint64_t initializeBufferWithCopyOfBuffer for PADPrintReplayObservation(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v3 = *(void **)(a2 + 8);
  *(void *)(a1 + 8) = v3;
  id v4 = v3;
  return a1;
}

uint64_t assignWithCopy for PADPrintReplayObservation(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v3 = *(void **)(a1 + 8);
  id v4 = *(void **)(a2 + 8);
  *(void *)(a1 + 8) = v4;
  id v5 = v4;

  return a1;
}

uint64_t assignWithTake for PADPrintReplayObservation(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v3 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);

  return a1;
}

uint64_t getEnumTagSinglePayload for PADPrintReplayObservation(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for PADPrintReplayObservation(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)unint64_t result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PADPrintReplayObservation()
{
  return &type metadata for PADPrintReplayObservation;
}

uint64_t sub_21F0C77F4(uint64_t a1, uint64_t a2)
{
  if (a2 != 1) {
    return MEMORY[0x270F9A758]();
  }
  return result;
}

id sub_21F0C7804(uint64_t a1, void *a2)
{
  if (a2 != (void *)1) {
    return a2;
  }
  return result;
}

void sub_21F0C7818()
{
  uint64_t v1 = *(void **)(v0 + 40);
}

uint64_t sub_21F0C7848()
{
  return MEMORY[0x270FA0228](v0, 48, 7);
}

uint64_t type metadata accessor for PADSerialAVAssetReader()
{
  return self;
}

uint64_t type metadata accessor for PADFacePoseModelInput()
{
  return self;
}

uint64_t sub_21F0C7B8C()
{
  swift_unknownObjectRelease();
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t type metadata accessor for PADFacePoseModelOutput()
{
  return self;
}

uint64_t sub_21F0C7BE8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_21F0C8F08();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  id v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EBAF10);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v10 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v11 = (void *)sub_21F0C9048();
  uint64_t v12 = (void *)sub_21F0C9048();
  id v13 = objc_msgSend(v10, sel_URLForResource_withExtension_, v11, v12);

  if (v13)
  {
    sub_21F0C8ED8();

    CGFloat v14 = *(void (**)(char *, char *, uint64_t))(v3 + 32);
    v14(v8, v5, v2);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v3 + 56))(v8, 0, 1, v2);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2);
    if (result != 1)
    {

      return ((uint64_t (*)(uint64_t, char *, uint64_t))v14)(a1, v8, v2);
    }
  }
  else
  {
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v8, 1, 1, v2);
  }
  __break(1u);
  return result;
}

uint64_t sub_21F0C7E48()
{
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t type metadata accessor for PADFacePoseModel()
{
  return self;
}

uint64_t type metadata accessor for PADPrintReplayS2ModelInput()
{
  return self;
}

uint64_t type metadata accessor for PADPrintReplayS2ModelOutput()
{
  return self;
}

uint64_t sub_21F0C81E0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_21F0C8F08();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  id v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EBAF10);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v10 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v11 = (void *)sub_21F0C9048();
  uint64_t v12 = (void *)sub_21F0C9048();
  id v13 = objc_msgSend(v10, sel_URLForResource_withExtension_, v11, v12);

  if (v13)
  {
    sub_21F0C8ED8();

    CGFloat v14 = *(void (**)(char *, char *, uint64_t))(v3 + 32);
    v14(v8, v5, v2);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v3 + 56))(v8, 0, 1, v2);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2);
    if (result != 1)
    {

      return ((uint64_t (*)(uint64_t, char *, uint64_t))v14)(a1, v8, v2);
    }
  }
  else
  {
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v8, 1, 1, v2);
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for PADPrintReplayS2Model()
{
  return self;
}

uint64_t sub_21F0C8464(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267EBB540);
    uint64_t v3 = sub_21F0C93A8();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v25 = a1 + 32;
    while (1)
    {
      uint64_t v6 = (uint64_t *)(v25 + 16 * v4);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      sub_21F0C9628();
      swift_bridgeObjectRetain();
      sub_21F0C90B8();
      uint64_t result = sub_21F0C9648();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = result & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = *(void *)(v3 + 48);
        uint64_t v16 = (void *)(v15 + 16 * v11);
        BOOL v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (uint64_t result = sub_21F0C95D8(), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        uint64_t v18 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v18;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0) {
            break;
          }
          CGFloat v19 = (void *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            uint64_t result = sub_21F0C95D8();
            if ((result & 1) == 0) {
              continue;
            }
          }
          goto LABEL_3;
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      unint64_t v21 = (void *)(*(void *)(v3 + 48) + 16 * v11);
      void *v21 = v8;
      v21[1] = v7;
      uint64_t v22 = *(void *)(v3 + 16);
      BOOL v23 = __OFADD__(v22, 1);
      uint64_t v24 = v22 + 1;
      if (v23)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v24;
LABEL_4:
      if (++v4 == v1) {
        return v3;
      }
    }
  }
  return MEMORY[0x263F8EE88];
}

void LivenessActionFromGesture(uint64_t *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_fault_impl(&dword_21F07C000, a2, OS_LOG_TYPE_FAULT, "Invalid gesture %i.", (uint8_t *)v3, 8u);
}

void PADVNFaceprintInit(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ___ZL25LivenessActionFromGesture18PADLivenessGesture_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_fault_impl(&dword_21F07C000, a2, OS_LOG_TYPE_FAULT, "Invalid gesture %i.", (uint8_t *)v3, 8u);
}

void std::vector<std::vector<std::vector<float>>>::vector(void ***a1, void **a2, void **a3)
{
  uint64_t v5 = *a1;
  uint64_t v6 = a2;
  if (v5 != a2)
  {
    do
    {
      uint64_t v8 = v5;
      uint64_t v10 = (char *)*(v5 - 3);
      v5 -= 3;
      uint64_t v9 = v10;
      if (v10)
      {
        unint64_t v11 = (char *)*(v8 - 2);
        unint64_t v12 = v9;
        if (v11 != v9)
        {
          do
          {
            uint64_t v14 = v11 - 24;
            uint64_t v13 = (void *)*((void *)v11 - 3);
            if (v13)
            {
              *((void *)v11 - 2) = v13;
              operator delete(v13);
            }
            unint64_t v11 = v14;
          }
          while (v14 != v9);
          unint64_t v12 = *v5;
        }
        *(v8 - 2) = v9;
        operator delete(v12);
      }
    }
    while (v5 != a2);
    uint64_t v6 = *a3;
  }
  *a1 = a2;
  operator delete(v6);
}

void std::vector<std::vector<float>>::vector(void **a1, char *a2, void **a3)
{
  uint64_t v5 = (char *)*a1;
  uint64_t v6 = a2;
  if (v5 != a2)
  {
    uint64_t v8 = v5;
    do
    {
      uint64_t v10 = (void *)*((void *)v8 - 3);
      v8 -= 24;
      uint64_t v9 = v10;
      if (v10)
      {
        *((void *)v5 - 2) = v9;
        operator delete(v9);
      }
      uint64_t v5 = v8;
    }
    while (v8 != a2);
    uint64_t v6 = *a3;
  }
  *a1 = a2;
  operator delete(v6);
}

void PADVNFaceprintInit_cold_1(os_log_t log)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 67109120;
  v1[1] = 0;
  _os_log_error_impl(&dword_21F07C000, log, OS_LOG_TYPE_ERROR, "The reported faceprint has invalid dimensions %d.", (uint8_t *)v1, 8u);
}

void VNCreateFaceprintRequestInit_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21F07C000, a2, OS_LOG_TYPE_ERROR, "FaceprintRequest update failed (%{public}@).", (uint8_t *)&v2, 0xCu);
}

uint64_t sub_21F0C8DA8()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_21F0C8DB8()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_21F0C8DC8()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_21F0C8DD8()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_21F0C8DE8()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_21F0C8DF8()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_21F0C8E08()
{
  return MEMORY[0x270EEF238]();
}

uint64_t sub_21F0C8E18()
{
  return MEMORY[0x270EEF250]();
}

uint64_t sub_21F0C8E28()
{
  return MEMORY[0x270EEF268]();
}

uint64_t sub_21F0C8E38()
{
  return MEMORY[0x270EEF288]();
}

uint64_t sub_21F0C8E48()
{
  return MEMORY[0x270EEF2A8]();
}

uint64_t sub_21F0C8E58()
{
  return MEMORY[0x270EEF2B8]();
}

uint64_t sub_21F0C8E68()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_21F0C8E78()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_21F0C8E88()
{
  return MEMORY[0x270EEFA08]();
}

uint64_t sub_21F0C8E98()
{
  return MEMORY[0x270EEFA18]();
}

uint64_t sub_21F0C8EA8()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_21F0C8EB8()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_21F0C8EC8()
{
  return MEMORY[0x270EEFD78]();
}

uint64_t sub_21F0C8ED8()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_21F0C8EE8()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_21F0C8EF8()
{
  return MEMORY[0x270EEFF58]();
}

uint64_t sub_21F0C8F08()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_21F0C8F18()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_21F0C8F28()
{
  return MEMORY[0x270EF0048]();
}

uint64_t sub_21F0C8F38()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_21F0C8F48()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_21F0C8F58()
{
  return MEMORY[0x270EF01C0]();
}

uint64_t sub_21F0C8F68()
{
  return MEMORY[0x270EF0238]();
}

uint64_t sub_21F0C8F78()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t sub_21F0C8F88()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_21F0C8F98()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_21F0C8FA8()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_21F0C8FB8()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_21F0C8FC8()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_21F0C8FD8()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_21F0C8FE8()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_21F0C8FF8()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_21F0C9008()
{
  return MEMORY[0x270FA0728]();
}

uint64_t sub_21F0C9018()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_21F0C9028()
{
  return MEMORY[0x270EF1830]();
}

uint64_t sub_21F0C9038()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_21F0C9048()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_21F0C9058()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_21F0C9068()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_21F0C9078()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_21F0C9088()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_21F0C9098()
{
  return MEMORY[0x270EF1B18]();
}

uint64_t sub_21F0C90A8()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_21F0C90B8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_21F0C90C8()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_21F0C90D8()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_21F0C90E8()
{
  return MEMORY[0x270F9DA98]();
}

uint64_t sub_21F0C90F8()
{
  return MEMORY[0x270F9DB18]();
}

uint64_t sub_21F0C9108()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_21F0C9118()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_21F0C9128()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_21F0C9138()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_21F0C9148()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_21F0C9158()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_21F0C9168()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_21F0C9178()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_21F0C9188()
{
  return MEMORY[0x270EF1BD8]();
}

uint64_t sub_21F0C9198()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_21F0C91A8()
{
  return MEMORY[0x270FA1EC0]();
}

uint64_t sub_21F0C91B8()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_21F0C91C8()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_21F0C91D8()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_21F0C91E8()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_21F0C91F8()
{
  return MEMORY[0x270EF1CE0]();
}

uint64_t sub_21F0C9208()
{
  return MEMORY[0x270EF1DE8]();
}

uint64_t sub_21F0C9218()
{
  return MEMORY[0x270EF1E08]();
}

uint64_t sub_21F0C9228()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_21F0C9238()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_21F0C9248()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_21F0C9258()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_21F0C9268()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_21F0C9278()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_21F0C9288()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_21F0C9298()
{
  return MEMORY[0x270FA0F10]();
}

uint64_t sub_21F0C92A8()
{
  return MEMORY[0x270FA0F28]();
}

uint64_t sub_21F0C92B8()
{
  return MEMORY[0x270F06970]();
}

uint64_t sub_21F0C92C8()
{
  return MEMORY[0x270FA0840]();
}

uint64_t sub_21F0C92D8()
{
  return MEMORY[0x270FA0858]();
}

uint64_t sub_21F0C92F8()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_21F0C9308()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_21F0C9318()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_21F0C9328()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_21F0C9338()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_21F0C9348()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_21F0C9358()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_21F0C9368()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_21F0C9378()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_21F0C9388()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_21F0C9398()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_21F0C93A8()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_21F0C93B8()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_21F0C93C8()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_21F0C93D8()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_21F0C93E8()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_21F0C93F8()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_21F0C9408()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_21F0C9418()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_21F0C9428()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_21F0C9438()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_21F0C9448()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_21F0C9458()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_21F0C9468()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_21F0C9478()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_21F0C9488()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_21F0C9498()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_21F0C94A8()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_21F0C94B8()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_21F0C94C8()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_21F0C94E8()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_21F0C94F8()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_21F0C9508()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_21F0C9518()
{
  return MEMORY[0x270F9F300]();
}

uint64_t sub_21F0C9528()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_21F0C9538()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_21F0C9548()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_21F0C9558()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_21F0C9568()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_21F0C9578()
{
  return MEMORY[0x270F9F440]();
}

uint64_t sub_21F0C9588()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_21F0C9598()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_21F0C95A8()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_21F0C95B8()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_21F0C95C8()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_21F0C95D8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_21F0C95E8()
{
  return MEMORY[0x270F9FA68]();
}

uint64_t sub_21F0C95F8()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_21F0C9608()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_21F0C9618()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_21F0C9628()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_21F0C9638()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_21F0C9648()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_21F0C9658()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_21F0C9668()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

void CFRelease(CFTypeRef cf)
{
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59B0](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x270EE59C0](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59D8](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x270EE59E8](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x270EE59F8](context);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGImageRelease(CGImageRef image)
{
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x270EE7168](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7180]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x270EE7230]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.double height = v4;
  result.size.double width = v3;
  result.origin.double y = v2;
  result.origin.double x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7238]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

CFTypeRef CMGetAttachment(CMAttachmentBearerRef target, CFStringRef key, CMAttachmentMode *attachmentModeOut)
{
  return (CFTypeRef)MEMORY[0x270EE7B30](target, key, attachmentModeOut);
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return (CVImageBufferRef)MEMORY[0x270EE7C48](sbuf);
}

CMTime *__cdecl CMSampleBufferGetPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x270EE7C78](retstr, sbuf);
}

CFDictionaryRef CMTimeCopyAsDictionary(CMTime *time, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x270EE7DE0](time, allocator);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x270EE7E08](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x270EE7E10](retstr, value, *(void *)&timescale);
}

CMTime *__cdecl CMTimeMakeFromDictionary(CMTime *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTime *)MEMORY[0x270EE7E20](retstr, dictionaryRepresentation);
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return (CMTimeRange *)MEMORY[0x270EE7EF8](retstr, start, duration);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA150](allocator, width, height, *(void *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x270EEA190](pixelBuffer);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return (void *)MEMORY[0x270EEA1A0](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1B0](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA1C8](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1E8](pixelBuffer);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA1F8](pixelBuffer, planeIndex);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA218](pixelBuffer);
}

size_t CVPixelBufferGetPlaneCount(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA220](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA240](pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA250](pixelBuffer, planeIndex);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x270EEA260](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x270EEA330](pixelBuffer, unlockFlags);
}

uint64_t MGGetProductType()
{
  return MEMORY[0x270F95FD8]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x270F95FF8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t _AXSAttentionAwarenessFeaturesEnabled()
{
  return MEMORY[0x270F905E0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x270F982E8](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x270F982F8](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

uint64_t std::ostream::put()
{
  return MEMORY[0x270F98740]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x270F98748]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x270F98758]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x270F98760]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x270F987A8]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

void std::terminate(void)
{
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

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x270EDAB30]();
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x270FA0570]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x270FA0630]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x270FA0648]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x270FA0658]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

void vDSP_dotpr(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Length __N)
{
}

void vDSP_normalize(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, float *__Mean, float *__StandardDeviation, vDSP_Length __N)
{
}

vImage_Error vImageBuffer_Init(vImage_Buffer *buf, vImagePixelCount height, vImagePixelCount width, uint32_t pixelBits, vImage_Flags flags)
{
  return MEMORY[0x270EDEF18](buf, height, width, *(void *)&pixelBits, *(void *)&flags);
}

vImage_Error vImageConvert_Planar8toPlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, Pixel_F maxFloat, Pixel_F minFloat, vImage_Flags flags)
{
  return MEMORY[0x270EDF090](src, dest, *(void *)&flags, maxFloat, minFloat);
}

vImage_Error vImageConvert_RGBA8888toRGB888(const vImage_Buffer *a1, const vImage_Buffer *a2, vImage_Flags a3)
{
  return MEMORY[0x270EDF128](a1, a2, *(void *)&a3);
}

vImage_Error vImageScale_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x270EDF328](src, dest, tempBuffer, *(void *)&flags);
}