void sub_237D0F944(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;
  void *v3;

  MEMORY[0x237E2DA50](v2, 0x1091C4021E3608ALL);
  *v3 = 0;

  _Unwind_Resume(a1);
}

void sub_237D0FFE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, uint64_t a19, char a20,int a21,__int16 a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48,uint64_t a49,uint64_t a50,uint64_t a51,char a52)
{
  MEMORY[0x237E2DA50](v53, 0x81C40B8603338);
  void *v52 = 0;

  _Unwind_Resume(a1);
}

void sub_237D10E30(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v6 = va_arg(va1, void);
  v8 = va_arg(va1, void *);
  uint64_t v9 = va_arg(va1, void);
  std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::destroy((uint64_t)va, v8);
  std::unique_ptr<EchoCodeEncoder>::reset[abi:ne180100]((EchoCodeEncoder **)va1, 0);

  _Unwind_Resume(a1);
}

void sub_237D110C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

uint64_t (**std::any::reset[abi:ne180100](uint64_t (**result)(void, void, void, void, void)))(void, void, void, void, void)
{
  if (*result) {
    return (uint64_t (**)(void, void, void, void, void))(*result)(0, result, 0, 0, 0);
  }
  return result;
}

void std::vector<unsigned char>::__append(void *a1, unint64_t a2, unsigned char *a3)
{
  unint64_t v4 = a2;
  v7 = (unsigned char *)a1[1];
  uint64_t v6 = a1[2];
  if (v6 - (uint64_t)v7 >= a2)
  {
    if (a2)
    {
      v13 = &v7[a2];
      do
      {
        *v7++ = *a3;
        --v4;
      }
      while (v4);
      v7 = v13;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = &v7[-*a1];
    unint64_t v9 = (unint64_t)&v8[a2];
    if ((uint64_t)&v8[a2] < 0) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v10 = v6 - *a1;
    if (2 * v10 > v9) {
      unint64_t v9 = 2 * v10;
    }
    if (v10 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v11 = v9;
    }
    if (v11) {
      v12 = operator new(v11);
    }
    else {
      v12 = 0;
    }
    v14 = &v8[(void)v12];
    v15 = &v8[(void)v12 + v4];
    v16 = &v8[(void)v12];
    do
    {
      *v16++ = *a3;
      --v4;
    }
    while (v4);
    v17 = (unsigned char *)*a1;
    if (v7 != (unsigned char *)*a1)
    {
      do
      {
        char v18 = *--v7;
        *--v14 = v18;
      }
      while (v7 != v17);
      v7 = (unsigned char *)*a1;
    }
    *a1 = v14;
    a1[1] = v15;
    a1[2] = (char *)v12 + v11;
    if (v7)
    {
      operator delete(v7);
    }
  }
}

void std::vector<unsigned char>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_264CFE378, MEMORY[0x263F8C060]);
}

void sub_237D112D8(_Unwind_Exception *a1)
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

EchoCodeDecoder *std::unique_ptr<EchoCodeDecoder>::reset[abi:ne180100](EchoCodeDecoder **a1, EchoCodeDecoder *a2)
{
  result = *a1;
  *a1 = a2;
  if (result)
  {
    EchoCodeDecoder::~EchoCodeDecoder(result);
    JUMPOUT(0x237E2DA50);
  }
  return result;
}

void EchoCodeDecoder::~EchoCodeDecoder(EchoCodeDecoder *this)
{
  v2 = (void *)*((void *)this + 35);
  if (v2)
  {
    *((void *)this + 36) = v2;
    operator delete(v2);
  }
  v3 = (void *)*((void *)this + 32);
  if (v3)
  {
    *((void *)this + 33) = v3;
    operator delete(v3);
  }
  unint64_t v4 = (void *)*((void *)this + 29);
  if (v4)
  {
    *((void *)this + 30) = v4;
    operator delete(v4);
  }
  v5 = (void *)*((void *)this + 26);
  if (v5)
  {
    *((void *)this + 27) = v5;
    operator delete(v5);
  }
  uint64_t v6 = (void *)*((void *)this + 23);
  if (v6)
  {
    *((void *)this + 24) = v6;
    operator delete(v6);
  }
  uint64_t v7 = *((void *)this + 22);
  *((void *)this + 22) = 0;
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
  }
  uint64_t v8 = *((void *)this + 21);
  *((void *)this + 21) = 0;
  if (v8) {
    std::default_delete<EchoDetector>::operator()[abi:ne180100]((uint64_t)this + 168, v8);
  }
  uint64_t v9 = *((void *)this + 20);
  *((void *)this + 20) = 0;
  if (v9) {
    std::default_delete<ShapingFilter>::operator()[abi:ne180100]((uint64_t)this + 160, v9);
  }
  unint64_t v10 = (void *)*((void *)this + 16);
  if (v10)
  {
    *((void *)this + 17) = v10;
    operator delete(v10);
  }
  std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::destroy((uint64_t)this + 80, *((void **)this + 11));
}

{
  uint64_t vars8;

  EchoCodeDecoder::~EchoCodeDecoder(this);

  JUMPOUT(0x237E2DA50);
}

void std::default_delete<EchoDetector>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v3 = *(void **)(a2 + 72);
    if (v3)
    {
      *(void *)(a2 + 80) = v3;
      operator delete(v3);
    }
    unint64_t v4 = *(void **)(a2 + 48);
    if (v4)
    {
      *(void *)(a2 + 56) = v4;
      operator delete(v4);
    }
    v5 = *(void **)(a2 + 24);
    if (v5)
    {
      *(void *)(a2 + 32) = v5;
      operator delete(v5);
    }
    std::unique_ptr<OpaqueFFTSetup,applesauce::raii::v1::detail::opaque_deletion_functor<OpaqueFFTSetup*,&(vDSP_destroy_fftsetup)>>::reset[abi:ne180100]((OpaqueFFTSetup **)(a2 + 8), 0);
    JUMPOUT(0x237E2DA50);
  }
}

void std::unique_ptr<OpaqueFFTSetup,applesauce::raii::v1::detail::opaque_deletion_functor<OpaqueFFTSetup*,&(vDSP_destroy_fftsetup)>>::reset[abi:ne180100](OpaqueFFTSetup **a1, OpaqueFFTSetup *a2)
{
  v3 = *a1;
  *a1 = a2;
  if (v3) {
    vDSP_destroy_fftsetup(v3);
  }
}

uint64_t std::default_delete<ShapingFilter>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    std::unique_ptr<vDSP_biquad_SetupStruct,applesauce::raii::v1::detail::opaque_deletion_functor<vDSP_biquad_SetupStruct*,&(vDSP_biquad_DestroySetup)>>::reset[abi:ne180100]((vDSP_biquad_SetupStruct **)(a2 + 32), 0);
    unint64_t v4 = (void **)(a2 + 8);
    std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v4);
    return MEMORY[0x237E2DA50](a2, 0x1020C409A1C8018);
  }
  return result;
}

void std::unique_ptr<vDSP_biquad_SetupStruct,applesauce::raii::v1::detail::opaque_deletion_functor<vDSP_biquad_SetupStruct*,&(vDSP_biquad_DestroySetup)>>::reset[abi:ne180100](vDSP_biquad_SetupStruct **a1, vDSP_biquad_SetupStruct *a2)
{
  v3 = *a1;
  *a1 = a2;
  if (v3) {
    vDSP_biquad_DestroySetup(v3);
  }
}

void std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  v2 = *a1;
  if (*v2)
  {
    std::vector<std::vector<float>>::__clear[abi:ne180100]((uint64_t *)v2);
    v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<std::vector<float>>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  if (v2 != *a1)
  {
    uint64_t v4 = a1[1];
    do
    {
      uint64_t v6 = *(void **)(v4 - 24);
      v4 -= 24;
      v5 = v6;
      if (v6)
      {
        *(void *)(v2 - 16) = v5;
        operator delete(v5);
      }
      uint64_t v2 = v4;
    }
    while (v4 != v3);
  }
  a1[1] = v3;
}

uint64_t std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100](unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5 = a1;
  uint64_t result = MEMORY[0x263F8C260];
  switch(v5)
  {
    case 1:
      uint64_t result = 0;
      *(_DWORD *)(a3 + 8) = *(_DWORD *)(a2 + 8);
      *(void *)a3 = std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
      break;
    case 2:
      uint64_t result = 0;
      *(_DWORD *)(a3 + 8) = *(_DWORD *)(a2 + 8);
      *(void *)a3 = std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
      goto LABEL_5;
    case 3:
      if (a4) {
        BOOL v8 = std::type_info::operator==[abi:ne180100](a4, MEMORY[0x263F8C260]);
      }
      else {
        BOOL v8 = a5 == &std::__any_imp::__unique_typeinfo<unsigned int>::__id;
      }
      if (v8) {
        uint64_t result = a2 + 8;
      }
      else {
        uint64_t result = 0;
      }
      break;
    case 4:
      return result;
    default:
      uint64_t result = 0;
LABEL_5:
      *(void *)a2 = 0;
      break;
  }
  return result;
}

BOOL std::type_info::operator==[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a2 + 8);
  if (v2 == v3) {
    return 1;
  }
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3)) {
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  }
  return 0;
}

uint64_t std::__any_imp::_SmallHandler<float>::__handle[abi:ne180100](unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5 = a1;
  uint64_t result = MEMORY[0x263F8C248];
  switch(v5)
  {
    case 1:
      uint64_t result = 0;
      *(_DWORD *)(a3 + 8) = *(_DWORD *)(a2 + 8);
      *(void *)a3 = std::__any_imp::_SmallHandler<float>::__handle[abi:ne180100];
      break;
    case 2:
      uint64_t result = 0;
      *(_DWORD *)(a3 + 8) = *(_DWORD *)(a2 + 8);
      *(void *)a3 = std::__any_imp::_SmallHandler<float>::__handle[abi:ne180100];
      goto LABEL_5;
    case 3:
      if (a4) {
        BOOL v8 = std::type_info::operator==[abi:ne180100](a4, MEMORY[0x263F8C248]);
      }
      else {
        BOOL v8 = a5 == &std::__any_imp::__unique_typeinfo<float>::__id;
      }
      if (v8) {
        uint64_t result = a2 + 8;
      }
      else {
        uint64_t result = 0;
      }
      break;
    case 4:
      return result;
    default:
      uint64_t result = 0;
LABEL_5:
      *(void *)a2 = 0;
      break;
  }
  return result;
}

uint64_t **std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(uint64_t **a1, unsigned int *a2, uint64_t a3, _DWORD **a4)
{
  uint64_t v7 = a1 + 1;
  uint64_t v6 = a1[1];
  BOOL v8 = a1 + 1;
  uint64_t v9 = a1 + 1;
  if (v6)
  {
    unsigned int v10 = *a2;
    while (1)
    {
      while (1)
      {
        uint64_t v9 = (uint64_t **)v6;
        unsigned int v11 = *((_DWORD *)v6 + 8);
        if (v10 >= v11) {
          break;
        }
        uint64_t v6 = *v9;
        BOOL v8 = v9;
        if (!*v9) {
          goto LABEL_9;
        }
      }
      if (v11 >= v10) {
        break;
      }
      uint64_t v6 = v9[1];
      if (!v6)
      {
        BOOL v8 = v9 + 1;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v12 = operator new(0x48uLL);
    v14[1] = v7;
    v12[8] = **a4;
    *((void *)v12 + 5) = 0;
    *((void *)v12 + 6) = 0;
    char v15 = 1;
    std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::__insert_node_at(a1, (uint64_t)v9, v8, (uint64_t *)v12);
    v14[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<unsigned int,std::any>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<unsigned int,std::any>,void *>>>>::reset[abi:ne180100]((uint64_t)v14, 0);
    return (uint64_t **)v12;
  }
  return v9;
}

uint64_t *std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  uint64_t v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  uint64_t result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      uint64_t v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      uint64_t v3 = (uint64_t *)v2[2];
      uint64_t v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (int v8 = *(unsigned __int8 *)(v7 + 24), v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            uint64_t v9 = (uint64_t **)a2[2];
          }
          else
          {
            uint64_t v9 = (uint64_t **)v2[1];
            unsigned int v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              uint64_t v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            *uint64_t v9 = v2;
            v2[2] = (uint64_t)v9;
            uint64_t v3 = v9[2];
            uint64_t v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          uint64_t *v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (int v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          uint64_t *v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            uint64_t v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          uint64_t v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        uint64_t v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        uint64_t *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      unsigned char *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void std::unique_ptr<std::__tree_node<std::__value_type<unsigned int,std::any>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<unsigned int,std::any>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (***)(void, void, void, void, void))a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::any::reset[abi:ne180100](v2 + 5);
    }
    operator delete(v2);
  }
}

EchoCodeEncoder *std::unique_ptr<EchoCodeEncoder>::reset[abi:ne180100](EchoCodeEncoder **a1, EchoCodeEncoder *a2)
{
  uint64_t result = *a1;
  *a1 = a2;
  if (result)
  {
    EchoCodeEncoder::~EchoCodeEncoder(result);
    JUMPOUT(0x237E2DA50);
  }
  return result;
}

void EchoCodeEncoder::~EchoCodeEncoder(EchoCodeEncoder *this)
{
  std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::destroy((uint64_t)this + 152, *((void **)this + 20));
  uint64_t v2 = (void *)*((void *)this + 16);
  if (v2)
  {
    *((void *)this + 17) = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)*((void *)this + 13);
  if (v3)
  {
    *((void *)this + 14) = v3;
    operator delete(v3);
  }
  uint64_t v4 = *((void *)this + 12);
  *((void *)this + 12) = 0;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  }
  uint64_t v5 = *((void *)this + 11);
  *((void *)this + 11) = 0;
  if (v5) {
    std::default_delete<ShapingFilter>::operator()[abi:ne180100]((uint64_t)this + 88, v5);
  }
  uint64_t v6 = *((void *)this + 10);
  *((void *)this + 10) = 0;
  if (v6) {
    std::default_delete<ShapingFilter>::operator()[abi:ne180100]((uint64_t)this + 80, v6);
  }
  uint64_t v7 = *((void *)this + 9);
  *((void *)this + 9) = 0;
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
  }
}

{
  uint64_t vars8;

  EchoCodeEncoder::~EchoCodeEncoder(this);

  JUMPOUT(0x237E2DA50);
}

uint64_t std::__any_imp::_SmallHandler<BOOL>::__handle[abi:ne180100](unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5 = a1;
  uint64_t result = MEMORY[0x263F8C230];
  switch(v5)
  {
    case 1:
      uint64_t result = 0;
      *(unsigned char *)(a3 + 8) = *(unsigned char *)(a2 + 8);
      *(void *)a3 = std::__any_imp::_SmallHandler<BOOL>::__handle[abi:ne180100];
      break;
    case 2:
      uint64_t result = 0;
      *(unsigned char *)(a3 + 8) = *(unsigned char *)(a2 + 8);
      *(void *)a3 = std::__any_imp::_SmallHandler<BOOL>::__handle[abi:ne180100];
      goto LABEL_5;
    case 3:
      if (a4) {
        BOOL v8 = std::type_info::operator==[abi:ne180100](a4, MEMORY[0x263F8C230]);
      }
      else {
        BOOL v8 = a5 == &std::__any_imp::__unique_typeinfo<BOOL>::__id;
      }
      if (v8) {
        uint64_t result = a2 + 8;
      }
      else {
        uint64_t result = 0;
      }
      break;
    case 4:
      return result;
    default:
      uint64_t result = 0;
LABEL_5:
      *(void *)a2 = 0;
      break;
  }
  return result;
}

void std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::destroy(a1, a2[1]);
    std::any::reset[abi:ne180100]((uint64_t (**)(void, void, void, void, void))a2 + 5);
    operator delete(a2);
  }
}

uint64_t (**std::any_cast[abi:ne180100]<unsigned int>(uint64_t (**result)(uint64_t, void, void, void, void *)))(uint64_t, void, void, void, void *)
{
  if (result)
  {
    if (*result) {
      return (uint64_t (**)(uint64_t, void, void, void, void *))(*result)(3, result, 0, MEMORY[0x263F8C260], &std::__any_imp::__unique_typeinfo<unsigned int>::__id);
    }
    else {
      return 0;
    }
  }
  return result;
}

{
  if (result)
  {
    if (*result) {
      return (uint64_t (**)(uint64_t, void, void, void, void *))(*result)(3, result, 0, MEMORY[0x263F8C260], &std::__any_imp::__unique_typeinfo<unsigned int>::__id);
    }
    else {
      return 0;
    }
  }
  return result;
}

void std::__throw_bad_any_cast[abi:ne180100]()
{
  exception = (std::bad_any_cast *)__cxa_allocate_exception(8uLL);
  exception->__vftable = 0;
  v1 = std::bad_any_cast::bad_any_cast(exception);
  __cxa_throw(v1, MEMORY[0x263F8C1E8], (void (*)(void *))std::bad_any_cast::~bad_any_cast);
}

std::bad_cast *std::bad_any_cast::bad_any_cast(std::bad_any_cast *this)
{
  uint64_t result = std::bad_cast::bad_cast(this);
  result->__vftable = (std::bad_cast_vtbl *)(MEMORY[0x263F8C378] + 16);
  return result;
}

