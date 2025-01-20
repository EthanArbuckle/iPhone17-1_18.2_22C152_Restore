const __CFString *nlp::getUTF8StringFromCFString@<X0>(const __CFString *this@<X0>, void *a2@<X8>)
{
  CFStringRef v4;
  char *CStringPtr;
  CFIndex Length;
  uint64_t vars8;

  if (this)
  {
    v4 = this;
    CStringPtr = (char *)CFStringGetCStringPtr(this, 0x8000100u);
    if (!CStringPtr)
    {
      Length = CFStringGetLength(v4);
      CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
      operator new[]();
    }
    return (const __CFString *)std::string::basic_string[abi:ne180100]<0>(a2, CStringPtr);
  }
  else
  {
    *a2 = 0;
    a2[1] = 0;
    a2[2] = 0;
  }
  return this;
}

void sub_2369D72D8(_Unwind_Exception *a1)
{
  MEMORY[0x237E08B90](v1, 0x1000C8077774924);
  _Unwind_Resume(a1);
}

CFStringRef nlp::createCFStringFromString(uint64_t a1)
{
  uint64_t v1 = (const UInt8 *)a1;
  if ((*(char *)(a1 + 23) & 0x80000000) == 0)
  {
    CFIndex v2 = *(unsigned __int8 *)(a1 + 23);
    if (!*(unsigned char *)(a1 + 23)) {
      return &stru_26E9DB590;
    }
    return CFStringCreateWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB08], v1, v2, 0x8000100u, 0);
  }
  CFIndex v2 = *(void *)(a1 + 8);
  if (v2)
  {
    uint64_t v1 = *(const UInt8 **)a1;
    return CFStringCreateWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB08], v1, v2, 0x8000100u, 0);
  }
  return &stru_26E9DB590;
}

void nlp::getFileSystemRepresentationFromCFURL(nlp *this, const __CFURL *a2)
{
}

void sub_2369D73D4(_Unwind_Exception *a1)
{
  MEMORY[0x237E08B90](v1, 0x1000C8077774924);
  _Unwind_Resume(a1);
}

CFPropertyListRef nlp::createDictionaryWithContentsOfURL(nlp *this, CFErrorRef *a2, __CFError **a3, __CFError **a4)
{
  return nlp::createDictionaryWithContentsOfURL(this, 0, a2, a4);
}

CFPropertyListRef nlp::createDictionaryWithContentsOfURL(CFURLRef fileURL, const __CFURL *a2, CFErrorRef *a3, __CFError **a4)
{
  int v5 = (int)a2;
  v7 = CFReadStreamCreateWithFile((CFAllocatorRef)*MEMORY[0x263EFFB08], fileURL);
  if (v7)
  {
    v9 = v7;
    if (CFReadStreamOpen(v7)
      && (!v5 ? (CFOptionFlags v11 = 0) : (CFOptionFlags v11 = 2),
          CFPropertyListRef v12 = CFPropertyListCreateWithStream(0, v9, 0, v11, 0, 0),
          CFReadStreamClose(v9),
          v12))
    {
      CFTypeID v13 = CFGetTypeID(v12);
      if (v13 != CFDictionaryGetTypeID())
      {
        if (a3) {
          *a3 = nlp::createErrorWithMessageAndURL((nlp *)@"Property list at URL is not a dictionary", fileURL, v14);
        }
        CFRelease(v12);
        goto LABEL_15;
      }
    }
    else
    {
      if (!a3)
      {
LABEL_15:
        CFPropertyListRef v12 = 0;
        goto LABEL_16;
      }
      CFPropertyListRef v12 = 0;
      *a3 = nlp::createErrorWithMessageAndURL((nlp *)@"File at URL is not a valid property list", fileURL, v10);
    }
LABEL_16:
    CFRelease(v9);
    return v12;
  }
  CFPropertyListRef v12 = 0;
  if (a3) {
    *a3 = nlp::createErrorWithMessageAndURL((nlp *)@"File at URL is not readable", fileURL, v8);
  }
  return v12;
}

void sub_2369D7540(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  nlp::CFScopedPtr<__CFReadStream *>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

CFErrorRef nlp::createErrorWithMessageAndURL(nlp *this, CFURLRef anURL, const __CFURL *a3)
{
  CFStringRef v4 = CFURLCopyPath(anURL);
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFStringRef v6 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"%@: %@", this, v4);
  Mutable = CFDictionaryCreateMutable(v5, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263EFFC70], v6);
  CFErrorRef v8 = CFErrorCreate(v5, @"com.apple.NLPUtils.ErrorDomain", 0, Mutable);
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (v6) {
    CFRelease(v6);
  }
  if (v4) {
    CFRelease(v4);
  }
  return v8;
}

void sub_2369D7668(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va1, a4);
  va_start(va, a4);
  CFAllocatorRef v5 = va_arg(va1, const void *);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va1, 0);
  _Unwind_Resume(a1);
}

void nlp::CFScopedPtr<__CFDictionary *>::reset(const void **a1, const void *a2)
{
  CFStringRef v4 = *a1;
  if (v4) {
    CFRelease(v4);
  }
  *a1 = a2;
}

void __clang_call_terminate(void *a1)
{
}

void nlp::CFScopedPtr<__CFReadStream *>::reset(const void **a1, const void *a2)
{
  CFStringRef v4 = *a1;
  if (v4) {
    CFRelease(v4);
  }
  *a1 = a2;
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
    CFStringRef v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    CFStringRef v6 = a1;
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

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_264CBA218, MEMORY[0x263F8C060]);
}

void sub_2369D7840(_Unwind_Exception *a1)
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

void nlp::CFScopedPtr<__CFString const*>::reset(const void **a1, const void *a2)
{
  size_t v4 = *a1;
  if (v4) {
    CFRelease(v4);
  }
  *a1 = a2;
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

void nlp::CFScopedPtr<__CFDictionary const*>::reset(const void **a1, const void *a2)
{
  size_t v4 = *a1;
  if (v4) {
    CFRelease(v4);
  }
  *a1 = a2;
}

void *InputTranscoder::RNNRecognizer::recognize@<X0>(unsigned int **a1@<X1>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  size_t v5 = *a1;
  size_t v4 = a1[1];
  uint64_t OutputDimension = 0;
  v13[0] = &unk_26E9D9CB0;
  v13[1] = &OutputDimension;
  CFURLRef v14 = a1;
  v15 = v13;
  std::string::size_type v6 = *(void **)(a2 + 8);
  uint64_t OutputDimension = MRLNeuralNetworkGetOutputDimension();
  uint64_t v7 = InputTranscoder::MontrealModel::recognize(v6, *v14, v14[1] - *v14);
  uint64_t v9 = v8;
  result = std::__function::__value_func<std::span<float const,18446744073709551615ul> ()(InputTranscoder::MontrealModel &)>::~__value_func[abi:ne180100](v13);
  *a3 = v7;
  a3[1] = v9;
  uint64_t v11 = OutputDimension;
  a3[2] = v4 - v5;
  a3[3] = v11;
  return result;
}

void sub_2369D7A80(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__function::__value_func<std::span<float const,18446744073709551615ul> ()(InputTranscoder::MontrealModel &)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void InputTranscoder::RNNRecognizer::~RNNRecognizer(InputTranscoder::RNNRecognizer *this)
{
}

void std::__function::__func<InputTranscoder::RNNRecognizer::recognize(InputTranscoder::InputProcessor const&,InputTranscoder::TranscoderMediator &)::$_0,std::allocator<InputTranscoder::RNNRecognizer::recognize(InputTranscoder::InputProcessor const&,InputTranscoder::TranscoderMediator &)::$_0>,std::span<float const,18446744073709551615ul> ()(InputTranscoder::MontrealModel &)>::~__func()
{
}

__n128 std::__function::__func<InputTranscoder::RNNRecognizer::recognize(InputTranscoder::InputProcessor const&,InputTranscoder::TranscoderMediator &)::$_0,std::allocator<InputTranscoder::RNNRecognizer::recognize(InputTranscoder::InputProcessor const&,InputTranscoder::TranscoderMediator &)::$_0>,std::span<float const,18446744073709551615ul> ()(InputTranscoder::MontrealModel &)>::__clone(uint64_t a1)
{
  CFIndex v2 = (char *)operator new(0x18uLL);
  *(void *)CFIndex v2 = &unk_26E9D9CB0;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 std::__function::__func<InputTranscoder::RNNRecognizer::recognize(InputTranscoder::InputProcessor const&,InputTranscoder::TranscoderMediator &)::$_0,std::allocator<InputTranscoder::RNNRecognizer::recognize(InputTranscoder::InputProcessor const&,InputTranscoder::TranscoderMediator &)::$_0>,std::span<float const,18446744073709551615ul> ()(InputTranscoder::MontrealModel &)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26E9D9CB0;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t std::__function::__func<InputTranscoder::RNNRecognizer::recognize(InputTranscoder::InputProcessor const&,InputTranscoder::TranscoderMediator &)::$_0,std::allocator<InputTranscoder::RNNRecognizer::recognize(InputTranscoder::InputProcessor const&,InputTranscoder::TranscoderMediator &)::$_0>,std::span<float const,18446744073709551615ul> ()(InputTranscoder::MontrealModel &)>::operator()(uint64_t a1, void *a2)
{
  uint64_t OutputDimension = MRLNeuralNetworkGetOutputDimension();
  uint64_t v5 = *(void *)(a1 + 16);
  **(void **)(a1 + 8) = OutputDimension;
  std::string::size_type v6 = *(unsigned int **)v5;
  unint64_t v7 = (uint64_t)(*(void *)(v5 + 8) - *(void *)v5) >> 2;

  return InputTranscoder::MontrealModel::recognize(a2, v6, v7);
}

uint64_t std::__function::__func<InputTranscoder::RNNRecognizer::recognize(InputTranscoder::InputProcessor const&,InputTranscoder::TranscoderMediator &)::$_0,std::allocator<InputTranscoder::RNNRecognizer::recognize(InputTranscoder::InputProcessor const&,InputTranscoder::TranscoderMediator &)::$_0>,std::span<float const,18446744073709551615ul> ()(InputTranscoder::MontrealModel &)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<InputTranscoder::RNNRecognizer::recognize(InputTranscoder::InputProcessor const&,InputTranscoder::TranscoderMediator &)::$_0,std::allocator<InputTranscoder::RNNRecognizer::recognize(InputTranscoder::InputProcessor const&,InputTranscoder::TranscoderMediator &)::$_0>,std::span<float const,18446744073709551615ul> ()(InputTranscoder::MontrealModel &)>::target_type()
{
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

void *std::__function::__value_func<std::span<float const,18446744073709551615ul> ()(InputTranscoder::MontrealModel &)>::~__value_func[abi:ne180100](void *a1)
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

void *_CFInit_Candidate(void *result)
{
  result[2] = &unk_26E9D9D40;
  result[3] = 0;
  result[4] = 0;
  result[5] = 0;
  return result;
}

uint64_t nlp::CFFinalize(uint64_t (***this)(void), const void *a2)
{
  return (*this[2])();
}

uint64_t _CFGetTypeID_Candidate(void)
{
  {
    unk_26ADCFD28 = 0u;
    unk_26ADCFD18 = 0u;
    _CFGetTypeID_Candidate(void)::typeID = _CFRuntimeRegisterClass();
  }
  return _CFGetTypeID_Candidate(void)::typeID;
}

void sub_2369D7D74(_Unwind_Exception *a1)
{
}

uint64_t _CFInit_KeyCandidate(uint64_t result)
{
  *(void *)(result + 16) = &unk_26E9D9DA8;
  *(void *)(result + 24) = 0;
  return result;
}

uint64_t _CFGetTypeID_KeyCandidate(void)
{
  {
    unk_26B809760 = 0u;
    unk_26B809750 = 0u;
    _CFGetTypeID_KeyCandidate(void)::typeID = _CFRuntimeRegisterClass();
  }
  return _CFGetTypeID_KeyCandidate(void)::typeID;
}

void sub_2369D7E20(_Unwind_Exception *a1)
{
}

uint64_t _CFInit_TouchTranscoder(uint64_t result)
{
  *(void *)(result + 16) = &unk_26E9D9E00;
  *(void *)(result + 24) = 0;
  return result;
}

uint64_t _CFGetTypeID_TouchTranscoder(void)
{
  {
    unk_26ADCFD88 = 0u;
    unk_26ADCFD78 = 0u;
    _CFGetTypeID_TouchTranscoder(void)::typeID = _CFRuntimeRegisterClass();
  }
  return _CFGetTypeID_TouchTranscoder(void)::typeID;
}

void sub_2369D7ECC(_Unwind_Exception *a1)
{
}

uint64_t _CFInit_TouchTranscoderSession(uint64_t result)
{
  *(void *)(result + 16) = &unk_26E9D9E58;
  *(void *)(result + 24) = 0;
  return result;
}

uint64_t _CFGetTypeID_TouchTranscoderSession(void)
{
  {
    unk_26ADCFDE8 = 0u;
    unk_26ADCFDD8 = 0u;
    _CFGetTypeID_TouchTranscoderSession(void)::typeID = _CFRuntimeRegisterClass();
  }
  return _CFGetTypeID_TouchTranscoderSession(void)::typeID;
}

void sub_2369D7F78(_Unwind_Exception *a1)
{
}

uint64_t _CFInit_Decoder(uint64_t result)
{
  *(void *)(result + 16) = &unk_26E9D9EB0;
  *(void *)(result + 24) = 0;
  return result;
}

uint64_t _CFGetTypeID_Decoder(void)
{
  {
    unk_26B8097C0 = 0u;
    unk_26B8097B0 = 0u;
    _CFGetTypeID_Decoder(void)::typeID = _CFRuntimeRegisterClass();
  }
  return _CFGetTypeID_Decoder(void)::typeID;
}

void sub_2369D8024(_Unwind_Exception *a1)
{
}

void Candidate::~Candidate(const void **this)
{
  *this = &unk_26E9D9D40;
  uint64_t v2 = this + 2;
  nlp::CFScopedPtr<__CFString const*>::reset(this + 3, 0);
  nlp::CFScopedPtr<__CFString const*>::reset(v2, 0);
  uint64_t v3 = (uint64_t)this[1];
  this[1] = 0;
  if (v3) {
    std::default_delete<InputTranscoder::CandidateImpl>::operator()[abi:ne180100]((uint64_t)(this + 1), v3);
  }
}

{
  const void **v2;
  uint64_t v3;
  uint64_t vars8;

  *this = &unk_26E9D9D40;
  uint64_t v2 = this + 2;
  nlp::CFScopedPtr<__CFString const*>::reset(this + 3, 0);
  nlp::CFScopedPtr<__CFString const*>::reset(v2, 0);
  uint64_t v3 = (uint64_t)this[1];
  this[1] = 0;
  if (v3) {
    std::default_delete<InputTranscoder::CandidateImpl>::operator()[abi:ne180100]((uint64_t)(this + 1), v3);
  }

  JUMPOUT(0x237E08BB0);
}

uint64_t nlp::CFType::Equal()
{
  return 0;
}

uint64_t nlp::CFType::Hash(nlp::CFType *this)
{
  return 0;
}

uint64_t nlp::CFType::CopyFormattingDesc(nlp::CFType *this, const __CFDictionary *a2)
{
  return 0;
}

uint64_t nlp::CFType::CopyDebugDesc(nlp::CFType *this)
{
  return 0;
}

void std::default_delete<InputTranscoder::CandidateImpl>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    if (*(char *)(a2 + 119) < 0) {
      operator delete(*(void **)(a2 + 96));
    }
    uint64_t v3 = *(void **)(a2 + 56);
    if (v3)
    {
      *(void *)(a2 + 64) = v3;
      operator delete(v3);
    }
    if (*(char *)(a2 + 47) < 0) {
      operator delete(*(void **)(a2 + 24));
    }
    if (*(char *)(a2 + 23) < 0) {
      operator delete(*(void **)a2);
    }
    JUMPOUT(0x237E08BB0);
  }
}

void KeyCandidate::~KeyCandidate(KeyCandidate *this)
{
  *(void *)this = &unk_26E9D9DA8;
  uint64_t v3 = *((void *)this + 1);
  uint64_t v1 = (void *)((char *)this + 8);
  uint64_t v2 = v3;
  *uint64_t v1 = 0;
  if (v3) {
    std::default_delete<InputTranscoder::KeyCandidateImpl>::operator()[abi:ne180100]((uint64_t)v1, v2);
  }
}

{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t vars8;

  *(void *)this = &unk_26E9D9DA8;
  uint64_t v3 = *((void *)this + 1);
  uint64_t v1 = (void *)((char *)this + 8);
  uint64_t v2 = v3;
  *uint64_t v1 = 0;
  if (v3) {
    std::default_delete<InputTranscoder::KeyCandidateImpl>::operator()[abi:ne180100]((uint64_t)v1, v2);
  }

  JUMPOUT(0x237E08BB0);
}

void std::default_delete<InputTranscoder::KeyCandidateImpl>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    if (*(char *)(a2 + 23) < 0) {
      operator delete(*(void **)a2);
    }
    JUMPOUT(0x237E08BB0);
  }
}

void TouchTranscoder::~TouchTranscoder(TouchTranscoder *this)
{
  *(void *)this = &unk_26E9D9E00;
  uint64_t v3 = (InputTranscoder::TranscoderConfiguration *)*((void *)this + 1);
  uint64_t v1 = (void *)((char *)this + 8);
  uint64_t v2 = v3;
  *uint64_t v1 = 0;
  if (v3) {
    std::default_delete<InputTranscoder::TouchTranscoderImpl>::operator()[abi:ne180100]((int)v1, v2);
  }
}

{
  void *v1;
  InputTranscoder::TranscoderConfiguration *v2;
  InputTranscoder::TranscoderConfiguration *v3;
  uint64_t vars8;

  *(void *)this = &unk_26E9D9E00;
  uint64_t v3 = (InputTranscoder::TranscoderConfiguration *)*((void *)this + 1);
  uint64_t v1 = (void *)((char *)this + 8);
  uint64_t v2 = v3;
  *uint64_t v1 = 0;
  if (v3) {
    std::default_delete<InputTranscoder::TouchTranscoderImpl>::operator()[abi:ne180100]((int)v1, v2);
  }

  JUMPOUT(0x237E08BB0);
}

void std::default_delete<InputTranscoder::TouchTranscoderImpl>::operator()[abi:ne180100](int a1, InputTranscoder::TranscoderConfiguration *this)
{
  if (this)
  {
    uint64_t v3 = (std::__shared_weak_count *)*((void *)this + 60);
    if (v3) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v3);
    }
    size_t v4 = (std::__shared_weak_count *)*((void *)this + 58);
    if (v4) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    }
    uint64_t v5 = (std::__shared_weak_count *)*((void *)this + 56);
    if (v5) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v5);
    }
    InputTranscoder::TranscoderConfiguration::~TranscoderConfiguration((void **)this);
    JUMPOUT(0x237E08BB0);
  }
}

void std::__shared_weak_count::__release_shared[abi:ne180100](std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void InputTranscoder::TranscoderConfiguration::~TranscoderConfiguration(void **this)
{
  uint64_t v2 = this + 52;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v2);
  uint64_t v2 = this + 49;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v2);
  if (*((char *)this + 359) < 0) {
    operator delete(this[42]);
  }
  if (*((char *)this + 335) < 0) {
    operator delete(this[39]);
  }
  if (*((char *)this + 311) < 0) {
    operator delete(this[36]);
  }
  if (*((char *)this + 151) < 0) {
    operator delete(this[16]);
  }
  if (*((char *)this + 127) < 0) {
    operator delete(this[13]);
  }
  if (*((char *)this + 79) < 0) {
    operator delete(this[7]);
  }
  if (*((char *)this + 55) < 0) {
    operator delete(this[4]);
  }
  if (*((char *)this + 23) < 0) {
    operator delete(*this);
  }
}

void std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<std::string>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 24)
  {
    if (*(char *)(i - 1) < 0) {
      operator delete(*(void **)(i - 24));
    }
  }
  a1[1] = v2;
}

void TouchTranscoderSession::~TouchTranscoderSession(void ***this)
{
  *this = (void **)&unk_26E9D9E58;
  std::unique_ptr<InputTranscoder::TouchTranscoderSessionImpl>::reset[abi:ne180100](this + 1, 0);
}

{
  uint64_t vars8;

  *this = (void **)&unk_26E9D9E58;
  std::unique_ptr<InputTranscoder::TouchTranscoderSessionImpl>::reset[abi:ne180100](this + 1, 0);

  JUMPOUT(0x237E08BB0);
}

void **std::unique_ptr<InputTranscoder::TouchTranscoderSessionImpl>::reset[abi:ne180100](void ***a1, void **a2)
{
  __n128 result = *a1;
  *a1 = a2;
  if (result)
  {
    InputTranscoder::TouchTranscoderSessionImpl::~TouchTranscoderSessionImpl(result);
    JUMPOUT(0x237E08BB0);
  }
  return result;
}

void InputTranscoder::TouchTranscoderSessionImpl::~TouchTranscoderSessionImpl(void **this)
{
  if (*((char *)this + 863) < 0) {
    operator delete(this[105]);
  }
  if (*((char *)this + 831) < 0) {
    operator delete(this[101]);
  }
  if (*((char *)this + 807) < 0) {
    operator delete(this[98]);
  }
  if (*((char *)this + 783) < 0) {
    operator delete(this[95]);
  }
  if (*((char *)this + 759) < 0) {
    operator delete(this[92]);
  }
  if (*((char *)this + 735) < 0) {
    operator delete(this[89]);
  }
  if (*((char *)this + 711) < 0) {
    operator delete(this[86]);
  }
  uint64_t v2 = this[85];
  this[85] = 0;
  if (v2) {
    (*(void (**)(void *))(*(void *)v2 + 16))(v2);
  }
  uint64_t v3 = (std::__shared_weak_count *)this[84];
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  size_t v4 = (std::__shared_weak_count *)this[82];
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  uint64_t v5 = (std::__shared_weak_count *)this[80];
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  InputTranscoder::PathKeyLayoutProcessor::~PathKeyLayoutProcessor((InputTranscoder::PathKeyLayoutProcessor *)(this + 73));
  std::string::size_type v6 = this[68];
  if (v6)
  {
    this[69] = v6;
    operator delete(v6);
  }
  unint64_t v7 = this[65];
  if (v7)
  {
    this[66] = v7;
    operator delete(v7);
  }
  uint64_t v8 = this[62];
  if (v8)
  {
    this[63] = v8;
    operator delete(v8);
  }
  uint64_t v9 = this[59];
  if (v9)
  {
    this[60] = v9;
    operator delete(v9);
  }

  InputTranscoder::TranscoderConfiguration::~TranscoderConfiguration(this);
}

void InputTranscoder::PathKeyLayoutProcessor::~PathKeyLayoutProcessor(InputTranscoder::PathKeyLayoutProcessor *this)
{
  *(void *)this = &unk_26E9DB070;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 4);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  uint64_t v3 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

{
  uint64_t vars8;

  InputTranscoder::PathKeyLayoutProcessor::~PathKeyLayoutProcessor(this);

  JUMPOUT(0x237E08BB0);
}

void Decoder::~Decoder(Decoder *this)
{
  *(void *)this = &unk_26E9D9EB0;
  uint64_t v3 = *((void *)this + 1);
  uint64_t v1 = (void *)((char *)this + 8);
  uint64_t v2 = v3;
  *uint64_t v1 = 0;
  if (v3) {
    std::default_delete<InputTranscoder::DecoderImpl>::operator()[abi:ne180100]((uint64_t)v1, v2);
  }
}

{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t vars8;

  *(void *)this = &unk_26E9D9EB0;
  uint64_t v3 = *((void *)this + 1);
  uint64_t v1 = (void *)((char *)this + 8);
  uint64_t v2 = v3;
  *uint64_t v1 = 0;
  if (v3) {
    std::default_delete<InputTranscoder::DecoderImpl>::operator()[abi:ne180100]((uint64_t)v1, v2);
  }

  JUMPOUT(0x237E08BB0);
}

void std::default_delete<InputTranscoder::DecoderImpl>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = (const void **)(a2 + 336);
    size_t v4 = *(void **)(a2 + 344);
    if (v4)
    {
      *(void *)(a2 + 352) = v4;
      operator delete(v4);
    }
    nlp::CFScopedPtr<MontrealNeuralNetwork *>::reset(v3, 0);
    uint64_t v5 = *(std::__shared_weak_count **)(a2 + 328);
    if (v5) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v5);
    }
    InputTranscoder::CTCDecoder::~CTCDecoder((void **)a2);
    JUMPOUT(0x237E08BB0);
  }
}

void nlp::CFScopedPtr<MontrealNeuralNetwork *>::reset(const void **a1, const void *a2)
{
  size_t v4 = *a1;
  if (v4) {
    CFRelease(v4);
  }
  *a1 = a2;
}

void InputTranscoder::CTCDecoder::~CTCDecoder(void **this)
{
  if (*((char *)this + 279) < 0) {
    operator delete(this[32]);
  }
  uint64_t v2 = this[29];
  if (v2)
  {
    this[30] = v2;
    operator delete(v2);
  }
  uint64_t v5 = this + 26;
  std::vector<nlp::CFScopedPtr<_LXLexicon const*>>::__destroy_vector::operator()[abi:ne180100](&v5);
  uint64_t v3 = (std::__shared_weak_count *)this[25];
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  size_t v4 = (uint64_t *)this[23];
  this[23] = 0;
  if (v4) {
    std::default_delete<InputTranscoder::LMScorer>::operator()[abi:ne180100]((uint64_t)(this + 23), v4);
  }
  if (*((char *)this + 47) < 0) {
    operator delete(this[3]);
  }
  if (*((char *)this + 23) < 0) {
    operator delete(*this);
  }
}

void std::vector<nlp::CFScopedPtr<_LXLexicon const*>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (const void **)**a1;
  if (v2)
  {
    size_t v4 = (const void **)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
        nlp::CFScopedPtr<_LXLexicon const*>::reset(--v4, 0);
      while (v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void nlp::CFScopedPtr<_LXLexicon const*>::reset(const void **a1, const void *a2)
{
  size_t v4 = *a1;
  if (v4) {
    CFRelease(v4);
  }
  *a1 = a2;
}

void std::default_delete<InputTranscoder::LMScorer>::operator()[abi:ne180100](uint64_t a1, uint64_t *a2)
{
  if (a2)
  {
    uint64_t v3 = (void *)a2[5];
    if (v3)
    {
      a2[6] = (uint64_t)v3;
      operator delete(v3);
    }
    size_t v4 = (std::__shared_weak_count *)a2[4];
    if (v4) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    }
    std::unique_ptr<InputTranscoder::LanguageModel>::reset[abi:ne180100](a2 + 2, 0);
    JUMPOUT(0x237E08BB0);
  }
}

uint64_t *std::unique_ptr<InputTranscoder::LanguageModel>::reset[abi:ne180100](uint64_t *result, uint64_t a2)
{
  uint64_t v2 = *result;
  void *result = a2;
  if (v2)
  {
    LMLanguageModelRelease();
    JUMPOUT(0x237E08BB0);
  }
  return result;
}

void InputTranscoder::appendFeature(int a1, int a2, void **a3, double a4, double a5)
{
  CFURLRef v10 = (char *)a3[2];
  uint64_t v11 = (char *)a3[1];
  if (v11 >= v10)
  {
    uint64_t v13 = (v11 - (unsigned char *)*a3) >> 5;
    unint64_t v14 = v13 + 1;
    if ((unint64_t)(v13 + 1) >> 59) {
      std::vector<InputTranscoder::InputFeature>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v15 = v10 - (unsigned char *)*a3;
    if (v15 >> 4 > v14) {
      unint64_t v14 = v15 >> 4;
    }
    if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFE0) {
      unint64_t v16 = 0x7FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v16 = v14;
    }
    v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<InputTranscoder::InputFeature>>((uint64_t)(a3 + 2), v16);
    v18 = (double *)&v17[32 * v13];
    v20 = &v17[32 * v19];
    *(_DWORD *)v18 = a1;
    v18[1] = a4;
    v18[2] = a5;
    *((_DWORD *)v18 + 6) = a2;
    CFPropertyListRef v12 = (char *)(v18 + 4);
    v22 = (char *)*a3;
    v21 = (char *)a3[1];
    if (v21 != *a3)
    {
      do
      {
        long long v23 = *((_OWORD *)v21 - 2);
        *(_OWORD *)((char *)v18 - 20) = *(_OWORD *)(v21 - 20);
        *((_OWORD *)v18 - 2) = v23;
        v18 -= 4;
        v21 -= 32;
      }
      while (v21 != v22);
      v21 = (char *)*a3;
    }
    *a3 = v18;
    a3[1] = v12;
    a3[2] = v20;
    if (v21) {
      operator delete(v21);
    }
  }
  else
  {
    *(_DWORD *)uint64_t v11 = a1;
    *((double *)v11 + 1) = a4;
    *((double *)v11 + 2) = a5;
    CFPropertyListRef v12 = v11 + 32;
    *((_DWORD *)v11 + 6) = a2;
  }
  a3[1] = v12;
}

void std::vector<InputTranscoder::InputFeature>::__throw_length_error[abi:ne180100]()
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<InputTranscoder::InputFeature>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(32 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

__CFDictionary *InputTranscoder::InputDescriptorCreator::create(unint64_t this, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v17 = a2;
  uint64_t v15 = a4;
  uint64_t valuePtr = a3;
  unint64_t v13 = this / a2;
  uint64_t v14 = a5;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFNumberRef v7 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt64Type, &valuePtr);
  CFNumberRef v8 = CFNumberCreate(v6, kCFNumberSInt64Type, &v17);
  CFNumberRef v9 = CFNumberCreate(v6, kCFNumberSInt64Type, &v13);
  CFNumberRef v10 = CFNumberCreate(v6, kCFNumberSInt64Type, &v15);
  CFNumberRef v11 = CFNumberCreate(v6, kCFNumberSInt64Type, &v14);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F56668], v7);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F56660], v11);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F56670], v8);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F56650], v9);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F56648], v10);
  if (v11) {
    CFRelease(v11);
  }
  if (v10) {
    CFRelease(v10);
  }
  if (v9) {
    CFRelease(v9);
  }
  if (v8) {
    CFRelease(v8);
  }
  if (v7) {
    CFRelease(v7);
  }
  return Mutable;
}

void sub_2369D8FA0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va3, a2);
  va_start(va2, a2);
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v3 = va_arg(va1, const void *);
  va_copy(va2, va1);
  uint64_t v5 = va_arg(va2, const void *);
  va_copy(va3, va2);
  CFNumberRef v7 = va_arg(va3, const void *);
  nlp::CFScopedPtr<__CFNumber const*>::reset((const void **)va, 0);
  nlp::CFScopedPtr<__CFNumber const*>::reset((const void **)va1, 0);
  nlp::CFScopedPtr<__CFNumber const*>::reset((const void **)va2, 0);
  nlp::CFScopedPtr<__CFNumber const*>::reset((const void **)va3, 0);
  _Unwind_Resume(a1);
}

__CFDictionary *InputTranscoder::InputDescriptorCreator::create(InputTranscoder::InputDescriptorCreator *this, uint64_t a2)
{
  uint64_t valuePtr = a2;
  CFNumberRef v8 = this;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFNumberRef v4 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt64Type, &valuePtr);
  CFNumberRef v5 = CFNumberCreate(v3, kCFNumberSInt64Type, &v8);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F56658], v4);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F56660], v5);
  if (v5) {
    CFRelease(v5);
  }
  if (v4) {
    CFRelease(v4);
  }
  return Mutable;
}

void sub_2369D90E8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  nlp::CFScopedPtr<__CFNumber const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

void nlp::CFScopedPtr<__CFNumber const*>::reset(const void **a1, const void *a2)
{
  CFNumberRef v4 = *a1;
  if (v4) {
    CFRelease(v4);
  }
  *a1 = a2;
}

void ITDecoderCreate(void *a1)
{
  if (!a1)
  {
    unint64_t v16 = 0;
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x237E08980](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  CFRetain(a1);
  CFTypeID v2 = CFGetTypeID(a1);
  if (v2 != CFDictionaryGetTypeID())
  {
    unint64_t v13 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x237E08980](v13, "Could not construct");
    __cxa_throw(v13, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  if (@"bundleURL")
  {
    Value = CFDictionaryGetValue((CFDictionaryRef)a1, @"bundleURL");
    CFNumberRef v4 = Value;
    if (Value)
    {
      CFRetain(Value);
      CFTypeID v5 = CFGetTypeID(v4);
      if (v5 == CFURLGetTypeID())
      {
        v20 = (nlp *)v4;
        char v6 = 1;
        goto LABEL_9;
      }
      CFRelease(v4);
    }
  }
  char v6 = 0;
  LOBYTE(v20) = 0;
LABEL_9:
  char v21 = v6;
  CFRelease(a1);
  uint64_t v19 = 0;
  if (v21)
  {
    CFBundleRef v7 = CFBundleCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v20);
    nlp::CFScopedPtr<__CFBundle *>::acquire((const void **)&v19, v7);
    if (!v19)
    {
      __cxa_allocate_exception(0x20uLL);
      if (!v21) {
        std::__throw_bad_optional_access[abi:ne180100]();
      }
      nlp::getFileSystemRepresentationFromCFURL(v20, v8);
    }
  }
  else
  {
    CFBundleRef BundleWithIdentifier = CFBundleGetBundleWithIdentifier(@"com.apple.InputTranscoder-framework");
    nlp::CFScopedPtr<__CFBundle *>::acquire((const void **)&v19, BundleWithIdentifier);
  }
  CFStringRef Optional = (const __CFString *)InputTranscoder::getOptionalCFType<__CFString const*>((const __CFDictionary *)a1, @"neuralTypeKey", @"Path");
  BOOL v11 = CFEqual(Optional, @"Tap");
  InputTranscoder::generateConfiguration<InputTranscoder::DecoderConfiguration>((InputTranscoder *)a1, v19, v11, (InputTranscoder::DecoderConfiguration *)&v16);
  std::allocate_shared[abi:ne180100]<InputTranscoder::PlistBiMap<unsigned int,unsigned int> const,std::allocator<InputTranscoder::PlistBiMap<unsigned int,unsigned int> const>,std::string const&,void>((uint64_t)&v17, &v15);
  std::allocate_shared[abi:ne180100]<InputTranscoder::PlistBiMap<unsigned int,unsigned int> const,std::allocator<InputTranscoder::PlistBiMap<unsigned int,unsigned int> const>,std::string const&,void>((uint64_t)&v18, &v14);
  CFAllocatorGetDefault();
  _CFGetTypeID_Decoder();
  _CFRuntimeCreateInstance();
  operator new();
}

void sub_2369D94E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v21 - 89) < 0)
  {
    operator delete(*(void **)(v21 - 112));
    if ((v20 & 1) == 0) {
      goto LABEL_8;
    }
  }
  else if (!v20)
  {
LABEL_8:
    nlp::CFScopedPtr<__CFBundle *>::reset((const void **)(v21 - 88), 0);
    if (a2 == 2)
    {
      v24 = __cxa_begin_catch(a1);
      if (v18)
      {
        v25 = (char *)(*(uint64_t (**)(void *))(*(void *)v24 + 16))(v24);
        std::string::basic_string[abi:ne180100]<0>(&__p, v25);
        CFErrorRef *v18 = InputTranscoder::createErrorWithMessage((uint64_t)&__p);
        if (a18 < 0) {
          operator delete(__p);
        }
      }
      __cxa_end_catch();
      JUMPOUT(0x2369D93ECLL);
    }
    std::__optional_destruct_base<applesauce::CF::URLRef,false>::~__optional_destruct_base[abi:ne180100](v21 - 80);
    _Unwind_Resume(a1);
  }
  __cxa_free_exception(v19);
  goto LABEL_8;
}

void applesauce::CF::DictionaryRef::~DictionaryRef(const void **this)
{
  uint64_t v1 = *this;
  if (v1) {
    CFRelease(v1);
  }
}

void nlp::CFScopedPtr<__CFBundle *>::acquire(const void **a1, CFTypeRef cf)
{
  if (*a1 != cf)
  {
    CFRetain(cf);
    nlp::CFScopedPtr<__CFBundle *>::reset(a1, cf);
  }
}

__n128 std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>@<Q0>(const char *a1@<X0>, std::string *a2@<X1>, std::string *a3@<X8>)
{
  size_t v6 = strlen(a1);
  CFBundleRef v7 = (__n128 *)std::string::insert(a2, 0, a1, v6);
  __n128 result = *v7;
  *a3 = *(std::string *)v7->n128_u8;
  v7->n128_u64[0] = 0;
  v7->n128_u64[1] = 0;
  v7[1].n128_u64[0] = 0;
  return result;
}

void nlp::ResourceCreationException::~ResourceCreationException(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)&unk_26E9DA080;
  if (SHIBYTE(this[3].__vftable) < 0) {
    operator delete(this[1].__vftable);
  }

  std::exception::~exception(this);
}

{
  uint64_t vars8;

  this->__vftable = (std::exception_vtbl *)&unk_26E9DA080;
  if (SHIBYTE(this[3].__vftable) < 0) {
    operator delete(this[1].__vftable);
  }
  std::exception::~exception(this);

  JUMPOUT(0x237E08BB0);
}

void InputTranscoder::DecoderConfiguration::~DecoderConfiguration(void **this)
{
  if (*((char *)this + 151) < 0) {
    operator delete(this[16]);
  }
  if (*((char *)this + 127) < 0) {
    operator delete(this[13]);
  }
  if (*((char *)this + 79) < 0) {
    operator delete(this[7]);
  }
  if (*((char *)this + 55) < 0) {
    operator delete(this[4]);
  }
  if (*((char *)this + 23) < 0) {
    operator delete(*this);
  }
}

uint64_t ITDecoderClearNeuralNetworkBuffer()
{
  if (_nlpSignpostLog::token != -1) {
    dispatch_once(&_nlpSignpostLog::token, &__block_literal_global_3);
  }
  v0 = (id)_nlpSignpostLog::log;
  os_signpost_id_t v1 = os_signpost_id_generate(v0);

  if (_nlpSignpostLog::token != -1) {
    dispatch_once(&_nlpSignpostLog::token, &__block_literal_global_3);
  }
  CFTypeID v2 = (id)_nlpSignpostLog::log;
  CFAllocatorRef v3 = v2;
  if (v1 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)CFTypeID v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_2369D6000, v3, OS_SIGNPOST_EVENT, v1, "ITDecoderClearNeuralNetworkBuffer", (const char *)&unk_236A08912, v5, 2u);
  }

  return MRLNeuralNetworkClear();
}

char *ITDecoderSetLinguisticContext(char *result, char *a2, unint64_t a3)
{
  uint64_t v3 = *(void *)(*((void *)result + 3) + 184);
  if (v3) {
    return std::vector<unsigned int>::__assign_with_size[abi:ne180100]<std::__wrap_iter<unsigned int const*>,std::__wrap_iter<unsigned int const*>>((char *)(v3 + 40), a2, (uint64_t)&a2[4 * a3], a3);
  }
  return result;
}

void ITDecoderEnumerateCandidates(uint64_t a1, unsigned int *a2, unint64_t a3, void *a4)
{
  v14[4] = *MEMORY[0x263EF8340];
  unint64_t ptr = a3;
  id v12 = a4;
  if (_nlpSignpostLog::token != -1) {
    dispatch_once(&_nlpSignpostLog::token, &__block_literal_global_3);
  }
  size_t v6 = (id)_nlpSignpostLog::log;
  os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v6, &ptr);

  if (_nlpSignpostLog::token != -1) {
    dispatch_once(&_nlpSignpostLog::token, &__block_literal_global_3);
  }
  CFURLRef v8 = (id)_nlpSignpostLog::log;
  CFNumberRef v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2369D6000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "ITDecoderEnumerateCandidates", (const char *)&unk_236A08912, buf, 2u);
  }

  *(void *)buf = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFNumberRef v10 = *(InputTranscoder::CTCDecoder **)(a1 + 24);
  v14[0] = &unk_26E9D9F58;
  v14[1] = &v12;
  v14[3] = v14;
  InputTranscoder::DecoderImpl::enumerateCandidates(v10, a2, ptr);
}

void sub_2369D9C38(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, char a14)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void ITDecoderEnumerateCandidatesWithOptions(uint64_t a1, unsigned int *a2, unint64_t a3, uint64_t a4, void *a5)
{
  v15[4] = *MEMORY[0x263EF8340];
  unint64_t ptr = a3;
  id v13 = a5;
  if (_nlpSignpostLog::token != -1) {
    dispatch_once(&_nlpSignpostLog::token, &__block_literal_global_3);
  }
  os_signpost_id_t v7 = (id)_nlpSignpostLog::log;
  os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, &ptr);

  if (_nlpSignpostLog::token != -1) {
    dispatch_once(&_nlpSignpostLog::token, &__block_literal_global_3);
  }
  CFNumberRef v9 = (id)_nlpSignpostLog::log;
  CFNumberRef v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)id v12 = 0;
    _os_signpost_emit_with_name_impl(&dword_2369D6000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "ITDecoderEnumerateCandidates", (const char *)&unk_236A08912, v12, 2u);
  }

  BOOL v11 = *(InputTranscoder::CTCDecoder **)(a1 + 24);
  v15[0] = &unk_26E9D9FE8;
  v15[1] = &v13;
  v15[3] = v15;
  InputTranscoder::DecoderImpl::enumerateCandidates(v11, a2, ptr);
}

void sub_2369D9E94(_Unwind_Exception *a1, uint64_t a2, void *a3, uint64_t a4, ...)
{
  va_start(va, a4);
  std::__function::__value_func<void ()(std::unique_ptr<InputTranscoder::CandidateImpl>,BOOL &)>::~__value_func[abi:ne180100]((uint64_t *)va);

  _Unwind_Resume(a1);
}

void std::__throw_bad_optional_access[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = MEMORY[0x263F8C3B0] + 16;
  __cxa_throw(exception, MEMORY[0x263F8C200], MEMORY[0x263F8C088]);
}

void *nlp::ResourceCreationException::ResourceCreationException(void *a1, long long *a2)
{
  *a1 = &unk_26E9DA080;
  uint64_t v3 = (std::string *)(a1 + 1);
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v3, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v4 = *a2;
    v3->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&v3->__r_.__value_.__l.__data_ = v4;
  }
  return a1;
}

void sub_2369D9F6C(_Unwind_Exception *a1)
{
  std::exception::~exception(v1);
  _Unwind_Resume(a1);
}

uint64_t nlp::ResourceCreationException::what(nlp::ResourceCreationException *this)
{
  uint64_t result = (uint64_t)this + 8;
  if (*((char *)this + 31) < 0) {
    return *(void *)result;
  }
  return result;
}

const void *InputTranscoder::getOptionalCFType<__CFString const*>(const __CFDictionary *a1, const __CFString *a2, const void *a3)
{
  Value = CFDictionaryGetValue(a1, a2);
  if (Value)
  {
    size_t v6 = Value;
    CFTypeID v7 = CFGetTypeID(Value);
    a3 = v6;
    if (v7 != CFStringGetTypeID())
    {
      exception = __cxa_allocate_exception(0x20uLL);
      std::string::basic_string[abi:ne180100]<0>(v10, "Malformed dictionary: invalid type for key=");
      InputTranscoder::makeDictionaryErrorMessage(a2, (uint64_t)v10, &v11);
      nlp::ResourceCreationException::ResourceCreationException(exception, (long long *)&v11);
    }
  }
  return a3;
}

void sub_2369DA0D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  if (a14 < 0)
  {
    operator delete(a9);
    if ((v21 & 1) == 0) {
LABEL_8:
    }
      _Unwind_Resume(a1);
  }
  else if (!v21)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v20);
  goto LABEL_8;
}

void InputTranscoder::makeDictionaryErrorMessage(const __CFString *this@<X1>, uint64_t a2@<X0>, std::string *a3@<X8>)
{
  nlp::getUTF8StringFromCFString(this, &v9);
  int v5 = *(char *)(a2 + 23);
  if (v5 >= 0) {
    size_t v6 = (const std::string::value_type *)a2;
  }
  else {
    size_t v6 = *(const std::string::value_type **)a2;
  }
  if (v5 >= 0) {
    std::string::size_type v7 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    std::string::size_type v7 = *(void *)(a2 + 8);
  }
  os_signpost_id_t v8 = std::string::insert(&v9, 0, v6, v7);
  *a3 = *v8;
  v8->__r_.__value_.__l.__size_ = 0;
  v8->__r_.__value_.__r.__words[2] = 0;
  v8->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v9.__r_.__value_.__l.__data_);
  }
}

void sub_2369DA1B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__optional_destruct_base<applesauce::CF::URLRef,false>::~__optional_destruct_base[abi:ne180100](uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8))
  {
    CFTypeID v2 = *(const void **)a1;
    if (*(void *)a1) {
      CFRelease(v2);
    }
  }
  return a1;
}

void nlp::CFScopedPtr<__CFBundle *>::reset(const void **a1, const void *a2)
{
  long long v4 = *a1;
  if (v4) {
    CFRelease(v4);
  }
  *a1 = a2;
}

void *std::allocate_shared[abi:ne180100]<InputTranscoder::PlistBiMap<unsigned int,unsigned int> const,std::allocator<InputTranscoder::PlistBiMap<unsigned int,unsigned int> const>,std::string const&,void>@<X0>(uint64_t a1@<X1>, void *a2@<X8>)
{
  long long v4 = operator new(0x78uLL);
  uint64_t result = std::__shared_ptr_emplace<InputTranscoder::PlistBiMap<unsigned int,unsigned int> const,std::allocator<InputTranscoder::PlistBiMap<unsigned int,unsigned int> const>>::__shared_ptr_emplace[abi:ne180100]<std::string const&,std::allocator<InputTranscoder::PlistBiMap<unsigned int,unsigned int> const>,0>(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  return result;
}

void sub_2369DA28C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::__shared_ptr_emplace<InputTranscoder::PlistBiMap<unsigned int,unsigned int> const,std::allocator<InputTranscoder::PlistBiMap<unsigned int,unsigned int> const>>::__shared_ptr_emplace[abi:ne180100]<std::string const&,std::allocator<InputTranscoder::PlistBiMap<unsigned int,unsigned int> const>,0>(void *a1, uint64_t a2)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &unk_26E9D9F08;
  InputTranscoder::PlistBiMap<unsigned int,unsigned int>::PlistBiMap((uint64_t)(a1 + 3), a2);
  return a1;
}

void sub_2369DA2E8(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<InputTranscoder::PlistBiMap<unsigned int,unsigned int> const,std::allocator<InputTranscoder::PlistBiMap<unsigned int,unsigned int> const>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E9D9F08;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<InputTranscoder::PlistBiMap<unsigned int,unsigned int> const,std::allocator<InputTranscoder::PlistBiMap<unsigned int,unsigned int> const>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E9D9F08;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x237E08BB0);
}

uint64_t std::__shared_ptr_emplace<InputTranscoder::PlistBiMap<unsigned int,unsigned int> const,std::allocator<InputTranscoder::PlistBiMap<unsigned int,unsigned int> const>>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void std::__function::__func<ITDecoderEnumerateCandidates::$_0,std::allocator<ITDecoderEnumerateCandidates::$_0>,void ()(std::unique_ptr<InputTranscoder::CandidateImpl>,BOOL &)>::~__func()
{
}

void *std::__function::__func<ITDecoderEnumerateCandidates::$_0,std::allocator<ITDecoderEnumerateCandidates::$_0>,void ()(std::unique_ptr<InputTranscoder::CandidateImpl>,BOOL &)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = &unk_26E9D9F58;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<ITDecoderEnumerateCandidates::$_0,std::allocator<ITDecoderEnumerateCandidates::$_0>,void ()(std::unique_ptr<InputTranscoder::CandidateImpl>,BOOL &)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26E9D9F58;
  a2[1] = v2;
  return result;
}

void std::__function::__func<ITDecoderEnumerateCandidates::$_0,std::allocator<ITDecoderEnumerateCandidates::$_0>,void ()(std::unique_ptr<InputTranscoder::CandidateImpl>,BOOL &)>::operator()(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  *a2 = 0;
  v7[0] = 0;
  CFAllocatorGetDefault();
  _CFGetTypeID_Candidate();
  Instance = (void *)_CFRuntimeCreateInstance();
  uint64_t v5 = Instance[3];
  Instance[3] = v3;
  if (v5) {
    std::default_delete<InputTranscoder::CandidateImpl>::operator()[abi:ne180100]((uint64_t)(Instance + 3), v5);
  }
  v7[1] = 0;
  (*(void (**)(void))(**(void **)(a1 + 8) + 16))();
  CFRelease(Instance);
  uint64_t v6 = v7[0];
  v7[0] = 0;
  if (v6) {
    std::default_delete<InputTranscoder::CandidateImpl>::operator()[abi:ne180100]((uint64_t)v7, v6);
  }
}

void sub_2369DA4D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  CFRelease(v10);
  uint64_t v12 = a9;
  a9 = 0;
  if (v12) {
    std::default_delete<InputTranscoder::CandidateImpl>::operator()[abi:ne180100]((uint64_t)&a9, v12);
  }
  _Unwind_Resume(a1);
}

uint64_t std::__function::__func<ITDecoderEnumerateCandidates::$_0,std::allocator<ITDecoderEnumerateCandidates::$_0>,void ()(std::unique_ptr<InputTranscoder::CandidateImpl>,BOOL &)>::target(uint64_t a1, uint64_t a2)
{
    return a1 + 8;
  else {
    return 0;
  }
}

void *std::__function::__func<ITDecoderEnumerateCandidates::$_0,std::allocator<ITDecoderEnumerateCandidates::$_0>,void ()(std::unique_ptr<InputTranscoder::CandidateImpl>,BOOL &)>::target_type()
{
}

void *std::__function::__value_func<void ()(std::unique_ptr<InputTranscoder::CandidateImpl>,BOOL &)>::~__value_func[abi:ne180100](void *a1)
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

void std::__function::__func<ITDecoderEnumerateCandidatesWithOptions::$_0,std::allocator<ITDecoderEnumerateCandidatesWithOptions::$_0>,void ()(std::unique_ptr<InputTranscoder::CandidateImpl>,BOOL &)>::~__func()
{
}

void *std::__function::__func<ITDecoderEnumerateCandidatesWithOptions::$_0,std::allocator<ITDecoderEnumerateCandidatesWithOptions::$_0>,void ()(std::unique_ptr<InputTranscoder::CandidateImpl>,BOOL &)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = &unk_26E9D9FE8;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<ITDecoderEnumerateCandidatesWithOptions::$_0,std::allocator<ITDecoderEnumerateCandidatesWithOptions::$_0>,void ()(std::unique_ptr<InputTranscoder::CandidateImpl>,BOOL &)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26E9D9FE8;
  a2[1] = v2;
  return result;
}

void std::__function::__func<ITDecoderEnumerateCandidatesWithOptions::$_0,std::allocator<ITDecoderEnumerateCandidatesWithOptions::$_0>,void ()(std::unique_ptr<InputTranscoder::CandidateImpl>,BOOL &)>::operator()(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  *a2 = 0;
  v7[0] = 0;
  CFAllocatorGetDefault();
  _CFGetTypeID_Candidate();
  Instance = (void *)_CFRuntimeCreateInstance();
  uint64_t v5 = Instance[3];
  Instance[3] = v3;
  if (v5) {
    std::default_delete<InputTranscoder::CandidateImpl>::operator()[abi:ne180100]((uint64_t)(Instance + 3), v5);
  }
  v7[1] = 0;
  (*(void (**)(void))(**(void **)(a1 + 8) + 16))();
  CFRelease(Instance);
  uint64_t v6 = v7[0];
  v7[0] = 0;
  if (v6) {
    std::default_delete<InputTranscoder::CandidateImpl>::operator()[abi:ne180100]((uint64_t)v7, v6);
  }
}

void sub_2369DA730(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  CFRelease(v10);
  uint64_t v12 = a9;
  a9 = 0;
  if (v12) {
    std::default_delete<InputTranscoder::CandidateImpl>::operator()[abi:ne180100]((uint64_t)&a9, v12);
  }
  _Unwind_Resume(a1);
}

uint64_t std::__function::__func<ITDecoderEnumerateCandidatesWithOptions::$_0,std::allocator<ITDecoderEnumerateCandidatesWithOptions::$_0>,void ()(std::unique_ptr<InputTranscoder::CandidateImpl>,BOOL &)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<ITDecoderEnumerateCandidatesWithOptions::$_0,std::allocator<ITDecoderEnumerateCandidatesWithOptions::$_0>,void ()(std::unique_ptr<InputTranscoder::CandidateImpl>,BOOL &)>::target_type()
{
}

void InputTranscoder::LexiconContainer::addLexicon(void *a1, CFTypeRef cf, int a3)
{
  CFTypeRef v6 = CFRetain(cf);
  CFTypeRef v7 = v6;
  std::string v9 = (const void **)a1[3];
  unint64_t v8 = a1[4];
  if ((unint64_t)v9 >= v8)
  {
    std::string v11 = (void *)a1[2];
    uint64_t v12 = v9 - (const void **)v11;
    unint64_t v13 = v12 + 1;
    if ((unint64_t)(v12 + 1) >> 61) {
      std::vector<InputTranscoder::InputFeature>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v14 = v8 - (void)v11;
    if (v14 >> 2 > v13) {
      unint64_t v13 = v14 >> 2;
    }
    if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v15 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v15 = v13;
    }
    if (v15)
    {
      if (v15 >> 61) {
        goto LABEL_42;
      }
      unint64_t v16 = (char *)operator new(8 * v15);
    }
    else
    {
      unint64_t v16 = 0;
    }
    unint64_t v17 = &v16[8 * v12];
    v18 = &v16[8 * v15];
    *(void *)unint64_t v17 = v7;
    CFNumberRef v10 = v17 + 8;
    if (v9 == v11)
    {
      a1[2] = v17;
      a1[3] = v10;
      a1[4] = v18;
    }
    else
    {
      do
      {
        uint64_t v19 = (uint64_t)*--v9;
        NSObject *v9 = 0;
        *((void *)v17 - 1) = v19;
        v17 -= 8;
      }
      while (v9 != v11);
      std::string v9 = (const void **)a1[2];
      int v20 = (const void **)a1[3];
      a1[2] = v17;
      a1[3] = v10;
      a1[4] = v18;
      while (v20 != v9)
        nlp::CFScopedPtr<_LXLexicon const*>::reset(--v20, 0);
    }
    if (v9) {
      operator delete(v9);
    }
  }
  else
  {
    NSObject *v9 = v6;
    CFNumberRef v10 = v9 + 1;
  }
  a1[3] = v10;
  if (a3) {
    return;
  }
  v22 = (void *)a1[6];
  unint64_t v21 = a1[7];
  if ((unint64_t)v22 >= v21)
  {
    v24 = (void *)a1[5];
    uint64_t v25 = v22 - v24;
    unint64_t v26 = v25 + 1;
    if ((unint64_t)(v25 + 1) >> 61) {
      std::vector<InputTranscoder::InputFeature>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v27 = v21 - (void)v24;
    if (v27 >> 2 > v26) {
      unint64_t v26 = v27 >> 2;
    }
    if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v28 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v28 = v26;
    }
    if (!v28)
    {
      v29 = 0;
      goto LABEL_34;
    }
    if (!(v28 >> 61))
    {
      v29 = (char *)operator new(8 * v28);
LABEL_34:
      v30 = &v29[8 * v25];
      *(void *)v30 = cf;
      long long v23 = v30 + 8;
      if (v22 != v24)
      {
        do
        {
          uint64_t v31 = *--v22;
          *((void *)v30 - 1) = v31;
          v30 -= 8;
        }
        while (v22 != v24);
        v22 = (void *)a1[5];
      }
      a1[5] = v30;
      a1[6] = v23;
      a1[7] = &v29[8 * v28];
      if (v22) {
        operator delete(v22);
      }
      goto LABEL_39;
    }
LABEL_42:
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  void *v22 = cf;
  long long v23 = v22 + 1;
LABEL_39:
  a1[6] = v23;
}

void InputTranscoder::LexiconContainer::createRootCursors(InputTranscoder::LexiconContainer *this@<X0>, char **a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  uint64_t v2 = (void *)*((void *)this + 2);
  uint64_t v3 = (void *)*((void *)this + 3);
  if (v2 != v3)
  {
    uint64_t v6 = (uint64_t)(a2 + 2);
    do
    {
      uint64_t RootCursor = LXLexiconCreateRootCursor();
      unint64_t v8 = (const void *)RootCursor;
      std::string v9 = (void *)*((void *)this + 5);
      CFNumberRef v10 = (void *)*((void *)this + 6);
      if (v9 != v10)
      {
        while (*v9 != *v2)
        {
          if (++v9 == v10)
          {
            std::string v9 = (void *)*((void *)this + 6);
            break;
          }
        }
      }
      BOOL v11 = v9 == v10;
      if (*((char *)this + 87) < 0)
      {
        if (!*((void *)this + 9))
        {
LABEL_14:
          unint64_t v18 = (unint64_t)a2[1];
          unint64_t v17 = (unint64_t)a2[2];
          if (v18 >= v17)
          {
            uint64_t v32 = (uint64_t)(v18 - (void)*a2) >> 4;
            unint64_t v33 = v32 + 1;
            if ((unint64_t)(v32 + 1) >> 60) {
              std::vector<InputTranscoder::InputFeature>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v34 = v17 - (void)*a2;
            if (v34 >> 3 > v33) {
              unint64_t v33 = v34 >> 3;
            }
            if ((unint64_t)v34 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v35 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v35 = v33;
            }
            uint64_t v49 = v6;
            v36 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<nlp::CFScopedPtr<_LXCursor const*>,BOOL>>>(v6, v35);
            v38 = &v36[16 * v32];
            *(void *)v38 = v8;
            v38[8] = v11;
            v40 = *a2;
            unint64_t v39 = (unint64_t)a2[1];
            if ((char *)v39 == *a2)
            {
              int64x2_t v43 = vdupq_n_s64(v39);
              v41 = &v36[16 * v32];
            }
            else
            {
              v41 = &v36[16 * v32];
              do
              {
                uint64_t v42 = *(void *)(v39 - 16);
                v39 -= 16;
                *(void *)unint64_t v39 = 0;
                *((void *)v41 - 2) = v42;
                v41 -= 16;
                v41[8] = *(unsigned char *)(v39 + 8);
              }
              while ((char *)v39 != v40);
              int64x2_t v43 = *(int64x2_t *)a2;
            }
            uint64_t v19 = v38 + 16;
            *a2 = v41;
            a2[1] = v38 + 16;
            int64x2_t v47 = v43;
            v45 = a2[2];
            a2[2] = &v36[16 * v37];
            v48 = v45;
            uint64_t v46 = v43.i64[0];
            std::__split_buffer<std::pair<nlp::CFScopedPtr<_LXCursor const*>,BOOL>>::~__split_buffer((uint64_t)&v46);
          }
          else
          {
            *(void *)unint64_t v18 = RootCursor;
            *(unsigned char *)(v18 + 8) = v11;
            uint64_t v19 = (char *)(v18 + 16);
          }
          a2[1] = v19;
          goto LABEL_44;
        }
      }
      else if (!*((unsigned char *)this + 87))
      {
        goto LABEL_14;
      }
      uint64_t v12 = LXCursorCreateByAdvancingWithUTF8();
      uint64_t v13 = v12;
      if (v12)
      {
        unint64_t v15 = (unint64_t)a2[1];
        unint64_t v14 = (unint64_t)a2[2];
        if (v15 >= v14)
        {
          uint64_t v20 = (uint64_t)(v15 - (void)*a2) >> 4;
          unint64_t v21 = v20 + 1;
          if ((unint64_t)(v20 + 1) >> 60) {
            std::vector<InputTranscoder::InputFeature>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v22 = v14 - (void)*a2;
          if (v22 >> 3 > v21) {
            unint64_t v21 = v22 >> 3;
          }
          if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v23 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v23 = v21;
          }
          uint64_t v49 = v6;
          v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<nlp::CFScopedPtr<_LXCursor const*>,BOOL>>>(v6, v23);
          unint64_t v26 = &v24[16 * v20];
          *(void *)unint64_t v26 = v13;
          v26[8] = v11;
          unint64_t v28 = *a2;
          unint64_t v27 = (unint64_t)a2[1];
          if ((char *)v27 == *a2)
          {
            int64x2_t v31 = vdupq_n_s64(v27);
            v29 = &v24[16 * v20];
          }
          else
          {
            v29 = &v24[16 * v20];
            do
            {
              uint64_t v30 = *(void *)(v27 - 16);
              v27 -= 16;
              *(void *)unint64_t v27 = 0;
              *((void *)v29 - 2) = v30;
              v29 -= 16;
              v29[8] = *(unsigned char *)(v27 + 8);
            }
            while ((char *)v27 != v28);
            int64x2_t v31 = *(int64x2_t *)a2;
          }
          unint64_t v16 = v26 + 16;
          *a2 = v29;
          a2[1] = v26 + 16;
          int64x2_t v47 = v31;
          v44 = a2[2];
          a2[2] = &v24[16 * v25];
          v48 = v44;
          uint64_t v46 = v31.i64[0];
          std::__split_buffer<std::pair<nlp::CFScopedPtr<_LXCursor const*>,BOOL>>::~__split_buffer((uint64_t)&v46);
        }
        else
        {
          *(void *)unint64_t v15 = v12;
          *(unsigned char *)(v15 + 8) = v11;
          unint64_t v16 = (char *)(v15 + 16);
        }
        a2[1] = v16;
      }
      if (v8) {
        CFRelease(v8);
      }
LABEL_44:
      ++v2;
    }
    while (v2 != v3);
  }
}

void sub_2369DAC78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va1, a3);
  va_start(va, a3);
  long long v4 = va_arg(va1, void **);
  uint64_t v6 = va_arg(va1, void);
  nlp::CFScopedPtr<_LXCursor const*>::reset((const void **)va, 0);
  nlp::CFScopedPtr<_LXCursor const*>::reset((const void **)va1, 0);
  std::vector<std::pair<nlp::CFScopedPtr<_LXCursor const*>,BOOL>>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

uint64_t InputTranscoder::LexiconContainer::createAdvancedCursor(void *a1, uint64_t a2, int a3)
{
  int v4 = a3;
  (*(void (**)(void, int *))(*(void *)*a1 + 32))(*a1, &v4);
  return LXCursorCreateByAdvancingWithUTF8();
}

BOOL InputTranscoder::LexiconContainer::isPresentInLexicon(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2000000000;
  char v14 = 0;
  CFStringRef CFStringFromString = nlp::createCFStringFromString(a2);
  CFStringRef v4 = CFStringFromString;
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = *(void *)(a1 + 24);
  if (v5 == v6)
  {
    BOOL v8 = 0;
    if (!CFStringFromString) {
      goto LABEL_12;
    }
LABEL_11:
    CFRelease(v4);
    goto LABEL_12;
  }
  uint64_t v7 = v5 + 8;
  do
  {
    LXLexiconEnumerateEntriesForString();
    BOOL v8 = *((unsigned char *)v12 + 24) != 0;
    if (*((unsigned char *)v12 + 24)) {
      BOOL v9 = 1;
    }
    else {
      BOOL v9 = v7 == v6;
    }
    v7 += 8;
  }
  while (!v9);
  if (v4) {
    goto LABEL_11;
  }
LABEL_12:
  _Block_object_dispose(&v11, 8);
  return v8;
}

void sub_2369DAE80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ___ZN15InputTranscoder16LexiconContainer18isPresentInLexiconERKNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEE_block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  CFStringRef v5 = (const __CFString *)LXEntryCopyString();
  CFStringRef v8 = v5;
  nlp::getUTF8StringFromCFString(v5, &__p);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  *a3 = 1;
  if (v7 < 0)
  {
    operator delete(__p);
    if (!v5) {
      return;
    }
    goto LABEL_5;
  }
  if (v5) {
LABEL_5:
  }
    CFRelease(v5);
}

void sub_2369DAF34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

const void **std::vector<nlp::CFScopedPtr<_LXLexicon const*>>::erase(uint64_t a1, const void **a2, const void **a3)
{
  if (a2 != a3)
  {
    std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,nlp::CFScopedPtr<_LXLexicon const*> *,nlp::CFScopedPtr<_LXLexicon const*> *,nlp::CFScopedPtr<_LXLexicon const*> *,0>(a3, *(const void ***)(a1 + 8), a2);
    uint64_t v6 = v5;
    char v7 = *(const void ***)(a1 + 8);
    if (v7 != v5)
    {
      do
        nlp::CFScopedPtr<_LXLexicon const*>::reset(--v7, 0);
      while (v7 != v6);
    }
    *(void *)(a1 + 8) = v6;
  }
  return a2;
}

const void **std::remove[abi:ne180100]<std::__wrap_iter<nlp::CFScopedPtr<_LXLexicon const*> *>,_LXLexicon const*>(const void **a1, const void **a2, const void **a3)
{
  if (a1 == a2)
  {
LABEL_5:
    CFStringRef v5 = a2;
  }
  else
  {
    CFStringRef v5 = a1;
    while (*v5 != *a3)
    {
      if (++v5 == a2) {
        goto LABEL_5;
      }
    }
  }
  if (v5 != a2)
  {
    for (uint64_t i = v5 + 1; i != a2; ++i)
    {
      char v7 = *i;
      if (*i != *a3)
      {
        *uint64_t i = 0;
        nlp::CFScopedPtr<_LXLexicon const*>::reset(v5++, v7);
      }
    }
  }
  return v5;
}

const void **std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,nlp::CFScopedPtr<_LXLexicon const*> *,nlp::CFScopedPtr<_LXLexicon const*> *,nlp::CFScopedPtr<_LXLexicon const*> *,0>(const void **a1, const void **a2, const void **a3)
{
  CFStringRef v4 = a1;
  if (a1 != a2)
  {
    do
    {
      uint64_t v6 = *v4;
      *v4++ = 0;
      nlp::CFScopedPtr<_LXLexicon const*>::reset(a3++, v6);
    }
    while (v4 != a2);
    return a2;
  }
  return v4;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<nlp::CFScopedPtr<_LXCursor const*>,BOOL>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(16 * a2);
}

uint64_t std::__split_buffer<std::pair<nlp::CFScopedPtr<_LXCursor const*>,BOOL>>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 16;
    nlp::CFScopedPtr<_LXCursor const*>::reset((const void **)(i - 16), 0);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::vector<std::pair<nlp::CFScopedPtr<_LXCursor const*>,BOOL>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  os_signpost_id_t v1 = *a1;
  uint64_t v2 = (const void **)**a1;
  if (v2)
  {
    CFStringRef v4 = (const void **)v1[1];
    CFStringRef v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 2;
        nlp::CFScopedPtr<_LXCursor const*>::reset(v4, 0);
      }
      while (v4 != v2);
      CFStringRef v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void nlp::CFScopedPtr<_LXCursor const*>::reset(const void **a1, const void *a2)
{
  CFStringRef v4 = *a1;
  if (v4) {
    CFRelease(v4);
  }
  *a1 = a2;
}

void InputTranscoder::RecognizerFactory::makeRecognizer(_DWORD *a1)
{
  switch(*a1)
  {
    case 0:
      operator new();
    case 1:
      operator new();
    case 2:
    case 3:
    case 4:
      operator new();
    default:
      exception = __cxa_allocate_exception(0x20uLL);
      std::string::basic_string[abi:ne180100]<0>(&v2, "Recognizer not implemented for anything other than RNN and CRNN");
      nlp::ResourceCreationException::ResourceCreationException(exception, &v2);
  }
}

void sub_2369DB358(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
  {
    operator delete(__p);
    if ((v16 & 1) == 0) {
LABEL_6:
    }
      _Unwind_Resume(a1);
  }
  else if (!v16)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v15);
  goto LABEL_6;
}

uint64_t InputTranscoder::InputProcessor::InputProcessor(uint64_t a1, InputTranscoder::PathKeyLayoutProcessor *this, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  *(void *)(a1 + 48) = a3;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  if (*(char *)(a5 + 23) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a5, *(void *)(a5 + 8));
  }
  else {
    std::string __p = *(std::string *)a5;
  }
  InputTranscoder::InputProcessor::processInput((void **)a1, this, a4, (char *)&__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return a1;
}

void sub_2369DB448(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15)
{
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a15);
  unint64_t v17 = *(void **)(v15 + 24);
  if (v17)
  {
    *(void *)(v15 + 32) = v17;
    operator delete(v17);
  }
  unint64_t v18 = *(void **)v15;
  if (*(void *)v15)
  {
    *(void *)(v15 + 8) = v18;
    operator delete(v18);
  }
  _Unwind_Resume(a1);
}

void InputTranscoder::InputProcessor::processInput(void **a1, InputTranscoder::PathKeyLayoutProcessor *this, uint64_t a3, char *a4)
{
  InputTranscoder::PathKeyLayoutProcessor::input_stream_for_path(this, (const InputTranscoder::Path *)a1[6], 0, *(_DWORD *)(a3 + 372), *(unsigned __int8 *)(a3 + 361), (int **)__src);
  CFStringRef v8 = (char *)*a1;
  if (*a1)
  {
    a1[1] = v8;
    operator delete(v8);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
  *(_OWORD *)a1 = *(_OWORD *)__src;
  a1[2] = v70;
  int v9 = *(_DWORD *)(a3 + 80);
  if ((v9 - 3) < 2)
  {
    __src[0] = 0;
    __src[1] = 0;
    v70 = 0;
    if (a4[23] < 0)
    {
      v48 = a4;
      a4 = *(char **)a4;
      uint64_t v19 = *((void *)v48 + 1);
      if (v19) {
        goto LABEL_16;
      }
    }
    else
    {
      uint64_t v19 = a4[23];
      if (a4[23])
      {
LABEL_16:
        unint64_t v20 = *(int *)(a3 + 372);
        unint64_t v21 = &a4[v19];
        while (1)
        {
          unsigned int v22 = __tolower(*a4);
          char v23 = v22;
          if (v22 <= 0x7F)
          {
            if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v22 + 60) & 0x4000) != 0)
            {
LABEL_19:
              std::string::basic_string[abi:ne180100]<0>(v65, "space");
              uint64_t v24 = *(unsigned int *)(*(uint64_t (**)(void, void *))(**((void **)this + 1) + 32))(*((void *)this + 1), v65);
              if (v66 < 0)
              {
                uint64_t v25 = (void **)v65;
LABEL_24:
                operator delete(*v25);
                goto LABEL_25;
              }
              goto LABEL_25;
            }
          }
          else if (__maskrune(v22, 0x4000uLL))
          {
            goto LABEL_19;
          }
          char v64 = 1;
          v63[0] = v23;
          v63[1] = 0;
          uint64_t v24 = *(unsigned int *)(*(uint64_t (**)(void, unsigned char *))(**((void **)this + 1) + 32))(*((void *)this + 1), v63);
          if (v64 < 0)
          {
            uint64_t v25 = (void **)v63;
            goto LABEL_24;
          }
LABEL_25:
          unint64_t v27 = (char *)__src[1];
          unint64_t v26 = v70;
          if (__src[1] >= v70)
          {
            v29 = (char *)__src[0];
            int64_t v30 = ((char *)__src[1] - (char *)__src[0]) >> 2;
            unint64_t v31 = v30 + 1;
            if ((unint64_t)(v30 + 1) >> 62) {
              goto LABEL_92;
            }
            uint64_t v32 = v70 - (char *)__src[0];
            if ((v70 - (char *)__src[0]) >> 1 > v31) {
              unint64_t v31 = v32 >> 1;
            }
            if ((unint64_t)v32 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v33 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v33 = v31;
            }
            if (v33)
            {
              uint64_t v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v70, v33);
              v29 = (char *)__src[0];
              unint64_t v27 = (char *)__src[1];
            }
            else
            {
              uint64_t v34 = 0;
            }
            unint64_t v35 = &v34[4 * v30];
            *(_DWORD *)unint64_t v35 = v24;
            unint64_t v28 = v35 + 4;
            while (v27 != v29)
            {
              int v36 = *((_DWORD *)v27 - 1);
              v27 -= 4;
              *((_DWORD *)v35 - 1) = v36;
              v35 -= 4;
            }
            unint64_t v26 = &v34[4 * v33];
            __src[0] = v35;
            __src[1] = v28;
            v70 = v26;
            if (v29)
            {
              operator delete(v29);
              unint64_t v26 = v70;
            }
          }
          else
          {
            *(_DWORD *)__src[1] = v24;
            unint64_t v28 = v27 + 4;
          }
          __src[1] = v28;
          if (v28 >= v26)
          {
            v38 = (char *)__src[0];
            uint64_t v39 = (v28 - (char *)__src[0]) >> 2;
            unint64_t v40 = v39 + 1;
            if ((unint64_t)(v39 + 1) >> 62) {
LABEL_92:
            }
              std::vector<float>::__throw_length_error[abi:ne180100]();
            uint64_t v41 = v26 - (char *)__src[0];
            if (v41 >> 1 > v40) {
              unint64_t v40 = v41 >> 1;
            }
            if ((unint64_t)v41 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v42 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v42 = v40;
            }
            if (v42)
            {
              int64x2_t v43 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v70, v42);
              v38 = (char *)__src[0];
              unint64_t v28 = (char *)__src[1];
            }
            else
            {
              int64x2_t v43 = 0;
            }
            v44 = &v43[4 * v39];
            *(_DWORD *)v44 = v24;
            uint64_t v37 = v44 + 4;
            while (v28 != v38)
            {
              int v45 = *((_DWORD *)v28 - 1);
              v28 -= 4;
              *((_DWORD *)v44 - 1) = v45;
              v44 -= 4;
            }
            __src[0] = v44;
            __src[1] = v37;
            v70 = &v43[4 * v42];
            if (v38) {
              operator delete(v38);
            }
          }
          else
          {
            *(_DWORD *)unint64_t v28 = v24;
            uint64_t v37 = v28 + 4;
          }
          __src[1] = v37;
          LODWORD(v62[0]) = 0;
          std::vector<float>::vector(&__p, v20, v62);
          *((_DWORD *)__p + v24) = 1065353216;
          std::vector<std::vector<float>>::push_back[abi:ne180100](a1 + 7, (uint64_t)&__p);
          int v71 = 0;
          std::vector<float>::vector(v62, v20, &v71);
          *((_DWORD *)v62[0] + v24) = 1065353216;
          std::vector<std::vector<float>>::push_back[abi:ne180100](a1 + 7, (uint64_t)v62);
          if (v62[0])
          {
            v62[1] = v62[0];
            operator delete(v62[0]);
          }
          if (__p)
          {
            v68 = (float32x2_t *)__p;
            operator delete(__p);
          }
          if (++a4 == v21)
          {
            uint64_t v46 = (char *)__src[0];
            goto LABEL_68;
          }
        }
      }
    }
    uint64_t v46 = 0;
LABEL_68:
    if (__src == a1)
    {
LABEL_88:
      if (!v46) {
        return;
      }
      __src[1] = v46;
      unint64_t v18 = v46;
      goto LABEL_90;
    }
    uint64_t v49 = (char *)__src[1];
    size_t v50 = (char *)__src[1] - (char *)v46;
    unint64_t v51 = ((char *)__src[1] - (char *)v46) >> 2;
    uint64_t v52 = (uint64_t)a1[2];
    v53 = (char *)*a1;
    if (v51 <= (v52 - (uint64_t)*a1) >> 2)
    {
      v56 = (char *)a1[1];
      unint64_t v57 = (v56 - v53) >> 2;
      if (v57 < v51)
      {
        v58 = &v46[4 * v57];
        if (v56 != v53)
        {
          memmove(*a1, v46, v56 - v53);
          v53 = (char *)a1[1];
        }
        size_t v50 = v49 - v58;
        if (v49 == v58) {
          goto LABEL_87;
        }
        v59 = v53;
        v60 = v58;
        goto LABEL_86;
      }
    }
    else
    {
      if (v53)
      {
        a1[1] = v53;
        operator delete(v53);
        uint64_t v52 = 0;
        *a1 = 0;
        a1[1] = 0;
        a1[2] = 0;
      }
      if ((v50 & 0x8000000000000000) != 0) {
        std::vector<float>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v54 = v52 >> 1;
      if (v52 >> 1 <= v51) {
        uint64_t v54 = v51;
      }
      if ((unint64_t)v52 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v55 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v55 = v54;
      }
      std::vector<float>::__vallocate[abi:ne180100](a1, v55);
      v53 = (char *)a1[1];
    }
    if (v49 == v46)
    {
LABEL_87:
      a1[1] = &v53[v50];
      uint64_t v46 = (char *)__src[0];
      goto LABEL_88;
    }
    v59 = v53;
    v60 = v46;
LABEL_86:
    memmove(v59, v60, v50);
    goto LABEL_87;
  }
  if (v9 == 1)
  {
    InputTranscoder::PathKeyLayoutProcessor::input_stream_for_path(this, (const InputTranscoder::Path *)a1[6], (uint64_t)__src);
    int64x2_t v47 = (char *)a1[3];
    if (v47)
    {
      a1[4] = v47;
      operator delete(v47);
      a1[3] = 0;
      a1[4] = 0;
      a1[5] = 0;
    }
    *(_OWORD *)(a1 + 3) = *(_OWORD *)__src;
    a1[5] = v70;
  }
  else if (v9 == 2)
  {
    uint64_t v10 = *(int *)(a3 + 372);
    (**(void (***)(void **__return_ptr, InputTranscoder::PathKeyLayoutProcessor *, char *, void, uint64_t, void, uint64_t))this)(__src, this, (char *)a1[6], 0, v10, *(unsigned __int8 *)(a3 + 361), v10);
    uint64_t v11 = (unsigned int *)__src[0];
    uint64_t v12 = (unsigned int *)__src[1];
    if (__src[0] != __src[1])
    {
      unint64_t v13 = v10 + 5;
      char v14 = a1 + 7;
      do
      {
        uint64_t v15 = *v11;
        uint64_t v16 = v11[6];
        float64x2_t v61 = *(float64x2_t *)(v11 + 2);
        LODWORD(v62[0]) = 0;
        std::vector<float>::vector(&__p, v13, v62);
        unint64_t v17 = __p;
        *((_DWORD *)__p + v15) = 1065353216;
        v17[v16] = 1065353216;
        v68[-1] = vcvt_f32_f64(v61);
        std::vector<std::vector<float>>::push_back[abi:ne180100](v14, (uint64_t)&__p);
        if (__p)
        {
          v68 = (float32x2_t *)__p;
          operator delete(__p);
        }
        v11 += 8;
      }
      while (v11 != v12);
      uint64_t v11 = (unsigned int *)__src[0];
    }
    if (v11)
    {
      __src[1] = v11;
      unint64_t v18 = v11;
LABEL_90:
      operator delete(v18);
    }
  }
}

void sub_2369DBA5C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, int a16, __int16 a17, char a18, char a19, uint64_t a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,void *__p,uint64_t a30)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<std::vector<float>>::push_back[abi:ne180100](void *result, uint64_t a2)
{
  uint64_t v3 = (char **)result;
  unint64_t v4 = result[2];
  CFStringRef v5 = (void *)result[1];
  if ((unint64_t)v5 >= v4)
  {
    unint64_t v7 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v5 - *result) >> 3);
    unint64_t v8 = v7 + 1;
    if (v7 + 1 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<float>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v9 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v4 - *result) >> 3);
    if (2 * v9 > v8) {
      unint64_t v8 = 2 * v9;
    }
    if (v9 >= 0x555555555555555) {
      unint64_t v8 = 0xAAAAAAAAAAAAAAALL;
    }
    unint64_t v21 = result + 2;
    if (v8 > 0xAAAAAAAAAAAAAAALL) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    uint64_t v10 = 3 * v8;
    uint64_t v11 = (char *)operator new(24 * v8);
    uint64_t v12 = &v11[24 * v7];
    *(_OWORD *)uint64_t v12 = *(_OWORD *)a2;
    *((void *)v12 + 2) = *(void *)(a2 + 16);
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    *(void *)(a2 + 16) = 0;
    uint64_t v6 = v12 + 24;
    char v14 = *v3;
    unint64_t v13 = v3[1];
    if (v13 == *v3)
    {
      int64x2_t v16 = vdupq_n_s64((unint64_t)v13);
    }
    else
    {
      do
      {
        *((void *)v12 - 3) = 0;
        *((void *)v12 - 2) = 0;
        v12 -= 24;
        *((void *)v12 + 2) = 0;
        long long v15 = *(_OWORD *)(v13 - 24);
        v13 -= 24;
        *(_OWORD *)uint64_t v12 = v15;
        *((void *)v12 + 2) = *((void *)v13 + 2);
        *(void *)unint64_t v13 = 0;
        *((void *)v13 + 1) = 0;
        *((void *)v13 + 2) = 0;
      }
      while (v13 != v14);
      int64x2_t v16 = *(int64x2_t *)v3;
    }
    *uint64_t v3 = v12;
    v3[1] = v6;
    int64x2_t v19 = v16;
    unint64_t v17 = v3[2];
    v3[2] = &v11[8 * v10];
    unint64_t v20 = v17;
    uint64_t v18 = v16.i64[0];
    uint64_t result = (void *)std::__split_buffer<std::vector<float>>::~__split_buffer((uint64_t)&v18);
  }
  else
  {
    *CFStringRef v5 = 0;
    v5[1] = 0;
    v5[2] = 0;
    *(_OWORD *)CFStringRef v5 = *(_OWORD *)a2;
    v5[2] = *(void *)(a2 + 16);
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    *(void *)(a2 + 16) = 0;
    uint64_t v6 = (char *)(v5 + 3);
  }
  v3[1] = v6;
  return result;
}

void InputTranscoder::InputProcessor::flattenedFeatures(InputTranscoder::InputProcessor *this@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = ((uint64_t)(*((void *)this + 8) - *((void *)this + 7)) >> 3)
     * ((uint64_t)(*(void *)(*((void *)this + 7) + 8) - **((void **)this + 7)) >> 2);
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)a2 = 0;
  std::vector<float>::reserve((void **)a2, 0xAAAAAAAAAAAAAAABLL * v4);
  uint64_t v6 = (char **)*((void *)this + 7);
  CFStringRef v5 = (char **)*((void *)this + 8);
  while (v6 != v5)
  {
    std::vector<float>::__insert_with_size[abi:ne180100]<std::__wrap_iter<float const*>,std::__wrap_iter<float const*>>((void **)a2, *(void *)(a2 + 8), *v6, v6[1], (v6[1] - *v6) >> 2);
    v6 += 3;
  }
}

void sub_2369DBCEC(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<float>::reserve(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 2)
  {
    if (a2 >> 62) {
      std::vector<float>::__throw_length_error[abi:ne180100]();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    uint64_t v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v3, a2);
    unint64_t v7 = &v6[v5 & 0xFFFFFFFFFFFFFFFCLL];
    unint64_t v9 = &v6[4 * v8];
    uint64_t v10 = (char *)*a1;
    uint64_t v11 = (char *)a1[1];
    uint64_t v12 = v7;
    if (v11 != *a1)
    {
      uint64_t v12 = v7;
      do
      {
        int v13 = *((_DWORD *)v11 - 1);
        v11 -= 4;
        *((_DWORD *)v12 - 1) = v13;
        v12 -= 4;
      }
      while (v11 != v10);
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
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
    uint64_t v6 = (_DWORD *)a1[1];
    unint64_t v7 = &v6[a2];
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

void sub_2369DBE1C(_Unwind_Exception *exception_object)
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
    std::vector<float>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void std::vector<float>::__throw_length_error[abi:ne180100]()
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(4 * a2);
}

void std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  long long v2 = *a1;
  if (*v2)
  {
    std::vector<std::vector<float>>::__clear[abi:ne180100]((uint64_t *)v2);
    uint64_t v3 = **a1;
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
      int64_t v5 = v6;
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

uint64_t std::__split_buffer<std::vector<float>>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v2 = *(void *)(a1 + 16);
  while (v2 != v3)
  {
    uint64_t v4 = *(void **)(v2 - 24);
    *(void *)(a1 + 16) = v2 - 24;
    if (v4)
    {
      *(void *)(v2 - 16) = v4;
      operator delete(v4);
      uint64_t v2 = *(void *)(a1 + 16);
    }
    else
    {
      v2 -= 24;
    }
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

char *std::vector<float>::__insert_with_size[abi:ne180100]<std::__wrap_iter<float const*>,std::__wrap_iter<float const*>>(void **a1, uint64_t a2, char *__src, char *a4, uint64_t a5)
{
  int64_t v5 = (char *)*a1;
  uint64_t v6 = a2 - (void)*a1;
  unint64_t v7 = (char *)*a1 + (v6 & 0xFFFFFFFFFFFFFFFCLL);
  if (a5 < 1) {
    return v7;
  }
  unint64_t v9 = __src;
  int v13 = a1[2];
  uint64_t v11 = (uint64_t)(a1 + 2);
  uint64_t v12 = v13;
  unint64_t v14 = *(void *)(v11 - 8);
  if (a5 > (uint64_t)&v13[-v14] >> 2)
  {
    unint64_t v15 = a5 + ((uint64_t)(v14 - (void)v5) >> 2);
    if (v15 >> 62) {
      std::vector<float>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v16 = v6 >> 2;
    uint64_t v17 = v12 - v5;
    uint64_t v18 = v17 >> 1;
    if (v17 >> 1 <= v15) {
      uint64_t v18 = v15;
    }
    if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v19 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v19 = v18;
    }
    if (v19) {
      unint64_t v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v11, v19);
    }
    else {
      unint64_t v20 = 0;
    }
    v29 = &v20[4 * v16];
    int64_t v30 = &v29[4 * a5];
    uint64_t v31 = 4 * a5;
    uint64_t v32 = v29;
    do
    {
      int v33 = *(_DWORD *)v9;
      v9 += 4;
      *(_DWORD *)uint64_t v32 = v33;
      v32 += 4;
      v31 -= 4;
    }
    while (v31);
    uint64_t v34 = (char *)*a1;
    unint64_t v35 = v29;
    if (*a1 != v7)
    {
      int v36 = v7;
      unint64_t v35 = v29;
      do
      {
        int v37 = *((_DWORD *)v36 - 1);
        v36 -= 4;
        *((_DWORD *)v35 - 1) = v37;
        v35 -= 4;
      }
      while (v36 != v34);
    }
    v38 = &v20[4 * v19];
    uint64_t v39 = a1[1];
    uint64_t v40 = v39 - v7;
    if (v39 != v7) {
      memmove(v30, v7, v39 - v7);
    }
    uint64_t v41 = *a1;
    *a1 = v35;
    a1[1] = &v30[v40];
    a1[2] = v38;
    if (v41) {
      operator delete(v41);
    }
    return v29;
  }
  uint64_t v21 = (uint64_t)(v14 - (void)v7) >> 2;
  if (v21 >= a5)
  {
    unsigned int v22 = &__src[4 * a5];
    uint64_t v24 = *(char **)(v11 - 8);
LABEL_17:
    uint64_t v25 = &v7[4 * a5];
    unint64_t v26 = (int *)&v24[-4 * a5];
    unint64_t v27 = v24;
    if ((unint64_t)v26 < v14)
    {
      unint64_t v27 = v24;
      do
      {
        int v28 = *v26++;
        *(_DWORD *)unint64_t v27 = v28;
        v27 += 4;
      }
      while ((unint64_t)v26 < v14);
    }
    a1[1] = v27;
    if (v24 != v25) {
      memmove(&v24[-4 * ((v24 - v25) >> 2)], v7, v24 - v25);
    }
    if (v22 != v9) {
      memmove(v7, v9, v22 - v9);
    }
    return v7;
  }
  unsigned int v22 = &__src[4 * v21];
  int64_t v23 = a4 - v22;
  if (a4 != v22) {
    memmove(*(void **)(v11 - 8), &__src[4 * v21], a4 - v22);
  }
  uint64_t v24 = (char *)(v14 + v23);
  a1[1] = (void *)(v14 + v23);
  if ((uint64_t)(v14 - (void)v7) >= 1) {
    goto LABEL_17;
  }
  return v7;
}

double ITTouchTranscoderSessionSetLinguisticContext(uint64_t a1, const __CFString *a2)
{
  return InputTranscoder::TouchTranscoderSessionImpl::setLinguisticContext(*(InputTranscoder::TouchTranscoderSessionImpl **)(a1 + 24), a2);
}

void ITTouchTranscoderSessionSetPrefix(uint64_t a1, const __CFString *a2)
{
}

void ITTouchTranscoderSessionAddEvent(uint64_t a1, unint64_t a2, double a3, double a4, double a5, double a6)
{
}

void ITTouchTranscoderSessionAddEventWithTouchKeyInfo(uint64_t a1, unint64_t a2, uint64_t a3, double a4, double a5, double a6, double a7)
{
}

void ITTouchTranscoderSessionEnumerateCandidates(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v8 = a2;
  if (_nlpSignpostLog::token != -1) {
    dispatch_once(&_nlpSignpostLog::token, &__block_literal_global_3);
  }
  os_signpost_id_t v3 = os_signpost_id_generate((os_log_t)_nlpSignpostLog::log);
  if (_nlpSignpostLog::token != -1) {
    dispatch_once(&_nlpSignpostLog::token, &__block_literal_global_3);
  }
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    uint64_t v4 = _nlpSignpostLog::log;
    if (os_signpost_enabled((os_log_t)_nlpSignpostLog::log))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_2369D6000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v3, "ITTouchTranscoderSessionEnumerateCandidates", (const char *)&unk_236A08912, buf, 2u);
    }
  }
  CFDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  uint64_t v6 = *(void *)(a1 + 24);
  *(void *)buf = &unk_26E9DA0A8;
  uint64_t v10 = &v8;
  uint64_t v11 = buf;
  InputTranscoder::TouchTranscoderSessionImpl::enumerateCandidates(v6, Mutable);
  std::__function::__value_func<BOOL ()(std::unique_ptr<InputTranscoder::CandidateImpl>)>::~__value_func[abi:ne180100](buf);
  if (_nlpSignpostLog::token != -1) {
    dispatch_once(&_nlpSignpostLog::token, &__block_literal_global_3);
  }
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    unint64_t v7 = _nlpSignpostLog::log;
    if (os_signpost_enabled((os_log_t)_nlpSignpostLog::log))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_2369D6000, v7, OS_SIGNPOST_INTERVAL_END, v3, "ITTouchTranscoderSessionEnumerateCandidates", (const char *)&unk_236A08912, buf, 2u);
    }
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
}

void sub_2369DC3E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void ITTouchTranscoderSessionEnumerateCandidatesWithOptions(uint64_t a1, const __CFDictionary *a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v9 = a3;
  if (_nlpSignpostLog::token != -1) {
    dispatch_once(&_nlpSignpostLog::token, &__block_literal_global_3);
  }
  os_signpost_id_t v5 = os_signpost_id_generate((os_log_t)_nlpSignpostLog::log);
  if (_nlpSignpostLog::token != -1) {
    dispatch_once(&_nlpSignpostLog::token, &__block_literal_global_3);
  }
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    uint64_t v6 = _nlpSignpostLog::log;
    if (os_signpost_enabled((os_log_t)_nlpSignpostLog::log))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_2369D6000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v5, "ITTouchTranscoderSessionEnumerateCandidates", (const char *)&unk_236A08912, buf, 2u);
    }
  }
  uint64_t v7 = *(void *)(a1 + 24);
  *(void *)buf = &unk_26E9DA138;
  uint64_t v11 = &v9;
  uint64_t v12 = buf;
  InputTranscoder::TouchTranscoderSessionImpl::enumerateCandidates(v7, a2);
  std::__function::__value_func<BOOL ()(std::unique_ptr<InputTranscoder::CandidateImpl>)>::~__value_func[abi:ne180100](buf);
  if (_nlpSignpostLog::token != -1) {
    dispatch_once(&_nlpSignpostLog::token, &__block_literal_global_3);
  }
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    uint64_t v8 = _nlpSignpostLog::log;
    if (os_signpost_enabled((os_log_t)_nlpSignpostLog::log))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_2369D6000, v8, OS_SIGNPOST_INTERVAL_END, v5, "ITTouchTranscoderSessionEnumerateCandidates", (const char *)&unk_236A08912, buf, 2u);
    }
  }
}

void sub_2369DC5F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::__function::__value_func<BOOL ()(std::unique_ptr<InputTranscoder::CandidateImpl>)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void ITTouchTranscoderSessionEnumerateKeyCandidatesForLastTouch(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v7 = a2;
  if (_nlpSignpostLog::token != -1) {
    dispatch_once(&_nlpSignpostLog::token, &__block_literal_global_3);
  }
  os_signpost_id_t v3 = os_signpost_id_generate((os_log_t)_nlpSignpostLog::log);
  if (_nlpSignpostLog::token != -1) {
    dispatch_once(&_nlpSignpostLog::token, &__block_literal_global_3);
  }
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    uint64_t v4 = _nlpSignpostLog::log;
    if (os_signpost_enabled((os_log_t)_nlpSignpostLog::log))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_2369D6000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v3, "ITTouchTranscoderSessionEnumerateKeyCandidatesForLastTouch", (const char *)&unk_236A08912, buf, 2u);
    }
  }
  os_signpost_id_t v5 = *(void **)(a1 + 24);
  *(void *)buf = &unk_26E9DA1B8;
  uint64_t v9 = &v7;
  uint64_t v10 = buf;
  InputTranscoder::TouchTranscoderSessionImpl::enumerateKeyCandidatesForLastTouch(v5);
  std::__function::__value_func<BOOL ()(std::unique_ptr<InputTranscoder::KeyCandidateImpl>)>::~__value_func[abi:ne180100](buf);
  if (_nlpSignpostLog::token != -1) {
    dispatch_once(&_nlpSignpostLog::token, &__block_literal_global_3);
  }
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    uint64_t v6 = _nlpSignpostLog::log;
    if (os_signpost_enabled((os_log_t)_nlpSignpostLog::log))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_2369D6000, v6, OS_SIGNPOST_INTERVAL_END, v3, "ITTouchTranscoderSessionEnumerateKeyCandidatesForLastTouch", (const char *)&unk_236A08912, buf, 2u);
    }
  }
}

void sub_2369DC7C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::__function::__value_func<BOOL ()(std::unique_ptr<InputTranscoder::KeyCandidateImpl>)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t ITTouchTranscoderSessionSetTextAcceptedFromUI(uint64_t a1, const __CFString *a2)
{
  return InputTranscoder::TouchTranscoderSessionImpl::textAcceptedFromUI(*(InputTranscoder::TouchTranscoderSessionImpl **)(a1 + 24), a2);
}

void std::__function::__func<ITTouchTranscoderSessionEnumerateCandidates::$_0,std::allocator<ITTouchTranscoderSessionEnumerateCandidates::$_0>,BOOL ()(std::unique_ptr<InputTranscoder::CandidateImpl>)>::~__func()
{
}

void *std::__function::__func<ITTouchTranscoderSessionEnumerateCandidates::$_0,std::allocator<ITTouchTranscoderSessionEnumerateCandidates::$_0>,BOOL ()(std::unique_ptr<InputTranscoder::CandidateImpl>)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = &unk_26E9DA0A8;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<ITTouchTranscoderSessionEnumerateCandidates::$_0,std::allocator<ITTouchTranscoderSessionEnumerateCandidates::$_0>,BOOL ()(std::unique_ptr<InputTranscoder::CandidateImpl>)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26E9DA0A8;
  a2[1] = v2;
  return result;
}

BOOL std::__function::__func<ITTouchTranscoderSessionEnumerateCandidates::$_0,std::allocator<ITTouchTranscoderSessionEnumerateCandidates::$_0>,BOOL ()(std::unique_ptr<InputTranscoder::CandidateImpl>)>::operator()(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  *a2 = 0;
  unsigned __int8 v10 = 0;
  v9[0] = 0;
  CFAllocatorGetDefault();
  _CFGetTypeID_Candidate();
  Instance = (void *)_CFRuntimeCreateInstance();
  uint64_t v5 = Instance[3];
  Instance[3] = v3;
  if (v5) {
    std::default_delete<InputTranscoder::CandidateImpl>::operator()[abi:ne180100]((uint64_t)(Instance + 3), v5);
  }
  v9[1] = 0;
  (*(void (**)(void))(**(void **)(a1 + 8) + 16))();
  int v6 = v10;
  CFRelease(Instance);
  uint64_t v7 = v9[0];
  v9[0] = 0;
  if (v7) {
    std::default_delete<InputTranscoder::CandidateImpl>::operator()[abi:ne180100]((uint64_t)v9, v7);
  }
  return v6 != 0;
}

void sub_2369DC92C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  CFRelease(v11);
  uint64_t v13 = a10;
  a10 = 0;
  if (v13) {
    std::default_delete<InputTranscoder::CandidateImpl>::operator()[abi:ne180100]((uint64_t)&a10, v13);
  }
  _Unwind_Resume(a1);
}

uint64_t std::__function::__func<ITTouchTranscoderSessionEnumerateCandidates::$_0,std::allocator<ITTouchTranscoderSessionEnumerateCandidates::$_0>,BOOL ()(std::unique_ptr<InputTranscoder::CandidateImpl>)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<ITTouchTranscoderSessionEnumerateCandidates::$_0,std::allocator<ITTouchTranscoderSessionEnumerateCandidates::$_0>,BOOL ()(std::unique_ptr<InputTranscoder::CandidateImpl>)>::target_type()
{
}

void *std::__function::__value_func<BOOL ()(std::unique_ptr<InputTranscoder::CandidateImpl>)>::~__value_func[abi:ne180100](void *a1)
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

void std::__function::__func<ITTouchTranscoderSessionEnumerateCandidatesWithOptions::$_0,std::allocator<ITTouchTranscoderSessionEnumerateCandidatesWithOptions::$_0>,BOOL ()(std::unique_ptr<InputTranscoder::CandidateImpl>)>::~__func()
{
}

void *std::__function::__func<ITTouchTranscoderSessionEnumerateCandidatesWithOptions::$_0,std::allocator<ITTouchTranscoderSessionEnumerateCandidatesWithOptions::$_0>,BOOL ()(std::unique_ptr<InputTranscoder::CandidateImpl>)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = &unk_26E9DA138;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<ITTouchTranscoderSessionEnumerateCandidatesWithOptions::$_0,std::allocator<ITTouchTranscoderSessionEnumerateCandidatesWithOptions::$_0>,BOOL ()(std::unique_ptr<InputTranscoder::CandidateImpl>)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26E9DA138;
  a2[1] = v2;
  return result;
}

BOOL std::__function::__func<ITTouchTranscoderSessionEnumerateCandidatesWithOptions::$_0,std::allocator<ITTouchTranscoderSessionEnumerateCandidatesWithOptions::$_0>,BOOL ()(std::unique_ptr<InputTranscoder::CandidateImpl>)>::operator()(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  *a2 = 0;
  unsigned __int8 v10 = 0;
  v9[0] = 0;
  CFAllocatorGetDefault();
  _CFGetTypeID_Candidate();
  Instance = (void *)_CFRuntimeCreateInstance();
  uint64_t v5 = Instance[3];
  Instance[3] = v3;
  if (v5) {
    std::default_delete<InputTranscoder::CandidateImpl>::operator()[abi:ne180100]((uint64_t)(Instance + 3), v5);
  }
  v9[1] = 0;
  (*(void (**)(void))(**(void **)(a1 + 8) + 16))();
  int v6 = v10;
  CFRelease(Instance);
  uint64_t v7 = v9[0];
  v9[0] = 0;
  if (v7) {
    std::default_delete<InputTranscoder::CandidateImpl>::operator()[abi:ne180100]((uint64_t)v9, v7);
  }
  return v6 != 0;
}

void sub_2369DCB90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  CFRelease(v11);
  uint64_t v13 = a10;
  a10 = 0;
  if (v13) {
    std::default_delete<InputTranscoder::CandidateImpl>::operator()[abi:ne180100]((uint64_t)&a10, v13);
  }
  _Unwind_Resume(a1);
}

uint64_t std::__function::__func<ITTouchTranscoderSessionEnumerateCandidatesWithOptions::$_0,std::allocator<ITTouchTranscoderSessionEnumerateCandidatesWithOptions::$_0>,BOOL ()(std::unique_ptr<InputTranscoder::CandidateImpl>)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<ITTouchTranscoderSessionEnumerateCandidatesWithOptions::$_0,std::allocator<ITTouchTranscoderSessionEnumerateCandidatesWithOptions::$_0>,BOOL ()(std::unique_ptr<InputTranscoder::CandidateImpl>)>::target_type()
{
}

void std::__function::__func<ITTouchTranscoderSessionEnumerateKeyCandidatesForLastTouch::$_0,std::allocator<ITTouchTranscoderSessionEnumerateKeyCandidatesForLastTouch::$_0>,BOOL ()(std::unique_ptr<InputTranscoder::KeyCandidateImpl>)>::~__func()
{
}

void *std::__function::__func<ITTouchTranscoderSessionEnumerateKeyCandidatesForLastTouch::$_0,std::allocator<ITTouchTranscoderSessionEnumerateKeyCandidatesForLastTouch::$_0>,BOOL ()(std::unique_ptr<InputTranscoder::KeyCandidateImpl>)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = &unk_26E9DA1B8;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<ITTouchTranscoderSessionEnumerateKeyCandidatesForLastTouch::$_0,std::allocator<ITTouchTranscoderSessionEnumerateKeyCandidatesForLastTouch::$_0>,BOOL ()(std::unique_ptr<InputTranscoder::KeyCandidateImpl>)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26E9DA1B8;
  a2[1] = v2;
  return result;
}

BOOL std::__function::__func<ITTouchTranscoderSessionEnumerateKeyCandidatesForLastTouch::$_0,std::allocator<ITTouchTranscoderSessionEnumerateKeyCandidatesForLastTouch::$_0>,BOOL ()(std::unique_ptr<InputTranscoder::KeyCandidateImpl>)>::operator()(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  *a2 = 0;
  unsigned __int8 v10 = 0;
  v9[0] = 0;
  CFAllocatorGetDefault();
  _CFGetTypeID_KeyCandidate();
  Instance = (void *)_CFRuntimeCreateInstance();
  uint64_t v5 = Instance[3];
  Instance[3] = v3;
  if (v5) {
    std::default_delete<InputTranscoder::KeyCandidateImpl>::operator()[abi:ne180100]((uint64_t)(Instance + 3), v5);
  }
  v9[1] = 0;
  (*(void (**)(void))(**(void **)(a1 + 8) + 16))();
  int v6 = v10;
  CFRelease(Instance);
  uint64_t v7 = v9[0];
  v9[0] = 0;
  if (v7) {
    std::default_delete<InputTranscoder::KeyCandidateImpl>::operator()[abi:ne180100]((uint64_t)v9, v7);
  }
  return v6 != 0;
}

void sub_2369DCD70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  CFRelease(v11);
  uint64_t v13 = a10;
  a10 = 0;
  if (v13) {
    std::default_delete<InputTranscoder::KeyCandidateImpl>::operator()[abi:ne180100]((uint64_t)&a10, v13);
  }
  _Unwind_Resume(a1);
}

uint64_t std::__function::__func<ITTouchTranscoderSessionEnumerateKeyCandidatesForLastTouch::$_0,std::allocator<ITTouchTranscoderSessionEnumerateKeyCandidatesForLastTouch::$_0>,BOOL ()(std::unique_ptr<InputTranscoder::KeyCandidateImpl>)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<ITTouchTranscoderSessionEnumerateKeyCandidatesForLastTouch::$_0,std::allocator<ITTouchTranscoderSessionEnumerateKeyCandidatesForLastTouch::$_0>,BOOL ()(std::unique_ptr<InputTranscoder::KeyCandidateImpl>)>::target_type()
{
}

void *std::__function::__value_func<BOOL ()(std::unique_ptr<InputTranscoder::KeyCandidateImpl>)>::~__value_func[abi:ne180100](void *a1)
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

void InputTranscoder::CRNNRecognizer::recognize(void *a1@<X1>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  v17[4] = *MEMORY[0x263EF8340];
  uint64_t v5 = (uint64_t *)a1[6];
  uint64_t v7 = *v5;
  uint64_t v6 = v5[1];
  uint64_t v16 = 0;
  uint64_t v8 = a1 + 3;
  unint64_t v15 = InputTranscoder::InputDescriptorCreator::create((uint64_t)(a1[4] - a1[3]) >> 2, 2uLL, 5, 1, 1);
  uint64_t v9 = operator new(0x20uLL);
  void *v9 = &unk_26E9DA288;
  v9[1] = &v16;
  void v9[2] = v8;
  v9[3] = &v15;
  v17[3] = v9;
  uint64_t v10 = std::__function::__func<InputTranscoder::CRNNRecognizer::recognize(InputTranscoder::InputProcessor const&,InputTranscoder::TranscoderMediator &)::$_0,std::allocator<InputTranscoder::CRNNRecognizer::recognize(InputTranscoder::InputProcessor const&,InputTranscoder::TranscoderMediator &)::$_0>,std::span<float const,18446744073709551615ul> ()(InputTranscoder::MontrealModel &)>::operator()((uint64_t)v9, *(void **)(a2 + 8));
  uint64_t v12 = v11;
  std::__function::__value_func<std::span<float const,18446744073709551615ul> ()(InputTranscoder::MontrealModel &)>::~__value_func[abi:ne180100](v17);
  *a3 = v10;
  a3[1] = v12;
  uint64_t v13 = v15;
  uint64_t v14 = v16;
  a3[2] = (v6 - v7) >> 6;
  a3[3] = v14;
  if (v13) {
    CFRelease(v13);
  }
}

void sub_2369DCF8C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, char a12)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void InputTranscoder::CRNNRecognizer::~CRNNRecognizer(InputTranscoder::CRNNRecognizer *this)
{
}

void std::__function::__func<InputTranscoder::CRNNRecognizer::recognize(InputTranscoder::InputProcessor const&,InputTranscoder::TranscoderMediator &)::$_0,std::allocator<InputTranscoder::CRNNRecognizer::recognize(InputTranscoder::InputProcessor const&,InputTranscoder::TranscoderMediator &)::$_0>,std::span<float const,18446744073709551615ul> ()(InputTranscoder::MontrealModel &)>::~__func()
{
}

__n128 std::__function::__func<InputTranscoder::CRNNRecognizer::recognize(InputTranscoder::InputProcessor const&,InputTranscoder::TranscoderMediator &)::$_0,std::allocator<InputTranscoder::CRNNRecognizer::recognize(InputTranscoder::InputProcessor const&,InputTranscoder::TranscoderMediator &)::$_0>,std::span<float const,18446744073709551615ul> ()(InputTranscoder::MontrealModel &)>::__clone(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x20uLL);
  *(void *)uint64_t v2 = &unk_26E9DA288;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  *((void *)v2 + 3) = *(void *)(a1 + 24);
  return result;
}

__n128 std::__function::__func<InputTranscoder::CRNNRecognizer::recognize(InputTranscoder::InputProcessor const&,InputTranscoder::TranscoderMediator &)::$_0,std::allocator<InputTranscoder::CRNNRecognizer::recognize(InputTranscoder::InputProcessor const&,InputTranscoder::TranscoderMediator &)::$_0>,std::span<float const,18446744073709551615ul> ()(InputTranscoder::MontrealModel &)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26E9DA288;
  __n128 result = *(__n128 *)(a1 + 8);
  *(void *)(a2 + 24) = *(void *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t std::__function::__func<InputTranscoder::CRNNRecognizer::recognize(InputTranscoder::InputProcessor const&,InputTranscoder::TranscoderMediator &)::$_0,std::allocator<InputTranscoder::CRNNRecognizer::recognize(InputTranscoder::InputProcessor const&,InputTranscoder::TranscoderMediator &)::$_0>,std::span<float const,18446744073709551615ul> ()(InputTranscoder::MontrealModel &)>::operator()(uint64_t a1, void *a2)
{
  uint64_t OutputDimension = MRLNeuralNetworkGetOutputDimension();
  uint64_t v5 = *(void *)(a1 + 16);
  **(void **)(a1 + 8) = OutputDimension;
  uint64_t v6 = *(char **)v5;
  unint64_t v7 = (uint64_t)(*(void *)(v5 + 8) - *(void *)v5) >> 2;

  return InputTranscoder::MontrealModel::recognize(a2, v6, v7);
}

uint64_t std::__function::__func<InputTranscoder::CRNNRecognizer::recognize(InputTranscoder::InputProcessor const&,InputTranscoder::TranscoderMediator &)::$_0,std::allocator<InputTranscoder::CRNNRecognizer::recognize(InputTranscoder::InputProcessor const&,InputTranscoder::TranscoderMediator &)::$_0>,std::span<float const,18446744073709551615ul> ()(InputTranscoder::MontrealModel &)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<InputTranscoder::CRNNRecognizer::recognize(InputTranscoder::InputProcessor const&,InputTranscoder::TranscoderMediator &)::$_0,std::allocator<InputTranscoder::CRNNRecognizer::recognize(InputTranscoder::InputProcessor const&,InputTranscoder::TranscoderMediator &)::$_0>,std::span<float const,18446744073709551615ul> ()(InputTranscoder::MontrealModel &)>::target_type()
{
}

void InputTranscoder::LRNNRecognizer::recognize(InputTranscoder::InputProcessor *this@<X1>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  v17[4] = *MEMORY[0x263EF8340];
  InputTranscoder::InputProcessor::flattenedFeatures(this, (uint64_t)__p);
  uint64_t v6 = (void *)*((void *)this + 7);
  unint64_t v7 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)this + 8) - (void)v6) >> 3);
  uint64_t v15 = 0;
  uint64_t v14 = (uint64_t)(v6[1] - *v6) >> 2;
  CFTypeRef cf = InputTranscoder::InputDescriptorCreator::create((InputTranscoder::InputDescriptorCreator *)v7, v14);
  uint64_t v8 = operator new(0x28uLL);
  *uint64_t v8 = &unk_26E9DA348;
  v8[1] = &v15;
  v8[2] = __p;
  v8[3] = &cf;
  v8[4] = &v14;
  v17[3] = v8;
  uint64_t v9 = std::__function::__func<InputTranscoder::LRNNRecognizer::recognize(InputTranscoder::InputProcessor const&,InputTranscoder::TranscoderMediator &)::$_0,std::allocator<InputTranscoder::LRNNRecognizer::recognize(InputTranscoder::InputProcessor const&,InputTranscoder::TranscoderMediator &)::$_0>,std::span<float const,18446744073709551615ul> ()(InputTranscoder::MontrealModel &)>::operator()((uint64_t)v8, *(void **)(a2 + 8));
  uint64_t v11 = v10;
  std::__function::__value_func<std::span<float const,18446744073709551615ul> ()(InputTranscoder::MontrealModel &)>::~__value_func[abi:ne180100](v17);
  *a3 = v9;
  a3[1] = v11;
  uint64_t v12 = v15;
  a3[2] = v7;
  a3[3] = v12;
  if (cf) {
    CFRelease(cf);
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

void sub_2369DD258(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, char a16)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void InputTranscoder::LRNNRecognizer::~LRNNRecognizer(InputTranscoder::LRNNRecognizer *this)
{
}

void std::__function::__func<InputTranscoder::LRNNRecognizer::recognize(InputTranscoder::InputProcessor const&,InputTranscoder::TranscoderMediator &)::$_0,std::allocator<InputTranscoder::LRNNRecognizer::recognize(InputTranscoder::InputProcessor const&,InputTranscoder::TranscoderMediator &)::$_0>,std::span<float const,18446744073709551615ul> ()(InputTranscoder::MontrealModel &)>::~__func()
{
}

__n128 std::__function::__func<InputTranscoder::LRNNRecognizer::recognize(InputTranscoder::InputProcessor const&,InputTranscoder::TranscoderMediator &)::$_0,std::allocator<InputTranscoder::LRNNRecognizer::recognize(InputTranscoder::InputProcessor const&,InputTranscoder::TranscoderMediator &)::$_0>,std::span<float const,18446744073709551615ul> ()(InputTranscoder::MontrealModel &)>::__clone(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x28uLL);
  *(void *)uint64_t v2 = &unk_26E9DA348;
  *(_OWORD *)(v2 + 8) = *(_OWORD *)(a1 + 8);
  __n128 result = *(__n128 *)(a1 + 24);
  *(__n128 *)(v2 + 24) = result;
  return result;
}

__n128 std::__function::__func<InputTranscoder::LRNNRecognizer::recognize(InputTranscoder::InputProcessor const&,InputTranscoder::TranscoderMediator &)::$_0,std::allocator<InputTranscoder::LRNNRecognizer::recognize(InputTranscoder::InputProcessor const&,InputTranscoder::TranscoderMediator &)::$_0>,std::span<float const,18446744073709551615ul> ()(InputTranscoder::MontrealModel &)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26E9DA348;
  __n128 result = *(__n128 *)(a1 + 8);
  *(_OWORD *)(a2 + 24) = *(_OWORD *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t std::__function::__func<InputTranscoder::LRNNRecognizer::recognize(InputTranscoder::InputProcessor const&,InputTranscoder::TranscoderMediator &)::$_0,std::allocator<InputTranscoder::LRNNRecognizer::recognize(InputTranscoder::InputProcessor const&,InputTranscoder::TranscoderMediator &)::$_0>,std::span<float const,18446744073709551615ul> ()(InputTranscoder::MontrealModel &)>::operator()(uint64_t a1, void *a2)
{
  uint64_t OutputDimension = MRLNeuralNetworkGetOutputDimension();
  uint64_t v5 = *(void *)(a1 + 16);
  **(void **)(a1 + 8) = OutputDimension;
  uint64_t v6 = *(char **)v5;
  unint64_t v7 = (uint64_t)(*(void *)(v5 + 8) - *(void *)v5) >> 2;

  return InputTranscoder::MontrealModel::recognize(a2, v6, v7);
}

uint64_t std::__function::__func<InputTranscoder::LRNNRecognizer::recognize(InputTranscoder::InputProcessor const&,InputTranscoder::TranscoderMediator &)::$_0,std::allocator<InputTranscoder::LRNNRecognizer::recognize(InputTranscoder::InputProcessor const&,InputTranscoder::TranscoderMediator &)::$_0>,std::span<float const,18446744073709551615ul> ()(InputTranscoder::MontrealModel &)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<InputTranscoder::LRNNRecognizer::recognize(InputTranscoder::InputProcessor const&,InputTranscoder::TranscoderMediator &)::$_0,std::allocator<InputTranscoder::LRNNRecognizer::recognize(InputTranscoder::InputProcessor const&,InputTranscoder::TranscoderMediator &)::$_0>,std::span<float const,18446744073709551615ul> ()(InputTranscoder::MontrealModel &)>::target_type()
{
}

uint64_t ITCandidateGetString(uint64_t a1)
{
  uint64_t v3 = (const void **)(a1 + 32);
  uint64_t result = *(void *)(a1 + 32);
  if (!result)
  {
    CFStringRef CFStringFromString = nlp::createCFStringFromString(*(void *)(a1 + 24));
    nlp::CFScopedPtr<__CFString const*>::reset(v3, CFStringFromString);
    return *(void *)(a1 + 32);
  }
  return result;
}

uint64_t ITCandidateGetStrokedPath(uint64_t a1)
{
  uint64_t v3 = (const void **)(a1 + 40);
  uint64_t result = *(void *)(a1 + 40);
  if (!result)
  {
    CFStringRef CFStringFromString = nlp::createCFStringFromString(*(void *)(a1 + 24) + 24);
    nlp::CFScopedPtr<__CFString const*>::reset(v3, CFStringFromString);
    return *(void *)(a1 + 40);
  }
  return result;
}

float ITCandidateGetScore(uint64_t a1)
{
  return *(float *)(*(void *)(a1 + 24) + 48);
}

uint64_t ITCandidateIsValidWord(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 24) + 81);
}

uint64_t ITCandidateIsMultiWord(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 24) + 82);
}

uint64_t ITCandidateGetAutocorrectionOperations(uint64_t a1)
{
  return *(unsigned int *)(*(void *)(a1 + 24) + 84);
}

uint64_t ITCandidateIsCompletion(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 24) + 80);
}

uint64_t ITCandidateGetSources()
{
  return 0;
}

uint64_t ITCandidateGetUnshiftMask(uint64_t a1)
{
  return *(unsigned int *)(*(void *)(a1 + 24) + 92);
}

uint64_t ITCandidateFoundOnlyInDynamicLexicon(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 24) + 88);
}

uint64_t ITCandidateEnumerateTokenIDs(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 24);
  uint64_t v3 = *(unsigned int **)(v2 + 56);
  for (i = *(unsigned int **)(v2 + 64); v3 != i; result = (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, v6))unsigned int v6 = *v3++;
  return result;
}

CFStringRef ITKeyCandidateCreateString(uint64_t a1)
{
  return nlp::createCFStringFromString(*(void *)(a1 + 24));
}

float ITKeyCandidateGetScore(uint64_t a1)
{
  return *(float *)(*(void *)(a1 + 24) + 24);
}

CFStringRef ITCandidateCopyPrefix(uint64_t a1)
{
  return nlp::createCFStringFromString(*(void *)(a1 + 24) + 96);
}

uint64_t ITTouchTranscoderSupportsLocale(const void *a1)
{
  return supportsLocaleAndLayout(a1, 0, 0);
}

uint64_t supportsLocaleAndLayout(const void *a1, const __CFString *a2, uint64_t a3)
{
  CFDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(Mutable, @"locale", a1);
  uint64_t v7 = isTranscoderConfigurationSupported(a2, a3, Mutable);
  if (Mutable) {
    CFRelease(Mutable);
  }
  return v7;
}

void sub_2369DD624(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  nlp::CFScopedPtr<__CFDictionary *>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

uint64_t ITTouchTranscoderSupportsLocaleAndLayout(const void *a1, const __CFString *a2)
{
  return supportsLocaleAndLayout(a1, a2, 0);
}

uint64_t ITTouchTranscoderSupportsConfiguration(const __CFDictionary *a1)
{
  CFStringRef Optional = (const __CFString *)InputTranscoder::getOptionalCFType<__CFString const*>(a1, @"keyboardLayoutName", &stru_26E9DB590);
  BOOL TypingModeForTranscoder = extractTypingModeForTranscoder(a1);

  return isTranscoderConfigurationSupported(Optional, TypingModeForTranscoder, a1);
}

BOOL extractTypingModeForTranscoder(const __CFDictionary *a1)
{
  CFStringRef Optional = (const __CFString *)InputTranscoder::getOptionalCFType<__CFString const*>(a1, @"transcoderInstance", @"continuousPath");
  return CFEqual(Optional, @"tapTyping");
}

uint64_t isTranscoderConfigurationSupported(const __CFString *a1, uint64_t a2, __CFDictionary *a3)
{
  ResourceBundle = createResourceBundle(a3);
  v29 = ResourceBundle;
  InputTranscoder::generateConfiguration<InputTranscoder::TranscoderConfiguration>(a3, ResourceBundle, a2, (InputTranscoder::TranscoderConfiguration *)v22);
  if (v24)
  {
    memset(&v21, 0, sizeof(v21));
    std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v21, v27, v28, 0xAAAAAAAAAAAAAAABLL * (((char *)v28 - (char *)v27) >> 3));
    if (a1)
    {
      nlp::getUTF8StringFromCFString(a1, __p);
      std::string::size_type size = v21.__r_.__value_.__l.__size_;
      std::string::size_type v7 = v21.__r_.__value_.__r.__words[0];
      unsigned __int8 v9 = v20;
      if (v21.__r_.__value_.__r.__words[0] != v21.__r_.__value_.__l.__size_)
      {
        if ((v20 & 0x80u) == 0) {
          unint64_t v10 = v20;
        }
        else {
          unint64_t v10 = (unint64_t)__p[1];
        }
        if ((v20 & 0x80u) == 0) {
          uint64_t v11 = __p;
        }
        else {
          uint64_t v11 = (void **)__p[0];
        }
        do
        {
          uint64_t v12 = *(unsigned __int8 *)(v7 + 23);
          if ((v12 & 0x80u) == 0) {
            uint64_t v13 = (void *)*(unsigned __int8 *)(v7 + 23);
          }
          else {
            uint64_t v13 = *(void **)(v7 + 8);
          }
          if (v13 == (void *)v10)
          {
            if ((v12 & 0x80) != 0)
            {
              if (!memcmp(*(const void **)v7, v11, *(void *)(v7 + 8))) {
                goto LABEL_23;
              }
            }
            else
            {
              if (!*(unsigned char *)(v7 + 23)) {
                goto LABEL_23;
              }
              uint64_t v14 = 0;
              while (*(unsigned __int8 *)(v7 + v14) == *((unsigned __int8 *)v11 + v14))
              {
                if (v12 == ++v14) {
                  goto LABEL_23;
                }
              }
            }
          }
          v7 += 24;
        }
        while (v7 != size);
        std::string::size_type v7 = size;
      }
LABEL_23:
      LODWORD(v15) = v7 != size;
      if ((v9 & 0x80) != 0) {
        operator delete(__p[0]);
      }
    }
    else
    {
      LODWORD(v15) = 1;
    }
    uint64_t v16 = v26;
    if ((v26 & 0x80u) != 0) {
      uint64_t v16 = v25;
    }
    if (v16)
    {
      unint64_t v17 = v23;
      if ((v23 & 0x80u) != 0) {
        unint64_t v17 = (unint64_t)v22[1];
      }
      if (v17) {
        uint64_t v15 = v15;
      }
      else {
        uint64_t v15 = 0;
      }
    }
    else
    {
      uint64_t v15 = 0;
    }
    __p[0] = &v21;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
  }
  else
  {
    uint64_t v15 = 0;
  }
  InputTranscoder::TranscoderConfiguration::~TranscoderConfiguration(v22);
  CFRelease(ResourceBundle);
  return v15;
}

void sub_2369DD8B0(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va1, a6);
  va_start(va, a6);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  *(void *)(v6 - 72) = va;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)(v6 - 72));
  InputTranscoder::TranscoderConfiguration::~TranscoderConfiguration((void **)va1);
  nlp::CFScopedPtr<__CFBundle *>::reset((const void **)(v6 - 80), 0);
  if (a2 == 1)
  {
    __cxa_begin_catch(a1);
    __cxa_end_catch();
    JUMPOUT(0x2369DD890);
  }
  _Unwind_Resume(a1);
}

void ITTouchTranscoderCreateWithKeyboardLayout(const __CFDictionary *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  mach_continuous_time();
  ResourceBundle = createResourceBundle(a1);
  BOOL TypingModeForTranscoder = extractTypingModeForTranscoder(a1);
  InputTranscoder::generateConfiguration<InputTranscoder::TranscoderConfiguration>(a1, ResourceBundle, TypingModeForTranscoder, (InputTranscoder::TranscoderConfiguration *)v7);
  if (v11)
  {
    uint64_t v3 = operator new(0x90uLL);
    v3[1] = 0;
    v3[2] = 0;
    *uint64_t v3 = &unk_26E9DA3C8;
    InputTranscoder::PlistBiMap<std::string,unsigned int>::PlistBiMap((uint64_t)(v3 + 3), (uint64_t)&v12);
    uint64_t v4 = operator new(0x90uLL);
    v4[1] = 0;
    v4[2] = 0;
    *uint64_t v4 = &unk_26E9DA418;
    InputTranscoder::PlistBiMap<unsigned int,std::string>::PlistBiMap((uint64_t)(v4 + 3), (uint64_t)&v8);
    uint64_t v5 = v10;
    if ((v10 & 0x80u) != 0) {
      uint64_t v5 = v9[1];
    }
    if (v5) {
      std::allocate_shared[abi:ne180100]<InputTranscoder::PlistBiMap<unsigned int,unsigned int> const,std::allocator<InputTranscoder::PlistBiMap<unsigned int,unsigned int> const>,std::string const&,void>((uint64_t)v9, buf);
    }
    atomic_fetch_add_explicit(v4 + 1, 1uLL, memory_order_relaxed);
    operator new();
  }
  exception = __cxa_allocate_exception(0x20uLL);
  std::string::basic_string[abi:ne180100]<0>(buf, "Transcoder's configuration [common.useNeuralEngineKey] disallows creation of transcoder object");
  nlp::ResourceCreationException::ResourceCreationException(exception, (long long *)buf);
}

void sub_2369DDE40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, CFErrorRef *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (*(char *)(v22 - 105) < 0)
  {
    operator delete(*(void **)(v22 - 128));
    if ((v21 & 1) == 0) {
      goto LABEL_7;
    }
  }
  else if (!v21)
  {
LABEL_7:
    InputTranscoder::TranscoderConfiguration::~TranscoderConfiguration(&__p);
    nlp::CFScopedPtr<__CFBundle *>::reset((const void **)(v22 - 168), 0);
    if (a2 == 1)
    {
      uint64_t v25 = __cxa_begin_catch(a1);
      if (a9)
      {
        unsigned __int8 v26 = (char *)(*(uint64_t (**)(void *))(*(void *)v25 + 16))(v25);
        std::string::basic_string[abi:ne180100]<0>(&__p, v26);
        *a9 = InputTranscoder::createErrorWithMessage((uint64_t)&__p);
        if (a20 < 0) {
          operator delete(__p);
        }
      }
      __cxa_end_catch();
      JUMPOUT(0x2369DDD64);
    }
    _Unwind_Resume(a1);
  }
  __cxa_free_exception(v20);
  goto LABEL_7;
}

void sub_2369DE0E8(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  __cxa_end_catch();
  JUMPOUT(0x2369DDE90);
}

void sub_2369DE110()
{
}

CFBundleRef createResourceBundle(const __CFDictionary *a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3002000000;
  unint64_t v17 = __Block_byref_object_copy_;
  uint64_t v18 = __Block_byref_object_dispose_;
  if (CFDictionaryContainsKey(a1, @"bundleURL"))
  {
    Value = CFDictionaryGetValue(a1, @"bundleURL");
    CFTypeID v4 = CFGetTypeID(Value);
    if (v4 != CFURLGetTypeID())
    {
      exception = __cxa_allocate_exception(0x20uLL);
      std::string::basic_string[abi:ne180100]<0>(&v20, "Malformed options dictionary: bundle URL must be a CFURLRef");
      nlp::ResourceCreationException::ResourceCreationException(exception, (long long *)&v20);
    }
    CFTypeRef cf = 0;
    nlp::CFScopedPtr<__CFURL const*>::acquire(&cf, Value);
  }
  else
  {
    CFTypeRef cf = 0;
  }
  if (v15[5])
  {
    if (_nlpDefaultLog::token != -1) {
      dispatch_once(&_nlpDefaultLog::token, &__block_literal_global_2);
    }
    if (os_log_type_enabled((os_log_t)_nlpDefaultLog::log, OS_LOG_TYPE_DEBUG)) {
      nlp::getFileSystemRepresentationFromCFURL((nlp *)v15[5], v5);
    }
  }
  else
  {
    CFLocaleRef v6 = InputTranscoder::copyLocale(a1, v2);
    if (!v6)
    {
      char v11 = __cxa_allocate_exception(0x20uLL);
      std::string::basic_string[abi:ne180100]<0>(&v20, "Malformed options dictionary - missing or invalid locale");
      nlp::ResourceCreationException::ResourceCreationException(v11, (long long *)&v20);
    }
    InputTranscoder::enumerateLDAssets();
    if (!v15[5])
    {
      uint64_t v12 = __cxa_allocate_exception(0x20uLL);
      CFStringRef v13 = (const __CFString *)MEMORY[0x237E08530](v6);
      nlp::getUTF8StringFromCFString(v13, &buf);
      std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>("Unable to locate bundle for locale=", &buf, &v20);
      nlp::ResourceCreationException::ResourceCreationException(v12, (long long *)&v20);
    }
    CFRelease(v6);
  }
  CFBundleRef v7 = CFBundleCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (CFURLRef)v15[5]);
  if (!v7)
  {
    __cxa_allocate_exception(0x20uLL);
    nlp::getFileSystemRepresentationFromCFURL((nlp *)v15[5], v9);
  }
  _Block_object_dispose(&v14, 8);
  if (cf) {
    CFRelease(cf);
  }
  return v7;
}

void sub_2369DE4F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v12 = va_arg(va1, const void *);
  if (*(char *)(v10 - 65) < 0) {
    operator delete(*(void **)(v10 - 88));
  }
  if (*(char *)(v10 - 41) < 0)
  {
    operator delete(*(void **)(v10 - 64));
    if ((v9 & 1) == 0)
    {
LABEL_8:
      nlp::CFScopedPtr<__CFLocale const*>::reset((const void **)va, 0);
      _Block_object_dispose(va1, 8);
      nlp::CFScopedPtr<__CFURL const*>::reset(v7, 0);
      _Unwind_Resume(a1);
    }
  }
  else if (!v9)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v8);
  goto LABEL_8;
}

void *ITTouchTranscoderAddLexicon(uint64_t a1, const void *a2)
{
  return InputTranscoder::TouchTranscoderImpl::addLexicon(*(void *)(a1 + 24), a2);
}

void *ITTouchTranscoderRemoveLexicon(uint64_t a1, const void *a2)
{
  return InputTranscoder::TouchTranscoderImpl::removeLexicon(*(void *)(a1 + 24), a2);
}

void ITTouchTranscoderCreateSession(uint64_t a1)
{
}

void sub_2369DE6CC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<InputTranscoder::TouchTranscoderSessionImpl>::reset[abi:ne180100]((void ***)va, 0);
  _Unwind_Resume(a1);
}

void ITTouchTranscoderUpdateKeyboardLayout()
{
}

void sub_2369DE7A0(_Unwind_Exception *a1)
{
  MEMORY[0x237E08BB0](v1, 0x10E1C409ADAC2BBLL);
  _Unwind_Resume(a1);
}

void ITTouchTranscoderUpdateKeyboardLayoutWithOptions()
{
}

void sub_2369DE888(_Unwind_Exception *a1)
{
  MEMORY[0x237E08BB0](v1, 0x10E1C409ADAC2BBLL);
  _Unwind_Resume(a1);
}

void *ITTouchTranscoderClearNeuralNetworkBuffer(uint64_t a1)
{
  if (_nlpSignpostLog::token != -1) {
    dispatch_once(&_nlpSignpostLog::token, &__block_literal_global_3);
  }
  os_signpost_id_t v2 = os_signpost_id_generate((os_log_t)_nlpSignpostLog::log);
  if (_nlpSignpostLog::token != -1) {
    dispatch_once(&_nlpSignpostLog::token, &__block_literal_global_3);
  }
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    uint64_t v3 = _nlpSignpostLog::log;
    if (os_signpost_enabled((os_log_t)_nlpSignpostLog::log))
    {
      *(_WORD *)CFURLRef v5 = 0;
      _os_signpost_emit_with_name_impl(&dword_2369D6000, v3, OS_SIGNPOST_EVENT, v2, "ITTouchTranscoderClearNeuralNetworkBuffer", (const char *)&unk_236A08912, v5, 2u);
    }
  }
  return InputTranscoder::TouchTranscoderImpl::clearNeuralNetworkBuffer(*(InputTranscoder::TouchTranscoderImpl **)(a1 + 24));
}

BOOL ITTouchTranscoderProvidesCompletionCandidates(uint64_t a1)
{
  return *(_DWORD *)(*(void *)(a1 + 24) + 244) != 0;
}

std::string *std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(std::string *result, long long *a2, long long *a3, unint64_t a4)
{
  if (a4)
  {
    CFLocaleRef v6 = result;
    std::vector<std::string>::__vallocate[abi:ne180100](result, a4);
    uint64_t result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>((uint64_t)&v6->__r_.__value_.__r.__words[2], a2, a3, (std::string *)v6->__r_.__value_.__l.__size_);
    v6->__r_.__value_.__l.__size_ = (std::string::size_type)result;
  }
  return result;
}

void sub_2369DEA10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

char *std::vector<std::string>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::vector<InputTranscoder::InputFeature>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(24 * a2);
}

std::string *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>(uint64_t a1, long long *a2, long long *a3, std::string *this)
{
  uint64_t v4 = this;
  char v11 = this;
  uint64_t v12 = this;
  v9[0] = a1;
  v9[1] = &v11;
  void v9[2] = &v12;
  char v10 = 0;
  if (a2 != a3)
  {
    CFLocaleRef v6 = a2;
    do
    {
      if (*((char *)v6 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)v6, *((void *)v6 + 1));
        uint64_t v4 = v12;
      }
      else
      {
        long long v7 = *v6;
        v4->__r_.__value_.__r.__words[2] = *((void *)v6 + 2);
        *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v7;
      }
      CFLocaleRef v6 = (long long *)((char *)v6 + 24);
      uint64_t v12 = ++v4;
    }
    while (v6 != a3);
  }
  char v10 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v9);
  return v4;
}

void sub_2369DEB78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = **(void **)(a1 + 16);
  uint64_t v2 = **(void **)(a1 + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 - 1) < 0) {
      operator delete(*(void **)(v1 - 24));
    }
    v1 -= 24;
  }
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  *(void *)(result + 40) = v2;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void ___ZL20createResourceBundlePK14__CFDictionary_block_invoke(uint64_t a1, const void *a2, int a3, int a4, CFStringRef theString1, unsigned char *a6)
{
  if (CFEqual(theString1, (CFStringRef)*MEMORY[0x263F51798]))
  {
    nlp::CFScopedPtr<__CFURL const*>::acquire((const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a6 = 1;
  }
}

void nlp::CFScopedPtr<__CFURL const*>::acquire(const void **a1, CFTypeRef cf)
{
  if (*a1 != cf)
  {
    CFRetain(cf);
    nlp::CFScopedPtr<__CFURL const*>::reset(a1, cf);
  }
}

void nlp::CFScopedPtr<__CFURL const*>::reset(const void **a1, const void *a2)
{
  uint64_t v4 = *a1;
  if (v4) {
    CFRelease(v4);
  }
  *a1 = a2;
}

void nlp::CFScopedPtr<__CFLocale const*>::reset(const void **a1, const void *a2)
{
  uint64_t v4 = *a1;
  if (v4) {
    CFRelease(v4);
  }
  *a1 = a2;
}

void **std::unique_ptr<InputTranscoder::CTCDecoder>::reset[abi:ne180100](void ***a1)
{
  uint64_t result = *a1;
  *a1 = 0;
  if (result)
  {
    InputTranscoder::CTCDecoder::~CTCDecoder(result);
    JUMPOUT(0x237E08BB0);
  }
  return result;
}

uint64_t std::default_delete<InputTranscoder::MontrealModel>::operator()[abi:ne180100](uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void **)(result + 8);
    if (v2)
    {
      *(void *)(v1 + 16) = v2;
      operator delete(v2);
    }
    nlp::CFScopedPtr<MontrealNeuralNetwork *>::reset((const void **)v1, 0);
    JUMPOUT(0x237E08BB0);
  }
  return result;
}

uint64_t std::default_delete<InputTranscoder::TranscoderMediator>::operator()[abi:ne180100](uint64_t result)
{
  if (result)
  {
    uint64_t v1 = (uint64_t *)result;
    std::unique_ptr<InputTranscoder::CTCDecoder>::reset[abi:ne180100]((void ***)(result + 16));
    uint64_t v2 = v1[1];
    v1[1] = 0;
    if (v2) {
      std::default_delete<InputTranscoder::MontrealModel>::operator()[abi:ne180100](v2);
    }
    uint64_t v3 = *v1;
    *uint64_t v1 = 0;
    if (v3) {
      (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
    }
    JUMPOUT(0x237E08BB0);
  }
  return result;
}

void std::__shared_ptr_emplace<InputTranscoder::PlistBiMap<std::string,unsigned int> const,std::allocator<InputTranscoder::PlistBiMap<std::string,unsigned int> const>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E9DA3C8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<InputTranscoder::PlistBiMap<std::string,unsigned int> const,std::allocator<InputTranscoder::PlistBiMap<std::string,unsigned int> const>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E9DA3C8;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x237E08BB0);
}

uint64_t std::__shared_ptr_emplace<InputTranscoder::PlistBiMap<std::string,unsigned int> const,std::allocator<InputTranscoder::PlistBiMap<std::string,unsigned int> const>>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void std::__shared_ptr_emplace<InputTranscoder::PlistBiMap<unsigned int,std::string> const,std::allocator<InputTranscoder::PlistBiMap<unsigned int,std::string> const>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E9DA418;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<InputTranscoder::PlistBiMap<unsigned int,std::string> const,std::allocator<InputTranscoder::PlistBiMap<unsigned int,std::string> const>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E9DA418;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x237E08BB0);
}

uint64_t std::__shared_ptr_emplace<InputTranscoder::PlistBiMap<unsigned int,std::string> const,std::allocator<InputTranscoder::PlistBiMap<unsigned int,std::string> const>>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void std::__shared_ptr_pointer<InputTranscoder::TranscoderMediator  *>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x237E08BB0);
}

uint64_t std::__shared_ptr_pointer<InputTranscoder::TranscoderMediator  *>::__on_zero_shared(uint64_t a1)
{
  return std::default_delete<InputTranscoder::TranscoderMediator>::operator()[abi:ne180100](*(void *)(a1 + 24));
}

uint64_t std::__shared_ptr_pointer<InputTranscoder::TranscoderMediator  *>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

std::string *InputTranscoder::CTCDecoder::CTCDecoder(std::string *this, uint64_t a2, std::string::size_type *a3, void *a4)
{
  if (*(char *)(a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else
  {
    long long v8 = *(_OWORD *)a2;
    this->__r_.__value_.__r.__words[2] = *(void *)(a2 + 16);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v8;
  }
  uint64_t v9 = this + 1;
  if (*(char *)(a2 + 47) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)(a2 + 24), *(void *)(a2 + 32));
  }
  else
  {
    long long v10 = *(_OWORD *)(a2 + 24);
    this[1].__r_.__value_.__r.__words[2] = *(void *)(a2 + 40);
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = v10;
  }
  *(_OWORD *)&this[2].__r_.__value_.__l.__data_ = *(_OWORD *)(a2 + 48);
  long long v11 = *(_OWORD *)(a2 + 64);
  long long v12 = *(_OWORD *)(a2 + 80);
  long long v13 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)&this[4].__r_.__value_.__l.__data_ = *(_OWORD *)(a2 + 96);
  *(_OWORD *)&this[4].__r_.__value_.__r.__words[2] = v13;
  *(_OWORD *)&this[2].__r_.__value_.__r.__words[2] = v11;
  *(_OWORD *)&this[3].__r_.__value_.__r.__words[1] = v12;
  long long v14 = *(_OWORD *)(a2 + 128);
  long long v15 = *(_OWORD *)(a2 + 144);
  long long v16 = *(_OWORD *)(a2 + 160);
  LODWORD(this[7].__r_.__value_.__r.__words[1]) = *(_DWORD *)(a2 + 176);
  *(_OWORD *)&this[6].__r_.__value_.__l.__data_ = v15;
  *(_OWORD *)&this[6].__r_.__value_.__r.__words[2] = v16;
  *(_OWORD *)&this[5].__r_.__value_.__r.__words[1] = v14;
  InputTranscoder::LMScorer::makeLMScorer(a4, a2, &this[7].__r_.__value_.__r.__words[2]);
  std::string::size_type v17 = a3[1];
  this[8].__r_.__value_.__r.__words[0] = *a3;
  this[8].__r_.__value_.__l.__size_ = v17;
  if (v17) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v17 + 8), 1uLL, memory_order_relaxed);
  }
  this[11].__r_.__value_.__l.__size_ = 0;
  *(_OWORD *)&this[10].__r_.__value_.__l.__data_ = 0u;
  *(_OWORD *)&this[10].__r_.__value_.__r.__words[2] = 0u;
  *(_OWORD *)&this[8].__r_.__value_.__r.__words[2] = 0u;
  *(_OWORD *)&this[9].__r_.__value_.__r.__words[1] = 0u;
  if (*(unsigned char *)(a2 + 48))
  {
    InputTranscoder::makeStaticLexicon(a2, (uint64_t *)&cf);
    InputTranscoder::LexiconContainer::addLexicon(this[8].__r_.__value_.__r.__words, cf, 0);
    if (cf) {
      CFRelease(cf);
    }
  }
  return this;
}

void sub_2369DF1AC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  if (*(char *)(v10 + 23) < 0) {
    operator delete(*(void **)v10);
  }
  _Unwind_Resume(exception_object);
}

std::string *InputTranscoder::CTCDecoder::CTCDecoder(std::string *a1, uint64_t a2, void *a3)
{
  v4[0] = 0;
  v4[1] = 0;
  return InputTranscoder::CTCDecoder::CTCDecoder(a1, a2, v4, a3);
}

void InputTranscoder::LexiconContainer::~LexiconContainer(void **this)
{
  if (*((char *)this + 87) < 0) {
    operator delete(this[8]);
  }
  uint64_t v2 = this[5];
  if (v2)
  {
    this[6] = v2;
    operator delete(v2);
  }
  uint64_t v4 = this + 2;
  std::vector<nlp::CFScopedPtr<_LXLexicon const*>>::__destroy_vector::operator()[abi:ne180100](&v4);
  uint64_t v3 = (std::__shared_weak_count *)this[1];
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

void InputTranscoder::CTCConfiguration::~CTCConfiguration(void **this)
{
  if (*((char *)this + 47) < 0) {
    operator delete(this[3]);
  }
  if (*((char *)this + 23) < 0) {
    operator delete(*this);
  }
}

void InputTranscoder::CTCDecoder::makeTrieRoot(InputTranscoder::CTCDecoder *this)
{
  if (*((void *)this + 26) != *((void *)this + 27)) {
    operator new();
  }
  operator new();
}

void sub_2369DF430(_Unwind_Exception *a1)
{
  MEMORY[0x237E08BB0](v1, 0x10E1C409D70457BLL);
  _Unwind_Resume(a1);
}

void InputTranscoder::CTCDecoder::setLexiconPrefix(uint64_t a1, std::string *__str)
{
  if (*(void *)(a1 + 208) != *(void *)(a1 + 216)) {
    std::string::operator=((std::string *)(a1 + 256), __str);
  }
  uint64_t v4 = *(void **)(a1 + 184);
  if (v4)
  {
    InputTranscoder::LMScorer::setContext(v4, (char *)__str);
  }
}

void InputTranscoder::CTCDecoder::forwardOneTimeStep(uint64_t a1, InputTranscoder *this, const float *a3, uint64_t a4, uint64_t *a5)
{
  InputTranscoder::getPrunedLogProbs(this, a3, *(double *)(a1 + 72), *(void *)(a1 + 80), *(_DWORD *)(a1 + 104), *(_DWORD *)(a1 + 108), &v55);
  long long v7 = v56;
  if (v56 != v55)
  {
    unint64_t v8 = 0;
    uint64_t v10 = *a5;
    uint64_t v9 = a5[1];
    long long v7 = v55;
    do
    {
      long long v11 = &v7[2 * v8];
      uint64_t v12 = *(unsigned int *)v11;
      if (v12 >= *(_DWORD *)(a1 + 124) && v12 <= *(_DWORD *)(a1 + 128))
      {
        float v13 = v11[1];
        unint64_t v14 = (v9 - v10) >> 3;
        unint64_t v15 = *(void *)(a1 + 88);
        if (v14 <= v15)
        {
          double v19 = -1.79769313e308;
        }
        else
        {
          unint64_t v57 = InputTranscoder::PathTrie::prefixCompare;
          unint64_t v16 = 126 - 2 * __clz(v15);
          if (v15) {
            uint64_t v17 = v16;
          }
          else {
            uint64_t v17 = 0;
          }
          std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(InputTranscoder::PathTrie const*,InputTranscoder::PathTrie const*),InputTranscoder::PathTrie**,false>(v10, (uint64_t *)(v10 + 8 * v15), (uint64_t (**)(void))&v57, v17, 1);
          uint64_t v10 = *a5;
          double v18 = *(double *)(*(void *)(*a5 + 8 * v15 - 8) + 64);
          double v19 = v18 + logf(*((float *)this + *(unsigned int *)(a1 + 100))) - fmax(*(float *)(a1 + 56), 0.0);
          uint64_t v9 = a5[1];
        }
        if (v9 == v10)
        {
          uint64_t v9 = v10;
        }
        else if (*(void *)(a1 + 88))
        {
          unint64_t v20 = 0;
          double v21 = v13;
          while (1)
          {
            if (v14 > v15 && *(double *)(*(void *)(v10 + 8 * v20) + 64) + v21 < v19) {
              goto LABEL_69;
            }
            int v22 = *(_DWORD *)(a1 + 108);
            if (v12 != v22 || v20 < *(void *)(a1 + 112)) {
              break;
            }
LABEL_65:
            ++v20;
            uint64_t v10 = *a5;
            uint64_t v9 = a5[1];
            if (v20 >= (v9 - *a5) >> 3 || v20 >= *(void *)(a1 + 88)) {
              goto LABEL_69;
            }
          }
          uint64_t v23 = *(void *)(v10 + 8 * v20);
          if (v12 == *(_DWORD *)(a1 + 100))
          {
            double v24 = *(double *)(v23 + 48);
            double v25 = *(double *)(v23 + 64) + v21;
            if (v24 > -1.79769313e308)
            {
              if (v25 <= -1.79769313e308)
              {
                double v25 = *(double *)(v23 + 48);
              }
              else
              {
                if (v24 >= v25) {
                  double v26 = *(double *)(v23 + 48);
                }
                else {
                  double v26 = *(double *)(v23 + 64) + v21;
                }
                double v27 = exp(v24 - v26);
                long double v28 = exp(v25 - v26);
                double v25 = v26 + log(v27 + v28);
              }
            }
            *(double *)(v23 + 48) = v25;
            goto LABEL_65;
          }
          if (v12 == *(_DWORD *)(v23 + 72))
          {
            double v29 = *(double *)(v23 + 56);
            double v30 = *(double *)(v23 + 40) + v21;
            if (v29 > -1.79769313e308)
            {
              if (v30 <= -1.79769313e308)
              {
                double v30 = *(double *)(v23 + 56);
              }
              else
              {
                if (v29 >= v30) {
                  double v31 = *(double *)(v23 + 56);
                }
                else {
                  double v31 = *(double *)(v23 + 40) + v21;
                }
                double v32 = exp(v29 - v31);
                long double v33 = exp(v30 - v31);
                double v30 = v31 + log(v32 + v33);
              }
            }
            *(double *)(v23 + 56) = v30;
          }
          uint64_t v34 = (double *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, BOOL, uint64_t, float))(*(void *)v23 + 24))(v23, v12, a4, v12 == v22, a1 + 192, *(float *)(a1 + 120));
          if (!v34) {
            goto LABEL_65;
          }
          uint64_t v35 = *(void *)(v10 + 8 * v20);
          if (v12 == *(_DWORD *)(v35 + 72))
          {
            double v36 = *(double *)(v35 + 32);
            BOOL v37 = v36 <= -1.79769313e308;
            double v38 = v36 + v21;
            if (v37) {
              double v39 = -1.79769313e308;
            }
            else {
              double v39 = v38;
            }
          }
          else
          {
            double v39 = *(double *)(v35 + 64) + v21;
          }
          if (*(void *)(a1 + 208) == *(void *)(a1 + 216))
          {
            unint64_t v42 = *(void **)(a1 + 184);
            if (v42)
            {
              InputTranscoder::LMScorer::fillNgram(v42, (uint64_t)v34, a1 + 280, 10);
              LMLanguageModelConditionalProbability();
              double v44 = v43 * 2.30258512;
              double v45 = v34[7];
              double v46 = *(double *)(*(void *)(a1 + 184) + 8) + v44 * **(double **)(a1 + 184);
            }
            else
            {
              double v45 = v34[7];
              double v46 = *(float *)(a1 + 56);
            }
            double v48 = v39 + v46;
            if (v45 > -1.79769313e308)
            {
              if (v48 <= -1.79769313e308)
              {
                double v48 = v45;
              }
              else
              {
                if (v45 >= v48) {
                  double v49 = v45;
                }
                else {
                  double v49 = v39 + v46;
                }
                double v50 = v45 - v49;
LABEL_62:
                double v51 = exp(v50);
                long double v52 = exp(v48 - v49);
                double v48 = v49 + log(v51 + v52);
              }
            }
          }
          else
          {
            if (v12 == *(_DWORD *)(a1 + 108))
            {
              (*(void (**)(uint64_t))(*(void *)v35 + 40))(v35);
              uint64_t v41 = (float *)(a1 + 160);
            }
            else
            {
              (*(void (**)(double *))(*(void *)v34 + 32))(v34);
              uint64_t v41 = (float *)(a1 + 56);
            }
            double v47 = v34[7];
            double v48 = v39 + *v41 + v40 * *(float *)(a1 + 52);
            if (v47 > -1.79769313e308)
            {
              if (v48 > -1.79769313e308)
              {
                if (v47 >= v48) {
                  double v49 = v34[7];
                }
                else {
                  double v49 = v39 + *v41 + v40 * *(float *)(a1 + 52);
                }
                double v50 = v47 - v49;
                goto LABEL_62;
              }
              double v48 = v34[7];
            }
          }
          v34[7] = v48;
          goto LABEL_65;
        }
      }
LABEL_69:
      ++v8;
      long long v7 = v55;
    }
    while (v8 < ((char *)v56 - (char *)v55) >> 3);
  }
  if (v7)
  {
    v56 = v7;
    operator delete(v7);
  }
}

void sub_2369DF99C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void InputTranscoder::CTCDecoder::decode(InputTranscoder::CTCDecoder *a1, uint64_t a2, uint64_t a3)
{
  uint64_t ptr = a3;
  if (_nlpSignpostLog::token != -1) {
    dispatch_once(&_nlpSignpostLog::token, &__block_literal_global_3);
  }
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer((os_log_t)_nlpSignpostLog::log, &ptr);
  if (_nlpSignpostLog::token != -1) {
    dispatch_once(&_nlpSignpostLog::token, &__block_literal_global_3);
  }
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    CFURLRef v5 = _nlpSignpostLog::log;
    if (os_signpost_enabled((os_log_t)_nlpSignpostLog::log))
    {
      *(_WORD *)std::string buf = 0;
      _os_signpost_emit_with_name_impl(&dword_2369D6000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v4, "CTCDecode", (const char *)&unk_236A08912, buf, 2u);
    }
  }
  InputTranscoder::CTCDecoder::makeTrieRoot(a1);
}

void sub_2369DFE2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char *a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22)
{
  *(void *)(v23 - 88) = &a14;
  std::vector<InputTranscoder::CTCOutput>::__destroy_vector::operator()[abi:ne180100]((void ***)(v23 - 88));
  a14 = &a17;
  std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a14);
  if (__p)
  {
    a22 = (uint64_t)__p;
    operator delete(__p);
  }
  (*(void (**)(uint64_t))(*(void *)v22 + 8))(v22);
  _Unwind_Resume(a1);
}

void InputTranscoder::CTCDecoder::decode(InputTranscoder::CTCDecoder *this, const float *a2, uint64_t a3)
{
  uint64_t ptr = a3;
  if (_nlpSignpostLog::token != -1) {
    dispatch_once(&_nlpSignpostLog::token, &__block_literal_global_3);
  }
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer((os_log_t)_nlpSignpostLog::log, &ptr);
  if (_nlpSignpostLog::token != -1) {
    dispatch_once(&_nlpSignpostLog::token, &__block_literal_global_3);
  }
  os_signpost_id_t spid = v4;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    CFURLRef v5 = _nlpSignpostLog::log;
    if (os_signpost_enabled((os_log_t)_nlpSignpostLog::log))
    {
      *(_WORD *)std::string buf = 0;
      _os_signpost_emit_with_name_impl(&dword_2369D6000, v5, OS_SIGNPOST_INTERVAL_BEGIN, spid, "CTCDecode", (const char *)&unk_236A08912, buf, 2u);
    }
  }
  InputTranscoder::CTCDecoder::makeTrieRoot(this);
}

void sub_2369E03C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19)
{
  if (__p)
  {
    a19 = (uint64_t)__p;
    operator delete(__p);
  }
  (*(void (**)(uint64_t))(*(void *)a12 + 8))(a12);
  _Unwind_Resume(a1);
}

char *std::vector<unsigned int>::__assign_with_size[abi:ne180100]<std::__wrap_iter<unsigned int const*>,std::__wrap_iter<unsigned int const*>>(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  long long v7 = result;
  uint64_t v8 = *((void *)result + 2);
  uint64_t v9 = *(char **)result;
  if (a4 > (v8 - *(void *)result) >> 2)
  {
    if (v9)
    {
      *((void *)result + 1) = v9;
      operator delete(v9);
      uint64_t v8 = 0;
      void *v7 = 0;
      v7[1] = 0;
      void v7[2] = 0;
    }
    if (a4 >> 62) {
      std::vector<float>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v8 >> 1;
    if (v8 >> 1 <= a4) {
      uint64_t v10 = a4;
    }
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v11 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v10;
    }
    uint64_t result = std::vector<float>::__vallocate[abi:ne180100](v7, v11);
    float v13 = (char *)v7[1];
    uint64_t v12 = (void **)(v7 + 1);
    uint64_t v9 = v13;
LABEL_16:
    size_t v17 = a3 - (void)__src;
    if (v17)
    {
      double v18 = v9;
      double v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  uint64_t v12 = (void **)(result + 8);
  unint64_t v14 = (unsigned char *)*((void *)result + 1);
  unint64_t v15 = (v14 - v9) >> 2;
  if (v15 >= a4) {
    goto LABEL_16;
  }
  unint64_t v16 = &__src[4 * v15];
  if (v14 != v9)
  {
    uint64_t result = (char *)memmove(*(void **)result, __src, 4 * v15);
    uint64_t v9 = (char *)*v12;
  }
  size_t v17 = a3 - (void)v16;
  if (v17)
  {
    double v18 = v9;
    double v19 = v16;
LABEL_18:
    uint64_t result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  *uint64_t v12 = &v9[v17];
  return result;
}

uint64_t std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(InputTranscoder::PathTrie const*,InputTranscoder::PathTrie const*),InputTranscoder::PathTrie**,false>(uint64_t result, uint64_t *a2, uint64_t (**a3)(void), uint64_t a4, char a5)
{
  uint64_t v10 = (uint64_t *)result;
  while (2)
  {
    unint64_t v11 = a2 - 1;
    v84 = a2 - 2;
    v87 = a2;
    v82 = a2 - 3;
    uint64_t v12 = v10;
    while (1)
    {
      while (1)
      {
        while (1)
        {
          uint64_t v10 = v12;
          float v13 = v87;
          uint64_t v14 = (char *)v87 - (char *)v12;
          uint64_t v15 = v87 - v12;
          if (v6 || !v5)
          {
            switch(v15)
            {
              case 0:
              case 1:
                return result;
              case 2:
                uint64_t result = ((uint64_t (*)(void, uint64_t))*a3)(*(v87 - 1), *v10);
                if (result)
                {
                  uint64_t v42 = *v10;
                  *uint64_t v10 = *(v87 - 1);
                  *(v87 - 1) = v42;
                }
                break;
              case 3:
                uint64_t result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(InputTranscoder::PathTrie const*,InputTranscoder::PathTrie const*),InputTranscoder::PathTrie**>(v10, v10 + 1, v11, a3);
                break;
              case 4:
                uint64_t result = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(InputTranscoder::PathTrie const*,InputTranscoder::PathTrie const*),InputTranscoder::PathTrie**>(v10, v10 + 1, v10 + 2, v11, a3);
                break;
              case 5:
                uint64_t result = std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(InputTranscoder::PathTrie const*,InputTranscoder::PathTrie const*),InputTranscoder::PathTrie**>(v10, v10 + 1, v10 + 2, v10 + 3, v11, a3);
                break;
              default:
                JUMPOUT(0);
            }
            return result;
          }
          if (v14 <= 191)
          {
            double v43 = v10 + 1;
            BOOL v45 = v10 == v87 || v43 == v87;
            if (a5)
            {
              if (!v45)
              {
                uint64_t v46 = 0;
                double v47 = v10;
                do
                {
                  uint64_t v49 = *v47;
                  uint64_t v48 = v47[1];
                  double v47 = v43;
                  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t))*a3)(v48, v49);
                  if (result)
                  {
                    uint64_t v50 = *v47;
                    uint64_t v51 = v46;
                    while (1)
                    {
                      *(uint64_t *)((char *)v10 + v51 + 8) = *(uint64_t *)((char *)v10 + v51);
                      if (!v51) {
                        break;
                      }
                      uint64_t result = ((uint64_t (*)(uint64_t, void))*a3)(v50, *(uint64_t *)((char *)v10 + v51 - 8));
                      v51 -= 8;
                      if ((result & 1) == 0)
                      {
                        long double v52 = (uint64_t *)((char *)v10 + v51 + 8);
                        goto LABEL_81;
                      }
                    }
                    long double v52 = v10;
LABEL_81:
                    *long double v52 = v50;
                  }
                  double v43 = v47 + 1;
                  v46 += 8;
                }
                while (v47 + 1 != v87);
              }
            }
            else if (!v45)
            {
              do
              {
                uint64_t v77 = *v10;
                uint64_t v76 = v10[1];
                uint64_t v10 = v43;
                uint64_t result = ((uint64_t (*)(uint64_t, uint64_t))*a3)(v76, v77);
                if (result)
                {
                  uint64_t v78 = *v10;
                  v79 = v10;
                  do
                  {
                    v80 = v79;
                    uint64_t v81 = *--v79;
                    uint64_t *v80 = v81;
                    uint64_t result = ((uint64_t (*)(uint64_t, void))*a3)(v78, *(v80 - 2));
                  }
                  while ((result & 1) != 0);
                  uint64_t *v79 = v78;
                }
                double v43 = v10 + 1;
              }
              while (v10 + 1 != v87);
            }
            return result;
          }
          if (!a4)
          {
            if (v10 != v87)
            {
              int64_t v53 = (unint64_t)(v15 - 2) >> 1;
              int64_t v85 = v53;
              do
              {
                int64_t v54 = v53;
                if (v85 >= v53)
                {
                  uint64_t v55 = (2 * v53) | 1;
                  v56 = &v10[v55];
                  if (2 * v53 + 2 < v15 && ((unsigned int (*)(uint64_t, uint64_t))*a3)(*v56, v56[1]))
                  {
                    ++v56;
                    uint64_t v55 = 2 * v54 + 2;
                  }
                  unint64_t v57 = &v10[v54];
                  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t))*a3)(*v56, *v57);
                  if ((result & 1) == 0)
                  {
                    int64_t v83 = v54;
                    uint64_t v58 = *v57;
                    do
                    {
                      v59 = v56;
                      *unint64_t v57 = *v56;
                      if (v85 < v55) {
                        break;
                      }
                      uint64_t v60 = (2 * v55) | 1;
                      v56 = &v10[v60];
                      if (2 * v55 + 2 < v15 && ((unsigned int (*)(uint64_t, uint64_t))*a3)(*v56, v56[1]))
                      {
                        ++v56;
                        uint64_t v60 = 2 * v55 + 2;
                      }
                      uint64_t result = ((uint64_t (*)(uint64_t, uint64_t))*a3)(*v56, v58);
                      unint64_t v57 = v59;
                      uint64_t v55 = v60;
                    }
                    while (!result);
                    uint64_t *v59 = v58;
                    float v13 = v87;
                    int64_t v54 = v83;
                  }
                }
                int64_t v53 = v54 - 1;
              }
              while (v54);
              uint64_t v61 = (unint64_t)v14 >> 3;
              do
              {
                v62 = v13;
                uint64_t v63 = 0;
                uint64_t v64 = v61 - 2;
                uint64_t v86 = *v10;
                if (v61 < 2) {
                  uint64_t v64 = v61 - 1;
                }
                uint64_t v65 = v64 >> 1;
                char v66 = v10;
                do
                {
                  v67 = &v66[v63 + 1];
                  uint64_t v68 = (2 * v63) | 1;
                  uint64_t v69 = 2 * v63 + 2;
                  if (v69 < v61)
                  {
                    uint64_t result = ((uint64_t (*)(uint64_t, uint64_t))*a3)(v66[v63 + 1], v66[v63 + 2]);
                    if (result)
                    {
                      ++v67;
                      uint64_t v68 = v69;
                    }
                  }
                  *char v66 = *v67;
                  char v66 = v67;
                  uint64_t v63 = v68;
                }
                while (v68 <= v65);
                float v13 = v62 - 1;
                if (v67 == v62 - 1)
                {
                  uint64_t *v67 = v86;
                }
                else
                {
                  uint64_t *v67 = *v13;
                  *float v13 = v86;
                  uint64_t v70 = (char *)v67 - (char *)v10 + 8;
                  if (v70 >= 9)
                  {
                    unint64_t v71 = (((unint64_t)v70 >> 3) - 2) >> 1;
                    v72 = &v10[v71];
                    uint64_t result = ((uint64_t (*)(uint64_t, uint64_t))*a3)(*v72, *v67);
                    if (result)
                    {
                      uint64_t v73 = *v67;
                      do
                      {
                        v74 = v72;
                        uint64_t *v67 = *v72;
                        if (!v71) {
                          break;
                        }
                        unint64_t v71 = (v71 - 1) >> 1;
                        v72 = &v10[v71];
                        uint64_t result = ((uint64_t (*)(uint64_t, uint64_t))*a3)(*v72, v73);
                        v67 = v74;
                      }
                      while ((result & 1) != 0);
                      uint64_t *v74 = v73;
                    }
                  }
                }
              }
              while (v61-- > 2);
            }
            return result;
          }
          unint64_t v16 = (unint64_t)v15 >> 1;
          size_t v17 = &v10[(unint64_t)v15 >> 1];
          if ((unint64_t)v14 < 0x401)
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(InputTranscoder::PathTrie const*,InputTranscoder::PathTrie const*),InputTranscoder::PathTrie**>(v17, v10, v11, a3);
          }
          else
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(InputTranscoder::PathTrie const*,InputTranscoder::PathTrie const*),InputTranscoder::PathTrie**>(v10, v17, v11, a3);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(InputTranscoder::PathTrie const*,InputTranscoder::PathTrie const*),InputTranscoder::PathTrie**>(v10 + 1, v17 - 1, v84, a3);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(InputTranscoder::PathTrie const*,InputTranscoder::PathTrie const*),InputTranscoder::PathTrie**>(v10 + 2, &v10[v16 + 1], v82, a3);
            float v13 = v87;
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(InputTranscoder::PathTrie const*,InputTranscoder::PathTrie const*),InputTranscoder::PathTrie**>(v17 - 1, v17, &v10[v16 + 1], a3);
            uint64_t v18 = *v10;
            *uint64_t v10 = *v17;
            uint64_t *v17 = v18;
          }
          --a4;
          if (a5 & 1) != 0 || (((uint64_t (*)(void, uint64_t))*a3)(*(v10 - 1), *v10)) {
            break;
          }
          uint64_t v33 = *v10;
          uint64_t result = ((uint64_t (*)(uint64_t, uint64_t))*a3)(*v10, *v11);
          if (result)
          {
            uint64_t v12 = v10;
            do
            {
              uint64_t v34 = v12[1];
              ++v12;
              uint64_t result = ((uint64_t (*)(uint64_t, uint64_t))*a3)(v33, v34);
            }
            while ((result & 1) == 0);
          }
          else
          {
            uint64_t v35 = v10 + 1;
            do
            {
              uint64_t v12 = v35;
              if (v35 >= v87) {
                break;
              }
              ++v35;
              uint64_t result = ((uint64_t (*)(uint64_t, uint64_t))*a3)(v33, *v12);
            }
            while (!result);
          }
          double v36 = v87;
          if (v12 < v87)
          {
            double v36 = v87;
            do
            {
              uint64_t v37 = *--v36;
              uint64_t result = ((uint64_t (*)(uint64_t, uint64_t))*a3)(v33, v37);
            }
            while ((result & 1) != 0);
          }
          while (v12 < v36)
          {
            uint64_t v38 = *v12;
            *uint64_t v12 = *v36;
            uint64_t *v36 = v38;
            do
            {
              uint64_t v39 = v12[1];
              ++v12;
            }
            while (!((unsigned int (*)(uint64_t, uint64_t))*a3)(v33, v39));
            do
            {
              uint64_t v40 = *--v36;
              uint64_t result = ((uint64_t (*)(uint64_t, uint64_t))*a3)(v33, v40);
            }
            while ((result & 1) != 0);
          }
          uint64_t v41 = v12 - 1;
          BOOL v5 = v12 - 1 >= v10;
          BOOL v6 = v12 - 1 == v10;
          if (v12 - 1 != v10) {
            *uint64_t v10 = *v41;
          }
          a5 = 0;
          uint64_t *v41 = v33;
        }
        uint64_t v19 = 0;
        uint64_t v20 = *v10;
        do
          char v21 = ((uint64_t (*)(uint64_t, uint64_t))*a3)(v10[++v19], v20);
        while ((v21 & 1) != 0);
        uint64_t v22 = &v10[v19];
        uint64_t v23 = v13;
        if (v19 == 1)
        {
          uint64_t v23 = v13;
          do
          {
            if (v22 >= v23) {
              break;
            }
            uint64_t v25 = *--v23;
          }
          while ((((uint64_t (*)(uint64_t, uint64_t))*a3)(v25, v20) & 1) == 0);
        }
        else
        {
          do
            uint64_t v24 = *--v23;
          while (!((unsigned int (*)(uint64_t, uint64_t))*a3)(v24, v20));
        }
        if (v22 >= v23)
        {
          double v31 = v22 - 1;
        }
        else
        {
          double v26 = &v10[v19];
          double v27 = v23;
          do
          {
            uint64_t v28 = *v26;
            *double v26 = *v27;
            *double v27 = v28;
            do
            {
              uint64_t v29 = v26[1];
              ++v26;
            }
            while ((((uint64_t (*)(uint64_t, uint64_t))*a3)(v29, v20) & 1) != 0);
            do
              uint64_t v30 = *--v27;
            while (!((unsigned int (*)(uint64_t, uint64_t))*a3)(v30, v20));
          }
          while (v26 < v27);
          double v31 = v26 - 1;
        }
        if (v31 != v10) {
          *uint64_t v10 = *v31;
        }
        *double v31 = v20;
        if (v22 >= v23) {
          break;
        }
LABEL_33:
        uint64_t result = std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(InputTranscoder::PathTrie const*,InputTranscoder::PathTrie const*),InputTranscoder::PathTrie**,false>(v10, v31, a3, a4, a5 & 1);
        a5 = 0;
        uint64_t v12 = v31 + 1;
      }
      BOOL v32 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(InputTranscoder::PathTrie const*,InputTranscoder::PathTrie const*),InputTranscoder::PathTrie**>(v10, v31, a3);
      uint64_t v12 = v31 + 1;
      uint64_t result = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(InputTranscoder::PathTrie const*,InputTranscoder::PathTrie const*),InputTranscoder::PathTrie**>(v31 + 1, v87, a3);
      if (result) {
        break;
      }
      if (!v32) {
        goto LABEL_33;
      }
    }
    a2 = v31;
    if (!v32) {
      continue;
    }
    return result;
  }
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(InputTranscoder::PathTrie const*,InputTranscoder::PathTrie const*),InputTranscoder::PathTrie**>(void *a1, void *a2, void *a3, uint64_t (**a4)(void))
{
  char v8 = ((uint64_t (*)(void, void))*a4)(*a2, *a1);
  uint64_t result = ((uint64_t (*)(void, void))*a4)(*a3, *a2);
  if (v8)
  {
    uint64_t v10 = *a1;
    if (result)
    {
      *a1 = *a3;
      *a3 = v10;
    }
    else
    {
      *a1 = *a2;
      *a2 = v10;
      uint64_t result = (*a4)(*a3);
      if (result)
      {
        uint64_t v13 = *a2;
        *a2 = *a3;
        *a3 = v13;
      }
    }
  }
  else if (result)
  {
    uint64_t v11 = *a2;
    *a2 = *a3;
    *a3 = v11;
    uint64_t result = ((uint64_t (*)(void, void))*a4)(*a2, *a1);
    if (result)
    {
      uint64_t v12 = *a1;
      *a1 = *a2;
      *a2 = v12;
    }
  }
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(InputTranscoder::PathTrie const*,InputTranscoder::PathTrie const*),InputTranscoder::PathTrie**>(void *a1, void *a2, uint64_t (**a3)(void))
{
  uint64_t v6 = a2 - a1;
  BOOL result = 1;
  switch(v6)
  {
    case 0:
    case 1:
      return result;
    case 2:
      if (((unsigned int (*)(void, void))*a3)(*(a2 - 1), *a1))
      {
        uint64_t v8 = *a1;
        *a1 = *(a2 - 1);
        *(a2 - 1) = v8;
      }
      return 1;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(InputTranscoder::PathTrie const*,InputTranscoder::PathTrie const*),InputTranscoder::PathTrie**>(a1, a1 + 1, a2 - 1, a3);
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(InputTranscoder::PathTrie const*,InputTranscoder::PathTrie const*),InputTranscoder::PathTrie**>(a1, a1 + 1, a1 + 2, a2 - 1, a3);
      return 1;
    case 5:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(InputTranscoder::PathTrie const*,InputTranscoder::PathTrie const*),InputTranscoder::PathTrie**>(a1, a1 + 1, a1 + 2, a1 + 3, a2 - 1, a3);
      return 1;
    default:
      uint64_t v9 = a1 + 2;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(InputTranscoder::PathTrie const*,InputTranscoder::PathTrie const*),InputTranscoder::PathTrie**>(a1, a1 + 1, a1 + 2, a3);
      uint64_t v10 = a1 + 3;
      if (a1 + 3 == a2) {
        return 1;
      }
      uint64_t v11 = 0;
      int v12 = 0;
      break;
  }
  while (1)
  {
    if (((unsigned int (*)(void, void))*a3)(*v10, *v9))
    {
      uint64_t v13 = *v10;
      uint64_t v14 = v11;
      while (1)
      {
        uint64_t v15 = (char *)a1 + v14;
        *(void *)((char *)a1 + v14 + 24) = *(void *)((char *)a1 + v14 + 16);
        if (v14 == -16) {
          break;
        }
        v14 -= 8;
        if ((((uint64_t (*)(uint64_t, void))*a3)(v13, *((void *)v15 + 1)) & 1) == 0)
        {
          unint64_t v16 = (void *)((char *)a1 + v14 + 24);
          goto LABEL_12;
        }
      }
      unint64_t v16 = a1;
LABEL_12:
      *unint64_t v16 = v13;
      if (++v12 == 8) {
        return v10 + 1 == a2;
      }
    }
    uint64_t v9 = v10;
    v11 += 8;
    if (++v10 == a2) {
      return 1;
    }
  }
}

uint64_t std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(InputTranscoder::PathTrie const*,InputTranscoder::PathTrie const*),InputTranscoder::PathTrie**>(void *a1, void *a2, void *a3, void *a4, uint64_t (**a5)(void))
{
  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(InputTranscoder::PathTrie const*,InputTranscoder::PathTrie const*),InputTranscoder::PathTrie**>(a1, a2, a3, a5);
  uint64_t result = ((uint64_t (*)(void, void))*a5)(*a4, *a3);
  if (result)
  {
    uint64_t v11 = *a3;
    *a3 = *a4;
    *a4 = v11;
    uint64_t result = ((uint64_t (*)(void, void))*a5)(*a3, *a2);
    if (result)
    {
      uint64_t v12 = *a2;
      *a2 = *a3;
      *a3 = v12;
      uint64_t result = ((uint64_t (*)(void, void))*a5)(*a2, *a1);
      if (result)
      {
        uint64_t v13 = *a1;
        *a1 = *a2;
        *a2 = v13;
      }
    }
  }
  return result;
}

uint64_t std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(InputTranscoder::PathTrie const*,InputTranscoder::PathTrie const*),InputTranscoder::PathTrie**>(void *a1, void *a2, void *a3, void *a4, void *a5, uint64_t (**a6)(void))
{
  std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(InputTranscoder::PathTrie const*,InputTranscoder::PathTrie const*),InputTranscoder::PathTrie**>(a1, a2, a3, a4, a6);
  uint64_t result = ((uint64_t (*)(void, void))*a6)(*a5, *a4);
  if (result)
  {
    uint64_t v13 = *a4;
    *a4 = *a5;
    *a5 = v13;
    uint64_t result = ((uint64_t (*)(void, void))*a6)(*a4, *a3);
    if (result)
    {
      uint64_t v14 = *a3;
      *a3 = *a4;
      *a4 = v14;
      uint64_t result = ((uint64_t (*)(void, void))*a6)(*a3, *a2);
      if (result)
      {
        uint64_t v15 = *a2;
        *a2 = *a3;
        *a3 = v15;
        uint64_t result = ((uint64_t (*)(void, void))*a6)(*a2, *a1);
        if (result)
        {
          uint64_t v16 = *a1;
          *a1 = *a2;
          *a2 = v16;
        }
      }
    }
  }
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<InputTranscoder::PathTrie *>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

uint64_t std::__nth_element[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(InputTranscoder::PathTrie const*,InputTranscoder::PathTrie const*),std::__wrap_iter<InputTranscoder::PathTrie**>>(uint64_t result, char *a2, char *a3, unsigned int (**a4)(void))
{
  if (a3 != a2)
  {
    BOOL v5 = a3;
    long long v7 = (char *)result;
    do
    {
      unint64_t v8 = (v5 - v7) >> 3;
      if (v8 < 2) {
        break;
      }
      if (v8 == 3)
      {
        return std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(InputTranscoder::PathTrie const*,InputTranscoder::PathTrie const*),std::__wrap_iter<InputTranscoder::PathTrie**>>(v7, (void *)v7 + 1, (void *)v5 - 1, a4);
      }
      if (v8 == 2)
      {
        uint64_t result = ((uint64_t (*)(void, void))*a4)(*((void *)v5 - 1), *(void *)v7);
        if (result)
        {
          uint64_t v28 = *(void *)v7;
          *(void *)long long v7 = *((void *)v5 - 1);
          *((void *)v5 - 1) = v28;
        }
        return result;
      }
      if (v5 - v7 <= 63)
      {
        while (v7 != v5 - 8)
        {
          uint64_t v29 = v7;
          v7 += 8;
          if (v29 != v5 && v7 != v5)
          {
            uint64_t v30 = v7;
            double v31 = v29;
            BOOL v32 = v7;
            do
            {
              uint64_t v33 = *(void *)v32;
              v32 += 8;
              uint64_t result = ((uint64_t (*)(uint64_t, void))*a4)(v33, *(void *)v31);
              if (result) {
                double v31 = v30;
              }
              uint64_t v30 = v32;
            }
            while (v32 != v5);
            if (v31 != v29)
            {
              uint64_t v34 = *(void *)v29;
              *(void *)uint64_t v29 = *(void *)v31;
              *(void *)double v31 = v34;
            }
          }
        }
        return result;
      }
      uint64_t v9 = &v7[8 * (v8 >> 1)];
      uint64_t v10 = v5 - 8;
      int v11 = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(InputTranscoder::PathTrie const*,InputTranscoder::PathTrie const*),std::__wrap_iter<InputTranscoder::PathTrie**>>(v7, v9, (void *)v5 - 1, a4);
      uint64_t result = ((uint64_t (*)(void, void))*a4)(*(void *)v7, *(void *)v9);
      if (result)
      {
        uint64_t v12 = v5 - 8;
LABEL_13:
        uint64_t v14 = v7 + 8;
        if (v7 + 8 >= v12)
        {
          uint64_t v16 = v7 + 8;
        }
        else
        {
          uint64_t v15 = v7 + 8;
          while (1)
          {
            uint64_t v16 = (char *)(v15 - 1);
            do
            {
              uint64_t v17 = *((void *)v16 + 1);
              v16 += 8;
            }
            while ((((uint64_t (*)(uint64_t, void))*a4)(v17, *(void *)v9) & 1) != 0);
            uint64_t v15 = v16 + 8;
            do
            {
              uint64_t v18 = *((void *)v12 - 1);
              v12 -= 8;
              uint64_t result = ((uint64_t (*)(uint64_t, void))*a4)(v18, *(void *)v9);
            }
            while (!result);
            if (v16 >= v12) {
              break;
            }
            uint64_t v19 = *(void *)v16;
            *(void *)uint64_t v16 = *(void *)v12;
            *(void *)uint64_t v12 = v19;
            ++v11;
            if (v16 == v9) {
              uint64_t v9 = v12;
            }
          }
        }
        if (v16 != v9)
        {
          uint64_t result = ((uint64_t (*)(void, void))*a4)(*(void *)v9, *(void *)v16);
          if (result)
          {
            uint64_t v20 = *(void *)v16;
            *(void *)uint64_t v16 = *(void *)v9;
            *(void *)uint64_t v9 = v20;
            ++v11;
          }
        }
        if (v16 == a2) {
          return result;
        }
        if (!v11)
        {
          if (v16 <= a2)
          {
            uint64_t v23 = v16 + 8;
            while (v23 != v5)
            {
              uint64_t result = ((uint64_t (*)(void, void))*a4)(*(void *)v23, *((void *)v23 - 1));
              v23 += 8;
              if (result) {
                goto LABEL_29;
              }
            }
          }
          else
          {
            while (v14 != v16)
            {
              uint64_t result = ((uint64_t (*)(void, void))*a4)(*(void *)v14, *((void *)v14 - 1));
              v14 += 8;
              if (result) {
                goto LABEL_29;
              }
            }
          }
          return result;
        }
LABEL_29:
        if (v16 <= a2)
        {
          char v21 = v16 + 8;
        }
        else
        {
          BOOL v5 = v16;
          char v21 = v7;
        }
      }
      else
      {
        uint64_t v12 = v5 - 8;
        while (1)
        {
          v12 -= 8;
          if (v12 == v7) {
            break;
          }
          uint64_t result = ((uint64_t (*)(void, void))*a4)(*(void *)v12, *(void *)v9);
          if (result)
          {
            uint64_t v13 = *(void *)v7;
            *(void *)long long v7 = *(void *)v12;
            *(void *)uint64_t v12 = v13;
            ++v11;
            goto LABEL_13;
          }
        }
        uint64_t v22 = v7 + 8;
        uint64_t result = ((uint64_t (*)(void, void))*a4)(*(void *)v7, *(void *)v10);
        if ((result & 1) == 0)
        {
          while (v22 != v10)
          {
            uint64_t result = ((uint64_t (*)(void, void))*a4)(*(void *)v7, *(void *)v22);
            if (result)
            {
              uint64_t v24 = *(void *)v22;
              *(void *)uint64_t v22 = *(void *)v10;
              v22 += 8;
              *(void *)uint64_t v10 = v24;
              goto LABEL_45;
            }
            v22 += 8;
          }
          return result;
        }
LABEL_45:
        if (v22 == v10) {
          return result;
        }
        while (1)
        {
          char v21 = v22 - 8;
          do
          {
            uint64_t v25 = *((void *)v21 + 1);
            v21 += 8;
          }
          while (!((unsigned int (*)(void, uint64_t))*a4)(*(void *)v7, v25));
          uint64_t v22 = v21 + 8;
          do
          {
            uint64_t v26 = *((void *)v10 - 1);
            v10 -= 8;
            uint64_t result = ((uint64_t (*)(void, uint64_t))*a4)(*(void *)v7, v26);
          }
          while ((result & 1) != 0);
          if (v21 >= v10) {
            break;
          }
          uint64_t v27 = *(void *)v21;
          *(void *)char v21 = *(void *)v10;
          *(void *)uint64_t v10 = v27;
        }
        if (v21 > a2) {
          return result;
        }
      }
      long long v7 = v21;
    }
    while (v5 != a2);
  }
  return result;
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(InputTranscoder::PathTrie const*,InputTranscoder::PathTrie const*),std::__wrap_iter<InputTranscoder::PathTrie**>>(void *a1, void *a2, void *a3, unsigned int (**a4)(void))
{
  char v8 = ((uint64_t (*)(void, void))*a4)(*a2, *a1);
  uint64_t result = ((uint64_t (*)(void, void))*a4)(*a3, *a2);
  if ((v8 & 1) == 0)
  {
    if (!result) {
      return result;
    }
    uint64_t v11 = *a2;
    *a2 = *a3;
    *a3 = v11;
    if (!((unsigned int (*)(void, void))*a4)(*a2, *a1)) {
      return 1;
    }
    uint64_t v12 = *a1;
    *a1 = *a2;
    *a2 = v12;
    return 2;
  }
  uint64_t v10 = *a1;
  if (!result)
  {
    *a1 = *a2;
    *a2 = v10;
    if (!(*a4)(*a3)) {
      return 1;
    }
    uint64_t v13 = *a2;
    *a2 = *a3;
    *a3 = v13;
    return 2;
  }
  *a1 = *a3;
  *a3 = v10;
  return 1;
}

void std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>>::__vdeallocate(void **a1)
{
  uint64_t v1 = *a1;
  if (*a1)
  {
    uint64_t v3 = (uint64_t)a1[1];
    os_signpost_id_t v4 = *a1;
    if ((void *)v3 != v1)
    {
      do
      {
        v3 -= 72;
        std::__destroy_at[abi:ne180100]<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>,0>(v3);
      }
      while ((void *)v3 != v1);
      os_signpost_id_t v4 = *a1;
    }
    a1[1] = v1;
    operator delete(v4);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>,0>(uint64_t a1)
{
  if (*(char *)(a1 + 55) < 0) {
    operator delete(*(void **)(a1 + 32));
  }
  if (*(char *)(a1 + 31) < 0)
  {
    uint64_t v2 = *(void **)(a1 + 8);
    operator delete(v2);
  }
}

void std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    BOOL v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 72;
        std::__destroy_at[abi:ne180100]<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>,0>(v4);
      }
      while ((void *)v4 != v2);
      BOOL v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::vector<InputTranscoder::CTCOutput>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<InputTranscoder::CTCOutput>::__clear[abi:ne180100]((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<InputTranscoder::CTCOutput>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  if (v2 != *a1)
  {
    uint64_t v4 = a1[1];
    do
    {
      uint64_t v6 = *(void **)(v4 - 32);
      v4 -= 32;
      BOOL v5 = v6;
      if (v6)
      {
        *(void *)(v2 - 24) = v5;
        operator delete(v5);
      }
      uint64_t v2 = v4;
    }
    while (v4 != v3);
  }
  a1[1] = v3;
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);

  JUMPOUT(0x237E08BB0);
}

BOOL InputTranscoder::PathTrie::prefixCompare(uint64_t a1, uint64_t a2)
{
  double v2 = *(double *)(a1 + 64);
  double v3 = *(double *)(a2 + 64);
  if (v2 == v3) {
    return *(_DWORD *)(a1 + 72) < *(_DWORD *)(a2 + 72);
  }
  else {
    return v2 > v3;
  }
}

void InputTranscoder::PathTrie::~PathTrie(InputTranscoder::PathTrie *this)
{
  *(void *)this = &unk_26E9DA508;
  double v2 = (void *)*((void *)this + 1);
  double v3 = (void *)*((void *)this + 2);
  if (v2 != v3)
  {
    do
    {
      if (*v2) {
        (*(void (**)(void))(*(void *)*v2 + 8))(*v2);
      }
      ++v2;
    }
    while (v2 != v3);
    double v2 = (void *)*((void *)this + 1);
  }
  if (v2)
  {
    *((void *)this + 2) = v2;
    operator delete(v2);
  }
}

{
  uint64_t vars8;

  InputTranscoder::PathTrie::~PathTrie(this);

  JUMPOUT(0x237E08BB0);
}

uint64_t InputTranscoder::PathTrie::remove(uint64_t this)
{
  *(unsigned char *)(this + 84) = 0;
  if (*(void *)(this + 8) == *(void *)(this + 16))
  {
    uint64_t v1 = (void *)this;
    uint64_t v2 = *(void *)(this + 88);
    double v3 = *(char **)(v2 + 8);
    uint64_t v4 = *(char **)(v2 + 16);
    if (v3 == v4) {
      goto LABEL_18;
    }
    uint64_t v5 = 0;
    while (*(_DWORD *)(*(void *)&v3[v5] + 72) != *(_DWORD *)(this + 72))
    {
      v5 += 8;
      if (&v3[v5] == v4) {
        goto LABEL_10;
      }
    }
    uint64_t v6 = &v3[v5];
    long long v7 = &v3[v5 + 8];
    uint64_t v8 = *(void *)(this + 88);
    int64_t v9 = v4 - v7;
    if (v4 != v7)
    {
      memmove(v6, v7, v4 - v7);
      uint64_t v8 = v1[11];
      double v3 = *(char **)(v8 + 8);
    }
    *(void *)(v2 + 16) = &v6[v9];
    uint64_t v4 = *(char **)(v8 + 16);
    uint64_t v2 = v8;
LABEL_10:
    if (v3 == v4)
    {
LABEL_18:
      if (!*(unsigned char *)(v2 + 84)) {
        InputTranscoder::PathTrie::remove((InputTranscoder::PathTrie *)v2);
      }
    }
    uint64_t v10 = *(uint64_t (**)(void *))(*v1 + 8);
    return v10(v1);
  }
  return this;
}

uint64_t InputTranscoder::PathTrie::getPath(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1;
  uint64_t v5 = (int *)(a1 + 72);
  int v4 = *(_DWORD *)(a1 + 72);
  if (v4 == -1)
  {
    uint64_t v8 = *(_DWORD **)(a2 + 8);
  }
  else
  {
    uint64_t v6 = (void *)(a2 + 16);
    long long v7 = *(_DWORD **)(a2 + 8);
    do
    {
      if ((unint64_t)v7 >= *v6)
      {
        int64_t v9 = *(_DWORD **)a2;
        uint64_t v10 = ((uint64_t)v7 - *(void *)a2) >> 2;
        unint64_t v11 = v10 + 1;
        if ((unint64_t)(v10 + 1) >> 62) {
          std::vector<float>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v12 = *v6 - (void)v9;
        if (v12 >> 1 > v11) {
          unint64_t v11 = v12 >> 1;
        }
        if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v13 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v13 = v11;
        }
        if (v13)
        {
          uint64_t v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(a2 + 16, v13);
          int64_t v9 = *(_DWORD **)a2;
          long long v7 = *(_DWORD **)(a2 + 8);
          int v4 = *v5;
        }
        else
        {
          uint64_t v14 = 0;
        }
        uint64_t v15 = &v14[4 * v10];
        *(_DWORD *)uint64_t v15 = v4;
        uint64_t v8 = v15 + 4;
        while (v7 != v9)
        {
          int v16 = *--v7;
          *((_DWORD *)v15 - 1) = v16;
          v15 -= 4;
        }
        *(void *)a2 = v15;
        *(void *)(a2 + 8) = v8;
        *(void *)(a2 + 16) = &v14[4 * v13];
        if (v9) {
          operator delete(v9);
        }
      }
      else
      {
        _DWORD *v7 = v4;
        uint64_t v8 = v7 + 1;
      }
      *(void *)(a2 + 8) = v8;
      uint64_t v3 = *(void *)(v3 + 88);
      uint64_t v5 = (int *)(v3 + 72);
      int v4 = *(_DWORD *)(v3 + 72);
      long long v7 = v8;
    }
    while (v4 != -1);
  }
  uint64_t v17 = *(_DWORD **)a2;
  uint64_t v18 = v8 - 1;
  if (*(_DWORD **)a2 != v8 && v18 > v17)
  {
    unint64_t v20 = (unint64_t)(v17 + 1);
    do
    {
      int v21 = *(_DWORD *)(v20 - 4);
      *(_DWORD *)(v20 - 4) = *v18;
      *v18-- = v21;
      BOOL v22 = v20 >= (unint64_t)v18;
      v20 += 4;
    }
    while (!v22);
  }
  return v3;
}

int64x2_t *InputTranscoder::PathTrie::getPathTrie(InputTranscoder::PathTrie *this, int a2, unsigned int a3, BOOL a4, float a5, const InputTranscoder::LexiconContainer *a6)
{
  uint64_t v6 = (int64x2_t **)*((void *)this + 1);
  long long v7 = (int64x2_t **)*((void *)this + 2);
  if (v6 != v7)
  {
    while ((*v6)[4].i32[2] != a2)
    {
      if (++v6 == v7) {
        goto LABEL_8;
      }
    }
  }
  if (v6 == v7) {
LABEL_8:
  }
    operator new();
  uint64_t v8 = *v6;
  if (!(*v6)[5].i8[4])
  {
    int64x2_t v9 = vdupq_n_s64(0xFFEFFFFFFFFFFFFFLL);
    v8[2] = v9;
    v8[3] = v9;
    v8[5].i8[4] = 1;
  }
  return v8;
}

void InputTranscoder::PathTrie::iterateToVec(uint64_t a1, void **a2)
{
  if (*(unsigned char *)(a1 + 84))
  {
    double v4 = *(double *)(a1 + 48);
    double v5 = *(double *)(a1 + 56);
    *(double *)(a1 + 32) = v4;
    *(double *)(a1 + 40) = v5;
    if (v4 > -1.79769313e308)
    {
      if (v5 <= -1.79769313e308)
      {
        double v5 = v4;
      }
      else
      {
        if (v4 >= v5) {
          double v6 = v4;
        }
        else {
          double v6 = v5;
        }
        double v7 = exp(v4 - v6);
        long double v8 = exp(v5 - v6);
        double v5 = v6 + log(v7 + v8);
      }
    }
    *(double *)(a1 + 64) = v5;
    *(int64x2_t *)(a1 + 48) = vdupq_n_s64(0xFFEFFFFFFFFFFFFFLL);
    unint64_t v9 = (unint64_t)a2[2];
    uint64_t v10 = a2[1];
    if ((unint64_t)v10 >= v9)
    {
      uint64_t v12 = ((char *)v10 - (unsigned char *)*a2) >> 3;
      if ((unint64_t)(v12 + 1) >> 61) {
        std::vector<InputTranscoder::PathTrie *>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v13 = v9 - (void)*a2;
      uint64_t v14 = v13 >> 2;
      if (v13 >> 2 <= (unint64_t)(v12 + 1)) {
        uint64_t v14 = v12 + 1;
      }
      if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v15 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v15 = v14;
      }
      if (v15) {
        int v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<InputTranscoder::PathTrie *>>((uint64_t)(a2 + 2), v15);
      }
      else {
        int v16 = 0;
      }
      uint64_t v17 = &v16[8 * v12];
      uint64_t v18 = &v16[8 * v15];
      *(void *)uint64_t v17 = a1;
      unint64_t v11 = v17 + 8;
      unint64_t v20 = (char *)*a2;
      uint64_t v19 = (char *)a2[1];
      if (v19 != *a2)
      {
        do
        {
          uint64_t v21 = *((void *)v19 - 1);
          v19 -= 8;
          *((void *)v17 - 1) = v21;
          v17 -= 8;
        }
        while (v19 != v20);
        uint64_t v19 = (char *)*a2;
      }
      *a2 = v17;
      a2[1] = v11;
      a2[2] = v18;
      if (v19) {
        operator delete(v19);
      }
    }
    else
    {
      *uint64_t v10 = a1;
      unint64_t v11 = v10 + 1;
    }
    a2[1] = v11;
  }
  uint64_t v23 = *(uint64_t **)(a1 + 8);
  BOOL v22 = *(uint64_t **)(a1 + 16);
  while (v23 != v22)
  {
    uint64_t v24 = *v23++;
    InputTranscoder::PathTrie::iterateToVec(v24, a2);
  }
}

__n128 InputTranscoder::LexiconPathTrie::LexiconPathTrie(int64x2_t *a1, uint64_t a2, __int32 a3, __int32 a4, uint64_t a5, __n128 *a6)
{
  a1->i64[1] = 0;
  a1[1].i64[0] = 0;
  a1[1].i64[1] = 0;
  int64x2_t v6 = vdupq_n_s64(0xFFEFFFFFFFFFFFFFLL);
  a1[2] = v6;
  a1[3] = v6;
  a1[4].i64[0] = 0xFFEFFFFFFFFFFFFFLL;
  a1[4].i32[2] = a3;
  a1[4].i32[3] = a4;
  if (a5) {
    int v7 = *(_DWORD *)(a5 + 80) + 1;
  }
  else {
    int v7 = 1;
  }
  a1[5].i32[0] = v7;
  a1[5].i8[4] = 1;
  a1[5].i64[1] = a5;
  a1[6].i64[0] = a2;
  a1->i64[0] = (uint64_t)&unk_26E9DA568;
  a1[6].i64[1] = 0;
  a1[7].i64[0] = 0;
  a1[7].i64[1] = 0;
  __n128 result = *a6;
  *(int64x2_t *)((char *)a1 + 104) = *(int64x2_t *)a6;
  a1[7].i64[1] = a6[1].n128_i64[0];
  a6->n128_u64[0] = 0;
  a6->n128_u64[1] = 0;
  a6[1].n128_u64[0] = 0;
  return result;
}

int64x2_t *InputTranscoder::LexiconPathTrie::getPathTrie(InputTranscoder::LexiconPathTrie *this, int a2, unsigned int a3, int a4, __n128 a5, const InputTranscoder::LexiconContainer *a6)
{
  long double v8 = (int64x2_t **)*((void *)this + 1);
  unint64_t v9 = (int64x2_t **)*((void *)this + 2);
  if (v8 != v9)
  {
    while ((*v8)[4].i32[2] != a2)
    {
      if (++v8 == v9) {
        goto LABEL_8;
      }
    }
  }
  if (v8 == v9)
  {
LABEL_8:
    if (*((void *)a6 + 2) == *((void *)a6 + 3))
    {
      return 0;
    }
    else
    {
      __p[0] = 0;
      __p[1] = 0;
      v33[0] = 0;
      if (a4)
      {
        if ((*(unsigned int (**)(InputTranscoder::LexiconPathTrie *, __n128))(*(void *)this + 16))(this, a5))
        {
          InputTranscoder::LexiconContainer::createRootCursors(a6, (char **)v34);
          *(_OWORD *)std::string __p = *(_OWORD *)v34;
          v33[0] = *(void *)&v34[16];
          memset(v34, 0, sizeof(v34));
          uint64_t v37 = (void **)v34;
          std::vector<std::pair<nlp::CFScopedPtr<_LXCursor const*>,BOOL>>::__destroy_vector::operator()[abi:ne180100](&v37);
        }
      }
      else
      {
        uint64_t v12 = *((void *)this + 13);
        for (uint64_t i = *((void *)this + 14); v12 != i; v12 += 16)
        {
          uint64_t AdvancedCursor = InputTranscoder::LexiconContainer::createAdvancedCursor(a6, *(void *)v12, a2);
          uint64_t v15 = AdvancedCursor;
          if (AdvancedCursor)
          {
            int v16 = (char *)__p[1];
            if (__p[1] >= (void *)v33[0])
            {
              int64_t v18 = ((char *)__p[1] - (char *)__p[0]) >> 4;
              unint64_t v19 = v18 + 1;
              if ((unint64_t)(v18 + 1) >> 60) {
                std::vector<InputTranscoder::InputFeature>::__throw_length_error[abi:ne180100]();
              }
              int64_t v20 = v33[0] - (unint64_t)__p[0];
              if ((uint64_t)(v33[0] - (unint64_t)__p[0]) >> 3 > v19) {
                unint64_t v19 = v20 >> 3;
              }
              if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFF0) {
                unint64_t v21 = 0xFFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v21 = v19;
              }
              double v36 = v33;
              BOOL v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<nlp::CFScopedPtr<_LXCursor const*>,BOOL>>>((uint64_t)v33, v21);
              uint64_t v24 = &v22[16 * v18];
              *(void *)uint64_t v24 = v15;
              v24[8] = *(unsigned char *)(v12 + 8);
              uint64_t v26 = (char *)__p[0];
              uint64_t v25 = (char *)__p[1];
              if (__p[1] == __p[0])
              {
                int64x2_t v29 = vdupq_n_s64((unint64_t)__p[1]);
                uint64_t v27 = &v22[16 * v18];
              }
              else
              {
                uint64_t v27 = &v22[16 * v18];
                do
                {
                  uint64_t v28 = *((void *)v25 - 2);
                  v25 -= 16;
                  *(void *)uint64_t v25 = 0;
                  *((void *)v27 - 2) = v28;
                  v27 -= 16;
                  v27[8] = v25[8];
                }
                while (v25 != v26);
                int64x2_t v29 = *(int64x2_t *)__p;
              }
              uint64_t v17 = v24 + 16;
              __p[0] = v27;
              __p[1] = v24 + 16;
              *(int64x2_t *)&v34[8] = v29;
              uint64_t v30 = v33[0];
              v33[0] = &v22[16 * v23];
              uint64_t v35 = v30;
              *(void *)uint64_t v34 = v29.i64[0];
              std::__split_buffer<std::pair<nlp::CFScopedPtr<_LXCursor const*>,BOOL>>::~__split_buffer((uint64_t)v34);
            }
            else
            {
              *(void *)__p[1] = AdvancedCursor;
              v16[8] = *(unsigned char *)(v12 + 8);
              uint64_t v17 = v16 + 16;
            }
            __p[1] = v17;
          }
        }
      }
      if (__p[0] != __p[1]) {
        operator new();
      }
      uint64_t v10 = 0;
      *(void *)uint64_t v34 = __p;
      std::vector<std::pair<nlp::CFScopedPtr<_LXCursor const*>,BOOL>>::__destroy_vector::operator()[abi:ne180100]((void ***)v34);
    }
  }
  else
  {
    uint64_t v10 = *v8;
    if (!(*v8)[5].i8[4])
    {
      int64x2_t v11 = vdupq_n_s64(0xFFEFFFFFFFFFFFFFLL);
      v10[2] = v11;
      void v10[3] = v11;
      v10[5].i8[4] = 1;
    }
  }
  return v10;
}

void sub_2369E2330(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void **a20)
{
  a20 = (void **)&a11;
  std::vector<std::pair<nlp::CFScopedPtr<_LXCursor const*>,BOOL>>::__destroy_vector::operator()[abi:ne180100](&a20);
  _Unwind_Resume(a1);
}

void InputTranscoder::LexiconPathTrie::getPrefixCompletions(void *a1, uint64_t a2, const std::string *a3)
{
  uint64_t v6 = a1[12];
  int v7 = *(_DWORD *)(v6 + 140);
  uint64_t v8 = *(void *)(v6 + 152);
  int v9 = *(_DWORD *)(v6 + 164);
  float v10 = logf(*(float *)(v6 + 168));
  char v11 = HIBYTE(a3->__r_.__value_.__r.__words[2]);
  if (v11 >= 0) {
    int64_t size = HIBYTE(a3->__r_.__value_.__r.__words[2]);
  }
  else {
    int64_t size = a3->__r_.__value_.__l.__size_;
  }
  if (v11 >= 0) {
    uint64_t v13 = a3;
  }
  else {
    uint64_t v13 = (const std::string *)a3->__r_.__value_.__r.__words[0];
  }
  if (size >= 1)
  {
    uint64_t v14 = (char *)v13 + size;
    uint64_t v15 = (std::string *)v13;
    do
    {
      int v16 = (char *)memchr(v15, 32, size);
      if (!v16) {
        break;
      }
      if (*v16 == 32)
      {
        if (v16 != v14 && v16 - (char *)v13 != -1)
        {
          std::string::basic_string(&v29, a3, 0, v16 - (char *)v13 + 1, (std::allocator<char> *)v27);
          goto LABEL_17;
        }
        break;
      }
      uint64_t v15 = (std::string *)(v16 + 1);
      int64_t size = v14 - (char *)v15;
    }
    while (v14 - (char *)v15 >= 1);
  }
  std::string::basic_string[abi:ne180100]<0>(&v29, "");
LABEL_17:
  uint64_t v17 = a1[13];
  for (uint64_t i = a1[14]; v17 != i; v17 += 16)
  {
    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x2000000000;
    int v28 = 0;
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x2000000000;
    char v26 = *(unsigned char *)(v17 + 8);
    if (!LXCursorIsRoot())
    {
      int v21 = v9;
      float v22 = v10;
      if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&__p, v29.__r_.__value_.__l.__data_, v29.__r_.__value_.__l.__size_);
      }
      else {
        std::string __p = v29;
      }
      uint64_t v23 = v8;
      uint64_t v20 = a2;
      int v24 = v7;
      LXCursorEnumerateEntriesRecursively();
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
    }
    _Block_object_dispose(v25, 8);
    _Block_object_dispose(v27, 8);
  }
  if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v29.__r_.__value_.__l.__data_);
  }
}

void sub_2369E2598(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a30, 8);
  if (*(char *)(v30 - 137) < 0) {
    operator delete(*(void **)(v30 - 160));
  }
  _Unwind_Resume(a1);
}

void ___ZNK15InputTranscoder15LexiconPathTrie20getPrefixCompletionsERNSt3__16vectorINS_20CTCSurfaceFormOutputENS1_9allocatorIS3_EEEERKNS1_12basic_stringIcNS1_11char_traitsIcEENS4_IcEEEE_block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 48);
  double v5 = *(double *)(v4 + 64);
  double v6 = *(float *)(a1 + 88);
  LXEntryGetProbability();
  double v8 = v5 + v6 * (v7 * 2.30258512);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    double v8 = v8 + *(float *)(a1 + 92);
  }
  CFStringRef v9 = (const __CFString *)LXEntryCopyString();
  CFTypeRef cf = v9;
  if (v9)
  {
    nlp::getUTF8StringFromCFString(v9, &v77);
    std::string::size_type size = HIBYTE(v77.__r_.__value_.__r.__words[2]);
    if ((v77.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      char v11 = &v77;
    }
    else {
      char v11 = (std::string *)v77.__r_.__value_.__r.__words[0];
    }
    if ((v77.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      std::string::size_type size = v77.__r_.__value_.__l.__size_;
    }
    if (!size) {
      goto LABEL_88;
    }
    uint64_t v12 = (std::string *)((char *)v11 + size);
    std::string::size_type v13 = size - 1;
    uint64_t v14 = MEMORY[0x263EF8318];
    do
    {
      unsigned int v15 = v11->__r_.__value_.__s.__data_[0];
      if (!((v15 & 0x80000000) != 0 ? __maskrune(v15, 0x500uLL) : *(_DWORD *)(v14 + 4 * v15 + 60) & 0x500)) {
        break;
      }
      char v11 = (std::string *)((char *)v11 + 1);
      --v13;
    }
    while (v11 != v12);
    if (v11 == v12 || (std::string *)((char *)&v11->__r_.__value_.__l.__data_ + 1) == v12)
    {
LABEL_88:
      uint64_t v12 = v11;
    }
    else
    {
      uint64_t v53 = 1;
      uint64_t v12 = v11;
      do
      {
        unsigned int v54 = v11->__r_.__value_.__s.__data_[v53];
        if ((v54 & 0x80000000) != 0) {
          int v55 = __maskrune(v54, 0x500uLL);
        }
        else {
          int v55 = *(_DWORD *)(v14 + 4 * v54 + 60) & 0x500;
        }
        if (v55)
        {
          v12->__r_.__value_.__s.__data_[0] = v11->__r_.__value_.__s.__data_[v53];
          uint64_t v12 = (std::string *)((char *)v12 + 1);
        }
        ++v53;
        --v13;
      }
      while (v13);
    }
    v56 = (char *)&v77 + HIBYTE(v77.__r_.__value_.__r.__words[2]);
    if ((v77.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    {
      unint64_t v57 = &v77;
    }
    else
    {
      v56 = (char *)(v77.__r_.__value_.__r.__words[0] + v77.__r_.__value_.__l.__size_);
      unint64_t v57 = (std::string *)v77.__r_.__value_.__r.__words[0];
    }
    std::string::erase(&v77, (char *)v12 - (char *)v57, v56 - (char *)v12);
    if ((v77.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v58 = (std::string *)((char *)&v77 + HIBYTE(v77.__r_.__value_.__r.__words[2]));
    }
    else {
      uint64_t v58 = (std::string *)(v77.__r_.__value_.__r.__words[0] + v77.__r_.__value_.__l.__size_);
    }
    if ((v77.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v59 = &v77;
    }
    else {
      v59 = (std::string *)v77.__r_.__value_.__r.__words[0];
    }
    while (v59 != v58)
    {
      v59->__r_.__value_.__s.__data_[0] = __tolower(v59->__r_.__value_.__s.__data_[0]);
      v59 = (std::string *)((char *)v59 + 1);
    }
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&v77, "");
  }
  int v17 = *(char *)(a1 + 79);
  if (v17 >= 0) {
    int64_t v18 = (const std::string::value_type *)(a1 + 56);
  }
  else {
    int64_t v18 = *(const std::string::value_type **)(a1 + 56);
  }
  if (v17 >= 0) {
    std::string::size_type v19 = *(unsigned __int8 *)(a1 + 79);
  }
  else {
    std::string::size_type v19 = *(void *)(a1 + 64);
  }
  uint64_t v20 = std::string::insert(&v77, 0, v18, v19);
  long long v21 = *(_OWORD *)&v20->__r_.__value_.__l.__data_;
  __s.__r_.__value_.__r.__words[2] = v20->__r_.__value_.__r.__words[2];
  *(_OWORD *)&__s.__r_.__value_.__l.__data_ = v21;
  v20->__r_.__value_.__l.__size_ = 0;
  v20->__r_.__value_.__r.__words[2] = 0;
  v20->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v77.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v77.__r_.__value_.__l.__data_);
  }
  float v23 = *(float *)(a1 + 96);
  float v22 = *(float *)(a1 + 100);
  std::string::size_type v24 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
  if ((__s.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type v24 = __s.__r_.__value_.__l.__size_;
  }
  unint64_t v25 = v24 - *(unsigned int *)(v4 + 80);
  if (v25 >= 3) {
    unint64_t v26 = 3;
  }
  else {
    unint64_t v26 = v25;
  }
  uint64_t v27 = *(long long ***)(a1 + 80);
  int v28 = *v27;
  std::string v29 = v27[1];
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v74, __s.__r_.__value_.__l.__data_, __s.__r_.__value_.__l.__size_);
  }
  else {
    std::string v74 = __s;
  }
  if (v28 != v29)
  {
    while (1)
    {
      if (*((char *)v28 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&v77, *(const std::string::value_type **)v28, *((void *)v28 + 1));
      }
      else
      {
        long long v30 = *v28;
        v77.__r_.__value_.__r.__words[2] = *((void *)v28 + 2);
        *(_OWORD *)&v77.__r_.__value_.__l.__data_ = v30;
      }
      if (*((char *)v28 + 47) < 0)
      {
        std::string::__init_copy_ctor_external(&__p, *((const std::string::value_type **)v28 + 3), *((void *)v28 + 4));
      }
      else
      {
        long long v31 = *(long long *)((char *)v28 + 24);
        __p.__r_.__value_.__r.__words[2] = *((void *)v28 + 5);
        *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v31;
      }
      long long v79 = v28[3];
      char v32 = HIBYTE(v77.__r_.__value_.__r.__words[2]);
      if ((v77.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v33 = HIBYTE(v77.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v33 = v77.__r_.__value_.__l.__size_;
      }
      std::string::size_type v34 = HIBYTE(v74.__r_.__value_.__r.__words[2]);
      if ((v74.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        std::string::size_type v34 = v74.__r_.__value_.__l.__size_;
      }
      if (v33 == v34)
      {
        if ((v74.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          uint64_t v35 = &v74;
        }
        else {
          uint64_t v35 = (std::string *)v74.__r_.__value_.__r.__words[0];
        }
        if (SHIBYTE(v77.__r_.__value_.__r.__words[2]) < 0)
        {
          BOOL v44 = memcmp(v77.__r_.__value_.__l.__data_, v35, v77.__r_.__value_.__l.__size_) == 0;
        }
        else if (*((unsigned char *)&v77.__r_.__value_.__s + 23))
        {
          uint64_t v36 = HIBYTE(v77.__r_.__value_.__r.__words[2]) - 1;
          uint64_t v37 = &v77;
          do
          {
            int v39 = v37->__r_.__value_.__s.__data_[0];
            uint64_t v37 = (std::string *)((char *)v37 + 1);
            int v38 = v39;
            int v41 = v35->__r_.__value_.__s.__data_[0];
            uint64_t v35 = (std::string *)((char *)v35 + 1);
            int v40 = v41;
            BOOL v43 = v36-- != 0;
            BOOL v44 = v38 == v40;
          }
          while (v38 == v40 && v43);
        }
        else
        {
          BOOL v44 = 1;
        }
      }
      else
      {
        BOOL v44 = 0;
      }
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(__p.__r_.__value_.__l.__data_);
        if ((*((unsigned char *)&v77.__r_.__value_.__s + 23) & 0x80) != 0)
        {
LABEL_67:
          operator delete(v77.__r_.__value_.__l.__data_);
          if (v44) {
            break;
          }
          goto LABEL_68;
        }
      }
      else if (v32 < 0)
      {
        goto LABEL_67;
      }
      if (v44) {
        break;
      }
LABEL_68:
      v28 += 4;
      if (v28 == v29)
      {
        int v28 = v29;
        break;
      }
    }
  }
  double v45 = v8 - v23;
  double v46 = (float)(v22 * (float)v26);
  if (SHIBYTE(v74.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v74.__r_.__value_.__l.__data_);
  }
  double v47 = v45 - v46;
  uint64_t v48 = *(std::string::size_type **)(a1 + 80);
  if (v28 == (long long *)v48[1])
  {
    uint64_t v50 = *(void *)(*(void *)(a1 + 32) + 8);
    std::string::size_type v51 = v48[2];
    if ((unint64_t)v28 >= v51)
    {
      uint64_t v60 = (uint64_t)((uint64_t)v28 - *v48) >> 6;
      if ((unint64_t)(v60 + 1) >> 58) {
        std::vector<InputTranscoder::PathTrie *>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v61 = v51 - *v48;
      uint64_t v62 = v61 >> 5;
      if (v61 >> 5 <= (unint64_t)(v60 + 1)) {
        uint64_t v62 = v60 + 1;
      }
      if ((unint64_t)v61 >= 0x7FFFFFFFFFFFFFC0) {
        unint64_t v63 = 0x3FFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v63 = v62;
      }
      __p.__r_.__value_.__l.__size_ = (std::string::size_type)(v48 + 2);
      if (v63) {
        uint64_t v64 = std::__allocate_at_least[abi:ne180100]<std::allocator<InputTranscoder::CTCSurfaceFormOutput>>((uint64_t)(v48 + 2), v63);
      }
      else {
        uint64_t v64 = 0;
      }
      v77.__r_.__value_.__r.__words[0] = (std::string::size_type)v64;
      v77.__r_.__value_.__l.__size_ = (std::string::size_type)v64 + 64 * v60;
      v77.__r_.__value_.__r.__words[2] = v77.__r_.__value_.__l.__size_;
      __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v64 + 64 * v63;
      InputTranscoder::CTCSurfaceFormOutput::CTCSurfaceFormOutput((std::string *)v77.__r_.__value_.__l.__size_, (long long *)&__s, 1, 1, 0, *(unsigned char *)(v50 + 24), v47);
      std::string::size_type v66 = *v48;
      std::string::size_type v65 = v48[1];
      std::string::size_type v67 = v77.__r_.__value_.__r.__words[2];
      std::string::size_type v68 = v77.__r_.__value_.__l.__size_;
      if (v65 == *v48)
      {
        std::string::size_type v71 = v48[1];
      }
      else
      {
        do
        {
          long long v69 = *(_OWORD *)(v65 - 64);
          *(void *)(v68 - 48) = *(void *)(v65 - 48);
          *(_OWORD *)(v68 - 64) = v69;
          *(void *)(v65 - 56) = 0;
          *(void *)(v65 - 48) = 0;
          *(void *)(v65 - 64) = 0;
          long long v70 = *(_OWORD *)(v65 - 40);
          *(void *)(v68 - 24) = *(void *)(v65 - 24);
          *(_OWORD *)(v68 - 40) = v70;
          *(void *)(v65 - 32) = 0;
          *(void *)(v65 - 24) = 0;
          *(void *)(v65 - 40) = 0;
          *(_OWORD *)(v68 - 16) = *(_OWORD *)(v65 - 16);
          v68 -= 64;
          v65 -= 64;
        }
        while (v65 != v66);
        std::string::size_type v71 = *v48;
        std::string::size_type v65 = v48[1];
      }
      std::string::size_type v52 = v67 + 64;
      std::string::size_type *v48 = v68;
      v77.__r_.__value_.__r.__words[0] = v71;
      v77.__r_.__value_.__l.__size_ = v71;
      v48[1] = v67 + 64;
      v77.__r_.__value_.__r.__words[2] = v65;
      std::string::size_type v72 = v48[2];
      v48[2] = __p.__r_.__value_.__r.__words[0];
      __p.__r_.__value_.__r.__words[0] = v72;
      std::__split_buffer<InputTranscoder::CTCSurfaceFormOutput>::~__split_buffer((uint64_t)&v77);
    }
    else
    {
      InputTranscoder::CTCSurfaceFormOutput::CTCSurfaceFormOutput((std::string *)v28, (long long *)&__s, 1, 1, 0, *(unsigned char *)(v50 + 24), v47);
      std::string::size_type v52 = (std::string::size_type)(v28 + 4);
      v48[1] = (std::string::size_type)(v28 + 4);
    }
    v48[1] = v52;
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  else
  {
    double v49 = *((double *)v28 + 6);
    if (v49 < v47) {
      double v49 = v47;
    }
    *((double *)v28 + 6) = v49;
    *((unsigned char *)v28 + 59) &= *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == *(_DWORD *)(a1 + 104)) {
    *a3 = 1;
  }
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__s.__r_.__value_.__l.__data_);
  }
  if (cf) {
    CFRelease(cf);
  }
}

void sub_2369E2CC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,const void *a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  if (a23 < 0) {
    operator delete(__p);
  }
  nlp::CFScopedPtr<__CFString const*>::reset(&a24, 0);
  _Unwind_Resume(a1);
}

void __copy_helper_block_e8_56c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (std::string *)(a1 + 56);
  if (*(char *)(a2 + 79) < 0)
  {
    std::string::__init_copy_ctor_external(v2, *(const std::string::value_type **)(a2 + 56), *(void *)(a2 + 64));
  }
  else
  {
    long long v3 = *(_OWORD *)(a2 + 56);
    v2->__r_.__value_.__r.__words[2] = *(void *)(a2 + 72);
    *(_OWORD *)&v2->__r_.__value_.__l.__data_ = v3;
  }
}

void __destroy_helper_block_e8_56c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(uint64_t a1)
{
  if (*(char *)(a1 + 79) < 0) {
    operator delete(*(void **)(a1 + 56));
  }
}

BOOL InputTranscoder::LexiconPathTrie::isValidWord(InputTranscoder::LexiconPathTrie *this)
{
  uint64_t v1 = *((void *)this + 13);
  uint64_t v2 = *((void *)this + 14);
  if (v1 == v2) {
    return 0;
  }
  uint64_t v3 = v1 + 16;
  do
  {
    int HasEntries = LXCursorHasEntries();
    BOOL v6 = HasEntries == 0;
    BOOL result = HasEntries != 0;
    BOOL v6 = !v6 || v3 == v2;
    v3 += 16;
  }
  while (!v6);
  return result;
}

BOOL InputTranscoder::LexiconPathTrie::containsOnlyDynamicLexiconCursors(InputTranscoder::LexiconPathTrie *this)
{
  uint64_t v2 = *((void *)this + 13);
  uint64_t v1 = *((void *)this + 14);
  if (v2 == v1) {
    return 1;
  }
  uint64_t v3 = v2 + 16;
  do
  {
    BOOL result = *(unsigned char *)(v3 - 8) != 0;
    if (*(unsigned char *)(v3 - 8)) {
      BOOL v5 = v3 == v1;
    }
    else {
      BOOL v5 = 1;
    }
    v3 += 16;
  }
  while (!v5);
  return result;
}

double InputTranscoder::LexiconPathTrie::getLexiconConditionalProbability(InputTranscoder::LexiconPathTrie *this)
{
  uint64_t v1 = *((void *)this + 13);
  uint64_t v2 = *((void *)this + 14);
  if (v1 == v2)
  {
    double v10 = -1.79769313e308;
    uint64_t v11 = *((void *)this + 13);
  }
  else
  {
    float v4 = -INFINITY;
    do
    {
      if (*(unsigned char *)(v1 + 8)) {
        float v5 = (*(float (**)(InputTranscoder::LexiconPathTrie *))(*(void *)this + 64))(this);
      }
      else {
        float v5 = 1.0;
      }
      LXCursorConditionalProbability();
      float v7 = logf(v5) + v6 * 2.30258512;
      if (v4 == -INFINITY)
      {
        float v4 = v7;
      }
      else if (v7 != -INFINITY)
      {
        if (v4 >= v7) {
          float v8 = v4;
        }
        else {
          float v8 = v7;
        }
        if (v4 < v7) {
          float v7 = v4;
        }
        float v9 = expf(v7 - v8);
        float v4 = v8 + log1pf(v9);
      }
      v1 += 16;
    }
    while (v1 != v2);
    double v10 = v4;
    uint64_t v1 = *((void *)this + 13);
    uint64_t v11 = *((void *)this + 14);
  }
  return v10 - logf((float)(unint64_t)((v11 - v1) >> 4));
}

double InputTranscoder::LexiconPathTrie::getLexiconTerminationProbability(InputTranscoder::LexiconPathTrie *this)
{
  uint64_t v1 = *((void *)this + 13);
  uint64_t v2 = *((void *)this + 14);
  if (v1 == v2)
  {
    double v10 = -1.79769313e308;
    uint64_t v11 = *((void *)this + 13);
  }
  else
  {
    float v4 = -INFINITY;
    do
    {
      if (*(unsigned char *)(v1 + 8)) {
        float v5 = (*(float (**)(InputTranscoder::LexiconPathTrie *))(*(void *)this + 64))(this);
      }
      else {
        float v5 = 1.0;
      }
      LXCursorTerminationProbability();
      float v7 = logf(v5) + v6 * 2.30258512;
      if (v4 == -INFINITY)
      {
        float v4 = v7;
      }
      else if (v7 != -INFINITY)
      {
        if (v4 >= v7) {
          float v8 = v4;
        }
        else {
          float v8 = v7;
        }
        if (v4 < v7) {
          float v7 = v4;
        }
        float v9 = expf(v7 - v8);
        float v4 = v8 + log1pf(v9);
      }
      v1 += 16;
    }
    while (v1 != v2);
    double v10 = v4;
    uint64_t v1 = *((void *)this + 13);
    uint64_t v11 = *((void *)this + 14);
  }
  return v10 - logf((float)(unint64_t)((v11 - v1) >> 4));
}

long double InputTranscoder::LexiconPathTrie::getLexiconPrefixProbability(InputTranscoder::LexiconPathTrie *this)
{
  long double v1 = (*(double (**)(InputTranscoder::LexiconPathTrie *))(*(void *)this + 40))(this);
  long double v2 = 1.0 - exp(v1) + 2.22044605e-16;

  return log(v2);
}

uint64_t InputTranscoder::PathTrie::isValidWord(InputTranscoder::PathTrie *this)
{
  return 0;
}

double InputTranscoder::PathTrie::getLexiconConditionalProbability(InputTranscoder::PathTrie *this)
{
  return 0.0;
}

double InputTranscoder::PathTrie::getLexiconTerminationProbability(InputTranscoder::PathTrie *this)
{
  return 0.0;
}

double InputTranscoder::PathTrie::getLexiconPrefixProbability(InputTranscoder::PathTrie *this)
{
  return 0.0;
}

double InputTranscoder::PathTrie::getDynamicLexiconWeight(InputTranscoder::PathTrie *this)
{
  return 0.0;
}

uint64_t InputTranscoder::PathTrie::containsOnlyDynamicLexiconCursors(InputTranscoder::PathTrie *this)
{
  return 0;
}

void InputTranscoder::LexiconPathTrie::~LexiconPathTrie(InputTranscoder::LexiconPathTrie *this)
{
  *(void *)this = &unk_26E9DA568;
  long double v2 = (void **)((char *)this + 104);
  std::vector<std::pair<nlp::CFScopedPtr<_LXCursor const*>,BOOL>>::__destroy_vector::operator()[abi:ne180100](&v2);
  InputTranscoder::PathTrie::~PathTrie(this);
}

{
  void **v2;

  *(void *)this = &unk_26E9DA568;
  long double v2 = (void **)((char *)this + 104);
  std::vector<std::pair<nlp::CFScopedPtr<_LXCursor const*>,BOOL>>::__destroy_vector::operator()[abi:ne180100](&v2);
  InputTranscoder::PathTrie::~PathTrie(this);
  MEMORY[0x237E08BB0]();
}

float InputTranscoder::LexiconPathTrie::getDynamicLexiconWeight(InputTranscoder::LexiconPathTrie *this)
{
  return *(float *)(*((void *)this + 12) + 168);
}

void std::vector<InputTranscoder::PathTrie *>::__throw_length_error[abi:ne180100]()
{
}

std::string *InputTranscoder::CTCSurfaceFormOutput::CTCSurfaceFormOutput(std::string *this, long long *a2, std::string::value_type a3, std::string::value_type a4, std::string::value_type a5, std::string::value_type a6, double a7)
{
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v13 = *a2;
    this->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v13;
  }
  this[1].__r_.__value_.__r.__words[0] = 0;
  this[1].__r_.__value_.__l.__size_ = 0;
  this[1].__r_.__value_.__r.__words[2] = 0;
  *(double *)&this[2].__r_.__value_.__l.__data_ = a7;
  this[2].__r_.__value_.__s.__data_[8] = a3;
  this[2].__r_.__value_.__s.__data_[9] = a4;
  this[2].__r_.__value_.__s.__data_[10] = a5;
  this[2].__r_.__value_.__s.__data_[11] = a6;
  HIDWORD(this[2].__r_.__value_.__r.__words[1]) = 0;
  return this;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<InputTranscoder::CTCSurfaceFormOutput>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 58) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(a2 << 6);
}

void std::__destroy_at[abi:ne180100]<InputTranscoder::CTCSurfaceFormOutput,0>(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0) {
    operator delete(*(void **)(a1 + 24));
  }
  if (*(char *)(a1 + 23) < 0)
  {
    long double v2 = *(void **)a1;
    operator delete(v2);
  }
}

uint64_t std::__split_buffer<InputTranscoder::CTCSurfaceFormOutput>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 64;
    std::__destroy_at[abi:ne180100]<InputTranscoder::CTCSurfaceFormOutput,0>(i - 64);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

os_log_t ___ZN15InputTranscoderL6loggerEv_block_invoke()
{
  os_log_t result = os_log_create("com.apple.InputTranscoder", "PathTrie");
  _MergedGlobals = (uint64_t)result;
  return result;
}

void InputTranscoder::createInternalLanguageModel(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  CFStringRef CFStringFromString = nlp::createCFStringFromString(a1);
  CFStringRef v25 = CFStringFromString;
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFLocaleRef v5 = CFLocaleCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], CFStringFromString);
  CFLocaleRef v24 = v5;
  uint64_t v18 = 0;
  std::string::size_type v19 = &v18;
  uint64_t v20 = 0x3002000000;
  long long v21 = __Block_byref_object_copy__0;
  float v22 = __Block_byref_object_dispose__0;
  CFTypeRef cf = 0;
  InputTranscoder::enumerateLDAssets();
  CFURLRef v6 = (const __CFURL *)v19[5];
  if (v6)
  {
    CFURLRef v7 = CFURLCreateCopyDeletingPathExtension(v4, v6);
    CFStringRef PathComponent = CFURLCopyLastPathComponent(v7);
    CFURLRef v9 = CFURLCreateCopyDeletingLastPathComponent(v4, (CFURLRef)v19[5]);
    CFURLRef v10 = v9;
    if (v7 && PathComponent && v9)
    {
      CFDictionaryRef Mutable = CFDictionaryCreateMutable(v4, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F512A8], v5);
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F51258], PathComponent);
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F51268], v10);
      uint64_t v12 = (const void *)*MEMORY[0x263EFFB38];
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F512D8], (const void *)*MEMORY[0x263EFFB38]);
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F51248], v12);
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F512A0], v12);
      if (LMLanguageModelCreate()) {
        operator new();
      }
      if (qword_26ADCFE68 != -1) {
        dispatch_once(&qword_26ADCFE68, &__block_literal_global_0);
      }
      unsigned int v15 = _MergedGlobals_0;
      if (os_log_type_enabled((os_log_t)_MergedGlobals_0, OS_LOG_TYPE_ERROR))
      {
        CFStringRef v17 = (const __CFString *)v19[5];
        *(_DWORD *)std::string buf = 138412290;
        CFStringRef v27 = v17;
        _os_log_error_impl(&dword_2369D6000, v15, OS_LOG_TYPE_ERROR, "Unable to load language model from bundle URL=%@", buf, 0xCu);
      }
      *a2 = 0;
      if (Mutable) {
        CFRelease(Mutable);
      }
    }
    else
    {
      if (qword_26ADCFE68 != -1) {
        dispatch_once(&qword_26ADCFE68, &__block_literal_global_0);
      }
      uint64_t v14 = _MergedGlobals_0;
      if (os_log_type_enabled((os_log_t)_MergedGlobals_0, OS_LOG_TYPE_ERROR))
      {
        CFStringRef v16 = (const __CFString *)v19[5];
        *(_DWORD *)std::string buf = 138412290;
        CFStringRef v27 = v16;
        _os_log_error_impl(&dword_2369D6000, v14, OS_LOG_TYPE_ERROR, "Unable to parse language model bundle URL=%@", buf, 0xCu);
      }
      *a2 = 0;
      if (!v10) {
        goto LABEL_25;
      }
    }
    CFRelease(v10);
LABEL_25:
    if (PathComponent) {
      CFRelease(PathComponent);
    }
    if (v7) {
      CFRelease(v7);
    }
    goto LABEL_29;
  }
  if (qword_26ADCFE68 != -1) {
    dispatch_once(&qword_26ADCFE68, &__block_literal_global_0);
  }
  long long v13 = _MergedGlobals_0;
  if (os_log_type_enabled((os_log_t)_MergedGlobals_0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)std::string buf = 138412290;
    CFStringRef v27 = CFStringFromString;
    _os_log_error_impl(&dword_2369D6000, v13, OS_LOG_TYPE_ERROR, "Unable to locate internal language model for locale=%@", buf, 0xCu);
  }
  *a2 = 0;
LABEL_29:
  _Block_object_dispose(&v18, 8);
  if (cf) {
    CFRelease(cf);
  }
  if (v5) {
    CFRelease(v5);
  }
  if (CFStringFromString) {
    CFRelease(CFStringFromString);
  }
}

void sub_2369E38F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, int a11, __int16 a12, char a13, char a14, int a15, __int16 a16, char a17, char a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

BOOL InputTranscoder::isSyllableLanguageModel(const __CFString *this, const __CFString *a2, const __CFURL *a3)
{
  if (CFStringCompare(this, (CFStringRef)*MEMORY[0x263F517A8], 0)) {
    return 0;
  }
  CFStringRef PathComponent = CFURLCopyLastPathComponent((CFURLRef)a2);
  BOOL v4 = CFEqual(PathComponent, @"syllablenew.lm");
  if (PathComponent) {
    CFRelease(PathComponent);
  }
  return v4;
}

void sub_2369E3A3C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

BOOL InputTranscoder::isKanaCharacterLanguageModel(const __CFString *this, const __CFString *a2, const __CFURL *a3)
{
  if (CFStringCompare(this, (CFStringRef)*MEMORY[0x263F51790], 0)) {
    return 0;
  }
  CFStringRef PathComponent = CFURLCopyLastPathComponent((CFURLRef)a2);
  BOOL v4 = CFEqual(PathComponent, @"kana.lm");
  if (PathComponent) {
    CFRelease(PathComponent);
  }
  return v4;
}

void sub_2369E3AD8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

BOOL InputTranscoder::isCharacterLanguageModel(const __CFString *this, const __CFString *a2, const __CFURL *a3)
{
  return CFEqual(this, (CFStringRef)*MEMORY[0x263F51790]);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  *(void *)(result + 40) = v2;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void ___ZN15InputTranscoder27createInternalLanguageModelERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE_block_invoke(uint64_t a1, const void *a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned char *a6)
{
  if ((*(unsigned int (**)(uint64_t))(a1 + 40))(a5))
  {
    nlp::CFScopedPtr<__CFURL const*>::acquire((const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    if (a6) {
      *a6 = 1;
    }
  }
}

os_log_t ___ZN15InputTranscoderL6loggerEv_block_invoke_0()
{
  os_log_t result = os_log_create("com.apple.InputTranscoder", "LanguageModelFactory");
  _MergedGlobals_0 = (uint64_t)result;
  return result;
}

InputTranscoder::TranscoderConfiguration *InputTranscoder::TouchTranscoderImpl::TouchTranscoderImpl(InputTranscoder::TranscoderConfiguration *a1, const InputTranscoder::TranscoderConfiguration *a2, void *a3, void *a4, void *a5)
{
  os_log_t result = InputTranscoder::TranscoderConfiguration::TranscoderConfiguration(a1, a2);
  uint64_t v9 = a3[1];
  *((void *)result + 55) = *a3;
  *((void *)result + 56) = v9;
  if (v9) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v9 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v10 = a4[1];
  *((void *)result + 57) = *a4;
  *((void *)result + 58) = v10;
  if (v10) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v10 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v11 = a5[1];
  *((void *)result + 59) = *a5;
  *((void *)result + 60) = v11;
  if (v11) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v11 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void InputTranscoder::TouchTranscoderImpl::makeSession(InputTranscoder::TouchTranscoderImpl *this)
{
}

void sub_2369E3CBC(_Unwind_Exception *a1)
{
  MEMORY[0x237E08BB0](v1, 0x10F2C408DADF109);
  _Unwind_Resume(a1);
}

void *InputTranscoder::TouchTranscoderImpl::addLexicon(uint64_t a1, const void *a2)
{
  v4[4] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 472);
  v4[0] = &unk_26E9DA668;
  v4[1] = a2;
  v4[3] = v4;
  InputTranscoder::LexiconContainer::addLexicon((void *)(*(void *)(v2 + 16) + 192), a2, 1);
  return std::__function::__value_func<void ()(InputTranscoder::CTCDecoder &)>::~__value_func[abi:ne180100](v4);
}

void sub_2369E3D70(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__function::__value_func<void ()(InputTranscoder::CTCDecoder &)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void *InputTranscoder::TouchTranscoderImpl::removeLexicon(uint64_t a1, const void *a2)
{
  v7[4] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 472);
  v7[0] = &unk_26E9DA6E8;
  v7[1] = a2;
  v7[3] = v7;
  uint64_t v3 = *(void *)(v2 + 16);
  CFURLRef v6 = a2;
  BOOL v4 = std::remove[abi:ne180100]<std::__wrap_iter<nlp::CFScopedPtr<_LXLexicon const*> *>,_LXLexicon const*>(*(const void ***)(v3 + 208), *(const void ***)(v3 + 216), &v6);
  std::vector<nlp::CFScopedPtr<_LXLexicon const*>>::erase(v3 + 208, v4, *(const void ***)(v3 + 216));
  return std::__function::__value_func<void ()(InputTranscoder::CTCDecoder &)>::~__value_func[abi:ne180100](v7);
}

void sub_2369E3E30(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__function::__value_func<void ()(InputTranscoder::CTCDecoder &)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void *InputTranscoder::TouchTranscoderImpl::clearNeuralNetworkBuffer(InputTranscoder::TouchTranscoderImpl *this)
{
  v2[4] = *MEMORY[0x263EF8340];
  v2[0] = &unk_26E9DA768;
  v2[3] = v2;
  MRLNeuralNetworkClear();
  return std::__function::__value_func<void ()(InputTranscoder::MontrealModel &)>::~__value_func[abi:ne180100](v2);
}

void sub_2369E3ED4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__function::__value_func<void ()(InputTranscoder::MontrealModel &)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

InputTranscoder::TranscoderConfiguration *InputTranscoder::TranscoderConfiguration::TranscoderConfiguration(InputTranscoder::TranscoderConfiguration *this, const InputTranscoder::TranscoderConfiguration *a2)
{
  BOOL v4 = InputTranscoder::CommonConfiguration::CommonConfiguration((std::string *)this, a2);
  if (*((char *)a2 + 127) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)((char *)v4 + 104), *((const std::string::value_type **)a2 + 13), *((void *)a2 + 14));
  }
  else
  {
    long long v5 = *(_OWORD *)((char *)a2 + 104);
    v4[5].__r_.__value_.__r.__words[0] = *((void *)a2 + 15);
    *(_OWORD *)&v4[4].__r_.__value_.__r.__words[1] = v5;
  }
  CFURLRef v6 = (std::string *)((char *)this + 128);
  if (*((char *)a2 + 151) < 0)
  {
    std::string::__init_copy_ctor_external(v6, *((const std::string::value_type **)a2 + 16), *((void *)a2 + 17));
  }
  else
  {
    long long v7 = *((_OWORD *)a2 + 8);
    *((void *)this + 18) = *((void *)a2 + 18);
    *(_OWORD *)&v6->__r_.__value_.__l.__data_ = v7;
  }
  *(_OWORD *)((char *)this + 152) = *(_OWORD *)((char *)a2 + 152);
  long long v8 = *(_OWORD *)((char *)a2 + 168);
  long long v9 = *(_OWORD *)((char *)a2 + 184);
  long long v10 = *(_OWORD *)((char *)a2 + 200);
  *(_OWORD *)((char *)this + 216) = *(_OWORD *)((char *)a2 + 216);
  *(_OWORD *)((char *)this + 200) = v10;
  *(_OWORD *)((char *)this + 184) = v9;
  *(_OWORD *)((char *)this + 168) = v8;
  long long v11 = *(_OWORD *)((char *)a2 + 232);
  long long v12 = *(_OWORD *)((char *)a2 + 248);
  long long v13 = *(_OWORD *)((char *)a2 + 264);
  *((_DWORD *)this + 70) = *((_DWORD *)a2 + 70);
  *(_OWORD *)((char *)this + 264) = v13;
  *(_OWORD *)((char *)this + 248) = v12;
  *(_OWORD *)((char *)this + 232) = v11;
  if (*((char *)a2 + 311) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)this + 12, *((const std::string::value_type **)a2 + 36), *((void *)a2 + 37));
  }
  else
  {
    long long v14 = *((_OWORD *)a2 + 18);
    *((void *)this + 38) = *((void *)a2 + 38);
    *((_OWORD *)this + 18) = v14;
  }
  if (*((char *)a2 + 335) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)this + 13, *((const std::string::value_type **)a2 + 39), *((void *)a2 + 40));
  }
  else
  {
    long long v15 = *(_OWORD *)((char *)a2 + 312);
    *((void *)this + 41) = *((void *)a2 + 41);
    *(_OWORD *)((char *)this + 312) = v15;
  }
  if (*((char *)a2 + 359) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)this + 14, *((const std::string::value_type **)a2 + 42), *((void *)a2 + 43));
  }
  else
  {
    long long v16 = *((_OWORD *)a2 + 21);
    *((void *)this + 44) = *((void *)a2 + 44);
    *((_OWORD *)this + 21) = v16;
  }
  long long v17 = *(_OWORD *)((char *)a2 + 360);
  *(_OWORD *)((char *)this + 372) = *(_OWORD *)((char *)a2 + 372);
  *(_OWORD *)((char *)this + 360) = v17;
  *((void *)this + 50) = 0;
  *((void *)this + 51) = 0;
  *((void *)this + 49) = 0;
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>((std::string *)((char *)this + 392), *((long long **)a2 + 49), *((long long **)a2 + 50), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a2 + 50) - *((void *)a2 + 49)) >> 3));
  *((void *)this + 52) = 0;
  *((void *)this + 53) = 0;
  *((void *)this + 54) = 0;
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>((std::string *)((char *)this + 416), *((long long **)a2 + 52), *((long long **)a2 + 53), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a2 + 53) - *((void *)a2 + 52)) >> 3));
  return this;
}

void sub_2369E40D4(_Unwind_Exception *a1)
{
  if (*(char *)(v1 + 335) < 0) {
    operator delete(*v4);
  }
  if (*(char *)(v1 + 311) < 0) {
    operator delete(*v3);
  }
  InputTranscoder::CTCConfiguration::~CTCConfiguration(v2);
  InputTranscoder::CommonConfiguration::~CommonConfiguration((void **)v1);
  _Unwind_Resume(a1);
}

void InputTranscoder::CommonConfiguration::~CommonConfiguration(void **this)
{
  if (*((char *)this + 79) < 0) {
    operator delete(this[7]);
  }
  if (*((char *)this + 55) < 0) {
    operator delete(this[4]);
  }
  if (*((char *)this + 23) < 0) {
    operator delete(*this);
  }
}

std::string *InputTranscoder::CommonConfiguration::CommonConfiguration(std::string *this, const InputTranscoder::CommonConfiguration *a2)
{
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v4 = *(_OWORD *)a2;
    this->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v4;
  }
  LODWORD(this[1].__r_.__value_.__l.__data_) = *((_DWORD *)a2 + 6);
  if (*((char *)a2 + 55) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)((char *)this + 32), *((const std::string::value_type **)a2 + 4), *((void *)a2 + 5));
  }
  else
  {
    long long v5 = *((_OWORD *)a2 + 2);
    this[2].__r_.__value_.__r.__words[0] = *((void *)a2 + 6);
    *(_OWORD *)&this[1].__r_.__value_.__r.__words[1] = v5;
  }
  CFURLRef v6 = (std::string *)((char *)this + 56);
  if (*((char *)a2 + 79) < 0)
  {
    std::string::__init_copy_ctor_external(v6, *((const std::string::value_type **)a2 + 7), *((void *)a2 + 8));
  }
  else
  {
    long long v7 = *(_OWORD *)((char *)a2 + 56);
    this[3].__r_.__value_.__r.__words[0] = *((void *)a2 + 9);
    *(_OWORD *)&v6->__r_.__value_.__l.__data_ = v7;
  }
  long long v8 = *((_OWORD *)a2 + 5);
  this[4].__r_.__value_.__s.__data_[0] = *((unsigned char *)a2 + 96);
  *(_OWORD *)&this[3].__r_.__value_.__r.__words[1] = v8;
  return this;
}

void sub_2369E428C(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 55) < 0) {
    operator delete(*v2);
  }
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void std::__function::__func<InputTranscoder::TouchTranscoderImpl::addLexicon(_LXLexicon const*)::$_0,std::allocator<InputTranscoder::TouchTranscoderImpl::addLexicon(_LXLexicon const*)::$_0>,void ()(InputTranscoder::CTCDecoder &)>::~__func()
{
}

void *std::__function::__func<InputTranscoder::TouchTranscoderImpl::addLexicon(_LXLexicon const*)::$_0,std::allocator<InputTranscoder::TouchTranscoderImpl::addLexicon(_LXLexicon const*)::$_0>,void ()(InputTranscoder::CTCDecoder &)>::__clone(uint64_t a1)
{
  os_log_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = &unk_26E9DA668;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<InputTranscoder::TouchTranscoderImpl::addLexicon(_LXLexicon const*)::$_0,std::allocator<InputTranscoder::TouchTranscoderImpl::addLexicon(_LXLexicon const*)::$_0>,void ()(InputTranscoder::CTCDecoder &)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26E9DA668;
  a2[1] = v2;
  return result;
}

void std::__function::__func<InputTranscoder::TouchTranscoderImpl::addLexicon(_LXLexicon const*)::$_0,std::allocator<InputTranscoder::TouchTranscoderImpl::addLexicon(_LXLexicon const*)::$_0>,void ()(InputTranscoder::CTCDecoder &)>::operator()(uint64_t a1, uint64_t a2)
{
}

uint64_t std::__function::__func<InputTranscoder::TouchTranscoderImpl::addLexicon(_LXLexicon const*)::$_0,std::allocator<InputTranscoder::TouchTranscoderImpl::addLexicon(_LXLexicon const*)::$_0>,void ()(InputTranscoder::CTCDecoder &)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<InputTranscoder::TouchTranscoderImpl::addLexicon(_LXLexicon const*)::$_0,std::allocator<InputTranscoder::TouchTranscoderImpl::addLexicon(_LXLexicon const*)::$_0>,void ()(InputTranscoder::CTCDecoder &)>::target_type()
{
}

void *std::__function::__value_func<void ()(InputTranscoder::CTCDecoder &)>::~__value_func[abi:ne180100](void *a1)
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

void std::__function::__func<InputTranscoder::TouchTranscoderImpl::removeLexicon(_LXLexicon const*)::$_0,std::allocator<InputTranscoder::TouchTranscoderImpl::removeLexicon(_LXLexicon const*)::$_0>,void ()(InputTranscoder::CTCDecoder &)>::~__func()
{
}

void *std::__function::__func<InputTranscoder::TouchTranscoderImpl::removeLexicon(_LXLexicon const*)::$_0,std::allocator<InputTranscoder::TouchTranscoderImpl::removeLexicon(_LXLexicon const*)::$_0>,void ()(InputTranscoder::CTCDecoder &)>::__clone(uint64_t a1)
{
  os_log_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = &unk_26E9DA6E8;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<InputTranscoder::TouchTranscoderImpl::removeLexicon(_LXLexicon const*)::$_0,std::allocator<InputTranscoder::TouchTranscoderImpl::removeLexicon(_LXLexicon const*)::$_0>,void ()(InputTranscoder::CTCDecoder &)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26E9DA6E8;
  a2[1] = v2;
  return result;
}

const void **std::__function::__func<InputTranscoder::TouchTranscoderImpl::removeLexicon(_LXLexicon const*)::$_0,std::allocator<InputTranscoder::TouchTranscoderImpl::removeLexicon(_LXLexicon const*)::$_0>,void ()(InputTranscoder::CTCDecoder &)>::operator()(uint64_t a1, uint64_t a2)
{
  long long v5 = *(const void **)(a1 + 8);
  uint64_t v2 = a2 + 208;
  uint64_t v3 = std::remove[abi:ne180100]<std::__wrap_iter<nlp::CFScopedPtr<_LXLexicon const*> *>,_LXLexicon const*>(*(const void ***)(a2 + 208), *(const void ***)(a2 + 216), &v5);
  return std::vector<nlp::CFScopedPtr<_LXLexicon const*>>::erase(v2, v3, *(const void ***)(v2 + 8));
}

uint64_t std::__function::__func<InputTranscoder::TouchTranscoderImpl::removeLexicon(_LXLexicon const*)::$_0,std::allocator<InputTranscoder::TouchTranscoderImpl::removeLexicon(_LXLexicon const*)::$_0>,void ()(InputTranscoder::CTCDecoder &)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<InputTranscoder::TouchTranscoderImpl::removeLexicon(_LXLexicon const*)::$_0,std::allocator<InputTranscoder::TouchTranscoderImpl::removeLexicon(_LXLexicon const*)::$_0>,void ()(InputTranscoder::CTCDecoder &)>::target_type()
{
}

void std::__function::__func<InputTranscoder::TouchTranscoderImpl::clearNeuralNetworkBuffer(void)::$_0,std::allocator<InputTranscoder::TouchTranscoderImpl::clearNeuralNetworkBuffer(void)::$_0>,void ()(InputTranscoder::MontrealModel &)>::~__func()
{
}

void *std::__function::__func<InputTranscoder::TouchTranscoderImpl::clearNeuralNetworkBuffer(void)::$_0,std::allocator<InputTranscoder::TouchTranscoderImpl::clearNeuralNetworkBuffer(void)::$_0>,void ()(InputTranscoder::MontrealModel &)>::__clone()
{
  os_log_t result = operator new(0x10uLL);
  void *result = &unk_26E9DA768;
  return result;
}

void std::__function::__func<InputTranscoder::TouchTranscoderImpl::clearNeuralNetworkBuffer(void)::$_0,std::allocator<InputTranscoder::TouchTranscoderImpl::clearNeuralNetworkBuffer(void)::$_0>,void ()(InputTranscoder::MontrealModel &)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26E9DA768;
}

uint64_t std::__function::__func<InputTranscoder::TouchTranscoderImpl::clearNeuralNetworkBuffer(void)::$_0,std::allocator<InputTranscoder::TouchTranscoderImpl::clearNeuralNetworkBuffer(void)::$_0>,void ()(InputTranscoder::MontrealModel &)>::operator()()
{
  return MRLNeuralNetworkClear();
}

uint64_t std::__function::__func<InputTranscoder::TouchTranscoderImpl::clearNeuralNetworkBuffer(void)::$_0,std::allocator<InputTranscoder::TouchTranscoderImpl::clearNeuralNetworkBuffer(void)::$_0>,void ()(InputTranscoder::MontrealModel &)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<InputTranscoder::TouchTranscoderImpl::clearNeuralNetworkBuffer(void)::$_0,std::allocator<InputTranscoder::TouchTranscoderImpl::clearNeuralNetworkBuffer(void)::$_0>,void ()(InputTranscoder::MontrealModel &)>::target_type()
{
}

void *std::__function::__value_func<void ()(InputTranscoder::MontrealModel &)>::~__value_func[abi:ne180100](void *a1)
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

void InputTranscoder::PathResampler::~PathResampler(InputTranscoder::PathResampler *this)
{
  uint64_t v2 = (void *)*((void *)this + 13);
  if (v2)
  {
    *((void *)this + 14) = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)*((void *)this + 10);
  if (v3)
  {
    *((void *)this + 11) = v3;
    operator delete(v3);
  }
  long long v4 = (void *)*((void *)this + 7);
  if (v4)
  {
    *((void *)this + 8) = v4;
    operator delete(v4);
  }
  long long v5 = (void *)*((void *)this + 4);
  if (v5)
  {
    *((void *)this + 5) = v5;
    operator delete(v5);
  }
}

void InputTranscoder::TouchTranscoderSessionImpl::TouchTranscoderSessionImpl(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  long long v10 = InputTranscoder::TranscoderConfiguration::TranscoderConfiguration((InputTranscoder::TranscoderConfiguration *)a1, (const InputTranscoder::TranscoderConfiguration *)a2);
  *((void *)v10 + 55) = 0x402E000000000000;
  *((_DWORD *)v10 + 112) = 2;
  *((unsigned char *)v10 + 452) = 1;
  *((void *)v10 + 57) = 0x3FE0000000000000;
  *((unsigned char *)v10 + 464) = 0;
  *(void *)((char *)v10 + 572) = 0;
  *(_OWORD *)((char *)v10 + 472) = 0u;
  *(_OWORD *)((char *)v10 + 488) = 0u;
  *(_OWORD *)((char *)v10 + 504) = 0u;
  *(_OWORD *)((char *)v10 + 520) = 0u;
  *(_OWORD *)((char *)v10 + 536) = 0u;
  *(_OWORD *)((char *)v10 + 552) = 0u;
  *((unsigned char *)v10 + 568) = 0;
  long long v11 = (uint64_t **)(a2 + 336);
  uint64_t v12 = *(unsigned __int8 *)(a2 + 359);
  int v13 = (char)v12;
  if ((v12 & 0x80u) != 0) {
    uint64_t v12 = *(void *)(a2 + 344);
  }
  switch(v12)
  {
    case 8:
      if (v13 >= 0) {
        long long v14 = (uint64_t *)(a2 + 336);
      }
      else {
        long long v14 = *v11;
      }
      if (*v14 != 0x79654B69746C754DLL) {
        goto LABEL_34;
      }
      int v15 = 3;
      break;
    case 10:
      if (v13 >= 0) {
        long long v16 = (uint64_t *)(a2 + 336);
      }
      else {
        long long v16 = *v11;
      }
      uint64_t v17 = *v16;
      int v18 = *((unsigned __int16 *)v16 + 4);
      if (v17 != 0x4B7473657261654ELL || v18 != 31077) {
        goto LABEL_34;
      }
      goto LABEL_37;
    case 12:
      if (v13 >= 0) {
        uint64_t v20 = (uint64_t *)(a2 + 336);
      }
      else {
        uint64_t v20 = *v11;
      }
      uint64_t v21 = *v20;
      int v22 = *((_DWORD *)v20 + 2);
      if (v21 != 0x6E69736F6C636E45 || v22 != 2036681575) {
        goto LABEL_34;
      }
      int v15 = 2;
      break;
    case 15:
      if (v13 >= 0) {
        CFLocaleRef v24 = (uint64_t *)(a2 + 336);
      }
      else {
        CFLocaleRef v24 = *v11;
      }
      uint64_t v25 = *v24;
      uint64_t v26 = *(uint64_t *)((char *)v24 + 7);
      if (v25 != 0x4B7473657261654ELL || v26 != 0x6B6E55724F79654BLL) {
        goto LABEL_34;
      }
      int v15 = 1;
      break;
    default:
LABEL_34:
      if (qword_26ADCFE78 != -1) {
        dispatch_once(&qword_26ADCFE78, &__block_literal_global_1);
      }
      uint64_t v28 = _MergedGlobals_1;
      if (os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_ERROR))
      {
        if (*(char *)(a2 + 359) >= 0) {
          uint64_t v35 = a2 + 336;
        }
        else {
          uint64_t v35 = *(void *)(a2 + 336);
        }
        int v36 = 136315138;
        uint64_t v37 = v35;
        _os_log_error_impl(&dword_2369D6000, v28, OS_LOG_TYPE_ERROR, "Invalid key matching policy: '%s'. Using NearestKey...", (uint8_t *)&v36, 0xCu);
      }
LABEL_37:
      int v15 = 0;
      break;
  }
  char v29 = *(unsigned char *)(a2 + 360);
  *(void *)(a1 + 584) = &unk_26E9DB070;
  *(void *)(a1 + 592) = *a3;
  uint64_t v30 = a3[1];
  *(void *)(a1 + 600) = v30;
  if (v30) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v30 + 8), 1uLL, memory_order_relaxed);
  }
  *(void *)(a1 + 608) = *a5;
  uint64_t v31 = a5[1];
  *(void *)(a1 + 616) = v31;
  if (v31) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v31 + 8), 1uLL, memory_order_relaxed);
  }
  *(_DWORD *)(a1 + 624) = v15;
  *(unsigned char *)(a1 + 628) = v29;
  *(void *)(a1 + 632) = *a3;
  uint64_t v32 = a3[1];
  *(void *)(a1 + 640) = v32;
  if (v32) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v32 + 8), 1uLL, memory_order_relaxed);
  }
  *(void *)(a1 + 648) = *a4;
  uint64_t v33 = a4[1];
  *(void *)(a1 + 656) = v33;
  if (v33) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v33 + 8), 1uLL, memory_order_relaxed);
  }
  *(void *)(a1 + 664) = *a5;
  uint64_t v34 = a5[1];
  *(void *)(a1 + 672) = v34;
  if (v34) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v34 + 8), 1uLL, memory_order_relaxed);
  }
  InputTranscoder::RecognizerFactory::makeRecognizer((_DWORD *)(a1 + 80));
}

void sub_2369E4A9C(_Unwind_Exception *a1)
{
  long long v5 = *(std::__shared_weak_count **)(v1 + 672);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  CFURLRef v6 = *(std::__shared_weak_count **)(v1 + 656);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  long long v7 = *(std::__shared_weak_count **)(v1 + 640);
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  InputTranscoder::PathKeyLayoutProcessor::~PathKeyLayoutProcessor(v3);
  InputTranscoder::PathResampler::~PathResampler(v2);
  InputTranscoder::TranscoderConfiguration::~TranscoderConfiguration((void **)v1);
  _Unwind_Resume(a1);
}

double InputTranscoder::TouchTranscoderSessionImpl::setLinguisticContext(InputTranscoder::TouchTranscoderSessionImpl *this, const __CFString *a2)
{
  nlp::getUTF8StringFromCFString(a2, &v5);
  uint64_t v3 = (void **)((char *)this + 688);
  if (*((char *)this + 711) < 0) {
    operator delete(*v3);
  }
  double result = *(double *)&v5;
  *(_OWORD *)uint64_t v3 = v5;
  *((void *)this + 88) = v6;
  return result;
}

uint64_t InputTranscoder::TouchTranscoderSessionImpl::clear(uint64_t this)
{
  *(void *)(this + 480) = *(void *)(this + 472);
  *(void *)(this + 504) = *(void *)(this + 496);
  *(void *)(this + 528) = *(void *)(this + 520);
  *(void *)(this + 552) = *(void *)(this + 544);
  *(unsigned char *)(this + 568) = 0;
  *(void *)(this + 572) = 0;
  if (*(char *)(this + 735) < 0)
  {
    **(unsigned char **)(this + 712) = 0;
    *(void *)(this + 720) = 0;
  }
  else
  {
    *(unsigned char *)(this + 712) = 0;
    *(unsigned char *)(this + 735) = 0;
  }
  if (*(char *)(this + 759) < 0)
  {
    **(unsigned char **)(this + 736) = 0;
    *(void *)(this + 744) = 0;
  }
  else
  {
    *(unsigned char *)(this + 736) = 0;
    *(unsigned char *)(this + 759) = 0;
  }
  return this;
}

void InputTranscoder::TouchTranscoderSessionImpl::typingModeString(InputTranscoder::TouchTranscoderSessionImpl *this, uint64_t a2)
{
  if (!a2)
  {
    uint64_t v3 = "ContinuousPath";
    goto LABEL_5;
  }
  if (a2 == 1)
  {
    uint64_t v3 = "TapTyping";
LABEL_5:
    std::string::basic_string[abi:ne180100]<0>(this, v3);
    return;
  }
  std::to_string(&v6, a2);
  long long v4 = std::string::insert(&v6, 0, "Unknown typing mode: ", 0x15uLL);
  long long v5 = *(_OWORD *)&v4->__r_.__value_.__l.__data_;
  *((void *)this + 2) = *((void *)&v4->__r_.__value_.__l + 2);
  *(_OWORD *)this = v5;
  v4->__r_.__value_.__l.__size_ = 0;
  v4->__r_.__value_.__r.__words[2] = 0;
  v4->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v6.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v6.__r_.__value_.__l.__data_);
  }
}

void sub_2369E4C84(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void InputTranscoder::TouchTranscoderSessionImpl::addEventWithKeyInfo(uint64_t a1, unint64_t a2, uint64_t a3, double a4, double a5, double a6, double a7)
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  uint64_t v14 = *(void *)(a1 + 664);
  int v15 = (double *)operator new(0x20uLL);
  *(void *)int v15 = &unk_26E9DA8B8;
  *((void *)v15 + 1) = InputTranscoder::getScaledPoint;
  v15[2] = a4;
  v15[3] = a5;
  double v63 = *(double *)&v15;
  double v16 = (*(double (**)(double, double))(**(void **)v14 + 32))(a4, a5);
  double v18 = v17;
  std::__function::__value_func<CGPoint ()(InputTranscoder::KeyboardLayout &)>::~__value_func[abi:ne180100](buf);
  if (qword_26ADCFE78 != -1) {
    dispatch_once(&qword_26ADCFE78, &__block_literal_global_1);
  }
  std::string::size_type v19 = _MergedGlobals_1;
  if (os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v35 = v67;
    InputTranscoder::TouchTranscoderSessionImpl::typingModeString((InputTranscoder::TouchTranscoderSessionImpl *)v67, *(void *)(a1 + 88));
    if (v70 < 0) {
      uint64_t v35 = *(unsigned char **)v67;
    }
    if (a2 > 6) {
      int v36 = "unknown";
    }
    else {
      int v36 = off_264CBA4F8[a2];
    }
    std::string::basic_string[abi:ne180100]<0>(__p, v36);
    if (v61 >= 0) {
      uint64_t v37 = __p;
    }
    else {
      uint64_t v37 = (void **)__p[0];
    }
    *(_DWORD *)std::string buf = 136316674;
    *(void *)&uint8_t buf[4] = v35;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = a4;
    *(_WORD *)&buf[22] = 2048;
    double v63 = a5;
    *(_WORD *)uint64_t v64 = 2048;
    *(double *)&v64[2] = v16;
    *(_WORD *)&v64[10] = 2048;
    *(double *)&v64[12] = v18;
    *(_WORD *)&v64[20] = 2048;
    *(double *)&v64[22] = a6;
    __int16 v65 = 2080;
    std::string::size_type v66 = v37;
    _os_log_debug_impl(&dword_2369D6000, v19, OS_LOG_TYPE_DEBUG, "%s x=%f, y=%f, x_scaled=%f, y_scaled=%f timestamp=%f, phase=%s", buf, 0x48u);
    if (v61 < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v70) < 0) {
      operator delete(*(void **)v67);
    }
  }
  uint64_t v20 = (InputTranscoder::PathResampler *)(a1 + 440);
  uint64_t v21 = *(void *)(a1 + 528);
  if (*(void *)(a1 + 520) == v21)
  {
    double v23 = 0.0;
  }
  else
  {
    double v22 = *(double *)(v21 - 32);
    double v23 = v22 + hypot(v16 - *(double *)(v21 - 64), v18 - *(double *)(v21 - 56));
  }
  *(double *)std::string buf = v16;
  *(double *)&uint8_t buf[8] = v18;
  *(double *)&uint8_t buf[16] = a6;
  double v63 = a7;
  *(double *)uint64_t v64 = v23;
  *(void *)&v64[8] = a2;
  *(void *)&v64[16] = 0;
  *(_DWORD *)&v64[23] = 0;
  if (!*(void *)(a1 + 88))
  {
    InputTranscoder::PathResampler::append_and_resample(a1 + 440, (long long *)buf);
    goto LABEL_98;
  }
  CFStringRef v24 = *(const __CFString **)(a3 + 48);
  if (v24 && CFStringGetLength(v24) >= 1)
  {
    nlp::getUTF8StringFromCFString(*(const __CFString **)(a3 + 48), __p);
    if (qword_26ADCFE78 != -1) {
      dispatch_once(&qword_26ADCFE78, &__block_literal_global_1);
    }
    uint64_t v25 = _MergedGlobals_1;
    if (os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_DEBUG))
    {
      InputTranscoder::TouchTranscoderSessionImpl::typingModeString((InputTranscoder::TouchTranscoderSessionImpl *)v58, *(void *)(a1 + 88));
      if (v59 >= 0) {
        uint64_t v42 = v58;
      }
      else {
        uint64_t v42 = (void **)v58[0];
      }
      BOOL v43 = __p;
      if (v61 < 0) {
        BOOL v43 = (void **)__p[0];
      }
      *(_DWORD *)std::string::size_type v67 = 136315650;
      *(void *)&v67[4] = "getKeyClassForTouchEvent";
      __int16 v68 = 2080;
      long long v69 = v42;
      __int16 v70 = 2080;
      std::string::size_type v71 = v43;
      _os_log_debug_impl(&dword_2369D6000, v25, OS_LOG_TYPE_DEBUG, "%s: %s TouchKeyInfo.string = %s", v67, 0x20u);
      if (v59 < 0) {
        operator delete(v58[0]);
      }
    }
    int v26 = InputTranscoder::PathKeyLayoutProcessor::key_class_for_touch_key(a1 + 584, a3);
    if (v61 < 0) {
      operator delete(__p[0]);
    }
  }
  else
  {
    int v26 = InputTranscoder::PathKeyLayoutProcessor::key_class_for_touch(a1 + 584, (long long *)buf);
  }
  switch(v26)
  {
    case 1:
      InputTranscoder::PathResampler::append_and_resample(a1 + 440, (long long *)buf);
      goto LABEL_98;
    case 2:
      v64[26] = 1;
      v64[24] = 1;
      InputTranscoder::PathResampler::append_and_resample(a1 + 440, (long long *)buf);
      if (qword_26ADCFE78 != -1) {
        dispatch_once(&qword_26ADCFE78, &__block_literal_global_1);
      }
      uint64_t v31 = _MergedGlobals_1;
      if (os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)std::string::size_type v67 = 0;
        uint64_t v28 = "Shift Key - added to path for model to handle.";
        char v29 = v31;
        uint32_t v30 = 2;
        goto LABEL_65;
      }
      goto LABEL_98;
    case 3:
      if (*(void *)&v64[8] != 2) {
        goto LABEL_98;
      }
      if (qword_26ADCFE78 != -1) {
        dispatch_once(&qword_26ADCFE78, &__block_literal_global_1);
      }
      uint64_t v32 = _MergedGlobals_1;
      if (os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)std::string::size_type v67 = 0;
        _os_log_debug_impl(&dword_2369D6000, v32, OS_LOG_TYPE_DEBUG, "Space Key - clearing up the touches.", v67, 2u);
      }
      InputTranscoder::TouchTranscoderSessionImpl::clear(a1);
      if (*(char *)(a1 + 863) < 0)
      {
        if (!*(void *)(a1 + 848)) {
          goto LABEL_98;
        }
      }
      else if (!*(unsigned char *)(a1 + 863))
      {
        goto LABEL_98;
      }
      uint64_t v38 = (void *)(a1 + 840);
      std::string::append((std::string *)(a1 + 840), 1uLL, 32);
      if (qword_26ADCFE78 != -1) {
        dispatch_once(&qword_26ADCFE78, &__block_literal_global_1);
      }
      uint64_t v39 = _MergedGlobals_1;
      if (os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_DEBUG))
      {
        if (*(char *)(a1 + 863) < 0) {
          uint64_t v38 = (void *)*v38;
        }
        *(_DWORD *)std::string::size_type v67 = 136315138;
        *(void *)&v67[4] = v38;
        uint64_t v28 = "Appended space to Previous Word=[%s]";
        char v29 = v39;
        uint32_t v30 = 12;
        goto LABEL_65;
      }
      goto LABEL_98;
    case 4:
      if (*(void *)&v64[8] != 2) {
        goto LABEL_98;
      }
      if (qword_26ADCFE78 != -1) {
        dispatch_once(&qword_26ADCFE78, &__block_literal_global_1);
      }
      uint64_t v33 = _MergedGlobals_1;
      if (os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)std::string::size_type v67 = 0;
        _os_log_debug_impl(&dword_2369D6000, v33, OS_LOG_TYPE_DEBUG, "Delete Key - processing delete key.", v67, 2u);
      }
      if (*(void *)(a1 + 520) != *(void *)(a1 + 528))
      {
        if (qword_26ADCFE78 != -1) {
          dispatch_once(&qword_26ADCFE78, &__block_literal_global_1);
        }
        uint64_t v34 = _MergedGlobals_1;
        if (os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v53 = (uint64_t)(*(void *)(a1 + 528) - *(void *)(a1 + 520)) >> 6;
          *(_DWORD *)std::string::size_type v67 = 134217984;
          *(void *)&v67[4] = v53;
          _os_log_debug_impl(&dword_2369D6000, v34, OS_LOG_TYPE_DEBUG, "Delete Key - deleting last path(touch-down to touch-up) from path_resampler. raw path std::string::size_type size = %lu", v67, 0xCu);
        }
        InputTranscoder::PathResampler::pop_last_path((InputTranscoder::PathResampler *)(a1 + 440));
        goto LABEL_98;
      }
      int v40 = (long long *)(a1 + 712);
      if (*(char *)(a1 + 735) < 0) {
        uint64_t v41 = *(void *)(a1 + 720);
      }
      else {
        uint64_t v41 = *(unsigned __int8 *)(a1 + 735);
      }
      if (!v41)
      {
        if (*(char *)(a1 + 863) < 0) {
          uint64_t v48 = *(void *)(a1 + 848);
        }
        else {
          uint64_t v48 = *(unsigned __int8 *)(a1 + 863);
        }
        if (v48)
        {
          if (qword_26ADCFE78 != -1) {
            dispatch_once(&qword_26ADCFE78, &__block_literal_global_1);
          }
          double v49 = (uint64_t *)(a1 + 840);
          uint64_t v50 = _MergedGlobals_1;
          if (os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v56 = a1 + 840;
            if (*(char *)(a1 + 863) < 0) {
              uint64_t v56 = *v49;
            }
            *(_DWORD *)std::string::size_type v67 = 136315138;
            *(void *)&v67[4] = v56;
            _os_log_debug_impl(&dword_2369D6000, v50, OS_LOG_TYPE_DEBUG, "Delete Key - restoring previousWord %s as prefix", v67, 0xCu);
          }
          uint64_t v51 = *(void *)(a1 + 728);
          long long v52 = *v40;
          long long *v40 = *(_OWORD *)v49;
          *(void *)(a1 + 728) = *(void *)(a1 + 856);
          *(_OWORD *)double v49 = v52;
          *(void *)(a1 + 856) = v51;
        }
        goto LABEL_98;
      }
      if (qword_26ADCFE78 != -1) {
        dispatch_once(&qword_26ADCFE78, &__block_literal_global_1);
      }
      BOOL v44 = _MergedGlobals_1;
      if (os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v55 = a1 + 712;
        if (*(char *)(a1 + 735) < 0) {
          uint64_t v55 = *(void *)v40;
        }
        *(_DWORD *)std::string::size_type v67 = 136315138;
        *(void *)&v67[4] = v55;
        _os_log_debug_impl(&dword_2369D6000, v44, OS_LOG_TYPE_DEBUG, "Delete Key - deleting the last char from prefix %s", v67, 0xCu);
      }
      if (*(char *)(a1 + 735) < 0)
      {
        double v47 = *(const uint8_t **)(a1 + 712);
        std::string::size_type v45 = *(int *)(a1 + 720) - 1;
        LODWORD(__p[0]) = *(_DWORD *)(a1 + 720) - 1;
        int v46 = (char)v47[v45];
        if (v46 < 0) {
          goto LABEL_86;
        }
LABEL_88:
        std::string::resize((std::string *)(a1 + 712), v45, 0);
        goto LABEL_98;
      }
      std::string::size_type v45 = *(unsigned __int8 *)(a1 + 735) - 1;
      LODWORD(__p[0]) = *(unsigned __int8 *)(a1 + 735) - 1;
      int v46 = *((char *)v40 + v45);
      if ((v46 & 0x80000000) == 0) {
        goto LABEL_88;
      }
      double v47 = (const uint8_t *)(a1 + 712);
LABEL_86:
      if ((utf8_prevCharSafeBody(v47, 0, (int32_t *)__p, v46, -1) & 0x80000000) == 0)
      {
        std::string::size_type v45 = SLODWORD(__p[0]);
        goto LABEL_88;
      }
      if (qword_26ADCFE78 != -1) {
        dispatch_once(&qword_26ADCFE78, &__block_literal_global_1);
      }
      unsigned int v54 = _MergedGlobals_1;
      if (os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_ERROR))
      {
        if (*(char *)(a1 + 735) >= 0) {
          uint64_t v57 = a1 + 712;
        }
        else {
          uint64_t v57 = *(void *)(a1 + 712);
        }
        *(_DWORD *)std::string::size_type v67 = 136315394;
        *(void *)&v67[4] = "popLastCharacter";
        __int16 v68 = 2080;
        long long v69 = (void **)v57;
        _os_log_error_impl(&dword_2369D6000, v54, OS_LOG_TYPE_ERROR, "%s: failed for %s", v67, 0x16u);
      }
LABEL_98:
      if (a2 == 2) {
        InputTranscoder::PathResampler::finalize(v20);
      }
      return;
    default:
      if (qword_26ADCFE78 != -1) {
        dispatch_once(&qword_26ADCFE78, &__block_literal_global_1);
      }
      uint64_t v27 = _MergedGlobals_1;
      if (os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)std::string::size_type v67 = 67109120;
        *(_DWORD *)&v67[4] = v26;
        uint64_t v28 = "key_class = %d not supported!";
        char v29 = v27;
        uint32_t v30 = 8;
LABEL_65:
        _os_log_debug_impl(&dword_2369D6000, v29, OS_LOG_TYPE_DEBUG, v28, v67, v30);
      }
      goto LABEL_98;
  }
}

void sub_2369E5630(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,int a34,__int16 a35,char a36,char a37)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t InputTranscoder::getScaledPoint(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 32))();
}

void InputTranscoder::TouchTranscoderSessionImpl::setPrefix(std::string *this, const __CFString *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  nlp::getUTF8StringFromCFString(a2, &v12);
  uint64_t v3 = (void **)&this[29].__r_.__value_.__r.__words[2];
  if (this[30].__r_.__value_.__s.__data_[15] < 0) {
    operator delete(*v3);
  }
  *(_OWORD *)uint64_t v3 = v12;
  this[30].__r_.__value_.__l.__size_ = v13;
  if (this[30].__r_.__value_.__s.__data_[15] < 0)
  {
    std::string::pointer data = this[30].__r_.__value_.__l.__data_;
    if (!data) {
      return;
    }
    long long v5 = (std::string::value_type *)*v3;
  }
  else
  {
    std::string::pointer data = (std::string::pointer)this[30].__r_.__value_.__s.__data_[15];
    if (!this[30].__r_.__value_.__s.__data_[15]) {
      return;
    }
    long long v5 = &this[29].__r_.__value_.__s.__data_[16];
  }
  unsigned int v6 = data[(void)v5 - 1];
  if ((v6 & 0x80000000) != 0) {
    int v7 = __maskrune(v6, 0x4000uLL);
  }
  else {
    int v7 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * v6 + 60) & 0x4000;
  }
  if (v7)
  {
    if (qword_26ADCFE78 != -1) {
      dispatch_once(&qword_26ADCFE78, &__block_literal_global_1);
    }
    long long v8 = _MergedGlobals_1;
    if (os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_DEBUG))
    {
      long long v11 = &this[29].__r_.__value_.__s.__data_[16];
      if (this[30].__r_.__value_.__s.__data_[15] < 0) {
        long long v11 = (std::string::value_type *)*v3;
      }
      LODWORD(v12) = 136315138;
      *(void *)((char *)&v12 + 4) = v11;
      _os_log_debug_impl(&dword_2369D6000, v8, OS_LOG_TYPE_DEBUG, "sync_with_input_from_UI detected. Pushing prefix %s to previousWord.", (uint8_t *)&v12, 0xCu);
    }
    long long v9 = this + 35;
    std::string::operator=(this + 35, (std::string *)((char *)this + 712));
    if (SHIBYTE(this[35].__r_.__value_.__r.__words[2]) < 0)
    {
      uint64_t v10 = this[35].__r_.__value_.__l.__size_ - 1;
      long long v9 = (std::string *)this[35].__r_.__value_.__l.__data_;
      this[35].__r_.__value_.__l.__size_ = v10;
    }
    else
    {
      uint64_t v10 = HIBYTE(this[35].__r_.__value_.__r.__words[2]) - 1;
      *((unsigned char *)&this[35].__r_.__value_.__s + 23) = v10 & 0x7F;
    }
    v9->__r_.__value_.__s.__data_[v10] = 0;
    if (this[30].__r_.__value_.__s.__data_[15] < 0)
    {
      *(unsigned char *)this[29].__r_.__value_.__r.__words[2] = 0;
      this[30].__r_.__value_.__r.__words[0] = 0;
    }
    else
    {
      this[29].__r_.__value_.__s.__data_[16] = 0;
      this[30].__r_.__value_.__s.__data_[15] = 0;
    }
  }
}

uint64_t InputTranscoder::TouchTranscoderSessionImpl::textAcceptedFromUI(InputTranscoder::TouchTranscoderSessionImpl *this, const __CFString *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (a2)
  {
    nlp::getUTF8StringFromCFString(a2, &v6);
    uint64_t v3 = (void **)((char *)this + 840);
    if (*((char *)this + 863) < 0) {
      operator delete(*v3);
    }
    *(_OWORD *)uint64_t v3 = v6;
    *((void *)this + 107) = v7;
    if (qword_26ADCFE78 != -1) {
      dispatch_once(&qword_26ADCFE78, &__block_literal_global_1);
    }
    long long v4 = _MergedGlobals_1;
    if (os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_DEBUG))
    {
      if (*((char *)this + 863) < 0) {
        uint64_t v3 = (void **)*v3;
      }
      LODWORD(v6) = 136315138;
      *(void *)((char *)&v6 + 4) = v3;
      _os_log_debug_impl(&dword_2369D6000, v4, OS_LOG_TYPE_DEBUG, "textAcceptedFromUI - Previous Word=[%s]", (uint8_t *)&v6, 0xCu);
    }
    std::string::operator=((std::string *)((char *)this + 808), (const std::string *)((char *)this + 784));
  }
  return InputTranscoder::TouchTranscoderSessionImpl::clear((uint64_t)this);
}

void std::vector<InputTranscoder::CTCSurfaceFormOutput>::erase(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 != a3)
  {
    uint64_t v3 = a2;
    uint64_t v5 = a3;
    uint64_t v6 = *(void *)(a1 + 8);
    if (a3 != v6)
    {
      uint64_t v7 = (a3 - a2) >> 6 << 6;
      do
      {
        if (*(char *)(v3 + 23) < 0) {
          operator delete(*(void **)v3);
        }
        uint64_t v8 = (unsigned char *)(v3 + v7);
        long long v9 = *(_OWORD *)(v3 + v7);
        *(void *)(v3 + 16) = *(void *)(v3 + v7 + 16);
        *(_OWORD *)uint64_t v3 = v9;
        v8[23] = 0;
        *uint64_t v8 = 0;
        uint64_t v10 = (void **)(v3 + 24);
        if (*(char *)(v3 + 47) < 0) {
          operator delete(*v10);
        }
        uint64_t v11 = v3 + v7;
        long long v12 = *(_OWORD *)(v3 + v7 + 24);
        *(void *)(v3 + 40) = *(void *)(v3 + v7 + 40);
        *(_OWORD *)uint64_t v10 = v12;
        *(unsigned char *)(v11 + 47) = 0;
        *(unsigned char *)(v11 + 24) = 0;
        *(_OWORD *)(v3 + 48) = *(_OWORD *)(v3 + v7 + 48);
        v3 += 64;
      }
      while (v3 + v7 != v6);
      uint64_t v5 = *(void *)(a1 + 8);
    }
    while (v5 != v3)
    {
      v5 -= 64;
      std::__destroy_at[abi:ne180100]<InputTranscoder::CTCSurfaceFormOutput,0>(v5);
    }
    *(void *)(a1 + 8) = v3;
  }
}

uint64_t InputTranscoder::TouchTranscoderSessionImpl::updateCondenseFormForCandidates(std::vector<InputTranscoder::CTCSurfaceFormOutput> &,ITTypingMode)const::$_0::~$_0(uint64_t a1)
{
  if (*(char *)(a1 + 87) < 0) {
    operator delete(*(void **)(a1 + 64));
  }
  if (*(char *)(a1 + 47) < 0) {
    operator delete(*(void **)(a1 + 24));
  }
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
  return a1;
}

BOOL InputTranscoder::CTCSurfaceFormOutputOrderByCondensedFormThenScore(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (const void **)(a1 + 24);
  uint64_t v3 = (void **)(a2 + 24);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 47);
  if ((v4 & 0x80u) == 0) {
    uint64_t v5 = *(unsigned __int8 *)(a1 + 47);
  }
  else {
    uint64_t v5 = *(void *)(a1 + 32);
  }
  uint64_t v6 = *(unsigned __int8 *)(a2 + 47);
  int v7 = (char)v6;
  if ((v6 & 0x80u) != 0) {
    uint64_t v6 = *(void *)(a2 + 32);
  }
  if (v5 != v6) {
    return (std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v2, v3) & 0x80u) != 0;
  }
  if (v7 >= 0) {
    uint64_t v10 = (unsigned __int8 *)(a2 + 24);
  }
  else {
    uint64_t v10 = (unsigned __int8 *)*v3;
  }
  if ((v4 & 0x80) != 0)
  {
    if (!memcmp(*v2, v10, *(void *)(a1 + 32))) {
      return *(double *)(a1 + 48) > *(double *)(a2 + 48);
    }
    return (std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v2, v3) & 0x80u) != 0;
  }
  if (*(unsigned char *)(a1 + 47))
  {
    for (uint64_t i = (unsigned __int8 *)(a1 + 24); *i == *v10; ++i)
    {
      ++v10;
      if (!--v4) {
        return *(double *)(a1 + 48) > *(double *)(a2 + 48);
      }
    }
    return (std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v2, v3) & 0x80u) != 0;
  }
  return *(double *)(a1 + 48) > *(double *)(a2 + 48);
}

void InputTranscoder::TouchTranscoderSessionImpl::enumerateCandidates(uint64_t a1, const __CFDictionary *a2)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  if (qword_26ADCFE78 != -1) {
    dispatch_once(&qword_26ADCFE78, &__block_literal_global_1);
  }
  uint64_t v4 = _MergedGlobals_1;
  if (os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_DEBUG))
  {
    InputTranscoder::TouchTranscoderSessionImpl::typingModeString((InputTranscoder::TouchTranscoderSessionImpl *)&v33, *(void *)(a1 + 88));
    int v26 = (std::string *)v33.__r_.__value_.__r.__words[0];
    if ((v33.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      int v26 = &v33;
    }
    uint64_t v27 = (void *)(a1 + 712);
    if (*(char *)(a1 + 735) < 0) {
      uint64_t v27 = (void *)*v27;
    }
    LODWORD(v36.__r_.__value_.__l.__data_) = 136315394;
    *(std::string::size_type *)((char *)v36.__r_.__value_.__r.__words + 4) = (std::string::size_type)v26;
    WORD2(v36.__r_.__value_.__r.__words[1]) = 2080;
    *(std::string::size_type *)((char *)&v36.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v27;
    _os_log_debug_impl(&dword_2369D6000, v4, OS_LOG_TYPE_DEBUG, "%s enumerateCandidates - Prefix = %s", (uint8_t *)&v36, 0x16u);
    if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v33.__r_.__value_.__l.__data_);
    }
  }
  CFStringRef Optional = (const __CFString *)InputTranscoder::getOptionalCFType<__CFString const*>(a2, @"exactTypedString", &stru_26E9DB590);
  nlp::getUTF8StringFromCFString(Optional, &v36);
  InputTranscoder::splitAtLastWord((char *)&v36, &v33);
  if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v36.__r_.__value_.__l.__data_);
  }
  CFStringRef v6 = (const __CFString *)InputTranscoder::getOptionalCFType<__CFString const*>(a2, @"previousTypedString", &stru_26E9DB590);
  nlp::getUTF8StringFromCFString(v6, v31);
  CFStringRef v7 = (const __CFString *)InputTranscoder::getOptionalCFType<__CFString const*>(a2, @"previousCandidateString", &stru_26E9DB590);
  nlp::getUTF8StringFromCFString(v7, __p);
  InputTranscoder::removeSpace((uint64_t)&v33, &__s1);
  uint64_t v8 = HIBYTE(__s1.__r_.__value_.__r.__words[2]);
  if ((__s1.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(__s1.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = __s1.__r_.__value_.__l.__size_;
  }
  unint64_t v10 = v30;
  if ((v30 & 0x80u) != 0) {
    unint64_t v10 = (unint64_t)__p[1];
  }
  if (size != v10) {
    goto LABEL_50;
  }
  if ((v30 & 0x80u) == 0) {
    uint64_t v11 = __p;
  }
  else {
    uint64_t v11 = (void **)__p[0];
  }
  if ((*((unsigned char *)&__s1.__r_.__value_.__s + 23) & 0x80) != 0)
  {
    if (memcmp(__s1.__r_.__value_.__l.__data_, v11, __s1.__r_.__value_.__l.__size_)) {
      goto LABEL_50;
    }
    goto LABEL_22;
  }
  if (!*((unsigned char *)&__s1.__r_.__value_.__s + 23))
  {
LABEL_22:
    if (*(void *)(a1 + 88) && *(_DWORD *)(a1 + 80) == 4)
    {
      uint64_t v13 = *(void *)(a1 + 664);
      v36.__r_.__value_.__r.__words[0] = (std::string::size_type)&unk_26E9DAB08;
      v36.__r_.__value_.__l.__size_ = (std::string::size_type)v31;
      uint64_t v37 = &v36;
      BOOL isPresentInLexicon = InputTranscoder::LexiconContainer::isPresentInLexicon(*(void *)(v13 + 16) + 192, (uint64_t)v31);
      int v15 = std::__function::__value_func<BOOL ()(InputTranscoder::CTCDecoder &)>::~__value_func[abi:ne180100](&v36);
      std::string::size_type v16 = HIBYTE(v33.__r_.__value_.__r.__words[2]);
      if ((v33.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        std::string::size_type v16 = v33.__r_.__value_.__l.__size_;
      }
      if (v16)
      {
        double v17 = (v32 & 0x80u) == 0 ? (char *)v32 : (char *)v31[1];
        if (v17 && !isPresentInLexicon)
        {
          std::string::size_type v19 = &v36;
          std::string::basic_string[abi:ne180100]((uint64_t)v15, (unint64_t)(v17 + 1));
          if ((v36.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
            std::string::size_type v19 = (std::string *)v36.__r_.__value_.__r.__words[0];
          }
          if ((v32 & 0x80u) == 0) {
            uint64_t v20 = v31;
          }
          else {
            uint64_t v20 = (void **)v31[0];
          }
          memmove(v19, v20, (size_t)v17);
          *(_WORD *)&v17[(void)v19] = 32;
          if ((v34.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            uint64_t v21 = &v34;
          }
          else {
            uint64_t v21 = (std::string *)v34.__r_.__value_.__r.__words[0];
          }
          if ((v34.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            std::string::size_type v22 = HIBYTE(v34.__r_.__value_.__r.__words[2]);
          }
          else {
            std::string::size_type v22 = v34.__r_.__value_.__l.__size_;
          }
          double v23 = std::string::append(&v36, (const std::string::value_type *)v21, v22);
          std::string::size_type v24 = v23->__r_.__value_.__r.__words[0];
          v35[0] = v23->__r_.__value_.__l.__size_;
          *(void *)((char *)v35 + 7) = *(std::string::size_type *)((char *)&v23->__r_.__value_.__r.__words[1] + 7);
          char v25 = HIBYTE(v23->__r_.__value_.__r.__words[2]);
          v23->__r_.__value_.__l.__size_ = 0;
          v23->__r_.__value_.__r.__words[2] = 0;
          v23->__r_.__value_.__r.__words[0] = 0;
          if (*(char *)(a1 + 807) < 0) {
            operator delete(*(void **)(a1 + 784));
          }
          *(void *)(a1 + 784) = v24;
          *(void *)(a1 + 792) = v35[0];
          *(void *)(a1 + 799) = *(void *)((char *)v35 + 7);
          *(unsigned char *)(a1 + 807) = v25;
          if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v36.__r_.__value_.__l.__data_);
          }
          *(unsigned char *)(a1 + 834) = 1;
          InputTranscoder::TouchTranscoderSessionImpl::enumerateCandidatesImpl(a1, a2);
        }
      }
    }
    goto LABEL_50;
  }
  p_s1 = &__s1;
  while (p_s1->__r_.__value_.__s.__data_[0] == *(unsigned __int8 *)v11)
  {
    p_s1 = (std::string *)((char *)p_s1 + 1);
    uint64_t v11 = (void **)((char *)v11 + 1);
    if (!--v8) {
      goto LABEL_22;
    }
  }
LABEL_50:
  std::string::operator=((std::string *)(a1 + 784), &v34);
  *(unsigned char *)(a1 + 834) = 0;
  InputTranscoder::TouchTranscoderSessionImpl::enumerateCandidatesImpl(a1, a2);
  if (SHIBYTE(__s1.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__s1.__r_.__value_.__l.__data_);
  }
  if ((char)v30 < 0) {
    operator delete(__p[0]);
  }
  if ((char)v32 < 0) {
    operator delete(v31[0]);
  }
  if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v34.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v33.__r_.__value_.__l.__data_);
  }
}

void sub_2369E5FF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,void *a27)
{
  if (*(char *)(v27 - 89) < 0) {
    operator delete(*(void **)(v27 - 112));
  }
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  if (a26 < 0) {
    operator delete(a21);
  }
  InputTranscoder::CTCConfiguration::~CTCConfiguration(&a27);
  _Unwind_Resume(a1);
}

void InputTranscoder::TouchTranscoderSessionImpl::enumerateCandidatesImpl(uint64_t a1, const __CFDictionary *a2)
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  CFDictionaryRef theDict = a2;
  BOOL v3 = *(unsigned char *)(a1 + 568) == 0;
  long long v4 = *(_OWORD *)(a1 + 456);
  v57[0] = *(_OWORD *)(a1 + 440);
  v57[1] = v4;
  InputTranscoder::Path::Path((InputTranscoder::Path *)&v58, (const InputTranscoder::Path *)(a1 + 472));
  InputTranscoder::Path::Path((InputTranscoder::Path *)v62, (const InputTranscoder::Path *)(a1 + 520));
  uint64_t v65 = *(void *)(a1 + 568);
  int v66 = *(_DWORD *)(a1 + 576);
  if (v3) {
    InputTranscoder::PathResampler::finalize((InputTranscoder::PathResampler *)v57);
  }
  uint64_t v36 = a1;
  if (*(void *)(a1 + 88) || (unint64_t)(v59 - (unsigned char *)v58) >= 0x80)
  {
    uint64_t v5 = (std::string *)(a1 + 784);
    InputTranscoder::toLower(a1 + 784, (uint64_t)buf);
    CFStringRef v6 = (void **)(a1 + 760);
    if (*(char *)(a1 + 783) < 0) {
      operator delete(*v6);
    }
    *(_OWORD *)CFStringRef v6 = *(_OWORD *)buf;
    *(void *)(a1 + 776) = *(void *)&buf[16];
    if (*(void *)(a1 + 88) != 1) {
      goto LABEL_25;
    }
    if (*(char *)(a1 + 807) < 0)
    {
      uint64_t v8 = *(char **)(a1 + 784);
      uint64_t v7 = *(void *)(a1 + 792);
      if (!v7) {
        goto LABEL_21;
      }
    }
    else
    {
      uint64_t v7 = *(unsigned __int8 *)(a1 + 807);
      uint64_t v8 = (char *)(a1 + 784);
      if (!*(unsigned char *)(a1 + 807))
      {
LABEL_21:
        if (*(char *)(v36 + 783) < 0) {
          unint64_t v13 = *(void *)(v36 + 768);
        }
        else {
          unint64_t v13 = *(unsigned __int8 *)(v36 + 783);
        }
        if (v13 <= 2) {
          goto LABEL_68;
        }
LABEL_25:
        *(unsigned char *)(v36 + 832) = CFDictionaryContainsKey(theDict, @"normalizeAutoCorrectionsSeparately") != 0;
        *(unsigned char *)(v36 + 833) = CFDictionaryContainsKey(theDict, @"appendTopEnumeratedPrefixes") != 0;
        if (*(char *)(v36 + 807) < 0) {
          std::string::__init_copy_ctor_external(&v51, *(const std::string::value_type **)(v36 + 784), *(void *)(v36 + 792));
        }
        else {
          std::string v51 = *v5;
        }
        InputTranscoder::InputProcessor::InputProcessor((uint64_t)&v52, (InputTranscoder::PathKeyLayoutProcessor *)(v36 + 584), (uint64_t)&v58, v36, (uint64_t)&v51);
        if (SHIBYTE(v51.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v51.__r_.__value_.__l.__data_);
        }
        uint64_t v48 = 0;
        double v49 = 0;
        uint64_t v50 = 0;
        std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(&v48, v52, (uint64_t)v53, (v53 - (unsigned char *)v52) >> 2);
        if (v49 == v48)
        {
          uint64_t v15 = 0;
          uint64_t v14 = 0;
          long long v46 = 0u;
          long long v47 = 0u;
        }
        else
        {
          (***(void (****)(long long *__return_ptr))(v36 + 680))(&v46);
          uint64_t v14 = *((void *)&v47 + 1);
          uint64_t v15 = v47;
        }
        long long v45 = v46;
        uint64_t v43 = v15;
        uint64_t v44 = v14;
        if (!*((void *)&v46 + 1) && v49 != v48)
        {
          if (_nlpDefaultLog::token != -1) {
            dispatch_once(&_nlpDefaultLog::token, &__block_literal_global_2);
          }
          char v25 = _nlpDefaultLog::log;
          if (os_log_type_enabled((os_log_t)_nlpDefaultLog::log, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)std::string buf = 0;
            _os_log_error_impl(&dword_2369D6000, v25, OS_LOG_TYPE_ERROR, "call to model returned empty probabilities.", buf, 2u);
          }
          if (v48)
          {
            double v49 = v48;
            operator delete(v48);
          }
          *(void *)std::string buf = &v56;
          std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
          if (v54)
          {
            uint64_t v55 = v54;
            operator delete(v54);
          }
          if (v52)
          {
            uint64_t v53 = v52;
            operator delete(v52);
          }
          goto LABEL_68;
        }
        memset(v42, 0, sizeof(v42));
        uint64_t v39 = 0;
        *(void *)int v40 = 0;
        uint64_t v41 = 0;
        int64x2_t v37 = 0uLL;
        v38[0] = 0;
        unint64_t v16 = *(unsigned int *)(v36 + 240);
        if (v16)
        {
          std::string::size_type v71 = (std::string::size_type)v38;
          double v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<InputTranscoder::CTCSurfaceFormOutput>>((uint64_t)v38, v16);
          uint64_t v19 = v37.i64[1];
          uint64_t v20 = v37.i64[0];
          if (v37.i64[1] == v37.i64[0])
          {
            int64x2_t v24 = vdupq_n_s64(v37.u64[1]);
            uint64_t v21 = v17;
          }
          else
          {
            uint64_t v21 = v17;
            do
            {
              long long v22 = *(_OWORD *)(v19 - 64);
              *((void *)v21 - 6) = *(void *)(v19 - 48);
              *((_OWORD *)v21 - 4) = v22;
              *(void *)(v19 - 56) = 0;
              *(void *)(v19 - 48) = 0;
              *(void *)(v19 - 64) = 0;
              long long v23 = *(_OWORD *)(v19 - 40);
              *((void *)v21 - 3) = *(void *)(v19 - 24);
              *(_OWORD *)(v21 - 40) = v23;
              *(void *)(v19 - 32) = 0;
              *(void *)(v19 - 24) = 0;
              *(void *)(v19 - 40) = 0;
              *((_OWORD *)v21 - 1) = *(_OWORD *)(v19 - 16);
              v21 -= 64;
              v19 -= 64;
            }
            while (v19 != v20);
            int64x2_t v24 = v37;
          }
          v37.i64[0] = (uint64_t)v21;
          v37.i64[1] = (uint64_t)v17;
          *(int64x2_t *)&uint8_t buf[8] = v24;
          int v26 = (void *)v38[0];
          v38[0] = &v17[64 * v18];
          std::string __p = v26;
          *(void *)std::string buf = v24.i64[0];
          std::__split_buffer<InputTranscoder::CTCSurfaceFormOutput>::~__split_buffer((uint64_t)buf);
        }
        uint64_t v27 = (uint64_t *)(v36 + 712);
        if (*(char *)(v36 + 735) < 0)
        {
          uint64_t v28 = *(void *)(v36 + 720);
          if (!v28) {
            goto LABEL_61;
          }
          uint64_t v29 = *v27;
        }
        else
        {
          uint64_t v28 = *(unsigned __int8 *)(v36 + 735);
          if (!*(unsigned char *)(v36 + 735)) {
            goto LABEL_61;
          }
          uint64_t v29 = v36 + 712;
        }
        unsigned int v30 = *(char *)(v29 + v28 - 1);
        if ((v30 & 0x80000000) != 0) {
          int v31 = __maskrune(v30, 0x4000uLL);
        }
        else {
          int v31 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * v30 + 60) & 0x4000;
        }
        if (v31)
        {
          if (qword_26ADCFE78 != -1) {
            dispatch_once(&qword_26ADCFE78, &__block_literal_global_1);
          }
          unsigned __int8 v32 = _MergedGlobals_1;
          if (os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v35 = v36 + 712;
            if (*(char *)(v36 + 735) < 0) {
              uint64_t v35 = *v27;
            }
            *(_DWORD *)std::string buf = 136315394;
            *(void *)&uint8_t buf[4] = "clearPrefixIfEndingWithSpace";
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = v35;
            _os_log_debug_impl(&dword_2369D6000, v32, OS_LOG_TYPE_DEBUG, "%s: prefix = [%s]", buf, 0x16u);
          }
          if (*(char *)(v36 + 735) < 0)
          {
            **(unsigned char **)(v36 + 712) = 0;
            *(void *)(v36 + 720) = 0;
          }
          else
          {
            *(unsigned char *)(v36 + 712) = 0;
            *(unsigned char *)(v36 + 735) = 0;
          }
        }
LABEL_61:
        uint64_t v33 = *(void *)(v36 + 664);
        __int16 v68 = 0;
        std::string v34 = operator new(0x50uLL);
        *std::string v34 = &unk_26E9DAB98;
        v34[1] = v36;
        v34[2] = &v39;
        v34[3] = &theDict;
        v34[4] = v36 + 760;
        v34[5] = v42;
        v34[6] = &v37;
        v34[7] = &v45;
        v34[8] = &v44;
        v34[9] = &v43;
        __int16 v68 = v34;
        std::__function::__func<InputTranscoder::TouchTranscoderSessionImpl::enumerateCandidatesImpl(__CFDictionary const*,std::function<BOOL ()(std::unique_ptr<InputTranscoder::CandidateImpl>)> const&,std::string &)::$_0,std::allocator<InputTranscoder::TouchTranscoderSessionImpl::enumerateCandidatesImpl(__CFDictionary const*,std::function<BOOL ()(std::unique_ptr<InputTranscoder::CandidateImpl>)> const&,std::string &)::$_0>,void ()(InputTranscoder::CTCDecoder &)>::operator()((uint64_t)v34, *(InputTranscoder::CTCDecoder **)(v33 + 16));
      }
    }
    uint64_t v9 = MEMORY[0x263EF8318];
    while (1)
    {
      unsigned int v10 = *v8;
      int v11 = (v10 & 0x80000000) != 0 ? __maskrune(*v8, 0x100uLL) : *(_DWORD *)(v9 + 4 * v10 + 60) & 0x100;
      if (v10 != 32 && v11 == 0) {
        break;
      }
      ++v8;
      if (!--v7) {
        goto LABEL_21;
      }
    }
  }
LABEL_68:
  if (v63)
  {
    uint64_t v64 = v63;
    operator delete(v63);
  }
  if (v62[0])
  {
    v62[1] = v62[0];
    operator delete(v62[0]);
  }
  if (v60)
  {
    char v61 = v60;
    operator delete(v60);
  }
  if (v58)
  {
    char v59 = v58;
    operator delete(v58);
  }
}

void sub_2369E85B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,void *a42,uint64_t a43,uint64_t a44,void *a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
  if (SLOBYTE(STACK[0x2A7]) < 0) {
    operator delete((void *)STACK[0x290]);
  }
  if (*(char *)(v59 - 137) < 0) {
    operator delete(*(void **)(v59 - 160));
  }
  if (SLOBYTE(STACK[0x247]) < 0) {
    operator delete((void *)STACK[0x230]);
  }
  *(void *)(v59 - 160) = &STACK[0x250];
  std::vector<std::unique_ptr<InputTranscoder::CandidateImpl>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v59 - 160));
  STACK[0x250] = (unint64_t)&a23;
  std::vector<InputTranscoder::CTCSurfaceFormOutput>::__destroy_vector::operator()[abi:ne180100]((void ***)&STACK[0x250]);
  STACK[0x250] = (unint64_t)&a27;
  std::vector<InputTranscoder::CTCSurfaceFormOutput>::__destroy_vector::operator()[abi:ne180100]((void ***)&STACK[0x250]);
  STACK[0x250] = (unint64_t)&a30;
  std::vector<InputTranscoder::CTCSurfaceFormOutput>::__destroy_vector::operator()[abi:ne180100]((void ***)&STACK[0x250]);
  if (a42)
  {
    a43 = (uint64_t)a42;
    operator delete(a42);
  }
  InputTranscoder::InputProcessor::~InputProcessor((InputTranscoder::InputProcessor *)&a49);
  InputTranscoder::PathResampler::~PathResampler((InputTranscoder::PathResampler *)&a59);
  _Unwind_Resume(a1);
}

void InputTranscoder::InputProcessor::~InputProcessor(InputTranscoder::InputProcessor *this)
{
  long long v4 = (void **)((char *)this + 56);
  std::vector<std::vector<float>>::__destroy_vector::operator()[abi:ne180100](&v4);
  uint64_t v2 = (void *)*((void *)this + 3);
  if (v2)
  {
    *((void *)this + 4) = v2;
    operator delete(v2);
  }
  BOOL v3 = *(void **)this;
  if (*(void *)this)
  {
    *((void *)this + 1) = v3;
    operator delete(v3);
  }
}

void InputTranscoder::TouchTranscoderSessionImpl::extractCandidatesAndSavePrefixInfo(uint64_t a1, int64x2_t *a2, _DWORD *a3, _DWORD *a4, uint64_t a5, double *a6, uint64_t *a7, unsigned char *a8)
{
  uint64_t v8 = a8;
  int v11 = a3;
  uint64_t v103 = *MEMORY[0x263EF8340];
  uint64_t v14 = a1 + 212;
  int v13 = *(_DWORD *)(a1 + 212);
  uint64_t v15 = *(void *)(a1 + 648);
  memset(&v97, 0, sizeof(v97));
  if (a6)
  {
    *(void *)std::string buf = 0;
    *(_OWORD *)&v100.__r_.__value_.__l.__data_ = 0uLL;
    InputTranscoder::PathTrie::getPath((uint64_t)a6, (uint64_t)buf);
    uint64_t v18 = *(_DWORD **)buf;
    std::string::size_type v17 = v100.__r_.__value_.__r.__words[0];
    if (*(void *)buf != v100.__r_.__value_.__r.__words[0])
    {
      do
      {
        if (*v18 == v13)
        {
          std::string::basic_string[abi:ne180100]<0>(&v94, " ");
        }
        else
        {
          uint64_t v19 = (*(uint64_t (**)(uint64_t, _DWORD *))(*(void *)v15 + 32))(v15, v18);
          if (*(char *)(v19 + 23) < 0)
          {
            std::string::__init_copy_ctor_external(&v94, *(const std::string::value_type **)v19, *(void *)(v19 + 8));
          }
          else
          {
            long long v20 = *(_OWORD *)v19;
            v94.__r_.__value_.__r.__words[2] = *(void *)(v19 + 16);
            *(_OWORD *)&v94.__r_.__value_.__l.__data_ = v20;
          }
        }
        if ((v94.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          uint64_t v21 = &v94;
        }
        else {
          uint64_t v21 = (std::string *)v94.__r_.__value_.__r.__words[0];
        }
        if ((v94.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          std::string::size_type size = HIBYTE(v94.__r_.__value_.__r.__words[2]);
        }
        else {
          std::string::size_type size = v94.__r_.__value_.__l.__size_;
        }
        std::string::append(&v97, (const std::string::value_type *)v21, size);
        if (SHIBYTE(v94.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v94.__r_.__value_.__l.__data_);
        }
        ++v18;
      }
      while (v18 != (_DWORD *)v17);
      uint64_t v18 = *(_DWORD **)buf;
    }
    uint64_t v8 = a8;
    if (v18)
    {
      v100.__r_.__value_.__r.__words[0] = (std::string::size_type)v18;
      operator delete(v18);
    }
    int v11 = a3;
  }
  int v23 = *(char *)(a1 + 735);
  if (v23 >= 0) {
    int64x2_t v24 = (const std::string::value_type *)(v14 + 500);
  }
  else {
    int64x2_t v24 = *(const std::string::value_type **)(a1 + 712);
  }
  if (v23 >= 0) {
    std::string::size_type v25 = *(unsigned __int8 *)(a1 + 735);
  }
  else {
    std::string::size_type v25 = *(void *)(a1 + 720);
  }
  int v26 = std::string::insert(&v97, 0, v24, v25);
  long long v27 = *(_OWORD *)&v26->__r_.__value_.__l.__data_;
  v98.__r_.__value_.__r.__words[2] = v26->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v98.__r_.__value_.__l.__data_ = v27;
  v26->__r_.__value_.__l.__size_ = 0;
  v26->__r_.__value_.__r.__words[2] = 0;
  v26->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v97.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v97.__r_.__value_.__l.__data_);
  }
  uint64_t v28 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 648) + 32))(*(void *)(a1 + 648), v14);
  BOOL HasSeparator = InputTranscoder::stringHasSeparator(&v98.__r_.__value_.__l.__data_, v28);
  std::string::value_type v30 = (*(uint64_t (**)(double *))(*(void *)a6 + 72))(a6);
  if (*((_DWORD *)a6 + 20) >= *(_DWORD *)(a1 + 252) && *a4 < *(_DWORD *)(a1 + 240))
  {
    double v31 = a6[8];
    double v32 = (*(double (**)(double *))(*(void *)a6 + 48))(a6);
    float v33 = *(float *)(a1 + 156);
    float v34 = *(float *)(a1 + 256);
    if (SHIBYTE(v98.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&v94, v98.__r_.__value_.__l.__data_, v98.__r_.__value_.__l.__size_);
    }
    else {
      std::string v94 = v98;
    }
    memset(&v95, 0, sizeof(v95));
    *(double *)&long long v96 = v31 + v32 * v33 - v34;
    WORD4(v96) = 0;
    BYTE10(v96) = HasSeparator;
    BYTE11(v96) = v30;
    HIDWORD(v96) = 0;
    *(void *)std::string buf = a6;
    BOOL v90 = HasSeparator;
    if (SHIBYTE(v94.__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::__init_copy_ctor_external(&v100, v94.__r_.__value_.__l.__data_, v94.__r_.__value_.__l.__size_);
      if (SHIBYTE(v95.__r_.__value_.__r.__words[2]) < 0)
      {
        std::string::__init_copy_ctor_external(&__p, v95.__r_.__value_.__l.__data_, v95.__r_.__value_.__l.__size_);
        long long v102 = v96;
        if (SHIBYTE(v95.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v95.__r_.__value_.__l.__data_);
        }
        goto LABEL_38;
      }
    }
    else
    {
      std::string v100 = v94;
    }
    std::string __p = v95;
    long long v102 = v96;
LABEL_38:
    if (SHIBYTE(v94.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v94.__r_.__value_.__l.__data_);
    }
    unint64_t v35 = a7[2];
    unint64_t v36 = a7[1];
    if (v36 >= v35)
    {
      unint64_t v39 = 0x8E38E38E38E38E39 * ((uint64_t)(v36 - *a7) >> 3);
      unint64_t v40 = v39 + 1;
      if (v39 + 1 > 0x38E38E38E38E38ELL) {
        std::vector<InputTranscoder::InputFeature>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v41 = 0x8E38E38E38E38E39 * ((uint64_t)(v35 - *a7) >> 3);
      if (2 * v41 > v40) {
        unint64_t v40 = 2 * v41;
      }
      if (v41 >= 0x1C71C71C71C71C7) {
        unint64_t v42 = 0x38E38E38E38E38ELL;
      }
      else {
        unint64_t v42 = v40;
      }
      v95.__r_.__value_.__l.__size_ = (std::string::size_type)(a7 + 2);
      if (v42) {
        unint64_t v42 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>>>(v42);
      }
      else {
        uint64_t v43 = 0;
      }
      std::string::size_type v44 = v42 + 72 * v39;
      v94.__r_.__value_.__r.__words[0] = v42;
      v94.__r_.__value_.__l.__size_ = v44;
      v95.__r_.__value_.__r.__words[0] = v42 + 72 * v43;
      *(void *)std::string::size_type v44 = *(void *)buf;
      long long v45 = *(_OWORD *)&v100.__r_.__value_.__l.__data_;
      *(void *)(v44 + 24) = *((void *)&v100.__r_.__value_.__l + 2);
      *(_OWORD *)(v44 + 8) = v45;
      memset(&v100, 0, sizeof(v100));
      long long v46 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
      *(void *)(v44 + 48) = *((void *)&__p.__r_.__value_.__l + 2);
      *(_OWORD *)(v44 + 32) = v46;
      memset(&__p, 0, sizeof(__p));
      *(_OWORD *)(v44 + 56) = v102;
      v94.__r_.__value_.__r.__words[2] = v44 + 72;
      std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>>::__swap_out_circular_buffer(a7, &v94);
      uint64_t v47 = a7[1];
      std::__split_buffer<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>>::~__split_buffer((uint64_t)&v94);
      int v48 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
      a7[1] = v47;
      if (v48 < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
    }
    else
    {
      *(void *)unint64_t v36 = *(void *)buf;
      long long v37 = *(_OWORD *)&v100.__r_.__value_.__l.__data_;
      *(void *)(v36 + 24) = *((void *)&v100.__r_.__value_.__l + 2);
      *(_OWORD *)(v36 + 8) = v37;
      memset(&v100, 0, sizeof(v100));
      long long v38 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
      *(void *)(v36 + 48) = *((void *)&__p.__r_.__value_.__l + 2);
      *(_OWORD *)(v36 + 32) = v38;
      memset(&__p, 0, sizeof(__p));
      *(_OWORD *)(v36 + 56) = v102;
      a7[1] = v36 + 72;
    }
    BOOL HasSeparator = v90;
    if (SHIBYTE(v100.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v100.__r_.__value_.__l.__data_);
    }
  }
  if (*v11 >= *(_DWORD *)(a1 + 236)) {
    goto LABEL_101;
  }
  if (*(unsigned char *)(a1 + 152))
  {
    if (!(*(unsigned int (**)(double *))(*(void *)a6 + 16))(a6)) {
      goto LABEL_101;
    }
    double v49 = a6[8];
    std::string::value_type v91 = HasSeparator;
    double v50 = v49 + (*(double (**)(double *))(*(void *)a6 + 40))(a6) * *(float *)(a1 + 156);
    std::string::value_type v51 = (*(uint64_t (**)(double *))(*(void *)a6 + 16))(a6);
    unint64_t v52 = a2[1].u64[0];
    unint64_t v53 = a2->u64[1];
    if (v53 >= v52)
    {
      uint64_t v65 = (uint64_t)(v53 - a2->i64[0]) >> 6;
      if ((unint64_t)(v65 + 1) >> 58) {
        std::vector<InputTranscoder::PathTrie *>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v66 = v52 - a2->i64[0];
      uint64_t v67 = v66 >> 5;
      if (v66 >> 5 <= (unint64_t)(v65 + 1)) {
        uint64_t v67 = v65 + 1;
      }
      if ((unint64_t)v66 >= 0x7FFFFFFFFFFFFFC0) {
        unint64_t v68 = 0x3FFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v68 = v67;
      }
      __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&a2[1];
      long long v69 = a2;
      if (v68) {
        __int16 v70 = std::__allocate_at_least[abi:ne180100]<std::allocator<InputTranscoder::CTCSurfaceFormOutput>>((uint64_t)a2[1].i64, v68);
      }
      else {
        __int16 v70 = 0;
      }
      *(void *)std::string buf = v70;
      v100.__r_.__value_.__r.__words[0] = (std::string::size_type)v70 + 64 * v65;
      v100.__r_.__value_.__l.__size_ = v100.__r_.__value_.__r.__words[0];
      v100.__r_.__value_.__r.__words[2] = (std::string::size_type)v70 + 64 * v68;
      InputTranscoder::CTCSurfaceFormOutput::CTCSurfaceFormOutput((std::string *)v100.__r_.__value_.__l.__data_, (long long *)&v98, 0, v51, v91, v30, v50);
      uint64_t v82 = a2->i64[0];
      unint64_t v81 = a2->u64[1];
      std::string::size_type v83 = v100.__r_.__value_.__l.__size_;
      std::string::size_type v84 = v100.__r_.__value_.__r.__words[0];
      if (v81 == a2->i64[0])
      {
        int64x2_t v87 = vdupq_n_s64(v81);
      }
      else
      {
        do
        {
          long long v85 = *(_OWORD *)(v81 - 64);
          *(void *)(v84 - 48) = *(void *)(v81 - 48);
          *(_OWORD *)(v84 - 64) = v85;
          *(void *)(v81 - 56) = 0;
          *(void *)(v81 - 48) = 0;
          *(void *)(v81 - 64) = 0;
          long long v86 = *(_OWORD *)(v81 - 40);
          *(void *)(v84 - 24) = *(void *)(v81 - 24);
          *(_OWORD *)(v84 - 40) = v86;
          *(void *)(v81 - 32) = 0;
          *(void *)(v81 - 24) = 0;
          *(void *)(v81 - 40) = 0;
          *(_OWORD *)(v84 - 16) = *(_OWORD *)(v81 - 16);
          v84 -= 64;
          v81 -= 64;
        }
        while (v81 != v82);
        int64x2_t v87 = *a2;
      }
      std::string::size_type v80 = v83 + 64;
      a2->i64[0] = v84;
      a2->i64[1] = v83 + 64;
      *(int64x2_t *)&v100.__r_.__value_.__l.__data_ = v87;
      std::string::size_type v88 = a2[1].u64[0];
      a2[1].i64[0] = v100.__r_.__value_.__r.__words[2];
      v100.__r_.__value_.__r.__words[2] = v88;
      *(void *)std::string buf = v87.i64[0];
      std::__split_buffer<InputTranscoder::CTCSurfaceFormOutput>::~__split_buffer((uint64_t)buf);
    }
    else
    {
      if (SHIBYTE(v98.__r_.__value_.__r.__words[2]) < 0)
      {
        std::string::__init_copy_ctor_external((std::string *)a2->i64[1], v98.__r_.__value_.__l.__data_, v98.__r_.__value_.__l.__size_);
      }
      else
      {
        long long v54 = *(_OWORD *)&v98.__r_.__value_.__l.__data_;
        *(void *)(v53 + 16) = *((void *)&v98.__r_.__value_.__l + 2);
        *(_OWORD *)unint64_t v53 = v54;
      }
      *(void *)(v53 + 24) = 0;
      *(void *)(v53 + 32) = 0;
      *(void *)(v53 + 40) = 0;
      *(double *)(v53 + 48) = v50;
      *(unsigned char *)(v53 + 56) = 0;
      *(unsigned char *)(v53 + 57) = v51;
      *(unsigned char *)(v53 + 58) = v91;
      *(unsigned char *)(v53 + 59) = v30;
      *(_DWORD *)(v53 + 60) = 0;
      std::string::size_type v80 = v53 + 64;
      long long v69 = a2;
      a2->i64[1] = v53 + 64;
    }
    v69->i64[1] = v80;
  }
  else
  {
    double v55 = a6[8];
    unint64_t v56 = a2[1].u64[0];
    unint64_t v57 = a2->u64[1];
    if (v57 >= v56)
    {
      uint64_t v59 = (uint64_t)(v57 - a2->i64[0]) >> 6;
      if ((unint64_t)(v59 + 1) >> 58) {
        std::vector<InputTranscoder::PathTrie *>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v60 = v56 - a2->i64[0];
      uint64_t v61 = v60 >> 5;
      if (v60 >> 5 <= (unint64_t)(v59 + 1)) {
        uint64_t v61 = v59 + 1;
      }
      if ((unint64_t)v60 >= 0x7FFFFFFFFFFFFFC0) {
        unint64_t v62 = 0x3FFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v62 = v61;
      }
      __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&a2[1];
      double v63 = a2;
      if (v62) {
        uint64_t v64 = std::__allocate_at_least[abi:ne180100]<std::allocator<InputTranscoder::CTCSurfaceFormOutput>>((uint64_t)a2[1].i64, v62);
      }
      else {
        uint64_t v64 = 0;
      }
      *(void *)std::string buf = v64;
      v100.__r_.__value_.__r.__words[0] = (std::string::size_type)v64 + 64 * v59;
      v100.__r_.__value_.__l.__size_ = v100.__r_.__value_.__r.__words[0];
      v100.__r_.__value_.__r.__words[2] = (std::string::size_type)v64 + 64 * v62;
      InputTranscoder::CTCSurfaceFormOutput::CTCSurfaceFormOutput((std::string *)v100.__r_.__value_.__l.__data_, (long long *)&v98, 0, 0, 0, 0, v55);
      uint64_t v73 = a2->i64[0];
      unint64_t v72 = a2->u64[1];
      std::string::size_type v74 = v100.__r_.__value_.__l.__size_;
      std::string::size_type v75 = v100.__r_.__value_.__r.__words[0];
      if (v72 == a2->i64[0])
      {
        int64x2_t v78 = vdupq_n_s64(v72);
      }
      else
      {
        do
        {
          long long v76 = *(_OWORD *)(v72 - 64);
          *(void *)(v75 - 48) = *(void *)(v72 - 48);
          *(_OWORD *)(v75 - 64) = v76;
          *(void *)(v72 - 56) = 0;
          *(void *)(v72 - 48) = 0;
          *(void *)(v72 - 64) = 0;
          long long v77 = *(_OWORD *)(v72 - 40);
          *(void *)(v75 - 24) = *(void *)(v72 - 24);
          *(_OWORD *)(v75 - 40) = v77;
          *(void *)(v72 - 32) = 0;
          *(void *)(v72 - 24) = 0;
          *(void *)(v72 - 40) = 0;
          *(_OWORD *)(v75 - 16) = *(_OWORD *)(v72 - 16);
          v75 -= 64;
          v72 -= 64;
        }
        while (v72 != v73);
        int64x2_t v78 = *a2;
      }
      std::string::size_type v71 = v74 + 64;
      a2->i64[0] = v75;
      a2->i64[1] = v74 + 64;
      *(int64x2_t *)&v100.__r_.__value_.__l.__data_ = v78;
      std::string::size_type v79 = a2[1].u64[0];
      a2[1].i64[0] = v100.__r_.__value_.__r.__words[2];
      v100.__r_.__value_.__r.__words[2] = v79;
      *(void *)std::string buf = v78.i64[0];
      std::__split_buffer<InputTranscoder::CTCSurfaceFormOutput>::~__split_buffer((uint64_t)buf);
    }
    else
    {
      if (SHIBYTE(v98.__r_.__value_.__r.__words[2]) < 0)
      {
        std::string::__init_copy_ctor_external((std::string *)a2->i64[1], v98.__r_.__value_.__l.__data_, v98.__r_.__value_.__l.__size_);
      }
      else
      {
        long long v58 = *(_OWORD *)&v98.__r_.__value_.__l.__data_;
        *(void *)(v57 + 16) = *((void *)&v98.__r_.__value_.__l + 2);
        *(_OWORD *)unint64_t v57 = v58;
      }
      *(void *)(v57 + 24) = 0;
      *(void *)(v57 + 32) = 0;
      *(void *)(v57 + 40) = 0;
      *(double *)(v57 + 48) = v55;
      std::string::size_type v71 = v57 + 64;
      *(void *)(v57 + 56) = 0;
      double v63 = a2;
      a2->i64[1] = v57 + 64;
    }
    v63->i64[1] = v71;
  }
  ++*v11;
LABEL_101:
  ++*a4;
  if (*v11 >= *(_DWORD *)(a1 + 236)) {
    *uint64_t v8 = 1;
  }
  if (SHIBYTE(v98.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v98.__r_.__value_.__l.__data_);
  }
}

void sub_2369E94D8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,void *__p,uint64_t a32,int a33,__int16 a34,char a35,char a36,uint64_t a37,void *a38,void *a39,uint64_t a40,int a41,__int16 a42,char a43,char a44)
{
  *(void *)(a12 + 8) = v44;
  if (a36 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>::~pair(uint64_t a1)
{
  if (*(char *)(a1 + 55) < 0) {
    operator delete(*(void **)(a1 + 32));
  }
  if (*(char *)(a1 + 31) < 0) {
    operator delete(*(void **)(a1 + 8));
  }
  return a1;
}

uint64_t InputTranscoder::TouchTranscoderSessionImpl::extractCompletionsAndPrefixes(uint64_t a1, uint64_t a2, int64x2_t *a3, uint64_t a4)
{
  uint64_t v7 = (long long *)(a4 + 8);
  unint64_t v8 = a3[1].u64[0];
  unint64_t v9 = a3->u64[1];
  if (v9 >= v8)
  {
    uint64_t v12 = (uint64_t)(v9 - a3->i64[0]) >> 6;
    if ((unint64_t)(v12 + 1) >> 58) {
      std::vector<InputTranscoder::PathTrie *>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v13 = v8 - a3->i64[0];
    uint64_t v14 = v13 >> 5;
    if (v13 >> 5 <= (unint64_t)(v12 + 1)) {
      uint64_t v14 = v12 + 1;
    }
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFC0) {
      unint64_t v15 = 0x3FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v15 = v14;
    }
    uint64_t v29 = a3 + 1;
    if (v15) {
      unint64_t v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<InputTranscoder::CTCSurfaceFormOutput>>((uint64_t)a3[1].i64, v15);
    }
    else {
      unint64_t v16 = 0;
    }
    int v26 = v16;
    v27.i64[0] = (uint64_t)&v16[64 * v12];
    v27.i64[1] = v27.i64[0];
    uint64_t v28 = &v16[64 * v15];
    std::construct_at[abi:ne180100]<InputTranscoder::CTCSurfaceFormOutput,InputTranscoder::CTCSurfaceFormOutput const&,InputTranscoder::CTCSurfaceFormOutput*>((std::string *)v27.i64[0], v7);
    uint64_t v18 = a3->i64[0];
    unint64_t v17 = a3->u64[1];
    uint64_t v19 = v27.i64[0];
    uint64_t v20 = v27.i64[0];
    if (v17 == a3->i64[0])
    {
      int64x2_t v23 = vdupq_n_s64(v17);
    }
    else
    {
      do
      {
        long long v21 = *(_OWORD *)(v17 - 64);
        *(void *)(v20 - 48) = *(void *)(v17 - 48);
        *(_OWORD *)(v20 - 64) = v21;
        *(void *)(v17 - 56) = 0;
        *(void *)(v17 - 48) = 0;
        *(void *)(v17 - 64) = 0;
        long long v22 = *(_OWORD *)(v17 - 40);
        *(void *)(v20 - 24) = *(void *)(v17 - 24);
        *(_OWORD *)(v20 - 40) = v22;
        *(void *)(v17 - 32) = 0;
        *(void *)(v17 - 24) = 0;
        *(void *)(v17 - 40) = 0;
        *(_OWORD *)(v20 - 16) = *(_OWORD *)(v17 - 16);
        v20 -= 64;
        v17 -= 64;
      }
      while (v17 != v18);
      int64x2_t v23 = *a3;
    }
    uint64_t v11 = v19 + 64;
    a3->i64[0] = v20;
    a3->i64[1] = v19 + 64;
    int64x2_t v27 = v23;
    int64x2_t v24 = (char *)a3[1].i64[0];
    a3[1].i64[0] = (uint64_t)v28;
    uint64_t v28 = v24;
    int v26 = (char *)v23.i64[0];
    uint64_t result = std::__split_buffer<InputTranscoder::CTCSurfaceFormOutput>::~__split_buffer((uint64_t)&v26);
  }
  else
  {
    uint64_t result = (uint64_t)std::construct_at[abi:ne180100]<InputTranscoder::CTCSurfaceFormOutput,InputTranscoder::CTCSurfaceFormOutput const&,InputTranscoder::CTCSurfaceFormOutput*>((std::string *)a3->i64[1], (long long *)(a4 + 8));
    uint64_t v11 = v9 + 64;
    a3->i64[1] = v11;
  }
  a3->i64[1] = v11;
  if (*(_DWORD *)(a1 + 244))
  {
    std::string::size_type v25 = *(uint64_t (**)(void))(**(void **)a4 + 56);
    return v25();
  }
  return result;
}

void sub_2369E97D0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<InputTranscoder::CTCSurfaceFormOutput>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void InputTranscoder::TouchTranscoderSessionImpl::enumerateKeyCandidatesForLastTouch(void *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = a1[66];
  if (v2 == a1[65])
  {
    double v3 = 0.0;
    double v4 = 0.0;
  }
  else
  {
    double v4 = *(double *)(v2 - 64);
    double v3 = *(double *)(v2 - 56);
  }
  if (qword_26ADCFE78 != -1) {
    dispatch_once(&qword_26ADCFE78, &__block_literal_global_1);
  }
  uint64_t v5 = _MergedGlobals_1;
  if (os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)std::string buf = 136315650;
    *(void *)&uint8_t buf[4] = "enumerateKeyCandidatesForLastTouch";
    __int16 v10 = 2048;
    double v11 = v4;
    __int16 v12 = 2048;
    double v13 = v3;
    _os_log_debug_impl(&dword_2369D6000, v5, OS_LOG_TYPE_DEBUG, "%s: Point[x,y] - [%f,%f]", buf, 0x20u);
  }
  uint64_t v6 = a1[83];
  uint64_t v7 = (double *)operator new(0x20uLL);
  *(void *)uint64_t v7 = &unk_26E9DAE28;
  *((void *)v7 + 1) = InputTranscoder::keyCandidatesForLastTouch;
  void v7[2] = v4;
  v7[3] = v3;
  double v13 = *(double *)&v7;
  (*(void (**)(void *__return_ptr, double, double))(**(void **)v6 + 72))(v8, v4, v3);
  std::__function::__value_func<std::vector<InputTranscoder::KeyCandidateImpl> ()(InputTranscoder::KeyboardLayout &)>::~__value_func[abi:ne180100](buf);
  if (v8[0] != v8[1]) {
    operator new();
  }
  *(void *)std::string buf = v8;
  std::vector<InputTranscoder::KeyCandidateImpl>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
}

void sub_2369E9A60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  std::__function::__value_func<std::vector<InputTranscoder::KeyCandidateImpl> ()(InputTranscoder::KeyboardLayout &)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t InputTranscoder::keyCandidatesForLastTouch(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 72))();
}

BOOL InputTranscoder::CTCSurfaceFormOutputCompareByScore(uint64_t a1, uint64_t a2)
{
  return *(double *)(a1 + 48) > *(double *)(a2 + 48);
}

void std::vector<InputTranscoder::CTCSurfaceFormOutput>::resize(int64x2_t *a1, unint64_t a2)
{
  uint64_t v4 = a1->i64[0];
  uint64_t v5 = a1->i64[1];
  unint64_t v6 = (v5 - a1->i64[0]) >> 6;
  if (a2 <= v6)
  {
    if (a2 < v6)
    {
      uint64_t v22 = v4 + (a2 << 6);
      while (v5 != v22)
      {
        v5 -= 64;
        std::__destroy_at[abi:ne180100]<InputTranscoder::CTCSurfaceFormOutput,0>(v5);
      }
      a1->i64[1] = v22;
    }
  }
  else
  {
    uint64_t i64 = (uint64_t)a1[1].i64;
    uint64_t v8 = a1[1].i64[0];
    if (a2 - v6 <= (v8 - v5) >> 6)
    {
      unint64_t v23 = v5 + ((a2 - v6) << 6);
      do
      {
        *(_OWORD *)(v5 + 16) = 0uLL;
        *(_OWORD *)(v5 + 32) = 0uLL;
        *(_OWORD *)uint64_t v5 = 0uLL;
        *(void *)(v5 + 48) = 0xFFEFFFFFFFFFFFFFLL;
        *(void *)(v5 + 56) = 0;
        v5 += 64;
      }
      while (v5 != v23);
      a1->i64[1] = v23;
    }
    else
    {
      if (a2 >> 58) {
        std::vector<InputTranscoder::PathTrie *>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v9 = v8 - v4;
      uint64_t v10 = v9 >> 5;
      if (v9 >> 5 <= a2) {
        uint64_t v10 = a2;
      }
      if ((unint64_t)v9 >= 0x7FFFFFFFFFFFFFC0) {
        unint64_t v11 = 0x3FFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v11 = v10;
      }
      uint64_t v28 = a1 + 1;
      __int16 v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<InputTranscoder::CTCSurfaceFormOutput>>(i64, v11);
      uint64_t v14 = &v12[64 * v6];
      unint64_t v15 = &v12[64 * a2];
      unint64_t v16 = v14;
      do
      {
        *((_OWORD *)v16 + 1) = 0uLL;
        *((_OWORD *)v16 + 2) = 0uLL;
        *(_OWORD *)unint64_t v16 = 0uLL;
        *((void *)v16 + 6) = 0xFFEFFFFFFFFFFFFFLL;
        *((void *)v16 + 7) = 0;
        v16 += 64;
      }
      while (v16 != v15);
      uint64_t v18 = a1->i64[0];
      unint64_t v17 = a1->u64[1];
      if (v17 == a1->i64[0])
      {
        int64x2_t v21 = vdupq_n_s64(v17);
      }
      else
      {
        do
        {
          long long v19 = *(_OWORD *)(v17 - 64);
          *((void *)v14 - 6) = *(void *)(v17 - 48);
          *((_OWORD *)v14 - 4) = v19;
          *(void *)(v17 - 56) = 0;
          *(void *)(v17 - 48) = 0;
          *(void *)(v17 - 64) = 0;
          long long v20 = *(_OWORD *)(v17 - 40);
          *((void *)v14 - 3) = *(void *)(v17 - 24);
          *(_OWORD *)(v14 - 40) = v20;
          *(void *)(v17 - 32) = 0;
          *(void *)(v17 - 24) = 0;
          *(void *)(v17 - 40) = 0;
          *((_OWORD *)v14 - 1) = *(_OWORD *)(v17 - 16);
          v14 -= 64;
          v17 -= 64;
        }
        while (v17 != v18);
        int64x2_t v21 = *a1;
      }
      a1->i64[0] = (uint64_t)v14;
      a1->i64[1] = (uint64_t)v15;
      int64x2_t v26 = v21;
      uint64_t v24 = a1[1].i64[0];
      a1[1].i64[0] = (uint64_t)&v12[64 * v13];
      uint64_t v27 = v24;
      uint64_t v25 = v21.i64[0];
      std::__split_buffer<InputTranscoder::CTCSurfaceFormOutput>::~__split_buffer((uint64_t)&v25);
    }
  }
}

void InputTranscoder::normalizeScore(uint64_t a1, uint64_t a2, float a3, float a4)
{
  if (a1 != a2)
  {
    uint64_t v7 = a1;
    uint64_t v8 = a1 + 64;
    uint64_t v9 = a1;
    if (a1 + 64 != a2)
    {
      uint64_t v9 = a1;
      do
      {
        if (*(double *)(v9 + 48) < *(double *)(v8 + 48)) {
          uint64_t v9 = v8;
        }
        v8 += 64;
      }
      while (v8 != a2);
    }
    double v10 = *(double *)(v9 + 48);
    double v11 = 2.22044605e-16;
    uint64_t v12 = a1;
    do
    {
      long double v13 = exp(*(double *)(v12 + 48) - v10);
      *(long double *)(v12 + 48) = v13;
      double v11 = v11 + v13;
      v12 += 64;
    }
    while (v12 != a2);
    do
    {
      float v14 = *(double *)(v7 + 48) / v11;
      *(double *)(v7 + 48) = (float)(powf(v14, a4) * a3);
      v7 += 64;
    }
    while (v7 != a2);
  }
}

BOOL InputTranscoder::CTCSurfaceFormOutputOrderByStringThenScore(unsigned __int8 *a1, void **a2)
{
  uint64_t v2 = a2;
  uint64_t v4 = a1[23];
  if ((v4 & 0x80u) == 0) {
    uint64_t v5 = (void *)a1[23];
  }
  else {
    uint64_t v5 = (void *)*((void *)a1 + 1);
  }
  unint64_t v6 = (void *)*((unsigned __int8 *)a2 + 23);
  int v7 = (char)v6;
  if ((char)v6 < 0) {
    unint64_t v6 = a2[1];
  }
  if (v5 != v6) {
    return (std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a1, v2) & 0x80u) != 0;
  }
  if (v7 < 0) {
    a2 = (void **)*a2;
  }
  if ((v4 & 0x80) != 0)
  {
    if (!memcmp(*(const void **)a1, a2, *((void *)a1 + 1))) {
      return *((double *)a1 + 6) > *((double *)v2 + 6);
    }
    return (std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a1, v2) & 0x80u) != 0;
  }
  if (a1[23])
  {
    for (uint64_t i = a1; *i == *(unsigned __int8 *)a2; ++i)
    {
      a2 = (void **)((char *)a2 + 1);
      if (!--v4) {
        return *((double *)a1 + 6) > *((double *)v2 + 6);
      }
    }
    return (std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a1, v2) & 0x80u) != 0;
  }
  return *((double *)a1 + 6) > *((double *)v2 + 6);
}

BOOL InputTranscoder::CTCSurfaceFormOutputCompareByString(unsigned __int8 *a1, unsigned __int8 *a2)
{
  uint64_t v2 = a1[23];
  if ((v2 & 0x80u) == 0) {
    uint64_t v3 = a1[23];
  }
  else {
    uint64_t v3 = *((void *)a1 + 1);
  }
  uint64_t v4 = a2[23];
  int v5 = (char)v4;
  if ((v4 & 0x80u) != 0) {
    uint64_t v4 = *((void *)a2 + 1);
  }
  if (v3 != v4) {
    return 0;
  }
  if (v5 < 0) {
    a2 = *(unsigned __int8 **)a2;
  }
  if ((v2 & 0x80) != 0) {
    return memcmp(*(const void **)a1, a2, *((void *)a1 + 1)) == 0;
  }
  if (!a1[23]) {
    return 1;
  }
  uint64_t v6 = v2 - 1;
  do
  {
    int v8 = *a1++;
    int v7 = v8;
    int v10 = *a2++;
    int v9 = v10;
    BOOL v12 = v6-- != 0;
    BOOL v13 = v7 == v9;
    BOOL v14 = v7 == v9;
  }
  while (v13 && v12);
  return v14;
}

InputTranscoder::Path *InputTranscoder::Path::Path(InputTranscoder::Path *this, const InputTranscoder::Path *a2)
{
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  std::vector<InputTranscoder::PathSample>::__init_with_size[abi:ne180100]<InputTranscoder::PathSample*,InputTranscoder::PathSample*>(this, *(const void **)a2, *((void *)a2 + 1), (uint64_t)(*((void *)a2 + 1) - *(void *)a2) >> 6);
  *((void *)this + 3) = 0;
  *((void *)this + 4) = 0;
  *((void *)this + 5) = 0;
  std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>((void *)this + 3, *((const void **)a2 + 3), *((void *)a2 + 4), (uint64_t)(*((void *)a2 + 4) - *((void *)a2 + 3)) >> 2);
  return this;
}

void sub_2369E9F58(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<InputTranscoder::PathSample>::__init_with_size[abi:ne180100]<InputTranscoder::PathSample*,InputTranscoder::PathSample*>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    uint64_t result = std::vector<InputTranscoder::PathSample>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    uint64_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8 - 5);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_2369E9FD4(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<InputTranscoder::PathSample>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 58) {
    std::vector<InputTranscoder::InputFeature>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<InputTranscoder::CTCSurfaceFormOutput>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[64 * v4];
  return result;
}

os_log_t ___ZN15InputTranscoderL6loggerEv_block_invoke_1()
{
  os_log_t result = os_log_create("com.apple.InputTranscoder", "TouchTranscoderSessionImpl");
  _MergedGlobals_1 = (uint64_t)result;
  return result;
}

void std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(InputTranscoder::CTCSurfaceFormOutput const&,InputTranscoder::CTCSurfaceFormOutput const&),InputTranscoder::CTCSurfaceFormOutput*,false>(uint64_t *a1, unint64_t a2, unsigned int (**a3)(long long *, long long *, __n128), uint64_t a4, char a5)
{
  v160[2] = *MEMORY[0x263EF8340];
LABEL_2:
  unint64_t v9 = (unint64_t)a1;
  v144 = a1 + 16;
  v145 = a1 + 8;
  int v10 = a1 + 3;
  v141 = a1 + 4;
  v142 = a1 + 1;
  double v11 = a1 + 6;
  v143 = a1 - 8;
  BOOL v12 = (void **)a2;
  while (1)
  {
    uint64_t v13 = (uint64_t)v12 - v9;
    uint64_t v14 = (uint64_t)((uint64_t)v12 - v9) >> 6;
    if (v6 || !v5)
    {
      switch(v14)
      {
        case 0:
        case 1:
          return;
        case 2:
          if (((unsigned int (*)(void **, unint64_t))*a3)(v12 - 8, v9)) {
            std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<InputTranscoder::CTCSurfaceFormOutput *&,InputTranscoder::CTCSurfaceFormOutput *&>((uint64_t *)v9, (long long *)v12 - 4);
          }
          break;
        case 3:
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(InputTranscoder::CTCSurfaceFormOutput const&,InputTranscoder::CTCSurfaceFormOutput const&),InputTranscoder::CTCSurfaceFormOutput*>((uint64_t *)v9, (long long *)(v9 + 64), (long long *)v12 - 4, a3);
          break;
        case 4:
          std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(InputTranscoder::CTCSurfaceFormOutput const&,InputTranscoder::CTCSurfaceFormOutput const&),InputTranscoder::CTCSurfaceFormOutput*>((uint64_t *)v9, (long long *)(v9 + 64), (long long *)(v9 + 128), (long long *)v12 - 4, a3);
          break;
        case 5:
          std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(InputTranscoder::CTCSurfaceFormOutput const&,InputTranscoder::CTCSurfaceFormOutput const&),InputTranscoder::CTCSurfaceFormOutput*>((uint64_t *)v9, (long long *)(v9 + 64), (long long *)(v9 + 128), (long long *)(v9 + 192), (long long *)v12 - 4, a3);
          break;
        default:
          JUMPOUT(0);
      }
      return;
    }
    a2 = (unint64_t)v12;
    if (v13 <= 1535) {
      break;
    }
    if (!a4)
    {
      if ((void **)v9 != v12)
      {
        int64_t v150 = (unint64_t)(v14 - 2) >> 1;
        int64_t v72 = v150;
        do
        {
          int64_t v73 = v72;
          if (v150 >= v72)
          {
            uint64_t v74 = (2 * v72) | 1;
            unint64_t v75 = v9 + (v74 << 6);
            if (2 * v72 + 2 < v14
              && ((unsigned int (*)(unint64_t, unint64_t))*a3)(v9 + (v74 << 6), v75 + 64))
            {
              v75 += 64;
              uint64_t v74 = 2 * v73 + 2;
            }
            unint64_t v76 = v9 + (v73 << 6);
            if ((((uint64_t (*)(unint64_t, unint64_t))*a3)(v75, v76) & 1) == 0)
            {
              long long v77 = *(_OWORD *)v76;
              uint64_t v154 = *(void *)(v76 + 16);
              *(_OWORD *)v153 = v77;
              *(void *)(v76 + 8) = 0;
              *(void *)(v76 + 16) = 0;
              *(void *)unint64_t v76 = 0;
              unint64_t v78 = v9 + (v73 << 6);
              long long v79 = *(_OWORD *)(v78 + 24);
              uint64_t v156 = *(void *)(v78 + 40);
              long long __p = v79;
              *(void *)(v78 + 32) = 0;
              *(void *)(v78 + 40) = 0;
              *(void *)(v78 + 24) = 0;
              long long v157 = *(_OWORD *)(v78 + 48);
              do
              {
                unint64_t v80 = v75;
                if (*(char *)(v76 + 23) < 0) {
                  operator delete(*(void **)v76);
                }
                long long v81 = *(_OWORD *)v75;
                *(void *)(v76 + 16) = *(void *)(v75 + 16);
                *(_OWORD *)unint64_t v76 = v81;
                *(unsigned char *)(v75 + 23) = 0;
                *(unsigned char *)unint64_t v75 = 0;
                uint64_t v82 = (void **)(v76 + 24);
                if (*(char *)(v76 + 47) < 0) {
                  operator delete(*v82);
                }
                long long v83 = *(_OWORD *)(v80 + 24);
                *(void *)(v76 + 40) = *(void *)(v80 + 40);
                *(_OWORD *)uint64_t v82 = v83;
                *(unsigned char *)(v80 + 47) = 0;
                *(unsigned char *)(v80 + 24) = 0;
                *(_OWORD *)(v76 + 48) = *(_OWORD *)(v80 + 48);
                if (v150 < v74) {
                  break;
                }
                uint64_t v84 = (2 * v74) | 1;
                unint64_t v75 = v9 + (v84 << 6);
                uint64_t v74 = 2 * v74 + 2;
                if (v74 < v14)
                {
                  if (((unsigned int (*)(unint64_t, unint64_t))*a3)(v9 + (v84 << 6), v75 + 64)) {
                    v75 += 64;
                  }
                  else {
                    uint64_t v74 = v84;
                  }
                }
                else
                {
                  uint64_t v74 = v84;
                }
                unint64_t v76 = v80;
              }
              while (!((unsigned int (*)(unint64_t, void **))*a3)(v75, v153));
              if (*(char *)(v80 + 23) < 0) {
                operator delete(*(void **)v80);
              }
              long long v85 = (void **)(v80 + 24);
              long long v86 = (_OWORD *)(v80 + 48);
              long long v87 = *(_OWORD *)v153;
              *(void *)(v80 + 16) = v154;
              *(_OWORD *)unint64_t v80 = v87;
              HIBYTE(v154) = 0;
              LOBYTE(v153[0]) = 0;
              if (*(char *)(v80 + 47) < 0)
              {
                operator delete(*v85);
                int v89 = SHIBYTE(v154);
                long long v90 = __p;
                *(void *)(v80 + 40) = v156;
                *(_OWORD *)long long v85 = v90;
                HIBYTE(v156) = 0;
                LOBYTE(__p) = 0;
                *long long v86 = v157;
                if (v89 < 0) {
                  operator delete(v153[0]);
                }
              }
              else
              {
                long long v88 = __p;
                *(void *)(v80 + 40) = v156;
                *(_OWORD *)long long v85 = v88;
                *long long v86 = v157;
              }
            }
          }
          int64_t v72 = v73 - 1;
        }
        while (v73);
        uint64_t v91 = (unint64_t)v13 >> 6;
        unint64_t v92 = a2;
        do
        {
          if (v91 >= 2)
          {
            uint64_t v93 = 0;
            uint64_t v94 = *(void *)v9;
            v160[0] = *(void *)(v9 + 8);
            *(void *)((char *)v160 + 7) = *(void *)(v9 + 15);
            char v148 = *(unsigned char *)(v9 + 23);
            *(void *)unint64_t v9 = 0;
            *(void *)(v9 + 8) = 0;
            *(void *)(v9 + 16) = 0;
            uint64_t v147 = *(void *)(v9 + 24);
            *(void *)&v159[7] = *(void *)(v9 + 39);
            *(void *)v159 = *(void *)(v9 + 32);
            char v151 = *(unsigned char *)(v9 + 47);
            *(void *)(v9 + 32) = 0;
            *(void *)(v9 + 40) = 0;
            *(void *)(v9 + 24) = 0;
            unint64_t v95 = v9;
            long long v158 = *(_OWORD *)(v9 + 48);
            do
            {
              uint64_t v96 = v95 + (v93 << 6) + 64;
              uint64_t v97 = 2 * v93;
              uint64_t v93 = (2 * v93) | 1;
              uint64_t v98 = v97 + 2;
              if (v97 + 2 < v91 && ((unsigned int (*)(uint64_t, uint64_t))*a3)(v96, v96 + 64))
              {
                v96 += 64;
                uint64_t v93 = v98;
              }
              if (*(char *)(v95 + 23) < 0) {
                operator delete(*(void **)v95);
              }
              long long v99 = *(_OWORD *)v96;
              *(void *)(v95 + 16) = *(void *)(v96 + 16);
              *(_OWORD *)unint64_t v95 = v99;
              *(unsigned char *)(v96 + 23) = 0;
              *(unsigned char *)uint64_t v96 = 0;
              std::string v100 = (void **)(v95 + 24);
              if (*(char *)(v95 + 47) < 0) {
                operator delete(*v100);
              }
              long long v101 = *(_OWORD *)(v96 + 24);
              *(void *)(v95 + 40) = *(void *)(v96 + 40);
              *(_OWORD *)std::string v100 = v101;
              *(unsigned char *)(v96 + 47) = 0;
              *(unsigned char *)(v96 + 24) = 0;
              *(_OWORD *)(v95 + 48) = *(_OWORD *)(v96 + 48);
              unint64_t v95 = v96;
            }
            while (v93 <= (uint64_t)((unint64_t)(v91 - 2) >> 1));
            long long v102 = (void **)(v96 + 24);
            uint64_t v103 = (long long *)(v96 + 48);
            v104 = (void **)(v92 - 64);
            int v105 = *(char *)(v96 + 23);
            if (v96 == v92 - 64)
            {
              if (v105 < 0) {
                operator delete(*(void **)v96);
              }
              *(void *)uint64_t v96 = v94;
              uint64_t v123 = *(void *)((char *)v160 + 7);
              *(void *)(v96 + 8) = v160[0];
              *(void *)(v96 + 15) = v123;
              *(unsigned char *)(v96 + 23) = v148;
              if (*(char *)(v96 + 47) < 0) {
                operator delete(*v102);
              }
              *(void *)(v96 + 24) = v147;
              uint64_t v124 = *(void *)v159;
              *(void *)(v96 + 39) = *(void *)&v159[7];
              *(void *)(v96 + 32) = v124;
              *(unsigned char *)(v96 + 47) = v151;
              *uint64_t v103 = v158;
            }
            else
            {
              if (v105 < 0) {
                operator delete(*(void **)v96);
              }
              long long v106 = *(_OWORD *)v104;
              *(void *)(v96 + 16) = *(void *)(v92 - 48);
              *(_OWORD *)uint64_t v96 = v106;
              *(unsigned char *)(v92 - 41) = 0;
              *(unsigned char *)(v92 - 64) = 0;
              if (*(char *)(v96 + 47) < 0) {
                operator delete(*v102);
              }
              long long v107 = *(_OWORD *)(v92 - 40);
              *(void *)(v96 + 40) = *(void *)(v92 - 24);
              *(_OWORD *)long long v102 = v107;
              *(unsigned char *)(v92 - 17) = 0;
              *(unsigned char *)(v92 - 40) = 0;
              *uint64_t v103 = *(_OWORD *)(v92 - 16);
              if (*(char *)(v92 - 41) < 0) {
                operator delete(*v104);
              }
              *(void *)(v92 - 64) = v94;
              uint64_t v108 = v160[0];
              *(void *)(v92 - 49) = *(void *)((char *)v160 + 7);
              *(void *)(v92 - 56) = v108;
              *(unsigned char *)(v92 - 41) = v148;
              if (*(char *)(v92 - 17) < 0) {
                operator delete(*(void **)(v92 - 40));
              }
              *(void *)(v92 - 40) = v147;
              uint64_t v109 = *(void *)v159;
              *(void *)(v92 - 25) = *(void *)&v159[7];
              *(void *)(v92 - 32) = v109;
              *(unsigned char *)(v92 - 17) = v151;
              *(_OWORD *)(v92 - 16) = v158;
              uint64_t v110 = v96 + 64 - v9;
              if (v110 >= 65)
              {
                unint64_t v111 = (((unint64_t)v110 >> 6) - 2) >> 1;
                unint64_t v112 = v9 + (v111 << 6);
                if (((unsigned int (*)(unint64_t, uint64_t))*a3)(v112, v96))
                {
                  long long v113 = *(_OWORD *)v96;
                  uint64_t v154 = *(void *)(v96 + 16);
                  *(_OWORD *)v153 = v113;
                  *(void *)(v96 + 8) = 0;
                  *(void *)(v96 + 16) = 0;
                  *(void *)uint64_t v96 = 0;
                  long long v114 = *(_OWORD *)v102;
                  uint64_t v156 = *(void *)(v96 + 40);
                  long long __p = v114;
                  *(void *)(v96 + 32) = 0;
                  *(void *)(v96 + 40) = 0;
                  *long long v102 = 0;
                  long long v157 = *v103;
                  do
                  {
                    uint64_t v115 = v112;
                    if (*(char *)(v96 + 23) < 0) {
                      operator delete(*(void **)v96);
                    }
                    long long v116 = *(_OWORD *)v112;
                    *(void *)(v96 + 16) = *(void *)(v112 + 16);
                    *(_OWORD *)uint64_t v96 = v116;
                    *(unsigned char *)(v112 + 23) = 0;
                    *(unsigned char *)unint64_t v112 = 0;
                    v117 = (void **)(v96 + 24);
                    if (*(char *)(v96 + 47) < 0) {
                      operator delete(*v117);
                    }
                    long long v118 = *(_OWORD *)(v115 + 24);
                    *(void *)(v96 + 40) = *(void *)(v115 + 40);
                    *(_OWORD *)v117 = v118;
                    *(unsigned char *)(v115 + 47) = 0;
                    *(unsigned char *)(v115 + 24) = 0;
                    *(_OWORD *)(v96 + 48) = *(_OWORD *)(v115 + 48);
                    if (!v111) {
                      break;
                    }
                    unint64_t v111 = (v111 - 1) >> 1;
                    unint64_t v112 = v9 + (v111 << 6);
                    uint64_t v96 = v115;
                  }
                  while ((((uint64_t (*)(unint64_t, void **))*a3)(v112, v153) & 1) != 0);
                  if (*(char *)(v115 + 23) < 0) {
                    operator delete(*(void **)v115);
                  }
                  v119 = (void **)(v115 + 24);
                  v120 = (_OWORD *)(v115 + 48);
                  long long v121 = *(_OWORD *)v153;
                  *(void *)(v115 + 16) = v154;
                  *(_OWORD *)uint64_t v115 = v121;
                  HIBYTE(v154) = 0;
                  LOBYTE(v153[0]) = 0;
                  if (*(char *)(v115 + 47) < 0)
                  {
                    operator delete(*v119);
                    int v126 = SHIBYTE(v154);
                    long long v127 = __p;
                    *(void *)(v115 + 40) = v156;
                    *(_OWORD *)v119 = v127;
                    HIBYTE(v156) = 0;
                    LOBYTE(__p) = 0;
                    _OWORD *v120 = v157;
                    if (v126 < 0) {
                      operator delete(v153[0]);
                    }
                  }
                  else
                  {
                    long long v122 = __p;
                    *(void *)(v115 + 40) = v156;
                    *(_OWORD *)v119 = v122;
                    _OWORD *v120 = v157;
                  }
                }
              }
            }
          }
          v92 -= 64;
        }
        while ((unint64_t)v91-- > 2);
      }
      return;
    }
    unint64_t v15 = v12;
    unint64_t v16 = (unint64_t)v14 >> 1;
    unint64_t v17 = v9 + ((unint64_t)v14 >> 1 << 6);
    uint64_t v18 = v15 - 8;
    if ((unint64_t)v13 <= 0x2000)
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(InputTranscoder::CTCSurfaceFormOutput const&,InputTranscoder::CTCSurfaceFormOutput const&),InputTranscoder::CTCSurfaceFormOutput*>((uint64_t *)v17, (long long *)v9, (long long *)v15 - 4, a3);
    }
    else
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(InputTranscoder::CTCSurfaceFormOutput const&,InputTranscoder::CTCSurfaceFormOutput const&),InputTranscoder::CTCSurfaceFormOutput*>((uint64_t *)v9, (long long *)v17, (long long *)v15 - 4, a3);
      long long v19 = (long long *)(v9 + (v16 << 6));
      long long v20 = (uint64_t *)(v19 - 4);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(InputTranscoder::CTCSurfaceFormOutput const&,InputTranscoder::CTCSurfaceFormOutput const&),InputTranscoder::CTCSurfaceFormOutput*>(v145, v19 - 4, (long long *)(a2 - 128), a3);
      v19 += 4;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(InputTranscoder::CTCSurfaceFormOutput const&,InputTranscoder::CTCSurfaceFormOutput const&),InputTranscoder::CTCSurfaceFormOutput*>(v144, v19, (long long *)(a2 - 192), a3);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(InputTranscoder::CTCSurfaceFormOutput const&,InputTranscoder::CTCSurfaceFormOutput const&),InputTranscoder::CTCSurfaceFormOutput*>(v20, (long long *)v17, v19, a3);
      uint64_t v21 = *(void *)v9;
      *(void *)&long long v158 = *v142;
      *(void *)((char *)&v158 + 7) = *(void *)((char *)v142 + 7);
      char v22 = *(unsigned char *)(v9 + 23);
      *(void *)unint64_t v9 = 0;
      *(void *)(v9 + 8) = 0;
      *(void *)(v9 + 16) = 0;
      uint64_t v23 = *(void *)(v9 + 24);
      v160[0] = *v141;
      *(void *)((char *)v160 + 7) = *(void *)((char *)v141 + 7);
      char v24 = *(unsigned char *)(v9 + 47);
      v10[1] = 0;
      v10[2] = 0;
      *int v10 = 0;
      *(_OWORD *)v153 = *v11;
      long long v25 = *(_OWORD *)v17;
      *(void *)(v9 + 16) = *(void *)(v17 + 16);
      *(_OWORD *)unint64_t v9 = v25;
      *(unsigned char *)(v17 + 23) = 0;
      unint64_t v26 = v9 + (v16 << 6);
      long long v27 = *(_OWORD *)(v26 + 24);
      v10[2] = *(void *)(v26 + 40);
      *(_OWORD *)int v10 = v27;
      *(unsigned char *)(v17 + 47) = 0;
      *(unsigned char *)(v26 + 24) = 0;
      *double v11 = *(_OWORD *)(v26 + 48);
      *(void *)unint64_t v17 = v21;
      uint64_t v28 = v158;
      *(void *)(v17 + 15) = *(void *)((char *)&v158 + 7);
      *(void *)(v17 + 8) = v28;
      *(unsigned char *)(v17 + 23) = v22;
      *(void *)(v26 + 24) = v23;
      uint64_t v29 = v160[0];
      *(void *)(v26 + 39) = *(void *)((char *)v160 + 7);
      *(void *)(v26 + 32) = v29;
      *(unsigned char *)(v17 + 47) = v24;
      *(_OWORD *)(v26 + 48) = *(_OWORD *)v153;
    }
    --a4;
    if ((a5 & 1) == 0 && (((uint64_t (*)(uint64_t *, unint64_t))*a3)(v143, v9) & 1) == 0)
    {
      long long v44 = *(_OWORD *)v9;
      uint64_t v154 = *(void *)(v9 + 16);
      *(_OWORD *)v153 = v44;
      *(void *)(v9 + 8) = 0;
      *(void *)(v9 + 16) = 0;
      *(void *)unint64_t v9 = 0;
      long long v45 = *(_OWORD *)(v9 + 24);
      uint64_t v156 = *(void *)(v9 + 40);
      long long __p = v45;
      *(void *)(v9 + 32) = 0;
      *(void *)(v9 + 40) = 0;
      *(void *)(v9 + 24) = 0;
      long long v157 = *(_OWORD *)(v9 + 48);
      if (((uint64_t (*)(void **, void **))*a3)(v153, v18))
      {
        a1 = (uint64_t *)v9;
        do
          a1 += 8;
        while ((((uint64_t (*)(void **, uint64_t *))*a3)(v153, a1) & 1) == 0);
      }
      else
      {
        long long v46 = (uint64_t *)(v9 + 64);
        do
        {
          a1 = v46;
          if ((unint64_t)v46 >= a2) {
            break;
          }
          int v47 = ((uint64_t (*)(void **, uint64_t *))*a3)(v153, v46);
          long long v46 = a1 + 8;
        }
        while (!v47);
      }
      int v48 = (long long *)a2;
      if ((unint64_t)a1 < a2)
      {
        int v48 = (long long *)a2;
        do
          v48 -= 4;
        while ((((uint64_t (*)(void **, long long *))*a3)(v153, v48) & 1) != 0);
      }
      while (a1 < (uint64_t *)v48)
      {
        __n128 v49 = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<InputTranscoder::CTCSurfaceFormOutput *&,InputTranscoder::CTCSurfaceFormOutput *&>(a1, v48);
        do
          a1 += 8;
        while (!(*a3)((long long *)v153, (long long *)a1, v49));
        do
          v48 -= 4;
        while ((((uint64_t (*)(void **, long long *))*a3)(v153, v48) & 1) != 0);
      }
      double v50 = (void **)(a1 - 8);
      BOOL v5 = (unint64_t)(a1 - 8) >= v9;
      BOOL v6 = a1 - 8 == (uint64_t *)v9;
      if (a1 - 8 != (uint64_t *)v9)
      {
        if (*(char *)(v9 + 23) < 0) {
          operator delete(*(void **)v9);
        }
        std::string::value_type v51 = (void **)(v9 + 24);
        long long v52 = *(_OWORD *)v50;
        *(void *)(v9 + 16) = *(a1 - 6);
        *(_OWORD *)unint64_t v9 = v52;
        *((unsigned char *)a1 - 41) = 0;
        *((unsigned char *)a1 - 64) = 0;
        if (*(char *)(v9 + 47) < 0) {
          operator delete(*v51);
        }
        long long v53 = *(_OWORD *)(a1 - 5);
        *(void *)(v9 + 40) = *(a1 - 3);
        *(_OWORD *)std::string::value_type v51 = v53;
        *((unsigned char *)a1 - 17) = 0;
        *((unsigned char *)a1 - 40) = 0;
        *(_OWORD *)(v9 + 48) = *((_OWORD *)a1 - 1);
      }
      if (*((char *)a1 - 41) < 0) {
        operator delete(*v50);
      }
      long long v54 = *(_OWORD *)v153;
      *(a1 - 6) = v154;
      *(_OWORD *)double v50 = v54;
      HIBYTE(v154) = 0;
      LOBYTE(v153[0]) = 0;
      double v55 = (void **)(a1 - 5);
      if (*((char *)a1 - 17) < 0) {
        operator delete(*v55);
      }
      long long v56 = __p;
      *(a1 - 3) = v156;
      *(_OWORD *)double v55 = v56;
      HIBYTE(v156) = 0;
      LOBYTE(__p) = 0;
      *((_OWORD *)a1 - 1) = v157;
      if (SHIBYTE(v156) < 0) {
        operator delete((void *)__p);
      }
      if (SHIBYTE(v154) < 0) {
        operator delete(v153[0]);
      }
      goto LABEL_75;
    }
    uint64_t v30 = 0;
    long long v31 = *(_OWORD *)v9;
    uint64_t v154 = *(void *)(v9 + 16);
    *(_OWORD *)v153 = v31;
    *(void *)(v9 + 8) = 0;
    *(void *)(v9 + 16) = 0;
    *(void *)unint64_t v9 = 0;
    long long v32 = *(_OWORD *)v10;
    uint64_t v156 = v10[2];
    long long __p = v32;
    v10[1] = 0;
    v10[2] = 0;
    *int v10 = 0;
    long long v157 = *v11;
    do
    {
      char v33 = ((uint64_t (*)(unint64_t, void **))*a3)(v9 + v30 + 64, v153);
      v30 += 64;
    }
    while ((v33 & 1) != 0);
    unint64_t v34 = v9 + v30;
    unint64_t v35 = (long long *)a2;
    if (v30 == 64)
    {
      unint64_t v35 = (long long *)a2;
      do
      {
        if (v34 >= (unint64_t)v35) {
          break;
        }
        v35 -= 4;
      }
      while ((((uint64_t (*)(long long *, void **))*a3)(v35, v153) & 1) == 0);
    }
    else
    {
      do
        v35 -= 4;
      while (!((unsigned int (*)(long long *, void **))*a3)(v35, v153));
    }
    a1 = (uint64_t *)(v9 + v30);
    if (v34 < (unint64_t)v35)
    {
      unint64_t v36 = v35;
      do
      {
        __n128 v37 = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<InputTranscoder::CTCSurfaceFormOutput *&,InputTranscoder::CTCSurfaceFormOutput *&>(a1, v36);
        do
          a1 += 8;
        while ((((uint64_t (*)(uint64_t *, void **, __n128))*a3)(a1, v153, v37) & 1) != 0);
        do
          v36 -= 4;
        while (!((unsigned int (*)(long long *, void **))*a3)(v36, v153));
      }
      while (a1 < (uint64_t *)v36);
    }
    BOOL v12 = (void **)(a1 - 8);
    if (a1 - 8 != (uint64_t *)v9)
    {
      if (*(char *)(v9 + 23) < 0) {
        operator delete(*(void **)v9);
      }
      long long v38 = *(_OWORD *)v12;
      *(void *)(v9 + 16) = *(a1 - 6);
      *(_OWORD *)unint64_t v9 = v38;
      *((unsigned char *)a1 - 41) = 0;
      *((unsigned char *)a1 - 64) = 0;
      if (*(char *)(v9 + 47) < 0) {
        operator delete((void *)*v10);
      }
      long long v39 = *(_OWORD *)(a1 - 5);
      v10[2] = *(a1 - 3);
      *(_OWORD *)int v10 = v39;
      *((unsigned char *)a1 - 17) = 0;
      *((unsigned char *)a1 - 40) = 0;
      *double v11 = *((_OWORD *)a1 - 1);
    }
    if (*((char *)a1 - 41) < 0) {
      operator delete(*v12);
    }
    long long v40 = *(_OWORD *)v153;
    *(a1 - 6) = v154;
    *(_OWORD *)BOOL v12 = v40;
    HIBYTE(v154) = 0;
    LOBYTE(v153[0]) = 0;
    unint64_t v41 = (void **)(a1 - 5);
    if (*((char *)a1 - 17) < 0) {
      operator delete(*v41);
    }
    long long v42 = __p;
    *(a1 - 3) = v156;
    *(_OWORD *)unint64_t v41 = v42;
    HIBYTE(v156) = 0;
    LOBYTE(__p) = 0;
    *((_OWORD *)a1 - 1) = v157;
    if (SHIBYTE(v156) < 0) {
      operator delete((void *)__p);
    }
    if (SHIBYTE(v154) < 0) {
      operator delete(v153[0]);
    }
    if (v34 < (unint64_t)v35) {
      goto LABEL_45;
    }
    BOOL v43 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(InputTranscoder::CTCSurfaceFormOutput const&,InputTranscoder::CTCSurfaceFormOutput const&),InputTranscoder::CTCSurfaceFormOutput*>(v9, (uint64_t)(a1 - 8), a3);
    if (!std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(InputTranscoder::CTCSurfaceFormOutput const&,InputTranscoder::CTCSurfaceFormOutput const&),InputTranscoder::CTCSurfaceFormOutput*>((uint64_t)a1, a2, a3))
    {
      if (v43) {
        goto LABEL_2;
      }
LABEL_45:
      std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(InputTranscoder::CTCSurfaceFormOutput const&,InputTranscoder::CTCSurfaceFormOutput const&),InputTranscoder::CTCSurfaceFormOutput*,false>(v9, a1 - 8, a3, a4, a5 & 1);
LABEL_75:
      a5 = 0;
      goto LABEL_2;
    }
    if (v43) {
      return;
    }
  }
  if (a5)
  {
    if ((void **)v9 != v12)
    {
      unint64_t v57 = v9 + 64;
      if ((void **)(v9 + 64) != v12)
      {
        uint64_t v58 = 0;
        unint64_t v59 = v9;
        do
        {
          unint64_t v60 = v57;
          if (((unsigned int (*)(unint64_t, unint64_t))*a3)(v57, v59))
          {
            long long v61 = *(_OWORD *)v60;
            uint64_t v154 = *(void *)(v60 + 16);
            *(_OWORD *)v153 = v61;
            *(void *)(v60 + 8) = 0;
            *(void *)(v60 + 16) = 0;
            *(void *)unint64_t v60 = 0;
            long long __p = *(_OWORD *)(v59 + 88);
            uint64_t v156 = *(void *)(v59 + 104);
            *(void *)(v59 + 96) = 0;
            *(void *)(v59 + 104) = 0;
            *(void *)(v59 + 88) = 0;
            long long v157 = *(_OWORD *)(v59 + 112);
            uint64_t v62 = v58;
            while (1)
            {
              uint64_t v63 = v9 + v62;
              uint64_t v64 = (void **)(v9 + v62 + 64);
              if (*(char *)(v9 + v62 + 87) < 0) {
                operator delete(*v64);
              }
              *(_OWORD *)uint64_t v64 = *(_OWORD *)v63;
              *(void *)(v9 + v62 + 80) = *(void *)(v63 + 16);
              *(unsigned char *)(v63 + 23) = 0;
              *(unsigned char *)uint64_t v63 = 0;
              uint64_t v65 = v63 + 88;
              if (*(char *)(v63 + 111) < 0) {
                operator delete(*(void **)v65);
              }
              uint64_t v66 = v9 + v62;
              *(_OWORD *)uint64_t v65 = *(_OWORD *)(v9 + v62 + 24);
              *(void *)(v65 + 16) = *(void *)(v9 + v62 + 40);
              *(unsigned char *)(v66 + 47) = 0;
              *(unsigned char *)(v66 + 24) = 0;
              *(_OWORD *)(v66 + 112) = *(_OWORD *)(v9 + v62 + 48);
              if (!v62) {
                break;
              }
              v62 -= 64;
              if ((((uint64_t (*)(void **, uint64_t))*a3)(v153, v66 - 64) & 1) == 0)
              {
                uint64_t v67 = v9 + v62 + 64;
                goto LABEL_96;
              }
            }
            uint64_t v67 = v9;
LABEL_96:
            if (*(char *)(v67 + 23) < 0) {
              operator delete(*(void **)v67);
            }
            char v68 = 0;
            long long v69 = (void **)(v66 + 24);
            long long v70 = *(_OWORD *)v153;
            *(void *)(v67 + 16) = v154;
            *(_OWORD *)uint64_t v67 = v70;
            HIBYTE(v154) = 0;
            LOBYTE(v153[0]) = 0;
            if (*(char *)(v67 + 47) < 0)
            {
              operator delete(*v69);
              char v68 = HIBYTE(v154);
            }
            long long v71 = __p;
            *(void *)(v66 + 40) = v156;
            *(_OWORD *)long long v69 = v71;
            HIBYTE(v156) = 0;
            LOBYTE(__p) = 0;
            *(_OWORD *)(v66 + 48) = v157;
            if (v68 < 0) {
              operator delete(v153[0]);
            }
          }
          unint64_t v57 = v60 + 64;
          v58 += 64;
          unint64_t v59 = v60;
        }
        while (v60 + 64 != a2);
      }
    }
  }
  else if ((void **)v9 != v12)
  {
    unint64_t v128 = v9 + 64;
    if ((void **)(v9 + 64) != v12)
    {
      v129 = (_OWORD *)(v9 + 112);
      do
      {
        unint64_t v130 = v128;
        if (((unsigned int (*)(unint64_t, unint64_t))*a3)(v128, v9))
        {
          long long v131 = *(_OWORD *)v130;
          uint64_t v154 = *(void *)(v130 + 16);
          *(_OWORD *)v153 = v131;
          *(void *)(v130 + 8) = 0;
          *(void *)(v130 + 16) = 0;
          *(void *)unint64_t v130 = 0;
          long long __p = *(_OWORD *)(v9 + 88);
          uint64_t v156 = *(void *)(v9 + 104);
          *(void *)(v9 + 96) = 0;
          *(void *)(v9 + 104) = 0;
          *(void *)(v9 + 88) = 0;
          long long v157 = *(_OWORD *)(v9 + 112);
          v132 = v129;
          do
          {
            v133 = (void **)(v132 - 3);
            if (*((char *)v132 - 25) < 0) {
              operator delete(*v133);
            }
            *(_OWORD *)v133 = *(v132 - 7);
            *((void *)v132 - 4) = *((void *)v132 - 12);
            *((unsigned char *)v132 - 89) = 0;
            *((unsigned char *)v132 - 112) = 0;
            v134 = (void **)v132 - 3;
            if (*((char *)v132 - 1) < 0) {
              operator delete(*v134);
            }
            *(_OWORD *)v134 = *(_OWORD *)((char *)v132 - 88);
            *((void *)v132 - 1) = *((void *)v132 - 9);
            *((unsigned char *)v132 - 65) = 0;
            *((unsigned char *)v132 - 88) = 0;
            _OWORD *v132 = *(v132 - 4);
            char v135 = ((uint64_t (*)(void **, _OWORD *))*a3)(v153, v132 - 11);
            v132 -= 4;
          }
          while ((v135 & 1) != 0);
          v136 = (void **)(v132 - 3);
          if (*((char *)v132 - 25) < 0) {
            operator delete(*v136);
          }
          char v137 = 0;
          v138 = (void **)v132 - 3;
          long long v139 = *(_OWORD *)v153;
          *((void *)v132 - 4) = v154;
          *(_OWORD *)v136 = v139;
          HIBYTE(v154) = 0;
          LOBYTE(v153[0]) = 0;
          if (*((char *)v132 - 1) < 0)
          {
            operator delete(*v138);
            char v137 = HIBYTE(v154);
          }
          long long v140 = __p;
          *((void *)v132 - 1) = v156;
          *(_OWORD *)v138 = v140;
          HIBYTE(v156) = 0;
          LOBYTE(__p) = 0;
          _OWORD *v132 = v157;
          if (v137 < 0) {
            operator delete(v153[0]);
          }
        }
        unint64_t v128 = v130 + 64;
        v129 += 4;
        unint64_t v9 = v130;
      }
      while ((void **)(v130 + 64) != v12);
    }
  }
}

void sub_2369EB154(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, int a16, int a17, int a18, uint64_t a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,void *__p,uint64_t a27,int a28,__int16 a29,char a30,char a31)
{
}

__n128 std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<InputTranscoder::CTCSurfaceFormOutput *&,InputTranscoder::CTCSurfaceFormOutput *&>(uint64_t *a1, long long *a2)
{
  uint64_t v3 = *a1;
  *(void *)uint64_t v14 = a1[1];
  *(void *)&v14[7] = *(uint64_t *)((char *)a1 + 15);
  char v4 = *((unsigned char *)a1 + 23);
  a1[1] = 0;
  a1[2] = 0;
  *a1 = 0;
  BOOL v6 = a1 + 3;
  uint64_t v5 = a1[3];
  *(void *)uint64_t v13 = a1[4];
  *(void *)&v13[7] = *(uint64_t *)((char *)a1 + 39);
  char v7 = *((unsigned char *)a1 + 47);
  a1[4] = 0;
  a1[5] = 0;
  a1[3] = 0;
  uint64_t v8 = a1 + 6;
  __n128 v12 = *((__n128 *)a1 + 3);
  long long v9 = *a2;
  a1[2] = *((void *)a2 + 2);
  *(_OWORD *)a1 = v9;
  *((unsigned char *)a2 + 23) = 0;
  *(unsigned char *)a2 = 0;
  if (*((char *)a1 + 47) < 0) {
    operator delete((void *)*v6);
  }
  long long v10 = *(long long *)((char *)a2 + 24);
  v6[2] = *((void *)a2 + 5);
  *(_OWORD *)BOOL v6 = v10;
  *((unsigned char *)a2 + 47) = 0;
  *((unsigned char *)a2 + 24) = 0;
  *uint64_t v8 = a2[3];
  if (*((char *)a2 + 23) < 0) {
    operator delete(*(void **)a2);
  }
  *(void *)a2 = v3;
  *((void *)a2 + 1) = *(void *)v14;
  *(void *)((char *)a2 + 15) = *(void *)&v14[7];
  *((unsigned char *)a2 + 23) = v4;
  if (*((char *)a2 + 47) < 0) {
    operator delete(*((void **)a2 + 3));
  }
  *((void *)a2 + 3) = v5;
  *((void *)a2 + 4) = *(void *)v13;
  *(void *)((char *)a2 + 39) = *(void *)&v13[7];
  *((unsigned char *)a2 + 47) = v7;
  __n128 result = v12;
  a2[3] = (__int128)v12;
  return result;
}

double std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(InputTranscoder::CTCSurfaceFormOutput const&,InputTranscoder::CTCSurfaceFormOutput const&),InputTranscoder::CTCSurfaceFormOutput*>(uint64_t *a1, long long *a2, long long *a3, unsigned int (**a4)(long long *, long long *, __n128))
{
  char v8 = ((uint64_t (*)(long long *, uint64_t *))*a4)(a2, a1);
  int v9 = ((uint64_t (*)(long long *, long long *))*a4)(a3, a2);
  if (v8)
  {
    if (v9)
    {
      double v11 = a1;
    }
    else
    {
      __n128 v14 = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<InputTranscoder::CTCSurfaceFormOutput *&,InputTranscoder::CTCSurfaceFormOutput *&>(a1, a2);
      if (!(*a4)(a3, a2, v14)) {
        return result;
      }
      double v11 = (uint64_t *)a2;
    }
    uint64_t v13 = a3;
  }
  else
  {
    if (!v9) {
      return result;
    }
    __n128 v12 = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<InputTranscoder::CTCSurfaceFormOutput *&,InputTranscoder::CTCSurfaceFormOutput *&>((uint64_t *)a2, a3);
    if (!(*a4)(a2, (long long *)a1, v12)) {
      return result;
    }
    double v11 = a1;
    uint64_t v13 = a2;
  }

  *(void *)&double result = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<InputTranscoder::CTCSurfaceFormOutput *&,InputTranscoder::CTCSurfaceFormOutput *&>(v11, v13).n128_u64[0];
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(InputTranscoder::CTCSurfaceFormOutput const&,InputTranscoder::CTCSurfaceFormOutput const&),InputTranscoder::CTCSurfaceFormOutput*>(uint64_t a1, uint64_t a2, unsigned int (**a3)(long long *, long long *, __n128))
{
  uint64_t v6 = (a2 - a1) >> 6;
  BOOL result = 1;
  switch(v6)
  {
    case 0:
    case 1:
      return result;
    case 2:
      if (((unsigned int (*)(uint64_t, uint64_t))*a3)(a2 - 64, a1)) {
        std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<InputTranscoder::CTCSurfaceFormOutput *&,InputTranscoder::CTCSurfaceFormOutput *&>((uint64_t *)a1, (long long *)(a2 - 64));
      }
      return 1;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(InputTranscoder::CTCSurfaceFormOutput const&,InputTranscoder::CTCSurfaceFormOutput const&),InputTranscoder::CTCSurfaceFormOutput*>((uint64_t *)a1, (long long *)(a1 + 64), (long long *)(a2 - 64), a3);
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(InputTranscoder::CTCSurfaceFormOutput const&,InputTranscoder::CTCSurfaceFormOutput const&),InputTranscoder::CTCSurfaceFormOutput*>((uint64_t *)a1, (long long *)(a1 + 64), (long long *)(a1 + 128), (long long *)(a2 - 64), a3);
      return 1;
    case 5:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(InputTranscoder::CTCSurfaceFormOutput const&,InputTranscoder::CTCSurfaceFormOutput const&),InputTranscoder::CTCSurfaceFormOutput*>((uint64_t *)a1, (long long *)(a1 + 64), (long long *)(a1 + 128), (long long *)(a1 + 192), (long long *)(a2 - 64), a3);
      return 1;
    default:
      char v8 = (long long *)(a1 + 128);
      v9.n128_f64[0] = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(InputTranscoder::CTCSurfaceFormOutput const&,InputTranscoder::CTCSurfaceFormOutput const&),InputTranscoder::CTCSurfaceFormOutput*>((uint64_t *)a1, (long long *)(a1 + 64), (long long *)(a1 + 128), a3);
      uint64_t v10 = a1 + 192;
      if (a1 + 192 == a2) {
        return 1;
      }
      uint64_t v11 = 0;
      int v12 = 0;
      break;
  }
  while (1)
  {
    if ((*a3)((long long *)v10, v8, v9))
    {
      *(_OWORD *)long long __p = *(_OWORD *)v10;
      uint64_t v23 = *(void *)(v10 + 16);
      *(void *)uint64_t v10 = 0;
      *(void *)(v10 + 8) = 0;
      long long v13 = *(_OWORD *)(v10 + 24);
      *(void *)(v10 + 16) = 0;
      *(void *)(v10 + 24) = 0;
      long long v24 = v13;
      uint64_t v25 = *(void *)(v10 + 40);
      *(void *)(v10 + 32) = 0;
      *(void *)(v10 + 40) = 0;
      uint64_t v14 = v11;
      __n128 v26 = *(__n128 *)(v10 + 48);
      while (1)
      {
        uint64_t v15 = a1 + v14;
        unint64_t v16 = (void **)(a1 + v14 + 192);
        if (*(char *)(a1 + v14 + 215) < 0) {
          operator delete(*v16);
        }
        *(_OWORD *)unint64_t v16 = *(_OWORD *)(v15 + 128);
        *(void *)(a1 + v14 + 208) = *(void *)(v15 + 144);
        *(unsigned char *)(v15 + 151) = 0;
        *(unsigned char *)(v15 + 128) = 0;
        uint64_t v17 = v15 + 216;
        if (*(char *)(v15 + 239) < 0) {
          operator delete(*(void **)v17);
        }
        uint64_t v18 = a1 + v14;
        *(_OWORD *)uint64_t v17 = *(_OWORD *)(a1 + v14 + 152);
        *(void *)(v17 + 16) = *(void *)(a1 + v14 + 168);
        *(unsigned char *)(v18 + 175) = 0;
        *(unsigned char *)(v18 + 152) = 0;
        *(_OWORD *)(v18 + 240) = *(_OWORD *)(a1 + v14 + 176);
        if (v14 == -128) {
          break;
        }
        v14 -= 64;
        if ((((uint64_t (*)(void **, uint64_t))*a3)(__p, v18 + 64) & 1) == 0)
        {
          uint64_t v19 = a1 + v14 + 192;
          goto LABEL_16;
        }
      }
      uint64_t v19 = a1;
LABEL_16:
      if (*(char *)(v19 + 23) < 0) {
        operator delete(*(void **)v19);
      }
      char v20 = 0;
      uint64_t v21 = (void **)(v18 + 152);
      *(_OWORD *)uint64_t v19 = *(_OWORD *)__p;
      *(void *)(v19 + 16) = v23;
      HIBYTE(v23) = 0;
      LOBYTE(__p[0]) = 0;
      if (*(char *)(v19 + 47) < 0)
      {
        operator delete(*v21);
        char v20 = HIBYTE(v23);
      }
      *(_OWORD *)uint64_t v21 = v24;
      *(void *)(v18 + 168) = v25;
      HIBYTE(v25) = 0;
      LOBYTE(v24) = 0;
      __n128 v9 = v26;
      *(__n128 *)(v18 + 176) = v26;
      if (v20 < 0) {
        operator delete(__p[0]);
      }
      if (++v12 == 8) {
        return v10 + 64 == a2;
      }
    }
    char v8 = (long long *)v10;
    v11 += 64;
    v10 += 64;
    if (v10 == a2) {
      return 1;
    }
  }
}

void sub_2369EB720(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  InputTranscoder::CTCConfiguration::~CTCConfiguration((void **)va);
  _Unwind_Resume(a1);
}

double std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(InputTranscoder::CTCSurfaceFormOutput const&,InputTranscoder::CTCSurfaceFormOutput const&),InputTranscoder::CTCSurfaceFormOutput*>(uint64_t *a1, long long *a2, long long *a3, long long *a4, unsigned int (**a5)(long long *, long long *, __n128))
{
  double v10 = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(InputTranscoder::CTCSurfaceFormOutput const&,InputTranscoder::CTCSurfaceFormOutput const&),InputTranscoder::CTCSurfaceFormOutput*>(a1, a2, a3, a5);
  if (((unsigned int (*)(long long *, long long *, double))*a5)(a4, a3, v10))
  {
    __n128 v12 = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<InputTranscoder::CTCSurfaceFormOutput *&,InputTranscoder::CTCSurfaceFormOutput *&>((uint64_t *)a3, a4);
    if ((*a5)(a3, a2, v12))
    {
      __n128 v13 = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<InputTranscoder::CTCSurfaceFormOutput *&,InputTranscoder::CTCSurfaceFormOutput *&>((uint64_t *)a2, a3);
      if ((*a5)(a2, (long long *)a1, v13))
      {
        *(void *)&double result = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<InputTranscoder::CTCSurfaceFormOutput *&,InputTranscoder::CTCSurfaceFormOutput *&>(a1, a2).n128_u64[0];
      }
    }
  }
  return result;
}

double std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(InputTranscoder::CTCSurfaceFormOutput const&,InputTranscoder::CTCSurfaceFormOutput const&),InputTranscoder::CTCSurfaceFormOutput*>(uint64_t *a1, long long *a2, long long *a3, long long *a4, long long *a5, unsigned int (**a6)(long long *, long long *, __n128))
{
  double v12 = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(InputTranscoder::CTCSurfaceFormOutput const&,InputTranscoder::CTCSurfaceFormOutput const&),InputTranscoder::CTCSurfaceFormOutput*>(a1, a2, a3, a4, a6);
  if (((unsigned int (*)(long long *, long long *, double))*a6)(a5, a4, v12))
  {
    __n128 v14 = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<InputTranscoder::CTCSurfaceFormOutput *&,InputTranscoder::CTCSurfaceFormOutput *&>((uint64_t *)a4, a5);
    if ((*a6)(a4, a3, v14))
    {
      __n128 v15 = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<InputTranscoder::CTCSurfaceFormOutput *&,InputTranscoder::CTCSurfaceFormOutput *&>((uint64_t *)a3, a4);
      if ((*a6)(a3, a2, v15))
      {
        __n128 v16 = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<InputTranscoder::CTCSurfaceFormOutput *&,InputTranscoder::CTCSurfaceFormOutput *&>((uint64_t *)a2, a3);
        if ((*a6)(a2, (long long *)a1, v16))
        {
          *(void *)&double result = std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<InputTranscoder::CTCSurfaceFormOutput *&,InputTranscoder::CTCSurfaceFormOutput *&>(a1, a2).n128_u64[0];
        }
      }
    }
  }
  return result;
}

uint64_t std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(void *a1, void **a2)
{
  size_t v2 = *((unsigned __int8 *)a1 + 23);
  size_t v3 = a1[1];
  if ((v2 & 0x80u) != 0)
  {
    a1 = (void *)*a1;
    size_t v2 = v3;
  }
  int v4 = *((char *)a2 + 23);
  if (v4 >= 0) {
    uint64_t v5 = a2;
  }
  else {
    uint64_t v5 = *a2;
  }
  if (v4 >= 0) {
    size_t v6 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v6 = (size_t)a2[1];
  }
  return std::operator<=>[abi:ne180100]<char,std::char_traits<char>>(a1, v2, v5, v6);
}

uint64_t std::operator<=>[abi:ne180100]<char,std::char_traits<char>>(const void *a1, size_t a2, void *__s2, size_t a4)
{
  if (a4 >= a2) {
    size_t v7 = a2;
  }
  else {
    size_t v7 = a4;
  }
  int v8 = memcmp(a1, __s2, v7);
  if (v8)
  {
    if ((v8 & 0x80000000) == 0) {
      return 1;
    }
  }
  else
  {
    if (a2 == a4) {
      return 0;
    }
    if (a2 >= a4) {
      return 1;
    }
  }
  return 255;
}

uint64_t std::string::basic_string[abi:ne180100](uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (a2 > 0x16)
  {
    uint64_t v4 = (a2 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a2 | 7) != 0x17) {
      uint64_t v4 = a2 | 7;
    }
    uint64_t v5 = v4 + 1;
    size_t v6 = operator new(v4 + 1);
    *(void *)(a1 + 8) = a2;
    *(void *)(a1 + 16) = v5 | 0x8000000000000000;
    *(void *)a1 = v6;
  }
  else
  {
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
    *(void *)a1 = 0;
    *(unsigned char *)(a1 + 23) = a2;
  }
  return a1;
}

void *std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    size_t v6 = result;
    double result = std::vector<float>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      double result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_2369EBA80(_Unwind_Exception *exception_object)
{
  size_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__split_buffer<std::unique_ptr<InputTranscoder::CandidateImpl>>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 8;
    uint64_t v4 = *(void *)(i - 8);
    *(void *)(i - 8) = 0;
    if (v4) {
      std::default_delete<InputTranscoder::CandidateImpl>::operator()[abi:ne180100](i - 8, v4);
    }
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::vector<std::unique_ptr<InputTranscoder::CandidateImpl>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  size_t v2 = (uint64_t *)**a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t *)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      size_t v6 = v4 - 1;
      do
      {
        uint64_t v7 = *v6;
        *size_t v6 = 0;
        if (v7) {
          std::default_delete<InputTranscoder::CandidateImpl>::operator()[abi:ne180100]((uint64_t)v6, v7);
        }
      }
      while (v6-- != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::vector<InputTranscoder::CTCSurfaceFormOutput>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  size_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    uint64_t v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 64;
        std::__destroy_at[abi:ne180100]<InputTranscoder::CTCSurfaceFormOutput,0>(v4);
      }
      while ((void *)v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t *std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>>::__swap_out_circular_buffer(uint64_t *result, void *a2)
{
  uint64_t v3 = *result;
  uint64_t v2 = result[1];
  uint64_t v4 = a2[1];
  while (v2 != v3)
  {
    uint64_t v5 = *(void *)(v2 - 72);
    v2 -= 72;
    *(void *)(v4 - 72) = v5;
    v4 -= 72;
    long long v6 = *(_OWORD *)(v2 + 8);
    *(void *)(v4 + 24) = *(void *)(v2 + 24);
    *(_OWORD *)(v4 + 8) = v6;
    *(void *)(v2 + 16) = 0;
    *(void *)(v2 + 24) = 0;
    *(void *)(v2 + 8) = 0;
    long long v7 = *(_OWORD *)(v2 + 32);
    *(void *)(v4 + 48) = *(void *)(v2 + 48);
    *(_OWORD *)(v4 + 32) = v7;
    *(void *)(v2 + 40) = 0;
    *(void *)(v2 + 48) = 0;
    *(void *)(v2 + 32) = 0;
    *(_OWORD *)(v4 + 56) = *(_OWORD *)(v2 + 56);
  }
  a2[1] = v4;
  uint64_t v8 = *result;
  char *result = v4;
  a2[1] = v8;
  uint64_t v9 = result[1];
  result[1] = a2[2];
  a2[2] = v9;
  uint64_t v10 = result[2];
  result[2] = a2[3];
  a2[3] = v10;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>>>(unint64_t a1)
{
  if (a1 >= 0x38E38E38E38E38FLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(72 * a1);
}

uint64_t std::__split_buffer<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 72;
    std::__destroy_at[abi:ne180100]<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>,0>(i - 72);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

std::string *std::construct_at[abi:ne180100]<InputTranscoder::CTCSurfaceFormOutput,InputTranscoder::CTCSurfaceFormOutput const&,InputTranscoder::CTCSurfaceFormOutput*>(std::string *this, long long *a2)
{
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v4 = *a2;
    this->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v4;
  }
  uint64_t v5 = this + 1;
  if (*((char *)a2 + 47) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *((const std::string::value_type **)a2 + 3), *((void *)a2 + 4));
  }
  else
  {
    long long v6 = *(long long *)((char *)a2 + 24);
    this[1].__r_.__value_.__r.__words[2] = *((void *)a2 + 5);
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v6;
  }
  *(_OWORD *)&this[2].__r_.__value_.__l.__data_ = a2[3];
  return this;
}

void sub_2369EBDC4(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<InputTranscoder::KeyCandidateImpl>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<InputTranscoder::KeyCandidateImpl>::__clear[abi:ne180100]((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<InputTranscoder::KeyCandidateImpl>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 32)
  {
    if (*(char *)(i - 9) < 0) {
      operator delete(*(void **)(i - 32));
    }
  }
  a1[1] = v2;
}

__n128 std::vector<InputTranscoder::CTCSurfaceFormOutput>::__insert_with_size[abi:ne180100]<std::__wrap_iter<InputTranscoder::CTCSurfaceFormOutput*>,std::__wrap_iter<InputTranscoder::CTCSurfaceFormOutput*>>(std::string **a1, uint64_t a2, std::string *__str, char *a4, uint64_t a5)
{
  if (a5 < 1) {
    return result;
  }
  long long v6 = __str;
  uint64_t v8 = *a1;
  uint64_t v9 = a2 - (void)*a1;
  uint64_t v10 = v9 >> 6;
  unint64_t v11 = (unint64_t)*a1 + (v9 & 0xFFFFFFFFFFFFFFC0);
  __n128 v14 = a1[2];
  uint64_t v12 = (uint64_t)(a1 + 2);
  __n128 v13 = v14;
  unint64_t v15 = *(void *)(v12 - 8);
  if (a5 <= (uint64_t)((uint64_t)v14 - v15) >> 6)
  {
    uint64_t v20 = (uint64_t)(v15 - v11) >> 6;
    if (v20 >= a5)
    {
      char v22 = (std::string *)((char *)__str + 64 * a5);
      uint64_t v25 = *(std::string **)(v12 - 8);
    }
    else
    {
      char v22 = (std::string *)((char *)__str + 64 * v20);
      if (v22 == (std::string *)a4)
      {
        uint64_t v25 = *(std::string **)(v12 - 8);
      }
      else
      {
        uint64_t v56 = v10;
        uint64_t v23 = 0;
        do
        {
          std::construct_at[abi:ne180100]<InputTranscoder::CTCSurfaceFormOutput,InputTranscoder::CTCSurfaceFormOutput&,InputTranscoder::CTCSurfaceFormOutput*>((std::string *)(v15 + v23), (long long *)((char *)v22 + v23));
          v23 += 64;
        }
        while ((char *)v22 + v23 != a4);
        uint64_t v25 = (std::string *)(v15 + v23);
        uint64_t v10 = v56;
      }
      a1[1] = v25;
      if ((uint64_t)(v15 - v11) < 1) {
        return result;
      }
    }
    unint64_t v40 = v11 + (a5 << 6);
    unint64_t v41 = (long long *)((char *)v25 - 64 * a5);
    long long v42 = v25;
    if ((unint64_t)v41 < v15)
    {
      long long v42 = v25;
      do
      {
        long long v43 = *v41;
        v42->__r_.__value_.__r.__words[2] = *((void *)v41 + 2);
        *(_OWORD *)&v42->__r_.__value_.__l.__data_ = v43;
        *((void *)v41 + 1) = 0;
        *((void *)v41 + 2) = 0;
        *(void *)unint64_t v41 = 0;
        long long v44 = *(long long *)((char *)v41 + 24);
        v42[1].__r_.__value_.__r.__words[2] = *((void *)v41 + 5);
        *(_OWORD *)&v42[1].__r_.__value_.__l.__data_ = v44;
        *((void *)v41 + 4) = 0;
        *((void *)v41 + 5) = 0;
        *((void *)v41 + 3) = 0;
        __n128 result = (__n128)v41[3];
        *(__n128 *)&v42[2].__r_.__value_.__l.__data_ = result;
        long long v42 = (std::string *)((char *)v42 + 64);
        v41 += 4;
      }
      while ((unint64_t)v41 < v15);
    }
    a1[1] = v42;
    if (v25 != (std::string *)v40)
    {
      unint64_t v45 = 0;
      uint64_t v46 = (uint64_t)((uint64_t)v25 - v40) >> 6;
      uint64_t v47 = (uint64_t)v8 + 64 * v10 + 64 * v46;
      uint64_t v48 = -64 * v46;
      do
      {
        uint64_t v49 = (uint64_t)v25 + v45;
        double v50 = (void **)((char *)&v25[-2] + v45 - 16);
        if (*((char *)&v25[-1] + v45 - 17) < 0) {
          operator delete(*v50);
        }
        std::string::value_type v51 = (long long *)(v47 + v45 - 64);
        long long v52 = *v51;
        v25[-2].__r_.__value_.__r.__words[v45 / 8] = *(void *)(v47 + v45 - 48);
        *(_OWORD *)double v50 = v52;
        *(unsigned char *)(v47 + v45 - 41) = 0;
        *(unsigned char *)std::string::value_type v51 = 0;
        long long v53 = (void **)(v49 - 40);
        if (*(char *)(v49 - 17) < 0) {
          operator delete(*v53);
        }
        uint64_t v54 = v47 + v45;
        long long v55 = *(_OWORD *)(v47 + v45 - 40);
        *(void *)(v49 - 24) = *(void *)(v47 + v45 - 24);
        *(_OWORD *)long long v53 = v55;
        *(unsigned char *)(v54 - 17) = 0;
        *(unsigned char *)(v54 - 40) = 0;
        __n128 result = *(__n128 *)(v47 + v45 - 16);
        *(__n128 *)((char *)&v25->__r_.__value_.__l + v45 - 16) = result;
        v45 -= 64;
      }
      while (v48 != v45);
    }
    for (; v6 != v22; v11 += 64)
    {
      std::string::operator=((std::string *)v11, v6);
      std::string::operator=((std::string *)(v11 + 24), v6 + 1);
      __n128 result = *(__n128 *)&v6[2].__r_.__value_.__l.__data_;
      *(__n128 *)(v11 + 48) = result;
      long long v6 = (std::string *)((char *)v6 + 64);
    }
  }
  else
  {
    unint64_t v16 = a5 + ((uint64_t)(v15 - (void)v8) >> 6);
    if (v16 >> 58) {
      std::vector<InputTranscoder::PathTrie *>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v17 = (char *)v13 - (char *)v8;
    if (v17 >> 5 > v16) {
      unint64_t v16 = v17 >> 5;
    }
    if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFC0) {
      unint64_t v18 = 0x3FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v18 = v16;
    }
    uint64_t v61 = v12;
    if (v18) {
      uint64_t v19 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<InputTranscoder::CTCSurfaceFormOutput>>(v12, v18);
    }
    else {
      uint64_t v19 = 0;
    }
    __n128 v26 = (std::string *)((char *)v19 + 64 * v10);
    unint64_t v57 = v19;
    uint64_t v58 = v26;
    unint64_t v59 = (unint64_t)v26;
    unint64_t v60 = (char *)v19 + 64 * v18;
    uint64_t v27 = a5 << 6;
    uint64_t v28 = (char *)v26 + 64 * a5;
    do
    {
      std::construct_at[abi:ne180100]<InputTranscoder::CTCSurfaceFormOutput,InputTranscoder::CTCSurfaceFormOutput&,InputTranscoder::CTCSurfaceFormOutput*>(v26, (long long *)v6);
      __n128 v26 = (std::string *)((char *)v26 + 64);
      long long v6 = (std::string *)((char *)v6 + 64);
      v27 -= 64;
    }
    while (v27);
    uint64_t v29 = v58;
    uint64_t v30 = *a1;
    if (*a1 == (std::string *)v11)
    {
      long long v32 = v58;
    }
    else
    {
      unint64_t v31 = v11;
      do
      {
        long long v32 = (std::string *)((char *)v29 - 64);
        long long v33 = *(_OWORD *)(v31 - 64);
        v29[-2].__r_.__value_.__r.__words[0] = *(void *)(v31 - 48);
        *(_OWORD *)&v29[-3].__r_.__value_.__r.__words[1] = v33;
        *(void *)(v31 - 56) = 0;
        *(void *)(v31 - 48) = 0;
        *(void *)(v31 - 64) = 0;
        long long v34 = *(_OWORD *)(v31 - 40);
        v29[-1].__r_.__value_.__r.__words[0] = *(void *)(v31 - 24);
        *(_OWORD *)&v29[-2].__r_.__value_.__r.__words[1] = v34;
        *(void *)(v31 - 32) = 0;
        *(void *)(v31 - 24) = 0;
        *(void *)(v31 - 40) = 0;
        *(_OWORD *)&v29[-1].__r_.__value_.__r.__words[1] = *(_OWORD *)(v31 - 16);
        v31 -= 64;
        uint64_t v29 = (std::string *)((char *)v29 - 64);
      }
      while ((std::string *)v31 != v30);
    }
    unint64_t v35 = a1[1];
    if (v35 != (std::string *)v11)
    {
      do
      {
        long long v36 = *(_OWORD *)v11;
        *((void *)v28 + 2) = *(void *)(v11 + 16);
        *(_OWORD *)uint64_t v28 = v36;
        *(void *)(v11 + 8) = 0;
        *(void *)(v11 + 16) = 0;
        *(void *)unint64_t v11 = 0;
        long long v37 = *(_OWORD *)(v11 + 24);
        *((void *)v28 + 5) = *(void *)(v11 + 40);
        *(_OWORD *)(v28 + 24) = v37;
        *(void *)(v11 + 32) = 0;
        *(void *)(v11 + 40) = 0;
        *(void *)(v11 + 24) = 0;
        *((_OWORD *)v28 + 3) = *(_OWORD *)(v11 + 48);
        v28 += 64;
        v11 += 64;
      }
      while ((std::string *)v11 != v35);
      unint64_t v11 = (unint64_t)a1[1];
    }
    long long v38 = *a1;
    *a1 = v32;
    a1[1] = (std::string *)v28;
    long long v39 = (char *)a1[2];
    a1[2] = (std::string *)v60;
    unint64_t v59 = v11;
    unint64_t v60 = v39;
    unint64_t v57 = v38;
    uint64_t v58 = v38;
    std::__split_buffer<InputTranscoder::CTCSurfaceFormOutput>::~__split_buffer((uint64_t)&v57);
  }
  return result;
}

std::string *std::construct_at[abi:ne180100]<InputTranscoder::CTCSurfaceFormOutput,InputTranscoder::CTCSurfaceFormOutput&,InputTranscoder::CTCSurfaceFormOutput*>(std::string *this, long long *a2)
{
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v4 = *a2;
    this->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v4;
  }
  uint64_t v5 = this + 1;
  if (*((char *)a2 + 47) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *((const std::string::value_type **)a2 + 3), *((void *)a2 + 4));
  }
  else
  {
    long long v6 = *(long long *)((char *)a2 + 24);
    this[1].__r_.__value_.__r.__words[2] = *((void *)a2 + 5);
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v6;
  }
  *(_OWORD *)&this[2].__r_.__value_.__l.__data_ = a2[3];
  return this;
}

void sub_2369EC2DC(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__function::__func<InputTranscoder::TouchTranscoderSessionImpl::addCandidateErrorType(std::vector<InputTranscoder::CTCSurfaceFormOutput> &)::$_0,std::allocator<InputTranscoder::TouchTranscoderSessionImpl::addCandidateErrorType(std::vector<InputTranscoder::CTCSurfaceFormOutput> &)::$_0>,ITAutocorrectionOperations ()(InputTranscoder::KeyboardLayout &)>::~__func(uint64_t a1)
{
  *(void *)a1 = &unk_26E9DA828;
  if (*(char *)(a1 + 55) < 0) {
    operator delete(*(void **)(a1 + 32));
  }
  if (*(char *)(a1 + 31) < 0) {
    operator delete(*(void **)(a1 + 8));
  }
  return a1;
}

void std::__function::__func<InputTranscoder::TouchTranscoderSessionImpl::addCandidateErrorType(std::vector<InputTranscoder::CTCSurfaceFormOutput> &)::$_0,std::allocator<InputTranscoder::TouchTranscoderSessionImpl::addCandidateErrorType(std::vector<InputTranscoder::CTCSurfaceFormOutput> &)::$_0>,ITAutocorrectionOperations ()(InputTranscoder::KeyboardLayout &)>::~__func(uint64_t a1)
{
  *(void *)a1 = &unk_26E9DA828;
  if (*(char *)(a1 + 55) < 0) {
    operator delete(*(void **)(a1 + 32));
  }
  if (*(char *)(a1 + 31) < 0) {
    operator delete(*(void **)(a1 + 8));
  }

  JUMPOUT(0x237E08BB0);
}

char *std::__function::__func<InputTranscoder::TouchTranscoderSessionImpl::addCandidateErrorType(std::vector<InputTranscoder::CTCSurfaceFormOutput> &)::$_0,std::allocator<InputTranscoder::TouchTranscoderSessionImpl::addCandidateErrorType(std::vector<InputTranscoder::CTCSurfaceFormOutput> &)::$_0>,ITAutocorrectionOperations ()(InputTranscoder::KeyboardLayout &)>::__clone(uint64_t a1)
{
  uint64_t v1 = (long long *)(a1 + 8);
  uint64_t v2 = (char *)operator new(0x38uLL);
  *(void *)uint64_t v2 = &unk_26E9DA828;
  std::__compressed_pair_elem<InputTranscoder::TouchTranscoderSessionImpl::addCandidateErrorType(std::vector<InputTranscoder::CTCSurfaceFormOutput> &)::$_0,0,false>::__compressed_pair_elem[abi:ne180100]<InputTranscoder::TouchTranscoderSessionImpl::addCandidateErrorType(std::vector<InputTranscoder::CTCSurfaceFormOutput> &)::$_0 const&,0ul>((std::string *)(v2 + 8), v1);
  return v2;
}

void sub_2369EC42C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

std::string *std::__function::__func<InputTranscoder::TouchTranscoderSessionImpl::addCandidateErrorType(std::vector<InputTranscoder::CTCSurfaceFormOutput> &)::$_0,std::allocator<InputTranscoder::TouchTranscoderSessionImpl::addCandidateErrorType(std::vector<InputTranscoder::CTCSurfaceFormOutput> &)::$_0>,ITAutocorrectionOperations ()(InputTranscoder::KeyboardLayout &)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26E9DA828;
  return std::__compressed_pair_elem<InputTranscoder::TouchTranscoderSessionImpl::addCandidateErrorType(std::vector<InputTranscoder::CTCSurfaceFormOutput> &)::$_0,0,false>::__compressed_pair_elem[abi:ne180100]<InputTranscoder::TouchTranscoderSessionImpl::addCandidateErrorType(std::vector<InputTranscoder::CTCSurfaceFormOutput> &)::$_0 const&,0ul>((std::string *)(a2 + 8), (long long *)(a1 + 8));
}

void std::__function::__func<InputTranscoder::TouchTranscoderSessionImpl::addCandidateErrorType(std::vector<InputTranscoder::CTCSurfaceFormOutput> &)::$_0,std::allocator<InputTranscoder::TouchTranscoderSessionImpl::addCandidateErrorType(std::vector<InputTranscoder::CTCSurfaceFormOutput> &)::$_0>,ITAutocorrectionOperations ()(InputTranscoder::KeyboardLayout &)>::destroy(uint64_t a1)
{
}

void std::__function::__func<InputTranscoder::TouchTranscoderSessionImpl::addCandidateErrorType(std::vector<InputTranscoder::CTCSurfaceFormOutput> &)::$_0,std::allocator<InputTranscoder::TouchTranscoderSessionImpl::addCandidateErrorType(std::vector<InputTranscoder::CTCSurfaceFormOutput> &)::$_0>,ITAutocorrectionOperations ()(InputTranscoder::KeyboardLayout &)>::destroy_deallocate(void *a1)
{
  std::__destroy_at[abi:ne180100]<InputTranscoder::CTCSurfaceFormOutput,0>((uint64_t)a1 + 8);

  operator delete(a1);
}

uint64_t std::__function::__func<InputTranscoder::TouchTranscoderSessionImpl::addCandidateErrorType(std::vector<InputTranscoder::CTCSurfaceFormOutput> &)::$_0,std::allocator<InputTranscoder::TouchTranscoderSessionImpl::addCandidateErrorType(std::vector<InputTranscoder::CTCSurfaceFormOutput> &)::$_0>,ITAutocorrectionOperations ()(InputTranscoder::KeyboardLayout &)>::operator()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)a2 + 56))(a2, a1 + 8, a1 + 32);
}

uint64_t std::__function::__func<InputTranscoder::TouchTranscoderSessionImpl::addCandidateErrorType(std::vector<InputTranscoder::CTCSurfaceFormOutput> &)::$_0,std::allocator<InputTranscoder::TouchTranscoderSessionImpl::addCandidateErrorType(std::vector<InputTranscoder::CTCSurfaceFormOutput> &)::$_0>,ITAutocorrectionOperations ()(InputTranscoder::KeyboardLayout &)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<InputTranscoder::TouchTranscoderSessionImpl::addCandidateErrorType(std::vector<InputTranscoder::CTCSurfaceFormOutput> &)::$_0,std::allocator<InputTranscoder::TouchTranscoderSessionImpl::addCandidateErrorType(std::vector<InputTranscoder::CTCSurfaceFormOutput> &)::$_0>,ITAutocorrectionOperations ()(InputTranscoder::KeyboardLayout &)>::target_type()
{
}

std::string *std::__compressed_pair_elem<InputTranscoder::TouchTranscoderSessionImpl::addCandidateErrorType(std::vector<InputTranscoder::CTCSurfaceFormOutput> &)::$_0,0,false>::__compressed_pair_elem[abi:ne180100]<InputTranscoder::TouchTranscoderSessionImpl::addCandidateErrorType(std::vector<InputTranscoder::CTCSurfaceFormOutput> &)::$_0 const&,0ul>(std::string *this, long long *a2)
{
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v4 = *a2;
    this->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v4;
  }
  uint64_t v5 = this + 1;
  if (*((char *)a2 + 47) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *((const std::string::value_type **)a2 + 3), *((void *)a2 + 4));
  }
  else
  {
    long long v6 = *(long long *)((char *)a2 + 24);
    this[1].__r_.__value_.__r.__words[2] = *((void *)a2 + 5);
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v6;
  }
  return this;
}

void sub_2369EC5AC(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void *std::__function::__value_func<ITAutocorrectionOperations ()(InputTranscoder::KeyboardLayout &)>::~__value_func[abi:ne180100](void *a1)
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

void std::__function::__func<std::__bind<CGPoint (&)(CGPoint,InputTranscoder::KeyboardLayout &),CGPoint&,std::placeholders::__ph<1> const&>,std::allocator<std::__bind<CGPoint (&)(CGPoint,InputTranscoder::KeyboardLayout &),CGPoint&,std::placeholders::__ph<1> const&>>,CGPoint ()(InputTranscoder::KeyboardLayout &)>::~__func()
{
}

__n128 std::__function::__func<std::__bind<CGPoint (&)(CGPoint,InputTranscoder::KeyboardLayout &),CGPoint&,std::placeholders::__ph<1> const&>,std::allocator<std::__bind<CGPoint (&)(CGPoint,InputTranscoder::KeyboardLayout &),CGPoint&,std::placeholders::__ph<1> const&>>,CGPoint ()(InputTranscoder::KeyboardLayout &)>::__clone(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x20uLL);
  *(void *)uint64_t v2 = &unk_26E9DA8B8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  *((void *)v2 + 3) = *(void *)(a1 + 24);
  return result;
}

__n128 std::__function::__func<std::__bind<CGPoint (&)(CGPoint,InputTranscoder::KeyboardLayout &),CGPoint&,std::placeholders::__ph<1> const&>,std::allocator<std::__bind<CGPoint (&)(CGPoint,InputTranscoder::KeyboardLayout &),CGPoint&,std::placeholders::__ph<1> const&>>,CGPoint ()(InputTranscoder::KeyboardLayout &)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26E9DA8B8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(void *)(a2 + 24) = *(void *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t std::__function::__func<std::__bind<CGPoint (&)(CGPoint,InputTranscoder::KeyboardLayout &),CGPoint&,std::placeholders::__ph<1> const&>,std::allocator<std::__bind<CGPoint (&)(CGPoint,InputTranscoder::KeyboardLayout &),CGPoint&,std::placeholders::__ph<1> const&>>,CGPoint ()(InputTranscoder::KeyboardLayout &)>::operator()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, double, double))(a1 + 8))(a2, *(double *)(a1 + 16), *(double *)(a1 + 24));
}

uint64_t std::__function::__func<std::__bind<CGPoint (&)(CGPoint,InputTranscoder::KeyboardLayout &),CGPoint&,std::placeholders::__ph<1> const&>,std::allocator<std::__bind<CGPoint (&)(CGPoint,InputTranscoder::KeyboardLayout &),CGPoint&,std::placeholders::__ph<1> const&>>,CGPoint ()(InputTranscoder::KeyboardLayout &)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<std::__bind<CGPoint (&)(CGPoint,InputTranscoder::KeyboardLayout &),CGPoint&,std::placeholders::__ph<1> const&>,std::allocator<std::__bind<CGPoint (&)(CGPoint,InputTranscoder::KeyboardLayout &),CGPoint&,std::placeholders::__ph<1> const&>>,CGPoint ()(InputTranscoder::KeyboardLayout &)>::target_type()
{
}

void *std::__function::__value_func<CGPoint ()(InputTranscoder::KeyboardLayout &)>::~__value_func[abi:ne180100](void *a1)
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

uint64_t std::__function::__func<InputTranscoder::TouchTranscoderSessionImpl::getEditDistancePenalty(std::string const&,std::string const&)::$_0,std::allocator<InputTranscoder::TouchTranscoderSessionImpl::getEditDistancePenalty(std::string const&,std::string const&)::$_0>,double ()(InputTranscoder::KeyboardLayout &)>::~__func(uint64_t a1)
{
  *(void *)a1 = &unk_26E9DA978;
  if (*(char *)(a1 + 55) < 0) {
    operator delete(*(void **)(a1 + 32));
  }
  if (*(char *)(a1 + 31) < 0) {
    operator delete(*(void **)(a1 + 8));
  }
  return a1;
}

void std::__function::__func<InputTranscoder::TouchTranscoderSessionImpl::getEditDistancePenalty(std::string const&,std::string const&)::$_0,std::allocator<InputTranscoder::TouchTranscoderSessionImpl::getEditDistancePenalty(std::string const&,std::string const&)::$_0>,double ()(InputTranscoder::KeyboardLayout &)>::~__func(uint64_t a1)
{
  *(void *)a1 = &unk_26E9DA978;
  if (*(char *)(a1 + 55) < 0) {
    operator delete(*(void **)(a1 + 32));
  }
  if (*(char *)(a1 + 31) < 0) {
    operator delete(*(void **)(a1 + 8));
  }

  JUMPOUT(0x237E08BB0);
}

char *std::__function::__func<InputTranscoder::TouchTranscoderSessionImpl::getEditDistancePenalty(std::string const&,std::string const&)::$_0,std::allocator<InputTranscoder::TouchTranscoderSessionImpl::getEditDistancePenalty(std::string const&,std::string const&)::$_0>,double ()(InputTranscoder::KeyboardLayout &)>::__clone(uint64_t a1)
{
  uint64_t v1 = (long long *)(a1 + 8);
  uint64_t v2 = (char *)operator new(0x38uLL);
  *(void *)uint64_t v2 = &unk_26E9DA978;
  std::__compressed_pair_elem<InputTranscoder::TouchTranscoderSessionImpl::getEditDistancePenalty(std::string const&,std::string const&)::$_0,0,false>::__compressed_pair_elem[abi:ne180100]<InputTranscoder::TouchTranscoderSessionImpl::getEditDistancePenalty(std::string const&,std::string const&)::$_0 const&,0ul>((std::string *)(v2 + 8), v1);
  return v2;
}

void sub_2369EC904(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

std::string *std::__function::__func<InputTranscoder::TouchTranscoderSessionImpl::getEditDistancePenalty(std::string const&,std::string const&)::$_0,std::allocator<InputTranscoder::TouchTranscoderSessionImpl::getEditDistancePenalty(std::string const&,std::string const&)::$_0>,double ()(InputTranscoder::KeyboardLayout &)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26E9DA978;
  return std::__compressed_pair_elem<InputTranscoder::TouchTranscoderSessionImpl::getEditDistancePenalty(std::string const&,std::string const&)::$_0,0,false>::__compressed_pair_elem[abi:ne180100]<InputTranscoder::TouchTranscoderSessionImpl::getEditDistancePenalty(std::string const&,std::string const&)::$_0 const&,0ul>((std::string *)(a2 + 8), (long long *)(a1 + 8));
}

void std::__function::__func<InputTranscoder::TouchTranscoderSessionImpl::getEditDistancePenalty(std::string const&,std::string const&)::$_0,std::allocator<InputTranscoder::TouchTranscoderSessionImpl::getEditDistancePenalty(std::string const&,std::string const&)::$_0>,double ()(InputTranscoder::KeyboardLayout &)>::destroy(uint64_t a1)
{
}

void std::__function::__func<InputTranscoder::TouchTranscoderSessionImpl::getEditDistancePenalty(std::string const&,std::string const&)::$_0,std::allocator<InputTranscoder::TouchTranscoderSessionImpl::getEditDistancePenalty(std::string const&,std::string const&)::$_0>,double ()(InputTranscoder::KeyboardLayout &)>::destroy_deallocate(void *a1)
{
  std::__destroy_at[abi:ne180100]<InputTranscoder::CTCSurfaceFormOutput,0>((uint64_t)a1 + 8);

  operator delete(a1);
}

double std::__function::__func<InputTranscoder::TouchTranscoderSessionImpl::getEditDistancePenalty(std::string const&,std::string const&)::$_0,std::allocator<InputTranscoder::TouchTranscoderSessionImpl::getEditDistancePenalty(std::string const&,std::string const&)::$_0>,double ()(InputTranscoder::KeyboardLayout &)>::operator()(uint64_t a1, uint64_t a2)
{
  InputTranscoder::removeSpace(a1 + 8, &v8);
  InputTranscoder::removeUnwantedCharacters((uint64_t)&v8, &v9);
  InputTranscoder::removeSpace(a1 + 32, &v6);
  InputTranscoder::removeUnwantedCharacters((uint64_t)&v6, &__p);
  double v4 = (*(double (**)(uint64_t, std::string *, std::string *))(*(void *)a2 + 48))(a2, &v9, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v6.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v6.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v9.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v8.__r_.__value_.__l.__data_);
  }
  return v4;
}

void sub_2369ECA64(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  if (a14 < 0) {
    operator delete(a9);
  }
  if (*(char *)(v26 - 33) < 0) {
    operator delete(*(void **)(v26 - 56));
  }
  if (a26 < 0) {
    operator delete(a21);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__function::__func<InputTranscoder::TouchTranscoderSessionImpl::getEditDistancePenalty(std::string const&,std::string const&)::$_0,std::allocator<InputTranscoder::TouchTranscoderSessionImpl::getEditDistancePenalty(std::string const&,std::string const&)::$_0>,double ()(InputTranscoder::KeyboardLayout &)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<InputTranscoder::TouchTranscoderSessionImpl::getEditDistancePenalty(std::string const&,std::string const&)::$_0,std::allocator<InputTranscoder::TouchTranscoderSessionImpl::getEditDistancePenalty(std::string const&,std::string const&)::$_0>,double ()(InputTranscoder::KeyboardLayout &)>::target_type()
{
}

std::string *std::__compressed_pair_elem<InputTranscoder::TouchTranscoderSessionImpl::getEditDistancePenalty(std::string const&,std::string const&)::$_0,0,false>::__compressed_pair_elem[abi:ne180100]<InputTranscoder::TouchTranscoderSessionImpl::getEditDistancePenalty(std::string const&,std::string const&)::$_0 const&,0ul>(std::string *this, long long *a2)
{
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v4 = *a2;
    this->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v4;
  }
  uint64_t v5 = this + 1;
  if (*((char *)a2 + 47) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *((const std::string::value_type **)a2 + 3), *((void *)a2 + 4));
  }
  else
  {
    long long v6 = *(long long *)((char *)a2 + 24);
    this[1].__r_.__value_.__r.__words[2] = *((void *)a2 + 5);
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v6;
  }
  return this;
}

void sub_2369ECB90(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void *std::__function::__value_func<double ()(InputTranscoder::KeyboardLayout &)>::~__value_func[abi:ne180100](void *a1)
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

uint64_t std::__function::__func<InputTranscoder::TouchTranscoderSessionImpl::updateCondenseFormForCandidates(std::vector<InputTranscoder::CTCSurfaceFormOutput> &,ITTypingMode)::$_0,std::allocator<InputTranscoder::TouchTranscoderSessionImpl::updateCondenseFormForCandidates(std::vector<InputTranscoder::CTCSurfaceFormOutput> &,ITTypingMode)::$_0>,std::string ()(InputTranscoder::KeyboardLayout &)>::~__func(uint64_t a1)
{
  *(void *)a1 = &unk_26E9DAA08;
  if (*(char *)(a1 + 95) < 0) {
    operator delete(*(void **)(a1 + 72));
  }
  if (*(char *)(a1 + 55) < 0) {
    operator delete(*(void **)(a1 + 32));
  }
  if (*(char *)(a1 + 31) < 0) {
    operator delete(*(void **)(a1 + 8));
  }
  return a1;
}

void std::__function::__func<InputTranscoder::TouchTranscoderSessionImpl::updateCondenseFormForCandidates(std::vector<InputTranscoder::CTCSurfaceFormOutput> &,ITTypingMode)::$_0,std::allocator<InputTranscoder::TouchTranscoderSessionImpl::updateCondenseFormForCandidates(std::vector<InputTranscoder::CTCSurfaceFormOutput> &,ITTypingMode)::$_0>,std::string ()(InputTranscoder::KeyboardLayout &)>::~__func(uint64_t a1)
{
  *(void *)a1 = &unk_26E9DAA08;
  if (*(char *)(a1 + 95) < 0) {
    operator delete(*(void **)(a1 + 72));
  }
  if (*(char *)(a1 + 55) < 0) {
    operator delete(*(void **)(a1 + 32));
  }
  if (*(char *)(a1 + 31) < 0) {
    operator delete(*(void **)(a1 + 8));
  }

  JUMPOUT(0x237E08BB0);
}

char *std::__function::__func<InputTranscoder::TouchTranscoderSessionImpl::updateCondenseFormForCandidates(std::vector<InputTranscoder::CTCSurfaceFormOutput> &,ITTypingMode)::$_0,std::allocator<InputTranscoder::TouchTranscoderSessionImpl::updateCondenseFormForCandidates(std::vector<InputTranscoder::CTCSurfaceFormOutput> &,ITTypingMode)::$_0>,std::string ()(InputTranscoder::KeyboardLayout &)>::__clone(uint64_t a1)
{
  uint64_t v1 = (long long *)(a1 + 8);
  uint64_t v2 = (char *)operator new(0x60uLL);
  *(void *)uint64_t v2 = &unk_26E9DAA08;
  std::__compressed_pair_elem<InputTranscoder::TouchTranscoderSessionImpl::updateCondenseFormForCandidates(std::vector<InputTranscoder::CTCSurfaceFormOutput> &,ITTypingMode)::$_0,0,false>::__compressed_pair_elem[abi:ne180100]<InputTranscoder::TouchTranscoderSessionImpl::updateCondenseFormForCandidates(std::vector<InputTranscoder::CTCSurfaceFormOutput> &,ITTypingMode)::$_0 const&,0ul>((std::string *)(v2 + 8), v1);
  return v2;
}

void sub_2369ECD84(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

std::string *std::__function::__func<InputTranscoder::TouchTranscoderSessionImpl::updateCondenseFormForCandidates(std::vector<InputTranscoder::CTCSurfaceFormOutput> &,ITTypingMode)::$_0,std::allocator<InputTranscoder::TouchTranscoderSessionImpl::updateCondenseFormForCandidates(std::vector<InputTranscoder::CTCSurfaceFormOutput> &,ITTypingMode)::$_0>,std::string ()(InputTranscoder::KeyboardLayout &)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26E9DAA08;
  return std::__compressed_pair_elem<InputTranscoder::TouchTranscoderSessionImpl::updateCondenseFormForCandidates(std::vector<InputTranscoder::CTCSurfaceFormOutput> &,ITTypingMode)::$_0,0,false>::__compressed_pair_elem[abi:ne180100]<InputTranscoder::TouchTranscoderSessionImpl::updateCondenseFormForCandidates(std::vector<InputTranscoder::CTCSurfaceFormOutput> &,ITTypingMode)::$_0 const&,0ul>((std::string *)(a2 + 8), (long long *)(a1 + 8));
}

void std::__function::__func<InputTranscoder::TouchTranscoderSessionImpl::updateCondenseFormForCandidates(std::vector<InputTranscoder::CTCSurfaceFormOutput> &,ITTypingMode)::$_0,std::allocator<InputTranscoder::TouchTranscoderSessionImpl::updateCondenseFormForCandidates(std::vector<InputTranscoder::CTCSurfaceFormOutput> &,ITTypingMode)::$_0>,std::string ()(InputTranscoder::KeyboardLayout &)>::destroy(uint64_t a1)
{
}

void std::__function::__func<InputTranscoder::TouchTranscoderSessionImpl::updateCondenseFormForCandidates(std::vector<InputTranscoder::CTCSurfaceFormOutput> &,ITTypingMode)::$_0,std::allocator<InputTranscoder::TouchTranscoderSessionImpl::updateCondenseFormForCandidates(std::vector<InputTranscoder::CTCSurfaceFormOutput> &,ITTypingMode)::$_0>,std::string ()(InputTranscoder::KeyboardLayout &)>::destroy_deallocate(void *a1)
{
  std::__function::__alloc_func<InputTranscoder::TouchTranscoderSessionImpl::updateCondenseFormForCandidates(std::vector<InputTranscoder::CTCSurfaceFormOutput> &,ITTypingMode)::$_0,std::allocator<InputTranscoder::TouchTranscoderSessionImpl::updateCondenseFormForCandidates(std::vector<InputTranscoder::CTCSurfaceFormOutput> &,ITTypingMode)::$_0>,std::string ()(InputTranscoder::KeyboardLayout &)>::destroy[abi:ne180100]((uint64_t)a1 + 8);

  operator delete(a1);
}

uint64_t std::__function::__func<InputTranscoder::TouchTranscoderSessionImpl::updateCondenseFormForCandidates(std::vector<InputTranscoder::CTCSurfaceFormOutput> &,ITTypingMode)::$_0,std::allocator<InputTranscoder::TouchTranscoderSessionImpl::updateCondenseFormForCandidates(std::vector<InputTranscoder::CTCSurfaceFormOutput> &,ITTypingMode)::$_0>,std::string ()(InputTranscoder::KeyboardLayout &)>::operator()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a2 + 40))(a2, a1 + 72);
}

uint64_t std::__function::__func<InputTranscoder::TouchTranscoderSessionImpl::updateCondenseFormForCandidates(std::vector<InputTranscoder::CTCSurfaceFormOutput> &,ITTypingMode)::$_0,std::allocator<InputTranscoder::TouchTranscoderSessionImpl::updateCondenseFormForCandidates(std::vector<InputTranscoder::CTCSurfaceFormOutput> &,ITTypingMode)::$_0>,std::string ()(InputTranscoder::KeyboardLayout &)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<InputTranscoder::TouchTranscoderSessionImpl::updateCondenseFormForCandidates(std::vector<InputTranscoder::CTCSurfaceFormOutput> &,ITTypingMode)::$_0,std::allocator<InputTranscoder::TouchTranscoderSessionImpl::updateCondenseFormForCandidates(std::vector<InputTranscoder::CTCSurfaceFormOutput> &,ITTypingMode)::$_0>,std::string ()(InputTranscoder::KeyboardLayout &)>::target_type()
{
}

std::string *std::__compressed_pair_elem<InputTranscoder::TouchTranscoderSessionImpl::updateCondenseFormForCandidates(std::vector<InputTranscoder::CTCSurfaceFormOutput> &,ITTypingMode)::$_0,0,false>::__compressed_pair_elem[abi:ne180100]<InputTranscoder::TouchTranscoderSessionImpl::updateCondenseFormForCandidates(std::vector<InputTranscoder::CTCSurfaceFormOutput> &,ITTypingMode)::$_0 const&,0ul>(std::string *this, long long *a2)
{
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v4 = *a2;
    this->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v4;
  }
  if (*((char *)a2 + 47) < 0)
  {
    std::string::__init_copy_ctor_external(this + 1, *((const std::string::value_type **)a2 + 3), *((void *)a2 + 4));
  }
  else
  {
    long long v5 = *(long long *)((char *)a2 + 24);
    this[1].__r_.__value_.__r.__words[2] = *((void *)a2 + 5);
    *(_OWORD *)&this[1].__r_.__value_.__l.__data_ = v5;
  }
  *(_OWORD *)&this[2].__r_.__value_.__l.__data_ = a2[3];
  long long v6 = (std::string *)((char *)this + 64);
  if (*((char *)a2 + 87) < 0)
  {
    std::string::__init_copy_ctor_external(v6, *((const std::string::value_type **)a2 + 8), *((void *)a2 + 9));
  }
  else
  {
    long long v7 = a2[4];
    this[3].__r_.__value_.__l.__size_ = *((void *)a2 + 10);
    *(_OWORD *)&v6->__r_.__value_.__l.__data_ = v7;
  }
  return this;
}

void sub_2369ECF40(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 47) < 0) {
    operator delete(*v2);
  }
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void std::__function::__alloc_func<InputTranscoder::TouchTranscoderSessionImpl::updateCondenseFormForCandidates(std::vector<InputTranscoder::CTCSurfaceFormOutput> &,ITTypingMode)::$_0,std::allocator<InputTranscoder::TouchTranscoderSessionImpl::updateCondenseFormForCandidates(std::vector<InputTranscoder::CTCSurfaceFormOutput> &,ITTypingMode)::$_0>,std::string ()(InputTranscoder::KeyboardLayout &)>::destroy[abi:ne180100](uint64_t a1)
{
  if (*(char *)(a1 + 87) < 0) {
    operator delete(*(void **)(a1 + 64));
  }
  if (*(char *)(a1 + 47) < 0) {
    operator delete(*(void **)(a1 + 24));
  }
  if (*(char *)(a1 + 23) < 0)
  {
    uint64_t v2 = *(void **)a1;
    operator delete(v2);
  }
}

void *std::__function::__value_func<std::string ()(InputTranscoder::KeyboardLayout &)>::~__value_func[abi:ne180100](void *a1)
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

uint64_t std::__function::__func<InputTranscoder::TouchTranscoderSessionImpl::uniquifyEquivalentCandidates(std::vector<InputTranscoder::CTCSurfaceFormOutput> &)::$_0,std::allocator<InputTranscoder::TouchTranscoderSessionImpl::uniquifyEquivalentCandidates(std::vector<InputTranscoder::CTCSurfaceFormOutput> &)::$_0>,std::string ()(InputTranscoder::KeyboardLayout &)>::~__func(uint64_t a1)
{
  *(void *)a1 = &unk_26E9DAA88;
  if (*(char *)(a1 + 55) < 0) {
    operator delete(*(void **)(a1 + 32));
  }
  if (*(char *)(a1 + 31) < 0) {
    operator delete(*(void **)(a1 + 8));
  }
  return a1;
}

void std::__function::__func<InputTranscoder::TouchTranscoderSessionImpl::uniquifyEquivalentCandidates(std::vector<InputTranscoder::CTCSurfaceFormOutput> &)::$_0,std::allocator<InputTranscoder::TouchTranscoderSessionImpl::uniquifyEquivalentCandidates(std::vector<InputTranscoder::CTCSurfaceFormOutput> &)::$_0>,std::string ()(InputTranscoder::KeyboardLayout &)>::~__func(uint64_t a1)
{
  *(void *)a1 = &unk_26E9DAA88;
  if (*(char *)(a1 + 55) < 0) {
    operator delete(*(void **)(a1 + 32));
  }
  if (*(char *)(a1 + 31) < 0) {
    operator delete(*(void **)(a1 + 8));
  }

  JUMPOUT(0x237E08BB0);
}

char *std::__function::__func<InputTranscoder::TouchTranscoderSessionImpl::uniquifyEquivalentCandidates(std::vector<InputTranscoder::CTCSurfaceFormOutput> &)::$_0,std::allocator<InputTranscoder::TouchTranscoderSessionImpl::uniquifyEquivalentCandidates(std::vector<InputTranscoder::CTCSurfaceFormOutput> &)::$_0>,std::string ()(InputTranscoder::KeyboardLayout &)>::__clone(uint64_t a1)
{
  uint64_t v1 = (long long *)(a1 + 8);
  uint64_t v2 = (char *)operator new(0x48uLL);
  *(void *)uint64_t v2 = &unk_26E9DAA88;
  std::__compressed_pair_elem<InputTranscoder::TouchTranscoderSessionImpl::uniquifyEquivalentCandidates(std::vector<InputTranscoder::CTCSurfaceFormOutput> &)::$_0,0,false>::__compressed_pair_elem[abi:ne180100]<InputTranscoder::TouchTranscoderSessionImpl::uniquifyEquivalentCandidates(std::vector<InputTranscoder::CTCSurfaceFormOutput> &)::$_0 const&,0ul>((std::string *)(v2 + 8), v1);
  return v2;
}

void sub_2369ED194(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

std::string *std::__function::__func<InputTranscoder::TouchTranscoderSessionImpl::uniquifyEquivalentCandidates(std::vector<InputTranscoder::CTCSurfaceFormOutput> &)::$_0,std::allocator<InputTranscoder::TouchTranscoderSessionImpl::uniquifyEquivalentCandidates(std::vector<InputTranscoder::CTCSurfaceFormOutput> &)::$_0>,std::string ()(InputTranscoder::KeyboardLayout &)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26E9DAA88;
  return std::__compressed_pair_elem<InputTranscoder::TouchTranscoderSessionImpl::uniquifyEquivalentCandidates(std::vector<InputTranscoder::CTCSurfaceFormOutput> &)::$_0,0,false>::__compressed_pair_elem[abi:ne180100]<InputTranscoder::TouchTranscoderSessionImpl::uniquifyEquivalentCandidates(std::vector<InputTranscoder::CTCSurfaceFormOutput> &)::$_0 const&,0ul>((std::string *)(a2 + 8), (long long *)(a1 + 8));
}

void std::__function::__func<InputTranscoder::TouchTranscoderSessionImpl::uniquifyEquivalentCandidates(std::vector<InputTranscoder::CTCSurfaceFormOutput> &)::$_0,std::allocator<InputTranscoder::TouchTranscoderSessionImpl::uniquifyEquivalentCandidates(std::vector<InputTranscoder::CTCSurfaceFormOutput> &)::$_0>,std::string ()(InputTranscoder::KeyboardLayout &)>::destroy(uint64_t a1)
{
}

void std::__function::__func<InputTranscoder::TouchTranscoderSessionImpl::uniquifyEquivalentCandidates(std::vector<InputTranscoder::CTCSurfaceFormOutput> &)::$_0,std::allocator<InputTranscoder::TouchTranscoderSessionImpl::uniquifyEquivalentCandidates(std::vector<InputTranscoder::CTCSurfaceFormOutput> &)::$_0>,std::string ()(InputTranscoder::KeyboardLayout &)>::destroy_deallocate(void *a1)
{
  std::__destroy_at[abi:ne180100]<InputTranscoder::CTCSurfaceFormOutput,0>((uint64_t)a1 + 8);

  operator delete(a1);
}

std::string *std::__function::__func<InputTranscoder::TouchTranscoderSessionImpl::uniquifyEquivalentCandidates(std::vector<InputTranscoder::CTCSurfaceFormOutput> &)::$_0,std::allocator<InputTranscoder::TouchTranscoderSessionImpl::uniquifyEquivalentCandidates(std::vector<InputTranscoder::CTCSurfaceFormOutput> &)::$_0>,std::string ()(InputTranscoder::KeyboardLayout &)>::operator()@<X0>(uint64_t a1@<X0>, std::string *a2@<X8>)
{
  return InputTranscoder::removeUnwantedCharacters(a1 + 8, a2);
}

uint64_t std::__function::__func<InputTranscoder::TouchTranscoderSessionImpl::uniquifyEquivalentCandidates(std::vector<InputTranscoder::CTCSurfaceFormOutput> &)::$_0,std::allocator<InputTranscoder::TouchTranscoderSessionImpl::uniquifyEquivalentCandidates(std::vector<InputTranscoder::CTCSurfaceFormOutput> &)::$_0>,std::string ()(InputTranscoder::KeyboardLayout &)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<InputTranscoder::TouchTranscoderSessionImpl::uniquifyEquivalentCandidates(std::vector<InputTranscoder::CTCSurfaceFormOutput> &)::$_0,std::allocator<InputTranscoder::TouchTranscoderSessionImpl::uniquifyEquivalentCandidates(std::vector<InputTranscoder::CTCSurfaceFormOutput> &)::$_0>,std::string ()(InputTranscoder::KeyboardLayout &)>::target_type()
{
}

std::string *std::__compressed_pair_elem<InputTranscoder::TouchTranscoderSessionImpl::uniquifyEquivalentCandidates(std::vector<InputTranscoder::CTCSurfaceFormOutput> &)::$_0,0,false>::__compressed_pair_elem[abi:ne180100]<InputTranscoder::TouchTranscoderSessionImpl::uniquifyEquivalentCandidates(std::vector<InputTranscoder::CTCSurfaceFormOutput> &)::$_0 const&,0ul>(std::string *this, long long *a2)
{
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v4 = *a2;
    this->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v4;
  }
  long long v5 = this + 1;
  if (*((char *)a2 + 47) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *((const std::string::value_type **)a2 + 3), *((void *)a2 + 4));
  }
  else
  {
    long long v6 = *(long long *)((char *)a2 + 24);
    this[1].__r_.__value_.__r.__words[2] = *((void *)a2 + 5);
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v6;
  }
  *(_OWORD *)&this[2].__r_.__value_.__l.__data_ = a2[3];
  return this;
}

void sub_2369ED2F0(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void std::__function::__func<InputTranscoder::TouchTranscoderSessionImpl::shouldRunBigram(std::string const&,std::string const&)::$_0,std::allocator<InputTranscoder::TouchTranscoderSessionImpl::shouldRunBigram(std::string const&,std::string const&)::$_0>,BOOL ()(InputTranscoder::CTCDecoder &)>::~__func()
{
}

void *std::__function::__func<InputTranscoder::TouchTranscoderSessionImpl::shouldRunBigram(std::string const&,std::string const&)::$_0,std::allocator<InputTranscoder::TouchTranscoderSessionImpl::shouldRunBigram(std::string const&,std::string const&)::$_0>,BOOL ()(InputTranscoder::CTCDecoder &)>::__clone(uint64_t a1)
{
  __n128 result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = &unk_26E9DAB08;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<InputTranscoder::TouchTranscoderSessionImpl::shouldRunBigram(std::string const&,std::string const&)::$_0,std::allocator<InputTranscoder::TouchTranscoderSessionImpl::shouldRunBigram(std::string const&,std::string const&)::$_0>,BOOL ()(InputTranscoder::CTCDecoder &)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26E9DAB08;
  a2[1] = v2;
  return result;
}

BOOL std::__function::__func<InputTranscoder::TouchTranscoderSessionImpl::shouldRunBigram(std::string const&,std::string const&)::$_0,std::allocator<InputTranscoder::TouchTranscoderSessionImpl::shouldRunBigram(std::string const&,std::string const&)::$_0>,BOOL ()(InputTranscoder::CTCDecoder &)>::operator()(uint64_t a1, uint64_t a2)
{
  return InputTranscoder::LexiconContainer::isPresentInLexicon(a2 + 192, *(void *)(a1 + 8));
}

uint64_t std::__function::__func<InputTranscoder::TouchTranscoderSessionImpl::shouldRunBigram(std::string const&,std::string const&)::$_0,std::allocator<InputTranscoder::TouchTranscoderSessionImpl::shouldRunBigram(std::string const&,std::string const&)::$_0>,BOOL ()(InputTranscoder::CTCDecoder &)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<InputTranscoder::TouchTranscoderSessionImpl::shouldRunBigram(std::string const&,std::string const&)::$_0,std::allocator<InputTranscoder::TouchTranscoderSessionImpl::shouldRunBigram(std::string const&,std::string const&)::$_0>,BOOL ()(InputTranscoder::CTCDecoder &)>::target_type()
{
}

void *std::__function::__value_func<BOOL ()(InputTranscoder::CTCDecoder &)>::~__value_func[abi:ne180100](void *a1)
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

void std::__function::__func<InputTranscoder::TouchTranscoderSessionImpl::enumerateCandidatesImpl(__CFDictionary const*,std::function<BOOL ()(std::unique_ptr<InputTranscoder::CandidateImpl>)> const&,std::string &)::$_0,std::allocator<InputTranscoder::TouchTranscoderSessionImpl::enumerateCandidatesImpl(__CFDictionary const*,std::function<BOOL ()(std::unique_ptr<InputTranscoder::CandidateImpl>)> const&,std::string &)::$_0>,void ()(InputTranscoder::CTCDecoder &)>::~__func()
{
}

__n128 std::__function::__func<InputTranscoder::TouchTranscoderSessionImpl::enumerateCandidatesImpl(__CFDictionary const*,std::function<BOOL ()(std::unique_ptr<InputTranscoder::CandidateImpl>)> const&,std::string &)::$_0,std::allocator<InputTranscoder::TouchTranscoderSessionImpl::enumerateCandidatesImpl(__CFDictionary const*,std::function<BOOL ()(std::unique_ptr<InputTranscoder::CandidateImpl>)> const&,std::string &)::$_0>,void ()(InputTranscoder::CTCDecoder &)>::__clone(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x50uLL);
  *(void *)uint64_t v2 = &unk_26E9DAB98;
  *(_OWORD *)(v2 + 24) = *(_OWORD *)(a1 + 24);
  *(_OWORD *)(v2 + 40) = *(_OWORD *)(a1 + 40);
  *(_OWORD *)(v2 + 56) = *(_OWORD *)(a1 + 56);
  *((void *)v2 + 9) = *(void *)(a1 + 72);
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 std::__function::__func<InputTranscoder::TouchTranscoderSessionImpl::enumerateCandidatesImpl(__CFDictionary const*,std::function<BOOL ()(std::unique_ptr<InputTranscoder::CandidateImpl>)> const&,std::string &)::$_0,std::allocator<InputTranscoder::TouchTranscoderSessionImpl::enumerateCandidatesImpl(__CFDictionary const*,std::function<BOOL ()(std::unique_ptr<InputTranscoder::CandidateImpl>)> const&,std::string &)::$_0>,void ()(InputTranscoder::CTCDecoder &)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26E9DAB98;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(a1 + 8);
  __n128 result = *(__n128 *)(a1 + 24);
  long long v3 = *(_OWORD *)(a1 + 40);
  long long v4 = *(_OWORD *)(a1 + 56);
  *(void *)(a2 + 72) = *(void *)(a1 + 72);
  *(_OWORD *)(a2 + 56) = v4;
  *(_OWORD *)(a2 + 40) = v3;
  *(__n128 *)(a2 + 24) = result;
  return result;
}

void std::__function::__func<InputTranscoder::TouchTranscoderSessionImpl::enumerateCandidatesImpl(__CFDictionary const*,std::function<BOOL ()(std::unique_ptr<InputTranscoder::CandidateImpl>)> const&,std::string &)::$_0,std::allocator<InputTranscoder::TouchTranscoderSessionImpl::enumerateCandidatesImpl(__CFDictionary const*,std::function<BOOL ()(std::unique_ptr<InputTranscoder::CandidateImpl>)> const&,std::string &)::$_0>,void ()(InputTranscoder::CTCDecoder &)>::operator()(uint64_t a1, InputTranscoder::CTCDecoder *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v20 = 0;
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  long long v6 = *(long long **)(a1 + 32);
  uint64_t v7 = **(void **)(a1 + 24);
  unint64_t v18 = InputTranscoder::filterPrefixes;
  if (*((char *)v6 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&v19, *(const std::string::value_type **)v6, *((void *)v6 + 1));
  }
  else
  {
    long long v8 = *v6;
    v19.__r_.__value_.__r.__words[2] = *((void *)v6 + 2);
    *(_OWORD *)&v19.__r_.__value_.__l.__data_ = v8;
  }
  long long v15 = *(_OWORD *)(a1 + 40);
  std::string v9 = (void *)*((void *)a2 + 23);
  if (v9) {
    InputTranscoder::LMScorer::setContext(v9, (char *)(v4 + 688));
  }
  InputTranscoder::CTCDecoder::setLexiconPrefix((uint64_t)a2, (std::string *)(v4 + 712));
  uint64_t v10 = **(void **)(a1 + 56);
  uint64_t v11 = **(void **)(a1 + 64);
  uint64_t v23 = 0;
  uint64_t v12 = operator new(0x40uLL);
  *uint64_t v12 = &unk_26E9DAC08;
  v12[1] = InputTranscoder::TouchTranscoderSessionImpl::extractCandidatesAndSavePrefixInfo;
  v12[2] = 0;
  v12[3] = v4;
  v12[4] = v5;
  v12[5] = &v20;
  v12[6] = (char *)&v20 + 4;
  v12[7] = v7;
  uint64_t v23 = v12;
  unint64_t v16 = v18;
  if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&__p, v19.__r_.__value_.__l.__data_, v19.__r_.__value_.__l.__size_);
  }
  else {
    std::string __p = v19;
  }
  char v22 = 0;
  __n128 v13 = (char *)operator new(0x28uLL);
  *(void *)__n128 v13 = &unk_26E9DACB0;
  *((void *)v13 + 1) = v16;
  *(std::string *)(v13 + 16) = __p;
  memset(&__p, 0, sizeof(__p));
  char v22 = v13;
  uint64_t v21 = 0;
  __n128 v14 = operator new(0x30uLL);
  *__n128 v14 = &unk_26E9DAD70;
  v14[1] = InputTranscoder::TouchTranscoderSessionImpl::extractCompletionsAndPrefixes;
  v14[2] = 0;
  v14[3] = v4;
  *((_OWORD *)v14 + 2) = v15;
  uint64_t v21 = v14;
  InputTranscoder::CTCDecoder::decode(a2, v10, v11);
}

void sub_2369ED7C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  std::__function::__value_func<void ()(InputTranscoder::PathTrie *,std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> &,BOOL &)>::~__value_func[abi:ne180100]((void *)(v30 - 120));
  if (a24 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t std::__function::__func<InputTranscoder::TouchTranscoderSessionImpl::enumerateCandidatesImpl(__CFDictionary const*,std::function<BOOL ()(std::unique_ptr<InputTranscoder::CandidateImpl>)> const&,std::string &)::$_0,std::allocator<InputTranscoder::TouchTranscoderSessionImpl::enumerateCandidatesImpl(__CFDictionary const*,std::function<BOOL ()(std::unique_ptr<InputTranscoder::CandidateImpl>)> const&,std::string &)::$_0>,void ()(InputTranscoder::CTCDecoder &)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<InputTranscoder::TouchTranscoderSessionImpl::enumerateCandidatesImpl(__CFDictionary const*,std::function<BOOL ()(std::unique_ptr<InputTranscoder::CandidateImpl>)> const&,std::string &)::$_0,std::allocator<InputTranscoder::TouchTranscoderSessionImpl::enumerateCandidatesImpl(__CFDictionary const*,std::function<BOOL ()(std::unique_ptr<InputTranscoder::CandidateImpl>)> const&,std::string &)::$_0>,void ()(InputTranscoder::CTCDecoder &)>::target_type()
{
}

void InputTranscoder::filterPrefixes(unsigned __int8 **a1@<X0>, uint64_t *a2@<X1>, void *a3@<X8>)
{
  long long v54 = 0uLL;
  v55[0] = 0;
  uint64_t v5 = (unsigned __int8 *)*((unsigned __int8 *)a1 + 23);
  if ((char)v5 < 0) {
    uint64_t v5 = a1[1];
  }
  if (!v5)
  {
    if (&v54 == (long long *)a2)
    {
      uint64_t v30 = 0;
      uint64_t v29 = 0;
    }
    else
    {
      std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>>::__assign_with_size[abi:ne180100]<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>*,std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>*>((uint64_t)&v54, *a2, a2[1], 0x8E38E38E38E38E39 * ((a2[1] - *a2) >> 3));
      uint64_t v30 = *((void *)&v54 + 1);
      uint64_t v29 = v54;
    }
    *a3 = 0;
    a3[1] = 0;
    a3[2] = 0;
    std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>>::__init_with_size[abi:ne180100]<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>*,std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>*>(a3, v29, v30, 0x8E38E38E38E38E39 * ((v30 - v29) >> 3));
    goto LABEL_90;
  }
  uint64_t v6 = *a2;
  uint64_t v7 = a2[1];
  if (*a2 == v7)
  {
    unint64_t v9 = 0;
    goto LABEL_85;
  }
  unint64_t v9 = 0;
  char v10 = 0;
LABEL_6:
  char v11 = *((unsigned char *)a1 + 23);
  if (v11 >= 0) {
    uint64_t v12 = (unsigned __int8 *)*((unsigned __int8 *)a1 + 23);
  }
  else {
    uint64_t v12 = a1[1];
  }
  if (v11 >= 0) {
    __n128 v13 = (unsigned __int8 *)a1;
  }
  else {
    __n128 v13 = *a1;
  }
  do
  {
    uint64_t v14 = *(unsigned __int8 *)(v6 + 31);
    if ((v14 & 0x80u) == 0) {
      long long v15 = (unsigned __int8 *)*(unsigned __int8 *)(v6 + 31);
    }
    else {
      long long v15 = *(unsigned __int8 **)(v6 + 16);
    }
    if (v15 == v12)
    {
      if ((v14 & 0x80) != 0)
      {
        if (!memcmp(*(const void **)(v6 + 8), v13, *(void *)(v6 + 16)))
        {
LABEL_25:
          if (v9 >= v55[0])
          {
            unint64_t v17 = 0x8E38E38E38E38E39 * ((uint64_t)(v9 - v54) >> 3);
            unint64_t v18 = v17 + 1;
            if (v17 + 1 > 0x38E38E38E38E38ELL) {
              std::vector<InputTranscoder::InputFeature>::__throw_length_error[abi:ne180100]();
            }
            if (0x1C71C71C71C71C72 * ((uint64_t)(v55[0] - v54) >> 3) > v18) {
              unint64_t v18 = 0x1C71C71C71C71C72 * ((uint64_t)(v55[0] - v54) >> 3);
            }
            if (0x8E38E38E38E38E39 * ((uint64_t)(v55[0] - v54) >> 3) >= 0x1C71C71C71C71C7) {
              unint64_t v19 = 0x38E38E38E38E38ELL;
            }
            else {
              unint64_t v19 = v18;
            }
            unint64_t v59 = v55;
            if (v19) {
              unint64_t v19 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>>>(v19);
            }
            else {
              uint64_t v20 = 0;
            }
            uint64_t v56 = (void **)v19;
            v57.i64[0] = v19 + 72 * v17;
            v57.i64[1] = v57.i64[0];
            unint64_t v58 = v19 + 72 * v20;
            std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>::pair[abi:ne180100](v57.i64[0], v6);
            uint64_t v21 = v57.i64[0];
            unint64_t v9 = v57.i64[1] + 72;
            v57.i64[1] += 72;
            uint64_t v22 = *((void *)&v54 + 1);
            uint64_t v23 = v54;
            if (*((void *)&v54 + 1) == (void)v54)
            {
              int64x2_t v27 = vdupq_n_s64(*((unint64_t *)&v54 + 1));
            }
            else
            {
              do
              {
                uint64_t v24 = *(void *)(v22 - 72);
                v22 -= 72;
                *(void *)(v21 - 72) = v24;
                v21 -= 72;
                long long v25 = *(_OWORD *)(v22 + 8);
                *(void *)(v21 + 24) = *(void *)(v22 + 24);
                *(_OWORD *)(v21 + 8) = v25;
                *(void *)(v22 + 16) = 0;
                *(void *)(v22 + 24) = 0;
                *(void *)(v22 + 8) = 0;
                long long v26 = *(_OWORD *)(v22 + 32);
                *(void *)(v21 + 48) = *(void *)(v22 + 48);
                *(_OWORD *)(v21 + 32) = v26;
                *(void *)(v22 + 40) = 0;
                *(void *)(v22 + 48) = 0;
                *(void *)(v22 + 32) = 0;
                *(_OWORD *)(v21 + 56) = *(_OWORD *)(v22 + 56);
              }
              while (v22 != v23);
              int64x2_t v27 = (int64x2_t)v54;
              unint64_t v9 = v57.u64[1];
            }
            *(void *)&long long v54 = v21;
            *((void *)&v54 + 1) = v9;
            int64x2_t v57 = v27;
            unint64_t v28 = v55[0];
            v55[0] = v58;
            unint64_t v58 = v28;
            uint64_t v56 = (void **)v27.i64[0];
            std::__split_buffer<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>>::~__split_buffer((uint64_t)&v56);
          }
          else
          {
            std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>::pair[abi:ne180100](v9, v6);
            v9 += 72;
          }
          *((void *)&v54 + 1) = v9;
          v6 += 72;
          char v10 = 1;
          if (v6 == v7)
          {
LABEL_46:
            uint64_t v31 = *a2;
            uint64_t v32 = a2[1];
            if (*a2 == v32)
            {
LABEL_83:
              uint64_t v53 = v55[0];
              *a3 = v54;
              a3[1] = v9;
              a3[2] = v53;
              v55[0] = 0;
              long long v54 = 0uLL;
              goto LABEL_90;
            }
            while (2)
            {
              uint64_t v33 = *(unsigned __int8 *)(v31 + 31);
              long long v34 = *(unsigned __int8 **)(v31 + 16);
              if ((v33 & 0x80u) == 0) {
                unint64_t v35 = (unsigned __int8 *)*(unsigned __int8 *)(v31 + 31);
              }
              else {
                unint64_t v35 = *(unsigned __int8 **)(v31 + 16);
              }
              int v36 = *((char *)a1 + 23);
              if (v36 >= 0) {
                long long v37 = (unsigned __int8 *)*((unsigned __int8 *)a1 + 23);
              }
              else {
                long long v37 = a1[1];
              }
              if (v35 == v37)
              {
                if (v36 >= 0) {
                  long long v38 = (unsigned __int8 *)a1;
                }
                else {
                  long long v38 = *a1;
                }
                if ((v33 & 0x80) != 0)
                {
                  int v40 = memcmp(*(const void **)(v31 + 8), v38, *(void *)(v31 + 16));
                  unint64_t v35 = v34;
                  if (v40) {
                    goto LABEL_64;
                  }
                }
                else if (*(unsigned char *)(v31 + 31))
                {
                  uint64_t v39 = 0;
                  while (*(unsigned __int8 *)(v31 + v39 + 8) == v38[v39])
                  {
                    if (v33 == ++v39) {
                      goto LABEL_82;
                    }
                  }
                  goto LABEL_64;
                }
              }
              else
              {
LABEL_64:
                if (v35 == v37)
                {
                  if (v9 >= v55[0])
                  {
                    unint64_t v41 = 0x8E38E38E38E38E39 * ((uint64_t)(v9 - v54) >> 3);
                    unint64_t v42 = v41 + 1;
                    if (v41 + 1 > 0x38E38E38E38E38ELL) {
                      std::vector<InputTranscoder::InputFeature>::__throw_length_error[abi:ne180100]();
                    }
                    if (0x1C71C71C71C71C72 * ((uint64_t)(v55[0] - v54) >> 3) > v42) {
                      unint64_t v42 = 0x1C71C71C71C71C72 * ((uint64_t)(v55[0] - v54) >> 3);
                    }
                    if (0x8E38E38E38E38E39 * ((uint64_t)(v55[0] - v54) >> 3) >= 0x1C71C71C71C71C7) {
                      unint64_t v43 = 0x38E38E38E38E38ELL;
                    }
                    else {
                      unint64_t v43 = v42;
                    }
                    unint64_t v59 = v55;
                    if (v43) {
                      unint64_t v43 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>>>(v43);
                    }
                    else {
                      uint64_t v44 = 0;
                    }
                    uint64_t v56 = (void **)v43;
                    v57.i64[0] = v43 + 72 * v41;
                    v57.i64[1] = v57.i64[0];
                    unint64_t v58 = v43 + 72 * v44;
                    std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>::pair[abi:ne180100](v57.i64[0], v31);
                    uint64_t v45 = v57.i64[0];
                    unint64_t v9 = v57.i64[1] + 72;
                    v57.i64[1] += 72;
                    uint64_t v46 = *((void *)&v54 + 1);
                    uint64_t v47 = v54;
                    if (*((void *)&v54 + 1) == (void)v54)
                    {
                      int64x2_t v51 = vdupq_n_s64(*((unint64_t *)&v54 + 1));
                    }
                    else
                    {
                      do
                      {
                        uint64_t v48 = *(void *)(v46 - 72);
                        v46 -= 72;
                        *(void *)(v45 - 72) = v48;
                        v45 -= 72;
                        long long v49 = *(_OWORD *)(v46 + 8);
                        *(void *)(v45 + 24) = *(void *)(v46 + 24);
                        *(_OWORD *)(v45 + 8) = v49;
                        *(void *)(v46 + 16) = 0;
                        *(void *)(v46 + 24) = 0;
                        *(void *)(v46 + 8) = 0;
                        long long v50 = *(_OWORD *)(v46 + 32);
                        *(void *)(v45 + 48) = *(void *)(v46 + 48);
                        *(_OWORD *)(v45 + 32) = v50;
                        *(void *)(v46 + 40) = 0;
                        *(void *)(v46 + 48) = 0;
                        *(void *)(v46 + 32) = 0;
                        *(_OWORD *)(v45 + 56) = *(_OWORD *)(v46 + 56);
                      }
                      while (v46 != v47);
                      int64x2_t v51 = (int64x2_t)v54;
                      unint64_t v9 = v57.u64[1];
                    }
                    *(void *)&long long v54 = v45;
                    *((void *)&v54 + 1) = v9;
                    int64x2_t v57 = v51;
                    unint64_t v52 = v55[0];
                    v55[0] = v58;
                    unint64_t v58 = v52;
                    uint64_t v56 = (void **)v51.i64[0];
                    std::__split_buffer<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>>::~__split_buffer((uint64_t)&v56);
                  }
                  else
                  {
                    std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>::pair[abi:ne180100](v9, v31);
                    v9 += 72;
                  }
                  *((void *)&v54 + 1) = v9;
                }
              }
LABEL_82:
              v31 += 72;
              if (v31 == v32) {
                goto LABEL_83;
              }
              continue;
            }
          }
          goto LABEL_6;
        }
      }
      else
      {
        if (!*(unsigned char *)(v6 + 31)) {
          goto LABEL_25;
        }
        uint64_t v16 = 0;
        while (*(unsigned __int8 *)(v6 + v16 + 8) == v13[v16])
        {
          if (v14 == ++v16) {
            goto LABEL_25;
          }
        }
      }
    }
    v6 += 72;
  }
  while (v6 != v7);
  if (v10) {
    goto LABEL_46;
  }
LABEL_85:
  if (&v54 != (long long *)a2)
  {
    std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>>::__assign_with_size[abi:ne180100]<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>*,std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>*>((uint64_t)&v54, *a2, a2[1], 0x8E38E38E38E38E39 * ((a2[1] - *a2) >> 3));
    unint64_t v9 = *((void *)&v54 + 1);
  }
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>>::__init_with_size[abi:ne180100]<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>*,std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>*>(a3, v54, v9, 0x8E38E38E38E38E39 * ((uint64_t)(v9 - v54) >> 3));
LABEL_90:
  uint64_t v56 = (void **)&v54;
  std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>>::__destroy_vector::operator()[abi:ne180100](&v56);
}

void sub_2369EDE20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, void **a15)
{
  a15 = (void **)&a11;
  std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>>::__destroy_vector::operator()[abi:ne180100](&a15);
  _Unwind_Resume(a1);
}

void std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>>::__assign_with_size[abi:ne180100]<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>*,std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>*>(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  long long v8 = *(void **)a1;
  if (0x8E38E38E38E38E39 * ((uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 3) < a4)
  {
    std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>>::__vdeallocate((void **)a1);
    if (a4 > 0x38E38E38E38E38ELL) {
      std::vector<InputTranscoder::InputFeature>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v9 = 0x1C71C71C71C71C72 * ((uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 3);
    if (v9 <= a4) {
      unint64_t v9 = a4;
    }
    if (0x8E38E38E38E38E39 * ((uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 3) >= 0x1C71C71C71C71C7) {
      unint64_t v10 = 0x38E38E38E38E38ELL;
    }
    else {
      unint64_t v10 = v9;
    }
    std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>>::__vallocate[abi:ne180100]((void *)a1, v10);
    uint64_t v11 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>>,std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>*,std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>*,std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>*>(a2, a3, *(void *)(a1 + 8));
    goto LABEL_11;
  }
  if (0x8E38E38E38E38E39 * ((uint64_t)(*(void *)(a1 + 8) - (void)v8) >> 3) < a4)
  {
    uint64_t v12 = a2 + 8 * ((uint64_t)(*(void *)(a1 + 8) - (void)v8) >> 3);
    std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput> *,std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput> *,std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput> *>(a2, v12, (uint64_t)v8);
    uint64_t v11 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>>,std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>*,std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>*,std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>*>(v12, a3, *(void *)(a1 + 8));
LABEL_11:
    *(void *)(a1 + 8) = v11;
    return;
  }
  uint64_t v13 = std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput> *,std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput> *,std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput> *>(a2, a3, (uint64_t)v8);
  for (uint64_t i = *(void *)(a1 + 8);
        i != v13;
        std::__destroy_at[abi:ne180100]<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>,0>(i))
  {
    i -= 72;
  }
  *(void *)(a1 + 8) = v13;
}

void sub_2369EDFE4(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_2369EDFEC(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

char *std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >= 0x38E38E38E38E38FLL) {
    std::vector<InputTranscoder::InputFeature>::__throw_length_error[abi:ne180100]();
  }
  __n128 result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>>>(a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[72 * v4];
  return result;
}

uint64_t std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>>,std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>*,std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>*,std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>*>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v6 = 0;
    do
    {
      std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>::pair[abi:ne180100](a3 + v6, a1 + v6);
      v6 += 72;
    }
    while (a1 + v6 != a2);
    a3 += v6;
  }
  return a3;
}

void sub_2369EE0A8(_Unwind_Exception *exception_object)
{
  if (v2)
  {
    uint64_t v4 = v1 - 72;
    do
    {
      std::__destroy_at[abi:ne180100]<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>,0>(v4 + v2);
      v2 -= 72;
    }
    while (v2);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>::pair[abi:ne180100](uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  if (*(char *)(a2 + 31) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)(a1 + 8), *(const std::string::value_type **)(a2 + 8), *(void *)(a2 + 16));
  }
  else
  {
    long long v4 = *(_OWORD *)(a2 + 8);
    *(void *)(a1 + 24) = *(void *)(a2 + 24);
    *(_OWORD *)(a1 + 8) = v4;
  }
  uint64_t v5 = (std::string *)(a1 + 32);
  if (*(char *)(a2 + 55) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *(const std::string::value_type **)(a2 + 32), *(void *)(a2 + 40));
  }
  else
  {
    long long v6 = *(_OWORD *)(a2 + 32);
    *(void *)(a1 + 48) = *(void *)(a2 + 48);
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v6;
  }
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  return a1;
}

void sub_2369EE168(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 31) < 0) {
    operator delete(*v2);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput> *,std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput> *,std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput> *>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = a1;
    do
    {
      *(void *)a3 = *(void *)v5;
      std::string::operator=((std::string *)(a3 + 8), (const std::string *)(v5 + 8));
      std::string::operator=((std::string *)(a3 + 32), (const std::string *)(v5 + 32));
      *(_OWORD *)(a3 + 56) = *(_OWORD *)(v5 + 56);
      a3 += 72;
      v5 += 72;
    }
    while (v5 != a2);
  }
  return a3;
}

void *std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>>::__init_with_size[abi:ne180100]<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>*,std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>*>(void *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    long long v6 = result;
    std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>>::__vallocate[abi:ne180100](result, a4);
    __n128 result = (void *)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>>,std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>*,std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>*,std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>*>(a2, a3, v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_2369EE25C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

void std::__function::__func<std::__bind<void (InputTranscoder::TouchTranscoderSessionImpl::*)(std::vector<InputTranscoder::CTCSurfaceFormOutput> &,unsigned int &,unsigned int &,__CFDictionary const*,InputTranscoder::PathTrie *,std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> &,BOOL &)const,InputTranscoder::TouchTranscoderSessionImpl*,std::reference_wrapper<std::vector<InputTranscoder::CTCSurfaceFormOutput>>,std::reference_wrapper<unsigned int>,std::reference_wrapper<unsigned int>,__CFDictionary const*&,std::placeholders::__ph<1> const&,std::placeholders::__ph<2> const&,std::placeholders::__ph<3> const&>,std::allocator<std::__bind<void (InputTranscoder::TouchTranscoderSessionImpl::*)(std::vector<InputTranscoder::CTCSurfaceFormOutput> &,unsigned int &,unsigned int &,__CFDictionary const*,InputTranscoder::PathTrie *,std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> &,BOOL &)const,InputTranscoder::TouchTranscoderSessionImpl*,std::reference_wrapper<std::vector<InputTranscoder::CTCSurfaceFormOutput>>,std::reference_wrapper<unsigned int>,std::reference_wrapper<unsigned int>,__CFDictionary const*&,std::placeholders::__ph<1> const&,std::placeholders::__ph<2> const&,std::placeholders::__ph<3> const&>>,void ()(InputTranscoder::PathTrie *,std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> &,BOOL &)>::~__func()
{
}

__n128 std::__function::__func<std::__bind<void (InputTranscoder::TouchTranscoderSessionImpl::*)(std::vector<InputTranscoder::CTCSurfaceFormOutput> &,unsigned int &,unsigned int &,__CFDictionary const*,InputTranscoder::PathTrie *,std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> &,BOOL &)const,InputTranscoder::TouchTranscoderSessionImpl*,std::reference_wrapper<std::vector<InputTranscoder::CTCSurfaceFormOutput>>,std::reference_wrapper<unsigned int>,std::reference_wrapper<unsigned int>,__CFDictionary const*&,std::placeholders::__ph<1> const&,std::placeholders::__ph<2> const&,std::placeholders::__ph<3> const&>,std::allocator<std::__bind<void (InputTranscoder::TouchTranscoderSessionImpl::*)(std::vector<InputTranscoder::CTCSurfaceFormOutput> &,unsigned int &,unsigned int &,__CFDictionary const*,InputTranscoder::PathTrie *,std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> &,BOOL &)const,InputTranscoder::TouchTranscoderSessionImpl*,std::reference_wrapper<std::vector<InputTranscoder::CTCSurfaceFormOutput>>,std::reference_wrapper<unsigned int>,std::reference_wrapper<unsigned int>,__CFDictionary const*&,std::placeholders::__ph<1> const&,std::placeholders::__ph<2> const&,std::placeholders::__ph<3> const&>>,void ()(InputTranscoder::PathTrie *,std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> &,BOOL &)>::__clone(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x40uLL);
  *(void *)uint64_t v2 = &unk_26E9DAC08;
  *(_OWORD *)(v2 + 8) = *(_OWORD *)(a1 + 8);
  *(_OWORD *)(v2 + 24) = *(_OWORD *)(a1 + 24);
  __n128 result = *(__n128 *)(a1 + 40);
  *(__n128 *)(v2 + 40) = result;
  *((void *)v2 + 7) = *(void *)(a1 + 56);
  return result;
}

__n128 std::__function::__func<std::__bind<void (InputTranscoder::TouchTranscoderSessionImpl::*)(std::vector<InputTranscoder::CTCSurfaceFormOutput> &,unsigned int &,unsigned int &,__CFDictionary const*,InputTranscoder::PathTrie *,std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> &,BOOL &)const,InputTranscoder::TouchTranscoderSessionImpl*,std::reference_wrapper<std::vector<InputTranscoder::CTCSurfaceFormOutput>>,std::reference_wrapper<unsigned int>,std::reference_wrapper<unsigned int>,__CFDictionary const*&,std::placeholders::__ph<1> const&,std::placeholders::__ph<2> const&,std::placeholders::__ph<3> const&>,std::allocator<std::__bind<void (InputTranscoder::TouchTranscoderSessionImpl::*)(std::vector<InputTranscoder::CTCSurfaceFormOutput> &,unsigned int &,unsigned int &,__CFDictionary const*,InputTranscoder::PathTrie *,std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> &,BOOL &)const,InputTranscoder::TouchTranscoderSessionImpl*,std::reference_wrapper<std::vector<InputTranscoder::CTCSurfaceFormOutput>>,std::reference_wrapper<unsigned int>,std::reference_wrapper<unsigned int>,__CFDictionary const*&,std::placeholders::__ph<1> const&,std::placeholders::__ph<2> const&,std::placeholders::__ph<3> const&>>,void ()(InputTranscoder::PathTrie *,std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> &,BOOL &)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26E9DAC08;
  __n128 result = *(__n128 *)(a1 + 8);
  long long v3 = *(_OWORD *)(a1 + 24);
  long long v4 = *(_OWORD *)(a1 + 40);
  *(void *)(a2 + 56) = *(void *)(a1 + 56);
  *(_OWORD *)(a2 + 40) = v4;
  *(_OWORD *)(a2 + 24) = v3;
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t std::__function::__func<std::__bind<void (InputTranscoder::TouchTranscoderSessionImpl::*)(std::vector<InputTranscoder::CTCSurfaceFormOutput> &,unsigned int &,unsigned int &,__CFDictionary const*,InputTranscoder::PathTrie *,std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> &,BOOL &)const,InputTranscoder::TouchTranscoderSessionImpl*,std::reference_wrapper<std::vector<InputTranscoder::CTCSurfaceFormOutput>>,std::reference_wrapper<unsigned int>,std::reference_wrapper<unsigned int>,__CFDictionary const*&,std::placeholders::__ph<1> const&,std::placeholders::__ph<2> const&,std::placeholders::__ph<3> const&>,std::allocator<std::__bind<void (InputTranscoder::TouchTranscoderSessionImpl::*)(std::vector<InputTranscoder::CTCSurfaceFormOutput> &,unsigned int &,unsigned int &,__CFDictionary const*,InputTranscoder::PathTrie *,std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> &,BOOL &)const,InputTranscoder::TouchTranscoderSessionImpl*,std::reference_wrapper<std::vector<InputTranscoder::CTCSurfaceFormOutput>>,std::reference_wrapper<unsigned int>,std::reference_wrapper<unsigned int>,__CFDictionary const*&,std::placeholders::__ph<1> const&,std::placeholders::__ph<2> const&,std::placeholders::__ph<3> const&>>,void ()(InputTranscoder::PathTrie *,std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> &,BOOL &)>::operator()(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  long long v4 = (uint64_t (*)(void *, void, void, void, void, void, uint64_t, uint64_t))a1[1];
  uint64_t v5 = a1[2];
  long long v6 = (void *)(a1[3] + (v5 >> 1));
  if (v5) {
    long long v4 = *(uint64_t (**)(void *, void, void, void, void, void, uint64_t, uint64_t))(*v6 + v4);
  }
  return v4(v6, a1[4], a1[5], a1[6], a1[7], *a2, a3, a4);
}

uint64_t std::__function::__func<std::__bind<void (InputTranscoder::TouchTranscoderSessionImpl::*)(std::vector<InputTranscoder::CTCSurfaceFormOutput> &,unsigned int &,unsigned int &,__CFDictionary const*,InputTranscoder::PathTrie *,std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> &,BOOL &)const,InputTranscoder::TouchTranscoderSessionImpl*,std::reference_wrapper<std::vector<InputTranscoder::CTCSurfaceFormOutput>>,std::reference_wrapper<unsigned int>,std::reference_wrapper<unsigned int>,__CFDictionary const*&,std::placeholders::__ph<1> const&,std::placeholders::__ph<2> const&,std::placeholders::__ph<3> const&>,std::allocator<std::__bind<void (InputTranscoder::TouchTranscoderSessionImpl::*)(std::vector<InputTranscoder::CTCSurfaceFormOutput> &,unsigned int &,unsigned int &,__CFDictionary const*,InputTranscoder::PathTrie *,std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> &,BOOL &)const,InputTranscoder::TouchTranscoderSessionImpl*,std::reference_wrapper<std::vector<InputTranscoder::CTCSurfaceFormOutput>>,std::reference_wrapper<unsigned int>,std::reference_wrapper<unsigned int>,__CFDictionary const*&,std::placeholders::__ph<1> const&,std::placeholders::__ph<2> const&,std::placeholders::__ph<3> const&>>,void ()(InputTranscoder::PathTrie *,std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> &,BOOL &)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<std::__bind<void (InputTranscoder::TouchTranscoderSessionImpl::*)(std::vector<InputTranscoder::CTCSurfaceFormOutput> &,unsigned int &,unsigned int &,__CFDictionary const*,InputTranscoder::PathTrie *,std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> &,BOOL &)const,InputTranscoder::TouchTranscoderSessionImpl*,std::reference_wrapper<std::vector<InputTranscoder::CTCSurfaceFormOutput>>,std::reference_wrapper<unsigned int>,std::reference_wrapper<unsigned int>,__CFDictionary const*&,std::placeholders::__ph<1> const&,std::placeholders::__ph<2> const&,std::placeholders::__ph<3> const&>,std::allocator<std::__bind<void (InputTranscoder::TouchTranscoderSessionImpl::*)(std::vector<InputTranscoder::CTCSurfaceFormOutput> &,unsigned int &,unsigned int &,__CFDictionary const*,InputTranscoder::PathTrie *,std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> &,BOOL &)const,InputTranscoder::TouchTranscoderSessionImpl*,std::reference_wrapper<std::vector<InputTranscoder::CTCSurfaceFormOutput>>,std::reference_wrapper<unsigned int>,std::reference_wrapper<unsigned int>,__CFDictionary const*&,std::placeholders::__ph<1> const&,std::placeholders::__ph<2> const&,std::placeholders::__ph<3> const&>>,void ()(InputTranscoder::PathTrie *,std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> &,BOOL &)>::target_type()
{
}

uint64_t std::__function::__func<std::__bind<std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> (*)(std::string const&,std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> const&),std::string const&,std::placeholders::__ph<1> const&>,std::allocator<std::__bind<std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> (*)(std::string const&,std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> const&),std::string const&,std::placeholders::__ph<1> const&>>,std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> ()(std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> const&)>::~__func(uint64_t a1)
{
  *(void *)a1 = &unk_26E9DACB0;
  if (*(char *)(a1 + 39) < 0) {
    operator delete(*(void **)(a1 + 16));
  }
  return a1;
}

void std::__function::__func<std::__bind<std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> (*)(std::string const&,std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> const&),std::string const&,std::placeholders::__ph<1> const&>,std::allocator<std::__bind<std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> (*)(std::string const&,std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> const&),std::string const&,std::placeholders::__ph<1> const&>>,std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> ()(std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> const&)>::~__func(uint64_t a1)
{
  *(void *)a1 = &unk_26E9DACB0;
  if (*(char *)(a1 + 39) < 0) {
    operator delete(*(void **)(a1 + 16));
  }

  JUMPOUT(0x237E08BB0);
}

void *std::__function::__func<std::__bind<std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> (*)(std::string const&,std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> const&),std::string const&,std::placeholders::__ph<1> const&>,std::allocator<std::__bind<std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> (*)(std::string const&,std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> const&),std::string const&,std::placeholders::__ph<1> const&>>,std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> ()(std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> const&)>::__clone(uint64_t a1)
{
  uint64_t v2 = operator new(0x28uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t v2 = &unk_26E9DACB0;
  v2[1] = v3;
  long long v4 = (std::string *)(v2 + 2);
  if (*(char *)(a1 + 39) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)(a1 + 16), *(void *)(a1 + 24));
  }
  else
  {
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = *(_OWORD *)(a1 + 16);
    v2[4] = *(void *)(a1 + 32);
  }
  return v2;
}

void sub_2369EE504(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__function::__func<std::__bind<std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> (*)(std::string const&,std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> const&),std::string const&,std::placeholders::__ph<1> const&>,std::allocator<std::__bind<std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> (*)(std::string const&,std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> const&),std::string const&,std::placeholders::__ph<1> const&>>,std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> ()(std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> const&)>::__clone(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  *a2 = &unk_26E9DACB0;
  a2[1] = v2;
  uint64_t v3 = (std::string *)(a2 + 2);
  if (*(char *)(a1 + 39) < 0)
  {
    std::string::__init_copy_ctor_external(v3, *(const std::string::value_type **)(a1 + 16), *(void *)(a1 + 24));
  }
  else
  {
    long long v4 = *(_OWORD *)(a1 + 16);
    a2[4] = *(void *)(a1 + 32);
    *(_OWORD *)&v3->__r_.__value_.__l.__data_ = v4;
  }
}

void std::__function::__func<std::__bind<std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> (*)(std::string const&,std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> const&),std::string const&,std::placeholders::__ph<1> const&>,std::allocator<std::__bind<std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> (*)(std::string const&,std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> const&),std::string const&,std::placeholders::__ph<1> const&>>,std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> ()(std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> const&)>::destroy(uint64_t a1)
{
  if (*(char *)(a1 + 39) < 0) {
    operator delete(*(void **)(a1 + 16));
  }
}

void std::__function::__func<std::__bind<std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> (*)(std::string const&,std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> const&),std::string const&,std::placeholders::__ph<1> const&>,std::allocator<std::__bind<std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> (*)(std::string const&,std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> const&),std::string const&,std::placeholders::__ph<1> const&>>,std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> ()(std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> const&)>::destroy_deallocate(void **__p)
{
  if (*((char *)__p + 39) < 0) {
    operator delete(__p[2]);
  }

  operator delete(__p);
}

uint64_t std::__function::__func<std::__bind<std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> (*)(std::string const&,std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> const&),std::string const&,std::placeholders::__ph<1> const&>,std::allocator<std::__bind<std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> (*)(std::string const&,std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> const&),std::string const&,std::placeholders::__ph<1> const&>>,std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> ()(std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> const&)>::operator()(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(a1 + 8))(a1 + 16);
}

uint64_t std::__function::__func<std::__bind<std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> (*)(std::string const&,std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> const&),std::string const&,std::placeholders::__ph<1> const&>,std::allocator<std::__bind<std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> (*)(std::string const&,std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> const&),std::string const&,std::placeholders::__ph<1> const&>>,std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> ()(std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> const&)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<std::__bind<std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> (*)(std::string const&,std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> const&),std::string const&,std::placeholders::__ph<1> const&>,std::allocator<std::__bind<std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> (*)(std::string const&,std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> const&),std::string const&,std::placeholders::__ph<1> const&>>,std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> ()(std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> const&)>::target_type()
{
}

void std::__function::__func<std::__bind<void (InputTranscoder::TouchTranscoderSessionImpl::*)(std::vector<InputTranscoder::CTCSurfaceFormOutput> &,std::vector<InputTranscoder::CTCSurfaceFormOutput> &,std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput> const&)const,InputTranscoder::TouchTranscoderSessionImpl*,std::reference_wrapper<std::vector<InputTranscoder::CTCSurfaceFormOutput>>,std::reference_wrapper<std::vector<InputTranscoder::CTCSurfaceFormOutput>>,std::placeholders::__ph<1> const&>,std::allocator<std::__bind<void (InputTranscoder::TouchTranscoderSessionImpl::*)(std::vector<InputTranscoder::CTCSurfaceFormOutput> &,std::vector<InputTranscoder::CTCSurfaceFormOutput> &,std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput> const&)const,InputTranscoder::TouchTranscoderSessionImpl*,std::reference_wrapper<std::vector<InputTranscoder::CTCSurfaceFormOutput>>,std::reference_wrapper<std::vector<InputTranscoder::CTCSurfaceFormOutput>>,std::placeholders::__ph<1> const&>>,void ()(std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput> const&)>::~__func()
{
}

__n128 std::__function::__func<std::__bind<void (InputTranscoder::TouchTranscoderSessionImpl::*)(std::vector<InputTranscoder::CTCSurfaceFormOutput> &,std::vector<InputTranscoder::CTCSurfaceFormOutput> &,std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput> const&)const,InputTranscoder::TouchTranscoderSessionImpl*,std::reference_wrapper<std::vector<InputTranscoder::CTCSurfaceFormOutput>>,std::reference_wrapper<std::vector<InputTranscoder::CTCSurfaceFormOutput>>,std::placeholders::__ph<1> const&>,std::allocator<std::__bind<void (InputTranscoder::TouchTranscoderSessionImpl::*)(std::vector<InputTranscoder::CTCSurfaceFormOutput> &,std::vector<InputTranscoder::CTCSurfaceFormOutput> &,std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput> const&)const,InputTranscoder::TouchTranscoderSessionImpl*,std::reference_wrapper<std::vector<InputTranscoder::CTCSurfaceFormOutput>>,std::reference_wrapper<std::vector<InputTranscoder::CTCSurfaceFormOutput>>,std::placeholders::__ph<1> const&>>,void ()(std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput> const&)>::__clone(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x30uLL);
  *(void *)uint64_t v2 = &unk_26E9DAD70;
  *(_OWORD *)(v2 + 8) = *(_OWORD *)(a1 + 8);
  __n128 result = *(__n128 *)(a1 + 24);
  *(__n128 *)(v2 + 24) = result;
  *((void *)v2 + 5) = *(void *)(a1 + 40);
  return result;
}

__n128 std::__function::__func<std::__bind<void (InputTranscoder::TouchTranscoderSessionImpl::*)(std::vector<InputTranscoder::CTCSurfaceFormOutput> &,std::vector<InputTranscoder::CTCSurfaceFormOutput> &,std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput> const&)const,InputTranscoder::TouchTranscoderSessionImpl*,std::reference_wrapper<std::vector<InputTranscoder::CTCSurfaceFormOutput>>,std::reference_wrapper<std::vector<InputTranscoder::CTCSurfaceFormOutput>>,std::placeholders::__ph<1> const&>,std::allocator<std::__bind<void (InputTranscoder::TouchTranscoderSessionImpl::*)(std::vector<InputTranscoder::CTCSurfaceFormOutput> &,std::vector<InputTranscoder::CTCSurfaceFormOutput> &,std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput> const&)const,InputTranscoder::TouchTranscoderSessionImpl*,std::reference_wrapper<std::vector<InputTranscoder::CTCSurfaceFormOutput>>,std::reference_wrapper<std::vector<InputTranscoder::CTCSurfaceFormOutput>>,std::placeholders::__ph<1> const&>>,void ()(std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput> const&)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26E9DAD70;
  __n128 result = *(__n128 *)(a1 + 8);
  long long v3 = *(_OWORD *)(a1 + 24);
  *(void *)(a2 + 40) = *(void *)(a1 + 40);
  *(_OWORD *)(a2 + 24) = v3;
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t std::__function::__func<std::__bind<void (InputTranscoder::TouchTranscoderSessionImpl::*)(std::vector<InputTranscoder::CTCSurfaceFormOutput> &,std::vector<InputTranscoder::CTCSurfaceFormOutput> &,std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput> const&)const,InputTranscoder::TouchTranscoderSessionImpl*,std::reference_wrapper<std::vector<InputTranscoder::CTCSurfaceFormOutput>>,std::reference_wrapper<std::vector<InputTranscoder::CTCSurfaceFormOutput>>,std::placeholders::__ph<1> const&>,std::allocator<std::__bind<void (InputTranscoder::TouchTranscoderSessionImpl::*)(std::vector<InputTranscoder::CTCSurfaceFormOutput> &,std::vector<InputTranscoder::CTCSurfaceFormOutput> &,std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput> const&)const,InputTranscoder::TouchTranscoderSessionImpl*,std::reference_wrapper<std::vector<InputTranscoder::CTCSurfaceFormOutput>>,std::reference_wrapper<std::vector<InputTranscoder::CTCSurfaceFormOutput>>,std::placeholders::__ph<1> const&>>,void ()(std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput> const&)>::operator()(void *a1, uint64_t a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[2];
  long long v6 = (uint64_t (*)(void *, uint64_t, uint64_t, uint64_t))a1[1];
  uint64_t v7 = (void *)(a1[3] + (v5 >> 1));
  if (v5) {
    return (*(uint64_t (**)(void))(*v7 + v6))();
  }
  else {
    return v6(v7, v3, v4, a2);
  }
}

uint64_t std::__function::__func<std::__bind<void (InputTranscoder::TouchTranscoderSessionImpl::*)(std::vector<InputTranscoder::CTCSurfaceFormOutput> &,std::vector<InputTranscoder::CTCSurfaceFormOutput> &,std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput> const&)const,InputTranscoder::TouchTranscoderSessionImpl*,std::reference_wrapper<std::vector<InputTranscoder::CTCSurfaceFormOutput>>,std::reference_wrapper<std::vector<InputTranscoder::CTCSurfaceFormOutput>>,std::placeholders::__ph<1> const&>,std::allocator<std::__bind<void (InputTranscoder::TouchTranscoderSessionImpl::*)(std::vector<InputTranscoder::CTCSurfaceFormOutput> &,std::vector<InputTranscoder::CTCSurfaceFormOutput> &,std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput> const&)const,InputTranscoder::TouchTranscoderSessionImpl*,std::reference_wrapper<std::vector<InputTranscoder::CTCSurfaceFormOutput>>,std::reference_wrapper<std::vector<InputTranscoder::CTCSurfaceFormOutput>>,std::placeholders::__ph<1> const&>>,void ()(std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput> const&)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<std::__bind<void (InputTranscoder::TouchTranscoderSessionImpl::*)(std::vector<InputTranscoder::CTCSurfaceFormOutput> &,std::vector<InputTranscoder::CTCSurfaceFormOutput> &,std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput> const&)const,InputTranscoder::TouchTranscoderSessionImpl*,std::reference_wrapper<std::vector<InputTranscoder::CTCSurfaceFormOutput>>,std::reference_wrapper<std::vector<InputTranscoder::CTCSurfaceFormOutput>>,std::placeholders::__ph<1> const&>,std::allocator<std::__bind<void (InputTranscoder::TouchTranscoderSessionImpl::*)(std::vector<InputTranscoder::CTCSurfaceFormOutput> &,std::vector<InputTranscoder::CTCSurfaceFormOutput> &,std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput> const&)const,InputTranscoder::TouchTranscoderSessionImpl*,std::reference_wrapper<std::vector<InputTranscoder::CTCSurfaceFormOutput>>,std::reference_wrapper<std::vector<InputTranscoder::CTCSurfaceFormOutput>>,std::placeholders::__ph<1> const&>>,void ()(std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput> const&)>::target_type()
{
}

void *std::__function::__value_func<void ()(std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput> const&)>::~__value_func[abi:ne180100](void *a1)
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

void *std::__function::__value_func<std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> ()(std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> const&)>::~__value_func[abi:ne180100](void *a1)
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

void *std::__function::__value_func<void ()(InputTranscoder::PathTrie *,std::vector<std::pair<InputTranscoder::PathTrie *,InputTranscoder::CTCSurfaceFormOutput>> &,BOOL &)>::~__value_func[abi:ne180100](void *a1)
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

void std::__function::__func<std::__bind<std::vector<InputTranscoder::KeyCandidateImpl> (&)(CGPoint,InputTranscoder::KeyboardLayout &),CGPoint const&,std::placeholders::__ph<1> const&>,std::allocator<std::__bind<std::vector<InputTranscoder::KeyCandidateImpl> (&)(CGPoint,InputTranscoder::KeyboardLayout &),CGPoint const&,std::placeholders::__ph<1> const&>>,std::vector<InputTranscoder::KeyCandidateImpl> ()(InputTranscoder::KeyboardLayout &)>::~__func()
{
}

__n128 std::__function::__func<std::__bind<std::vector<InputTranscoder::KeyCandidateImpl> (&)(CGPoint,InputTranscoder::KeyboardLayout &),CGPoint const&,std::placeholders::__ph<1> const&>,std::allocator<std::__bind<std::vector<InputTranscoder::KeyCandidateImpl> (&)(CGPoint,InputTranscoder::KeyboardLayout &),CGPoint const&,std::placeholders::__ph<1> const&>>,std::vector<InputTranscoder::KeyCandidateImpl> ()(InputTranscoder::KeyboardLayout &)>::__clone(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x20uLL);
  *(void *)uint64_t v2 = &unk_26E9DAE28;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  *((void *)v2 + 3) = *(void *)(a1 + 24);
  return result;
}

__n128 std::__function::__func<std::__bind<std::vector<InputTranscoder::KeyCandidateImpl> (&)(CGPoint,InputTranscoder::KeyboardLayout &),CGPoint const&,std::placeholders::__ph<1> const&>,std::allocator<std::__bind<std::vector<InputTranscoder::KeyCandidateImpl> (&)(CGPoint,InputTranscoder::KeyboardLayout &),CGPoint const&,std::placeholders::__ph<1> const&>>,std::vector<InputTranscoder::KeyCandidateImpl> ()(InputTranscoder::KeyboardLayout &)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26E9DAE28;
  __n128 result = *(__n128 *)(a1 + 8);
  *(void *)(a2 + 24) = *(void *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t std::__function::__func<std::__bind<std::vector<InputTranscoder::KeyCandidateImpl> (&)(CGPoint,InputTranscoder::KeyboardLayout &),CGPoint const&,std::placeholders::__ph<1> const&>,std::allocator<std::__bind<std::vector<InputTranscoder::KeyCandidateImpl> (&)(CGPoint,InputTranscoder::KeyboardLayout &),CGPoint const&,std::placeholders::__ph<1> const&>>,std::vector<InputTranscoder::KeyCandidateImpl> ()(InputTranscoder::KeyboardLayout &)>::operator()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, double, double))(a1 + 8))(a2, *(double *)(a1 + 16), *(double *)(a1 + 24));
}

uint64_t std::__function::__func<std::__bind<std::vector<InputTranscoder::KeyCandidateImpl> (&)(CGPoint,InputTranscoder::KeyboardLayout &),CGPoint const&,std::placeholders::__ph<1> const&>,std::allocator<std::__bind<std::vector<InputTranscoder::KeyCandidateImpl> (&)(CGPoint,InputTranscoder::KeyboardLayout &),CGPoint const&,std::placeholders::__ph<1> const&>>,std::vector<InputTranscoder::KeyCandidateImpl> ()(InputTranscoder::KeyboardLayout &)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<std::__bind<std::vector<InputTranscoder::KeyCandidateImpl> (&)(CGPoint,InputTranscoder::KeyboardLayout &),CGPoint const&,std::placeholders::__ph<1> const&>,std::allocator<std::__bind<std::vector<InputTranscoder::KeyCandidateImpl> (&)(CGPoint,InputTranscoder::KeyboardLayout &),CGPoint const&,std::placeholders::__ph<1> const&>>,std::vector<InputTranscoder::KeyCandidateImpl> ()(InputTranscoder::KeyboardLayout &)>::target_type()
{
}

void *std::__function::__value_func<std::vector<InputTranscoder::KeyCandidateImpl> ()(InputTranscoder::KeyboardLayout &)>::~__value_func[abi:ne180100](void *a1)
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

os_log_t ___nlpDefaultLog_block_invoke()
{
  os_log_t result = os_log_create("com.apple.InputTranscoder", "Default");
  _nlpDefaultLog::log = (uint64_t)result;
  return result;
}

os_log_t ___nlpSignpostLog_block_invoke()
{
  os_log_t result = os_log_create("com.apple.InputTranscoder", "InputTranscoderSignposts");
  _nlpSignpostLog::log = (uint64_t)result;
  return result;
}

void InputTranscoder::getPrunedLogProbs(InputTranscoder *this@<X0>, const float *a2@<X1>, double a3@<D0>, uint64_t a4@<X2>, unsigned int a5@<W3>, unsigned int a6@<W4>, float **a7@<X8>)
{
  *a7 = 0;
  a7[1] = 0;
  a7[2] = 0;
  if (a2)
  {
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    long long v15 = 0;
    uint64_t v16 = (const float *)a5;
    do
    {
      if (v15 != v16)
      {
        if (v14 >= v13)
        {
          uint64_t v17 = ((char *)v14 - (char *)v12) >> 3;
          unint64_t v18 = v17 + 1;
          if ((unint64_t)(v17 + 1) >> 61) {
            std::vector<InputTranscoder::InputFeature>::__throw_length_error[abi:ne180100]();
          }
          if (v13 - v12 > v18) {
            unint64_t v18 = v13 - v12;
          }
          if ((unint64_t)((char *)v13 - (char *)v12) >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v19 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v19 = v18;
          }
          uint64_t v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned int,float>>>(v19);
          uint64_t v22 = &v20[8 * v17];
          *(_DWORD *)uint64_t v22 = v15;
          *((_DWORD *)v22 + 1) = *((_DWORD *)this + (void)v15);
          uint64_t v23 = v22;
          while (v14 != v12)
          {
            uint64_t v24 = *((void *)v14 - 1);
            v14 -= 2;
            *((void *)v23 - 1) = v24;
            v23 -= 8;
          }
          uint64_t v13 = (float *)&v20[8 * v21];
          uint64_t v14 = (float *)(v22 + 8);
          *a7 = (float *)v23;
          a7[1] = (float *)(v22 + 8);
          a7[2] = v13;
          if (v12) {
            operator delete(v12);
          }
          uint64_t v12 = (float *)v23;
        }
        else
        {
          *(_DWORD *)uint64_t v14 = v15;
          v14[1] = *((float *)this + (void)v15);
          v14 += 2;
        }
        a7[1] = v14;
      }
      long long v15 = (const float *)((char *)v15 + 1);
    }
    while (v15 != a2);
  }
  else
  {
    uint64_t v14 = 0;
  }
  if (a3 >= 1.0 && a4 >= (unint64_t)a2) {
    goto LABEL_69;
  }
  long long v26 = *a7;
  uint64_t v74 = InputTranscoder::pair_second_greater<unsigned long,double>;
  if (a4)
  {
    if (a4 >= 2)
    {
      unint64_t v27 = (unint64_t)(a4 - 2) >> 1;
      unint64_t v28 = v27 + 1;
      uint64_t v29 = &v26[2 * v27];
      do
      {
        std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(std::pair<unsigned long,double> const&,std::pair<unsigned long,double> const&),std::__wrap_iter<std::pair<unsigned int,float> *>>((uint64_t)v26, (uint64_t (**)(uint64_t *, uint64_t *))&v74, a4, v29);
        v29 -= 2;
        --v28;
      }
      while (v28);
    }
    uint64_t v30 = &v26[2 * a4];
    if (v30 != v14)
    {
      uint64_t v31 = &v26[2 * a4];
      do
      {
        float v32 = v31[1];
        float v33 = v26[1];
        if (v32 > v33)
        {
          float v34 = *v31;
          *uint64_t v31 = *v26;
          *long long v26 = v34;
          v31[1] = v33;
          v26[1] = v32;
          std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(std::pair<unsigned long,double> const&,std::pair<unsigned long,double> const&),std::__wrap_iter<std::pair<unsigned int,float> *>>((uint64_t)v26, (uint64_t (**)(uint64_t *, uint64_t *))&v74, a4, v26);
        }
        v31 += 2;
      }
      while (v31 != v14);
    }
    if (a4 >= 2)
    {
      uint64_t v35 = a4 & 0x1FFFFFFFFFFFFFFFLL;
      do
      {
        uint64_t v36 = 0;
        float v37 = *v26;
        float v38 = v26[1];
        uint64_t v39 = v35 - 2;
        if (v35 < 2) {
          uint64_t v39 = v35 - 1;
        }
        uint64_t v40 = v39 >> 1;
        unint64_t v41 = v26;
        do
        {
          unint64_t v42 = &v41[2 * v36 + 2];
          uint64_t v43 = (2 * v36) | 1;
          uint64_t v44 = 2 * v36 + 2;
          if (v44 < v35)
          {
            float v45 = v42[1];
            float v46 = v42[3];
            v42 += 2 * (v45 > v46);
            if (v45 > v46) {
              uint64_t v43 = v44;
            }
          }
          float *v41 = *v42;
          v41[1] = v42[1];
          unint64_t v41 = v42;
          uint64_t v36 = v43;
        }
        while (v43 <= v40);
        if (v30 - 2 == v42)
        {
          *unint64_t v42 = v37;
        }
        else
        {
          *unint64_t v42 = *(v30 - 2);
          v42[1] = *(v30 - 1);
          *(v30 - 2) = v37;
          *(v30 - 1) = v38;
          uint64_t v47 = (char *)v42 - (char *)v26 + 8;
          if (v47 < 9) {
            goto LABEL_53;
          }
          unint64_t v48 = (((unint64_t)v47 >> 3) - 2) >> 1;
          float v49 = v26[2 * v48 + 1];
          float v38 = v42[1];
          if (v49 <= v38) {
            goto LABEL_53;
          }
          int v50 = *(_DWORD *)v42;
          do
          {
            int64x2_t v51 = v42;
            unint64_t v42 = &v26[2 * v48];
            *int64x2_t v51 = *v42;
            v51[1] = v49;
            if (!v48) {
              break;
            }
            unint64_t v48 = (v48 - 1) >> 1;
            float v49 = v26[2 * v48 + 1];
          }
          while (v49 > v38);
          *(_DWORD *)unint64_t v42 = v50;
        }
        v42[1] = v38;
LABEL_53:
        v30 -= 2;
      }
      while (v35-- > 2);
    }
  }
  if (a3 >= 1.0)
  {
    v26 += 2 * a4;
LABEL_68:
    std::vector<std::pair<unsigned int,float>>::erase((uint64_t)a7, (char *)v26, (char *)v14);
LABEL_69:
    if (a6 < (unint64_t)a2)
    {
      unint64_t v59 = a7[1];
      unint64_t v58 = (unint64_t)a7[2];
      if ((unint64_t)v59 >= v58)
      {
        uint64_t v61 = *a7;
        uint64_t v62 = ((char *)v59 - (char *)*a7) >> 3;
        unint64_t v63 = v62 + 1;
        if ((unint64_t)(v62 + 1) >> 61) {
          std::vector<InputTranscoder::InputFeature>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v64 = v58 - (void)v61;
        if (v64 >> 2 > v63) {
          unint64_t v63 = v64 >> 2;
        }
        if ((unint64_t)v64 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v65 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v65 = v63;
        }
        uint64_t v66 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned int,float>>>(v65);
        char v68 = &v66[8 * v62];
        *(_DWORD *)char v68 = a6;
        *((_DWORD *)v68 + 1) = *((_DWORD *)this + a6);
        unint64_t v60 = (float *)(v68 + 8);
        if (v59 != v61)
        {
          do
          {
            uint64_t v69 = *((void *)v59 - 1);
            v59 -= 2;
            *((void *)v68 - 1) = v69;
            v68 -= 8;
          }
          while (v59 != v61);
          unint64_t v59 = v61;
        }
        *a7 = (float *)v68;
        a7[1] = v60;
        a7[2] = (float *)&v66[8 * v67];
        if (v59) {
          operator delete(v59);
        }
      }
      else
      {
        *(_DWORD *)unint64_t v59 = a6;
        v59[1] = *((float *)this + a6);
        unint64_t v60 = v59 + 2;
      }
      a7[1] = v60;
    }
    goto LABEL_84;
  }
  if (!a2 || a3 <= 0.0 || !a4) {
    goto LABEL_68;
  }
  char v53 = 0;
  long long v54 = v26 + 1;
  double v55 = 0.0;
  unint64_t v56 = 1;
  do
  {
    if (*((_DWORD *)v54 - 1) == a6) {
      char v53 = 1;
    }
    v26 += 2;
    if (v56 >= a4) {
      break;
    }
    if (v56 >= (unint64_t)a2) {
      break;
    }
    float v57 = *v54;
    v54 += 2;
    double v55 = v55 + v57;
    ++v56;
  }
  while (v55 < a3);
  std::vector<std::pair<unsigned int,float>>::erase((uint64_t)a7, (char *)v26, (char *)v14);
  if ((v53 & 1) == 0) {
    goto LABEL_69;
  }
LABEL_84:
  long long v71 = *a7;
  for (uint64_t i = a7[1]; v71 != i; v71 += 2)
  {
    float v72 = log(v71[1] + 2.22507386e-308);
    v71[1] = v72;
  }
}

void sub_2369EEF6C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

BOOL InputTranscoder::pair_second_greater<unsigned long,double>(uint64_t a1, uint64_t a2)
{
  return *(double *)(a1 + 8) > *(double *)(a2 + 8);
}

uint64_t std::vector<std::pair<unsigned int,float>>::erase(uint64_t result, char *a2, char *a3)
{
  if (a2 != a3)
  {
    uint64_t v3 = *(char **)(result + 8);
    if (a3 != v3)
    {
      uint64_t v4 = 8 * ((a3 - a2) >> 3);
      do
      {
        *(_DWORD *)a2 = *(_DWORD *)&a2[v4];
        *((_DWORD *)a2 + 1) = *(_DWORD *)&a2[v4 + 4];
        a2 += 8;
      }
      while (&a2[v4] != v3);
    }
    *(void *)(result + 8) = a2;
  }
  return result;
}

uint64_t InputTranscoder::CTCSurfaceFormOutput::toString@<X0>(InputTranscoder::CTCSurfaceFormOutput *this@<X0>, void *a2@<X8>)
{
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v27);
  uint64_t v4 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v27, (uint64_t)"surfaceForm=", 12);
  int v5 = *((char *)this + 23);
  if (v5 >= 0) {
    long long v6 = this;
  }
  else {
    long long v6 = *(InputTranscoder::CTCSurfaceFormOutput **)this;
  }
  if (v5 >= 0) {
    uint64_t v7 = *((unsigned __int8 *)this + 23);
  }
  else {
    uint64_t v7 = *((void *)this + 1);
  }
  long long v8 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v4, (uint64_t)v6, v7);
  uint64_t v9 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)" score=", 7);
  *(_DWORD *)((char *)v9 + *(void *)(*v9 - 24) + 8) = *(_DWORD *)((unsigned char *)v9 + *(void *)(*v9 - 24) + 8) & 0xFFFFFEFB | 4;
  uint64_t v10 = (void *)std::ostream::operator<<();
  uint64_t v11 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)" isCompletion=", 14);
  if (*((unsigned char *)this + 56)) {
    uint64_t v12 = "YES";
  }
  else {
    uint64_t v12 = "NO";
  }
  if (*((unsigned char *)this + 56)) {
    uint64_t v13 = 3;
  }
  else {
    uint64_t v13 = 2;
  }
  uint64_t v14 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, (uint64_t)v12, v13);
  long long v15 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v14, (uint64_t)" isValidWord=", 13);
  if (*((unsigned char *)this + 57)) {
    uint64_t v16 = "YES";
  }
  else {
    uint64_t v16 = "NO";
  }
  if (*((unsigned char *)this + 57)) {
    uint64_t v17 = 3;
  }
  else {
    uint64_t v17 = 2;
  }
  unint64_t v18 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)v16, v17);
  unint64_t v19 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)" isMultiWord=", 13);
  if (*((unsigned char *)this + 58)) {
    uint64_t v20 = "YES";
  }
  else {
    uint64_t v20 = "NO";
  }
  if (*((unsigned char *)this + 58)) {
    uint64_t v21 = 3;
  }
  else {
    uint64_t v21 = 2;
  }
  uint64_t v22 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v19, (uint64_t)v20, v21);
  uint64_t v23 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v22, (uint64_t)" foundOnlyInDynamicLexicons", 27);
  if (*((unsigned char *)this + 59)) {
    uint64_t v24 = "YES";
  }
  else {
    uint64_t v24 = "NO";
  }
  if (*((unsigned char *)this + 59)) {
    uint64_t v25 = 3;
  }
  else {
    uint64_t v25 = 2;
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v23, (uint64_t)v24, v25);
  std::stringbuf::str[abi:ne180100]<std::allocator<char>>((uint64_t)v28, a2);
  uint64_t v27 = *MEMORY[0x263F8C2C8];
  *(void *)((char *)&v28[-1] + *(void *)(v27 - 24)) = *(void *)(MEMORY[0x263F8C2C8] + 24);
  v28[0] = MEMORY[0x263F8C318] + 16;
  if (v29 < 0) {
    operator delete((void *)v28[8]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x237E08B30](&v30);
}

void sub_2369EF250(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t std::ostringstream::basic_ostringstream[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C340] + 64;
  *(void *)(a1 + 112) = MEMORY[0x263F8C340] + 64;
  uint64_t v3 = *(void *)(MEMORY[0x263F8C2C8] + 16);
  uint64_t v4 = *(void *)(MEMORY[0x263F8C2C8] + 8);
  *(void *)a1 = v4;
  *(void *)(a1 + *(void *)(v4 - 24)) = v3;
  int v5 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
  std::ios_base::init(v5, (void *)(a1 + 8));
  uint64_t v6 = MEMORY[0x263F8C340] + 24;
  v5[1].__vftable = 0;
  v5[1].__fmtflags_ = -1;
  *(void *)a1 = v6;
  *(void *)(a1 + 112) = v2;
  std::streambuf::basic_streambuf();
  *(void *)(a1 + 8) = MEMORY[0x263F8C318] + 16;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_DWORD *)(a1 + 104) = 16;
  return a1;
}

void sub_2369EF3D4(_Unwind_Exception *a1)
{
  std::ostream::~ostream();
  MEMORY[0x237E08B30](v1);
  _Unwind_Resume(a1);
}

uint64_t std::ostringstream::~ostringstream(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C2C8];
  uint64_t v3 = *MEMORY[0x263F8C2C8];
  *(void *)a1 = *MEMORY[0x263F8C2C8];
  *(void *)(a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  *(void *)(a1 + 8) = MEMORY[0x263F8C318] + 16;
  if (*(char *)(a1 + 95) < 0) {
    operator delete(*(void **)(a1 + 72));
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x237E08B30](a1 + 112);
  return a1;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned int,float>>>(unint64_t a1)
{
  if (a1 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a1);
}

uint64_t std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(std::pair<unsigned long,double> const&,std::pair<unsigned long,double> const&),std::__wrap_iter<std::pair<unsigned int,float> *>>(uint64_t result, uint64_t (**a2)(uint64_t *, uint64_t *), uint64_t a3, float *a4)
{
  unint64_t v8 = a3 - 2;
  if (a3 >= 2)
  {
    uint64_t v30 = v7;
    uint64_t v31 = v6;
    uint64_t v32 = v4;
    uint64_t v33 = v5;
    uint64_t v9 = a4;
    uint64_t v10 = result;
    uint64_t v11 = v8 >> 1;
    if ((uint64_t)(v8 >> 1) >= ((uint64_t)a4 - result) >> 3)
    {
      uint64_t v14 = ((uint64_t)a4 - result) >> 2;
      uint64_t v15 = v14 | 1;
      uint64_t v16 = (float *)(result + 8 * (v14 | 1));
      uint64_t v17 = v14 + 2;
      if (v14 + 2 < a3)
      {
        unint64_t v18 = *a2;
        uint64_t v28 = *(unsigned int *)v16;
        double v29 = v16[1];
        uint64_t v26 = *((unsigned int *)v16 + 2);
        double v27 = v16[3];
        if (v18(&v28, &v26))
        {
          v16 += 2;
          uint64_t v15 = v17;
        }
      }
      unint64_t v19 = *a2;
      uint64_t v28 = *(unsigned int *)v16;
      double v29 = v16[1];
      uint64_t v26 = *(unsigned int *)v9;
      double v27 = v9[1];
      os_log_t result = v19(&v28, &v26);
      if ((result & 1) == 0)
      {
        uint64_t v20 = *(unsigned int *)v9;
        float v21 = v9[1];
        do
        {
          uint64_t v22 = v9;
          uint64_t v9 = v16;
          float *v22 = *v16;
          v22[1] = v16[1];
          if (v11 < v15) {
            break;
          }
          uint64_t v23 = (2 * v15) | 1;
          uint64_t v16 = (float *)(v10 + 8 * v23);
          uint64_t v15 = 2 * v15 + 2;
          if (v15 >= a3)
          {
            uint64_t v15 = v23;
          }
          else
          {
            uint64_t v24 = (unsigned int (*)(uint64_t *, uint64_t *))*a2;
            uint64_t v28 = *(unsigned int *)v16;
            double v29 = v16[1];
            uint64_t v26 = *((unsigned int *)v16 + 2);
            double v27 = v16[3];
            if (v24(&v28, &v26)) {
              v16 += 2;
            }
            else {
              uint64_t v15 = v23;
            }
          }
          uint64_t v25 = *a2;
          uint64_t v28 = *(unsigned int *)v16;
          double v29 = v16[1];
          uint64_t v26 = v20;
          double v27 = v21;
          os_log_t result = v25(&v28, &v26);
        }
        while (!result);
        *(_DWORD *)uint64_t v9 = v20;
        v9[1] = v21;
      }
    }
  }
  return result;
}

void *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(void *a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x237E08A20](v13, a1);
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
  MEMORY[0x237E08A30](v13);
  return a1;
}

void sub_2369EF858(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  MEMORY[0x237E08A30](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x2369EF838);
}

void sub_2369EF8AC(_Unwind_Exception *a1)
{
}

uint64_t std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6 = a1;
  if (a1)
  {
    uint64_t v11 = *(void *)(a5 + 24);
    if (v11 <= a4 - a2) {
      int64_t v12 = 0;
    }
    else {
      int64_t v12 = v11 - (a4 - a2);
    }
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1) != a3 - a2) {
      return 0;
    }
    if (v12 >= 1)
    {
      std::string::basic_string[abi:ne180100](__p, v12, __c);
      uint64_t v13 = v18 >= 0 ? __p : (void **)__p[0];
      uint64_t v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(void *)v6 + 96))(v6, v13, v12);
      if (v18 < 0) {
        operator delete(__p[0]);
      }
      if (v14 != v12) {
        return 0;
      }
    }
    uint64_t v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v6 + 96))(v6, a3, v15) == v15) {
      *(void *)(a5 + 24) = 0;
    }
    else {
      return 0;
    }
  }
  return v6;
}

void sub_2369EFA2C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::string::basic_string[abi:ne180100](void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((unsigned char *)__b + 23) = __len;
    uint64_t v6 = __b;
    if (!__len) {
      goto LABEL_9;
    }
  }
  memset(v6, __c, __len);
LABEL_9:
  *((unsigned char *)v6 + __len) = 0;
  return __b;
}

uint64_t std::stringbuf::str[abi:ne180100]<std::allocator<char>>@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t result = std::stringbuf::view[abi:ne180100](a1);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  uint64_t v5 = (const void *)result;
  size_t v6 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    int v9 = operator new(v7 + 1);
    a2[1] = v6;
    a2[2] = v8 | 0x8000000000000000;
    *a2 = v9;
    a2 = v9;
  }
  else
  {
    *((unsigned char *)a2 + 23) = v4;
    if (!v4) {
      goto LABEL_9;
    }
  }
  uint64_t result = (uint64_t)memmove(a2, v5, v6);
LABEL_9:
  *((unsigned char *)a2 + v6) = 0;
  return result;
}

uint64_t std::stringbuf::view[abi:ne180100](uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 96);
  if ((v1 & 0x10) != 0)
  {
    unint64_t v3 = *(void *)(a1 + 48);
    if (*(void *)(a1 + 88) < v3) {
      *(void *)(a1 + 88) = v3;
    }
    return *(void *)(a1 + 40);
  }
  else if ((v1 & 8) != 0)
  {
    return *(void *)(a1 + 16);
  }
  else
  {
    return 0;
  }
}

void *InputTranscoder::LMScorer::makeLMScorer@<X0>(void *result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  if (*result)
  {
    InputTranscoder::createInternalLanguageModel(a2 + 24, &v4);
    if (v4) {
      operator new();
    }
    uint64_t result = 0;
    *a3 = 0;
  }
  else
  {
    *a3 = 0;
  }
  return result;
}

void sub_2369EFCAC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<InputTranscoder::LanguageModel>::reset[abi:ne180100]((uint64_t *)va, 0);
  _Unwind_Resume(a1);
}

unint64_t InputTranscoder::LMScorer::fillNgram(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8 = 0;
  if (LMLanguageModelGetOrder())
  {
    int v9 = (_DWORD *)(a3 + 4 * a4 - 4);
    do
    {
      if (*(_DWORD *)(a2 + 72) == -1) {
        break;
      }
      uint64_t v10 = a1[3];
      int v15 = *(_DWORD *)(a2 + 72);
      *v9-- = *(_DWORD *)(*(uint64_t (**)(uint64_t, int *))(*(void *)v10 + 32))(v10, &v15);
      ++v8;
      a2 = *(void *)(a2 + 88);
    }
    while (v8 < LMLanguageModelGetOrder());
  }
  if (v8 < LMLanguageModelGetOrder())
  {
    if (a1[5] == a1[6])
    {
      *(_DWORD *)(a3 + 4 * (a4 + ~v8++)) = 1;
    }
    else
    {
      unint64_t v11 = LMLanguageModelGetOrder() - v8;
      uint64_t v12 = a1[5];
      unint64_t v13 = (a1[6] - v12) >> 2;
      if (v13 < v11) {
        unint64_t v11 = (a1[6] - v12) >> 2;
      }
      v8 += v11;
      if (v11) {
        memmove((void *)(a3 + 4 * a4 - 4 * v8), (const void *)(v12 + 4 * v13 - 4 * v11), 4 * v11);
      }
    }
  }
  return v8;
}

void InputTranscoder::LMScorer::setContext(void *a1, char *a2)
{
  uint64_t v2 = (void **)(a1 + 5);
  a1[6] = a1[5];
  uint64_t v3 = a2[23];
  if ((v3 & 0x80u) == 0) {
    uint64_t v4 = a2;
  }
  else {
    uint64_t v4 = *(char **)a2;
  }
  if ((v3 & 0x80u) != 0) {
    uint64_t v3 = *((void *)a2 + 1);
  }
  if (v3)
  {
    size_t v6 = &v4[v3];
    uint64_t v7 = (uint64_t)(a1 + 7);
    do
    {
      uint64_t v8 = a1[3];
      int v22 = *v4;
      int v9 = (_DWORD *)(*(uint64_t (**)(uint64_t, int *))(*(void *)v8 + 40))(v8, &v22);
      uint64_t v10 = v9;
      uint64_t v12 = (char *)a1[6];
      unint64_t v11 = a1[7];
      if ((unint64_t)v12 >= v11)
      {
        uint64_t v14 = (char *)*v2;
        uint64_t v15 = (v12 - (unsigned char *)*v2) >> 2;
        unint64_t v16 = v15 + 1;
        if ((unint64_t)(v15 + 1) >> 62) {
          std::vector<float>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v17 = v11 - (void)v14;
        if (v17 >> 1 > v16) {
          unint64_t v16 = v17 >> 1;
        }
        if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v18 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v18 = v16;
        }
        if (v18)
        {
          unint64_t v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v7, v18);
          uint64_t v14 = (char *)a1[5];
          uint64_t v12 = (char *)a1[6];
        }
        else
        {
          unint64_t v19 = 0;
        }
        uint64_t v20 = &v19[4 * v15];
        *(_DWORD *)uint64_t v20 = *v10;
        unint64_t v13 = v20 + 4;
        while (v12 != v14)
        {
          int v21 = *((_DWORD *)v12 - 1);
          v12 -= 4;
          *((_DWORD *)v20 - 1) = v21;
          v20 -= 4;
        }
        a1[5] = v20;
        a1[6] = v13;
        a1[7] = &v19[4 * v18];
        if (v14) {
          operator delete(v14);
        }
      }
      else
      {
        *(_DWORD *)uint64_t v12 = *v9;
        unint64_t v13 = v12 + 4;
      }
      a1[6] = v13;
      ++v4;
    }
    while (v4 != v6);
  }
}

CFLocaleRef InputTranscoder::copyLocale(InputTranscoder *this, const __CFDictionary *a2)
{
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(this, @"locale");
  if (!Value) {
    return 0;
  }
  CFStringRef v3 = Value;
  CFTypeID v4 = CFGetTypeID(Value);
  if (v4 == CFStringGetTypeID())
  {
    CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    return CFLocaleCreate(v5, v3);
  }
  CFTypeID v7 = CFGetTypeID(v3);
  if (v7 != CFLocaleGetTypeID()) {
    return 0;
  }

  return (CFLocaleRef)CFRetain(v3);
}

CFPropertyListRef InputTranscoder::createModelMetadata(InputTranscoder *this, __CFBundle *a2, const __CFString *a3, const __CFString *a4)
{
  CFStringRef LanguageAndScriptCode = InputTranscoder::createLanguageAndScriptCode(a2, a2);
  CFTypeID v7 = CFBundleCopyResourceURLForLocalization(this, @"models.plist", 0, a3, LanguageAndScriptCode);
  uint64_t v10 = v7;
  if (v7)
  {
    CFPropertyListRef DictionaryWithContentsOfURL = nlp::createDictionaryWithContentsOfURL(v7, 0, v8, v9);
    CFRelease(v10);
    if (!LanguageAndScriptCode) {
      return DictionaryWithContentsOfURL;
    }
    goto LABEL_5;
  }
  CFPropertyListRef DictionaryWithContentsOfURL = 0;
  if (LanguageAndScriptCode) {
LABEL_5:
  }
    CFRelease(LanguageAndScriptCode);
  return DictionaryWithContentsOfURL;
}

void sub_2369F00CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, const void *a10)
{
}

CFStringRef InputTranscoder::createLanguageAndScriptCode(InputTranscoder *this, const __CFLocale *a2)
{
  CFStringRef Value = (const __CFString *)CFLocaleGetValue(this, (CFLocaleKey)*MEMORY[0x263EFFCF0]);
  CFTypeRef v4 = CFLocaleGetValue(this, (CFLocaleKey)*MEMORY[0x263EFFCF8]);
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  if (v4) {
    return CFStringCreateWithFormat(v5, 0, @"%@-%@", Value, v4);
  }

  return CFStringCreateCopy(v5, Value);
}

void InputTranscoder::extractCommonConfiguration(uint64_t a1, const __CFDictionary *a2, __CFBundle *a3, const __CFLocale *a4, uint64_t a5)
{
  CFDictionaryRef Required = (const __CFDictionary *)InputTranscoder::getRequiredCFType<__CFDictionary const*>(a2, @"commonConfiguration");
  if (!CFDictionaryContainsKey(Required, @"modelFile"))
  {
    unint64_t v11 = 0;
    goto LABEL_8;
  }
  InputTranscoder::extractPath((InputTranscoder *)__p, Required, @"modelFile", a3, a4, 0);
  uint64_t v10 = (void *)HIBYTE(v25);
  if (v25 < 0) {
    uint64_t v10 = __p[1];
  }
  if (!v10)
  {
    unint64_t v11 = InputTranscoder::getRequiredCFType<__CFString const*>(Required, @"modelFile");
    if (SHIBYTE(v25) < 0) {
      operator delete(__p[0]);
    }
LABEL_8:
    v32[0] = 0;
    v32[1] = v32;
    uint64_t v33 = 0x3002000000;
    float v34 = __Block_byref_object_copy__1;
    uint64_t v35 = __Block_byref_object_dispose__1;
    CFTypeRef cf = 0;
    v27[0] = (void *)MEMORY[0x263EF8330];
    v27[1] = (void *)0x40000000;
    uint64_t v28 = ___ZN15InputTranscoderL12getModelPathEPK14__CFDictionaryP10__CFBundlePK10__CFLocale_block_invoke;
    double v29 = &unk_264CBA578;
    uint64_t v30 = v32;
    uint64_t v31 = v11;
    InputTranscoder::enumerateLDAssets();
    unint64_t v13 = (nlp *)*((void *)v32[1] + 5);
    if (v13) {
      nlp::getFileSystemRepresentationFromCFURL(v13, v12);
    }
    exception = __cxa_allocate_exception(0x20uLL);
    std::string::basic_string[abi:ne180100]<0>(&v26, "Unable to locate model file in LinguisticData");
    nlp::ResourceCreationException::ResourceCreationException(exception, &v26);
  }
  int v14 = InputTranscoder::extract<int,__CFNumber const*>(Required, @"modelType");
  if (v14 == 2) {
    int v15 = 2;
  }
  else {
    int v15 = v14 == 1;
  }
  if (a5 == 1) {
    CFStringRef v16 = @"tap";
  }
  else {
    CFStringRef v16 = &stru_26E9DB590;
  }
  InputTranscoder::extractPath((InputTranscoder *)v32, Required, @"outputTokenIDMapFile", a3, a4, v16);
  if (CFDictionaryContainsKey(Required, @"internalLMTokenIDMapFile")) {
    InputTranscoder::extractPath((InputTranscoder *)v27, Required, @"internalLMTokenIDMapFile", a3, a4, v16);
  }
  else {
    std::string::basic_string[abi:ne180100]<0>(v27, "");
  }
  if (CFDictionaryGetValue(Required, @"modelVersion"))
  {
    int v17 = InputTranscoder::extract<int,__CFNumber const*>(Required, @"modelVersion");
    if ((v17 - 1) >= 4) {
      int v18 = 0;
    }
    else {
      int v18 = v17;
    }
  }
  else
  {
    int v18 = 0;
  }
  if (CFDictionaryGetValue(Required, @"useNeuralEngine"))
  {
    CFBooleanRef v19 = (const __CFBoolean *)InputTranscoder::getRequiredCFType<__CFBoolean const*>(Required, @"useNeuralEngine");
    BOOL v20 = CFBooleanGetValue(v19) != 0;
  }
  else
  {
    BOOL v20 = 1;
  }
  if (SHIBYTE(v25) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)a1, (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)__p;
    *(void *)(a1 + 16) = v25;
  }
  *(_DWORD *)(a1 + 24) = v15;
  if (SHIBYTE(v33) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)(a1 + 32), (const std::string::value_type *)v32[0], (std::string::size_type)v32[1]);
  }
  else
  {
    *(_OWORD *)(a1 + 32) = *(_OWORD *)v32;
    *(void *)(a1 + 48) = v33;
  }
  int v21 = (std::string *)(a1 + 56);
  if (SHIBYTE(v28) < 0)
  {
    std::string::__init_copy_ctor_external(v21, (const std::string::value_type *)v27[0], (std::string::size_type)v27[1]);
    int v22 = SHIBYTE(v28);
    *(_DWORD *)(a1 + 8nlp::CFScopedPtr<__CFURL const*>::reset(&a9, 0) = v18;
    *(void *)(a1 + 88) = a5;
    *(unsigned char *)(a1 + 96) = v20;
    if (v22 < 0) {
      operator delete(v27[0]);
    }
  }
  else
  {
    *(_OWORD *)&v21->__r_.__value_.__l.__data_ = *(_OWORD *)v27;
    *(void *)(a1 + 72) = v28;
    *(_DWORD *)(a1 + 8nlp::CFScopedPtr<__CFURL const*>::reset(&a9, 0) = v18;
    *(void *)(a1 + 88) = a5;
    *(unsigned char *)(a1 + 96) = v20;
  }
  if (SHIBYTE(v33) < 0) {
    operator delete(v32[0]);
  }
  if (SHIBYTE(v25) < 0) {
    operator delete(__p[0]);
  }
}

void sub_2369F0554(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30,uint64_t a31,int a32,__int16 a33,char a34,char a35)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

const void *InputTranscoder::getRequiredCFType<__CFDictionary const*>(const __CFDictionary *a1, const __CFString *a2)
{
  CFStringRef Value = CFDictionaryGetValue(a1, a2);
  if (!Value)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    std::string::basic_string[abi:ne180100]<0>(v9, "Malformed dictionary: missing key=");
    InputTranscoder::makeDictionaryErrorMessage(a2, (uint64_t)v9, &v10);
    nlp::ResourceCreationException::ResourceCreationException(exception, (long long *)&v10);
  }
  CFTypeRef v4 = Value;
  CFTypeID v5 = CFGetTypeID(Value);
  if (v5 != CFDictionaryGetTypeID())
  {
    uint64_t v8 = __cxa_allocate_exception(0x20uLL);
    std::string::basic_string[abi:ne180100]<0>(v9, "Malformed dictionary: invalid type for key=");
    InputTranscoder::makeDictionaryErrorMessage(a2, (uint64_t)v9, &v10);
    nlp::ResourceCreationException::ResourceCreationException(v8, (long long *)&v10);
  }
  return v4;
}

void sub_2369F0754(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  if (a14 < 0) {
    operator delete(a9);
  }
  if (v21) {
    __cxa_free_exception(v20);
  }
  _Unwind_Resume(exception_object);
}

void InputTranscoder::extractPath(InputTranscoder *this, const __CFDictionary *a2, const __CFString *a3, __CFBundle *a4, const __CFLocale *a5, const __CFString *a6)
{
  CFStringRef Required = (const __CFString *)InputTranscoder::getRequiredCFType<__CFString const*>(a2, a3);
  CFStringRef LanguageAndScriptCode = InputTranscoder::createLanguageAndScriptCode(a5, v11);
  unint64_t v13 = CFBundleCopyResourceURLForLocalization(a4, Required, 0, a6, LanguageAndScriptCode);
  if (v13) {
    nlp::getFileSystemRepresentationFromCFURL(v13, v14);
  }
  std::string::basic_string[abi:ne180100]<0>(this, "");
  if (LanguageAndScriptCode) {
    CFRelease(LanguageAndScriptCode);
  }
}

void sub_2369F087C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, const void *a10)
{
}

void InputTranscoder::extractCTCConfiguration(uint64_t a1, const __CFDictionary *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  CFDictionaryRef Required = (const __CFDictionary *)InputTranscoder::getRequiredCFType<__CFDictionary const*>(a2, @"ctcConfiguration");
  CFStringRef v10 = (const __CFString *)MEMORY[0x237E08530](a3);
  nlp::getUTF8StringFromCFString(v10, v59);
  CFStringRef v11 = (const __CFString *)MEMORY[0x237E08530](a4);
  nlp::getUTF8StringFromCFString(v11, __p);
  CFBooleanRef v12 = (const __CFBoolean *)InputTranscoder::getRequiredCFType<__CFBoolean const*>(Required, @"shouldUseStaticLexicon");
  int Value = CFBooleanGetValue(v12);
  CFNumberRef v13 = (const __CFNumber *)InputTranscoder::getRequiredCFType<__CFNumber const*>(Required, @"lmAlpha");
  float v55 = InputTranscoder::convert<float>(v13);
  CFNumberRef v14 = (const __CFNumber *)InputTranscoder::getRequiredCFType<__CFNumber const*>(Required, @"lmBeta");
  float v54 = InputTranscoder::convert<float>(v14);
  CFNumberRef v15 = (const __CFNumber *)InputTranscoder::getRequiredCFType<__CFNumber const*>(Required, @"cutoffProbability");
  float v53 = InputTranscoder::convert<float>(v15);
  uint64_t v52 = InputTranscoder::extract<unsigned long,__CFNumber const*>(Required, @"maxProbabilityCount");
  uint64_t v51 = InputTranscoder::extract<unsigned long,__CFNumber const*>(Required, @"beamSize");
  CFNumberRef v16 = (const __CFNumber *)InputTranscoder::getRequiredCFType<__CFNumber const*>(Required, @"blankThreshold");
  float v50 = InputTranscoder::convert<float>(v16);
  int v49 = InputTranscoder::extract<unsigned int,__CFNumber const*>(Required, @"blankTokenID");
  if (CFDictionaryGetValue(Required, @"ngramAlpha"))
  {
    CFNumberRef v17 = (const __CFNumber *)InputTranscoder::getRequiredCFType<__CFNumber const*>(Required, @"ngramAlpha");
    float v48 = InputTranscoder::convert<float>(v17);
  }
  else
  {
    float v48 = 1.1755e-38;
  }
  if (CFDictionaryGetValue(Required, @"ngramBeta"))
  {
    CFNumberRef v18 = (const __CFNumber *)InputTranscoder::getRequiredCFType<__CFNumber const*>(Required, @"ngramBeta");
    float v47 = InputTranscoder::convert<float>(v18);
  }
  else
  {
    float v47 = 1.1755e-38;
  }
  if (CFDictionaryGetValue(Required, @"unknownID")) {
    int v46 = InputTranscoder::extract<unsigned int,__CFNumber const*>(Required, @"unknownID");
  }
  else {
    int v46 = -1;
  }
  if (CFDictionaryGetValue(Required, @"wordSeparatorID")) {
    int v45 = InputTranscoder::extract<unsigned int,__CFNumber const*>(Required, @"wordSeparatorID");
  }
  else {
    int v45 = -1;
  }
  if (CFDictionaryGetValue(Required, @"maxProbCountWordSeparator")) {
    uint64_t v19 = InputTranscoder::extract<unsigned long,__CFNumber const*>(Required, @"maxProbCountWordSeparator");
  }
  else {
    uint64_t v19 = 0;
  }
  if (CFDictionaryGetValue(Required, @"wordTerminationThreshold"))
  {
    CFNumberRef v20 = (const __CFNumber *)InputTranscoder::getRequiredCFType<__CFNumber const*>(Required, @"wordTerminationThreshold");
    float v21 = InputTranscoder::convert<float>(v20);
  }
  else
  {
    float v21 = 1.0;
  }
  if (CFDictionaryGetValue(Required, @"minOutputTokenToDecode")) {
    int v22 = InputTranscoder::extract<unsigned int,__CFNumber const*>(Required, @"minOutputTokenToDecode");
  }
  else {
    int v22 = 0;
  }
  if (CFDictionaryGetValue(Required, @"maxOutputTokenToDecode")) {
    int v23 = InputTranscoder::extract<unsigned int,__CFNumber const*>(Required, @"maxOutputTokenToDecode");
  }
  else {
    int v23 = -1;
  }
  if (a5 == 1)
  {
    if (CFDictionaryGetValue(Required, @"maxCandidatesWhenLMUsedForCompletions"))
    {
      int v24 = InputTranscoder::extract<unsigned int,__CFNumber const*>(Required, @"maxCandidatesWhenLMUsedForCompletions");
      int v25 = 0;
    }
    else
    {
      int v25 = 0;
      int v24 = 10;
    }
  }
  else
  {
    if (CFDictionaryGetValue(Required, @"maxCandidates")) {
      int v24 = InputTranscoder::extract<unsigned int,__CFNumber const*>(Required, @"maxCandidates");
    }
    else {
      int v24 = 40;
    }
    if (CFDictionaryGetValue(Required, @"numPrefixesToComplete")) {
      int v25 = InputTranscoder::extract<unsigned int,__CFNumber const*>(Required, @"numPrefixesToComplete");
    }
    else {
      int v25 = 2;
    }
  }
  if (CFDictionaryGetValue(Required, @"numCompletionsPerPrefix")) {
    int v26 = InputTranscoder::extract<unsigned int,__CFNumber const*>(Required, @"numCompletionsPerPrefix");
  }
  else {
    int v26 = 5;
  }
  if (CFDictionaryGetValue(Required, @"maxCompletions")) {
    int v27 = InputTranscoder::extract<unsigned int,__CFNumber const*>(Required, @"maxCompletions");
  }
  else {
    int v27 = 5;
  }
  if (CFDictionaryGetValue(Required, @"minPrefixLengthToComplete")) {
    int v28 = InputTranscoder::extract<unsigned int,__CFNumber const*>(Required, @"minPrefixLengthToComplete");
  }
  else {
    int v28 = 4;
  }
  if (CFDictionaryGetValue(Required, @"completionPenalty"))
  {
    CFNumberRef v29 = (const __CFNumber *)InputTranscoder::getRequiredCFType<__CFNumber const*>(Required, @"completionPenalty");
    float v30 = InputTranscoder::convert<float>(v29);
  }
  else
  {
    float v30 = 0.0;
  }
  if (CFDictionaryGetValue(Required, @"completionLengthPenalty"))
  {
    CFNumberRef v31 = (const __CFNumber *)InputTranscoder::getRequiredCFType<__CFNumber const*>(Required, @"completionLengthPenalty");
    float v32 = InputTranscoder::convert<float>(v31);
  }
  else
  {
    float v32 = 1.0;
  }
  if (CFDictionaryGetValue(Required, @"wordSplittingCost"))
  {
    CFNumberRef v33 = (const __CFNumber *)InputTranscoder::getRequiredCFType<__CFNumber const*>(Required, @"wordSplittingCost");
    float v34 = InputTranscoder::convert<float>(v33);
  }
  else
  {
    float v34 = 2.0;
  }
  if (CFDictionaryGetValue(Required, @"lmAlphaCompletions"))
  {
    CFNumberRef v35 = (const __CFNumber *)InputTranscoder::getRequiredCFType<__CFNumber const*>(Required, @"lmAlphaCompletions");
    float v36 = InputTranscoder::convert<float>(v35);
  }
  else
  {
    float v36 = 1.0;
  }
  if (CFDictionaryGetValue(Required, @"dynamicLexiconWeight"))
  {
    CFNumberRef v37 = (const __CFNumber *)InputTranscoder::getRequiredCFType<__CFNumber const*>(Required, @"dynamicLexiconWeight");
    float v38 = InputTranscoder::convert<float>(v37);
  }
  else
  {
    float v38 = 0.8;
  }
  if (CFDictionaryGetValue(Required, @"exactTypedCandidateBoost"))
  {
    CFNumberRef v39 = (const __CFNumber *)InputTranscoder::getRequiredCFType<__CFNumber const*>(Required, @"exactTypedCandidateBoost");
    float v40 = InputTranscoder::convert<float>(v39);
  }
  else
  {
    float v40 = 2.0;
  }
  if (CFDictionaryGetValue(Required, @"candidatePruningThreshold"))
  {
    CFNumberRef v41 = (const __CFNumber *)InputTranscoder::getRequiredCFType<__CFNumber const*>(Required, @"candidatePruningThreshold");
    float v42 = InputTranscoder::convert<float>(v41);
  }
  else
  {
    float v42 = 4.6;
  }
  if (SHIBYTE(v60) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)a1, (const std::string::value_type *)v59[0], (std::string::size_type)v59[1]);
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)v59;
    *(void *)(a1 + 16) = v60;
  }
  uint64_t v43 = (std::string *)(a1 + 24);
  if (SHIBYTE(v58) < 0)
  {
    std::string::__init_copy_ctor_external(v43, (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
    BOOL v44 = v58 < 0;
  }
  else
  {
    BOOL v44 = 0;
    *(_OWORD *)&v43->__r_.__value_.__l.__data_ = *(_OWORD *)__p;
    *(void *)(a1 + 4nlp::CFScopedPtr<__CFURL const*>::reset(&a9, 0) = v58;
  }
  *(unsigned char *)(a1 + 48) = Value != 0;
  *(float *)(a1 + 52) = v55;
  *(float *)(a1 + 56) = v54;
  *(float *)(a1 + 6nlp::CFScopedPtr<__CFURL const*>::reset(&a9, 0) = v48;
  *(float *)(a1 + 64) = v47;
  *(double *)(a1 + 72) = v53;
  *(void *)(a1 + 8nlp::CFScopedPtr<__CFURL const*>::reset(&a9, 0) = v52;
  *(void *)(a1 + 88) = v51;
  *(float *)(a1 + 96) = v50;
  *(_DWORD *)(a1 + 10nlp::CFScopedPtr<__CFURL const*>::reset(&a9, 0) = v49;
  *(_DWORD *)(a1 + 104) = v46;
  *(_DWORD *)(a1 + 108) = v45;
  *(void *)(a1 + 112) = v19;
  *(float *)(a1 + 12nlp::CFScopedPtr<__CFURL const*>::reset(&a9, 0) = v21;
  *(_DWORD *)(a1 + 124) = v22;
  *(_DWORD *)(a1 + 128) = v23;
  *(_DWORD *)(a1 + 132) = v24;
  *(_DWORD *)(a1 + 136) = v25;
  *(_DWORD *)(a1 + 14nlp::CFScopedPtr<__CFURL const*>::reset(&a9, 0) = v26;
  *(_DWORD *)(a1 + 144) = v27;
  *(_DWORD *)(a1 + 148) = v28;
  *(float *)(a1 + 152) = v30;
  *(float *)(a1 + 156) = v32;
  *(float *)(a1 + 16nlp::CFScopedPtr<__CFURL const*>::reset(&a9, 0) = v34;
  *(float *)(a1 + 164) = v36;
  *(float *)(a1 + 168) = v38;
  *(float *)(a1 + 172) = v40;
  *(float *)(a1 + 176) = v42;
  if (v44) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v60) < 0) {
    operator delete(v59[0]);
  }
}

void sub_2369F0F40(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (*(char *)(v27 + 23) < 0) {
    operator delete(*(void **)v27);
  }
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  _Unwind_Resume(exception_object);
}

uint64_t InputTranscoder::extract<unsigned long,__CFNumber const*>(const __CFDictionary *a1, const __CFString *a2)
{
  CFNumberRef Required = (const __CFNumber *)InputTranscoder::getRequiredCFType<__CFNumber const*>(a1, a2);
  int valuePtr = 0;
  if (!CFNumberGetValue(Required, kCFNumberIntType, &valuePtr))
  {
    exception = __cxa_allocate_exception(0x20uLL);
    std::string::basic_string[abi:ne180100]<0>(&v5, "Failed to parse CFNumber as kCFNumberIntType");
    nlp::ResourceCreationException::ResourceCreationException(exception, &v5);
  }
  return valuePtr;
}

void sub_2369F1094(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
  {
    operator delete(__p);
    if ((v15 & 1) == 0) {
LABEL_6:
    }
      _Unwind_Resume(a1);
  }
  else if (!v15)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v14);
  goto LABEL_6;
}

uint64_t InputTranscoder::extract<unsigned int,__CFNumber const*>(const __CFDictionary *a1, const __CFString *a2)
{
  CFNumberRef Required = (const __CFNumber *)InputTranscoder::getRequiredCFType<__CFNumber const*>(a1, a2);
  unsigned int valuePtr = 0;
  if (!CFNumberGetValue(Required, kCFNumberIntType, &valuePtr))
  {
    exception = __cxa_allocate_exception(0x20uLL);
    std::string::basic_string[abi:ne180100]<0>(&v5, "Failed to parse CFNumber as kCFNumberIntType");
    nlp::ResourceCreationException::ResourceCreationException(exception, &v5);
  }
  return valuePtr;
}

void sub_2369F1168(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
  {
    operator delete(__p);
    if ((v15 & 1) == 0) {
LABEL_6:
    }
      _Unwind_Resume(a1);
  }
  else if (!v15)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v14);
  goto LABEL_6;
}

const void *InputTranscoder::getRequiredCFType<__CFString const*>(const __CFDictionary *a1, const __CFString *a2)
{
  int Value = CFDictionaryGetValue(a1, a2);
  if (!Value)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    std::string::basic_string[abi:ne180100]<0>(v9, "Malformed dictionary: missing key=");
    InputTranscoder::makeDictionaryErrorMessage(a2, (uint64_t)v9, &v10);
    nlp::ResourceCreationException::ResourceCreationException(exception, (long long *)&v10);
  }
  CFTypeRef v4 = Value;
  CFTypeID v5 = CFGetTypeID(Value);
  if (v5 != CFStringGetTypeID())
  {
    uint64_t v8 = __cxa_allocate_exception(0x20uLL);
    std::string::basic_string[abi:ne180100]<0>(v9, "Malformed dictionary: invalid type for key=");
    InputTranscoder::makeDictionaryErrorMessage(a2, (uint64_t)v9, &v10);
    nlp::ResourceCreationException::ResourceCreationException(v8, (long long *)&v10);
  }
  return v4;
}

void sub_2369F12BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  if (a14 < 0) {
    operator delete(a9);
  }
  if (v21) {
    __cxa_free_exception(v20);
  }
  _Unwind_Resume(exception_object);
}

uint64_t InputTranscoder::extract<int,__CFNumber const*>(const __CFDictionary *a1, const __CFString *a2)
{
  CFNumberRef Required = (const __CFNumber *)InputTranscoder::getRequiredCFType<__CFNumber const*>(a1, a2);
  unsigned int valuePtr = 0;
  if (!CFNumberGetValue(Required, kCFNumberIntType, &valuePtr))
  {
    exception = __cxa_allocate_exception(0x20uLL);
    std::string::basic_string[abi:ne180100]<0>(&v5, "Failed to parse CFNumber as kCFNumberIntType");
    nlp::ResourceCreationException::ResourceCreationException(exception, &v5);
  }
  return valuePtr;
}

void sub_2369F13BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
  {
    operator delete(__p);
    if ((v15 & 1) == 0) {
LABEL_6:
    }
      _Unwind_Resume(a1);
  }
  else if (!v15)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v14);
  goto LABEL_6;
}

CFIndex InputTranscoder::extractStrings(int64x2_t *this, const __CFDictionary *a2, const __CFString *a3)
{
  CFArrayRef Required = (const __CFArray *)InputTranscoder::getRequiredCFType<__CFArray const*>(a2, a3);
  CFIndex v5 = 0;
  this->i64[0] = 0;
  this->i64[1] = 0;
  this[1].i64[0] = 0;
  while (1)
  {
    CFIndex result = CFArrayGetCount(Required);
    if (result <= v5) {
      break;
    }
    CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(Required, v5);
    nlp::getUTF8StringFromCFString(ValueAtIndex, __p);
    unint64_t v9 = this->u64[1];
    unint64_t v8 = this[1].u64[0];
    if (v9 >= v8)
    {
      unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v9 - this->i64[0]) >> 3);
      unint64_t v12 = v11 + 1;
      if (v11 + 1 > 0xAAAAAAAAAAAAAAALL) {
        std::vector<InputTranscoder::InputFeature>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v13 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v8 - this->i64[0]) >> 3);
      if (2 * v13 > v12) {
        unint64_t v12 = 2 * v13;
      }
      if (v13 >= 0x555555555555555) {
        unint64_t v14 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v14 = v12;
      }
      v28.__end_cap_.__value_ = (std::allocator<std::string> *)&this[1];
      if (v14) {
        int v15 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)this[1].i64, v14);
      }
      else {
        int v15 = 0;
      }
      CFNumberRef v16 = v15 + v11;
      v28.__first_ = v15;
      v28.__begin_ = v16;
      v28.__end_cap_.__value_ = &v15[v14];
      long long v17 = *(_OWORD *)__p;
      v16->__r_.__value_.__r.__words[2] = v27;
      *(_OWORD *)&v16->__r_.__value_.__l.__data_ = v17;
      __p[1] = 0;
      std::string::size_type v27 = 0;
      __p[0] = 0;
      std::__split_buffer<std::string>::pointer end = v16 + 1;
      v28.__end_ = v16 + 1;
      uint64_t v20 = this->i64[0];
      unint64_t v19 = this->u64[1];
      std::__split_buffer<std::string>::pointer begin = v28.__begin_;
      if (v19 == this->i64[0])
      {
        int64x2_t v23 = vdupq_n_s64(v19);
      }
      else
      {
        do
        {
          long long v22 = *(_OWORD *)(v19 - 24);
          begin[-1].__r_.__value_.__r.__words[2] = *(void *)(v19 - 8);
          *(_OWORD *)&begin[-1].__r_.__value_.__l.__data_ = v22;
          --begin;
          *(void *)(v19 - 16) = 0;
          *(void *)(v19 - 8) = 0;
          *(void *)(v19 - 24) = 0;
          v19 -= 24;
        }
        while (v19 != v20);
        int64x2_t v23 = *this;
        std::__split_buffer<std::string>::pointer end = v28.__end_;
      }
      this->i64[0] = (uint64_t)begin;
      this->i64[1] = (uint64_t)end;
      *(int64x2_t *)&v28.__begin_ = v23;
      int v24 = (std::string *)this[1].i64[0];
      this[1].i64[0] = (uint64_t)v28.__end_cap_.__value_;
      v28.__end_cap_.__value_ = v24;
      v28.__first_ = (std::__split_buffer<std::string>::pointer)v23.i64[0];
      std::__split_buffer<std::string>::~__split_buffer(&v28);
      int v25 = SHIBYTE(v27);
      this->i64[1] = (uint64_t)end;
      if (v25 < 0) {
        operator delete(__p[0]);
      }
    }
    else
    {
      long long v10 = *(_OWORD *)__p;
      *(void *)(v9 + 16) = v27;
      *(_OWORD *)unint64_t v9 = v10;
      this->i64[1] = v9 + 24;
    }
    ++v5;
  }
  return result;
}

void sub_2369F15E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  _Unwind_Resume(a1);
}

void InputTranscoder::generateConfiguration<InputTranscoder::DecoderConfiguration>(InputTranscoder *this@<X1>, InputTranscoder *a2@<X0>, uint64_t a3@<X2>, InputTranscoder::DecoderConfiguration *a4@<X8>)
{
  CFLocaleRef v6 = InputTranscoder::copyLocale(this, this);
  CFLocaleRef v39 = v6;
  if (!v6)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    std::string::basic_string[abi:ne180100]<0>(v40, "Malformed options dictionary - missing or invalid locale");
    nlp::ResourceCreationException::ResourceCreationException(exception, (long long *)v40);
  }
  CFLocaleRef v7 = v6;
  CFStringRef v8 = (const __CFString *)MEMORY[0x237E08530]();
  if (CFStringCompare(v8, @"zh-Hant", 0)) {
    unint64_t v9 = (__CFBundle *)CFRetain(v7);
  }
  else {
    unint64_t v9 = CFLocaleCreate(0, @"zh-Hans");
  }
  CFLocaleRef v11 = v9;
  float v38 = v9;
  if (a3 == 1) {
    CFStringRef v12 = @"tap";
  }
  else {
    CFStringRef v12 = &stru_26E9DB590;
  }
  ModelMetastd::string::pointer data = (const __CFDictionary *)InputTranscoder::createModelMetadata(a2, v9, v12, v10);
  CFDictionaryRef v37 = ModelMetadata;
  if (!ModelMetadata)
  {
    CFNumberRef v31 = __cxa_allocate_exception(0x20uLL);
    std::string::basic_string[abi:ne180100]<0>(v40, "Failed to parse metadata file");
    nlp::ResourceCreationException::ResourceCreationException(v31, (long long *)v40);
  }
  CFDictionaryRef cf = ModelMetadata;
  CFArrayRef Required = (const __CFArray *)InputTranscoder::getRequiredCFType<__CFArray const*>(ModelMetadata, @"models");
  CFIndex v15 = 0;
  memset(v36, 0, 24);
  float v34 = a2;
  while (CFArrayGetCount(Required) > v15)
  {
    CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(Required, v15);
    InputTranscoder::extractCommonConfiguration((uint64_t)v40, ValueAtIndex, a2, v11, a3);
    InputTranscoder::extractCTCConfiguration((uint64_t)&v46, ValueAtIndex, (uint64_t)v11, (uint64_t)v7, a3);
    if (*((void *)&v36[0] + 1) >= *(void *)&v36[1])
    {
      unint64_t v18 = 0x8E38E38E38E38E39 * ((uint64_t)(*((void *)&v36[0] + 1) - *(void *)&v36[0]) >> 5) + 1;
      if (v18 > 0xE38E38E38E38E3) {
        std::vector<InputTranscoder::InputFeature>::__throw_length_error[abi:ne180100]();
      }
      if (0x1C71C71C71C71C72 * ((uint64_t)(*(void *)&v36[1] - *(void *)&v36[0]) >> 5) > v18) {
        unint64_t v18 = 0x1C71C71C71C71C72 * ((uint64_t)(*(void *)&v36[1] - *(void *)&v36[0]) >> 5);
      }
      if (0x8E38E38E38E38E39 * ((uint64_t)(*(void *)&v36[1] - *(void *)&v36[0]) >> 5) >= 0x71C71C71C71C71) {
        unint64_t v19 = 0xE38E38E38E38E3;
      }
      else {
        unint64_t v19 = v18;
      }
      uint64_t v52 = &v36[1];
      if (v19)
      {
        if (v19 > 0xE38E38E38E38E3) {
          std::__throw_bad_array_new_length[abi:ne180100]();
        }
        uint64_t v20 = (char *)operator new(288 * v19);
      }
      else
      {
        uint64_t v20 = 0;
      }
      float v50 = v20;
      *(void *)uint64_t v51 = &v20[32 * ((uint64_t)(*((void *)&v36[0] + 1) - *(void *)&v36[0]) >> 5)];
      *(void *)&v51[8] = *(void *)v51;
      *(void *)&v51[16] = &v20[288 * v19];
      InputTranscoder::DecoderConfiguration::DecoderConfiguration(*(uint64_t *)v51, (uint64_t)v40);
      uint64_t v21 = 0;
      uint64_t v22 = *(void *)v51;
      *(void *)&v51[8] += 288;
      while (*((void *)&v36[0] + 1) + v21 != *(void *)&v36[0])
      {
        v21 -= 288;
        InputTranscoder::DecoderConfiguration::DecoderConfiguration((InputTranscoder::DecoderConfiguration *)(v21 + v22), (const InputTranscoder::DecoderConfiguration *)(v21 + *((void *)&v36[0] + 1)));
      }
      uint64_t v23 = *(void *)&v36[1];
      uint64_t v35 = *(void *)&v51[8];
      long long v24 = *(_OWORD *)&v51[8];
      long long v25 = v36[0];
      *(void *)&v36[0] = v22 + v21;
      *(_OWORD *)uint64_t v51 = v25;
      *(_OWORD *)((char *)v36 + 8) = v24;
      *(void *)&v51[16] = v23;
      float v50 = (char *)v25;
      std::__split_buffer<InputTranscoder::DecoderConfiguration>::~__split_buffer((uint64_t)&v50);
      uint64_t v17 = v35;
      a2 = v34;
    }
    else
    {
      InputTranscoder::DecoderConfiguration::DecoderConfiguration(*((uint64_t *)&v36[0] + 1), (uint64_t)v40);
      uint64_t v17 = *((void *)&v36[0] + 1) + 288;
    }
    *((void *)&v36[0] + 1) = v17;
    if (v49 < 0) {
      operator delete(__p);
    }
    if (v47 < 0) {
      operator delete(v46);
    }
    if (v45 < 0) {
      operator delete(v44);
    }
    if (v43 < 0) {
      operator delete(v42);
    }
    if (v41 < 0) {
      operator delete(v40[0]);
    }
    ++v15;
  }
  int v26 = InputTranscoder::extract<int,__CFNumber const*>(cf, @"preferredModelType");
  int v27 = v26 == 1;
  if (v26 == 2) {
    int v27 = 2;
  }
  for (uint64_t i = *(const InputTranscoder::DecoderConfiguration **)&v36[0];
        ;
        uint64_t i = (const InputTranscoder::DecoderConfiguration *)((char *)i + 288))
  {
    if (i == *((const InputTranscoder::DecoderConfiguration **)&v36[0] + 1))
    {
      CFNumberRef v29 = __cxa_allocate_exception(0x20uLL);
      std::string::basic_string[abi:ne180100]<0>(v40, "failed to find a suitable configuration");
      nlp::ResourceCreationException::ResourceCreationException(v29, (long long *)v40);
    }
    if (*((_DWORD *)i + 6) == v27) {
      break;
    }
  }
  InputTranscoder::DecoderConfiguration::DecoderConfiguration(a4, i);
  v40[0] = v36;
  std::vector<InputTranscoder::DecoderConfiguration>::__destroy_vector::operator()[abi:ne180100]((void ***)v40);
  CFRelease(cf);
  if (v11) {
    CFRelease(v11);
  }
  CFRelease(v7);
}

void sub_2369F1AB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, const void *a19, const void *a20,const void *a21,void *__p,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a27 < 0)
  {
    operator delete(__p);
    if ((v28 & 1) == 0)
    {
LABEL_6:
      nlp::CFScopedPtr<__CFDictionary const*>::reset(&a19, 0);
      nlp::CFScopedPtr<__CFLocale const*>::reset(&a20, 0);
      nlp::CFScopedPtr<__CFLocale const*>::reset(&a21, 0);
      _Unwind_Resume(a1);
    }
  }
  else if (!v28)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v27);
  goto LABEL_6;
}

void InputTranscoder::generateConfiguration<InputTranscoder::TranscoderConfiguration>(InputTranscoder *this@<X1>, InputTranscoder *a2@<X0>, uint64_t a3@<X2>, InputTranscoder::TranscoderConfiguration *a4@<X8>)
{
  CFLocaleRef v5 = InputTranscoder::copyLocale(this, this);
  CFLocaleRef v56 = v5;
  if (!v5)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    std::string::basic_string[abi:ne180100]<0>(v57, "Malformed options dictionary - missing or invalid locale");
    nlp::ResourceCreationException::ResourceCreationException(exception, v57);
  }
  CFLocaleRef v6 = v5;
  CFStringRef v7 = (const __CFString *)MEMORY[0x237E08530]();
  if (CFStringCompare(v7, @"zh-Hant", 0)) {
    CFStringRef v8 = (__CFBundle *)CFRetain(v6);
  }
  else {
    CFStringRef v8 = CFLocaleCreate(0, @"zh-Hans");
  }
  CFLocaleRef v10 = v8;
  float v55 = v8;
  if (a3 == 1) {
    CFStringRef v11 = @"tap";
  }
  else {
    CFStringRef v11 = &stru_26E9DB590;
  }
  ModelMetastd::string::pointer data = (const __CFDictionary *)InputTranscoder::createModelMetadata(a2, v8, v11, v9);
  CFDictionaryRef v54 = ModelMetadata;
  if (!ModelMetadata)
  {
    float v48 = __cxa_allocate_exception(0x20uLL);
    std::string::basic_string[abi:ne180100]<0>(v57, "Failed to parse metadata file");
    nlp::ResourceCreationException::ResourceCreationException(v48, v57);
  }
  CFDictionaryRef cf = ModelMetadata;
  CFArrayRef Required = (const __CFArray *)InputTranscoder::getRequiredCFType<__CFArray const*>(ModelMetadata, @"models");
  CFIndex v14 = 0;
  memset(v53, 0, 24);
  while (CFArrayGetCount(Required) > v14)
  {
    CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(Required, v14);
    InputTranscoder::extractPath((InputTranscoder *)v77, ValueAtIndex, @"inputTokenIDMapFile", a2, v10, v11);
    InputTranscoder::extractPath((InputTranscoder *)&v75, ValueAtIndex, @"baseLayoutFile", a2, v10, v11);
    CFStringRef v16 = (const __CFString *)InputTranscoder::getRequiredCFType<__CFString const*>(ValueAtIndex, @"keyMatchingPolicy");
    nlp::getUTF8StringFromCFString(v16, &v74);
    CFStringRef v17 = v11;
    CFBooleanRef v18 = (const __CFBoolean *)InputTranscoder::getRequiredCFType<__CFBoolean const*>(ValueAtIndex, @"useNonLetterKeys");
    uint64_t v19 = (uint64_t)v6;
    BOOL v20 = CFBooleanGetValue(v18) != 0;
    CFBooleanRef v21 = (const __CFBoolean *)InputTranscoder::getRequiredCFType<__CFBoolean const*>(ValueAtIndex, @"useInputOneHotInflection");
    BOOL v22 = CFBooleanGetValue(v21) != 0;
    if (CFDictionaryGetValue(ValueAtIndex, @"equivalentFormsWeight"))
    {
      CFNumberRef v23 = (const __CFNumber *)InputTranscoder::getRequiredCFType<__CFNumber const*>(ValueAtIndex, @"equivalentFormsWeight");
      float v24 = InputTranscoder::convert<float>(v23);
    }
    else
    {
      float v24 = 1.0;
    }
    if (CFDictionaryGetValue(ValueAtIndex, @"levenshteinDistanceWeight"))
    {
      CFNumberRef v25 = (const __CFNumber *)InputTranscoder::getRequiredCFType<__CFNumber const*>(ValueAtIndex, @"levenshteinDistanceWeight");
      float v26 = InputTranscoder::convert<float>(v25);
    }
    else
    {
      float v26 = 6.0;
    }
    int v27 = InputTranscoder::extract<int,__CFNumber const*>(ValueAtIndex, @"numIntentKeys");
    InputTranscoder::extractStrings(&v73, ValueAtIndex, @"layouts");
    InputTranscoder::extractStrings(&v72, ValueAtIndex, @"orientations");
    CFNumberRef v28 = (const __CFNumber *)InputTranscoder::getRequiredCFType<__CFNumber const*>(ValueAtIndex, @"geometryScoreScale");
    float v29 = InputTranscoder::convert<float>(v28);
    CFNumberRef v30 = (const __CFNumber *)InputTranscoder::getRequiredCFType<__CFNumber const*>(ValueAtIndex, @"geometryScoreWeight");
    float v31 = InputTranscoder::convert<float>(v30);
    float v32 = 0.7;
    if (CFDictionaryGetValue(ValueAtIndex, @"bigramConfidenceThreshold"))
    {
      CFNumberRef v33 = (const __CFNumber *)InputTranscoder::getRequiredCFType<__CFNumber const*>(ValueAtIndex, @"bigramConfidenceThreshold");
      float v32 = InputTranscoder::convert<float>(v33);
    }
    InputTranscoder::extractCommonConfiguration((uint64_t)v57, ValueAtIndex, a2, v10, a3);
    InputTranscoder::extractCTCConfiguration((uint64_t)&v58, ValueAtIndex, (uint64_t)v10, v19, a3);
    if ((v77[23] & 0x80000000) != 0) {
      std::string::__init_copy_ctor_external(&v59, *(const std::string::value_type **)v77, *(std::string::size_type *)&v77[8]);
    }
    else {
      std::string v59 = *(std::string *)v77;
    }
    if (SHIBYTE(v75.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&v60, v75.__r_.__value_.__l.__data_, v75.__r_.__value_.__l.__size_);
    }
    else {
      std::string v60 = v75;
    }
    if (SHIBYTE(v74.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&v61, v74.__r_.__value_.__l.__data_, v74.__r_.__value_.__l.__size_);
    }
    else {
      std::string v61 = v74;
    }
    BOOL v62 = v20;
    BOOL v63 = v22;
    float v64 = v24;
    float v65 = v26;
    int v66 = v27;
    float v67 = v29;
    float v68 = v31;
    float v69 = v32;
    memset(&v70, 0, sizeof(v70));
    std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v70, (long long *)v73.i64[0], (long long *)v73.i64[1], 0xAAAAAAAAAAAAAAABLL * ((v73.i64[1] - v73.i64[0]) >> 3));
    memset(&v71, 0, sizeof(v71));
    std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v71, (long long *)v72.i64[0], (long long *)v72.i64[1], 0xAAAAAAAAAAAAAAABLL * ((v72.i64[1] - v72.i64[0]) >> 3));
    CFLocaleRef v6 = (const void *)v19;
    unint64_t v76 = &v72;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v76);
    v72.i64[0] = (uint64_t)&v73;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v72);
    if (SHIBYTE(v74.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v74.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v75.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v75.__r_.__value_.__l.__data_);
    }
    if ((v77[23] & 0x80000000) != 0) {
      operator delete(*(void **)v77);
    }
    if (*((void *)&v53[0] + 1) >= *(void *)&v53[1])
    {
      unint64_t v35 = 0x6FB586FB586FB587 * ((uint64_t)(*((void *)&v53[0] + 1) - *(void *)&v53[0]) >> 3) + 1;
      if (v35 > 0x94F2094F2094F2) {
        std::vector<InputTranscoder::InputFeature>::__throw_length_error[abi:ne180100]();
      }
      if (0xDF6B0DF6B0DF6B0ELL * ((uint64_t)(*(void *)&v53[1] - *(void *)&v53[0]) >> 3) > v35) {
        unint64_t v35 = 0xDF6B0DF6B0DF6B0ELL * ((uint64_t)(*(void *)&v53[1] - *(void *)&v53[0]) >> 3);
      }
      if ((unint64_t)(0x6FB586FB586FB587 * ((uint64_t)(*(void *)&v53[1] - *(void *)&v53[0]) >> 3)) >= 0x4A7904A7904A79) {
        unint64_t v36 = 0x94F2094F2094F2;
      }
      else {
        unint64_t v36 = v35;
      }
      unint64_t v78 = &v53[1];
      if (v36)
      {
        if (v36 > 0x94F2094F2094F2) {
          std::__throw_bad_array_new_length[abi:ne180100]();
        }
        CFDictionaryRef v37 = (char *)operator new(440 * v36);
      }
      else
      {
        CFDictionaryRef v37 = 0;
      }
      *(void *)long long v77 = v37;
      *(void *)&v77[8] = &v37[8 * ((uint64_t)(*((void *)&v53[0] + 1) - *(void *)&v53[0]) >> 3)];
      *(void *)&v77[16] = *(void *)&v77[8];
      *(void *)&v77[24] = &v37[440 * v36];
      InputTranscoder::TranscoderConfiguration::TranscoderConfiguration(*(uint64_t *)&v77[8], (uint64_t)v57);
      uint64_t v38 = 0;
      uint64_t v39 = *(void *)&v77[8];
      *(void *)&v77[16] += 440;
      while (*((void *)&v53[0] + 1) + v38 != *(void *)&v53[0])
      {
        v38 -= 440;
        InputTranscoder::TranscoderConfiguration::TranscoderConfiguration((InputTranscoder::TranscoderConfiguration *)(v38 + v39), (const InputTranscoder::TranscoderConfiguration *)(v38 + *((void *)&v53[0] + 1)));
      }
      uint64_t v40 = *(void *)&v53[1];
      uint64_t v51 = *(void *)&v77[16];
      long long v41 = *(_OWORD *)&v77[16];
      long long v42 = v53[0];
      *(void *)&v53[0] = v39 + v38;
      *(_OWORD *)&v77[8] = v42;
      *(_OWORD *)((char *)v53 + 8) = v41;
      *(void *)&v77[24] = v40;
      *(void *)long long v77 = v42;
      std::__split_buffer<InputTranscoder::TranscoderConfiguration>::~__split_buffer((uint64_t)v77);
      uint64_t v34 = v51;
      CFLocaleRef v6 = (const void *)v19;
    }
    else
    {
      InputTranscoder::TranscoderConfiguration::TranscoderConfiguration(*((uint64_t *)&v53[0] + 1), (uint64_t)v57);
      uint64_t v34 = *((void *)&v53[0] + 1) + 440;
    }
    CFStringRef v11 = v17;
    *((void *)&v53[0] + 1) = v34;
    InputTranscoder::TranscoderConfiguration::~TranscoderConfiguration((void **)v57);
    ++v14;
  }
  int v43 = InputTranscoder::extract<int,__CFNumber const*>(cf, @"preferredModelType");
  int v44 = v43 == 1;
  if (v43 == 2) {
    int v44 = 2;
  }
  for (uint64_t i = *(const InputTranscoder::TranscoderConfiguration **)&v53[0];
        ;
        uint64_t i = (const InputTranscoder::TranscoderConfiguration *)((char *)i + 440))
  {
    if (i == *((const InputTranscoder::TranscoderConfiguration **)&v53[0] + 1))
    {
      int v46 = __cxa_allocate_exception(0x20uLL);
      std::string::basic_string[abi:ne180100]<0>(v57, "failed to find a suitable configuration");
      nlp::ResourceCreationException::ResourceCreationException(v46, v57);
    }
    if (*((_DWORD *)i + 6) == v44) {
      break;
    }
  }
  InputTranscoder::TranscoderConfiguration::TranscoderConfiguration(a4, i);
  *(void *)&v57[0] = v53;
  std::vector<InputTranscoder::TranscoderConfiguration>::__destroy_vector::operator()[abi:ne180100]((void ***)v57);
  CFRelease(cf);
  if (v10) {
    CFRelease(v10);
  }
  CFRelease(v6);
}

void sub_2369F239C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,InputTranscoder::CTCConfiguration *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,const void *a27,const void *a28,const void *a29,void *__p,uint64_t a31,int a32,__int16 a33,char a34,char a35)
{
  if (a35 < 0)
  {
    operator delete(__p);
    if ((v36 & 1) == 0)
    {
LABEL_6:
      nlp::CFScopedPtr<__CFDictionary const*>::reset(&a27, 0);
      nlp::CFScopedPtr<__CFLocale const*>::reset(&a28, 0);
      nlp::CFScopedPtr<__CFLocale const*>::reset(&a29, 0);
      _Unwind_Resume(a1);
    }
  }
  else if (!v36)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v35);
  goto LABEL_6;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a2 + 4nlp::CFScopedPtr<__CFURL const*>::reset(&a9, 0) = 0;
  *(void *)(result + 4nlp::CFScopedPtr<__CFURL const*>::reset(&a9, 0) = v2;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void ___ZN15InputTranscoderL12getModelPathEPK14__CFDictionaryP10__CFBundlePK10__CFLocale_block_invoke(uint64_t a1, const __CFURL *a2, int a3, int a4, CFStringRef theString1, unsigned char *a6)
{
  CFStringRef v9 = *(const __CFString **)(a1 + 40);
  if (CFEqual(theString1, (CFStringRef)*MEMORY[0x263F517B0]))
  {
    CFStringRef PathComponent = CFURLCopyLastPathComponent(a2);
    CFStringRef v11 = PathComponent;
    if (v9) {
      CFStringRef v12 = v9;
    }
    else {
      CFStringRef v12 = @"ctc.dat";
    }
    CFComparisonResult v13 = CFStringCompare(PathComponent, v12, 0);
    if (v11) {
      CFRelease(v11);
    }
    if (v13 == kCFCompareEqualTo)
    {
      nlp::CFScopedPtr<__CFURL const*>::acquire((const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
      if (a6) {
        *a6 = 1;
      }
    }
  }
}

void sub_2369F26E8(_Unwind_Exception *exception_object)
{
  if (v1) {
    CFRelease(v1);
  }
  _Unwind_Resume(exception_object);
}

const void *InputTranscoder::getRequiredCFType<__CFArray const*>(const __CFDictionary *a1, const __CFString *a2)
{
  int Value = CFDictionaryGetValue(a1, a2);
  if (!Value)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    std::string::basic_string[abi:ne180100]<0>(v9, "Malformed dictionary: missing key=");
    InputTranscoder::makeDictionaryErrorMessage(a2, (uint64_t)v9, &v10);
    nlp::ResourceCreationException::ResourceCreationException(exception, (long long *)&v10);
  }
  CFTypeRef v4 = Value;
  CFTypeID v5 = CFGetTypeID(Value);
  if (v5 != CFArrayGetTypeID())
  {
    CFStringRef v8 = __cxa_allocate_exception(0x20uLL);
    std::string::basic_string[abi:ne180100]<0>(v9, "Malformed dictionary: invalid type for key=");
    InputTranscoder::makeDictionaryErrorMessage(a2, (uint64_t)v9, &v10);
    nlp::ResourceCreationException::ResourceCreationException(v8, (long long *)&v10);
  }
  return v4;
}

void sub_2369F2820(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  if (a14 < 0) {
    operator delete(a9);
  }
  if (v21) {
    __cxa_free_exception(v20);
  }
  _Unwind_Resume(exception_object);
}

void std::__split_buffer<std::string>::~__split_buffer(std::__split_buffer<std::string> *this)
{
  std::__split_buffer<std::string>::pointer begin = this->__begin_;
  std::__split_buffer<std::string>::pointer end = this->__end_;
  if (end != begin)
  {
    do
    {
      std::__split_buffer<std::string>::pointer v4 = end - 1;
      this->__end_ = end - 1;
      if (SHIBYTE(end[-1].__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(v4->__r_.__value_.__l.__data_);
        std::__split_buffer<std::string>::pointer v4 = this->__end_;
      }
      std::__split_buffer<std::string>::pointer end = v4;
    }
    while (v4 != begin);
  }
  if (this->__first_) {
    operator delete(this->__first_);
  }
}

const void *InputTranscoder::getRequiredCFType<__CFNumber const*>(const __CFDictionary *a1, const __CFString *a2)
{
  int Value = CFDictionaryGetValue(a1, a2);
  if (!Value)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    std::string::basic_string[abi:ne180100]<0>(v9, "Malformed dictionary: missing key=");
    InputTranscoder::makeDictionaryErrorMessage(a2, (uint64_t)v9, &v10);
    nlp::ResourceCreationException::ResourceCreationException(exception, (long long *)&v10);
  }
  std::__split_buffer<std::string>::pointer v4 = Value;
  CFTypeID v5 = CFGetTypeID(Value);
  if (v5 != CFNumberGetTypeID())
  {
    CFStringRef v8 = __cxa_allocate_exception(0x20uLL);
    std::string::basic_string[abi:ne180100]<0>(v9, "Malformed dictionary: invalid type for key=");
    InputTranscoder::makeDictionaryErrorMessage(a2, (uint64_t)v9, &v10);
    nlp::ResourceCreationException::ResourceCreationException(v8, (long long *)&v10);
  }
  return v4;
}

void sub_2369F2A04(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  if (a14 < 0) {
    operator delete(a9);
  }
  if (v21) {
    __cxa_free_exception(v20);
  }
  _Unwind_Resume(exception_object);
}

const void *InputTranscoder::getRequiredCFType<__CFBoolean const*>(const __CFDictionary *a1, const __CFString *a2)
{
  int Value = CFDictionaryGetValue(a1, a2);
  if (!Value)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    std::string::basic_string[abi:ne180100]<0>(v9, "Malformed dictionary: missing key=");
    InputTranscoder::makeDictionaryErrorMessage(a2, (uint64_t)v9, &v10);
    nlp::ResourceCreationException::ResourceCreationException(exception, (long long *)&v10);
  }
  std::__split_buffer<std::string>::pointer v4 = Value;
  CFTypeID v5 = CFGetTypeID(Value);
  if (v5 != CFBooleanGetTypeID())
  {
    CFStringRef v8 = __cxa_allocate_exception(0x20uLL);
    std::string::basic_string[abi:ne180100]<0>(v9, "Malformed dictionary: invalid type for key=");
    InputTranscoder::makeDictionaryErrorMessage(a2, (uint64_t)v9, &v10);
    nlp::ResourceCreationException::ResourceCreationException(v8, (long long *)&v10);
  }
  return v4;
}

void sub_2369F2B84(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  if (a14 < 0) {
    operator delete(a9);
  }
  if (v21) {
    __cxa_free_exception(v20);
  }
  _Unwind_Resume(exception_object);
}

float InputTranscoder::convert<float>(const __CFNumber *a1)
{
  float valuePtr = 0.0;
  int Value = CFNumberGetValue(a1, kCFNumberFloatType, &valuePtr);
  float result = valuePtr;
  if (!Value && valuePtr == 0.0)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    std::string::basic_string[abi:ne180100]<0>(&v4, "Failed to parse CFNumber as kCFNumberFloatType");
    nlp::ResourceCreationException::ResourceCreationException(exception, &v4);
  }
  return result;
}

void sub_2369F2C88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
  {
    operator delete(__p);
    if ((v15 & 1) == 0) {
LABEL_6:
    }
      _Unwind_Resume(a1);
  }
  else if (!v15)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v14);
  goto LABEL_6;
}

InputTranscoder::DecoderConfiguration *InputTranscoder::DecoderConfiguration::DecoderConfiguration(InputTranscoder::DecoderConfiguration *this, const InputTranscoder::DecoderConfiguration *a2)
{
  long long v4 = InputTranscoder::CommonConfiguration::CommonConfiguration((std::string *)this, a2);
  if (*((char *)a2 + 127) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)((char *)v4 + 104), *((const std::string::value_type **)a2 + 13), *((void *)a2 + 14));
  }
  else
  {
    long long v5 = *(_OWORD *)((char *)a2 + 104);
    v4[5].__r_.__value_.__r.__words[0] = *((void *)a2 + 15);
    *(_OWORD *)&v4[4].__r_.__value_.__r.__words[1] = v5;
  }
  CFLocaleRef v6 = (std::string *)((char *)this + 128);
  if (*((char *)a2 + 151) < 0)
  {
    std::string::__init_copy_ctor_external(v6, *((const std::string::value_type **)a2 + 16), *((void *)a2 + 17));
  }
  else
  {
    long long v7 = *((_OWORD *)a2 + 8);
    *((void *)this + 18) = *((void *)a2 + 18);
    *(_OWORD *)&v6->__r_.__value_.__l.__data_ = v7;
  }
  *(_OWORD *)((char *)this + 152) = *(_OWORD *)((char *)a2 + 152);
  long long v8 = *(_OWORD *)((char *)a2 + 168);
  long long v9 = *(_OWORD *)((char *)a2 + 184);
  long long v10 = *(_OWORD *)((char *)a2 + 200);
  *(_OWORD *)((char *)this + 216) = *(_OWORD *)((char *)a2 + 216);
  *(_OWORD *)((char *)this + 20nlp::CFScopedPtr<__CFURL const*>::reset(&a9, 0) = v10;
  *(_OWORD *)((char *)this + 184) = v9;
  *(_OWORD *)((char *)this + 168) = v8;
  long long v11 = *(_OWORD *)((char *)a2 + 232);
  long long v12 = *(_OWORD *)((char *)a2 + 248);
  long long v13 = *(_OWORD *)((char *)a2 + 264);
  *((_DWORD *)this + 7nlp::CFScopedPtr<__CFURL const*>::reset(&a9, 0) = *((_DWORD *)a2 + 70);
  *(_OWORD *)((char *)this + 264) = v13;
  *(_OWORD *)((char *)this + 248) = v12;
  *(_OWORD *)((char *)this + 232) = v11;
  return this;
}

void sub_2369F2DA0(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 127) < 0) {
    operator delete(*v2);
  }
  if (*(char *)(v1 + 79) < 0) {
    operator delete(*(void **)(v1 + 56));
  }
  if (*(char *)(v1 + 55) < 0) {
    operator delete(*(void **)(v1 + 32));
  }
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t InputTranscoder::DecoderConfiguration::DecoderConfiguration(uint64_t a1, uint64_t a2)
{
  long long v4 = InputTranscoder::CommonConfiguration::CommonConfiguration((std::string *)a1, (const InputTranscoder::CommonConfiguration *)a2);
  if (*(char *)(a2 + 127) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)((char *)v4 + 104), *(const std::string::value_type **)(a2 + 104), *(void *)(a2 + 112));
  }
  else
  {
    long long v5 = *(_OWORD *)(a2 + 104);
    v4[5].__r_.__value_.__r.__words[0] = *(void *)(a2 + 120);
    *(_OWORD *)&v4[4].__r_.__value_.__r.__words[1] = v5;
  }
  CFLocaleRef v6 = (std::string *)(a1 + 128);
  if (*(char *)(a2 + 151) < 0)
  {
    std::string::__init_copy_ctor_external(v6, *(const std::string::value_type **)(a2 + 128), *(void *)(a2 + 136));
  }
  else
  {
    long long v7 = *(_OWORD *)(a2 + 128);
    *(void *)(a1 + 144) = *(void *)(a2 + 144);
    *(_OWORD *)&v6->__r_.__value_.__l.__data_ = v7;
  }
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  long long v8 = *(_OWORD *)(a2 + 168);
  long long v9 = *(_OWORD *)(a2 + 184);
  long long v10 = *(_OWORD *)(a2 + 200);
  *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 216);
  *(_OWORD *)(a1 + 20nlp::CFScopedPtr<__CFURL const*>::reset(&a9, 0) = v10;
  *(_OWORD *)(a1 + 184) = v9;
  *(_OWORD *)(a1 + 168) = v8;
  long long v11 = *(_OWORD *)(a2 + 232);
  long long v12 = *(_OWORD *)(a2 + 248);
  long long v13 = *(_OWORD *)(a2 + 264);
  *(_DWORD *)(a1 + 28nlp::CFScopedPtr<__CFURL const*>::reset(&a9, 0) = *(_DWORD *)(a2 + 280);
  *(_OWORD *)(a1 + 264) = v13;
  *(_OWORD *)(a1 + 248) = v12;
  *(_OWORD *)(a1 + 232) = v11;
  return a1;
}

void sub_2369F2ED4(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 127) < 0) {
    operator delete(*v2);
  }
  if (*(char *)(v1 + 79) < 0) {
    operator delete(*(void **)(v1 + 56));
  }
  if (*(char *)(v1 + 55) < 0) {
    operator delete(*(void **)(v1 + 32));
  }
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void std::__destroy_at[abi:ne180100]<InputTranscoder::DecoderConfiguration,0>(uint64_t a1)
{
  if (*(char *)(a1 + 151) < 0) {
    operator delete(*(void **)(a1 + 128));
  }
  if (*(char *)(a1 + 127) < 0) {
    operator delete(*(void **)(a1 + 104));
  }
  if (*(char *)(a1 + 79) < 0) {
    operator delete(*(void **)(a1 + 56));
  }
  if (*(char *)(a1 + 55) < 0) {
    operator delete(*(void **)(a1 + 32));
  }
  if (*(char *)(a1 + 23) < 0)
  {
    uint64_t v2 = *(void **)a1;
    operator delete(v2);
  }
}

uint64_t std::__split_buffer<InputTranscoder::DecoderConfiguration>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 288;
    std::__destroy_at[abi:ne180100]<InputTranscoder::DecoderConfiguration,0>(i - 288);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::vector<InputTranscoder::DecoderConfiguration>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    long long v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 288;
        std::__destroy_at[abi:ne180100]<InputTranscoder::DecoderConfiguration,0>(v4);
      }
      while ((void *)v4 != v2);
      long long v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t InputTranscoder::TranscoderConfiguration::TranscoderConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = InputTranscoder::CommonConfiguration::CommonConfiguration((std::string *)a1, (const InputTranscoder::CommonConfiguration *)a2);
  if (*(char *)(a2 + 127) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)((char *)v4 + 104), *(const std::string::value_type **)(a2 + 104), *(void *)(a2 + 112));
  }
  else
  {
    long long v5 = *(_OWORD *)(a2 + 104);
    v4[5].__r_.__value_.__r.__words[0] = *(void *)(a2 + 120);
    *(_OWORD *)&v4[4].__r_.__value_.__r.__words[1] = v5;
  }
  CFLocaleRef v6 = (std::string *)(a1 + 128);
  if (*(char *)(a2 + 151) < 0)
  {
    std::string::__init_copy_ctor_external(v6, *(const std::string::value_type **)(a2 + 128), *(void *)(a2 + 136));
  }
  else
  {
    long long v7 = *(_OWORD *)(a2 + 128);
    *(void *)(a1 + 144) = *(void *)(a2 + 144);
    *(_OWORD *)&v6->__r_.__value_.__l.__data_ = v7;
  }
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  long long v8 = *(_OWORD *)(a2 + 168);
  long long v9 = *(_OWORD *)(a2 + 184);
  long long v10 = *(_OWORD *)(a2 + 200);
  *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 216);
  *(_OWORD *)(a1 + 20nlp::CFScopedPtr<__CFURL const*>::reset(&a9, 0) = v10;
  *(_OWORD *)(a1 + 184) = v9;
  *(_OWORD *)(a1 + 168) = v8;
  long long v11 = *(_OWORD *)(a2 + 232);
  long long v12 = *(_OWORD *)(a2 + 248);
  long long v13 = *(_OWORD *)(a2 + 264);
  *(_DWORD *)(a1 + 28nlp::CFScopedPtr<__CFURL const*>::reset(&a9, 0) = *(_DWORD *)(a2 + 280);
  *(_OWORD *)(a1 + 264) = v13;
  *(_OWORD *)(a1 + 248) = v12;
  *(_OWORD *)(a1 + 232) = v11;
  if (*(char *)(a2 + 311) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)(a1 + 288), *(const std::string::value_type **)(a2 + 288), *(void *)(a2 + 296));
  }
  else
  {
    long long v14 = *(_OWORD *)(a2 + 288);
    *(void *)(a1 + 304) = *(void *)(a2 + 304);
    *(_OWORD *)(a1 + 288) = v14;
  }
  if (*(char *)(a2 + 335) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)(a1 + 312), *(const std::string::value_type **)(a2 + 312), *(void *)(a2 + 320));
  }
  else
  {
    long long v15 = *(_OWORD *)(a2 + 312);
    *(void *)(a1 + 328) = *(void *)(a2 + 328);
    *(_OWORD *)(a1 + 312) = v15;
  }
  if (*(char *)(a2 + 359) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)(a1 + 336), *(const std::string::value_type **)(a2 + 336), *(void *)(a2 + 344));
  }
  else
  {
    long long v16 = *(_OWORD *)(a2 + 336);
    *(void *)(a1 + 352) = *(void *)(a2 + 352);
    *(_OWORD *)(a1 + 336) = v16;
  }
  long long v17 = *(_OWORD *)(a2 + 360);
  *(_OWORD *)(a1 + 372) = *(_OWORD *)(a2 + 372);
  *(_OWORD *)(a1 + 36nlp::CFScopedPtr<__CFURL const*>::reset(&a9, 0) = v17;
  *(void *)(a1 + 40nlp::CFScopedPtr<__CFURL const*>::reset(&a9, 0) = 0;
  *(void *)(a1 + 408) = 0;
  *(void *)(a1 + 392) = 0;
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>((std::string *)(a1 + 392), *(long long **)(a2 + 392), *(long long **)(a2 + 400), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a2 + 400) - *(void *)(a2 + 392)) >> 3));
  *(void *)(a1 + 416) = 0;
  *(void *)(a1 + 424) = 0;
  *(void *)(a1 + 432) = 0;
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>((std::string *)(a1 + 416), *(long long **)(a2 + 416), *(long long **)(a2 + 424), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a2 + 424) - *(void *)(a2 + 416)) >> 3));
  return a1;
}

void sub_2369F3270(_Unwind_Exception *a1)
{
  if (*(char *)(v1 + 335) < 0) {
    operator delete(*v4);
  }
  if (*(char *)(v1 + 311) < 0) {
    operator delete(*v3);
  }
  InputTranscoder::CTCConfiguration::~CTCConfiguration(v2);
  InputTranscoder::CommonConfiguration::~CommonConfiguration((void **)v1);
  _Unwind_Resume(a1);
}

uint64_t std::__split_buffer<InputTranscoder::TranscoderConfiguration>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 440;
    InputTranscoder::TranscoderConfiguration::~TranscoderConfiguration((void **)(i - 440));
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::vector<InputTranscoder::TranscoderConfiguration>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (void **)**a1;
  if (v2)
  {
    uint64_t v4 = (void **)v1[1];
    long long v5 = v2;
    if (v4 != v2)
    {
      do
        InputTranscoder::TranscoderConfiguration::~TranscoderConfiguration(v4 - 55);
      while (v4 != v2);
      long long v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t InputTranscoder::PlistBiMap<unsigned int,unsigned int>::PlistBiMap(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_26E9DAF38;
  *(_OWORD *)(a1 + 16) = 0u;
  uint64_t v3 = (float *)(a1 + 16);
  *(_OWORD *)(a1 + 32) = 0u;
  *(_DWORD *)(a1 + 48) = 1065353216;
  *(_OWORD *)(a1 + 56) = 0u;
  uint64_t v4 = (float *)(a1 + 56);
  *(_OWORD *)(a1 + 72) = 0u;
  *(_DWORD *)(a1 + 88) = 1065353216;
  Dictionary = (InputTranscoder *)InputTranscoder::createDictionary(a2);
  uint64_t v34 = Dictionary;
  InputTranscoder::validateVersion(Dictionary, v6);
  CFStringRef Required = (const __CFString *)InputTranscoder::getRequiredCFType<__CFString const*>(Dictionary, @"keyType");
  nlp::getUTF8StringFromCFString(Required, &v41);
  CFStringRef v8 = (const __CFString *)InputTranscoder::getRequiredCFType<__CFString const*>(Dictionary, @"valueType");
  nlp::getUTF8StringFromCFString(v8, &__p);
  if (!InputTranscoder::typeMatches<unsigned int>((uint64_t)&v41))
  {
    exception = __cxa_allocate_exception(0x20uLL);
    std::operator+<char>();
    CFNumberRef v28 = std::string::append(&v35, "\"", 1uLL);
    long long v29 = *(_OWORD *)&v28->__r_.__value_.__l.__data_;
    std::string::size_type v37 = v28->__r_.__value_.__r.__words[2];
    *(_OWORD *)values = v29;
    v28->__r_.__value_.__l.__size_ = 0;
    v28->__r_.__value_.__r.__words[2] = 0;
    v28->__r_.__value_.__r.__words[0] = 0;
    nlp::ResourceCreationException::ResourceCreationException(exception, (long long *)values);
  }
  if (!InputTranscoder::typeMatches<unsigned int>((uint64_t)&__p))
  {
    CFNumberRef v30 = __cxa_allocate_exception(0x20uLL);
    std::operator+<char>();
    float v31 = std::string::append(&v35, "\"", 1uLL);
    long long v32 = *(_OWORD *)&v31->__r_.__value_.__l.__data_;
    std::string::size_type v37 = v31->__r_.__value_.__r.__words[2];
    *(_OWORD *)values = v32;
    v31->__r_.__value_.__l.__size_ = 0;
    v31->__r_.__value_.__r.__words[2] = 0;
    v31->__r_.__value_.__r.__words[0] = 0;
    nlp::ResourceCreationException::ResourceCreationException(v30, (long long *)values);
  }
  if (v40 < 0) {
    operator delete(__p);
  }
  if (SHIBYTE(v41.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v41.__r_.__value_.__l.__data_);
  }
  CFStringRef v9 = (const __CFString *)InputTranscoder::getRequiredCFType<__CFString const*>(Dictionary, @"unknownKey");
  nlp::getUTF8StringFromCFString(v9, &v41);
  int v10 = InputTranscoder::convertToInteger<unsigned int>(&v41);
  if (SHIBYTE(v41.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v41.__r_.__value_.__l.__data_);
  }
  *(_DWORD *)(a1 + 8) = v10;
  CFStringRef v11 = (const __CFString *)InputTranscoder::getRequiredCFType<__CFString const*>(Dictionary, @"unknownValue");
  nlp::getUTF8StringFromCFString(v11, &v41);
  int v12 = InputTranscoder::convertToInteger<unsigned int>(&v41);
  if (SHIBYTE(v41.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v41.__r_.__value_.__l.__data_);
  }
  *(_DWORD *)(a1 + 12) = v12;
  CFDictionaryRef v13 = (const __CFDictionary *)InputTranscoder::getRequiredCFType<__CFDictionary const*>(Dictionary, @"mapping");
  CFIndex Count = CFDictionaryGetCount(v13);
  std::vector<void const*>::vector(&__p, Count);
  CFIndex v15 = CFDictionaryGetCount(v13);
  std::vector<void const*>::vector(values, v15);
  CFDictionaryGetKeysAndValues(v13, (const void **)__p, (const void **)values[0]);
  long long v16 = v39;
  if (v39 != __p)
  {
    unint64_t v17 = 0;
    long long v16 = __p;
    do
    {
      CFStringRef v18 = (const __CFString *)v16[v17];
      CFTypeID v19 = CFGetTypeID(v18);
      if (v19 != CFStringGetTypeID()) {
        CFStringRef v18 = 0;
      }
      CFStringRef v20 = (const __CFString *)values[0][v17];
      CFTypeID v21 = CFGetTypeID(v20);
      if (v21 != CFStringGetTypeID()) {
        CFStringRef v20 = 0;
      }
      if (v18) {
        BOOL v22 = v20 == 0;
      }
      else {
        BOOL v22 = 1;
      }
      if (v22)
      {
        float v26 = __cxa_allocate_exception(0x20uLL);
        std::string::basic_string[abi:ne180100]<0>(&v41, "Malformed plist: incorrect types for mapping dictionary");
        nlp::ResourceCreationException::ResourceCreationException(v26, (long long *)&v41);
      }
      nlp::getUTF8StringFromCFString(v18, &v41);
      unsigned int v23 = InputTranscoder::convertToInteger<unsigned int>(&v41);
      if (SHIBYTE(v41.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v41.__r_.__value_.__l.__data_);
      }
      LODWORD(v35.__r_.__value_.__l.__data_) = v23;
      nlp::getUTF8StringFromCFString(v20, &v41);
      unsigned int v24 = InputTranscoder::convertToInteger<unsigned int>(&v41);
      if (SHIBYTE(v41.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v41.__r_.__value_.__l.__data_);
      }
      unsigned int v33 = v24;
      *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v3, v23, &v35)+ 5) = v24;
      *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v4, v24, &v33)+ 5) = v23;
      ++v17;
      long long v16 = __p;
    }
    while (v17 < ((char *)v39 - (unsigned char *)__p) >> 3);
  }
  if (values[0])
  {
    values[1] = values[0];
    operator delete(values[0]);
    long long v16 = __p;
  }
  if (v16)
  {
    uint64_t v39 = v16;
    operator delete(v16);
    Dictionary = v34;
  }
  if (Dictionary) {
    CFRelease(Dictionary);
  }
  return a1;
}

void sub_2369F3818(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, const void *a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  if (a23 < 0) {
    operator delete(__p);
  }
  if (a17 < 0) {
    operator delete(a12);
  }
  if (v33) {
    __cxa_free_exception(v32);
  }
  if (a30 < 0) {
    operator delete(a25);
  }
  if (*(char *)(v34 - 65) < 0) {
    operator delete(*(void **)(v34 - 88));
  }
  nlp::CFScopedPtr<__CFDictionary const*>::reset(&a11, 0);
  std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::~__hash_table(v31);
  std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::~__hash_table(v30);
  _Unwind_Resume(a1);
}

CFPropertyListRef InputTranscoder::createDictionary(uint64_t a1)
{
  int v1 = *(char *)(a1 + 23);
  if (v1 >= 0) {
    uint64_t v2 = (const UInt8 *)a1;
  }
  else {
    uint64_t v2 = *(const UInt8 **)a1;
  }
  if (v1 >= 0) {
    CFIndex v3 = *(unsigned __int8 *)(a1 + 23);
  }
  else {
    CFIndex v3 = *(void *)(a1 + 8);
  }
  uint64_t v4 = CFURLCreateFromFileSystemRepresentation((CFAllocatorRef)*MEMORY[0x263EFFB08], v2, v3, 0);
  long long v14 = v4;
  if (!v4)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    std::operator+<char>();
    nlp::ResourceCreationException::ResourceCreationException(exception, &v13);
  }
  long long v7 = v4;
  CFErrorRef err = 0;
  CFPropertyListRef v8 = nlp::createDictionaryWithContentsOfURL(v4, &err, v5, v6);
  if (!v8)
  {
    CFStringRef v11 = __cxa_allocate_exception(0x20uLL);
    std::string::basic_string[abi:ne180100]<0>(&v13, "Failed to create dictionary");
    nlp::ResourceCreationException::ResourceCreationException((uint64_t)v11, (const void **)&v13, err);
  }
  CFRelease(v7);
  return v8;
}

void sub_2369F3AB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, const void *a17)
{
  if (a16 < 0)
  {
    operator delete(__p);
    if ((v18 & 1) == 0)
    {
LABEL_6:
      nlp::CFScopedPtr<__CFError *>::reset((const void **)&a9, 0);
      nlp::CFScopedPtr<__CFURL const*>::reset(&a17, 0);
      _Unwind_Resume(a1);
    }
  }
  else if (!v18)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v17);
  goto LABEL_6;
}

uint64_t InputTranscoder::validateVersion(InputTranscoder *this, const __CFDictionary *a2)
{
  uint64_t result = InputTranscoder::extract<unsigned int,__CFNumber const*>(this, @"version");
  if (result != 1)
  {
    unsigned int v3 = result;
    exception = __cxa_allocate_exception(0x20uLL);
    std::to_string(&v5, v3);
    std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>("Cannot parse dictionary with incompatible version=", &v5, &v6);
    nlp::ResourceCreationException::ResourceCreationException(exception, (long long *)&v6);
  }
  return result;
}

void sub_2369F3BE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  if (a14 < 0)
  {
    operator delete(a9);
    if ((v21 & 1) == 0) {
LABEL_8:
    }
      _Unwind_Resume(a1);
  }
  else if (!v21)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v20);
  goto LABEL_8;
}

uint64_t InputTranscoder::PlistBiMap<unsigned int,unsigned int>::unknownKey(uint64_t a1)
{
  return a1 + 8;
}

uint64_t InputTranscoder::PlistBiMap<unsigned int,unsigned int>::unknownValue(uint64_t a1)
{
  return a1 + 12;
}

char *InputTranscoder::PlistBiMap<unsigned int,unsigned int>::operator[](uint64_t a1, unsigned int *a2)
{
  unsigned int v3 = std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::find<unsigned int>((void *)(a1 + 16), *a2);
  if (v3) {
    return (char *)v3 + 20;
  }
  else {
    return (char *)(a1 + 12);
  }
}

char *InputTranscoder::PlistBiMap<unsigned int,unsigned int>::reverseMap(uint64_t a1, unsigned int *a2)
{
  unsigned int v3 = std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::find<unsigned int>((void *)(a1 + 56), *a2);
  if (v3) {
    return (char *)v3 + 20;
  }
  else {
    return (char *)(a1 + 8);
  }
}

uint64_t InputTranscoder::PlistBiMap<unsigned int,std::string>::PlistBiMap(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)(a1 + 16) = 0u;
  unsigned int v3 = (void **)(a1 + 16);
  *(void *)a1 = &unk_26E9DAF78;
  uint64_t v4 = (uint64_t *)(a1 + 40);
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(void *)(a1 + 64) = 0;
  *(_DWORD *)(a1 + 72) = 1065353216;
  *(_OWORD *)(a1 + 8nlp::CFScopedPtr<__CFURL const*>::reset(&a9, 0) = 0u;
  std::string v5 = (uint64_t *)(a1 + 80);
  *(_OWORD *)(a1 + 96) = 0u;
  *(_DWORD *)(a1 + 112) = 1065353216;
  Dictionary = (InputTranscoder *)InputTranscoder::createDictionary(a2);
  uint64_t v34 = Dictionary;
  InputTranscoder::validateVersion(Dictionary, v7);
  CFStringRef Required = (const __CFString *)InputTranscoder::getRequiredCFType<__CFString const*>(Dictionary, @"keyType");
  nlp::getUTF8StringFromCFString(Required, &__str);
  CFStringRef v9 = (const __CFString *)InputTranscoder::getRequiredCFType<__CFString const*>(Dictionary, @"valueType");
  nlp::getUTF8StringFromCFString(v9, &__p);
  if (!InputTranscoder::typeMatches<unsigned int>((uint64_t)&__str))
  {
    exception = __cxa_allocate_exception(0x20uLL);
    std::operator+<char>();
    CFNumberRef v28 = std::string::append(&v35, "\"", 1uLL);
    long long v29 = *(_OWORD *)&v28->__r_.__value_.__l.__data_;
    std::string::size_type v37 = v28->__r_.__value_.__r.__words[2];
    *(_OWORD *)values = v29;
    v28->__r_.__value_.__l.__size_ = 0;
    v28->__r_.__value_.__r.__words[2] = 0;
    v28->__r_.__value_.__r.__words[0] = 0;
    nlp::ResourceCreationException::ResourceCreationException(exception, (long long *)values);
  }
  if (!InputTranscoder::typeMatches<std::string>((uint64_t *)&__p))
  {
    uint64_t v30 = __cxa_allocate_exception(0x20uLL);
    std::operator+<char>();
    uint64_t v31 = std::string::append(&v35, "\"", 1uLL);
    long long v32 = *(_OWORD *)&v31->__r_.__value_.__l.__data_;
    std::string::size_type v37 = v31->__r_.__value_.__r.__words[2];
    *(_OWORD *)values = v32;
    v31->__r_.__value_.__l.__size_ = 0;
    v31->__r_.__value_.__r.__words[2] = 0;
    v31->__r_.__value_.__r.__words[0] = 0;
    nlp::ResourceCreationException::ResourceCreationException(v30, (long long *)values);
  }
  if (v40 < 0) {
    operator delete(__p);
  }
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
  CFStringRef v10 = (const __CFString *)InputTranscoder::getRequiredCFType<__CFString const*>(Dictionary, @"unknownKey");
  nlp::getUTF8StringFromCFString(v10, &__str);
  int v11 = InputTranscoder::convertToInteger<unsigned int>(&__str);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
  *(_DWORD *)(a1 + 8) = v11;
  CFStringRef v12 = (const __CFString *)InputTranscoder::getRequiredCFType<__CFString const*>(Dictionary, @"unknownValue");
  nlp::getUTF8StringFromCFString(v12, &__str);
  if (*(char *)(a1 + 39) < 0) {
    operator delete(*v3);
  }
  *(std::string *)unsigned int v3 = __str;
  CFDictionaryRef v13 = (const __CFDictionary *)InputTranscoder::getRequiredCFType<__CFDictionary const*>(Dictionary, @"mapping");
  CFIndex Count = CFDictionaryGetCount(v13);
  std::vector<void const*>::vector(&__p, Count);
  CFIndex v15 = CFDictionaryGetCount(v13);
  std::vector<void const*>::vector(values, v15);
  CFDictionaryGetKeysAndValues(v13, (const void **)__p, (const void **)values[0]);
  long long v16 = v39;
  if (v39 != __p)
  {
    unint64_t v17 = 0;
    long long v16 = __p;
    do
    {
      CFStringRef v18 = (const __CFString *)v16[v17];
      CFTypeID v19 = CFGetTypeID(v18);
      if (v19 != CFStringGetTypeID()) {
        CFStringRef v18 = 0;
      }
      CFStringRef v20 = (const __CFString *)values[0][v17];
      CFTypeID v21 = CFGetTypeID(v20);
      if (v21 != CFStringGetTypeID()) {
        CFStringRef v20 = 0;
      }
      if (v18) {
        BOOL v22 = v20 == 0;
      }
      else {
        BOOL v22 = 1;
      }
      if (v22)
      {
        float v26 = __cxa_allocate_exception(0x20uLL);
        std::string::basic_string[abi:ne180100]<0>(&__str, "Malformed plist: incorrect types for mapping dictionary");
        nlp::ResourceCreationException::ResourceCreationException(v26, (long long *)&__str);
      }
      nlp::getUTF8StringFromCFString(v18, &__str);
      unsigned int v23 = InputTranscoder::convertToInteger<unsigned int>(&__str);
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__str.__r_.__value_.__l.__data_);
      }
      unsigned int v33 = v23;
      nlp::getUTF8StringFromCFString(v20, &__str);
      unsigned int v24 = (std::string *)std::__hash_table<std::__hash_value_type<unsigned int,std::string>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::string>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::string>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::string>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v4, v23, &v33);
      std::string::operator=(v24 + 1, &__str);
      v35.__r_.__value_.__r.__words[0] = (std::string::size_type)&__str;
      *((_DWORD *)std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v5, (unsigned __int8 *)&__str, (long long **)&v35)+ 1nlp::CFScopedPtr<__CFURL const*>::reset(&a9, 0) = v23;
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__str.__r_.__value_.__l.__data_);
      }
      ++v17;
      long long v16 = __p;
    }
    while (v17 < ((char *)v39 - (unsigned char *)__p) >> 3);
  }
  if (values[0])
  {
    values[1] = values[0];
    operator delete(values[0]);
    long long v16 = __p;
  }
  if (v16)
  {
    uint64_t v39 = v16;
    operator delete(v16);
    Dictionary = v34;
  }
  if (Dictionary) {
    CFRelease(Dictionary);
  }
  return a1;
}

void sub_2369F411C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, const void *a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,void *a31,uint64_t a32,int a33,__int16 a34,char a35,char a36)
{
  if (a23 < 0) {
    operator delete(__p);
  }
  if (a17 < 0) {
    operator delete(a12);
  }
  if (v40) {
    __cxa_free_exception(v39);
  }
  if (a30 < 0) {
    operator delete(a25);
  }
  if (a36 < 0) {
    operator delete(a31);
  }
  nlp::CFScopedPtr<__CFDictionary const*>::reset(&a11, 0);
  std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::~__hash_table(v38);
  std::__hash_table<std::__hash_value_type<unsigned int,std::string>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::string>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::string>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::string>>>::~__hash_table(v37);
  if (*(char *)(v36 + 39) < 0) {
    operator delete(*v41);
  }
  _Unwind_Resume(a1);
}

uint64_t InputTranscoder::PlistBiMap<unsigned int,std::string>::unknownKey(uint64_t a1)
{
  return a1 + 8;
}

uint64_t InputTranscoder::PlistBiMap<unsigned int,std::string>::unknownValue(uint64_t a1)
{
  return a1 + 16;
}

uint64_t *InputTranscoder::PlistBiMap<unsigned int,std::string>::operator[](uint64_t a1, unsigned int *a2)
{
  unsigned int v3 = std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::find<unsigned int>((void *)(a1 + 40), *a2);
  if (v3) {
    return v3 + 3;
  }
  else {
    return (uint64_t *)(a1 + 16);
  }
}

unsigned __int8 *InputTranscoder::PlistBiMap<unsigned int,std::string>::reverseMap(uint64_t a1, unsigned __int8 *a2)
{
  unsigned int v3 = std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::find<std::string>((void *)(a1 + 80), a2);
  if (v3) {
    return v3 + 40;
  }
  else {
    return (unsigned __int8 *)(a1 + 8);
  }
}

uint64_t InputTranscoder::PlistBiMap<std::string,unsigned int>::PlistBiMap(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_26E9DAFB8;
  *(void *)(a1 + 8) = 0;
  unsigned int v3 = (void **)(a1 + 8);
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(_OWORD *)(a1 + 4nlp::CFScopedPtr<__CFURL const*>::reset(&a9, 0) = 0u;
  uint64_t v4 = (uint64_t *)(a1 + 40);
  *(_OWORD *)(a1 + 56) = 0u;
  *(_DWORD *)(a1 + 72) = 1065353216;
  *(_OWORD *)(a1 + 8nlp::CFScopedPtr<__CFURL const*>::reset(&a9, 0) = 0u;
  std::string v5 = (uint64_t *)(a1 + 80);
  *(_OWORD *)(a1 + 96) = 0u;
  *(_DWORD *)(a1 + 112) = 1065353216;
  Dictionary = (InputTranscoder *)InputTranscoder::createDictionary(a2);
  uint64_t v34 = Dictionary;
  InputTranscoder::validateVersion(Dictionary, v7);
  CFStringRef Required = (const __CFString *)InputTranscoder::getRequiredCFType<__CFString const*>(Dictionary, @"keyType");
  nlp::getUTF8StringFromCFString(Required, &v41);
  CFStringRef v9 = (const __CFString *)InputTranscoder::getRequiredCFType<__CFString const*>(Dictionary, @"valueType");
  nlp::getUTF8StringFromCFString(v9, &__p);
  if (!InputTranscoder::typeMatches<std::string>((uint64_t *)&v41))
  {
    exception = __cxa_allocate_exception(0x20uLL);
    std::operator+<char>();
    CFNumberRef v28 = std::string::append(&__str, "\"", 1uLL);
    long long v29 = *(_OWORD *)&v28->__r_.__value_.__l.__data_;
    std::string::size_type v37 = v28->__r_.__value_.__r.__words[2];
    *(_OWORD *)values = v29;
    v28->__r_.__value_.__l.__size_ = 0;
    v28->__r_.__value_.__r.__words[2] = 0;
    v28->__r_.__value_.__r.__words[0] = 0;
    nlp::ResourceCreationException::ResourceCreationException(exception, (long long *)values);
  }
  if (!InputTranscoder::typeMatches<unsigned int>((uint64_t)&__p))
  {
    uint64_t v30 = __cxa_allocate_exception(0x20uLL);
    std::operator+<char>();
    uint64_t v31 = std::string::append(&__str, "\"", 1uLL);
    long long v32 = *(_OWORD *)&v31->__r_.__value_.__l.__data_;
    std::string::size_type v37 = v31->__r_.__value_.__r.__words[2];
    *(_OWORD *)values = v32;
    v31->__r_.__value_.__l.__size_ = 0;
    v31->__r_.__value_.__r.__words[2] = 0;
    v31->__r_.__value_.__r.__words[0] = 0;
    nlp::ResourceCreationException::ResourceCreationException(v30, (long long *)values);
  }
  if (v40 < 0) {
    operator delete(__p);
  }
  if (SHIBYTE(v41.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v41.__r_.__value_.__l.__data_);
  }
  CFStringRef v10 = (const __CFString *)InputTranscoder::getRequiredCFType<__CFString const*>(Dictionary, @"unknownKey");
  nlp::getUTF8StringFromCFString(v10, &v41);
  if (*(char *)(a1 + 31) < 0) {
    operator delete(*v3);
  }
  *(std::string *)unsigned int v3 = v41;
  CFStringRef v11 = (const __CFString *)InputTranscoder::getRequiredCFType<__CFString const*>(Dictionary, @"unknownValue");
  nlp::getUTF8StringFromCFString(v11, &v41);
  int v12 = InputTranscoder::convertToInteger<unsigned int>(&v41);
  if (SHIBYTE(v41.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v41.__r_.__value_.__l.__data_);
  }
  *(_DWORD *)(a1 + 32) = v12;
  CFDictionaryRef v13 = (const __CFDictionary *)InputTranscoder::getRequiredCFType<__CFDictionary const*>(Dictionary, @"mapping");
  CFIndex Count = CFDictionaryGetCount(v13);
  std::vector<void const*>::vector(&__p, Count);
  CFIndex v15 = CFDictionaryGetCount(v13);
  std::vector<void const*>::vector(values, v15);
  CFDictionaryGetKeysAndValues(v13, (const void **)__p, (const void **)values[0]);
  long long v16 = v39;
  if (v39 != __p)
  {
    unint64_t v17 = 0;
    long long v16 = __p;
    do
    {
      CFStringRef v18 = (const __CFString *)v16[v17];
      CFTypeID v19 = CFGetTypeID(v18);
      if (v19 != CFStringGetTypeID()) {
        CFStringRef v18 = 0;
      }
      CFStringRef v20 = (const __CFString *)values[0][v17];
      CFTypeID v21 = CFGetTypeID(v20);
      if (v21 != CFStringGetTypeID()) {
        CFStringRef v20 = 0;
      }
      if (v18) {
        BOOL v22 = v20 == 0;
      }
      else {
        BOOL v22 = 1;
      }
      if (v22)
      {
        float v26 = __cxa_allocate_exception(0x20uLL);
        std::string::basic_string[abi:ne180100]<0>(&v41, "Malformed plist: incorrect types for mapping dictionary");
        nlp::ResourceCreationException::ResourceCreationException(v26, (long long *)&v41);
      }
      nlp::getUTF8StringFromCFString(v18, &__str);
      nlp::getUTF8StringFromCFString(v20, &v41);
      unsigned int v23 = InputTranscoder::convertToInteger<unsigned int>(&v41);
      if (SHIBYTE(v41.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v41.__r_.__value_.__l.__data_);
      }
      unsigned int v33 = v23;
      v41.__r_.__value_.__r.__words[0] = (std::string::size_type)&__str;
      *((_DWORD *)std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v4, (unsigned __int8 *)&__str, (long long **)&v41)+ 1nlp::CFScopedPtr<__CFURL const*>::reset(&a9, 0) = v23;
      unsigned int v24 = (std::string *)std::__hash_table<std::__hash_value_type<unsigned int,std::string>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::string>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::string>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::string>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(v5, v23, &v33);
      std::string::operator=(v24 + 1, &__str);
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__str.__r_.__value_.__l.__data_);
      }
      ++v17;
      long long v16 = __p;
    }
    while (v17 < ((char *)v39 - (unsigned char *)__p) >> 3);
  }
  if (values[0])
  {
    values[1] = values[0];
    operator delete(values[0]);
    long long v16 = __p;
  }
  if (v16)
  {
    uint64_t v39 = v16;
    operator delete(v16);
    Dictionary = v34;
  }
  if (Dictionary) {
    CFRelease(Dictionary);
  }
  return a1;
}

void sub_2369F4758(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, const void *a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,void *a31,uint64_t a32,int a33,__int16 a34,char a35,char a36)
{
  if (a23 < 0) {
    operator delete(__p);
  }
  if (a17 < 0) {
    operator delete(a12);
  }
  if (v40) {
    __cxa_free_exception(v39);
  }
  if (a30 < 0) {
    operator delete(a25);
  }
  if (a36 < 0) {
    operator delete(a31);
  }
  nlp::CFScopedPtr<__CFDictionary const*>::reset(&a11, 0);
  std::__hash_table<std::__hash_value_type<unsigned int,std::string>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::string>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::string>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::string>>>::~__hash_table(v38);
  std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::~__hash_table(v37);
  if (*(char *)(v36 + 31) < 0) {
    operator delete(*v41);
  }
  _Unwind_Resume(a1);
}

uint64_t InputTranscoder::PlistBiMap<std::string,unsigned int>::unknownKey(uint64_t a1)
{
  return a1 + 8;
}

uint64_t InputTranscoder::PlistBiMap<std::string,unsigned int>::unknownValue(uint64_t a1)
{
  return a1 + 32;
}

unsigned __int8 *InputTranscoder::PlistBiMap<std::string,unsigned int>::operator[](uint64_t a1, unsigned __int8 *a2)
{
  unsigned int v3 = std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::find<std::string>((void *)(a1 + 40), a2);
  if (v3) {
    return v3 + 40;
  }
  else {
    return (unsigned __int8 *)(a1 + 32);
  }
}

uint64_t *InputTranscoder::PlistBiMap<std::string,unsigned int>::reverseMap(uint64_t a1, unsigned int *a2)
{
  unsigned int v3 = std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::find<unsigned int>((void *)(a1 + 80), *a2);
  if (v3) {
    return v3 + 3;
  }
  else {
    return (uint64_t *)(a1 + 8);
  }
}

void *InputTranscoder::PlistBiMap<unsigned int,unsigned int>::~PlistBiMap(void *a1)
{
  *a1 = &unk_26E9DAF38;
  uint64_t v2 = (uint64_t)(a1 + 2);
  std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::~__hash_table((uint64_t)(a1 + 7));
  std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::~__hash_table(v2);
  return a1;
}

void InputTranscoder::PlistBiMap<unsigned int,unsigned int>::~PlistBiMap(void *a1)
{
  *a1 = &unk_26E9DAF38;
  uint64_t v1 = (uint64_t)(a1 + 2);
  std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::~__hash_table((uint64_t)(a1 + 7));
  std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::~__hash_table(v1);

  JUMPOUT(0x237E08BB0);
}

uint64_t InputTranscoder::PlistBiMap<unsigned int,std::string>::~PlistBiMap(uint64_t a1)
{
  *(void *)a1 = &unk_26E9DAF78;
  std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::~__hash_table(a1 + 80);
  std::__hash_table<std::__hash_value_type<unsigned int,std::string>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::string>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::string>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::string>>>::~__hash_table(a1 + 40);
  if (*(char *)(a1 + 39) < 0) {
    operator delete(*(void **)(a1 + 16));
  }
  return a1;
}

void InputTranscoder::PlistBiMap<unsigned int,std::string>::~PlistBiMap(uint64_t a1)
{
  *(void *)a1 = &unk_26E9DAF78;
  std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::~__hash_table(a1 + 80);
  std::__hash_table<std::__hash_value_type<unsigned int,std::string>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::string>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::string>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::string>>>::~__hash_table(a1 + 40);
  if (*(char *)(a1 + 39) < 0) {
    operator delete(*(void **)(a1 + 16));
  }

  JUMPOUT(0x237E08BB0);
}

uint64_t InputTranscoder::PlistBiMap<std::string,unsigned int>::~PlistBiMap(uint64_t a1)
{
  *(void *)a1 = &unk_26E9DAFB8;
  std::__hash_table<std::__hash_value_type<unsigned int,std::string>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::string>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::string>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::string>>>::~__hash_table(a1 + 80);
  std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::~__hash_table(a1 + 40);
  if (*(char *)(a1 + 31) < 0) {
    operator delete(*(void **)(a1 + 8));
  }
  return a1;
}

void InputTranscoder::PlistBiMap<std::string,unsigned int>::~PlistBiMap(uint64_t a1)
{
  *(void *)a1 = &unk_26E9DAFB8;
  std::__hash_table<std::__hash_value_type<unsigned int,std::string>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::string>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::string>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::string>>>::~__hash_table(a1 + 80);
  std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::~__hash_table(a1 + 40);
  if (*(char *)(a1 + 31) < 0) {
    operator delete(*(void **)(a1 + 8));
  }

  JUMPOUT(0x237E08BB0);
}

void *std::vector<void const*>::vector(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    if (a2 >> 61) {
      std::vector<InputTranscoder::InputFeature>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v4 = 8 * a2;
    std::string v5 = (char *)operator new(8 * a2);
    *a1 = v5;
    a1[2] = &v5[8 * a2];
    bzero(v5, 8 * a2);
    a1[1] = &v5[v4];
  }
  return a1;
}

void sub_2369F4C44(_Unwind_Exception *exception_object)
{
  unsigned int v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t nlp::ResourceCreationException::ResourceCreationException(uint64_t a1, const void **a2, CFErrorRef err)
{
  v21[2] = *MEMORY[0x263EF8340];
  *(void *)a1 = &unk_26E9DA080;
  *(void *)(a1 + 8) = 0;
  std::string v5 = (void **)(a1 + 8);
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  CFStringRef v6 = CFErrorCopyDescription(err);
  CFStringRef v20 = v6;
  if (*((char *)a2 + 23) >= 0) {
    size_t v7 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v7 = (size_t)a2[1];
  }
  CFPropertyListRef v8 = &v19;
  std::string::basic_string[abi:ne180100]((uint64_t)&v19, v7 + 2);
  if ((v19.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    CFPropertyListRef v8 = (std::string *)v19.__r_.__value_.__r.__words[0];
  }
  if (v7)
  {
    if (*((char *)a2 + 23) >= 0) {
      CFStringRef v9 = a2;
    }
    else {
      CFStringRef v9 = *a2;
    }
    memmove(v8, v9, v7);
  }
  strcpy((char *)v8 + v7, ": ");
  nlp::getUTF8StringFromCFString(v6, __p);
  if ((v18 & 0x80u) == 0) {
    CFStringRef v10 = __p;
  }
  else {
    CFStringRef v10 = (void **)__p[0];
  }
  if ((v18 & 0x80u) == 0) {
    std::string::size_type v11 = v18;
  }
  else {
    std::string::size_type v11 = (std::string::size_type)__p[1];
  }
  int v12 = std::string::append(&v19, (const std::string::value_type *)v10, v11);
  std::string::size_type v13 = v12->__r_.__value_.__r.__words[0];
  v21[0] = v12->__r_.__value_.__l.__size_;
  *(void *)((char *)v21 + 7) = *(std::string::size_type *)((char *)&v12->__r_.__value_.__r.__words[1] + 7);
  char v14 = HIBYTE(v12->__r_.__value_.__r.__words[2]);
  v12->__r_.__value_.__l.__size_ = 0;
  v12->__r_.__value_.__r.__words[2] = 0;
  v12->__r_.__value_.__r.__words[0] = 0;
  if (*(char *)(a1 + 31) < 0) {
    operator delete(*v5);
  }
  uint64_t v15 = v21[0];
  *(void *)(a1 + 8) = v13;
  *(void *)(a1 + 16) = v15;
  *(void *)(a1 + 23) = *(void *)((char *)v21 + 7);
  *(unsigned char *)(a1 + 31) = v14;
  if ((char)v18 < 0) {
    operator delete(__p[0]);
  }
  if ((SHIBYTE(v19.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if (!v6) {
      return a1;
    }
    goto LABEL_25;
  }
  operator delete(v19.__r_.__value_.__l.__data_);
  if (v6) {
LABEL_25:
  }
    CFRelease(v6);
  return a1;
}

void sub_2369F4E10(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,char a21)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void nlp::CFScopedPtr<__CFError *>::reset(const void **a1, const void *a2)
{
  uint64_t v4 = *a1;
  if (v4) {
    CFRelease(v4);
  }
  *a1 = a2;
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::~__hash_table(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      unsigned int v3 = (void *)*v2;
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

BOOL InputTranscoder::typeMatches<unsigned int>(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(a1 + 23);
  int v2 = (char)v1;
  if ((v1 & 0x80u) != 0) {
    uint64_t v1 = *(void *)(a1 + 8);
  }
  if (v1 != 7) {
    return 0;
  }
  if (v2 >= 0) {
    unsigned int v3 = (int *)a1;
  }
  else {
    unsigned int v3 = *(int **)a1;
  }
  int v4 = *v3;
  int v5 = *(int *)((char *)v3 + 3);
  return v4 == 1702129257 && v5 == 1919248229;
}

uint64_t InputTranscoder::convertToInteger<unsigned int>(const std::string *a1)
{
  return std::stoi(a1, 0, 10);
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C328] + 104;
  *(void *)(a1 + 128) = MEMORY[0x263F8C328] + 104;
  uint64_t v3 = a1 + 16;
  uint64_t v4 = MEMORY[0x263F8C328] + 64;
  *(void *)(a1 + 16) = MEMORY[0x263F8C328] + 64;
  int v5 = (void *)MEMORY[0x263F8C2B8];
  uint64_t v6 = *(void *)(MEMORY[0x263F8C2B8] + 24);
  uint64_t v7 = *(void *)(MEMORY[0x263F8C2B8] + 16);
  *(void *)a1 = v7;
  *(void *)(a1 + *(void *)(v7 - 24)) = v6;
  *(void *)(a1 + 8) = 0;
  CFPropertyListRef v8 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
  std::ios_base::init(v8, (void *)(a1 + 24));
  uint64_t v9 = MEMORY[0x263F8C328] + 24;
  v8[1].__vftable = 0;
  v8[1].__fmtflags_ = -1;
  uint64_t v10 = v5[5];
  uint64_t v11 = v5[4];
  *(void *)(a1 + 16) = v11;
  *(void *)(v3 + *(void *)(v11 - 24)) = v10;
  uint64_t v12 = v5[1];
  *(void *)a1 = v12;
  *(void *)(a1 + *(void *)(v12 - 24)) = v5[6];
  *(void *)a1 = v9;
  *(void *)(a1 + 128) = v2;
  *(void *)(a1 + 16) = v4;
  std::streambuf::basic_streambuf();
  *(void *)(a1 + 24) = MEMORY[0x263F8C318] + 16;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_DWORD *)(a1 + 12nlp::CFScopedPtr<__CFURL const*>::reset(&a9, 0) = 24;
  return a1;
}

void sub_2369F53BC(_Unwind_Exception *a1)
{
  std::iostream::~basic_iostream();
  MEMORY[0x237E08B30](v1);
  _Unwind_Resume(a1);
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C2B8];
  uint64_t v3 = *MEMORY[0x263F8C2B8];
  *(void *)a1 = *MEMORY[0x263F8C2B8];
  uint64_t v4 = *(void *)(v2 + 72);
  *(void *)(a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 64);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = MEMORY[0x263F8C318] + 16;
  if (*(char *)(a1 + 111) < 0) {
    operator delete(*(void **)(a1 + 88));
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x237E08B30](a1 + 128);
  return a1;
}

void *std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(float *a1, unsigned int a2, _DWORD *a3)
{
  unint64_t v6 = a2;
  unint64_t v7 = *((void *)a1 + 1);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = a2;
      if (v7 <= a2) {
        unint64_t v3 = a2 % v7;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & a2;
    }
    uint64_t v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      uint64_t v10 = *v9;
      if (*v9)
      {
        do
        {
          unint64_t v11 = v10[1];
          if (v11 == a2)
          {
            if (*((_DWORD *)v10 + 4) == a2) {
              return v10;
            }
          }
          else
          {
            if (v8.u32[0] > 1uLL)
            {
              if (v11 >= v7) {
                v11 %= v7;
              }
            }
            else
            {
              v11 &= v7 - 1;
            }
            if (v11 != v3) {
              break;
            }
          }
          uint64_t v10 = (void *)*v10;
        }
        while (v10);
      }
    }
  }
  uint64_t v10 = operator new(0x18uLL);
  *uint64_t v10 = 0;
  v10[1] = v6;
  *((_DWORD *)v10 + 4) = *a3;
  *((_DWORD *)v10 + 5) = 0;
  float v12 = (float)(unint64_t)(*((void *)a1 + 3) + 1);
  float v13 = a1[8];
  if (v7 && (float)(v13 * (float)v7) >= v12)
  {
    unint64_t v6 = v3;
    goto LABEL_64;
  }
  BOOL v14 = 1;
  if (v7 >= 3) {
    BOOL v14 = (v7 & (v7 - 1)) != 0;
  }
  unint64_t v15 = v14 | (2 * v7);
  unint64_t v16 = vcvtps_u32_f32(v12 / v13);
  if (v15 <= v16) {
    int8x8_t prime = (int8x8_t)v16;
  }
  else {
    int8x8_t prime = (int8x8_t)v15;
  }
  if (*(void *)&prime == 1)
  {
    int8x8_t prime = (int8x8_t)2;
  }
  else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
  {
    int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    unint64_t v7 = *((void *)a1 + 1);
  }
  if (*(void *)&prime <= v7)
  {
    if (*(void *)&prime >= v7) {
      goto LABEL_60;
    }
    unint64_t v24 = vcvtps_u32_f32((float)*((unint64_t *)a1 + 3) / a1[8]);
    if (v7 < 3 || (uint8x8_t v25 = (uint8x8_t)vcnt_s8((int8x8_t)v7), v25.i16[0] = vaddlv_u8(v25), v25.u32[0] > 1uLL))
    {
      unint64_t v24 = std::__next_prime(v24);
    }
    else
    {
      uint64_t v26 = 1 << -(char)__clz(v24 - 1);
      if (v24 >= 2) {
        unint64_t v24 = v26;
      }
    }
    if (*(void *)&prime <= v24) {
      int8x8_t prime = (int8x8_t)v24;
    }
    if (*(void *)&prime >= v7)
    {
      unint64_t v7 = *((void *)a1 + 1);
      goto LABEL_60;
    }
    if (!*(void *)&prime)
    {
      unsigned int v33 = *(void **)a1;
      *(void *)a1 = 0;
      if (v33) {
        operator delete(v33);
      }
      unint64_t v7 = 0;
      *((void *)a1 + 1) = 0;
      goto LABEL_60;
    }
  }
  if (*(void *)&prime >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  unsigned __int8 v18 = operator new(8 * *(void *)&prime);
  std::string v19 = *(void **)a1;
  *(void *)a1 = v18;
  if (v19) {
    operator delete(v19);
  }
  uint64_t v20 = 0;
  *((int8x8_t *)a1 + 1) = prime;
  do
    *(void *)(*(void *)a1 + 8 * v20++) = 0;
  while (*(void *)&prime != v20);
  CFTypeID v21 = (void *)*((void *)a1 + 2);
  if (v21)
  {
    unint64_t v22 = v21[1];
    uint8x8_t v23 = (uint8x8_t)vcnt_s8(prime);
    v23.i16[0] = vaddlv_u8(v23);
    if (v23.u32[0] > 1uLL)
    {
      if (v22 >= *(void *)&prime) {
        v22 %= *(void *)&prime;
      }
    }
    else
    {
      v22 &= *(void *)&prime - 1;
    }
    *(void *)(*(void *)a1 + 8 * v22) = a1 + 4;
    int v27 = (void *)*v21;
    if (*v21)
    {
      do
      {
        unint64_t v28 = v27[1];
        if (v23.u32[0] > 1uLL)
        {
          if (v28 >= *(void *)&prime) {
            v28 %= *(void *)&prime;
          }
        }
        else
        {
          v28 &= *(void *)&prime - 1;
        }
        if (v28 != v22)
        {
          if (!*(void *)(*(void *)a1 + 8 * v28))
          {
            *(void *)(*(void *)a1 + 8 * v28) = v21;
            goto LABEL_56;
          }
          void *v21 = *v27;
          *int v27 = **(void **)(*(void *)a1 + 8 * v28);
          **(void **)(*(void *)a1 + 8 * v28) = v27;
          int v27 = v21;
        }
        unint64_t v28 = v22;
LABEL_56:
        CFTypeID v21 = v27;
        int v27 = (void *)*v27;
        unint64_t v22 = v28;
      }
      while (v27);
    }
  }
  unint64_t v7 = (unint64_t)prime;
LABEL_60:
  if ((v7 & (v7 - 1)) != 0)
  {
    if (v7 <= v6) {
      v6 %= v7;
    }
  }
  else
  {
    unint64_t v6 = (v7 - 1) & v6;
  }
LABEL_64:
  long long v29 = *(void **)a1;
  uint64_t v30 = *(void **)(*(void *)a1 + 8 * v6);
  if (v30)
  {
    *uint64_t v10 = *v30;
LABEL_72:
    void *v30 = v10;
    goto LABEL_73;
  }
  *uint64_t v10 = *((void *)a1 + 2);
  *((void *)a1 + 2) = v10;
  v29[v6] = a1 + 4;
  if (*v10)
  {
    unint64_t v31 = *(void *)(*v10 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v31 >= v7) {
        v31 %= v7;
      }
    }
    else
    {
      v31 &= v7 - 1;
    }
    uint64_t v30 = (void *)(*(void *)a1 + 8 * v31);
    goto LABEL_72;
  }
LABEL_73:
  ++*((void *)a1 + 3);
  return v10;
}

void sub_2369F58F8(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t *std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::find<unsigned int>(void *a1, unsigned int a2)
{
  unint64_t v2 = a1[1];
  if (!v2) {
    return 0;
  }
  uint8x8_t v3 = (uint8x8_t)vcnt_s8((int8x8_t)v2);
  v3.i16[0] = vaddlv_u8(v3);
  if (v3.u32[0] > 1uLL)
  {
    unint64_t v4 = a2;
    if (v2 <= a2) {
      unint64_t v4 = a2 % v2;
    }
  }
  else
  {
    unint64_t v4 = (v2 - 1) & a2;
  }
  int v5 = *(uint64_t ***)(*a1 + 8 * v4);
  if (!v5) {
    return 0;
  }
  for (uint64_t result = *v5; result; uint64_t result = (uint64_t *)*result)
  {
    unint64_t v7 = result[1];
    if (v7 == a2)
    {
      if (*((_DWORD *)result + 4) == a2) {
        return result;
      }
    }
    else
    {
      if (v3.u32[0] > 1uLL)
      {
        if (v7 >= v2) {
          v7 %= v2;
        }
      }
      else
      {
        v7 &= v2 - 1;
      }
      if (v7 != v4) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned int,std::string>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::string>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::string>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::string>>>::~__hash_table(uint64_t a1)
{
  unint64_t v2 = *(void ***)(a1 + 16);
  if (v2)
  {
    do
    {
      uint8x8_t v3 = (void **)*v2;
      if (*((char *)v2 + 47) < 0) {
        operator delete(v2[3]);
      }
      operator delete(v2);
      unint64_t v2 = v3;
    }
    while (v3);
  }
  unint64_t v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::~__hash_table(uint64_t a1)
{
  unint64_t v2 = *(void ***)(a1 + 16);
  if (v2)
  {
    do
    {
      uint8x8_t v3 = (void **)*v2;
      if (*((char *)v2 + 39) < 0) {
        operator delete(v2[2]);
      }
      operator delete(v2);
      unint64_t v2 = v3;
    }
    while (v3);
  }
  unint64_t v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

BOOL InputTranscoder::typeMatches<std::string>(uint64_t *a1)
{
  uint64_t v1 = *((unsigned __int8 *)a1 + 23);
  int v2 = (char)v1;
  if ((v1 & 0x80u) != 0) {
    uint64_t v1 = a1[1];
  }
  if (v1 != 6) {
    return 0;
  }
  if (v2 >= 0) {
    uint8x8_t v3 = (int *)a1;
  }
  else {
    uint8x8_t v3 = (int *)*a1;
  }
  int v4 = *v3;
  int v5 = *((unsigned __int16 *)v3 + 2);
  return v4 == 1769108595 && v5 == 26478;
}

void *std::__hash_table<std::__hash_value_type<unsigned int,std::string>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::string>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::string>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::string>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(uint64_t *a1, unsigned int a2, _DWORD *a3)
{
  unint64_t v6 = a2;
  unint64_t v7 = a1[1];
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = a2;
      if (v7 <= a2) {
        unint64_t v3 = a2 % v7;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & a2;
    }
    uint64_t v9 = *(void ***)(*a1 + 8 * v3);
    if (v9)
    {
      uint64_t v10 = *v9;
      if (*v9)
      {
        do
        {
          unint64_t v11 = v10[1];
          if (v11 == a2)
          {
            if (*((_DWORD *)v10 + 4) == a2) {
              return v10;
            }
          }
          else
          {
            if (v8.u32[0] > 1uLL)
            {
              if (v11 >= v7) {
                v11 %= v7;
              }
            }
            else
            {
              v11 &= v7 - 1;
            }
            if (v11 != v3) {
              break;
            }
          }
          uint64_t v10 = (void *)*v10;
        }
        while (v10);
      }
    }
  }
  float v12 = a1 + 2;
  uint64_t v10 = operator new(0x30uLL);
  *uint64_t v10 = 0;
  v10[1] = v6;
  *((_DWORD *)v10 + 4) = *a3;
  v10[4] = 0;
  v10[5] = 0;
  void v10[3] = 0;
  float v13 = (float)(unint64_t)(a1[3] + 1);
  float v14 = *((float *)a1 + 8);
  if (v7 && (float)(v14 * (float)v7) >= v13)
  {
    unint64_t v6 = v3;
    goto LABEL_64;
  }
  BOOL v15 = 1;
  if (v7 >= 3) {
    BOOL v15 = (v7 & (v7 - 1)) != 0;
  }
  unint64_t v16 = v15 | (2 * v7);
  unint64_t v17 = vcvtps_u32_f32(v13 / v14);
  if (v16 <= v17) {
    int8x8_t prime = (int8x8_t)v17;
  }
  else {
    int8x8_t prime = (int8x8_t)v16;
  }
  if (*(void *)&prime == 1)
  {
    int8x8_t prime = (int8x8_t)2;
  }
  else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
  {
    int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    unint64_t v7 = a1[1];
  }
  if (*(void *)&prime <= v7)
  {
    if (*(void *)&prime >= v7) {
      goto LABEL_60;
    }
    unint64_t v25 = vcvtps_u32_f32((float)(unint64_t)a1[3] / *((float *)a1 + 8));
    if (v7 < 3 || (uint8x8_t v26 = (uint8x8_t)vcnt_s8((int8x8_t)v7), v26.i16[0] = vaddlv_u8(v26), v26.u32[0] > 1uLL))
    {
      unint64_t v25 = std::__next_prime(v25);
    }
    else
    {
      uint64_t v27 = 1 << -(char)__clz(v25 - 1);
      if (v25 >= 2) {
        unint64_t v25 = v27;
      }
    }
    if (*(void *)&prime <= v25) {
      int8x8_t prime = (int8x8_t)v25;
    }
    if (*(void *)&prime >= v7)
    {
      unint64_t v7 = a1[1];
      goto LABEL_60;
    }
    if (!*(void *)&prime)
    {
      uint64_t v34 = (void *)*a1;
      *a1 = 0;
      if (v34) {
        operator delete(v34);
      }
      unint64_t v7 = 0;
      a1[1] = 0;
      goto LABEL_60;
    }
  }
  if (*(void *)&prime >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  std::string v19 = operator new(8 * *(void *)&prime);
  uint64_t v20 = (void *)*a1;
  *a1 = (uint64_t)v19;
  if (v20) {
    operator delete(v20);
  }
  uint64_t v21 = 0;
  a1[1] = (uint64_t)prime;
  do
    *(void *)(*a1 + 8 * v21++) = 0;
  while (*(void *)&prime != v21);
  unint64_t v22 = (void *)*v12;
  if (*v12)
  {
    unint64_t v23 = v22[1];
    uint8x8_t v24 = (uint8x8_t)vcnt_s8(prime);
    v24.i16[0] = vaddlv_u8(v24);
    if (v24.u32[0] > 1uLL)
    {
      if (v23 >= *(void *)&prime) {
        v23 %= *(void *)&prime;
      }
    }
    else
    {
      v23 &= *(void *)&prime - 1;
    }
    *(void *)(*a1 + 8 * v23) = v12;
    unint64_t v28 = (void *)*v22;
    if (*v22)
    {
      do
      {
        unint64_t v29 = v28[1];
        if (v24.u32[0] > 1uLL)
        {
          if (v29 >= *(void *)&prime) {
            v29 %= *(void *)&prime;
          }
        }
        else
        {
          v29 &= *(void *)&prime - 1;
        }
        if (v29 != v23)
        {
          if (!*(void *)(*a1 + 8 * v29))
          {
            *(void *)(*a1 + 8 * v29) = v22;
            goto LABEL_56;
          }
          void *v22 = *v28;
          *unint64_t v28 = **(void **)(*a1 + 8 * v29);
          **(void **)(*a1 + 8 * v29) = v28;
          unint64_t v28 = v22;
        }
        unint64_t v29 = v23;
LABEL_56:
        unint64_t v22 = v28;
        unint64_t v28 = (void *)*v28;
        unint64_t v23 = v29;
      }
      while (v28);
    }
  }
  unint64_t v7 = (unint64_t)prime;
LABEL_60:
  if ((v7 & (v7 - 1)) != 0)
  {
    if (v7 <= v6) {
      v6 %= v7;
    }
  }
  else
  {
    unint64_t v6 = (v7 - 1) & v6;
  }
LABEL_64:
  uint64_t v30 = *a1;
  unint64_t v31 = *(void **)(*a1 + 8 * v6);
  if (v31)
  {
    *uint64_t v10 = *v31;
LABEL_72:
    *unint64_t v31 = v10;
    goto LABEL_73;
  }
  *uint64_t v10 = *v12;
  *float v12 = v10;
  *(void *)(v30 + 8 * v6) = v12;
  if (*v10)
  {
    unint64_t v32 = *(void *)(*v10 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v32 >= v7) {
        v32 %= v7;
      }
    }
    else
    {
      v32 &= v7 - 1;
    }
    unint64_t v31 = (void *)(*a1 + 8 * v32);
    goto LABEL_72;
  }
LABEL_73:
  ++a1[3];
  return v10;
}

void sub_2369F5ECC(_Unwind_Exception *a1)
{
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned int,std::string>,void *>>>::operator()[abi:ne180100](1, v1);
  _Unwind_Resume(a1);
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned int,std::string>,void *>>>::operator()[abi:ne180100](char a1, void **__p)
{
  if (a1)
  {
    if (*((char *)__p + 47) < 0) {
      operator delete(__p[3]);
    }
  }
  else if (!__p)
  {
    return;
  }

  operator delete(__p);
}

char *std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t *a1, unsigned __int8 *a2, long long **a3)
{
  unint64_t v7 = a1 + 3;
  unint64_t v8 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)(a1 + 3), (uint64_t)a2);
  unint64_t v9 = v8;
  unint64_t v10 = a1[1];
  if (v10)
  {
    uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    unint64_t v12 = v11.u32[0];
    if (v11.u32[0] > 1uLL)
    {
      unint64_t v3 = v8;
      if (v8 >= v10) {
        unint64_t v3 = v8 % v10;
      }
    }
    else
    {
      unint64_t v3 = (v10 - 1) & v8;
    }
    float v13 = *(void ***)(*a1 + 8 * v3);
    if (v13)
    {
      float v14 = (char *)*v13;
      if (*v13)
      {
        do
        {
          unint64_t v15 = *((void *)v14 + 1);
          if (v15 == v9)
          {
            if (std::equal_to<std::string>::operator()[abi:ne180100]((uint64_t)(a1 + 4), (unsigned __int8 *)v14 + 16, a2))return v14; {
          }
            }
          else
          {
            if (v12 > 1)
            {
              if (v15 >= v10) {
                v15 %= v10;
              }
            }
            else
            {
              v15 &= v10 - 1;
            }
            if (v15 != v3) {
              break;
            }
          }
          float v14 = *(char **)v14;
        }
        while (v14);
      }
    }
  }
  unint64_t v16 = *a3;
  float v14 = (char *)operator new(0x30uLL);
  *(void *)float v14 = 0;
  *((void *)v14 + 1) = v9;
  unint64_t v17 = (std::string *)(v14 + 16);
  if (*((char *)v16 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v17, *(const std::string::value_type **)v16, *((void *)v16 + 1));
  }
  else
  {
    long long v18 = *v16;
    *((void *)v14 + 4) = *((void *)v16 + 2);
    *(_OWORD *)&v17->__r_.__value_.__l.__data_ = v18;
  }
  *((_DWORD *)v14 + 1nlp::CFScopedPtr<__CFURL const*>::reset(&a9, 0) = 0;
  float v19 = (float)(unint64_t)(a1[3] + 1);
  float v20 = *((float *)a1 + 8);
  if (!v10 || (float)(v20 * (float)v10) < v19)
  {
    BOOL v21 = 1;
    if (v10 >= 3) {
      BOOL v21 = (v10 & (v10 - 1)) != 0;
    }
    unint64_t v22 = v21 | (2 * v10);
    unint64_t v23 = vcvtps_u32_f32(v19 / v20);
    if (v22 <= v23) {
      int8x8_t prime = (int8x8_t)v23;
    }
    else {
      int8x8_t prime = (int8x8_t)v22;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    }
    unint64_t v10 = a1[1];
    if (*(void *)&prime > v10) {
      goto LABEL_33;
    }
    if (*(void *)&prime < v10)
    {
      unint64_t v31 = vcvtps_u32_f32((float)(unint64_t)a1[3] / *((float *)a1 + 8));
      if (v10 < 3 || (uint8x8_t v32 = (uint8x8_t)vcnt_s8((int8x8_t)v10), v32.i16[0] = vaddlv_u8(v32), v32.u32[0] > 1uLL))
      {
        unint64_t v31 = std::__next_prime(v31);
      }
      else
      {
        uint64_t v33 = 1 << -(char)__clz(v31 - 1);
        if (v31 >= 2) {
          unint64_t v31 = v33;
        }
      }
      if (*(void *)&prime <= v31) {
        int8x8_t prime = (int8x8_t)v31;
      }
      if (*(void *)&prime >= v10)
      {
        unint64_t v10 = a1[1];
      }
      else
      {
        if (prime)
        {
LABEL_33:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          unint64_t v25 = operator new(8 * *(void *)&prime);
          uint8x8_t v26 = (void *)*a1;
          *a1 = (uint64_t)v25;
          if (v26) {
            operator delete(v26);
          }
          uint64_t v27 = 0;
          a1[1] = (uint64_t)prime;
          do
            *(void *)(*a1 + 8 * v27++) = 0;
          while (*(void *)&prime != v27);
          unint64_t v28 = (void *)a1[2];
          if (v28)
          {
            unint64_t v29 = v28[1];
            uint8x8_t v30 = (uint8x8_t)vcnt_s8(prime);
            v30.i16[0] = vaddlv_u8(v30);
            if (v30.u32[0] > 1uLL)
            {
              if (v29 >= *(void *)&prime) {
                v29 %= *(void *)&prime;
              }
            }
            else
            {
              v29 &= *(void *)&prime - 1;
            }
            *(void *)(*a1 + 8 * v29) = a1 + 2;
            uint64_t v34 = (void *)*v28;
            if (*v28)
            {
              do
              {
                unint64_t v35 = v34[1];
                if (v30.u32[0] > 1uLL)
                {
                  if (v35 >= *(void *)&prime) {
                    v35 %= *(void *)&prime;
                  }
                }
                else
                {
                  v35 &= *(void *)&prime - 1;
                }
                if (v35 != v29)
                {
                  if (!*(void *)(*a1 + 8 * v35))
                  {
                    *(void *)(*a1 + 8 * v35) = v28;
                    goto LABEL_58;
                  }
                  *unint64_t v28 = *v34;
                  *uint64_t v34 = **(void **)(*a1 + 8 * v35);
                  **(void **)(*a1 + 8 * v35) = v34;
                  uint64_t v34 = v28;
                }
                unint64_t v35 = v29;
LABEL_58:
                unint64_t v28 = v34;
                uint64_t v34 = (void *)*v34;
                unint64_t v29 = v35;
              }
              while (v34);
            }
          }
          unint64_t v10 = (unint64_t)prime;
          goto LABEL_62;
        }
        char v40 = (void *)*a1;
        *a1 = 0;
        if (v40) {
          operator delete(v40);
        }
        unint64_t v10 = 0;
        a1[1] = 0;
      }
    }
LABEL_62:
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10) {
        unint64_t v3 = v9 % v10;
      }
      else {
        unint64_t v3 = v9;
      }
    }
    else
    {
      unint64_t v3 = (v10 - 1) & v9;
    }
  }
  uint64_t v36 = *a1;
  uint64_t v37 = *(void **)(*a1 + 8 * v3);
  if (v37)
  {
    *(void *)float v14 = *v37;
LABEL_75:
    *uint64_t v37 = v14;
    goto LABEL_76;
  }
  *(void *)float v14 = a1[2];
  a1[2] = (uint64_t)v14;
  *(void *)(v36 + 8 * v3) = a1 + 2;
  if (*(void *)v14)
  {
    unint64_t v38 = *(void *)(*(void *)v14 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v38 >= v10) {
        v38 %= v10;
      }
    }
    else
    {
      v38 &= v10 - 1;
    }
    uint64_t v37 = (void *)(*a1 + 8 * v38);
    goto LABEL_75;
  }
LABEL_76:
  ++*v7;
  return v14;
}

void sub_2369F637C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

unint64_t std::__string_hash<char>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v3 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(void *)a2;
    unint64_t v3 = v2;
  }
  return std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100]((uint64_t)&v5, (uint64_t *)a2, v3);
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100](uint64_t a1, uint64_t *a2, unint64_t a3)
{
  if (a3 > 0x20)
  {
    if (a3 > 0x40)
    {
      uint64_t v4 = *(uint64_t *)((char *)a2 + a3 - 48);
      uint64_t v5 = *(uint64_t *)((char *)a2 + a3 - 40);
      uint64_t v6 = *(uint64_t *)((char *)a2 + a3 - 24);
      uint64_t v8 = *(uint64_t *)((char *)a2 + a3 - 64);
      uint64_t v7 = *(uint64_t *)((char *)a2 + a3 - 56);
      uint64_t v9 = *(uint64_t *)((char *)a2 + a3 - 16);
      uint64_t v10 = *(uint64_t *)((char *)a2 + a3 - 8);
      unint64_t v11 = v7 + v9;
      unint64_t v12 = 0x9DDFEA08EB382D69
          * (v6 ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))) >> 47) ^ (0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))));
      unint64_t v13 = 0x9DDFEA08EB382D69 * (v12 ^ (v12 >> 47));
      unint64_t v14 = v4 + v7 + v8 + a3;
      uint64_t v15 = v14 + v5;
      unint64_t v16 = __ROR8__(v14, 44) + v8 + a3 + __ROR8__(v8 + a3 + v5 - 0x622015F714C7D297 * (v12 ^ (v12 >> 47)), 21);
      uint64_t v17 = v7 + v9 + *(uint64_t *)((char *)a2 + a3 - 32) - 0x4B6D499041670D8DLL;
      uint64_t v18 = v6 + v9 + v17;
      uint64_t v19 = __ROR8__(v18, 44);
      uint64_t v20 = v18 + v10;
      uint64_t v21 = v19 + v17 + __ROR8__(v17 + v5 + v10, 21);
      uint64_t v23 = *a2;
      unint64_t v22 = a2 + 4;
      unint64_t v24 = v23 - 0x4B6D499041670D8DLL * v5;
      uint64_t v25 = -(uint64_t)((a3 - 1) & 0xFFFFFFFFFFFFFFC0);
      do
      {
        uint64_t v26 = *(v22 - 3);
        uint64_t v27 = v24 + v15 + v11 + v26;
        uint64_t v28 = v22[2];
        uint64_t v29 = v22[3];
        uint64_t v30 = v22[1];
        unint64_t v11 = v30 + v15 - 0x4B6D499041670D8DLL * __ROR8__(v11 + v16 + v28, 42);
        uint64_t v31 = v13 + v20;
        uint64_t v32 = *(v22 - 2);
        uint64_t v33 = *(v22 - 1);
        uint64_t v34 = *(v22 - 4) - 0x4B6D499041670D8DLL * v16;
        uint64_t v35 = v34 + v20 + v33;
        uint64_t v36 = v34 + v26 + v32;
        uint64_t v15 = v36 + v33;
        uint64_t v37 = __ROR8__(v36, 44) + v34;
        unint64_t v38 = (0xB492B66FBE98F273 * __ROR8__(v27, 37)) ^ v21;
        unint64_t v24 = 0xB492B66FBE98F273 * __ROR8__(v31, 33);
        unint64_t v16 = v37 + __ROR8__(v35 + v38, 21);
        unint64_t v39 = v24 + v21 + *v22;
        uint64_t v20 = v30 + v28 + v39 + v29;
        uint64_t v21 = __ROR8__(v30 + v28 + v39, 44) + v39 + __ROR8__(v11 + v32 + v39 + v29, 21);
        v22 += 8;
        unint64_t v13 = v38;
        v25 += 64;
      }
      while (v25);
      unint64_t v40 = v24
          - 0x622015F714C7D297
          * ((0x9DDFEA08EB382D69
            * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) ^ ((0x9DDFEA08EB382D69 * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) >> 47));
      unint64_t v41 = 0x9DDFEA08EB382D69
          * (v40 ^ (v38
                  - 0x4B6D499041670D8DLL * (v11 ^ (v11 >> 47))
                  - 0x622015F714C7D297
                  * ((0x9DDFEA08EB382D69
                    * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) ^ ((0x9DDFEA08EB382D69 * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) >> 47))));
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) ^ ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) >> 47));
    }
    else
    {
      return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:ne180100](a2, a3);
    }
  }
  else if (a3 > 0x10)
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:ne180100](a2, a3);
  }
  else
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:ne180100](a2, a3);
  }
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:ne180100](_DWORD *a1, unint64_t a2)
{
  if (a2 < 9)
  {
    if (a2 < 4)
    {
      unint64_t result = 0x9AE16A3B2F90404FLL;
      if (a2)
      {
        unint64_t v8 = (0xC949D7C7509E6557 * (a2 + 4 * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                      * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
        return 0x9AE16A3B2F90404FLL * (v8 ^ (v8 >> 47));
      }
    }
    else
    {
      uint64_t v6 = *(unsigned int *)((char *)a1 + a2 - 4);
      unint64_t v7 = 0x9DDFEA08EB382D69 * (((8 * *a1) + a2) ^ v6);
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) >> 47));
    }
  }
  else
  {
    uint64_t v3 = *(void *)((char *)a1 + a2 - 8);
    uint64_t v4 = __ROR8__(v3 + a2, a2);
    return (0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69
            * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)))) ^ ((0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)))) >> 47))) ^ v3;
  }
  return result;
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:ne180100](void *a1, uint64_t a2)
{
  uint64_t v2 = a1[1];
  unint64_t v3 = 0xB492B66FBE98F273 * *a1;
  uint64_t v4 = __ROR8__(0x9AE16A3B2F90404FLL * *(void *)((char *)a1 + a2 - 8), 30) + __ROR8__(v3 - v2, 43);
  unint64_t v5 = v3 + a2 + __ROR8__(v2 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(void *)((char *)a1 + a2 - 8);
  unint64_t v6 = 0x9DDFEA08EB382D69 * ((v4 - 0x3C5A37A36834CED9 * *(void *)((char *)a1 + a2 - 16)) ^ v5);
  return 0x9DDFEA08EB382D69
       * ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) ^ ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) >> 47));
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:ne180100](void *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)((char *)a1 + a2 - 16);
  uint64_t v3 = *a1 - 0x3C5A37A36834CED9 * (v2 + a2);
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = __ROR8__(v3 + v4, 52);
  uint64_t v7 = v3 + a1[1];
  uint64_t v8 = __ROR8__(v7, 7);
  uint64_t v9 = v7 + v5;
  uint64_t v10 = *(void *)((char *)a1 + a2 - 32) + v5;
  uint64_t v11 = v8 + __ROR8__(*a1 - 0x3C5A37A36834CED9 * (v2 + a2), 37) + v6 + __ROR8__(v9, 31);
  uint64_t v12 = *(void *)((char *)a1 + a2 - 24) + v10 + v2;
  unint64_t v13 = 0xC3A5C85C97CB3127 * (v12 + *(void *)((char *)a1 + a2 - 8) + v4 + v11)
      - 0x651E95C4D06FBFB1
      * (v9
       + v4
       + __ROR8__(v10, 37)
       + __ROR8__(*(void *)((char *)a1 + a2 - 24) + v10, 7)
       + __ROR8__(*(void *)((char *)a1 + a2 - 8) + v4 + v10, 52)
       + __ROR8__(v12, 31));
  return 0x9AE16A3B2F90404FLL
       * ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) ^ ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) >> 47));
}

uint64_t std::equal_to<std::string>::operator()[abi:ne180100](uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  uint64_t v3 = a3;
  uint64_t v4 = a2[23];
  if ((v4 & 0x80u) == 0) {
    uint64_t v5 = a2[23];
  }
  else {
    uint64_t v5 = *((void *)a2 + 1);
  }
  uint64_t v6 = a3[23];
  int v7 = (char)v6;
  if ((v6 & 0x80u) != 0) {
    uint64_t v6 = *((void *)a3 + 1);
  }
  if (v5 != v6) {
    return 0;
  }
  if (v7 < 0) {
    uint64_t v3 = *(unsigned __int8 **)a3;
  }
  if ((v4 & 0x80) != 0) {
    return memcmp(*(const void **)a2, v3, *((void *)a2 + 1)) == 0;
  }
  if (!a2[23]) {
    return 1;
  }
  uint64_t v8 = v4 - 1;
  do
  {
    int v10 = *a2++;
    int v9 = v10;
    int v12 = *v3++;
    int v11 = v12;
    BOOL v14 = v8-- != 0;
    uint64_t result = v9 == v11;
  }
  while (v9 == v11 && v14);
  return result;
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,unsigned int>,void *>>>::operator()[abi:ne180100](char a1, void **__p)
{
  if (a1)
  {
    if (*((char *)__p + 39) < 0) {
      operator delete(__p[2]);
    }
  }
  else if (!__p)
  {
    return;
  }

  operator delete(__p);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::find<std::string>(void *a1, unsigned __int8 *a2)
{
  unint64_t v4 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)(a1 + 3), (uint64_t)a2);
  int8x8_t v5 = (int8x8_t)a1[1];
  if (!*(void *)&v5) {
    return 0;
  }
  unint64_t v6 = v4;
  uint8x8_t v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  unint64_t v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    unint64_t v9 = v4;
    if (v4 >= *(void *)&v5) {
      unint64_t v9 = v4 % *(void *)&v5;
    }
  }
  else
  {
    unint64_t v9 = (*(void *)&v5 - 1) & v4;
  }
  int v10 = *(unsigned __int8 ***)(*a1 + 8 * v9);
  if (!v10) {
    return 0;
  }
  int v11 = *v10;
  if (*v10)
  {
    uint64_t v12 = (uint64_t)(a1 + 4);
    do
    {
      unint64_t v13 = *((void *)v11 + 1);
      if (v6 == v13)
      {
        if (std::equal_to<std::string>::operator()[abi:ne180100](v12, v11 + 16, a2)) {
          return v11;
        }
      }
      else
      {
        if (v8 > 1)
        {
          if (v13 >= *(void *)&v5) {
            v13 %= *(void *)&v5;
          }
        }
        else
        {
          v13 &= *(void *)&v5 - 1;
        }
        if (v13 != v9) {
          return 0;
        }
      }
      int v11 = *(unsigned __int8 **)v11;
    }
    while (v11);
  }
  return v11;
}

uint64_t InputTranscoder::CandidateImpl::toString@<X0>(InputTranscoder::CandidateImpl *this@<X0>, void *a2@<X8>)
{
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v35);
  unint64_t v4 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v35, (uint64_t)"candidate=", 10);
  int v5 = *((char *)this + 23);
  if (v5 >= 0) {
    unint64_t v6 = this;
  }
  else {
    unint64_t v6 = *(InputTranscoder::CandidateImpl **)this;
  }
  if (v5 >= 0) {
    uint64_t v7 = *((unsigned __int8 *)this + 23);
  }
  else {
    uint64_t v7 = *((void *)this + 1);
  }
  unint64_t v8 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v4, (uint64_t)v6, v7);
  unint64_t v9 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)", score=", 8);
  *(_DWORD *)((char *)v9 + *(void *)(*v9 - 24) + 8) = *(_DWORD *)((unsigned char *)v9 + *(void *)(*v9 - 24) + 8) & 0xFFFFFEFB | 4;
  int v10 = (void *)std::ostream::operator<<();
  int v11 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)", isCompletion=", 15);
  if (*((unsigned char *)this + 80)) {
    uint64_t v12 = "YES";
  }
  else {
    uint64_t v12 = "NO";
  }
  if (*((unsigned char *)this + 80)) {
    uint64_t v13 = 3;
  }
  else {
    uint64_t v13 = 2;
  }
  BOOL v14 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, (uint64_t)v12, v13);
  uint64_t v15 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v14, (uint64_t)", isValidWord=", 14);
  if (*((unsigned char *)this + 81)) {
    unint64_t v16 = "YES";
  }
  else {
    unint64_t v16 = "NO";
  }
  if (*((unsigned char *)this + 81)) {
    uint64_t v17 = 3;
  }
  else {
    uint64_t v17 = 2;
  }
  uint64_t v18 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)v16, v17);
  uint64_t v19 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)", isMultiWord=", 14);
  if (*((unsigned char *)this + 82)) {
    uint64_t v20 = "YES";
  }
  else {
    uint64_t v20 = "NO";
  }
  if (*((unsigned char *)this + 82)) {
    uint64_t v21 = 3;
  }
  else {
    uint64_t v21 = 2;
  }
  unint64_t v22 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v19, (uint64_t)v20, v21);
  uint64_t v23 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v22, (uint64_t)", foundOnlyInDynamicLexicons=", 29);
  if (*((unsigned char *)this + 88)) {
    unint64_t v24 = "YES";
  }
  else {
    unint64_t v24 = "NO";
  }
  if (*((unsigned char *)this + 88)) {
    uint64_t v25 = 3;
  }
  else {
    uint64_t v25 = 2;
  }
  uint64_t v26 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v23, (uint64_t)v24, v25);
  uint64_t v27 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v26, (uint64_t)", prefix=", 9);
  uint64_t v30 = *((void *)this + 12);
  uint64_t v29 = (char *)this + 96;
  uint64_t v28 = v30;
  int v31 = v29[23];
  if (v31 >= 0) {
    uint64_t v32 = (uint64_t)v29;
  }
  else {
    uint64_t v32 = v28;
  }
  if (v31 >= 0) {
    uint64_t v33 = v29[23];
  }
  else {
    uint64_t v33 = *((void *)v29 + 1);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v27, v32, v33);
  std::stringbuf::str[abi:ne180100]<std::allocator<char>>((uint64_t)v36, a2);
  uint64_t v35 = *MEMORY[0x263F8C2C8];
  *(void *)((char *)&v36[-1] + *(void *)(v35 - 24)) = *(void *)(MEMORY[0x263F8C2C8] + 24);
  v36[0] = MEMORY[0x263F8C318] + 16;
  if (v37 < 0) {
    operator delete((void *)v36[8]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x237E08B30](&v38);
}

void sub_2369F6CE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void InputTranscoder::PathKeyLayoutProcessor::input_feature_stream_for_path(InputTranscoder::PathKeyLayoutProcessor *this@<X0>, const InputTranscoder::Path *a2@<X1>, int a3@<W2>, int a4@<W3>, int a5@<W4>, int a6@<W5>, char **a7@<X8>)
{
  v35[4] = *MEMORY[0x263EF8340];
  InputTranscoder::PathKeyLayoutProcessor::input_stream_for_path(this, a2, a3, a4, a5, &v33);
  uint64_t v32 = 0x3F800000BF800000;
  *a7 = 0;
  a7[1] = 0;
  a7[2] = 0;
  uint64_t v11 = (char *)v34 - (char *)v33;
  if (v34 != v33)
  {
    if ((unint64_t)v11 >= 0x1FFFFFFFFFFFFFFDLL) {
      std::vector<InputTranscoder::InputFeature>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<InputTranscoder::InputFeature>>((uint64_t)(a7 + 2), v11 >> 2);
    uint64_t v15 = *a7;
    BOOL v14 = a7[1];
    unint64_t v16 = v12;
    if (v14 != *a7)
    {
      do
      {
        long long v17 = *((_OWORD *)v14 - 2);
        *(_OWORD *)(v16 - 2nlp::CFScopedPtr<__CFURL const*>::reset(&a9, 0) = *(_OWORD *)(v14 - 20);
        *((_OWORD *)v16 - 2) = v17;
        v16 -= 32;
        v14 -= 32;
      }
      while (v14 != v15);
      BOOL v14 = v15;
    }
    *a7 = v16;
    a7[1] = v12;
    a7[2] = &v12[32 * v13];
    if (v14) {
      operator delete(v14);
    }
  }
  uint64_t v18 = v34;
  if (v34 != v33)
  {
    uint64_t v19 = 0;
    unint64_t v20 = 0;
    do
    {
      uint64_t v21 = (long long *)(*(void *)a2 + v19);
      long long v22 = v21[3];
      long long v24 = *v21;
      long long v23 = v21[1];
      long long v30 = v21[2];
      long long v31 = v22;
      v29[0] = v24;
      v29[1] = v23;
      uint64_t v25 = *((void *)this + 3);
      v35[0] = &unk_26E9DB0A8;
      v35[1] = v29;
      void v35[2] = &v32;
      v35[3] = v35;
      double v26 = (*(double (**)(double, double, float, float))(**(void **)v25 + 64))(*(double *)&v24, *((double *)&v24 + 1), *(float *)&v32, *((float *)&v32 + 1));
      double v28 = v27;
      std::__function::__value_func<CGPoint const ()(InputTranscoder::KeyboardLayout &)>::~__value_func[abi:ne180100](v35);
      InputTranscoder::appendFeature(v33[v20++], DWORD2(v30) + a6, (void **)a7, v26, v28);
      uint64_t v18 = v33;
      v19 += 64;
    }
    while (v20 < v34 - v33);
  }
  if (v18)
  {
    uint64_t v34 = v18;
    operator delete(v18);
  }
}

void sub_2369F6F00(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, uint64_t a20,char a21)
{
}

void InputTranscoder::PathKeyLayoutProcessor::input_stream_for_path(InputTranscoder::PathKeyLayoutProcessor *this@<X0>, const InputTranscoder::Path *a2@<X1>, int a3@<W2>, int a4@<W3>, int a5@<W4>, int **a6@<X8>)
{
  *a6 = 0;
  a6[1] = 0;
  a6[2] = 0;
  uint64_t v12 = a6 + 2;
  uint64_t v13 = *((void *)a2 + 1) - *(void *)a2;
  if ((unint64_t)v13 >= 0x100)
  {
    BOOL v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)v12, (unint64_t)(v13 >> 6) >> 2);
    unint64_t v16 = *a6;
    long long v17 = a6[1];
    uint64_t v18 = v14;
    while (v17 != v16)
    {
      int v19 = *--v17;
      *((_DWORD *)v18 - 1) = v19;
      v18 -= 4;
    }
    *a6 = (int *)v18;
    a6[1] = (int *)v14;
    a6[2] = (int *)&v14[4 * v15];
    if (v16) {
      operator delete(v16);
    }
  }
  uint64_t v20 = *(void *)a2;
  if (*((void *)a2 + 1) != *(void *)a2)
  {
    unint64_t v21 = 0;
    int v22 = -1;
    do
    {
      int v23 = v22;
      uint64_t v24 = *((void *)this + 1);
      InputTranscoder::PathKeyLayoutProcessor::keystr_for_touch((uint64_t)this, (long long *)(v20 + (v21 << 6)), &__p);
      int v22 = *(_DWORD *)(*(uint64_t (**)(uint64_t, std::string *))(*(void *)v24 + 32))(v24, &__p);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(__p.__r_.__value_.__l.__data_);
        if (a5)
        {
LABEL_13:
          if (InputTranscoder::Path::inflection_point_count(a2, v21, v21)
            || !v21
            || ((uint64_t)(*((void *)a2 + 1) - *(void *)a2) >> 6) - 1 == v21)
          {
            v22 += a4;
          }
        }
      }
      else if (a5)
      {
        goto LABEL_13;
      }
      uint64_t v25 = a6[1];
      if (v21 && a3 && v22 == v23) {
        a6[1] = --v25;
      }
      if ((unint64_t)v25 >= *v12)
      {
        double v27 = *a6;
        uint64_t v28 = v25 - *a6;
        unint64_t v29 = v28 + 1;
        if ((unint64_t)(v28 + 1) >> 62) {
          std::vector<float>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v30 = *v12 - (void)v27;
        if (v30 >> 1 > v29) {
          unint64_t v29 = v30 >> 1;
        }
        if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v31 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v31 = v29;
        }
        if (v31)
        {
          uint64_t v32 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)v12, v31);
          double v27 = *a6;
          uint64_t v25 = a6[1];
        }
        else
        {
          uint64_t v32 = 0;
        }
        uint64_t v33 = (int *)&v32[4 * v28];
        *uint64_t v33 = v22;
        double v26 = v33 + 1;
        while (v25 != v27)
        {
          int v34 = *--v25;
          *--uint64_t v33 = v34;
        }
        *a6 = v33;
        a6[1] = v26;
        a6[2] = (int *)&v32[4 * v31];
        if (v27) {
          operator delete(v27);
        }
      }
      else
      {
        int *v25 = v22;
        double v26 = v25 + 1;
      }
      a6[1] = v26;
      ++v21;
      uint64_t v20 = *(void *)a2;
    }
    while (v21 < (uint64_t)(*((void *)a2 + 1) - *(void *)a2) >> 6);
  }
}

void sub_2369F7194(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  long long v17 = *(void **)v15;
  if (*(void *)v15)
  {
    *(void *)(v15 + 8) = v17;
    operator delete(v17);
  }
  _Unwind_Resume(exception_object);
}

void InputTranscoder::PathKeyLayoutProcessor::input_stream_for_path(InputTranscoder::PathKeyLayoutProcessor *this@<X0>, const InputTranscoder::Path *a2@<X1>, uint64_t a3@<X8>)
{
  v35[4] = *MEMORY[0x263EF8340];
  *(void *)a3 = 0;
  *(void *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0;
  std::vector<float>::reserve((void **)a3, (uint64_t)(*((void *)a2 + 1) - *(void *)a2) >> 5);
  uint64_t v34 = 0x3F800000BF800000;
  unint64_t v6 = *(double **)a2;
  uint64_t v7 = (double *)*((void *)a2 + 1);
  if (*(double **)a2 != v7)
  {
    do
    {
      uint64_t v8 = *((void *)this + 3);
      v35[0] = &unk_26E9DB138;
      v35[1] = v6;
      void v35[2] = &v34;
      v35[3] = v35;
      double v9 = (*(double (**)(double, double, float, float))(**(void **)v8 + 64))(*v6, v6[1], *(float *)&v34, *((float *)&v34 + 1));
      double v11 = v10;
      std::__function::__value_func<CGPoint const ()(InputTranscoder::KeyboardLayout &)>::~__value_func[abi:ne180100](v35);
      float v12 = v9;
      BOOL v14 = *(float **)(a3 + 8);
      uint64_t v13 = *(float **)(a3 + 16);
      if (v14 >= v13)
      {
        unint64_t v16 = *(float **)a3;
        uint64_t v17 = ((uint64_t)v14 - *(void *)a3) >> 2;
        unint64_t v18 = v17 + 1;
        if ((unint64_t)(v17 + 1) >> 62) {
          goto LABEL_36;
        }
        uint64_t v19 = (char *)v13 - (char *)v16;
        if (v19 >> 1 > v18) {
          unint64_t v18 = v19 >> 1;
        }
        if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v20 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v20 = v18;
        }
        if (v20)
        {
          unint64_t v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(a3 + 16, v20);
          unint64_t v16 = *(float **)a3;
          BOOL v14 = *(float **)(a3 + 8);
        }
        else
        {
          unint64_t v21 = 0;
        }
        int v22 = (float *)&v21[4 * v17];
        float *v22 = v12;
        uint64_t v15 = v22 + 1;
        while (v14 != v16)
        {
          int v23 = *((_DWORD *)v14-- - 1);
          *((_DWORD *)v22-- - 1) = v23;
        }
        uint64_t v13 = (float *)&v21[4 * v20];
        *(void *)a3 = v22;
        *(void *)(a3 + 8) = v15;
        *(void *)(a3 + 16) = v13;
        if (v16)
        {
          operator delete(v16);
          uint64_t v13 = *(float **)(a3 + 16);
        }
      }
      else
      {
        *BOOL v14 = v12;
        uint64_t v15 = v14 + 1;
      }
      float v24 = v11;
      *(void *)(a3 + 8) = v15;
      if (v15 >= v13)
      {
        double v26 = *(float **)a3;
        uint64_t v27 = ((uint64_t)v15 - *(void *)a3) >> 2;
        unint64_t v28 = v27 + 1;
        if ((unint64_t)(v27 + 1) >> 62) {
LABEL_36:
        }
          std::vector<float>::__throw_length_error[abi:ne180100]();
        uint64_t v29 = (char *)v13 - (char *)v26;
        if (v29 >> 1 > v28) {
          unint64_t v28 = v29 >> 1;
        }
        if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v30 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v30 = v28;
        }
        if (v30)
        {
          unint64_t v31 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(a3 + 16, v30);
          double v26 = *(float **)a3;
          uint64_t v15 = *(float **)(a3 + 8);
        }
        else
        {
          unint64_t v31 = 0;
        }
        uint64_t v32 = (float *)&v31[4 * v27];
        *uint64_t v32 = v24;
        uint64_t v25 = v32 + 1;
        while (v15 != v26)
        {
          int v33 = *((_DWORD *)v15-- - 1);
          *((_DWORD *)v32-- - 1) = v33;
        }
        *(void *)a3 = v32;
        *(void *)(a3 + 8) = v25;
        *(void *)(a3 + 16) = &v31[4 * v30];
        if (v26) {
          operator delete(v26);
        }
      }
      else
      {
        float *v15 = v24;
        uint64_t v25 = v15 + 1;
      }
      *(void *)(a3 + 8) = v25;
      v6 += 8;
    }
    while (v6 != v7);
  }
}

void sub_2369F7460(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  float v12 = *(void **)v10;
  if (*(void *)v10)
  {
    *(void *)(v10 + 8) = v12;
    operator delete(v12);
  }
  _Unwind_Resume(exception_object);
}

void InputTranscoder::PathKeyLayoutProcessor::keystr_for_touch(uint64_t a1@<X0>, long long *a2@<X1>, std::string *a3@<X8>)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  a3->__r_.__value_.__r.__words[0] = 0;
  a3->__r_.__value_.__l.__size_ = 0;
  a3->__r_.__value_.__r.__words[2] = 0;
  switch(*(_DWORD *)(a1 + 40))
  {
    case 1:
      unint64_t v6 = *(void **)(a1 + 24);
      uint64_t v7 = (*(uint64_t (**)(void))(**(void **)(a1 + 8) + 16))(*(void *)(a1 + 8));
      long long v27 = a2[2];
      long long v28 = a2[3];
      long long v25 = *a2;
      long long v26 = a2[1];
      char v29 = *(unsigned char *)(a1 + 44);
      if (*(char *)(v7 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v7, *(void *)(v7 + 8));
      }
      else
      {
        long long v8 = *(_OWORD *)v7;
        __p.__r_.__value_.__r.__words[2] = *(void *)(v7 + 16);
        *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v8;
      }
      int v33 = 0;
      float v24 = (char *)operator new(0x70uLL);
      *(void *)float v24 = &unk_26E9DB250;
      *((void *)v24 + 1) = InputTranscoder::getNearestKeyOrUnk;
      *((_OWORD *)v24 + 1) = v25;
      *((_OWORD *)v24 + 2) = v26;
      *((_OWORD *)v24 + 3) = v27;
      *((_OWORD *)v24 + 4) = v28;
      v24[80] = v29;
      *(std::string *)(v24 + 88) = __p;
      memset(&__p, 0, sizeof(__p));
      int v33 = v24;
      ((void (*)(std::string *__return_ptr, char *, void, BOOL, char *))InputTranscoder::getNearestKeyOrUnk)(&v31, v24 + 16, *v6, v29 != 0, v24 + 88);
      *a3 = v31;
      *((unsigned char *)&v31.__r_.__value_.__s + 23) = 0;
      v31.__r_.__value_.__s.__data_[0] = 0;
      std::__function::__value_func<std::string ()(InputTranscoder::KeyboardLayout &)>::~__value_func[abi:ne180100](v32);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      return;
    case 2:
      double v9 = *(uint64_t **)(a1 + 24);
      int v10 = *(unsigned __int8 *)(a1 + 44);
      double v11 = (char *)operator new(0x58uLL);
      *(void *)double v11 = &unk_26E9DB1B8;
      *((void *)v11 + 1) = InputTranscoder::getEnclosingOrNearestKey;
      long long v12 = a2[1];
      *((_OWORD *)v11 + 1) = *a2;
      *((_OWORD *)v11 + 2) = v12;
      long long v13 = a2[3];
      *((_OWORD *)v11 + 3) = a2[2];
      *((_OWORD *)v11 + 4) = v13;
      v11[80] = v10;
      int v33 = v11;
      InputTranscoder::getEnclosingOrNearestKey((double *)v11 + 2, *v9, v10 != 0, &v31);
      goto LABEL_7;
    case 3:
      BOOL v14 = *(uint64_t **)(a1 + 24);
      int v15 = *(unsigned __int8 *)(a1 + 44);
      unint64_t v16 = (char *)operator new(0x58uLL);
      *(void *)unint64_t v16 = &unk_26E9DB1B8;
      *((void *)v16 + 1) = InputTranscoder::getMostProbableMultiKey;
      long long v17 = a2[1];
      *((_OWORD *)v16 + 1) = *a2;
      *((_OWORD *)v16 + 2) = v17;
      long long v18 = a2[3];
      *((_OWORD *)v16 + 3) = a2[2];
      *((_OWORD *)v16 + 4) = v18;
      v16[80] = v15;
      int v33 = v16;
      InputTranscoder::getMostProbableMultiKey((double *)v16 + 2, *v14, v15 != 0, &v31);
      goto LABEL_7;
    default:
      uint64_t v19 = *(uint64_t **)(a1 + 24);
      int v20 = *(unsigned __int8 *)(a1 + 44);
      unint64_t v21 = (char *)operator new(0x58uLL);
      *(void *)unint64_t v21 = &unk_26E9DB1B8;
      *((void *)v21 + 1) = InputTranscoder::getNearestKey;
      long long v22 = a2[1];
      *((_OWORD *)v21 + 1) = *a2;
      *((_OWORD *)v21 + 2) = v22;
      long long v23 = a2[3];
      *((_OWORD *)v21 + 3) = a2[2];
      *((_OWORD *)v21 + 4) = v23;
      v21[80] = v20;
      int v33 = v21;
      InputTranscoder::getNearestKey((double *)v21 + 2, *v19, v20 != 0, &v31);
LABEL_7:
      *a3 = v31;
      *((unsigned char *)&v31.__r_.__value_.__s + 23) = 0;
      v31.__r_.__value_.__s.__data_[0] = 0;
      std::__function::__value_func<std::string ()(InputTranscoder::KeyboardLayout &)>::~__value_func[abi:ne180100](v32);
      return;
  }
}

void sub_2369F785C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  std::__function::__value_func<std::string ()(InputTranscoder::KeyboardLayout &)>::~__value_func[abi:ne180100]((void *)(v25 - 88));
  if (a25 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void InputTranscoder::getNearestKey(double *a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, std::string *a4@<X8>)
{
  uint64_t v10 = 0;
  double v11 = &v10;
  uint64_t v12 = 0x4002000000;
  long long v13 = __Block_byref_object_copy__2;
  BOOL v14 = __Block_byref_object_dispose__2;
  std::string __p = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  double v5 = *a1;
  double v6 = a1[1];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 0x40000000;
  v8[2] = ___ZN15InputTranscoderL13getNearestKeyERKNS_10PathSampleERNS_14KeyboardLayoutEb_block_invoke;
  void v8[3] = &unk_264CBA5A0;
  char v9 = a3;
  v8[4] = &v10;
  v8[5] = a2;
  (*(void (**)(uint64_t, void *, double, double))(*(void *)a2 + 16))(a2, v8, v5, v6);
  if (*((char *)v11 + 63) < 0)
  {
    std::string::__init_copy_ctor_external(a4, (const std::string::value_type *)v11[5], v11[6]);
  }
  else
  {
    long long v7 = *(_OWORD *)(v11 + 5);
    a4->__r_.__value_.__r.__words[2] = v11[7];
    *(_OWORD *)&a4->__r_.__value_.__l.__data_ = v7;
  }
  _Block_object_dispose(&v10, 8);
  if (SHIBYTE(v17) < 0) {
    operator delete(__p);
  }
}

void sub_2369F79FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a27 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void InputTranscoder::getNearestKeyOrUnk(double *a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, std::string *a5@<X8>)
{
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x4002000000;
  int v15 = __Block_byref_object_copy__2;
  uint64_t v16 = __Block_byref_object_dispose__2;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x6002000000;
  v11[3] = __Block_byref_object_copy__4;
  v11[4] = __Block_byref_object_dispose__5;
  double v6 = *a1;
  double v7 = a1[1];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 0x40000000;
  void v9[2] = ___ZN15InputTranscoderL18getNearestKeyOrUnkERKNS_10PathSampleERNS_14KeyboardLayoutEbRKNSt3__112basic_stringIcNS5_11char_traitsIcEENS5_9allocatorIcEEEE_block_invoke;
  void v9[3] = &unk_264CBA5C8;
  char v10 = a3;
  v9[4] = &v12;
  v9[5] = v11;
  v9[6] = a2;
  v9[7] = a1;
  v9[8] = a4;
  (*(void (**)(uint64_t, void *, double, double))(*(void *)a2 + 16))(a2, v9, v6, v7);
  if (*((char *)v13 + 63) < 0)
  {
    std::string::__init_copy_ctor_external(a5, (const std::string::value_type *)v13[5], v13[6]);
  }
  else
  {
    long long v8 = *(_OWORD *)(v13 + 5);
    a5->__r_.__value_.__r.__words[2] = v13[7];
    *(_OWORD *)&a5->__r_.__value_.__l.__data_ = v8;
  }
  _Block_object_dispose(v11, 8);
  _Block_object_dispose(&v12, 8);
  if (SHIBYTE(v19) < 0) {
    operator delete(v17);
  }
}

void sub_2369F7BA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  if (*(char *)(v11 - 17) < 0) {
    operator delete(*(void **)(v11 - 40));
  }
  _Unwind_Resume(a1);
}

void InputTranscoder::getEnclosingOrNearestKey(double *a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, std::string *a4@<X8>)
{
  uint64_t v12 = 0;
  memset(v11, 0, sizeof(v11));
  (*(void (**)(_OWORD *__return_ptr, uint64_t, double, double))(*(void *)a2 + 24))(v11, a2, *a1, a1[1]);
  nlp::getUTF8StringFromCFString((const __CFString *)v12, &__p);
  if (a3)
  {
    InputTranscoder::transformNonLetterKeys((uint64_t)&__p, &v9);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    std::string __p = v9;
  }
  int v8 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 80))(a2);
  if (InputTranscoder::keyIsValid((uint64_t)v11, a3, v8))
  {
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(a4, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
    }
    else {
      *a4 = __p;
    }
  }
  else
  {
    InputTranscoder::getNearestKey(a1, a2, a3, a4);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_2369F7D1C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void InputTranscoder::getMostProbableMultiKey(double *a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, std::string *a4@<X8>)
{
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x4002000000;
  int v15 = __Block_byref_object_copy__2;
  uint64_t v16 = __Block_byref_object_dispose__2;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2000000000;
  int v11 = 0;
  double v5 = *a1;
  double v6 = a1[1];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 0x40000000;
  v8[2] = ___ZN15InputTranscoderL23getMostProbableMultiKeyERKNS_10PathSampleERNS_14KeyboardLayoutEb_block_invoke;
  void v8[3] = &unk_264CBA5F0;
  char v9 = a3;
  v8[5] = &v12;
  void v8[6] = a2;
  v8[4] = v10;
  (*(void (**)(uint64_t, void *, double, double))(*(void *)a2 + 16))(a2, v8, v5, v6);
  if (*((char *)v13 + 63) < 0)
  {
    std::string::__init_copy_ctor_external(a4, (const std::string::value_type *)v13[5], v13[6]);
  }
  else
  {
    long long v7 = *(_OWORD *)(v13 + 5);
    a4->__r_.__value_.__r.__words[2] = v13[7];
    *(_OWORD *)&a4->__r_.__value_.__l.__data_ = v7;
  }
  _Block_object_dispose(v10, 8);
  _Block_object_dispose(&v12, 8);
  if (SHIBYTE(v19) < 0) {
    operator delete(v17);
  }
}

void sub_2369F7E94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  if (*(char *)(v9 - 17) < 0) {
    operator delete(*(void **)(v9 - 40));
  }
  _Unwind_Resume(a1);
}

uint64_t InputTranscoder::PathKeyLayoutProcessor::key_class_for_touch(uint64_t a1, long long *a2)
{
  InputTranscoder::PathKeyLayoutProcessor::keystr_for_touch(a1, a2, &__p);
  uint64_t v2 = InputTranscoder::map_to_key_class((uint64_t *)&__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return v2;
}

uint64_t InputTranscoder::map_to_key_class(uint64_t *a1)
{
  uint64_t v1 = *((unsigned __int8 *)a1 + 23);
  int v2 = (char)v1;
  if ((v1 & 0x80u) != 0) {
    uint64_t v1 = a1[1];
  }
  if (v1 == 6)
  {
    if (v2 >= 0) {
      long long v7 = a1;
    }
    else {
      long long v7 = (uint64_t *)*a1;
    }
    unsigned int v8 = 1684368485;
    unsigned int v9 = bswap32(*(_DWORD *)v7);
    if (v9 == 1684368485 && (v9 = bswap32(*((unsigned __int16 *)v7 + 2)) >> 16, unsigned int v8 = 29797, v9 == 29797))
    {
      int v10 = 0;
    }
    else if (v9 < v8)
    {
      int v10 = -1;
    }
    else
    {
      int v10 = 1;
    }
    BOOL v5 = v10 == 0;
    unsigned int v6 = 4;
  }
  else
  {
    if (v1 != 5) {
      return 1;
    }
    if (v2 >= 0) {
      uint64_t v3 = a1;
    }
    else {
      uint64_t v3 = (uint64_t *)*a1;
    }
    if (*(_DWORD *)v3 == 1718184051 && *((unsigned char *)v3 + 4) == 116) {
      return 2;
    }
    BOOL v5 = (*(_DWORD *)v3 ^ 0x63617073 | *((unsigned __int8 *)v3 + 4) ^ 0x65) == 0;
    unsigned int v6 = 3;
  }
  if (v5) {
    return v6;
  }
  else {
    return 1;
  }
}

uint64_t InputTranscoder::PathKeyLayoutProcessor::key_class_for_touch_key(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v4 = *(unsigned __int8 *)(a1 + 44);
  uint64_t v5 = *(void *)(a1 + 24);
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&unk_26E9DB2E8;
  p_p = &__p;
  int v6 = (*(uint64_t (**)(void))(**(void **)v5 + 80))();
  int IsValid = InputTranscoder::keyIsValid(a2, v4 != 0, v6);
  std::__function::__value_func<BOOL ()(InputTranscoder::KeyboardLayout &)>::~__value_func[abi:ne180100](&__p);
  if (!IsValid) {
    return 0;
  }
  nlp::getUTF8StringFromCFString(*(const __CFString **)(a2 + 48), &__p);
  if (*(unsigned char *)(a1 + 44))
  {
    InputTranscoder::transformNonLetterKeys((uint64_t)&__p, &v10);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    std::string __p = v10;
  }
  uint64_t v8 = InputTranscoder::map_to_key_class((uint64_t *)&__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return v8;
}

void sub_2369F8140(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t InputTranscoder::keyIsValid(uint64_t a1, int a2, int a3)
{
  CFIndex Length = CFStringGetLength(*(CFStringRef *)(a1 + 48));
  uint64_t v7 = Length != 0;
  if (Length) {
    BOOL v8 = a3 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8) {
    return v7;
  }
  nlp::getUTF8StringFromCFString(*(const __CFString **)(a1 + 48), &__p);
  uint64_t v9 = v30;
  unsigned __int8 v10 = v30;
  if ((v30 & 0x80u) != 0) {
    uint64_t v9 = v29;
  }
  if (v9 != 1) {
    goto LABEL_18;
  }
  if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((const void **)&__p, "a") & 0x80) == 0
    && (int)(std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((const void **)&__p, "z") << 24) <= 0xFFFFFF)
  {
    unsigned __int8 v10 = v30;
    goto LABEL_20;
  }
  uint64_t v11 = v30;
  unsigned __int8 v10 = v30;
  if ((v30 & 0x80u) != 0) {
    uint64_t v11 = v29;
  }
  if (v11 != 2) {
    goto LABEL_18;
  }
  p_p = (unsigned __int16 *)__p;
  if ((v30 & 0x80u) == 0) {
    p_p = (unsigned __int16 *)&__p;
  }
  if (*p_p != 46274 && *p_p != 45507)
  {
LABEL_18:
    int v13 = 0;
    if (!a2) {
      goto LABEL_48;
    }
    goto LABEL_21;
  }
LABEL_20:
  int v13 = 1;
  if (!a2) {
    goto LABEL_48;
  }
LABEL_21:
  uint64_t v14 = v29;
  if ((v10 & 0x80u) == 0) {
    uint64_t v14 = v10;
  }
  if (v14 == 6)
  {
    uint64_t v18 = (unsigned __int16 *)&__p;
    if ((v10 & 0x80u) != 0) {
      uint64_t v18 = (unsigned __int16 *)__p;
    }
    int v19 = *(_DWORD *)v18;
    int v20 = v18[2];
    LODWORD(v17) = v19 == 1701602660 && v20 == 25972;
    goto LABEL_49;
  }
  if (v14 != 5)
  {
    if (v14 == 1)
    {
      int v15 = (unsigned __int8 *)&__p;
      if ((v10 & 0x80u) != 0) {
        int v15 = (unsigned __int8 *)__p;
      }
      unsigned int v16 = *v15;
      if (v16 < 0x21)
      {
        unint64_t v17 = (0x10001E500uLL >> v16) & 1;
        goto LABEL_49;
      }
    }
    goto LABEL_48;
  }
  long long v22 = (unsigned __int8 *)&__p;
  if ((v10 & 0x80u) != 0) {
    long long v22 = (unsigned __int8 *)__p;
  }
  if (*(_DWORD *)v22 != 1718184051 || v22[4] != 116)
  {
    int v24 = *(_DWORD *)v22;
    int v25 = v22[4];
    if (v24 != 1667330163 || v25 != 101)
    {
LABEL_48:
      LODWORD(v17) = 0;
      goto LABEL_49;
    }
  }
  LODWORD(v17) = 1;
LABEL_49:
  uint64_t v7 = v13 | v17;
  if ((v10 & 0x80) != 0) {
    operator delete(__p);
  }
  return v7;
}

void InputTranscoder::transformNonLetterKeys(uint64_t a1@<X0>, std::string *a2@<X8>)
{
  int v4 = *(char *)(a1 + 23);
  int v6 = *(const std::string::value_type **)a1;
  std::string::size_type v5 = *(void *)(a1 + 8);
  if (v4 >= 0) {
    int64_t v7 = *(unsigned __int8 *)(a1 + 23);
  }
  else {
    int64_t v7 = *(void *)(a1 + 8);
  }
  if (v4 >= 0) {
    BOOL v8 = (const std::string::value_type *)a1;
  }
  else {
    BOOL v8 = *(const std::string::value_type **)a1;
  }
  if (v7 < 1) {
    goto LABEL_73;
  }
  uint64_t v9 = &v8[v7];
  size_t v10 = v7;
  uint64_t v11 = (void *)v8;
  while (1)
  {
    uint64_t v12 = (const std::string::value_type *)memchr(v11, 14, v10);
    if (!v12) {
      goto LABEL_15;
    }
    if (*v12 == 14) {
      break;
    }
    uint64_t v11 = (void *)(v12 + 1);
    size_t v10 = v9 - (unsigned char *)v11;
    if (v9 - (unsigned char *)v11 < 1) {
      goto LABEL_15;
    }
  }
  if (v12 != v9 && v12 - v8 != -1)
  {
LABEL_24:
    unint64_t v17 = "shift";
LABEL_76:
    std::string::basic_string[abi:ne180100]<0>(a2, v17);
    return;
  }
LABEL_15:
  size_t v13 = v7;
  uint64_t v14 = (void *)v8;
  if (v7 == 5)
  {
    BOOL v15 = *(_DWORD *)v8 == 1718184051 && v8[4] == 116;
    size_t v13 = 5;
    uint64_t v14 = (void *)v8;
    if (v15) {
      goto LABEL_24;
    }
  }
  while (1)
  {
    unsigned int v16 = (const std::string::value_type *)memchr(v14, 8, v13);
    if (!v16) {
      goto LABEL_27;
    }
    if (*v16 == 8) {
      break;
    }
    uint64_t v14 = (void *)(v16 + 1);
    size_t v13 = v9 - (unsigned char *)v14;
    if (v9 - (unsigned char *)v14 < 1) {
      goto LABEL_27;
    }
  }
  if (v16 != v9 && v16 - v8 != -1)
  {
LABEL_40:
    unint64_t v17 = "delete";
    goto LABEL_76;
  }
LABEL_27:
  size_t v18 = v7;
  int v19 = (void *)v8;
  do
  {
    int v20 = (const std::string::value_type *)memchr(v19, 8, v18);
    if (!v20) {
      break;
    }
    if (*v20 == 8)
    {
      if (v20 != v9 && v20 - v8 != -1) {
        goto LABEL_40;
      }
      break;
    }
    int v19 = (void *)(v20 + 1);
    size_t v18 = v9 - (unsigned char *)v19;
  }
  while (v9 - (unsigned char *)v19 >= 1);
  if (v7 == 6 && *(_DWORD *)v8 == 1701602660 && *((_WORD *)v8 + 2) == 25972) {
    goto LABEL_40;
  }
  size_t v22 = v7;
  long long v23 = (void *)v8;
  do
  {
    int v24 = (const std::string::value_type *)memchr(v23, 15, v22);
    if (!v24) {
      break;
    }
    if (*v24 == 15)
    {
      if (v24 != v9 && v24 - v8 != -1)
      {
        unint64_t v17 = "{international}";
        goto LABEL_76;
      }
      break;
    }
    long long v23 = (void *)(v24 + 1);
    size_t v22 = v9 - (unsigned char *)v23;
  }
  while (v9 - (unsigned char *)v23 >= 1);
  size_t v25 = v7;
  long long v26 = (void *)v8;
  do
  {
    long long v27 = (const std::string::value_type *)memchr(v26, 16, v25);
    if (!v27) {
      break;
    }
    if (*v27 == 16)
    {
      if (v27 != v9 && v27 - v8 != -1)
      {
        unint64_t v17 = "{more}";
        goto LABEL_76;
      }
      break;
    }
    long long v26 = (void *)(v27 + 1);
    size_t v25 = v9 - (unsigned char *)v26;
  }
  while (v9 - (unsigned char *)v26 >= 1);
  size_t v28 = v7;
  uint64_t v29 = (void *)v8;
  do
  {
    unsigned __int8 v30 = (const std::string::value_type *)memchr(v29, 10, v28);
    if (!v30) {
      break;
    }
    if (*v30 == 10)
    {
      if (v30 != v9 && v30 - v8 != -1)
      {
        unint64_t v17 = "{newline}";
        goto LABEL_76;
      }
      break;
    }
    uint64_t v29 = (void *)(v30 + 1);
    size_t v28 = v9 - (unsigned char *)v29;
  }
  while (v9 - (unsigned char *)v29 >= 1);
  std::string v31 = (void *)v8;
  do
  {
    uint64_t v32 = (const std::string::value_type *)memchr(v31, 13, v7);
    if (!v32) {
      break;
    }
    if (*v32 == 13)
    {
      if (v32 != v9 && v32 - v8 != -1)
      {
        unint64_t v17 = "{return}";
        goto LABEL_76;
      }
      break;
    }
    std::string v31 = (void *)(v32 + 1);
    int64_t v7 = v9 - (unsigned char *)v31;
  }
  while (v9 - (unsigned char *)v31 >= 1);
LABEL_73:
  if (std::string::find[abi:ne180100]((char **)a1, " ") != -1
    || std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((const void **)a1, "space"))
  {
    unint64_t v17 = "space";
    goto LABEL_76;
  }
  if (v4 < 0)
  {
    std::string::__init_copy_ctor_external(a2, v6, v5);
  }
  else
  {
    *(_OWORD *)&a2->__r_.__value_.__l.__data_ = *(_OWORD *)a1;
    a2->__r_.__value_.__r.__words[2] = *(void *)(a1 + 16);
  }
}

void *InputTranscoder::PathKeyLayoutProcessor::getInflectionString@<X0>(void *result@<X0>, long long **a2@<X1>, std::string *a3@<X8>)
{
  v16[4] = *MEMORY[0x263EF8340];
  a3->__r_.__value_.__r.__words[0] = 0;
  a3->__r_.__value_.__l.__size_ = 0;
  a3->__r_.__value_.__r.__words[2] = 0;
  int v4 = *a2;
  std::string::size_type v5 = a2[1];
  if (*a2 != v5)
  {
    int v6 = result;
    do
    {
      if (!*((unsigned char *)v4 + 56))
      {
        int64_t v7 = (uint64_t *)v6[3];
        long long v11 = *v4;
        long long v12 = v4[1];
        long long v13 = v4[2];
        long long v14 = v4[3];
        BOOL v8 = operator new(0x58uLL);
        *(void *)BOOL v8 = &unk_26E9DB378;
        *((void *)v8 + 1) = InputTranscoder::getNearestKeyWithoutValidCheck;
        *((_OWORD *)v8 + 1) = v11;
        *((_OWORD *)v8 + 2) = v12;
        *((_OWORD *)v8 + 3) = v13;
        *((_OWORD *)v8 + 4) = v14;
        *((unsigned char *)v8 + 8nlp::CFScopedPtr<__CFURL const*>::reset(&a9, 0) = 0;
        v16[3] = v8;
        InputTranscoder::getNearestKeyWithoutValidCheck((double *)v8 + 2, *v7, 0, &__p);
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
        std::string::append(a3, (const std::string::value_type *)p_p, size);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
        uint64_t result = std::__function::__value_func<std::string ()(InputTranscoder::KeyboardLayout &)>::~__value_func[abi:ne180100](v16);
      }
      v4 += 4;
    }
    while (v4 != v5);
  }
  return result;
}

void sub_2369F888C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23)
{
  if (a22 < 0) {
    operator delete(__p);
  }
  std::__function::__value_func<std::string ()(InputTranscoder::KeyboardLayout &)>::~__value_func[abi:ne180100](&a23);
  if (*(char *)(v23 + 23) < 0) {
    operator delete(*(void **)v23);
  }
  _Unwind_Resume(a1);
}

void InputTranscoder::getNearestKeyWithoutValidCheck(double *a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, std::string *a4@<X8>)
{
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x4002000000;
  long long v13 = __Block_byref_object_copy__2;
  long long v14 = __Block_byref_object_dispose__2;
  std::string __p = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  double v5 = *a1;
  double v6 = a1[1];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 0x40000000;
  v8[2] = ___ZN15InputTranscoderL30getNearestKeyWithoutValidCheckERKNS_10PathSampleERNS_14KeyboardLayoutEb_block_invoke;
  void v8[3] = &unk_264CBA618;
  char v9 = a3;
  v8[4] = &v10;
  (*(void (**)(uint64_t, void *, double, double))(*(void *)a2 + 16))(a2, v8, v5, v6);
  if (*((char *)v11 + 63) < 0)
  {
    std::string::__init_copy_ctor_external(a4, (const std::string::value_type *)v11[5], v11[6]);
  }
  else
  {
    long long v7 = *(_OWORD *)(v11 + 5);
    a4->__r_.__value_.__r.__words[2] = v11[7];
    *(_OWORD *)&a4->__r_.__value_.__l.__data_ = v7;
  }
  _Block_object_dispose(&v10, 8);
  if (SHIBYTE(v17) < 0) {
    operator delete(__p);
  }
}

void sub_2369F8A00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if (a25 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__2(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(__n128 *)(a1 + 4nlp::CFScopedPtr<__CFURL const*>::reset(&a9, 0) = result;
  *(void *)(a2 + 48) = 0;
  *(void *)(a2 + 56) = 0;
  *(void *)(a2 + 4nlp::CFScopedPtr<__CFURL const*>::reset(&a9, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
  if (*(char *)(a1 + 63) < 0) {
    operator delete(*(void **)(a1 + 40));
  }
}

void ___ZN15InputTranscoderL13getNearestKeyERKNS_10PathSampleERNS_14KeyboardLayoutEb_block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  int v6 = *(unsigned __int8 *)(a1 + 48);
  int v7 = (*(uint64_t (**)(void))(**(void **)(a1 + 40) + 80))(*(void *)(a1 + 40));
  if (InputTranscoder::keyIsValid(a2, v6, v7))
  {
    nlp::getUTF8StringFromCFString(*(const __CFString **)(a2 + 48), &__str);
    if (*(unsigned char *)(a1 + 48))
    {
      InputTranscoder::transformNonLetterKeys((uint64_t)&__str, &v10);
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
      char v9 = (void **)(v8 + 40);
      if (*(char *)(v8 + 63) < 0) {
        operator delete(*v9);
      }
      *(std::string *)char v9 = v10;
    }
    else
    {
      std::string::operator=((std::string *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), &__str);
    }
    *a3 = 1;
    if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__str.__r_.__value_.__l.__data_);
    }
  }
}

void sub_2369F8B88(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

__n128 __Block_byref_object_copy__4(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 40);
  long long v3 = *(_OWORD *)(a2 + 56);
  long long v4 = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(_OWORD *)(a1 + 72) = v4;
  *(_OWORD *)(a1 + 56) = v3;
  *(__n128 *)(a1 + 4nlp::CFScopedPtr<__CFURL const*>::reset(&a9, 0) = result;
  return result;
}

void ___ZN15InputTranscoderL18getNearestKeyOrUnkERKNS_10PathSampleERNS_14KeyboardLayoutEbRKNSt3__112basic_stringIcNS5_11char_traitsIcEENS5_9allocatorIcEEEE_block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  int v6 = *(unsigned __int8 *)(a1 + 72);
  int v7 = (*(uint64_t (**)(void))(**(void **)(a1 + 48) + 80))(*(void *)(a1 + 48));
  if (InputTranscoder::keyIsValid(a2, v6, v7))
  {
    nlp::getUTF8StringFromCFString(*(const __CFString **)(a2 + 48), &__str);
    if (*(unsigned char *)(a1 + 72))
    {
      InputTranscoder::transformNonLetterKeys((uint64_t)&__str, &v17);
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
      char v9 = (void **)(v8 + 40);
      if (*(char *)(v8 + 63) < 0) {
        operator delete(*v9);
      }
      *(std::string *)char v9 = v17;
    }
    else
    {
      std::string::operator=((std::string *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), &__str);
    }
    *a3 = 1;
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    long long v11 = *(_OWORD *)a2;
    long long v12 = *(_OWORD *)(a2 + 16);
    long long v13 = *(_OWORD *)(a2 + 32);
    *(void *)(v10 + 88) = *(void *)(a2 + 48);
    *(_OWORD *)(v10 + 72) = v13;
    *(_OWORD *)(v10 + 56) = v12;
    *(_OWORD *)(v10 + 4nlp::CFScopedPtr<__CFURL const*>::reset(&a9, 0) = v11;
    if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__str.__r_.__value_.__l.__data_);
    }
  }
  double v14 = (*(double (**)(void, uint64_t, double, double))(**(void **)(a1 + 48) + 88))(*(void *)(a1 + 48), a2, **(double **)(a1 + 56), *(double *)(*(void *)(a1 + 56) + 8));
  double v15 = fabs(v14);
  if (v15 >= 2.22507386e-308)
  {
    double v16 = fabs(v14 + 0.0);
    if (v15 > v16 * 2.22044605e-16 + v16 * 2.22044605e-16) {
      std::string::operator=((std::string *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), *(const std::string **)(a1 + 64));
    }
  }
}

void sub_2369F8D64(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void ___ZN15InputTranscoderL23getMostProbableMultiKeyERKNS_10PathSampleERNS_14KeyboardLayoutEb_block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  int v6 = *(unsigned __int8 *)(a1 + 56);
  int v7 = (*(uint64_t (**)(void))(**(void **)(a1 + 48) + 80))(*(void *)(a1 + 48));
  if (!InputTranscoder::keyIsValid(a2, v6, v7)) {
    return;
  }
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  nlp::getUTF8StringFromCFString(*(const __CFString **)(a2 + 48), &v24);
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  char v9 = (std::string *)(v8 + 40);
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v10 = *(unsigned __int8 *)(v8 + 63);
    uint64_t v11 = *(void *)(v8 + 48);
    if ((v10 & 0x80u) == 0) {
      uint64_t v11 = v10;
    }
    if (v11 != 14) {
      goto LABEL_12;
    }
    long long v12 = (std::string::__raw *)v9->__r_.__value_.__r.__words[0];
    if ((v10 & 0x80u) == 0) {
      long long v12 = (std::string::__raw *)v9;
    }
    std::string::size_type v13 = v12->__words[0];
    uint64_t v14 = *(std::string::size_type *)((char *)v12->__words + 6);
    if (v13 != 0x616469646E61637BLL || v14 != 0x7D72614265746164)
    {
LABEL_12:
      InputTranscoder::transformNonLetterKeys((uint64_t)&v24, &__p);
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
      std::string::append((std::string *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), (const std::string::value_type *)p_p, size);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      goto LABEL_30;
    }
    std::string::size_type v18 = v26;
    std::string::size_type v19 = v25;
    BOOL v20 = (v26 & 0x80u) != 0;
    if ((v26 & 0x80u) == 0) {
      unint64_t v21 = (const std::string::value_type *)&v24;
    }
    else {
      unint64_t v21 = (const std::string::value_type *)v24;
    }
  }
  else
  {
    std::string::size_type v18 = v26;
    std::string::size_type v19 = v25;
    BOOL v20 = (v26 & 0x80u) != 0;
    if ((v26 & 0x80u) == 0) {
      unint64_t v21 = (const std::string::value_type *)&v24;
    }
    else {
      unint64_t v21 = (const std::string::value_type *)v24;
    }
  }
  if (v20) {
    std::string::size_type v22 = v19;
  }
  else {
    std::string::size_type v22 = v18;
  }
  std::string::append(v9, v21, v22);
LABEL_30:
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == 2) {
    *a3 = 1;
  }
  if ((char)v26 < 0) {
    operator delete(v24);
  }
}

void sub_2369F8F40(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(const void **a1, char *__s)
{
  int v4 = *((char *)a1 + 23);
  if (v4 >= 0) {
    size_t v5 = *((unsigned __int8 *)a1 + 23);
  }
  else {
    size_t v5 = (size_t)a1[1];
  }
  if (v5 != strlen(__s)) {
    return 0;
  }
  if (v4 >= 0) {
    int v6 = a1;
  }
  else {
    int v6 = *a1;
  }
  return memcmp(v6, __s, v5) == 0;
}

uint64_t std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(const void **a1, char *__s)
{
  int v3 = *((char *)a1 + 23);
  if (v3 >= 0) {
    int v4 = a1;
  }
  else {
    int v4 = *a1;
  }
  if (v3 >= 0) {
    size_t v5 = *((unsigned __int8 *)a1 + 23);
  }
  else {
    size_t v5 = (size_t)a1[1];
  }
  size_t v6 = strlen(__s);

  return std::operator<=>[abi:ne180100]<char,std::char_traits<char>>(v4, v5, __s, v6);
}

uint64_t std::string::find[abi:ne180100](char **a1, char *__s)
{
  int v3 = (char *)a1;
  if (*((char *)a1 + 23) < 0)
  {
    int v3 = *a1;
    uint64_t v4 = (uint64_t)a1[1];
  }
  else
  {
    uint64_t v4 = *((unsigned __int8 *)a1 + 23);
  }
  uint64_t result = strlen(__s);
  if (result)
  {
    int64_t v6 = result;
    int v7 = &v3[v4];
    if (v4 >= result)
    {
      int v9 = *__s;
      uint64_t v10 = v3;
      do
      {
        if (v4 - v6 == -1) {
          break;
        }
        uint64_t v11 = (char *)memchr(v10, v9, v4 - v6 + 1);
        if (!v11) {
          break;
        }
        uint64_t v8 = v11;
        if (!memcmp(v11, __s, v6)) {
          goto LABEL_7;
        }
        uint64_t v10 = v8 + 1;
        uint64_t v4 = v7 - (v8 + 1);
      }
      while (v4 >= v6);
    }
    uint64_t v8 = v7;
LABEL_7:
    if (v8 == v7) {
      return -1;
    }
    else {
      return v8 - v3;
    }
  }
  return result;
}

void ___ZN15InputTranscoderL30getNearestKeyWithoutValidCheckERKNS_10PathSampleERNS_14KeyboardLayoutEb_block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  nlp::getUTF8StringFromCFString(*(const __CFString **)(a2 + 48), &__str);
  if (*(unsigned char *)(a1 + 40))
  {
    InputTranscoder::transformNonLetterKeys((uint64_t)&__str, &v7);
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    int64_t v6 = (void **)(v5 + 40);
    if (*(char *)(v5 + 63) < 0) {
      operator delete(*v6);
    }
    *(std::string *)int64_t v6 = v7;
  }
  else
  {
    std::string::operator=((std::string *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), &__str);
  }
  *a3 = 1;
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
}

void sub_2369F91BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::__function::__func<InputTranscoder::PathKeyLayoutProcessor::input_feature_stream_for_path(InputTranscoder::Path const&,BOOL,unsigned int,BOOL,unsigned int)::$_0,std::allocator<InputTranscoder::PathKeyLayoutProcessor::input_feature_stream_for_path(InputTranscoder::Path const&,BOOL,unsigned int,BOOL,unsigned int)::$_0>,CGPoint const ()(InputTranscoder::KeyboardLayout &)>::~__func()
{
}

__n128 std::__function::__func<InputTranscoder::PathKeyLayoutProcessor::input_feature_stream_for_path(InputTranscoder::Path const&,BOOL,unsigned int,BOOL,unsigned int)::$_0,std::allocator<InputTranscoder::PathKeyLayoutProcessor::input_feature_stream_for_path(InputTranscoder::Path const&,BOOL,unsigned int,BOOL,unsigned int)::$_0>,CGPoint const ()(InputTranscoder::KeyboardLayout &)>::__clone(uint64_t a1)
{
  int v2 = (char *)operator new(0x18uLL);
  *(void *)int v2 = &unk_26E9DB0A8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 std::__function::__func<InputTranscoder::PathKeyLayoutProcessor::input_feature_stream_for_path(InputTranscoder::Path const&,BOOL,unsigned int,BOOL,unsigned int)::$_0,std::allocator<InputTranscoder::PathKeyLayoutProcessor::input_feature_stream_for_path(InputTranscoder::Path const&,BOOL,unsigned int,BOOL,unsigned int)::$_0>,CGPoint const ()(InputTranscoder::KeyboardLayout &)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26E9DB0A8;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t std::__function::__func<InputTranscoder::PathKeyLayoutProcessor::input_feature_stream_for_path(InputTranscoder::Path const&,BOOL,unsigned int,BOOL,unsigned int)::$_0,std::allocator<InputTranscoder::PathKeyLayoutProcessor::input_feature_stream_for_path(InputTranscoder::Path const&,BOOL,unsigned int,BOOL,unsigned int)::$_0>,CGPoint const ()(InputTranscoder::KeyboardLayout &)>::operator()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, double, double, float, float))(*(void *)a2 + 64))(a2, **(double **)(a1 + 8), *(double *)(*(void *)(a1 + 8) + 8), **(float **)(a1 + 16), *(float *)(*(void *)(a1 + 16) + 4));
}

uint64_t std::__function::__func<InputTranscoder::PathKeyLayoutProcessor::input_feature_stream_for_path(InputTranscoder::Path const&,BOOL,unsigned int,BOOL,unsigned int)::$_0,std::allocator<InputTranscoder::PathKeyLayoutProcessor::input_feature_stream_for_path(InputTranscoder::Path const&,BOOL,unsigned int,BOOL,unsigned int)::$_0>,CGPoint const ()(InputTranscoder::KeyboardLayout &)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<InputTranscoder::PathKeyLayoutProcessor::input_feature_stream_for_path(InputTranscoder::Path const&,BOOL,unsigned int,BOOL,unsigned int)::$_0,std::allocator<InputTranscoder::PathKeyLayoutProcessor::input_feature_stream_for_path(InputTranscoder::Path const&,BOOL,unsigned int,BOOL,unsigned int)::$_0>,CGPoint const ()(InputTranscoder::KeyboardLayout &)>::target_type()
{
}

void *std::__function::__value_func<CGPoint const ()(InputTranscoder::KeyboardLayout &)>::~__value_func[abi:ne180100](void *a1)
{
  int v2 = (void *)a1[3];
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

void std::__function::__func<InputTranscoder::PathKeyLayoutProcessor::input_stream_for_path(InputTranscoder::Path const&)::$_0,std::allocator<InputTranscoder::PathKeyLayoutProcessor::input_stream_for_path(InputTranscoder::Path const&)::$_0>,CGPoint const ()(InputTranscoder::KeyboardLayout &)>::~__func()
{
}

__n128 std::__function::__func<InputTranscoder::PathKeyLayoutProcessor::input_stream_for_path(InputTranscoder::Path const&)::$_0,std::allocator<InputTranscoder::PathKeyLayoutProcessor::input_stream_for_path(InputTranscoder::Path const&)::$_0>,CGPoint const ()(InputTranscoder::KeyboardLayout &)>::__clone(uint64_t a1)
{
  int v2 = (char *)operator new(0x18uLL);
  *(void *)int v2 = &unk_26E9DB138;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 std::__function::__func<InputTranscoder::PathKeyLayoutProcessor::input_stream_for_path(InputTranscoder::Path const&)::$_0,std::allocator<InputTranscoder::PathKeyLayoutProcessor::input_stream_for_path(InputTranscoder::Path const&)::$_0>,CGPoint const ()(InputTranscoder::KeyboardLayout &)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26E9DB138;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t std::__function::__func<InputTranscoder::PathKeyLayoutProcessor::input_stream_for_path(InputTranscoder::Path const&)::$_0,std::allocator<InputTranscoder::PathKeyLayoutProcessor::input_stream_for_path(InputTranscoder::Path const&)::$_0>,CGPoint const ()(InputTranscoder::KeyboardLayout &)>::operator()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, double, double, float, float))(*(void *)a2 + 64))(a2, **(double **)(a1 + 8), *(double *)(*(void *)(a1 + 8) + 8), **(float **)(a1 + 16), *(float *)(*(void *)(a1 + 16) + 4));
}

uint64_t std::__function::__func<InputTranscoder::PathKeyLayoutProcessor::input_stream_for_path(InputTranscoder::Path const&)::$_0,std::allocator<InputTranscoder::PathKeyLayoutProcessor::input_stream_for_path(InputTranscoder::Path const&)::$_0>,CGPoint const ()(InputTranscoder::KeyboardLayout &)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<InputTranscoder::PathKeyLayoutProcessor::input_stream_for_path(InputTranscoder::Path const&)::$_0,std::allocator<InputTranscoder::PathKeyLayoutProcessor::input_stream_for_path(InputTranscoder::Path const&)::$_0>,CGPoint const ()(InputTranscoder::KeyboardLayout &)>::target_type()
{
}

void std::__function::__func<std::__bind<std::string (&)(InputTranscoder::PathSample const&,InputTranscoder::KeyboardLayout &,BOOL),InputTranscoder::PathSample const&,std::placeholders::__ph<1> const&,BOOL const&>,std::allocator<std::__bind<std::string (&)(InputTranscoder::PathSample const&,InputTranscoder::KeyboardLayout &,BOOL),InputTranscoder::PathSample const&,std::placeholders::__ph<1> const&,BOOL const&>>,std::string ()(InputTranscoder::KeyboardLayout &)>::~__func()
{
}

__n128 std::__function::__func<std::__bind<std::string (&)(InputTranscoder::PathSample const&,InputTranscoder::KeyboardLayout &,BOOL),InputTranscoder::PathSample const&,std::placeholders::__ph<1> const&,BOOL const&>,std::allocator<std::__bind<std::string (&)(InputTranscoder::PathSample const&,InputTranscoder::KeyboardLayout &,BOOL),InputTranscoder::PathSample const&,std::placeholders::__ph<1> const&,BOOL const&>>,std::string ()(InputTranscoder::KeyboardLayout &)>::__clone(uint64_t a1)
{
  int v2 = (char *)operator new(0x58uLL);
  *(void *)int v2 = &unk_26E9DB1B8;
  *(_OWORD *)(v2 + 24) = *(_OWORD *)(a1 + 24);
  *(_OWORD *)(v2 + 4nlp::CFScopedPtr<__CFURL const*>::reset(&a9, 0) = *(_OWORD *)(a1 + 40);
  *(_OWORD *)(v2 + 56) = *(_OWORD *)(a1 + 56);
  *(_OWORD *)(v2 + 72) = *(_OWORD *)(a1 + 72);
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 std::__function::__func<std::__bind<std::string (&)(InputTranscoder::PathSample const&,InputTranscoder::KeyboardLayout &,BOOL),InputTranscoder::PathSample const&,std::placeholders::__ph<1> const&,BOOL const&>,std::allocator<std::__bind<std::string (&)(InputTranscoder::PathSample const&,InputTranscoder::KeyboardLayout &,BOOL),InputTranscoder::PathSample const&,std::placeholders::__ph<1> const&,BOOL const&>>,std::string ()(InputTranscoder::KeyboardLayout &)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26E9DB1B8;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(a1 + 8);
  __n128 result = *(__n128 *)(a1 + 24);
  long long v3 = *(_OWORD *)(a1 + 40);
  long long v4 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)(a2 + 72) = *(_OWORD *)(a1 + 72);
  *(_OWORD *)(a2 + 56) = v4;
  *(_OWORD *)(a2 + 4nlp::CFScopedPtr<__CFURL const*>::reset(&a9, 0) = v3;
  *(__n128 *)(a2 + 24) = result;
  return result;
}

uint64_t std::__function::__func<std::__bind<std::string (&)(InputTranscoder::PathSample const&,InputTranscoder::KeyboardLayout &,BOOL),InputTranscoder::PathSample const&,std::placeholders::__ph<1> const&,BOOL const&>,std::allocator<std::__bind<std::string (&)(InputTranscoder::PathSample const&,InputTranscoder::KeyboardLayout &,BOOL),InputTranscoder::PathSample const&,std::placeholders::__ph<1> const&,BOOL const&>>,std::string ()(InputTranscoder::KeyboardLayout &)>::operator()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 8))(a1 + 16, a2, *(unsigned __int8 *)(a1 + 80));
}

uint64_t std::__function::__func<std::__bind<std::string (&)(InputTranscoder::PathSample const&,InputTranscoder::KeyboardLayout &,BOOL),InputTranscoder::PathSample const&,std::placeholders::__ph<1> const&,BOOL const&>,std::allocator<std::__bind<std::string (&)(InputTranscoder::PathSample const&,InputTranscoder::KeyboardLayout &,BOOL),InputTranscoder::PathSample const&,std::placeholders::__ph<1> const&,BOOL const&>>,std::string ()(InputTranscoder::KeyboardLayout &)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<std::__bind<std::string (&)(InputTranscoder::PathSample const&,InputTranscoder::KeyboardLayout &,BOOL),InputTranscoder::PathSample const&,std::placeholders::__ph<1> const&,BOOL const&>,std::allocator<std::__bind<std::string (&)(InputTranscoder::PathSample const&,InputTranscoder::KeyboardLayout &,BOOL),InputTranscoder::PathSample const&,std::placeholders::__ph<1> const&,BOOL const&>>,std::string ()(InputTranscoder::KeyboardLayout &)>::target_type()
{
}

uint64_t std::__function::__func<std::__bind<std::string (&)(InputTranscoder::PathSample const&,InputTranscoder::KeyboardLayout &,BOOL,std::string const&),InputTranscoder::PathSample const&,std::placeholders::__ph<1> const&,BOOL const&,std::string const&>,std::allocator<std::__bind<std::string (&)(InputTranscoder::PathSample const&,InputTranscoder::KeyboardLayout &,BOOL,std::string const&),InputTranscoder::PathSample const&,std::placeholders::__ph<1> const&,BOOL const&,std::string const&>>,std::string ()(InputTranscoder::KeyboardLayout &)>::~__func(uint64_t a1)
{
  *(void *)a1 = &unk_26E9DB250;
  if (*(char *)(a1 + 111) < 0) {
    operator delete(*(void **)(a1 + 88));
  }
  return a1;
}

void std::__function::__func<std::__bind<std::string (&)(InputTranscoder::PathSample const&,InputTranscoder::KeyboardLayout &,BOOL,std::string const&),InputTranscoder::PathSample const&,std::placeholders::__ph<1> const&,BOOL const&,std::string const&>,std::allocator<std::__bind<std::string (&)(InputTranscoder::PathSample const&,InputTranscoder::KeyboardLayout &,BOOL,std::string const&),InputTranscoder::PathSample const&,std::placeholders::__ph<1> const&,BOOL const&,std::string const&>>,std::string ()(InputTranscoder::KeyboardLayout &)>::~__func(uint64_t a1)
{
  *(void *)a1 = &unk_26E9DB250;
  if (*(char *)(a1 + 111) < 0) {
    operator delete(*(void **)(a1 + 88));
  }

  JUMPOUT(0x237E08BB0);
}

void *std::__function::__func<std::__bind<std::string (&)(InputTranscoder::PathSample const&,InputTranscoder::KeyboardLayout &,BOOL,std::string const&),InputTranscoder::PathSample const&,std::placeholders::__ph<1> const&,BOOL const&,std::string const&>,std::allocator<std::__bind<std::string (&)(InputTranscoder::PathSample const&,InputTranscoder::KeyboardLayout &,BOOL,std::string const&),InputTranscoder::PathSample const&,std::placeholders::__ph<1> const&,BOOL const&,std::string const&>>,std::string ()(InputTranscoder::KeyboardLayout &)>::__clone(uint64_t a1)
{
  int v2 = operator new(0x70uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *int v2 = &unk_26E9DB250;
  v2[1] = v3;
  std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul>,InputTranscoder::PathSample,std::placeholders::__ph<1>,BOOL,std::string>::__tuple_impl((uint64_t)(v2 + 2), (long long *)(a1 + 16));
  return v2;
}

void sub_2369F96D4(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__function::__func<std::__bind<std::string (&)(InputTranscoder::PathSample const&,InputTranscoder::KeyboardLayout &,BOOL,std::string const&),InputTranscoder::PathSample const&,std::placeholders::__ph<1> const&,BOOL const&,std::string const&>,std::allocator<std::__bind<std::string (&)(InputTranscoder::PathSample const&,InputTranscoder::KeyboardLayout &,BOOL,std::string const&),InputTranscoder::PathSample const&,std::placeholders::__ph<1> const&,BOOL const&,std::string const&>>,std::string ()(InputTranscoder::KeyboardLayout &)>::__clone(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  *a2 = &unk_26E9DB250;
  a2[1] = v2;
  return std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul>,InputTranscoder::PathSample,std::placeholders::__ph<1>,BOOL,std::string>::__tuple_impl((uint64_t)(a2 + 2), (long long *)(a1 + 16));
}

void std::__function::__func<std::__bind<std::string (&)(InputTranscoder::PathSample const&,InputTranscoder::KeyboardLayout &,BOOL,std::string const&),InputTranscoder::PathSample const&,std::placeholders::__ph<1> const&,BOOL const&,std::string const&>,std::allocator<std::__bind<std::string (&)(InputTranscoder::PathSample const&,InputTranscoder::KeyboardLayout &,BOOL,std::string const&),InputTranscoder::PathSample const&,std::placeholders::__ph<1> const&,BOOL const&,std::string const&>>,std::string ()(InputTranscoder::KeyboardLayout &)>::destroy(uint64_t a1)
{
  if (*(char *)(a1 + 111) < 0) {
    operator delete(*(void **)(a1 + 88));
  }
}

void std::__function::__func<std::__bind<std::string (&)(InputTranscoder::PathSample const&,InputTranscoder::KeyboardLayout &,BOOL,std::string const&),InputTranscoder::PathSample const&,std::placeholders::__ph<1> const&,BOOL const&,std::string const&>,std::allocator<std::__bind<std::string (&)(InputTranscoder::PathSample const&,InputTranscoder::KeyboardLayout &,BOOL,std::string const&),InputTranscoder::PathSample const&,std::placeholders::__ph<1> const&,BOOL const&,std::string const&>>,std::string ()(InputTranscoder::KeyboardLayout &)>::destroy_deallocate(void **__p)
{
  if (*((char *)__p + 111) < 0) {
    operator delete(__p[11]);
  }

  operator delete(__p);
}

uint64_t std::__function::__func<std::__bind<std::string (&)(InputTranscoder::PathSample const&,InputTranscoder::KeyboardLayout &,BOOL,std::string const&),InputTranscoder::PathSample const&,std::placeholders::__ph<1> const&,BOOL const&,std::string const&>,std::allocator<std::__bind<std::string (&)(InputTranscoder::PathSample const&,InputTranscoder::KeyboardLayout &,BOOL,std::string const&),InputTranscoder::PathSample const&,std::placeholders::__ph<1> const&,BOOL const&,std::string const&>>,std::string ()(InputTranscoder::KeyboardLayout &)>::operator()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t))(a1 + 8))(a1 + 16, a2, *(unsigned __int8 *)(a1 + 80), a1 + 88);
}

uint64_t std::__function::__func<std::__bind<std::string (&)(InputTranscoder::PathSample const&,InputTranscoder::KeyboardLayout &,BOOL,std::string const&),InputTranscoder::PathSample const&,std::placeholders::__ph<1> const&,BOOL const&,std::string const&>,std::allocator<std::__bind<std::string (&)(InputTranscoder::PathSample const&,InputTranscoder::KeyboardLayout &,BOOL,std::string const&),InputTranscoder::PathSample const&,std::placeholders::__ph<1> const&,BOOL const&,std::string const&>>,std::string ()(InputTranscoder::KeyboardLayout &)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<std::__bind<std::string (&)(InputTranscoder::PathSample const&,InputTranscoder::KeyboardLayout &,BOOL,std::string const&),InputTranscoder::PathSample const&,std::placeholders::__ph<1> const&,BOOL const&,std::string const&>,std::allocator<std::__bind<std::string (&)(InputTranscoder::PathSample const&,InputTranscoder::KeyboardLayout &,BOOL,std::string const&),InputTranscoder::PathSample const&,std::placeholders::__ph<1> const&,BOOL const&,std::string const&>>,std::string ()(InputTranscoder::KeyboardLayout &)>::target_type()
{
}

uint64_t std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul,3ul>,InputTranscoder::PathSample,std::placeholders::__ph<1>,BOOL,std::string>::__tuple_impl(uint64_t a1, long long *a2)
{
  long long v3 = *a2;
  long long v4 = a2[1];
  long long v5 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v5;
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 64) = *((unsigned char *)a2 + 64);
  int64_t v6 = (std::string *)(a1 + 72);
  if (*((char *)a2 + 95) < 0)
  {
    std::string::__init_copy_ctor_external(v6, *((const std::string::value_type **)a2 + 9), *((void *)a2 + 10));
  }
  else
  {
    long long v7 = *(long long *)((char *)a2 + 72);
    v6->__r_.__value_.__r.__words[2] = *((void *)a2 + 11);
    *(_OWORD *)&v6->__r_.__value_.__l.__data_ = v7;
  }
  return a1;
}

void std::__function::__func<InputTranscoder::PathKeyLayoutProcessor::key_class_for_touch_key(ITKeyInfo const&)::$_0,std::allocator<InputTranscoder::PathKeyLayoutProcessor::key_class_for_touch_key(ITKeyInfo const&)::$_0>,BOOL ()(InputTranscoder::KeyboardLayout &)>::~__func()
{
}

void *std::__function::__func<InputTranscoder::PathKeyLayoutProcessor::key_class_for_touch_key(ITKeyInfo const&)::$_0,std::allocator<InputTranscoder::PathKeyLayoutProcessor::key_class_for_touch_key(ITKeyInfo const&)::$_0>,BOOL ()(InputTranscoder::KeyboardLayout &)>::__clone()
{
  __n128 result = operator new(0x10uLL);
  void *result = &unk_26E9DB2E8;
  return result;
}

void std::__function::__func<InputTranscoder::PathKeyLayoutProcessor::key_class_for_touch_key(ITKeyInfo const&)::$_0,std::allocator<InputTranscoder::PathKeyLayoutProcessor::key_class_for_touch_key(ITKeyInfo const&)::$_0>,BOOL ()(InputTranscoder::KeyboardLayout &)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26E9DB2E8;
}

uint64_t std::__function::__func<InputTranscoder::PathKeyLayoutProcessor::key_class_for_touch_key(ITKeyInfo const&)::$_0,std::allocator<InputTranscoder::PathKeyLayoutProcessor::key_class_for_touch_key(ITKeyInfo const&)::$_0>,BOOL ()(InputTranscoder::KeyboardLayout &)>::operator()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a2 + 80))(a2);
}

uint64_t std::__function::__func<InputTranscoder::PathKeyLayoutProcessor::key_class_for_touch_key(ITKeyInfo const&)::$_0,std::allocator<InputTranscoder::PathKeyLayoutProcessor::key_class_for_touch_key(ITKeyInfo const&)::$_0>,BOOL ()(InputTranscoder::KeyboardLayout &)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<InputTranscoder::PathKeyLayoutProcessor::key_class_for_touch_key(ITKeyInfo const&)::$_0,std::allocator<InputTranscoder::PathKeyLayoutProcessor::key_class_for_touch_key(ITKeyInfo const&)::$_0>,BOOL ()(InputTranscoder::KeyboardLayout &)>::target_type()
{
}

void *std::__function::__value_func<BOOL ()(InputTranscoder::KeyboardLayout &)>::~__value_func[abi:ne180100](void *a1)
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

void std::__function::__func<std::__bind<std::string (&)(InputTranscoder::PathSample const&,InputTranscoder::KeyboardLayout &,BOOL),InputTranscoder::PathSample const&,std::placeholders::__ph<1> const&,BOOL>,std::allocator<std::__bind<std::string (&)(InputTranscoder::PathSample const&,InputTranscoder::KeyboardLayout &,BOOL),InputTranscoder::PathSample const&,std::placeholders::__ph<1> const&,BOOL>>,std::string ()(InputTranscoder::KeyboardLayout &)>::~__func()
{
}

__n128 std::__function::__func<std::__bind<std::string (&)(InputTranscoder::PathSample const&,InputTranscoder::KeyboardLayout &,BOOL),InputTranscoder::PathSample const&,std::placeholders::__ph<1> const&,BOOL>,std::allocator<std::__bind<std::string (&)(InputTranscoder::PathSample const&,InputTranscoder::KeyboardLayout &,BOOL),InputTranscoder::PathSample const&,std::placeholders::__ph<1> const&,BOOL>>,std::string ()(InputTranscoder::KeyboardLayout &)>::__clone(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x58uLL);
  *(void *)uint64_t v2 = &unk_26E9DB378;
  *(_OWORD *)(v2 + 24) = *(_OWORD *)(a1 + 24);
  *(_OWORD *)(v2 + 4nlp::CFScopedPtr<__CFURL const*>::reset(&a9, 0) = *(_OWORD *)(a1 + 40);
  *(_OWORD *)(v2 + 56) = *(_OWORD *)(a1 + 56);
  *(_OWORD *)(v2 + 72) = *(_OWORD *)(a1 + 72);
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 std::__function::__func<std::__bind<std::string (&)(InputTranscoder::PathSample const&,InputTranscoder::KeyboardLayout &,BOOL),InputTranscoder::PathSample const&,std::placeholders::__ph<1> const&,BOOL>,std::allocator<std::__bind<std::string (&)(InputTranscoder::PathSample const&,InputTranscoder::KeyboardLayout &,BOOL),InputTranscoder::PathSample const&,std::placeholders::__ph<1> const&,BOOL>>,std::string ()(InputTranscoder::KeyboardLayout &)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26E9DB378;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(a1 + 8);
  __n128 result = *(__n128 *)(a1 + 24);
  long long v3 = *(_OWORD *)(a1 + 40);
  long long v4 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)(a2 + 72) = *(_OWORD *)(a1 + 72);
  *(_OWORD *)(a2 + 56) = v4;
  *(_OWORD *)(a2 + 4nlp::CFScopedPtr<__CFURL const*>::reset(&a9, 0) = v3;
  *(__n128 *)(a2 + 24) = result;
  return result;
}

uint64_t std::__function::__func<std::__bind<std::string (&)(InputTranscoder::PathSample const&,InputTranscoder::KeyboardLayout &,BOOL),InputTranscoder::PathSample const&,std::placeholders::__ph<1> const&,BOOL>,std::allocator<std::__bind<std::string (&)(InputTranscoder::PathSample const&,InputTranscoder::KeyboardLayout &,BOOL),InputTranscoder::PathSample const&,std::placeholders::__ph<1> const&,BOOL>>,std::string ()(InputTranscoder::KeyboardLayout &)>::operator()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 8))(a1 + 16, a2, *(unsigned __int8 *)(a1 + 80));
}

uint64_t std::__function::__func<std::__bind<std::string (&)(InputTranscoder::PathSample const&,InputTranscoder::KeyboardLayout &,BOOL),InputTranscoder::PathSample const&,std::placeholders::__ph<1> const&,BOOL>,std::allocator<std::__bind<std::string (&)(InputTranscoder::PathSample const&,InputTranscoder::KeyboardLayout &,BOOL),InputTranscoder::PathSample const&,std::placeholders::__ph<1> const&,BOOL>>,std::string ()(InputTranscoder::KeyboardLayout &)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<std::__bind<std::string (&)(InputTranscoder::PathSample const&,InputTranscoder::KeyboardLayout &,BOOL),InputTranscoder::PathSample const&,std::placeholders::__ph<1> const&,BOOL>,std::allocator<std::__bind<std::string (&)(InputTranscoder::PathSample const&,InputTranscoder::KeyboardLayout &,BOOL),InputTranscoder::PathSample const&,std::placeholders::__ph<1> const&,BOOL>>,std::string ()(InputTranscoder::KeyboardLayout &)>::target_type()
{
}

uint64_t InputTranscoder::PathResampler::is_inflection_point(InputTranscoder::PathResampler *this, unsigned int a2)
{
  if (!*((_DWORD *)this + 2)) {
    return 0;
  }
  uint64_t v2 = *((void *)this + 10);
  if ((*(void *)(v2 + ((unint64_t)a2 << 6) + 40) | 2) == 2) {
    return 1;
  }
  if (!a2) {
    return 0;
  }
  double v4 = *(double *)this * 3.0;
  double v5 = *(double *)(v2 + ((unint64_t)a2 << 6) + 32);
  if (v5 < v4) {
    return 0;
  }
  uint64_t v6 = *((void *)this + 11);
  double v7 = v2 == v6 ? 0.0 : *(double *)(v6 - 32);
  if (v5 + v4 > v7) {
    return 0;
  }
  if (*((unsigned char *)this + 24))
  {
    uint64_t v8 = a2 - 1;
    if (a2 == 1)
    {
      unint64_t v9 = (v6 - v2) >> 6;
    }
    else
    {
      unint64_t v9 = (v6 - v2) >> 6;
      uint64_t v10 = (double *)(v2 + (v8 << 6) + 32);
      unsigned int v11 = a2 - 2;
      unint64_t v12 = a2 - 1;
      while (*v10 > v5 - v4)
      {
        if (v9 > v12 && *(v10 - 2) - *(double *)(v2 + ((unint64_t)v11 << 6) + 16) > *((double *)this + 2)) {
          return 0;
        }
        v10 -= 8;
        --v11;
        if (!--v12) {
          break;
        }
      }
    }
    if (v9 > a2
      && *(double *)(v2 + ((unint64_t)a2 << 6) + 16) - *(double *)(v2 + (v8 << 6) + 16) > *((double *)this + 2))
    {
      return 1;
    }
    unint64_t v13 = a2 + 1;
    if (v9 > v13)
    {
      double v14 = v5 - v4;
      unsigned int v15 = a2 + 2;
      while (*(double *)(v2 + (v13 << 6) + 32) > v14)
      {
        if (v15 != 1
          && *(double *)(v2 + (v13 << 6) + 16) - *(double *)(v2 + ((unint64_t)(v15 - 2) << 6) + 16) > *((double *)this + 2))
        {
          return 0;
        }
        unint64_t v13 = v15;
        if (v9 <= v15++) {
          return InputTranscoder::Path::is_curvature_local_max((InputTranscoder::PathResampler *)((char *)this + 80), a2, v4);
        }
      }
    }
  }
  return InputTranscoder::Path::is_curvature_local_max((InputTranscoder::PathResampler *)((char *)this + 80), a2, v4);
}

unint64_t InputTranscoder::PathResampler::process_sample(void **this, unsigned int a2)
{
  int is_inflection_point = InputTranscoder::PathResampler::is_inflection_point((InputTranscoder::PathResampler *)this, a2);
  double v5 = this[4];
  uint64_t v6 = this[5];
  if (!a2)
  {
    uint64_t v23 = (long long *)this[10];
    int v24 = this + 4;
    goto LABEL_18;
  }
  int v7 = is_inflection_point;
  uint64_t v8 = (char *)this[10];
  unint64_t v9 = (long long *)&v8[64 * (unint64_t)a2];
  uint64_t v10 = (unsigned char *)this[11] - v8;
  if ((unint64_t)v10 < 0x41)
  {
LABEL_8:
    if (v10 != 64) {
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v11 = 2;
    if ((unint64_t)(v10 >> 6) > 2) {
      uint64_t v11 = v10 >> 6;
    }
    unint64_t v12 = (uint64_t *)(v8 + 104);
    uint64_t v13 = v11 - 1;
    while (1)
    {
      uint64_t v14 = *v12;
      v12 += 8;
      if (v14 == 1) {
        break;
      }
      if (!--v13) {
        goto LABEL_8;
      }
    }
  }
  InputTranscoder::PathResampler::drop_non_resampled_path((InputTranscoder::PathResampler *)this, a2);
  unsigned int v15 = (double *)this[5];
  if (this[4] != v15)
  {
    double v16 = (double *)&v8[64 * (unint64_t)a2];
    double v18 = v16[4];
    std::string v17 = v16 + 4;
    double v19 = v18;
    double v20 = *(v15 - 4) + *(double *)this;
    if (v20 < v18)
    {
      unint64_t v21 = (float64x2_t *)&v8[64 * (unint64_t)(a2 - 1)];
      do
      {
        float v22 = (v20 - v21[2].f64[0]) / (v19 - v21[2].f64[0]);
        InputTranscoder::PathSample::lerp(v21, (uint64_t)v9, (uint64_t)v26, v22);
        InputTranscoder::Path::append(this + 4, v26);
        double v20 = *((double *)this[5] - 4) + *(double *)this;
        double v19 = *v17;
      }
      while (v20 < *v17);
    }
  }
LABEL_13:
  if (!v7)
  {
    if (*((unsigned char *)this + 12)) {
      return (unint64_t)(v6 - v5) >> 6;
    }
    int v24 = this + 4;
    uint64_t v23 = v9;
LABEL_18:
    InputTranscoder::Path::append(v24, v23);
    return (unint64_t)(v6 - v5) >> 6;
  }
  InputTranscoder::Path::append(this + 4, v9);
  InputTranscoder::Path::set_sample_is_inflection_point((InputTranscoder::Path *)(this + 4), ((unint64_t)((unsigned char *)this[5] - (unsigned char *)this[4]) >> 6) - 1);
  *((char *)this[5] - 7) = 1;
  return (unint64_t)(v6 - v5) >> 6;
}

void InputTranscoder::PathResampler::drop_non_resampled_path(InputTranscoder::PathResampler *this, unsigned int a2)
{
  if (a2 >= 2)
  {
    uint64_t v14 = v2;
    uint64_t v15 = v3;
    double v5 = (void **)((char *)this + 80);
    uint64_t v4 = *((void *)this + 10);
    uint64_t v6 = v4 + ((unint64_t)a2 << 6);
    if (*(void *)(v6 + 40) == 1)
    {
      uint64_t v7 = v4 + ((unint64_t)(a2 - 1) << 6);
      if (!*(void *)(v7 + 40))
      {
        long long v8 = *(_OWORD *)(v7 + 16);
        v13[0] = *(_OWORD *)v7;
        v13[1] = v8;
        long long v9 = *(_OWORD *)(v7 + 48);
        void v13[2] = *(_OWORD *)(v7 + 32);
        v13[3] = v9;
        long long v10 = *(_OWORD *)(v6 + 16);
        v12[0] = *(_OWORD *)v6;
        v12[1] = v10;
        long long v11 = *(_OWORD *)(v6 + 48);
        v12[2] = *(_OWORD *)(v6 + 32);
        v12[3] = v11;
        *((void *)this + 5) = *((void *)this + 4);
        *((void *)this + 8) = *((void *)this + 7);
        *((void *)this + 11) = v4;
        *((void *)this + 14) = *((void *)this + 13);
        *((unsigned char *)this + 128) = 0;
        *((_DWORD *)this + 33) = 0;
        *((_DWORD *)this + 34) = 0;
        InputTranscoder::Path::append((void **)this + 10, v13);
        InputTranscoder::Path::append(v5, v12);
      }
    }
  }
}

unint64_t InputTranscoder::PathResampler::retroactively_process_sample(InputTranscoder::PathResampler *this, unsigned int a2)
{
  unsigned int v2 = a2;
  if (!InputTranscoder::PathResampler::is_inflection_point(this, a2)) {
    goto LABEL_18;
  }
  uint64_t v4 = *((void *)this + 10);
  uint64_t v5 = *((void *)this + 11) - v4;
  if ((unint64_t)v5 >= 0x41)
  {
    uint64_t v6 = 2;
    if ((unint64_t)(v5 >> 6) > 2) {
      uint64_t v6 = v5 >> 6;
    }
    uint64_t v7 = (uint64_t *)(v4 + 104);
    uint64_t v8 = v6 - 1;
    do
    {
      uint64_t v9 = *v7;
      v7 += 8;
      if (v9 == 1) {
        goto LABEL_9;
      }
    }
    while (--v8);
  }
  if (v5 != 64)
  {
LABEL_18:
    unint64_t v20 = *((void *)this + 5) - *((void *)this + 4);
    return v20 >> 6;
  }
LABEL_9:
  uint64_t v10 = *((void *)this + 4);
  uint64_t v11 = *((void *)this + 5);
  uint64_t v12 = v11 - v10;
  if (v11 != v10)
  {
    uint64_t v13 = v4 + ((unint64_t)v2 << 6);
    unint64_t v14 = v12 >> 6;
    double v15 = *(double *)(v13 + 32);
    uint64_t v11 = *((void *)this + 4);
    do
    {
      unint64_t v16 = v14 >> 1;
      uint64_t v17 = v11 + (v14 >> 1 << 6);
      double v18 = *(double *)(v17 + 32);
      uint64_t v19 = v17 + 64;
      v14 += ~(v14 >> 1);
      if (v18 < v15) {
        uint64_t v11 = v19;
      }
      else {
        unint64_t v14 = v16;
      }
    }
    while (v14);
  }
  InputTranscoder::Path::resize((InputTranscoder::PathResampler *)((char *)this + 32), (v11 - v10) >> 6);
  unint64_t v20 = *((void *)this + 5) - *((void *)this + 4);
  unsigned int v21 = *((_DWORD *)this + 33);
  for (*((_DWORD *)this + 33) = v2; v2 < v21; *((_DWORD *)this + 33) = v2)
  {
    InputTranscoder::PathResampler::process_sample((void **)this, v2);
    unsigned int v2 = *((_DWORD *)this + 33) + 1;
  }
  return v20 >> 6;
}

uint64_t InputTranscoder::PathResampler::process_new_samples(InputTranscoder::PathResampler *this)
{
  uint64_t v2 = *((void *)this + 10);
  uint64_t v3 = *((void *)this + 11);
  if (v2 == v3) {
    return (*((void *)this + 5) - *((void *)this + 4)) >> 6;
  }
  if (!*((unsigned char *)this + 24)) {
    goto LABEL_7;
  }
  unint64_t v4 = (unint64_t)(v3 - v2) >> 6;
  unint64_t v5 = (v4 - 1);
  if (v4 == 1) {
    goto LABEL_8;
  }
  if (v5 < (v3 - v2) >> 6) {
    LOBYTE(v5) = *(double *)(v2 + (v5 << 6) + 16)
  }
               - *(double *)(v2 + ((unint64_t)(v4 - 2) << 6) + 16) > *((double *)this + 2);
  else {
LABEL_7:
  }
    LOBYTE(v5) = 0;
LABEL_8:
  int v7 = *((_DWORD *)this + 2);
  double v8 = *(double *)(v3 - 32);
  if (v7 == 1 && (v5 & 1) == 0) {
    double v8 = v8 + *(double *)this * -3.0;
  }
  uint64_t v6 = (*((void *)this + 5) - *((void *)this + 4)) >> 6;
  unint64_t v9 = *((unsigned int *)this + 33);
  if (v9 < (v3 - v2) >> 6 && *(double *)(v2 + (v9 << 6) + 32) <= v8)
  {
    do
    {
      unsigned int v10 = InputTranscoder::PathResampler::process_sample((void **)this, v9);
      if (v10 >= v6) {
        uint64_t v6 = v6;
      }
      else {
        uint64_t v6 = v10;
      }
      unint64_t v9 = (*((_DWORD *)this + 33) + 1);
      *((_DWORD *)this + 33) = v9;
      uint64_t v2 = *((void *)this + 10);
      uint64_t v3 = *((void *)this + 11);
    }
    while (v9 < (v3 - v2) >> 6 && *(double *)(v2 + (v9 << 6) + 32) <= v8);
    int v7 = *((_DWORD *)this + 2);
  }
  if (v7 == 2)
  {
    double v11 = v2 == v3 ? 0.0 : *(double *)(v3 - 32);
    unint64_t v12 = *((unsigned int *)this + 34);
    if (v12 < (v3 - v2) >> 6)
    {
      double v13 = v11 + *(double *)this * -3.0;
      do
      {
        if (*(double *)(v2 + (v12 << 6) + 32) >= v13) {
          break;
        }
        unsigned int v14 = InputTranscoder::PathResampler::retroactively_process_sample(this, v12);
        uint64_t v6 = v14 >= v6 ? v6 : v14;
        unint64_t v12 = (*((_DWORD *)this + 34) + 1);
        *((_DWORD *)this + 34) = v12;
        uint64_t v2 = *((void *)this + 10);
      }
      while (v12 < (*((void *)this + 11) - v2) >> 6);
    }
  }
  return v6;
}

uint64_t InputTranscoder::PathResampler::append_and_resample(uint64_t a1, long long *a2)
{
  InputTranscoder::Path::append((void **)(a1 + 80), a2);
  InputTranscoder::PathResampler::drop_non_resampled_path((InputTranscoder::PathResampler *)a1, ((*(void *)(a1 + 88) - *(void *)(a1 + 80)) >> 6) - 1);

  return InputTranscoder::PathResampler::process_new_samples((InputTranscoder::PathResampler *)a1);
}

uint64_t InputTranscoder::PathResampler::finalize(InputTranscoder::PathResampler *this)
{
  uint64_t v1 = (void **)((char *)this + 32);
  uint64_t v2 = (*((void *)this + 5) - *((void *)this + 4)) >> 6;
  if (!*((unsigned char *)this + 128))
  {
    unint64_t v4 = *((unsigned int *)this + 33);
    uint64_t v5 = *((void *)this + 10);
    for (uint64_t i = *((void *)this + 11); v4 < (i - v5) >> 6; uint64_t i = *((void *)this + 11))
    {
      unsigned int v7 = InputTranscoder::PathResampler::process_sample((void **)this, v4);
      if (v7 >= v2) {
        uint64_t v2 = v2;
      }
      else {
        uint64_t v2 = v7;
      }
      unint64_t v4 = (*((_DWORD *)this + 33) + 1);
      *((_DWORD *)this + 33) = v4;
      uint64_t v5 = *((void *)this + 10);
    }
    if (*((_DWORD *)this + 2) == 2)
    {
      unint64_t v8 = *((unsigned int *)this + 34);
      if (v8 < (i - v5) >> 6)
      {
        do
        {
          unsigned int v9 = InputTranscoder::PathResampler::retroactively_process_sample(this, v8);
          if (v9 >= v2) {
            uint64_t v2 = v2;
          }
          else {
            uint64_t v2 = v9;
          }
          unint64_t v8 = (*((_DWORD *)this + 34) + 1);
          *((_DWORD *)this + 34) = v8;
          uint64_t i = *((void *)this + 11);
        }
        while (v8 < (i - *((void *)this + 10)) >> 6);
      }
    }
    uint64_t v10 = *((void *)this + 4);
    uint64_t v11 = *((void *)this + 5);
    if (v10 != v11)
    {
      double v13 = *(double *)(i - 64);
      double v14 = *(double *)(i - 56);
      unint64_t v12 = (long long *)(i - 64);
      if (hypot(v13 - *(double *)(v11 - 64), v14 - *(double *)(v11 - 56)) > 1.0e-10)
      {
        unint64_t v15 = (unint64_t)(v11 - v10) >> 6;
        if (v2 >= v15) {
          uint64_t v2 = v15;
        }
        else {
          uint64_t v2 = v2;
        }
        InputTranscoder::Path::append(v1, v12);
      }
    }
    *((unsigned char *)this + 128) = 1;
  }
  return v2;
}

void InputTranscoder::PathResampler::getInflectionPoints(InputTranscoder::PathResampler *this@<X0>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  unint64_t v4 = (char **)(a2 + 2);
  uint64_t v5 = (long long *)*((void *)this + 4);
  uint64_t v6 = operator new(0x40uLL);
  unsigned int v7 = (char *)(v6 + 4);
  long long v8 = *v5;
  long long v9 = v5[1];
  long long v10 = v5[3];
  v6[2] = v5[2];
  v6[3] = v10;
  *uint64_t v6 = v8;
  v6[1] = v9;
  a2[1] = v6 + 4;
  a2[2] = v6 + 4;
  uint64_t v11 = (unsigned int *)*((void *)this + 7);
  unint64_t v12 = (unsigned int *)*((void *)this + 8);
  *a2 = v6;
  if (v11 == v12)
  {
    uint64_t v35 = &v5[4 * (unint64_t)(((*((void *)this + 5) - (void)v5) >> 6) - 1)];
    uint64_t v34 = (char *)(v6 + 4);
  }
  else
  {
    do
    {
      uint64_t v13 = *v11;
      if (v13)
      {
        uint64_t v14 = *((void *)this + 4);
        if (((*((void *)this + 5) - v14) >> 6) - 1 != v13)
        {
          unint64_t v15 = (long long *)(v14 + (v13 << 6));
          if (v7 >= *v4)
          {
            uint64_t v19 = (char *)*a2;
            uint64_t v20 = (uint64_t)&v7[-*a2] >> 6;
            unint64_t v21 = v20 + 1;
            if ((unint64_t)(v20 + 1) >> 58) {
              std::vector<InputTranscoder::InputFeature>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v22 = *v4 - v19;
            if (v22 >> 5 > v21) {
              unint64_t v21 = v22 >> 5;
            }
            if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFC0) {
              unint64_t v23 = 0x3FFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v23 = v21;
            }
            if (v23)
            {
              int v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<InputTranscoder::CTCSurfaceFormOutput>>((uint64_t)v4, v23);
              uint64_t v19 = (char *)*a2;
              unsigned int v7 = (char *)a2[1];
            }
            else
            {
              int v24 = 0;
            }
            std::string::size_type v25 = &v24[64 * v20];
            long long v26 = *v15;
            long long v27 = v15[1];
            long long v28 = v15[3];
            *((_OWORD *)v25 + 2) = v15[2];
            *((_OWORD *)v25 + 3) = v28;
            *(_OWORD *)std::string::size_type v25 = v26;
            *((_OWORD *)v25 + 1) = v27;
            if (v7 == v19)
            {
              int v33 = &v24[64 * v20];
            }
            else
            {
              uint64_t v29 = &v24[64 * v20];
              do
              {
                long long v30 = *((_OWORD *)v7 - 4);
                long long v31 = *((_OWORD *)v7 - 3);
                long long v32 = *((_OWORD *)v7 - 2);
                int v33 = v29 - 64;
                *(_OWORD *)(v29 - 21) = *(_OWORD *)(v7 - 21);
                *((_OWORD *)v29 - 3) = v31;
                *((_OWORD *)v29 - 2) = v32;
                *((_OWORD *)v29 - 4) = v30;
                v7 -= 64;
                v29 -= 64;
              }
              while (v7 != v19);
            }
            unsigned int v7 = v25 + 64;
            *a2 = v33;
            a2[1] = v25 + 64;
            a2[2] = &v24[64 * v23];
            if (v19) {
              operator delete(v19);
            }
          }
          else
          {
            long long v16 = *v15;
            long long v17 = v15[1];
            long long v18 = v15[3];
            *((_OWORD *)v7 + 2) = v15[2];
            *((_OWORD *)v7 + 3) = v18;
            *(_OWORD *)unsigned int v7 = v16;
            *((_OWORD *)v7 + 1) = v17;
            v7 += 64;
          }
          a2[1] = v7;
        }
      }
      ++v11;
    }
    while (v11 != v12);
    uint64_t v34 = *v4;
    uint64_t v35 = (long long *)(*((void *)this + 4)
                     + ((unint64_t)(((*((void *)this + 5) - *((void *)this + 4)) >> 6) - 1) << 6));
    if (v7 < *v4)
    {
      long long v36 = *v35;
      long long v37 = v35[1];
      long long v38 = v35[3];
      *((_OWORD *)v7 + 2) = v35[2];
      *((_OWORD *)v7 + 3) = v38;
      *(_OWORD *)unsigned int v7 = v36;
      *((_OWORD *)v7 + 1) = v37;
      unint64_t v39 = v7 + 64;
      goto LABEL_42;
    }
  }
  unint64_t v40 = (char *)*a2;
  uint64_t v41 = (uint64_t)&v7[-*a2] >> 6;
  unint64_t v42 = v41 + 1;
  if ((unint64_t)(v41 + 1) >> 58) {
    std::vector<InputTranscoder::InputFeature>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v43 = v34 - v40;
  if (v43 >> 5 > v42) {
    unint64_t v42 = v43 >> 5;
  }
  if ((unint64_t)v43 >= 0x7FFFFFFFFFFFFFC0) {
    unint64_t v44 = 0x3FFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v44 = v42;
  }
  if (v44)
  {
    char v45 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<InputTranscoder::CTCSurfaceFormOutput>>((uint64_t)v4, v44);
    unint64_t v40 = (char *)*a2;
    unsigned int v7 = (char *)a2[1];
  }
  else
  {
    char v45 = 0;
  }
  int v46 = &v45[64 * v41];
  long long v47 = *v35;
  long long v48 = v35[1];
  long long v49 = v35[3];
  float v50 = &v45[64 * v44];
  *((_OWORD *)v46 + 2) = v35[2];
  *((_OWORD *)v46 + 3) = v49;
  *(_OWORD *)int v46 = v47;
  *((_OWORD *)v46 + 1) = v48;
  unint64_t v39 = v46 + 64;
  if (v7 == v40)
  {
    CFDictionaryRef v54 = v46;
  }
  else
  {
    do
    {
      long long v51 = *((_OWORD *)v7 - 4);
      long long v52 = *((_OWORD *)v7 - 3);
      long long v53 = *((_OWORD *)v7 - 2);
      CFDictionaryRef v54 = v46 - 64;
      *(_OWORD *)(v46 - 21) = *(_OWORD *)(v7 - 21);
      *((_OWORD *)v46 - 3) = v52;
      *((_OWORD *)v46 - 2) = v53;
      *((_OWORD *)v46 - 4) = v51;
      v7 -= 64;
      v46 -= 64;
    }
    while (v7 != v40);
  }
  *a2 = v54;
  a2[1] = v39;
  a2[2] = v50;
  if (v40) {
    operator delete(v40);
  }
LABEL_42:
  a2[1] = v39;
}

void sub_2369FA5BC(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void InputTranscoder::getTouchUpPoints(InputTranscoder *this@<X0>, void **a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  uint64_t v5 = (uint64_t)(a2 + 2);
  uint64_t v6 = *((void *)this + 1) - *(void *)this;
  if ((unint64_t)v6 >= 0x80)
  {
    if (v6 < 0) {
      std::vector<InputTranscoder::InputFeature>::__throw_length_error[abi:ne180100]();
    }
    unsigned int v7 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<InputTranscoder::CTCSurfaceFormOutput>>(v5, (unint64_t)(v6 >> 6) >> 1);
    long long v10 = (char *)*a2;
    long long v9 = (char *)a2[1];
    uint64_t v11 = v7;
    if (v9 != *a2)
    {
      do
      {
        long long v12 = *((_OWORD *)v9 - 4);
        long long v13 = *((_OWORD *)v9 - 3);
        long long v14 = *((_OWORD *)v9 - 2);
        *(_OWORD *)(v11 - 21) = *(_OWORD *)(v9 - 21);
        *((_OWORD *)v11 - 3) = v13;
        *((_OWORD *)v11 - 2) = v14;
        *((_OWORD *)v11 - 4) = v12;
        v11 -= 64;
        v9 -= 64;
      }
      while (v9 != v10);
      long long v9 = v10;
    }
    *a2 = v11;
    a2[1] = v7;
    a2[2] = &v7[64 * v8];
    if (v9) {
      operator delete(v9);
    }
  }
  uint64_t v16 = *(void *)this;
  uint64_t v15 = *((void *)this + 1);
  if (v15 != *(void *)this)
  {
    unint64_t v17 = 0;
    do
    {
      long long v18 = (long long *)(v16 + (v17 << 6));
      if (*((void *)v18 + 5) == 2)
      {
        uint64_t v20 = a2[1];
        unint64_t v19 = (unint64_t)a2[2];
        if ((unint64_t)v20 >= v19)
        {
          std::string::size_type v25 = *a2;
          uint64_t v26 = ((char *)v20 - (unsigned char *)*a2) >> 6;
          unint64_t v27 = v26 + 1;
          if ((unint64_t)(v26 + 1) >> 58) {
            std::vector<InputTranscoder::InputFeature>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v28 = v19 - (void)v25;
          if (v28 >> 5 > v27) {
            unint64_t v27 = v28 >> 5;
          }
          if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFC0) {
            unint64_t v29 = 0x3FFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v29 = v27;
          }
          if (v29)
          {
            long long v30 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<InputTranscoder::CTCSurfaceFormOutput>>(v5, v29);
            std::string::size_type v25 = *a2;
            uint64_t v20 = a2[1];
          }
          else
          {
            long long v30 = 0;
          }
          long long v31 = &v30[64 * v26];
          long long v32 = *v18;
          long long v33 = v18[1];
          long long v34 = v18[3];
          *((_OWORD *)v31 + 2) = v18[2];
          *((_OWORD *)v31 + 3) = v34;
          *(_OWORD *)long long v31 = v32;
          *((_OWORD *)v31 + 1) = v33;
          if (v20 == v25)
          {
            unint64_t v39 = &v30[64 * v26];
          }
          else
          {
            uint64_t v35 = &v30[64 * v26];
            do
            {
              long long v36 = *(v20 - 4);
              long long v37 = *(v20 - 3);
              long long v38 = *(v20 - 2);
              unint64_t v39 = v35 - 64;
              *(_OWORD *)(v35 - 21) = *(_OWORD *)((char *)v20 - 21);
              *((_OWORD *)v35 - 3) = v37;
              *((_OWORD *)v35 - 2) = v38;
              *((_OWORD *)v35 - 4) = v36;
              v20 -= 4;
              v35 -= 64;
            }
            while (v20 != v25);
          }
          int v24 = v31 + 64;
          *a2 = v39;
          a2[1] = v31 + 64;
          a2[2] = &v30[64 * v29];
          if (v25) {
            operator delete(v25);
          }
        }
        else
        {
          long long v21 = *v18;
          long long v22 = v18[1];
          long long v23 = v18[3];
          v20[2] = v18[2];
          v20[3] = v23;
          _OWORD *v20 = v21;
          v20[1] = v22;
          int v24 = v20 + 4;
        }
        a2[1] = v24;
        uint64_t v16 = *(void *)this;
        uint64_t v15 = *((void *)this + 1);
      }
      ++v17;
    }
    while (v17 < (v15 - v16) >> 6);
  }
}

void sub_2369FA7DC(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void InputTranscoder::PathResampler::pop_last_path(InputTranscoder::PathResampler *this)
{
  uint64_t v2 = (void *)*((void *)this + 10);
  uint64_t v1 = (void *)*((void *)this + 11);
  uint64_t v3 = *((void *)this + 12);
  long long v4 = *(_OWORD *)((char *)this + 104);
  uint64_t v5 = *((void *)this + 15);
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((void *)this + 5) = *((void *)this + 4);
  *((void *)this + 8) = *((void *)this + 7);
  *((void *)this + 14) = 0;
  *((unsigned char *)this + 128) = 0;
  *((_DWORD *)this + 33) = 0;
  *((_DWORD *)this + 34) = 0;
  if (v2 == v1)
  {
    if ((void)v4) {
      operator delete((void *)v4);
    }
    if (v2)
    {
      operator delete(v2);
    }
  }
  else
  {
    while (v1 != v2)
    {
      uint64_t v6 = (char *)(v1 - 8);
      uint64_t v7 = *(v1 - 3);
      int v8 = *((unsigned __int8 *)v1 - 8);
      if (v7) {
        BOOL v9 = 0;
      }
      else {
        BOOL v9 = v8 == 0;
      }
      uint64_t v1 = v6;
      if (v9) {
        goto LABEL_16;
      }
    }
    uint64_t v6 = (char *)v2;
LABEL_16:
    *((void *)this + 1nlp::CFScopedPtr<__CFURL const*>::reset(&a9, 0) = v2;
    *((void *)this + 11) = v6;
    *((void *)this + 12) = v3;
    *(_OWORD *)((char *)this + 104) = v4;
    *((void *)this + 15) = v5;
  }
}

uint64_t InputTranscoder::createMRLModel(uint64_t a1)
{
  CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  int v2 = *(char *)(a1 + 23);
  if (v2 >= 0) {
    uint64_t v3 = (const UInt8 *)a1;
  }
  else {
    uint64_t v3 = *(const UInt8 **)a1;
  }
  if (v2 >= 0) {
    CFIndex v4 = *(unsigned __int8 *)(a1 + 23);
  }
  else {
    CFIndex v4 = *(void *)(a1 + 8);
  }
  CFURLRef v5 = CFURLCreateFromFileSystemRepresentation((CFAllocatorRef)*MEMORY[0x263EFFB08], v3, v4, 0);
  CFDictionaryRef Mutable = CFDictionaryCreateMutable(v1, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F56640], v5);
  uint64_t v7 = MRLNeuralNetworkCreate();
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (v5) {
    CFRelease(v5);
  }
  return v7;
}

void sub_2369FAA38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,const void *a23)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v24 & 1) == 0)
    {
LABEL_8:
      nlp::CFScopedPtr<__CFError *>::reset(&a23, 0);
      nlp::CFScopedPtr<__CFDictionary *>::reset((const void **)(v25 - 48), 0);
      nlp::CFScopedPtr<__CFURL const*>::reset((const void **)(v25 - 40), 0);
      _Unwind_Resume(a1);
    }
  }
  else if (!v24)
  {
    goto LABEL_8;
  }
  __cxa_free_exception(v23);
  goto LABEL_8;
}

uint64_t InputTranscoder::MontrealModel::recognize(void *a1, unsigned int *a2, unint64_t a3)
{
  uint64_t ptr = a2;
  unint64_t v36 = a3;
  if (_nlpSignpostLog::token != -1) {
    dispatch_once(&_nlpSignpostLog::token, &__block_literal_global_3);
  }
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer((os_log_t)_nlpSignpostLog::log, &ptr);
  if (_nlpSignpostLog::token != -1) {
    dispatch_once(&_nlpSignpostLog::token, &__block_literal_global_3);
  }
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    CFURLRef v5 = _nlpSignpostLog::log;
    if (os_signpost_enabled((os_log_t)_nlpSignpostLog::log))
    {
      LOWORD(__p[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_2369D6000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v4, "MontrealRecognition", (const char *)&unk_236A08912, (uint8_t *)__p, 2u);
    }
  }
  uint64_t v6 = (unsigned char *)a1[1];
  uint64_t v7 = ptr;
  unint64_t v8 = v36;
  uint64_t v9 = a1[3];
  if (v36 <= (v9 - (uint64_t)v6) >> 2)
  {
    long long v13 = (unsigned char *)a1[2];
    unint64_t v14 = (v13 - v6) >> 2;
    if (v14 >= v36)
    {
      if (v36)
      {
        uint64_t v24 = 4 * v36;
        uint64_t v25 = (float *)a1[1];
        uint64_t v26 = v25;
        do
        {
          unsigned int v27 = *v7++;
          *v26++ = (float)v27;
          ++v25;
          v24 -= 4;
        }
        while (v24);
      }
      else
      {
        uint64_t v25 = (float *)a1[1];
      }
      int64_t v12 = (char *)v25 - v6;
      long long v13 = v6;
    }
    else
    {
      if (v13 != v6)
      {
        uint64_t v15 = 4 * v14;
        uint64_t v16 = (float *)a1[1];
        unint64_t v17 = ptr;
        do
        {
          unsigned int v18 = *v17++;
          *v16++ = (float)v18;
          v15 -= 4;
        }
        while (v15);
      }
      unint64_t v19 = v13;
      if (v14 != v8)
      {
        uint64_t v20 = &v7[v14];
        unint64_t v19 = v13;
        long long v21 = (float *)v13;
        uint64_t v22 = 4 * v8 - 4 * v14;
        do
        {
          unsigned int v23 = *v20++;
          *v21++ = (float)v23;
          v19 += 4;
          v22 -= 4;
        }
        while (v22);
      }
      int64_t v12 = v19 - v13;
    }
  }
  else
  {
    if (v6)
    {
      a1[2] = v6;
      operator delete(v6);
      uint64_t v9 = 0;
      a1[1] = 0;
      a1[2] = 0;
      a1[3] = 0;
    }
    if (v8 >> 62) {
      std::vector<float>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v9 >> 1;
    if (v9 >> 1 <= v8) {
      uint64_t v10 = v8;
    }
    if ((unint64_t)v9 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v11 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v10;
    }
    std::vector<float>::__vallocate[abi:ne180100](a1 + 1, v11);
    int64_t v12 = 0;
    long long v13 = (unsigned char *)a1[2];
    do
    {
      *(float *)&v13[v12] = (float)*(unsigned int *)((char *)v7 + v12);
      v12 += 4;
    }
    while (4 * v8 != v12);
  }
  a1[2] = &v13[v12];
  CFErrorRef err = 0;
  MRLNeuralNetworkSetInput();
  if (err)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "MRLNeuralNetworkSetInput");
    InputTranscoder::logMontrealError((uint64_t *)__p, err);
LABEL_40:
    if (v33 < 0) {
      operator delete(__p[0]);
    }
    return 0;
  }
  MRLNeuralNetworkPredict();
  if (err)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "MRLNeuralNetworkPredict");
    InputTranscoder::logMontrealError((uint64_t *)__p, err);
    goto LABEL_40;
  }
  uint64_t Output = MRLNeuralNetworkGetOutput();
  if (err)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "MRLNeuralNetworkGetOutput");
    InputTranscoder::logMontrealError((uint64_t *)__p, err);
    goto LABEL_40;
  }
  uint64_t v29 = Output;
  MRLNeuralNetworkGetOutputDimension();
  if (_nlpSignpostLog::token != -1) {
    dispatch_once(&_nlpSignpostLog::token, &__block_literal_global_3);
  }
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    long long v31 = _nlpSignpostLog::log;
    if (os_signpost_enabled((os_log_t)_nlpSignpostLog::log))
    {
      LOWORD(__p[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_2369D6000, v31, OS_SIGNPOST_INTERVAL_END, v4, "MontrealRecognition", (const char *)&unk_236A08912, (uint8_t *)__p, 2u);
    }
  }
  return v29;
}

void sub_2369FAE80(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void InputTranscoder::logMontrealError(uint64_t *a1, CFErrorRef err)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  CFStringRef v4 = CFErrorCopyDescription(err);
  if (_nlpDefaultLog::token != -1) {
    dispatch_once(&_nlpDefaultLog::token, &__block_literal_global_2);
  }
  CFURLRef v5 = _nlpDefaultLog::log;
  if (!os_log_type_enabled((os_log_t)_nlpDefaultLog::log, OS_LOG_TYPE_ERROR))
  {
    if (!v4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if (*((char *)a1 + 23) >= 0) {
    uint64_t v6 = a1;
  }
  else {
    uint64_t v6 = (uint64_t *)*a1;
  }
  *(_DWORD *)std::string buf = 136315394;
  unint64_t v8 = v6;
  __int16 v9 = 2112;
  CFStringRef v10 = v4;
  _os_log_error_impl(&dword_2369D6000, v5, OS_LOG_TYPE_ERROR, "%s() failed: %@", buf, 0x16u);
  if (v4) {
LABEL_5:
  }
    CFRelease(v4);
LABEL_6:
  if (err) {
    CFRelease(err);
  }
}

void sub_2369FAFC4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t InputTranscoder::MontrealModel::recognize(void *a1, char *a2, unint64_t a3)
{
  uint64_t ptr = a2;
  unint64_t v26 = a3;
  if (_nlpSignpostLog::token != -1) {
    dispatch_once(&_nlpSignpostLog::token, &__block_literal_global_3);
  }
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer((os_log_t)_nlpSignpostLog::log, &ptr);
  if (_nlpSignpostLog::token != -1) {
    dispatch_once(&_nlpSignpostLog::token, &__block_literal_global_3);
  }
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    CFURLRef v5 = _nlpSignpostLog::log;
    if (os_signpost_enabled((os_log_t)_nlpSignpostLog::log))
    {
      *(_WORD *)std::string buf = 0;
      _os_signpost_emit_with_name_impl(&dword_2369D6000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v4, "MontrealRecognition", (const char *)&unk_236A08912, buf, 2u);
    }
  }
  uint64_t v6 = (char *)a1[1];
  unint64_t v8 = ptr;
  unint64_t v7 = v26;
  uint64_t v9 = a1[3];
  if (v26 <= (v9 - (uint64_t)v6) >> 2)
  {
    int64_t v12 = (void **)(a1 + 2);
    unint64_t v14 = (unsigned char *)a1[2];
    unint64_t v15 = (v14 - v6) >> 2;
    if (v15 >= v26)
    {
      if (v26)
      {
        uint64_t v13 = 4 * v26;
        memmove(v6, ptr, 4 * v26);
      }
      else
      {
        uint64_t v13 = 0;
      }
    }
    else
    {
      if (v14 != v6)
      {
        memmove(v6, ptr, v14 - v6);
        uint64_t v6 = (char *)*v12;
      }
      uint64_t v13 = 4 * v7 - 4 * v15;
      if (v15 != v7) {
        memmove(v6, &v8[4 * v15], 4 * v7 - 4 * v15);
      }
    }
  }
  else
  {
    if (v6)
    {
      a1[2] = v6;
      operator delete(v6);
      uint64_t v9 = 0;
      a1[1] = 0;
      a1[2] = 0;
      a1[3] = 0;
    }
    if (v7 >> 62) {
      std::vector<float>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v9 >> 1;
    if (v9 >> 1 <= v7) {
      uint64_t v10 = v7;
    }
    if ((unint64_t)v9 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v11 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v10;
    }
    std::vector<float>::__vallocate[abi:ne180100](a1 + 1, v11);
    int64_t v12 = (void **)(a1 + 2);
    uint64_t v6 = (char *)a1[2];
    uint64_t v13 = 4 * v7;
    memmove(v6, v8, 4 * v7);
  }
  *int64_t v12 = &v6[v13];
  CFErrorRef err = 0;
  uint64_t v16 = (const void *)MRLNeuralNetworkTensorCreate();
  unsigned int v23 = v16;
  MRLNeuralNetworkTensorAppendData();
  MRLNeuralNetworkSetInputTensor();
  if (err)
  {
    std::string::basic_string[abi:ne180100]<0>(buf, "MRLNeuralNetworkSetInput");
    InputTranscoder::logMontrealError((uint64_t *)buf, err);
LABEL_33:
    if (v22 < 0) {
      operator delete(*(void **)buf);
    }
    uint64_t v18 = 0;
    goto LABEL_36;
  }
  MRLNeuralNetworkPredict();
  if (err)
  {
    std::string::basic_string[abi:ne180100]<0>(buf, "MRLNeuralNetworkPredict");
    InputTranscoder::logMontrealError((uint64_t *)buf, err);
    goto LABEL_33;
  }
  uint64_t Output = MRLNeuralNetworkGetOutput();
  if (err)
  {
    std::string::basic_string[abi:ne180100]<0>(buf, "MRLNeuralNetworkGetOutput");
    InputTranscoder::logMontrealError((uint64_t *)buf, err);
    goto LABEL_33;
  }
  uint64_t v18 = Output;
  MRLNeuralNetworkGetOutputDimension();
  if (_nlpSignpostLog::token != -1) {
    dispatch_once(&_nlpSignpostLog::token, &__block_literal_global_3);
  }
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    uint64_t v20 = _nlpSignpostLog::log;
    if (os_signpost_enabled((os_log_t)_nlpSignpostLog::log))
    {
      *(_WORD *)std::string buf = 0;
      _os_signpost_emit_with_name_impl(&dword_2369D6000, v20, OS_SIGNPOST_INTERVAL_END, v4, "MontrealRecognition", (const char *)&unk_236A08912, buf, 2u);
    }
  }
LABEL_36:
  if (v16) {
    CFRelease(v16);
  }
  return v18;
}

void sub_2369FB3B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, const void *a20)
{
}

void nlp::CFScopedPtr<MontrealNeuralNetworkTensor *>::reset(const void **a1)
{
  int v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  *a1 = 0;
}

std::string *InputTranscoder::DecoderImpl::DecoderImpl(std::string *a1, uint64_t a2, std::string::size_type *a3, void *a4)
{
  unint64_t v7 = InputTranscoder::CTCDecoder::CTCDecoder(a1, a2 + 104, a4);
  std::string::size_type v8 = a3[1];
  v7[13].__r_.__value_.__l.__size_ = *a3;
  v7[13].__r_.__value_.__r.__words[2] = v8;
  if (v8) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
  }
  a1[14].__r_.__value_.__r.__words[0] = InputTranscoder::createMRLModel(a2);
  a1[14].__r_.__value_.__l.__size_ = 0;
  a1[14].__r_.__value_.__r.__words[2] = 0;
  a1[15].__r_.__value_.__r.__words[0] = 0;
  return a1;
}

void sub_2369FB498(_Unwind_Exception *a1)
{
  uint64_t v3 = *(std::__shared_weak_count **)(v1 + 328);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  InputTranscoder::CTCDecoder::~CTCDecoder((void **)v1);
  _Unwind_Resume(a1);
}

void InputTranscoder::DecoderImpl::enumerateCandidates(InputTranscoder::CTCDecoder *a1, unsigned int *a2, unint64_t a3)
{
  os_signpost_id_t v4 = (const float *)InputTranscoder::MontrealModel::recognize((void *)a1 + 42, a2, a3);
  uint64_t OutputDimension = MRLNeuralNetworkGetOutputDimension();
  InputTranscoder::CTCDecoder::decode(a1, v4, OutputDimension);
}

void sub_2369FB6D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char *__p, char *a12, uint64_t a13, uint64_t a14, char a15)
{
  unint64_t v17 = *(void **)(v15 + 56);
  if (v17)
  {
    *(void *)(v15 + 64) = v17;
    operator delete(v17);
  }
  if (*(char *)(v15 + 47) < 0) {
    operator delete(*(void **)(v15 + 24));
  }
  if (*(char *)(v15 + 23) < 0) {
    operator delete(*(void **)v15);
  }
  MEMORY[0x237E08BB0](v15, 0x1012C40652C33EFLL);
  if (__p)
  {
    a12 = __p;
    operator delete(__p);
  }
  std::string __p = &a15;
  std::vector<InputTranscoder::CTCOutput>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  _Unwind_Resume(a1);
}

std::vector<unsigned int> *__cdecl std::vector<unsigned int>::vector(std::vector<unsigned int> *this, std::vector<unsigned int>::size_type __n)
{
  this->__begin_ = 0;
  this->__end_ = 0;
  this->__end_cap_.__value_ = 0;
  if (__n)
  {
    std::vector<float>::__vallocate[abi:ne180100](this, __n);
    std::vector<unsigned int>::pointer end = this->__end_;
    bzero(end, 4 * __n);
    this->__end_ = &end[__n];
  }
  return this;
}

void sub_2369FB7DC(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t InputTranscoder::KeyboardLayoutImpl::KeyboardLayoutImpl(uint64_t a1, const void *a2, uint64_t a3, uint64_t a4)
{
  *(void *)a1 = &unk_26E9DB400;
  *(unsigned char *)(a1 + 8) = 1;
  BaseLayoutInfoAssorted = (double *)InputTranscoder::getBaseLayoutInfoAssorted(a4);
  *(double *)(a1 + 16) = InputTranscoder::calculateFrame((uint64_t)a2, a3, BaseLayoutInfoAssorted, *(unsigned __int8 *)(a1 + 8));
  *(void *)(a1 + 24) = v9;
  *(long double *)(a1 + 32) = v10;
  *(long double *)(a1 + 4nlp::CFScopedPtr<__CFURL const*>::reset(&a9, 0) = v11;
  *(long double *)(a1 + 48) = hypot(v10, v11);
  *(void *)(a1 + 56) = InputTranscoder::getBaseLayoutInfoAssorted(a4);
  *(void *)(a1 + 64) = InputTranscoder::getBaseLayoutInfoAssorted(a4) + 48;
  int64_t v12 = (void *)(a1 + 72);
  if (*(unsigned char *)(a1 + 8))
  {
    *int64_t v12 = 0;
    *(void *)(a1 + 8nlp::CFScopedPtr<__CFURL const*>::reset(&a9, 0) = 0;
    *(void *)(a1 + 88) = 0;
  }
  else
  {
    *int64_t v12 = 0;
    *(void *)(a1 + 8nlp::CFScopedPtr<__CFURL const*>::reset(&a9, 0) = 0;
    *(void *)(a1 + 88) = 0;
    std::vector<ITKeyInfo>::__init_with_size[abi:ne180100]<std::__wrap_iter<ITKeyInfo const*>,std::__wrap_iter<ITKeyInfo const*>>(v12, a2, (uint64_t)a2 + 56 * a3, 0x6DB6DB6DB6DB6DB7 * ((56 * a3) >> 3));
  }
  return a1;
}

double InputTranscoder::calculateFrame(uint64_t a1, uint64_t a2, double *a3, int a4)
{
  if (!a2) {
    return a3[6];
  }
  uint64_t v6 = a1;
  int v7 = 0;
  uint64_t v8 = a1 + 56 * a2;
  double width = *(double *)(MEMORY[0x263F001A0] + 16);
  double height = *(double *)(MEMORY[0x263F001A0] + 24);
  double x = *MEMORY[0x263F001A0];
  CGFloat y = *(double *)(MEMORY[0x263F001A0] + 8);
  do
  {
    if (a4)
    {
      if (CFStringGetLength(*(CFStringRef *)(v6 + 48)) == 1)
      {
        CharacterAtIndedouble x = CFStringGetCharacterAtIndex(*(CFStringRef *)(v6 + 48), 0);
        unint64_t v14 = *((void *)a3 + 11);
        if (v14)
        {
          uint8x8_t v15 = (uint8x8_t)vcnt_s8((int8x8_t)v14);
          v15.i16[0] = vaddlv_u8(v15);
          if (v15.u32[0] > 1uLL)
          {
            unint64_t v16 = CharacterAtIndex;
            if (v14 <= CharacterAtIndex) {
              unint64_t v16 = CharacterAtIndex % v14;
            }
          }
          else
          {
            unint64_t v16 = (v14 - 1) & CharacterAtIndex;
          }
          unint64_t v17 = *(uint64_t ****)(*((void *)a3 + 10) + 8 * v16);
          if (v17)
          {
            for (uint64_t i = *v17; i; uint64_t i = (uint64_t **)*i)
            {
              unint64_t v19 = (unint64_t)i[1];
              if (v19 == CharacterAtIndex)
              {
                if (*((unsigned __int16 *)i + 8) == CharacterAtIndex) {
                  goto LABEL_22;
                }
              }
              else
              {
                if (v15.u32[0] > 1uLL)
                {
                  if (v19 >= v14) {
                    v19 %= v14;
                  }
                }
                else
                {
                  v19 &= v14 - 1;
                }
                if (v19 != v16) {
                  break;
                }
              }
            }
          }
        }
      }
    }
    else
    {
LABEL_22:
      ++v7;
      v21.origin.double x = x;
      v21.origin.CGFloat y = y;
      v21.size.double width = width;
      v21.size.double height = height;
      CGRect v22 = CGRectUnion(v21, *(CGRect *)(v6 + 16));
      double x = v22.origin.x;
      CGFloat y = v22.origin.y;
      double width = v22.size.width;
      double height = v22.size.height;
    }
    v6 += 56;
  }
  while (v6 != v8);
  if (!v7 || width == 0.0 || height == 0.0) {
    return a3[6];
  }
  return x;
}

uint64_t InputTranscoder::getBaseLayoutInfoAssorted(uint64_t a1)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&_MergedGlobals_2, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&_MergedGlobals_2))
  {
    xmmword_26ADCFE90 = 0u;
    *(_OWORD *)&qword_26ADCFEA0 = 0u;
    dword_26ADCFEB0 = 1065353216;
    __cxa_guard_release(&_MergedGlobals_2);
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26ADCFE88, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26ADCFE88))
  {
    qword_26ADCFEB8 = 850045863;
    unk_26ADCFEC0 = 0u;
    unk_26ADCFED0 = 0u;
    unk_26ADCFEE0 = 0u;
    qword_26ADCFEF0 = 0;
    __cxa_guard_release(&qword_26ADCFE88);
  }
  std::mutex::lock((std::mutex *)&qword_26ADCFEB8);
  uint64_t v82 = a1;
  unint64_t v2 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)&qword_26ADCFEA8, a1);
  unint64_t v3 = *((void *)&xmmword_26ADCFE90 + 1);
  if (!*((void *)&xmmword_26ADCFE90 + 1)) {
    goto LABEL_20;
  }
  unint64_t v4 = v2;
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&xmmword_26ADCFE90 + 8));
  v5.i16[0] = vaddlv_u8(v5);
  unint64_t v6 = v5.u32[0];
  if (v5.u32[0] > 1uLL)
  {
    unint64_t v7 = v2;
    if (v2 >= *((void *)&xmmword_26ADCFE90 + 1)) {
      unint64_t v7 = v2 % *((void *)&xmmword_26ADCFE90 + 1);
    }
  }
  else
  {
    unint64_t v7 = (*((void *)&xmmword_26ADCFE90 + 1) - 1) & v2;
  }
  uint64_t v8 = *(unsigned __int8 ***)(xmmword_26ADCFE90 + 8 * v7);
  if (!v8 || (uint64_t v9 = *v8) == 0)
  {
LABEL_20:
    int v12 = *(char *)(a1 + 23);
    if (v12 >= 0) {
      uint64_t v13 = (const UInt8 *)a1;
    }
    else {
      uint64_t v13 = *(const UInt8 **)a1;
    }
    if (v12 >= 0) {
      CFIndex v14 = *(unsigned __int8 *)(a1 + 23);
    }
    else {
      CFIndex v14 = *(void *)(a1 + 8);
    }
    uint8x8_t v15 = CFURLCreateFromFileSystemRepresentation(0, v13, v14, 0);
    uint64_t v18 = v15;
    if (v15)
    {
      CFDictionaryRef DictionaryWithContentsOfURL = (const __CFDictionary *)nlp::createDictionaryWithContentsOfURL(v15, 0, v16, v17);
      if (DictionaryWithContentsOfURL)
      {
        CFDictionaryRef cf = DictionaryWithContentsOfURL;
        CFArrayRef Required = (const __CFArray *)InputTranscoder::getRequiredCFType<__CFArray const*>(DictionaryWithContentsOfURL, @"keys");
        CFIndex Count = CFArrayGetCount(Required);
        if (Count)
        {
          std::string __p = 0;
          v86[0] = 0;
          v86[1] = 0;
          std::vector<ITKeyInfo>::__vallocate[abi:ne180100](&__p, Count);
          CGRect v22 = (char *)v86[0];
          bzero(v86[0], 56 * ((56 * Count - 56) / 0x38uLL) + 56);
          CFIndex v23 = 0;
          v86[0] = &v22[56 * ((56 * Count - 56) / 0x38uLL) + 56];
          long long v83 = 0uLL;
          uint64_t v84 = 0;
          while (1)
          {
            CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(Required, v23);
            uint64_t v25 = InputTranscoder::getRequiredCFType<__CFString const*>(ValueAtIndex, @"string");
            CFDictionaryRef v26 = (const __CFDictionary *)InputTranscoder::getRequiredCFType<__CFDictionary const*>(ValueAtIndex, @"frame");
            CFNumberRef v27 = (const __CFNumber *)InputTranscoder::getRequiredCFType<__CFNumber const*>(v26, @"x");
            float v28 = InputTranscoder::convert<float>(v27);
            CFNumberRef v29 = (const __CFNumber *)InputTranscoder::getRequiredCFType<__CFNumber const*>(v26, @"y");
            float v30 = InputTranscoder::convert<float>(v29);
            CFNumberRef v31 = (const __CFNumber *)InputTranscoder::getRequiredCFType<__CFNumber const*>(v26, @"width");
            float v32 = InputTranscoder::convert<float>(v31);
            CFNumberRef v33 = (const __CFNumber *)InputTranscoder::getRequiredCFType<__CFNumber const*>(v26, @"height");
            float v34 = InputTranscoder::convert<float>(v33);
            CFTypeRef v35 = CFRetain(v25);
            CFTypeRef v36 = v35;
            long long v37 = (const void **)*((void *)&v83 + 1);
            if (*((void *)&v83 + 1) >= (unint64_t)v84)
            {
              uint64_t v39 = (uint64_t)(*((void *)&v83 + 1) - v83) >> 3;
              unint64_t v40 = v39 + 1;
              if ((unint64_t)(v39 + 1) >> 61) {
                std::vector<ITKeyInfo>::__throw_length_error[abi:ne180100]();
              }
              uint64_t v41 = (uint64_t)&v84[-v83];
              if ((uint64_t)&v84[-v83] >> 2 > v40) {
                unint64_t v40 = v41 >> 2;
              }
              if ((unint64_t)v41 >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v42 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v42 = v40;
              }
              if (v42)
              {
                if (v42 >> 61) {
                  std::__throw_bad_array_new_length[abi:ne180100]();
                }
                uint64_t v43 = (char *)operator new(8 * v42);
              }
              else
              {
                uint64_t v43 = 0;
              }
              unint64_t v44 = &v43[8 * v39];
              *(void *)unint64_t v44 = v36;
              uint64_t v38 = (uint64_t)(v44 + 8);
              if (*((void *)&v83 + 1) == (void)v83)
              {
                *(void *)&long long v83 = v44;
                uint64_t v84 = &v43[8 * v42];
              }
              else
              {
                do
                {
                  uint64_t v45 = (uint64_t)*--v37;
                  *long long v37 = 0;
                  *((void *)v44 - 1) = v45;
                  v44 -= 8;
                }
                while (v37 != (const void **)v83);
                int v46 = (const void **)*((void *)&v83 + 1);
                long long v37 = (const void **)v83;
                *(void *)&long long v83 = v44;
                uint64_t v84 = &v43[8 * v42];
                while (v46 != v37)
                  nlp::CFScopedPtr<__CFString const*>::reset(--v46, 0);
              }
              if (v37) {
                operator delete(v37);
              }
            }
            else
            {
              **((void **)&v83 + 1) = v35;
              uint64_t v38 = *((void *)&v83 + 1) + 8;
            }
            CGFloat v47 = v28;
            CGFloat v48 = v30;
            CGFloat v49 = v32;
            *((void *)&v83 + 1) = v38;
            CGFloat v50 = v34;
            v87.origin.CGFloat x = v47;
            v87.origin.CGFloat y = v48;
            v87.size.CGFloat width = v49;
            v87.size.CGFloat height = v50;
            CGFloat MidX = CGRectGetMidX(v87);
            v88.origin.CGFloat x = v47;
            v88.origin.CGFloat y = v48;
            v88.size.CGFloat width = v49;
            v88.size.CGFloat height = v50;
            CGFloat MidY = CGRectGetMidY(v88);
            uint64_t v53 = *(void *)(v38 - 8);
            CFDictionaryRef v54 = (CGFloat *)((char *)__p + 56 * v23);
            *CFDictionaryRef v54 = MidX;
            v54[1] = MidY;
            v54[2] = v47;
            v54[3] = v48;
            v54[4] = v49;
            v54[5] = v50;
            *((void *)v54 + 6) = v53;
            if (++v23 == Count)
            {
              CGFloat x = *MEMORY[0x263F001A0];
              CGFloat y = *(double *)(MEMORY[0x263F001A0] + 8);
              CGFloat width = *(double *)(MEMORY[0x263F001A0] + 16);
              CGFloat height = *(double *)(MEMORY[0x263F001A0] + 24);
              std::string v59 = (char *)__p;
              std::string v60 = (char *)v86[0];
              while (v59 != v60)
              {
                if (CFStringGetLength(*((CFStringRef *)v59 + 6)) <= 1)
                {
                  v89.origin.CGFloat x = x;
                  v89.origin.CGFloat y = y;
                  v89.size.CGFloat width = width;
                  v89.size.CGFloat height = height;
                  CGRect v90 = CGRectUnion(v89, *(CGRect *)(v59 + 16));
                  CGFloat x = v90.origin.x;
                  CGFloat y = v90.origin.y;
                  CGFloat width = v90.size.width;
                  CGFloat height = v90.size.height;
                }
                v59 += 56;
              }
              operator new();
            }
          }
        }
        CFRelease(cf);
      }
      CFRelease(v18);
    }
    exception = __cxa_allocate_exception(0x20uLL);
    std::operator+<char>();
    nlp::ResourceCreationException::ResourceCreationException(exception, (long long *)&__p);
  }
  uint64_t v10 = *((void *)&xmmword_26ADCFE90 + 1) - 1;
  while (1)
  {
    unint64_t v11 = *((void *)v9 + 1);
    if (v11 == v4) {
      break;
    }
    if (v6 > 1)
    {
      if (v11 >= v3) {
        v11 %= v3;
      }
    }
    else
    {
      v11 &= v10;
    }
    if (v11 != v7) {
      goto LABEL_20;
    }
LABEL_19:
    uint64_t v9 = *(unsigned __int8 **)v9;
    if (!v9) {
      goto LABEL_20;
    }
  }
  if ((std::equal_to<std::string>::operator()[abi:ne180100]((uint64_t)&dword_26ADCFEB0, v9 + 16, (unsigned __int8 *)a1) & 1) == 0) {
    goto LABEL_19;
  }
  unint64_t v61 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)&qword_26ADCFEA8, a1);
  unint64_t v62 = v61;
  unint64_t v63 = *((void *)&xmmword_26ADCFE90 + 1);
  if (*((void *)&xmmword_26ADCFE90 + 1))
  {
    uint8x8_t v64 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&xmmword_26ADCFE90 + 8));
    v64.i16[0] = vaddlv_u8(v64);
    unint64_t v65 = v64.u32[0];
    if (v64.u32[0] > 1uLL)
    {
      unint64_t v7 = v61;
      if (v61 >= *((void *)&xmmword_26ADCFE90 + 1)) {
        unint64_t v7 = v61 % *((void *)&xmmword_26ADCFE90 + 1);
      }
    }
    else
    {
      unint64_t v7 = (*((void *)&xmmword_26ADCFE90 + 1) - 1) & v61;
    }
    int v66 = *(void ***)(xmmword_26ADCFE90 + 8 * v7);
    if (v66)
    {
      for (uint64_t i = *v66; i; uint64_t i = (void *)*i)
      {
        unint64_t v68 = i[1];
        if (v68 == v62)
        {
          if (std::equal_to<std::string>::operator()[abi:ne180100]((uint64_t)&dword_26ADCFEB0, (unsigned __int8 *)i + 16, (unsigned __int8 *)v82))goto LABEL_102; {
        }
          }
        else
        {
          if (v65 > 1)
          {
            if (v68 >= v63) {
              v68 %= v63;
            }
          }
          else
          {
            v68 &= v63 - 1;
          }
          if (v68 != v7) {
            break;
          }
        }
      }
    }
  }
  uint64_t i = operator new(0x38uLL);
  std::string __p = i;
  v86[0] = &qword_26ADCFEA0;
  LOBYTE(v86[1]) = 0;
  *uint64_t i = 0;
  i[1] = v62;
  float v69 = (std::string *)(i + 2);
  if (*(char *)(v82 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v69, *(const std::string::value_type **)v82, *(void *)(v82 + 8));
  }
  else
  {
    *(_OWORD *)&v69->__r_.__value_.__l.__data_ = *(_OWORD *)v82;
    i[4] = *(void *)(v82 + 16);
  }
  i[5] = 0;
  i[6] = 0;
  LOBYTE(v86[1]) = 1;
  float v70 = (float)(unint64_t)(qword_26ADCFEA8 + 1);
  if (!v63 || (float)(*(float *)&dword_26ADCFEB0 * (float)v63) < v70)
  {
    BOOL v71 = 1;
    if (v63 >= 3) {
      BOOL v71 = (v63 & (v63 - 1)) != 0;
    }
    unint64_t v72 = v71 | (2 * v63);
    unint64_t v73 = vcvtps_u32_f32(v70 / *(float *)&dword_26ADCFEB0);
    if (v72 <= v73) {
      size_t v74 = v73;
    }
    else {
      size_t v74 = v72;
    }
    std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<InputTranscoder::LayoutInfoAssorted>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<InputTranscoder::LayoutInfoAssorted>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<InputTranscoder::LayoutInfoAssorted>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<InputTranscoder::LayoutInfoAssorted>>>>::__rehash<true>(v74);
    unint64_t v63 = *((void *)&xmmword_26ADCFE90 + 1);
    if ((*((void *)&xmmword_26ADCFE90 + 1) & (*((void *)&xmmword_26ADCFE90 + 1) - 1)) != 0)
    {
      if (v62 >= *((void *)&xmmword_26ADCFE90 + 1)) {
        unint64_t v7 = v62 % *((void *)&xmmword_26ADCFE90 + 1);
      }
      else {
        unint64_t v7 = v62;
      }
    }
    else
    {
      unint64_t v7 = (*((void *)&xmmword_26ADCFE90 + 1) - 1) & v62;
    }
  }
  uint64_t v75 = xmmword_26ADCFE90;
  unint64_t v76 = *(void **)(xmmword_26ADCFE90 + 8 * v7);
  if (v76)
  {
    *uint64_t i = *v76;
    goto LABEL_100;
  }
  *uint64_t i = qword_26ADCFEA0;
  qword_26ADCFEA0 = (uint64_t)i;
  *(void *)(v75 + 8 * v7) = &qword_26ADCFEA0;
  if (*i)
  {
    unint64_t v77 = *(void *)(*i + 8);
    if ((v63 & (v63 - 1)) != 0)
    {
      if (v77 >= v63) {
        v77 %= v63;
      }
    }
    else
    {
      v77 &= v63 - 1;
    }
    unint64_t v76 = (void *)(xmmword_26ADCFE90 + 8 * v77);
LABEL_100:
    *unint64_t v76 = i;
  }
  std::string __p = 0;
  ++qword_26ADCFEA8;
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<InputTranscoder::LayoutInfoAssorted>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<InputTranscoder::LayoutInfoAssorted>>,void *>>>>::reset[abi:ne180100]((uint64_t *)&__p);
LABEL_102:
  uint64_t v78 = i[5];
  std::mutex::unlock((std::mutex *)&qword_26ADCFEB8);
  return v78;
}

void sub_2369FC954(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, char a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,void *__p,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
}

uint64_t InputTranscoder::KeyboardLayoutImpl::KeyboardLayoutImpl(uint64_t a1, const void *a2, uint64_t a3, uint64_t a4, const __CFDictionary *a5)
{
  *(void *)a1 = &unk_26E9DB400;
  CFBooleanRef Required = (const __CFBoolean *)InputTranscoder::getRequiredCFType<__CFBoolean const*>(a5, @"isAlphabeticPlane");
  *(unsigned char *)(a1 + 8) = CFBooleanGetValue(Required) != 0;
  BaseLayoutInfoAssorted = (double *)InputTranscoder::getBaseLayoutInfoAssorted(a4);
  *(double *)(a1 + 16) = InputTranscoder::calculateFrame((uint64_t)a2, a3, BaseLayoutInfoAssorted, *(unsigned __int8 *)(a1 + 8));
  *(void *)(a1 + 24) = v11;
  *(long double *)(a1 + 32) = v12;
  *(long double *)(a1 + 4nlp::CFScopedPtr<__CFURL const*>::reset(&a9, 0) = v13;
  *(long double *)(a1 + 48) = hypot(v12, v13);
  *(void *)(a1 + 56) = InputTranscoder::getBaseLayoutInfoAssorted(a4);
  *(void *)(a1 + 64) = InputTranscoder::getBaseLayoutInfoAssorted(a4) + 48;
  CFIndex v14 = (void *)(a1 + 72);
  if (*(unsigned char *)(a1 + 8))
  {
    *CFIndex v14 = 0;
    *(void *)(a1 + 8nlp::CFScopedPtr<__CFURL const*>::reset(&a9, 0) = 0;
    *(void *)(a1 + 88) = 0;
  }
  else
  {
    *CFIndex v14 = 0;
    *(void *)(a1 + 8nlp::CFScopedPtr<__CFURL const*>::reset(&a9, 0) = 0;
    *(void *)(a1 + 88) = 0;
    std::vector<ITKeyInfo>::__init_with_size[abi:ne180100]<std::__wrap_iter<ITKeyInfo const*>,std::__wrap_iter<ITKeyInfo const*>>(v14, a2, (uint64_t)a2 + 56 * a3, 0x6DB6DB6DB6DB6DB7 * ((56 * a3) >> 3));
  }
  return a1;
}

void InputTranscoder::KeyboardLayoutImpl::enumerateNearestKeys(uint64_t a1, uint64_t a2, double a3, double a4)
{
  *(double *)float v69 = a3;
  *(double *)&v69[1] = a4;
  std::string __p = 0;
  int v66 = 0;
  float v67 = 0;
  unint64_t v68 = (double *)v69;
  if (*(unsigned char *)(a1 + 8)) {
    uint8x8_t v5 = *(long long ***)(a1 + 56);
  }
  else {
    uint8x8_t v5 = (long long **)(a1 + 72);
  }
  unint64_t v6 = *v5;
  unint64_t v7 = v5[1];
  if (*v5 != v7)
  {
    do
    {
      uint64_t v8 = v66;
      if (v66 >= v67)
      {
        long double v13 = __p;
        uint64_t v14 = 0x6DB6DB6DB6DB6DB7 * ((v66 - (unsigned char *)__p) >> 3);
        unint64_t v15 = v14 + 1;
        if ((unint64_t)(v14 + 1) > 0x492492492492492) {
          std::vector<ITKeyInfo>::__throw_length_error[abi:ne180100]();
        }
        if (0xDB6DB6DB6DB6DB6ELL * ((v67 - (unsigned char *)__p) >> 3) > v15) {
          unint64_t v15 = 0xDB6DB6DB6DB6DB6ELL * ((v67 - (unsigned char *)__p) >> 3);
        }
        if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((v67 - (unsigned char *)__p) >> 3)) >= 0x249249249249249) {
          unint64_t v16 = 0x492492492492492;
        }
        else {
          unint64_t v16 = v15;
        }
        if (v16)
        {
          unint64_t v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ITKeyInfo>>((uint64_t)&v67, v16);
          long double v13 = __p;
          uint64_t v8 = v66;
        }
        else
        {
          unint64_t v17 = 0;
        }
        uint64_t v18 = &v17[8 * ((v66 - (unsigned char *)__p) >> 3)];
        long long v19 = *v6;
        long long v20 = v6[1];
        long long v21 = v6[2];
        *((void *)v18 + 6) = *((void *)v6 + 6);
        *((_OWORD *)v18 + 1) = v20;
        *((_OWORD *)v18 + 2) = v21;
        *(_OWORD *)uint64_t v18 = v19;
        if (v8 == v13)
        {
          CFDictionaryRef v26 = &v17[56 * v14];
        }
        else
        {
          CGRect v22 = &v17[56 * v14];
          do
          {
            long long v23 = *(_OWORD *)((char *)v8 - 56);
            long long v24 = *(_OWORD *)((char *)v8 - 40);
            long long v25 = *(_OWORD *)((char *)v8 - 24);
            CFDictionaryRef v26 = v22 - 56;
            *((void *)v22 - 1) = *((void *)v8 - 1);
            *(_OWORD *)(v22 - 24) = v25;
            *(_OWORD *)(v22 - 4nlp::CFScopedPtr<__CFURL const*>::reset(&a9, 0) = v24;
            *(_OWORD *)(v22 - 56) = v23;
            uint64_t v8 = (_OWORD *)((char *)v8 - 56);
            v22 -= 56;
          }
          while (v8 != v13);
        }
        uint64_t v12 = (uint64_t)(v18 + 56);
        std::string __p = v26;
        int v66 = v18 + 56;
        float v67 = &v17[56 * v16];
        if (v13) {
          operator delete(v13);
        }
      }
      else
      {
        long long v9 = *v6;
        long long v10 = v6[1];
        long long v11 = v6[2];
        *((void *)v66 + 6) = *((void *)v6 + 6);
        v8[1] = v10;
        v8[2] = v11;
        *uint64_t v8 = v9;
        uint64_t v12 = (uint64_t)v8 + 56;
      }
      int v66 = (char *)v12;
      *(void *)&long long v71 = v68;
      std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,InputTranscoder::KeyboardLayoutImpl::enumerateNearestKeys(CGPoint,void({block_pointer})(ITKeyInfo,BOOL *))::$_0 &,std::__wrap_iter<ITKeyInfo*>>((uint64_t)__p, v12, (double **)&v71, 0x6DB6DB6DB6DB6DB7 * ((v12 - (uint64_t)__p) >> 3));
      unint64_t v6 = (long long *)((char *)v6 + 56);
    }
    while (v6 != v7);
    CFNumberRef v27 = (char *)__p;
    char v64 = 0;
    if (__p != v66)
    {
      uint64_t v60 = a2;
      do
      {
        long long v28 = *(_OWORD *)v27;
        long long v29 = *((_OWORD *)v27 + 1);
        long long v30 = *((_OWORD *)v27 + 2);
        uint64_t v63 = *((void *)v27 + 6);
        v62[1] = v29;
        v62[2] = v30;
        v62[0] = v28;
        (*(void (**)(uint64_t, _OWORD *, char *))(a2 + 16))(a2, v62, &v64);
        CFNumberRef v27 = (char *)__p;
        if (v64) {
          break;
        }
        CFNumberRef v31 = v66;
        float v32 = v68;
        float v70 = v68;
        if (v66 - (unsigned char *)__p >= 57)
        {
          unint64_t v61 = v66;
          uint64_t v33 = 0;
          uint64_t v34 = 0x6DB6DB6DB6DB6DB7 * ((v66 - (unsigned char *)__p) >> 3);
          long long v35 = *((_OWORD *)__p + 1);
          long long v71 = *(_OWORD *)__p;
          long long v72 = v35;
          long long v73 = *((_OWORD *)__p + 2);
          uint64_t v74 = *((void *)__p + 6);
          CFTypeRef v36 = (double *)__p;
          do
          {
            long long v37 = v36;
            v36 += 7 * v33 + 7;
            uint64_t v38 = 2 * v33;
            uint64_t v33 = (2 * v33) | 1;
            uint64_t v39 = v38 + 2;
            if (v38 + 2 < v34)
            {
              double v40 = *v32;
              double v41 = v32[1];
              double v42 = vabdd_f64(v41, v36[1]);
              float v43 = vabdd_f64(*v32, *v36) - v36[4] * 0.400000006;
              if (v43 < 0.0) {
                float v43 = 0.0;
              }
              float v44 = v42 - v36[5] * 0.400000006;
              if (v44 < 0.0) {
                float v44 = 0.0;
              }
              float v45 = hypotf(v43, v44);
              double v46 = vabdd_f64(v41, v36[8]);
              float v47 = vabdd_f64(v40, v36[7]) - v36[11] * 0.400000006;
              if (v47 < 0.0) {
                float v47 = 0.0;
              }
              float v48 = v46 - v36[12] * 0.400000006;
              if (v48 < 0.0) {
                float v48 = 0.0;
              }
              if (v45 > hypotf(v47, v48))
              {
                v36 += 7;
                uint64_t v33 = v39;
              }
            }
            long long v49 = *(_OWORD *)v36;
            long long v50 = *((_OWORD *)v36 + 1);
            long long v51 = *((_OWORD *)v36 + 2);
            v37[6] = v36[6];
            *((_OWORD *)v37 + 1) = v50;
            *((_OWORD *)v37 + 2) = v51;
            *(_OWORD *)long long v37 = v49;
          }
          while (v33 <= (uint64_t)((unint64_t)(v34 - 2) >> 1));
          CFNumberRef v31 = v61;
          long long v52 = (long long *)(v61 - 56);
          if (v36 == (double *)(v61 - 56))
          {
            long long v57 = v71;
            long long v58 = v72;
            long long v59 = v73;
            *((void *)v36 + 6) = v74;
            *((_OWORD *)v36 + 1) = v58;
            *((_OWORD *)v36 + 2) = v59;
            *(_OWORD *)CFTypeRef v36 = v57;
          }
          else
          {
            long long v53 = *v52;
            long long v54 = *(_OWORD *)(v61 - 40);
            long long v55 = *(_OWORD *)(v61 - 24);
            v36[6] = *((double *)v61 - 1);
            *((_OWORD *)v36 + 1) = v54;
            *((_OWORD *)v36 + 2) = v55;
            *(_OWORD *)CFTypeRef v36 = v53;
            long long v56 = v72;
            *long long v52 = v71;
            *(_OWORD *)(v61 - 4nlp::CFScopedPtr<__CFURL const*>::reset(&a9, 0) = v56;
            *(_OWORD *)(v61 - 24) = v73;
            *((void *)v61 - 1) = v74;
            std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,InputTranscoder::KeyboardLayoutImpl::enumerateNearestKeys(CGPoint,void({block_pointer})(ITKeyInfo,BOOL *))::$_0 &,std::__wrap_iter<ITKeyInfo*>>((uint64_t)v27, (uint64_t)(v36 + 7), &v70, 0x6DB6DB6DB6DB6DB7 * (((char *)(v36 + 7) - v27) >> 3));
            CFNumberRef v27 = (char *)__p;
            CFNumberRef v31 = v66;
          }
          a2 = v60;
        }
        int v66 = v31 - 56;
      }
      while (v27 != v31 - 56);
    }
    if (v27)
    {
      int v66 = v27;
      operator delete(v27);
    }
  }
}

void sub_2369FD040(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p,uint64_t a23)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void InputTranscoder::KeyboardLayoutImpl::enclosingKey(InputTranscoder::KeyboardLayoutImpl *this@<X0>, CGPoint a2@<0:D0, 8:D1>, uint64_t a3@<X8>)
{
  double y = a2.y;
  double x = a2.x;
  if (*((unsigned char *)this + 8)) {
    unint64_t v6 = (long long **)*((void *)this + 7);
  }
  else {
    unint64_t v6 = (long long **)((char *)this + 72);
  }
  unint64_t v7 = *v6;
  uint64_t v8 = v6[1];
  if (*v6 == v8)
  {
LABEL_10:
    *(_OWORD *)a3 = v15;
    *(_OWORD *)(a3 + 16) = v16;
    *(_OWORD *)(a3 + 32) = v17;
    uint64_t v13 = v18;
  }
  else
  {
    float v9 = INFINITY;
    while (1)
    {
      v19.double x = x;
      v19.double y = y;
      if (CGRectContainsPoint(*(CGRect *)(v7 + 1), v19)) {
        break;
      }
      float v10 = x - *(double *)v7;
      float v11 = y - *((double *)v7 + 1);
      float v12 = hypotf(v10, v11);
      if (v12 < v9)
      {
        long long v15 = *v7;
        long long v16 = v7[1];
        long long v17 = v7[2];
        uint64_t v18 = *((void *)v7 + 6);
        float v9 = v12;
      }
      unint64_t v7 = (long long *)((char *)v7 + 56);
      if (v7 == v8) {
        goto LABEL_10;
      }
    }
    long long v14 = v7[1];
    *(_OWORD *)a3 = *v7;
    *(_OWORD *)(a3 + 16) = v14;
    *(_OWORD *)(a3 + 32) = v7[2];
    uint64_t v13 = *((void *)v7 + 6);
  }
  *(void *)(a3 + 48) = v13;
}

void InputTranscoder::KeyboardLayoutImpl::keyCandidatesForLastTouch(InputTranscoder::KeyboardLayoutImpl *this@<X0>, CGPoint a2@<0:D0, 8:D1>, uint64_t a3@<X8>)
{
  uint64_t v20 = 0;
  long long v21 = &v20;
  uint64_t v22 = 0x4002000000;
  long long v23 = __Block_byref_object_copy__3;
  long long v24 = __Block_byref_object_dispose__3;
  memset(v25, 0, 24);
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2000000000;
  int v19 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2000000000;
  float v4 = *((double *)this + 6);
  float v17 = v4;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 0x40000000;
  v14[2] = ___ZNK15InputTranscoder18KeyboardLayoutImpl25keyCandidatesForLastTouchE7CGPoint_block_invoke;
  v14[3] = &unk_264CBA640;
  CGPoint v15 = a2;
  v14[4] = v16;
  void v14[5] = &v20;
  v14[6] = v18;
  InputTranscoder::KeyboardLayoutImpl::enumerateNearestKeys((uint64_t)this, (uint64_t)v14, a2.x, a2.y);
  uint8x8_t v5 = v21;
  *(void *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0;
  *(void *)a3 = 0;
  unint64_t v6 = (long long *)v5[5];
  unint64_t v7 = (long long *)v5[6];
  void v25[3] = a3;
  char v26 = 0;
  uint64_t v8 = (char *)v7 - (char *)v6;
  if (v7 != v6)
  {
    if (v8 < 0) {
      std::vector<ITKeyInfo>::__throw_length_error[abi:ne180100]();
    }
    float v9 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<InputTranscoder::KeyCandidateImpl>>(v8 >> 5);
    *(void *)a3 = v9;
    *(void *)(a3 + 8) = v9;
    *(void *)(a3 + 16) = (char *)v9 + 32 * v10;
    long long v29 = v9;
    long long v30 = v9;
    v27[0] = (void **)(a3 + 16);
    v27[1] = (void **)&v29;
    v27[2] = (void **)&v30;
    float v11 = v9;
    char v28 = 0;
    do
    {
      if (*((char *)v6 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(v11, *(const std::string::value_type **)v6, *((void *)v6 + 1));
        uint64_t v13 = v30;
      }
      else
      {
        long long v12 = *v6;
        v11->__r_.__value_.__r.__words[2] = *((void *)v6 + 2);
        *(_OWORD *)&v11->__r_.__value_.__l.__data_ = v12;
        uint64_t v13 = v11;
      }
      LODWORD(v11[1].__r_.__value_.__l.__data_) = *((_DWORD *)v6 + 6);
      v6 += 2;
      float v11 = (std::string *)((char *)v13 + 32);
      long long v30 = (std::string *)((char *)v13 + 32);
    }
    while (v6 != v7);
    char v28 = 1;
    std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<InputTranscoder::KeyCandidateImpl>,InputTranscoder::KeyCandidateImpl*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v27);
    *(void *)(a3 + 8) = v11;
  }
  _Block_object_dispose(v16, 8);
  _Block_object_dispose(v18, 8);
  _Block_object_dispose(&v20, 8);
  v27[0] = (void **)v25;
  std::vector<InputTranscoder::KeyCandidateImpl>::__destroy_vector::operator()[abi:ne180100](v27);
}

void sub_2369FD364(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  *(void *)(v28 - 112) = v27;
  std::vector<InputTranscoder::KeyCandidateImpl>::__destroy_vector::operator()[abi:ne180100]((void ***)(v28 - 112));
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__3(void *a1, uint64_t a2)
{
  a1[5] = 0;
  a1[6] = 0;
  a1[7] = 0;
  __n128 result = *(__n128 *)(a2 + 40);
  *(__n128 *)(a1 + 5) = result;
  a1[7] = *(void *)(a2 + 56);
  *(void *)(a2 + 4nlp::CFScopedPtr<__CFURL const*>::reset(&a9, 0) = 0;
  *(void *)(a2 + 48) = 0;
  *(void *)(a2 + 56) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
  uint64_t v1 = (void **)(a1 + 40);
  std::vector<InputTranscoder::KeyCandidateImpl>::__destroy_vector::operator()[abi:ne180100](&v1);
}

void ___ZNK15InputTranscoder18KeyboardLayoutImpl25keyCandidatesForLastTouchE7CGPoint_block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  float32x2_t v6 = vcvt_f32_f64(vaddq_f64(vabdq_f64(*(float64x2_t *)(a1 + 56), *(float64x2_t *)a2), vmulq_f64(*(float64x2_t *)(a2 + 32), (float64x2_t)vdupq_n_s64(0xBFD99999A0000000))));
  int32x2_t v7 = vcltz_f32(v6);
  if (v7.i8[0]) {
    float v8 = 0.0;
  }
  else {
    float v8 = v6.f32[0];
  }
  float v9 = v6.f32[1];
  if (v7.i8[4]) {
    float v9 = 0.0;
  }
  float v10 = hypotf(v8, v9) / *(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  nlp::getUTF8StringFromCFString(*(const __CFString **)(a2 + 48), __p);
  if (SHIBYTE(__p[2]) < 0)
  {
    std::string::__init_copy_ctor_external(&v36, (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
    float v37 = v10;
    if (SHIBYTE(__p[2]) < 0) {
      operator delete(__p[0]);
    }
  }
  else
  {
    std::string v36 = *(std::string *)__p;
    float v37 = v10;
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  unint64_t v12 = *(void *)(v11 + 48);
  unint64_t v13 = *(void *)(v11 + 56);
  if (v12 >= v13)
  {
    uint64_t v15 = *(void *)(v11 + 40);
    uint64_t v16 = (uint64_t)(v12 - v15) >> 5;
    if ((unint64_t)(v16 + 1) >> 59) {
      std::vector<ITKeyInfo>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v17 = v13 - v15;
    uint64_t v18 = v17 >> 4;
    if (v17 >> 4 <= (unint64_t)(v16 + 1)) {
      uint64_t v18 = v16 + 1;
    }
    if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFE0) {
      unint64_t v19 = 0x7FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v19 = v18;
    }
    __p[4] = (void *)(v11 + 56);
    if (v19)
    {
      long long v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<InputTranscoder::KeyCandidateImpl>>(v19);
    }
    else
    {
      long long v21 = 0;
      uint64_t v20 = 0;
    }
    long long v23 = &v21[32 * v16];
    __p[0] = v21;
    __p[1] = v23;
    __p[2] = v23;
    __p[3] = &v21[32 * v20];
    if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::__init_copy_ctor_external((std::string *)&v21[32 * v16], v36.__r_.__value_.__l.__data_, v36.__r_.__value_.__l.__size_);
      long long v23 = (char *)__p[1];
      long long v25 = (char *)__p[2];
    }
    else
    {
      long long v24 = *(_OWORD *)&v36.__r_.__value_.__l.__data_;
      *((void *)v23 + 2) = *((void *)&v36.__r_.__value_.__l + 2);
      *(_OWORD *)long long v23 = v24;
      long long v25 = &v21[32 * v16];
    }
    *(float *)&v21[32 * v16 + 24] = v37;
    __p[2] = v25 + 32;
    char v26 = *(const std::string::value_type ***)(v11 + 40);
    uint64_t v27 = *(const std::string::value_type ***)(v11 + 48);
    *(void *)&long long v42 = v23;
    *((void *)&v42 + 1) = v23;
    long long v41 = v42;
    v39[0] = v11 + 56;
    v39[1] = &v41;
    v39[2] = &v42;
    char v40 = 0;
    if (v27 != v26)
    {
      do
      {
        uint64_t v28 = (std::string *)(v23 - 32);
        long long v29 = v27 - 4;
        if (*((char *)v27 - 9) < 0)
        {
          std::string::__init_copy_ctor_external(v28, *(v27 - 4), (std::string::size_type)*(v27 - 3));
          CFNumberRef v31 = (char *)*((void *)&v42 + 1);
        }
        else
        {
          long long v30 = *(_OWORD *)v29;
          *((void *)v23 - 2) = *(v27 - 2);
          *(_OWORD *)&v28->__r_.__value_.__l.__data_ = v30;
          CFNumberRef v31 = v23;
        }
        *((_DWORD *)v23 - 2) = *((_DWORD *)v27 - 2);
        long long v23 = v31 - 32;
        *((void *)&v42 + 1) = v31 - 32;
        v27 -= 4;
      }
      while (v29 != v26);
    }
    char v40 = 1;
    std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<InputTranscoder::KeyCandidateImpl>,std::reverse_iterator<InputTranscoder::KeyCandidateImpl*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v39);
    float v32 = *(void **)(v11 + 56);
    long long v33 = *(_OWORD *)&__p[2];
    long long v35 = __p[2];
    long long v34 = *(_OWORD *)(v11 + 40);
    *(void *)(v11 + 4nlp::CFScopedPtr<__CFURL const*>::reset(&a9, 0) = v23;
    *(_OWORD *)&__p[1] = v34;
    *(_OWORD *)(v11 + 48) = v33;
    __p[3] = v32;
    __p[0] = (void *)v34;
    std::__split_buffer<InputTranscoder::KeyCandidateImpl>::~__split_buffer((uint64_t)__p);
    uint64_t v22 = v35;
  }
  else
  {
    if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::__init_copy_ctor_external(*(std::string **)(v11 + 48), v36.__r_.__value_.__l.__data_, v36.__r_.__value_.__l.__size_);
    }
    else
    {
      long long v14 = *(_OWORD *)&v36.__r_.__value_.__l.__data_;
      *(void *)(v12 + 16) = *((void *)&v36.__r_.__value_.__l + 2);
      *(_OWORD *)unint64_t v12 = v14;
    }
    *(float *)(v12 + 24) = v37;
    uint64_t v22 = (void *)(v12 + 32);
    *(void *)(v11 + 48) = v12 + 32;
  }
  *(void *)(v11 + 48) = v22;
  if (++*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) == 5) {
    *a3 = 1;
  }
  if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v36.__r_.__value_.__l.__data_);
  }
}

void sub_2369FD720(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,uint64_t a25,uint64_t a26,char a27)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

__n128 InputTranscoder::KeyboardLayoutImpl::getScaledPoint(InputTranscoder::KeyboardLayoutImpl *this, CGPoint a2)
{
  CGFloat y = a2.y;
  if (*((unsigned char *)this + 8))
  {
    float64x2_t v6 = (float64x2_t)a2;
    float v4 = (float64x2_t *)*((void *)this + 8);
    if (CGRectEqualToRect(*(CGRect *)v4->f64, *(CGRect *)((char *)this + 16))) {
      a2 = (CGPoint)v6;
    }
    else {
      a2 = (CGPoint)vmlaq_f64(*v4, v4[1], vdivq_f64(vsubq_f64(v6, *((float64x2_t *)this + 1)), *((float64x2_t *)this + 2)));
    }
  }
  result.n128_f64[0] = a2.x;
  return result;
}

double InputTranscoder::KeyboardLayoutImpl::normalizePointToRange(uint64_t a1, double a2, double a3, float a4, float a5)
{
  return a4 + (a2 - **(double **)(a1 + 64)) / *(double *)(*(void *)(a1 + 64) + 16) * (float)(a5 - a4);
}

double InputTranscoder::KeyboardLayoutImpl::getCentroid(InputTranscoder::KeyboardLayoutImpl *this, int a2)
{
  if (*((unsigned char *)this + 8)) {
    unint64_t v3 = (CFStringRef **)*((void *)this + 7);
  }
  else {
    unint64_t v3 = (CFStringRef **)((char *)this + 72);
  }
  float v4 = *v3;
  uint8x8_t v5 = v3[1];
  if (*v3 != v5)
  {
    while (CFStringGetCharacterAtIndex(v4[6], 0) != a2)
    {
      v4 += 7;
      if (v4 == v5)
      {
        float v4 = v5;
        return *(double *)v4;
      }
    }
  }
  return *(double *)v4;
}

double InputTranscoder::KeyboardLayoutImpl::getSpaceCost(InputTranscoder::KeyboardLayoutImpl *this, const unsigned __int16 *a2, const unsigned __int16 *a3)
{
  double v3 = 0.0;
  if ((unsigned __int16)this != (unsigned __int16)a2)
  {
    char v4 = (char)a2;
    char v5 = (char)this;
    float64x2_t v6 = (char *)operator new(5uLL);
    int32x2_t v7 = v6;
    *(_DWORD *)float64x2_t v6 = 1851946595;
    v6[4] = 120;
    float v8 = v6 + 5;
    if (v5 == 32) {
      char v9 = v4;
    }
    else {
      char v9 = v5;
    }
    float v10 = memchr(v6, v9, 5uLL);
    if (v10) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = v8;
    }
    double v3 = dbl_236A08680[v11 - v7 == 5];
    operator delete(v7);
  }
  return v3;
}

double InputTranscoder::KeyboardLayoutImpl::getInsertionCost(InputTranscoder::KeyboardLayoutImpl *this, CFStringRef theString, const __CFString *a3, CFIndex idx, unsigned int a5)
{
  CFIndex v9 = idx;
  if (CFStringGetCharacterAtIndex(theString, idx) == 32 || CFStringGetCharacterAtIndex(a3, a5) == 32)
  {
    CharacterAtIndedouble x = (InputTranscoder::KeyboardLayoutImpl *)CFStringGetCharacterAtIndex(theString, v9);
    uint64_t v11 = (const unsigned __int16 *)CFStringGetCharacterAtIndex(a3, a5);
    return InputTranscoder::KeyboardLayoutImpl::getSpaceCost(CharacterAtIndex, v11, v12);
  }
  else
  {
    long long v14 = (const unsigned __int16 *)CFStringGetCharacterAtIndex(theString, v9);
    unsigned __int16 v15 = CFStringGetCharacterAtIndex(a3, a5);
    return InputTranscoder::KeyboardLayoutImpl::getKeyDistance(this, v14, &v15);
  }
}

double InputTranscoder::KeyboardLayoutImpl::getKeyDistance(InputTranscoder::KeyboardLayoutImpl *this, const unsigned __int16 *a2, const unsigned __int16 *a3)
{
  double Centroid = InputTranscoder::KeyboardLayoutImpl::getCentroid(this, (unsigned __int16)a2);
  double v7 = v6;
  float v8 = Centroid - InputTranscoder::KeyboardLayoutImpl::getCentroid(this, *a3);
  *(float *)&double v9 = v7 - v9;
  return fabsf(hypotf(v8, *(float *)&v9)) / *((double *)this + 6);
}

double InputTranscoder::KeyboardLayoutImpl::getDeletionCost(InputTranscoder::KeyboardLayoutImpl *this, CFStringRef theString, CFIndex idx)
{
  CFIndex v5 = idx;
  CFIndex v6 = (idx - 1);
  if (CFStringGetCharacterAtIndex(theString, idx) == 32
    || CFStringGetCharacterAtIndex(theString, v6) == 32)
  {
    CharacterAtIndedouble x = (InputTranscoder::KeyboardLayoutImpl *)CFStringGetCharacterAtIndex(theString, v5);
    float v8 = (const unsigned __int16 *)CFStringGetCharacterAtIndex(theString, v6);
    return InputTranscoder::KeyboardLayoutImpl::getSpaceCost(CharacterAtIndex, v8, v9);
  }
  else
  {
    uint64_t v11 = (const unsigned __int16 *)CFStringGetCharacterAtIndex(theString, v5);
    unsigned __int16 v12 = CFStringGetCharacterAtIndex(theString, v6);
    return InputTranscoder::KeyboardLayoutImpl::getKeyDistance(this, v11, &v12);
  }
}

double InputTranscoder::KeyboardLayoutImpl::getEditDistance(InputTranscoder::KeyboardLayoutImpl *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  CFStringRef CFStringFromString = nlp::createCFStringFromString(a2);
  CFStringRef theString = CFStringFromString;
  double v7 = (__CFString *)nlp::createCFStringFromString(a3);
  double v46 = v7;
  if (CFStringFromString && CFStringGetLength(CFStringFromString))
  {
    if (v7 && CFStringGetLength(v7))
    {
      unint64_t Length = CFStringGetLength(CFStringFromString);
      unint64_t v9 = CFStringGetLength(v7);
      std::vector<double>::vector(&__p, v9 + 1);
      std::vector<std::vector<double>>::vector(v45, Length + 1, (uint64_t)&__p);
      if (*(double *)&__p != 0.0)
      {
        double v49 = *(double *)&__p;
        operator delete(__p);
      }
      float v10 = (uint64_t *)v45[0];
      **(void **)v45[0] = 0;
      if (Length)
      {
        uint64_t v11 = 1;
        do
        {
          uint64_t v12 = 0;
          *(void *)v10[3 * v11] = 0;
          do
          {
            uint64_t v13 = v12 + 1;
            double DeletionCost = 1.0;
            if (Length > v12 + 1)
            {
              double DeletionCost = InputTranscoder::KeyboardLayoutImpl::getDeletionCost(a1, CFStringFromString, (v12 + 1));
              float v10 = (uint64_t *)v45[0];
            }
            *(double *)v10[3 * v11] = DeletionCost + *(double *)v10[3 * v11];
            uint64_t v12 = v13;
          }
          while (v11 != v13);
          BOOL v15 = v11++ == Length;
        }
        while (!v15);
      }
      if (v9)
      {
        if (Length >= v9) {
          unint64_t v16 = v9;
        }
        else {
          unint64_t v16 = Length;
        }
        uint64_t v17 = *v10;
        uint64_t v18 = 1;
        do
        {
          CFIndex v19 = 0;
          *(void *)(v17 + 8 * v18) = 0;
          do
          {
            CFIndex v20 = v19 + 1;
            double InsertionCost = 1.0;
            if (v16 > v19 + 1)
            {
              double InsertionCost = InputTranscoder::KeyboardLayoutImpl::getInsertionCost(a1, CFStringFromString, v7, v19, v19);
              float v10 = (uint64_t *)v45[0];
              uint64_t v17 = *(void *)v45[0];
            }
            *(double *)(v17 + 8 * v18) = InsertionCost + *(double *)(v17 + 8 * v18);
            CFIndex v19 = v20;
          }
          while (v18 != v20);
          BOOL v15 = v18++ == v9;
        }
        while (!v15);
      }
      if (Length)
      {
        unint64_t v22 = 1;
        do
        {
          if (v9)
          {
            unsigned int v41 = v22 - 1;
            iddouble x = (v22 - 2);
            CFIndex v43 = v22 - 1;
            double v23 = *(double *)v10[3 * v22];
            unint64_t v24 = 1;
            unint64_t v44 = v22;
            do
            {
              if (Length <= v22)
              {
                uint64_t v28 = v10[3 * v43];
                double v26 = *(double *)(v28 + 8 * v24);
                double v25 = 1.0;
                CFIndex v29 = v41;
                double v27 = 1.0;
              }
              else
              {
                double v25 = InputTranscoder::KeyboardLayoutImpl::getInsertionCost(a1, CFStringFromString, v7, v22, (int)v24 - 1);
                double v26 = *(double *)(*(void *)(v45[0] + 24 * v43) + 8 * v24);
                CFStringRef CFStringFromString = theString;
                double v27 = InputTranscoder::KeyboardLayoutImpl::getDeletionCost(a1, theString, v22);
                uint64_t v28 = *(void *)(v45[0] + 24 * v43);
                CFIndex v29 = v43;
                double v7 = v46;
              }
              double v30 = *(double *)(v28 + 8 * (v24 - 1));
              double v31 = v30
                  + InputTranscoder::KeyboardLayoutImpl::getInsertionCost(a1, CFStringFromString, v7, v29, (int)v24 - 1);
              if (v44 < 2 || v24 < 2)
              {
                double v32 = v31;
              }
              else
              {
                double v7 = v46;
                if (InputTranscoder::KeyboardLayoutImpl::getInsertionCost(a1, CFStringFromString, v46, v29, (int)v24 - 2) == 0.0&& (double v7 = v46, InputTranscoder::KeyboardLayoutImpl::getInsertionCost(a1, CFStringFromString, v46, idx, (int)v24 - 1) == 0.0))
                {
                  double v32 = *(double *)(*(void *)(v45[0] + 24 * idx) + 8 * (v24 - 2))
                      + 0.181999996;
                }
                else
                {
                  double v32 = v31;
                }
              }
              double v33 = v23 + v25;
              *(double *)&std::string __p = v23 + v25;
              double v49 = v26 + v27;
              double v50 = v31;
              double v51 = v32;
              p_p = &__p;
              uint64_t v35 = 8;
              unint64_t v22 = v44;
              do
              {
                if (*(double *)((char *)&__p + v35) < v33)
                {
                  double v33 = *(double *)((char *)&__p + v35);
                  p_p = (void **)((char *)&__p + v35);
                }
                v35 += 8;
              }
              while (v35 != 32);
              float v10 = (uint64_t *)v45[0];
              double v23 = *(double *)p_p;
              *(void *)(*(void *)(v45[0] + 24 * v44) + 8 * v24) = *p_p;
              BOOL v15 = v24++ == v9;
            }
            while (!v15);
          }
          BOOL v15 = v22++ == Length;
        }
        while (!v15);
        double v7 = v46;
      }
      double v36 = *(double *)(v10[3 * Length] + 8 * v9);
      *(double *)&std::string __p = COERCE_DOUBLE(v45);
      std::vector<std::vector<double>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
      if (!v7) {
        goto LABEL_57;
      }
LABEL_56:
      CFRelease(v7);
      goto LABEL_57;
    }
    unint64_t v37 = *(unsigned __int8 *)(a2 + 23);
    int v38 = (char)v37;
    unint64_t v39 = *(void *)(a2 + 8);
  }
  else
  {
    unint64_t v37 = *(unsigned __int8 *)(a3 + 23);
    int v38 = (char)v37;
    unint64_t v39 = *(void *)(a3 + 8);
  }
  if (v38 < 0) {
    unint64_t v37 = v39;
  }
  double v36 = (double)v37;
  if (v7) {
    goto LABEL_56;
  }
LABEL_57:
  if (CFStringFromString) {
    CFRelease(CFStringFromString);
  }
  return v36;
}

void sub_2369FE000(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, const void *a17, const void *a18, void *__p, uint64_t a20)
{
  if (__p)
  {
    a20 = (uint64_t)__p;
    operator delete(__p);
  }
  nlp::CFScopedPtr<__CFString const*>::reset(&a17, 0);
  nlp::CFScopedPtr<__CFString const*>::reset(&a18, 0);
  _Unwind_Resume(a1);
}

uint64_t InputTranscoder::KeyboardLayoutImpl::getAutocorrectionOperations(InputTranscoder::KeyboardLayoutImpl *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  InputTranscoder::toLower(a2, (uint64_t)v74);
  InputTranscoder::toLower(a3, (uint64_t)v72);
  CFStringRef CFStringFromString = nlp::createCFStringFromString((uint64_t)v74);
  CFStringRef v71 = CFStringFromString;
  CFStringRef v6 = nlp::createCFStringFromString((uint64_t)v72);
  v70[3] = v6;
  if (CFStringFromString && CFStringGetLength(CFStringFromString))
  {
    if (!v6)
    {
      uint64_t v61 = 0;
      goto LABEL_87;
    }
    if (CFStringGetLength(v6))
    {
      if (*(char *)(a2 + 23) >= 0) {
        uint64_t v7 = *(unsigned __int8 *)(a2 + 23);
      }
      else {
        uint64_t v7 = *(void *)(a2 + 8);
      }
      uint64_t v8 = *(unsigned __int8 *)(a3 + 23);
      if ((v8 & 0x80u) != 0) {
        uint64_t v8 = *(void *)(a3 + 8);
      }
      uint64_t v65 = v8;
      std::vector<unsigned int>::size_type v9 = v8 + 1;
      std::vector<double>::vector(&__p, v8 + 1);
      unint64_t v10 = v7 + 1;
      std::vector<std::vector<double>>::vector(v70, v7 + 1, (uint64_t)&__p);
      if (__p.__begin_)
      {
        __p.__end_ = __p.__begin_;
        operator delete(__p.__begin_);
      }
      std::vector<unsigned int>::vector(&__p, v9);
      float v67 = 0;
      unint64_t v68 = 0;
      float v69 = 0;
      *(void *)unint64_t v76 = &v67;
      char v77 = 0;
      if (v7 != -1)
      {
        if (v10 >= 0xAAAAAAAAAAAAAABLL) {
          std::vector<ITKeyInfo>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v12 = operator new(24 * v10);
        float v67 = v12;
        unint64_t v68 = v12;
        uint64_t v13 = &v12[3 * v10];
        float v69 = v13;
        uint64_t v14 = v7;
        uint64_t v15 = 24 * v7 + 24;
        do
        {
          *uint64_t v12 = 0;
          v12[1] = 0;
          v12[2] = 0;
          std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(v12, __p.__begin_, (uint64_t)__p.__end_, __p.__end_ - __p.__begin_);
          v12 += 3;
          v15 -= 24;
        }
        while (v15);
        unint64_t v68 = v13;
        uint64_t v7 = v14;
      }
      if (__p.__begin_)
      {
        __p.__end_ = __p.__begin_;
        operator delete(__p.__begin_);
      }
      uint64_t v16 = v70[0];
      uint64_t v17 = *(double **)v70[0];
      **(void **)v70[0] = 0;
      uint64_t v18 = v67;
      CFIndex v19 = (_DWORD *)*v67;
      *(_DWORD *)void *v67 = 0;
      if (v7)
      {
        CFIndex v20 = (_DWORD **)(v18 + 3);
        long long v21 = (double **)(v16 + 24);
        double v22 = 0.0;
        uint64_t v23 = v7;
        do
        {
          unint64_t v24 = *v21;
          v21 += 3;
          double v22 = v22 + 0.0909999982;
          double *v24 = v22;
          double v25 = *v20;
          v20 += 3;
          _DWORD *v25 = 8;
          --v23;
        }
        while (v23);
      }
      if (v65)
      {
        double v27 = *v17;
        double v26 = v17 + 1;
        double v28 = v27;
        CFIndex v29 = v19 + 1;
        uint64_t v30 = v65;
        do
        {
          double v28 = v28 + 0.0909999982;
          *v26++ = v28;
          *v29++ = 4;
          --v30;
        }
        while (v30);
      }
      CFStringRef cf = v6;
      if (v7)
      {
        unint64_t v31 = 1;
        while (!v65)
        {
LABEL_79:
          BOOL v46 = v31++ == v7;
          if (v46) {
            goto LABEL_81;
          }
        }
        unint64_t v32 = v31 - 1;
        CFIndex v63 = v31 - 2;
        double v33 = **(double **)(v16 + 24 * v31);
        unint64_t v34 = 1;
        while (1)
        {
          unint64_t v35 = v34 - 1;
          double v36 = *(double *)(*(void *)(v16 + 24 * v32) + 8 * v34);
          unint64_t v37 = v74;
          if (v75 < 0) {
            unint64_t v37 = (void **)v74[0];
          }
          int v38 = (InputTranscoder::KeyboardLayoutImpl *)*((char *)v37 + v32);
          unint64_t v39 = v72;
          if (v73 < 0) {
            unint64_t v39 = (void **)v72[0];
          }
          int v40 = *((unsigned __int8 *)v39 + v35);
          int v41 = (char)v40;
          if (v38 == 32 || v40 == 32)
          {
            double SpaceCost = InputTranscoder::KeyboardLayoutImpl::getSpaceCost(v38, (const unsigned __int16 *)(char)v40, v11);
            if (SpaceCost == 0.0) {
              double v44 = 0.0;
            }
            else {
              double v44 = SpaceCost;
            }
            int v43 = 32 * (SpaceCost != 0.0);
            if (v41 != 32 && SpaceCost != 0.0)
            {
              BOOL v46 = SpaceCost <= 0.100099996 && v38 == 32;
              if (v46) {
                int v43 = 64;
              }
              else {
                int v43 = 2;
              }
              double v44 = SpaceCost;
            }
          }
          else
          {
            v76[0] = (char)v40;
            double KeyDistance = InputTranscoder::KeyboardLayoutImpl::getKeyDistance(a1, (const unsigned __int16 *)v38, v76);
            if (KeyDistance == 0.0)
            {
              int v43 = 0;
              double v44 = 0.0;
            }
            else
            {
              if (KeyDistance <= 0.154699996) {
                int v43 = 1;
              }
              else {
                int v43 = 2;
              }
              double v44 = 0.0909999982;
            }
          }
          double v47 = *(double *)(*(void *)(v70[0] + 24 * v32) + 8 * v35);
          double v48 = v44 + v47;
          double v49 = v44 + v47;
          if (v31 >= 2)
          {
            double v49 = v44 + v47;
            if (v34 >= 2)
            {
              double InsertionCost = InputTranscoder::KeyboardLayoutImpl::getInsertionCost(a1, CFStringFromString, cf, v31 - 1, (int)v34 - 2);
              double v49 = v48;
              if (InsertionCost == 0.0)
              {
                double v51 = InputTranscoder::KeyboardLayoutImpl::getInsertionCost(a1, CFStringFromString, cf, v63, (int)v34 - 1);
                double v49 = v48;
                if (v51 == 0.0) {
                  double v49 = *(double *)(*(void *)(v70[0] + 24 * (v31 - 2)) + 8 * (v34 - 2))
                }
                      + 0.0909999982;
              }
            }
          }
          double v52 = v33 + 0.0909999982;
          *(double *)&__p.__begin_ = v33 + 0.0909999982;
          *(double *)&__p.__end_ = v36 + 0.0909999982;
          *(double *)&__p.__end_cap_.__value_ = v48;
          double v79 = v49;
          p_p = (double *)&__p;
          uint64_t v54 = 8;
          double v55 = v33 + 0.0909999982;
          do
          {
            if (*(double *)((char *)&__p.__begin_ + v54) < v55)
            {
              double v55 = *(double *)((char *)&__p.__begin_ + v54);
              p_p = (double *)((char *)&__p + v54);
            }
            v54 += 8;
          }
          while (v54 != 32);
          double v33 = *p_p;
          uint64_t v16 = v70[0];
          *(double *)(*(void *)(v70[0] + 24 * v31) + 8 * v34) = v33;
          if (v33 == v48)
          {
            uint64_t v18 = v67;
            int v56 = *(_DWORD *)(v67[3 * v32] + 4 * v35) | v43;
          }
          else if (v33 == v36 + 0.0909999982)
          {
            uint64_t v18 = v67;
            int v56 = *(_DWORD *)(v67[3 * v32] + 4 * v34) | 8;
          }
          else
          {
            if (v33 == v52)
            {
              if (*(char *)(a3 + 23) >= 0) {
                uint64_t v58 = a3;
              }
              else {
                uint64_t v58 = *(void *)a3;
              }
              int v59 = *(unsigned __int8 *)(v58 + v35);
              uint64_t v18 = v67;
              uint64_t v57 = v67[3 * v31];
              if (v59 == 32) {
                int v60 = 32;
              }
              else {
                int v60 = 4;
              }
              int v56 = *(_DWORD *)(v57 + 4 * v35) | v60;
              goto LABEL_67;
            }
            uint64_t v18 = v67;
            int v56 = *(_DWORD *)(v67[3 * v63] + 4 * v34 - 8) | 0x10;
          }
          uint64_t v57 = v18[3 * v31];
LABEL_67:
          *(_DWORD *)(v57 + 4 * v34) = v56;
          BOOL v46 = v34++ == v65;
          if (v46) {
            goto LABEL_79;
          }
        }
      }
LABEL_81:
      uint64_t v61 = *(unsigned int *)(v18[3 * v7] + 4 * v65);
      __p.__begin_ = (std::vector<unsigned int>::pointer)&v67;
      std::vector<std::vector<double>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
      __p.__begin_ = (std::vector<unsigned int>::pointer)v70;
      std::vector<std::vector<double>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
      CFStringRef v6 = cf;
    }
    else
    {
      uint64_t v61 = 0;
    }
  }
  else
  {
    uint64_t v61 = 0;
    if (!v6) {
      goto LABEL_84;
    }
  }
  CFRelease(v6);
  CFStringRef CFStringFromString = v71;
LABEL_84:
  if (CFStringFromString) {
LABEL_87:
  }
    CFRelease(CFStringFromString);
  if (v73 < 0) {
    operator delete(v72[0]);
  }
  if (v75 < 0) {
    operator delete(v74[0]);
  }
  return v61;
}

void sub_2369FE6A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,const void *a23,const void *a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30,void *a31,uint64_t a32,int a33,__int16 a34,char a35,char a36,char a37,uint64_t a38,char *a39,uint64_t a40)
{
  a39 = &a20;
  std::vector<std::vector<double>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a39);
  nlp::CFScopedPtr<__CFString const*>::reset(&a23, 0);
  nlp::CFScopedPtr<__CFString const*>::reset(&a24, 0);
  if (a30 < 0) {
    operator delete(__p);
  }
  if (a36 < 0) {
    operator delete(a31);
  }
  _Unwind_Resume(a1);
}

void InputTranscoder::KeyboardLayoutImpl::getCondensedPath(InputTranscoder::KeyboardLayoutImpl *a1@<X0>, uint64_t a2@<X1>, std::string *a3@<X8>)
{
  if (*(char *)(a2 + 23) < 0)
  {
    if (!*(void *)(a2 + 8))
    {
      double v52 = *(const std::string::value_type **)a2;
      std::string::__init_copy_ctor_external(a3, v52, 0);
      return;
    }
  }
  else if (!*(unsigned char *)(a2 + 23))
  {
    *(_OWORD *)&a3->__r_.__value_.__l.__data_ = *(_OWORD *)a2;
    a3->__r_.__value_.__r.__words[2] = *(void *)(a2 + 16);
    return;
  }
  CFStringRef CFStringFromString = nlp::createCFStringFromString(a2);
  CharacterAtIndedouble x = CFStringGetCharacterAtIndex(CFStringFromString, 0);
  uint64_t v8 = (UniChar *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>(1);
  uint64_t v10 = v9;
  *uint64_t v8 = CharacterAtIndex;
  uint64_t v11 = v8 + 1;
  if (CFStringGetLength(CFStringFromString) > 1)
  {
    uint64_t v12 = &v8[v10];
    if (CFStringGetLength(CFStringFromString) == 2)
    {
      int v13 = CFStringGetCharacterAtIndex(CFStringFromString, 0);
      if (v13 != CFStringGetCharacterAtIndex(CFStringFromString, 1))
      {
        UniChar v14 = CFStringGetCharacterAtIndex(CFStringFromString, 1);
        UniChar v15 = v14;
        if (v10 < 2)
        {
          if ((unint64_t)(2 * v10) <= 2) {
            uint64_t v59 = 2;
          }
          else {
            uint64_t v59 = 2 * v10;
          }
          if ((unint64_t)(2 * v10) >= 0x7FFFFFFFFFFFFFFELL) {
            uint64_t v60 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else {
            uint64_t v60 = v59;
          }
          if (v60) {
            uint64_t v60 = (uint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>(v60);
          }
          *(_WORD *)(v60 + 2) = v15;
          *(_WORD *)uint64_t v60 = *v8;
          uint64_t v61 = (UniChar *)v60;
          uint64_t v11 = (UniChar *)(v60 + 4);
          operator delete(v8);
          uint64_t v8 = v61;
        }
        else
        {
          v8[1] = v14;
          uint64_t v11 = v8 + 2;
        }
      }
      InputTranscoder::toUTF8String(a3, v8, (uint64_t)v11);
    }
    else
    {
      unsigned int v16 = 0;
      LODWORD(v17) = 1;
LABEL_13:
      CFIndex v18 = v16;
      unsigned int v19 = v17;
      while (1)
      {
        CFIndex v17 = v19 + 1;
        if (CFStringGetLength(CFStringFromString) <= v17) {
          break;
        }
        int v20 = CFStringGetCharacterAtIndex(CFStringFromString, v18);
        double Centroid = InputTranscoder::KeyboardLayoutImpl::getCentroid(a1, v20);
        double v23 = v22;
        CFIndex v24 = v19;
        int v25 = CFStringGetCharacterAtIndex(CFStringFromString, v19);
        double v26 = InputTranscoder::KeyboardLayoutImpl::getCentroid(a1, v25);
        double v28 = v27;
        int v29 = CFStringGetCharacterAtIndex(CFStringFromString, v19 + 1);
        double v30 = InputTranscoder::KeyboardLayoutImpl::getCentroid(a1, v29);
        double v32 = v31;
        float v33 = Centroid - v26;
        *(float *)&double v31 = v23 - v28;
        float v34 = hypotf(v33, *(float *)&v31);
        float v35 = v26 - v30;
        float v36 = v28 - v32;
        *(float *)&double v28 = v34 + hypotf(v35, v36);
        float v37 = Centroid - v30;
        float v38 = v23 - v32;
        ++v19;
        if (vabds_f32(*(float *)&v28, hypotf(v37, v38)) >= 0.00000011921)
        {
          UniChar v39 = CFStringGetCharacterAtIndex(CFStringFromString, v24);
          UniChar v40 = v39;
          unsigned int v16 = v17 - 1;
          if (v11 >= v12)
          {
            uint64_t v41 = (char *)v11 - (char *)v8;
            if ((char *)v11 - (char *)v8 <= -3) {
              std::vector<ITKeyInfo>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v42 = v41 >> 1;
            if ((char *)v12 - (char *)v8 <= (unint64_t)((v41 >> 1) + 1)) {
              uint64_t v43 = v42 + 1;
            }
            else {
              uint64_t v43 = (char *)v12 - (char *)v8;
            }
            if ((unint64_t)((char *)v12 - (char *)v8) >= 0x7FFFFFFFFFFFFFFELL) {
              uint64_t v44 = 0x7FFFFFFFFFFFFFFFLL;
            }
            else {
              uint64_t v44 = v43;
            }
            if (v44) {
              uint64_t v44 = (uint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>(v44);
            }
            else {
              uint64_t v45 = 0;
            }
            BOOL v46 = (UniChar *)(v44 + 2 * v42);
            *BOOL v46 = v40;
            if (v11 == v8)
            {
              uint64_t v11 = v46 + 1;
            }
            else
            {
              uint64_t v47 = 0;
              do
              {
                v46[v47 - 1] = v11[v47 - 1];
                --v47;
              }
              while (&v11[v47] != v8);
              uint64_t v11 = v46 + 1;
              BOOL v46 = (UniChar *)((char *)v46 + v47 * 2);
            }
            uint64_t v12 = (UniChar *)(v44 + 2 * v45);
            operator delete(v8);
            uint64_t v8 = v46;
          }
          else
          {
            *v11++ = v39;
          }
          goto LABEL_13;
        }
      }
      CFIndex Length = CFStringGetLength(CFStringFromString);
      UniChar v49 = CFStringGetCharacterAtIndex(CFStringFromString, Length - 1);
      UniChar v50 = v49;
      if (v11 >= v12)
      {
        uint64_t v53 = (char *)v11 - (char *)v8;
        if ((char *)v11 - (char *)v8 <= -3) {
          std::vector<ITKeyInfo>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v54 = v53 >> 1;
        if ((char *)v12 - (char *)v8 <= (unint64_t)((v53 >> 1) + 1)) {
          uint64_t v55 = v54 + 1;
        }
        else {
          uint64_t v55 = (char *)v12 - (char *)v8;
        }
        if ((unint64_t)((char *)v12 - (char *)v8) >= 0x7FFFFFFFFFFFFFFELL) {
          uint64_t v56 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          uint64_t v56 = v55;
        }
        if (v56) {
          uint64_t v56 = (uint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>(v56);
        }
        uint64_t v57 = (UniChar *)(v56 + 2 * v54);
        *uint64_t v57 = v50;
        uint64_t v51 = (uint64_t)(v57 + 1);
        if (v11 != v8)
        {
          uint64_t v58 = 0;
          do
          {
            v57[v58 - 1] = v11[v58 - 1];
            --v58;
          }
          while (&v11[v58] != v8);
          uint64_t v57 = (UniChar *)((char *)v57 + v58 * 2);
        }
        operator delete(v8);
        uint64_t v8 = v57;
      }
      else
      {
        *uint64_t v11 = v49;
        uint64_t v51 = (uint64_t)(v11 + 1);
      }
      InputTranscoder::toUTF8String(a3, v8, v51);
    }
  }
  else if (*(char *)(a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(a3, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)&a3->__r_.__value_.__l.__data_ = *(_OWORD *)a2;
    a3->__r_.__value_.__r.__words[2] = *(void *)(a2 + 16);
  }
  operator delete(v8);
  if (CFStringFromString) {
    CFRelease(CFStringFromString);
  }
}

void sub_2369FEC38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, const void *a10)
{
  operator delete(v10);
  nlp::CFScopedPtr<__CFString const*>::reset(&a10, 0);
  _Unwind_Resume(a1);
}

void InputTranscoder::toUTF8String(void *a1, const UniChar *a2, uint64_t a3)
{
  CFStringRef v4 = CFStringCreateWithCharacters(0, a2, (a3 - (uint64_t)a2) >> 1);
  nlp::getUTF8StringFromCFString(v4, a1);
  if (v4) {
    CFRelease(v4);
  }
}

void sub_2369FECE4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

double InputTranscoder::KeyboardLayoutImpl::getDistanceFromKey(double a1, double a2, uint64_t a3, double *a4)
{
  double v4 = vabdd_f64(a2, a4[1]);
  float v5 = vabdd_f64(a1, *a4) - a4[4] * 0.400000006;
  if (v5 < 0.0) {
    float v5 = 0.0;
  }
  float v6 = v4 - a4[5] * 0.400000006;
  if (v6 < 0.0) {
    float v6 = 0.0;
  }
  return hypotf(v5, v6);
}

void InputTranscoder::KeyboardLayoutImpl::~KeyboardLayoutImpl(InputTranscoder::KeyboardLayoutImpl *this)
{
  *(void *)this = &unk_26E9DB400;
  unint64_t v2 = (void *)*((void *)this + 9);
  if (v2)
  {
    *((void *)this + 1nlp::CFScopedPtr<__CFURL const*>::reset(&a9, 0) = v2;
    operator delete(v2);
  }
}

{
  void *v2;
  uint64_t vars8;

  *(void *)this = &unk_26E9DB400;
  unint64_t v2 = (void *)*((void *)this + 9);
  if (v2)
  {
    *((void *)this + 1nlp::CFScopedPtr<__CFURL const*>::reset(&a9, 0) = v2;
    operator delete(v2);
  }

  JUMPOUT(0x237E08BB0);
}

uint64_t InputTranscoder::KeyboardLayoutImpl::isCurrentLayoutAlphabetic(InputTranscoder::KeyboardLayoutImpl *this)
{
  return *((unsigned __int8 *)this + 8);
}

char *std::vector<ITKeyInfo>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >= 0x492492492492493) {
    std::vector<ITKeyInfo>::__throw_length_error[abi:ne180100]();
  }
  __n128 result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ITKeyInfo>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[56 * v4];
  return result;
}

void std::vector<ITKeyInfo>::__throw_length_error[abi:ne180100]()
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<ITKeyInfo>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x492492492492493) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(56 * a2);
}

void std::vector<nlp::CFScopedPtr<__CFString const*>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  unint64_t v2 = (const void **)**a1;
  if (v2)
  {
    uint64_t v4 = (const void **)v1[1];
    float v5 = **a1;
    if (v4 != v2)
    {
      do
        nlp::CFScopedPtr<__CFString const*>::reset(--v4, 0);
      while (v4 != v2);
      float v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::__shared_ptr_pointer<InputTranscoder::LayoutInfoAssorted *,std::shared_ptr<InputTranscoder::LayoutInfoAssorted>::__shared_ptr_default_delete<InputTranscoder::LayoutInfoAssorted,InputTranscoder::LayoutInfoAssorted>,std::allocator<InputTranscoder::LayoutInfoAssorted>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x237E08BB0);
}

uint64_t std::__shared_ptr_pointer<InputTranscoder::LayoutInfoAssorted *,std::shared_ptr<InputTranscoder::LayoutInfoAssorted>::__shared_ptr_default_delete<InputTranscoder::LayoutInfoAssorted,InputTranscoder::LayoutInfoAssorted>,std::allocator<InputTranscoder::LayoutInfoAssorted>>::__on_zero_shared(uint64_t a1)
{
  return std::default_delete<InputTranscoder::LayoutInfoAssorted>::operator()[abi:ne180100](*(void *)(a1 + 24));
}

uint64_t std::__shared_ptr_pointer<InputTranscoder::LayoutInfoAssorted *,std::shared_ptr<InputTranscoder::LayoutInfoAssorted>::__shared_ptr_default_delete<InputTranscoder::LayoutInfoAssorted,InputTranscoder::LayoutInfoAssorted>,std::allocator<InputTranscoder::LayoutInfoAssorted>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

uint64_t std::default_delete<InputTranscoder::LayoutInfoAssorted>::operator()[abi:ne180100](uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::~__hash_table(result + 80);
    double v3 = (void **)(v1 + 24);
    std::vector<nlp::CFScopedPtr<__CFString const*>>::__destroy_vector::operator()[abi:ne180100](&v3);
    unint64_t v2 = *(void **)v1;
    if (*(void *)v1)
    {
      *(void *)(v1 + 8) = v2;
      operator delete(v2);
    }
    JUMPOUT(0x237E08BB0);
  }
  return result;
}

void std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<InputTranscoder::LayoutInfoAssorted>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<InputTranscoder::LayoutInfoAssorted>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<InputTranscoder::LayoutInfoAssorted>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<InputTranscoder::LayoutInfoAssorted>>>>::__rehash<true>(size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  size_t v2 = *((void *)&xmmword_26ADCFE90 + 1);
  if (prime <= *((void *)&xmmword_26ADCFE90 + 1))
  {
    if (prime >= *((void *)&xmmword_26ADCFE90 + 1)) {
      return;
    }
    unint64_t v9 = vcvtps_u32_f32((float)(unint64_t)qword_26ADCFEA8 / *(float *)&dword_26ADCFEB0);
    if (*((void *)&xmmword_26ADCFE90 + 1) < 3uLL
      || (uint8x8_t v10 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&xmmword_26ADCFE90 + 8)),
          v10.i16[0] = vaddlv_u8(v10),
          v10.u32[0] > 1uLL))
    {
      unint64_t v9 = std::__next_prime(v9);
    }
    else
    {
      uint64_t v11 = 1 << -(char)__clz(v9 - 1);
      if (v9 >= 2) {
        unint64_t v9 = v11;
      }
    }
    if (prime <= v9) {
      size_t prime = v9;
    }
    if (prime >= v2) {
      return;
    }
    if (!prime)
    {
      UniChar v14 = (void *)xmmword_26ADCFE90;
      *(void *)&xmmword_26ADCFE90 = 0;
      if (v14) {
        operator delete(v14);
      }
      *((void *)&xmmword_26ADCFE90 + 1) = 0;
      return;
    }
  }
  if (prime >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  double v3 = operator new(8 * prime);
  uint64_t v4 = (void *)xmmword_26ADCFE90;
  *(void *)&xmmword_26ADCFE90 = v3;
  if (v4) {
    operator delete(v4);
  }
  uint64_t v5 = 0;
  *((void *)&xmmword_26ADCFE90 + 1) = prime;
  do
    *(void *)(xmmword_26ADCFE90 + 8 * v5++) = 0;
  while (prime != v5);
  float v6 = (void **)qword_26ADCFEA0;
  if (qword_26ADCFEA0)
  {
    size_t v7 = *(void *)(qword_26ADCFEA0 + 8);
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)prime);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      if (v7 >= prime) {
        v7 %= prime;
      }
    }
    else
    {
      v7 &= prime - 1;
    }
    *(void *)(xmmword_26ADCFE90 + 8 * v7) = &qword_26ADCFEA0;
    for (i = *v6; i; size_t v7 = v13)
    {
      size_t v13 = i[1];
      if (v8.u32[0] > 1uLL)
      {
        if (v13 >= prime) {
          v13 %= prime;
        }
      }
      else
      {
        v13 &= prime - 1;
      }
      if (v13 != v7)
      {
        if (!*(void *)(xmmword_26ADCFE90 + 8 * v13))
        {
          *(void *)(xmmword_26ADCFE90 + 8 * v13) = v6;
          goto LABEL_31;
        }
        *float v6 = (void *)*i;
        *uint64_t i = **(void **)(xmmword_26ADCFE90 + 8 * v13);
        **(void **)(xmmword_26ADCFE90 + 8 * v13) = i;
        uint64_t i = v6;
      }
      size_t v13 = v7;
LABEL_31:
      float v6 = (void **)i;
      uint64_t i = (void *)*i;
    }
  }
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<InputTranscoder::LayoutInfoAssorted>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<InputTranscoder::LayoutInfoAssorted>>,void *>>>>::reset[abi:ne180100](uint64_t *a1)
{
  uint64_t v1 = *a1;
  *a1 = 0;
  if (v1)
  {
    if (*((unsigned char *)a1 + 16))
    {
      size_t v2 = *(std::__shared_weak_count **)(v1 + 48);
      if (v2) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v2);
      }
      if (*(char *)(v1 + 39) < 0) {
        operator delete(*(void **)(v1 + 16));
      }
    }
    operator delete((void *)v1);
  }
}

void *std::vector<ITKeyInfo>::__init_with_size[abi:ne180100]<std::__wrap_iter<ITKeyInfo const*>,std::__wrap_iter<ITKeyInfo const*>>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    float v6 = result;
    __n128 result = std::vector<ITKeyInfo>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      __n128 result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_2369FF34C(_Unwind_Exception *exception_object)
{
  double v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<InputTranscoder::KeyCandidateImpl>>(unint64_t a1)
{
  if (a1 >> 59) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(32 * a1);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<InputTranscoder::KeyCandidateImpl>,std::reverse_iterator<InputTranscoder::KeyCandidateImpl*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 8) + 8);
    for (uint64_t i = *(void *)(*(void *)(a1 + 16) + 8); i != v3; i += 32)
    {
      if (*(char *)(i + 23) < 0) {
        operator delete(*(void **)i);
      }
    }
  }
  return a1;
}

uint64_t std::__split_buffer<InputTranscoder::KeyCandidateImpl>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void ***)(a1 + 8);
  size_t v2 = *(void ***)(a1 + 16);
  if (v2 != v3)
  {
    do
    {
      uint64_t v4 = v2 - 4;
      *(void *)(a1 + 16) = v2 - 4;
      if (*((char *)v2 - 9) < 0)
      {
        operator delete(*v4);
        uint64_t v4 = *(void ***)(a1 + 16);
      }
      size_t v2 = v4;
    }
    while (v4 != v3);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<InputTranscoder::KeyCandidateImpl>,InputTranscoder::KeyCandidateImpl*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24))
  {
    uint64_t v3 = **(void **)(a1 + 8);
    for (uint64_t i = **(void **)(a1 + 16); i != v3; i -= 32)
    {
      if (*(char *)(i - 9) < 0) {
        operator delete(*(void **)(i - 32));
      }
    }
  }
  return a1;
}

void *std::vector<double>::vector(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<double>::__vallocate[abi:ne180100](a1, a2);
    uint64_t v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }
  return a1;
}

void sub_2369FF520(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<double>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::vector<ITKeyInfo>::__throw_length_error[abi:ne180100]();
  }
  __n128 result = (char *)operator new(8 * a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * a2];
  return result;
}

void *std::vector<std::vector<double>>::vector(void *a1, unint64_t a2, uint64_t a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    if (a2 >= 0xAAAAAAAAAAAAAABLL) {
      std::vector<ITKeyInfo>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v5 = 3 * a2;
    uint64_t v6 = 24 * a2;
    uint64_t v7 = operator new(24 * a2);
    *a1 = v7;
    a1[1] = v7;
    size_t v8 = &v7[v5];
    a1[2] = v8;
    do
    {
      void *v7 = 0;
      v7[1] = 0;
      void v7[2] = 0;
      uint8x8_t v10 = *(const void **)a3;
      uint64_t v9 = *(void *)(a3 + 8);
      int64_t v11 = v9 - *(void *)a3;
      if (v9 != *(void *)a3)
      {
        std::vector<double>::__vallocate[abi:ne180100](v7, v11 >> 3);
        uint64_t v12 = (char *)v7[1];
        memmove(v12, v10, v11);
        v7[1] = &v12[8 * (v11 >> 3)];
      }
      v7 += 3;
      v6 -= 24;
    }
    while (v6);
    a1[1] = v8;
  }
  return a1;
}

void sub_2369FF670(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
}

void std::vector<std::vector<double>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  size_t v2 = (char *)**a1;
  if (v2)
  {
    uint64_t v4 = (char *)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      uint64_t v6 = (char *)v1[1];
      do
      {
        size_t v8 = (void *)*((void *)v6 - 3);
        v6 -= 24;
        uint64_t v7 = v8;
        if (v8)
        {
          *((void *)v4 - 2) = v7;
          operator delete(v7);
        }
        uint64_t v4 = v6;
      }
      while (v6 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>(uint64_t a1)
{
  if (a1 < 0) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(2 * a1);
}

void std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,InputTranscoder::KeyboardLayoutImpl::enumerateNearestKeys(CGPoint,void({block_pointer})(ITKeyInfo,BOOL *))::$_0 &,std::__wrap_iter<ITKeyInfo*>>(uint64_t a1, uint64_t a2, double **a3, uint64_t a4)
{
  unint64_t v4 = a4 - 2;
  if (a4 >= 2)
  {
    unint64_t v8 = v4 >> 1;
    uint64_t v9 = (double *)(a1 + 56 * (v4 >> 1));
    double v10 = **a3;
    double v11 = (*a3)[1];
    double v12 = vabdd_f64(v11, v9[1]);
    float v13 = vabdd_f64(v10, *v9) - v9[4] * 0.400000006;
    if (v13 < 0.0) {
      float v13 = 0.0;
    }
    float v14 = v12 - v9[5] * 0.400000006;
    if (v14 < 0.0) {
      float v14 = 0.0;
    }
    float v15 = hypotf(v13, v14);
    double v17 = *(double *)(a2 - 48);
    unsigned int v16 = (double *)(a2 - 56);
    double v18 = *(double *)(a2 - 24);
    double v19 = *(double *)(a2 - 16);
    double v42 = *(double *)(a2 - 56);
    double v20 = vabdd_f64(v10, v42);
    double v21 = vabdd_f64(v11, v17);
    double v22 = v18 * 0.400000006;
    double v23 = v19 * 0.400000006;
    float v24 = v20 - v18 * 0.400000006;
    if (v24 < 0.0) {
      float v24 = 0.0;
    }
    float v25 = v21 - v23;
    if (v25 < 0.0) {
      float v25 = 0.0;
    }
    if (v15 > hypotf(v24, v25))
    {
      double v40 = v19;
      double v41 = v18;
      long long v43 = *(_OWORD *)(a2 - 40);
      uint64_t v26 = *(void *)(a2 - 8);
      do
      {
        double v27 = v16;
        unsigned int v16 = v9;
        long long v28 = *(_OWORD *)v9;
        long long v29 = *((_OWORD *)v9 + 1);
        long long v30 = *((_OWORD *)v9 + 2);
        v27[6] = v9[6];
        *((_OWORD *)v27 + 1) = v29;
        *((_OWORD *)v27 + 2) = v30;
        *(_OWORD *)double v27 = v28;
        if (!v8) {
          break;
        }
        unint64_t v8 = (v8 - 1) >> 1;
        uint64_t v9 = (double *)(a1 + 56 * v8);
        double v31 = **a3;
        double v32 = (*a3)[1];
        double v33 = vabdd_f64(v32, v9[1]);
        float v34 = vabdd_f64(v31, *v9) - v9[4] * 0.400000006;
        if (v34 < 0.0) {
          float v34 = 0.0;
        }
        float v35 = v33 - v9[5] * 0.400000006;
        if (v35 < 0.0) {
          float v35 = 0.0;
        }
        float v36 = hypotf(v34, v35);
        double v37 = vabdd_f64(v32, v17);
        float v38 = vabdd_f64(v31, v42) - v22;
        if (v38 < 0.0) {
          float v38 = 0.0;
        }
        float v39 = v37 - v23;
        if (v39 < 0.0) {
          float v39 = 0.0;
        }
      }
      while (v36 > hypotf(v38, v39));
      *unsigned int v16 = v42;
      v16[1] = v17;
      *((_OWORD *)v16 + 1) = v43;
      v16[4] = v41;
      void v16[5] = v40;
      *((void *)v16 + 6) = v26;
    }
  }
}

float64_t InputTranscoder::PathSample::lerp@<D0>(float64x2_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, float a4@<S0>)
{
  double v4 = a4;
  float64x2_t v5 = vmlaq_n_f64(*a1, vsubq_f64(*(float64x2_t *)a2, *a1), v4);
  float64x2_t v6 = vmlaq_n_f64(a1[1], vsubq_f64(*(float64x2_t *)(a2 + 16), a1[1]), v4);
  *(unsigned char *)(a3 + 58) = 0;
  *(_WORD *)(a3 + 56) = 0;
  *(float64x2_t *)a3 = v5;
  *(float64x2_t *)(a3 + 16) = v6;
  *(double *)(a3 + 48) = a1[3].f64[0] + v4 * (*(double *)(a2 + 48) - a1[3].f64[0]);
  float64_t result = a1[2].f64[0] + v4 * (*(double *)(a2 + 32) - a1[2].f64[0]);
  *(float64_t *)(a3 + 32) = result;
  *(void *)(a3 + 4nlp::CFScopedPtr<__CFURL const*>::reset(&a9, 0) = *(void *)(a2 + 40);
  return result;
}

unint64_t InputTranscoder::Path::inflection_point_count(InputTranscoder::Path *this, unsigned int a2, unsigned int a3)
{
  uint64_t v3 = (char *)*((void *)this + 3);
  double v4 = (char *)*((void *)this + 4);
  if (v4 == v3)
  {
    double v11 = (char *)*((void *)this + 4);
  }
  else
  {
    unint64_t v5 = (v4 - v3) >> 2;
    do
    {
      unint64_t v6 = v5 >> 1;
      uint64_t v7 = (unsigned int *)&v3[4 * (v5 >> 1)];
      unsigned int v9 = *v7;
      unint64_t v8 = (char *)(v7 + 1);
      v5 += ~(v5 >> 1);
      if (v9 < a2) {
        uint64_t v3 = v8;
      }
      else {
        unint64_t v5 = v6;
      }
    }
    while (v5);
    if (v4 == v3)
    {
      double v11 = (char *)*((void *)this + 4);
    }
    else
    {
      unint64_t v10 = (v4 - v3) >> 2;
      double v11 = v3;
      do
      {
        unint64_t v12 = v10 >> 1;
        float v13 = (unsigned int *)&v11[4 * (v10 >> 1)];
        unsigned int v15 = *v13;
        float v14 = (char *)(v13 + 1);
        v10 += ~(v10 >> 1);
        if (v15 > a3) {
          unint64_t v10 = v12;
        }
        else {
          double v11 = v14;
        }
      }
      while (v10);
    }
    double v4 = v3;
  }
  return (unint64_t)(v11 - v4) >> 2;
}

double InputTranscoder::Path::turn_angle(InputTranscoder::Path *this, unsigned int a2)
{
  double v2 = 0.0;
  if (a2)
  {
    uint64_t v3 = a2 + 1;
    uint64_t v4 = *(void *)this;
    if (v3 != (uint64_t)(*((void *)this + 1) - *(void *)this) >> 6)
    {
      uint64_t v5 = a2;
      unint64_t v6 = (double *)(v4 + ((unint64_t)a2 << 6));
      double v7 = *v6;
      double v8 = v6[1];
      unsigned int v9 = (double *)(v4 + (v3 << 6));
      double v10 = *v9 - *v6;
      double v11 = v9[1] - v8;
      if (hypot(v10, v11) >= 0.00001)
      {
        uint64_t v12 = v5 << 6;
        while (1)
        {
          uint64_t v13 = v12 - 64;
          if (!v12) {
            break;
          }
          uint64_t v14 = v4 + v12;
          double v15 = v7 - *(double *)(v14 - 64);
          double v16 = v8 - *(double *)(v14 - 56);
          long double v17 = hypot(v15, v16);
          uint64_t v12 = v13;
          if (v17 >= 0.00001)
          {
            double v18 = atan2(v16, v15);
            double v2 = atan2(v11, v10) - v18;
            if (v2 >= -3.14159265)
            {
              if (v2 <= 3.14159265) {
                return v2;
              }
              double v19 = -6.28318531;
            }
            else
            {
              double v19 = 6.28318531;
            }
            return v2 + v19;
          }
        }
      }
    }
  }
  return v2;
}

void InputTranscoder::Path::resize(InputTranscoder::Path *this, unint64_t a2)
{
  if (a2 != (uint64_t)(*((void *)this + 1) - *(void *)this) >> 6)
  {
    std::vector<InputTranscoder::PathSample>::resize((uint64_t)this, a2);
    uint64_t v5 = (_DWORD *)*((void *)this + 3);
    uint64_t v4 = (_DWORD *)*((void *)this + 4);
    if (v4 == v5)
    {
      uint64_t v5 = (_DWORD *)*((void *)this + 4);
    }
    else
    {
      unint64_t v6 = v4 - v5;
      do
      {
        unint64_t v7 = v6 >> 1;
        double v8 = &v5[v6 >> 1];
        unsigned int v10 = *v8;
        unsigned int v9 = v8 + 1;
        v6 += ~(v6 >> 1);
        if (v10 < a2) {
          uint64_t v5 = v9;
        }
        else {
          unint64_t v6 = v7;
        }
      }
      while (v6);
    }
    if (v4 != v5) {
      *((void *)this + 4) = v5;
    }
  }
}

void std::vector<InputTranscoder::PathSample>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 6;
  if (a2 <= v2)
  {
    if (a2 < v2) {
      *(void *)(a1 + 8) = *(void *)a1 + (a2 << 6);
    }
  }
  else
  {
    std::vector<InputTranscoder::PathSample>::__append((void **)a1, a2 - v2);
  }
}

void InputTranscoder::Path::append(void **a1, long long *a2)
{
  unint64_t v6 = (unint64_t)a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  unint64_t v7 = *(_OWORD **)(v4 - 8);
  if ((unint64_t)v7 >= v6)
  {
    uint64_t v12 = ((char *)v7 - (unsigned char *)*a1) >> 6;
    unint64_t v13 = v12 + 1;
    if ((unint64_t)(v12 + 1) >> 58) {
      std::vector<InputTranscoder::InputFeature>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v14 = v5 - (void)*a1;
    if (v14 >> 5 > v13) {
      unint64_t v13 = v14 >> 5;
    }
    if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFC0) {
      unint64_t v15 = 0x3FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v15 = v13;
    }
    if (v15) {
      double v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<InputTranscoder::CTCSurfaceFormOutput>>(v4, v15);
    }
    else {
      double v16 = 0;
    }
    long double v17 = &v16[64 * v12];
    double v18 = &v16[64 * v15];
    long long v19 = *a2;
    long long v20 = a2[1];
    long long v21 = a2[3];
    *((_OWORD *)v17 + 2) = a2[2];
    *((_OWORD *)v17 + 3) = v21;
    *(_OWORD *)long double v17 = v19;
    *((_OWORD *)v17 + 1) = v20;
    double v11 = v17 + 64;
    double v23 = (char *)*a1;
    double v22 = (char *)a1[1];
    if (v22 != *a1)
    {
      do
      {
        long long v24 = *((_OWORD *)v22 - 4);
        long long v25 = *((_OWORD *)v22 - 3);
        long long v26 = *((_OWORD *)v22 - 2);
        *(_OWORD *)(v17 - 21) = *(_OWORD *)(v22 - 21);
        *((_OWORD *)v17 - 3) = v25;
        *((_OWORD *)v17 - 2) = v26;
        *((_OWORD *)v17 - 4) = v24;
        v17 -= 64;
        v22 -= 64;
      }
      while (v22 != v23);
      double v22 = (char *)*a1;
    }
    *a1 = v17;
    a1[1] = v11;
    a1[2] = v18;
    if (v22) {
      operator delete(v22);
    }
  }
  else
  {
    long long v8 = *a2;
    long long v9 = a2[1];
    long long v10 = a2[3];
    void v7[2] = a2[2];
    v7[3] = v10;
    _OWORD *v7 = v8;
    v7[1] = v9;
    double v11 = v7 + 4;
  }
  a1[1] = v11;
}

std::vector<unsigned int> *InputTranscoder::Path::set_sample_is_inflection_point(InputTranscoder::Path *this, std::vector<unsigned int>::value_type a2)
{
  __double x = a2;
  v4.__i_ = (std::__wrap_iter<const unsigned int *>::iterator_type)*((void *)this + 3);
  unint64_t v5 = (const unsigned int *)*((void *)this + 4);
  float64_t result = (std::vector<unsigned int> *)((char *)this + 24);
  unint64_t v6 = v5;
  while (v6 != v4.__i_)
  {
    std::vector<unsigned int>::value_type v7 = *--v6;
    if (v7 <= a2)
    {
      v4.__i_ = v6 + 1;
      break;
    }
  }
  if (v4.__i_ == v5 || *v4.__i_ != a2) {
    return (std::vector<unsigned int> *)std::vector<unsigned int>::insert(result, v4, &__x).__i_;
  }
  return result;
}

std::vector<unsigned int>::iterator std::vector<unsigned int>::insert(std::vector<unsigned int> *this, std::vector<unsigned int>::const_iterator __position, std::vector<unsigned int>::const_reference __x)
{
  std::vector<unsigned int>::const_reference v3 = __x;
  std::__split_buffer<std::string>::pointer begin = this->__begin_;
  std::vector<unsigned int>::pointer end = this->__end_;
  int64_t v7 = (char *)__position.__i_ - (char *)this->__begin_;
  long long v8 = (std::vector<unsigned int>::pointer)((char *)this->__begin_ + (v7 & 0xFFFFFFFFFFFFFFFCLL));
  p_end_cap = &this->__end_cap_;
  value = this->__end_cap_.__value_;
  if (end >= value)
  {
    unint64_t v15 = end - begin + 1;
    if (v15 >> 62) {
      std::vector<float>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v17 = v7 >> 2;
    uint64_t v18 = (char *)value - (char *)begin;
    if (v18 >> 1 > v15) {
      unint64_t v15 = v18 >> 1;
    }
    if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v19 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v19 = v15;
    }
    if (v19) {
      long long v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&this->__end_cap_, v19);
    }
    else {
      long long v20 = 0;
    }
    long long v21 = (std::vector<unsigned int>::value_type *)&v20[4 * v17];
    double v22 = (unsigned int *)&v20[4 * v19];
    if (v17 == v19)
    {
      if (v7 < 1)
      {
        if (begin == __position.__i_) {
          unint64_t v24 = 1;
        }
        else {
          unint64_t v24 = v7 >> 1;
        }
        long long v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)p_end_cap, v24);
        long long v21 = (std::vector<unsigned int>::value_type *)&v25[v24 & 0xFFFFFFFFFFFFFFFCLL];
        double v22 = (unsigned int *)&v25[4 * v26];
        if (v20)
        {
          double v27 = (unsigned int *)&v25[4 * v26];
          operator delete(v20);
          double v22 = v27;
        }
      }
      else
      {
        unint64_t v23 = v17 + 2;
        if (v17 >= -1) {
          unint64_t v23 = v17 + 1;
        }
        v21 -= v23 >> 1;
      }
    }
    std::vector<unsigned int>::value_type *v21 = *v3;
    std::vector<unsigned int>::pointer v28 = this->__begin_;
    long long v29 = v21;
    if (this->__begin_ != v8)
    {
      long long v30 = v8;
      long long v29 = v21;
      do
      {
        unsigned int v31 = *--v30;
        *--long long v29 = v31;
      }
      while (v30 != v28);
    }
    std::vector<unsigned int>::pointer v32 = this->__end_;
    int64_t v33 = (char *)v32 - (char *)v8;
    if (v32 != v8)
    {
      float v34 = v8;
      size_t v35 = (char *)v32 - (char *)v8;
      float v36 = v22;
      memmove(v21 + 1, v34, v35);
      double v22 = v36;
    }
    std::vector<unsigned int>::pointer v37 = this->__begin_;
    this->__begin_ = v29;
    this->__end_ = (std::vector<unsigned int>::value_type *)((char *)v21 + v33 + 4);
    this->__end_cap_.__value_ = v22;
    if (v37) {
      operator delete(v37);
    }
    return (std::vector<unsigned int>::iterator)v21;
  }
  else if (v8 == end)
  {
    *long long v8 = *__x;
    this->__end_ = v8 + 1;
  }
  else
  {
    double v11 = v8 + 1;
    std::vector<unsigned int>::pointer v12 = end - 1;
    std::vector<unsigned int>::pointer v13 = this->__end_;
    while (v12 < end)
    {
      unsigned int v14 = *v12++;
      *v13++ = v14;
    }
    this->__end_ = v13;
    if (end != v11) {
      memmove(&end[-(end - v11)], v8, (char *)end - (char *)v11);
    }
    if (v8 <= v3) {
      v3 += this->__end_ > v3;
    }
    *long long v8 = *v3;
  }
  return (std::vector<unsigned int>::iterator)v8;
}

void sub_2369FFFDC(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t InputTranscoder::Path::is_local_max(void *a1, unsigned int a2, uint64_t a3, double a4)
{
  std::function<double ()>::operator()(a3, a2);
  double v9 = v8;
  uint64_t v10 = a2;
  double v11 = *(double *)(*a1 + ((unint64_t)a2 << 6) + 32);
  while (v10 && *(double *)(*a1 + ((unint64_t)(v10 - 1) << 6) + 32) > v11 - a4)
  {
    std::function<double ()>::operator()(a3, --v10);
    if (v12 >= v9) {
      return 0;
    }
  }
  double v13 = v11 + a4;
  unsigned int v14 = a2 + 1;
  while (1)
  {
    unsigned int v15 = v14;
    if (v14 >= (unint64_t)((uint64_t)(a1[1] - *a1) >> 6)
      || *(double *)(*a1 + ((unint64_t)v14 << 6) + 32) >= v13)
    {
      break;
    }
    std::function<double ()>::operator()(a3, v14);
    unsigned int v14 = v15 + 1;
    if (v16 >= v9) {
      return 0;
    }
  }
  return 1;
}

uint64_t std::function<double ()(unsigned int)>::operator()(uint64_t a1, int a2)
{
  int v4 = a2;
  uint64_t v2 = *(void *)(a1 + 24);
  if (!v2) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t, int *))(*(void *)v2 + 48))(v2, &v4);
}

void InputTranscoder::Path::curvature(InputTranscoder::Path *this, unsigned int a2)
{
  if (a2 && ((uint64_t)(*((void *)this + 1) - *(void *)this) >> 6) - 1 != a2)
  {
    float v2 = (*(double *)(*(void *)this + ((unint64_t)(a2 + 1) << 6) + 32)
        - *(double *)(*(void *)this + ((unint64_t)(a2 - 1) << 6) + 32))
       * 0.5;
    if (v2 != 0.0) {
      InputTranscoder::Path::turn_angle(this, a2);
    }
  }
}

uint64_t InputTranscoder::Path::is_curvature_local_max(InputTranscoder::Path *this, unsigned int a2, double a3)
{
  v9[4] = *MEMORY[0x263EF8340];
  InputTranscoder::Path::curvature(this, a2);
  if (fabs(v6) <= 0.02) {
    return 0;
  }
  v9[0] = &unk_26E9DB510;
  v9[1] = this;
  void v9[3] = v9;
  is_local_madouble x = InputTranscoder::Path::is_local_max(this, a2, (uint64_t)v9, a3);
  std::__function::__value_func<double ()>::~__value_func[abi:ne180100](v9);
  return is_local_max;
}

void sub_236A00280(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__function::__value_func<double ()>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void std::vector<InputTranscoder::PathSample>::__append(void **a1, unint64_t a2)
{
  double v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  int64_t v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 6)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), a2 << 6);
      v7 += 64 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    uint64_t v8 = v7 - (unsigned char *)*a1;
    unint64_t v9 = a2 + (v8 >> 6);
    if (v9 >> 58) {
      std::vector<InputTranscoder::InputFeature>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v8 >> 6;
    uint64_t v11 = v5 - (unsigned char *)*a1;
    if (v11 >> 5 > v9) {
      unint64_t v9 = v11 >> 5;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFC0) {
      unint64_t v12 = 0x3FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v9;
    }
    if (v12) {
      double v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<InputTranscoder::CTCSurfaceFormOutput>>(v4, v12);
    }
    else {
      double v13 = 0;
    }
    unsigned int v14 = &v13[64 * v10];
    unsigned int v15 = &v13[64 * v12];
    bzero(v14, a2 << 6);
    double v16 = &v14[64 * a2];
    uint64_t v18 = (char *)*a1;
    uint64_t v17 = (char *)a1[1];
    if (v17 != *a1)
    {
      do
      {
        long long v19 = *((_OWORD *)v17 - 4);
        long long v20 = *((_OWORD *)v17 - 3);
        long long v21 = *((_OWORD *)v17 - 2);
        *(_OWORD *)(v14 - 21) = *(_OWORD *)(v17 - 21);
        *((_OWORD *)v14 - 3) = v20;
        *((_OWORD *)v14 - 2) = v21;
        *((_OWORD *)v14 - 4) = v19;
        v14 -= 64;
        v17 -= 64;
      }
      while (v17 != v18);
      uint64_t v17 = (char *)*a1;
    }
    *a1 = v14;
    a1[1] = v16;
    a1[2] = v15;
    if (v17)
    {
      operator delete(v17);
    }
  }
}

void std::__function::__func<InputTranscoder::Path::is_curvature_local_max(unsigned int,double)::$_0,std::allocator<InputTranscoder::Path::is_curvature_local_max(unsigned int,double)::$_0>,double ()(unsigned int)>::~__func()
{
}

void *std::__function::__func<InputTranscoder::Path::is_curvature_local_max(unsigned int,double)::$_0,std::allocator<InputTranscoder::Path::is_curvature_local_max(unsigned int,double)::$_0>,double ()(unsigned int)>::__clone(uint64_t a1)
{
  float64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = &unk_26E9DB510;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<InputTranscoder::Path::is_curvature_local_max(unsigned int,double)::$_0,std::allocator<InputTranscoder::Path::is_curvature_local_max(unsigned int,double)::$_0>,double ()(unsigned int)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26E9DB510;
  a2[1] = v2;
  return result;
}

double std::__function::__func<InputTranscoder::Path::is_curvature_local_max(unsigned int,double)::$_0,std::allocator<InputTranscoder::Path::is_curvature_local_max(unsigned int,double)::$_0>,double ()(unsigned int)>::operator()(uint64_t a1, unsigned int *a2)
{
  InputTranscoder::Path::curvature(*(InputTranscoder::Path **)(a1 + 8), *a2);
  return fabs(v2);
}

uint64_t std::__function::__func<InputTranscoder::Path::is_curvature_local_max(unsigned int,double)::$_0,std::allocator<InputTranscoder::Path::is_curvature_local_max(unsigned int,double)::$_0>,double ()(unsigned int)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<InputTranscoder::Path::is_curvature_local_max(unsigned int,double)::$_0,std::allocator<InputTranscoder::Path::is_curvature_local_max(unsigned int,double)::$_0>,double ()(unsigned int)>::target_type()
{
}

void *std::__function::__value_func<double ()(unsigned int)>::~__value_func[abi:ne180100](void *a1)
{
  double v2 = (void *)a1[3];
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

CFErrorRef InputTranscoder::createErrorWithMessage(uint64_t a1)
{
  CFDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (*(char *)(a1 + 23) >= 0) {
    uint64_t v3 = (const char *)a1;
  }
  else {
    uint64_t v3 = *(const char **)a1;
  }
  CFStringRef v4 = CFStringCreateWithCString(0, v3, 0x8000100u);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263EFFC70], v4);
  CFErrorRef v5 = CFErrorCreate(0, @"com.apple.InputTranscoder", 0, Mutable);
  if (v4) {
    CFRelease(v4);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  return v5;
}

void sub_236A00618(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  nlp::CFScopedPtr<__CFDictionary *>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

void InputTranscoder::makeStaticLexicon(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  CFStringRef CFStringFromString = nlp::createCFStringFromString(a1);
  CFStringRef v12 = CFStringFromString;
  CFDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  uint64_t v11 = Mutable;
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F51318], CFStringFromString);
  CFErrorRef v5 = (const void *)*MEMORY[0x263EFFB40];
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F51308], (const void *)*MEMORY[0x263EFFB40]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F51310], v5);
  uint64_t v10 = 0;
  uint64_t v6 = LXLexiconCreate();
  *a2 = v6;
  if (!v6)
  {
    int64_t v7 = v10;
    void v9[3] = v10;
    exception = __cxa_allocate_exception(0x20uLL);
    std::string::basic_string[abi:ne180100]<0>(v9, "Failed to create static lexicon");
    nlp::ResourceCreationException::ResourceCreationException((uint64_t)exception, v9, v7);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (CFStringFromString) {
    CFRelease(CFStringFromString);
  }
}

void sub_236A0078C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, const void *a16, uint64_t a17, const void *a18)
{
  if (a15 < 0)
  {
    operator delete(__p);
    if ((v20 & 1) == 0)
    {
LABEL_6:
      nlp::CFScopedPtr<__CFError *>::reset(&a16, 0);
      nlp::CFScopedPtr<_LXLexicon const*>::reset(v18, 0);
      nlp::CFScopedPtr<__CFDictionary *>::reset(&a18, 0);
      nlp::CFScopedPtr<__CFString const*>::reset((const void **)(v21 - 40), 0);
      _Unwind_Resume(a1);
    }
  }
  else if (!v20)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v19);
  goto LABEL_6;
}

void InputTranscoder::splitAtLastWord(char *a1@<X0>, std::string *a2@<X8>)
{
  int v4 = a1[23];
  BOOL v5 = v4 < 0;
  if (v4 >= 0) {
    uint64_t v6 = a1;
  }
  else {
    uint64_t v6 = *(char **)a1;
  }
  uint64_t v7 = a1[23];
  if (v5) {
    uint64_t v7 = *((void *)a1 + 1);
  }
  uint64_t v8 = v7 + 1;
  while (1)
  {
    unint64_t v9 = v8 - 1;
    if (v8 == 1) {
      break;
    }
    int v10 = v6[v8-- - 2];
    if (v10 == 32)
    {
      if (v9)
      {
        std::string::__init_with_size[abi:ne180100]<std::__wrap_iter<char const*>,std::__wrap_iter<char const*>>(v15, v6, &v6[v9], v9);
        uint64_t v11 = a1[23];
        if ((v11 & 0x80u) == 0) {
          CFStringRef v12 = a1;
        }
        else {
          CFStringRef v12 = *(char **)a1;
        }
        if ((v11 & 0x80u) != 0) {
          uint64_t v11 = *((void *)a1 + 1);
        }
        std::string::__init_with_size[abi:ne180100]<std::__wrap_iter<char const*>,std::__wrap_iter<char const*>>(__p, &v12[v9], &v12[v11], v11 - v9);
        std::pair<std::string,std::string>::pair[abi:ne180100]<std::string&,std::string&,0>(a2, (long long *)v15, (long long *)__p);
        if (v14 < 0) {
          operator delete(__p[0]);
        }
        if (v16 < 0) {
          operator delete(v15[0]);
        }
        return;
      }
      break;
    }
  }

  std::pair<std::string,std::string>::pair[abi:ne180100]<char const(&)[1],std::string const&,0>(a2, (char *)&str_3, (long long *)a1);
}

void sub_236A00920(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  _Unwind_Resume(exception_object);
}

std::string *InputTranscoder::removeUnwantedCharacters@<X0>(uint64_t a1@<X0>, std::string *a2@<X8>)
{
  if (*(char *)(a1 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(a2, *(const std::string::value_type **)a1, *(void *)(a1 + 8));
  }
  else
  {
    *(_OWORD *)&a2->__r_.__value_.__l.__data_ = *(_OWORD *)a1;
    a2->__r_.__value_.__r.__words[2] = *(void *)(a1 + 16);
  }
  uint64_t v3 = HIBYTE(a2->__r_.__value_.__r.__words[2]);
  signed __int8 v4 = v3;
  BOOL v5 = (std::string *)a2->__r_.__value_.__r.__words[0];
  std::string::size_type size = a2->__r_.__value_.__l.__size_;
  if ((v3 & 0x80u) == 0) {
    uint64_t v7 = (unsigned __int8 *)a2;
  }
  else {
    uint64_t v7 = (unsigned __int8 *)a2->__r_.__value_.__r.__words[0];
  }
  if ((v3 & 0x80u) == 0) {
    std::string::size_type v8 = HIBYTE(a2->__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v8 = a2->__r_.__value_.__l.__size_;
  }
  unint64_t v9 = &v7[v8];
  if (v8)
  {
    std::string::size_type v10 = v8 - 1;
    uint64_t v11 = MEMORY[0x263EF8318];
    while (1)
    {
      uint64_t v12 = *v7;
      if (v12 == 39 || (v12 & 0x80) == 0 && (*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v12 + 60) & 0x400) != 0) {
        break;
      }
      ++v7;
      --v10;
      if (v7 == v9) {
        goto LABEL_27;
      }
    }
    if (v7 == v9 || v7 + 1 == v9)
    {
      unint64_t v9 = v7;
    }
    else
    {
      uint64_t v13 = 1;
      unint64_t v9 = v7;
      do
      {
        uint64_t v14 = v7[v13];
        if (v14 != 39 && ((char)v14 < 0 || (*(_DWORD *)(v11 + 4 * v14 + 60) & 0x400) == 0)) {
          *v9++ = v14;
        }
        ++v13;
        --v10;
      }
      while (v10);
      uint64_t v3 = HIBYTE(a2->__r_.__value_.__r.__words[2]);
      BOOL v5 = (std::string *)a2->__r_.__value_.__r.__words[0];
      std::string::size_type size = a2->__r_.__value_.__l.__size_;
      signed __int8 v4 = HIBYTE(a2->__r_.__value_.__r.__words[2]);
    }
  }
LABEL_27:
  unsigned int v15 = (unsigned __int8 *)v5 + size;
  char v16 = (unsigned __int8 *)a2 + v3;
  if (v4 >= 0)
  {
    uint64_t v17 = a2;
  }
  else
  {
    char v16 = v15;
    uint64_t v17 = v5;
  }
  return std::string::erase(a2, v9 - (unsigned __int8 *)v17, v16 - v9);
}

void sub_236A00A80(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void InputTranscoder::toLower(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (*(char *)(a1 + 23) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)a2, *(const std::string::value_type **)a1, *(void *)(a1 + 8));
  }
  else
  {
    *(_OWORD *)a2 = *(_OWORD *)a1;
    *(void *)(a2 + 16) = *(void *)(a1 + 16);
  }
  int v3 = *(char *)(a2 + 23);
  if (v3 >= 0) {
    signed __int8 v4 = (unsigned char *)a2;
  }
  else {
    signed __int8 v4 = *(unsigned char **)a2;
  }
  if (v3 >= 0) {
    uint64_t v5 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    uint64_t v5 = *(void *)(a2 + 8);
  }
  for (; v5; --v5)
  {
    *signed __int8 v4 = __tolower((char)*v4);
    ++v4;
  }
}

void sub_236A00B1C(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

std::string *InputTranscoder::removeSpace@<X0>(uint64_t a1@<X0>, std::string *a2@<X8>)
{
  if (*(char *)(a1 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(a2, *(const std::string::value_type **)a1, *(void *)(a1 + 8));
  }
  else
  {
    *(_OWORD *)&a2->__r_.__value_.__l.__data_ = *(_OWORD *)a1;
    a2->__r_.__value_.__r.__words[2] = *(void *)(a1 + 16);
  }
  uint64_t v3 = HIBYTE(a2->__r_.__value_.__r.__words[2]);
  char v4 = v3;
  std::string::size_type v5 = a2->__r_.__value_.__r.__words[0];
  std::string::size_type size = a2->__r_.__value_.__l.__size_;
  if ((v3 & 0x80u) == 0) {
    uint64_t v7 = a2;
  }
  else {
    uint64_t v7 = (std::string *)a2->__r_.__value_.__r.__words[0];
  }
  if ((v3 & 0x80u) == 0) {
    std::string::size_type v8 = HIBYTE(a2->__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v8 = a2->__r_.__value_.__l.__size_;
  }
  unint64_t v9 = (std::string *)((char *)v7 + v8);
  if (v8)
  {
    std::string::size_type v10 = v8 - 1;
    while (v7->__r_.__value_.__s.__data_[0] != 32)
    {
      uint64_t v7 = (std::string *)((char *)v7 + 1);
      --v10;
      if (v7 == v9) {
        goto LABEL_23;
      }
    }
    if (v7 == v9 || (std::string *)((char *)&v7->__r_.__value_.__l.__data_ + 1) == v9)
    {
      unint64_t v9 = v7;
    }
    else
    {
      uint64_t v11 = 1;
      unint64_t v9 = v7;
      do
      {
        int v12 = v7->__r_.__value_.__s.__data_[v11];
        if (v12 != 32)
        {
          v9->__r_.__value_.__s.__data_[0] = v12;
          unint64_t v9 = (std::string *)((char *)v9 + 1);
        }
        ++v11;
        --v10;
      }
      while (v10);
      uint64_t v3 = HIBYTE(a2->__r_.__value_.__r.__words[2]);
      std::string::size_type v5 = a2->__r_.__value_.__r.__words[0];
      std::string::size_type size = a2->__r_.__value_.__l.__size_;
      char v4 = HIBYTE(a2->__r_.__value_.__r.__words[2]);
    }
  }
LABEL_23:
  std::string::size_type v13 = v5 + size;
  std::string::size_type v14 = (std::string::size_type)a2 + v3;
  if (v4 >= 0) {
    std::string::size_type v5 = (std::string::size_type)a2;
  }
  else {
    std::string::size_type v14 = v13;
  }
  return std::string::erase(a2, (std::string::size_type)v9 - v5, v14 - (void)v9);
}

void sub_236A00C38(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

BOOL InputTranscoder::stringHasSeparator(char **a1, uint64_t a2)
{
  uint64_t v2 = *(unsigned __int8 *)(a2 + 23);
  int v3 = (char)v2;
  if ((v2 & 0x80u) != 0) {
    uint64_t v2 = *(void *)(a2 + 8);
  }
  if (!v2) {
    return 0;
  }
  std::string::size_type v5 = (char *)*((unsigned __int8 *)a1 + 23);
  if ((char)v5 < 0) {
    std::string::size_type v5 = a1[1];
  }
  if (!v5) {
    return 0;
  }
  if (v2 != 5) {
    goto LABEL_14;
  }
  uint64_t v6 = *(const std::string::value_type **)a2;
  if (v3 >= 0) {
    uint64_t v6 = (const std::string::value_type *)a2;
  }
  int v7 = *(_DWORD *)v6;
  int v8 = *((unsigned __int8 *)v6 + 4);
  if (v7 == 1667330163 && v8 == 101)
  {
    std::string::basic_string[abi:ne180100]<0>(&v25, " ");
  }
  else
  {
LABEL_14:
    if (v3 < 0) {
      std::string::__init_copy_ctor_external(&v25, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
    }
    else {
      std::string v25 = *(std::string *)a2;
    }
  }
  uint64_t v11 = (char *)*((unsigned __int8 *)a1 + 23);
  if ((char)v11 >= 0) {
    int v12 = (char *)a1;
  }
  else {
    int v12 = *a1;
  }
  int v13 = SHIBYTE(v25.__r_.__value_.__r.__words[2]);
  std::string::size_type v14 = (void *)v25.__r_.__value_.__r.__words[0];
  if ((v25.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    unsigned int v15 = &v25;
  }
  else {
    unsigned int v15 = (std::string *)v25.__r_.__value_.__r.__words[0];
  }
  if ((v25.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    int64_t size = HIBYTE(v25.__r_.__value_.__r.__words[2]);
  }
  else {
    int64_t size = v25.__r_.__value_.__l.__size_;
  }
  if (!size)
  {
    BOOL v10 = 1;
    if ((SHIBYTE(v25.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      return v10;
    }
    goto LABEL_45;
  }
  if ((char)v11 < 0) {
    uint64_t v11 = a1[1];
  }
  uint64_t v17 = &v11[(void)v12];
  if ((uint64_t)v11 >= size)
  {
    int v18 = v15->__r_.__value_.__s.__data_[0];
    long long v19 = v12;
    do
    {
      int v20 = &v11[-size];
      if (v20 == (char *)-1) {
        break;
      }
      uint64_t v21 = (char *)memchr(v19, v18, (size_t)(v20 + 1));
      if (!v21) {
        break;
      }
      double v22 = v21;
      if (!memcmp(v21, v15, size)) {
        goto LABEL_38;
      }
      long long v19 = v22 + 1;
      uint64_t v11 = (char *)(v17 - (v22 + 1));
    }
    while ((uint64_t)v11 >= size);
  }
  double v22 = v17;
LABEL_38:
  BOOL v10 = v22 != v17 && v22 - v12 != -1;
  if (v13 < 0) {
LABEL_45:
  }
    operator delete(v14);
  return v10;
}

void InputTranscoder::enumerateLDAssets()
{
  v0[0] = 0;
  v0[1] = v0;
  v0[2] = 0x2000000000;
  char v1 = 0;
  LDEnumerateAssetDataItems();
  _Block_object_dispose(v0, 8);
}

void sub_236A00E9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ___ZN15InputTranscoder17enumerateLDAssetsEPK10__CFLocaleU13block_pointerFvPK7__CFURL17LDAssetBundleTypeS2_PK10__CFStringPbE_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned char *a6)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *a6;
  return result;
}

void *std::pair<std::string,std::string>::pair[abi:ne180100]<char const(&)[1],std::string const&,0>(void *a1, char *a2, long long *a3)
{
  std::string::size_type v5 = (std::string *)(std::string::basic_string[abi:ne180100]<0>(a1, a2) + 3);
  if (*((char *)a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *(const std::string::value_type **)a3, *((void *)a3 + 1));
  }
  else
  {
    long long v6 = *a3;
    v5->__r_.__value_.__r.__words[2] = *((void *)a3 + 2);
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v6;
  }
  return a1;
}

void sub_236A00F4C(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void *std::string::__init_with_size[abi:ne180100]<std::__wrap_iter<char const*>,std::__wrap_iter<char const*>>(void *result, char *a2, char *a3, unint64_t a4)
{
  char v4 = result;
  if (a4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (a4 > 0x16)
  {
    uint64_t v8 = (a4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a4 | 7) != 0x17) {
      uint64_t v8 = a4 | 7;
    }
    uint64_t v9 = v8 + 1;
    uint64_t result = operator new(v8 + 1);
    v4[1] = a4;
    std::string::size_type v4[2] = v9 | 0x8000000000000000;
    *char v4 = result;
    char v4 = result;
  }
  else
  {
    *((unsigned char *)result + 23) = a4;
  }
  while (a2 != a3)
  {
    char v10 = *a2++;
    *(unsigned char *)char v4 = v10;
    char v4 = (void *)((char *)v4 + 1);
  }
  *(unsigned char *)char v4 = 0;
  return result;
}

std::string *std::pair<std::string,std::string>::pair[abi:ne180100]<std::string&,std::string&,0>(std::string *this, long long *a2, long long *a3)
{
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v5 = *a2;
    this->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v5;
  }
  long long v6 = this + 1;
  if (*((char *)a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v6, *(const std::string::value_type **)a3, *((void *)a3 + 1));
  }
  else
  {
    long long v7 = *a3;
    this[1].__r_.__value_.__r.__words[2] = *((void *)a3 + 2);
    *(_OWORD *)&v6->__r_.__value_.__l.__data_ = v7;
  }
  return this;
}

void sub_236A0108C(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x270EE42A8]();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFURLRef CFBundleCopyResourceURLForLocalization(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName, CFStringRef localizationName)
{
  return (CFURLRef)MEMORY[0x270EE4598](bundle, resourceName, resourceType, subDirName, localizationName);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x270EE45B8](allocator, bundleURL);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x270EE45C8](bundleID);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x270EE48F0](theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x270EE4930](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x270EE49A0](err);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x270EE49C0](allocator, domain, code, userInfo);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x270EE4A80](allocator, localeIdentifier);
}

CFLocaleIdentifier CFLocaleGetIdentifier(CFLocaleRef locale)
{
  return (CFLocaleIdentifier)MEMORY[0x270EE4AB0](locale);
}

CFTypeID CFLocaleGetTypeID(void)
{
  return MEMORY[0x270EE4AC8]();
}

CFTypeRef CFLocaleGetValue(CFLocaleRef locale, CFLocaleKey key)
{
  return (CFTypeRef)MEMORY[0x270EE4AD0](locale, key);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x270EE4D48](allocator, stream, streamLength, options, format, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x270EE4D90](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x270EE4DB8](stream);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x270EE5098](alloc, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x270EE50D0](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithCharacters(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars)
{
  return (CFStringRef)MEMORY[0x270EE50F8](alloc, chars, numChars);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x270EE5190](theString, idx);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x270EE51E0](length, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

CFStringRef CFURLCopyLastPathComponent(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x270EE5338](url);
}

CFStringRef CFURLCopyPath(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x270EE5348](anURL);
}

CFURLRef CFURLCreateCopyDeletingLastPathComponent(CFAllocatorRef allocator, CFURLRef url)
{
  return (CFURLRef)MEMORY[0x270EE53A0](allocator, url);
}

CFURLRef CFURLCreateCopyDeletingPathExtension(CFAllocatorRef allocator, CFURLRef url)
{
  return (CFURLRef)MEMORY[0x270EE53A8](allocator, url);
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE53C0](allocator, buffer, bufLen, isDirectory);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x270EE5430](url, resolveAgainstBase, buffer, maxBufLen);
}

CFTypeID CFURLGetTypeID(void)
{
  return MEMORY[0x270EE5448]();
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
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

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7290]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.double x = v2;
  return result;
}

uint64_t LDEnumerateAssetDataItems()
{
  return MEMORY[0x270F474B0]();
}

uint64_t LMLanguageModelConditionalProbability()
{
  return MEMORY[0x270F46AC8]();
}

uint64_t LMLanguageModelCreate()
{
  return MEMORY[0x270F46AE0]();
}

uint64_t LMLanguageModelGetOrder()
{
  return MEMORY[0x270F46B30]();
}

uint64_t LMLanguageModelRelease()
{
  return MEMORY[0x270F46B78]();
}

uint64_t LXCursorConditionalProbability()
{
  return MEMORY[0x270F46E78]();
}

uint64_t LXCursorCreateByAdvancingWithUTF8()
{
  return MEMORY[0x270F46EA0]();
}

uint64_t LXCursorEnumerateEntriesRecursively()
{
  return MEMORY[0x270F46EB8]();
}

uint64_t LXCursorHasEntries()
{
  return MEMORY[0x270F46EC8]();
}

uint64_t LXCursorIsRoot()
{
  return MEMORY[0x270F46ED8]();
}

uint64_t LXCursorTerminationProbability()
{
  return MEMORY[0x270F46EE8]();
}

uint64_t LXEntryCopyString()
{
  return MEMORY[0x270F46EF0]();
}

uint64_t LXEntryGetProbability()
{
  return MEMORY[0x270F46F00]();
}

uint64_t LXLexiconCreate()
{
  return MEMORY[0x270F46F50]();
}

uint64_t LXLexiconCreateRootCursor()
{
  return MEMORY[0x270F46F60]();
}

uint64_t LXLexiconEnumerateEntriesForString()
{
  return MEMORY[0x270F46F70]();
}

uint64_t MRLNeuralNetworkClear()
{
  return MEMORY[0x270F4C460]();
}

uint64_t MRLNeuralNetworkCreate()
{
  return MEMORY[0x270F4C470]();
}

uint64_t MRLNeuralNetworkGetOutput()
{
  return MEMORY[0x270F4C478]();
}

uint64_t MRLNeuralNetworkGetOutputDimension()
{
  return MEMORY[0x270F4C480]();
}

uint64_t MRLNeuralNetworkPredict()
{
  return MEMORY[0x270F4C488]();
}

uint64_t MRLNeuralNetworkSetInput()
{
  return MEMORY[0x270F4C490]();
}

uint64_t MRLNeuralNetworkSetInputTensor()
{
  return MEMORY[0x270F4C498]();
}

uint64_t MRLNeuralNetworkTensorAppendData()
{
  return MEMORY[0x270F4C4A0]();
}

uint64_t MRLNeuralNetworkTensorCreate()
{
  return MEMORY[0x270F4C4A8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x270EE56F0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x270EE5700]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::string::size_type std::string::find(const std::string *this, std::string::value_type __c, std::string::size_type __pos)
{
  return MEMORY[0x270F98238](this, __c, __pos);
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

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x270F983B0](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x270F98458](__n);
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F98480](this, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

std::string *__cdecl std::string::append(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x270F984B0](this, __n, __c);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984E8](this, __pos, __s, __n);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x270F98548](this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x270F98560](this, __str);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x270F98758]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x270F98760]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x270F98770]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x270F98790]();
}

{
  return MEMORY[0x270F987A0]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x270F98870]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x270F988A8]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x270F988B0]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

int std::stoi(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x270F98B78](__str, __idx, *(void *)&__base);
}

void std::mutex::lock(std::mutex *this)
{
}

void std::mutex::unlock(std::mutex *this)
{
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
  return MEMORY[0x270F98DE8]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x270F98E10](retstr, *(void *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, uint64_t __val)
{
  return (std::string *)MEMORY[0x270F98E18](retstr, __val);
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x270F98E38]();
}

void std::exception::~exception(std::exception *this)
{
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

void __cxa_end_catch(void)
{
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

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x270ED7E28](*(void *)&a1, a2);
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x270ED7F00](*(void *)&a1);
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x270ED86A8](__y, __x);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

long double exp(long double __x)
{
  MEMORY[0x270ED9858](__x);
  return result;
}

float expf(float a1)
{
  MEMORY[0x270ED9870](a1);
  return result;
}

long double hypot(long double __x, long double __y)
{
  MEMORY[0x270ED9E58](__x, __y);
  return result;
}

float hypotf(float a1, float a2)
{
  MEMORY[0x270ED9E60](a1, a2);
  return result;
}

long double log(long double __x)
{
  MEMORY[0x270EDA0A8](__x);
  return result;
}

long double log1p(long double __x)
{
  MEMORY[0x270EDA0C0](__x);
  return result;
}

float log1pf(float a1)
{
  MEMORY[0x270EDA0C8](a1);
  return result;
}

float logf(float a1)
{
  MEMORY[0x270EDA0F8](a1);
  return result;
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x270EDA158]();
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x270EDA458](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
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

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x270EDAA60](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x270EDAA68](log, ptr);
}

float powf(float a1, float a2)
{
  MEMORY[0x270EDAD00](a1, a2);
  return result;
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}