void sub_237D11FF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237D12210(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237D12370(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_237D1240C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237D1254C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237D127A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237D1292C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237D129C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237D12AE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237D12DA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11, uint64_t a12)
{
  _Unwind_Resume(a1);
}

void sub_237D12F30(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_237D135A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237D137C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void EchoCodeDecoder::EchoCodeDecoder(EchoCodeDecoder *this)
{
  *(void *)this = &unk_26EAE4320;
  *((void *)this + 1) = &unk_26EAE4370;
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  *((void *)this + 4) = 0;
  *((unsigned char *)this + 40) = 0;
  *(void *)((char *)this + 44) = 0;
  *(void *)((char *)this + 60) = 0;
  *(void *)((char *)this + 52) = 0;
  *((_DWORD *)this + 17) = 100;
  *((void *)this + 11) = 0;
  *((void *)this + 10) = (char *)this + 88;
  *((unsigned char *)this + 72) = 0;
  *((void *)this + 16) = 0;
  *((void *)this + 13) = 0;
  *((void *)this + 14) = 0;
  *((void *)this + 12) = 0;
  *((_DWORD *)this + 30) = 0;
  *((_DWORD *)this + 38) = 0;
  *((void *)this + 17) = 0;
  *((void *)this + 18) = 0;
  *((_OWORD *)this + 10) = 0u;
  *((_OWORD *)this + 17) = 0u;
  *((_OWORD *)this + 18) = 0u;
  *((_OWORD *)this + 15) = 0u;
  *((_OWORD *)this + 16) = 0u;
  *((_OWORD *)this + 13) = 0u;
  *((_OWORD *)this + 14) = 0u;
  *((_OWORD *)this + 11) = 0u;
  *((_OWORD *)this + 12) = 0u;
  operator new();
}

void sub_237D13AA4(_Unwind_Exception *a1)
{
  BOOL v8 = (void *)v1[35];
  if (v8)
  {
    v1[36] = v8;
    operator delete(v8);
  }
  uint64_t v9 = (void *)v1[32];
  if (v9)
  {
    v1[33] = v9;
    operator delete(v9);
  }
  unsigned int v10 = (void *)v1[29];
  if (v10)
  {
    v1[30] = v10;
    operator delete(v10);
  }
  uint64_t v11 = (void *)v1[26];
  if (v11)
  {
    v1[27] = v11;
    operator delete(v11);
  }
  uint64_t v12 = (void *)v1[23];
  if (v12)
  {
    v1[24] = v12;
    operator delete(v12);
  }
  uint64_t v13 = v1[22];
  v1[22] = 0;
  if (v13) {
    (*(void (**)(uint64_t))(*(void *)v13 + 8))(v13);
  }
  uint64_t v14 = *v4;
  uint64_t *v4 = 0;
  if (v14) {
    std::default_delete<EchoDetector>::operator()[abi:ne180100]((uint64_t)v4, v14);
  }
  uint64_t v15 = *v3;
  uint64_t *v3 = 0;
  if (v15) {
    std::default_delete<ShapingFilter>::operator()[abi:ne180100]((uint64_t)v3, v15);
  }
  v16 = *v6;
  if (*v6)
  {
    v1[17] = v16;
    operator delete(v16);
  }
  std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::destroy(v2, *v5);
  _Unwind_Resume(a1);
}

uint64_t EchoCodeDecoder::initialize(float *a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t result = EchoCodeDecoder::loadAPCConfig((uint64_t)a1, a2);
  if (!result)
  {
    if (!*((_DWORD *)a1 + 6)) {
      *((_DWORD *)a1 + 6) = 2048;
    }
    if (!*((_DWORD *)a1 + 7)) {
      *((_DWORD *)a1 + 7) = 2;
    }
    if (a1[8] == 0.0) {
      a1[8] = 0.002;
    }
    if (a1[9] == 0.0) {
      a1[9] = 0.008;
    }
    if (a1[16] == 0.0) {
      a1[16] = 18000.0;
    }
    uint64_t v4 = *((unsigned int *)a1 + 17);
    if (!v4)
    {
      uint64_t v4 = 100;
      *((_DWORD *)a1 + 17) = 100;
    }
    BOOL SyncType = echoCodec::getSyncType((echoCodec *)v4);
    if (!*((_DWORD *)a1 + 14))
    {
      if (SyncType) {
        char v6 = 6;
      }
      else {
        char v6 = 4;
      }
      *((_DWORD *)a1 + 14) = *((_DWORD *)a1 + 6) >> v6;
    }
    uint64_t v7 = APCLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      double v8 = (float)((float)*((unsigned int *)a1 + 17) / 100.0);
      int v10 = 134217984;
      double v11 = v8;
      _os_log_impl(&dword_237D0E000, v7, OS_LOG_TYPE_INFO, "APC decoder algorithm version: %3.2f", (uint8_t *)&v10, 0xCu);
    }
    BOOL v9 = echoCodec::getSyncType((echoCodec *)*((unsigned int *)a1 + 17));
    if (!v9) {
      operator new();
    }
    if (v9) {
      operator new();
    }
    return 4294967289;
  }
  return result;
}

void sub_237D1403C(_Unwind_Exception *a1)
{
  MEMORY[0x237E2DA50](v1, 0x10B1C403C28CA08);
  _Unwind_Resume(a1);
}

uint64_t EchoCodeDecoder::loadAPCConfig(uint64_t a1, uint64_t a2)
{
  v49 = 0;
  uint64_t v50 = a2;
  __p = 0;
  v48 = 0;
  uint64_t v4 = std::__allocate_at_least[abi:ne180100]<std::allocator<APCConfigReader::paramData>>((uint64_t)&v49, 1uLL);
  uint64_t v5 = 0;
  char v6 = (char *)&v4[3 * v3];
  *(_DWORD *)uint64_t v4 = 0;
  v4[1] = a1 + 16;
  *((_DWORD *)v4 + 4) = 1;
  uint64_t v7 = (char *)(v4 + 3);
  double v8 = v48;
  BOOL v9 = (char *)v4;
  if (v48)
  {
    do
    {
      long long v10 = *(_OWORD *)(v8 - 24);
      *((_DWORD *)v9 - 2) = *((_DWORD *)v8 - 2);
      *(_OWORD *)(v9 - 24) = v10;
      v9 -= 24;
      v8 -= 24;
    }
    while (v8);
    uint64_t v5 = __p;
  }
  __p = v9;
  v48 = (char *)(v4 + 3);
  v49 = (char *)&v4[3 * v3];
  if (v5)
  {
    operator delete(v5);
    char v6 = v49;
  }
  v48 = (char *)(v4 + 3);
  uint64_t v11 = a1 + 20;
  if (v7 >= v6)
  {
    unint64_t v13 = 0xAAAAAAAAAAAAAAABLL * ((v7 - (unsigned char *)__p) >> 3);
    if (v13 + 1 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * ((v6 - (unsigned char *)__p) >> 3);
    uint64_t v15 = 2 * v14;
    if (2 * v14 <= v13 + 1) {
      uint64_t v15 = v13 + 1;
    }
    if (v14 >= 0x555555555555555) {
      unint64_t v16 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v16 = v15;
    }
    if (v16) {
      v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<APCConfigReader::paramData>>((uint64_t)&v49, v16);
    }
    else {
      v17 = 0;
    }
    char v18 = &v17[8 * ((v7 - (unsigned char *)__p) >> 3)];
    v19 = &v17[24 * v16];
    *(_DWORD *)char v18 = 3;
    *((void *)v18 + 1) = v11;
    *((_DWORD *)v18 + 4) = 1;
    uint64_t v12 = v18 + 24;
    v21 = (char *)__p;
    v20 = v48;
    if (v48 != __p)
    {
      do
      {
        long long v22 = *(_OWORD *)(v20 - 24);
        *((_DWORD *)v18 - 2) = *((_DWORD *)v20 - 2);
        *(_OWORD *)(v18 - 24) = v22;
        v18 -= 24;
        v20 -= 24;
      }
      while (v20 != v21);
      v20 = (char *)__p;
    }
    __p = v18;
    v48 = v12;
    v49 = v19;
    if (v20) {
      operator delete(v20);
    }
  }
  else
  {
    *((_DWORD *)v4 + 6) = 3;
    v4[4] = v11;
    *((_DWORD *)v4 + 10) = 1;
    uint64_t v12 = (char *)(v4 + 6);
  }
  v48 = v12;
  uint64_t v23 = a1 + 64;
  if (v12 >= v49)
  {
    unint64_t v25 = 0xAAAAAAAAAAAAAAABLL * ((v12 - (unsigned char *)__p) >> 3);
    if (v25 + 1 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v26 = 0x5555555555555556 * ((v49 - (unsigned char *)__p) >> 3);
    if (v26 <= v25 + 1) {
      unint64_t v26 = v25 + 1;
    }
    if (0xAAAAAAAAAAAAAAABLL * ((v49 - (unsigned char *)__p) >> 3) >= 0x555555555555555) {
      unint64_t v27 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v27 = v26;
    }
    if (v27) {
      v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<APCConfigReader::paramData>>((uint64_t)&v49, v27);
    }
    else {
      v28 = 0;
    }
    v29 = &v28[24 * v25];
    v30 = &v28[24 * v27];
    *(_DWORD *)v29 = 111;
    *((void *)v29 + 1) = v23;
    *((_DWORD *)v29 + 4) = 0;
    v24 = v29 + 24;
    v32 = (char *)__p;
    v31 = v48;
    if (v48 != __p)
    {
      do
      {
        long long v33 = *(_OWORD *)(v31 - 24);
        *((_DWORD *)v29 - 2) = *((_DWORD *)v31 - 2);
        *(_OWORD *)(v29 - 24) = v33;
        v29 -= 24;
        v31 -= 24;
      }
      while (v31 != v32);
      v31 = (char *)__p;
    }
    __p = v29;
    v48 = v24;
    v49 = v30;
    if (v31) {
      operator delete(v31);
    }
  }
  else
  {
    *(_DWORD *)uint64_t v12 = 111;
    *((void *)v12 + 1) = v23;
    *((_DWORD *)v12 + 4) = 0;
    v24 = v12 + 24;
  }
  v48 = v24;
  uint64_t v34 = a1 + 68;
  if (v24 >= v49)
  {
    unint64_t v36 = 0xAAAAAAAAAAAAAAABLL * ((v24 - (unsigned char *)__p) >> 3);
    if (v36 + 1 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v37 = 0x5555555555555556 * ((v49 - (unsigned char *)__p) >> 3);
    if (v37 <= v36 + 1) {
      unint64_t v37 = v36 + 1;
    }
    if (0xAAAAAAAAAAAAAAABLL * ((v49 - (unsigned char *)__p) >> 3) >= 0x555555555555555) {
      unint64_t v38 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v38 = v37;
    }
    if (v38) {
      v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<APCConfigReader::paramData>>((uint64_t)&v49, v38);
    }
    else {
      v39 = 0;
    }
    v40 = &v39[24 * v36];
    v41 = &v39[24 * v38];
    *(_DWORD *)v40 = 113;
    *((void *)v40 + 1) = v34;
    *((_DWORD *)v40 + 4) = 1;
    v35 = v40 + 24;
    v43 = (char *)__p;
    v42 = v48;
    if (v48 != __p)
    {
      do
      {
        long long v44 = *(_OWORD *)(v42 - 24);
        *((_DWORD *)v40 - 2) = *((_DWORD *)v42 - 2);
        *(_OWORD *)(v40 - 24) = v44;
        v40 -= 24;
        v42 -= 24;
      }
      while (v42 != v43);
      v42 = (char *)__p;
    }
    __p = v40;
    v48 = v35;
    v49 = v41;
    if (v42) {
      operator delete(v42);
    }
  }
  else
  {
    *(_DWORD *)v24 = 113;
    *((void *)v24 + 1) = v34;
    *((_DWORD *)v24 + 4) = 1;
    v35 = v24 + 24;
  }
  v48 = v35;
  uint64_t v45 = APCConfigReader::loadParams((uint64_t)&v50, &__p);
  if (__p)
  {
    v48 = (char *)__p;
    operator delete(__p);
  }
  return v45;
}

void sub_237D14458(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<float>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 2;
  if (a2 <= v2)
  {
    if (a2 < v2) {
      *(void *)(a1 + 8) = *(void *)a1 + 4 * a2;
    }
  }
  else
  {
    std::vector<float>::__append((char **)a1, a2 - v2);
  }
}

void std::vector<float>::resize(uint64_t a1, unint64_t a2, _DWORD *a3)
{
  unint64_t v3 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 2;
  if (a2 <= v3)
  {
    if (a2 < v3) {
      *(void *)(a1 + 8) = *(void *)a1 + 4 * a2;
    }
  }
  else
  {
    std::vector<float>::__append((void **)a1, a2 - v3, a3);
  }
}

void std::vector<unsigned char>::reserve(unint64_t *a1, size_t __sz)
{
  unint64_t v2 = *a1;
  if (a1[2] - *a1 < __sz)
  {
    if ((__sz & 0x8000000000000000) != 0) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v5 = (char *)a1[1];
    char v6 = operator new(__sz);
    uint64_t v7 = &v5[(void)v6 - v2];
    double v8 = v7;
    if (v5 != (char *)v2)
    {
      BOOL v9 = &v5[~v2];
      do
      {
        char v10 = *--v5;
        (v9--)[(void)v6] = v10;
      }
      while (v5 != (char *)v2);
      double v8 = v6;
    }
    *a1 = (unint64_t)v8;
    a1[1] = (unint64_t)v7;
    a1[2] = (unint64_t)&v6[__sz];
    if (v2)
    {
      operator delete((void *)v2);
    }
  }
}

uint64_t non-virtual thunk to'EchoCodeDecoder::initialize(uint64_t a1, uint64_t a2)
{
  return EchoCodeDecoder::initialize((float *)(a1 - 8), a2);
}

uint64_t EchoCodeDecoder::reset(ShapingFilter **this)
{
  this[36] = this[35];
  BitCounter::reset((BitCounter *)(this + 13), 0);
  (*(void (**)(ShapingFilter *))(*(void *)this[22] + 24))(this[22]);
  *((unsigned char *)this + 40) = 0;
  *((_DWORD *)this + 11) = 0;
  *((_DWORD *)this + 12) = 0;
  *((unsigned char *)this + 72) = 0;
  return 0;
}

uint64_t non-virtual thunk to'EchoCodeDecoder::reset(ShapingFilter **this)
{
  return 0;
}

uint64_t EchoCodeDecoder::decode(EchoCodeDecoder *this, const float *a2, unsigned int *a3, unsigned __int8 *a4)
{
  BOOL SyncType = echoCodec::getSyncType((echoCodec *)*((unsigned int *)this + 17));
  if (SyncType)
  {
    return EchoCodeDecoder::decodeWithSyncEcho(this, a2, a3, a4);
  }
  else if (SyncType)
  {
    return 4294967291;
  }
  else
  {
    uint64_t v9 = *a3;
    return EchoCodeDecoder::decodeWithSyncSeq(this, a2, v9, a4);
  }
}

uint64_t EchoCodeDecoder::decodeWithSyncSeq(EchoCodeDecoder *this, const float *a2, uint64_t a3, unsigned __int8 *a4)
{
  int v5 = a3;
  char v6 = a2;
  unsigned int v24 = 0;
  if (!(*(unsigned int (**)(void, const float *, uint64_t, unsigned int *, void))(**((void **)this + 22)
                                                                                               + 40))(*((void *)this + 22), a2, a3, &v24, 0))return 2;
  if (*((_DWORD *)this + 12) >= (8 * *((_DWORD *)this + 5))) {
    return 4;
  }
  if ((v24 & 0x80000000) == 0)
  {
    v6 += v24;
    v5 -= v24;
    *((_DWORD *)this + 1EchoCodeDecoder::reset(this - 1) = 0;
    double v8 = APCLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_237D0E000, v8, OS_LOG_TYPE_INFO, "The beginning of the passcode has been found!", buf, 2u);
    }
  }
  if (v5 < 1) {
    return 3;
  }
  uint64_t v9 = *((unsigned int *)this + 11);
  unsigned int v10 = *((_DWORD *)this + 13) - v9;
  vDSP_Length v11 = v10 >= v5 ? v5 : v10;
  ShapingFilter::filter(*((ShapingFilter **)this + 20), v6, (float *)(*((void *)this + 26) + 4 * v9), v11);
  unsigned int v12 = *((_DWORD *)this + 11) + v11;
  *((_DWORD *)this + 1EchoCodeDecoder::reset(this - 1) = v12;
  if (v12 < *((_DWORD *)this + 13)) {
    return 3;
  }
  while (1)
  {
    if (*((_DWORD *)this + 15))
    {
      unsigned int v14 = 0;
      do
      {
        unsigned int v22 = 0;
        if (EchoDetector::decodeEcho(*((EchoDetector **)this + 21), (const float *)(*((void *)this + 26) + 4 * *((_DWORD *)this + 14) * v14), *((_DWORD *)this + 6), (BOOL *)&v22, 0))BitCounter::count((uint64_t)this + 104, v22); {
        else
        }
          BitCounter::count((uint64_t)this + 104);
        ++v14;
      }
      while (v14 < *((_DWORD *)this + 15));
    }
    *a4 = 0;
    unsigned int v15 = *((_DWORD *)this + 28);
    unsigned int v16 = *((_DWORD *)this + 29);
    if (v15 == v16) {
      break;
    }
    if (v15 < v16) {
      *a4 = 1;
    }
    BitCounter::reset((EchoCodeDecoder *)((char *)this + 104), 0);
    int v17 = *((_DWORD *)this + 11);
    ++*((_DWORD *)this + 12);
    memmove(*((void **)this + 26), (const void *)(*((void *)this + 26) + 4 * *((unsigned int *)this + 13)), 4 * (v17 - *((_DWORD *)this + 13)));
    int v18 = *((_DWORD *)this + 13);
    unsigned int v19 = *((_DWORD *)this + 11) - v18;
    *((_DWORD *)this + 1EchoCodeDecoder::reset(this - 1) = v19;
    v5 -= v11;
    if (v5 <= 0) {
      return 0;
    }
    v6 += v11;
    unsigned int v20 = v18 - v19;
    if (v20 >= v5) {
      vDSP_Length v11 = v5;
    }
    else {
      vDSP_Length v11 = v20;
    }
    ShapingFilter::filter(*((ShapingFilter **)this + 20), v6, (float *)(*((void *)this + 26) + 4 * v19), v11);
    uint64_t result = 0;
    unsigned int v21 = *((_DWORD *)this + 11) + v11;
    *((_DWORD *)this + 1EchoCodeDecoder::reset(this - 1) = v21;
    if (v21 < *((_DWORD *)this + 13)) {
      return result;
    }
  }
  if (v15) {
    return 4294967292;
  }
  else {
    return 4294967294;
  }
}

uint64_t EchoCodeDecoder::decodeWithSyncEcho(EchoCodeDecoder *this, const float *a2, unsigned int *a3, unsigned __int8 *a4)
{
  int v5 = a2;
  uint64_t v7 = *a3;
  EchoCodeDecoder::decodeWithSyncEcho(float const*,unsigned int &,unsigned char &)::count += v7;
  int v37 = 0;
  if (*((_DWORD *)this + 12) >= (8 * *((_DWORD *)this + 5)))
  {
    uint64_t v15 = 4;
  }
  else
  {
    if ((*(unsigned int (**)(void, const float *, uint64_t, int *, void))(**((void **)this + 22) + 40))(*((void *)this + 22), a2, v7, &v37, 0))
    {
      unsigned int v8 = *((_DWORD *)this + 11);
      int v9 = v37;
      if ((int)(v37 + v8) >= 0)
      {
        int v10 = v37 & (v37 >> 31);
        unsigned int v11 = v10 + v8;
        memmove(*((void **)this + 26), (const void *)(*((void *)this + 26) + 4 * (v10 + v8)), 4 * -v10);
        unsigned int v8 = *((_DWORD *)this + 11) - v11;
        *((_DWORD *)this + 1EchoCodeDecoder::reset(this - 1) = v8;
        int v9 = v37;
      }
      if ((v9 & 0x80000000) == 0)
      {
        if ((int)v7 >= v9) {
          vDSP_Length v12 = v9;
        }
        else {
          vDSP_Length v12 = v7;
        }
        unsigned int v13 = *((_DWORD *)this + 13) - v8;
        unsigned int v14 = v12 - v13;
        if (v12 > v13)
        {
          memmove(*((void **)this + 26), (const void *)(*((void *)this + 26) + 4 * v14), 4 * (v8 - v14));
          unsigned int v8 = *((_DWORD *)this + 11) - v14;
          *((_DWORD *)this + 1EchoCodeDecoder::reset(this - 1) = v8;
        }
        ShapingFilter::filter(*((ShapingFilter **)this + 20), v5, (float *)(*((void *)this + 26) + 4 * v8), v12);
        v5 += v12;
        LODWORD(v7) = v7 - v12;
      }
      uint64_t v15 = 3;
      goto LABEL_26;
    }
    uint64_t v15 = 3;
  }
  if ((int)v7 >= 1)
  {
    unsigned int v16 = *((_DWORD *)this + 11);
    do
    {
      int v17 = *((_DWORD *)this + 13);
      if (v16 == v17)
      {
        if (v16 >= v7) {
          unsigned int v18 = v7;
        }
        else {
          unsigned int v18 = v16;
        }
        memmove(*((void **)this + 26), (const void *)(*((void *)this + 26) + 4 * v18), 4 * (v16 - v18));
        unsigned int v16 = *((_DWORD *)this + 11) - v18;
        *((_DWORD *)this + 1EchoCodeDecoder::reset(this - 1) = v16;
        int v17 = *((_DWORD *)this + 13);
      }
      unsigned int v19 = v17 - v16;
      if (v19 >= v7) {
        vDSP_Length v20 = v7;
      }
      else {
        vDSP_Length v20 = v19;
      }
      ShapingFilter::filter(*((ShapingFilter **)this + 20), v5, (float *)(*((void *)this + 26) + 4 * v16), v20);
      unsigned int v16 = *((_DWORD *)this + 11) + v20;
      *((_DWORD *)this + 1EchoCodeDecoder::reset(this - 1) = v16;
      LODWORD(v7) = v7 - v20;
    }
    while ((int)v7 > 0);
  }
  do
  {
LABEL_26:
    if ((int)v7 < 1) {
      break;
    }
    uint64_t v21 = *((unsigned int *)this + 11);
    unsigned int v22 = *((_DWORD *)this + 13) - v21;
    if (v22 >= v7) {
      vDSP_Length v23 = v7;
    }
    else {
      vDSP_Length v23 = v22;
    }
    ShapingFilter::filter(*((ShapingFilter **)this + 20), v5, (float *)(*((void *)this + 26) + 4 * v21), v23);
    unsigned int v24 = *((_DWORD *)this + 11) + v23;
    *((_DWORD *)this + 1EchoCodeDecoder::reset(this - 1) = v24;
    if (v24 < *((_DWORD *)this + 13))
    {
      LODWORD(v7) = v7 - v23;
      break;
    }
    if (!*((_DWORD *)this + 15))
    {
      unsigned int v26 = 0;
      goto LABEL_58;
    }
    int v25 = 0;
    unsigned int v26 = 0;
    while (1)
    {
      unsigned int v36 = 0;
      int v27 = EchoDetector::decodeEcho(*((EchoDetector **)this + 21), (const float *)(*((void *)this + 26) + 4 * (*((_DWORD *)this + 14) * v25)), *((_DWORD *)this + 6), (BOOL *)&v36, 0);
      v26 += *((_DWORD *)this + 14);
      if (v27) {
        break;
      }
      if (*((unsigned char *)this + 72))
      {
        BitCounter::count((uint64_t)this + 104);
        goto LABEL_39;
      }
LABEL_48:
      if (++v25 >= *((_DWORD *)this + 15)) {
        goto LABEL_58;
      }
    }
    if (!*((unsigned char *)this + 72))
    {
      BitCounter::reset((EchoCodeDecoder *)((char *)this + 104), 0);
      *((unsigned char *)this + 72) = 1;
    }
    BitCounter::count((uint64_t)this + 104, v36);
LABEL_39:
    if (!*((unsigned char *)this + 72)) {
      goto LABEL_48;
    }
    if (((*(uint64_t (**)(void))(**((void **)this + 22) + 72))(*((void *)this + 22)) & 1) != 0
      || *((_DWORD *)this + 12))
    {
      int v28 = 0;
    }
    else
    {
      if (*((_DWORD *)this + 30) > *((_DWORD *)this + 15))
      {
        BitCounter::reset((EchoCodeDecoder *)((char *)this + 104), 0);
        *((unsigned char *)this + 72) = 0;
        (*(void (**)(void))(**((void **)this + 22) + 24))(*((void *)this + 22));
        v30 = APCLogObject();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_237D0E000, v30, OS_LOG_TYPE_DEBUG, "A wrong frame start was found. Restarting...", buf, 2u);
        }
      }
      int v28 = 1;
    }
    if (*((_DWORD *)this + 26) < *((_DWORD *)this + 27)) {
      goto LABEL_48;
    }
    int v29 = BitCounter::decodeBit((EchoCodeDecoder *)((char *)this + 104));
    if ((!v28 || (*((_DWORD *)this + 28) + *((_DWORD *)this + 29)) >= 0xA) && (v29 & 0x80000000) == 0)
    {
      *a4 = v29;
      BitCounter::reset((EchoCodeDecoder *)((char *)this + 104), 0);
      uint64_t v15 = 0;
      ++*((_DWORD *)this + 12);
      goto LABEL_48;
    }
    *((unsigned char *)this + 72) = 0;
    *((_DWORD *)this + 12) = 0;
    (*(void (**)(void))(**((void **)this + 22) + 24))(*((void *)this + 22));
    v31 = APCLogObject();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v34 = 0;
      _os_log_impl(&dword_237D0E000, v31, OS_LOG_TYPE_ERROR, "Passcode bit error. Restarting...", v34, 2u);
    }
    uint64_t v15 = 4294967286;
LABEL_58:
    memmove(*((void **)this + 26), (const void *)(*((void *)this + 26) + 4 * v26), 4 * (*((_DWORD *)this + 11) - v26));
    *((_DWORD *)this + 11) -= v26;
    v5 += v23;
    LODWORD(v7) = v7 - v23;
  }
  while (v15 != -10);
  *a3 -= v7;
  return v15;
}

uint64_t non-virtual thunk to'EchoCodeDecoder::decode(EchoCodeDecoder *this, const float *a2, unsigned int *a3, unsigned __int8 *a4)
{
  return EchoCodeDecoder::decode((EchoCodeDecoder *)((char *)this - 8), a2, a3, a4);
}

uint64_t EchoCodeDecoder::detectEchoSection(EchoCodeDecoder *this, const float *a2, uint64_t a3, int *a4)
{
  return (*(uint64_t (**)(void, const float *, uint64_t, int *, void))(**((void **)this + 22) + 40))(*((void *)this + 22), a2, a3, a4, 0);
}

void EchoCodeDecoder::Process(EchoCodeDecoder *this, const float *a2, int a3, uint64_t *a4, int *a5)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  if (a3 < 1)
  {
    uint64_t v48 = 0;
    int v10 = 0;
    unint64_t v38 = a4;
    goto LABEL_42;
  }
  int v6 = a3;
  uint64_t v45 = a5;
  v47 = (unint64_t *)((char *)this + 280);
  uint64_t v48 = 0;
  while (2)
  {
    unsigned __int8 v50 = 0;
    unsigned int v8 = *((_DWORD *)this + 6);
    if (v8 >= v6) {
      unsigned int v8 = v6;
    }
    unsigned int v49 = v8;
    int v9 = EchoCodeDecoder::decode(this, a2, &v49, &v50);
    int v10 = v9;
    uint64_t v11 = v49;
    switch(v9)
    {
      case 0:
        char v12 = v50 & 1;
        unsigned int v14 = (unsigned char *)*((void *)this + 36);
        unint64_t v13 = *((void *)this + 37);
        if ((unint64_t)v14 >= v13)
        {
          unint64_t v17 = *v47;
          unsigned int v18 = &v14[-*v47];
          unint64_t v19 = (unint64_t)(v18 + 1);
          if ((uint64_t)(v18 + 1) < 0) {
            std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
          }
          unint64_t v20 = v13 - v17;
          if (2 * v20 > v19) {
            unint64_t v19 = 2 * v20;
          }
          if (v20 >= 0x3FFFFFFFFFFFFFFFLL) {
            size_t v21 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else {
            size_t v21 = v19;
          }
          if (v21)
          {
            size_t v22 = v21;
            vDSP_Length v23 = (char *)operator new(v21);
            size_t v21 = v22;
          }
          else
          {
            vDSP_Length v23 = 0;
          }
          unsigned int v24 = &v18[(void)v23];
          int v25 = &v18[(void)v23];
          *int v25 = v12;
          uint64_t v15 = v25 + 1;
          if (v14 != (unsigned char *)v17)
          {
            unsigned int v26 = &v14[~v17];
            do
            {
              char v27 = *--v14;
              (v26--)[(void)v23] = v27;
            }
            while (v14 != (unsigned char *)v17);
            unsigned int v14 = (unsigned char *)*v47;
            unsigned int v24 = v23;
          }
          *((void *)this + 35) = v24;
          *((void *)this + 36) = v15;
          *((void *)this + 37) = &v23[v21];
          if (v14) {
            operator delete(v14);
          }
        }
        else
        {
          unsigned char *v14 = v12;
          uint64_t v15 = v14 + 1;
        }
        *((void *)this + 36) = v15;
        if ((int)v15 - *((_DWORD *)this + 70) >= (8 * *((_DWORD *)this + 5)))
        {
          uint64_t v48 = mach_absolute_time();
          int v28 = APCLogObject();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v52 = v48;
            _os_log_impl(&dword_237D0E000, v28, OS_LOG_TYPE_INFO, "Decoding completion time: %llu", buf, 0xCu);
          }
        }
        uint64_t v29 = *((void *)this + 35);
        uint64_t v30 = *((void *)this + 36);
        if (v29 != v30 && (((_BYTE)v30 - (_BYTE)v29) & 7) == 0)
        {
          v31 = APCLogObject();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            char v32 = 0;
            uint64_t v33 = *((void *)this + 36);
            uint64_t v34 = -8;
            do
            {
              int v35 = *(unsigned char *)(v33 + v34) & 1 | (2 * (v32 & 0x7F));
              char v32 = *(unsigned char *)(v33 + v34) & 1 | (2 * (v32 & 0x7F));
            }
            while (!__CFADD__(v34++, 1));
            *(_DWORD *)buf = 67109120;
            LODWORD(v52) = v35;
            _os_log_impl(&dword_237D0E000, v31, OS_LOG_TYPE_INFO, "One byte has been decoded: 0x%02X", buf, 8u);
          }
        }
        goto LABEL_10;
      case 1:
        goto LABEL_40;
      case 2:
        goto LABEL_9;
      case 3:
        goto LABEL_10;
      case 4:
        goto LABEL_38;
      default:
        if (v9 == -10)
        {
LABEL_9:
          *((void *)this + 36) = *((void *)this + 35);
LABEL_10:
          a2 += v11;
          BOOL v16 = __OFSUB__(v6, v49);
          v6 -= v49;
          if ((v6 < 0) ^ v16 | (v6 == 0))
          {
LABEL_38:
            int v37 = 0;
            goto LABEL_41;
          }
          continue;
        }
LABEL_40:
        int v37 = -1;
LABEL_41:
        a5 = v45;
        unint64_t v38 = a4;
        if (v37)
        {
LABEL_44:
          *a5 = 0;
          if (!v37) {
            goto LABEL_54;
          }
          goto LABEL_55;
        }
LABEL_42:
        uint64_t v39 = *((void *)this + 35);
        int v40 = *((_DWORD *)this + 5);
        if (*((_DWORD *)this + 72) - (int)v39 < (8 * v40))
        {
          int v37 = 0;
          goto LABEL_44;
        }
        if (v40)
        {
          unint64_t v41 = 0;
          do
          {
            uint64_t v42 = 0;
            char v43 = 0;
            do
              char v43 = *(unsigned char *)(*((void *)this + 35) + 8 * (v41 & 0x1FFFFFFF) + v42++) & 1 | (2 * v43);
            while (v42 != 8);
            *(unsigned char *)unint64_t v38 = v43;
            unint64_t v38 = (uint64_t *)((char *)v38 + 1);
            ++v41;
            unint64_t v44 = *((unsigned int *)this + 5);
          }
          while (v41 < v44);
          uint64_t v39 = *((void *)this + 35);
        }
        else
        {
          LODWORD(v44) = 0;
        }
        *((void *)this + 36) = v39;
        *a5 = v44;
        *unint64_t v38 = v48;
LABEL_54:
        if (v10 == 4) {
LABEL_55:
        }
          EchoCodeDecoder::reset((ShapingFilter **)this);
        return;
    }
  }
}

uint64_t EchoCodeDecoder::convertBitsToByte(EchoCodeDecoder *this, const unsigned __int8 *a2)
{
  uint64_t v2 = 0;
  int v3 = 0;
  do
  {
    int v4 = *((unsigned char *)this + v2++) & 1 | (2 * v3);
    int v3 = v4;
  }
  while (v2 != 8);
  return v4;
}

BOOL EchoCodeDecoder::isInitialized(EchoCodeDecoder *this)
{
  return *((_DWORD *)this + 4) != 0;
}

BOOL non-virtual thunk to'EchoCodeDecoder::isInitialized(EchoCodeDecoder *this)
{
  return *((_DWORD *)this + 2) != 0;
}

uint64_t EchoCodeDecoder::setParams(uint64_t a1, unsigned int a2, void (**a3)(uint64_t))
{
  if (*(_DWORD *)(a1 + 16)) {
    return 4294967287;
  }
  uint64_t result = 4294967290;
  switch(a2)
  {
    case 'd':
      uint64_t v7 = std::any_cast[abi:ne180100]<unsigned int>((uint64_t (**)(uint64_t, void, void, void, void *))a3);
      if (!v7) {
        goto LABEL_18;
      }
      *(_DWORD *)(a1 + 24) = *v7;
      goto LABEL_16;
    case 'e':
      unsigned int v8 = std::any_cast[abi:ne180100]<unsigned int>((uint64_t (**)(uint64_t, void, void, void, void *))a3);
      if (!v8) {
        goto LABEL_18;
      }
      *(_DWORD *)(a1 + 28) = *v8;
      goto LABEL_16;
    case 'i':
      int v9 = std::any_cast[abi:ne180100]<float>((uint64_t (**)(uint64_t, void, void, void, void *))a3);
      if (!v9) {
        goto LABEL_18;
      }
      *(_DWORD *)(a1 + 32) = *v9;
      goto LABEL_16;
    case 'j':
      int v10 = std::any_cast[abi:ne180100]<float>((uint64_t (**)(uint64_t, void, void, void, void *))a3);
      if (!v10) {
        goto LABEL_18;
      }
      *(_DWORD *)(a1 + 36) = *v10;
      goto LABEL_16;
    case 'o':
      uint64_t v11 = std::any_cast[abi:ne180100]<float>((uint64_t (**)(uint64_t, void, void, void, void *))a3);
      if (!v11) {
        goto LABEL_18;
      }
      *(_DWORD *)(a1 + 64) = *v11;
      goto LABEL_16;
    case 'q':
      char v12 = std::any_cast[abi:ne180100]<unsigned int>((uint64_t (**)(uint64_t, void, void, void, void *))a3);
      if (!v12) {
LABEL_18:
      }
        std::__throw_bad_any_cast[abi:ne180100]();
      *(_DWORD *)(a1 + 68) = *v12;
LABEL_16:
      unsigned int v14 = a2;
      uint64_t v15 = &v14;
      unint64_t v13 = std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t **)(a1 + 80), &v14, (uint64_t)&std::piecewise_construct, &v15);
      std::any::operator=[abi:ne180100]((unint64_t *)v13 + 5, a3);
      uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t *std::any::operator=[abi:ne180100](unint64_t *a1, void (**a2)(uint64_t))
{
  v4[8] = *(uint64_t (**)(void, void, void, void, void))MEMORY[0x263EF8340];
  v4[0] = 0;
  v4[1] = 0;
  if (*a2) {
    (*a2)(1);
  }
  if (v4 != (uint64_t (**)(void, void, void, void, void))a1 && *a1 != (unsigned __int128)0) {
    ((void (*)(uint64_t, unint64_t *, uint64_t (**)(void, void, void, void, void), void, void))*a1)(2, a1, v4, 0, 0);
  }
  std::any::reset[abi:ne180100](v4);
  return a1;
}

void sub_237D154F4(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

uint64_t non-virtual thunk to'EchoCodeDecoder::setParams(uint64_t a1, unsigned int a2, void (**a3)(uint64_t))
{
  return EchoCodeDecoder::setParams(a1 - 8, a2, a3);
}

void non-virtual thunk to'EchoCodeDecoder::~EchoCodeDecoder(EchoCodeDecoder *this)
{
}

{
  uint64_t vars8;

  EchoCodeDecoder::~EchoCodeDecoder((EchoCodeDecoder *)((char *)this - 8));

  JUMPOUT(0x237E2DA50);
}

void std::vector<float>::__append(char **a1, unint64_t a2)
{
  int v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  int v5 = v6;
  uint64_t v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 2)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 4 * a2);
      v7 += 4 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    unsigned int v8 = *a1;
    uint64_t v9 = v7 - *a1;
    unint64_t v10 = a2 + (v9 >> 2);
    if (v10 >> 62) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = v9 >> 2;
    uint64_t v12 = v5 - v8;
    if (v12 >> 1 > v10) {
      unint64_t v10 = v12 >> 1;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v13 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v10;
    }
    if (v13)
    {
      unsigned int v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v4, v13);
      unsigned int v8 = *a1;
      uint64_t v7 = a1[1];
    }
    else
    {
      unsigned int v14 = 0;
    }
    uint64_t v15 = &v14[4 * v11];
    BOOL v16 = &v14[4 * v13];
    bzero(v15, 4 * a2);
    unint64_t v17 = &v15[4 * a2];
    while (v7 != v8)
    {
      int v18 = *((_DWORD *)v7 - 1);
      v7 -= 4;
      *((_DWORD *)v15 - EchoCodeDecoder::reset(this - 1) = v18;
      v15 -= 4;
    }
    *a1 = v15;
    a1[1] = v17;
    a1[2] = v16;
    if (v8)
    {
      operator delete(v8);
    }
  }
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(4 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void std::vector<float>::__append(void **a1, unint64_t a2, _DWORD *a3)
{
  unsigned int v8 = a1[2];
  uint64_t v6 = (uint64_t)(a1 + 2);
  uint64_t v7 = v8;
  uint64_t v9 = *(_DWORD **)(v6 - 8);
  if (a2 <= (v8 - (unsigned char *)v9) >> 2)
  {
    if (a2)
    {
      uint64_t v16 = 4 * a2;
      unint64_t v17 = &v9[a2];
      do
      {
        *v9++ = *a3;
        v16 -= 4;
      }
      while (v16);
      uint64_t v9 = v17;
    }
    a1[1] = v9;
  }
  else
  {
    uint64_t v10 = (char *)v9 - (unsigned char *)*a1;
    unint64_t v11 = a2 + (v10 >> 2);
    if (v11 >> 62) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v12 = v10 >> 2;
    uint64_t v13 = v7 - (unsigned char *)*a1;
    if (v13 >> 1 > v11) {
      unint64_t v11 = v13 >> 1;
    }
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v14 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v14 = v11;
    }
    if (v14) {
      uint64_t v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v6, v14);
    }
    else {
      uint64_t v15 = 0;
    }
    int v18 = &v15[4 * v12];
    unint64_t v19 = &v18[4 * a2];
    uint64_t v20 = 4 * a2;
    size_t v21 = v18;
    do
    {
      *(_DWORD *)size_t v21 = *a3;
      v21 += 4;
      v20 -= 4;
    }
    while (v20);
    size_t v22 = &v15[4 * v14];
    vDSP_Length v23 = (char *)*a1;
    for (i = (char *)a1[1]; i != v23; i -= 4)
    {
      int v25 = *((_DWORD *)i - 1);
      *((_DWORD *)v18 - EchoCodeDecoder::reset(this - 1) = v25;
      v18 -= 4;
    }
    *a1 = v18;
    a1[1] = v19;
    a1[2] = v22;
    if (v23)
    {
      operator delete(v23);
    }
  }
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<APCConfigReader::paramData>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(24 * a2);
}

void SyncEchoDetector::SyncEchoDetector(SyncEchoDetector *this)
{
  *((unsigned char *)this + 8) = 0;
  *(void *)this = &unk_26EAE48F0;
  *((_OWORD *)this + 3) = 0u;
  *((void *)this + 24) = 0;
  *((void *)this + 25) = 0;
  *((void *)this + 26) = 0;
  *((_DWORD *)this + 54) = 0;
  *(_OWORD *)((char *)this + 12) = 0u;
  *(_OWORD *)((char *)this + 28) = 0u;
  *((_WORD *)this + 22) = 0;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 8) = 0u;
  *((_OWORD *)this + 9) = 0u;
  *((_OWORD *)this + 10) = 0u;
  *(_OWORD *)((char *)this + 172) = 0u;
  EchoDetector::EchoDetector((SyncEchoDetector *)((char *)this + 224));
  *((_DWORD *)this + 80) = 0;
  *((unsigned char *)this + 324) = 1;
  *(_OWORD *)((char *)this + 328) = 0u;
  *(_OWORD *)((char *)this + 344) = 0u;
}

void sub_237D15928(_Unwind_Exception *exception_object)
{
  uint64_t v4 = v2;
  uint64_t v6 = *v4;
  if (*v4)
  {
    v1[25] = v6;
    operator delete(v6);
  }
  uint64_t v7 = (void *)v1[18];
  if (v7)
  {
    v1[19] = v7;
    operator delete(v7);
  }
  unsigned int v8 = (void *)v1[15];
  if (v8)
  {
    v1[16] = v8;
    operator delete(v8);
  }
  uint64_t v9 = (void *)v1[12];
  if (v9)
  {
    v1[13] = v9;
    operator delete(v9);
  }
  uint64_t v10 = (void *)v1[9];
  if (v10)
  {
    v1[10] = v10;
    operator delete(v10);
  }
  unint64_t v11 = *v3;
  if (*v3)
  {
    v1[7] = v11;
    operator delete(v11);
  }
  _Unwind_Resume(exception_object);
}

uint64_t (**std::any_cast[abi:ne180100]<float>(uint64_t (**result)(uint64_t, void, void, void, void *)))(uint64_t, void, void, void, void *)
{
  if (result)
  {
    if (*result) {
      return (uint64_t (**)(uint64_t, void, void, void, void *))(*result)(3, result, 0, MEMORY[0x263F8C248], &std::__any_imp::__unique_typeinfo<float>::__id);
    }
    else {
      return 0;
    }
  }
  return result;
}

{
  if (result)
  {
    if (*result) {
      return (uint64_t (**)(uint64_t, void, void, void, void *))(*result)(3, result, 0, MEMORY[0x263F8C248], &std::__any_imp::__unique_typeinfo<float>::__id);
    }
    else {
      return 0;
    }
  }
  return result;
}

void APCNullEncoder::APCNullEncoder(APCNullEncoder *this, NullCodecConfiguration *a2)
{
  *(void *)this = &unk_26EAE4410;
}

void *APCNullEncoder::Process(APCNullEncoder *this, const float *a2, float *__dst, int a4)
{
  if (a4) {
    return memmove(__dst, a2, 4 * a4);
  }
  return result;
}

uint64_t APCNullEncoder::Status(APCNullEncoder *this)
{
  return 0;
}

void APCNullDecoder::APCNullDecoder(APCNullDecoder *this, NullCodecConfiguration *a2)
{
  int v3 = a2;
  *(void *)this = &unk_26EAE4448;
  uint64_t v4 = [(AUPasscodeCodecConfiguration *)v3 sampleRate];
  [(NullCodecConfiguration *)v3 retrievalCallbackInterval];
  *((_DWORD *)this + 3) = (int)(float)(v5 * (float)v4);
  int v6 = [(AUPasscodeCodecConfiguration *)v3 payloadLengthBytes];
  *((_DWORD *)this + 4) = v6;
  char v7 = -1;
  std::vector<unsigned char>::vector((void *)this + 3, v6, &v7);
}

void sub_237D15B18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

const void **APCNullDecoder::Process(const void **this, const float *a2, int a3, char *__dst, int *a5)
{
  int v6 = *((_DWORD *)this + 3);
  int v7 = *((_DWORD *)this + 2) + a3;
  *((_DWORD *)this + 2) = v7;
  if (v7 >= v6)
  {
    uint64_t v9 = this;
    if (__dst)
    {
      if (a5)
      {
        size_t v10 = *((int *)this + 4);
        if (*a5 >= (int)v10)
        {
          this = (const void **)memcpy(__dst, this[3], v10);
          *a5 = *((_DWORD *)v9 + 4);
          *(void *)&__dst[*((int *)v9 + 4)] = 0;
        }
      }
    }
    *((_DWORD *)v9 + 2) = 0;
  }
  else if (a5)
  {
    *a5 = 0;
  }
  return this;
}

void APCNullDecoder::~APCNullDecoder(APCNullDecoder *this)
{
  uint64_t v2 = (void *)*((void *)this + 3);
  if (v2)
  {
    *((void *)this + 4) = v2;
    operator delete(v2);
  }
}

{
  void *v2;
  uint64_t vars8;

  uint64_t v2 = (void *)*((void *)this + 3);
  if (v2)
  {
    *((void *)this + 4) = v2;
    operator delete(v2);
  }

  JUMPOUT(0x237E2DA50);
}

void APCNullEncoder::~APCNullEncoder(APCNullEncoder *this)
{
}

void *std::vector<unsigned char>::vector(void *a1, size_t a2, unsigned char *a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    size_t v5 = a2;
    std::vector<unsigned char>::__vallocate[abi:ne180100](a1, a2);
    int v6 = (unsigned char *)a1[1];
    int v7 = &v6[v5];
    do
    {
      *v6++ = *a3;
      --v5;
    }
    while (v5);
    a1[1] = v7;
  }
  return a1;
}

void sub_237D15CBC(_Unwind_Exception *exception_object)
{
  int v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<unsigned char>::__vallocate[abi:ne180100](void *a1, size_t __sz)
{
  if ((__sz & 0x8000000000000000) != 0) {
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

void sub_237D16524(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id a32)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);

  _Block_object_dispose((const void *)(v33 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_237D166CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237D16CA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_237D16E0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  unint64_t v11 = v10;

  _Unwind_Resume(a1);
}

void sub_237D17224(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237D173DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237D17484(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_237D17624(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237D17BF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237D17D90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237D17E64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237D17F38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237D17FD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_237D180CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_237D18208(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237D18340(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237D183C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_237D1849C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id APCLogObject(void)
{
  v0 = &NewAudioCapturer(AudioCapturerOptions,char const*,char const*,unsigned int,AudioStreamBasicDescription const*,AudioStreamBasicDescription const&)::sImplFunction;
  {
    v0 = &NewAudioCapturer(AudioCapturerOptions,char const*,char const*,unsigned int,AudioStreamBasicDescription const*,AudioStreamBasicDescription const&)::sImplFunction;
    if (v3)
    {
      APCLogObject(void)::sLogObject = (uint64_t)os_log_create("com.apple.audiopasscode", "");
      v0 = &NewAudioCapturer(AudioCapturerOptions,char const*,char const*,unsigned int,AudioStreamBasicDescription const*,AudioStreamBasicDescription const&)::sImplFunction;
    }
  }
  uint64_t v1 = v0[4];

  return v1;
}

void sub_237D1884C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237D1891C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237D18A28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void EchoCodeEncoder::EchoCodeEncoder(EchoCodeEncoder *this)
{
  *(void *)this = &unk_26EAE44D0;
  *((void *)this + EchoCodeDecoder::reset(this - 1) = &unk_26EAE4540;
  *(void *)((char *)this + 52) = 0;
  *(void *)((char *)this + 60) = 0x6400000000;
  *((_OWORD *)this + EchoCodeDecoder::reset(this - 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_WORD *)this + 24) = 0;
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 88) = 0u;
  *((void *)this + 20) = 0;
  *((void *)this + 19) = (char *)this + 160;
  *((void *)this + 2EchoCodeDecoder::reset(this - 1) = 0;
  *(_OWORD *)((char *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  operator new();
}

void sub_237D18B84(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::destroy(v4, *(void **)(v1 + 160));
  int v7 = *(void **)(v1 + 128);
  if (v7)
  {
    *(void *)(v1 + 136) = v7;
    operator delete(v7);
  }
  unsigned int v8 = *(void **)(v1 + 104);
  if (v8)
  {
    *(void *)(v1 + 112) = v8;
    operator delete(v8);
  }
  uint64_t v9 = *(void *)(v1 + 96);
  *(void *)(v1 + 96) = 0;
  if (v9) {
    (*(void (**)(uint64_t))(*(void *)v9 + 8))(v9);
  }
  uint64_t v10 = *v2;
  uint64_t *v2 = 0;
  if (v10) {
    std::default_delete<ShapingFilter>::operator()[abi:ne180100]((uint64_t)v2, v10);
  }
  uint64_t v11 = *v3;
  uint64_t *v3 = 0;
  if (v11) {
    std::default_delete<ShapingFilter>::operator()[abi:ne180100]((uint64_t)v3, v11);
  }
  uint64_t v12 = *v5;
  uint64_t *v5 = 0;
  if (v12) {
    (*(void (**)(uint64_t))(*(void *)v12 + 8))(v12);
  }
  _Unwind_Resume(a1);
}

uint64_t EchoCodeEncoder::initialize(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t result = EchoCodeEncoder::loadAPCConfig(a1, a2);
  if (!result)
  {
    unsigned int v4 = *(_DWORD *)(a1 + 20);
    if (!v4)
    {
      unsigned int v4 = 2048;
      *(_DWORD *)(a1 + 20) = 2048;
    }
    if (!*(_DWORD *)(a1 + 28)) {
      *(_DWORD *)(a1 + 28) = 2;
    }
    if (*(float *)(a1 + 36) == 0.0) {
      *(_DWORD *)(a1 + 36) = 1056964608;
    }
    if (*(float *)(a1 + 52) == 0.0) {
      *(_DWORD *)(a1 + 52) = 1008981770;
    }
    if (*(float *)(a1 + 60) == 0.0) {
      *(_DWORD *)(a1 + 60) = 1183621120;
    }
    if (!*(unsigned char *)(a1 + 49)) {
      *(_WORD *)(a1 + 48) = 257;
    }
    if (!*(_DWORD *)(a1 + 64)) {
      *(_DWORD *)(a1 + 64) = 100;
    }
    size_t v5 = APCLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      double v6 = (float)((float)*(unsigned int *)(a1 + 64) / 100.0);
      int v12 = 134217984;
      double v13 = v6;
      _os_log_impl(&dword_237D0E000, v5, OS_LOG_TYPE_INFO, "APC encoder algorithm version: %3.2f", (uint8_t *)&v12, 0xCu);
    }

    BOOL SyncType = echoCodec::getSyncType((echoCodec *)*(unsigned int *)(a1 + 64));
    if (SyncType) {
      operator new();
    }
    if (!SyncType) {
      operator new();
    }
    uint64_t v10 = *(void *)(a1 + 72);
    *(void *)(a1 + 72) = 0;
    if (v10) {
      (*(void (**)(uint64_t))(*(void *)v10 + 8))(v10);
    }
    uint64_t v11 = *(void *)(a1 + 96);
    *(void *)(a1 + 96) = 0;
    if (v11) {
      (*(void (**)(uint64_t))(*(void *)v11 + 8))(v11);
    }
    *(_DWORD *)(a1 + 20) = echoCodec::getSRCFreeFrameSize((echoCodec *)*(unsigned int *)(a1 + 20), *(_DWORD *)(a1 + 16));
    *(_DWORD *)(a1 + 32) = *(_DWORD *)(a1 + 28) * *(_DWORD *)(a1 + 20)
                         - echoCodec::getSRCFreeFrameSize((echoCodec *)(v4 >> 2), *(_DWORD *)(a1 + 16));
    ShapingFilter::initialize(*(void *)(a1 + 80), 0, *(_DWORD *)(a1 + 16), 1u, 1, *(float *)(a1 + 60));
    ShapingFilter::initialize(*(void *)(a1 + 88), 1, *(_DWORD *)(a1 + 16), 1u, 1, *(float *)(a1 + 60));
    (*(void (**)(void, void, void, uint64_t))(**(void **)(a1 + 72) + 16))(*(void *)(a1 + 72), *(unsigned int *)(a1 + 16), *(unsigned int *)(a1 + 32), a1 + 152);
    unsigned int v8 = *(_DWORD *)(a1 + 56);
    if (!v8) {
      unsigned int v8 = (float)(*(float *)(a1 + 36) * (float)*(unsigned int *)(a1 + 16));
    }
    *(_DWORD *)(a1 + 24) = v8;
    (*(void (**)(void, uint64_t))(**(void **)(a1 + 96) + 32))(*(void *)(a1 + 96), a1 + 152);
    if (*(unsigned char *)(a1 + 49)) {
      BOOL v9 = *(unsigned char *)(a1 + 48) != 0;
    }
    else {
      BOOL v9 = 0;
    }
    if ((*(unsigned int (**)(void, void, void, void, BOOL))(**(void **)(a1 + 96) + 16))(*(void *)(a1 + 96), *(unsigned int *)(a1 + 16), *(unsigned int *)(a1 + 20), *(unsigned int *)(a1 + 24), v9))
    {
      std::vector<float>::resize(a1 + 104, *(unsigned int *)(a1 + 20));
      std::vector<float>::resize(a1 + 128, *(unsigned int *)(a1 + 20));
      return 0;
    }
    else
    {
      return 4294967290;
    }
  }
  return result;
}

void sub_237D19164(_Unwind_Exception *a1)
{
  MEMORY[0x237E2DA50](v1, 0x10B1C40F6DE9BE1);
  _Unwind_Resume(a1);
}

uint64_t EchoCodeEncoder::loadAPCConfig(uint64_t a1, uint64_t a2)
{
  v82 = 0;
  uint64_t v83 = a2;
  __p = 0;
  v81 = 0;
  unsigned int v4 = std::__allocate_at_least[abi:ne180100]<std::allocator<APCConfigReader::paramData>>((uint64_t)&v82, 1uLL);
  size_t v5 = 0;
  double v6 = (char *)&v4[3 * v3];
  *(_DWORD *)unsigned int v4 = 0;
  v4[1] = a1 + 16;
  *((_DWORD *)v4 + 4) = 1;
  int v7 = (char *)(v4 + 3);
  unsigned int v8 = v81;
  BOOL v9 = (char *)v4;
  if (v81)
  {
    do
    {
      long long v10 = *(_OWORD *)(v8 - 24);
      *((_DWORD *)v9 - 2) = *((_DWORD *)v8 - 2);
      *(_OWORD *)(v9 - 24) = v10;
      v9 -= 24;
      v8 -= 24;
    }
    while (v8);
    size_t v5 = __p;
  }
  __p = v9;
  v81 = (char *)(v4 + 3);
  v82 = (char *)&v4[3 * v3];
  if (v5)
  {
    operator delete(v5);
    double v6 = v82;
  }
  v81 = (char *)(v4 + 3);
  uint64_t v11 = a1 + 40;
  if (v7 >= v6)
  {
    unint64_t v13 = 0xAAAAAAAAAAAAAAABLL * ((v7 - (unsigned char *)__p) >> 3);
    if (v13 + 1 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * ((v6 - (unsigned char *)__p) >> 3);
    uint64_t v15 = 2 * v14;
    if (2 * v14 <= v13 + 1) {
      uint64_t v15 = v13 + 1;
    }
    if (v14 >= 0x555555555555555) {
      unint64_t v16 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v16 = v15;
    }
    if (v16) {
      unint64_t v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<APCConfigReader::paramData>>((uint64_t)&v82, v16);
    }
    else {
      unint64_t v17 = 0;
    }
    int v18 = &v17[8 * ((v7 - (unsigned char *)__p) >> 3)];
    unint64_t v19 = &v17[24 * v16];
    *(_DWORD *)int v18 = 3;
    *((void *)v18 + EchoCodeDecoder::reset(this - 1) = v11;
    *((_DWORD *)v18 + 4) = 1;
    int v12 = v18 + 24;
    size_t v21 = (char *)__p;
    uint64_t v20 = v81;
    if (v81 != __p)
    {
      do
      {
        long long v22 = *(_OWORD *)(v20 - 24);
        *((_DWORD *)v18 - 2) = *((_DWORD *)v20 - 2);
        *(_OWORD *)(v18 - 24) = v22;
        v18 -= 24;
        v20 -= 24;
      }
      while (v20 != v21);
      uint64_t v20 = (char *)__p;
    }
    __p = v18;
    v81 = v12;
    v82 = v19;
    if (v20) {
      operator delete(v20);
    }
  }
  else
  {
    *((_DWORD *)v4 + 6) = 3;
    v4[4] = v11;
    *((_DWORD *)v4 + 10) = 1;
    int v12 = (char *)(v4 + 6);
  }
  v81 = v12;
  uint64_t v23 = a1 + 56;
  if (v12 >= v82)
  {
    unint64_t v25 = 0xAAAAAAAAAAAAAAABLL * ((v12 - (unsigned char *)__p) >> 3);
    if (v25 + 1 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v26 = 0x5555555555555556 * ((v82 - (unsigned char *)__p) >> 3);
    if (v26 <= v25 + 1) {
      unint64_t v26 = v25 + 1;
    }
    if (0xAAAAAAAAAAAAAAABLL * ((v82 - (unsigned char *)__p) >> 3) >= 0x555555555555555) {
      unint64_t v27 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v27 = v26;
    }
    if (v27) {
      int v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<APCConfigReader::paramData>>((uint64_t)&v82, v27);
    }
    else {
      int v28 = 0;
    }
    uint64_t v29 = &v28[24 * v25];
    uint64_t v30 = &v28[24 * v27];
    *(_DWORD *)uint64_t v29 = 108;
    *((void *)v29 + EchoCodeDecoder::reset(this - 1) = v23;
    *((_DWORD *)v29 + 4) = 1;
    unsigned int v24 = v29 + 24;
    char v32 = (char *)__p;
    v31 = v81;
    if (v81 != __p)
    {
      do
      {
        long long v33 = *(_OWORD *)(v31 - 24);
        *((_DWORD *)v29 - 2) = *((_DWORD *)v31 - 2);
        *(_OWORD *)(v29 - 24) = v33;
        v29 -= 24;
        v31 -= 24;
      }
      while (v31 != v32);
      v31 = (char *)__p;
    }
    __p = v29;
    v81 = v24;
    v82 = v30;
    if (v31) {
      operator delete(v31);
    }
  }
  else
  {
    *(_DWORD *)int v12 = 108;
    *((void *)v12 + EchoCodeDecoder::reset(this - 1) = v23;
    *((_DWORD *)v12 + 4) = 1;
    unsigned int v24 = v12 + 24;
  }
  v81 = v24;
  uint64_t v34 = a1 + 52;
  if (v24 >= v82)
  {
    unint64_t v36 = 0xAAAAAAAAAAAAAAABLL * ((v24 - (unsigned char *)__p) >> 3);
    if (v36 + 1 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v37 = 0x5555555555555556 * ((v82 - (unsigned char *)__p) >> 3);
    if (v37 <= v36 + 1) {
      unint64_t v37 = v36 + 1;
    }
    if (0xAAAAAAAAAAAAAAABLL * ((v82 - (unsigned char *)__p) >> 3) >= 0x555555555555555) {
      unint64_t v38 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v38 = v37;
    }
    if (v38) {
      uint64_t v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<APCConfigReader::paramData>>((uint64_t)&v82, v38);
    }
    else {
      uint64_t v39 = 0;
    }
    int v40 = &v39[24 * v36];
    unint64_t v41 = &v39[24 * v38];
    *(_DWORD *)int v40 = 103;
    *((void *)v40 + EchoCodeDecoder::reset(this - 1) = v34;
    *((_DWORD *)v40 + 4) = 0;
    int v35 = v40 + 24;
    char v43 = (char *)__p;
    uint64_t v42 = v81;
    if (v81 != __p)
    {
      do
      {
        long long v44 = *(_OWORD *)(v42 - 24);
        *((_DWORD *)v40 - 2) = *((_DWORD *)v42 - 2);
        *(_OWORD *)(v40 - 24) = v44;
        v40 -= 24;
        v42 -= 24;
      }
      while (v42 != v43);
      uint64_t v42 = (char *)__p;
    }
    __p = v40;
    v81 = v35;
    v82 = v41;
    if (v42) {
      operator delete(v42);
    }
  }
  else
  {
    *(_DWORD *)unsigned int v24 = 103;
    *((void *)v24 + EchoCodeDecoder::reset(this - 1) = v34;
    *((_DWORD *)v24 + 4) = 0;
    int v35 = v24 + 24;
  }
  v81 = v35;
  uint64_t v45 = a1 + 60;
  if (v35 >= v82)
  {
    unint64_t v47 = 0xAAAAAAAAAAAAAAABLL * ((v35 - (unsigned char *)__p) >> 3);
    if (v47 + 1 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v48 = 0x5555555555555556 * ((v82 - (unsigned char *)__p) >> 3);
    if (v48 <= v47 + 1) {
      unint64_t v48 = v47 + 1;
    }
    if (0xAAAAAAAAAAAAAAABLL * ((v82 - (unsigned char *)__p) >> 3) >= 0x555555555555555) {
      unint64_t v49 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v49 = v48;
    }
    if (v49) {
      unsigned __int8 v50 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<APCConfigReader::paramData>>((uint64_t)&v82, v49);
    }
    else {
      unsigned __int8 v50 = 0;
    }
    v51 = &v50[24 * v47];
    uint64_t v52 = &v50[24 * v49];
    *(_DWORD *)v51 = 111;
    *((void *)v51 + EchoCodeDecoder::reset(this - 1) = v45;
    *((_DWORD *)v51 + 4) = 0;
    v46 = v51 + 24;
    v54 = (char *)__p;
    uint64_t v53 = v81;
    if (v81 != __p)
    {
      do
      {
        long long v55 = *(_OWORD *)(v53 - 24);
        *((_DWORD *)v51 - 2) = *((_DWORD *)v53 - 2);
        *(_OWORD *)(v51 - 24) = v55;
        v51 -= 24;
        v53 -= 24;
      }
      while (v53 != v54);
      uint64_t v53 = (char *)__p;
    }
    __p = v51;
    v81 = v46;
    v82 = v52;
    if (v53) {
      operator delete(v53);
    }
  }
  else
  {
    *(_DWORD *)int v35 = 111;
    *((void *)v35 + EchoCodeDecoder::reset(this - 1) = v45;
    *((_DWORD *)v35 + 4) = 0;
    v46 = v35 + 24;
  }
  v81 = v46;
  uint64_t v56 = a1 + 48;
  if (v46 >= v82)
  {
    unint64_t v58 = 0xAAAAAAAAAAAAAAABLL * ((v46 - (unsigned char *)__p) >> 3);
    if (v58 + 1 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v59 = 0x5555555555555556 * ((v82 - (unsigned char *)__p) >> 3);
    if (v59 <= v58 + 1) {
      unint64_t v59 = v58 + 1;
    }
    if (0xAAAAAAAAAAAAAAABLL * ((v82 - (unsigned char *)__p) >> 3) >= 0x555555555555555) {
      unint64_t v60 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v60 = v59;
    }
    if (v60) {
      v61 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<APCConfigReader::paramData>>((uint64_t)&v82, v60);
    }
    else {
      v61 = 0;
    }
    v62 = &v61[24 * v58];
    v63 = &v61[24 * v60];
    *(_DWORD *)v62 = 112;
    *((void *)v62 + EchoCodeDecoder::reset(this - 1) = v56;
    *((_DWORD *)v62 + 4) = 5;
    v57 = v62 + 24;
    v65 = (char *)__p;
    v64 = v81;
    if (v81 != __p)
    {
      do
      {
        long long v66 = *(_OWORD *)(v64 - 24);
        *((_DWORD *)v62 - 2) = *((_DWORD *)v64 - 2);
        *(_OWORD *)(v62 - 24) = v66;
        v62 -= 24;
        v64 -= 24;
      }
      while (v64 != v65);
      v64 = (char *)__p;
    }
    __p = v62;
    v81 = v57;
    v82 = v63;
    if (v64) {
      operator delete(v64);
    }
  }
  else
  {
    *(_DWORD *)v46 = 112;
    *((void *)v46 + EchoCodeDecoder::reset(this - 1) = v56;
    *((_DWORD *)v46 + 4) = 5;
    v57 = v46 + 24;
  }
  v81 = v57;
  uint64_t v67 = a1 + 64;
  if (v57 >= v82)
  {
    unint64_t v69 = 0xAAAAAAAAAAAAAAABLL * ((v57 - (unsigned char *)__p) >> 3);
    if (v69 + 1 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v70 = 0x5555555555555556 * ((v82 - (unsigned char *)__p) >> 3);
    if (v70 <= v69 + 1) {
      unint64_t v70 = v69 + 1;
    }
    if (0xAAAAAAAAAAAAAAABLL * ((v82 - (unsigned char *)__p) >> 3) >= 0x555555555555555) {
      unint64_t v71 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v71 = v70;
    }
    if (v71) {
      v72 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<APCConfigReader::paramData>>((uint64_t)&v82, v71);
    }
    else {
      v72 = 0;
    }
    v73 = &v72[24 * v69];
    v74 = &v72[24 * v71];
    *(_DWORD *)v73 = 113;
    *((void *)v73 + EchoCodeDecoder::reset(this - 1) = v67;
    *((_DWORD *)v73 + 4) = 1;
    v68 = v73 + 24;
    v76 = (char *)__p;
    v75 = v81;
    if (v81 != __p)
    {
      do
      {
        long long v77 = *(_OWORD *)(v75 - 24);
        *((_DWORD *)v73 - 2) = *((_DWORD *)v75 - 2);
        *(_OWORD *)(v73 - 24) = v77;
        v73 -= 24;
        v75 -= 24;
      }
      while (v75 != v76);
      v75 = (char *)__p;
    }
    __p = v73;
    v81 = v68;
    v82 = v74;
    if (v75) {
      operator delete(v75);
    }
  }
  else
  {
    *(_DWORD *)v57 = 113;
    *((void *)v57 + EchoCodeDecoder::reset(this - 1) = v67;
    *((_DWORD *)v57 + 4) = 1;
    v68 = v57 + 24;
  }
  v81 = v68;
  uint64_t v78 = APCConfigReader::loadParams((uint64_t)&v83, &__p);
  if (__p)
  {
    v81 = (char *)__p;
    operator delete(__p);
  }
  return v78;
}

void sub_237D19870(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t non-virtual thunk to'EchoCodeEncoder::initialize(uint64_t a1, uint64_t a2)
{
  return EchoCodeEncoder::initialize(a1 - 8, a2);
}

uint64_t EchoCodeEncoder::encode(EchoCodeEncoder *this, const float *a2, float *a3, vDSP_Length a4)
{
  v19[4] = *MEMORY[0x263EF8340];
  ShapingFilter::filter(*((ShapingFilter **)this + 10), a2, a3, a4);
  vDSP_vclr(*((float **)this + 13), 1, (uint64_t)(*((void *)this + 14) - *((void *)this + 13)) >> 2);
  uint64_t v7 = *((void *)this + 12);
  v19[0] = &unk_26EAE45E0;
  v19[1] = this;
  v19[3] = v19;
  int v8 = (*(uint64_t (**)(uint64_t, char *, vDSP_Length, void *))(*(void *)v7 + 40))(v7, (char *)this + 104, a4, v19);
  std::__function::__value_func<void ()(float *,unsigned int)>::~__value_func[abi:ne180100](v19);
  unsigned int v9 = v8 & ~(v8 >> 31);
  int v10 = a4 - v9;
  if ((int)(a4 - v9) < 1)
  {
    BOOL v15 = 1;
LABEL_11:
    unint64_t v17 = (float *)*((void *)this + 13);
    unint64_t v16 = (const float **)((char *)this + 104);
    ShapingFilter::filter((ShapingFilter *)*(v16 - 2), v17, v17, a4);
    vDSP_vadd(*v16, 1, a3, 1, a3, 1, a4);
  }
  else
  {
    uint64_t v11 = (float *)(*((void *)this + 13) + 4 * v9);
    while (1)
    {
      unsigned int v12 = *((_DWORD *)this + 5);
      vDSP_Length v13 = v10 >= v12 ? v12 : v10;
      if (!EchoEmbedder::encodeEcho(*((EchoEmbedder **)this + 9), v11, v13)) {
        return 4294967290;
      }
      v11 += v13;
      BOOL v14 = __OFSUB__(v10, v13);
      v10 -= v13;
      if ((v10 < 0) ^ v14 | (v10 == 0))
      {
        BOOL v15 = *(_DWORD *)(*((void *)this + 9) + 120) < *(_DWORD *)(*((void *)this + 9) + 168);
        goto LABEL_11;
      }
    }
  }
  return v15;
}

void sub_237D19A44(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__function::__value_func<void ()(float *,unsigned int)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t non-virtual thunk to'EchoCodeEncoder::encode(EchoCodeEncoder *this, const float *a2, float *a3, vDSP_Length a4)
{
  return EchoCodeEncoder::encode((EchoCodeEncoder *)((char *)this - 8), a2, a3, a4);
}

EchoCodeEncoder *EchoCodeEncoder::Process(EchoCodeEncoder *this, const float *a2, float *a3, int a4)
{
  if (a4 >= 1)
  {
    int v4 = a4;
    uint64_t v7 = this;
    do
    {
      unsigned int v8 = *((_DWORD *)v7 + 5);
      if (v8 >= v4) {
        vDSP_Length v9 = v4;
      }
      else {
        vDSP_Length v9 = v8;
      }
      this = (EchoCodeEncoder *)EchoCodeEncoder::encode(v7, a2, a3, v9);
      a2 += v9;
      a3 += v9;
      v4 -= v9;
    }
    while (v4 >= 1 && this < 2);
  }
  return this;
}

float EchoCodeEncoder::evaluateCarrier(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t **a4)
{
  v120[4] = *(_DWORD **)MEMORY[0x263EF8340];
  uint64_t v117 = 0;
  uint64_t v118 = 0;
  uint64_t v115 = 0;
  uint64_t v116 = 0;
  __int16 v114 = 0;
  v112 = 0;
  v113 = a4;
  __p = 0;
  v111 = 0;
  double v6 = std::__allocate_at_least[abi:ne180100]<std::allocator<APCConfigReader::paramData>>((uint64_t)&v112, 1uLL);
  uint64_t v7 = 0;
  unsigned int v8 = (char *)&v6[3 * v5];
  *(_DWORD *)double v6 = 0;
  v6[1] = (char *)&v118 + 4;
  *((_DWORD *)v6 + 4) = 1;
  vDSP_Length v9 = (char *)(v6 + 3);
  int v10 = v111;
  uint64_t v11 = (char *)v6;
  if (v111)
  {
    do
    {
      long long v12 = *(_OWORD *)(v10 - 24);
      *((_DWORD *)v11 - 2) = *((_DWORD *)v10 - 2);
      *(_OWORD *)(v11 - 24) = v12;
      v11 -= 24;
      v10 -= 24;
    }
    while (v10);
    uint64_t v7 = __p;
  }
  __p = v11;
  v111 = (char *)(v6 + 3);
  v112 = (char *)&v6[3 * v5];
  if (v7)
  {
    operator delete(v7);
    unsigned int v8 = v112;
  }
  v111 = (char *)(v6 + 3);
  if (v9 >= v8)
  {
    unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * ((v9 - (unsigned char *)__p) >> 3);
    if (v14 + 1 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * ((v8 - (unsigned char *)__p) >> 3);
    uint64_t v16 = 2 * v15;
    if (2 * v15 <= v14 + 1) {
      uint64_t v16 = v14 + 1;
    }
    if (v15 >= 0x555555555555555) {
      unint64_t v17 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v17 = v16;
    }
    if (v17) {
      int v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<APCConfigReader::paramData>>((uint64_t)&v112, v17);
    }
    else {
      int v18 = 0;
    }
    unint64_t v19 = &v18[24 * v14];
    uint64_t v20 = &v18[24 * v17];
    *(_DWORD *)unint64_t v19 = 3;
    *((void *)v19 + EchoCodeDecoder::reset(this - 1) = &v118;
    *((_DWORD *)v19 + 4) = 1;
    vDSP_Length v13 = v19 + 24;
    size_t v21 = v111;
    long long v22 = (char *)__p;
    if (v111 != __p)
    {
      do
      {
        long long v23 = *(_OWORD *)(v21 - 24);
        *((_DWORD *)v19 - 2) = *((_DWORD *)v21 - 2);
        *(_OWORD *)(v19 - 24) = v23;
        v19 -= 24;
        v21 -= 24;
      }
      while (v21 != v22);
      size_t v21 = (char *)__p;
    }
    __p = v19;
    v111 = v13;
    v112 = v20;
    if (v21) {
      operator delete(v21);
    }
  }
  else
  {
    *((_DWORD *)v6 + 6) = 3;
    v6[4] = &v118;
    *((_DWORD *)v6 + 10) = 1;
    vDSP_Length v13 = (char *)(v6 + 6);
  }
  v111 = v13;
  if (v13 >= v112)
  {
    unint64_t v25 = 0xAAAAAAAAAAAAAAABLL * ((v13 - (unsigned char *)__p) >> 3);
    if (v25 + 1 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v26 = 0x5555555555555556 * ((v112 - (unsigned char *)__p) >> 3);
    if (v26 <= v25 + 1) {
      unint64_t v26 = v25 + 1;
    }
    if (0xAAAAAAAAAAAAAAABLL * ((v112 - (unsigned char *)__p) >> 3) >= 0x555555555555555) {
      unint64_t v27 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v27 = v26;
    }
    if (v27) {
      int v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<APCConfigReader::paramData>>((uint64_t)&v112, v27);
    }
    else {
      int v28 = 0;
    }
    uint64_t v29 = &v28[24 * v25];
    uint64_t v30 = &v28[24 * v27];
    *(_DWORD *)uint64_t v29 = 100;
    *((void *)v29 + EchoCodeDecoder::reset(this - 1) = (char *)&v117 + 4;
    *((_DWORD *)v29 + 4) = 1;
    unsigned int v24 = v29 + 24;
    v31 = v111;
    char v32 = (char *)__p;
    if (v111 != __p)
    {
      do
      {
        long long v33 = *(_OWORD *)(v31 - 24);
        *((_DWORD *)v29 - 2) = *((_DWORD *)v31 - 2);
        *(_OWORD *)(v29 - 24) = v33;
        v29 -= 24;
        v31 -= 24;
      }
      while (v31 != v32);
      v31 = (char *)__p;
    }
    __p = v29;
    v111 = v24;
    v112 = v30;
    if (v31) {
      operator delete(v31);
    }
  }
  else
  {
    *(_DWORD *)vDSP_Length v13 = 100;
    *((void *)v13 + EchoCodeDecoder::reset(this - 1) = (char *)&v117 + 4;
    *((_DWORD *)v13 + 4) = 1;
    unsigned int v24 = v13 + 24;
  }
  v111 = v24;
  if (v24 >= v112)
  {
    unint64_t v35 = 0xAAAAAAAAAAAAAAABLL * ((v24 - (unsigned char *)__p) >> 3);
    if (v35 + 1 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v36 = 0x5555555555555556 * ((v112 - (unsigned char *)__p) >> 3);
    if (v36 <= v35 + 1) {
      unint64_t v36 = v35 + 1;
    }
    if (0xAAAAAAAAAAAAAAABLL * ((v112 - (unsigned char *)__p) >> 3) >= 0x555555555555555) {
      unint64_t v37 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v37 = v36;
    }
    if (v37) {
      unint64_t v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<APCConfigReader::paramData>>((uint64_t)&v112, v37);
    }
    else {
      unint64_t v38 = 0;
    }
    uint64_t v39 = &v38[24 * v35];
    int v40 = &v38[24 * v37];
    *(_DWORD *)uint64_t v39 = 101;
    *((void *)v39 + EchoCodeDecoder::reset(this - 1) = &v117;
    *((_DWORD *)v39 + 4) = 1;
    uint64_t v34 = v39 + 24;
    unint64_t v41 = v111;
    uint64_t v42 = (char *)__p;
    if (v111 != __p)
    {
      do
      {
        long long v43 = *(_OWORD *)(v41 - 24);
        *((_DWORD *)v39 - 2) = *((_DWORD *)v41 - 2);
        *(_OWORD *)(v39 - 24) = v43;
        v39 -= 24;
        v41 -= 24;
      }
      while (v41 != v42);
      unint64_t v41 = (char *)__p;
    }
    __p = v39;
    v111 = v34;
    v112 = v40;
    if (v41) {
      operator delete(v41);
    }
  }
  else
  {
    *(_DWORD *)unsigned int v24 = 101;
    *((void *)v24 + EchoCodeDecoder::reset(this - 1) = &v117;
    *((_DWORD *)v24 + 4) = 1;
    uint64_t v34 = v24 + 24;
  }
  v111 = v34;
  if (v34 >= v112)
  {
    unint64_t v45 = 0xAAAAAAAAAAAAAAABLL * ((v34 - (unsigned char *)__p) >> 3);
    if (v45 + 1 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v46 = 0x5555555555555556 * ((v112 - (unsigned char *)__p) >> 3);
    if (v46 <= v45 + 1) {
      unint64_t v46 = v45 + 1;
    }
    if (0xAAAAAAAAAAAAAAABLL * ((v112 - (unsigned char *)__p) >> 3) >= 0x555555555555555) {
      unint64_t v47 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v47 = v46;
    }
    if (v47) {
      unint64_t v48 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<APCConfigReader::paramData>>((uint64_t)&v112, v47);
    }
    else {
      unint64_t v48 = 0;
    }
    unint64_t v49 = &v48[24 * v45];
    unsigned __int8 v50 = &v48[24 * v47];
    *(_DWORD *)unint64_t v49 = 102;
    *((void *)v49 + EchoCodeDecoder::reset(this - 1) = (char *)&v116 + 4;
    *((_DWORD *)v49 + 4) = 0;
    long long v44 = v49 + 24;
    v51 = v111;
    uint64_t v52 = (char *)__p;
    if (v111 != __p)
    {
      do
      {
        long long v53 = *(_OWORD *)(v51 - 24);
        *((_DWORD *)v49 - 2) = *((_DWORD *)v51 - 2);
        *(_OWORD *)(v49 - 24) = v53;
        v49 -= 24;
        v51 -= 24;
      }
      while (v51 != v52);
      v51 = (char *)__p;
    }
    __p = v49;
    v111 = v44;
    v112 = v50;
    if (v51) {
      operator delete(v51);
    }
  }
  else
  {
    *(_DWORD *)uint64_t v34 = 102;
    *((void *)v34 + EchoCodeDecoder::reset(this - 1) = (char *)&v116 + 4;
    *((_DWORD *)v34 + 4) = 0;
    long long v44 = v34 + 24;
  }
  v111 = v44;
  if (v44 >= v112)
  {
    unint64_t v55 = 0xAAAAAAAAAAAAAAABLL * ((v44 - (unsigned char *)__p) >> 3);
    if (v55 + 1 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v56 = 0x5555555555555556 * ((v112 - (unsigned char *)__p) >> 3);
    if (v56 <= v55 + 1) {
      unint64_t v56 = v55 + 1;
    }
    if (0xAAAAAAAAAAAAAAABLL * ((v112 - (unsigned char *)__p) >> 3) >= 0x555555555555555) {
      unint64_t v57 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v57 = v56;
    }
    if (v57) {
      unint64_t v58 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<APCConfigReader::paramData>>((uint64_t)&v112, v57);
    }
    else {
      unint64_t v58 = 0;
    }
    unint64_t v59 = &v58[24 * v55];
    unint64_t v60 = &v58[24 * v57];
    *(_DWORD *)unint64_t v59 = 103;
    *((void *)v59 + EchoCodeDecoder::reset(this - 1) = &v116;
    *((_DWORD *)v59 + 4) = 0;
    v54 = v59 + 24;
    v61 = v111;
    v62 = (char *)__p;
    if (v111 != __p)
    {
      do
      {
        long long v63 = *(_OWORD *)(v61 - 24);
        *((_DWORD *)v59 - 2) = *((_DWORD *)v61 - 2);
        *(_OWORD *)(v59 - 24) = v63;
        v59 -= 24;
        v61 -= 24;
      }
      while (v61 != v62);
      v61 = (char *)__p;
    }
    __p = v59;
    v111 = v54;
    v112 = v60;
    if (v61) {
      operator delete(v61);
    }
  }
  else
  {
    *(_DWORD *)long long v44 = 103;
    *((void *)v44 + EchoCodeDecoder::reset(this - 1) = &v116;
    *((_DWORD *)v44 + 4) = 0;
    v54 = v44 + 24;
  }
  v111 = v54;
  if (v54 >= v112)
  {
    unint64_t v65 = 0xAAAAAAAAAAAAAAABLL * ((v54 - (unsigned char *)__p) >> 3);
    if (v65 + 1 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v66 = 0x5555555555555556 * ((v112 - (unsigned char *)__p) >> 3);
    if (v66 <= v65 + 1) {
      unint64_t v66 = v65 + 1;
    }
    if (0xAAAAAAAAAAAAAAABLL * ((v112 - (unsigned char *)__p) >> 3) >= 0x555555555555555) {
      unint64_t v67 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v67 = v66;
    }
    if (v67) {
      v68 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<APCConfigReader::paramData>>((uint64_t)&v112, v67);
    }
    else {
      v68 = 0;
    }
    unint64_t v69 = &v68[24 * v65];
    unint64_t v70 = &v68[24 * v67];
    *(_DWORD *)unint64_t v69 = 111;
    *((void *)v69 + EchoCodeDecoder::reset(this - 1) = (char *)&v115 + 4;
    *((_DWORD *)v69 + 4) = 0;
    v64 = v69 + 24;
    unint64_t v71 = v111;
    v72 = (char *)__p;
    if (v111 != __p)
    {
      do
      {
        long long v73 = *(_OWORD *)(v71 - 24);
        *((_DWORD *)v69 - 2) = *((_DWORD *)v71 - 2);
        *(_OWORD *)(v69 - 24) = v73;
        v69 -= 24;
        v71 -= 24;
      }
      while (v71 != v72);
      unint64_t v71 = (char *)__p;
    }
    __p = v69;
    v111 = v64;
    v112 = v70;
    if (v71) {
      operator delete(v71);
    }
  }
  else
  {
    *(_DWORD *)v54 = 111;
    *((void *)v54 + EchoCodeDecoder::reset(this - 1) = (char *)&v115 + 4;
    *((_DWORD *)v54 + 4) = 0;
    v64 = v54 + 24;
  }
  v111 = v64;
  if (v64 >= v112)
  {
    unint64_t v75 = 0xAAAAAAAAAAAAAAABLL * ((v64 - (unsigned char *)__p) >> 3);
    if (v75 + 1 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v76 = 0x5555555555555556 * ((v112 - (unsigned char *)__p) >> 3);
    if (v76 <= v75 + 1) {
      unint64_t v76 = v75 + 1;
    }
    if (0xAAAAAAAAAAAAAAABLL * ((v112 - (unsigned char *)__p) >> 3) >= 0x555555555555555) {
      unint64_t v77 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v77 = v76;
    }
    if (v77) {
      uint64_t v78 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<APCConfigReader::paramData>>((uint64_t)&v112, v77);
    }
    else {
      uint64_t v78 = 0;
    }
    v79 = &v78[24 * v75];
    v80 = &v78[24 * v77];
    *(_DWORD *)v79 = 112;
    *((void *)v79 + EchoCodeDecoder::reset(this - 1) = &v114;
    *((_DWORD *)v79 + 4) = 5;
    v74 = v79 + 24;
    v81 = v111;
    v82 = (char *)__p;
    if (v111 != __p)
    {
      do
      {
        long long v83 = *(_OWORD *)(v81 - 24);
        *((_DWORD *)v79 - 2) = *((_DWORD *)v81 - 2);
        *(_OWORD *)(v79 - 24) = v83;
        v79 -= 24;
        v81 -= 24;
      }
      while (v81 != v82);
      v81 = (char *)__p;
    }
    __p = v79;
    v111 = v74;
    v112 = v80;
    if (v81) {
      operator delete(v81);
    }
  }
  else
  {
    *(_DWORD *)v64 = 112;
    *((void *)v64 + EchoCodeDecoder::reset(this - 1) = &v114;
    *((_DWORD *)v64 + 4) = 5;
    v74 = v64 + 24;
  }
  v111 = v74;
  if (v74 >= v112)
  {
    unint64_t v85 = 0xAAAAAAAAAAAAAAABLL * ((v74 - (unsigned char *)__p) >> 3);
    if (v85 + 1 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v86 = 0x5555555555555556 * ((v112 - (unsigned char *)__p) >> 3);
    if (v86 <= v85 + 1) {
      unint64_t v86 = v85 + 1;
    }
    if (0xAAAAAAAAAAAAAAABLL * ((v112 - (unsigned char *)__p) >> 3) >= 0x555555555555555) {
      unint64_t v87 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v87 = v86;
    }
    if (v87) {
      v88 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<APCConfigReader::paramData>>((uint64_t)&v112, v87);
    }
    else {
      v88 = 0;
    }
    v89 = &v88[24 * v85];
    v90 = &v88[24 * v87];
    *(_DWORD *)v89 = 113;
    *((void *)v89 + EchoCodeDecoder::reset(this - 1) = &v115;
    *((_DWORD *)v89 + 4) = 1;
    v84 = v89 + 24;
    v91 = v111;
    v92 = (char *)__p;
    if (v111 != __p)
    {
      do
      {
        long long v93 = *(_OWORD *)(v91 - 24);
        *((_DWORD *)v89 - 2) = *((_DWORD *)v91 - 2);
        *(_OWORD *)(v89 - 24) = v93;
        v89 -= 24;
        v91 -= 24;
      }
      while (v91 != v92);
      v91 = (char *)__p;
    }
    __p = v89;
    v111 = v84;
    v112 = v90;
    if (v91) {
      operator delete(v91);
    }
  }
  else
  {
    *(_DWORD *)v74 = 113;
    *((void *)v74 + EchoCodeDecoder::reset(this - 1) = &v115;
    *((_DWORD *)v74 + 4) = 1;
    v84 = v74 + 24;
  }
  v111 = v84;
  float v94 = 0.0;
  if (!APCConfigReader::loadParams((uint64_t)&v113, &__p))
  {
    uint64_t v95 = HIDWORD(v117);
    if (!HIDWORD(v117))
    {
      uint64_t v95 = 2048;
      HIDWORD(v117) = 2048;
    }
    if (!v117) {
      LODWORD(v117) = 2;
    }
    if (*((float *)&v116 + 1) == 0.0) {
      HIDWORD(v116) = 1065353216;
    }
    if (*(float *)&v116 == 0.0) {
      LODWORD(v116) = 1008981770;
    }
    if (*((float *)&v115 + 1) == 0.0) {
      HIDWORD(v115) = 1183621120;
    }
    if (!HIBYTE(v114)) {
      __int16 v114 = 257;
    }
    if (!v115) {
      LODWORD(v115) = 100;
    }
    HIDWORD(v117) = echoCodec::getSRCFreeFrameSize((echoCodec *)v95, HIDWORD(v118));
    echoCodec::getSRCFreeFrameSize((echoCodec *)(v95 >> 2), HIDWORD(v118));
    if (3 * HIDWORD(v118) <= a3)
    {
      std::vector<float>::vector(&__B, (2 * HIDWORD(v117)));
      std::vector<float>::vector(v107, HIDWORD(v117));
      std::vector<float>::vector(__C, HIDWORD(v117));
      std::vector<float>::vector(v105, (HIDWORD(v117) + HIDWORD(v117) * v117));
      vDSP_vclr(__B, 1, v109 - __B);
      v104 = 0;
      BOOL SyncType = echoCodec::getSyncType((echoCodec *)v115);
      if (!SyncType) {
        operator new();
      }
      if (SyncType) {
        operator new();
      }
      LODWORD(v103) = 108;
      v120[0] = &v103;
      v97 = std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(a4, (unsigned int *)&v103, (uint64_t)&std::piecewise_construct, v120);
      v98 = (void (**)(uint64_t, void, _DWORD **, void, void))(v97 + 5);
      v119[0] = (uint64_t (*)(void, void, void, void, void))std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
      v119[1] = (uint64_t (*)(void, void, void, void, void))24000;
      if (v119 != (uint64_t (**)(void, void, void, void, void))(v97 + 5))
      {
        v99 = *v98;
        if (*v98)
        {
          v120[0] = 0;
          v120[1] = 0;
          v99(2, v98, v120, 0, 0);
          v119[0](2, v119, v98, 0, 0);
          ((void (*)(void, void, void, void, void))v120[0])(2, v120, v119, 0, 0);
          std::any::reset[abi:ne180100]((uint64_t (**)(void, void, void, void, void))v120);
        }
        else
        {
          *((_DWORD *)v97 + 12) = 24000;
          v97[5] = (uint64_t *)std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
          v119[0] = 0;
        }
      }
      std::any::reset[abi:ne180100](v119);
      float v94 = 1.0;
      v100 = v104;
      v104 = 0;
      if (v100) {
        (*(void (**)(EchoEmbedder *))(*(void *)v100 + 8))(v100);
      }
      if (v105[0])
      {
        v105[1] = v105[0];
        operator delete(v105[0]);
      }
      if (__C[0])
      {
        __C[1] = __C[0];
        operator delete(__C[0]);
      }
      if (v107[0])
      {
        v107[1] = v107[0];
        operator delete(v107[0]);
      }
      if (__B)
      {
        v109 = __B;
        operator delete(__B);
      }
    }
  }
  if (__p)
  {
    v111 = (char *)__p;
    operator delete(__p);
  }
  return v94;
}

void sub_237D1B240(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,uint64_t a25,void *a26,uint64_t a27,uint64_t a28,void *a29,uint64_t a30,uint64_t a31,void *a32)
{
  uint64_t v36 = a17;
  a17 = 0;
  if (v36) {
    std::default_delete<ShapingFilter>::operator()[abi:ne180100]((uint64_t)&a17, v36);
  }
  uint64_t v37 = a18;
  a18 = 0;
  if (v37) {
    std::default_delete<ShapingFilter>::operator()[abi:ne180100]((uint64_t)&a18, v37);
  }
  uint64_t v38 = a19;
  a19 = 0;
  if (v38)
  {
    (*(void (**)(uint64_t))(*(void *)v38 + 8))(v38);
    if (!v33)
    {
LABEL_7:
      if (!v32) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if (!v33)
  {
    goto LABEL_7;
  }
  (*(void (**)(uint64_t))(*(void *)v33 + 8))(v33);
  if (!v32)
  {
LABEL_9:
    if (__p)
    {
      a21 = (uint64_t)__p;
      operator delete(__p);
    }
    if (a23)
    {
      a24 = (uint64_t)a23;
      operator delete(a23);
    }
    if (a26)
    {
      a27 = (uint64_t)a26;
      operator delete(a26);
    }
    if (a29)
    {
      a30 = (uint64_t)a29;
      operator delete(a29);
    }
    uint64_t v39 = a32;
    if (a32)
    {
      *(void *)(v34 + 8) = a32;
      operator delete(v39);
    }
    _Unwind_Resume(exception_object);
  }
LABEL_8:
  (*(void (**)(uint64_t))(*(void *)v32 + 8))(v32);
  goto LABEL_9;
}

uint64_t EchoCodeEncoder::reset(EchoCodeEncoder *this)
{
  if (!*((_DWORD *)this + 4)) {
    return 0xFFFFFFFFLL;
  }
  (*(void (**)(void))(**((void **)this + 12) + 24))(*((void *)this + 12));
  EchoEmbedder::reset(*((void *)this + 9));
  return 0;
}

uint64_t non-virtual thunk to'EchoCodeEncoder::reset(EchoCodeEncoder *this)
{
  return EchoCodeEncoder::reset((EchoCodeEncoder *)((char *)this - 8));
}

uint64_t EchoCodeEncoder::Status(EchoCodeEncoder *this)
{
  uint64_t v1 = *((void *)this + 9);
  if (v1) {
    return *(_DWORD *)(v1 + 120) < *(_DWORD *)(v1 + 168);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t EchoCodeEncoder::setPasscode(EchoCodeEncoder *this, const unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (*((_DWORD *)this + 10) != a3) {
    return 4294967290;
  }
  if (a3)
  {
    uint64_t v6 = a3;
    uint64_t v7 = a2;
    do
    {
      unsigned int v8 = APCLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v9 = *v7;
        *(_DWORD *)buf = 67109120;
        int v12 = v9;
        _os_log_impl(&dword_237D0E000, v8, OS_LOG_TYPE_INFO, "APC encoder just received 1 byte of passcode: 0x%02X", buf, 8u);
      }

      ++v7;
      --v6;
    }
    while (v6);
  }
  (*(void (**)(void, const unsigned __int8 *, uint64_t))(**((void **)this + 9) + 24))(*((void *)this + 9), a2, a3);
  return 0;
}

uint64_t non-virtual thunk to'EchoCodeEncoder::setPasscode(EchoCodeEncoder *this, const unsigned __int8 *a2, uint64_t a3)
{
  return EchoCodeEncoder::setPasscode((EchoCodeEncoder *)((char *)this - 8), a2, a3);
}

uint64_t EchoCodeEncoder::setParams(uint64_t a1, unsigned int a2, void (**a3)(uint64_t))
{
  if (*(_DWORD *)(a1 + 16)) {
    return 4294967287;
  }
  uint64_t result = 4294967290;
  switch(a2)
  {
    case 'd':
      uint64_t v7 = std::any_cast[abi:ne180100]<unsigned int>((uint64_t (**)(uint64_t, void, void, void, void *))a3);
      if (!v7) {
        goto LABEL_28;
      }
      *(_DWORD *)(a1 + 20) = *v7;
      goto LABEL_26;
    case 'e':
      unsigned int v8 = std::any_cast[abi:ne180100]<unsigned int>((uint64_t (**)(uint64_t, void, void, void, void *))a3);
      if (!v8) {
        goto LABEL_28;
      }
      *(_DWORD *)(a1 + 28) = *v8;
      goto LABEL_26;
    case 'g':
      int v9 = std::any_cast[abi:ne180100]<float>((uint64_t (**)(uint64_t, void, void, void, void *))a3);
      if (!v9) {
        goto LABEL_28;
      }
      *(_DWORD *)(a1 + 52) = *v9;
      goto LABEL_26;
    case 'h':
      int v10 = std::any_cast[abi:ne180100]<float>((uint64_t (**)(uint64_t, void, void, void, void *))a3);
      if (!v10) {
        goto LABEL_28;
      }
      *(_DWORD *)(a1 + 36) = *v10;
      goto LABEL_26;
    case 'n':
      uint64_t v11 = std::any_cast[abi:ne180100]<unsigned int>((uint64_t (**)(uint64_t, void, void, void, void *))a3);
      if (!v11) {
        goto LABEL_28;
      }
      if (!*v11) {
        goto LABEL_20;
      }
      int v12 = std::any_cast[abi:ne180100]<unsigned int>((uint64_t (**)(uint64_t, void, void, void, void *))a3);
      if (!v12) {
        goto LABEL_28;
      }
      *(_DWORD *)(a1 + 44) = *v12;
      goto LABEL_26;
    case 'o':
      uint64_t v13 = (float *)std::any_cast[abi:ne180100]<float>((uint64_t (**)(uint64_t, void, void, void, void *))a3);
      if (!v13) {
        goto LABEL_28;
      }
      if (*v13 < 16000.0) {
        goto LABEL_20;
      }
      unint64_t v14 = (float *)std::any_cast[abi:ne180100]<float>((uint64_t (**)(uint64_t, void, void, void, void *))a3);
      if (!v14) {
LABEL_28:
      }
        std::__throw_bad_any_cast[abi:ne180100]();
      if (*v14 <= 20000.0)
      {
        *(float *)(a1 + 60) = std::any_cast[abi:ne180100]<float>((uint64_t (**)(uint64_t, void, void, void, void *))a3);
LABEL_26:
        unsigned int v18 = a2;
        unint64_t v19 = &v18;
        unint64_t v17 = std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t **)(a1 + 152), &v18, (uint64_t)&std::piecewise_construct, &v19);
        std::any::operator=[abi:ne180100]((unint64_t *)v17 + 5, a3);
        uint64_t result = 0;
      }
      else
      {
LABEL_20:
        uint64_t result = 4294967290;
      }
      break;
    case 'p':
      unint64_t v15 = (unsigned __int8 *)std::any_cast[abi:ne180100]<BOOL>((uint64_t (**)(uint64_t, void, void, void, void *))a3);
      if (!v15) {
        goto LABEL_28;
      }
      *(_WORD *)(a1 + 48) = *v15 | 0x100;
      goto LABEL_26;
    case 'q':
      uint64_t v16 = std::any_cast[abi:ne180100]<unsigned int>((uint64_t (**)(uint64_t, void, void, void, void *))a3);
      if (!v16) {
        goto LABEL_28;
      }
      *(_DWORD *)(a1 + 64) = *v16;
      goto LABEL_26;
    default:
      return result;
  }
  return result;
}

BOOL EchoCodeEncoder::isInitialized(EchoCodeEncoder *this)
{
  return *((_DWORD *)this + 4) != 0;
}

float std::any_cast[abi:ne180100]<float>(uint64_t (**a1)(uint64_t, void, void, void, void *))
{
  uint64_t v1 = std::any_cast[abi:ne180100]<float>(a1);
  if (!v1) {
    std::__throw_bad_any_cast[abi:ne180100]();
  }
  return *(float *)v1;
}

uint64_t non-virtual thunk to'EchoCodeEncoder::setParams(uint64_t a1, unsigned int a2, void (**a3)(uint64_t))
{
  return EchoCodeEncoder::setParams(a1 - 8, a2, a3);
}

BOOL non-virtual thunk to'EchoCodeEncoder::isInitialized(EchoCodeEncoder *this)
{
  return *((_DWORD *)this + 2) != 0;
}

void non-virtual thunk to'EchoCodeEncoder::~EchoCodeEncoder(EchoCodeEncoder *this)
{
}

{
  uint64_t vars8;

  EchoCodeEncoder::~EchoCodeEncoder((EchoCodeEncoder *)((char *)this - 8));

  JUMPOUT(0x237E2DA50);
}

void *std::vector<float>::vector(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<float>::__vallocate[abi:ne180100](a1, a2);
    int v4 = (char *)a1[1];
    bzero(v4, 4 * a2);
    a1[1] = &v4[4 * a2];
  }
  return a1;
}

void sub_237D1B9A8(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<float>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 62) {
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void EchoEmbedder::EchoEmbedder(EchoEmbedder *this)
{
  *(_OWORD *)((char *)this + 40) = 0u;
  *(void *)this = &unk_26EAE4780;
  *((void *)this + EchoCodeDecoder::reset(this - 1) = 0;
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  *((_WORD *)this + 16) = 0;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 88) = 0u;
  *((void *)this + 13) = 0;
  *((void *)this + 14) = Random::instance(this);
  *((_DWORD *)this + 30) = 0;
  *((_OWORD *)this + 8) = 0u;
  *((_OWORD *)this + 9) = 0u;
  *((_OWORD *)this + 10) = 0u;
}

void sub_237D1BA90(_Unwind_Exception *a1)
{
  uint64_t v5 = *(void **)(v1 + 88);
  if (v5)
  {
    *(void *)(v1 + 96) = v5;
    operator delete(v5);
  }
  EchoEmbedder::EchoEmbedder(v3, v2, v1);
  _Unwind_Resume(a1);
}

void std::__function::__func<EchoCodeEncoder::encode(float const*,float *,unsigned int)::$_0,std::allocator<EchoCodeEncoder::encode(float const*,float *,unsigned int)::$_0>,void ()(float *,unsigned int)>::~__func()
{
}

void *std::__function::__func<EchoCodeEncoder::encode(float const*,float *,unsigned int)::$_0,std::allocator<EchoCodeEncoder::encode(float const*,float *,unsigned int)::$_0>,void ()(float *,unsigned int)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = &unk_26EAE45E0;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<EchoCodeEncoder::encode(float const*,float *,unsigned int)::$_0,std::allocator<EchoCodeEncoder::encode(float const*,float *,unsigned int)::$_0>,void ()(float *,unsigned int)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26EAE45E0;
  a2[1] = v2;
  return result;
}

void std::__function::__func<EchoCodeEncoder::encode(float const*,float *,unsigned int)::$_0,std::allocator<EchoCodeEncoder::encode(float const*,float *,unsigned int)::$_0>,void ()(float *,unsigned int)>::operator()(uint64_t a1, float **a2, unsigned int *a3)
{
  uint64_t v3 = *a2;
  vDSP_Length v4 = *a3;
  uint64_t v5 = *(void *)(a1 + 8);
  Random::getSamples(*(Random **)(*(void *)(v5 + 72) + 112), *(float **)(v5 + 128), *a3);
  uint64_t v6 = *(const float **)(v5 + 128);

  vDSP_vsma(v6, 1, (const float *)(v5 + 52), v3, 1, v3, 1, v4);
}

uint64_t std::__function::__func<EchoCodeEncoder::encode(float const*,float *,unsigned int)::$_0,std::allocator<EchoCodeEncoder::encode(float const*,float *,unsigned int)::$_0>,void ()(float *,unsigned int)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<EchoCodeEncoder::encode(float const*,float *,unsigned int)::$_0,std::allocator<EchoCodeEncoder::encode(float const*,float *,unsigned int)::$_0>,void ()(float *,unsigned int)>::target_type()
{
}

void *std::__function::__value_func<void ()(float *,unsigned int)>::~__value_func[abi:ne180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void std::__function::__func<EchoCodeEncoder::evaluateCarrier(float const*,unsigned int,std::map<unsigned int,std::any> &)::$_0,std::allocator<EchoCodeEncoder::evaluateCarrier(float const*,unsigned int,std::map<unsigned int,std::any> &)::$_0>,void ()(float *,unsigned int)>::~__func()
{
}

__n128 std::__function::__func<EchoCodeEncoder::evaluateCarrier(float const*,unsigned int,std::map<unsigned int,std::any> &)::$_0,std::allocator<EchoCodeEncoder::evaluateCarrier(float const*,unsigned int,std::map<unsigned int,std::any> &)::$_0>,void ()(float *,unsigned int)>::__clone(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x20uLL);
  *(void *)uint64_t v2 = &unk_26EAE4670;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  *((void *)v2 + 3) = *(void *)(a1 + 24);
  return result;
}

__n128 std::__function::__func<EchoCodeEncoder::evaluateCarrier(float const*,unsigned int,std::map<unsigned int,std::any> &)::$_0,std::allocator<EchoCodeEncoder::evaluateCarrier(float const*,unsigned int,std::map<unsigned int,std::any> &)::$_0>,void ()(float *,unsigned int)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26EAE4670;
  __n128 result = *(__n128 *)(a1 + 8);
  *(void *)(a2 + 24) = *(void *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

void std::__function::__func<EchoCodeEncoder::evaluateCarrier(float const*,unsigned int,std::map<unsigned int,std::any> &)::$_0,std::allocator<EchoCodeEncoder::evaluateCarrier(float const*,unsigned int,std::map<unsigned int,std::any> &)::$_0>,void ()(float *,unsigned int)>::operator()(uint64_t a1, float **a2, unsigned int *a3)
{
  vDSP_Length v4 = *a2;
  vDSP_Length v5 = *a3;
  Random::getSamples(*(Random **)(**(void **)(a1 + 8) + 112), **(float ***)(a1 + 16), *a3);
  uint64_t v6 = *(const float **)(a1 + 24);
  uint64_t v7 = **(const float ***)(a1 + 16);

  vDSP_vsma(v7, 1, v6, v4, 1, v4, 1, v5);
}

uint64_t std::__function::__func<EchoCodeEncoder::evaluateCarrier(float const*,unsigned int,std::map<unsigned int,std::any> &)::$_0,std::allocator<EchoCodeEncoder::evaluateCarrier(float const*,unsigned int,std::map<unsigned int,std::any> &)::$_0>,void ()(float *,unsigned int)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<EchoCodeEncoder::evaluateCarrier(float const*,unsigned int,std::map<unsigned int,std::any> &)::$_0,std::allocator<EchoCodeEncoder::evaluateCarrier(float const*,unsigned int,std::map<unsigned int,std::any> &)::$_0>,void ()(float *,unsigned int)>::target_type()
{
}

uint64_t (**std::any_cast[abi:ne180100]<BOOL>(uint64_t (**result)(uint64_t, void, void, void, void *)))(uint64_t, void, void, void, void *)
{
  if (result)
  {
    if (*result) {
      return (uint64_t (**)(uint64_t, void, void, void, void *))(*result)(3, result, 0, MEMORY[0x263F8C230], &std::__any_imp::__unique_typeinfo<BOOL>::__id);
    }
    else {
      return 0;
    }
  }
  return result;
}

{
  if (result)
  {
    if (*result) {
      return (uint64_t (**)(uint64_t, void, void, void, void *))(*result)(3, result, 0, MEMORY[0x263F8C230], &std::__any_imp::__unique_typeinfo<BOOL>::__id);
    }
    else {
      return 0;
    }
  }
  return result;
}

void mlsCodec::getSequence(void *a1, unsigned int a2, float a3)
{
  unint64_t v16 = 0;
  SimpleMLS<20u>::Reset((uint64_t)&v16);
  std::vector<float>::resize((uint64_t)a1, a2 & 0xFFFFFFF0);
  if (a2 >= 0x10)
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = a2 >> 4;
    unint64_t v9 = v16;
    do
    {
      char v10 = v9;
      int v11 = v9 ^ (v9 >> 3) & 1;
      std::bitset<20ul>::operator>>=[abi:ne180100]((uint64_t)&v16, 1uLL);
      uint64_t v12 = 0;
      if (v11) {
        uint64_t v13 = 0x80000;
      }
      else {
        uint64_t v13 = 0;
      }
      unint64_t v9 = v13 | v16 & 0xFFFFFFFFFFF7FFFFLL;
      unint64_t v16 = v9;
      if (v10) {
        float v14 = a3;
      }
      else {
        float v14 = -a3;
      }
      uint64_t v15 = *a1 + v6;
      do
      {
        *(float32x4_t *)(v15 + v12 * 16) = vmulq_n_f32((float32x4_t)mlsCodec::kGaussianPulse[v12], v14);
        ++v12;
      }
      while (v12 != 4);
      ++v7;
      v6 += 64;
    }
    while (v7 != v8);
  }
}

void *SimpleMLS<20u>::Reset(uint64_t a1)
{
  uint64_t v2 = a1;
  int v3 = 0;
  return std::__fill_n[abi:ne180100]<true,std::__bitset<1ul,20ul>>(&v2, 0x14uLL);
}

void *std::__fill_n[abi:ne180100]<true,std::__bitset<1ul,20ul>>(void *result, unint64_t a2)
{
  unint64_t v2 = a2;
  int v3 = result;
  int v4 = *((_DWORD *)result + 2);
  vDSP_Length v5 = (void *)*result;
  if (v4)
  {
    if ((64 - v4) >= a2) {
      unint64_t v6 = a2;
    }
    else {
      unint64_t v6 = (64 - v4);
    }
    *v5++ |= (0xFFFFFFFFFFFFFFFFLL >> (64 - v4 - v6)) & (-1 << v4);
    unint64_t v2 = a2 - v6;
    void *result = v5;
  }
  unint64_t v7 = v2 >> 6;
  if (v2 >= 0x40) {
    __n128 result = memset(v5, 255, 8 * v7);
  }
  if ((v2 & 0x3F) != 0)
  {
    uint64_t v8 = &v5[v7];
    void *v3 = v8;
    *v8 |= 0xFFFFFFFFFFFFFFFFLL >> -(v2 & 0x3F);
  }
  return result;
}

void std::__fill_n[abi:ne180100]<false,std::__bitset<1ul,20ul>>(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = a2;
  int v4 = *(_DWORD *)(a1 + 8);
  vDSP_Length v5 = *(void **)a1;
  if (v4)
  {
    if ((64 - v4) >= a2) {
      unint64_t v6 = a2;
    }
    else {
      unint64_t v6 = (64 - v4);
    }
    *v5++ &= ~((0xFFFFFFFFFFFFFFFFLL >> (64 - v4 - v6)) & (-1 << v4));
    unint64_t v2 = a2 - v6;
    *(void *)a1 = v5;
  }
  unint64_t v7 = v2 >> 6;
  if (v2 >= 0x40) {
    bzero(v5, 8 * v7);
  }
  if ((v2 & 0x3F) != 0)
  {
    uint64_t v8 = &v5[v7];
    *(void *)a1 = v8;
    *v8 &= ~(0xFFFFFFFFFFFFFFFFLL >> -(v2 & 0x3F));
  }
}

uint64_t std::bitset<20ul>::operator>>=[abi:ne180100](uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x14) {
    unint64_t v3 = 20;
  }
  else {
    unint64_t v3 = a2;
  }
  if (v3)
  {
    uint64_t v10 = a1;
    int v11 = v3;
    uint64_t v8 = a1;
    int v9 = 20;
    uint64_t v6 = a1;
    int v7 = 0;
    std::__copy_unaligned[abi:ne180100]<std::__bitset<1ul,20ul>,false>((unsigned int *)&v10, (uint64_t)&v8, (uint64_t)&v6, (uint64_t)v5);
    uint64_t v16 = a1;
    int v17 = 20 - v3;
    std::__fill_n[abi:ne180100]<false,std::__bitset<1ul,20ul>>((uint64_t)&v16, v3);
  }
  else
  {
    uint64_t v16 = a1;
    int v17 = 0;
    uint64_t v14 = a1;
    int v15 = 20;
    uint64_t v12 = a1;
    int v13 = 0;
    std::__copy_aligned[abi:ne180100]<std::__bitset<1ul,20ul>,false>(&v16, &v14, (uint64_t)&v12, (uint64_t)v5);
  }
  return a1;
}

void *std::__copy_aligned[abi:ne180100]<std::__bitset<1ul,20ul>,false>@<X0>(void *result@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = *a2;
  uint64_t v8 = (void *)*result;
  uint64_t v9 = *((unsigned int *)a2 + 2) + 8 * (v7 - *result);
  uint64_t v10 = *((unsigned int *)result + 2);
  uint64_t v11 = v9 - v10;
  if (v9 - v10 <= 0)
  {
    unint64_t v19 = *(unint64_t **)a3;
  }
  else
  {
    uint64_t v12 = result;
    if (v10)
    {
      if (v11 >= (unint64_t)(64 - v10)) {
        uint64_t v13 = (64 - v10);
      }
      else {
        uint64_t v13 = v9 - v10;
      }
      v11 -= v13;
      uint64_t v14 = *(unint64_t **)a3;
      unint64_t *v14 = **(void **)a3 & ~((0xFFFFFFFFFFFFFFFFLL >> (64 - v10 - v13)) & (-1 << v10)) | *v8 & (0xFFFFFFFFFFFFFFFFLL >> (64 - v10 - v13)) & (-1 << v10);
      unint64_t v15 = v13 + *(unsigned int *)(a3 + 8);
      *(void *)a3 = (char *)v14 + ((v15 >> 3) & 0x3FFFFFF8);
      *(_DWORD *)(a3 + 8) = v15 & 0x3F;
      uint64_t v8 = (void *)(*result + 8);
      void *result = v8;
    }
    if (v11 >= 0) {
      uint64_t v16 = v11;
    }
    else {
      uint64_t v16 = v11 + 63;
    }
    uint64_t v17 = v16 >> 6;
    if ((unint64_t)(v11 + 63) >= 0x7F) {
      __n128 result = memmove(*(void **)a3, v8, 8 * v17);
    }
    uint64_t v18 = v11 - (v17 << 6);
    unint64_t v19 = (unint64_t *)(*(void *)a3 + 8 * v17);
    *(void *)a3 = v19;
    if (v18 >= 1)
    {
      uint64_t v20 = (void *)(*v12 + 8 * v17);
      void *v12 = v20;
      unint64_t v21 = 0xFFFFFFFFFFFFFFFFLL >> (((_BYTE)v17 << 6) - v11);
      unint64_t v22 = *v20 & v21;
      unint64_t v19 = *(unint64_t **)a3;
      **(void **)a3 = **(void **)a3 & ~v21 | v22;
      *(_DWORD *)(a3 + 8) = v18;
    }
  }
  *(void *)a4 = v19;
  *(_DWORD *)(a4 + 8) = *(_DWORD *)(a3 + 8);
  return result;
}

unsigned int *std::__copy_unaligned[abi:ne180100]<std::__bitset<1ul,20ul>,false>@<X0>(unsigned int *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  int v4 = *(unint64_t **)result;
  uint64_t v5 = result[2];
  uint64_t v6 = *(unsigned int *)(a2 + 8) + 8 * (*(void *)a2 - *(void *)result) - v5;
  if (v6 <= 0)
  {
    uint64_t v20 = *(uint64_t **)a3;
    unsigned int v18 = *(_DWORD *)(a3 + 8);
  }
  else
  {
    if (v5)
    {
      if (v6 >= (unint64_t)(64 - v5)) {
        unint64_t v7 = (64 - v5);
      }
      else {
        unint64_t v7 = *(unsigned int *)(a2 + 8) + 8 * (*(void *)a2 - *(void *)result) - v5;
      }
      v6 -= v7;
      unint64_t v8 = (0xFFFFFFFFFFFFFFFFLL >> (64 - v5 - v7)) & (-1 << v5) & *v4;
      uint64_t v9 = *(unsigned int *)(a3 + 8);
      if (v7 >= (64 - v9)) {
        unint64_t v10 = (64 - v9);
      }
      else {
        unint64_t v10 = v7;
      }
      uint64_t v11 = *(uint64_t **)a3;
      unint64_t v12 = v8 >> (v5 - v9);
      BOOL v13 = v9 >= v5;
      int v15 = v9 - v5;
      BOOL v14 = v15 != 0 && v13;
      unint64_t v16 = v8 << v15;
      if (!v14) {
        unint64_t v16 = v12;
      }
      *uint64_t v11 = **(void **)a3 & ~((0xFFFFFFFFFFFFFFFFLL >> (64 - v9 - v10)) & (-1 << v9)) | v16;
      uint64_t v17 = (unint64_t *)((char *)v11 + (((v10 + v9) >> 3) & 0x3FFFFFF8));
      *(void *)a3 = v17;
      unsigned int v18 = ((_BYTE)v9 + (_BYTE)v10) & 0x3F;
      *(_DWORD *)(a3 + 8) = v18;
      uint64_t v19 = v7 - v10;
      if (v19 >= 1)
      {
        unint64_t *v17 = (v8 >> (v10 + result[2])) | *v17 & ~(0xFFFFFFFFFFFFFFFFLL >> -(char)v19);
        *(_DWORD *)(a3 + 8) = v19;
        unsigned int v18 = v19;
      }
      int v4 = (unint64_t *)(*(void *)result + 8);
      *(void *)__n128 result = v4;
    }
    else
    {
      unsigned int v18 = *(_DWORD *)(a3 + 8);
    }
    unsigned int v21 = 64 - v18;
    uint64_t v22 = -1 << v18;
    if (v6 < 64)
    {
      uint64_t v26 = v6;
    }
    else
    {
      do
      {
        unint64_t v23 = *v4;
        unsigned int v24 = *(uint64_t **)a3;
        uint64_t *v24 = **(void **)a3 & ~v22 | (v23 << v18);
        uint64_t v25 = v24[1];
        *(void *)a3 = ++v24;
        uint64_t *v24 = v25 & v22 | (v23 >> v21);
        uint64_t v26 = v6 - 64;
        int v4 = (unint64_t *)(*(void *)result + 8);
        *(void *)__n128 result = v4;
        BOOL v14 = (unint64_t)v6 > 0x7F;
        v6 -= 64;
      }
      while (v14);
    }
    uint64_t v20 = *(uint64_t **)a3;
    if (v26 >= 1)
    {
      unint64_t v27 = *v4 & (0xFFFFFFFFFFFFFFFFLL >> -(char)v26);
      if (v26 >= (unint64_t)v21) {
        uint64_t v28 = 64 - v18;
      }
      else {
        uint64_t v28 = v26;
      }
      uint64_t *v20 = *v20 & ~((0xFFFFFFFFFFFFFFFFLL >> (v21 - v28)) & v22) | (v27 << v18);
      uint64_t v20 = (uint64_t *)((char *)v20 + (((v28 + (unint64_t)v18) >> 3) & 0x3FFFFFF8));
      *(void *)a3 = v20;
      unsigned int v18 = ((_BYTE)v18 + (_BYTE)v28) & 0x3F;
      *(_DWORD *)(a3 + 8) = v18;
      if (v26 - v28 >= 1)
      {
        uint64_t *v20 = *v20 & ~(0xFFFFFFFFFFFFFFFFLL >> (v28 - v26)) | (v27 >> v28);
        *(_DWORD *)(a3 + 8) = v26 - v28;
        unsigned int v18 = v26 - v28;
      }
    }
  }
  *(void *)a4 = v20;
  *(_DWORD *)(a4 + 8) = v18;
  return result;
}

void sub_237D1C634(_Unwind_Exception *a1)
{
  unint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_237D1C710(_Unwind_Exception *a1)
{
  unint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_237D1C7C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237D1C964(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237D1CA40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237D1CAE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237D1D81C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id a32)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);

  _Block_object_dispose((const void *)(v33 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_237D1D9C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237D1DA88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237D1DE68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237D1E8FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_237D1EC00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237D1EC70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237D1ED84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_237D1EFBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t echoCodec::getFsIndex(echoCodec *this)
{
  if (this == 48000) {
    unsigned int v1 = 1;
  }
  else {
    unsigned int v1 = -1;
  }
  if (this == 44100) {
    return 0;
  }
  else {
    return v1;
  }
}

unsigned int echoCodec::getSRCFreeFrameSize(echoCodec *this, unsigned int a2)
{
  return vcvtps_u32_f32((float)((float)a2 / 48000.0) * (float)this);
}

BOOL echoCodec::getSyncType(echoCodec *this)
{
  return this > 0x6D;
}

BOOL ShapingFilter::initialize(uint64_t a1, int a2, int a3, unsigned int a4, char a5, float a6)
{
  if (a3 == 48000) {
    unsigned int v6 = 1;
  }
  else {
    unsigned int v6 = -1;
  }
  if (a3 == 44100) {
    unsigned int v6 = 0;
  }
  if ((v6 & 0x80000000) != 0) {
    return 0;
  }
  float v10 = (float)(a6 / 1000.0) + 0.5;
  if (a6 > 20000.0) {
    float v10 = 20.5;
  }
  BOOL v11 = a6 < 16000.0;
  float v12 = 16.5;
  if (!v11) {
    float v12 = v10;
  }
  if (a2)
  {
    if (a2 == 1)
    {
      BOOL v13 = (const double *)&ShapingFilter::mHPFCoef;
      if (a4) {
        goto LABEL_14;
      }
    }
    return 0;
  }
  BOOL v13 = (const double *)&ShapingFilter::mLPFCoef;
  if (!a4) {
    return 0;
  }
LABEL_14:
  Setup = vDSP_biquad_CreateSetup(&v13[75 * v6 - 240 + 15 * v12], 3uLL);
  std::unique_ptr<vDSP_biquad_SetupStruct,applesauce::raii::v1::detail::opaque_deletion_functor<vDSP_biquad_SetupStruct*,&(vDSP_biquad_DestroySetup)>>::reset[abi:ne180100]((vDSP_biquad_SetupStruct **)(a1 + 32), Setup);
  std::vector<std::vector<float>>::resize((uint64_t *)(a1 + 8), a4);
  uint64_t v15 = 0;
  do
  {
    std::vector<float>::resize(*(void *)(a1 + 8) + v15, 8uLL);
    vDSP_vclr(*(float **)(*(void *)(a1 + 8) + v15), 1, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 16) - *(void *)(a1 + 8)) >> 3));
    v15 += 24;
  }
  while (24 * a4 != v15);
  *(_DWORD *)a1 = a4;
  *(unsigned char *)(a1 + 4) = a5;
  return *(void *)(a1 + 32) != 0;
}

uint64_t ShapingFilter::getCutOffFreqIndex(ShapingFilter *this, float a2)
{
  float v2 = (float)(a2 / 1000.0) + 0.5;
  if (a2 > 20000.0) {
    float v2 = 20.5;
  }
  BOOL v3 = a2 < 16000.0;
  float v4 = 16.5;
  if (!v3) {
    float v4 = v2;
  }
  return v4 - 16;
}

void std::vector<std::vector<float>>::resize(uint64_t *a1, unint64_t a2)
{
  uint64_t v3 = a1[1];
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((v3 - *a1) >> 3);
  BOOL v5 = a2 >= v4;
  unint64_t v6 = a2 - v4;
  if (v6 != 0 && v5)
  {
    std::vector<std::vector<float>>::__append(a1, v6);
  }
  else if (!v5)
  {
    uint64_t v7 = *a1 + 24 * a2;
    if (v3 != v7)
    {
      uint64_t v8 = a1[1];
      do
      {
        float v10 = *(void **)(v8 - 24);
        v8 -= 24;
        uint64_t v9 = v10;
        if (v10)
        {
          *(void *)(v3 - 16) = v9;
          operator delete(v9);
        }
        uint64_t v3 = v8;
      }
      while (v8 != v7);
    }
    a1[1] = v7;
  }
}

void ShapingFilter::reset(ShapingFilter *this)
{
  uint64_t v1 = *((void *)this + 1);
  uint64_t v2 = *((void *)this + 2);
  while (v1 != v2)
  {
    uint64_t v3 = *(float **)v1;
    uint64_t v4 = *(void *)(v1 + 8);
    v1 += 24;
    vDSP_vclr(v3, 1, (v4 - (uint64_t)v3) >> 2);
  }
}

void ShapingFilter::filter(ShapingFilter *this, const float *a2, float *a3, vDSP_Length __N)
{
  if (*((unsigned char *)this + 4)) {
    vDSP_Stride v4 = *(unsigned int *)this;
  }
  else {
    vDSP_Stride v4 = 1;
  }
  if (*(_DWORD *)this)
  {
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    unint64_t v10 = 0;
    vDSP_Length v11 = __N;
    if (*((unsigned char *)this + 4)) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = __N;
    }
    uint64_t v13 = 4 * v12;
    do
    {
      vDSP_biquad(*((const vDSP_biquad_SetupStruct **)this + 4), *(float **)(*((void *)this + 1) + v9), (const float *)((char *)a2 + v8), v4, (float *)((char *)a3 + v8), v4, v11);
      ++v10;
      v9 += 24;
      v8 += v13;
    }
    while (v10 < *(unsigned int *)this);
  }
}

void ShapingFilter::filter(const vDSP_biquad_SetupStruct **this, const float *__X, float *__Y, vDSP_Length __N, unsigned int a5)
{
}

uint64_t APCConfigReader::loadParams(uint64_t a1, void *a2)
{
  v16[4] = *(uint64_t (**)(uint64_t, void, void, void, void *))MEMORY[0x263EF8340];
  uint64_t v3 = -1431655765 * ((a2[1] - *a2) >> 3);
  v16[0] = 0;
  v16[1] = 0;
  if (v3)
  {
    uint64_t v5 = 0;
    uint64_t v6 = 24 * v3;
    do
    {
      if (APCConfigReader::getParameter(a1, *(_DWORD *)(*a2 + v5), (unint64_t *)v16))
      {
        int v7 = *(_DWORD *)(*a2 + v5 + 16);
        if (v7)
        {
          if (v7 == 1)
          {
            uint64_t v9 = std::any_cast[abi:ne180100]<unsigned int>(v16);
            if (!v9) {
              goto LABEL_27;
            }
            **(_DWORD **)(*a2 + v5 + 8) = *v9;
          }
          else if (v7 == 5)
          {
            uint64_t v8 = (unsigned __int8 *)std::any_cast[abi:ne180100]<BOOL>(v16);
            if (!v8) {
              std::__throw_bad_any_cast[abi:ne180100]();
            }
            **(_WORD **)(*a2 + v5 + 8) = *v8 | 0x100;
          }
        }
        else
        {
          unint64_t v10 = std::any_cast[abi:ne180100]<float>(v16);
          if (!v10) {
LABEL_27:
          }
            std::__throw_bad_any_cast[abi:ne180100]();
          **(_DWORD **)(*a2 + v5 + 8) = *v10;
        }
      }
      v5 += 24;
    }
    while (v6 != v5);
  }
  if (APCConfigReader::getParameter(a1, 0, (unint64_t *)v16))
  {
    vDSP_Length v11 = std::any_cast[abi:ne180100]<unsigned int>(v16);
    if (!v11) {
      std::__throw_bad_any_cast[abi:ne180100]();
    }
    if (*v11 != 44100 && *v11 != 48000) {
      goto LABEL_25;
    }
  }
  if (!APCConfigReader::getParameter(a1, 1u, (unint64_t *)v16)) {
    goto LABEL_24;
  }
  uint64_t v13 = std::any_cast[abi:ne180100]<unsigned int>(v16);
  if (!v13) {
    std::__throw_bad_any_cast[abi:ne180100]();
  }
  if (!*v13) {
LABEL_25:
  }
    uint64_t v14 = 4294967289;
  else {
LABEL_24:
  }
    uint64_t v14 = 0;
  std::any::reset[abi:ne180100]((uint64_t (**)(void, void, void, void, void))v16);
  return v14;
}

void sub_237D1F644(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::any::reset[abi:ne180100]((uint64_t (**)(void, void, void, void, void))va);
  _Unwind_Resume(a1);
}

uint64_t APCConfigReader::getParameter(uint64_t a1, unsigned int a2, unint64_t *a3)
{
  uint64_t v3 = *(void *)(*(void *)a1 + 8);
  if (!v3) {
    return 0;
  }
  uint64_t v4 = *(void *)a1 + 8;
  do
  {
    unsigned int v5 = *(_DWORD *)(v3 + 32);
    BOOL v6 = v5 >= a2;
    if (v5 >= a2) {
      int v7 = (uint64_t *)v3;
    }
    else {
      int v7 = (uint64_t *)(v3 + 8);
    }
    if (v6) {
      uint64_t v4 = v3;
    }
    uint64_t v3 = *v7;
  }
  while (*v7);
  if (v4 == *(void *)a1 + 8 || *(_DWORD *)(v4 + 32) > a2) {
    return 0;
  }
  std::any::operator=[abi:ne180100](a3, (void (**)(uint64_t))(v4 + 40));
  return 1;
}

void BitCounter::initialize(BitCounter *this, int a2, int a3)
{
  *((_DWORD *)this + EchoCodeDecoder::reset(this - 1) = a2;
  if (a3)
  {
    uint64_t v5 = *((void *)this + 3);
    uint64_t v4 = (unint64_t *)((char *)this + 24);
    unint64_t v6 = (8 * a2);
    unint64_t v7 = *((void *)this + 4) - v5;
    if (v6 <= v7)
    {
      if (v6 < v7) {
        *((void *)this + 4) = v5 + v6;
      }
    }
    else
    {
      std::vector<signed char>::__append(v4, v6 - v7);
    }
  }
  *((_DWORD *)this + 4) = 0;
  *(_DWORD *)this = 0;
  *((void *)this + EchoCodeDecoder::reset(this - 1) = 0;
}

void BitCounter::reset(BitCounter *this, int a2)
{
  *((_DWORD *)this + 4) = 0;
  *(_DWORD *)this = 0;
  *((void *)this + EchoCodeDecoder::reset(this - 1) = 0;
  uint64_t v3 = (unsigned char *)*((void *)this + 3);
  uint64_t v4 = (unsigned char *)*((void *)this + 4);
  if (v3 != v4 && a2 != 0)
  {
    *((_DWORD *)this + 12) = 0;
    if (v4 - v3 >= 1) {
      bzero(v3, v4 - v3);
    }
  }
}

uint64_t BitCounter::decodeBit(BitCounter *this)
{
  unsigned int v1 = *((_DWORD *)this + 2);
  unsigned int v2 = *((_DWORD *)this + 3);
  int v3 = v1 - v2;
  if (v1 == v2) {
    return -1;
  }
  unsigned int v4 = v1 <= v2 ? *((_DWORD *)this + 3) : *((_DWORD *)this + 2);
  if (v3 < 0) {
    int v3 = v2 - v1;
  }
  if ((float)((float)v4 / (float)v3) >= 5.0) {
    return -1;
  }
  else {
    return v1 <= v2;
  }
}

uint64_t BitCounter::count(uint64_t this, int a2)
{
  if (a2) {
    ++*(_DWORD *)(this + 12);
  }
  else {
    ++*(_DWORD *)(this + 8);
  }
  *(_DWORD *)(this + 16) = 0;
  uint64_t v2 = *(void *)(this + 24);
  uint64_t v3 = *(void *)(this + 32);
  if (v2 != v3)
  {
    uint64_t v4 = *(unsigned int *)(this + 48);
    if (v4 < (int)v3 - (int)v2)
    {
      *(_DWORD *)(this + 48) = v4 + 1;
      *(unsigned char *)(v2 + v4) = 2 * (a2 & 1) - 1;
    }
  }
  ++*(_DWORD *)this;
  return this;
}

uint64_t BitCounter::count(uint64_t this)
{
  uint64_t v1 = *(void *)(this + 24);
  uint64_t v2 = *(void *)(this + 32);
  if (v1 != v2)
  {
    uint64_t v3 = *(unsigned int *)(this + 48);
    if (v3 < (int)v2 - (int)v1)
    {
      *(_DWORD *)(this + 48) = v3 + 1;
      *(unsigned char *)(v1 + v3) = 0;
    }
  }
  ++*(_DWORD *)this;
  ++*(_DWORD *)(this + 16);
  return this;
}

void PayloadQueue::set(PayloadQueue *this, const unsigned __int8 *a2, int a3)
{
  unint64_t v6 = (void **)*((void *)this + 2);
  uint64_t v7 = *((void *)this + 3);
  *((void *)this + 6) = 0;
  unint64_t v8 = v7 - (void)v6;
  if (v8 >= 0x11)
  {
    do
    {
      operator delete(*v6);
      uint64_t v9 = *((void *)this + 3);
      unint64_t v6 = (void **)(*((void *)this + 2) + 8);
      *((void *)this + 2) = v6;
      unint64_t v8 = v9 - (void)v6;
    }
    while (v8 > 0x10);
  }
  if (v8 >> 3 == 1)
  {
    uint64_t v10 = 2048;
  }
  else
  {
    if (v8 >> 3 != 2) {
      goto LABEL_8;
    }
    uint64_t v10 = 4096;
  }
  *((void *)this + 5) = v10;
LABEL_8:
  int v11 = a3 - 1;
  if (v11 >= 0)
  {
    uint64_t v12 = (char *)this + 8;
    do
    {
      unsigned __int8 v13 = a2[v11];
      int v14 = 8;
      do
      {
        char v16 = v13 & 1;
        std::deque<unsigned char>::push_front((uint64_t)v12, &v16);
        v13 >>= 1;
        --v14;
      }
      while (v14);
    }
    while (v11-- > 0);
  }
}

int64x2_t std::deque<unsigned char>::push_front(uint64_t a1, unsigned char *a2)
{
  unint64_t v4 = *(void *)(a1 + 32);
  if (!v4)
  {
    std::deque<unsigned char>::__add_front_capacity((void **)a1);
    unint64_t v4 = *(void *)(a1 + 32);
  }
  uint64_t v5 = *(void *)(a1 + 8);
  unint64_t v6 = (void *)(v5 + 8 * (v4 >> 12));
  uint64_t v7 = *v6 + (v4 & 0xFFF);
  if (*(void *)(a1 + 16) == v5) {
    uint64_t v7 = 0;
  }
  if (v7 == *v6) {
    uint64_t v7 = *(v6 - 1) + 4096;
  }
  *(unsigned char *)(v7 - EchoCodeDecoder::reset(this - 1) = *a2;
  int64x2_t result = vaddq_s64(*(int64x2_t *)(a1 + 32), (int64x2_t)xmmword_237D2E020);
  *(int64x2_t *)(a1 + 32) = result;
  return result;
}

void *PayloadQueue::insertBit(PayloadQueue *this, unsigned int a2, char a3)
{
  char v10 = a3;
  uint64_t v4 = *((void *)this + 2);
  uint64_t v5 = (char *)(v4 + 8 * (*((void *)this + 5) >> 12));
  if (*((void *)this + 3) == v4)
  {
    uint64_t v6 = 0;
    if (!a2) {
      return std::deque<unsigned char>::insert((int64x2_t *)((char *)this + 8), v5, v6, &v10);
    }
  }
  else
  {
    uint64_t v6 = *(void *)v5 + (*((void *)this + 5) & 0xFFFLL);
    if (!a2) {
      return std::deque<unsigned char>::insert((int64x2_t *)((char *)this + 8), v5, v6, &v10);
    }
  }
  uint64_t v7 = v6 - *(void *)v5 + a2;
  if (v7 < 1)
  {
    unint64_t v8 = 4095 - v7;
    v5 -= 8 * (v8 >> 12);
    uint64_t v6 = *(void *)v5 + (~(_WORD)v8 & 0xFFF);
  }
  else
  {
    v5 += 8 * ((unint64_t)v7 >> 12);
    uint64_t v6 = *(void *)v5 + (v7 & 0xFFF);
  }
  return std::deque<unsigned char>::insert((int64x2_t *)((char *)this + 8), v5, v6, &v10);
}

void *std::deque<unsigned char>::insert(int64x2_t *a1, char *a2, uint64_t a3, char *a4)
{
  unint64_t v6 = a1[2].u64[0];
  uint64_t v7 = a1->i64[1];
  uint64_t v8 = a1[1].i64[0];
  uint64_t v9 = (char *)(v7 + 8 * (v6 >> 12));
  if (v8 == v7) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = *(void *)v9 + (a1[2].i64[0] & 0xFFF);
  }
  if (a3 == v10) {
    unint64_t v11 = 0;
  }
  else {
    unint64_t v11 = a3 + ((a2 - v9) << 9) - (v10 + *(void *)a2) + *(void *)v9;
  }
  uint64_t v12 = a1[2].i64[1];
  unint64_t v13 = v12 - v11;
  if (v11 >= v12 - v11)
  {
    if (v8 == v7) {
      uint64_t v20 = 0;
    }
    else {
      uint64_t v20 = ((v8 - v7) << 9) - 1;
    }
    if (v20 == v12 + v6)
    {
      std::deque<unsigned char>::__add_back_capacity(a1);
      uint64_t v12 = a1[2].i64[1];
      unint64_t v13 = v12 - v11;
    }
    if (v12 == v11)
    {
      *(unsigned char *)(*(void *)(a1->i64[1] + (((a1[2].i64[0] + v11) >> 9) & 0x7FFFFFFFFFFFF8))
               + ((a1[2].i64[0] + v11) & 0xFFF)) = *a4;
      ++a1[2].i64[1];
    }
    else
    {
      v51 = a4;
      unint64_t v21 = a1[2].i64[0] + v12;
      uint64_t v22 = a1->i64[1];
      unint64_t v23 = (char *)(v22 + 8 * (v21 >> 12));
      uint64_t v24 = *(void *)v23;
      uint64_t v25 = (char *)(*(void *)v23 + (v21 & 0xFFF));
      if (a1[1].i64[0] == v22) {
        uint64_t v25 = 0;
      }
      unint64_t v49 = v23;
      unsigned __int8 v50 = v25;
      uint64_t v26 = (uint64_t)&v25[~v24];
      if (v26 < 1)
      {
        unint64_t v37 = 4095 - v26;
        unint64_t v27 = &v23[-8 * (v37 >> 12)];
        uint64_t v28 = (char *)(*(void *)v27 + (~(_WORD)v37 & 0xFFF));
      }
      else
      {
        unint64_t v27 = &v23[8 * ((unint64_t)v26 >> 12)];
        uint64_t v28 = (char *)(*(void *)v27 + (v26 & 0xFFF));
      }
      if (v28 == a4)
      {
        v51 = v25;
        a4 = v25;
      }
      *uint64_t v25 = *v28;
      ++a1[2].i64[1];
      if (v13 >= 2)
      {
        uint64_t v38 = (char *)std::__deque_iterator<unsigned char,unsigned char *,unsigned char &,unsigned char **,long,4096l>::operator-[abi:ne180100]((uint64_t)&v49, v13);
        unint64_t v23 = std::deque<unsigned char>::__move_backward_and_check((uint64_t)a1, v38, v39, v27, v28, v49, v50, (unint64_t *)&v51);
        uint64_t v25 = v40;
        unint64_t v49 = v23;
        unsigned __int8 v50 = v40;
        a4 = v51;
      }
      char v41 = *a4;
      if (v25 == *(char **)v23)
      {
        unint64_t v49 = v23 - 8;
        uint64_t v25 = (char *)(*((void *)v23 - 1) + 4096);
      }
      *(v25 - EchoCodeDecoder::reset(this - 1) = v41;
    }
  }
  else
  {
    if (v6)
    {
      if (v11)
      {
LABEL_10:
        v51 = a4;
        uint64_t v14 = a1->i64[1];
        uint64_t v15 = (uint64_t *)(v14 + 8 * ((unint64_t)a1[2].i64[0] >> 12));
        uint64_t v16 = *v15;
        if (a1[1].i64[0] == v14) {
          uint64_t v17 = 0;
        }
        else {
          uint64_t v17 = (char *)(*v15 + (a1[2].i64[0] & 0xFFF));
        }
        unint64_t v49 = (char *)(v14 + 8 * ((unint64_t)a1[2].i64[0] >> 12));
        unsigned __int8 v50 = v17;
        uint64_t v18 = (uint64_t)&v17[~v16];
        if (v18 < 1) {
          uint64_t v19 = (char *)(v15[-((unint64_t)(4095 - v18) >> 12)] + (~(4095 - (_WORD)v18) & 0xFFF));
        }
        else {
          uint64_t v19 = (char *)(*(uint64_t *)((char *)v15 + (((unint64_t)v18 >> 9) & 0x7FFFFFFFFFFFF8)) + (v18 & 0xFFF));
        }
        if (v17 == a4)
        {
          v51 = v19;
          a4 = v19;
        }
        char *v19 = *v17;
        a1[2] = vaddq_s64(a1[2], (int64x2_t)xmmword_237D2E020);
        if (v11 >= 2)
        {
          uint64_t v32 = (uint64_t)&v17[-*v15];
          if (v32 < 0)
          {
            unint64_t v42 = 4094 - v32;
            uint64_t v34 = (char *)&v15[-(v42 >> 12)];
            uint64_t v35 = *(void *)v34;
            uint64_t v36 = ~v42 & 0xFFFLL;
          }
          else
          {
            unint64_t v33 = v32 + 1;
            uint64_t v34 = (char *)&v15[v33 >> 12];
            uint64_t v35 = *(void *)v34;
            uint64_t v36 = v33 & 0xFFF;
          }
          long long v43 = (char *)(v35 + v36);
          long long v44 = (char *)std::__deque_iterator<unsigned char,unsigned char *,unsigned char &,unsigned char **,long,4096l>::operator+[abi:ne180100]((uint64_t)&v49, v11);
          unint64_t v49 = (char *)std::deque<unsigned char>::__move_and_check((int)a1, v34, v43, v44, v45, (void **)v49, v50, (unint64_t *)&v51);
          unsigned __int8 v50 = v17;
          a4 = v51;
        }
        char *v17 = *a4;
        goto LABEL_49;
      }
    }
    else
    {
      std::deque<unsigned char>::__add_front_capacity((void **)a1);
      if (v11) {
        goto LABEL_10;
      }
    }
    uint64_t v29 = a1->i64[1];
    uint64_t v30 = (void *)(v29 + 8 * ((unint64_t)a1[2].i64[0] >> 12));
    uint64_t v31 = *v30 + (a1[2].i64[0] & 0xFFF);
    if (a1[1].i64[0] == v29) {
      uint64_t v31 = 0;
    }
    if (v31 == *v30) {
      uint64_t v31 = *(v30 - 1) + 4096;
    }
    *(unsigned char *)(v31 - EchoCodeDecoder::reset(this - 1) = *a4;
    a1[2] = vaddq_s64(a1[2], (int64x2_t)xmmword_237D2E020);
  }
LABEL_49:
  uint64_t v46 = a1->i64[1];
  if (a1[1].i64[0] == v46) {
    unint64_t v47 = 0;
  }
  else {
    unint64_t v47 = (char *)(*(void *)(v46 + 8 * ((unint64_t)a1[2].i64[0] >> 12)) + (a1[2].i64[0] & 0xFFF));
  }
  unint64_t v49 = (char *)(v46 + 8 * ((unint64_t)a1[2].i64[0] >> 12));
  unsigned __int8 v50 = v47;
  return std::__deque_iterator<unsigned char,unsigned char *,unsigned char &,unsigned char **,long,4096l>::operator+[abi:ne180100]((uint64_t)&v49, v11);
}

void Random::Random(Random *this)
{
  *(void *)this = 0x100000000;
  *((void *)this + EchoCodeDecoder::reset(this - 1) = 0x3F80000000000000;
  *((unsigned char *)this + 20) = 0;
  int rep = std::chrono::system_clock::now().__d_.__rep_;
  if (rep >= 0) {
    unsigned int v3 = rep;
  }
  else {
    unsigned int v3 = -rep;
  }
  unsigned int v4 = v3 - 0x7FFFFFFF;
  if (v3 < 0x7FFFFFFF) {
    unsigned int v4 = v3;
  }
  if (v4 <= 1) {
    unsigned int v4 = 1;
  }
  *(_DWORD *)this = v3;
  *((_DWORD *)this + EchoCodeDecoder::reset(this - 1) = v4;
  *((void *)this + EchoCodeDecoder::reset(this - 1) = 0x3F80000000000000;
  *((unsigned char *)this + 20) = 0;
}

BOOL Random::setSeed(Random *this, unsigned int a2)
{
  if (a2)
  {
    unsigned int v2 = a2 + ((a2 / 0x7FFFFFFF) | ((a2 / 0x7FFFFFFF) << 31));
    if (v2 <= 1) {
      unsigned int v2 = 1;
    }
    *(_DWORD *)this = a2;
    *((_DWORD *)this + EchoCodeDecoder::reset(this - 1) = v2;
  }
  return a2 != 0;
}

_DWORD *Random::reset(_DWORD *this)
{
  unsigned int v1 = *this + ((*this / 0x7FFFFFFFu) | ((*this / 0x7FFFFFFFu) << 31));
  if (v1 <= 1) {
    unsigned int v1 = 1;
  }
  this[1] = v1;
  return this;
}

void Random::getSamples(Random *this, float *a2, unsigned int a3)
{
  if (a3)
  {
    unsigned int v4 = (float *)((char *)this + 8);
    uint64_t v5 = (unsigned int *)((char *)this + 4);
    uint64_t v6 = a3;
    do
    {
      *a2++ = std::normal_distribution<float>::operator()<std::linear_congruential_engine<unsigned int,48271u,0u,2147483647u>>((uint64_t)v4, v5, v4);
      --v6;
    }
    while (v6);
  }
}

uint64_t Random::instance(Random *this)
{
  {
    operator new();
  }
  return Random::instance(void)::sInstance;
}

void sub_237D20004(_Unwind_Exception *a1)
{
}

void EchoEmbedder::initialize(uint64_t a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7 = 0;
  v36[1] = *(float32x2_t *)MEMORY[0x263EF8340];
  unsigned int v34 = 0;
  v36[0] = 0;
  v35[0] = 102;
  uint64_t v8 = (float *)(a1 + 24);
  v35[1] = a1 + 24;
  v35[2] = 103;
  uint64_t v9 = (float *)(a1 + 28);
  v35[3] = a1 + 28;
  v35[4] = 105;
  v35[5] = v36;
  v35[6] = 106;
  v35[7] = (char *)v36 + 4;
  v35[8] = 0x10000006ELL;
  v35[9] = &v34;
  v35[10] = 111;
  uint64_t v10 = (float *)(a1 + 20);
  v35[11] = a1 + 20;
  v35[12] = 0x500000070;
  unint64_t v11 = (_WORD *)(a1 + 32);
  uint64_t v12 = (void *)(a4 + 8);
  v35[13] = a1 + 32;
  do
  {
    uint64_t v13 = *v12;
    if (*v12)
    {
      unsigned int v14 = v35[2 * v7];
      uint64_t v15 = v12;
      do
      {
        unsigned int v16 = *(_DWORD *)(v13 + 32);
        BOOL v17 = v16 >= v14;
        if (v16 >= v14) {
          uint64_t v18 = (uint64_t *)v13;
        }
        else {
          uint64_t v18 = (uint64_t *)(v13 + 8);
        }
        if (v17) {
          uint64_t v15 = (void *)v13;
        }
        uint64_t v13 = *v18;
      }
      while (*v18);
      if (v15 != v12 && v14 >= *((_DWORD *)v15 + 8))
      {
        int v19 = HIDWORD(v35[2 * v7]);
        switch(v19)
        {
          case 5:
            unint64_t v21 = (unsigned __int8 *)std::any_cast[abi:ne180100]<BOOL const>((uint64_t (**)(uint64_t, void, void, void, void *))v15 + 5);
            if (!v21) {
              goto LABEL_51;
            }
            *(_WORD *)v35[2 * v7 + 1] = *v21 | 0x100;
            break;
          case 1:
            uint64_t v22 = std::any_cast[abi:ne180100]<unsigned int const>((uint64_t (**)(uint64_t, void, void, void, void *))v15 + 5);
            if (!v22) {
LABEL_51:
            }
              std::__throw_bad_any_cast[abi:ne180100]();
            *(_DWORD *)v35[2 * v7 + 1] = *v22;
            break;
          case 0:
            uint64_t v20 = std::any_cast[abi:ne180100]<float const>((uint64_t (**)(uint64_t, void, void, void, void *))v15 + 5);
            if (!v20) {
              goto LABEL_51;
            }
            *(_DWORD *)v35[2 * v7 + 1] = *v20;
            break;
        }
      }
    }
    ++v7;
  }
  while (v7 != 7);
  if (*v8 == 0.0) {
    float *v8 = 1.0;
  }
  if (*v9 == 0.0) {
    *uint64_t v9 = 0.01;
  }
  if (v36[0].f32[0] == 0.0) {
    v36[0].i32[0] = 990057071;
  }
  if (v36[0].f32[1] == 0.0) {
    v36[0].i32[1] = 1006834287;
  }
  if (*v10 == 0.0) {
    *uint64_t v10 = 18000.0;
  }
  std::vector<unsigned int>::resize((std::vector<int> *)(a1 + 40), 2uLL);
  unint64_t v23 = *(uint32x2_t **)(a1 + 40);
  *unint64_t v23 = vcvt_u32_f32(vmul_n_f32(v36[0], (float)a2));
  uint64_t v24 = (uint32x2_t *)((char *)v23 + 4);
  *(_DWORD *)(a1 + 8) = a2;
  *(_DWORD *)(a1 + 12) = a3;
  *(_DWORD *)(a1 + 16) = 0;
  if (!*(unsigned char *)(a1 + 33)) {
    *unint64_t v11 = 257;
  }
  uint64_t v25 = *(uint32x2_t **)(a1 + 48);
  if (v23 != v25 && v24 != v25)
  {
    unsigned __int32 v26 = v23->i32[0];
    unint64_t v27 = (uint32x2_t *)((char *)v23 + 4);
    do
    {
      unsigned __int32 v29 = v27->i32[0];
      unint64_t v27 = (uint32x2_t *)((char *)v27 + 4);
      unsigned __int32 v28 = v29;
      BOOL v30 = v26 >= v29;
      if (v26 <= v29) {
        unsigned __int32 v26 = v28;
      }
      if (!v30) {
        unint64_t v23 = v24;
      }
      uint64_t v24 = v27;
    }
    while (v27 != v25);
  }
  __int32 v31 = v23->i32[0];
  std::vector<float>::resize(a1 + 64, a3);
  std::vector<float>::resize(a1 + 88, (*(_DWORD *)(a1 + 12) + v31));
  uint64_t v32 = *(_DWORD **)(a1 + 112);
  if (v34)
  {
    unsigned int v33 = v34 + ((v34 / 0x7FFFFFFF) | ((v34 / 0x7FFFFFFF) << 31));
    if (v33 <= 1) {
      unsigned int v33 = 1;
    }
    _DWORD *v32 = v34;
    v32[1] = v33;
  }
  else
  {
    unsigned int v33 = *v32 + ((*v32 / 0x7FFFFFFFu) | ((*v32 / 0x7FFFFFFFu) << 31));
    if (v33 <= 1) {
      unsigned int v33 = 1;
    }
  }
  v32[1] = v33;
}

void std::vector<unsigned int>::resize(std::vector<int> *this, std::vector<int>::size_type __sz)
{
  std::vector<int>::size_type v2 = this->__end_ - this->__begin_;
  if (__sz <= v2)
  {
    if (__sz < v2) {
      this->__end_ = &this->__begin_[__sz];
    }
  }
  else
  {
    std::vector<unsigned int>::__append(this, __sz - v2);
  }
}

uint64_t EchoEmbedder::reset(uint64_t this)
{
  *(_DWORD *)(this + 16) = 0;
  unsigned int v1 = *(_DWORD **)(this + 112);
  unsigned int v2 = *v1 + ((*v1 / 0x7FFFFFFFu) | ((*v1 / 0x7FFFFFFFu) << 31));
  if (v2 <= 1) {
    unsigned int v2 = 1;
  }
  v1[1] = v2;
  *(_DWORD *)(this + 120) = 0;
  return this;
}

uint64_t EchoEmbedder::encodeEcho(EchoEmbedder *this, float *__C, vDSP_Length __N)
{
  LODWORD(v3) = __N;
  if ((int)__N >= 1 && *((_DWORD *)this + 30) < *((_DWORD *)this + 42))
  {
    unsigned int v6 = *((_DWORD *)this + 4);
    while (1)
    {
      if (v6)
      {
        unsigned int v7 = *((_DWORD *)this + 3);
      }
      else
      {
        uint64_t v8 = *((unsigned int *)this + 30);
        if (v8 >= *((_DWORD *)this + 42)) {
          unint64_t v9 = 0;
        }
        else {
          unint64_t v9 = *(unsigned __int8 *)(*(void *)(*((void *)this + 17)
        }
                                              + (((unint64_t)(*((void *)this + 20) + v8) >> 9) & 0x7FFFFFFFFFFFF8))
                                  + ((*((void *)this + 20) + v8) & 0xFFF));
        uint64_t v10 = *((void *)this + 5);
        if (v9 >= (*((void *)this + 6) - v10) >> 2) {
          return 0;
        }
        unint64_t v11 = (float *)*((void *)this + 11);
        unsigned int v12 = *((_DWORD *)this + 3);
        int v13 = *(_DWORD *)(v10 + 4 * v9);
        uint64_t v14 = v13 + v12;
        if (v13 + v12)
        {
          uint64_t v15 = *((void *)this + 14);
          unsigned int v16 = (float *)(v15 + 8);
          BOOL v17 = (unsigned int *)(v15 + 4);
          do
          {
            *v11++ = std::normal_distribution<float>::operator()<std::linear_congruential_engine<unsigned int,48271u,0u,2147483647u>>((uint64_t)v16, v17, v16);
            --v14;
          }
          while (v14);
          unint64_t v11 = (float *)*((void *)this + 11);
          int v13 = *(_DWORD *)(*((void *)this + 5) + 4 * v9);
          unsigned int v12 = *((_DWORD *)this + 3);
        }
        vDSP_vsma(v11, 1, (const float *)this + 6, &v11[v13], 1, *((float **)this + 8), 1, v12);
        unsigned int v7 = *((_DWORD *)this + 3);
        *((_DWORD *)this + 4) = v7;
        unsigned int v6 = v7;
      }
      if (v3 >= v6) {
        vDSP_Length v18 = v6;
      }
      else {
        vDSP_Length v18 = v3;
      }
      vDSP_vsmul((const float *)(*((void *)this + 8) + 4 * (v7 - v6)), 1, (const float *)this + 7, __C, 1, v18);
      LODWORD(v3) = v3 - v18;
      __C += v18;
      unsigned int v6 = *((_DWORD *)this + 4) - v18;
      *((_DWORD *)this + 4) = v6;
      if (v6)
      {
        if ((int)v3 <= 0) {
          return 1;
        }
      }
      else
      {
        int v19 = *((_DWORD *)this + 30);
        unsigned int v20 = v19 + 1;
        unsigned int v21 = *((_DWORD *)this + 42);
        if (v19 + 1 < v21) {
          int v22 = v19 + 1;
        }
        else {
          int v22 = *((_DWORD *)this + 42);
        }
        *((_DWORD *)this + 30) = v22;
        if (v20 >= v21 || (int)v3 <= 0) {
          break;
        }
      }
    }
  }
  if ((int)v3 >= 1)
  {
    if (!*((unsigned char *)this + 33) || !*((unsigned char *)this + 32))
    {
      uint64_t v23 = 1;
      vDSP_vclr(__C, 1, v3);
      return v23;
    }
    uint64_t v3 = v3;
    do
    {
      *__C++ = std::normal_distribution<float>::operator()<std::linear_congruential_engine<unsigned int,48271u,0u,2147483647u>>(*((void *)this + 14) + 8, (unsigned int *)(*((void *)this + 14) + 4), (float *)(*((void *)this + 14) + 8))* *((float *)this + 7);
      --v3;
    }
    while (v3);
  }
  return 1;
}

void SyncedEchoEmbedder::initialize(uint64_t a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  EchoEmbedder::initialize(a1, a2, a3, a4);
  unsigned int v6 = *(unsigned int **)(a1 + 56);
  unsigned int v7 = (void **)(a1 + 40);
  float v8 = (float)a2;
  unsigned int v9 = (float)((float)a2 * 0.005);
  uint64_t v10 = *(unsigned int **)(a1 + 48);
  if (v10 >= v6)
  {
    unsigned int v12 = (unsigned int *)*v7;
    uint64_t v13 = ((char *)v10 - (unsigned char *)*v7) >> 2;
    unint64_t v14 = v13 + 1;
    if ((unint64_t)(v13 + 1) >> 62) {
      goto LABEL_46;
    }
    uint64_t v15 = (char *)v6 - (char *)v12;
    if (v15 >> 1 > v14) {
      unint64_t v14 = v15 >> 1;
    }
    if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v16 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v16 = v14;
    }
    if (v16)
    {
      BOOL v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(a1 + 56, v16);
      unsigned int v12 = *(unsigned int **)(a1 + 40);
      uint64_t v10 = *(unsigned int **)(a1 + 48);
    }
    else
    {
      BOOL v17 = 0;
    }
    vDSP_Length v18 = (unsigned int *)&v17[4 * v13];
    unsigned int v6 = (unsigned int *)&v17[4 * v16];
    *vDSP_Length v18 = v9;
    unint64_t v11 = v18 + 1;
    while (v10 != v12)
    {
      unsigned int v19 = *--v10;
      *--vDSP_Length v18 = v19;
    }
    *(void *)(a1 + 40) = v18;
    *(void *)(a1 + 48) = v11;
    *(void *)(a1 + 56) = v6;
    if (v12)
    {
      operator delete(v12);
      unsigned int v6 = *(unsigned int **)(a1 + 56);
    }
  }
  else
  {
    *uint64_t v10 = v9;
    unint64_t v11 = v10 + 1;
  }
  *(void *)(a1 + 48) = v11;
  unsigned int v20 = (float)(v8 * 0.01);
  if (v11 < v6)
  {
    *unint64_t v11 = v20;
    unsigned int v21 = v11 + 1;
    goto LABEL_33;
  }
  int v22 = (unsigned int *)*v7;
  uint64_t v23 = ((char *)v11 - (unsigned char *)*v7) >> 2;
  unint64_t v24 = v23 + 1;
  if ((unint64_t)(v23 + 1) >> 62) {
LABEL_46:
  }
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  uint64_t v25 = (char *)v6 - (char *)v22;
  if (v25 >> 1 > v24) {
    unint64_t v24 = v25 >> 1;
  }
  if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFFCLL) {
    unint64_t v26 = 0x3FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v26 = v24;
  }
  if (v26)
  {
    unint64_t v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(a1 + 56, v26);
    int v22 = *(unsigned int **)(a1 + 40);
    unint64_t v11 = *(unsigned int **)(a1 + 48);
  }
  else
  {
    unint64_t v27 = 0;
  }
  unsigned __int32 v28 = (unsigned int *)&v27[4 * v23];
  unsigned __int32 v29 = &v27[4 * v26];
  unsigned int *v28 = v20;
  unsigned int v21 = v28 + 1;
  while (v11 != v22)
  {
    unsigned int v30 = *--v11;
    *--unsigned __int32 v28 = v30;
  }
  *(void *)(a1 + 40) = v28;
  *(void *)(a1 + 48) = v21;
  *(void *)(a1 + 56) = v29;
  if (v22) {
    operator delete(v22);
  }
LABEL_33:
  *(void *)(a1 + 48) = v21;
  __int32 v31 = *(unsigned int **)(a1 + 40);
  uint64_t v32 = v31 + 1;
  if (v31 != v21 && v32 != v21)
  {
    unsigned int v34 = *v31;
    uint64_t v35 = v31 + 1;
    do
    {
      unsigned int v37 = *v35++;
      unsigned int v36 = v37;
      BOOL v38 = v34 >= v37;
      if (v34 <= v37) {
        unsigned int v34 = v36;
      }
      if (!v38) {
        __int32 v31 = v32;
      }
      uint64_t v32 = v35;
    }
    while (v35 != v21);
  }
  unint64_t v39 = *(_DWORD *)(a1 + 12) + *v31;

  std::vector<float>::resize(a1 + 88, v39);
}

void *SyncedEchoEmbedder::setPayload(SyncedEchoEmbedder *this, const unsigned __int8 *a2, int a3)
{
  unsigned int v3 = (*((_DWORD *)this + 12) - *((_DWORD *)this + 10)) >> 2;
  v7[0] = v3 - 2;
  v7[1] = v3 - 1;
  unsigned int v4 = (SyncedEchoEmbedder *)((char *)this + 120);
  PayloadQueue::set((SyncedEchoEmbedder *)((char *)this + 120), a2, a3);
  for (uint64_t i = 0; i != 8; ++i)
    int64x2_t result = PayloadQueue::insertBit(v4, i, v7[kSyncEchoBitData[i]]);
  return result;
}

void EchoEmbedder::setPayload(EchoEmbedder *this, const unsigned __int8 *a2, int a3)
{
}

void EchoDetector::EchoDetector(EchoDetector *this)
{
  *(_DWORD *)this = 0;
  *((void *)this + EchoCodeDecoder::reset(this - 1) = 0;
  *((_DWORD *)this + 4) = 0;
  int v2 = 0;
  std::vector<float>::vector((void *)this + 3, 2uLL, &v2);
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 3) = 0u;
}

void sub_237D20914(_Unwind_Exception *a1)
{
  std::unique_ptr<OpaqueFFTSetup,applesauce::raii::v1::detail::opaque_deletion_functor<OpaqueFFTSetup*,&(vDSP_destroy_fftsetup)>>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

void EchoDetector::initialize(EchoDetector *this, unsigned int a2, int a3, const float *a4)
{
  vDSP_Length v8 = (ceil(log((double)a2) / 0.693147182) + 0.5);
  *(_DWORD *)this = a3;
  *((_DWORD *)this + 4) = a2;
  std::vector<float>::resize((uint64_t)this + 48, 1 << (v8 + 1));
  std::vector<float>::resize((uint64_t)this + 72, 1 << (v8 - 1));
  unsigned int v9 = (unsigned char *)*((void *)this + 3);
  uint64_t v10 = (unsigned char *)*((void *)this + 4);
  if (v10 != v9) {
    memmove(v9, a4, v10 - v9);
  }
  fftsetup = vDSP_create_fftsetup(v8, 0);

  std::unique_ptr<OpaqueFFTSetup,applesauce::raii::v1::detail::opaque_deletion_functor<OpaqueFFTSetup*,&(vDSP_destroy_fftsetup)>>::reset[abi:ne180100]((OpaqueFFTSetup **)this + 1, fftsetup);
}

uint64_t EchoDetector::decodeEcho(EchoDetector *this, const float *a2, unsigned int a3, BOOL *a4, int a5)
{
  v32[1] = *MEMORY[0x263EF8340];
  if (*((_DWORD *)this + 4) > a3) {
    return 0;
  }
  uint32x2_t v29 = vcvt_u32_f32(vrndm_f32(vmul_n_f32(*(float32x2_t *)(*((void *)this + 3) + 4 * (2 * a5)), (float)*(unsigned int *)this)));
  EchoDetector::autoCepstrum(this, a2, a3);
  float v7 = (float)*(unsigned int *)this;
  unsigned int v8 = (float)((float)(v7 * 0.5) / 1000.0);
  unint64_t v9 = v29.i32[0] - v8;
  unint64_t v10 = v29.i32[1] + v8;
  float v11 = 0.0;
  unsigned int v12 = v10 - v9;
  if (v10 > v9)
  {
    do
    {
      float v11 = v11 + (float)(*(float *)(*((void *)this + 9) + 4 * v9) * *(float *)(*((void *)this + 9) + 4 * v9));
      ++v9;
    }
    while (v9 < v10);
  }
  uint64_t v13 = 0;
  float v14 = sqrtf(v11 / (float)v12);
  uint64_t v31 = 0;
  v32[0] = 0;
  unsigned int v15 = (float)((float)(v7 * 0.125) / 1000.0);
  uint32x2_t v30 = v29;
  char v16 = 1;
  do
  {
    char v17 = v16;
    __int32 v18 = v30.i32[v13];
    unsigned __int32 v19 = v18 - v15;
    uint64_t v20 = v18 + v15;
    *((_DWORD *)v32 + v13) = 0;
    float v21 = 0.0;
    if (v18 - v15 < v20)
    {
      int v22 = (float *)(*((void *)this + 9) + 4 * v19);
      uint64_t v23 = v20 - v19;
      do
      {
        float v24 = *v22++;
        float v25 = v24;
        if (v24 >= v21) {
          float v21 = v25;
        }
        --v23;
      }
      while (v23);
      *((float *)v32 + v13) = v21;
    }
    float v26 = log10f(v21 / v14);
    char v16 = 0;
    *((float *)&v32[-1] + v13) = v26 * 20.0;
    uint64_t v13 = 1;
  }
  while ((v17 & 1) != 0);
  if (*(float *)&v31 > 12.0)
  {
    BOOL v27 = *((float *)&v31 + 1) > 12.0 && *(float *)v32 <= *((float *)v32 + 1);
    goto LABEL_19;
  }
  if (*((float *)&v31 + 1) <= 12.0) {
    return 0;
  }
  BOOL v27 = 1;
LABEL_19:
  *a4 = v27;
  return 1;
}

float EchoDetector::autoCepstrum(EchoDetector *this, const float *a2, unsigned int a3)
{
  uint64_t v5 = (char *)this + 48;
  unsigned int v4 = (void *)*((void *)this + 6);
  unint64_t v6 = (uint64_t)(*((void *)v5 + 1) - (void)v4) >> 2;
  unint64_t v7 = v6 >> 1;
  vDSP_Length v8 = 32 - __clz((v6 >> 1) - 1);
  uint64_t v9 = a3;
  if (a3)
  {
    memmove(v4, a2, 4 * a3);
    unsigned int v4 = (void *)*((void *)this + 6);
    uint64_t v10 = (uint64_t)(*((void *)this + 7) - (void)v4) >> 2;
  }
  else
  {
    uint64_t v10 = v6;
  }
  vDSP_vclr((float *)v4 + v9, 1, v10 - v9);
  v21.realp = (float *)*((void *)this + 6);
  v21.imagp = &v21.realp[v7];
  vDSP_fft_zip(*((FFTSetup *)this + 1), &v21, 1, v8, 1);
  uint64_t v11 = *((void *)this + 6);
  if (v7)
  {
    uint64_t v12 = (v6 >> 1);
    uint64_t v13 = (float *)*((void *)this + 6);
    unint64_t v14 = v6 >> 1;
    do
    {
      float *v13 = logf((float)(*(float *)(v11 + 4 * v14) * *(float *)(v11 + 4 * v14))+ (float)(*v13 * *v13));
      ++v13;
      LODWORD(v14) = v14 + 1;
      --v12;
    }
    while (v12);
  }
  vDSP_vclr((float *)(v11 + 4 * (v6 >> 1)), 1, (v6 >> 1));
  vDSP_fft_zip(*((FFTSetup *)this + 1), &v21, 1, v8, -1);
  if (v7 >= 2)
  {
    char v16 = (float *)*((void *)this + 6);
    char v17 = (float *)*((void *)this + 9);
    uint64_t v18 = (v6 >> 2) & 0x7FFFFFFF;
    unsigned __int32 v19 = v16;
    do
    {
      float v20 = *v19++;
      float result = sqrtf((float)(v16[v7] * v16[v7]) + (float)(v20 * v20));
      *v17++ = result;
      ++v7;
      --v18;
    }
    while (v18);
  }
  return result;
}

uint64_t AdaptiveThreshold::initialize(float **this, unsigned int a2, float a3)
{
  BOOL v3 = a3 < 0.0 || a2 == 0;
  uint64_t v4 = !v3;
  if (!v3)
  {
    unint64_t v7 = a2;
    std::vector<float>::resize((uint64_t)(this + 2), a2);
    std::vector<float>::resize((uint64_t)(this + 5), v7);
    vDSP_vclr(this[2], 1, this[3] - this[2]);
    *(float *)this = a3;
    *((float *)this + EchoCodeDecoder::reset(this - 1) = a3;
    *((_DWORD *)this + 2) = 0;
  }
  return v4;
}

float AdaptiveThreshold::reset(float **this)
{
  vDSP_vclr(this[2], 1, this[3] - this[2]);
  float result = *((float *)this + 1);
  *(float *)this = result;
  *((_DWORD *)this + 2) = 0;
  return result;
}

float AdaptiveThreshold::updateThreshold(AdaptiveThreshold *this, float a2)
{
  BOOL v3 = (const float *)*((void *)this + 2);
  uint64_t v4 = (const float *)*((void *)this + 3);
  if (v3 != v4)
  {
    uint64_t __StandardDeviation = 0;
    vDSP_normalize(v3, 1, 0, 1, (float *)&__StandardDeviation + 1, (float *)&__StandardDeviation, v4 - v3);
    uint64_t v6 = *((void *)this + 2);
    unint64_t v7 = *((void *)this + 3) - v6;
    float v8 = 0.0;
    float v9 = fabsf(a2);
    if (*((_DWORD *)this + 2) >= (v7 >> 2))
    {
      uint64_t v10 = __StandardDeviation;
      *(float *)this = *((float *)&__StandardDeviation + 1)
                     + (float)(*((float *)this + 1) * *(float *)&__StandardDeviation);
      float v8 = (float)(v9 - *((float *)&v10 + 1)) / *(float *)&v10;
    }
    memmove((void *)v6, (const void *)(v6 + 4), v7 - 4);
    int v11 = *((_DWORD *)this + 2);
    uint64_t v12 = *((void *)this + 3);
    if (v11 + 1 < ((unint64_t)(v12 - *((void *)this + 2)) >> 2)) {
      int v13 = v11 + 1;
    }
    else {
      int v13 = (unint64_t)(v12 - *((void *)this + 2)) >> 2;
    }
    *((_DWORD *)this + 2) = v13;
    if (v8 > *((float *)this + 1)) {
      float v9 = (float)(*(float *)(v12 - 8) * 0.98) + (float)(v9 * 0.02);
    }
    *(float *)(v12 - 4) = v9;
  }
  return *(float *)this;
}

uint64_t AdaptiveThreshold::minInitDelayInFrames(AdaptiveThreshold *this)
{
  return 21;
}

void SyncSequence::initialize(float **this, int a2, float a3, unsigned int a4, float a5)
{
  float __B = a3;
  float v8 = (char *)(this + 1);
  std::vector<float>::resize((uint64_t)(this + 1), 0x800uLL);
  vDSP_vsmul(&echoCodec::kSyncNoiseSequence[2048 * (unint64_t)(a2 != 44100)], 1, &__B, this[1], 1, 0x800uLL);
  int v9 = 0;
  std::vector<float>::resize((uint64_t)v8, a4, &v9);
  *(_DWORD *)this = 0;
}

uint64_t SyncSeqEmbedder::initialize(SyncSeqEmbedder *this, int a2, int a3, int a4, char a5)
{
  unsigned int v6 = *((_DWORD *)this + 7);
  if (!v6) {
    return 0;
  }
  float v8 = *((float *)this + 8);
  if (v8 == 0.0) {
    return 0;
  }
  float v9 = *((float *)this + 9);
  if (v9 == 0.0) {
    return 0;
  }
  SyncSeqEmbedder::initialize(this, a2, a4, 2 * a3, v6, v8, v9);
  *((unsigned char *)this + 40) = a5;
  uint64_t result = 1;
  *((unsigned char *)this + 8) = 1;
  return result;
}

void SyncSeqEmbedder::initialize(SyncSeqEmbedder *this, int a2, int a3, unsigned int a4, unsigned int a5, float a6, float a7)
{
  *((_DWORD *)this + 3) = a3;
  *((_DWORD *)this + 4) = a4;
  *((_DWORD *)this + 5) = a3;
  *((_DWORD *)this + 6) = a4;
  *((_DWORD *)this + 1EchoCodeDecoder::reset(this - 1) = 0;
  SyncSequence::initialize((float **)this + 7, a2, a6, a5, a7);
  ShapingFilter::initialize((uint64_t)this + 88, 1, a2, 1u, 1, a7);
  *((void *)this + 6) = 0;
  std::vector<float>::resize((uint64_t)this + 128, a4);
  int v11 = (float *)*((void *)this + 16);
  vDSP_Length v12 = (uint64_t)(*((void *)this + 17) - (void)v11) >> 2;

  vDSP_vclr(v11, 1, v12);
}

_DWORD *SyncSeqEmbedder::setConfig(_DWORD *result, uint64_t a2)
{
  int v2 = (float *)result;
  uint64_t v3 = 0;
  uint64_t v20 = *MEMORY[0x263EF8340];
  int v14 = 100;
  char v15 = 0;
  uint64_t v4 = result + 7;
  char v16 = result + 7;
  int v17 = 111;
  char v18 = 1;
  uint64_t v5 = (float *)(result + 9);
  unsigned __int32 v19 = result + 9;
  unsigned int v6 = (void *)(a2 + 8);
  do
  {
    uint64_t v7 = *v6;
    if (*v6)
    {
      unsigned int v8 = *(&v14 + 4 * v3);
      float v9 = v6;
      do
      {
        unsigned int v10 = *(_DWORD *)(v7 + 32);
        BOOL v11 = v10 >= v8;
        if (v10 >= v8) {
          vDSP_Length v12 = (uint64_t *)v7;
        }
        else {
          vDSP_Length v12 = (uint64_t *)(v7 + 8);
        }
        if (v11) {
          float v9 = (void *)v7;
        }
        uint64_t v7 = *v12;
      }
      while (*v12);
      if (v9 != v6 && v8 >= *((_DWORD *)v9 + 8))
      {
        int v13 = (uint64_t (**)(uint64_t, void, void, void, void *))(v9 + 5);
        if (*((unsigned char *)&v14 + 16 * v3 + 4))
        {
          uint64_t result = std::any_cast[abi:ne180100]<float const>(v13);
          if (!result) {
            goto LABEL_26;
          }
          *(&v16)[2 * v3] = *result;
        }
        else
        {
          uint64_t result = std::any_cast[abi:ne180100]<unsigned int const>(v13);
          if (!result) {
LABEL_26:
          }
            std::__throw_bad_any_cast[abi:ne180100]();
          *(&v16)[2 * v3] = *result;
        }
      }
    }
    ++v3;
  }
  while (v3 != 2);
  if (!*v4) {
    _DWORD *v4 = 2048;
  }
  if (v2[8] == 0.0) {
    v2[8] = 0.06;
  }
  if (*v5 == 0.0) {
    float *v5 = 18000.0;
  }
  return result;
}

uint64_t SyncSeqEmbedder::getFrameStartOffset(uint64_t a1, float **a2, unsigned int a3, uint64_t a4)
{
  uint64_t v8 = SyncSeqEmbedder::embedSyncFrame(a1, a2, a3);
  if (*(unsigned char *)(a1 + 40))
  {
    if (!*(_DWORD *)(a1 + 44))
    {
      unsigned int v10 = *a2;
      uint64_t v11 = a4;
      int v12 = a3;
      goto LABEL_6;
    }
    int v9 = *(_DWORD *)(a1 + 52);
    std::function<void ()(float *,unsigned int)>::operator()(a4, (uint64_t)*a2, *(_DWORD *)(a1 + 48));
    if (v9)
    {
      unsigned int v10 = &(*a2)[a3 - v9];
      uint64_t v11 = a4;
      int v12 = v9;
LABEL_6:
      std::function<void ()(float *,unsigned int)>::operator()(v11, (uint64_t)v10, v12);
    }
  }
  return v8;
}

uint64_t SyncSeqEmbedder::embedSyncFrame(uint64_t a1, float **a2, unsigned int a3)
{
  int v5 = *(_DWORD *)(a1 + 20);
  int v6 = *(_DWORD *)(a1 + 24);
  uint64_t v7 = *a2;
  if (((unint64_t)((char *)a2[1] - (char *)*a2) >> 2) < a3) {
    std::vector<float>::resize((uint64_t)a2, a3);
  }
  *(void *)(a1 + 48) = 0;
  int v8 = *(_DWORD *)(a1 + 44);
  if (v8 == 1)
  {
    unsigned int v9 = *(_DWORD *)(a1 + 20);
  }
  else
  {
    if (v8) {
      return (v6 + v5);
    }
    unsigned int v9 = *(_DWORD *)(a1 + 20);
    if (v9 >= a3)
    {
      *(_DWORD *)(a1 + 20) = v9 - a3;
      return (v6 + v5);
    }
    *(_DWORD *)(a1 + 44) = 1;
  }
  int v10 = a3 - v9;
  if (v9)
  {
    *(_DWORD *)(a1 + 48) = v9;
    v7 += v9;
    *(_DWORD *)(a1 + 20) = 0;
  }
  if (v10 >= 1)
  {
    uint64_t v12 = *(void *)(a1 + 64);
    uint64_t v11 = *(void *)(a1 + 72);
    unsigned int v13 = *(_DWORD *)(a1 + 56);
    do
    {
      unint64_t v14 = (unint64_t)(v11 - v12) >> 2;
      BOOL v15 = v14 >= v13;
      unsigned int v16 = v14 - v13;
      if (v16)
      {
        if (v16 != 0 && v15) {
          unsigned __int32 v19 = (const float *)(v12 + 4 * v13);
        }
        else {
          unsigned __int32 v19 = 0;
        }
        if (v10 >= v16) {
          vDSP_Length v18 = v16;
        }
        else {
          vDSP_Length v18 = v10;
        }
        vDSP_vadd(v7, 1, v19, 1, v7, 1, v18);
        unsigned int v13 = *(_DWORD *)(a1 + 56) + v18;
        uint64_t v12 = *(void *)(a1 + 64);
        uint64_t v11 = *(void *)(a1 + 72);
        if (v13 >= ((unint64_t)(v11 - v12) >> 2)) {
          unsigned int v13 = (unint64_t)(v11 - v12) >> 2;
        }
        *(_DWORD *)(a1 + 56) = v13;
        *(_DWORD *)(a1 + 24) -= v18;
      }
      else
      {
        int v17 = *(_DWORD *)(a1 + 24);
        if (v17)
        {
          if (v10 >= v17) {
            LODWORD(v18) = *(_DWORD *)(a1 + 24);
          }
          else {
            LODWORD(v18) = v10;
          }
          v17 -= v18;
          *(_DWORD *)(a1 + 24) = v17;
        }
        else
        {
          LODWORD(v18) = v10;
        }
        if (v10 == a3) {
          *(_DWORD *)(a1 + 48) = v18;
        }
        else {
          *(_DWORD *)(a1 + 52) = v18;
        }
        if (v17 <= 0) {
          *(_DWORD *)(a1 + 44) = 2;
        }
      }
      v7 += v18;
      BOOL v20 = __OFSUB__(v10, v18);
      v10 -= v18;
    }
    while (!((v10 < 0) ^ v20 | (v10 == 0)));
  }
  return (v6 + v5);
}

uint64_t std::function<void ()(float *,unsigned int)>::operator()(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v6 = a2;
  int v5 = a3;
  uint64_t v3 = *(void *)(a1 + 24);
  if (!v3) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t *, int *))(*(void *)v3 + 48))(v3, &v6, &v5);
}

double SyncSeqEmbedder::reset(SyncSeqEmbedder *this)
{
  double result = *(double *)((char *)this + 12);
  *(double *)((char *)this + 20) = result;
  *(void *)((char *)this + 52) = 0;
  *(void *)((char *)this + 44) = 0;
  return result;
}

uint64_t SyncSeqEmbedder::searchSyncPosition(uint64_t this, unsigned int a2)
{
  if (!*(_DWORD *)(this + 44))
  {
    unsigned int v2 = *(_DWORD *)(this + 20);
    BOOL v3 = v2 >= a2;
    unsigned int v4 = v2 - a2;
    if (v3) {
      *(_DWORD *)(this + 20) = v4;
    }
    else {
      *(_DWORD *)(this + 44) = 1;
    }
  }
  return this;
}

uint64_t SyncSeqDetector::initialize(SyncSeqDetector *this, int a2, unsigned int a3, double a4, double a5, float a6)
{
  return 1;
}

void SyncSeqDetector::initialize(SyncSeqDetector *this, int a2, unsigned int a3, float a4, unsigned int a5, int a6, float a7, float a8)
{
  *((_DWORD *)this + 3) = a2;
  *((_DWORD *)this + 4) = a5;
  unint64_t v15 = a5;
  std::vector<float>::resize((uint64_t)this + 216, a5);
  std::vector<float>::resize((uint64_t)this + 192, v15);
  vDSP_vclr(*((float **)this + 24), 1, (uint64_t)(*((void *)this + 25) - *((void *)this + 24)) >> 2);
  *((_DWORD *)this + 5) = 0;
  *((_DWORD *)this + 8) = a5 - a6;
  int v16 = a3 / (a3 >> 3);
  *((_DWORD *)this + 14) = a3 >> 3;
  *((_DWORD *)this + 15) = v16;
  std::vector<SyncSeqDetector::peakInfo>::resize((uint64_t)this + 64, (2 * v16));
  uint64_t v17 = (2 * *((_DWORD *)this + 15));
  if (v17)
  {
    uint64_t v18 = *((void *)this + 8) + 4;
    do
    {
      *(void *)(v18 - 4) = 0xFFFFFFFFLL;
      v18 += 8;
      --v17;
    }
    while (v17);
  }
  AdaptiveThreshold::initialize((float **)this + 11, 0x14u, a7);
  *((_DWORD *)this + 10) = 1092616192;
  *((void *)this + 19) = 0xFFFFFFFFLL;
  SyncSequence::initialize((float **)this + 20, a2, a4, a3, v19);
  Setup = vDSP_biquad_CreateSetup(&SyncSeqDetector::mBPFCoef[10 * (a2 == 48000)], 2uLL);
  std::unique_ptr<vDSP_biquad_SetupStruct,applesauce::raii::v1::detail::opaque_deletion_functor<vDSP_biquad_SetupStruct*,&(vDSP_biquad_DestroySetup)>>::reset[abi:ne180100]((vDSP_biquad_SetupStruct **)this + 33, Setup);
  std::vector<float>::resize((uint64_t)this + 240, 6uLL);
  DSPSplitComplex v21 = (float *)*((void *)this + 30);
  vDSP_Length v22 = (uint64_t)(*((void *)this + 31) - (void)v21) >> 2;

  vDSP_vclr(v21, 1, v22);
}

_DWORD *SyncSeqDetector::setConfig(_DWORD *result, uint64_t a2)
{
  unsigned int v2 = (float *)result;
  uint64_t v3 = 0;
  uint64_t v26 = *MEMORY[0x263EF8340];
  int v17 = 100;
  char v18 = 0;
  unsigned int v4 = result + 11;
  float v19 = result + 11;
  int v20 = 111;
  char v21 = 1;
  int v5 = (float *)(result + 13);
  vDSP_Length v22 = result + 13;
  int v23 = 109;
  char v24 = 1;
  uint64_t v6 = (float *)(result + 9);
  float v25 = result + 9;
  uint64_t v7 = (void *)(a2 + 8);
  do
  {
    uint64_t v8 = *v7;
    if (*v7)
    {
      unsigned int v9 = *(&v17 + 4 * v3);
      int v10 = v7;
      do
      {
        unsigned int v11 = *(_DWORD *)(v8 + 32);
        BOOL v12 = v11 >= v9;
        if (v11 >= v9) {
          unsigned int v13 = (uint64_t *)v8;
        }
        else {
          unsigned int v13 = (uint64_t *)(v8 + 8);
        }
        if (v12) {
          int v10 = (void *)v8;
        }
        uint64_t v8 = *v13;
      }
      while (*v13);
      if (v10 != v7 && v9 >= *((_DWORD *)v10 + 8))
      {
        unint64_t v14 = (uint64_t (**)(uint64_t, void, void, void, void *))(v10 + 5);
        if (*((unsigned char *)&v17 + 16 * v3 + 4))
        {
          double result = std::any_cast[abi:ne180100]<float const>(v14);
          if (!result) {
            goto LABEL_29;
          }
          *(&v19)[2 * v3] = *result;
        }
        else
        {
          double result = std::any_cast[abi:ne180100]<unsigned int const>(v14);
          if (!result) {
LABEL_29:
          }
            std::__throw_bad_any_cast[abi:ne180100]();
          *(&v19)[2 * v3] = *result;
        }
      }
    }
    ++v3;
  }
  while (v3 != 3);
  if (v2[12] == 0.0) {
    v2[12] = 0.06;
  }
  if (*v5 == 0.0) {
    float *v5 = 18000.0;
  }
  int v15 = *((_DWORD *)v2 + 11);
  if (*v6 == 0.0) {
    *uint64_t v6 = 0.06;
  }
  if (v15) {
    int v16 = 2 * v15;
  }
  else {
    int v16 = 4096;
  }
  int *v4 = v16;
  return result;
}

uint64_t SyncSeqDetector::getFrameStartOffset(SyncSeqDetector *this, const float *a2, int a3, int *a4, int a5)
{
  if (*((unsigned char *)this + 24) || SyncSeqDetector::detectSyncFrame(this, a2, a3, a5))
  {
    *a4 = *((_DWORD *)this + 11) + *((_DWORD *)this + 7);
    *((_DWORD *)this + 7) -= a3;
  }
  return *((unsigned __int8 *)this + 24);
}

uint64_t SyncSeqDetector::status(SyncSeqDetector *this)
{
  return *((unsigned __int8 *)this + 24);
}

uint64_t SyncSeqDetector::detectSyncFrame(SyncSeqDetector *this, const float *__X, int a3, int a4)
{
  if (a4) {
    float v4 = 2.97;
  }
  else {
    float v4 = 2.7;
  }
  if (a3 < 1) {
    return 0;
  }
  int v5 = a3;
  uint64_t v7 = ((*((void *)this + 25) - *((void *)this + 24)) >> 3) & 0x7FFFFFFFLL;
  uint64_t v8 = (SyncSeqDetector *)((char *)this + 88);
  unsigned int v9 = *((_DWORD *)this + 5);
  int v10 = __X;
  while (1)
  {
    uint64_t v11 = *((void *)this + 24);
    unsigned int v12 = ((unint64_t)(*((void *)this + 25) - v11) >> 2) - v9;
    if (v12 >= v5) {
      vDSP_Length v13 = v5;
    }
    else {
      vDSP_Length v13 = v12;
    }
    vDSP_biquad(*((const vDSP_biquad_SetupStruct **)this + 33), *((float **)this + 30), v10, 1, (float *)(v11 + 4 * v9), 1, v13);
    unint64_t v14 = (v13 + *((_DWORD *)this + 5));
    *((_DWORD *)this + 5) = v14;
    int v15 = (const float *)*((void *)this + 24);
    if (v14 < (uint64_t)(*((void *)this + 25) - (void)v15) >> 2)
    {
      if (v10 == __X)
      {
        unsigned __int8 v50 = (_DWORD *)*((void *)this + 8);
        unint64_t v51 = *((void *)this + 9) - (void)v50;
        if ((v51 & 0x7FFFFFFF8) != 0)
        {
          uint64_t v52 = (v51 >> 3);
          do
          {
            *v50 -= v13;
            v50 += 2;
            --v52;
          }
          while (v52);
        }
      }
      return 0;
    }
    LODWORD(v16) = *((_DWORD *)this + 15);
    if (v16)
    {
      uint64_t v17 = 0;
      unint64_t v18 = 0;
      uint64_t v19 = *((void *)this + 8);
      do
      {
        *(void *)(v19 + v17) = *(void *)(v19 + 8 * (v18 + v16));
        uint64_t v19 = *((void *)this + 8);
        *(_DWORD *)(v19 + v17) -= v13;
        unint64_t v16 = *((unsigned int *)this + 15);
        *(void *)(v19 + 8 * (v18++ + v16)) = 0xFFFFFFFFLL;
        v17 += 8;
      }
      while (v18 < v16);
      int v15 = (const float *)*((void *)this + 24);
    }
    uint64_t v20 = *((void *)this + 21);
    unint64_t v21 = *((void *)this + 22) - v20;
    uint64_t v22 = *((unsigned int *)this + 40);
    uint64_t v23 = v20 + 4 * v22;
    char v24 = v22 >= (v21 >> 2) ? 0 : (const float *)v23;
    vDSP_conv(v15, 1, v24, 1, *((float **)this + 27), 1, *((_DWORD *)this + 4) - (v21 >> 2), (v21 >> 2));
    uint64_t v25 = *((unsigned int *)this + 15);
    if (v25)
    {
      unsigned int v26 = 0;
      uint64_t v27 = 0;
      uint64_t v28 = *((void *)this + 8);
      uint64_t v29 = *((void *)this + 27);
      unsigned int v30 = *((_DWORD *)this + 14);
      unsigned int v31 = v30;
      do
      {
        unsigned int v32 = v30 * v27;
        unsigned int v33 = (float *)(v29 + 4 * v30 * v27);
        uint64_t v34 = v27 + 1;
        unsigned int v35 = v30 * (v27 + 1);
        unsigned int v36 = v33 + 1;
        BOOL v37 = v30 * v27 == v35 || v36 == (float *)(v29 + 4 * v35);
        BOOL v38 = (float *)(v29 + 4 * v32);
        if (!v37)
        {
          uint64_t v39 = 4 * v31 - 4 * v26 - 4;
          float v40 = *v33;
          BOOL v38 = (float *)(v29 + 4 * v32);
          char v41 = v33 + 1;
          do
          {
            float v42 = *v41++;
            float v43 = v42;
            if (fabsf(v40) < fabsf(v42))
            {
              float v40 = v43;
              BOOL v38 = v36;
            }
            unsigned int v36 = v41;
            v39 -= 4;
          }
          while (v39);
        }
        uint64_t v44 = v28 + 8 * v25 + 8 * v27;
        *(_DWORD *)uint64_t v44 = v32 + ((unint64_t)((char *)v38 - (char *)v33) >> 2);
        *(float *)(v44 + 4) = fabsf(*v38);
        v31 += v30;
        v26 += v30;
        uint64_t v27 = v34;
      }
      while (v34 != v25);
      if ((int)v25 >= 1) {
        break;
      }
    }
LABEL_42:
    v10 += v13;
    v5 -= v13;
    memmove(*((void **)this + 24), (const void *)(*((void *)this + 24) + 4 * (((*((void *)this + 25) - *((void *)this + 24)) >> 2) - v7)), 4 * v7);
    unsigned int v9 = *((_DWORD *)this + 5) - v7;
    *((_DWORD *)this + 5) = v9;
    if (v5 <= 0) {
      return 0;
    }
  }
  unint64_t v45 = (float *)(v28 + 8 * v25 - 12);
  uint64_t v46 = -2;
  while (1)
  {
    float v47 = *v45;
    if (*v45 > 0.0 && v47 > AdaptiveThreshold::updateThreshold(v8, *v45))
    {
      float v48 = *(v45 - 2);
      if (v48 < v47)
      {
        float v49 = v45[2];
        if (v49 < v47)
        {
          if (v48 >= *(v45 - 4)) {
            float v48 = *(v45 - 4);
          }
          if (v45[4] < v49) {
            float v49 = v45[4];
          }
          if (v48 < v49) {
            float v48 = v49;
          }
          if (v47 > (float)(v4 * v48)) {
            break;
          }
        }
      }
    }
    ++v46;
    v45 += 2;
    if (v46 >= *((int *)this + 15) - 2) {
      goto LABEL_42;
    }
  }
  *((_DWORD *)this + 7) = v13
                        + ((unint64_t)((char *)v10 - (char *)__X) >> 2)
                        + *((_DWORD *)v45 - 1)
                        - ((*((void *)this + 25) - *((void *)this + 24)) >> 2);
  uint64_t result = 1;
  *((unsigned char *)this + 24) = 1;
  return result;
}

void std::vector<SyncSeqDetector::peakInfo>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3;
  if (a2 <= v2)
  {
    if (a2 < v2) {
      *(void *)(a1 + 8) = *(void *)a1 + 8 * a2;
    }
  }
  else
  {
    std::vector<SyncSeqDetector::peakInfo>::__append((void **)a1, a2 - v2);
  }
}

void SyncSeqDetector::reset(float **this)
{
  vDSP_vclr(this[24], 1, this[25] - this[24]);
  *((_DWORD *)this + 5) = 0;
  *((unsigned char *)this + 24) = 0;
  *((_DWORD *)this + 7) = 0;
  vDSP_vclr(this[13], 1, this[14] - this[13]);
  *((_DWORD *)this + 22) = *((_DWORD *)this + 23);
  *((_DWORD *)this + 24) = 0;
  *((_DWORD *)this + 10) = 1092616192;
  this[19] = (float *)0xFFFFFFFFLL;
  unint64_t v2 = this[30];
  vDSP_Length v3 = this[31] - v2;

  vDSP_vclr(v2, 1, v3);
}

uint64_t SyncSeqDetector::minimumOffset(SyncSeqDetector *this)
{
  return (22 * (*((_DWORD *)this + 4) >> 3));
}

uint64_t PasscodePositioner::initialize(PasscodePositioner *this, unsigned int a2, unsigned int a3, int a4, char a5)
{
  *((_DWORD *)this + 3) = a4;
  *((_DWORD *)this + 4) = a4;
  *((unsigned char *)this + 20) = a5;
  *((_DWORD *)this + 6) = 0;
  return 1;
}

_DWORD *PasscodePositioner::reset(_DWORD *this)
{
  this[4] = this[3];
  this[6] = 0;
  return this;
}

uint64_t PasscodePositioner::getFrameStartOffset(uint64_t a1, uint64_t *a2, unsigned int a3, uint64_t a4)
{
  uint64_t v4 = *(unsigned int *)(a1 + 16);
  int v5 = *(_DWORD *)(a1 + 24);
  if (!v5)
  {
    int v6 = v4 - a3;
    if (v4 >= a3)
    {
      int v5 = 0;
    }
    else
    {
      int v6 = 0;
      int v5 = 1;
      *(_DWORD *)(a1 + 24) = 1;
    }
    *(_DWORD *)(a1 + 16) = v6;
  }
  if (*(unsigned char *)(a1 + 20))
  {
    uint64_t v7 = *a2;
    if (v5) {
      a3 = v4;
    }
    std::function<void ()(float *,unsigned int)>::operator()(a4, v7, a3);
  }
  return v4;
}

uint64_t SyncEchoDetector::initialize(SyncEchoDetector *this, unsigned int a2, unsigned int a3)
{
  v26[1] = *MEMORY[0x263EF8340];
  float v5 = (float)a2 / 48000.0;
  unsigned int v6 = vcvtps_u32_f32(v5 * (float)(a3 >> 6));
  unsigned int v7 = *((_DWORD *)this + 4) * a3 - vcvtps_u32_f32(v5 * (float)(a3 >> 2));
  *((_DWORD *)this + 5) = v7;
  uint64_t v8 = (_DWORD *)((char *)this + 20);
  *((_DWORD *)this + 6) = v6;
  unsigned int v9 = (_DWORD *)((char *)this + 24);
  v26[0] = 0x3C23D70A3BA3D70ALL;
  *((_DWORD *)this + 3) = a3;
  *((_DWORD *)this + 7) = (v7 - a3) / v6;
  EchoDetector::initialize((SyncEchoDetector *)((char *)this + 224), a3, a2, (const float *)v26);
  BitCounter::initialize((SyncEchoDetector *)((char *)this + 168), *v8 / *v9, 1);
  ShapingFilter::initialize((uint64_t)this + 320, 1, a2, 1u, 1, *((float *)this + 10));
  std::vector<float>::resize((uint64_t)this + 48, *v8);
  int v10 = (char *)*((void *)this + 12);
  unsigned int v11 = *((_DWORD *)this + 43);
  unint64_t v12 = 10 * v11;
  unint64_t v13 = *((void *)this + 13) - (void)v10;
  if (v12 <= v13)
  {
    if (v12 < v13) {
      *((void *)this + 13) = &v10[v12];
    }
  }
  else
  {
    std::vector<signed char>::__append((unint64_t *)this + 12, v12 - v13);
    int v10 = (char *)*((void *)this + 12);
    unsigned int v11 = *((_DWORD *)this + 43);
  }
  if (v11)
  {
    memset(v10, 255, v11);
    int v10 = (char *)*((void *)this + 12);
    int v14 = *((_DWORD *)this + 43);
  }
  else
  {
    int v14 = 0;
  }
  int v15 = &v10[9 * v14];
  int64_t v16 = *((void *)this + 13) - (void)v15;
  if (v16 >= 1)
  {
    memset(v15, 255, v16);
    int v14 = *((_DWORD *)this + 43);
  }
  uint64_t v17 = *((void *)this + 15);
  unint64_t v18 = (8 * v14);
  unint64_t v19 = *((void *)this + 16) - v17;
  if (v18 <= v19)
  {
    if (v18 < v19) {
      *((void *)this + 16) = v17 + v18;
    }
  }
  else
  {
    std::vector<signed char>::__append((unint64_t *)this + 15, v18 - v19);
  }
  uint64_t v20 = 0;
  do
  {
    int v21 = *((_DWORD *)this + 43);
    uint64_t v22 = v20 + 1;
    int64_t v23 = (v21 * (v20 + 1)) - (unint64_t)(v21 * v20);
    if (v23 >= 1)
    {
      if ((0x72uLL >> v20)) {
        int v24 = 1;
      }
      else {
        int v24 = -1;
      }
      memset((void *)(*((void *)this + 15) + (v21 * v20)), v24, v23);
    }
    uint64_t v20 = v22;
  }
  while (v22 != 8);
  std::vector<unsigned int>::resize((std::vector<int> *)this + 6, (2 * *((_DWORD *)this + 43)));
  *((void *)this + 4) = 0;
  *((_WORD *)this + 22) = 0;
  *((void *)this + 10) = *((void *)this + 9);
  return 1;
}

void SyncEchoDetector::reset(SyncEchoDetector *this)
{
  *((void *)this + 4) = 0;
  *((_WORD *)this + 22) = 0;
  *((void *)this + 10) = *((void *)this + 9);
  ShapingFilter::reset((SyncEchoDetector *)((char *)this + 320));
}

_DWORD *SyncEchoDetector::setConfig(_DWORD *result, uint64_t a2)
{
  uint64_t v2 = 0;
  uint64_t v19 = *MEMORY[0x263EF8340];
  int v13 = 101;
  char v14 = 0;
  vDSP_Length v3 = result + 4;
  int v15 = result + 4;
  int v16 = 111;
  char v17 = 1;
  uint64_t v4 = (float *)(result + 10);
  unint64_t v18 = result + 10;
  float v5 = (void *)(a2 + 8);
  do
  {
    uint64_t v6 = *v5;
    if (*v5)
    {
      unsigned int v7 = *(&v13 + 4 * v2);
      uint64_t v8 = v5;
      do
      {
        unsigned int v9 = *(_DWORD *)(v6 + 32);
        BOOL v10 = v9 >= v7;
        if (v9 >= v7) {
          unsigned int v11 = (uint64_t *)v6;
        }
        else {
          unsigned int v11 = (uint64_t *)(v6 + 8);
        }
        if (v10) {
          uint64_t v8 = (void *)v6;
        }
        uint64_t v6 = *v11;
      }
      while (*v11);
      if (v8 != v5 && v7 >= *((_DWORD *)v8 + 8))
      {
        unint64_t v12 = (uint64_t (**)(uint64_t, void, void, void, void *))(v8 + 5);
        if (*((unsigned char *)&v13 + 16 * v2 + 4))
        {
          uint64_t result = std::any_cast[abi:ne180100]<float const>(v12);
          if (!result) {
            goto LABEL_24;
          }
          *(&v15)[2 * v2] = *result;
        }
        else
        {
          uint64_t result = std::any_cast[abi:ne180100]<unsigned int const>(v12);
          if (!result) {
LABEL_24:
          }
            std::__throw_bad_any_cast[abi:ne180100]();
          *(&v15)[2 * v2] = *result;
        }
      }
    }
    ++v2;
  }
  while (v2 != 2);
  if (!*v3) {
    _DWORD *v3 = 2;
  }
  if (*v4 == 0.0) {
    float *v4 = 18000.0;
  }
  return result;
}

BOOL SyncEchoDetector::getFrameStartOffset(SyncEchoDetector *this, const float *a2, int a3, int *a4)
{
  if (*((unsigned char *)this + 45))
  {
    *a4 = *((_DWORD *)this + 9) + 8 * *((_DWORD *)this + 5);
    *((_DWORD *)this + 9) -= a3;
    return 1;
  }
  else
  {
    SyncEchoDetector::detectSyncEcho(this, a2, a3);
    *a4 = *((_DWORD *)this + 9) + 8 * *((_DWORD *)this + 5);
    *((_DWORD *)this + 9) -= a3;
    return *((unsigned char *)this + 45) != 0;
  }
}

uint64_t SyncEchoDetector::status(SyncEchoDetector *this)
{
  return *((unsigned __int8 *)this + 45);
}

uint64_t SyncEchoDetector::detectSyncEcho(SyncEchoDetector *this, const float *a2, int a3)
{
  SyncEchoDetector::detectSyncEcho(float const*,unsigned int)::count += a3;
  if (a3 < 1) {
    return 1;
  }
  float v5 = (SyncEchoDetector *)((char *)this + 224);
  uint64_t v6 = (char *)this + 168;
  BOOL v38 = (void **)((char *)this + 72);
  uint64_t v39 = (SyncEchoDetector *)((char *)this + 320);
  unsigned int v7 = *((_DWORD *)this + 8);
  for (int i = a3; i > 0; i -= v42)
  {
    unsigned int v9 = *((_DWORD *)this + 5) - v7;
    if (v9 >= i) {
      vDSP_Length v10 = i;
    }
    else {
      vDSP_Length v10 = v9;
    }
    ShapingFilter::filter(v39, a2, (float *)(*((void *)this + 6) + 4 * v7), v10);
    unsigned int v42 = v10;
    unsigned int v11 = *((_DWORD *)this + 8) + v10;
    *((_DWORD *)this + 8) = v11;
    if (v11 < *((_DWORD *)this + 5)) {
      return 1;
    }
    unsigned int v12 = *((_DWORD *)this + 7);
    if (!v12) {
      goto LABEL_51;
    }
    char v41 = a2;
    unsigned int v13 = 0;
    int v40 = v10 + a3;
    do
    {
      unsigned int v44 = 0;
      if (EchoDetector::decodeEcho(v5, (const float *)(*((void *)this + 6) + 4 * *((_DWORD *)this + 6) * v13), *((_DWORD *)this + 3), (BOOL *)&v44, 0))
      {
        if (!*((unsigned char *)this + 44))
        {
          *((_DWORD *)this + 46) = 0;
          *((_DWORD *)this + 42) = 0;
          *((void *)this + 22) = 0;
          char v14 = (unsigned char *)*((void *)this + 24);
          int v15 = (unsigned char *)*((void *)this + 25);
          if (v14 != v15)
          {
            *((_DWORD *)this + 54) = 0;
            if (v15 - v14 >= 1) {
              bzero(v14, v15 - v14);
            }
          }
          *((unsigned char *)this + 44) = 1;
        }
        BitCounter::count((uint64_t)v6, v44);
      }
      else
      {
        if (!*((unsigned char *)this + 44)) {
          goto LABEL_49;
        }
        BitCounter::count((uint64_t)v6);
      }
      if (*((unsigned char *)this + 44))
      {
        int v16 = (BOOL *)*((void *)this + 9);
        char v17 = (BOOL *)*((void *)this + 10);
        if (v16 == v17)
        {
          char v17 = (BOOL *)*((void *)this + 9);
          if (*((_DWORD *)this + 46) > *((_DWORD *)this + 7) >> 1)
          {
            char v17 = (BOOL *)*((void *)this + 9);
            if ((*((_DWORD *)this + 44) + *((_DWORD *)this + 45)) <= 9)
            {
              *((_DWORD *)this + 46) = 0;
              *((_DWORD *)this + 42) = 0;
              *((void *)this + 22) = 0;
              *((unsigned char *)this + 44) = 0;
              char v17 = v16;
              *((void *)this + 10) = v16;
            }
          }
        }
        if (*((_DWORD *)this + 42) >= *((_DWORD *)this + 43))
        {
          unsigned int v18 = *((_DWORD *)this + 44);
          unsigned int v19 = *((_DWORD *)this + 45);
          if (v18 == v19 || v19 + v18 <= 9)
          {
            *((unsigned char *)this + 44) = 0;
            *((void *)this + 10) = v16;
          }
          else
          {
            BOOL v20 = v18 < v19;
            *((_DWORD *)this + 46) = 0;
            *((_DWORD *)this + 42) = 0;
            *((void *)this + 22) = 0;
            unint64_t v21 = *((void *)this + 11);
            if ((unint64_t)v17 >= v21)
            {
              uint64_t v23 = v17 - v16;
              uint64_t v24 = v17 - v16 + 1;
              if (v24 < 0) {
                std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
              }
              unint64_t v25 = v21 - (void)v16;
              if (2 * v25 > v24) {
                uint64_t v24 = 2 * v25;
              }
              if (v25 >= 0x3FFFFFFFFFFFFFFFLL) {
                size_t v26 = 0x7FFFFFFFFFFFFFFFLL;
              }
              else {
                size_t v26 = v24;
              }
              if (v26) {
                uint64_t v27 = (char *)operator new(v26);
              }
              else {
                uint64_t v27 = 0;
              }
              uint64_t v28 = &v27[v23];
              uint64_t v29 = (BOOL *)&v27[v23];
              BOOL *v29 = v20;
              uint64_t v22 = v29 + 1;
              if (v17 != v16)
              {
                unsigned int v30 = &v17[~(unint64_t)v16];
                do
                {
                  BOOL v31 = *--v17;
                  (v30--)[(void)v27] = v31;
                }
                while (v17 != v16);
                int v16 = (BOOL *)*v38;
                uint64_t v28 = v27;
              }
              *((void *)this + 9) = v28;
              *((void *)this + 10) = v22;
              *((void *)this + 1EchoCodeDecoder::reset(this - 1) = &v27[v26];
              if (v16) {
                operator delete(v16);
              }
            }
            else
            {
              BOOL *v17 = v20;
              uint64_t v22 = v17 + 1;
            }
            *((void *)this + 10) = v22;
            unsigned int v32 = (void *)*((void *)this + 9);
            if (v22 - (unsigned char *)v32 == 8)
            {
              BOOL v33 = *v32 == 0x1010100000100;
              *((unsigned char *)this + 45) = v33;
              if (v33)
              {
                *((_DWORD *)this + 9) = v40
                                      + *((_DWORD *)this + 6) * SyncEchoDetector::estimateFrameStart(this)
                                      - (i
                                       + *((_DWORD *)this + 8)
                                       + 8 * *((_DWORD *)this + 5));
                uint64_t v34 = APCLogObject();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_237D0E000, v34, OS_LOG_TYPE_INFO, "A valid passcode frame start has been found!", buf, 2u);
                }
              }
              else
              {
                *((void *)this + 10) = v32;
              }
            }
          }
        }
      }
LABEL_49:
      ++v13;
      unsigned int v12 = *((_DWORD *)this + 7);
    }
    while (v13 < v12);
    unsigned int v11 = *((_DWORD *)this + 8);
    a2 = v41;
LABEL_51:
    unsigned int v35 = *((_DWORD *)this + 6) * v12;
    memmove(*((void **)this + 6), (const void *)(*((void *)this + 6) + 4 * v35), 4 * (v11 - v35));
    unsigned int v7 = *((_DWORD *)this + 8) - v35;
    *((_DWORD *)this + 8) = v7;
    a2 += v42;
  }
  return 1;
}

uint64_t SyncEchoDetector::estimateFrameStart(SyncEchoDetector *this)
{
  uint64_t v2 = *((unsigned int *)this + 43);
  size_t v3 = (8 * v2);
  if (v3)
  {
    memmove((void *)(*((void *)this + 12) + v2), *((const void **)this + 24), v3);
    LODWORD(v2) = *((_DWORD *)this + 43);
  }
  if ((v2 & 0x7FFFFFFF) != 0)
  {
    unint64_t v4 = 0;
    uint64_t v6 = *((void *)this + 15);
    uint64_t v5 = *((void *)this + 16);
    unsigned int v7 = (char *)*((void *)this + 18);
    do
    {
      if (v5 == v6)
      {
        int v9 = 0;
      }
      else
      {
        uint64_t v8 = 0;
        int v9 = 0;
        do
        {
          v9 += *(char *)(v6 + v8) * *(char *)(*((void *)this + 12) + (v4 + v8));
          ++v8;
        }
        while (v5 - v6 > (unint64_t)v8);
      }
      *(_DWORD *)&v7[4 * v4++] = v9;
      LODWORD(v2) = *((_DWORD *)this + 43);
    }
    while (v4 < (2 * v2));
  }
  else
  {
    unsigned int v7 = (char *)*((void *)this + 18);
  }
  vDSP_Length v10 = (char *)*((void *)this + 19);
  unsigned int v11 = v7 + 4;
  BOOL v12 = v7 == v10 || v11 == v10;
  unsigned int v13 = v7;
  if (!v12)
  {
    int v14 = *(_DWORD *)v7;
    unsigned int v13 = v7;
    int v15 = v7 + 4;
    do
    {
      int v17 = *(_DWORD *)v15;
      v15 += 4;
      int v16 = v17;
      BOOL v18 = v14 < v17;
      if (v14 <= v17) {
        int v14 = v16;
      }
      if (v18) {
        unsigned int v13 = v11;
      }
      unsigned int v11 = v15;
    }
    while (v15 != v10);
  }
  return ((unint64_t)(v13 - v7) >> 2) - v2 + 1;
}

uint64_t SyncEchoDetector::maxSearchLength(SyncEchoDetector *this)
{
  return (9 * *((_DWORD *)this + 5));
}

void PasscodePositioner::~PasscodePositioner(PasscodePositioner *this)
{
}

uint64_t PasscodePositioner::syncFrameSizeSamples(PasscodePositioner *this)
{
  return 0;
}

void EchoEmbedder::~EchoEmbedder(EchoEmbedder *this)
{
  EchoEmbedder::~EchoEmbedder(this);

  JUMPOUT(0x237E2DA50);
}

{
  void *v2;
  void *v3;
  void *v4;

  *(void *)this = &unk_26EAE4780;
  std::deque<unsigned char>::~deque[abi:ne180100]((void *)this + 16);
  uint64_t v2 = (void *)*((void *)this + 11);
  if (v2)
  {
    *((void *)this + 12) = v2;
    operator delete(v2);
  }
  size_t v3 = (void *)*((void *)this + 8);
  if (v3)
  {
    *((void *)this + 9) = v3;
    operator delete(v3);
  }
  unint64_t v4 = (void *)*((void *)this + 5);
  if (v4)
  {
    *((void *)this + 6) = v4;
    operator delete(v4);
  }
}

void SyncedEchoEmbedder::~SyncedEchoEmbedder(SyncedEchoEmbedder *this)
{
  EchoEmbedder::~EchoEmbedder(this);

  JUMPOUT(0x237E2DA50);
}

void SyncSeqEmbedder::~SyncSeqEmbedder(SyncSeqEmbedder *this)
{
  uint64_t v2 = (void *)*((void *)this + 16);
  if (v2)
  {
    *((void *)this + 17) = v2;
    operator delete(v2);
  }
  std::unique_ptr<vDSP_biquad_SetupStruct,applesauce::raii::v1::detail::opaque_deletion_functor<vDSP_biquad_SetupStruct*,&(vDSP_biquad_DestroySetup)>>::reset[abi:ne180100]((vDSP_biquad_SetupStruct **)this + 15, 0);
  unint64_t v4 = (void **)((char *)this + 96);
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v4);
  size_t v3 = (void *)*((void *)this + 8);
  if (v3)
  {
    *((void *)this + 9) = v3;
    operator delete(v3);
  }
}

{
  void *v2;
  void *v3;
  void **v4;

  uint64_t v2 = (void *)*((void *)this + 16);
  if (v2)
  {
    *((void *)this + 17) = v2;
    operator delete(v2);
  }
  std::unique_ptr<vDSP_biquad_SetupStruct,applesauce::raii::v1::detail::opaque_deletion_functor<vDSP_biquad_SetupStruct*,&(vDSP_biquad_DestroySetup)>>::reset[abi:ne180100]((vDSP_biquad_SetupStruct **)this + 15, 0);
  unint64_t v4 = (void **)((char *)this + 96);
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v4);
  size_t v3 = (void *)*((void *)this + 8);
  if (v3)
  {
    *((void *)this + 9) = v3;
    operator delete(v3);
  }
  MEMORY[0x237E2DA50](this, 0x10A1C40488B4B6ALL);
}

uint64_t SyncSeqEmbedder::syncFrameSizeSamples(SyncSeqEmbedder *this)
{
  return (2 * *((_DWORD *)this + 7));
}

void SyncSeqDetector::~SyncSeqDetector(vDSP_biquad_SetupStruct **this)
{
  SyncSeqDetector::~SyncSeqDetector(this);

  JUMPOUT(0x237E2DA50);
}

{
  vDSP_biquad_SetupStruct *v2;
  vDSP_biquad_SetupStruct *v3;
  vDSP_biquad_SetupStruct *v4;
  vDSP_biquad_SetupStruct *v5;
  vDSP_biquad_SetupStruct *v6;
  vDSP_biquad_SetupStruct *v7;
  vDSP_biquad_SetupStruct *v8;

  std::unique_ptr<vDSP_biquad_SetupStruct,applesauce::raii::v1::detail::opaque_deletion_functor<vDSP_biquad_SetupStruct*,&(vDSP_biquad_DestroySetup)>>::reset[abi:ne180100](this + 33, 0);
  uint64_t v2 = this[30];
  if (v2)
  {
    this[31] = v2;
    operator delete(v2);
  }
  size_t v3 = this[27];
  if (v3)
  {
    this[28] = v3;
    operator delete(v3);
  }
  unint64_t v4 = this[24];
  if (v4)
  {
    this[25] = v4;
    operator delete(v4);
  }
  uint64_t v5 = this[21];
  if (v5)
  {
    this[22] = v5;
    operator delete(v5);
  }
  uint64_t v6 = this[16];
  if (v6)
  {
    this[17] = v6;
    operator delete(v6);
  }
  unsigned int v7 = this[13];
  if (v7)
  {
    this[14] = v7;
    operator delete(v7);
  }
  uint64_t v8 = this[8];
  if (v8)
  {
    this[9] = v8;
    operator delete(v8);
  }
}

uint64_t SyncSeqDetector::maxSearchLength(SyncSeqDetector *this)
{
  return *((unsigned int *)this + 4);
}

uint64_t SyncSeqDetector::useSyncFrameFlag(SyncSeqDetector *this)
{
  return 1;
}

void SyncEchoDetector::~SyncEchoDetector(vDSP_biquad_SetupStruct **this)
{
  SyncEchoDetector::~SyncEchoDetector(this);

  JUMPOUT(0x237E2DA50);
}

{
  vDSP_biquad_SetupStruct *v2;
  vDSP_biquad_SetupStruct *v3;
  vDSP_biquad_SetupStruct *v4;
  vDSP_biquad_SetupStruct *v5;
  vDSP_biquad_SetupStruct *v6;
  vDSP_biquad_SetupStruct *v7;
  vDSP_biquad_SetupStruct *v8;
  vDSP_biquad_SetupStruct *v9;
  vDSP_biquad_SetupStruct *v10;
  void **v11;

  std::unique_ptr<vDSP_biquad_SetupStruct,applesauce::raii::v1::detail::opaque_deletion_functor<vDSP_biquad_SetupStruct*,&(vDSP_biquad_DestroySetup)>>::reset[abi:ne180100](this + 44, 0);
  unsigned int v11 = (void **)(this + 41);
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v11);
  uint64_t v2 = this[37];
  if (v2)
  {
    this[38] = v2;
    operator delete(v2);
  }
  size_t v3 = this[34];
  if (v3)
  {
    this[35] = v3;
    operator delete(v3);
  }
  unint64_t v4 = this[31];
  if (v4)
  {
    this[32] = v4;
    operator delete(v4);
  }
  std::unique_ptr<OpaqueFFTSetup,applesauce::raii::v1::detail::opaque_deletion_functor<OpaqueFFTSetup*,&(vDSP_destroy_fftsetup)>>::reset[abi:ne180100](this + 29, 0);
  uint64_t v5 = this[24];
  if (v5)
  {
    this[25] = v5;
    operator delete(v5);
  }
  uint64_t v6 = this[18];
  if (v6)
  {
    this[19] = v6;
    operator delete(v6);
  }
  unsigned int v7 = this[15];
  if (v7)
  {
    this[16] = v7;
    operator delete(v7);
  }
  uint64_t v8 = this[12];
  if (v8)
  {
    this[13] = v8;
    operator delete(v8);
  }
  int v9 = this[9];
  if (v9)
  {
    this[10] = v9;
    operator delete(v9);
  }
  vDSP_Length v10 = this[6];
  if (v10)
  {
    this[7] = v10;
    operator delete(v10);
  }
}

uint64_t SyncEchoDetector::minimumOffset(SyncEchoDetector *this)
{
  return 24000;
}

uint64_t SyncEchoDetector::useSyncFrameFlag(SyncEchoDetector *this)
{
  return 1;
}

void std::vector<std::vector<float>>::__append(uint64_t *a1, unint64_t a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  uint64_t v5 = v6;
  uint64_t v7 = *(void *)(v4 - 8);
  if (0xAAAAAAAAAAAAAAABLL * ((v6 - v7) >> 3) >= a2)
  {
    if (a2)
    {
      size_t v13 = 24 * ((24 * a2 - 24) / 0x18) + 24;
      bzero(*(void **)(v4 - 8), v13);
      v7 += v13;
    }
    a1[1] = v7;
  }
  else
  {
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((v7 - *a1) >> 3);
    unint64_t v9 = v8 + a2;
    if (v8 + a2 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((v5 - *a1) >> 3);
    if (2 * v10 > v9) {
      unint64_t v9 = 2 * v10;
    }
    if (v10 >= 0x555555555555555) {
      unint64_t v11 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v11 = v9;
    }
    uint64_t v19 = v4;
    if (v11) {
      BOOL v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<APCConfigReader::paramData>>(v4, v11);
    }
    else {
      BOOL v12 = 0;
    }
    int v15 = v12;
    int v16 = &v12[24 * v8];
    BOOL v18 = &v12[24 * v11];
    size_t v14 = 24 * ((24 * a2 - 24) / 0x18) + 24;
    bzero(v16, v14);
    int v17 = &v16[v14];
    std::vector<std::vector<float>>::__swap_out_circular_buffer(a1, &v15);
    std::__split_buffer<std::vector<float>>::~__split_buffer((uint64_t)&v15);
  }
}

void sub_237D22A04(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<std::vector<float>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::vector<float>>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<float>>,std::reverse_iterator<std::vector<float>*>,std::reverse_iterator<std::vector<float>*>,std::reverse_iterator<std::vector<float>*>>((uint64_t)(a1 + 2), a1[1], (void *)a1[1], *a1, (void *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<float>>,std::reverse_iterator<std::vector<float>*>,std::reverse_iterator<std::vector<float>*>,std::reverse_iterator<std::vector<float>*>>(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v14 = a6;
  *((void *)&v14 + EchoCodeDecoder::reset(this - 1) = a7;
  long long v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  if (a3 == a5)
  {
    uint64_t v9 = a6;
  }
  else
  {
    do
    {
      *(void *)(v7 - 24) = 0;
      *(void *)(v7 - 16) = 0;
      *(void *)(v7 - 8) = 0;
      long long v8 = *(_OWORD *)(a3 - 3);
      a3 -= 3;
      *(_OWORD *)(v7 - 24) = v8;
      *(void *)(v7 - 8) = a3[2];
      *a3 = 0;
      a3[1] = 0;
      a3[2] = 0;
      uint64_t v7 = *((void *)&v14 + 1) - 24;
      *((void *)&v14 + 1) -= 24;
    }
    while (a3 != a5);
    uint64_t v9 = v14;
  }
  char v12 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<float>>,std::reverse_iterator<std::vector<float>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v11);
  return v9;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<float>>,std::reverse_iterator<std::vector<float>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<float>>,std::reverse_iterator<std::vector<float>*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<float>>,std::reverse_iterator<std::vector<float>*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    size_t v3 = *(void **)v1;
    if (*(void *)v1)
    {
      *(void *)(v1 + 8) = v3;
      operator delete(v3);
    }
    v1 += 24;
  }
}

uint64_t std::__split_buffer<std::vector<float>>::~__split_buffer(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::__split_buffer<std::vector<float>>::__destruct_at_end[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  while (v2 != a2)
  {
    uint64_t v5 = *(void **)(v2 - 24);
    *(void *)(a1 + 16) = v2 - 24;
    if (v5)
    {
      *(void *)(v2 - 16) = v5;
      operator delete(v5);
      uint64_t v2 = *(void *)(a1 + 16);
    }
    else
    {
      v2 -= 24;
    }
  }
}

void std::vector<signed char>::__append(unint64_t *a1, size_t a2)
{
  uint64_t v5 = (char *)a1[1];
  uint64_t v4 = (char *)a1[2];
  if (v4 - v5 >= a2)
  {
    if (a2)
    {
      bzero((void *)a1[1], a2);
      v5 += a2;
    }
    a1[1] = (unint64_t)v5;
  }
  else
  {
    unint64_t v6 = *a1;
    uint64_t v7 = &v5[-*a1];
    unint64_t v8 = (unint64_t)&v7[a2];
    if ((uint64_t)&v7[a2] < 0) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v9 = (unint64_t)&v4[-v6];
    if (2 * v9 > v8) {
      unint64_t v8 = 2 * v9;
    }
    if (v9 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v10 = v8;
    }
    if (v10) {
      unint64_t v11 = (unint64_t)operator new(v10);
    }
    else {
      unint64_t v11 = 0;
    }
    char v12 = &v7[v11];
    long long v13 = (char *)(v11 + v10);
    bzero(v12, a2);
    if (v5 == (char *)v6)
    {
      unint64_t v11 = (unint64_t)v12;
    }
    else
    {
      long long v14 = &v5[~v6];
      do
      {
        char v15 = *--v5;
        (v14--)[v11] = v15;
      }
      while (v5 != (char *)v6);
      uint64_t v5 = (char *)*a1;
    }
    *a1 = v11;
    a1[1] = (unint64_t)&v12[a2];
    a1[2] = (unint64_t)v13;
    if (v5)
    {
      operator delete(v5);
    }
  }
}

void std::vector<unsigned int>::__append(std::vector<int> *this, std::vector<int>::size_type __n)
{
  value = this->__end_cap_.__value_;
  p_end_cap = &this->__end_cap_;
  uint64_t v5 = value;
  end = p_end_cap[-1].__value_;
  if (__n <= value - end)
  {
    if (__n)
    {
      bzero(p_end_cap[-1].__value_, 4 * __n);
      end += __n;
    }
    this->__end_ = end;
  }
  else
  {
    std::vector<int>::pointer begin = this->__begin_;
    uint64_t v9 = (char *)end - (char *)this->__begin_;
    unint64_t v10 = __n + (v9 >> 2);
    if (v10 >> 62) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = v9 >> 2;
    uint64_t v12 = (char *)v5 - (char *)begin;
    if (v12 >> 1 > v10) {
      unint64_t v10 = v12 >> 1;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v13 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v10;
    }
    if (v13)
    {
      long long v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)p_end_cap, v13);
      std::vector<int>::pointer begin = this->__begin_;
      end = this->__end_;
    }
    else
    {
      long long v14 = 0;
    }
    char v15 = &v14[4 * v11];
    int v16 = (int *)&v14[4 * v13];
    bzero(v15, 4 * __n);
    int v17 = (int *)&v15[4 * __n];
    while (end != begin)
    {
      int v18 = *--end;
      *((_DWORD *)v15 - EchoCodeDecoder::reset(this - 1) = v18;
      v15 -= 4;
    }
    this->__begin_ = (std::vector<int>::pointer)v15;
    this->__end_ = v17;
    this->__end_cap_.__value_ = v16;
    if (begin)
    {
      operator delete(begin);
    }
  }
}

void *std::vector<float>::vector(void *a1, unint64_t a2, _DWORD *a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<float>::__vallocate[abi:ne180100](a1, a2);
    unint64_t v6 = (_DWORD *)a1[1];
    uint64_t v7 = &v6[a2];
    uint64_t v8 = 4 * a2;
    do
    {
      *v6++ = *a3;
      v8 -= 4;
    }
    while (v8);
    a1[1] = v7;
  }
  return a1;
}

void sub_237D22F08(_Unwind_Exception *exception_object)
{
  size_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<SyncSeqDetector::peakInfo>::__append(void **a1, unint64_t a2)
{
  unint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  uint64_t v5 = v6;
  uint64_t v7 = *(_DWORD **)(v4 - 8);
  if (a2 <= (v6 - (unsigned char *)v7) >> 3)
  {
    if (a2)
    {
      long long v14 = &v7[2 * a2];
      do
      {
        *(void *)uint64_t v7 = 0xFFFFFFFFLL;
        v7[1] = 0;
        v7 += 2;
      }
      while (v7 != v14);
      uint64_t v7 = v14;
    }
    a1[1] = v7;
  }
  else
  {
    uint64_t v8 = (char *)v7 - (unsigned char *)*a1;
    unint64_t v9 = a2 + (v8 >> 3);
    if (v9 >> 61) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v8 >> 3;
    uint64_t v11 = v5 - (unsigned char *)*a1;
    if (v11 >> 2 > v9) {
      unint64_t v9 = v11 >> 2;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v9;
    }
    if (v12) {
      unint64_t v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SyncSeqDetector::peakInfo>>(v4, v12);
    }
    else {
      unint64_t v13 = 0;
    }
    char v15 = &v13[8 * v10];
    int v16 = &v15[8 * a2];
    int v17 = v15;
    do
    {
      *(void *)int v17 = 0xFFFFFFFFLL;
      *((_DWORD *)v17 + EchoCodeDecoder::reset(this - 1) = 0;
      v17 += 8;
    }
    while (v17 != v16);
    int v18 = &v13[8 * v12];
    BOOL v20 = (char *)*a1;
    uint64_t v19 = (char *)a1[1];
    if (v19 != *a1)
    {
      do
      {
        uint64_t v21 = *((void *)v19 - 1);
        v19 -= 8;
        *((void *)v15 - EchoCodeDecoder::reset(this - 1) = v21;
        v15 -= 8;
      }
      while (v19 != v20);
      uint64_t v19 = (char *)*a1;
    }
    *a1 = v15;
    a1[1] = v16;
    a1[2] = v18;
    if (v19)
    {
      operator delete(v19);
    }
  }
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<SyncSeqDetector::peakInfo>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

uint64_t std::deque<unsigned char>::~deque[abi:ne180100](void *a1)
{
  uint64_t v2 = (void **)a1[1];
  size_t v3 = (void **)a1[2];
  a1[5] = 0;
  unint64_t v4 = (char *)v3 - (char *)v2;
  if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
  {
    do
    {
      operator delete(*v2);
      size_t v3 = (void **)a1[2];
      uint64_t v2 = (void **)(a1[1] + 8);
      a1[1] = v2;
      unint64_t v4 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
  unint64_t v5 = v4 >> 3;
  if (v5 == 1)
  {
    uint64_t v6 = 2048;
  }
  else
  {
    if (v5 != 2) {
      goto LABEL_9;
    }
    uint64_t v6 = 4096;
  }
  a1[4] = v6;
LABEL_9:
  while (v2 != v3)
  {
    uint64_t v7 = *v2++;
    operator delete(v7);
  }

  return std::__split_buffer<unsigned char *>::~__split_buffer((uint64_t)a1);
}

uint64_t std::__split_buffer<unsigned char *>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != v3) {
    *(void *)(a1 + 16) = v2 + ((v3 - v2 + 7) & 0xFFFFFFFFFFFFFFF8);
  }
  unint64_t v4 = *(void **)a1;
  if (*(void *)a1) {
    operator delete(v4);
  }
  return a1;
}

float std::normal_distribution<float>::operator()<std::linear_congruential_engine<unsigned int,48271u,0u,2147483647u>>(uint64_t a1, unsigned int *a2, float *a3)
{
  if (*(unsigned char *)(a1 + 12))
  {
    *(unsigned char *)(a1 + 12) = 0;
    float v5 = *(float *)(a1 + 8);
  }
  else
  {
    unsigned int v6 = *a2;
    do
    {
      unsigned int v7 = v6 / 0xADC8;
      unsigned int v8 = 48271 * (v6 % 0xADC8);
      v7 *= 3399;
      BOOL v9 = v8 >= v7;
      unsigned int v10 = v8 - v7;
      if (v9) {
        int v11 = 0;
      }
      else {
        int v11 = 0x7FFFFFFF;
      }
      unsigned int v12 = v11 + v10;
      float v13 = (float)(v12 - 1) * 4.6566e-10;
      unsigned int v14 = v12 / 0xADC8;
      unsigned int v15 = 48271 * (v12 % 0xADC8);
      v14 *= 3399;
      BOOL v9 = v15 >= v14;
      unsigned int v16 = v15 - v14;
      if (v9) {
        int v17 = 0;
      }
      else {
        int v17 = 0x7FFFFFFF;
      }
      unsigned int v6 = v17 + v16;
      float v18 = (float)(v13 * 2.0) + -1.0;
      float v19 = (float)((float)((float)(v6 - 1) * 4.6566e-10) * 2.0) + -1.0;
      float v20 = (float)(v19 * v19) + (float)(v18 * v18);
    }
    while (v20 > 1.0 || v20 == 0.0);
    *a2 = v6;
    float v21 = sqrtf((float)(logf((float)(v19 * v19) + (float)(v18 * v18)) * -2.0) / v20);
    *(float *)(a1 + 8) = v19 * v21;
    *(unsigned char *)(a1 + 12) = 1;
    float v5 = v18 * v21;
  }
  return *a3 + (float)(v5 * a3[1]);
}

void std::deque<unsigned char>::__add_front_capacity(void **a1)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = a1[2];
  unint64_t v4 = v3 - v2;
  if (v3 == v2) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = ((v3 - v2) << 9) - 1;
  }
  unsigned int v6 = (char *)a1[4];
  if (v5 - (unint64_t)&v6[(void)a1[5]] < 0x1000)
  {
    uint64_t v7 = (uint64_t)(a1 + 3);
    unsigned int v8 = a1[3];
    BOOL v9 = *a1;
    uint64_t v10 = v8 - (unsigned char *)*a1;
    if (v4 >= v10)
    {
      if (v8 == v9) {
        unint64_t v11 = 1;
      }
      else {
        unint64_t v11 = v10 >> 2;
      }
      uint64_t v46 = a1 + 3;
      __p = std::__allocate_at_least[abi:ne180100]<std::allocator<SyncSeqDetector::peakInfo>>(v7, v11);
      float v43 = (char *)__p;
      unsigned int v44 = (char *)__p;
      unint64_t v45 = (char *)__p + 8 * v12;
      char v41 = operator new(0x1000uLL);
      std::__split_buffer<unsigned char *>::push_back(&__p, &v41);
      float v13 = (char *)a1[1];
      unsigned int v14 = v44;
      if (v13 == a1[2])
      {
        BOOL v33 = (char *)a1[1];
      }
      else
      {
        do
        {
          if (v14 == v45)
          {
            int64_t v15 = v43 - (unsigned char *)__p;
            if (v43 <= __p)
            {
              if (v14 == __p) {
                unint64_t v23 = 1;
              }
              else {
                unint64_t v23 = (v14 - (unsigned char *)__p) >> 2;
              }
              uint64_t v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SyncSeqDetector::peakInfo>>((uint64_t)v46, v23);
              size_t v26 = v43;
              unsigned int v14 = &v24[8 * (v23 >> 2)];
              uint64_t v27 = v44 - v43;
              if (v44 != v43)
              {
                unsigned int v14 = &v24[8 * (v23 >> 2) + (v27 & 0xFFFFFFFFFFFFFFF8)];
                uint64_t v28 = 8 * (v27 >> 3);
                uint64_t v29 = &v24[8 * (v23 >> 2)];
                do
                {
                  uint64_t v30 = *(void *)v26;
                  v26 += 8;
                  *(void *)uint64_t v29 = v30;
                  v29 += 8;
                  v28 -= 8;
                }
                while (v28);
              }
              BOOL v31 = __p;
              __p = v24;
              float v43 = &v24[8 * (v23 >> 2)];
              unsigned int v44 = v14;
              unint64_t v45 = &v24[8 * v25];
              if (v31)
              {
                operator delete(v31);
                unsigned int v14 = v44;
              }
            }
            else
            {
              uint64_t v16 = v15 >> 3;
              BOOL v17 = v15 >> 3 < -1;
              uint64_t v18 = (v15 >> 3) + 2;
              if (v17) {
                uint64_t v19 = v18;
              }
              else {
                uint64_t v19 = v16 + 1;
              }
              float v20 = &v43[-8 * (v19 >> 1)];
              int64_t v21 = v14 - v43;
              if (v14 != v43)
              {
                memmove(&v43[-8 * (v19 >> 1)], v43, v14 - v43);
                unsigned int v14 = v43;
              }
              uint64_t v22 = &v14[-8 * (v19 >> 1)];
              unsigned int v14 = &v20[v21];
              float v43 = v22;
              unsigned int v44 = &v20[v21];
            }
          }
          uint64_t v32 = *(void *)v13;
          v13 += 8;
          *(void *)unsigned int v14 = v32;
          unsigned int v14 = v44 + 8;
          v44 += 8;
        }
        while (v13 != a1[2]);
        BOOL v33 = (char *)a1[1];
      }
      unsigned int v36 = *a1;
      BOOL v37 = v43;
      *a1 = __p;
      a1[1] = v37;
      __p = v36;
      float v43 = v33;
      BOOL v38 = (char *)a1[3];
      uint64_t v39 = v45;
      a1[2] = v14;
      a1[3] = v39;
      unsigned int v44 = v13;
      unint64_t v45 = v38;
      if (v14 - v37 == 8) {
        uint64_t v40 = 2048;
      }
      else {
        uint64_t v40 = (uint64_t)a1[4] + 4096;
      }
      a1[4] = (void *)v40;
      if (v13 != v33) {
        unsigned int v44 = &v13[(v33 - v13 + 7) & 0xFFFFFFFFFFFFFFF8];
      }
      if (v36) {
        operator delete(v36);
      }
    }
    else
    {
      if (v2 == v9)
      {
        __p = operator new(0x1000uLL);
        std::__split_buffer<unsigned char *>::push_back(a1, &__p);
        uint64_t v34 = a1[2];
        __p = (void *)*(v34 - 1);
        a1[2] = v34 - 1;
      }
      else
      {
        __p = operator new(0x1000uLL);
      }
      std::__split_buffer<unsigned char *>::push_front((uint64_t)a1, &__p);
      if ((unsigned char *)a1[2] - (unsigned char *)a1[1] == 8) {
        uint64_t v35 = 2048;
      }
      else {
        uint64_t v35 = (uint64_t)a1[4] + 4096;
      }
      a1[4] = (void *)v35;
    }
  }
  else
  {
    a1[4] = v6 + 4096;
    __p = (void *)*((void *)v3 - 1);
    a1[2] = v3 - 8;
    std::__split_buffer<unsigned char *>::push_front((uint64_t)a1, &__p);
  }
}

void sub_237D237B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  operator delete(v12);
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void std::__split_buffer<unsigned char *>::push_front(uint64_t a1, void *a2)
{
  unint64_t v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    uint64_t v6 = a1 + 24;
    uint64_t v7 = *(unsigned char **)(a1 + 24);
    unsigned int v8 = *(unsigned char **)(a1 + 16);
    if (v8 >= v7)
    {
      if (v7 == v4) {
        unint64_t v12 = 1;
      }
      else {
        unint64_t v12 = (v7 - v4) >> 2;
      }
      uint64_t v13 = 2 * v12;
      unsigned int v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SyncSeqDetector::peakInfo>>(v6, v12);
      uint64_t v5 = &v14[(v13 + 6) & 0xFFFFFFFFFFFFFFF8];
      uint64_t v16 = *(uint64_t **)(a1 + 8);
      BOOL v17 = v5;
      uint64_t v18 = *(void *)(a1 + 16) - (void)v16;
      if (v18)
      {
        BOOL v17 = &v5[v18 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v19 = 8 * (v18 >> 3);
        float v20 = v5;
        do
        {
          uint64_t v21 = *v16++;
          *(void *)float v20 = v21;
          v20 += 8;
          v19 -= 8;
        }
        while (v19);
      }
      uint64_t v22 = *(char **)a1;
      *(void *)a1 = v14;
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v17;
      *(void *)(a1 + 24) = &v14[8 * v15];
      if (v22)
      {
        operator delete(v22);
        uint64_t v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      uint64_t v9 = (v7 - v8) >> 3;
      if (v9 >= -1) {
        uint64_t v10 = v9 + 1;
      }
      else {
        uint64_t v10 = v9 + 2;
      }
      uint64_t v11 = v10 >> 1;
      uint64_t v5 = &v4[8 * (v10 >> 1)];
      if (v8 != v4)
      {
        memmove(&v4[8 * (v10 >> 1)], v4, v8 - v4);
        unint64_t v4 = *(char **)(a1 + 16);
      }
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = &v4[8 * v11];
    }
  }
  else
  {
    uint64_t v5 = *(char **)(a1 + 8);
  }
  *((void *)v5 - EchoCodeDecoder::reset(this - 1) = *a2;
  *(void *)(a1 + 8) -= 8;
}

{
  char *v4;
  char *v5;
  unsigned char *v6;
  unsigned char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;

  unint64_t v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    uint64_t v6 = *(unsigned char **)(a1 + 16);
    uint64_t v7 = *(unsigned char **)(a1 + 24);
    if (v6 >= v7)
    {
      if (v7 == v4) {
        uint64_t v11 = 1;
      }
      else {
        uint64_t v11 = (v7 - v4) >> 2;
      }
      unint64_t v12 = 2 * v11;
      uint64_t v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SyncSeqDetector::peakInfo>>(*(void *)(a1 + 32), v11);
      uint64_t v5 = &v13[(v12 + 6) & 0xFFFFFFFFFFFFFFF8];
      uint64_t v15 = *(uint64_t **)(a1 + 8);
      uint64_t v16 = v5;
      BOOL v17 = *(void *)(a1 + 16) - (void)v15;
      if (v17)
      {
        uint64_t v16 = &v5[v17 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v18 = 8 * (v17 >> 3);
        uint64_t v19 = v5;
        do
        {
          float v20 = *v15++;
          *(void *)uint64_t v19 = v20;
          v19 += 8;
          v18 -= 8;
        }
        while (v18);
      }
      uint64_t v21 = *(char **)a1;
      *(void *)a1 = v13;
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v16;
      *(void *)(a1 + 24) = &v13[8 * v14];
      if (v21)
      {
        operator delete(v21);
        uint64_t v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      unsigned int v8 = (v7 - v6) >> 3;
      if (v8 >= -1) {
        uint64_t v9 = v8 + 1;
      }
      else {
        uint64_t v9 = v8 + 2;
      }
      uint64_t v10 = v9 >> 1;
      uint64_t v5 = &v4[8 * (v9 >> 1)];
      if (v6 != v4)
      {
        memmove(&v4[8 * (v9 >> 1)], v4, v6 - v4);
        unint64_t v4 = *(char **)(a1 + 16);
      }
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = &v4[8 * v10];
    }
  }
  else
  {
    uint64_t v5 = *(char **)(a1 + 8);
  }
  *((void *)v5 - EchoCodeDecoder::reset(this - 1) = *a2;
  *(void *)(a1 + 8) -= 8;
}

void std::__split_buffer<unsigned char *>::push_back(void *a1, void *a2)
{
  uint64_t v5 = (char *)a1[3];
  uint64_t v4 = (uint64_t)(a1 + 3);
  uint64_t v6 = *(char **)(v4 - 8);
  if (v6 == v5)
  {
    uint64_t v7 = (char *)a1[1];
    uint64_t v8 = (uint64_t)&v7[-*a1];
    if ((unint64_t)v7 <= *a1)
    {
      if (v6 == (char *)*a1) {
        unint64_t v18 = 1;
      }
      else {
        unint64_t v18 = (uint64_t)&v6[-*a1] >> 2;
      }
      uint64_t v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SyncSeqDetector::peakInfo>>(v4, v18);
      uint64_t v21 = &v19[8 * (v18 >> 2)];
      uint64_t v22 = (uint64_t *)a1[1];
      uint64_t v6 = v21;
      uint64_t v23 = a1[2] - (void)v22;
      if (v23)
      {
        uint64_t v6 = &v21[v23 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v24 = 8 * (v23 >> 3);
        uint64_t v25 = &v19[8 * (v18 >> 2)];
        do
        {
          uint64_t v26 = *v22++;
          *(void *)uint64_t v25 = v26;
          v25 += 8;
          v24 -= 8;
        }
        while (v24);
      }
      uint64_t v27 = (char *)*a1;
      *a1 = v19;
      a1[1] = v21;
      a1[2] = v6;
      a1[3] = &v19[8 * v20];
      if (v27)
      {
        operator delete(v27);
        uint64_t v6 = (char *)a1[2];
      }
    }
    else
    {
      uint64_t v9 = v8 >> 3;
      BOOL v10 = v8 >> 3 < -1;
      uint64_t v11 = (v8 >> 3) + 2;
      if (v10) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = v9 + 1;
      }
      uint64_t v13 = -(v12 >> 1);
      uint64_t v14 = v12 >> 1;
      uint64_t v15 = &v7[-8 * v14];
      int64_t v16 = v6 - v7;
      if (v6 != v7)
      {
        memmove(&v7[-8 * v14], v7, v6 - v7);
        uint64_t v6 = (char *)a1[1];
      }
      BOOL v17 = &v6[8 * v13];
      uint64_t v6 = &v15[v16];
      a1[1] = v17;
      a1[2] = &v15[v16];
    }
  }
  *(void *)uint64_t v6 = *a2;
  a1[2] += 8;
}

{
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  int64_t v14;
  char *v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;

  uint64_t v4 = (char *)a1[2];
  if (v4 == (char *)a1[3])
  {
    uint64_t v5 = (char *)a1[1];
    uint64_t v6 = (uint64_t)&v5[-*a1];
    if ((unint64_t)v5 <= *a1)
    {
      if (v4 == (char *)*a1) {
        int64_t v16 = 1;
      }
      else {
        int64_t v16 = (uint64_t)&v4[-*a1] >> 2;
      }
      BOOL v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SyncSeqDetector::peakInfo>>(a1[4], v16);
      uint64_t v19 = &v17[8 * (v16 >> 2)];
      uint64_t v20 = (uint64_t *)a1[1];
      uint64_t v4 = v19;
      uint64_t v21 = a1[2] - (void)v20;
      if (v21)
      {
        uint64_t v4 = &v19[v21 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v22 = 8 * (v21 >> 3);
        uint64_t v23 = &v17[8 * (v16 >> 2)];
        do
        {
          uint64_t v24 = *v20++;
          *(void *)uint64_t v23 = v24;
          v23 += 8;
          v22 -= 8;
        }
        while (v22);
      }
      uint64_t v25 = (char *)*a1;
      *a1 = v17;
      a1[1] = v19;
      a1[2] = v4;
      a1[3] = &v17[8 * v18];
      if (v25)
      {
        operator delete(v25);
        uint64_t v4 = (char *)a1[2];
      }
    }
    else
    {
      uint64_t v7 = v6 >> 3;
      uint64_t v8 = v6 >> 3 < -1;
      uint64_t v9 = (v6 >> 3) + 2;
      if (v8) {
        BOOL v10 = v9;
      }
      else {
        BOOL v10 = v7 + 1;
      }
      uint64_t v11 = -(v10 >> 1);
      uint64_t v12 = v10 >> 1;
      uint64_t v13 = &v5[-8 * v12];
      uint64_t v14 = v4 - v5;
      if (v4 != v5)
      {
        memmove(&v5[-8 * v12], v5, v4 - v5);
        uint64_t v4 = (char *)a1[1];
      }
      uint64_t v15 = &v4[8 * v11];
      uint64_t v4 = &v13[v14];
      a1[1] = v15;
      a1[2] = &v13[v14];
    }
  }
  *(void *)uint64_t v4 = *a2;
  a1[2] += 8;
}

void **std::deque<unsigned char>::__move_and_check(int a1, char *a2, char *__src, char *a4, char *a5, void **a6, char *__dst, unint64_t *a8)
{
  if (a5 != __src)
  {
    BOOL v10 = __src;
    uint64_t v11 = a2;
    uint64_t v12 = &a5[512 * (a4 - a2)] - __src - *(void *)a4 + *(void *)a2;
    if (v12 >= 1)
    {
      while (1)
      {
        uint64_t v14 = *(void *)v11 + 4096;
        if (v14 - (uint64_t)v10 >= v12) {
          uint64_t v15 = v12;
        }
        else {
          uint64_t v15 = v14 - (void)v10;
        }
        if (v14 - (uint64_t)v10 <= v12) {
          unint64_t v16 = *(void *)v11 + 4096;
        }
        else {
          unint64_t v16 = (unint64_t)&v10[v12];
        }
        unint64_t v17 = *a8;
        if ((unint64_t)v10 <= *a8 && v17 < v16)
        {
          if (v10 != __dst && __dst - v10 + (((char *)a6 - v11) << 9) + *(void *)v11 != (void)*a6)
          {
            uint64_t v19 = __dst - v10 + (((char *)a6 - v11) << 9) - (void)*a6 + v17;
            if (v19 < 1) {
              unint64_t v17 = *(void *)&v11[-8 * ((unint64_t)(4095 - v19) >> 12)] + (~(4095 - (_WORD)v19) & 0xFFF);
            }
            else {
              unint64_t v17 = *(void *)&v11[((unint64_t)v19 >> 9) & 0x7FFFFFFFFFFFF8] + (v19 & 0xFFF);
            }
          }
          *a8 = v17;
        }
        if (v10 == (char *)v16) {
          goto LABEL_30;
        }
        uint64_t v21 = (char *)*a6++;
        uint64_t v20 = v21;
        uint64_t v22 = v10;
        while (1)
        {
          uint64_t v23 = v20 - __dst + 4096;
          size_t v24 = (uint64_t)(v16 - (void)v22) >= v23 ? v23 : v16 - (void)v22;
          if (v24) {
            memmove(__dst, v22, v24);
          }
          v22 += v24;
          if (v22 == (char *)v16) {
            break;
          }
          uint64_t v25 = (char *)*a6++;
          uint64_t v20 = v25;
          __dst = v25;
        }
        __dst += v24;
        if ((char *)*(a6 - 1) + 4096 != __dst) {
          break;
        }
        __dst = (char *)*a6;
        if (v15)
        {
LABEL_31:
          uint64_t v26 = (uint64_t)&v10[v15 - *(void *)v11];
          if (v26 < 1)
          {
            unint64_t v27 = 4095 - v26;
            v11 -= 8 * (v27 >> 12);
            BOOL v10 = (char *)(*(void *)v11 + (~(_WORD)v27 & 0xFFF));
          }
          else
          {
            v11 += 8 * ((unint64_t)v26 >> 12);
            BOOL v10 = (char *)(*(void *)v11 + (v26 & 0xFFF));
          }
        }
LABEL_36:
        BOOL v28 = v12 <= v15;
        v12 -= v15;
        if (v28) {
          return a6;
        }
      }
      --a6;
LABEL_30:
      if (v15) {
        goto LABEL_31;
      }
      goto LABEL_36;
    }
  }
  return a6;
}

void *std::__deque_iterator<unsigned char,unsigned char *,unsigned char &,unsigned char **,long,4096l>::operator+[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void **)a1;
  if (a2)
  {
    uint64_t v4 = *(void *)(a1 + 8) - *result + a2;
    if (v4 < 1) {
      result -= (unint64_t)(4095 - v4) >> 12;
    }
    else {
      result += (unint64_t)v4 >> 12;
    }
  }
  return result;
}

void std::deque<unsigned char>::__add_back_capacity(void *a1)
{
  unint64_t v2 = a1[4];
  BOOL v3 = v2 >= 0x1000;
  unint64_t v4 = v2 - 4096;
  if (v3)
  {
    uint64_t v5 = (uint64_t)(a1 + 3);
    uint64_t v6 = (char *)a1[3];
    a1[4] = v4;
    uint64_t v7 = (void *)a1[1];
    uint64_t v8 = (char *)a1[2];
    uint64_t v11 = *v7;
    uint64_t v9 = (char *)(v7 + 1);
    uint64_t v10 = v11;
    a1[1] = v9;
    if (v8 != v6)
    {
LABEL_33:
      *(void *)uint64_t v8 = v10;
      a1[2] += 8;
      return;
    }
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1) {
        unint64_t v33 = 1;
      }
      else {
        unint64_t v33 = (uint64_t)&v8[-*a1] >> 2;
      }
      uint64_t v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SyncSeqDetector::peakInfo>>(v5, v33);
      uint64_t v35 = &v34[8 * (v33 >> 2)];
      BOOL v37 = &v34[8 * v36];
      BOOL v38 = (uint64_t *)a1[1];
      uint64_t v8 = v35;
      uint64_t v39 = a1[2] - (void)v38;
      if (v39)
      {
        uint64_t v8 = &v35[v39 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v40 = 8 * (v39 >> 3);
        char v41 = &v34[8 * (v33 >> 2)];
        do
        {
          uint64_t v42 = *v38++;
          *(void *)char v41 = v42;
          v41 += 8;
          v40 -= 8;
        }
        while (v40);
      }
      goto LABEL_30;
    }
LABEL_5:
    uint64_t v13 = v12 >> 3;
    BOOL v14 = v12 >> 3 < -1;
    uint64_t v15 = (v12 >> 3) + 2;
    if (v14) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = v13 + 1;
    }
    uint64_t v17 = -(v16 >> 1);
    uint64_t v18 = v16 >> 1;
    uint64_t v19 = &v9[-8 * v18];
    int64_t v20 = v8 - v9;
    if (v8 != v9)
    {
      memmove(&v9[-8 * v18], v9, v8 - v9);
      uint64_t v9 = (char *)a1[1];
    }
    uint64_t v8 = &v19[v20];
    a1[1] = &v9[8 * v17];
    a1[2] = &v19[v20];
    goto LABEL_33;
  }
  uint64_t v21 = a1[2];
  unint64_t v22 = (v21 - a1[1]) >> 3;
  uint64_t v23 = a1[3];
  uint64_t v24 = v23 - *a1;
  if (v22 < v24 >> 3)
  {
    if (v23 != v21)
    {
      *(void *)&long long v54 = operator new(0x1000uLL);
      std::__split_buffer<unsigned char *>::push_back(a1, &v54);
      return;
    }
    *(void *)&long long v54 = operator new(0x1000uLL);
    std::__split_buffer<unsigned char *>::push_front((uint64_t)a1, &v54);
    unsigned int v44 = (void *)a1[1];
    uint64_t v8 = (char *)a1[2];
    uint64_t v45 = *v44;
    uint64_t v9 = (char *)(v44 + 1);
    uint64_t v10 = v45;
    a1[1] = v9;
    if (v8 != (char *)a1[3]) {
      goto LABEL_33;
    }
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1) {
        unint64_t v46 = 1;
      }
      else {
        unint64_t v46 = (uint64_t)&v8[-*a1] >> 2;
      }
      uint64_t v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SyncSeqDetector::peakInfo>>((uint64_t)(a1 + 3), v46);
      uint64_t v35 = &v34[8 * (v46 >> 2)];
      BOOL v37 = &v34[8 * v47];
      float v48 = (uint64_t *)a1[1];
      uint64_t v8 = v35;
      uint64_t v49 = a1[2] - (void)v48;
      if (v49)
      {
        uint64_t v8 = &v35[v49 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v50 = 8 * (v49 >> 3);
        unint64_t v51 = &v34[8 * (v46 >> 2)];
        do
        {
          uint64_t v52 = *v48++;
          *(void *)unint64_t v51 = v52;
          v51 += 8;
          v50 -= 8;
        }
        while (v50);
      }
LABEL_30:
      float v43 = (char *)*a1;
      *a1 = v34;
      a1[1] = v35;
      a1[2] = v8;
      a1[3] = v37;
      if (v43)
      {
        operator delete(v43);
        uint64_t v8 = (char *)a1[2];
      }
      goto LABEL_33;
    }
    goto LABEL_5;
  }
  if (v23 == *a1) {
    unint64_t v25 = 1;
  }
  else {
    unint64_t v25 = v24 >> 2;
  }
  unint64_t v56 = a1 + 3;
  *(void *)&long long v54 = std::__allocate_at_least[abi:ne180100]<std::allocator<SyncSeqDetector::peakInfo>>((uint64_t)(a1 + 3), v25);
  *((void *)&v54 + EchoCodeDecoder::reset(this - 1) = v54 + 8 * v22;
  *(void *)&long long v55 = *((void *)&v54 + 1);
  *((void *)&v55 + EchoCodeDecoder::reset(this - 1) = v54 + 8 * v26;
  long long v53 = operator new(0x1000uLL);
  std::__split_buffer<unsigned char *>::push_back(&v54, &v53);
  unint64_t v27 = (void *)a1[2];
  uint64_t v28 = -7 - (void)v27;
  while (v27 != (void *)a1[1])
  {
    --v27;
    v28 += 8;
    std::__split_buffer<unsigned char *>::push_front((uint64_t)&v54, v27);
  }
  uint64_t v29 = (char *)*a1;
  long long v30 = v54;
  long long v31 = v55;
  *(void *)&long long v54 = *a1;
  *((void *)&v54 + EchoCodeDecoder::reset(this - 1) = v27;
  long long v32 = *((_OWORD *)a1 + 1);
  *(_OWORD *)a1 = v30;
  *((_OWORD *)a1 + EchoCodeDecoder::reset(this - 1) = v31;
  long long v55 = v32;
  if (v27 != (void *)v32) {
    *(void *)&long long v55 = v32 + (-(v32 + v28) & 0xFFFFFFFFFFFFFFF8);
  }
  if (v29) {
    operator delete(v29);
  }
}

void sub_237D24070(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  operator delete(v13);
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

char *std::deque<unsigned char>::__move_backward_and_check(uint64_t a1, char *a2, char *a3, char *a4, char *a5, char *a6, char *a7, unint64_t *a8)
{
  if (a5 != a3)
  {
    uint64_t v10 = a5;
    uint64_t v11 = a4;
    uint64_t v12 = &a5[512 * (a4 - a2)] - a3 - *(void *)a4 + *(void *)a2;
    if (v12 >= 1)
    {
      while (1)
      {
        BOOL v14 = *(char **)v11;
        if (v10 == *(char **)v11)
        {
          uint64_t v15 = (char *)*((void *)v11 - 1);
          v11 -= 8;
          BOOL v14 = v15;
          uint64_t v10 = v15 + 4096;
        }
        uint64_t v16 = v10 - 1;
        if (v10 - v14 >= v12) {
          uint64_t v17 = v12;
        }
        else {
          uint64_t v17 = v10 - v14;
        }
        if (v10 - v14 <= v12) {
          uint64_t v18 = v14;
        }
        else {
          uint64_t v18 = &v10[-v12];
        }
        unint64_t v19 = *a8;
        BOOL v20 = *a8 >= (unint64_t)v10 || (unint64_t)v18 > v19;
        if (v20) {
          goto LABEL_23;
        }
        if (v16 == a7) {
          break;
        }
        uint64_t v21 = (uint64_t)&a7[512 * (a6 - v11) + v14 - v10 - *(void *)a6];
        if (v21) {
          goto LABEL_19;
        }
LABEL_22:
        *a8 = v19;
LABEL_23:
        if (v18 != v10)
        {
          uint64_t v23 = *(void *)a6;
          while (1)
          {
            uint64_t v24 = &a7[-v23];
            if (v10 - v18 >= (uint64_t)v24) {
              size_t v25 = (size_t)v24;
            }
            else {
              size_t v25 = v10 - v18;
            }
            v10 -= v25;
            a7 -= v25;
            if (v25) {
              memmove(a7, v10, v25);
            }
            if (v10 == v18) {
              break;
            }
            uint64_t v26 = *((void *)a6 - 1);
            a6 -= 8;
            uint64_t v23 = v26;
            a7 = (char *)(v26 + 4096);
          }
          if ((char *)(*(void *)a6 + 4096) == a7)
          {
            unint64_t v27 = (char *)*((void *)a6 + 1);
            a6 += 8;
            a7 = v27;
          }
        }
        if (v17 != 1)
        {
          unint64_t v28 = (unint64_t)&v16[-*(void *)v11 - v17];
          if (v28 > 0x7FFFFFFFFFFFFFFELL)
          {
            unint64_t v30 = 4094 - v28;
            v11 -= 8 * (v30 >> 12);
            uint64_t v16 = (char *)(*(void *)v11 + (~(_WORD)v30 & 0xFFF));
          }
          else
          {
            unint64_t v29 = v28 + 1;
            v11 += 8 * (v29 >> 12);
            uint64_t v16 = (char *)(*(void *)v11 + (v29 & 0xFFF));
          }
        }
        uint64_t v10 = v16;
        BOOL v20 = v12 <= v17;
        v12 -= v17;
        if (v20) {
          return a6;
        }
      }
      uint64_t v21 = -1;
LABEL_19:
      uint64_t v22 = v21 + v19 - (void)v14;
      if (v22 < 1) {
        unint64_t v19 = *(void *)&v11[-8 * ((unint64_t)(4095 - v22) >> 12)] + (~(4095 - (_WORD)v22) & 0xFFF);
      }
      else {
        unint64_t v19 = *(void *)&v11[((unint64_t)v22 >> 9) & 0x7FFFFFFFFFFFF8] + (v22 & 0xFFF);
      }
      goto LABEL_22;
    }
  }
  return a6;
}

void *std::__deque_iterator<unsigned char,unsigned char *,unsigned char &,unsigned char **,long,4096l>::operator-[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void **)a1;
  if (a2)
  {
    uint64_t v4 = *(void *)(a1 + 8) - a2 - *result;
    if (v4 < 1) {
      result -= (unint64_t)(4095 - v4) >> 12;
    }
    else {
      result += (unint64_t)v4 >> 12;
    }
  }
  return result;
}

uint64_t (**std::any_cast[abi:ne180100]<float const>(uint64_t (**result)(uint64_t, void, void, void, void *)))(uint64_t, void, void, void, void *)
{
  if (result)
  {
    if (*result) {
      return (uint64_t (**)(uint64_t, void, void, void, void *))(*result)(3, result, 0, MEMORY[0x263F8C248], &std::__any_imp::__unique_typeinfo<float>::__id);
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t (**std::any_cast[abi:ne180100]<unsigned int const>(uint64_t (**result)(uint64_t, void, void, void, void *)))(uint64_t, void, void, void, void *)
{
  if (result)
  {
    if (*result) {
      return (uint64_t (**)(uint64_t, void, void, void, void *))(*result)(3, result, 0, MEMORY[0x263F8C260], &std::__any_imp::__unique_typeinfo<unsigned int>::__id);
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t (**std::any_cast[abi:ne180100]<BOOL const>(uint64_t (**result)(uint64_t, void, void, void, void *)))(uint64_t, void, void, void, void *)
{
  if (result)
  {
    if (*result) {
      return (uint64_t (**)(uint64_t, void, void, void, void *))(*result)(3, result, 0, MEMORY[0x263F8C230], &std::__any_imp::__unique_typeinfo<BOOL>::__id);
    }
    else {
      return 0;
    }
  }
  return result;
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);

  JUMPOUT(0x237E2DA50);
}

void sub_237D24BD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void BufferedAudioBus::init(BufferedAudioBus *this, AVAudioFormat *a2, uint64_t a3)
{
  uint64_t v8 = a2;
  *((_DWORD *)this + 2) = 0;
  uint64_t v5 = (void *)*((void *)this + 2);
  *((void *)this + 2) = 0;

  *((void *)this + 3) = 0;
  *((void *)this + 4) = 0;
  uint64_t v6 = [objc_alloc(MEMORY[0x263F28DA8]) initWithFormat:v8 error:0];
  uint64_t v7 = *(void **)this;
  *(void *)this = v6;

  [*(id *)this setMaximumChannelCount:a3];
}

void sub_237D24CF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_237D25528(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  if (a19)
  {
    if (a18 < 0) {
      operator delete(__p);
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t BufferedAudioBus::allocateRenderResources(BufferedAudioBus *this, int a2)
{
  *((_DWORD *)this + 2) = a2;
  id v3 = objc_alloc(MEMORY[0x263EF93B0]);
  uint64_t v4 = [*(id *)this format];
  uint64_t v5 = [v3 initWithPCMFormat:v4 frameCapacity:*((unsigned int *)this + 2)];
  uint64_t v6 = (void *)*((void *)this + 2);
  *((void *)this + 2) = v5;

  *((void *)this + 3) = [*((id *)this + 2) audioBufferList];
  uint64_t result = [*((id *)this + 2) mutableAudioBufferList];
  *((void *)this + 4) = result;
  return result;
}

void sub_237D256B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::make_unique[abi:ne180100]<caulk::concurrent::messenger,caulk::concurrent::messenger::thread_strategy,caulk::thread::attributes const&>()
{
}

void sub_237D2571C(_Unwind_Exception *a1)
{
  MEMORY[0x237E2DA50](v1, 0x20C40A4A59CD2);
  _Unwind_Resume(a1);
}

void sub_237D25B38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t BufferedInputBus::pullInput(BufferedInputBus *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v11 = a6;
  if (v11)
  {
    BufferedInputBus::prepareInputBufferList(a1);
    uint64_t v12 = v11[2](v11, a2, a3, a4, a5, a1->mutableAudioBufferList);
  }
  else
  {
    uint64_t v12 = 4294956420;
  }

  return v12;
}

void sub_237D25C04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237D25D48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237D25DB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_237D25EF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *std::string::basic_string[abi:ne180100]<0>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    uint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_bad_optional_access[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = MEMORY[0x263F8C3B0] + 16;
  __cxa_throw(exception, MEMORY[0x263F8C200], MEMORY[0x263F8C088]);
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  size_t v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    std::string::size_type v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17) {
      std::string::size_type v6 = __sz | 7;
    }
    std::string::size_type v7 = v6 + 1;
    uint64_t v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    size_t v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }

  memmove(v5, __s, __sz + 1);
}

BufferedInputBus *BufferedInputBus::prepareInputBufferList(BufferedInputBus *this)
{
  unsigned int maxFrames = this->maxFrames;
  originalAudioBufferList = this->originalAudioBufferList;
  mutableAudioBufferList = this->mutableAudioBufferList;
  mutableAudioBufferList->uint64_t mNumberBuffers = originalAudioBufferList->mNumberBuffers;
  uint64_t mNumberBuffers = originalAudioBufferList->mNumberBuffers;
  if (mNumberBuffers)
  {
    int v5 = 4 * maxFrames;
    p_mData = &originalAudioBufferList->mBuffers[0].mData;
    std::string::size_type v7 = &mutableAudioBufferList->mBuffers[0].mData;
    do
    {
      int v8 = *((_DWORD *)p_mData - 2);
      uint64_t v9 = *p_mData;
      p_mData += 2;
      void *v7 = v9;
      *((_DWORD *)v7 - 2) = v8;
      *((_DWORD *)v7 - EchoCodeDecoder::reset(this - 1) = v5;
      v7 += 2;
      --mNumberBuffers;
    }
    while (mNumberBuffers);
  }
  return this;
}

void *___Z16NewAudioCapturer20AudioCapturerOptionsPKcS1_jPK27AudioStreamBasicDescriptionRS3__block_invoke()
{
  uint64_t result = dlopen((const char *)_ZZZ16NewAudioCapturer20AudioCapturerOptionsPKcS1_jPK27AudioStreamBasicDescriptionRS3_EUb_E8kLibPath, 5);
  if (result)
  {
    uint64_t result = dlsym(result, "NewAudioCapturerImpl");
    if (result) {
      NewAudioCapturer(AudioCapturerOptions,char const*,char const*,unsigned int,AudioStreamBasicDescription const*,AudioStreamBasicDescription const&)::sImplFunction = (uint64_t (*)(void, void, void, void, void, void))result;
    }
  }
  return result;
}

void DecodedDataMessage::DecodedDataMessage(DecodedDataMessage *this, AUPasscodeDecoder *a2)
{
  id v3 = a2;
  *((_DWORD *)this + 4) = 0;
  *(void *)this = &unk_26EAE49E8;
  *((void *)this + EchoCodeDecoder::reset(this - 1) = 0;
  size_t v4 = v3;
  *((void *)this + 3) = v4;
  std::vector<unsigned char>::vector((void *)this + 4, 0x100uLL);
  *((_DWORD *)this + 14) = 0;
  *((unsigned char *)this + 60) = 0;
}

void sub_237D26520(_Unwind_Exception *a1)
{
  caulk::concurrent::message::~message((caulk::concurrent::message *)v1);
  _Unwind_Resume(a1);
}

void DecodedDataMessage::~DecodedDataMessage(DecodedDataMessage *this)
{
  unint64_t v2 = (void *)*((void *)this + 4);
  if (v2)
  {
    *((void *)this + 5) = v2;
    operator delete(v2);
  }

  caulk::concurrent::message::~message((caulk::concurrent::message *)this);
}

{
  void *v2;
  uint64_t vars8;

  unint64_t v2 = (void *)*((void *)this + 4);
  if (v2)
  {
    *((void *)this + 5) = v2;
    operator delete(v2);
  }

  caulk::concurrent::message::~message((caulk::concurrent::message *)this);

  JUMPOUT(0x237E2DA50);
}

uint64_t DecodedDataMessage::perform(DecodedDataMessage *this)
{
  *((unsigned char *)this + 60) = 0;
  return [*((id *)this + 3) handleDecodedData:*((void *)this + 4) ofLength:*((unsigned int *)this + 14)];
}

void *std::vector<unsigned char>::vector(void *a1, size_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<unsigned char>::__vallocate[abi:ne180100](a1, a2);
    size_t v4 = (char *)a1[1];
    int v5 = &v4[a2];
    bzero(v4, a2);
    a1[1] = v5;
  }
  return a1;
}

void sub_237D26658(_Unwind_Exception *exception_object)
{
  id v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void std::default_delete<DecodedDataMessage>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = *(void **)(a2 + 32);
    if (v3)
    {
      *(void *)(a2 + 40) = v3;
      operator delete(v3);
    }

    caulk::concurrent::message::~message((caulk::concurrent::message *)a2);
    JUMPOUT(0x237E2DA50);
  }
}

uint64_t std::unique_ptr<caulk::concurrent::messenger>::reset[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  *a1 = a2;
  if (result)
  {
    MEMORY[0x237E2D990]();
    JUMPOUT(0x237E2DA50);
  }
  return result;
}

void sub_237D26BE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237D26F8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237D27548(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_237D27650(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_237D27730(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237D278C0(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_237D27954(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237D27BA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237D27D10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237D27F94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237D28050(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_237D28250(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237D283DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237D28740(_Unwind_Exception *a1)
{
  uint64_t v9 = v6;

  _Unwind_Resume(a1);
}

void sub_237D28934(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237D289CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_237D28B30(_Unwind_Exception *a1)
{
  int v5 = v4;

  _Unwind_Resume(a1);
}

void sub_237D28CD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237D28D8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237D28F48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237D290F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237D29194(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237D29254(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_237D2932C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_237D29404(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_237D29C68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,char a23)
{
  if (a23)
  {
    if (a22 < 0) {
      operator delete(__p);
    }
  }

  _Unwind_Resume(a1);
}

void sub_237D29E34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237D2A7B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_237D2AC08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_237D2B080(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void EOFReachedMessage::~EOFReachedMessage(EOFReachedMessage *this)
{
  caulk::concurrent::message::~message((caulk::concurrent::message *)this);
}

{
  uint64_t vars8;

  caulk::concurrent::message::~message((caulk::concurrent::message *)this);

  JUMPOUT(0x237E2DA50);
}

uint64_t EOFReachedMessage::perform(EOFReachedMessage *this)
{
  return [*((id *)this + 3) handleEOFReachedForAsset];
}

void std::default_delete<EOFReachedMessage>::operator()[abi:ne180100](uint64_t a1, id *a2)
{
  if (a2)
  {

    caulk::concurrent::message::~message((caulk::concurrent::message *)a2);
    JUMPOUT(0x237E2DA50);
  }
}

void sub_237D2BC98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  _Unwind_Resume(a1);
}

OpaqueExtAudioFile *std::unique_ptr<OpaqueExtAudioFile,applesauce::raii::v1::detail::opaque_deletion_functor<OpaqueExtAudioFile*,&(ExtAudioFileDispose)>>::reset[abi:ne180100](OpaqueExtAudioFile **a1, OpaqueExtAudioFile *a2)
{
  uint64_t result = *a1;
  *a1 = a2;
  if (result) {
    return (OpaqueExtAudioFile *)ExtAudioFileDispose(result);
  }
  return result;
}

void sub_237D2BF6C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v2);

  _Unwind_Resume(a1);
}

void sub_237D2C07C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_237D2C2C8(_Unwind_Exception *exception_object)
{
}

char *std::vector<float>::assign(char **a1, unint64_t a2, _DWORD *a3)
{
  uint64_t v6 = (uint64_t)a1[2];
  uint64_t result = *a1;
  if (a2 <= (v6 - (uint64_t)result) >> 2)
  {
    uint64_t v13 = a1[1];
    unint64_t v14 = (v13 - result) >> 2;
    if (v14 >= a2) {
      uint64_t v15 = a2;
    }
    else {
      uint64_t v15 = (v13 - result) >> 2;
    }
    if (v15)
    {
      uint64_t v16 = result;
      do
      {
        *(_DWORD *)uint64_t v16 = *a3;
        v16 += 4;
        --v15;
      }
      while (v15);
    }
    if (a2 <= v14)
    {
      a1[1] = &result[4 * a2];
    }
    else
    {
      uint64_t v17 = &v13[4 * (a2 - v14)];
      uint64_t v18 = 4 * a2 - 4 * v14;
      do
      {
        *(_DWORD *)uint64_t v13 = *a3;
        v13 += 4;
        v18 -= 4;
      }
      while (v18);
      a1[1] = v17;
    }
  }
  else
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      uint64_t v6 = 0;
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
    }
    if (a2 >> 62) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v8 = v6 >> 1;
    if (v6 >> 1 <= a2) {
      uint64_t v8 = a2;
    }
    if ((unint64_t)v6 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v9 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v9 = v8;
    }
    uint64_t result = std::vector<float>::__vallocate[abi:ne180100](a1, v9);
    uint64_t v10 = a1[1];
    uint64_t v11 = &v10[4 * a2];
    uint64_t v12 = 4 * a2;
    do
    {
      *(_DWORD *)uint64_t v10 = *a3;
      v10 += 4;
      v12 -= 4;
    }
    while (v12);
    a1[1] = v11;
  }
  return result;
}

std::vector<char> *__cdecl std::vector<char>::vector(std::vector<char> *this, std::vector<char>::size_type __n, const std::vector<char>::value_type *__x)
{
  this->__begin_ = 0;
  this->__end_ = 0;
  this->__end_cap_.__value_ = 0;
  if (__n)
  {
    std::vector<char>::size_type v5 = __n;
    std::vector<unsigned char>::__vallocate[abi:ne180100](this, __n);
    std::vector<char>::pointer end = this->__end_;
    std::string::size_type v7 = &end[v5];
    do
    {
      *end++ = *__x;
      --v5;
    }
    while (v5);
    this->__end_ = v7;
  }
  return this;
}

void sub_237D2C590(_Unwind_Exception *exception_object)
{
  id v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void EchoEmbedder::EchoEmbedder(void **a1, void **a2, uint64_t a3)
{
  std::vector<char>::size_type v5 = *a1;
  if (v5)
  {
    *(void *)(a3 + 72) = v5;
    operator delete(v5);
  }
  uint64_t v6 = *a2;
  if (*a2)
  {
    *(void *)(a3 + 48) = v6;
    operator delete(v6);
  }
}

OSStatus AudioUnitSetProperty(AudioUnit inUnit, AudioUnitPropertyID inID, AudioUnitScope inScope, AudioUnitElement inElement, const void *inData, UInt32 inDataSize)
{
  return MEMORY[0x270F0FDB0](inUnit, *(void *)&inID, *(void *)&inScope, *(void *)&inElement, inData, *(void *)&inDataSize);
}

OSStatus ExtAudioFileCreateWithURL(CFURLRef inURL, AudioFileTypeID inFileType, const AudioStreamBasicDescription *inStreamDesc, const AudioChannelLayout *inChannelLayout, UInt32 inFlags, ExtAudioFileRef *outExtAudioFile)
{
  return MEMORY[0x270F0FDC0](inURL, *(void *)&inFileType, inStreamDesc, inChannelLayout, *(void *)&inFlags, outExtAudioFile);
}

OSStatus ExtAudioFileDispose(ExtAudioFileRef inExtAudioFile)
{
  return MEMORY[0x270F0FDC8](inExtAudioFile);
}

OSStatus ExtAudioFileGetProperty(ExtAudioFileRef inExtAudioFile, ExtAudioFilePropertyID inPropertyID, UInt32 *ioPropertyDataSize, void *outPropertyData)
{
  return MEMORY[0x270F0FDD0](inExtAudioFile, *(void *)&inPropertyID, ioPropertyDataSize, outPropertyData);
}

OSStatus ExtAudioFileOpenURL(CFURLRef inURL, ExtAudioFileRef *outExtAudioFile)
{
  return MEMORY[0x270F0FDD8](inURL, outExtAudioFile);
}

OSStatus ExtAudioFileRead(ExtAudioFileRef inExtAudioFile, UInt32 *ioNumberFrames, AudioBufferList *ioData)
{
  return MEMORY[0x270F0FDE0](inExtAudioFile, ioNumberFrames, ioData);
}

OSStatus ExtAudioFileSeek(ExtAudioFileRef inExtAudioFile, SInt64 inFrameOffset)
{
  return MEMORY[0x270F0FDE8](inExtAudioFile, inFrameOffset);
}

OSStatus ExtAudioFileSetProperty(ExtAudioFileRef inExtAudioFile, ExtAudioFilePropertyID inPropertyID, UInt32 inPropertyDataSize, const void *inPropertyData)
{
  return MEMORY[0x270F0FDF0](inExtAudioFile, *(void *)&inPropertyID, *(void *)&inPropertyDataSize, inPropertyData);
}

OSStatus ExtAudioFileTell(ExtAudioFileRef inExtAudioFile, SInt64 *outFrameOffset)
{
  return MEMORY[0x270F0FDF8](inExtAudioFile, outFrameOffset);
}

OSStatus ExtAudioFileWrite(ExtAudioFileRef inExtAudioFile, UInt32 inNumberFrames, const AudioBufferList *ioData)
{
  return MEMORY[0x270F0FE08](inExtAudioFile, *(void *)&inNumberFrames, ioData);
}

uint64_t MGGetProductType()
{
  return MEMORY[0x270F95FD8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void caulk::concurrent::message::~message(caulk::concurrent::message *this)
{
}

uint64_t caulk::concurrent::messenger::shared_logging_priority(caulk::concurrent::messenger *this)
{
  return MEMORY[0x270F87AA8](this);
}

uint64_t caulk::concurrent::messenger::enqueue(caulk::concurrent::messenger *this, caulk::concurrent::message *a2)
{
  return MEMORY[0x270F87AB8](this, a2);
}

uint64_t caulk::concurrent::messenger::messenger()
{
  return MEMORY[0x270F87AC0]();
}

void caulk::concurrent::messenger::~messenger(caulk::concurrent::messenger *this)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
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

std::chrono::system_clock::time_point std::chrono::system_clock::now(void)
{
  return (std::chrono::system_clock::time_point)MEMORY[0x270F98C28]();
}

std::bad_cast *__cdecl std::bad_cast::bad_cast(std::bad_cast *this)
{
  return (std::bad_cast *)MEMORY[0x270F98E48](this);
}

void std::bad_cast::~bad_cast(std::bad_cast *this)
{
}

void std::exception::~exception(std::exception *this)
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

void operator new()
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x270F98F10](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

float __exp10f(float a1)
{
  MEMORY[0x270ED7DD0](a1);
  return result;
}

uint64_t __udivti3()
{
  return MEMORY[0x270ED7F10]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

float expf(float a1)
{
  MEMORY[0x270ED9870](a1);
  return result;
}

long double log(long double __x)
{
  MEMORY[0x270EDA0A8](__x);
  return result;
}

float log10f(float a1)
{
  MEMORY[0x270EDA0B8](a1);
  return result;
}

float logf(float a1)
{
  MEMORY[0x270EDA0F8](a1);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
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

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

void vDSP_biquad(const vDSP_biquad_SetupStruct *__Setup, float *__Delay, const float *__X, vDSP_Stride __IX, float *__Y, vDSP_Stride __IY, vDSP_Length __N)
{
}

vDSP_biquad_Setup vDSP_biquad_CreateSetup(const double *__Coefficients, vDSP_Length __M)
{
  return (vDSP_biquad_Setup)MEMORY[0x270EDE968](__Coefficients, __M);
}

void vDSP_biquad_DestroySetup(vDSP_biquad_Setup __setup)
{
}

void vDSP_conv(const float *__A, vDSP_Stride __IA, const float *__F, vDSP_Stride __IF, float *__C, vDSP_Stride __IC, vDSP_Length __N, vDSP_Length __P)
{
}

FFTSetup vDSP_create_fftsetup(vDSP_Length __Log2n, FFTRadix __Radix)
{
  return (FFTSetup)MEMORY[0x270EDE9D0](__Log2n, *(void *)&__Radix);
}

void vDSP_destroy_fftsetup(FFTSetup __setup)
{
}

void vDSP_fft_zip(FFTSetup __Setup, const DSPSplitComplex *__C, vDSP_Stride __IC, vDSP_Length __Log2N, FFTDirection __Direction)
{
}

void vDSP_normalize(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, float *__Mean, float *__StandardDeviation, vDSP_Length __N)
{
}

void vDSP_vadd(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vclr(float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsma(const float *__A, vDSP_Stride __IA, const float *__B, const float *__C, vDSP_Stride __IC, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
}

void vDSP_vsmul(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}