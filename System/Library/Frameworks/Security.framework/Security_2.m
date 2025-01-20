void sub_18B3F4100()
{
  __cxa_end_catch();
  JUMPOUT(0x18B3F416CLL);
}

void sub_18B3F4134(uint64_t a1, int a2)
{
  if (!a2) {
    JUMPOUT(0x18B3F43C4);
  }
  JUMPOUT(0x18B3F416CLL);
}

void sub_18B3F4148(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, void *a14, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if (v26) {
    operator delete(v26);
  }
  if (__p) {
    operator delete(__p);
  }
  if (a2 == 2)
  {
    __cxa_begin_catch(a1);
    v29 = (Security::Universal *)(*(uint64_t (**)(void))(**(void **)(v25 + 32) + 80))(*(void *)(v25 + 32));
    if (!v29) {
      __cxa_rethrow();
    }
    Security::Universal::architecture(v29);
  }
  if (a2 == 1)
  {
    __cxa_begin_catch(a1);
    v30 = (Security::Universal *)(*(uint64_t (**)(void))(**(void **)(v25 + 32) + 80))(*(void *)(v25 + 32));
    if (!v30) {
      __cxa_rethrow();
    }
    Security::Universal::architecture(v30);
  }
  JUMPOUT(0x18B3F43C4);
}

void sub_18B3F433C(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  Security::CFRef<__CFString const*>::~CFRef((const void **)(v25 - 144));
  __cxa_end_catch();
  JUMPOUT(0x18B3F43C4);
}

void sub_18B3F43AC()
{
}

void sub_18B3F43BC(_Unwind_Exception *exception_object, int a2)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void ___ZN8Security11CodeSigning13SecStaticCode14staticValidateEjPKNS0_14SecRequirementE_block_invoke(uint64_t a1, Security::CodeSigning::SecStaticCode *this)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if ((*(unsigned char *)(a1 + 48) & 0x41) == 0
    || (v5 = (Security::Universal *)(*(uint64_t (**)(void))(**((void **)this + 4) + 80))(*((void *)this + 4)),
        (Security::Universal::bestNativeArch(v5) & 0xFFFFFF) != 0x12))
  {
    Security::CodeSigning::SecStaticCode::detachedSignature(this, *(const __CFData **)(v4 + 136));
    int v6 = *(_DWORD *)(a1 + 48);
    v7 = *(Security::CodeSigning::Requirement ***)(a1 + 40);
    Security::CodeSigning::SecStaticCode::staticValidateCore((UInt8 *)this, v6, v7);
  }
}

uint64_t ___ZN8Security11CodeSigning13SecStaticCode24handleOtherArchitecturesEU13block_pointerFvPS1_E_block_invoke(uint64_t a1, Security::CodeSigning::SecStaticCode *a2)
{
  uint64_t v4 = *(Security::CodeSigning::SecStaticCode **)(a1 + 40);
  if (Security::CodeSigning::SecStaticCode::teamID(v4) && Security::CodeSigning::SecStaticCode::teamID(a2))
  {
    v5 = (const char *)Security::CodeSigning::SecStaticCode::teamID(v4);
    int v6 = (const char *)Security::CodeSigning::SecStaticCode::teamID(a2);
    if (strcmp(v5, v6)) {
      goto LABEL_4;
    }
  }
  else
  {
    v7 = Security::CodeSigning::SecStaticCode::teamID(v4);
    if (v7 != Security::CodeSigning::SecStaticCode::teamID(a2)) {
LABEL_4:
    }
      Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA1BLL);
  }
  v8 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v8();
}

void Security::CodeSigning::SecStaticCode::visitOtherArchitectures(uint64_t a1)
{
  v2 = (uint64_t *)(*(uint64_t (**)(void))(**(void **)(a1 + 32) + 80))(*(void *)(a1 + 32));
  if (v2)
  {
    v3 = (Security::Universal *)v2;
    v29 = 0;
    unint64_t v30 = 0;
    v28 = &v29;
    Security::Universal::architectures(v2, (uint64_t *)&v28);
    if (v30 >= 2)
    {
      long long v25 = 0xAAAAAAAAAAAAAA00;
      unint64_t v27 = 0xAAAAAAAAAAAAAA00;
      v23[0] = 0xFFFFFFFF00000000;
      v23[1] = 0;
      unint64_t v24 = 0;
      uint64_t v26 = 0;
      uint64_t v4 = Security::Universal::archOffset(v3);
      uint64_t v5 = (uint64_t)v28;
      if (v28 != &v29)
      {
        uint64_t v6 = v4;
        v7 = (void *)((char *)v3 + 56);
        do
        {
          unint64_t v8 = Security::Universal::archOffset(v3, (const Security::Architecture *)*(unsigned int *)(v5 + 28), *(_DWORD *)(v5 + 32));
          unint64_t v24 = v8;
          v9 = (void *)*v7;
          if (!*v7) {
            goto LABEL_29;
          }
          v10 = (void *)((char *)v3 + 56);
          do
          {
            unint64_t v11 = v9[4];
            BOOL v12 = v11 >= v8;
            if (v11 >= v8) {
              v13 = v9;
            }
            else {
              v13 = v9 + 1;
            }
            if (v12) {
              v10 = v9;
            }
            v9 = (void *)*v13;
          }
          while (*v13);
          if (v10 == v7 || v10[4] > v8) {
LABEL_29:
          }
            Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEF7A9);
          uint64_t v26 = v10[5];
          if (v8 != v6)
          {
            v22 = (Security::CodeSigning::SecStaticCode *)0xAAAAAAAAAAAAAAAALL;
            uint64_t v14 = Security::ModuleNexus<Security::CodeSigning::CFObjects>::operator()();
            Security::SecCFObject::allocate((Security::SecCFObject *)0x288, *(void *)(v14 + 200), v15);
            (*(void (**)(void **__return_ptr))(**(void **)(a1 + 32) + 40))(&__p);
            if (v21 >= 0) {
              p_p = (char *)&__p;
            }
            else {
              p_p = (char *)__p;
            }
            Security::CodeSigning::DiskRep::bestGuess(p_p, (uint64_t)v23);
          }
          v17 = *(void **)(v5 + 8);
          if (v17)
          {
            do
            {
              v18 = (void **)v17;
              v17 = (void *)*v17;
            }
            while (v17);
          }
          else
          {
            do
            {
              v18 = *(void ***)(v5 + 16);
              BOOL v19 = *v18 == (void *)v5;
              uint64_t v5 = (uint64_t)v18;
            }
            while (!v19);
          }
          uint64_t v5 = (uint64_t)v18;
        }
        while (v18 != &v29);
      }
    }
    std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy(v29);
  }
}

void sub_18B3F4954(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, std::logic_error a13, int a14, __int16 a15, char a16, char a17, char a18)
{
}

BOOL Security::CodeSigning::SecStaticCode::satisfiesRequirement(uint64_t a1, Security::CodeSigning::Requirement *a2)
{
  Security::CodeSigning::SecStaticCode::validateDirectory((UInt8 *)a1);
  CFDateRef v41 = 0;
  Security::CodeSigning::SecStaticCode::validateDirectory((UInt8 *)a1);
  double v4 = *(double *)(a1 + 384);
  if (v4 != 0.0) {
    CFDateRef v41 = CFDateCreate(0, v4);
  }
  CFURLRef v40 = (const __CFURL *)0xAAAAAAAAAAAAAAAALL;
  CFURLRef v40 = (const __CFURL *)(*(uint64_t (**)(void))(**(void **)(a1 + 32) + 48))(*(void *)(a1 + 32));
  memset(v39, 170, sizeof(v39));
  Security::cfString((Security *)v39, v40);
  if (*((_DWORD *)a2 + 2) == 0x2000000)
  {
    uint64_t v5 = (Security::Universal *)(*(uint64_t (**)(void))(**(void **)(a1 + 32) + 80))(*(void *)(a1 + 32));
    if (v5)
    {
      v26[0] = (Security::CodeSigning::CodeDirectory *)Security::Universal::bestNativeArch(v5);
      char v6 = (*(uint64_t (**)(void, Security::CodeSigning::CodeDirectory **))(**(void **)(a1 + 32) + 120))(*(void *)(a1 + 32), v26);
    }
    else
    {
      char v6 = 0;
    }
    if (SHIBYTE(v39[2]) >= 0) {
      v9 = (const char *)v39;
    }
    else {
      v9 = (const char *)v39[0];
    }
    int v10 = openat_authenticated_np(-2, v9, 0, -1);
    BOOL v7 = v10 != -1;
    if (v10 != -1) {
      close(v10);
    }
    if (SHIBYTE(v39[2]) >= 0) {
      BOOL v12 = (Security::CodeSigning *)v39;
    }
    else {
      BOOL v12 = (Security::CodeSigning *)v39[0];
    }
    char v8 = Security::CodeSigning::isOnRootFilesystem(v12, v11);
    int v24 = Security::CodeSigning::SecStaticCode::validationCategory((Security::CodeSigning::SecStaticCode *)a1);
  }
  else
  {
    char v6 = 0;
    BOOL v7 = 0;
    char v8 = 0;
    int v24 = 0;
  }
  v13 = *(Security::CodeSigning::CodeDirectory **)(a1 + 624);
  uint64_t v14 = (Security::CodeSigning::CodeDirectory *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 88))(a1);
  v15 = (Security::CodeSigning::CodeDirectory *)Security::CodeSigning::SecStaticCode::entitlements((UInt8 *)a1);
  v23 = a2;
  v16 = Security::CodeSigning::SecStaticCode::codeDirectory((Security::CodeSigning::SecStaticCode *)a1, 1);
  std::string::basic_string[abi:ne180100]<0>(&v25, (char *)&v16[bswap32(*((_DWORD *)v16 + 5))]);
  v17 = Security::CodeSigning::SecStaticCode::codeDirectory((Security::CodeSigning::SecStaticCode *)a1, 1);
  char v18 = (*(uint64_t (**)(void))(**(void **)(a1 + 32) + 248))(*(void *)(a1 + 32));
  CFDateRef v19 = v41;
  v20 = Security::CodeSigning::SecStaticCode::teamID((Security::CodeSigning::SecStaticCode *)a1);
  v26[0] = v13;
  v26[1] = v14;
  v26[2] = v15;
  if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&__p, v25.__r_.__value_.__l.__data_, v25.__r_.__value_.__l.__size_);
  }
  else {
    std::string __p = v25;
  }
  v28 = v17;
  uint64_t v29 = 0;
  int v30 = 0;
  char v31 = v18;
  CFDateRef v32 = v19;
  v33 = v20;
  char v34 = v6;
  char v35 = 0;
  BOOL v36 = v7;
  char v37 = v8;
  int v38 = v24;
  BOOL v21 = Security::CodeSigning::Requirement::validates(v23, v26);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v25.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v39[2]) < 0) {
    operator delete(v39[0]);
  }
  Security::CFRef<__CFURL const*>::~CFRef((const void **)&v40);
  Security::CFRef<__CFDate const*>::~CFRef((const void **)&v41);
  return v21;
}

void sub_18B3F4DBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (*(char *)(v26 - 105) < 0) {
    operator delete(*(void **)(v26 - 128));
  }
  Security::CFRef<__CFURL const*>::~CFRef((const void **)(v26 - 104));
  Security::CFRef<__CFDate const*>::~CFRef((const void **)(v26 - 96));
  _Unwind_Resume(a1);
}

uint64_t Security::CodeSigning::SecStaticCode::validationCategory(Security::CodeSigning::SecStaticCode *this)
{
  uint64_t result = *((unsigned int *)this + 159);
  if (!result)
  {
    CFDataRef v3 = (const __CFData *)Security::CodeSigning::SecStaticCode::cdHash(this);
    uint64_t v13 = 0;
    BytePtr = CFDataGetBytePtr(v3);
    CFIndex Length = CFDataGetLength(v3);
    if (!amfi_interface_cdhash_in_trustcache((uint64_t)BytePtr, Length, &v13) && v13 == 1)
    {
      uint64_t result = 1;
LABEL_27:
      *((_DWORD *)this + 159) = result;
      return result;
    }
    CFDataRef v6 = (const __CFData *)Security::CodeSigning::SecStaticCode::signature(this);
    BOOL v7 = Security::CodeSigning::SecStaticCode::codeDirectory(this, 0);
    if (v7 && (v7[15] & 2) != 0)
    {
      uint64_t result = 10;
      goto LABEL_27;
    }
    uint64_t v13 = 0;
    if (os_variant_allows_internal_security_policies())
    {
      char v8 = 1;
    }
    else
    {
      if (SecAreQARootCertificatesEnabled_onceToken != -1) {
        dispatch_once(&SecAreQARootCertificatesEnabled_onceToken, &__block_literal_global_15275);
      }
      char v8 = SecAreQARootCertificatesEnabled_sQACertsEnabled != 0;
    }
    v9 = CFDataGetBytePtr(v6);
    CFIndex v10 = CFDataGetLength(v6);
    int v11 = CTVerifyAmfiCertificateChain((uint64_t)v9, v10, v8, 16, &v13);
    uint64_t result = 10;
    *((_DWORD *)this + 159) = 10;
    if (!v11)
    {
      if (v13 & 0x80000001140) != 0 || ((v13 & 0x100000002200) != 0 ? (char v12 = v8) : (char v12 = 0), (v12))
      {
        uint64_t result = 4;
        goto LABEL_27;
      }
      if ((v13 & 0x90) != 0)
      {
        uint64_t result = 3;
        goto LABEL_27;
      }
      if ((v13 & 0x10000) != 0)
      {
        uint64_t result = 5;
        goto LABEL_27;
      }
      if ((v13 & 0x400) == 0 && (v13 & 0xC000) != 0)
      {
        uint64_t result = 2;
        goto LABEL_27;
      }
    }
  }
  return result;
}

const void **___ZN8Security11CodeSigning13SecStaticCode17validateResourcesEj_block_invoke_31(uint64_t a1)
{
  CFURLRef v6 = *(const __CFURL **)(a1 + 40);
  v5[1] = -1431655766;
  Security::cfString((Security *)__p, v6);
  v5[0] = -1;
  if (v4 >= 0) {
    v1 = __p;
  }
  else {
    v1 = (void **)__p[0];
  }
  Security::UnixPlusPlus::FileDesc::open((Security::UnixPlusPlus::FileDesc *)v5, (const char *)v1, 0, 4096);
  if (v4 < 0) {
    operator delete(__p[0]);
  }
  Security::UnixPlusPlus::FileDesc::closeAndLog((Security::UnixPlusPlus::FileDesc *)v5);
  return Security::CFRef<__CFURL const*>::~CFRef((const void **)&v6);
}

void sub_18B3F506C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  Security::CFRef<__CFURL const*>::~CFRef((const void **)(v15 - 24));
  _Unwind_Resume(a1);
}

void ___ZN8Security11CodeSigning13SecStaticCode20hasWeakResourceRulesEPK14__CFDictionaryjPK9__CFArray_block_invoke(uint64_t a1, __CFString *a2, const void *a3)
{
  memset(&__s1, 170, sizeof(__s1));
  Security::cfString(&__s1, a2);
  uint64_t v6 = HIBYTE(__s1.__r_.__value_.__r.__words[2]);
  if ((__s1.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(__s1.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = __s1.__r_.__value_.__l.__size_;
  }
  uint64_t v8 = *(unsigned __int8 *)(a1 + 71);
  int v9 = (char)v8;
  if ((v8 & 0x80u) != 0) {
    uint64_t v8 = *(void *)(a1 + 56);
  }
  if (size != v8)
  {
LABEL_16:
    uint64_t v13 = (const void *)*MEMORY[0x1E4F1CFD0];
    goto LABEL_17;
  }
  if (v9 >= 0) {
    CFIndex v10 = (unsigned __int8 *)(a1 + 48);
  }
  else {
    CFIndex v10 = *(unsigned __int8 **)(a1 + 48);
  }
  if ((*((unsigned char *)&__s1.__r_.__value_.__s + 23) & 0x80) != 0)
  {
    BOOL v12 = memcmp(__s1.__r_.__value_.__l.__data_, v10, __s1.__r_.__value_.__l.__size_) == 0;
  }
  else
  {
    if (*((unsigned char *)&__s1.__r_.__value_.__s + 23))
    {
      p_s1 = &__s1;
      while (p_s1->__r_.__value_.__s.__data_[0] == *v10)
      {
        p_s1 = (std::string *)((char *)p_s1 + 1);
        ++v10;
        if (!--v6) {
          goto LABEL_15;
        }
      }
      goto LABEL_16;
    }
LABEL_15:
    BOOL v12 = 1;
  }
  uint64_t v13 = (const void *)*MEMORY[0x1E4F1CFD0];
  if (v12 && v13 == a3)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    goto LABEL_26;
  }
LABEL_17:
  CFTypeID v14 = CFGetTypeID(a3);
  if (v14 == CFBooleanGetTypeID())
  {
    if ((const void *)*MEMORY[0x1E4F1CFC8] != a3) {
      goto LABEL_26;
    }
  }
  else
  {
    v17[0] = (const void *)0xAAAAAAAAAAAAAAAALL;
    v17[1] = (const void *)0xAAAAAAAAAAAAAAAALL;
    Security::CFDictionary::CFDictionary((Security::CFDictionary *)v17, a3);
    uint64_t v15 = Security::CFDictionary::get<__CFBoolean const*>((uint64_t)v17, "omit");
    Security::CFRef<__CFDictionary const*>::~CFRef(v17);
    if (v15 != v13) {
      goto LABEL_26;
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= CFArrayContainsValue(*(CFArrayRef *)(a1 + 72), *(CFRange *)(a1 + 80), a2) == 0;
LABEL_26:
  if (SHIBYTE(__s1.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__s1.__r_.__value_.__l.__data_);
  }
}

void sub_18B3F524C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, const void *a16)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t Security::CFDictionary::BlockApplier<__CFString const*,void const*>::apply(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)a3 + 16))();
}

void __destroy_helper_block_e8_48c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(uint64_t a1)
{
  if (*(char *)(a1 + 71) < 0) {
    operator delete(*(void **)(a1 + 48));
  }
}

void __copy_helper_block_e8_48c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(std::string *a1, uint64_t a2)
{
  v2 = a1 + 2;
  if (*(char *)(a2 + 71) < 0)
  {
    std::string::__init_copy_ctor_external(v2, *(const std::string::value_type **)(a2 + 48), *(void *)(a2 + 56));
  }
  else
  {
    long long v3 = *(_OWORD *)(a2 + 48);
    v2->__r_.__value_.__r.__words[2] = *(void *)(a2 + 64);
    *(_OWORD *)&v2->__r_.__value_.__l.__data_ = v3;
  }
}

Security::CFDictionary *Security::CFDictionary::CFDictionary(Security::CFDictionary *this, CFTypeRef cf)
{
  *(void *)this = cf;
  if (!cf)
  {
    *((_DWORD *)this + 2) = -67053;
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA13);
  }
  CFTypeID v3 = CFGetTypeID(cf);
  if (v3 != CFDictionaryGetTypeID()) {
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA13);
  }
  if (*(void *)this) {
    CFRetain(*(CFTypeRef *)this);
  }
  *((_DWORD *)this + 2) = -67053;
  return this;
}

void sub_18B3F535C(_Unwind_Exception *a1)
{
  Security::CFRef<__CFDictionary const*>::~CFRef(v1);
  _Unwind_Resume(a1);
}

const void *Security::CFDictionary::get<__CFBoolean const*>(uint64_t a1, const char *a2)
{
  Security::CFTempString::CFTempString<char const*>((CFStringRef *)&key, a2);
  Value = CFDictionaryGetValue(*(CFDictionaryRef *)a1, key);
  Security::CFRef<__CFBoolean const*>::check<void const*>(Value, (Security::MacOSError *)*(unsigned int *)(a1 + 8));
  Security::CFRef<__CFString const*>::~CFRef((const void **)&key);
  return Value;
}

void sub_18B3F53C8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  Security::CFRef<__CFString const*>::~CFRef((const void **)va);
  _Unwind_Resume(a1);
}

unsigned int *Security::CodeSigning::SecStaticCode::internalRequirements(Security::CodeSigning::SecStaticCode *this)
{
  uint64_t result = (unsigned int *)(*(uint64_t (**)(Security::CodeSigning::SecStaticCode *, uint64_t, uint64_t))(*(void *)this + 80))(this, 2, 4294900235);
  if (result)
  {
    uint64_t result = (unsigned int *)CFDataGetBytePtr((CFDataRef)result);
    if (*result != 17620730
      || (v2 = bswap32(result[2]), v3 = 8 * v2 + 12, unint64_t v4 = bswap32(result[1]), v3 > v4))
    {
      *__error() = 22;
LABEL_12:
      Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA14);
    }
    unint64_t v5 = (unint64_t)&result[2 * v2 + 3];
    while (1)
    {
      v5 -= 8;
      if (v5 < (unint64_t)(result + 3)) {
        break;
      }
      unsigned int v6 = *(_DWORD *)(v5 + 4);
      if (v6)
      {
        unint64_t v7 = bswap32(v6);
        BOOL v8 = v3 > v7 || v7 + 8 > v4;
        if (v8 || bswap32(*(unsigned int *)((char *)result + v7 + 4)) + v7 > v4) {
          goto LABEL_12;
        }
      }
    }
  }
  return result;
}

_DWORD *Security::SuperBlobCore<Security::SuperBlob<4208856065u,unsigned int>,4208856065u,unsigned int>::find<Security::CodeSigning::Requirement>(uint64_t a1, int a2)
{
  unsigned int v2 = *(_DWORD *)(a1 + 8);
  if (!v2) {
    return 0;
  }
  uint64_t v3 = 0;
  LODWORD(v4) = bswap32(v2);
  uint64_t v4 = v4 <= 1 ? 1 : v4;
  unint64_t v5 = (unsigned int *)(a1 + 12);
  while (1)
  {
    unsigned int v6 = *v5;
    v5 += 2;
    if (bswap32(v6) == a2) {
      break;
    }
    if (v4 == ++v3) {
      return 0;
    }
  }
  unsigned int v7 = *(_DWORD *)(a1 + 8 * v3 + 16);
  if (!v7) {
    return 0;
  }
  uint64_t result = (_DWORD *)(bswap32(v7) + a1);
  if (result)
  {
    unsigned int v9 = bswap32(result[1]);
    if (*result != 843514 || v9 <= 0xB)
    {
      int v11 = __error();
      uint64_t result = 0;
      *int v11 = 22;
    }
  }
  return result;
}

void *Security::CodeSigning::SecStaticCode::designatedRequirement(Security::CodeSigning::SecStaticCode *this)
{
  unsigned int v2 = Security::CodeSigning::SecStaticCode::internalRequirements(this);
  if (!v2
    || (uint64_t v3 = Security::SuperBlobCore<Security::SuperBlob<4208856065u,unsigned int>,4208856065u,unsigned int>::find<Security::CodeSigning::Requirement>((uint64_t)v2, 3)) == 0)
  {
    uint64_t v3 = (void *)*((void *)this + 64);
    if (!v3)
    {
      uint64_t v4 = Security::CodeSigning::SecStaticCode::codeDirectory(this, 0);
      if (!v4 || (v4[15] & 2) == 0) {
        Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA00);
      }
      unint64_t v5 = malloc_type_malloc(0x400uLL, 0x96562061uLL);
      v23 = v5;
      *(void *)unint64_t v5 = 843514;
      _DWORD v5[2] = 0x1000000;
      uint64_t v24 = 0xC00000400;
      v22[0] = 0xAAAAAAAA0000000CLL;
      v22[1] = &v23;
      v22[2] = 7;
      uint64_t v16 = 0;
      v17 = &v16;
      uint64_t v18 = 0x3002000000;
      CFDateRef v19 = __Block_byref_object_copy__67;
      v20 = __Block_byref_object_dispose__68;
      CFMutableArrayRef MutableCopy = (CFMutableArrayRef)0xAAAAAAAAAAAAAAAALL;
      CFArrayRef v7 = (const __CFArray *)Security::CodeSigning::SecStaticCode::cdHashes(this, v6);
      CFMutableArrayRef MutableCopy = CFArrayCreateMutableCopy(0, 0, v7);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 0x40000000;
      v15[2] = ___ZN8Security11CodeSigning13SecStaticCode28defaultDesignatedRequirementEv_block_invoke;
      v15[3] = &unk_1E5485580;
      v15[4] = &v16;
      uint64_t v25 = MEMORY[0x1E4F143A8];
      uint64_t v26 = 0x40000000;
      unint64_t v27 = ___ZN8Security11CodeSigning13SecStaticCode24handleOtherArchitecturesEU13block_pointerFvPS1_E_block_invoke;
      v28 = &unk_1E5485740;
      uint64_t v29 = v15;
      int v30 = this;
      Security::CodeSigning::SecStaticCode::visitOtherArchitectures((uint64_t)this);
      CFIndex Count = CFArrayGetCount((CFArrayRef)v17[5]);
      if (Count >= 1)
      {
        for (CFIndex i = 0; i != Count; ++i)
        {
          Security::CodeSigning::Requirement::Maker::Chain::add(v22);
          CFDataRef ValueAtIndex = (const __CFData *)CFArrayGetValueAtIndex((CFArrayRef)v17[5], i);
          Security::CodeSigning::Requirement::Maker::require(&v23, 4);
          uint64_t v11 = HIDWORD(v24);
          HIDWORD(v24) += 4;
          *(_DWORD *)((char *)v23 + v11) = 0x8000000;
          BytePtr = CFDataGetBytePtr(ValueAtIndex);
          CFIndex Length = CFDataGetLength(ValueAtIndex);
          Security::CodeSigning::Requirement::Maker::putData((Security::CodeSigning::Requirement::Maker *)&v23, BytePtr, Length);
        }
      }
      uint64_t v3 = v23;
      *((_DWORD *)v23 + 1) = bswap32(HIDWORD(v24));
      v23 = 0;
      _Block_object_dispose(&v16, 8);
      Security::CFRef<__CFArray *>::~CFRef((const void **)&MutableCopy);
      free(v23);
      *((void *)this + 64) = v3;
    }
  }
  return v3;
}

void sub_18B3F57FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23)
{
  _Block_object_dispose(&a14, 8);
  Security::CFRef<__CFArray *>::~CFRef(v23);
  free(a23);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__67(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  return result;
}

const void **__Block_byref_object_dispose__68(uint64_t a1)
{
  return Security::CFRef<__CFArray *>::~CFRef((const void **)(a1 + 40));
}

void ___ZN8Security11CodeSigning13SecStaticCode28defaultDesignatedRequirementEv_block_invoke(uint64_t a1, Security::CodeSigning::SecStaticCode *this)
{
  CFArrayRef v3 = (const __CFArray *)Security::CodeSigning::SecStaticCode::cdHashes(this, (uint64_t)this);
  uint64_t v4 = *(__CFArray **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  v5.length = CFArrayGetCount(v3);
  v5.location = 0;

  CFArrayAppendArray(v4, v3, v5);
}

_DWORD *Security::CodeSigning::Requirement::Maker::Chain::add(_DWORD *this)
{
  int v1 = this[5];
  this[5] = v1 + 1;
  if (v1)
  {
    unsigned int v2 = this;
    unsigned int v3 = this[4];
    uint64_t v4 = *((void *)this + 1);
    Security::CodeSigning::Requirement::Maker::require((void *)v4, 4);
    this = memmove((void *)(*v2 + *(void *)v4 + 4), (const void *)(*v2 + *(void *)v4), (*(_DWORD *)(v4 + 12) - *v2));
    *(_DWORD *)(v4 + 12) += 4;
    *(_DWORD *)(*v2 + *(void *)v4) = bswap32(v3);
  }
  return this;
}

uint64_t Security::CodeSigning::SecStaticCode::defaultDesignatedLightWeightCodeRequirement(Security::CodeSigning::SecStaticCode *this)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t result = *((void *)this + 80);
  if (!result)
  {
    memset(__p, 170, sizeof(__p));
    unsigned int v3 = Security::CodeSigning::SecStaticCode::codeDirectory(this, 1);
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)&v3[bswap32(*((_DWORD *)v3 + 5))]);
    uint64_t v4 = Security::CodeSigning::SecStaticCode::teamID(this);
    uint64_t v24 = 0;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x3002000000;
    unint64_t v27 = __Block_byref_object_copy__67;
    v28 = __Block_byref_object_dispose__68;
    CFMutableArrayRef MutableCopy = (CFMutableArrayRef)0xAAAAAAAAAAAAAAAALL;
    CFArrayRef v6 = (const __CFArray *)Security::CodeSigning::SecStaticCode::cdHashes(this, v5);
    CFMutableArrayRef MutableCopy = CFArrayCreateMutableCopy(0, 0, v6);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 0x40000000;
    void v23[2] = ___ZN8Security11CodeSigning13SecStaticCode43defaultDesignatedLightWeightCodeRequirementEv_block_invoke;
    v23[3] = &unk_1E54855A8;
    v23[4] = &v24;
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 0x40000000;
    CFDateRef v32 = ___ZN8Security11CodeSigning13SecStaticCode24handleOtherArchitecturesEU13block_pointerFvPS1_E_block_invoke;
    v33 = &unk_1E5485740;
    char v34 = v23;
    char v35 = this;
    Security::CodeSigning::SecStaticCode::visitOtherArchitectures((uint64_t)this);
    int v7 = Security::CodeSigning::SecStaticCode::validationCategory(this);
    if (SHIBYTE(__p[2]) >= 0) {
      BOOL v8 = __p;
    }
    else {
      BOOL v8 = (void **)__p[0];
    }
    switch(v7)
    {
      case 1:
        if (v8)
        {
          *(void *)&long long buf = &unk_1ED86CC00;
          CFURLRef v40 = @"validation-category";
          CFDateRef v41 = @"signing-identifier";
          unsigned int v9 = [NSString stringWithUTF8String:v8];
          *((void *)&buf + 1) = v9;
          uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&buf forKeys:&v40 count:2];
        }
        else
        {
          unsigned int v9 = secLogObjForScope("SecError");
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 136315138;
            *(void *)((char *)&buf + 4) = "defaultPlatformLWCR";
            _os_log_impl(&dword_18B299000, v9, OS_LOG_TYPE_DEFAULT, "%s: signing identifier is NULL, cannot generate a LWCR", (uint8_t *)&buf, 0xCu);
          }
          uint64_t v10 = 0;
        }
        goto LABEL_50;
      case 2:
        if (v8)
        {
          *(void *)&long long buf = &unk_1ED86CC18;
          CFURLRef v40 = @"validation-category";
          CFDateRef v41 = @"signing-identifier";
          unsigned int v9 = [NSString stringWithUTF8String:v8];
          *((void *)&buf + 1) = v9;
          uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&buf forKeys:&v40 count:2];
        }
        else
        {
          unsigned int v9 = secLogObjForScope("SecError");
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 136315138;
            *(void *)((char *)&buf + 4) = "defaultTestflightLWCR";
            _os_log_impl(&dword_18B299000, v9, OS_LOG_TYPE_DEFAULT, "%s: signing identifier is NULL, cannot generate a LWCR", (uint8_t *)&buf, 0xCu);
          }
          uint64_t v10 = 0;
        }
        goto LABEL_50;
      case 3:
        if (!v8)
        {
          unsigned int v9 = secLogObjForScope("SecError");
          if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_41;
          }
          LODWORD(buf) = 136315138;
          *(void *)((char *)&buf + 4) = "defaultDevelopmentLWCR";
          CFDateRef v19 = "%s: signing identifier is NULL, cannot generate a LWCR";
          goto LABEL_40;
        }
        if (v4)
        {
          *(void *)&long long buf = &unk_1ED86CC30;
          CFURLRef v40 = @"validation-category";
          CFDateRef v41 = @"signing-identifier";
          unsigned int v9 = [NSString stringWithUTF8String:v8];
          *((void *)&buf + 1) = v9;
          v42 = @"team-identifier";
          uint64_t v11 = [NSString stringWithUTF8String:v4];
          CFDateRef v32 = v11;
          uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&buf forKeys:&v40 count:3];

          goto LABEL_50;
        }
        unsigned int v9 = secLogObjForScope("SecError");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 136315138;
          *(void *)((char *)&buf + 4) = "defaultDevelopmentLWCR";
          CFDateRef v19 = "%s: team identifier is NULL, cannot generate a LWCR";
LABEL_40:
          _os_log_impl(&dword_18B299000, v9, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&buf, 0xCu);
        }
LABEL_41:
        uint64_t v10 = 0;
        goto LABEL_50;
      case 4:
        if (!v8)
        {
          unsigned int v9 = secLogObjForScope("SecError");
          if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_45;
          }
          LODWORD(buf) = 136315138;
          *(void *)((char *)&buf + 4) = "defaultAppStoreLWCR";
          v20 = "%s: signing identifier is NULL, cannot generate a LWCR";
          goto LABEL_44;
        }
        if (v4)
        {
          CFURLRef v40 = @"$or";
          v38[1] = @"$and";
          v39[0] = &unk_1ED86CC48;
          v38[0] = @"validation-category";
          v37[0] = &unk_1ED86CC60;
          v36[0] = @"validation-category";
          v36[1] = @"team-identifier";
          unsigned int v9 = [NSString stringWithUTF8String:v4];
          v37[1] = v9;
          BOOL v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];
          v39[1] = v12;
          uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:2];
          *(void *)&long long buf = v13;
          CFDateRef v41 = @"signing-identifier";
          CFTypeID v14 = [NSString stringWithUTF8String:v8];
          *((void *)&buf + 1) = v14;
          uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&buf forKeys:&v40 count:2];

          goto LABEL_50;
        }
        unsigned int v9 = secLogObjForScope("SecError");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 136315138;
          *(void *)((char *)&buf + 4) = "defaultAppStoreLWCR";
          v20 = "%s: team identifier is NULL, cannot generate a LWCR";
LABEL_44:
          _os_log_impl(&dword_18B299000, v9, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&buf, 0xCu);
        }
LABEL_45:
        uint64_t v10 = 0;
        goto LABEL_50;
      case 6:
        if (!v8)
        {
          unsigned int v9 = secLogObjForScope("SecError");
          if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_49;
          }
          LODWORD(buf) = 136315138;
          *(void *)((char *)&buf + 4) = "defaultDeveloperIDLWCR";
          BOOL v21 = "%s: signing identifier is NULL, cannot generate a LWCR";
          goto LABEL_48;
        }
        if (v4)
        {
          *(void *)&long long buf = &unk_1ED86CC60;
          CFURLRef v40 = @"validation-category";
          CFDateRef v41 = @"signing-identifier";
          unsigned int v9 = [NSString stringWithUTF8String:v8];
          *((void *)&buf + 1) = v9;
          v42 = @"team-identifier";
          uint64_t v18 = [NSString stringWithUTF8String:v4];
          CFDateRef v32 = v18;
          uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&buf forKeys:&v40 count:3];

          goto LABEL_50;
        }
        unsigned int v9 = secLogObjForScope("SecError");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 136315138;
          *(void *)((char *)&buf + 4) = "defaultDeveloperIDLWCR";
          BOOL v21 = "%s: team identifier is NULL, cannot generate a LWCR";
LABEL_48:
          _os_log_impl(&dword_18B299000, v9, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&buf, 0xCu);
        }
LABEL_49:
        uint64_t v10 = 0;
LABEL_50:

LABEL_51:
        v22 = (const void *)*((void *)this + 80);
        if (v22) {
          CFRelease(v22);
        }
        *((void *)this + 80) = v10;
        _Block_object_dispose(&v24, 8);
        Security::CFRef<__CFArray *>::~CFRef((const void **)&MutableCopy);
        if (SHIBYTE(__p[2]) < 0) {
          operator delete(__p[0]);
        }
        uint64_t result = *((void *)this + 80);
        break;
      default:
        id v15 = (id)v25[5];
        uint64_t v16 = v15;
        if (v15 && [v15 count])
        {
          CFURLRef v40 = @"cdhash";
          v38[0] = @"$in";
          v39[0] = v16;
          v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:1];
          *(void *)&long long buf = v17;
          uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&buf forKeys:&v40 count:1];
        }
        else
        {
          v17 = secLogObjForScope("SecError");
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 136315138;
            *(void *)((char *)&buf + 4) = "defaultAdhocLWCR";
            _os_log_impl(&dword_18B299000, v17, OS_LOG_TYPE_DEFAULT, "%s: no cdhashes for code, cannot generate a LWCR", (uint8_t *)&buf, 0xCu);
          }
          uint64_t v10 = 0;
        }

        goto LABEL_51;
    }
  }
  return result;
}

void sub_18B3F620C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  _Block_object_dispose(&a14, 8);
  Security::CFRef<__CFArray *>::~CFRef(v25);
  if (a25 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void ___ZN8Security11CodeSigning13SecStaticCode43defaultDesignatedLightWeightCodeRequirementEv_block_invoke(uint64_t a1, Security::CodeSigning::SecStaticCode *this)
{
  CFArrayRef v3 = (const __CFArray *)Security::CodeSigning::SecStaticCode::cdHashes(this, (uint64_t)this);
  uint64_t v4 = *(__CFArray **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  v5.length = CFArrayGetCount(v3);
  v5.location = 0;

  CFArrayAppendArray(v4, v3, v5);
}

void Security::CodeSigning::SecStaticCode::validateRequirements(Security::CodeSigning::SecStaticCode *this, int a2, Security::CodeSigning::SecStaticCode *a3, uint64_t a4)
{
  int v7 = Security::CodeSigning::SecStaticCode::internalRequirements(this);
  if (v7
    && (BOOL v8 = (Security::CodeSigning::Requirement *)Security::SuperBlobCore<Security::SuperBlob<4208856065u,unsigned int>,4208856065u,unsigned int>::find<Security::CodeSigning::Requirement>((uint64_t)v7, a2)) != 0)
  {
    if (a4) {
      a4 = a4;
    }
    else {
      a4 = 4294900246;
    }
    if (!Security::CodeSigning::SecStaticCode::satisfiesRequirement((uint64_t)a3, v8)) {
LABEL_7:
    }
      Security::MacOSError::throwMe((Security::MacOSError *)a4);
  }
  else if (a4)
  {
    goto LABEL_7;
  }
  Security::CodeSigning::SecStaticCode::validateRequirements(SecRequirementType,Security::CodeSigning::SecStaticCode*,int)::_DTFrameCODESIGN_EVAL_STATIC_INTREQ::~_DTFrameCODESIGN_EVAL_STATIC_INTREQ();
}

void sub_18B3F63E0(_Unwind_Exception *a1)
{
}

void Security::CodeSigning::SecStaticCode::staticValidateResource(Security::CodeSigning::SecStaticCode *a1, std::string::size_type a2, int a3, uint64_t a4)
{
  uint64_t v116 = *MEMORY[0x1E4F143B8];
  memset(&v112, 0, sizeof(v112));
  memset(&__s, 0, sizeof(__s));
  (*(void (**)(unsigned char *__return_ptr))(**((void **)a1 + 4) + 40))(__p);
  if (__p[23] >= 0) {
    uint64_t v8 = __p[23];
  }
  else {
    uint64_t v8 = *(void *)&__p[8];
  }
  uint64_t v9 = *(unsigned __int8 *)(a2 + 23);
  int v10 = (char)v9;
  if ((v9 & 0x80u) != 0) {
    uint64_t v9 = *(void *)(a2 + 8);
  }
  if (v8 == v9)
  {
    if (v10 >= 0) {
      uint64_t v11 = (const std::string::value_type *)a2;
    }
    else {
      uint64_t v11 = *(const std::string::value_type **)a2;
    }
    if ((__p[23] & 0x80) != 0)
    {
      uint64_t v16 = *(void **)__p;
      int v17 = memcmp(*(const void **)__p, v11, *(size_t *)&__p[8]);
      operator delete(v16);
      if (!v17)
      {
LABEL_28:
        std::string::size_type size = 0;
        LOBYTE(v22) = 0;
LABEL_46:
        int v25 = a3 | 2;
        goto LABEL_47;
      }
    }
    else
    {
      if (!__p[23]) {
        goto LABEL_28;
      }
      uint64_t v12 = 0;
      do
      {
        int v13 = __p[v12];
        int v14 = v11[v12];
      }
      while (v13 == v14 && __p[23] - 1 != v12++);
      if (v13 == v14) {
        goto LABEL_28;
      }
    }
  }
  else if ((__p[23] & 0x80) != 0)
  {
    operator delete(*(void **)__p);
  }
  CFURLRef v18 = (const __CFURL *)Security::CodeSigning::SecStaticCode::resourceBase(a1);
  Security::cfString((Security *)__p, v18);
  if (SHIBYTE(v112.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v112.__r_.__value_.__l.__data_);
  }
  std::string v112 = *(std::string *)__p;
  if ((__p[23] & 0x80000000) != 0)
  {
    v20 = (std::string *)v112.__r_.__value_.__r.__words[0];
    if (*(unsigned char *)(v112.__r_.__value_.__r.__words[0] + v112.__r_.__value_.__l.__size_ - 1) != 46) {
      goto LABEL_32;
    }
    uint64_t v19 = --v112.__r_.__value_.__l.__size_;
  }
  else
  {
    if (v112.__r_.__value_.__s.__data_[__p[23] - 1] != 46) {
      goto LABEL_32;
    }
    uint64_t v19 = __p[23] - 1;
    *((unsigned char *)&v112.__r_.__value_.__s + 23) = (__p[23] - 1) & 0x7F;
    v20 = &v112;
  }
  v20->__r_.__value_.__s.__data_[v19] = 0;
LABEL_32:
  if (*(char *)(a2 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v110, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else {
    std::string v110 = *(std::string *)a2;
  }
  if (SHIBYTE(v112.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v109, v112.__r_.__value_.__l.__data_, v112.__r_.__value_.__l.__size_);
  }
  else {
    std::string v109 = v112;
  }
  Security::CodeSigning::pathRemaining((std::string *)__p, (uint64_t)&v110, (uint64_t *)&v109);
  std::string __s = *(std::string *)__p;
  __p[23] = 0;
  __p[0] = 0;
  if (SHIBYTE(v109.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v109.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v110.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v110.__r_.__value_.__l.__data_);
  }
  std::string::size_type v23 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
  int v22 = SHIBYTE(__s.__r_.__value_.__r.__words[2]);
  std::string::size_type size = __s.__r_.__value_.__l.__size_;
  if ((__s.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v24 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v24 = __s.__r_.__value_.__l.__size_;
  }
  if (v24) {
    goto LABEL_46;
  }
  char v34 = (void *)__s.__r_.__value_.__r.__words[0];
  memset(__p, 170, sizeof(__p));
  if ((v112.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    char v35 = &v112;
  }
  else {
    char v35 = (std::string *)v112.__r_.__value_.__r.__words[0];
  }
  BOOL v36 = realpath_DARWIN_EXTSN((const char *)v35, __p);
  if (v36)
  {
    char v37 = secLogObjForScope("staticCode");
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)__b = 136315138;
      *(void *)&__b[4] = __p;
      _os_log_debug_impl(&dword_18B299000, v37, OS_LOG_TYPE_DEBUG, "Checking resolved path for containment: %s", __b, 0xCu);
    }
    if (*(char *)(a2 + 23) < 0) {
      std::string::__init_copy_ctor_external(&v108, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
    }
    else {
      std::string v108 = *(std::string *)a2;
    }
    std::string::basic_string[abi:ne180100]<0>(v106, __p);
    Security::CodeSigning::pathRemaining((std::string *)__b, (uint64_t)&v108, (uint64_t *)v106);
    if (v22 < 0) {
      operator delete(v34);
    }
    std::string __s = *(std::string *)__b;
    __b[23] = 0;
    __b[0] = 0;
    if (v107 < 0) {
      operator delete(v106[0]);
    }
    if (SHIBYTE(v108.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v108.__r_.__value_.__l.__data_);
    }
    std::string::size_type v23 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
    std::string::size_type size = __s.__r_.__value_.__l.__size_;
    LOBYTE(v22) = *((unsigned char *)&__s.__r_.__value_.__s + 23);
  }
  if ((v22 & 0x80u) == 0) {
    std::string::size_type v40 = v23;
  }
  else {
    std::string::size_type v40 = size;
  }
  if (!v40)
  {
    v45 = (void *)__s.__r_.__value_.__r.__words[0];
    memset(__b, 170, sizeof(__b));
    v46 = (const char *)a2;
    if (*(char *)(a2 + 23) < 0) {
      v46 = *(const char **)a2;
    }
    if (realpath_DARWIN_EXTSN(v46, __b))
    {
      v47 = secLogObjForScope("staticCode");
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
        *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)__b;
        _os_log_debug_impl(&dword_18B299000, v47, OS_LOG_TYPE_DEBUG, "Checking resolved resource path for containment: %s", (uint8_t *)&buf, 0xCu);
      }
      std::string::basic_string[abi:ne180100]<0>(v104, __b);
      std::string::basic_string[abi:ne180100]<0>(v102, __p);
      Security::CodeSigning::pathRemaining(&buf, (uint64_t)v104, (uint64_t *)v102);
      if ((v22 & 0x80) != 0) {
        operator delete(v45);
      }
      std::string __s = buf;
      *((unsigned char *)&buf.__r_.__value_.__s + 23) = 0;
      buf.__r_.__value_.__s.__data_[0] = 0;
      if (v103 < 0) {
        operator delete(v102[0]);
      }
      if (v105 < 0) {
        operator delete(v104[0]);
      }
      std::string::size_type v23 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
      LOBYTE(v22) = *((unsigned char *)&__s.__r_.__value_.__s + 23);
      std::string::size_type size = __s.__r_.__value_.__l.__size_;
      if ((__s.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v48 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v48 = __s.__r_.__value_.__l.__size_;
      }
      if (v48)
      {
        std::string::__assign_external((std::string *)a2, __b);
        v49 = secLogObjForScope("staticCode");
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
        {
          std::string::size_type v50 = a2;
          if (*(char *)(a2 + 23) < 0) {
            std::string::size_type v50 = *(void *)a2;
          }
          LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
          *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = v50;
          _os_log_debug_impl(&dword_18B299000, v49, OS_LOG_TYPE_DEBUG, "Updated resource path: %s", (uint8_t *)&buf, 0xCu);
        }
      }
    }
  }
  if ((v22 & 0x80u) == 0) {
    std::string::size_type v41 = v23;
  }
  else {
    std::string::size_type v41 = size;
  }
  if (!v41)
  {
    v79 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
    {
      if (*(char *)(a2 + 23) < 0) {
        a2 = *(void *)a2;
      }
      v80 = &v112;
      if ((v112.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        v80 = (std::string *)v112.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)std::string __p = 136315394;
      *(void *)&__p[4] = a2;
      *(_WORD *)&__p[12] = 2080;
      *(void *)&__p[14] = v80;
      _os_log_impl(&dword_18B299000, v79, OS_LOG_TYPE_DEFAULT, "Requested resource was not within the code object: %s, %s", __p, 0x16u);
    }
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFFFFCELL);
  }
  int v25 = a3 | 2;
  if (v36)
  {
    memset(__p, 170, sizeof(__p));
    (*(void (**)(unsigned char *__return_ptr))(**((void **)a1 + 4) + 40))(__b);
    if (__b[23] >= 0) {
      v42 = __b;
    }
    else {
      v42 = *(const char **)__b;
    }
    uint64_t v43 = realpath_DARWIN_EXTSN(v42, __p);
    v44 = v43;
    if ((__b[23] & 0x80000000) != 0)
    {
      operator delete(*(void **)__b);
      if (!v44) {
        goto LABEL_124;
      }
    }
    else if (!v43)
    {
      goto LABEL_124;
    }
    v51 = (const char *)a2;
    if (*(char *)(a2 + 23) < 0) {
      v51 = *(const char **)a2;
    }
    if (!strcmp(__p, v51)) {
      goto LABEL_125;
    }
LABEL_124:
    int v52 = 1;
    goto LABEL_127;
  }
LABEL_47:
  (*(void (**)(unsigned char *__return_ptr))(**((void **)a1 + 4) + 40))(__p);
  if (__p[23] >= 0) {
    uint64_t v26 = __p[23];
  }
  else {
    uint64_t v26 = *(void *)&__p[8];
  }
  uint64_t v27 = *(unsigned __int8 *)(a2 + 23);
  int v28 = (char)v27;
  if ((v27 & 0x80u) != 0) {
    uint64_t v27 = *(void *)(a2 + 8);
  }
  if (v26 != v27)
  {
    if ((__p[23] & 0x80) != 0) {
      operator delete(*(void **)__p);
    }
    goto LABEL_124;
  }
  if (v28 >= 0) {
    uint64_t v29 = (unsigned __int8 *)a2;
  }
  else {
    uint64_t v29 = *(unsigned __int8 **)a2;
  }
  if ((__p[23] & 0x80) != 0)
  {
    int v38 = *(void **)__p;
    int v39 = memcmp(*(const void **)__p, v29, *(size_t *)&__p[8]);
    operator delete(v38);
    if (!v39) {
      goto LABEL_125;
    }
    goto LABEL_124;
  }
  if (__p[23])
  {
    uint64_t v30 = 0;
    do
    {
      int v31 = __p[v30];
      int v32 = v29[v30];
    }
    while (v31 == v32 && __p[23] - 1 != v30++);
    if (v31 != v32) {
      goto LABEL_124;
    }
  }
LABEL_125:
  int v52 = 0;
  if ((v25 & 0x20000) == 0) {
    v25 &= ~2u;
  }
LABEL_127:
  std::string::size_type v53 = v22;
  if ((v22 & 0x80u) != 0) {
    std::string::size_type v53 = size;
  }
  if (v53 == 10)
  {
    v54 = (v22 & 0x80u) == 0 ? &__s : (std::string *)__s.__r_.__value_.__r.__words[0];
    unint64_t v55 = 0x496E666F2E706C69;
    unint64_t v56 = bswap64(v54->__r_.__value_.__r.__words[0]);
    if (v56 == 0x496E666F2E706C69
      && (v56 = bswap32(LOWORD(v54->__r_.__value_.__r.__words[1])) >> 16, unint64_t v55 = 29556, v56 == 29556))
    {
      int v57 = 0;
    }
    else
    {
      int v57 = v56 < v55 ? -1 : 1;
    }
    if (!v57) {
      int v52 = 0;
    }
  }
  Security::CodeSigning::SecStaticCode::staticValidateCore((UInt8 *)a1, v25, 0);
  if (a4
    && !Security::CodeSigning::SecStaticCode::satisfiesRequirement((uint64_t)a1, *(Security::CodeSigning::Requirement **)(a4 + 16)))
  {
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA12);
  }
  if (v52)
  {
    if ((v25 & 0x4000) == 0 && Security::CodeSigning::itemQualifiesForResourceExemption((char *)a2, v58))
    {
      v59 = secLogObjForScope("staticCode");
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
      {
        if (*(char *)(a2 + 23) < 0) {
          a2 = *(void *)a2;
        }
        *(_DWORD *)std::string __p = 136315138;
        *(void *)&__p[4] = a2;
        _os_log_debug_impl(&dword_18B299000, v59, OS_LOG_TYPE_DEBUG, "Requested resource was on root filesystem: %s", __p, 0xCu);
      }
      goto LABEL_216;
    }
    memset(v101, 170, sizeof(v101));
    if (!Security::CodeSigning::SecStaticCode::loadResources(a1, (const __CFDictionary **)&v101[3], (const __CFDictionary **)&v101[1], v101))Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA10); {
    v100[0] = 0;
    }
    v100[1] = 0;
    v99 = v100;
    *(void *)&long long v60 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v60 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&__b[64] = v60;
    *(_OWORD *)&__b[80] = v60;
    *(_OWORD *)&__b[32] = v60;
    *(_OWORD *)&__b[48] = v60;
    *(_OWORD *)__b = v60;
    *(_OWORD *)&__b[16] = v60;
    Security::CodeSigning::ResourceBuilder::ResourceBuilder((std::string::size_type)__b, (uint64_t)&v112, (uint64_t)&v112, *(const void **)&v101[3], (v25 & 0x10) != 0, (uint64_t)&v99);
    (*(void (**)(void *, unsigned char *))(**((void **)a1 + 4) + 64))(*((void **)a1 + 4), __b);
    if ((v22 & 0x80) != 0) {
      std::string::__init_copy_ctor_external(&v98, __s.__r_.__value_.__l.__data_, size);
    }
    else {
      std::string v98 = __s;
    }
    uint64_t Rule = Security::CodeSigning::ResourceBuilder::findRule((uint64_t)__b, (uint64_t)&v98);
    uint64_t v62 = Rule;
    if (SHIBYTE(v98.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v98.__r_.__value_.__l.__data_);
      if (!v62) {
        goto LABEL_159;
      }
    }
    else if (!Rule)
    {
      goto LABEL_159;
    }
    if ((*(unsigned char *)(v62 + 36) & 0x12) != 0)
    {
      v81 = secLogObjForScope("SecError");
      if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
      {
        int v82 = *(_DWORD *)(v62 + 36);
        *(_DWORD *)std::string __p = 67109120;
        *(_DWORD *)&__p[4] = v82;
        _os_log_impl(&dword_18B299000, v81, OS_LOG_TYPE_DEFAULT, "Requested resource was not sealed: %d", __p, 8u);
      }
      Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA0FLL);
    }
LABEL_159:
    CFDictionaryRef v63 = *(const __CFDictionary **)&v101[1];
    if ((v22 & 0x80) != 0) {
      std::string::__init_copy_ctor_external(&v97, __s.__r_.__value_.__l.__data_, size);
    }
    else {
      std::string v97 = __s;
    }
    Security::CFTempString::CFTempString<std::string>((CFStringRef *)__p, (char *)&v97);
    Value = CFDictionaryGetValue(v63, *(const void **)__p);
    Security::CFRef<__CFString const*>::~CFRef((const void **)__p);
    if (SHIBYTE(v97.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v97.__r_.__value_.__l.__data_);
      if (Value) {
        goto LABEL_164;
      }
    }
    else if (Value)
    {
LABEL_164:
      v96 = (Security::UnixPlusPlus::FileDesc *)0xAAAAAAAAFFFFFFFFLL;
      if (*(char *)(a2 + 23) >= 0) {
        v65 = (const char *)a2;
      }
      else {
        v65 = *(const char **)a2;
      }
      Security::UnixPlusPlus::FileDesc::open((Security::UnixPlusPlus::FileDesc *)&v96, v65, 0x200000, 438);
      *(void *)&long long v66 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v66 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)&__p[112] = v66;
      *(_OWORD *)&__p[128] = v66;
      *(_OWORD *)&__p[80] = v66;
      *(_OWORD *)&__p[96] = v66;
      *(_OWORD *)&__p[48] = v66;
      *(_OWORD *)&__p[64] = v66;
      *(_OWORD *)&__p[16] = v66;
      *(_OWORD *)&__p[32] = v66;
      *(_OWORD *)std::string __p = v66;
      Security::UnixPlusPlus::FileDesc::fstat((Security::UnixPlusPlus::FileDesc *)v96, (stat *)__p);
      *(void *)&long long v67 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v67 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)std::string __p = v67;
      *(_OWORD *)&__p[16] = v67;
      Security::CodeSigning::ResourceSeal::ResourceSeal((Security::CodeSigning::ResourceSeal *)__p, Value);
      if ((__p[24] & 4) != 0)
      {
        buf.__r_.__value_.__r.__words[0] = 0;
        if (!SecRequirementCreateWithStringAndErrors(*(CFStringRef *)&__p[8], 0, 0, (SecRequirementRef *)&buf))
        {
          v95 = (Security::CodeSigning::SecStaticCode *)0xAAAAAAAAAAAAAAAALL;
          uint64_t v68 = Security::ModuleNexus<Security::CodeSigning::CFObjects>::operator()();
          Security::SecCFObject::allocate((Security::SecCFObject *)0x288, *(void *)(v68 + 200), v69);
          if (*(char *)(a2 + 23) >= 0) {
            v70 = (char *)a2;
          }
          else {
            v70 = *(char **)a2;
          }
          Security::CodeSigning::DiskRep::bestGuess(v70, 0);
        }
        Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA11);
      }
      buf.__r_.__value_.__r.__words[0] = (std::string::size_type)&unk_1ED84A2C8;
      buf.__r_.__value_.__l.__size_ = (std::string::size_type)a1;
      if ((v22 & 0x80) != 0) {
        std::string::__init_copy_ctor_external(&v94, __s.__r_.__value_.__l.__data_, size);
      }
      else {
        std::string v94 = __s;
      }
      Security::CodeSigning::SecStaticCode::validateResource((uint64_t)a1);
      if (SHIBYTE(v94.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v94.__r_.__value_.__l.__data_);
      }
      Security::CFRef<__CFDictionary const*>::~CFRef((const void **)__p);
      Security::UnixPlusPlus::FileDesc::closeAndLog((Security::UnixPlusPlus::FileDesc *)&v96);
LABEL_215:
      Security::CodeSigning::ResourceBuilder::~ResourceBuilder((Security::CodeSigning::ResourceBuilder *)__b);
      std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy(v100[0]);
      goto LABEL_216;
    }
    *(void *)std::string __p = 0;
    *(void *)&__p[8] = __p;
    *(void *)&__p[16] = 0x2000000000;
    __p[24] = 0;
    if ((v22 & 0x80) != 0) {
      std::string::__init_copy_ctor_external(&v93, __s.__r_.__value_.__l.__data_, size);
    }
    else {
      std::string v93 = __s;
    }
    v84[0] = MEMORY[0x1E4F143A8];
    v84[1] = 1174405120;
    v85 = ___ZN8Security11CodeSigning13SecStaticCode22staticValidateResourceENSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEjPKNS0_14SecRequirementE_block_invoke;
    v86 = &unk_1ED84CCF0;
    v88 = a1;
    CFDictionaryRef v89 = v63;
    v87 = __p;
    int v91 = v25;
    if (*(char *)(a2 + 23) < 0) {
      std::string::__init_copy_ctor_external(&v90, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
    }
    else {
      std::string v90 = *(std::string *)a2;
    }
    unsigned int v92 = v101[0];
    if ((v93.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v71 = HIBYTE(v93.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v71 = v93.__r_.__value_.__l.__size_;
    }
    while (1)
    {
      char v72 = HIBYTE(v93.__r_.__value_.__r.__words[2]);
      unint64_t v74 = v93.__r_.__value_.__l.__size_;
      v73 = (std::string *)v93.__r_.__value_.__r.__words[0];
      if ((v93.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      {
        v73 = &v93;
        unint64_t v74 = HIBYTE(v93.__r_.__value_.__r.__words[2]);
      }
      if (v74 > v71) {
        unint64_t v74 = v71 + 1;
      }
      do
      {
        if (!v74) {
          goto LABEL_205;
        }
        int v75 = v73->__r_.__value_.__s.__data_[--v74];
      }
      while (v75 != 47);
      std::string::size_type v71 = v74 - 1;
      if (v74 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        break;
      }
      if (SHIBYTE(v93.__r_.__value_.__r.__words[2]) < 0)
      {
        if (v93.__r_.__value_.__l.__size_ < v74) {
LABEL_238:
        }
          std::string::__throw_out_of_range[abi:ne180100]();
        v76 = (std::string *)v93.__r_.__value_.__r.__words[0];
        v93.__r_.__value_.__l.__size_ = v74;
      }
      else
      {
        if (v74 > HIBYTE(v93.__r_.__value_.__r.__words[2])) {
          goto LABEL_238;
        }
        *((unsigned char *)&v93.__r_.__value_.__s + 23) = v74 & 0x7F;
        v76 = &v93;
      }
      v76->__r_.__value_.__s.__data_[v74] = 0;
      if (SHIBYTE(v93.__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&buf, v93.__r_.__value_.__l.__data_, v93.__r_.__value_.__l.__size_);
      }
      else {
        std::string buf = v93;
      }
      int v77 = v85(v84, (uint64_t)&buf);
      int v78 = v77;
      if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(buf.__r_.__value_.__l.__data_);
        if (v78)
        {
LABEL_204:
          char v72 = HIBYTE(v93.__r_.__value_.__r.__words[2]);
          break;
        }
      }
      else if (v77)
      {
        goto LABEL_204;
      }
    }
LABEL_205:
    if (v72 < 0) {
      operator delete(v93.__r_.__value_.__l.__data_);
    }
    if (!*(unsigned char *)(*(void *)&__p[8] + 24))
    {
      v83 = secLogObjForScope("SecError");
      if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
      {
        if (*(char *)(a2 + 23) < 0) {
          a2 = *(void *)a2;
        }
        LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
        *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = a2;
        _os_log_impl(&dword_18B299000, v83, OS_LOG_TYPE_DEFAULT, "Requested resource was not found: %s", (uint8_t *)&buf, 0xCu);
      }
      Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA12);
    }
    if (SHIBYTE(v90.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v90.__r_.__value_.__l.__data_);
    }
    _Block_object_dispose(__p, 8);
    goto LABEL_215;
  }
LABEL_216:
  if ((v22 & 0x80) != 0) {
    operator delete(__s.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v112.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v112.__r_.__value_.__l.__data_);
  }
}

void sub_18B3F7370(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,uint64_t a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,__int16 a32,void *a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,void *a46,uint64_t a47,uint64_t a48,void *a49,uint64_t a50,uint64_t a51,void *a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,void *a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  Security::CFRef<__CFDictionary const*>::~CFRef((const void **)&STACK[0x610]);
  Security::UnixPlusPlus::FileDesc::closeAndLog((Security::UnixPlusPlus::FileDesc *)&a32);
  Security::CodeSigning::ResourceBuilder::~ResourceBuilder((Security::CodeSigning::ResourceBuilder *)&STACK[0x210]);
  std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy((void *)a41);
  if (v71 < 0) {
    operator delete(__p);
  }
  if (SLOBYTE(STACK[0x207]) < 0) {
    operator delete(a71);
  }
  _Unwind_Resume(a1);
}

uint64_t ___ZN8Security11CodeSigning13SecStaticCode22staticValidateResourceENSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEjPKNS0_14SecRequirementE_block_invoke(void *a1, uint64_t a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (Security::CodeSigning::SecStaticCode *)a1[5];
  CFDictionaryRef v5 = (const __CFDictionary *)a1[6];
  if (*(char *)(a2 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v20, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else {
    std::string v20 = *(std::string *)a2;
  }
  Security::CFTempString::CFTempString<std::string>((CFStringRef *)key, (char *)&v20);
  Value = CFDictionaryGetValue(v5, key[0]);
  Security::CFRef<__CFString const*>::~CFRef((const void **)key);
  if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v20.__r_.__value_.__l.__data_);
    if (Value)
    {
LABEL_6:
      *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 1;
      CFURLRef CFURL = (const __CFURL *)0xAAAAAAAAAAAAAAAALL;
      uint64_t v7 = Security::CodeSigning::SecStaticCode::resourceBase(v4);
      if (*(char *)(a2 + 23) >= 0) {
        uint64_t v9 = (Security *)a2;
      }
      else {
        uint64_t v9 = *(Security **)a2;
      }
      CFURLRef CFURL = Security::makeCFURL(v9, 0, v7, v8);
      memset(v18, 170, sizeof(v18));
      Security::cfString((Security *)v18, CFURL);
      *(void *)&long long v10 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)text = v10;
      long long v17 = v10;
      Security::CodeSigning::ResourceSeal::ResourceSeal((Security::CodeSigning::ResourceSeal *)text, Value);
      if ((BYTE8(v17) & 4) != 0)
      {
        key[0] = 0;
        if (!SecRequirementCreateWithStringAndErrors(text[1], 0, 0, (SecRequirementRef *)key))
        {
          uint64_t v11 = Security::ModuleNexus<Security::CodeSigning::CFObjects>::operator()();
          Security::SecCFObject::allocate((Security::SecCFObject *)0x288, *(void *)(v11 + 200), v12);
          if (SHIBYTE(v18[2]) >= 0) {
            int v13 = (char *)v18;
          }
          else {
            int v13 = (char *)v18[0];
          }
          Security::CodeSigning::DiskRep::bestGuess(v13, 0);
        }
        Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA11);
      }
      if ((void)v17) {
        operator new();
      }
      id v15 = secLogObjForScope("SecError");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(key[0]) = 138412290;
        *(void **)((char *)key + 4) = (void *)Value;
        _os_log_impl(&dword_18B299000, v15, OS_LOG_TYPE_DEFAULT, "Unexpected item hit traversing resource: %@", (uint8_t *)key, 0xCu);
      }
      Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA12);
    }
  }
  else if (Value)
  {
    goto LABEL_6;
  }
  return 0;
}

void sub_18B3F79BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,char a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30,uint64_t a31,int a32,__int16 a33,char a34,char a35,char a36,void *a37,uint64_t a38,int a39,__int16 a40,char a41,char a42,uint64_t a43,char a44)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void __destroy_helper_block_e8_56c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(uint64_t a1)
{
  if (*(char *)(a1 + 79) < 0) {
    operator delete(*(void **)(a1 + 56));
  }
}

void __copy_helper_block_e8_56c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = (std::string *)(a1 + 56);
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

BOOL Security::CodeSigning::Requirement::validates(Security::CodeSigning::Requirement *this, Security::CodeSigning::CodeDirectory **a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = *((_DWORD *)this + 2);
  unsigned int v4 = bswap32(v3);
  if (v4 == 2)
  {
    if (v3 == 0x2000000)
    {
      *(void *)std::string buf = this;
      unint64_t v11 = 0xAAAAAAAA0000000CLL;
      unint64_t v8 = 0;
      size_t size = 0;
      Security::CodeSigning::Requirement::Reader::getData((Security::CodeSigning::Requirement::Reader *)buf, (const void **)&size, &v8);
      CFDataCreate(0, (const UInt8 *)size, v8);
      MEMORY[0x18C12E850]();
      CFDictionaryRef v5 = [MEMORY[0x1E4F1CA60] dictionary];
      uint64_t v6 = os_variant_allows_internal_security_policies();
      bindAndAddBoolFact(v5, "apple-internal", v6);
      Security::CodeSigning::CodeDirectory::cdhash(a2[6]);
    }
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA14);
  }
  if (v4 != 1) {
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA15);
  }
  *(void *)std::string buf = this;
  LODWORD(v11) = 12;
  uint64_t v12 = a2;
  return Security::CodeSigning::Requirement::Interpreter::eval((Security::CodeSigning::Requirement::Interpreter *)buf, 1000) != 0;
}

void sub_18B3F8104(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);

  Security::CFRef<__CFData const*>::~CFRef((const void **)va);
  _Unwind_Resume(a1);
}

const void *Security::CodeSigning::Requirement::Context::cert(CFArrayRef *this, int a2)
{
  CFArrayRef v3 = *this;
  if (!v3) {
    return 0;
  }
  int v4 = a2;
  if (a2 < 0)
  {
    int v4 = CFArrayGetCount(v3) + a2;
    CFArrayRef v3 = *this;
  }
  if (CFArrayGetCount(v3) <= v4) {
    return 0;
  }
  uint64_t result = CFArrayGetValueAtIndex(*this, v4);
  if (!result) {
    return 0;
  }
  return result;
}

CFHashCode Security::CodeSigning::SecRequirement::hash(const UInt8 **this)
{
  CFDataRef v3 = CFDataCreateWithBytesNoCopy(0, this[2], bswap32(*((_DWORD *)this[2] + 1)), (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
  CFHashCode v1 = CFHash(v3);
  Security::CFRef<__CFData const*>::~CFRef((const void **)&v3);
  return v1;
}

void sub_18B3F827C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  Security::CFRef<__CFData const*>::~CFRef((const void **)va);
  _Unwind_Resume(a1);
}

BOOL Security::CodeSigning::SecRequirement::equal(const void **this, const void **a2)
{
  return memcmp(this[2], a2[2], bswap32(*((_DWORD *)this[2] + 1))) == 0;
}

void Security::CodeSigning::SecRequirement::~SecRequirement(void **this)
{
  *this = &unk_1ED84A4D8;
  free(this[2]);

  Security::SecCFObject::operator delete((char *)this);
}

{
  *this = &unk_1ED84A4D8;
  free(this[2]);
}

void *Security::CodeSigning::SecRequirement::SecRequirement(void *a1, unsigned int *a2, char a3)
{
  a1[1] = 1;
  *a1 = &unk_1ED84A4D8;
  a1[2] = 0;
  unsigned int v3 = bswap32(a2[1]);
  if (*a2 != 843514 || v3 <= 0xB)
  {
    *__error() = 22;
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA14);
  }
  if ((a3 & 1) == 0) {
    a2 = Security::Blob<Security::CodeSigning::Requirement,4208856064u>::clone((Security::BlobCore *)a2);
  }
  a1[2] = a2;
  return a1;
}

uint64_t Security::RefPointer<Security::LoadableBundle>::~RefPointer(uint64_t a1)
{
  unsigned int v2 = (pthread_mutex_t *)(a1 + 8);
  v5[0] = a1 + 8;
  v5[1] = 0xAAAAAAAAAAAAAA01;
  unsigned int v3 = (Security::UnixError *)pthread_mutex_lock((pthread_mutex_t *)(a1 + 8));
  if (v3) {
    Security::UnixError::throwMe(v3);
  }
  Security::RefPointer<Security::LoadableBundle>::release_internal(a1);
  Security::StLock<Security::Mutex,&Security::Mutex::lock,&Security::Mutex::unlock>::~StLock((uint64_t)v5);
  Security::Mutex::~Mutex(v2);
  return a1;
}

void sub_18B3F8460(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t Security::RefPointer<Security::LoadableBundle>::release_internal(uint64_t result)
{
  if (*(void *)result
    && atomic_fetch_add_explicit((atomic_uint *volatile)(*(void *)result + 8), 0xFFFFFFFF, memory_order_relaxed) == 1)
  {
    CFHashCode v1 = (void *)result;
    uint64_t result = *(void *)result;
    if (result) {
      uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 8))(result);
    }
    *CFHashCode v1 = 0;
  }
  return result;
}

uint64_t Security::ModuleNexus<Security::CodeSigning::PluginHost>::operator()()
{
  if (!Security::CodeSigning::plugin) {
    Security::CodeSigning::plugin = Security::ModuleNexusCommon::create((Security::ModuleNexusCommon *)&Security::CodeSigning::plugin, (void *(*)(void))Security::ModuleNexus<Security::CodeSigning::PluginHost>::make);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1E9132EC8);
  return Security::CodeSigning::plugin;
}

void sub_18B3F8550(void *a1)
{
}

void sub_18B3F8568(_Unwind_Exception *a1)
{
}

void Security::ModuleNexus<Security::CodeSigning::PluginHost>::make()
{
  uint64_t v0 = *MEMORY[0x1E4F143B8];
  operator new();
}

void sub_18B3F8890(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, const void *a15, const void *a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20)
{
  if (*(char *)(v21 + 63) < 0) {
    operator delete(*v23);
  }
  if (*(char *)(v21 + 39) < 0) {
    operator delete(*v22);
  }
  if (a14 < 0) {
    operator delete(__p);
  }
  MEMORY[0x18C12D390](v21, 0x10B3C40C4AD4AC1);
  Security::CFRef<__CFURL const*>::~CFRef(&a15);
  Security::CFRef<__CFURL const*>::~CFRef(&a16);
  Security::RefPointer<Security::LoadableBundle>::~RefPointer(v20);
  MEMORY[0x18C12D390](v20, 0x1020C40482925CDLL);
  _Unwind_Resume(a1);
}

std::string *Security::CodeSigning::Dumper::print(Security::CodeSigning::Dumper *this, const char *__format, ...)
{
  va_start(va, __format);
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v20 = v3;
  long long v21 = v3;
  long long v18 = v3;
  long long v19 = v3;
  long long v16 = v3;
  long long v17 = v3;
  long long v14 = v3;
  long long v15 = v3;
  long long v12 = v3;
  long long v13 = v3;
  long long v10 = v3;
  long long v11 = v3;
  long long v8 = v3;
  long long v9 = v3;
  *(_OWORD *)__str = v3;
  long long v7 = v3;
  vsnprintf(__str, 0x100uLL, __format, va);
  std::string::size_type v4 = strlen(__str);
  return std::string::append((std::string *)((char *)this + 16), __str, v4);
}

std::string *Security::CodeSigning::Dumper::expr(uint64_t a1, int a2)
{
  while (2)
  {
    if (*(unsigned char *)(a1 + 40)) {
      Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, "/*@0x%x*/", *(_DWORD *)(a1 + 8));
    }
    int v4 = Security::CodeSigning::Requirement::Reader::get<unsigned int>((unsigned int *)a1);
    LODWORD(v5) = 0;
    uint64_t v6 = "! ";
    switch(v4 & 0xFFFFFF)
    {
      case 0:
        long long v8 = "never";
        goto LABEL_48;
      case 1:
        long long v8 = "always";
        goto LABEL_48;
      case 2:
        Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, "identifier ");
        goto LABEL_37;
      case 3:
        long long v8 = "anchor apple";
        goto LABEL_48;
      case 4:
        Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, "certificate");
        Security::CodeSigning::Dumper::certSlot((Security::CodeSigning::Dumper *)a1);
        Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, " = ");
        goto LABEL_23;
      case 5:
        if (*(unsigned char *)(a1 + 40)) {
          Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, "/*legacy*/");
        }
        Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, "info[");
        Security::CodeSigning::Dumper::data((Security::CodeSigning::Requirement::Reader *)a1, 1);
        Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, "] = ");
        goto LABEL_37;
      case 6:
        if (a2 > 0)
        {
          uint64_t v5 = 1;
          uint64_t v6 = " and ";
LABEL_8:
          Security::CodeSigning::Dumper::expr(a1, v5);
LABEL_9:
          Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, v6);
          a2 = v5;
          continue;
        }
        Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, "(");
        Security::CodeSigning::Dumper::expr(a1, 1);
        Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, " and ");
        uint64_t v9 = a1;
        uint64_t v10 = 1;
LABEL_46:
        Security::CodeSigning::Dumper::expr(v9, v10);
LABEL_47:
        long long v8 = ")";
LABEL_48:
        return Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, v8);
      case 7:
        if (a2 <= 1)
        {
          Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, "(");
          Security::CodeSigning::Dumper::expr(a1, 2);
          Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, " or ");
          uint64_t v9 = a1;
          uint64_t v10 = 2;
          goto LABEL_46;
        }
        uint64_t v5 = 2;
        uint64_t v6 = " or ";
        goto LABEL_8;
      case 8:
        Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, "cdhash ");
LABEL_23:
        return Security::CodeSigning::Dumper::hashData((Security::CodeSigning::Dumper *)a1);
      case 9:
        goto LABEL_9;
      case 0xA:
        Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, "info[");
        goto LABEL_32;
      case 0xB:
        Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, "certificate");
        Security::CodeSigning::Dumper::certSlot((Security::CodeSigning::Dumper *)a1);
        Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, "[");
        goto LABEL_32;
      case 0xC:
        Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, "certificate");
        Security::CodeSigning::Dumper::certSlot((Security::CodeSigning::Dumper *)a1);
        long long v8 = "trusted";
        goto LABEL_48;
      case 0xD:
        long long v8 = "anchor trusted";
        goto LABEL_48;
      case 0xE:
      case 0x11:
      case 0x16:
        Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, "certificate");
        Security::CodeSigning::Dumper::certSlot((Security::CodeSigning::Dumper *)a1);
        Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, "[");
        goto LABEL_33;
      case 0xF:
        long long v8 = "anchor apple generic";
        goto LABEL_48;
      case 0x10:
        Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, "entitlement[");
LABEL_32:
        Security::CodeSigning::Dumper::data((Security::CodeSigning::Requirement::Reader *)a1, 1);
LABEL_33:
        Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, "]");
        return Security::CodeSigning::Dumper::match((Security::CodeSigning::Dumper *)a1);
      case 0x12:
        Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, "anchor apple ");
LABEL_37:
        return Security::CodeSigning::Dumper::data((Security::CodeSigning::Requirement::Reader *)a1, 0);
      case 0x13:
        Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, "(");
        Security::CodeSigning::Dumper::data((Security::CodeSigning::Requirement::Reader *)a1, 0);
        goto LABEL_47;
      case 0x14:
        Security::CodeSigning::Requirement::Reader::get<unsigned int>((unsigned int *)a1);
        return Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, "platform = %d");
      case 0x15:
        long long v8 = "notarized";
        goto LABEL_48;
      case 0x17:
        long long v8 = "legacy";
        goto LABEL_48;
      default:
        if (v4 < 0) {
          return Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, " false /* opcode %d */");
        }
        if ((v4 & 0x40000000) != 0) {
          return Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, " /* opcode %d */");
        }
        return Security::CodeSigning::Dumper::print((Security::CodeSigning::Dumper *)a1, "OPCODE %d NOT UNDERSTOOD (ending print)");
    }
  }
}

uint64_t Security::CodeSigning::Requirement::Reader::get<unsigned int>(unsigned int *a1)
{
  uint64_t v1 = a1[2];
  uint64_t v2 = *(void *)a1;
  if (v1 + 4 > (unint64_t)bswap32(*(_DWORD *)(*(void *)a1 + 4))) {
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA14);
  }
  a1[2] = v1 + 4;
  return bswap32(*(_DWORD *)(v2 + v1));
}

std::string *Security::CodeSigning::Dumper::data(Security::CodeSigning::Requirement::Reader *a1, int a2)
{
  unint64_t v32 = 0xAAAAAAAAAAAAAAAALL;
  v33 = (void *)0xAAAAAAAAAAAAAAAALL;
  Security::CodeSigning::Requirement::Reader::getData(a1, (const void **)&v33, &v32);
  unint64_t v5 = v32;
  int v4 = (unsigned __int8 *)v33;
  if (v32)
  {
    uint64_t v6 = 0;
    int v7 = 0;
    unsigned int v8 = 1;
    uint64_t v9 = MEMORY[0x1E4F14390];
    while (1)
    {
      uint64_t v10 = v4[v6];
      if ((char)v4[v6] < 0)
      {
        if (__maskrune(v10, 0x500uLL)) {
          goto LABEL_15;
        }
      }
      else if ((*(_DWORD *)(v9 + 4 * v10 + 60) & 0x500) != 0)
      {
        goto LABEL_15;
      }
      uint64_t v11 = v4[v6];
      if (v11 == 46 && a2 != 0)
      {
LABEL_15:
        if (v8 == 1 && (*(_DWORD *)(v9 + 4 * v4[v6] + 60) & 0x400) != 0) {
          int v7 = 1;
        }
        goto LABEL_24;
      }
      if ((v11 & 0x80) != 0)
      {
        if (!__maskrune(v11, 0x800uLL))
        {
LABEL_19:
          uint64_t v13 = v4[v6];
          if ((char)v4[v6] < 0)
          {
            if (!__maskrune(v13, 0x4000uLL))
            {
LABEL_52:
              Security::CodeSigning::Dumper::print(a1, "0x");
              uint64_t v29 = 0;
              unsigned int v30 = 1;
              do
              {
                uint64_t result = Security::CodeSigning::Dumper::print(a1, "%02.2x", v4[v29]);
                uint64_t v29 = v30;
                BOOL v14 = v5 > v30++;
              }
              while (v14);
              return result;
            }
          }
          else if ((*(_DWORD *)(v9 + 4 * v13 + 60) & 0x4000) == 0)
          {
            goto LABEL_52;
          }
        }
      }
      else if ((*(_DWORD *)(v9 + 4 * v11 + 60) & 0x800) == 0)
      {
        goto LABEL_19;
      }
      int v7 = 1;
LABEL_24:
      uint64_t v6 = v8;
      BOOL v14 = v5 > v8++;
      if (!v14)
      {
        size_t v15 = v5;
        if (!v7) {
          goto LABEL_28;
        }
        Security::CodeSigning::Dumper::print(a1, "\"", v5);
        goto LABEL_43;
      }
    }
  }
  size_t v15 = 0;
LABEL_28:
  memset(__dst, 170, sizeof(__dst));
  long long v16 = __dst;
  std::string::basic_string[abi:ne180100](__dst, v4, v15);
  int v17 = SHIBYTE(__dst[2]);
  long long v18 = (void *)__dst[0];
  if (__dst[2] >= 0) {
    size_t v19 = HIBYTE(__dst[2]);
  }
  else {
    size_t v19 = __dst[1];
  }
  if (__dst[2] < 0) {
    long long v16 = (void *)__dst[0];
  }
  long long v20 = "guest";
  long long v21 = off_1E5485770;
  while (v19 != strlen(v20) || memcmp(v16, v20, v19))
  {
    uint64_t v22 = *v21++;
    long long v20 = v22;
    if (!v22)
    {
      int v23 = 1;
      if ((v17 & 0x80000000) == 0) {
        goto LABEL_38;
      }
LABEL_41:
      operator delete(v18);
      if (!v23) {
        goto LABEL_42;
      }
      return Security::CodeSigning::Dumper::print(a1, "%.*s");
    }
  }
  int v23 = 0;
  if (v17 < 0) {
    goto LABEL_41;
  }
LABEL_38:
  if (v23) {
    return Security::CodeSigning::Dumper::print(a1, "%.*s");
  }
LABEL_42:
  Security::CodeSigning::Dumper::print(a1, "\"");
  if (v5)
  {
LABEL_43:
    uint64_t v25 = 0;
    unsigned int v26 = 1;
    do
    {
      int v27 = v4[v25];
      if (v27 == 34 || v27 == 92) {
        Security::CodeSigning::Dumper::print(a1, "\\%c");
      }
      else {
        Security::CodeSigning::Dumper::print(a1, "%c");
      }
      uint64_t v25 = v26;
      BOOL v14 = v5 > v26++;
    }
    while (v14);
  }
  return Security::CodeSigning::Dumper::print(a1, "\"");
}

std::string *Security::CodeSigning::Dumper::certSlot(Security::CodeSigning::Dumper *this)
{
  int v2 = Security::CodeSigning::Requirement::Reader::get<unsigned int>((unsigned int *)this);
  if (v2)
  {
    if (v2 != -1) {
      return Security::CodeSigning::Dumper::print(this, " %d", v2);
    }
    long long v3 = " root";
  }
  else
  {
    long long v3 = " leaf";
  }

  return Security::CodeSigning::Dumper::print(this, v3);
}

std::string *Security::CodeSigning::Dumper::hashData(Security::CodeSigning::Dumper *this)
{
  Security::CodeSigning::Dumper::print(this, "H\"");
  unint64_t v8 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v9 = (void *)0xAAAAAAAAAAAAAAAALL;
  Security::CodeSigning::Requirement::Reader::getData(this, (const void **)&v9, &v8);
  unint64_t v2 = v8;
  if (v8)
  {
    uint64_t v3 = 0;
    int v4 = (unsigned __int8 *)v9;
    unsigned int v5 = 1;
    do
    {
      Security::CodeSigning::Dumper::print(this, "%02.2x", v4[v3]);
      uint64_t v3 = v5;
    }
    while (v2 > v5++);
  }

  return Security::CodeSigning::Dumper::print(this, "\"");
}

std::string *Security::CodeSigning::Dumper::match(Security::CodeSigning::Dumper *this)
{
  int v2 = Security::CodeSigning::Requirement::Reader::get<unsigned int>((unsigned int *)this);
  switch(v2)
  {
    case 0:
      uint64_t v3 = " /* exists */";
      goto LABEL_24;
    case 1:
      Security::CodeSigning::Dumper::print(this, " = ");
      goto LABEL_12;
    case 2:
      Security::CodeSigning::Dumper::print(this, " ~ ");
      goto LABEL_12;
    case 3:
      Security::CodeSigning::Dumper::print(this, " = ");
      Security::CodeSigning::Dumper::data(this, 0);
      uint64_t v3 = "*";
      goto LABEL_24;
    case 4:
      Security::CodeSigning::Dumper::print(this, " = *");
      goto LABEL_12;
    case 5:
      Security::CodeSigning::Dumper::print(this, " < ");
      goto LABEL_12;
    case 6:
      Security::CodeSigning::Dumper::print(this, " > ");
      goto LABEL_12;
    case 7:
      Security::CodeSigning::Dumper::print(this, " <= ");
      goto LABEL_12;
    case 8:
      Security::CodeSigning::Dumper::print(this, " >= ");
LABEL_12:
      return Security::CodeSigning::Dumper::data(this, 0);
    case 9:
      Security::CodeSigning::Dumper::print(this, " = ");
      goto LABEL_20;
    case 10:
      Security::CodeSigning::Dumper::print(this, " < ");
      goto LABEL_20;
    case 11:
      Security::CodeSigning::Dumper::print(this, " > ");
      goto LABEL_20;
    case 12:
      Security::CodeSigning::Dumper::print(this, " <= ");
      goto LABEL_20;
    case 13:
      Security::CodeSigning::Dumper::print(this, " >= ");
LABEL_20:
      uint64_t result = (std::string *)Security::CodeSigning::Dumper::timestamp(this);
      break;
    case 14:
      uint64_t v3 = " absent ";
LABEL_24:
      uint64_t result = Security::CodeSigning::Dumper::print(this, v3);
      break;
    default:
      uint64_t result = Security::CodeSigning::Dumper::print(this, "MATCH OPCODE %d NOT UNDERSTOOD", v2);
      break;
  }
  return result;
}

const void **Security::CodeSigning::Dumper::timestamp(Security::CodeSigning::Dumper *this)
{
  int64_t v2 = Security::CodeSigning::Requirement::Reader::get<long long>((unsigned int *)this);
  CFDateRef v7 = CFDateCreate(0, (double)v2);
  CFStringRef v6 = CFCopyDescription(v7);
  Security::cfString(&__p, v6);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  Security::CodeSigning::Dumper::print(this, "<%s>", (const char *)p_p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  Security::CFRef<__CFString const*>::~CFRef((const void **)&v6);
  return Security::CFRef<__CFDate const*>::~CFRef((const void **)&v7);
}

void sub_18B3F958C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, const void *a16)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  Security::CFRef<__CFString const*>::~CFRef(&a16);
  Security::CFRef<__CFDate const*>::~CFRef((const void **)(v16 - 24));
  _Unwind_Resume(a1);
}

unint64_t Security::CodeSigning::Requirement::Reader::get<long long>(unsigned int *a1)
{
  uint64_t v1 = a1[2];
  uint64_t v2 = *(void *)a1;
  if (v1 + 8 > (unint64_t)bswap32(*(_DWORD *)(*(void *)a1 + 4))) {
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA14);
  }
  a1[2] = v1 + 8;
  return bswap64(*(void *)(v2 + v1));
}

void Security::CodeSigning::Dumper::dump(std::string *a1, uint64_t a2)
{
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)std::string __p = v2;
  unint64_t v8 = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&__p[16] = v2;
  uint64_t v6 = a2;
  *(_DWORD *)std::string __p = 12;
  if (bswap32(*(_DWORD *)(a2 + 8)) - 1 >= 2) {
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA15);
  }
  memset(&__p[8], 0, 24);
  LOBYTE(v8) = 0;
  Security::CodeSigning::Dumper::expr((uint64_t)&v6, 3);
  char v4 = __p[31];
  unsigned int v5 = *(unsigned char **)&__p[8];
  if (__p[31] >= 0) {
    unsigned int v5 = &__p[8];
  }
  if (*v5 == 32)
  {
    std::string::basic_string(&v9, (const std::string *)&__p[8], 1uLL, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v10);
    if ((__p[31] & 0x80000000) != 0) {
      operator delete(*(void **)&__p[8]);
    }
    *(std::string *)&__p[8] = v9;
    char v4 = HIBYTE(v9.__r_.__value_.__r.__words[2]);
  }
  if (v4 < 0)
  {
    std::string::__init_copy_ctor_external(a1, *(const std::string::value_type **)&__p[8], *(std::string::size_type *)&__p[16]);
    if ((__p[31] & 0x80000000) != 0) {
      operator delete(*(void **)&__p[8]);
    }
  }
  else
  {
    *(_OWORD *)&a1->__r_.__value_.__l.__data_ = *(_OWORD *)&__p[8];
    a1->__r_.__value_.__r.__words[2] = *(void *)&__p[24];
  }
}

uint64_t Security::CodeSigning::SecCodeSignerRemote::valid(Security::CodeSigning::SecCodeSignerRemote *this)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  CFArrayRef v2 = (const __CFArray *)*((void *)this + 41);
  if (v2)
  {
    CFIndex Count = CFArrayGetCount(v2);
    if (Count >= 1)
    {
      CFIndex v4 = Count;
      BOOL v5 = 0;
      for (i = 0; i != v4; BOOL v5 = i >= v4)
      {
        CFDataRef ValueAtIndex = CFArrayGetValueAtIndex(*((CFArrayRef *)this + 41), i);
        CFTypeID TypeID = SecCertificateGetTypeID();
        if (TypeID != CFGetTypeID(ValueAtIndex)) {
          break;
        }
        ++i;
      }
      if (v5) {
        return 1;
      }
    }
  }
  char v10 = secLogObjForScope("SecError");
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  uint64_t result = 0;
  if (v11)
  {
    uint64_t v12 = *((void *)this + 41);
    int v13 = 134218242;
    BOOL v14 = this;
    __int16 v15 = 2112;
    uint64_t v16 = v12;
    _os_log_impl(&dword_18B299000, v10, OS_LOG_TYPE_DEFAULT, "Invalid remote signing operation: %p, %@", (uint8_t *)&v13, 0x16u);
    return 0;
  }
  return result;
}

void Security::CodeSigning::SecCodeSignerRemote::~SecCodeSignerRemote(const void **this)
{
  *this = &unk_1ED84A580;
  Security::CFRef<__CFArray const*>::~CFRef(this + 41);
  Security::CodeSigning::SecCodeSigner::~SecCodeSigner((Security::CodeSigning::SecCodeSigner *)this);

  Security::SecCFObject::operator delete(v2);
}

{
  uint64_t vars8;

  *this = &unk_1ED84A580;
  Security::CFRef<__CFArray const*>::~CFRef(this + 41);

  Security::CodeSigning::SecCodeSigner::~SecCodeSigner((Security::CodeSigning::SecCodeSigner *)this);
}

uint64_t Security::CodeSigning::Requirement::Interpreter::eval(Security::CodeSigning::Requirement::Interpreter *this, int a2)
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  if (a2 < 2) {
LABEL_132:
  }
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA14);
  unsigned int v2 = a2;
  int v4 = 0;
  while (2)
  {
    unsigned int v5 = v2;
LABEL_4:
    unsigned int v2 = v5 - 1;
    CC_LONG v6 = Security::CodeSigning::Requirement::Reader::get<unsigned int>((unsigned int *)this);
    CC_LONG v7 = v6;
    switch(v6 & 0xFFFFFF)
    {
      case 0u:
        goto LABEL_92;
      case 1u:
        LODWORD(v13) = 1;
        return (v4 ^ v13) & 1;
      case 2u:
        if (!*(void *)(*((void *)this + 2) + 48)) {
          goto LABEL_92;
        }
        Security::CodeSigning::Requirement::Reader::getString((Security::CodeSigning::Requirement::Reader *)&c, this);
        uint64_t v29 = (const void *)(bswap32(*(_DWORD *)(*(void *)(*((void *)this + 2) + 48) + 20))
                           + *(void *)(*((void *)this + 2) + 48));
        int Nl_high = SHIBYTE(c.Nl);
        if ((c.Nl & 0x80000000) == 0) {
          size_t v13 = HIBYTE(c.Nl);
        }
        else {
          size_t v13 = *(void *)&c.h2;
        }
        if (v13 == strlen((const char *)v29))
        {
          if ((c.Nl & 0x80000000) == 0) {
            p_CC_SHA1_CTX c = &c;
          }
          else {
            p_CC_SHA1_CTX c = *(CC_SHA1_CTX **)&c.h0;
          }
          LODWORD(v13) = memcmp(p_c, v29, v13) == 0;
        }
        else
        {
          LODWORD(v13) = 0;
        }
        if (Nl_high < 0) {
          goto LABEL_49;
        }
        return (v4 ^ v13) & 1;
      case 3u:
        Security::CodeSigning::CodeDirectory::cdhash(*(Security::CodeSigning::CodeDirectory **)(*((void *)this + 2)
                                                                                              + 48));
      case 4u:
        BOOL v11 = (CFArrayRef *)*((void *)this + 2);
        int v12 = Security::CodeSigning::Requirement::Reader::get<unsigned int>((unsigned int *)this);
        size_t v13 = (size_t)Security::CodeSigning::Requirement::Context::cert(v11, v12);
        *(void *)&c.h0 = 0xAAAAAAAAAAAAAAAALL;
        *(void *)md = 0xAAAAAAAAAAAAAAAALL;
        Security::CodeSigning::Requirement::Reader::getData(this, (const void **)&c, (unint64_t *)md);
        if (*(void *)md != 20) {
          goto LABEL_132;
        }
        if (!v13) {
          return (v4 ^ v13) & 1;
        }
        uint64_t v14 = *(void *)&c.h0;
        *(void *)&long long v15 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)&c.data[9] = v15;
        *(_OWORD *)&c.data[13] = v15;
        *(_OWORD *)&c.data[1] = v15;
        *(_OWORD *)&c.data[5] = v15;
        *(_OWORD *)&c.h0 = v15;
        *(_OWORD *)&c.h4 = v15;
        CC_SHA1_Init(&c);
        CC_SHA1_Update(&c, *(const void **)(v13 + 16), *(_DWORD *)(v13 + 24));
        memset(md, 170, 20);
        CC_SHA1_Final(md, &c);
        BOOL v17 = *(void *)md == *(void *)v14
           && *(void *)&md[8] == *(void *)(v14 + 8)
           && *(unsigned int *)&md[16] == (unint64_t)*(unsigned int *)(v14 + 16);
        goto LABEL_76;
      case 5u:
        memset(&c, 170, 24);
        Security::CodeSigning::Requirement::Reader::getString((Security::CodeSigning::Requirement::Reader *)&c, this);
        Security::CodeSigning::Requirement::Reader::getString((Security::CodeSigning::Requirement::Reader *)__p, this);
        Security::CFTempString::CFTempString<std::string>((CFStringRef *)cf1, (char *)__p);
        Security::CFCopyRef<void const*>::CFCopyRef(md, cf1[0]);
        *(_DWORD *)&md[8] = 1;
        LODWORD(v13) = Security::CodeSigning::Requirement::Interpreter::infoKeyValue(*(const __CFDictionary **)(*((void *)this + 2) + 8), (uint64_t)&c, (uint64_t)md);
        Security::CFRef<void const*>::~CFRef((const void **)md);
        Security::CFRef<__CFString const*>::~CFRef(cf1);
        if (v76 < 0) {
          operator delete(__p[0]);
        }
        goto LABEL_48;
      case 6u:
        int v23 = Security::CodeSigning::Requirement::Interpreter::eval(this, v5 - 1);
        LODWORD(v13) = v23 & Security::CodeSigning::Requirement::Interpreter::eval(this, v5 - 1);
        return (v4 ^ v13) & 1;
      case 7u:
        int v22 = Security::CodeSigning::Requirement::Interpreter::eval(this, v5 - 1);
        LODWORD(v13) = v22 | Security::CodeSigning::Requirement::Interpreter::eval(this, v5 - 1);
        return (v4 ^ v13) & 1;
      case 8u:
        long long v21 = *(Security::CodeSigning::CodeDirectory **)(*((void *)this + 2) + 48);
        if (v21) {
          Security::CodeSigning::CodeDirectory::cdhash(v21);
        }
        goto LABEL_92;
      case 9u:
        v4 ^= 1u;
        if (v5 < 3) {
          goto LABEL_132;
        }
        continue;
      case 0xAu:
        memset(&c, 170, 24);
        Security::CodeSigning::Requirement::Reader::getString((Security::CodeSigning::Requirement::Reader *)&c, this);
        memset(md, 170, 16);
        Security::CodeSigning::Requirement::Interpreter::Match::Match((Security::CodeSigning::Requirement::Interpreter::Match *)md, this);
        LODWORD(v13) = Security::CodeSigning::Requirement::Interpreter::infoKeyValue(*(const __CFDictionary **)(*((void *)this + 2) + 8), (uint64_t)&c, (uint64_t)md);
        Security::CFRef<void const*>::~CFRef((const void **)md);
        goto LABEL_48;
      case 0xBu:
        unsigned int v26 = (CFArrayRef *)*((void *)this + 2);
        int v27 = Security::CodeSigning::Requirement::Reader::get<unsigned int>((unsigned int *)this);
        Security::CodeSigning::Requirement::Context::cert(v26, v27);
        memset(&c, 170, 24);
        Security::CodeSigning::Requirement::Reader::getString((Security::CodeSigning::Requirement::Reader *)&c, this);
        memset(md, 170, 16);
        Security::CodeSigning::Requirement::Interpreter::Match::Match((Security::CodeSigning::Requirement::Interpreter::Match *)md, this);
        Security::CFRef<void const*>::~CFRef((const void **)md);
        if (SHIBYTE(c.Nl) < 0) {
          operator delete(*(void **)&c.h0);
        }
        goto LABEL_92;
      case 0xCu:
        int v33 = Security::CodeSigning::Requirement::Reader::get<unsigned int>((unsigned int *)this);
        if (Security::CodeSigning::Requirement::Context::cert(*((CFArrayRef **)this + 2), v33))
        {
          CFArrayRef v34 = (const __CFArray *)**((void **)this + 2);
          if (v34) {
            CFArrayGetCount(v34);
          }
        }
        goto LABEL_92;
      case 0xDu:
        CFArrayRef v35 = (const __CFArray *)**((void **)this + 2);
        if (!v35) {
          goto LABEL_92;
        }
        int v36 = CFArrayGetCount(v35) - 1;
        if (v36 < 0) {
          goto LABEL_92;
        }
        int v37 = 0;
        do
        {
          LODWORD(v13) = 0;
          if (Security::CodeSigning::Requirement::Context::cert(*((CFArrayRef **)this + 2), v37)) {
            BOOL v38 = v36 == v37;
          }
          else {
            BOOL v38 = 1;
          }
          ++v37;
        }
        while (!v38);
        return (v4 ^ v13) & 1;
      case 0xFu:
        LODWORD(v13) = Security::CodeSigning::Requirement::Interpreter::appleAnchored(*((CFArrayRef **)this + 2));
        return (v4 ^ v13) & 1;
      case 0x10u:
        memset(md, 170, sizeof(md));
        Security::CodeSigning::Requirement::Reader::getString((Security::CodeSigning::Requirement::Reader *)md, this);
        cf1[0] = (CFTypeRef)0xAAAAAAAAAAAAAAAALL;
        cf1[1] = (CFTypeRef)0xAAAAAAAAAAAAAAAALL;
        Security::CodeSigning::Requirement::Interpreter::Match::Match((Security::CodeSigning::Requirement::Interpreter::Match *)cf1, this);
        CFDictionaryRef v18 = *(const __CFDictionary **)(*((void *)this + 2) + 16);
        if (!v18) {
          goto LABEL_98;
        }
        if ((char)md[23] < 0)
        {
          std::string::__init_copy_ctor_external((std::string *)&c, *(const std::string::value_type **)md, *(std::string::size_type *)&md[8]);
        }
        else
        {
          *(_OWORD *)&c.h0 = *(_OWORD *)md;
          *(void *)&c.h4 = *(void *)&md[16];
        }
        Security::CFTempString::CFTempString<std::string>((CFStringRef *)&key, (char *)&c);
        CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v18, key);
        Security::CFRef<__CFString const*>::~CFRef((const void **)&key);
        if (SHIBYTE(c.Nl) < 0) {
          operator delete(*(void **)&c.h0);
        }
        if (Value) {
          int v59 = Security::CodeSigning::Requirement::Interpreter::Match::operator()((uint64_t)cf1, Value);
        }
        else {
LABEL_98:
        }
          int v59 = Security::CodeSigning::Requirement::Interpreter::Match::operator()((uint64_t)cf1, (const __CFString *)*MEMORY[0x1E4F1D260]);
        LODWORD(v13) = v59;
        Security::CFRef<void const*>::~CFRef(cf1);
        if (((char)md[23] & 0x80000000) == 0) {
          return (v4 ^ v13) & 1;
        }
        unint64_t v32 = *(void **)md;
        goto LABEL_50;
      case 0x12u:
        uint64_t v24 = Security::ModuleNexus<Security::CodeSigning::Fragments>::operator()();
        Security::CodeSigning::Requirement::Reader::getString((Security::CodeSigning::Requirement::Reader *)&c, this);
        int v25 = Security::CodeSigning::Fragments::evalNamed(v24, "anchorreq", (uint64_t)&c, *((const Security::CodeSigning::Requirement::Context **)this + 2));
        goto LABEL_36;
      case 0x13u:
        uint64_t v28 = Security::ModuleNexus<Security::CodeSigning::Fragments>::operator()();
        Security::CodeSigning::Requirement::Reader::getString((Security::CodeSigning::Requirement::Reader *)&c, this);
        int v25 = Security::CodeSigning::Fragments::evalNamed(v28, "subreq", (uint64_t)&c, *((const Security::CodeSigning::Requirement::Context **)this + 2));
LABEL_36:
        LODWORD(v13) = v25;
LABEL_48:
        if (SHIBYTE(c.Nl) < 0)
        {
LABEL_49:
          unint64_t v32 = *(void **)&c.h0;
LABEL_50:
          operator delete(v32);
        }
        return (v4 ^ v13) & 1;
      case 0x14u:
        int v46 = Security::CodeSigning::Requirement::Reader::get<unsigned int>((unsigned int *)this);
        uint64_t v47 = *(void *)(*((void *)this + 2) + 48);
        if (!v47) {
          goto LABEL_92;
        }
        BOOL v17 = v46 == *(unsigned __int8 *)(v47 + 38);
LABEL_76:
        LODWORD(v13) = v17;
        return (v4 ^ v13) & 1;
      case 0x15u:
        uint64_t v19 = *((void *)this + 2);
        *(void *)md = 0;
        cf1[0] = 0;
        if (v19)
        {
          long long v20 = *(Security::CodeSigning::CodeDirectory **)(v19 + 48);
          if (v20) {
            Security::CodeSigning::CodeDirectory::cdhash(v20);
          }
          uint64_t v54 = *(void *)(v19 + 56);
          if (v54)
          {
            CFRetain(*(CFTypeRef *)(v19 + 56));
            *(void *)md = v54;
            CC_LONG v55 = *(_DWORD *)(v19 + 64);
            unint64_t v56 = secLogObjForScope("notarization");
            if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
            {
              c.h0 = 67109378;
              c.h1 = v55;
              LOWORD(c.h2) = 2112;
              *(void *)((char *)&c.h2 + 2) = v54;
              _os_log_debug_impl(&dword_18B299000, v56, OS_LOG_TYPE_DEBUG, "checking notarization on %d, %@", (uint8_t *)&c, 0x12u);
            }
          }
        }
        int v57 = secLogObjForScope("notarization");
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
        {
          c.h0 = 67109120;
          c.h1 = 0;
          _os_log_debug_impl(&dword_18B299000, v57, OS_LOG_TYPE_DEBUG, "isNotarized = %d", (uint8_t *)&c, 8u);
        }
        Security::CFRef<__CFError *>::~CFRef(cf1);
        Security::CFRef<__CFData const*>::~CFRef((const void **)md);
LABEL_92:
        LODWORD(v13) = 0;
        return (v4 ^ v13) & 1;
      case 0x17u:
        uint64_t v39 = *((void *)this + 2);
        key = 0;
        *(void *)md = 0;
        cf1[0] = 0;
        CFAbsoluteTime at = 0.0;
        if (!v39) {
          goto LABEL_127;
        }
        std::string::size_type v40 = Security::CodeSigning::Requirement::Context::cert((CFArrayRef *)v39, 0);
        cf1[0] = 0;
        if (SecCertificateGetDeveloperIDDate((uint64_t)v40, &at, (__CFString **)cf1))
        {
          CFDateRef otherDate = (CFDateRef)0xAAAAAAAAAAAAAAAALL;
          CFDateRef v41 = CFDateCreate(0, at);
          CFDateRef v77 = (const __CFDate *)0xAAAAAAAAAAAAAAAALL;
          CFDateRef otherDate = v41;
          CFDateRef v77 = Security::CodeSigning::copyCutOffDate(@"AccountCreationCutOffDate", v42, 576374400.0);
          uint64_t v43 = secLogObjForScope("meetsDeveloperIDLegacyAllowedPolicy");
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
          {
            c.h0 = 138412290;
            *(void *)&c.h1 = v77;
            _os_log_debug_impl(&dword_18B299000, v43, OS_LOG_TYPE_DEBUG, "Account Creation Date Cutoff: %@", (uint8_t *)&c, 0xCu);
          }
          v44 = secLogObjForScope("meetsDeveloperIDLegacyAllowedPolicy");
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
          {
            c.h0 = 138412290;
            *(void *)&c.h1 = otherDate;
            _os_log_debug_impl(&dword_18B299000, v44, OS_LOG_TYPE_DEBUG, "Account Creation date: %@", (uint8_t *)&c, 0xCu);
          }
          if ((CFDateCompare(otherDate, v77, 0) & 0x8000000000000000) == 0)
          {
            v45 = secLogObjForScope("meetsDeveloperIDLegacyAllowedPolicy");
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
            {
              c.h0 = 138412546;
              *(void *)&c.h1 = otherDate;
              LOWORD(c.h3) = 2112;
              *(void *)((char *)&c.h3 + 2) = v77;
              _os_log_debug_impl(&dword_18B299000, v45, OS_LOG_TYPE_DEBUG, "Account creation date %@ is after cut-off %@", (uint8_t *)&c, 0x16u);
            }
            Security::CFRef<__CFDate const*>::~CFRef((const void **)&v77);
            Security::CFRef<__CFDate const*>::~CFRef((const void **)&otherDate);
            goto LABEL_127;
          }
          Security::CFRef<__CFDate const*>::~CFRef((const void **)&v77);
          Security::CFRef<__CFDate const*>::~CFRef((const void **)&otherDate);
        }
        else
        {
          CFIndex Code = CFErrorGetCode((CFErrorRef)cf1[0]);
          if (Code != -67880)
          {
            std::string::size_type v50 = secLogObjForScope("SecError");
            LODWORD(v13) = 0;
            if (!os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_128;
            }
            c.h0 = 134217984;
            *(void *)&c.h1 = Code;
            v51 = "Unexpected error checking account creation date: %ld";
            int v52 = v50;
            uint32_t v53 = 12;
            goto LABEL_126;
          }
        }
        if (*(void *)(v39 + 72))
        {
          CFDateRef otherDate = (CFDateRef)0xAAAAAAAAAAAAAAAALL;
          CFDateRef otherDate = Security::CodeSigning::copyCutOffDate(@"SecureTimestampCutOffDate", v48, 581040000.0);
          long long v60 = secLogObjForScope("meetsDeveloperIDLegacyAllowedPolicy");
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
          {
            c.h0 = 138412290;
            *(void *)&c.h1 = otherDate;
            _os_log_debug_impl(&dword_18B299000, v60, OS_LOG_TYPE_DEBUG, "Secure Timestamp Cutoff Date cutoff: %@", (uint8_t *)&c, 0xCu);
          }
          v61 = secLogObjForScope("meetsDevleoperIDLegacyAllowedPolicy");
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v71 = *(void *)(v39 + 72);
            c.h0 = 138412290;
            *(void *)&c.h1 = v71;
            _os_log_debug_impl(&dword_18B299000, v61, OS_LOG_TYPE_DEBUG, "Secure Timestamp: %@", (uint8_t *)&c, 0xCu);
          }
          if (CFDateCompare(*(CFDateRef *)(v39 + 72), otherDate, 0) < 0)
          {
            Security::CFRef<__CFDate const*>::~CFRef((const void **)&otherDate);
            LODWORD(v13) = 1;
            goto LABEL_128;
          }
          uint64_t v62 = secLogObjForScope("meetsDeveloperIDLegacyAllowedPolicy");
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v72 = *(void *)(v39 + 72);
            c.h0 = 138412546;
            *(void *)&c.h1 = v72;
            LOWORD(c.h3) = 2112;
            *(void *)((char *)&c.h3 + 2) = otherDate;
            _os_log_debug_impl(&dword_18B299000, v62, OS_LOG_TYPE_DEBUG, "Secure timestamp %@ is after cut-off %@", (uint8_t *)&c, 0x16u);
          }
          Security::CFRef<__CFDate const*>::~CFRef((const void **)&otherDate);
        }
        CFDictionaryRef v63 = *(Security::CodeSigning::CodeDirectory **)(v39 + 48);
        if (v63) {
          Security::CodeSigning::CodeDirectory::cdhash(v63);
        }
        uint64_t v64 = *(void *)(v39 + 56);
        if (v64)
        {
          CFRetain(*(CFTypeRef *)(v39 + 56));
          if (*(void *)md) {
            CFRelease(*(CFTypeRef *)md);
          }
          *(void *)md = v64;
          CC_LONG v65 = *(_DWORD *)(v39 + 64);
        }
        else
        {
          CC_LONG v65 = 0;
          LODWORD(v13) = *(_DWORD *)md;
          if (!*(void *)md) {
            goto LABEL_128;
          }
        }
        long long v66 = *(const char **)(v39 + 80);
        if (v66)
        {
          long long v67 = (__CFString *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v66, 0x8000100u);
          if (key) {
            CFRelease(key);
          }
          key = v67;
        }
        uint64_t v68 = secLogObjForScope("legacy_list");
        LODWORD(v13) = 0;
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
        {
          c.h0 = 67109634;
          c.h1 = v65;
          LOWORD(c.h2) = 2112;
          *(void *)((char *)&c.h2 + 2) = *(void *)md;
          HIWORD(c.h4) = 2112;
          *(void *)&c.Nl = key;
          v51 = "checking the legacy list for %d, %@, %@";
          int v52 = v68;
          uint32_t v53 = 28;
LABEL_126:
          _os_log_impl(&dword_18B299000, v52, OS_LOG_TYPE_DEFAULT, v51, (uint8_t *)&c, v53);
LABEL_127:
          LODWORD(v13) = 0;
        }
LABEL_128:
        v69 = secLogObjForScope("legacy_list");
        if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
        {
          c.h0 = 67109120;
          c.h1 = v13;
          _os_log_impl(&dword_18B299000, v69, OS_LOG_TYPE_DEFAULT, "meetsDeveloperIDLegacyAllowedPolicy = %d", (uint8_t *)&c, 8u);
        }
        Security::CFRef<__CFString const*>::~CFRef((const void **)&key);
        Security::CFRef<__CFError *>::~CFRef(cf1);
        Security::CFRef<__CFData const*>::~CFRef((const void **)md);
        return (v4 ^ v13) & 1;
      default:
        if (!(v6 >> 30))
        {
          v73 = secLogObjForScope("csinterp");
          if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
          {
            c.h0 = 67109120;
            c.h1 = v7;
            _os_log_debug_impl(&dword_18B299000, v73, OS_LOG_TYPE_DEBUG, "opcode 0x%x cannot be handled; aborting",
              (uint8_t *)&c,
              8u);
          }
          Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA00);
        }
        unsigned int v8 = Security::CodeSigning::Requirement::Reader::get<unsigned int>((unsigned int *)this);
        uint64_t v9 = *((unsigned int *)this + 2);
        if (v9 + (unint64_t)v8 > bswap32(*(_DWORD *)(*(void *)this + 4))) {
          goto LABEL_132;
        }
        *((_DWORD *)this + 2) = v9 + v8;
        if ((v7 & 0x80000000) != 0)
        {
          LODWORD(v13) = 0;
          return (v4 ^ v13) & 1;
        }
        if (v5-- < 3) {
          goto LABEL_132;
        }
        goto LABEL_4;
    }
  }
}

void sub_18B3FA7F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, char a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,int a26,__int16 a27,char a28,char a29,void *__p,uint64_t a31,int a32,__int16 a33,char a34,char a35)
{
}

BOOL Security::CodeSigning::Requirement::Interpreter::appleAnchored(CFArrayRef *this)
{
  uint64_t v1 = Security::CodeSigning::Requirement::Context::cert(this, -1);
  if (!v1) {
    return 0;
  }
  unsigned int v2 = v1;
  if (os_variant_allows_internal_security_policies()) {
    goto LABEL_6;
  }
  if (SecAreQARootCertificatesEnabled_onceToken != -1) {
    dispatch_once(&SecAreQARootCertificatesEnabled_onceToken, &__block_literal_global_15275);
  }
  if (SecAreQARootCertificatesEnabled_sQACertsEnabled)
  {
LABEL_6:
    uint64_t v3 = v2;
    char v4 = 3;
  }
  else
  {
    uint64_t v3 = v2;
    char v4 = 0;
  }
  return (SecIsAppleTrustAnchor(v3, v4) & 1) != 0;
}

uint64_t Security::CodeSigning::Requirement::Interpreter::infoKeyValue(const __CFDictionary *a1, uint64_t a2, uint64_t a3)
{
  if (!a1) {
    goto LABEL_9;
  }
  if (*(char *)(a2 + 23) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else {
    std::string __p = *(std::string *)a2;
  }
  Security::CFTempString::CFTempString<std::string>((CFStringRef *)&key, (char *)&__p);
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(a1, key);
  Security::CFRef<__CFString const*>::~CFRef((const void **)&key);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if (Value) {
      goto LABEL_7;
    }
LABEL_9:
    CFStringRef v7 = (const __CFString *)*MEMORY[0x1E4F1D260];
    uint64_t v6 = a3;
    return Security::CodeSigning::Requirement::Interpreter::Match::operator()(v6, v7);
  }
  if (!Value) {
    goto LABEL_9;
  }
LABEL_7:
  uint64_t v6 = a3;
  CFStringRef v7 = Value;
  return Security::CodeSigning::Requirement::Interpreter::Match::operator()(v6, v7);
}

void sub_18B3FAAF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, const void *a15)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

Security::CodeSigning::Requirement::Interpreter::Match *Security::CodeSigning::Requirement::Interpreter::Match::Match(Security::CodeSigning::Requirement::Interpreter::Match *this, Security::CodeSigning::Requirement::Interpreter *a2)
{
  *(void *)this = 0;
  uint64_t v3 = *((unsigned int *)a2 + 2);
  uint64_t v4 = *(void *)a2;
  if (v3 + 4 > (unint64_t)bswap32(*(_DWORD *)(*(void *)a2 + 4))) {
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA14);
  }
  *((_DWORD *)a2 + 2) = v3 + 4;
  unsigned int v5 = bswap32(*(_DWORD *)(v4 + v3));
  *((_DWORD *)this + 2) = v5;
  if (v5 > 0xE)
  {
    Security::CodeSigning::Requirement::Reader::getString((Security::CodeSigning::Requirement::Reader *)&v13, a2);
    if ((v14 & 0x80000000) == 0) {
      return this;
    }
    BOOL v11 = v13;
    goto LABEL_19;
  }
  int v6 = 1 << v5;
  if ((v6 & 0x1FE) == 0)
  {
    if ((v6 & 0x3E00) != 0)
    {
      int64_t v8 = Security::CodeSigning::Requirement::Reader::get<long long>((unsigned int *)a2);
      CFDateRef v9 = CFDateCreate(0, (double)v8);
      if (*(void *)this) {
        CFRelease(*(CFTypeRef *)this);
      }
      *(void *)this = v9;
    }
    return this;
  }
  Security::CodeSigning::Requirement::Reader::getString((Security::CodeSigning::Requirement::Reader *)cStr, a2);
  if (v16 < 0)
  {
    CFStringRef v7 = *(char **)cStr;
    if (!*(void *)cStr)
    {
      CFStringRef v10 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    CFStringRef v7 = cStr;
  }
  CFStringRef v10 = CFStringCreateWithCString(0, v7, 0x8000100u);
  if (!v10)
  {
    CFStringRef v10 = CFStringCreateWithCString(0, v7, 0x600u);
    if (!v10) {
      Security::CFError::throwMe(0);
    }
  }
LABEL_15:
  if (*(void *)this) {
    CFRelease(*(CFTypeRef *)this);
  }
  *(void *)this = v10;
  if (v16 < 0)
  {
    BOOL v11 = *(char **)cStr;
LABEL_19:
    operator delete(v11);
  }
  return this;
}

void sub_18B3FAC80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  Security::CFRef<void const*>::~CFRef(v17);
  _Unwind_Resume(a1);
}

uint64_t Security::ModuleNexus<Security::CodeSigning::Fragments>::operator()()
{
  if (!Security::CodeSigning::fragments) {
    Security::CodeSigning::fragments = Security::ModuleNexusCommon::create((Security::ModuleNexusCommon *)&Security::CodeSigning::fragments, (void *(*)(void))Security::ModuleNexus<Security::CodeSigning::Fragments>::make);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1E9133690);
  return Security::CodeSigning::fragments;
}

void sub_18B3FAD18(void *a1)
{
}

void sub_18B3FAD30(_Unwind_Exception *a1)
{
}

uint64_t Security::CodeSigning::Fragments::evalNamed(uint64_t a1, const char *a2, uint64_t a3, const Security::CodeSigning::Requirement::Context *a4)
{
  if (*(char *)(a3 + 23) >= 0) {
    size_t v8 = *(unsigned __int8 *)(a3 + 23);
  }
  else {
    size_t v8 = *(void *)(a3 + 8);
  }
  memset(&v46, 170, sizeof(v46));
  CFDateRef v9 = &v46;
  std::string::basic_string[abi:ne180100]((uint64_t)&v46, v8 + 2);
  if ((v46.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    CFDateRef v9 = (std::string *)v46.__r_.__value_.__r.__words[0];
  }
  if (v8)
  {
    if (*(char *)(a3 + 23) >= 0) {
      CFStringRef v10 = (const std::string::value_type *)a3;
    }
    else {
      CFStringRef v10 = *(const std::string::value_type **)a3;
    }
    memmove(v9, v10, v8);
  }
  strcpy((char *)v9 + v8, "!!");
  std::string::size_type v11 = strlen(a2);
  int v12 = std::string::append(&v46, a2, v11);
  std::string __p = *v12;
  v12->__r_.__value_.__l.__size_ = 0;
  v12->__r_.__value_.__r.__words[2] = 0;
  v12->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v46.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v46.__r_.__value_.__l.__data_);
  }
  uint64_t v43 = a1 + 8;
  unint64_t v44 = 0xAAAAAAAAAAAAAAAALL;
  size_t v13 = (Security::UnixError *)pthread_mutex_lock((pthread_mutex_t *)(a1 + 8));
  if (v13) {
    Security::UnixError::throwMe(v13);
  }
  LOBYTE(v44) = 1;
  long long v15 = (uint64_t **)(a1 + 80);
  char v14 = *(void **)(a1 + 80);
  if (v14)
  {
    char v16 = (uint64_t **)(a1 + 80);
    do
    {
      char v17 = std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v14 + 4, &__p);
      if (v17 >= 0) {
        CFDictionaryRef v18 = v14;
      }
      else {
        CFDictionaryRef v18 = v14 + 1;
      }
      if (v17 >= 0) {
        char v16 = (uint64_t **)v14;
      }
      char v14 = (void *)*v18;
    }
    while (*v18);
    if (v16 != v15
      && (std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&__p, v16 + 4) & 0x80) == 0)
    {
      CFDataRef v19 = (const __CFData *)v16[7];
      goto LABEL_58;
    }
  }
  CFDateRef v41 = (__CFURL *)0xAAAAAAAAAAAAAAAALL;
  CFDataRef theData = 0;
  long long v20 = *(__CFBundle **)a1;
  if (*(char *)(a3 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v40, *(const std::string::value_type **)a3, *(void *)(a3 + 8));
  }
  else {
    std::string v40 = *(std::string *)a3;
  }
  Security::CFTempString::CFTempString<std::string>((CFStringRef *)&v46, (char *)&v40);
  CFStringRef v21 = (const __CFString *)v46.__r_.__value_.__r.__words[0];
  Security::CFTempString::CFTempString<char const*>(&subDirName, a2);
  CFDateRef v41 = CFBundleCopyResourceURL(v20, v21, @"csreq", subDirName);
  Security::CFRef<__CFString const*>::~CFRef((const void **)&subDirName);
  Security::CFRef<__CFString const*>::~CFRef((const void **)&v46.__r_.__value_.__l.__data_);
  if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v40.__r_.__value_.__l.__data_);
  }
  if (v41)
  {
    CFStringRef subDirName = (CFStringRef)0xAAAAAAAAAAAAAAAALL;
    CFStringRef File = (const __CFString *)Security::cfLoadFile(v41, v22);
    CFStringRef subDirName = File;
    if (File)
    {
      BytePtr = CFDataGetBytePtr((CFDataRef)File);
      unint64_t Length = CFDataGetLength((CFDataRef)subDirName);
      if (Length >= 0xC)
      {
        if (*(_DWORD *)BytePtr == 843514 && (unsigned int v26 = bswap32(*((_DWORD *)BytePtr + 1)), v26 > 0xB))
        {
          if (Length == v26)
          {
            Security::CFRef<__CFData const*>::operator=((CFTypeRef *)&theData, (CFTypeRef *)&subDirName);
            goto LABEL_43;
          }
        }
        else
        {
          *__error() = 22;
        }
      }
      Security::cfString((Security *)&v46, v41);
      if ((v46.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        uint64_t v28 = &v46;
      }
      else {
        uint64_t v28 = (std::string *)v46.__r_.__value_.__r.__words[0];
      }
      Security::Syslog::warning((Security::Syslog *)"Invalid sub-requirement at %s", v27, v28);
      if (SHIBYTE(v46.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v46.__r_.__value_.__l.__data_);
      }
    }
LABEL_43:
    Security::CFRef<__CFData const*>::~CFRef((const void **)&subDirName);
  }
  Security::CFRef<__CFURL const*>::~CFRef((const void **)&v41);
  uint64_t v29 = *v15;
  unsigned int v30 = (uint64_t **)(a1 + 80);
  int v31 = (uint64_t **)(a1 + 80);
  if (*v15)
  {
    while (1)
    {
      while (1)
      {
        unsigned int v30 = (uint64_t **)v29;
        unint64_t v32 = v29 + 4;
        if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&__p, v29 + 4) & 0x80) == 0) {
          break;
        }
        uint64_t v29 = *v30;
        int v31 = v30;
        if (!*v30) {
          goto LABEL_50;
        }
      }
      if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v32, &__p) & 0x80) == 0) {
        break;
      }
      int v31 = v30 + 1;
      uint64_t v29 = v30[1];
      if (!v29) {
        goto LABEL_50;
      }
    }
    int v33 = (char *)v30;
  }
  else
  {
LABEL_50:
    v46.__r_.__value_.__r.__words[2] = 0xAAAAAAAAAAAAAAAALL;
    int v33 = (char *)operator new(0x40uLL);
    v46.__r_.__value_.__r.__words[0] = (std::string::size_type)v33;
    v46.__r_.__value_.__l.__size_ = a1 + 80;
    v46.__r_.__value_.__s.__data_[16] = 0;
    CFArrayRef v34 = (std::string *)(v33 + 32);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::__init_copy_ctor_external(v34, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
    }
    else
    {
      *(_OWORD *)&v34->__r_.__value_.__l.__data_ = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
      *((void *)v33 + 6) = *((void *)&__p.__r_.__value_.__l + 2);
    }
    *((void *)v33 + 7) = 0;
    v46.__r_.__value_.__s.__data_[16] = 1;
    *(void *)int v33 = 0;
    *((void *)v33 + 1) = 0;
    *((void *)v33 + 2) = v30;
    *int v31 = (uint64_t *)v33;
    uint64_t v35 = **(void **)(a1 + 72);
    int v36 = (uint64_t *)v33;
    if (v35)
    {
      *(void *)(a1 + 72) = v35;
      int v36 = *v31;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*(uint64_t **)(a1 + 80), v36);
    ++*(void *)(a1 + 88);
    v46.__r_.__value_.__r.__words[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<std::string,Security::CFRef<__CFData const*>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,Security::CFRef<__CFData const*>>,void *>>>>::reset[abi:ne180100]((uint64_t)&v46);
  }
  Security::CFRef<__CFData const*>::operator=((CFTypeRef *)v33 + 7, (CFTypeRef *)&theData);
  CFDataRef v19 = theData;
  Security::CFRef<__CFData const*>::~CFRef((const void **)&theData);
LABEL_58:
  Security::StLock<Security::Mutex,&Security::Mutex::lock,&Security::Mutex::unlock>::~StLock((uint64_t)&v43);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if (v19) {
      goto LABEL_60;
    }
    return 0;
  }
  if (!v19) {
    return 0;
  }
LABEL_60:
  int v37 = (Security::CodeSigning::Requirement *)CFDataGetBytePtr(v19);

  return Security::CodeSigning::Requirement::validates(v37, a4, -67050);
}

void sub_18B3FB1D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, char a18, int a19, const void *a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  std::unique_ptr<std::__tree_node<std::__value_type<std::string,Security::CFRef<__CFData const*>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,Security::CFRef<__CFData const*>>,void *>>>>::reset[abi:ne180100](v30 - 88);
  Security::CFRef<__CFData const*>::~CFRef(&a20);
  Security::StLock<Security::Mutex,&Security::Mutex::lock,&Security::Mutex::unlock>::~StLock((uint64_t)&a21);
  if (a30 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void std::unique_ptr<std::__tree_node<std::__value_type<std::string,Security::CFRef<__CFData const*>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,Security::CFRef<__CFData const*>>,void *>>>>::reset[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  *(void *)a1 = 0;
  if (v1)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,Security::CFRef<__CFData const*>>,0>((uint64_t)v1 + 32);
    }
    operator delete(v1);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,Security::CFRef<__CFData const*>>,0>(uint64_t a1)
{
  Security::CFRef<__CFData const*>::~CFRef((const void **)(a1 + 24));
  if (*(char *)(a1 + 23) < 0)
  {
    unsigned int v2 = *(void **)a1;
    operator delete(v2);
  }
}

void Security::ModuleNexus<Security::CodeSigning::Fragments>::make()
{
}

void sub_18B3FB3B0(_Unwind_Exception *a1)
{
  MEMORY[0x18C12D390](v1, 0x1020C4000DB49F0);
  _Unwind_Resume(a1);
}

uint64_t Security::CodeSigning::Requirement::Interpreter::Match::operator()(uint64_t a1, const __CFString *a2)
{
  if (!a2) {
    return 0;
  }
  if ((const __CFString *)*MEMORY[0x1E4F1D260] == a2)
  {
    return *(_DWORD *)(a1 + 8) == 14;
  }
  else
  {
    CFTypeID v4 = CFGetTypeID(a2);
    if (v4 == CFArrayGetTypeID() && (CFIndex Count = CFArrayGetCount((CFArrayRef)a2), Count >= 1))
    {
      CFIndex v6 = Count;
      CFIndex v7 = 0;
      while (1)
      {
        CFDataRef ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a2, v7);
        if (Security::CodeSigning::Requirement::Interpreter::Match::operator()(a1, ValueAtIndex)) {
          return 1;
        }
        if (v6 == ++v7) {
          goto LABEL_8;
        }
      }
    }
    else
    {
LABEL_8:
      switch(*(_DWORD *)(a1 + 8))
      {
        case 0:
          return CFEqual(a2, (CFTypeRef)*MEMORY[0x1E4F1CFC8]) == 0;
        case 1:
          return CFEqual(a2, *(CFTypeRef *)a1) != 0;
        case 2:
          CFTypeID v15 = CFGetTypeID(*(CFTypeRef *)a1);
          if (v15 != CFStringGetTypeID()) {
            return 0;
          }
          CFTypeID v16 = CFGetTypeID(a2);
          if (v16 != CFStringGetTypeID()) {
            return 0;
          }
          CFStringRef v17 = (const __CFString *)Security::CodeSigning::Requirement::Interpreter::Match::cfStringValue((CFTypeRef *)a1);
          v18.length = CFStringGetLength(a2);
          CFStringRef v19 = a2;
          CFStringRef v20 = v17;
          goto LABEL_29;
        case 3:
          CFTypeID v26 = CFGetTypeID(*(CFTypeRef *)a1);
          if (v26 != CFStringGetTypeID()) {
            return 0;
          }
          CFTypeID v27 = CFGetTypeID(a2);
          if (v27 != CFStringGetTypeID()) {
            return 0;
          }
          CFStringRef v28 = (const __CFString *)Security::CodeSigning::Requirement::Interpreter::Match::cfStringValue((CFTypeRef *)a1);
          CFStringRef v29 = (const __CFString *)Security::CodeSigning::Requirement::Interpreter::Match::cfStringValue((CFTypeRef *)a1);
          v18.length = CFStringGetLength(v29);
          CFStringRef v19 = a2;
          CFStringRef v20 = v28;
LABEL_29:
          v18.location = 0;
          return CFStringFindWithOptions(v19, v20, v18, 0, 0) != 0;
        case 4:
          CFTypeID v21 = CFGetTypeID(*(CFTypeRef *)a1);
          if (v21 != CFStringGetTypeID()) {
            return 0;
          }
          CFTypeID v22 = CFGetTypeID(a2);
          if (v22 != CFStringGetTypeID()) {
            return 0;
          }
          CFStringRef v23 = (const __CFString *)Security::CodeSigning::Requirement::Interpreter::Match::cfStringValue((CFTypeRef *)a1);
          CFIndex Length = CFStringGetLength(v23);
          CFIndex v25 = CFStringGetLength(a2) - Length;
          if (v25 < 0) {
            return 0;
          }
          CFStringRef v20 = (const __CFString *)Security::CodeSigning::Requirement::Interpreter::Match::cfStringValue((CFTypeRef *)a1);
          CFStringRef v19 = a2;
          v18.location = v25;
          v18.length = Length;
          return CFStringFindWithOptions(v19, v20, v18, 0, 0) != 0;
        case 5:
          uint64_t v30 = (CFTypeRef *)a1;
          CFStringRef v31 = a2;
          uint64_t v32 = -1;
          goto LABEL_36;
        case 6:
          uint64_t v30 = (CFTypeRef *)a1;
          CFStringRef v31 = a2;
          uint64_t v32 = 1;
LABEL_36:
          CFComparisonResult v33 = kCFCompareGreaterThan;
          goto LABEL_40;
        case 7:
          uint64_t v30 = (CFTypeRef *)a1;
          CFStringRef v31 = a2;
          uint64_t v32 = 1;
          goto LABEL_39;
        case 8:
          uint64_t v30 = (CFTypeRef *)a1;
          CFStringRef v31 = a2;
          uint64_t v32 = -1;
LABEL_39:
          CFComparisonResult v33 = kCFCompareEqualTo;
LABEL_40:
          uint64_t result = Security::CodeSigning::Requirement::Interpreter::Match::inequality(v30, v31, v32, v33);
          break;
        case 9:
        case 0xA:
        case 0xB:
        case 0xC:
        case 0xD:
          CFTypeID v9 = CFGetTypeID(*(CFTypeRef *)a1);
          if (v9 == CFDateGetTypeID())
          {
            CFTypeID v10 = CFGetTypeID(a2);
            if (v10 == CFDateGetTypeID())
            {
              CFTypeID v11 = CFGetTypeID(*(CFTypeRef *)a1);
              if (v11 == CFDateGetTypeID()) {
                CFDateRef v12 = *(const __CFDate **)a1;
              }
              else {
                CFDateRef v12 = 0;
              }
              CFComparisonResult v34 = CFDateCompare((CFDateRef)a2, v12, 0);
              switch(*(_DWORD *)(a1 + 8))
              {
                case 9:
                  return v34 == kCFCompareEqualTo;
                case 0xA:
                  return (unint64_t)v34 >> 63;
                case 0xB:
                  return v34 > kCFCompareEqualTo;
                case 0xC:
                  return v34 < kCFCompareGreaterThan;
                case 0xD:
                  return v34 >= kCFCompareEqualTo;
                default:
                  abort();
              }
            }
          }
          return 0;
        default:
          return 0;
      }
    }
  }
  return result;
}

CFTypeRef Security::CodeSigning::Requirement::Interpreter::Match::cfStringValue(CFTypeRef *this)
{
  CFTypeID v2 = CFGetTypeID(*this);
  if (v2 == CFStringGetTypeID()) {
    return *this;
  }
  else {
    return 0;
  }
}

BOOL Security::CodeSigning::Requirement::Interpreter::Match::inequality(CFTypeRef *this, const __CFString *a2, uint64_t a3, CFComparisonResult a4)
{
  int v4 = a4;
  CFTypeID v8 = CFGetTypeID(*this);
  BOOL result = 0;
  if (v8 == CFStringGetTypeID())
  {
    CFTypeID v9 = CFGetTypeID(a2);
    if (v9 == CFStringGetTypeID())
    {
      CFStringRef v10 = (const __CFString *)Security::CodeSigning::Requirement::Interpreter::Match::cfStringValue(this);
      if ((CFStringCompare(a2, v10, 0x40uLL) == a3) == v4) {
        return 1;
      }
    }
  }
  return result;
}

const void **___ZN8Security11CodeSigning11Requirement11Interpreter18appleLocalAnchoredEv_block_invoke(Security *a1, uint64_t a2)
{
  uint64_t v15 = 0;
  CFTypeID v16 = &v15;
  uint64_t v17 = 0x3002000000;
  CFRange v18 = __Block_byref_object_copy__17663;
  CFStringRef v19 = __Block_byref_object_dispose__17664;
  CFMutableArrayRef CFMutableArray = (CFMutableArrayRef)0xAAAAAAAAAAAAAAAALL;
  CFMutableArrayRef CFMutableArray = Security::makeCFMutableArray(a1, a2);
  io_registry_entry_t v2 = IORegistryEntryFromPath(*MEMORY[0x1E4F2EEF0], "IODeviceTree:/options");
  io_object_t v3 = v2;
  if (!v2) {
    goto LABEL_10;
  }
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFDataRef theData = (CFDataRef)IORegistryEntryCreateCFProperty(v2, @"AMFITrustedKeys", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  IOObjectRelease(v3);
  if (!theData) {
    goto LABEL_9;
  }
  BytePtr = (const char *)CFDataGetBytePtr(theData);
  CFIndex Length = CFDataGetLength(theData);
  CFTypeRef v7 = IOCFUnserializeWithSize(BytePtr, Length, v4, 0, 0);
  size_t v13 = v7;
  if (!v7
    || (CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v7, @"trustedKeys")) == 0
    && (CFTypeID v9 = CFGetTypeID(0), v9 != CFArrayGetTypeID()))
  {
    Security::CFRef<__CFDictionary const*>::~CFRef(&v13);
LABEL_9:
    Security::CFRef<__CFData const*>::~CFRef((const void **)&theData);
    goto LABEL_10;
  }
  context[0] = MEMORY[0x1E4F143A8];
  context[1] = 0x40000000;
  conCFStringRef text[2] = ___ZN8Security11CodeSigning11Requirement11Interpreter27getAdditionalTrustedAnchorsEv_block_invoke;
  context[3] = &unk_1E5485868;
  context[4] = &v15;
  v21.length = CFArrayGetCount(Value);
  v21.location = 0;
  CFArrayApplyFunction(Value, v21, (CFArrayApplierFunction)Security::cfarrayApplyBlock_func, context);
  Security::CFRef<__CFDictionary const*>::~CFRef(&v13);
  Security::CFRef<__CFData const*>::~CFRef((const void **)&theData);
  if (!CFArrayGetCount((CFArrayRef)v16[5]))
  {
LABEL_10:
    uint64_t v10 = 0;
    goto LABEL_11;
  }
  uint64_t v10 = v16[5];
  v16[5] = 0;
LABEL_11:
  _Block_object_dispose(&v15, 8);
  BOOL result = Security::CFRef<__CFArray *>::~CFRef((const void **)&CFMutableArray);
  Security::CodeSigning::Requirement::Interpreter::appleLocalAnchored(void)::additionalTrustedCertificates = v10;
  return result;
}

void sub_18B3FBA74(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  Security::CFRef<__CFData const*>::~CFRef((const void **)va);
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x18B3FBA10);
}

void sub_18B3FBAB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  Security::CFRef<__CFArray *>::~CFRef(v9);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__17663(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  return result;
}

const void **__Block_byref_object_dispose__17664(uint64_t a1)
{
  return Security::CFRef<__CFArray *>::~CFRef((const void **)(a1 + 40));
}

void ___ZN8Security11CodeSigning11Requirement11Interpreter27getAdditionalTrustedAnchorsEv_block_invoke(uint64_t a1, CFDictionaryRef theDict)
{
  if (theDict || (CFTypeID v4 = CFGetTypeID(0), v4 == CFDictionaryGetTypeID()))
  {
    CFArrayRef Value = CFDictionaryGetValue(theDict, @"certDigest");
    if (Value || (CFTypeID v6 = CFGetTypeID(0), v6 == CFDataGetTypeID()))
    {
      CFTypeRef v7 = *(__CFArray **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      CFArrayAppendValue(v7, Value);
    }
  }
}

void *Security::CodeSigning::Requirement::Maker::require(void *this, uint64_t a2)
{
  unint64_t v2 = *((unsigned int *)this + 2);
  unint64_t v3 = *((unsigned int *)this + 3) + a2;
  if (v3 > v2)
  {
    CFTypeID v4 = this;
    unint64_t v5 = (2 * v2);
    if (v3 <= v5) {
      size_t v6 = v5;
    }
    else {
      size_t v6 = v3;
    }
    *((_DWORD *)this + 2) = v6;
    this = malloc_type_realloc((void *)*this, v6, 0xE7A31E20uLL);
    *CFTypeID v4 = this;
    if (!this) {
      Security::UnixError::throwMe((Security::UnixError *)0xC);
    }
  }
  return this;
}

uint64_t Security::CodeSigning::Requirement::Maker::alloc(Security::CodeSigning::Requirement::Maker *this, uint64_t a2)
{
  unint64_t v4 = (a2 - 1) & 0xFFFFFFFFFFFFFFFCLL;
  Security::CodeSigning::Requirement::Maker::require(this, v4 + 4);
  uint64_t v5 = *(void *)this;
  uint64_t v6 = *((unsigned int *)this + 3);
  uint64_t v7 = v6 + *(void *)this;
  uint64_t v8 = (v6 + v4 + 4);
  *((_DWORD *)this + 3) = v8;
  __srCC_SHA1_CTX c = 0;
  memcpy((void *)(a2 - v4 + v5 + v8 - 4), &__src, v4 + 4 - a2);
  return v7;
}

void *Security::CodeSigning::Requirement::Maker::putData(Security::CodeSigning::Requirement::Maker *this, const void *a2, size_t a3)
{
  Security::CodeSigning::Requirement::Maker::require(this, 4);
  uint64_t v6 = *(void *)this;
  uint64_t v7 = *((unsigned int *)this + 3);
  *((_DWORD *)this + 3) = v7 + 4;
  *(_DWORD *)(v7 + v6) = bswap32(a3);
  uint64_t v8 = (void *)Security::CodeSigning::Requirement::Maker::alloc(this, a3);

  return memcpy(v8, a2, a3);
}

void Security::CodeSigning::SecCodeSigner::Signer::setDigestAlgorithms(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + 112;
  if (v2 != a2) {
    std::__tree<unsigned int>::__assign_multi<std::__tree_const_iterator<unsigned int,std::__tree_node<unsigned int,void *> *,long>>(v2, *(void **)a2, (void *)(a2 + 8));
  }
}

void std::__tree<unsigned int>::__assign_multi<std::__tree_const_iterator<unsigned int,std::__tree_node<unsigned int,void *> *,long>>(uint64_t a1, void *a2, void *a3)
{
  if (*(void *)(a1 + 16))
  {
    uint64_t v6 = *(uint64_t **)a1;
    uint64_t v8 = (uint64_t **)(a1 + 8);
    uint64_t v7 = *(void *)(a1 + 8);
    *(void *)a1 = a1 + 8;
    *(void *)(v7 + 16) = 0;
    *(void *)(a1 + 16) = 0;
    *(void *)(a1 + 8) = 0;
    if (v6[1]) {
      CFTypeID v9 = (uint64_t *)v6[1];
    }
    else {
      CFTypeID v9 = v6;
    }
    if (!v9)
    {
      CFStringRef v20 = 0;
LABEL_29:
      std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy(v20);
      goto LABEL_30;
    }
    uint64_t v10 = std::__tree<unsigned int>::_DetachedTreeCache::__detach_next((uint64_t)v9);
    if (a2 != a3)
    {
      CFTypeID v11 = v9;
      CFDateRef v12 = a2;
      do
      {
        CFTypeID v9 = v10;
        unsigned int v13 = *((_DWORD *)v12 + 7);
        *((_DWORD *)v11 + 7) = v13;
        char v14 = *v8;
        uint64_t v15 = (uint64_t **)(a1 + 8);
        CFTypeID v16 = (uint64_t **)(a1 + 8);
        if (*v8)
        {
          do
          {
            while (1)
            {
              uint64_t v15 = (uint64_t **)v14;
              if (v13 >= *((_DWORD *)v14 + 7)) {
                break;
              }
              char v14 = (uint64_t *)*v14;
              CFTypeID v16 = v15;
              if (!*v15) {
                goto LABEL_14;
              }
            }
            char v14 = (uint64_t *)v14[1];
          }
          while (v14);
          CFTypeID v16 = v15 + 1;
        }
LABEL_14:
        std::__tree<std::__value_type<int,Security::CFCopyRef<__CFData const*>>,std::__map_value_compare<int,std::__value_type<int,Security::CFCopyRef<__CFData const*>>,std::less<int>,true>,std::allocator<std::__value_type<int,Security::CFCopyRef<__CFData const*>>>>::__insert_node_at((uint64_t **)a1, (uint64_t)v15, v16, v11);
        if (v10) {
          uint64_t v10 = std::__tree<unsigned int>::_DetachedTreeCache::__detach_next((uint64_t)v10);
        }
        else {
          uint64_t v10 = 0;
        }
        uint64_t v17 = (void *)v12[1];
        if (v17)
        {
          do
          {
            a2 = v17;
            uint64_t v17 = (void *)*v17;
          }
          while (v17);
        }
        else
        {
          do
          {
            a2 = (void *)v12[2];
            BOOL v18 = *a2 == (void)v12;
            CFDateRef v12 = a2;
          }
          while (!v18);
        }
        if (!v9) {
          break;
        }
        CFTypeID v11 = v9;
        CFDateRef v12 = a2;
      }
      while (a2 != a3);
    }
    std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy(v9);
    if (v10)
    {
      for (CFIndex i = (uint64_t *)v10[2]; i; CFIndex i = (uint64_t *)i[2])
        uint64_t v10 = i;
      CFStringRef v20 = v10;
      goto LABEL_29;
    }
  }
LABEL_30:
  if (a2 != a3)
  {
    CFRange v21 = (uint64_t **)(a1 + 8);
    do
    {
      CFTypeID v22 = (uint64_t *)operator new(0x20uLL);
      unsigned int v23 = *((_DWORD *)a2 + 7);
      *((_DWORD *)v22 + 7) = v23;
      uint64_t v24 = *v21;
      CFIndex v25 = (uint64_t **)(a1 + 8);
      CFTypeID v26 = (uint64_t **)(a1 + 8);
      if (*v21)
      {
        do
        {
          while (1)
          {
            CFIndex v25 = (uint64_t **)v24;
            if (v23 >= *((_DWORD *)v24 + 7)) {
              break;
            }
            uint64_t v24 = (uint64_t *)*v24;
            CFTypeID v26 = v25;
            if (!*v25) {
              goto LABEL_38;
            }
          }
          uint64_t v24 = (uint64_t *)v24[1];
        }
        while (v24);
        CFTypeID v26 = v25 + 1;
      }
LABEL_38:
      std::__tree<std::__value_type<int,Security::CFCopyRef<__CFData const*>>,std::__map_value_compare<int,std::__value_type<int,Security::CFCopyRef<__CFData const*>>,std::less<int>,true>,std::allocator<std::__value_type<int,Security::CFCopyRef<__CFData const*>>>>::__insert_node_at((uint64_t **)a1, (uint64_t)v25, v26, v22);
      CFTypeID v27 = (void *)a2[1];
      if (v27)
      {
        do
        {
          CFStringRef v28 = v27;
          CFTypeID v27 = (void *)*v27;
        }
        while (v27);
      }
      else
      {
        do
        {
          CFStringRef v28 = (void *)a2[2];
          BOOL v18 = *v28 == (void)a2;
          a2 = v28;
        }
        while (!v18);
      }
      a2 = v28;
    }
    while (v28 != a3);
  }
}

void *std::__tree<unsigned int>::_DetachedTreeCache::__detach_next(uint64_t a1)
{
  BOOL result = *(void **)(a1 + 16);
  if (result)
  {
    unint64_t v3 = (void *)*result;
    if (*result == a1)
    {
      *BOOL result = 0;
      while (1)
      {
        unint64_t v4 = (void *)result[1];
        if (!v4) {
          break;
        }
        do
        {
          BOOL result = v4;
          unint64_t v4 = (void *)*v4;
        }
        while (v4);
      }
    }
    else
    {
      for (result[1] = 0; v3; unint64_t v3 = (void *)result[1])
      {
        do
        {
          BOOL result = v3;
          unint64_t v3 = (void *)*v3;
        }
        while (v3);
      }
    }
  }
  return result;
}

uint64_t Security::CodeSigning::SecCodeSigner::Signer::digestAlgorithms(Security::CodeSigning::SecCodeSigner::Signer *this)
{
  return (uint64_t)this + 112;
}

uint64_t Security::CodeSigning::SecCodeSigner::Signer::signingFlags(Security::CodeSigning::SecCodeSigner::Signer *this)
{
  return *(unsigned int *)(*((void *)this + 1) + 16);
}

BOOL Security::CodeSigning::SecCodeSigner::Signer::isAdhoc(Security::CodeSigning::SecCodeSigner::Signer *this)
{
  return *(void *)(*((void *)this + 1) + 24) == *MEMORY[0x1E4F1D260];
}

void Security::CodeSigning::SecCodeSigner::Signer::sdkPath(uint64_t a1@<X0>, uint64_t a2@<X1>, std::string *a3@<X8>)
{
  CFURLRef v5 = *(const __CFURL **)(*(void *)(a1 + 8) + 112);
  if (v5)
  {
    Security::cfString((Security *)&v12, v5);
    int v6 = *(char *)(a2 + 23);
    if (v6 >= 0) {
      uint64_t v7 = (const std::string::value_type *)a2;
    }
    else {
      uint64_t v7 = *(const std::string::value_type **)a2;
    }
    if (v6 >= 0) {
      std::string::size_type v8 = *(unsigned __int8 *)(a2 + 23);
    }
    else {
      std::string::size_type v8 = *(void *)(a2 + 8);
    }
    CFTypeID v9 = std::string::append(&v12, v7, v8);
    *a3 = *v9;
    v9->__r_.__value_.__l.__size_ = 0;
    v9->__r_.__value_.__r.__words[2] = 0;
    v9->__r_.__value_.__r.__words[0] = 0;
    if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v12.__r_.__value_.__l.__data_);
    }
  }
  else if (*(char *)(a2 + 23) < 0)
  {
    uint64_t v10 = *(const std::string::value_type **)a2;
    std::string::size_type v11 = *(void *)(a2 + 8);
    std::string::__init_copy_ctor_external(a3, v10, v11);
  }
  else
  {
    *(_OWORD *)&a3->__r_.__value_.__l.__data_ = *(_OWORD *)a2;
    a3->__r_.__value_.__r.__words[2] = *(void *)(a2 + 16);
  }
}

void sub_18B3FC058(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void Security::CodeSigning::SecCodeSigner::Signer::sign(Security::CodeSigning::SecCodeSigner::Signer *this, int a2)
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (*(uint64_t (**)(void))(**(void **)(*((void *)this + 2) + 32) + 16))(*(void *)(*((void *)this + 2) + 32));
  CFURLRef v5 = (void *)((char *)this + 24);
  Security::RefPointer<Security::CodeSigning::DiskRep>::setPointer((uint64_t)this + 24, v4);
  Security::CodeSigning::SecCodeSigner::Signer::prepare(this, a2);
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)cf = v6;
  long long v53 = v6;
  long long v52 = v6;
  long long v51 = v6;
  *(_OWORD *)std::string __p = v6;
  CFArrayRef v49 = 0;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)&unk_18B41CA07);
  *((void *)&v51 + 1) = 0;
  *(void *)&long long v52 = 0;
  *(void *)((char *)&v52 + 5) = 0;
  long long v53 = 0u;
  *(_OWORD *)cf = 0u;
  uint64_t v7 = (const void *)*((void *)this + 42);
  std::string::size_type v8 = (void *)MEMORY[0x1E4F1D260];
  if (!v7)
  {
    if (*(void *)(*((void *)this + 1) + 24) == *MEMORY[0x1E4F1D260]) {
      goto LABEL_19;
    }
    uint64_t v10 = secLogObjForScope("signer");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v43 = *(void *)(*((void *)this + 1) + 24);
      *(_DWORD *)certificates = 138412290;
      *(void *)&certificates[4] = v43;
      _os_log_debug_impl(&dword_18B299000, v10, OS_LOG_TYPE_DEBUG, "looking at identity to create cert chain: %@", certificates, 0xCu);
    }
    *(void *)certificates = *(void *)(*(void *)(*((void *)this + 1) + 24) + 16);
    CFRetain(*(CFTypeRef *)certificates);
    *(void *)int v75 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)int v75 = SecPolicyCreateWithProperties(@"1.2.840.113635.100.1.16", 0);
    SecTrustRef trust = 0;
    std::string::size_type v11 = (Security::MacOSError *)SecTrustCreateWithCertificates(*(CFTypeRef *)certificates, *(CFTypeRef *)v75, &trust);
    if (v11) {
      Security::MacOSError::throwMe(v11);
    }
    if (!SecTrustEvaluateWithError(trust, 0))
    {
      std::string v12 = secLogObjForScope("signer");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v56) = 0;
        _os_log_debug_impl(&dword_18B299000, v12, OS_LOG_TYPE_DEBUG, "SecTrust evaluation of signing certificate failed - not fatal", (uint8_t *)&v56, 2u);
      }
    }
    SecTrustRef v56 = (SecTrustRef)0xAAAAAAAAAAAAAAAALL;
    unsigned int v13 = SecTrustCopyCertificateChain(trust);
    SecTrustRef v56 = v13;
    if (v13)
    {
      CFArrayRef Copy = CFArrayCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v13);
      if (cf[1]) {
        CFRelease(cf[1]);
      }
      cf[1] = Copy;
      if (Copy)
      {
        CFArrayRef v49 = Copy;
        Security::CFRef<__CFArray const*>::~CFRef((const void **)&v56);
        Security::CFRef<__SecTrust *>::~CFRef((const void **)&trust);
        Security::CFRef<__SecPolicy *>::~CFRef((const void **)v75);
        Security::CFRef<__SecCertificate *>::~CFRef((const void **)certificates);
        goto LABEL_19;
      }
      uint64_t v47 = secLogObjForScope("SecError");
      uint64_t v46 = 4294900248;
      if (!os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT)) {
LABEL_115:
      }
        Security::MacOSError::throwMe((Security::MacOSError *)v46);
      LOWORD(v55) = 0;
      CFStringRef v48 = "Unable to copy certChain array";
    }
    else
    {
      uint64_t v46 = 4294900225;
      uint64_t v47 = secLogObjForScope("SecError");
      if (!os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_115;
      }
      LOWORD(v55) = 0;
      CFStringRef v48 = "Certificate chain is NULL";
    }
    _os_log_impl(&dword_18B299000, v47, OS_LOG_TYPE_DEFAULT, v48, (uint8_t *)&v55, 2u);
    goto LABEL_115;
  }
  CFRetain(*((CFTypeRef *)this + 42));
  if (cf[1]) {
    CFRelease(cf[1]);
  }
  cf[1] = v7;
  CFTypeID v9 = secLogObjForScope("signer");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)certificates = 138412290;
    *(CFTypeRef *)&certificates[4] = cf[1];
    _os_log_debug_impl(&dword_18B299000, v9, OS_LOG_TYPE_DEBUG, "signing context setup with existing cert chain: %@", certificates, 0xCu);
  }
  CFArrayRef v49 = (CFArrayRef)cf[1];
LABEL_19:
  if (*((char *)this + 159) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)certificates, *((const std::string::value_type **)this + 17), *((void *)this + 18));
  }
  else
  {
    *(_OWORD *)certificates = *(_OWORD *)((char *)this + 136);
    *(void *)&certificates[16] = *((void *)this + 19);
  }
  if (SBYTE7(v51) < 0) {
    operator delete(__p[0]);
  }
  *(_OWORD *)std::string __p = *(_OWORD *)certificates;
  *(void *)&long long v51 = *(void *)&certificates[16];
  memset(certificates, 170, 24);
  uint64_t v15 = *(void *)(*((void *)this + 1) + 24);
  if (!v15 || v15 == *v8) {
    goto LABEL_34;
  }
  *(void *)int v75 = *(void *)(v15 + 16);
  CFRetain(*(CFTypeRef *)v75);
  SecTrustRef trust = (SecTrustRef)0xAAAAAAAAAAAAAAAALL;
  CFTypeID v16 = (__SecTrust *)SecPolicyCreateiPhoneProfileApplicationSigning();
  SecTrustRef trust = v16;
  if (!v16)
  {
    unint64_t v44 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v56) = 0;
      _os_log_impl(&dword_18B299000, v44, OS_LOG_TYPE_DEFAULT, "Unable to create iPhoneProfileApplicationSigning SecPolicy", (uint8_t *)&v56, 2u);
    }
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA18);
  }
  SecTrustRef v56 = 0;
  uint64_t v17 = (Security::MacOSError *)SecTrustCreateWithCertificates(v49, v16, &v56);
  if (v17) {
    Security::MacOSError::throwMe(v17);
  }
  if (!SecTrustEvaluateWithError(v56, 0))
  {
    Security::CFRef<__SecTrust *>::~CFRef((const void **)&v56);
    Security::CFRef<__SecPolicy *>::~CFRef((const void **)&trust);
    Security::CFRef<__SecCertificate *>::~CFRef((const void **)v75);
LABEL_34:
    std::string::basic_string[abi:ne180100]<0>(certificates, (char *)&unk_18B41CA07);
    goto LABEL_35;
  }
  CFTypeRef v55 = 0;
  CFStringRef v18 = (const __CFString *)SecCertificateCopySubjectAttributeValue(*(uint64_t *)v75, (uint64_t)&oidOrganizationalUnitName);
  if (v55) {
    CFRelease(v55);
  }
  CFTypeRef v55 = v18;
  if (!v18)
  {
    v45 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)std::string buf = 0;
      _os_log_impl(&dword_18B299000, v45, OS_LOG_TYPE_DEFAULT, "Unable to get team ID (OrganizationalUnitName) from Apple signed certificate", buf, 2u);
    }
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA4ALL);
  }
  Security::cfString((std::string *)certificates, v18);
  Security::CFRef<__CFString const*>::~CFRef(&v55);
  Security::CFRef<__SecTrust *>::~CFRef((const void **)&v56);
  Security::CFRef<__SecPolicy *>::~CFRef((const void **)&trust);
  Security::CFRef<__SecCertificate *>::~CFRef((const void **)v75);
LABEL_35:
  uint64_t v19 = *((void *)this + 1);
  char v20 = certificates[23];
  uint64_t v21 = *(void *)&certificates[8];
  if (certificates[23] >= 0) {
    uint64_t v21 = certificates[23];
  }
  if ((*(unsigned char *)(v19 + 140) & 0x20) != 0)
  {
    if (!v21) {
      goto LABEL_72;
    }
    uint64_t v24 = *((unsigned __int8 *)this + 183);
    if ((v24 & 0x80u) == 0) {
      uint64_t v25 = *((unsigned __int8 *)this + 183);
    }
    else {
      uint64_t v25 = *((void *)this + 21);
    }
    if (v25 == v21)
    {
      CFTypeID v26 = (const void **)((char *)this + 160);
      if (certificates[23] >= 0) {
        CFTypeID v27 = certificates;
      }
      else {
        CFTypeID v27 = *(unsigned __int8 **)certificates;
      }
      if ((v24 & 0x80) != 0)
      {
        if (!memcmp(*v26, v27, *((void *)this + 21))) {
          goto LABEL_72;
        }
      }
      else
      {
        if (!*((unsigned char *)this + 183)) {
          goto LABEL_72;
        }
        while (*(unsigned __int8 *)v26 == *v27)
        {
          CFTypeID v26 = (const void **)((char *)v26 + 1);
          ++v27;
          if (!--v24) {
            goto LABEL_72;
          }
        }
      }
    }
LABEL_100:
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA02);
  }
  CFTypeID v22 = (const std::string *)(v19 + 224);
  if (v21)
  {
    uint64_t v23 = *(unsigned __int8 *)(v19 + 247);
    if (*(char *)(v19 + 247) < 0)
    {
      if (!*(void *)(v19 + 232)) {
        goto LABEL_70;
      }
    }
    else if (!*(unsigned char *)(v19 + 247))
    {
      goto LABEL_70;
    }
    size_t v28 = *(void *)(v19 + 232);
    if ((v23 & 0x80u) == 0) {
      uint64_t v29 = *(unsigned __int8 *)(v19 + 247);
    }
    else {
      uint64_t v29 = *(void *)(v19 + 232);
    }
    if (v29 != v21) {
      goto LABEL_100;
    }
    uint64_t v30 = *(unsigned __int8 **)certificates;
    if (certificates[23] >= 0) {
      uint64_t v30 = certificates;
    }
    if ((v23 & 0x80) != 0)
    {
      if (memcmp(v22->__r_.__value_.__l.__data_, v30, v28)) {
        goto LABEL_100;
      }
    }
    else if (v23)
    {
      while (v22->__r_.__value_.__s.__data_[0] == *v30)
      {
        CFTypeID v22 = (const std::string *)((char *)v22 + 1);
        ++v30;
        if (!--v23) {
          goto LABEL_70;
        }
      }
      goto LABEL_100;
    }
LABEL_70:
    CFTypeID v22 = (const std::string *)certificates;
  }
  std::string::operator=((std::string *)((char *)this + 160), v22);
  char v20 = certificates[23];
LABEL_72:
  if (v20 < 0) {
    operator delete(*(void **)certificates);
  }
  uint64_t v31 = *((void *)this + 1);
  if (!*(unsigned char *)(v31 + 249))
  {
    if ((*(uint64_t (**)(void))(*(void *)*v5 + 80))())
    {
      *(void *)&long long v64 = 0xAAAAAAAAAAAAAAAALL;
      *(void *)&long long v33 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v33 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v62 = v33;
      long long v63 = v33;
      *(_OWORD *)certificates = v33;
      *(_OWORD *)&certificates[16] = v33;
      uint64_t v34 = (*(uint64_t (**)(void))(*(void *)*v5 + 256))();
      Security::Mutex::Mutex((pthread_mutex_t *)&certificates[8]);
      if (v34) {
        atomic_fetch_add_explicit((atomic_uint *volatile)(v34 + 8), 1u, memory_order_relaxed);
      }
      *(void *)certificates = v34;
      uint64_t v35 = *((void *)this + 1);
      if (!*(unsigned char *)(v35 + 300))
      {
        if (*(void *)(v35 + 32)) {
          operator new();
        }
        operator new();
      }
      Security::MacOSError::throwMe((Security::MacOSError *)0xFFFFFFFCLL);
    }
    uint64_t v31 = *((void *)this + 1);
  }
  unint64_t v79 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v32 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v32 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v77 = v32;
  long long v78 = v32;
  *(_OWORD *)int v75 = v32;
  long long v76 = v32;
  if (*(void *)(v31 + 32)) {
    operator new();
  }
  uint64_t v36 = (*(uint64_t (**)(void))(*(void *)*v5 + 256))(*v5);
  Security::Mutex::Mutex((pthread_mutex_t *)&v75[2]);
  if (v36) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v36 + 8), 1u, memory_order_relaxed);
  }
  *(void *)int v75 = v36;
  if (*(unsigned char *)(*((void *)this + 1) + 300)) {
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFFFFFCLL);
  }
  SecTrustRef trust = (SecTrustRef)v58;
  v58[0] = 0;
  v58[1] = 0;
  int v59 = 0;
  uint64_t v37 = *(void *)(*(uint64_t (**)(Security::CodeSigning::SecCodeSigner::Signer *))(*(void *)this + 24))(this);
  if (v37 != (*(uint64_t (**)(Security::CodeSigning::SecCodeSigner::Signer *))(*(void *)this + 24))(this)
            + 8)
  {
    *(void *)&long long v38 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v38 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v73 = v38;
    long long v74 = v38;
    long long v71 = v38;
    long long v72 = v38;
    long long v69 = v38;
    long long v70 = v38;
    long long v67 = v38;
    long long v68 = v38;
    long long v65 = v38;
    long long v66 = v38;
    long long v63 = v38;
    long long v64 = v38;
    *(_OWORD *)&certificates[16] = v38;
    long long v62 = v38;
    *(_OWORD *)certificates = v38;
    Security::CodeSigning::CodeDirectory::Builder::Builder((Security::CodeSigning::CodeDirectory::Builder *)certificates, (Security::CodeSigning::CodeDirectory *)*(unsigned int *)(v37 + 28));
  }
  uint64_t v39 = *((void *)this + 1);
  if (*(void *)(v39 + 32))
  {
    *(void *)certificates = (*(uint64_t (**)(void))(*(void *)*v5 + 32))();
    (*(void (**)(void, uint64_t, void))(**(void **)v75 + 16))(*(void *)v75, 65537, *(void *)certificates);
    Security::CFRef<__CFData const*>::~CFRef((const void **)certificates);
    uint64_t v39 = *((void *)this + 1);
  }
  if (!*(unsigned char *)(v39 + 250)) {
    Security::CodeSigning::CodeDirectorySet::populate((const void **)&trust, *(Security::CodeSigning::DiskRep::Writer **)v75);
  }
  *(void *)certificates = Security::CodeSigning::CodeDirectorySet::hashDict((Security::CodeSigning::CodeDirectorySet *)&trust);
  CFDateRef v41 = Security::CodeSigning::CodeDirectorySet::hashList((Security::CodeSigning::CodeDirectorySet *)&trust, v40);
  SecTrustRef v56 = v41;
  CFStringRef v42 = v59;
  if (!v59)
  {
    CFStringRef v42 = (const Security::CodeSigning::CodeDirectory *)*((void *)trust + 5);
    int v59 = v42;
  }
  CFTypeRef v55 = Security::CodeSigning::SecCodeSigner::Signer::signCodeDirectory(this, v42, *(const __CFDictionary **)certificates, v41);
  (*(void (**)(void, uint64_t, CFTypeRef))(**(void **)v75 + 16))(*(void *)v75, 0x10000, v55);
  (*(void (**)(void))(**(void **)v75 + 48))(*(void *)v75);
  Security::CFRef<__CFData const*>::~CFRef(&v55);
  Security::CFRef<__CFArray const*>::~CFRef((const void **)&v56);
  Security::CFRef<__CFDictionary const*>::~CFRef((const void **)certificates);
  Security::SuperBlobCore<Security::CodeSigning::EmbeddedSignatureBlob,4208856256u,unsigned int>::Maker::~Maker((uint64_t)&trust);
  Security::RefPointer<Security::CodeSigning::DiskRep::Writer>::~RefPointer((uint64_t)v75);
  Security::CFRef<__CFArray const*>::~CFRef(&cf[1]);
  if (SBYTE7(v51) < 0) {
    operator delete(__p[0]);
  }
}

void sub_18B3FD6B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,void *a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,void *a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,void *__p,uint64_t a57,int a58,__int16 a59,char a60,char a61,uint64_t a62,uint64_t a63)
{
  if (a61 < 0) {
    operator delete(__p);
  }
  std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy((void *)a63);
  MEMORY[0x18C12D390](v66, 0x10B3C408FE6E862);
  Security::RefPointer<Security::CodeSigning::DiskRep::Writer>::~RefPointer((uint64_t)&a66);
  Security::CodeSigning::PreSigningContext::~PreSigningContext((Security::CodeSigning::PreSigningContext *)&a21);
  _Unwind_Resume(a1);
}

const void **Security::CodeSigning::SecCodeSigner::Signer::prepare(Security::CodeSigning::SecCodeSigner::Signer *this, int a2)
{
  uint64_t v233 = *MEMORY[0x1E4F143B8];
  if (*((unsigned char *)this + 321))
  {
    uint64_t v3 = *((void *)this + 3);
    *(_OWORD *)&v232[8] = 0uLL;
    *(void *)v232 = &v232[8];
    (*(void (**)(uint64_t, void, unsigned char *, void))(*(void *)v3 + 224))(v3, 0, v232, a2 | 0x4000200u);
    std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy(*(void **)&v232[8]);
  }
  Security::CodeSigning::SecStaticCode::prepareProgress(*((Security::CodeSigning::SecStaticCode **)this + 2), 0);
  CFTypeRef cf = 0;
  *(void *)v232 = 0xAAAAAAAAAAAAAAAALL;
  CFDataRef v4 = (const __CFData *)(*(uint64_t (**)(void, uint64_t))(**((void **)this + 3) + 24))(*((void *)this + 3), 1);
  *(void *)v232 = v4;
  if (v4) {
    CFTypeRef cf = Security::makeCFDictionaryFrom(v4, v5);
  }
  Security::CFRef<__CFData const*>::~CFRef((const void **)v232);
  if (!Security::CodeSigning::SecStaticCode::codeDirectory(*((Security::CodeSigning::SecStaticCode **)this + 2), 0)
    || (Security::CodeSigning::SecStaticCode::codeDirectory(*((Security::CodeSigning::SecStaticCode **)this + 2), 0)[13] & 2) != 0)
  {
    LOWORD(v6) = 0;
  }
  else
  {
    int v6 = *(_DWORD *)(*((void *)this + 1) + 140);
  }
  uint64_t v7 = (void **)((char *)this + 136);
  std::string::operator=((std::string *)((char *)this + 136), (const std::string *)(*((void *)this + 1) + 176));
  LODWORD(v8) = *((char *)this + 159);
  if ((v8 & 0x80000000) != 0)
  {
    if (*((void *)this + 18)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)this + 159))
  {
    goto LABEL_17;
  }
  if (v6)
  {
    CFTypeID v9 = Security::CodeSigning::SecStaticCode::codeDirectory(*((Security::CodeSigning::SecStaticCode **)this + 2), 1);
    std::string::basic_string[abi:ne180100]<0>(v232, (char *)&v9[bswap32(*((_DWORD *)v9 + 5))]);
    if (*((char *)this + 159) < 0) {
      operator delete(*v7);
    }
    *(_OWORD *)uint64_t v7 = *(_OWORD *)v232;
    *((void *)this + 19) = *(void *)&v232[16];
    LOBYTE(v8) = *((unsigned char *)this + 159);
  }
LABEL_17:
  if ((v8 & 0x80) != 0) {
    uint64_t v8 = *((void *)this + 18);
  }
  else {
    uint64_t v8 = v8;
  }
  v203 = (void **)((char *)this + 136);
  if (v8)
  {
    uint64_t v10 = secLogObjForScope("signer");
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_83;
    }
    std::string::size_type v11 = (char *)this + 136;
    if (*((char *)this + 159) < 0) {
      std::string::size_type v11 = (char *)*v7;
    }
    *(_DWORD *)v232 = 136315138;
    *(void *)&v232[4] = v11;
    std::string v12 = "using explicit identifier=%s";
    goto LABEL_365;
  }
  (*(void (**)(unsigned char *__return_ptr))(**((void **)this + 3) + 184))(v232);
  if (*((char *)this + 159) < 0) {
    operator delete(*v7);
  }
  *(_OWORD *)uint64_t v7 = *(_OWORD *)v232;
  *((void *)this + 19) = *(void *)&v232[16];
  if (std::string::find((const std::string *)((char *)this + 136), 46, 0) == -1)
  {
    uint64_t v13 = *((void *)this + 1);
    if (*(char *)(v13 + 223) >= 0) {
      size_t v14 = *(unsigned __int8 *)(v13 + 223);
    }
    else {
      size_t v14 = *(void *)(v13 + 208);
    }
    if (*((char *)this + 159) >= 0) {
      size_t v15 = *((unsigned __int8 *)this + 159);
    }
    else {
      size_t v15 = *((void *)this + 18);
    }
    memset(v232, 170, 24);
    CFTypeID v16 = v232;
    std::string::basic_string[abi:ne180100]((uint64_t)v232, v15 + v14);
    if (v232[23] < 0) {
      CFTypeID v16 = *(unsigned char **)v232;
    }
    if (v14)
    {
      if (*(char *)(v13 + 223) >= 0) {
        uint64_t v17 = (const void *)(v13 + 200);
      }
      else {
        uint64_t v17 = *(const void **)(v13 + 200);
      }
      memmove(v16, v17, v14);
    }
    CFStringRef v18 = &v16[v14];
    if (v15)
    {
      if (*((char *)this + 159) >= 0) {
        uint64_t v19 = (char *)this + 136;
      }
      else {
        uint64_t v19 = (char *)*((void *)this + 17);
      }
      memmove(v18, v19, v15);
    }
    v18[v15] = 0;
    if (*((char *)this + 159) < 0) {
      operator delete(*v7);
    }
    *(_OWORD *)uint64_t v7 = *(_OWORD *)v232;
    *((void *)this + 19) = *(void *)&v232[16];
  }
  if (std::string::find((const std::string *)((char *)this + 136), 46, 0) == -1
    && (*(unsigned int (**)(Security::CodeSigning::SecCodeSigner::Signer *))(*(void *)this + 8))(this))
  {
    (*(void (**)(unsigned char *__return_ptr))(**((void **)this + 3) + 192))(v232);
    if (v232[23] >= 0) {
      uint64_t v20 = v232[23];
    }
    else {
      uint64_t v20 = *(void *)&v232[8];
    }
    if ((v232[23] & 0x80000000) != 0) {
      operator delete(*(void **)v232);
    }
    if (!v20)
    {
      if (*((char *)this + 159) >= 0) {
        size_t v21 = *((unsigned __int8 *)this + 159);
      }
      else {
        size_t v21 = *((void *)this + 18);
      }
      memset(v232, 170, 24);
      std::string::basic_string[abi:ne180100]((uint64_t)v232, v21 + 1);
      if (v232[23] >= 0) {
        CFTypeID v22 = v232;
      }
      else {
        CFTypeID v22 = *(unsigned char **)v232;
      }
      if (v21)
      {
        if (*((char *)this + 159) >= 0) {
          uint64_t v23 = (char *)this + 136;
        }
        else {
          uint64_t v23 = (char *)*((void *)this + 17);
        }
        memmove(v22, v23, v21);
      }
      *(_WORD *)&v22[v21] = 45;
      theData.__r_.__value_.__r.__words[0] = (*(uint64_t (**)(void))(**((void **)this + 3) + 32))(*((void *)this + 3));
      BytePtr = CFDataGetBytePtr((CFDataRef)theData.__r_.__value_.__l.__data_);
      CFIndex Length = CFDataGetLength((CFDataRef)theData.__r_.__value_.__l.__data_);
      memset(v219, 0, 24);
      if (Length >= 1)
      {
        do
        {
          memset(&__str, 170, 3);
          int v26 = *BytePtr++;
          snprintf((char *)&__str, 3uLL, "%02x", v26);
          std::string::size_type v27 = strlen((const char *)&__str);
          std::string::append((std::string *)v219, (const std::string::value_type *)&__str, v27);
          --Length;
        }
        while (Length);
      }
      Security::CFRef<__CFData const*>::~CFRef((const void **)&theData.__r_.__value_.__l.__data_);
      if (v219[23] >= 0) {
        size_t v28 = v219;
      }
      else {
        size_t v28 = *(const std::string::value_type **)v219;
      }
      if (v219[23] >= 0) {
        std::string::size_type v29 = v219[23];
      }
      else {
        std::string::size_type v29 = *(void *)&v219[8];
      }
      uint64_t v30 = std::string::append((std::string *)v232, v28, v29);
      std::string::size_type v31 = v30->__r_.__value_.__r.__words[0];
      __p.__r_.__value_.__r.__words[0] = v30->__r_.__value_.__l.__size_;
      *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 7) = *(std::string::size_type *)((char *)&v30->__r_.__value_.__r.__words[1] + 7);
      char v32 = HIBYTE(v30->__r_.__value_.__r.__words[2]);
      v30->__r_.__value_.__l.__size_ = 0;
      v30->__r_.__value_.__r.__words[2] = 0;
      v30->__r_.__value_.__r.__words[0] = 0;
      if (*((char *)this + 159) < 0) {
        operator delete(*v203);
      }
      *((void *)this + 17) = v31;
      *((void *)this + 18) = __p.__r_.__value_.__r.__words[0];
      *(void *)((char *)this + 151) = *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 7);
      *((unsigned char *)this + 159) = v32;
      if ((v219[23] & 0x80000000) != 0) {
        operator delete(*(void **)v219);
      }
      uint64_t v7 = (void **)((char *)this + 136);
      if ((v232[23] & 0x80000000) != 0) {
        operator delete(*(void **)v232);
      }
    }
  }
  uint64_t v10 = secLogObjForScope("signer");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v193 = v7;
    if (*((char *)this + 159) < 0) {
      v193 = *v7;
    }
    *(_DWORD *)v232 = 136315138;
    *(void *)&v232[4] = v193;
    std::string v12 = "using default identifier=%s";
LABEL_365:
    _os_log_debug_impl(&dword_18B299000, v10, OS_LOG_TYPE_DEBUG, v12, v232, 0xCu);
  }
LABEL_83:
  std::string::operator=((std::string *)((char *)this + 160), (const std::string *)(*((void *)this + 1) + 224));
  if (*((char *)this + 183) < 0)
  {
    if (*((void *)this + 21)) {
      goto LABEL_90;
    }
  }
  else if (*((unsigned char *)this + 183))
  {
    goto LABEL_90;
  }
  if ((v6 & 0x20) != 0)
  {
    long long v33 = (const std::string::value_type *)Security::CodeSigning::SecStaticCode::teamID(*((Security::CodeSigning::SecStaticCode **)this
                                                                                        + 2));
    if (v33) {
      std::string::__assign_external((std::string *)((char *)this + 160), v33);
    }
  }
LABEL_90:
  uint64_t v34 = *((void *)this + 1);
  if ((Security::CodeSigning::SecCodeSigner::Signer *)((char *)this + 112) != (Security::CodeSigning::SecCodeSigner::Signer *)(v34 + 152)) {
    std::__tree<unsigned int>::__assign_multi<std::__tree_const_iterator<unsigned int,std::__tree_node<unsigned int,void *> *,long>>((uint64_t)this + 112, *(void **)(v34 + 152), (void *)(v34 + 160));
  }
  if (!*((void *)this + 16) && (v6 & 0x40) != 0)
  {
    std::set<unsigned int>::set[abi:ne180100]((uint64_t)v232, (void *)(*((void *)this + 2) + 344));
    uint64_t v35 = (char *)this + 120;
    std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy(*((void **)this + 15));
    uint64_t v36 = *(void **)&v232[8];
    *((void *)this + 14) = *(void *)v232;
    *((void *)this + 15) = v36;
    uint64_t v37 = *(void *)&v232[16];
    *((void *)this + 16) = *(void *)&v232[16];
    if (v37)
    {
      void v36[2] = v35;
      *(void *)v232 = &v232[8];
      *(_OWORD *)&v232[8] = 0uLL;
      uint64_t v36 = 0;
    }
    else
    {
      *((void *)this + 14) = v35;
    }
    std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy(v36);
  }
  Security::CFRef<__CFData const*>::operator=((CFTypeRef *)this + 23, (CFTypeRef *)(*((void *)this + 1) + 64));
  if (!*((void *)this + 23) && (v6 & 4) != 0)
  {
    long long v38 = (const void *)(*(uint64_t (**)(void, uint64_t, uint64_t))(**((void **)this + 2) + 80))(*((void *)this + 2), 5, 4294900235);
    Security::CFRef<__CFArray const*>::operator=((CFTypeRef *)this + 23, v38);
  }
  uint64_t v39 = *((void *)this + 1);
  uint64_t v40 = (CFTypeRef **)((char *)this + 192);
  v204 = (uint64_t *)((char *)this + 112);
  if ((Security::CodeSigning::SecCodeSigner::Signer *)((char *)this + 192) == (Security::CodeSigning::SecCodeSigner::Signer *)(v39 + 80))
  {
    v45 = (CFTypeRef *)*((void *)this + 25);
  }
  else
  {
    CFDateRef v41 = *(CFTypeRef **)(v39 + 80);
    CFStringRef v42 = *(CFTypeRef **)(v39 + 88);
    unint64_t v43 = v42 - v41;
    uint64_t v44 = *((void *)this + 26);
    v45 = (CFTypeRef *)*((void *)this + 24);
    if (v43 <= (v44 - (uint64_t)v45) >> 3)
    {
      long long v52 = (const void **)*((void *)this + 25);
      int64_t v53 = (char *)v52 - (char *)v45;
      unint64_t v54 = v52 - v45;
      if (v54 >= v43)
      {
        if (v41 != v42)
        {
          do
            Security::CFRef<__CFData const*>::operator=(v45++, v41++);
          while (v41 != v42);
          long long v52 = (const void **)*((void *)this + 25);
        }
        while (v52 != v45)
          long long v52 = Security::CFRef<__CFData const*>::~CFRef(v52 - 1);
      }
      else
      {
        if (v52 != v45)
        {
          CFTypeRef v55 = v41;
          do
          {
            Security::CFRef<__CFData const*>::operator=(v45++, v55++);
            v53 -= 8;
          }
          while (v53);
          v45 = (CFTypeRef *)*((void *)this + 25);
        }
        SecTrustRef v56 = &v41[v54];
        int v57 = v45;
        if (v56 != v42)
        {
          int v57 = v45;
          do
          {
            v58 = *v56++;
            *v57++ = v58;
          }
          while (v56 != v42);
        }
        v45 = v57;
      }
    }
    else
    {
      if (v45)
      {
        uint64_t v46 = (const void **)*((void *)this + 25);
        uint64_t v47 = (CFTypeRef *)*((void *)this + 24);
        if (v46 != v45)
        {
          do
            uint64_t v46 = Security::CFRef<__CFData const*>::~CFRef(v46 - 1);
          while (v46 != v45);
          uint64_t v47 = *v40;
        }
        *((void *)this + 25) = v45;
        operator delete(v47);
        uint64_t v44 = 0;
        *uint64_t v40 = 0;
        *((void *)this + 25) = 0;
        *((void *)this + 26) = 0;
      }
      if ((char *)v42 - (char *)v41 < 0) {
        goto LABEL_387;
      }
      uint64_t v48 = v44 >> 2;
      if (v44 >> 2 <= v43) {
        uint64_t v48 = v42 - v41;
      }
      unint64_t v49 = (unint64_t)v44 >= 0x7FFFFFFFFFFFFFF8 ? 0x1FFFFFFFFFFFFFFFLL : v48;
      if (v49 >> 61) {
LABEL_387:
      }
        std::vector<CESerializedElement>::__throw_length_error[abi:ne180100]();
      v45 = (CFTypeRef *)std::__allocate_at_least[abi:ne180100]<std::allocator<Security::CodeSigning::ResourceBuilder::Rule *>>(v49);
      *((void *)this + 24) = v45;
      *((void *)this + 25) = v45;
      *((void *)this + 26) = &v45[v50];
      while (v41 != v42)
      {
        CFTypeRef v51 = *v41++;
        *v45++ = v51;
      }
    }
    *((void *)this + 25) = v45;
  }
  for (CFIndex i = *v40; i != v45; ++i)
  {
    if (*i) {
      CFRetain(*i);
    }
  }
  if ((v6 & 0x200) != 0)
  {
    long long v60 = *v40;
    if (!**v40 && !v60[1] && !v60[2])
    {
      v61 = (const void *)(*(uint64_t (**)(void, uint64_t, uint64_t))(**((void **)this + 2) + 80))(*((void *)this + 2), 8, 4294900235);
      if (v61) {
        Security::CFRef<__CFArray const*>::operator=(*v40, v61);
      }
      long long v62 = (const void *)(*(uint64_t (**)(void, uint64_t, uint64_t))(**((void **)this + 2) + 80))(*((void *)this + 2), 9, 4294900235);
      if (v62) {
        Security::CFRef<__CFArray const*>::operator=(*v40 + 1, v62);
      }
      long long v63 = (const void *)(*(uint64_t (**)(void, uint64_t, uint64_t))(**((void **)this + 2) + 80))(*((void *)this + 2), 10, 4294900235);
      if (v63) {
        Security::CFRef<__CFArray const*>::operator=(*v40 + 2, v63);
      }
    }
  }
  Security::CFRef<__CFData const*>::operator=((CFTypeRef *)this + 27, (CFTypeRef *)(*((void *)this + 1) + 104));
  if ((v6 & 0x400) != 0 && !*((void *)this + 27))
  {
    long long v64 = (const void *)(*(uint64_t (**)(void, uint64_t, uint64_t))(**((void **)this + 2) + 80))(*((void *)this + 2), 11, 4294900235);
    if (v64) {
      Security::CFRef<__CFArray const*>::operator=((CFTypeRef *)this + 27, v64);
    }
  }
  *((_DWORD *)this + 72) = 0;
  uint64_t v65 = *((void *)this + 1);
  if (*(unsigned char *)(v65 + 144))
  {
    *((_DWORD *)this + 72) = *(_DWORD *)(v65 + 136);
    uint64_t v66 = secLogObjForScope("signer");
    if (!os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
    {
LABEL_155:
      BOOL v67 = (v6 & 0x100) == 0;
      goto LABEL_156;
    }
    int v177 = *((_DWORD *)this + 72);
    *(_DWORD *)v232 = 67109120;
    *(_DWORD *)&v232[4] = v177;
    v86 = "using explicit cdFlags=0x%x";
LABEL_322:
    _os_log_debug_impl(&dword_18B299000, v66, OS_LOG_TYPE_DEBUG, v86, v232, 8u);
    goto LABEL_155;
  }
  if (cf)
  {
    CFNumberRef v82 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)cf, @"CSFlags");
    CFNumberRef v83 = v82;
    if (v82)
    {
      CFTypeID v84 = CFGetTypeID(v82);
      if (v84 == CFNumberGetTypeID())
      {
        *((_DWORD *)this + 72) = Security::cfNumber<unsigned int>(v83);
        uint64_t v66 = secLogObjForScope("signer");
        if (!os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_155;
        }
        int v85 = *((_DWORD *)this + 72);
        *(_DWORD *)v232 = 67109120;
        *(_DWORD *)&v232[4] = v85;
        v86 = "using numeric cdFlags=0x%x from Info.plist";
      }
      else
      {
        CFTypeID v116 = CFGetTypeID(v83);
        if (v116 != CFStringGetTypeID()) {
          Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA0ELL);
        }
        Security::cfString(&v213, (CFStringRef)v83);
        char v117 = HIBYTE(v213.__r_.__value_.__r.__words[2]);
        if ((v213.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          std::string::size_type size = HIBYTE(v213.__r_.__value_.__r.__words[2]);
        }
        else {
          std::string::size_type size = v213.__r_.__value_.__l.__size_;
        }
        __int16 v202 = v6;
        if (size)
        {
          if ((v213.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            v119 = &v213;
          }
          else {
            v119 = (std::string *)v213.__r_.__value_.__r.__words[0];
          }
          v120 = memchr(v119, 44, size);
          if (v120) {
            std::string::size_type v121 = v120 - (unsigned char *)v119;
          }
          else {
            std::string::size_type v121 = -1;
          }
        }
        else
        {
          std::string::size_type v121 = -1;
        }
        int v178 = 0;
        while (1)
        {
          memset(v232, 170, 24);
          if (v121 == -1)
          {
            if (v117 < 0) {
              std::string::__init_copy_ctor_external((std::string *)v232, v213.__r_.__value_.__l.__data_, v213.__r_.__value_.__l.__size_);
            }
            else {
              *(std::string *)v232 = v213;
            }
          }
          else
          {
            std::string::basic_string((std::string *)v232, &v213, 0, v121, (std::allocator<char> *)v219);
          }
          int v179 = v232[23];
          v180 = *(void **)v232;
          if (v232[23] >= 0) {
            size_t v181 = v232[23];
          }
          else {
            size_t v181 = *(void *)&v232[8];
          }
          if (v232[23] >= 0) {
            v182 = v232;
          }
          else {
            v182 = *(unsigned char **)v232;
          }
          v183 = "host";
          for (j = &kSecCodeDirectoryFlagTable;
                !*((unsigned char *)j + 12) || v181 != strlen(v183) || memcmp(v182, v183, v181);
                j += 2)
          {
            v185 = j[2];
            v183 = v185;
            if (!v185) {
              Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA02);
            }
          }
          int v186 = *((_DWORD *)j + 2);
          if (v179 < 0) {
            operator delete(v180);
          }
          v178 |= v186;
          if (v121 == -1) {
            break;
          }
          std::string::basic_string((std::string *)v232, &v213, v121 + 1, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)v219);
          if (SHIBYTE(v213.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v213.__r_.__value_.__l.__data_);
          }
          std::string v213 = *(std::string *)v232;
          unint64_t v187 = *(void *)&v232[16];
          v232[23] = 0;
          v232[0] = 0;
          std::string::size_type v188 = HIBYTE(v187);
          char v117 = v188;
          if ((v188 & 0x80u) == 0) {
            std::string::size_type v189 = v188;
          }
          else {
            std::string::size_type v189 = v213.__r_.__value_.__l.__size_;
          }
          if (v189)
          {
            if ((v188 & 0x80u) == 0) {
              v190 = &v213;
            }
            else {
              v190 = (std::string *)v213.__r_.__value_.__r.__words[0];
            }
            v191 = memchr(v190, 44, v189);
            if (v191) {
              std::string::size_type v121 = v191 - (unsigned char *)v190;
            }
            else {
              std::string::size_type v121 = -1;
            }
          }
          else
          {
            std::string::size_type v121 = -1;
          }
        }
        *((_DWORD *)this + 72) = v178;
        if (SHIBYTE(v213.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v213.__r_.__value_.__l.__data_);
        }
        uint64_t v66 = secLogObjForScope("signer");
        LOWORD(v6) = v202;
        if (!os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_155;
        }
        int v192 = *((_DWORD *)this + 72);
        *(_DWORD *)v232 = 67109120;
        *(_DWORD *)&v232[4] = v192;
        v86 = "using text cdFlags=0x%x from Info.plist";
      }
      goto LABEL_322;
    }
  }
  BOOL v67 = (v6 & 0x100) == 0;
  if ((v6 & 0x100) != 0) {
    *((_DWORD *)this + 72) |= (*((_DWORD *)Security::CodeSigning::SecStaticCode::codeDirectory(*((Security::CodeSigning::SecStaticCode **)this + 2), 0)+ 3) << 8) & 0x10000;
  }
  if ((v6 & 0x10) != 0)
  {
    *((_DWORD *)this + 72) = bswap32(*((_DWORD *)Security::CodeSigning::SecStaticCode::codeDirectory(*((Security::CodeSigning::SecStaticCode **)this + 2), 0)+ 3) & 0xFDFFFFFF);
    int v91 = secLogObjForScope("signer");
    if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
    {
      int v92 = *((_DWORD *)this + 72);
      *(_DWORD *)v232 = 67109120;
      *(_DWORD *)&v232[4] = v92;
      _os_log_debug_impl(&dword_18B299000, v91, OS_LOG_TYPE_DEBUG, "using inherited cdFlags=0x%x", v232, 8u);
    }
  }
LABEL_156:
  uint64_t v68 = *((void *)this + 1);
  uint64_t v69 = *MEMORY[0x1E4F1D260];
  if (*(void *)(v68 + 24) == *MEMORY[0x1E4F1D260] && !*(unsigned char *)(v68 + 301)) {
    *((_DWORD *)this + 72) |= 2u;
  }
  long long v70 = *(const void **)(v68 + 120);
  if (v70)
  {
    CFTypeID v71 = CFGetTypeID(v70);
    CFTypeID TypeID = CFDataGetTypeID();
    CFDataRef v73 = *(const __CFData **)(*((void *)this + 1) + 120);
    if (v71 == TypeID)
    {
      long long v74 = (unsigned int *)CFDataGetBytePtr(v73);
      if (*v74 != 17620730
        || (uint64_t v75 = bswap32(v74[2]), v76 = 8 * v75 + 12, v77 = bswap32(v74[1]), v76 > v77))
      {
        *__error() = 22;
LABEL_171:
        Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA14);
      }
      unint64_t v78 = (unint64_t)&v74[2 * v75 + 3];
      while (1)
      {
        v78 -= 8;
        if (v78 < (unint64_t)(v74 + 3)) {
          goto LABEL_183;
        }
        unsigned int v79 = *(_DWORD *)(v78 + 4);
        if (v79)
        {
          unint64_t v80 = bswap32(v79);
          BOOL v81 = v76 > v80 || v80 + 8 > v77;
          if (v81 || bswap32(*(unsigned int *)((char *)v74 + v80 + 4)) + v80 > v77) {
            goto LABEL_171;
          }
        }
      }
    }
    CFTypeID v87 = CFGetTypeID(v73);
    if (v87 != CFStringGetTypeID()) {
      Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA01);
    }
    CFMutableDictionaryRef theDict = (CFMutableDictionaryRef)0xAAAAAAAAAAAAAAAALL;
    CFMutableDictionaryRef theDict = (CFMutableDictionaryRef)CFStringCreateMutableCopy(0, 0, *(CFStringRef *)(*((void *)this + 1) + 120));
    CFIndex v88 = CFStringGetLength((CFStringRef)theDict);
    CFDictionaryRef v89 = (__CFString *)theDict;
    if (*((char *)this + 159) < 0)
    {
      std::string::__init_copy_ctor_external(&v212, *((const std::string::value_type **)this + 17), *((void *)this + 18));
    }
    else
    {
      *(_OWORD *)&v212.__r_.__value_.__l.__data_ = *(_OWORD *)v203;
      v212.__r_.__value_.__r.__words[2] = *((void *)this + 19);
    }
    Security::CFTempString::CFTempString<std::string>((CFStringRef *)v232, (char *)&v212);
    v234.location = 0;
    v234.length = v88;
    CFStringFindAndReplace(v89, @"$self.identifier", *(CFStringRef *)v232, v234, 0);
    Security::CFRef<__CFString const*>::~CFRef((const void **)v232);
    if (SHIBYTE(v212.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v212.__r_.__value_.__l.__data_);
    }
    Security::cfString(&__str, (CFStringRef)theDict);
    if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&theData, __str.__r_.__value_.__l.__data_, __str.__r_.__value_.__l.__size_);
    }
    else {
      std::string theData = __str;
    }
    memset(v232, 0, 24);
    std::string v93 = *(uint64_t (**)(unsigned char *, unsigned char *))(*(void *)(Security::ModuleNexus<Security::CodeSigning::PluginHost>::operator()()
                                                                 + 72)
                                                     + 32);
    int v94 = SHIBYTE(theData.__r_.__value_.__r.__words[2]);
    if (SHIBYTE(theData.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external((std::string *)v219, theData.__r_.__value_.__l.__data_, theData.__r_.__value_.__l.__size_);
    }
    else {
      *(std::string *)v219 = theData;
    }
    uint64_t v95 = v93(v219, v232);
    if ((v219[23] & 0x80000000) != 0) {
      operator delete(*(void **)v219);
    }
    if (!v95)
    {
      if ((v232[23] & 0x80000000) != 0) {
        std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v232, *(std::string::size_type *)&v232[8]);
      }
      else {
        std::string __p = *(std::string *)v232;
      }
      Security::CFTempString::CFTempString<std::string>((CFStringRef *)&v210, (char *)&__p);
      Security::CodeSigning::CSError::throwMe((Security::CodeSigning::CSError *)0xFFFEFA14, @"SecRequirementSyntax", (const __CFString *)v210.__r_.__value_.__l.__data_, v199);
    }
    if ((v232[23] & 0x80000000) != 0)
    {
      operator delete(*(void **)v232);
      if ((v94 & 0x80000000) == 0) {
        goto LABEL_203;
      }
    }
    else if ((v94 & 0x80000000) == 0)
    {
LABEL_203:
      *((void *)this + 37) = v95;
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__str.__r_.__value_.__l.__data_);
      }
      Security::CFRef<__CFString *>::~CFRef((const void **)&theDict);
      goto LABEL_206;
    }
    operator delete(theData.__r_.__value_.__l.__data_);
    goto LABEL_203;
  }
  if ((v6 & 2) != 0)
  {
    long long v74 = Security::CodeSigning::SecStaticCode::internalRequirements(*((Security::CodeSigning::SecStaticCode **)this + 2));
    if (v74)
    {
LABEL_183:
      std::string v90 = Security::BlobCore::clone((Security::BlobCore *)v74);
      *((void *)this + 37) = Security::Blob<Security::SuperBlob<4208856065u,unsigned int>,4208856065u>::specific(v90);
    }
  }
LABEL_206:
  memset(&__str, 170, sizeof(__str));
  (*(void (**)(std::string *__return_ptr))(**((void **)this + 3) + 56))(&__str);
  memset(&v210, 0, sizeof(v210));
  CFTypeRef v209 = 0;
  std::string::size_type v96 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
  if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type v96 = __str.__r_.__value_.__l.__size_;
  }
  if (v96)
  {
    Security::CFRef<__CFData const*>::operator=(&v209, (CFTypeRef *)(*((void *)this + 1) + 40));
    CFTypeRef v97 = v209;
    if (!v209 && (v6 & 8) != 0)
    {
      std::string v98 = (const void *)Security::CodeSigning::SecStaticCode::resourceDictionary(*((Security::CodeSigning::SecStaticCode **)this + 2), 0);
      CFTypeRef v97 = v98;
      if (v98)
      {
        CFRetain(v98);
        if (v209) {
          CFRelease(v209);
        }
        CFTypeRef v209 = v97;
        goto LABEL_219;
      }
      CFTypeRef v97 = v209;
    }
    if (v97) {
      goto LABEL_219;
    }
    if (cf)
    {
      CFStringRef v101 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)cf, (const void *)*MEMORY[0x1E4F1CC68]);
      CFStringRef v102 = v101;
      if (v101)
      {
        CFTypeID v103 = CFGetTypeID(v101);
        if (v103 == CFStringGetTypeID())
        {
          CFMutableDictionaryRef theDict = (CFMutableDictionaryRef)0xAAAAAAAAAAAAAAAALL;
          if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            std::string::size_type v104 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
          }
          else {
            std::string::size_type v104 = __str.__r_.__value_.__l.__size_;
          }
          memset(v219, 170, 24);
          std::string::basic_string[abi:ne180100]((uint64_t)v219, v104 + 1);
          if (v219[23] >= 0) {
            char v105 = v219;
          }
          else {
            char v105 = *(unsigned char **)v219;
          }
          if (v104)
          {
            if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              p_str = &__str;
            }
            else {
              p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
            }
            memmove(v105, p_str, v104);
          }
          *(_WORD *)&v105[v104] = 47;
          Security::cfString(&__p, v102);
          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            p_p = &__p;
          }
          else {
            p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
          }
          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            std::string::size_type v108 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
          }
          else {
            std::string::size_type v108 = __p.__r_.__value_.__l.__size_;
          }
          std::string v109 = std::string::append((std::string *)v219, (const std::string::value_type *)p_p, v108);
          std::string v112 = (std::string::value_type *)v109->__r_.__value_.__r.__words[0];
          std::string::size_type v111 = v109->__r_.__value_.__l.__size_;
          LODWORD(v224) = v109->__r_.__value_.__r.__words[2];
          *(_DWORD *)((char *)&v224 + 3) = *(_DWORD *)((char *)&v109->__r_.__value_.__r.__words[2] + 3);
          int v113 = SHIBYTE(v109->__r_.__value_.__r.__words[2]);
          v109->__r_.__value_.__l.__size_ = 0;
          v109->__r_.__value_.__r.__words[2] = 0;
          v109->__r_.__value_.__r.__words[0] = 0;
          if (v113 < 0)
          {
            std::string::__init_copy_ctor_external((std::string *)v232, v112, v111);
            char v115 = v232[23];
            v114 = *(std::string::value_type **)v232;
          }
          else
          {
            *(void *)v232 = v112;
            *(void *)&v232[8] = v111;
            *(_DWORD *)&v232[16] = v224;
            *(_DWORD *)&v232[19] = *(_DWORD *)((char *)&v224 + 3);
            v232[23] = v113;
            v114 = v112;
            char v115 = v113;
          }
          if (v115 >= 0) {
            v194 = (Security *)v232;
          }
          else {
            v194 = (Security *)v114;
          }
          theData.__r_.__value_.__r.__words[0] = (std::string::size_type)Security::makeCFURL(v194, 0, 0, v110);
          CFStringRef File = Security::cfLoadFile((Security *)theData.__r_.__value_.__l.__data_, v195);
          Security::CFRef<__CFURL const*>::~CFRef((const void **)&theData.__r_.__value_.__l.__data_);
          if ((v232[23] & 0x80000000) != 0) {
            operator delete(*(void **)v232);
          }
          CFMutableDictionaryRef theDict = File;
          if (v113 < 0) {
            operator delete(v112);
          }
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(__p.__r_.__value_.__l.__data_);
          }
          if ((v219[23] & 0x80000000) != 0) {
            operator delete(*(void **)v219);
          }
          if (theDict)
          {
            CFPropertyListRef CFDictionaryFrom = Security::makeCFDictionaryFrom(theDict, v197);
            if (CFDictionaryFrom)
            {
              if (v209) {
                CFRelease(v209);
              }
              CFTypeRef v209 = CFDictionaryFrom;
            }
          }
          Security::CFRef<__CFData const*>::~CFRef((const void **)&theDict);
        }
        CFTypeRef v97 = v209;
        if (!v209) {
          Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA13);
        }
LABEL_219:
        v99 = CFDictionaryGetValue((CFDictionaryRef)v97, @"rules");
        if (!v99 || (CFTypeID v100 = CFGetTypeID(v99), v100 != CFDictionaryGetTypeID())) {
          Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA13);
        }
        if (v209) {
          goto LABEL_260;
        }
        goto LABEL_257;
      }
      CFTypeRef v97 = v209;
      if (v209) {
        goto LABEL_219;
      }
    }
LABEL_257:
    v122 = (const void *)(*(uint64_t (**)(void, Security::CodeSigning::SecCodeSigner::Signer *))(**((void **)this + 3) + 200))(*((void *)this + 3), this);
    if (v209) {
      CFRelease(v209);
    }
    CFTypeRef v209 = v122;
LABEL_260:
    std::string::operator=(&v210, &__str);
    if (((*(uint64_t (**)(Security::CodeSigning::SecCodeSigner::Signer *))(*(void *)this + 16))(this) & 0x40) != 0)
    {
      CFURLRef v123 = (const __CFURL *)(*(uint64_t (**)(void))(**((void **)this + 3) + 48))(*((void *)this + 3));
      Security::cfStringRelease((Security *)v232, v123);
      if (SHIBYTE(v210.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v210.__r_.__value_.__l.__data_);
      }
      std::string v210 = *(std::string *)v232;
    }
  }
  uint64_t v124 = *((void *)this + 1);
  uint64_t v125 = *(void *)(v124 + 48);
  if (v125 == v69)
  {
    *((unsigned char *)this + 320) = 0;
  }
  else if (v125)
  {
    double v126 = MEMORY[0x18C12C760]();
    if (v126 > CFAbsoluteTimeGetCurrent()) {
      Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA0ELL);
    }
    *((unsigned char *)this + 320) = 1;
    *((double *)this + 39) = v126;
    uint64_t v124 = *((void *)this + 1);
  }
  else
  {
    *((unsigned char *)this + 320) = 1;
    *((void *)this + 39) = 0;
  }
  CFNumberRef v127 = *(const __CFNumber **)(v124 + 256);
  if (v127) {
    unint64_t v128 = Security::cfNumber<unsigned long>(v127);
  }
  else {
    unint64_t v128 = (*(uint64_t (**)(void, Security::CodeSigning::SecCodeSigner::Signer *))(**((void **)this + 3)
  }
                                                                                             + 216))(*((void *)this + 3), this);
  *((void *)this + 38) = v128;
  (*(void (**)(void, Security::CodeSigning::SecCodeSigner::Signer *))(**((void **)this + 3) + 72))(*((void *)this + 3), this);
  if (!*((void *)this + 16))
  {
    std::__tree<unsigned int>::__emplace_unique_key_args<unsigned int,unsigned int>(v204, 1u, 1);
    std::__tree<unsigned int>::__emplace_unique_key_args<unsigned int,unsigned int>(v204, 2u, 2);
  }
  std::string::size_type v129 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
  if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type v129 = __str.__r_.__value_.__l.__size_;
  }
  if (!v129) {
    goto LABEL_304;
  }
  if (SHIBYTE(v210.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(&v208, v210.__r_.__value_.__l.__data_, v210.__r_.__value_.__l.__size_);
    if ((*((unsigned char *)&__str.__r_.__value_.__s + 23) & 0x80) == 0) {
      goto LABEL_280;
    }
  }
  else
  {
    std::string v208 = v210;
    if ((*((unsigned char *)&__str.__r_.__value_.__s + 23) & 0x80) == 0)
    {
LABEL_280:
      std::string v207 = __str;
      goto LABEL_283;
    }
  }
  std::string::__init_copy_ctor_external(&v207, __str.__r_.__value_.__l.__data_, __str.__r_.__value_.__l.__size_);
LABEL_283:
  CFTypeRef v130 = v209;
  v131 = secLogObjForScope("codesign");
  BOOL v132 = os_log_type_enabled(v131, OS_LOG_TYPE_DEBUG);
  if (v132)
  {
    *(_WORD *)v232 = 0;
    _os_log_debug_impl(&dword_18B299000, v131, OS_LOG_TYPE_DEBUG, "start building resource directory", v232, 2u);
  }
  CFMutableDictionaryRef theDict = (CFMutableDictionaryRef)0xAAAAAAAAAAAAAAAALL;
  CFMutableDictionaryRef theDict = Security::makeCFMutableDictionary((Security *)v132);
  v139 = Security::cfget<__CFDictionary const*>(v130, (uint64_t)"rules", v133, v134, v135, v136, v137, v138, v200);
  if (!*(void *)(*((void *)this + 1) + 288))
  {
    if (((*(uint64_t (**)(Security::CodeSigning::SecCodeSigner::Signer *))(*(void *)this + 16))(this) & 0x800) == 0) {
      operator new();
    }
    operator new();
  }
  char v140 = (*(uint64_t (**)(Security::CodeSigning::SecCodeSigner::Signer *))(*(void *)this + 16))(this);
  if ((v140 & 0x10) != 0)
  {
    CFMutableDictionaryRef v160 = 0;
  }
  else
  {
    theData.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAAAAAAAALL;
    v147 = Security::cfget<__CFDictionary const*>(v130, (uint64_t)"rules2", v141, v142, v143, v144, v145, v146, v201);
    Security::CFCopyRef<__CFDictionary const*>::CFCopyRef(&theData, v147);
    if (!theData.__r_.__value_.__r.__words[0])
    {
      CFDataRef v155 = Security::cfmake<__CFDictionary const*>((uint64_t)"{+%O'^(Frameworks|SharedFrameworks|PlugIns|Plug-ins|XPCServices|Helpers|MacOS|Library/(Automator|Spotlight|LoginItems))/' = {nested=#T, weight=0}}", v148, v149, v150, v151, v152, v153, v154, (uint64_t)v139);
      if (theData.__r_.__value_.__r.__words[0]) {
        CFRelease(theData.__r_.__value_.__l.__data_);
      }
      theData.__r_.__value_.__r.__words[0] = (std::string::size_type)v155;
    }
    *(void *)&v232[88] = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v156 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v156 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v232[72] = v156;
    *(_OWORD *)&v232[56] = v156;
    *(_OWORD *)&v232[40] = v156;
    *(_OWORD *)&v232[24] = v156;
    *(_OWORD *)&v232[8] = v156;
    *(void *)v232 = &unk_1ED84AB50;
    Security::Mutex::Mutex((pthread_mutex_t *)&v232[8]);
    v232[72] = 0;
    *(void *)&v232[80] = 0;
    *(void *)&v232[88] = dispatch_group_create();
    CFMutableDictionaryRef v224 = (CFMutableDictionaryRef)0xAAAAAAAAAAAAAAAALL;
    CFMutableDictionaryRef CFMutableDictionary = Security::makeCFMutableDictionary(*(Security **)&v232[88]);
    CFMutableDictionaryRef v224 = CFMutableDictionary;
    *(void *)&long long v158 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v158 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v222 = v158;
    long long v223 = v158;
    long long v220 = v158;
    *(_OWORD *)value = v158;
    *(_OWORD *)v219 = v158;
    *(_OWORD *)&v219[16] = v158;
    char v159 = *((unsigned char *)this + 321);
    *(_OWORD *)&__p.__r_.__value_.__r.__words[1] = 0uLL;
    __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p.__r_.__value_.__l.__size_;
    Security::CodeSigning::ResourceBuilder::ResourceBuilder((std::string::size_type)v219, (uint64_t)&v208, (uint64_t)&v207, theData.__r_.__value_.__l.__data_, v159, (uint64_t)&__p);
    std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy((void *)__p.__r_.__value_.__l.__size_);
    (*(void (**)(void, unsigned char *))(**((void **)this + 3) + 64))(*((void *)this + 3), v219);
    __p.__r_.__value_.__r.__words[0] = MEMORY[0x1E4F143A8];
    __p.__r_.__value_.__l.__size_ = 0x40000000;
    __p.__r_.__value_.__r.__words[2] = (std::string::size_type)___ZN8Security11CodeSigning13SecCodeSigner6Signer14buildResourcesENSt3__112basic_stringIcNS3_11char_traitsIcEENS3_9allocatorIcEEEES9_PK14__CFDictionary_block_invoke;
    v227 = &__block_descriptor_tmp_30_17770;
    v228 = this;
    CFMutableDictionaryRef v229 = CFMutableDictionary;
    v230 = v232;
    v231 = v219;
    Security::CodeSigning::ResourceBuilder::scan((uint64_t)v219, (uint64_t)&__p, 0);
    Security::Dispatch::Group::wait((Security::Dispatch::Group *)v232);
    CFDictionaryAddValue(theDict, @"rules2", value[1]);
    CFMutableDictionaryRef v160 = v224;
    CFDictionaryAddValue(theDict, @"files2", v224);
    Security::CodeSigning::ResourceBuilder::~ResourceBuilder((Security::CodeSigning::ResourceBuilder *)v219);
    Security::CFRef<__CFDictionary *>::~CFRef((const void **)&v224);
    Security::Dispatch::Group::~Group((Security::Dispatch::Group *)v232);
    Security::CFRef<__CFDictionary const*>::~CFRef((const void **)&theData.__r_.__value_.__l.__data_);
  }
  CFDictionaryAddValue(theDict, @"rules", v139);
  v161 = (Security *)(*(uint64_t (**)(Security::CodeSigning::SecCodeSigner::Signer *))(*(void *)this + 16))(this);
  if ((v161 & 0x20) == 0)
  {
    theData.__r_.__value_.__r.__words[0] = 0;
    theData.__r_.__value_.__l.__size_ = (std::string::size_type)&theData;
    theData.__r_.__value_.__r.__words[2] = 0x3002000000;
    v216 = __Block_byref_object_copy__17773;
    v217 = __Block_byref_object_dispose__17774;
    unint64_t v218 = 0xAAAAAAAAAAAAAAAALL;
    CFMutableDictionaryRef v162 = Security::makeCFMutableDictionary(v161);
    *(void *)&long long v163 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v163 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v232[64] = v163;
    *(_OWORD *)&v232[80] = v163;
    *(_OWORD *)&v232[32] = v163;
    *(_OWORD *)&v232[48] = v163;
    *(_OWORD *)v232 = v163;
    *(_OWORD *)&v232[16] = v163;
    char v164 = *((unsigned char *)this + 321);
    *(_OWORD *)&v219[8] = 0uLL;
    unint64_t v218 = (unint64_t)v162;
    *(void *)v219 = &v219[8];
    Security::CodeSigning::ResourceBuilder::ResourceBuilder((std::string::size_type)v232, (uint64_t)&v208, (uint64_t)&v207, v139, v164, (uint64_t)v219);
    std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy(*(void **)&v219[8]);
    (*(void (**)(void, unsigned char *))(**((void **)this + 3) + 64))(*((void *)this + 3), v232);
    *(void *)v219 = MEMORY[0x1E4F143A8];
    *(void *)&v219[8] = 0x40000000;
    *(void *)&v219[16] = ___ZN8Security11CodeSigning13SecCodeSigner6Signer14buildResourcesENSt3__112basic_stringIcNS3_11char_traitsIcEENS3_9allocatorIcEEEES9_PK14__CFDictionary_block_invoke_37;
    *(void *)&v219[24] = &unk_1E5485910;
    *((void *)&v220 + 1) = v160;
    value[0] = v232;
    *(void *)&long long v220 = &theData;
    Security::CodeSigning::ResourceBuilder::scan((uint64_t)v232, (uint64_t)v219, 0);
    CFDictionaryAddValue(theDict, @"files", *(const void **)(theData.__r_.__value_.__l.__size_ + 40));
    Security::CodeSigning::ResourceBuilder::~ResourceBuilder((Security::CodeSigning::ResourceBuilder *)v232);
    _Block_object_dispose(&theData, 8);
    Security::CFRef<__CFDictionary *>::~CFRef((const void **)&v218);
  }
  v165 = Security::CFRef<__CFArray const*>::operator=((CFTypeRef *)this + 12, theDict);
  CFDataRef Data = CFPropertyListCreateData(0, *v165, kCFPropertyListXMLFormat_v1_0, 0, 0);
  v167 = (const void *)*((void *)this + 13);
  if (v167) {
    CFRelease(v167);
  }
  *((void *)this + 13) = Data;
  Security::CFRef<__CFDictionary *>::~CFRef((const void **)&theDict);
  if (SHIBYTE(v207.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v207.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v208.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v208.__r_.__value_.__l.__data_);
    if ((v6 & 0x80) == 0) {
      goto LABEL_311;
    }
    goto LABEL_305;
  }
LABEL_304:
  if ((v6 & 0x80) == 0) {
    goto LABEL_311;
  }
LABEL_305:
  if ((*(uint64_t (**)(void))(**(void **)(*((void *)this + 2) + 32) + 80))(*(void *)(*((void *)this + 2) + 32)))
  {
    v168 = (Security::Universal *)(*(uint64_t (**)(void))(**(void **)(*((void *)this + 2) + 32) + 80))(*(void *)(*((void *)this + 2) + 32));
    unint64_t v169 = Security::Universal::bestNativeArch(v168);
  }
  else
  {
    unint64_t v169 = Security::Architecture::local(0);
  }
  *((void *)this + 28) = v169;
  v170 = std::__tree<std::__value_type<Security::Architecture,std::map<unsigned int,Security::CFCopyRef<__CFData const*>>>,std::__map_value_compare<Security::Architecture,std::__value_type<Security::Architecture,std::map<unsigned int,Security::CFCopyRef<__CFData const*>>>,std::less<Security::Architecture>,true>,std::allocator<std::__value_type<Security::Architecture,std::map<unsigned int,Security::CFCopyRef<__CFData const*>>>>>::__emplace_unique_key_args<Security::Architecture,std::piecewise_construct_t const&,std::tuple<Security::Architecture const&>,std::tuple<>>((uint64_t **)this + 29, v169, (uint64_t *)this + 28);
  Security::CodeSigning::SecCodeSigner::Signer::addPreEncryptHashes((uint64_t **)v170 + 5, *((Security::CodeSigning::SecStaticCode **)this + 2));
  uint64_t v171 = *((void *)this + 2);
  v206[0] = MEMORY[0x1E4F143A8];
  v206[1] = 0x40000000;
  v206[2] = ___ZN8Security11CodeSigning13SecCodeSigner6Signer7prepareEj_block_invoke;
  v206[3] = &__block_descriptor_tmp_17762;
  v206[4] = this;
  *(void *)v232 = MEMORY[0x1E4F143A8];
  *(void *)&v232[8] = 0x40000000;
  *(void *)&v232[16] = ___ZN8Security11CodeSigning13SecStaticCode24handleOtherArchitecturesEU13block_pointerFvPS1_E_block_invoke;
  *(void *)&v232[24] = &unk_1E5485740;
  *(void *)&v232[32] = v206;
  *(void *)&v232[40] = v171;
  Security::CodeSigning::SecStaticCode::visitOtherArchitectures(v171);
LABEL_311:
  if (!v67)
  {
    if ((*(uint64_t (**)(void))(**(void **)(*((void *)this + 2) + 32) + 80))(*(void *)(*((void *)this + 2) + 32)))
    {
      v172 = (Security::Universal *)(*(uint64_t (**)(void))(**(void **)(*((void *)this + 2) + 32)
                                                                      + 80))(*(void *)(*((void *)this + 2) + 32));
      unint64_t v173 = Security::Universal::bestNativeArch(v172);
    }
    else
    {
      unint64_t v173 = Security::Architecture::local(0);
    }
    *((void *)this + 32) = v173;
    v174 = std::__tree<std::__value_type<Security::Architecture,std::map<unsigned int,Security::CFCopyRef<__CFData const*>>>,std::__map_value_compare<Security::Architecture,std::__value_type<Security::Architecture,std::map<unsigned int,Security::CFCopyRef<__CFData const*>>>,std::less<Security::Architecture>,true>,std::allocator<std::__value_type<Security::Architecture,std::map<unsigned int,Security::CFCopyRef<__CFData const*>>>>>::__emplace_unique_key_args<Security::Architecture,std::piecewise_construct_t const&,std::tuple<Security::Architecture const&>,std::tuple<>>((uint64_t **)this + 33, v173, (uint64_t *)this + 32);
    Security::CodeSigning::SecCodeSigner::Signer::addRuntimeVersions((uint64_t **)v174 + 5, *((Security::CodeSigning::SecStaticCode **)this + 2));
    uint64_t v175 = *((void *)this + 2);
    v205[0] = MEMORY[0x1E4F143A8];
    v205[1] = 0x40000000;
    v205[2] = ___ZN8Security11CodeSigning13SecCodeSigner6Signer7prepareEj_block_invoke_2;
    v205[3] = &__block_descriptor_tmp_11_17763;
    v205[4] = this;
    *(void *)v232 = MEMORY[0x1E4F143A8];
    *(void *)&v232[8] = 0x40000000;
    *(void *)&v232[16] = ___ZN8Security11CodeSigning13SecStaticCode24handleOtherArchitecturesEU13block_pointerFvPS1_E_block_invoke;
    *(void *)&v232[24] = &unk_1E5485740;
    *(void *)&v232[32] = v205;
    *(void *)&v232[40] = v175;
    Security::CodeSigning::SecStaticCode::visitOtherArchitectures(v175);
  }
  Security::CFRef<__CFDictionary const*>::~CFRef(&v209);
  if (SHIBYTE(v210.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v210.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
  return Security::CFRef<__CFDictionary const*>::~CFRef(&cf);
}

void sub_18B3FF828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,const void *a30,void *a31,uint64_t a32,int a33,__int16 a34,char a35,char a36,void *a37,uint64_t a38,int a39,__int16 a40,char a41,char a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,const void *a50,void *a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,void *a57,uint64_t a58,int a59,__int16 a60,char a61,char a62,uint64_t a63)
{
  operator delete(v73);
  if (a73 < 0) {
    operator delete(__p);
  }
  if (a62 < 0) {
    operator delete(a57);
  }
  Security::CFRef<__CFDictionary const*>::~CFRef(&a30);
  if (a36 < 0) {
    operator delete(a31);
  }
  if (a42 < 0) {
    operator delete(a37);
  }
  Security::CFRef<__CFDictionary const*>::~CFRef(&a50);
  _Unwind_Resume(a1);
}

void Security::CodeSigning::PreSigningContext::~PreSigningContext(Security::CodeSigning::PreSigningContext *this)
{
  if (*((char *)this + 47) < 0) {
    operator delete(*((void **)this + 3));
  }
}

char *std::__tree<std::__value_type<Security::Architecture,std::map<unsigned int,Security::CFCopyRef<__CFData const*>>>,std::__map_value_compare<Security::Architecture,std::__value_type<Security::Architecture,std::map<unsigned int,Security::CFCopyRef<__CFData const*>>>,std::less<Security::Architecture>,true>,std::allocator<std::__value_type<Security::Architecture,std::map<unsigned int,Security::CFCopyRef<__CFData const*>>>>>::__emplace_unique_key_args<Security::Architecture,std::piecewise_construct_t const&,std::tuple<Security::Architecture const&>,std::tuple<>>(uint64_t **a1, uint64_t a2, uint64_t *a3)
{
  int v6 = (char *)(a1 + 1);
  CFDataRef v5 = (int *)a1[1];
  if (v5)
  {
    while (1)
    {
      while (1)
      {
        int v6 = (char *)v5;
        int v7 = v5[8];
        int v8 = *((_DWORD *)v6 + 9);
        BOOL v9 = SHIDWORD(a2) < v8;
        if (a2 != v7) {
          BOOL v9 = (int)a2 < v7;
        }
        if (!v9) {
          break;
        }
        CFDataRef v5 = *(int **)v6;
        uint64_t v10 = (uint64_t **)v6;
        if (!*(void *)v6) {
          goto LABEL_14;
        }
      }
      BOOL v11 = v8 < SHIDWORD(a2);
      int v12 = a2 == v7 ? v11 : v7 < (int)a2;
      if (v12 != 1) {
        break;
      }
      uint64_t v10 = (uint64_t **)(v6 + 8);
      CFDataRef v5 = (int *)*((void *)v6 + 1);
      if (!v5) {
        goto LABEL_14;
      }
    }
  }
  else
  {
    uint64_t v10 = a1 + 1;
LABEL_14:
    uint64_t v13 = v6;
    int v6 = (char *)operator new(0x40uLL);
    uint64_t v14 = *a3;
    *((void *)v6 + 7) = 0;
    *((void *)v6 + 6) = 0;
    *((void *)v6 + 4) = v14;
    *((void *)v6 + 5) = v6 + 48;
    *(void *)int v6 = 0;
    *((void *)v6 + 1) = 0;
    *((void *)v6 + 2) = v13;
    NSObject *v10 = (uint64_t *)v6;
    size_t v15 = (uint64_t *)**a1;
    CFTypeID v16 = (uint64_t *)v6;
    if (v15)
    {
      *a1 = v15;
      CFTypeID v16 = *v10;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], v16);
    a1[2] = (uint64_t *)((char *)a1[2] + 1);
  }
  return v6;
}

uint64_t Security::CodeSigning::SecCodeSigner::Signer::populate(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned int a7, uint64_t a8, uint64_t a9, void *a10, int a11)
{
  v64[4] = *(Security::CodeSigning::SecCodeSigner::Signer **)MEMORY[0x1E4F143B8];
  (*(void (**)(void **__return_ptr))(**(void **)(a1 + 24) + 40))(__p);
  uint64_t v19 = *(void *)(a1 + 304);
  Security::UnixPlusPlus::FileDesc::close((Security::UnixPlusPlus::FileDesc *)(a2 + 40));
  if (v63 >= 0) {
    uint64_t v20 = __p;
  }
  else {
    uint64_t v20 = (void **)__p[0];
  }
  Security::UnixPlusPlus::FileDesc::open((Security::UnixPlusPlus::FileDesc *)(a2 + 40), (const char *)v20, 0, 438);
  *(void *)(a2 + 56) = a6;
  *(void *)(a2 + 64) = v19;
  *(void *)(a2 + 48) = a5;
  if (v63 < 0) {
    operator delete(__p[0]);
  }
  *(_DWORD *)(a2 + 72) = *(_DWORD *)(a1 + 288);
  std::string::operator=((std::string *)(a2 + 88), (const std::string *)(a1 + 136));
  std::string::operator=((std::string *)(a2 + 112), (const std::string *)(a1 + 160));
  *(unsigned char *)(a2 + 80) = *(unsigned char *)(*(void *)(a1 + 8) + 248);
  *(void *)(a2 + 168) = a8;
  *(void *)(a2 + 176) = a9;
  *(void *)(a2 + 184) = a7;
  uint64_t v57 = a4;
  char v58 = a7;
  *(unsigned char *)(a2 + 192) = ((*(unsigned __int16 (**)(uint64_t))(*(void *)a1 + 16))(a1) >> 8) & 1;
  long long v60 = 0;
  uint64_t v61 = 0;
  int v59 = &v60;
  size_t v21 = (void *)*a10;
  if ((void *)*a10 != a10 + 1)
  {
    do
    {
      CFTypeID v22 = v60;
      uint64_t v23 = &v60;
      if (v59 == &v60) {
        goto LABEL_13;
      }
      uint64_t v24 = v60;
      uint64_t v25 = &v60;
      if (v60)
      {
        do
        {
          uint64_t v23 = (uint64_t **)v24;
          uint64_t v24 = (uint64_t *)v24[1];
        }
        while (v24);
      }
      else
      {
        do
        {
          uint64_t v23 = (uint64_t **)v25[2];
          BOOL v26 = *v23 == (uint64_t *)v25;
          uint64_t v25 = v23;
        }
        while (v26);
      }
      unsigned int v27 = *((_DWORD *)v21 + 8);
      if (*((_DWORD *)v23 + 8) < v27)
      {
LABEL_13:
        if (v60) {
          size_t v28 = v23;
        }
        else {
          size_t v28 = &v60;
        }
        if (v60) {
          std::string::size_type v29 = v23 + 1;
        }
        else {
          std::string::size_type v29 = &v60;
        }
      }
      else
      {
        size_t v28 = &v60;
        std::string::size_type v29 = &v60;
        if (v60)
        {
          std::string::size_type v29 = &v60;
          while (1)
          {
            while (1)
            {
              size_t v28 = (uint64_t **)v22;
              unsigned int v33 = *((_DWORD *)v22 + 8);
              if (v27 >= v33) {
                break;
              }
              CFTypeID v22 = *v28;
              std::string::size_type v29 = v28;
              if (!*v28) {
                goto LABEL_20;
              }
            }
            if (v33 >= v27) {
              break;
            }
            std::string::size_type v29 = v28 + 1;
            CFTypeID v22 = v28[1];
            if (!v22) {
              goto LABEL_20;
            }
          }
        }
      }
      if (!*v29)
      {
LABEL_20:
        memset(v64, 170, 24);
        std::__tree<std::__value_type<unsigned int,Security::CFCopyRef<__CFData const*>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,Security::CFCopyRef<__CFData const*>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,Security::CFCopyRef<__CFData const*>>>>::__construct_node<std::pair<unsigned int const,Security::CFCopyRef<__CFData const*>> const&>(v64, (uint64_t)&v59, *((_DWORD *)v21 + 8), (const void *)v21[5]);
        uint64_t v30 = (uint64_t *)v64[0];
        *(void *)v64[0] = 0;
        v30[1] = 0;
        v30[2] = (uint64_t)v28;
        uint64_t *v29 = v30;
        if (*v59)
        {
          int v59 = (uint64_t **)*v59;
          uint64_t v30 = *v29;
        }
        std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(v60, v30);
        ++v61;
        v64[0] = 0;
        std::unique_ptr<std::__tree_node<std::__value_type<int,Security::CFCopyRef<__CFData const*>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<int,Security::CFCopyRef<__CFData const*>>,void *>>>>::reset[abi:ne180100]((uint64_t)v64);
      }
      std::string::size_type v31 = (void *)v21[1];
      if (v31)
      {
        do
        {
          char v32 = v31;
          std::string::size_type v31 = (void *)*v31;
        }
        while (v31);
      }
      else
      {
        do
        {
          char v32 = (void *)v21[2];
          BOOL v26 = *v32 == (void)v21;
          size_t v21 = v32;
        }
        while (!v26);
      }
      size_t v21 = v32;
    }
    while (v32 != a10 + 1);
  }
  if ((uint64_t ***)(a2 + 200) != &v59)
  {
    uint64_t v34 = v59;
    if (*(void *)(a2 + 216))
    {
      uint64_t v36 = (uint64_t **)(a2 + 208);
      uint64_t v35 = *(void *)(a2 + 208);
      uint64_t v37 = *(Security::CodeSigning::SecCodeSigner::Signer ***)(a2 + 200);
      *(void *)(a2 + 200) = a2 + 208;
      *(void *)(v35 + 16) = 0;
      *(void *)(a2 + 208) = 0;
      *(void *)(a2 + 216) = 0;
      if (v37[1]) {
        long long v38 = v37[1];
      }
      else {
        long long v38 = (Security::CodeSigning::SecCodeSigner::Signer *)v37;
      }
      v64[0] = (Security::CodeSigning::SecCodeSigner::Signer *)(a2 + 200);
      v64[1] = v38;
      v64[2] = v38;
      if (v38)
      {
        v64[1] = (Security::CodeSigning::SecCodeSigner::Signer *)std::__tree<unsigned int>::_DetachedTreeCache::__detach_next((uint64_t)v38);
        uint64_t v39 = &v60;
        if (v34 != &v60)
        {
          do
          {
            *((_DWORD *)v38 + 8) = *((_DWORD *)v34 + 8);
            Security::CFRef<__CFData const*>::operator=((CFTypeRef *)v38 + 5, (CFTypeRef *)v34 + 5);
            uint64_t v40 = *v36;
            CFDateRef v41 = (uint64_t **)(a2 + 208);
            CFStringRef v42 = (uint64_t **)(a2 + 208);
            if (*v36)
            {
              do
              {
                while (1)
                {
                  CFDateRef v41 = (uint64_t **)v40;
                  if (*((_DWORD *)v64[2] + 8) >= *((_DWORD *)v40 + 8)) {
                    break;
                  }
                  uint64_t v40 = (uint64_t *)*v40;
                  CFStringRef v42 = v41;
                  if (!*v41) {
                    goto LABEL_51;
                  }
                }
                uint64_t v40 = (uint64_t *)v40[1];
              }
              while (v40);
              CFStringRef v42 = v41 + 1;
            }
LABEL_51:
            std::__tree<std::__value_type<int,Security::CFCopyRef<__CFData const*>>,std::__map_value_compare<int,std::__value_type<int,Security::CFCopyRef<__CFData const*>>,std::less<int>,true>,std::allocator<std::__value_type<int,Security::CFCopyRef<__CFData const*>>>>::__insert_node_at((uint64_t **)(a2 + 200), (uint64_t)v41, v42, (uint64_t *)v64[2]);
            long long v38 = v64[1];
            v64[2] = v64[1];
            if (v64[1]) {
              v64[1] = (Security::CodeSigning::SecCodeSigner::Signer *)std::__tree<unsigned int>::_DetachedTreeCache::__detach_next((uint64_t)v64[1]);
            }
            unint64_t v43 = v34[1];
            if (v43)
            {
              do
              {
                uint64_t v39 = (uint64_t **)v43;
                unint64_t v43 = (uint64_t *)*v43;
              }
              while (v43);
            }
            else
            {
              do
              {
                uint64_t v39 = (uint64_t **)v34[2];
                BOOL v26 = *v39 == (uint64_t *)v34;
                uint64_t v34 = v39;
              }
              while (!v26);
            }
            if (!v38) {
              break;
            }
            uint64_t v34 = v39;
          }
          while (v39 != &v60);
        }
      }
      else
      {
        uint64_t v39 = v34;
      }
      std::__tree<std::__value_type<unsigned int,Security::CFCopyRef<__CFData const*>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,Security::CFCopyRef<__CFData const*>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,Security::CFCopyRef<__CFData const*>>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100]((uint64_t)v64);
      uint64_t v34 = v39;
    }
    if (v34 != &v60)
    {
      uint64_t v44 = (uint64_t **)(a2 + 208);
      do
      {
        memset(v64, 170, 24);
        std::__tree<std::__value_type<unsigned int,Security::CFCopyRef<__CFData const*>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,Security::CFCopyRef<__CFData const*>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,Security::CFCopyRef<__CFData const*>>>>::__construct_node<std::pair<unsigned int const,Security::CFCopyRef<__CFData const*>> const&>(v64, a2 + 200, *((_DWORD *)v34 + 8), v34[5]);
        v45 = *v44;
        uint64_t v46 = (uint64_t **)(a2 + 208);
        uint64_t v47 = (uint64_t **)(a2 + 208);
        if (*v44)
        {
          do
          {
            while (1)
            {
              uint64_t v46 = (uint64_t **)v45;
              if (*((_DWORD *)v64[0] + 8) >= *((_DWORD *)v45 + 8)) {
                break;
              }
              v45 = (uint64_t *)*v45;
              uint64_t v47 = v46;
              if (!*v46) {
                goto LABEL_71;
              }
            }
            v45 = (uint64_t *)v45[1];
          }
          while (v45);
          uint64_t v47 = v46 + 1;
        }
LABEL_71:
        std::__tree<std::__value_type<int,Security::CFCopyRef<__CFData const*>>,std::__map_value_compare<int,std::__value_type<int,Security::CFCopyRef<__CFData const*>>,std::less<int>,true>,std::allocator<std::__value_type<int,Security::CFCopyRef<__CFData const*>>>>::__insert_node_at((uint64_t **)(a2 + 200), (uint64_t)v46, v47, (uint64_t *)v64[0]);
        v64[0] = 0;
        std::unique_ptr<std::__tree_node<std::__value_type<int,Security::CFCopyRef<__CFData const*>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<int,Security::CFCopyRef<__CFData const*>>,void *>>>>::reset[abi:ne180100]((uint64_t)v64);
        uint64_t v48 = v34[1];
        if (v48)
        {
          do
          {
            unint64_t v49 = (uint64_t **)v48;
            uint64_t v48 = (uint64_t *)*v48;
          }
          while (v48);
        }
        else
        {
          do
          {
            unint64_t v49 = (uint64_t **)v34[2];
            BOOL v26 = *v49 == (uint64_t *)v34;
            uint64_t v34 = v49;
          }
          while (!v26);
        }
        uint64_t v34 = v49;
      }
      while (v49 != &v60);
    }
  }
  std::__tree<std::__value_type<int,Security::CFCopyRef<__CFData const*>>,std::__map_value_compare<int,std::__value_type<int,Security::CFCopyRef<__CFData const*>>,std::less<int>,true>,std::allocator<std::__value_type<int,Security::CFCopyRef<__CFData const*>>>>::destroy((const void **)v60);
  *(_DWORD *)(a2 + 224) = a11;
  uint64_t v50 = (Security::CodeSigning::SecCodeSigner::Signer *)(*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 24))(*(void *)(a1 + 24), 1);
  v64[0] = v50;
  if (v50) {
    Security::CodeSigning::CodeDirectory::Builder::specialSlot((Security::CodeSigning::CodeDirectory::Builder *)a2, 1u, v50);
  }
  Security::CFRef<__CFData const*>::~CFRef((const void **)v64);
  uint64_t v51 = *(void *)(v57 + 24);
  if (v51)
  {
    v64[0] = CFDataCreate(0, (const UInt8 *)v51, bswap32(*(_DWORD *)(v51 + 4)));
    (*(void (**)(uint64_t, uint64_t, Security::CodeSigning::SecCodeSigner::Signer *))(*(void *)a3 + 16))(a3, 2, v64[0]);
    Security::CodeSigning::CodeDirectory::Builder::specialSlot((Security::CodeSigning::CodeDirectory::Builder *)a2, 2u, v64[0]);
  }
  if (*(void *)(a1 + 96)) {
    Security::CodeSigning::CodeDirectory::Builder::specialSlot((Security::CodeSigning::CodeDirectory::Builder *)a2, 3u, *(const __CFData **)(a1 + 104));
  }
  long long v52 = *(const __CFData ***)(a1 + 192);
  int64_t v53 = *(const __CFData ***)(a1 + 200);
  if (v52 != v53)
  {
    uint64_t v54 = 8;
    do
    {
      if (*v52)
      {
        (*(void (**)(uint64_t, uint64_t))(*(void *)a3 + 16))(a3, v54);
        Security::CodeSigning::CodeDirectory::Builder::specialSlot((Security::CodeSigning::CodeDirectory::Builder *)a2, v54, *v52);
      }
      uint64_t v54 = (v54 + 1);
      ++v52;
    }
    while (v52 != v53);
  }
  if (*(void *)(a1 + 216))
  {
    (*(void (**)(uint64_t, uint64_t))(*(void *)a3 + 16))(a3, 11);
    Security::CodeSigning::CodeDirectory::Builder::specialSlot((Security::CodeSigning::CodeDirectory::Builder *)a2, 0xBu, *(const __CFData **)(a1 + 216));
  }
  if (*(void *)(a1 + 184) && ((v58 & 1) != 0 || *(unsigned char *)(*(void *)(a1 + 8) + 72)))
  {
    (*(void (**)(uint64_t, uint64_t))(*(void *)a3 + 16))(a3, 5);
    Security::CodeSigning::CodeDirectory::Builder::specialSlot((Security::CodeSigning::CodeDirectory::Builder *)a2, 5u, *(const __CFData **)(a1 + 184));
  }
  CFTypeRef v55 = (Security::CodeSigning::SecCodeSigner::Signer *)(*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 24))(*(void *)(a1 + 24), 6);
  v64[0] = v55;
  if (v55) {
    Security::CodeSigning::CodeDirectory::Builder::specialSlot((Security::CodeSigning::CodeDirectory::Builder *)a2, 6u, v55);
  }
  Security::CFRef<__CFData const*>::~CFRef((const void **)v64);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a3 + 32))(a3, a2);
}

void sub_18B400730(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, const void *a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,long long buf)
{
  if (a2 == 1)
  {
    uint64_t v24 = __cxa_begin_catch(a1);
    uint64_t v25 = secLogObjForScope("SecWarning");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v26 = (*(uint64_t (**)(void *))(*(void *)v24 + 16))(v24);
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = v26;
      _os_log_impl(&dword_18B299000, v25, OS_LOG_TYPE_DEFAULT, "failed to parse entitlements: %s", (uint8_t *)&buf, 0xCu);
    }
    __cxa_rethrow();
  }
  Security::CFRef<__CFData const*>::~CFRef(&a12);
  _Unwind_Resume(a1);
}

void sub_18B40082C()
{
}

void sub_18B400840(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void sub_18B400850(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, const void **a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  std::__tree<std::__value_type<unsigned int,Security::CFCopyRef<__CFData const*>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,Security::CFCopyRef<__CFData const*>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,Security::CFCopyRef<__CFData const*>>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100]((uint64_t)va);
  std::__tree<std::__value_type<int,Security::CFCopyRef<__CFData const*>>,std::__map_value_compare<int,std::__value_type<int,Security::CFCopyRef<__CFData const*>>,std::less<int>,true>,std::allocator<std::__value_type<int,Security::CFCopyRef<__CFData const*>>>>::destroy(a7);
  _Unwind_Resume(a1);
}

CFDataRef Security::CodeSigning::SecCodeSigner::Signer::signCodeDirectory(Security::CodeSigning::SecCodeSigner::Signer *this, const Security::CodeSigning::CodeDirectory *a2, const __CFDictionary *a3, const __CFArray *a4)
{
  uint64_t v116 = *MEMORY[0x1E4F143B8];
  if (!*((unsigned char *)this + 322))
  {
    *(void *)int v113 = 0;
    if (*(void *)(*((void *)this + 1) + 24) != *MEMORY[0x1E4F1D260])
    {
      cmsEncoderOut[0] = 0;
      uint64_t updated = CMSEncoderCreate(cmsEncoderOut);
      if (!updated)
      {
        CMSEncoderRef v10 = cmsEncoderOut[0];
        if (!cmsEncoderOut[0]
          || *((_DWORD *)cmsEncoderOut[0] + 4)
          || (*((_DWORD *)cmsEncoderOut[0] + 30) = 4,
              CMSEncoderAddSigners(v10, *(CFTypeRef *)(*((void *)this + 1) + 24)),
              CMSEncoderSetSignerAlgorithm(v10, @"sha256"),
              *((_DWORD *)v10 + 4)))
        {
          uint64_t updated = 4294967246;
        }
        else
        {
          *((unsigned char *)v10 + 24) = 1;
          if (*((unsigned char *)this + 320))
          {
            *((_DWORD *)v10 + 18) |= 8u;
            double Current = *((double *)this + 39);
            if (Current == 0.0 && (Current = CFAbsoluteTimeGetCurrent(), (CMSEncoderRef v10 = cmsEncoderOut[0]) == 0)
              || *((_DWORD *)v10 + 4))
            {
              Security::MacOSError::throwMe((Security::MacOSError *)0xFFFFFFCELL);
            }
            *((double *)v10 + 10) = Current;
          }
          if (a3)
          {
            *((_DWORD *)v10 + 18) |= 0x20u;
            CFRetain(a3);
            *((void *)v10 + 17) = a3;
            *(void *)propertyList = 0xAAAAAAAAAAAAAAAALL;
            Security::CFTemp<__CFDictionary const*>::CFTemp((CFTypeRef *)propertyList, (uint64_t)"{cdhashes=%O}", v12, v13, v14, v15, v16, v17, (uint64_t)a4);
            CFDataRef Data = CFPropertyListCreateData(0, *(CFPropertyListRef *)propertyList, kCFPropertyListXMLFormat_v1_0, 0, 0);
            CFDataRef v19 = Data;
            CFTypeRef cf = Data;
            CMSEncoderRef v20 = cmsEncoderOut[0];
            if (!cmsEncoderOut[0] || *((_DWORD *)cmsEncoderOut[0] + 4)) {
              Security::MacOSError::throwMe((Security::MacOSError *)0xFFFFFFCELL);
            }
            *((_DWORD *)cmsEncoderOut[0] + 18) |= 0x10u;
            if (Data) {
              CFRetain(Data);
            }
            *((void *)v20 + 16) = v19;
            Security::CFRef<__CFData const*>::~CFRef(&cf);
            Security::CFRef<__CFDictionary const*>::~CFRef((const void **)propertyList);
            CMSEncoderRef v10 = cmsEncoderOut[0];
          }
          uint64_t updated = CMSEncoderUpdateContent(v10, a2, bswap32(*((_DWORD *)a2 + 1)));
          if (!updated)
          {
            if (!*(unsigned char *)(*((void *)this + 1) + 280))
            {
              *(void *)propertyList = 0xAAAAAAAAAAAAAAAALL;
              size_t v21 = (Security::MacOSError *)CMSEncoderCopyEncodedContent(cmsEncoderOut[0], (CFDataRef *)propertyList);
              if (v21) {
                Security::MacOSError::throwMe(v21);
              }
              CFDataRef v22 = *(CFDataRef *)propertyList;
              Security::CFRef<_CMSEncoder *>::~CFRef((const void **)cmsEncoderOut);
              goto LABEL_64;
            }
            CFIndex v88 = secLogObjForScope("SecError");
            if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)propertyList = 0;
              _os_log_impl(&dword_18B299000, v88, OS_LOG_TYPE_DEFAULT, "Platform does not support signing secure timestamps", propertyList, 2u);
            }
            uint64_t updated = 4294967292;
          }
        }
      }
      Security::MacOSError::throwMe((Security::MacOSError *)updated);
    }
    CFDataRef v22 = CFDataCreate(0, 0, 0);
LABEL_64:
    Security::CFRef<__CFDictionary *>::~CFRef((const void **)v113);
    return v22;
  }
  if (*((unsigned char *)this + 320))
  {
    double v8 = *((double *)this + 39);
    if (v8 == 0.0) {
      double v8 = CFAbsoluteTimeGetCurrent();
    }
  }
  else
  {
    double v8 = 0.0;
  }
  uint64_t v23 = (void *)*((void *)this + 41);
  CFArrayRef v24 = (const __CFArray *)*((void *)this + 42);
  CFStringRef v102 = 0;
  id v25 = v23;
  CFTypeRef cf = 0;
  CFStringRef v101 = (uint64_t (**)(void, void, void))v25;
  if (!a2 || !*((_DWORD *)a2 + 1))
  {
    uint64_t v30 = secLogObjForScope("SecError");
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_60;
    }
    *(_WORD *)int v113 = 0;
    uint64_t v57 = "Remote signing requires valid code directory.";
LABEL_58:
    char v58 = v30;
    uint32_t v59 = 2;
LABEL_59:
    _os_log_impl(&dword_18B299000, v58, OS_LOG_TYPE_DEFAULT, v57, v113, v59);
    goto LABEL_60;
  }
  if (!a3)
  {
    uint64_t v30 = secLogObjForScope("SecError");
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_60;
    }
    *(_WORD *)int v113 = 0;
    uint64_t v57 = "Remote signing requires hash dictionary.";
    goto LABEL_58;
  }
  if (!a4)
  {
    uint64_t v30 = secLogObjForScope("SecError");
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_60;
    }
    *(_WORD *)int v113 = 0;
    uint64_t v57 = "Remote signing requires hash list.";
    goto LABEL_58;
  }
  if (!v25)
  {
    uint64_t v30 = secLogObjForScope("SecError");
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_60;
    }
    *(_WORD *)int v113 = 0;
    uint64_t v57 = "Remote signing requires signing block.";
    goto LABEL_58;
  }
  if (v24 && CFArrayGetCount(v24))
  {
    CFDataRef ValueAtIndex = CFArrayGetValueAtIndex(v24, 0);
    unsigned int v27 = ValueAtIndex;
    if (ValueAtIndex) {
      CFRetain(ValueAtIndex);
    }
    CFTypeRef cf = v27;
    uint64_t v28 = *MEMORY[0x1E4F77D88];
    id v106 = 0;
    uint64_t v29 = [MEMORY[0x1E4F77E08] OIDWithString:v28 error:&v106];
    uint64_t v30 = v106;
    std::string v98 = (void *)v29;
    if (!v29)
    {
      long long v62 = secLogObjForScope("SecError");
      uint64_t v60 = 4294899624;
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)int v113 = 138412290;
        *(void *)&v113[4] = v30;
        _os_log_impl(&dword_18B299000, v62, OS_LOG_TYPE_DEFAULT, "Unable to create signing algorithm: %@", v113, 0xCu);
      }
      goto LABEL_119;
    }
    std::string::size_type v31 = objc_alloc(MEMORY[0x1E4F77DF0]);
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      char v63 = secLogObjForScope("SecError");
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v113 = 0;
        _os_log_impl(&dword_18B299000, v63, OS_LOG_TYPE_DEFAULT, "Unable to create signer due to old CMS interfaces", v113, 2u);
      }

      uint64_t v60 = 4294966387;
      long long v62 = v31;
      goto LABEL_119;
    }
    char v32 = v31;
    char v105 = v30;
    int v94 = [v32 initWithCertificate:cf signatureAlgorithm:v29 useIssuerAndSerialNumber:1 error:&v105];
    unsigned int v33 = v105;

    if (!v94 || v33)
    {
      long long v64 = secLogObjForScope("SecError");
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        CFTypeRef v65 = cf;
        uint64_t v66 = [v98 OIDString];
        *(_DWORD *)int v113 = 138412802;
        *(void *)&v113[4] = v65;
        *(_WORD *)&v113[12] = 2112;
        *(void *)&v113[14] = v66;
        __int16 v114 = 2112;
        char v115 = v33;
        _os_log_impl(&dword_18B299000, v64, OS_LOG_TYPE_DEFAULT, "Unable to create signer info: %@, %@, %@", v113, 0x20u);
      }
      uint64_t v60 = 4294900305;
      long long v62 = v94;
      uint64_t v30 = v33;
      goto LABEL_119;
    }
    int v92 = [MEMORY[0x1E4F1C9B8] dataWithBytes:a2 length:bswap32(*((_DWORD *)a2 + 1))];
    id v104 = 0;
    uint64_t v34 = [objc_alloc(MEMORY[0x1E4F77DE8]) initWithDataContent:v92 isDetached:1 signer:v94 additionalCertificates:v24 error:&v104];
    uint64_t v30 = v104;
    std::string v93 = v34;
    if (!v34)
    {
      uint64_t v60 = 4294900305;
      BOOL v67 = secLogObjForScope("SecError");
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)int v113 = 138412290;
        *(void *)&v113[4] = v30;
        _os_log_impl(&dword_18B299000, v67, OS_LOG_TYPE_DEFAULT, "Unable to create signed data: %@", v113, 0xCu);
      }
      goto LABEL_118;
    }
    if (v8 != 0.0)
    {
      CFDateRef v41 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v8];
      CFStringRef v42 = (void *)[objc_alloc(MEMORY[0x1E4F77DF8]) initWithSigningTime:v41];
      [v94 addProtectedAttribute:v42];
    }
    *(void *)int v113 = 0xAAAAAAAAAAAAAAAALL;
    Security::CFTemp<__CFDictionary const*>::CFTemp((CFTypeRef *)v113, (uint64_t)"{cdhashes=%O}", v35, v36, v37, v38, v39, v40, (uint64_t)a4);
    cmsEncoderOut[0] = CFPropertyListCreateData(0, *(CFPropertyListRef *)v113, kCFPropertyListXMLFormat_v1_0, 0, 0);
    unint64_t v43 = cmsEncoderOut[0];
    Security::CFRef<__CFData const*>::~CFRef((const void **)cmsEncoderOut);
    Security::CFRef<__CFDictionary const*>::~CFRef((const void **)v113);
    std::string v90 = v43;
    int v91 = (void *)[objc_alloc(MEMORY[0x1E4F77DA0]) initWithHashAgilityValue:v43];
    [v94 addProtectedAttribute:v91];
    CFDictionaryRef v89 = a3;
    uint64_t v44 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v110 = 0u;
    long long v111 = 0u;
    *(_OWORD *)cmsEncoderOut = 0u;
    long long v109 = 0u;
    CFDictionaryRef v45 = v89;
    uint64_t v46 = v44;
    uint64_t v47 = [(__CFDictionary *)v45 countByEnumeratingWithState:cmsEncoderOut objects:v113 count:16];
    if (v47)
    {
      uint64_t v48 = *(void *)v109;
      std::string::size_type v96 = (void *)*MEMORY[0x1E4F77D50];
      v99 = (void *)*MEMORY[0x1E4F77D48];
      uint64_t v95 = (void *)*MEMORY[0x1E4F77D40];
      unint64_t v49 = (void *)*MEMORY[0x1E4F77D38];
      while (2)
      {
        for (uint64_t i = 0; i != v47; ++i)
        {
          if (*(void *)v109 != v48) {
            objc_enumerationMutation(v45);
          }
          uint64_t v51 = (void *)*((void *)cmsEncoderOut[1] + i);
          int v52 = [v51 intValue];
          if (v52 > 192)
          {
            int64_t v53 = v99;
            if (v52 != 193)
            {
              int64_t v53 = v96;
              if (v52 != 194)
              {
LABEL_84:
                uint64_t v68 = secLogObjForScope("SecError");
                if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)propertyList = 138412290;
                  *(void *)&propertyList[4] = v51;
                  _os_log_impl(&dword_18B299000, v68, OS_LOG_TYPE_DEFAULT, "Unexpected digest algorithm: %@", propertyList, 0xCu);
                }

                uint64_t v44 = v46;
                id v56 = 0;
                goto LABEL_87;
              }
            }
          }
          else
          {
            int64_t v53 = v49;
            if (v52 != 4)
            {
              int64_t v53 = v95;
              if (v52 != 192) {
                goto LABEL_84;
              }
            }
          }
          id v54 = v53;
          CFTypeRef v55 = [(__CFDictionary *)v45 objectForKeyedSubscript:v51];
          uint64_t v44 = v46;
          [v46 setObject:v55 forKeyedSubscript:v54];
        }
        uint64_t v47 = [(__CFDictionary *)v45 countByEnumeratingWithState:cmsEncoderOut objects:v113 count:16];
        if (v47) {
          continue;
        }
        break;
      }
    }

    id v56 = v44;
LABEL_87:

    CFTypeRef v97 = (void *)[objc_alloc(MEMORY[0x1E4F77DA8]) initWithHashAgilityValues:v56];
    [v94 addProtectedAttribute:v97];
    CFTypeID v100 = (void *)[objc_alloc(MEMORY[0x1E4F77DC0]) initWithEmbeddedContent:v93];
    cmsEncoderOut[0] = (CMSEncoderRef)v30;
    uint64_t v69 = [v94 calculateSignerInfoDigest:cmsEncoderOut];
    long long v70 = cmsEncoderOut[0];

    if (!v69)
    {
      uint64_t v60 = 4294900305;
      CFDataRef v73 = secLogObjForScope("SecError");
      if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)int v113 = 138412546;
        *(void *)&v113[4] = v94;
        *(_WORD *)&v113[12] = 2112;
        *(void *)&v113[14] = v70;
        _os_log_impl(&dword_18B299000, v73, OS_LOG_TYPE_DEFAULT, "Unable to create signature digest: %@, %@", v113, 0x16u);
      }
      goto LABEL_117;
    }
    CFTypeID v71 = (void *)MEMORY[0x1E4F77D90];
    long long v72 = [v94 signatureAlgorithm];
    *(void *)propertyList = v70;
    CFDataRef v73 = [v71 digestAlgorithmWithSignatureAlgorithm:v72 error:propertyList];
    id v74 = *(id *)propertyList;

    if (!v73)
    {
      uint64_t v60 = 4294900305;
      unint64_t v78 = secLogObjForScope("SecError");
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)int v113 = 138412546;
        *(void *)&v113[4] = v94;
        *(_WORD *)&v113[12] = 2112;
        *(void *)&v113[14] = v74;
        _os_log_impl(&dword_18B299000, v78, OS_LOG_TYPE_DEFAULT, "Unable to create digest algorithm: %@, %@", v113, 0x16u);
      }
      goto LABEL_116;
    }
    uint64_t v75 = [v73 algorithm];
    id v76 = [v75 OIDString];
    if ([v76 isEqualToString:*MEMORY[0x1E4F77D38]])
    {
      uint64_t v77 = 1;
    }
    else if ([v76 isEqualToString:*MEMORY[0x1E4F77D40]])
    {
      uint64_t v77 = 2;
    }
    else
    {
      if (([v76 isEqualToString:*MEMORY[0x1E4F77D48]] & 1) == 0)
      {
        int v85 = [v76 isEqualToString:*MEMORY[0x1E4F77D50]];
        if (v85) {
          uint64_t v77 = 5;
        }
        else {
          uint64_t v77 = 0;
        }

        if (v85 != 1)
        {
          unint64_t v78 = secLogObjForScope("SecError");
          uint64_t v60 = 4294900296;
          if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
          {
            v86 = [v73 algorithm];
            CFTypeID v87 = [v86 OIDString];
            *(_DWORD *)int v113 = 138412290;
            *(void *)&v113[4] = v87;
            _os_log_impl(&dword_18B299000, v78, OS_LOG_TYPE_DEFAULT, "Unable to map digest algorithm: %@", v113, 0xCu);
          }
          goto LABEL_116;
        }
LABEL_100:
        unsigned int v79 = secLogObjForScope("remotesigner");
        if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)int v113 = 67109378;
          *(_DWORD *)&v113[4] = v77;
          *(_WORD *)&v113[8] = 2112;
          *(void *)&v113[10] = v69;
          _os_log_debug_impl(&dword_18B299000, v79, OS_LOG_TYPE_DEBUG, "Passing out external digest: %d, %@", v113, 0x12u);
        }

        unint64_t v78 = ((uint64_t (**)(void, void *, uint64_t))v101)[2](v101, v69, v77);
        if (v78)
        {
          unint64_t v80 = secLogObjForScope("remotesigner");
          if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)int v113 = 138412290;
            *(void *)&v113[4] = v78;
            _os_log_debug_impl(&dword_18B299000, v80, OS_LOG_TYPE_DEBUG, "Got external signature blob: %@", v113, 0xCu);
          }

          [v94 setSignature:v78];
          BOOL v81 = v74;
          id v103 = v74;
          CFNumberRef v82 = [v100 encodeMessageSecurityObject:&v103];
          id v74 = v103;

          if (!v82 || v74)
          {
            CFTypeID v84 = secLogObjForScope("SecError");
            if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)int v113 = 138412290;
              *(void *)&v113[4] = v74;
              _os_log_impl(&dword_18B299000, v84, OS_LOG_TYPE_DEFAULT, "Failed to encode signature: %@", v113, 0xCu);
            }

            uint64_t v60 = 4294900305;
          }
          else
          {
            CFNumberRef v83 = secLogObjForScope("remotesigner");
            if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)int v113 = 138412290;
              *(void *)&v113[4] = v82;
              _os_log_debug_impl(&dword_18B299000, v83, OS_LOG_TYPE_DEBUG, "Encoded CMS signature: %@", v113, 0xCu);
            }

            CFNumberRef v82 = v82;
            id v74 = 0;
            uint64_t v60 = 0;
            CFStringRef v102 = v82;
          }
        }
        else
        {
          CFNumberRef v82 = secLogObjForScope("SecError");
          uint64_t v60 = 4294900306;
          if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)int v113 = 0;
            _os_log_impl(&dword_18B299000, v82, OS_LOG_TYPE_DEFAULT, "External block did not provide a signature, failing.", v113, 2u);
          }
        }

LABEL_116:
        long long v70 = (_CMSEncoder *)v74;
LABEL_117:

        uint64_t v30 = v70;
        BOOL v67 = v90;
LABEL_118:

        long long v62 = v93;
LABEL_119:

        goto LABEL_61;
      }
      uint64_t v77 = 4;
    }

    goto LABEL_100;
  }
  uint64_t v30 = secLogObjForScope("SecError");
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)int v113 = 138412290;
    *(void *)&v113[4] = v24;
    uint64_t v57 = "Unable to perform remote signing with no certificates: %@";
    char v58 = v30;
    uint32_t v59 = 12;
    goto LABEL_59;
  }
LABEL_60:
  uint64_t v60 = 4294967246;
LABEL_61:

  Security::CFRef<__SecCertificate *>::~CFRef(&cf);
  if (v60) {
    Security::MacOSError::throwMe((Security::MacOSError *)v60);
  }
  CFDataRef v22 = (CFDataRef)v102;
  CFStringRef v102 = 0;
  Security::CFRef<__CFData const*>::~CFRef((const void **)&v102);
  return v22;
}

void sub_18B40185C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14, void *a15, _Unwind_Exception *exception_object, void *a17, void *a18, void *a19, void *a20,const void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,const void *a26,__int16 a27,char a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,char a39)
{
  Security::CFRef<__SecCertificate *>::~CFRef(&a26);
  Security::CFRef<__CFData const*>::~CFRef(&a21);
  _Unwind_Resume(a1);
}

const void **Security::CFRef<_CMSEncoder *>::~CFRef(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const __CFBoolean *Security::CodeSigning::SecCodeSigner::Signer::BOOLeanEntitlement(Security::CodeSigning::SecCodeSigner::Signer *this, const __CFDictionary *a2, const __CFString *a3)
{
  CFBooleanRef result = (const __CFBoolean *)CFDictionaryGetValue(this, a2);
  if (result)
  {
    CFBooleanRef v4 = result;
    CFTypeID v5 = CFGetTypeID(result);
    if (v5 == CFBooleanGetTypeID()) {
      return (const __CFBoolean *)(CFBooleanGetValue(v4) != 0);
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t std::__tree<std::__value_type<unsigned int,Security::CFCopyRef<__CFData const*>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,Security::CFCopyRef<__CFData const*>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,Security::CFCopyRef<__CFData const*>>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100](uint64_t a1)
{
  std::__tree<std::__value_type<int,Security::CFCopyRef<__CFData const*>>,std::__map_value_compare<int,std::__value_type<int,Security::CFCopyRef<__CFData const*>>,std::less<int>,true>,std::allocator<std::__value_type<int,Security::CFCopyRef<__CFData const*>>>>::destroy(*(const void ***)(a1 + 16));
  uint64_t v2 = *(void *)(a1 + 8);
  if (v2)
  {
    uint64_t v3 = *(void *)(v2 + 16);
    if (v3)
    {
      do
      {
        uint64_t v2 = v3;
        uint64_t v3 = *(void *)(v3 + 16);
      }
      while (v3);
      *(void *)(a1 + 8) = v2;
    }
    std::__tree<std::__value_type<int,Security::CFCopyRef<__CFData const*>>,std::__map_value_compare<int,std::__value_type<int,Security::CFCopyRef<__CFData const*>>,std::less<int>,true>,std::allocator<std::__value_type<int,Security::CFCopyRef<__CFData const*>>>>::destroy((const void **)v2);
  }
  return a1;
}

_DWORD *std::__tree<std::__value_type<unsigned int,Security::CFCopyRef<__CFData const*>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,Security::CFCopyRef<__CFData const*>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,Security::CFCopyRef<__CFData const*>>>>::__construct_node<std::pair<unsigned int const,Security::CFCopyRef<__CFData const*>> const&>(void *a1, uint64_t a2, int a3, const void *a4)
{
  uint64_t v7 = a2 + 8;
  memset(a1, 170, 24);
  CFBooleanRef result = operator new(0x30uLL);
  *a1 = result;
  a1[1] = v7;
  *((unsigned char *)a1 + 16) = 0;
  result[8] = a3;
  *((void *)result + 5) = a4;
  if (a4) {
    CFBooleanRef result = CFRetain(a4);
  }
  *((unsigned char *)a1 + 16) = 1;
  return result;
}

void sub_18B401C08(_Unwind_Exception *a1)
{
  Security::CFRef<__CFData const*>::~CFRef(v2);
  std::unique_ptr<std::__tree_node<std::__value_type<int,Security::CFCopyRef<__CFData const*>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<int,Security::CFCopyRef<__CFData const*>>,void *>>>>::reset[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t **std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(uint64_t **a1, unsigned int a2, _DWORD *a3)
{
  int v6 = a1 + 1;
  CFTypeID v5 = a1[1];
  if (v5)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v7 = (uint64_t **)v5;
        unsigned int v8 = *((_DWORD *)v5 + 7);
        if (v8 <= a2) {
          break;
        }
        CFTypeID v5 = *v7;
        int v6 = v7;
        if (!*v7) {
          goto LABEL_9;
        }
      }
      if (v8 >= a2) {
        break;
      }
      CFTypeID v5 = v7[1];
      if (!v5)
      {
        int v6 = v7 + 1;
        goto LABEL_9;
      }
    }
  }
  else
  {
    uint64_t v7 = a1 + 1;
LABEL_9:
    BOOL v9 = (uint64_t *)v7;
    uint64_t v7 = (uint64_t **)operator new(0x28uLL);
    *((_DWORD *)v7 + 7) = *a3;
    *((_DWORD *)v7 + 8) = 0;
    const void *v7 = 0;
    v7[1] = 0;
    v7[2] = v9;
    *int v6 = (uint64_t *)v7;
    CMSEncoderRef v10 = (uint64_t *)**a1;
    BOOL v11 = (uint64_t *)v7;
    if (v10)
    {
      *a1 = v10;
      BOOL v11 = *v6;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], v11);
    a1[2] = (uint64_t *)((char *)a1[2] + 1);
  }
  return v7;
}

uint64_t ___ZN8Security11CodeSigning13SecCodeSigner6Signer9signMachOEPNS_9UniversalERKNS0_11Requirement7ContextE_block_invoke(uint64_t a1, uint64_t a2)
{
  CFTypeID v5 = *(void ***)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  int v6 = *(Security::MachO **)(v4 + 56);
  uint64_t v7 = *((void *)v6 + 6);
  uint64_t v8 = Security::MachO::signingExtent(v6);
  unsigned int v9 = *(unsigned __int8 *)(a1 + 52);
  uint64_t v10 = (*(uint64_t (**)(void *, uint64_t))(*v5[3] + 104))(v5[3], *(void *)(a1 + 40) + 48);
  uint64_t v11 = (*(uint64_t (**)(void *, uint64_t))(*v5[3] + 112))(v5[3], *(void *)(a1 + 40) + 48);
  ((void (*)(void **))(*v5)[3])(v5);
  uint64_t v12 = std::__tree<std::__value_type<Security::Architecture,std::map<unsigned int,Security::CFCopyRef<__CFData const*>>>,std::__map_value_compare<Security::Architecture,std::__value_type<Security::Architecture,std::map<unsigned int,Security::CFCopyRef<__CFData const*>>>,std::less<Security::Architecture>,true>,std::allocator<std::__value_type<Security::Architecture,std::map<unsigned int,Security::CFCopyRef<__CFData const*>>>>>::__emplace_unique_key_args<Security::Architecture,std::piecewise_construct_t const&,std::tuple<Security::Architecture const&>,std::tuple<>>(v5 + 29, *(void *)(*(void *)(a1 + 40) + 48), (uint64_t *)(*(void *)(a1 + 40) + 48));
  return Security::CodeSigning::SecCodeSigner::Signer::populate((uint64_t)v5, a2, v4, v4 + 88, v7, v8, v9, v10, v11, (void *)v12 + 5, *(_DWORD *)(a1 + 48));
}

__n128 __Block_byref_object_copy__47(void *a1, uint64_t a2)
{
  a1[5] = 0;
  a1[6] = 0;
  a1[7] = 0;
  __n128 result = *(__n128 *)(a2 + 40);
  *(__n128 *)(a1 + 5) = result;
  a1[7] = *(void *)(a2 + 56);
  *(void *)(a2 + 40) = 0;
  *(void *)(a2 + 48) = 0;
  *(void *)(a2 + 56) = 0;
  return result;
}

void __Block_byref_object_dispose__48(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 40);
  if (v2)
  {
    *(void *)(a1 + 48) = v2;
    operator delete(v2);
  }
}

void ___ZN8Security11CodeSigning13SecCodeSigner6Signer9signMachOEPNS_9UniversalERKNS0_11Requirement7ContextE_block_invoke_49(uint64_t a1, Security::CodeSigning::CodeDirectory::Builder *this)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8);
  unint64_t v3 = Security::CodeSigning::CodeDirectory::Builder::size(this, 0x20500u);
  unint64_t v4 = v3;
  int v6 = (unint64_t *)v2[6];
  unint64_t v5 = v2[7];
  if ((unint64_t)v6 >= v5)
  {
    uint64_t v8 = (unint64_t *)v2[5];
    uint64_t v9 = v6 - v8;
    unint64_t v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 61) {
      std::vector<CESerializedElement>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = v5 - (void)v8;
    if (v11 >> 2 > v10) {
      unint64_t v10 = v11 >> 2;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v10;
    }
    if (v12)
    {
      if (v12 >> 61) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      uint64_t v13 = (char *)operator new(8 * v12);
    }
    else
    {
      uint64_t v13 = 0;
    }
    uint64_t v14 = (unint64_t *)&v13[8 * v9];
    *uint64_t v14 = v4;
    uint64_t v7 = v14 + 1;
    while (v6 != v8)
    {
      unint64_t v15 = *--v6;
      *--uint64_t v14 = v15;
    }
    v2[5] = v14;
    v2[6] = v7;
    v2[7] = &v13[8 * v12];
    if (v8) {
      operator delete(v8);
    }
  }
  else
  {
    *int v6 = v3;
    uint64_t v7 = v6 + 1;
  }
  v2[6] = v7;
}

uint64_t *__Block_byref_object_copy__51(uint64_t *result, void *a2)
{
  unint64_t v3 = result;
  result[6] = 0;
  unint64_t v4 = result + 6;
  result[5] = (uint64_t)(result + 6);
  unint64_t v5 = (uint64_t **)(result + 5);
  result[7] = 0;
  int v6 = (void *)a2[5];
  uint64_t v7 = a2 + 6;
  if (v6 != a2 + 6)
  {
    do
    {
      uint64_t v8 = (unsigned int *)(v6 + 4);
      uint64_t v9 = (uint64_t *)*v4;
      unint64_t v10 = v4;
      if (*v5 == v4) {
        goto LABEL_8;
      }
      uint64_t v11 = (uint64_t *)*v4;
      unint64_t v12 = v4;
      if (v9)
      {
        do
        {
          unint64_t v10 = v11;
          uint64_t v11 = (uint64_t *)v11[1];
        }
        while (v11);
      }
      else
      {
        do
        {
          unint64_t v10 = (uint64_t *)v12[2];
          BOOL v13 = *v10 == (void)v12;
          unint64_t v12 = v10;
        }
        while (v13);
      }
      unsigned int v14 = *v8;
      if (*((_DWORD *)v10 + 8) < *v8)
      {
LABEL_8:
        if (v9) {
          unint64_t v15 = (uint64_t **)v10;
        }
        else {
          unint64_t v15 = (uint64_t **)v4;
        }
        if (v9) {
          uint64_t v16 = (uint64_t **)(v10 + 1);
        }
        else {
          uint64_t v16 = (uint64_t **)v4;
        }
      }
      else
      {
        unint64_t v15 = (uint64_t **)v4;
        uint64_t v16 = (uint64_t **)v4;
        if (v9)
        {
          uint64_t v16 = (uint64_t **)v4;
          while (1)
          {
            while (1)
            {
              unint64_t v15 = (uint64_t **)v9;
              unsigned int v20 = *((_DWORD *)v9 + 8);
              if (v14 >= v20) {
                break;
              }
              uint64_t v9 = *v15;
              uint64_t v16 = v15;
              if (!*v15) {
                goto LABEL_15;
              }
            }
            if (v20 >= v14) {
              break;
            }
            uint64_t v16 = v15 + 1;
            uint64_t v9 = v15[1];
            if (!v9) {
              goto LABEL_15;
            }
          }
        }
      }
      if (!*v16)
      {
LABEL_15:
        uint64_t v17 = (uint64_t *)operator new(0x30uLL);
        *((_OWORD *)v17 + 2) = *(_OWORD *)v8;
        __n128 result = std::__tree<std::__value_type<int,Security::CFCopyRef<__CFData const*>>,std::__map_value_compare<int,std::__value_type<int,Security::CFCopyRef<__CFData const*>>,std::less<int>,true>,std::allocator<std::__value_type<int,Security::CFCopyRef<__CFData const*>>>>::__insert_node_at(v5, (uint64_t)v15, v16, v17);
      }
      CFStringRef v18 = (void *)v6[1];
      if (v18)
      {
        do
        {
          CFDataRef v19 = v18;
          CFStringRef v18 = (void *)*v18;
        }
        while (v18);
      }
      else
      {
        do
        {
          CFDataRef v19 = (void *)v6[2];
          BOOL v13 = *v19 == (void)v6;
          int v6 = v19;
        }
        while (!v13);
      }
      int v6 = v19;
    }
    while (v19 != v7);
  }
  v3[8] = a2[8];
  return result;
}

void sub_18B4020E8(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy(*v1);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_dispose__52(uint64_t a1)
{
  return Security::SuperBlobCore<Security::CodeSigning::EmbeddedSignatureBlob,4208856256u,unsigned int>::Maker::~Maker(a1 + 40);
}

void ___ZN8Security11CodeSigning13SecCodeSigner6Signer9signMachOEPNS_9UniversalERKNS0_11Requirement7ContextE_block_invoke_53(uint64_t a1, Security::CodeSigning::CodeDirectory::Builder *this)
{
  unint64_t v3 = (const Security::CodeSigning::CodeDirectory *)Security::CodeSigning::CodeDirectory::Builder::build(this);
  unint64_t v4 = (Security::CodeSigning::CodeDirectorySet *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);

  Security::CodeSigning::CodeDirectorySet::add(v4, v3);
}

_DWORD *Security::Blob<Security::SuperBlob<4208856065u,unsigned int>,4208856065u>::specific(_DWORD *result)
{
  if (*result == 17620730
    && (v1 = bswap32(result[2]), v2 = 8 * v1 + 12, unint64_t v3 = bswap32(result[1]), v2 <= v3))
  {
    unint64_t v5 = (unint64_t)&result[2 * v1 + 3];
    while (1)
    {
      v5 -= 8;
      if (v5 < (unint64_t)(result + 3)) {
        break;
      }
      unsigned int v6 = *(_DWORD *)(v5 + 4);
      if (v6)
      {
        unint64_t v7 = bswap32(v6);
        BOOL v8 = v2 > v7 || v7 + 8 > v3;
        if (v8 || bswap32(*(_DWORD *)((char *)result + v7 + 4)) + v7 > v3) {
          return 0;
        }
      }
    }
  }
  else
  {
    unint64_t v4 = __error();
    __n128 result = 0;
    *unint64_t v4 = 22;
  }
  return result;
}

const void **Security::CFRef<__CFString *>::~CFRef(const void **a1)
{
  unint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

_DWORD *Security::CodeSigning::SecCodeSigner::Signer::addPreEncryptHashes(uint64_t **a1, Security::CodeSigning::SecStaticCode *this)
{
  __n128 result = Security::CodeSigning::SecStaticCode::codeDirectories(this, 1);
  if (result)
  {
    unint64_t v4 = result + 2;
    unint64_t v5 = *(void **)result;
    if (*(_DWORD **)result != result + 2)
    {
      do
      {
        unsigned int v6 = *((_DWORD *)v5 + 8);
        unsigned int v14 = v6;
        __n128 result = CFDataGetBytePtr((CFDataRef)v5[5]);
        if (bswap32(result[2]) >> 8 >= 0x205)
        {
          unsigned int v7 = result[23];
          BOOL v9 = v7 == 0;
          uint64_t v8 = bswap32(v7);
          BOOL v9 = v9 || (_DWORD *)((char *)result + v8) == 0;
          if (!v9)
          {
            CFDataRef v13 = (CFDataRef)0xAAAAAAAAAAAAAAAALL;
            CFDataRef v13 = CFDataCreate(0, (const UInt8 *)result + v8, bswap32(result[7]) * *((unsigned __int8 *)result + 36));
            unint64_t v10 = std::__tree<std::__value_type<unsigned int,Security::CFCopyRef<__CFData const*>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,Security::CFCopyRef<__CFData const*>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,Security::CFCopyRef<__CFData const*>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(a1, v6, &v14);
            Security::CFRef<__CFData const*>::operator=((CFTypeRef *)v10 + 5, (CFTypeRef *)&v13);
            __n128 result = Security::CFRef<__CFData const*>::~CFRef((const void **)&v13);
          }
        }
        uint64_t v11 = (void *)v5[1];
        if (v11)
        {
          do
          {
            unint64_t v12 = v11;
            uint64_t v11 = (void *)*v11;
          }
          while (v11);
        }
        else
        {
          do
          {
            unint64_t v12 = (void *)v5[2];
            BOOL v9 = *v12 == (void)v5;
            unint64_t v5 = v12;
          }
          while (!v9);
        }
        unint64_t v5 = v12;
      }
      while (v12 != v4);
    }
  }
  return result;
}

void sub_18B40233C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
}

_DWORD *___ZN8Security11CodeSigning13SecCodeSigner6Signer7prepareEj_block_invoke(uint64_t a1, Security::CodeSigning::SecStaticCode *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  unint64_t v4 = (Security::Universal *)(*(uint64_t (**)(void *))(**((void **)a2 + 4) + 80))(*((void **)a2 + 4));
  unint64_t v7 = Security::Universal::bestNativeArch(v4);
  unint64_t v5 = std::__tree<std::__value_type<Security::Architecture,std::map<unsigned int,Security::CFCopyRef<__CFData const*>>>,std::__map_value_compare<Security::Architecture,std::__value_type<Security::Architecture,std::map<unsigned int,Security::CFCopyRef<__CFData const*>>>,std::less<Security::Architecture>,true>,std::allocator<std::__value_type<Security::Architecture,std::map<unsigned int,Security::CFCopyRef<__CFData const*>>>>>::__emplace_unique_key_args<Security::Architecture,std::piecewise_construct_t const&,std::tuple<Security::Architecture const&>,std::tuple<>>((uint64_t **)(v3 + 232), v7, (uint64_t *)&v7);
  return Security::CodeSigning::SecCodeSigner::Signer::addPreEncryptHashes((uint64_t **)v5 + 5, a2);
}

_DWORD *Security::CodeSigning::SecCodeSigner::Signer::addRuntimeVersions(uint64_t **a1, Security::CodeSigning::SecStaticCode *this)
{
  __n128 result = Security::CodeSigning::SecStaticCode::codeDirectories(this, 1);
  if (result)
  {
    unint64_t v4 = result + 2;
    unint64_t v5 = *(void **)result;
    if (*(_DWORD **)result != result + 2)
    {
      do
      {
        unsigned int v6 = *((_DWORD *)v5 + 8);
        unsigned int v12 = v6;
        __n128 result = CFDataGetBytePtr((CFDataRef)v5[5]);
        if (bswap32(result[2]) >> 8 >= 0x205)
        {
          unsigned int v7 = result[22];
          if (v7)
          {
            unsigned int v8 = bswap32(v7);
            __n128 result = std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(a1, v6, &v12);
            result[8] = v8;
          }
        }
        BOOL v9 = (void *)v5[1];
        if (v9)
        {
          do
          {
            unint64_t v10 = v9;
            BOOL v9 = (void *)*v9;
          }
          while (v9);
        }
        else
        {
          do
          {
            unint64_t v10 = (void *)v5[2];
            BOOL v11 = *v10 == (void)v5;
            unint64_t v5 = v10;
          }
          while (!v11);
        }
        unint64_t v5 = v10;
      }
      while (v10 != v4);
    }
  }
  return result;
}

_DWORD *___ZN8Security11CodeSigning13SecCodeSigner6Signer7prepareEj_block_invoke_2(uint64_t a1, Security::CodeSigning::SecStaticCode *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  unint64_t v4 = (Security::Universal *)(*(uint64_t (**)(void *))(**((void **)a2 + 4) + 80))(*((void **)a2 + 4));
  unint64_t v7 = Security::Universal::bestNativeArch(v4);
  unint64_t v5 = std::__tree<std::__value_type<Security::Architecture,std::map<unsigned int,Security::CFCopyRef<__CFData const*>>>,std::__map_value_compare<Security::Architecture,std::__value_type<Security::Architecture,std::map<unsigned int,Security::CFCopyRef<__CFData const*>>>,std::less<Security::Architecture>,true>,std::allocator<std::__value_type<Security::Architecture,std::map<unsigned int,Security::CFCopyRef<__CFData const*>>>>>::__emplace_unique_key_args<Security::Architecture,std::piecewise_construct_t const&,std::tuple<Security::Architecture const&>,std::tuple<>>((uint64_t **)(v3 + 264), v7, (uint64_t *)&v7);
  return Security::CodeSigning::SecCodeSigner::Signer::addRuntimeVersions((uint64_t **)v5 + 5, a2);
}

void ___ZN8Security11CodeSigning13SecCodeSigner6Signer14buildResourcesENSt3__112basic_stringIcNS3_11char_traitsIcEENS3_9allocatorIcEEEES9_PK14__CFDictionary_block_invoke(void *a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = a1[4];
  BOOL v9 = *(unsigned __int16 *)(a2 + 88) == 12;
  memset(&v24, 170, sizeof(v24));
  std::string::basic_string[abi:ne180100]<0>(&v24, *(char **)(a2 + 48));
  memset(&v23, 170, sizeof(v23));
  std::string::basic_string[abi:ne180100]<0>(&v23, *(char **)(a2 + 40));
  CFDataRef v22 = 0;
  unint64_t v10 = (const void *)a1[5];
  if (v10) {
    CFRetain(v10);
  }
  CFDataRef v22 = 0;
  uint64_t v11 = *(void *)(*(void *)(v8 + 8) + 288);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 1174405120;
  v14[2] = ___ZN8Security11CodeSigning13SecCodeSigner6Signer14buildResourcesENSt3__112basic_stringIcNS3_11char_traitsIcEENS3_9allocatorIcEEEES9_PK14__CFDictionary_block_invoke_2;
  v14[3] = &__block_descriptor_tmp_28_17792;
  uint64_t v12 = a1[5];
  uint64_t v13 = a1[6];
  v14[4] = v8;
  v14[5] = v12;
  BOOL v20 = (a3 & 4) != 0;
  if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v15, v24.__r_.__value_.__l.__data_, v24.__r_.__value_.__l.__size_);
  }
  else {
    std::string v15 = v24;
  }
  if (*(char *)(a4 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v16, *(const std::string::value_type **)a4, *(void *)(a4 + 8));
  }
  else {
    std::string v16 = *(std::string *)a4;
  }
  BOOL v21 = v9;
  if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&__p, v23.__r_.__value_.__l.__data_, v23.__r_.__value_.__l.__size_);
  }
  else {
    std::string __p = v23;
  }
  uint64_t v18 = a1[7];
  int v19 = a3;
  Security::CodeSigning::LimitedAsync::perform(*(void *)(v11 + 8), v13, (uint64_t)v14);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v16.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v15.__r_.__value_.__l.__data_);
  }
  Security::CFRef<__CFDictionary *>::~CFRef(&v22);
  if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v23.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v24.__r_.__value_.__l.__data_);
  }
}

void sub_18B402710(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32)
{
  if (a26 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  Security::CFRef<__CFDictionary *>::~CFRef((const void **)(v32 - 120));
  if (*(char *)(v32 - 89) < 0) {
    operator delete(*(void **)(v32 - 112));
  }
  if (*(char *)(v32 - 65) < 0) {
    operator delete(*(void **)(v32 - 88));
  }
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__17773(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  return result;
}

const void **__Block_byref_object_dispose__17774(uint64_t a1)
{
  return Security::CFRef<__CFDictionary *>::~CFRef((const void **)(a1 + 40));
}

const void **___ZN8Security11CodeSigning13SecCodeSigner6Signer14buildResourcesENSt3__112basic_stringIcNS3_11char_traitsIcEENS3_9allocatorIcEEEES9_PK14__CFDictionary_block_invoke_37(const void **result, uint64_t a2, int a3, uint64_t *a4, uint64_t a5)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (*(_WORD *)(a2 + 88) == 8)
  {
    unsigned int v6 = a4;
    BOOL v9 = result;
    CFTypeRef cf = 0;
    CFDictionaryRef v10 = (const __CFDictionary *)result[5];
    if (!v10) {
      goto LABEL_15;
    }
    if (*((char *)a4 + 23) < 0) {
      std::string::__init_copy_ctor_external(&v24, (const std::string::value_type *)*a4, a4[1]);
    }
    else {
      std::string v24 = *(std::string *)a4;
    }
    Security::CFTempString::CFTempString<std::string>((CFStringRef *)key, (char *)&v24);
    CFArrayRef Value = CFDictionaryGetValue(v10, *(const void **)key);
    Security::CFRef<__CFString const*>::~CFRef((const void **)key);
    if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v24.__r_.__value_.__l.__data_);
      if (!Value) {
        goto LABEL_14;
      }
    }
    else if (!Value)
    {
      goto LABEL_14;
    }
    CFTypeID v13 = CFGetTypeID(Value);
    if (v13 == CFDataGetTypeID())
    {
      CFRetain(Value);
      if (cf) {
        CFRelease(cf);
      }
      CFTypeRef cf = Value;
      goto LABEL_17;
    }
    unsigned int v14 = CFDictionaryGetValue((CFDictionaryRef)Value, @"hash");
    Security::CFRef<__CFArray const*>::operator=(&cf, v14);
LABEL_14:
    CFArrayRef Value = cf;
    if (!cf)
    {
LABEL_15:
      std::string v15 = *(const char **)(a2 + 40);
      unint64_t v26 = 0xAAAAAAAAFFFFFFFFLL;
      Security::UnixPlusPlus::FileDesc::open((Security::UnixPlusPlus::FileDesc *)&v26, v15, 0, 438);
      Security::UnixPlusPlus::FileDesc::fcntl((Security::UnixPlusPlus::FileDesc *)&v26, v16, v17);
      unint64_t v30 = 0xAAAAAAAAAAAAAAAALL;
      *(void *)&long long v18 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v28 = v18;
      long long v29 = v18;
      *(_OWORD *)key = v18;
      *(_OWORD *)&key[16] = v18;
      Security::CodeSigning::CodeDirectory::hashFor((Security::CodeSigning::CodeDirectory *)1);
    }
LABEL_17:
    int v19 = *(Security **)(*((void *)v9[4] + 1) + 40);
    int v20 = *((char *)v6 + 23);
    BOOL v21 = v6;
    if ((a3 & 0xFFFFFFBF) != 0)
    {
      if (v20 < 0) {
        BOOL v21 = (uint64_t *)*v6;
      }
      Security::cfadd(v19, (__CFDictionary *)"{%s={hash=%O,optional=%B}}", v12, v21, Value, a3 & 1);
      CFDataRef v22 = secLogObjForScope("csresource");
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        return Security::CFRef<__CFData const*>::~CFRef(&cf);
      }
      if (*((char *)v6 + 23) < 0) {
        unsigned int v6 = (uint64_t *)*v6;
      }
      *(_DWORD *)key = 136315394;
      *(void *)&key[4] = v6;
      *(_WORD *)&key[12] = 2048;
      *(void *)&key[14] = a5;
      std::string v23 = "%s added complex (rule %p)";
    }
    else
    {
      if (v20 < 0) {
        BOOL v21 = (uint64_t *)*v6;
      }
      Security::cfadd(v19, (__CFDictionary *)"{%s=%O}", v12, v21, Value);
      CFDataRef v22 = secLogObjForScope("csresource");
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        return Security::CFRef<__CFData const*>::~CFRef(&cf);
      }
      if (*((char *)v6 + 23) < 0) {
        unsigned int v6 = (uint64_t *)*v6;
      }
      *(_DWORD *)key = 136315394;
      *(void *)&key[4] = v6;
      *(_WORD *)&key[12] = 2048;
      *(void *)&key[14] = a5;
      std::string v23 = "%s added simple (rule %p)";
    }
    _os_log_debug_impl(&dword_18B299000, v22, OS_LOG_TYPE_DEBUG, v23, key, 0x16u);
    return Security::CFRef<__CFData const*>::~CFRef(&cf);
  }
  return result;
}

void sub_18B402B94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, const void *a20,__int16 a21,char a22,char a23,void *a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
}

const void **___ZN8Security11CodeSigning13SecCodeSigner6Signer14buildResourcesENSt3__112basic_stringIcNS3_11char_traitsIcEENS3_9allocatorIcEEEES9_PK14__CFDictionary_block_invoke_2(uint64_t a1)
{
  __b[129] = *(void **)MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  unint64_t v2 = *(__CFDictionary **)(a1 + 40);
  CFTypeRef cf = 0;
  uint64_t v47 = v2;
  if (*(unsigned char *)(a1 + 132))
  {
    int v52 = (Security::UnixPlusPlus::FileDesc *)0xAAAAAAAAAAAAAAAALL;
    uint64_t v4 = Security::ModuleNexus<Security::CodeSigning::CFObjects>::operator()();
    Security::SecCFObject::allocate((Security::SecCFObject *)0x288, *(void *)(v4 + 200), v5);
    if (*(char *)(a1 + 71) >= 0) {
      unsigned int v6 = (char *)(a1 + 48);
    }
    else {
      unsigned int v6 = *(char **)(a1 + 48);
    }
    Security::CodeSigning::DiskRep::bestGuess(v6, 0);
  }
  if (*(unsigned char *)(a1 + 133))
  {
    memset(__b, 170, 0x400uLL);
    unint64_t v7 = (const char *)(a1 + 96);
    if (*(char *)(a1 + 119) < 0) {
      unint64_t v7 = *(const char **)v7;
    }
    ssize_t v8 = readlink(v7, (char *)__b, 0x3FFuLL);
    if (v8 < 0)
    {
      uint64_t v38 = __error();
      Security::UnixError::throwMe((Security::UnixError *)*v38);
    }
    *((unsigned char *)__b + v8) = 0;
    int v16 = Security::cfmake<__CFDictionary const*>((uint64_t)"{symlink=%s}", v9, v10, v11, v12, v13, v14, v15, (uint64_t)__b);
    if (cf) {
      CFRelease(cf);
    }
    CFTypeRef cf = v16;
    if (v16) {
      goto LABEL_13;
    }
LABEL_42:
    unsigned int v33 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      int v34 = *(unsigned __int8 *)(a1 + 132);
      int v35 = *(unsigned __int8 *)(a1 + 133);
      uint64_t v36 = (void *)(a1 + 96);
      if (*(char *)(a1 + 119) < 0) {
        uint64_t v36 = (void *)*v36;
      }
      LODWORD(__b[0]) = 67109634;
      HIDWORD(__b[0]) = v34;
      LOWORD(__b[1]) = 1024;
      *(_DWORD *)((char *)&__b[1] + 2) = v35;
      HIWORD(__b[1]) = 2080;
      __b[2] = v36;
      _os_log_impl(&dword_18B299000, v33, OS_LOG_TYPE_DEFAULT, "Failed to generate sealed resource: %d, %d, %s", (uint8_t *)__b, 0x18u);
    }
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA12);
  }
  if (((*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3) & 0x1000000) != 0)
  {
    __b[0] = (void *)0xAAAAAAAAFFFFFFFFLL;
    if (*(char *)(a1 + 71) >= 0) {
      CFDataRef v22 = (const char *)(a1 + 48);
    }
    else {
      CFDataRef v22 = *(const char **)(a1 + 48);
    }
    Security::UnixPlusPlus::FileDesc::open((Security::UnixPlusPlus::FileDesc *)__b, v22, 0, 438);
    std::string v23 = (Security::UnixPlusPlus::FileDesc *)LODWORD(__b[0]);
    if (Security::UnixPlusPlus::FileDesc::hasExtendedAttribute((Security::UnixPlusPlus::FileDesc *)LODWORD(__b[0]), "com.apple.ResourceFork"))
    {
      Security::UnixPlusPlus::FileDesc::removeAttr(v23, "com.apple.ResourceFork");
    }
    if (Security::UnixPlusPlus::FileDesc::hasExtendedAttribute(v23, "com.apple.FinderInfo")) {
      Security::UnixPlusPlus::FileDesc::removeAttr(v23, "com.apple.FinderInfo");
    }
    Security::UnixPlusPlus::FileDesc::closeAndLog((Security::UnixPlusPlus::FileDesc *)__b);
  }
  std::string v24 = (const char *)(a1 + 96);
  if (*(char *)(a1 + 119) < 0) {
    std::string v24 = *(const char **)v24;
  }
  id v25 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)v3 + 24))(v3);
  std::set<unsigned int>::set[abi:ne180100]((uint64_t)v45, v25);
  char v26 = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
  int v52 = (Security::UnixPlusPlus::FileDesc *)0xAAAAAAAAFFFFFFFFLL;
  Security::UnixPlusPlus::FileDesc::open((Security::UnixPlusPlus::FileDesc *)&v52, v24, 0, 438);
  Security::UnixPlusPlus::FileDesc::fcntl((Security::UnixPlusPlus::FileDesc *)&v52, v27, v28);
  if (v26 < 0)
  {
    unint64_t v30 = (Security::UnixPlusPlus::FileDesc *)v52;
    if (Security::UnixPlusPlus::FileDesc::hasExtendedAttribute((Security::UnixPlusPlus::FileDesc *)v52, "com.apple.ResourceFork"))
    {
      CFStringRef v39 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"Disallowed xattr %s found on %s", "com.apple.ResourceFork", v24);
      Security::CodeSigning::CSError::throwMe((Security::CodeSigning::CSError *)0xFFFEFA49, @"SecCSResourceHasSidebandData", v39, v40);
    }
    BOOL hasExtendedAttribute = Security::UnixPlusPlus::FileDesc::hasExtendedAttribute(v30, "com.apple.FinderInfo");
    if (hasExtendedAttribute)
    {
      CFStringRef v41 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"Disallowed xattr %s found on %s", "com.apple.FinderInfo", v24);
      Security::CodeSigning::CSError::throwMe((Security::CodeSigning::CSError *)0xFFFEFA49, @"SecCSResourceHasSidebandData", v41, v42);
    }
  }
  CFMutableDictionaryRef CFMutableDictionary = Security::makeCFMutableDictionary((Security *)hasExtendedAttribute);
  CFMutableDictionaryRef v51 = CFMutableDictionary;
  int v49 = (int)v52;
  char v50 = BYTE4(v52);
  std::set<unsigned int>::set[abi:ne180100]((uint64_t)__p, v45);
  __b[0] = (void *)MEMORY[0x1E4F143A8];
  __b[1] = (void *)0x40000000;
  __b[2] = ___ZN8Security11CodeSigning15ResourceBuilder8hashFileEPKcNSt3__13setIjNS4_4lessIjEENS4_9allocatorIjEEEEb_block_invoke;
  __b[3] = &__block_descriptor_tmp_17947;
  __b[4] = CFMutableDictionary;
  Security::CodeSigning::CodeDirectory::multipleHashFileData((uint64_t)&v49, 0, __p, (uint64_t)__b);
  std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy((void *)__p[1]);
  CFMutableDictionaryRef v32 = v51;
  CFMutableDictionaryRef v51 = 0;
  Security::CFRef<__CFDictionary *>::~CFRef((const void **)&v51);
  Security::UnixPlusPlus::FileDesc::closeAndLog((Security::UnixPlusPlus::FileDesc *)&v52);
  if (cf) {
    CFRelease(cf);
  }
  CFTypeRef cf = v32;
  std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy((void *)v45[1]);
  int v16 = (void *)cf;
  if (!cf) {
    goto LABEL_42;
  }
LABEL_13:
  if (*(unsigned char *)(a1 + 128)) {
    CFDictionaryAddValue((CFMutableDictionaryRef)v16, @"optional", (const void *)*MEMORY[0x1E4F1CFD0]);
  }
  __b[0] = (void *)(v3 + 376);
  __b[1] = (void *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v17 = (Security::UnixError *)pthread_mutex_lock((pthread_mutex_t *)(v3 + 376));
  if (v17) {
    Security::UnixError::throwMe(v17);
  }
  LOBYTE(__b[1]) = 1;
  CFArrayRef Value = CFDictionaryGetValue((CFDictionaryRef)cf, @"hash");
  if (Value && CFDictionaryGetCount((CFDictionaryRef)cf) == 1)
  {
    int v19 = v47;
    if (*(char *)(a1 + 95) < 0) {
      std::string::__init_copy_ctor_external(&v44, *(const std::string::value_type **)(a1 + 72), *(void *)(a1 + 80));
    }
    else {
      std::string v44 = *(std::string *)(a1 + 72);
    }
    Security::CFTempString::CFTempString<std::string>((CFStringRef *)__p, (char *)&v44);
    CFDictionaryAddValue(v19, __p[0], Value);
    Security::CFRef<__CFString const*>::~CFRef((const void **)__p);
    if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0)
    {
      BOOL v21 = (void *)v44.__r_.__value_.__r.__words[0];
      goto LABEL_50;
    }
  }
  else
  {
    int v20 = v47;
    if (*(char *)(a1 + 95) < 0) {
      std::string::__init_copy_ctor_external(&v43, *(const std::string::value_type **)(a1 + 72), *(void *)(a1 + 80));
    }
    else {
      std::string v43 = *(std::string *)(a1 + 72);
    }
    Security::CFTempString::CFTempString<std::string>((CFStringRef *)__p, (char *)&v43);
    CFDictionaryAddValue(v20, __p[0], cf);
    Security::CFRef<__CFString const*>::~CFRef((const void **)__p);
    if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0)
    {
      BOOL v21 = (void *)v43.__r_.__value_.__r.__words[0];
LABEL_50:
      operator delete(v21);
    }
  }
  Security::CodeSigning::SecStaticCode::reportProgress(*(Security::CodeSigning::SecStaticCode **)(v3 + 16));
  Security::StLock<Security::Mutex,&Security::Mutex::lock,&Security::Mutex::unlock>::~StLock((uint64_t)__b);
  Security::CFRef<__CFDictionary *>::~CFRef(&cf);
  return Security::CFRef<__CFDictionary *>::~CFRef((const void **)&v47);
}

void sub_18B403328(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,void *a22,uint64_t a23,char a24,int a25,__int16 a26,char a27,char a28,int a29,__int16 a30,char a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,int a37,__int16 a38,char a39,char a40,int a41,__int16 a42,char a43,char a44)
{
}

void sub_18B4033C8(void *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,char a23,std::string *a24,uint64_t a25,void *__pa,uint64_t a27,int a28,__int16 a29,char a30,char a31,uint64_t a32,uint64_t a33,char a34,long long a35,uint64_t a36)
{
  if (a31 < 0) {
    operator delete(__pa);
  }
  if (SHIBYTE(a36) < 0) {
    operator delete((void *)a35);
  }
  Security::SecPointerBase::~SecPointerBase((Security::SecPointerBase *)&a34);
  if (a2 == 1)
  {
    uint64_t v40 = __cxa_begin_catch(a1);
    CFStringRef v42 = (Security::CodeSigning::CSError *)(*(uint64_t (**)(void *))(*(void *)v40 + 24))(v40);
    if (*(char *)(v36 + 71) < 0)
    {
      std::string::__init_copy_ctor_external((std::string *)&a35, *(const std::string::value_type **)(v36 + 48), *(void *)(v36 + 56));
    }
    else
    {
      a35 = *v37;
      a36 = *((void *)v37 + 2);
    }
    if (a36 >= 0) {
      std::string v43 = (Security *)&a35;
    }
    else {
      std::string v43 = (Security *)a35;
    }
    CFStringRef __pb = (const __CFString *)Security::makeCFURL(v43, 0, 0, v41);
    Security::CodeSigning::CSError::throwMe(v42, @"SecComponentPath", __pb, v44);
  }
  JUMPOUT(0x18B403564);
}

void sub_18B4033EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, __int16 a6, char a7, char a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  Security::CFRef<__CFString const*>::~CFRef((const void **)va);
  if (a8 < 0) {
    JUMPOUT(0x18B40340CLL);
  }
  JUMPOUT(0x18B40355CLL);
}

void sub_18B403414()
{
}

void sub_18B403430()
{
}

void sub_18B403448(void *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,long long a29,uint64_t a30)
{
  unsigned int v33 = v31;
  Security::SecCFObject::operator delete(v33);
  if (a2 == 1)
  {
    uint64_t v36 = __cxa_begin_catch(a1);
    uint64_t v38 = (Security::CodeSigning::CSError *)(*(uint64_t (**)(void *))(*(void *)v36 + 24))(v36);
    if (*(char *)(v30 + 71) < 0)
    {
      std::string::__init_copy_ctor_external((std::string *)&a29, *(const std::string::value_type **)(v30 + 48), *(void *)(v30 + 56));
    }
    else
    {
      a29 = *v32;
      a30 = *((void *)v32 + 2);
    }
    if (a30 >= 0) {
      CFStringRef v39 = (Security *)&a29;
    }
    else {
      CFStringRef v39 = (Security *)a29;
    }
    CFStringRef CFURL = (const __CFString *)Security::makeCFURL(v39, 0, 0, v37);
    Security::CodeSigning::CSError::throwMe(v38, @"SecComponentPath", CFURL, v40);
  }
  JUMPOUT(0x18B403564);
}

void sub_18B403460()
{
}

void sub_18B403504(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *__p,uint64_t a30,int a31,__int16 a32,char a33,char a34)
{
}

void sub_18B403540(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,int a22,__int16 a23,char a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void __destroy_helper_block_e8_48c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE72c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE96c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(uint64_t a1)
{
  if (*(char *)(a1 + 119) < 0) {
    operator delete(*(void **)(a1 + 96));
  }
  if (*(char *)(a1 + 95) < 0) {
    operator delete(*(void **)(a1 + 72));
  }
  if (*(char *)(a1 + 71) < 0)
  {
    unint64_t v2 = *(void **)(a1 + 48);
    operator delete(v2);
  }
}

void __copy_helper_block_e8_48c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE72c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE96c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(std::string *a1, uint64_t a2)
{
  if (*(char *)(a2 + 71) < 0)
  {
    std::string::__init_copy_ctor_external(a1 + 2, *(const std::string::value_type **)(a2 + 48), *(void *)(a2 + 56));
  }
  else
  {
    long long v4 = *(_OWORD *)(a2 + 48);
    a1[2].__r_.__value_.__r.__words[2] = *(void *)(a2 + 64);
    *(_OWORD *)&a1[2].__r_.__value_.__l.__data_ = v4;
  }
  if (*(char *)(a2 + 95) < 0)
  {
    std::string::__init_copy_ctor_external(a1 + 3, *(const std::string::value_type **)(a2 + 72), *(void *)(a2 + 80));
  }
  else
  {
    long long v5 = *(_OWORD *)(a2 + 72);
    a1[3].__r_.__value_.__r.__words[2] = *(void *)(a2 + 88);
    *(_OWORD *)&a1[3].__r_.__value_.__l.__data_ = v5;
  }
  unsigned int v6 = a1 + 4;
  if (*(char *)(a2 + 119) < 0)
  {
    std::string::__init_copy_ctor_external(v6, *(const std::string::value_type **)(a2 + 96), *(void *)(a2 + 104));
  }
  else
  {
    long long v7 = *(_OWORD *)(a2 + 96);
    a1[4].__r_.__value_.__r.__words[2] = *(void *)(a2 + 112);
    *(_OWORD *)&v6->__r_.__value_.__l.__data_ = v7;
  }
}

void sub_18B40369C(_Unwind_Exception *exception_object)
{
  if (*(char *)(v2 + 95) < 0) {
    operator delete(*v3);
  }
  if (*(char *)(v2 + 71) < 0) {
    operator delete(*v1);
  }
  _Unwind_Resume(exception_object);
}

void Security::CodeSigning::SecCodeSigner::Signer::prepareForEdit(Security::CodeSigning::SecCodeSigner::Signer *this)
{
  std::set<unsigned int>::set[abi:ne180100]((uint64_t)v9, (void *)(*((void *)this + 2) + 344));
  (*(void (**)(Security::CodeSigning::SecCodeSigner::Signer *, unsigned char *))(*(void *)this + 32))(this, v9);
  std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy(v10);
  uint64_t v2 = (Security::Universal *)(*(uint64_t (**)(void))(**(void **)(*((void *)this + 2) + 32) + 80))(*(void *)(*((void *)this + 2) + 32));
  if (v2
    && (uint64_t v2 = (Security::Universal *)(*(uint64_t (**)(void))(**(void **)(*((void *)this + 2) + 32)
                                                                      + 80))(*(void *)(*((void *)this + 2) + 32))) != 0)
  {
    uint64_t v3 = v2;
    *((void *)this + 43) = Security::Universal::bestNativeArch(v2);
    if (*((void *)v3 + 4)) {
      goto LABEL_9;
    }
    uint64_t v6 = *((void *)this + 1);
    int v7 = *(_DWORD *)(v6 + 304);
    if (v7 && !*((void *)v3 + 1)) {
      Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA02, v4, v5);
    }
    if (*(void *)(v6 + 312) && !v7 && *((void *)v3 + 1)) {
LABEL_9:
    }
      Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA23, v4, v5);
  }
  else
  {
    *((void *)this + 43) = Security::Architecture::local(v2);
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 0x40000000;
  v8[2] = ___ZN8Security11CodeSigning13SecCodeSigner6Signer14prepareForEditEj_block_invoke;
  v8[3] = &__block_descriptor_tmp_84_17818;
  v8[4] = this;
  ___ZN8Security11CodeSigning13SecCodeSigner6Signer14prepareForEditEj_block_invoke((uint64_t)v8, *((void *)this + 2), *((const char **)this + 43));
}

void sub_18B403920(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21)
{
}

char *std::__tree<std::__value_type<Security::Architecture,std::unique_ptr<std::map<int,Security::CFCopyRef<__CFData const*>>>>,std::__map_value_compare<Security::Architecture,std::__value_type<Security::Architecture,std::unique_ptr<std::map<int,Security::CFCopyRef<__CFData const*>>>>,std::less<Security::Architecture>,true>,std::allocator<std::__value_type<Security::Architecture,std::unique_ptr<std::map<int,Security::CFCopyRef<__CFData const*>>>>>>::__emplace_unique_key_args<Security::Architecture,std::piecewise_construct_t const&,std::tuple<Security::Architecture const&>,std::tuple<>>(uint64_t **a1, uint64_t a2, void *a3)
{
  uint64_t v6 = (char *)(a1 + 1);
  long long v5 = (int *)a1[1];
  if (v5)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v6 = (char *)v5;
        int v7 = v5[8];
        int v8 = *((_DWORD *)v6 + 9);
        BOOL v9 = SHIDWORD(a2) < v8;
        if (a2 != v7) {
          BOOL v9 = (int)a2 < v7;
        }
        if (!v9) {
          break;
        }
        long long v5 = *(int **)v6;
        uint64_t v10 = (uint64_t **)v6;
        if (!*(void *)v6) {
          goto LABEL_14;
        }
      }
      BOOL v11 = v8 < SHIDWORD(a2);
      int v12 = a2 == v7 ? v11 : v7 < (int)a2;
      if (v12 != 1) {
        break;
      }
      uint64_t v10 = (uint64_t **)(v6 + 8);
      long long v5 = (int *)*((void *)v6 + 1);
      if (!v5) {
        goto LABEL_14;
      }
    }
  }
  else
  {
    uint64_t v10 = a1 + 1;
LABEL_14:
    uint64_t v13 = v6;
    uint64_t v6 = (char *)operator new(0x30uLL);
    *((void *)v6 + 4) = *a3;
    *((void *)v6 + 5) = 0;
    *(void *)uint64_t v6 = 0;
    *((void *)v6 + 1) = 0;
    *((void *)v6 + 2) = v13;
    void *v10 = (uint64_t *)v6;
    uint64_t v14 = (uint64_t *)**a1;
    uint64_t v15 = (uint64_t *)v6;
    if (v14)
    {
      *a1 = v14;
      uint64_t v15 = *v10;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], v15);
    a1[2] = (uint64_t *)((char *)a1[2] + 1);
  }
  return v6;
}

void ___ZN8Security11CodeSigning13SecCodeSigner6Signer14prepareForEditEj_block_invoke(uint64_t a1, uint64_t a2, const char *a3)
{
  void (***v4)(void *__return_ptr);
  void (***v5)(void *__return_ptr);
  void (***v6)(void *__return_ptr);
  const char *v7;
  uint64_t v8;

  int v7 = a3;
  uint64_t v3 = *(const void **)(a2 + 32);
  if (v3)
  {
    if (v4)
    {
      long long v5 = v4;
      if (v6)
      {
        uint64_t v6 = (void (***)(void *__return_ptr))v6[13];
        if (v6) {
      }
        }
      if (!v6) {
        uint64_t v6 = v5;
      }
      (**v6)(&v8);
      operator new();
    }
  }
  Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA23, a2, a3);
}

void sub_18B403CF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, const void **a13)
{
}

uint64_t ___ZN8Security11CodeSigning13SecCodeSigner6Signer14prepareForEditEj_block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (Security::Universal *)(*(uint64_t (**)(void))(**(void **)(a2 + 32) + 80))(*(void *)(a2 + 32));
  Security::Universal::bestNativeArch(v3);
  uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v4();
}

CFTypeRef *non-virtual thunk to'Security::CodeSigning::MachORep::createRawComponents@<X0>(Security::CodeSigning::MachORep *this@<X0>, uint64_t a2@<X8>)
{
  return Security::CodeSigning::MachORep::createRawComponents((Security::CodeSigning::MachORep *)((char *)this - 48), a2);
}

CFTypeRef *Security::CodeSigning::MachORep::createRawComponents@<X0>(Security::CodeSigning::MachORep *this@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)a2 = a2 + 8;
  if (!Security::CodeSigning::MachORep::signingData(this)) {
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA0ALL);
  }
  __n128 result = (CFTypeRef *)Security::CodeSigning::MachORep::signingData(this);
  uint64_t v6 = (uint64_t)result;
  if (*((_DWORD *)result + 2))
  {
    unint64_t v7 = 0;
    int v8 = (unsigned int *)(result + 2);
    do
    {
      BOOL v9 = (Security::CodeSigning::EmbeddedSignatureBlob *)bswap32(*(v8 - 1));
      int v14 = (int)v9;
      uint64_t v10 = (const UInt8 *)(bswap32(*v8) + v6);
      if (*v8) {
        BOOL v11 = v10;
      }
      else {
        BOOL v11 = 0;
      }
      CFDataRef v12 = Security::CodeSigning::EmbeddedSignatureBlob::blobData(v9, v11, v5);
      uint64_t v13 = std::__tree<std::__value_type<int,Security::CFCopyRef<__CFData const*>>,std::__map_value_compare<int,std::__value_type<int,Security::CFCopyRef<__CFData const*>>,std::less<int>,true>,std::allocator<std::__value_type<int,Security::CFCopyRef<__CFData const*>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t **)a2, (int)v9, &v14);
      __n128 result = Security::CFRef<__CFArray const*>::operator=((CFTypeRef *)v13 + 5, v12);
      v8 += 2;
      ++v7;
    }
    while (v7 < bswap32(*(_DWORD *)(v6 + 8)));
  }
  return result;
}

void sub_18B403E84(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<int,Security::CFCopyRef<__CFData const*>>,std::__map_value_compare<int,std::__value_type<int,Security::CFCopyRef<__CFData const*>>,std::less<int>,true>,std::allocator<std::__value_type<int,Security::CFCopyRef<__CFData const*>>>>::destroy(*v1);
  _Unwind_Resume(a1);
}

void Security::CodeSigning::MachORep::writer(Security::CodeSigning::MachORep *this)
{
}

void sub_18B403F08(_Unwind_Exception *a1)
{
  MEMORY[0x18C12D390](v1, 0x10A1C40A67EDFA3);
  _Unwind_Resume(a1);
}

void Security::CodeSigning::MachORep::Writer::component(Security::CodeSigning::MachORep::Writer *this, const char *a2, const __CFData *a3)
{
}

void Security::CodeSigning::MachORep::Writer::~Writer(Security::CodeSigning::MachORep::Writer *this)
{
  *(void *)this = &unk_1ED84A378;
  Security::UnixPlusPlus::FileDesc::closeAndLog((Security::CodeSigning::MachORep::Writer *)((char *)this + 96));
  Security::RefPointer<Security::CodeSigning::SingleDiskRep>::~RefPointer((void *)this + 3);

  JUMPOUT(0x18C12D390);
}

{
  *(void *)this = &unk_1ED84A378;
  Security::UnixPlusPlus::FileDesc::closeAndLog((Security::CodeSigning::MachORep::Writer *)((char *)this + 96));
  Security::RefPointer<Security::CodeSigning::SingleDiskRep>::~RefPointer((void *)this + 3);
}

void Security::CodeSigning::MachORep::strictValidate(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  Security::CodeSigning::SingleDiskRep::strictValidate((char *)a1, a2, a3, a4);
  uint64_t v6 = *(void *)(a1 + 56);
  if (*(unsigned char *)(v6 + 76))
  {
    uint64_t v9 = *(void *)(a3 + 8);
    uint64_t v8 = a3 + 8;
    uint64_t v7 = v9;
    if (!v9) {
      goto LABEL_12;
    }
    uint64_t v10 = v8;
    do
    {
      int v11 = *(_DWORD *)(v7 + 28);
      BOOL v12 = v11 < -67010;
      if (v11 >= -67010) {
        uint64_t v13 = (uint64_t *)v7;
      }
      else {
        uint64_t v13 = (uint64_t *)(v7 + 8);
      }
      if (!v12) {
        uint64_t v10 = v7;
      }
      uint64_t v7 = *v13;
    }
    while (*v13);
    if (v10 == v8 || *(int *)(v10 + 28) > -67010) {
LABEL_12:
    }
      Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA3ELL);
  }
  else
  {
    v15[0] = 0;
    v15[1] = 0;
    int v14 = v15;
    Security::Universal::architectures((uint64_t *)v6, (uint64_t *)&v14);
    if (v14 != v15) {
      Security::Universal::architecture((Security::Universal **)v6, (const Security::Architecture *)*((unsigned int *)v14 + 7), *((_DWORD *)v14 + 8));
    }
    std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy(v15[0]);
  }
}

void sub_18B404158(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
}

uint64_t Security::CodeSigning::MachORep::pageSize()
{
  return 4096;
}

void Security::CodeSigning::MachORep::defaultRequirements(uint64_t a1, unsigned int *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  v5[1] = 0;
  uint64_t v4 = v5;
  uint64_t v3 = (Security::Universal **)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 80))(a1);
  Security::Universal::architecture(v3, (const Security::Architecture *)*a2, a2[1]);
}

void sub_18B4047EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, char a17, int a18, const void *a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29,uint64_t a30,void *__p,uint64_t a32,int a33,__int16 a34,char a35,char a36)
{
  if (a2)
  {
    Security::CFRef<__SecRequirement *>::~CFRef(&a19);
    if (a36 < 0) {
      operator delete(__p);
    }
    __cxa_begin_catch(exception_object);
    free(v36);
    __cxa_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_18B4048BC()
{
}

void sub_18B4048F8(void *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  JUMPOUT(0x18B404914);
}

void Security::CodeSigning::MachORep::explicitIdentifier(Security::CodeSigning::MachORep *this)
{
}

void sub_18B4049E0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  Security::CFRef<__CFDictionary const*>::~CFRef((const void **)va);
  _Unwind_Resume(a1);
}

void Security::CodeSigning::MachORep::recommendedIdentifier(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  memset(__p, 170, sizeof(__p));
  (*(void (**)(void **__return_ptr))(*(void *)a1 + 192))(__p);
  uint64_t v4 = (void *)HIBYTE(__p[2]);
  if (SHIBYTE(__p[2]) < 0) {
    uint64_t v4 = __p[1];
  }
  if (v4)
  {
    *(_OWORD *)a2 = *(_OWORD *)__p;
    *(void **)(a2 + 16) = __p[2];
  }
  else
  {
    Security::CodeSigning::DiskRep::canonicalIdentifier((std::string *)a2, a1 + 16);
    if (SHIBYTE(__p[2]) < 0) {
      operator delete(__p[0]);
    }
  }
}

void sub_18B404AA0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

CFDataRef Security::CodeSigning::MachORep::copyStapledTicket(Security::CodeSigning::MachORep *this, uint64_t a2, const Security::BlobCore *a3)
{
  CFTypeRef cf = 0;
  uint64_t v3 = (Security::CodeSigning::EmbeddedSignatureBlob *)*((void *)this + 8);
  if (v3) {
    CFDataRef v4 = Security::CodeSigning::EmbeddedSignatureBlob::component(v3, (Security::CodeSigning::EmbeddedSignatureBlob *)0x10002, a3);
  }
  else {
    CFDataRef v4 = 0;
  }
  CFTypeRef cf = 0;
  Security::CFRef<__CFData const*>::~CFRef(&cf);
  return v4;
}

void sub_18B404B20(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  Security::CFRef<__CFData const*>::~CFRef((const void **)va);
  _Unwind_Resume(a1);
}

const void **Security::CodeSigning::MachORep::registerStapledTicket(Security::CodeSigning::MachORep *this)
{
  uint64_t v3 = (Security::CodeSigning *)(*(uint64_t (**)(Security::CodeSigning::MachORep *))(*(void *)this + 176))(this);
  Security::CodeSigning::registerStapledTicketWithSystem(v3, v1);
  return Security::CFRef<__CFData const*>::~CFRef((const void **)&v3);
}

void Security::CodeSigning::MachORep::copyDiskRepInformation(Security::CodeSigning::MachORep *this)
{
  CFDataRef v1 = (Security::Universal *)(*(uint64_t (**)(Security::CodeSigning::MachORep *))(*(void *)this + 80))(this);
  Security::Universal::architecture(v1);
}

void sub_18B404CC0(_Unwind_Exception *a1)
{
  Security::CFRef<__CFDictionary const*>::~CFRef((const void **)(v2 - 24));
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

void Security::CodeSigning::MachORep::flush(Security::CodeSigning::MachORep *this)
{
  uint64_t v2 = *((void *)this + 7);
  free(*(void **)(v2 + 8));
  std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy(*(void **)(v2 + 56));
  MEMORY[0x18C12D390](v2, 0x1020C4076728D04);
  *((void *)this + 7) = 0;
  free(*((void **)this + 8));
  *((void *)this + 8) = 0;
  Security::UnixPlusPlus::FileDesc::close((Security::CodeSigning::MachORep *)((char *)this + 40));
  operator new();
}

void sub_18B404DE0(_Unwind_Exception *a1)
{
  MEMORY[0x18C12D390](v1, 0x1020C4076728D04);
  _Unwind_Resume(a1);
}

void Security::CodeSigning::MachORep::platformType(Security::CodeSigning::MachORep *this, const Security::Architecture *a2)
{
  uint64_t v2 = (Security::Universal **)*((void *)this + 7);
  if (a2) {
    Security::Universal::architecture(v2, (const Security::Architecture *)*(unsigned int *)a2, *((_DWORD *)a2 + 1));
  }
  Security::Universal::architecture((Security::Universal *)v2);
}

void sub_18B404EA0(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

void Security::CodeSigning::MachORep::execSegLimit(Security::CodeSigning::MachORep *this, const Security::Architecture *a2)
{
  uint64_t v2 = (Security::Universal **)*((void *)this + 7);
  if (a2) {
    Security::Universal::architecture(v2, (const Security::Architecture *)*(unsigned int *)a2, *((_DWORD *)a2 + 1));
  }
  Security::Universal::architecture((Security::Universal *)v2);
}

void sub_18B404F94(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

void Security::CodeSigning::MachORep::execSegBase(Security::CodeSigning::MachORep *this, const Security::Architecture *a2)
{
  uint64_t v2 = (Security::Universal **)*((void *)this + 7);
  if (a2) {
    Security::Universal::architecture(v2, (const Security::Architecture *)*(unsigned int *)a2, *((_DWORD *)a2 + 1));
  }
  Security::Universal::architecture((Security::Universal *)v2);
}

void sub_18B40508C(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

void Security::CodeSigning::MachORep::signingLimit(Security::Universal **this)
{
}

void sub_18B405120(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

uint64_t Security::CodeSigning::MachORep::signingBase(Security::CodeSigning::MachORep *this)
{
  uint64_t v1 = (Security::Universal *)(*(uint64_t (**)(Security::CodeSigning::MachORep *))(*(void *)this + 80))(this);

  return Security::Universal::archOffset(v1);
}

void Security::CodeSigning::MachORep::prepareForSigning(uint64_t a1, uint64_t a2)
{
  if (!*(void *)((*(uint64_t (**)(uint64_t))(*(void *)a2 + 24))(a2) + 16))
  {
    v5[0] = 0;
    v5[1] = 0;
    CFDataRef v4 = v5;
    Security::Universal::architectures(*(uint64_t **)(a1 + 56), (uint64_t *)&v4);
    if (v4 != v5) {
      Security::Universal::architecture(*(Security::Universal ***)(a1 + 56), (const Security::Architecture *)*((unsigned int *)v4 + 7), *((_DWORD *)v4 + 8));
    }
    v9[0] = 0;
    v9[1] = 0;
    *(void *)uint64_t v8 = v9;
    std::__tree<unsigned int>::__emplace_unique_key_args<unsigned int,unsigned int>((uint64_t *)v8, 2u, 2);
    std::set<unsigned int>::set[abi:ne180100]((uint64_t)v6, v8);
    (*(void (**)(uint64_t, unsigned char *))(*(void *)a2 + 32))(a2, v6);
    std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy(v7);
    std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy(v9[0]);
    std::__tree<std::__value_type<unsigned long,unsigned long>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,unsigned long>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,unsigned long>>>::destroy(v5[0]);
  }
}

void sub_18B4053BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, void *a17)
{
}

void Security::CodeSigning::MachORep::identification(Security::CodeSigning::MachORep *this)
{
  uint64_t v1 = (Security::Universal *)(*(uint64_t (**)(Security::CodeSigning::MachORep *))(*(void *)this + 80))(this);
  Security::Universal::architecture(v1);
}

void sub_18B4054B4(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

CFDataRef Security::CodeSigning::MachORep::identificationFor(const void **this, Security::MachO *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  Command = Security::MachOBase::findCommand((Security::MachOBase *)this, 27);
  if (Command)
  {
    cmdstd::string::size_type size = Command->cmdsize;
    unsigned int v5 = bswap32(cmdsize);
    if (*((unsigned char *)this + 33)) {
      cmdstd::string::size_type size = v5;
    }
    if (cmdsize != 24) {
      Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA1BLL);
    }
    c.h0 = 1145656661;
    *(_OWORD *)&c.h1 = *(_OWORD *)&Command[1].cmd;
    p_CC_SHA1_CTX c = (const UInt8 *)&c;
  }
  else
  {
    *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&c.data[9] = v7;
    *(_OWORD *)&c.data[13] = v7;
    *(_OWORD *)&c.data[1] = v7;
    *(_OWORD *)&c.data[5] = v7;
    *(_OWORD *)&c.h0 = v7;
    *(_OWORD *)&c.h4 = v7;
    CC_SHA1_Init(&c);
    CC_SHA1_Update(&c, this[1], 0x1Cu);
    unsigned int v8 = bswap32(*((_DWORD *)this[1] + 5));
    if (*((unsigned char *)this + 33)) {
      CC_LONG v9 = v8;
    }
    else {
      CC_LONG v9 = *((_DWORD *)this[1] + 5);
    }
    CC_SHA1_Update(&c, this[2], v9);
    memset(md, 170, 20);
    CC_SHA1_Final(md, &c);
    p_CC_SHA1_CTX c = md;
  }
  return CFDataCreate(0, p_c, 20);
}

void Security::CodeSigning::EmbeddedSignatureBlob::Maker::component(uint64_t **this, Security::CodeSigning::CodeDirectory *a2, const __CFData *a3)
{
  unsigned int v4 = a2;
  unsigned int v6 = Security::CodeSigning::CodeDirectory::slotAttributes(a2);
  BytePtr = (Security::BlobCore *)CFDataGetBytePtr(a3);
  unsigned int v8 = BytePtr;
  if (v6 >= 2)
  {
    uint64_t v10 = (uint64_t *)Security::BlobCore::clone(BytePtr);
  }
  else
  {
    CFIndex Length = CFDataGetLength(a3);
    uint64_t v10 = (uint64_t *)Security::BlobWrapper::alloc(v8, Length);
  }

  Security::SuperBlobCore<Security::SuperBlob<4208856065u,unsigned int>,4208856065u,unsigned int>::Maker::add(this, v4, v10);
}

CFPropertyListRef Security::CodeSigning::EntitlementBlob::entitlements(Security::CodeSigning::EntitlementBlob *this)
{
  CFDataRef v4 = CFDataCreate(0, (const UInt8 *)this + 8, bswap32(*((_DWORD *)this + 1)) - 8);
  CFPropertyListRef CFDictionaryFrom = Security::makeCFDictionaryFrom(v4, v1);
  Security::CFRef<__CFData const*>::~CFRef((const void **)&v4);
  return CFDictionaryFrom;
}

void sub_18B4056E8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  Security::CFRef<__CFData const*>::~CFRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t Security::CFDictionary::Applier<Security::CodeSigning::ResourceBuilder>::apply(uint64_t a1, uint64_t a2, void *a3)
{
  unsigned int v5 = (uint64_t (*)(void *, uint64_t, uint64_t))a3[1];
  uint64_t v6 = a3[2];
  long long v7 = (void *)(*a3 + (v6 >> 1));
  if (v6) {
    unsigned int v5 = *(uint64_t (**)(void *, uint64_t, uint64_t))(*v7 + v5);
  }
  return v5(v7, a1, a2);
}

void Security::CodeSigning::ResourceBuilder::addRule(Security::CodeSigning::ResourceBuilder *this, __CFString *a2, const void *a3)
{
  memset(&__p, 170, sizeof(__p));
  Security::cfString(&__p, a2);
  CFTypeID v4 = CFGetTypeID(a3);
  if (v4 != CFBooleanGetTypeID())
  {
    CFDictionaryRef theDict = (CFDictionaryRef)0xAAAAAAAAAAAAAAAALL;
    unint64_t v7 = 0xAAAAAAAAAAAAAAAALL;
    Security::CFDictionary::CFDictionary((Security::CFDictionary *)&theDict, a3);
    Security::CFTempString::CFTempString<char const*>((CFStringRef *)&key, "weight");
    CFArrayRef Value = CFDictionaryGetValue(theDict, key);
    Security::CFRef<__CFNumber const*>::check<void const*>(Value, (Security::MacOSError *)v7);
    Security::CFRef<__CFString const*>::~CFRef((const void **)&key);
    if (Value) {
      Security::cfNumber<unsigned int>((const __CFNumber *)Value);
    }
    Security::CFDictionary::get<__CFBoolean const*>((uint64_t)&theDict, "omit");
    Security::CFDictionary::get<__CFBoolean const*>((uint64_t)&theDict, "optional");
    Security::CFDictionary::get<__CFBoolean const*>((uint64_t)&theDict, "nested");
    Security::CFRef<__CFDictionary const*>::~CFRef((const void **)&theDict);
  }
  operator new();
}

void sub_18B40596C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, char a17)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

regex_t *Security::CodeSigning::ResourceBuilder::Rule::Rule(regex_t *a1, long long *a2, int a3, int a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  a1[1].re_magiCC_SHA1_CTX c = a3;
  *(&a1[1].re_magic + 1) = a4;
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)&a1[1].re_nsub, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v8 = *a2;
    a1[1].re_g = (re_guts *)*((void *)a2 + 2);
    *(_OWORD *)&a1[1].re_nsub = v8;
  }
  if (*((char *)a2 + 23) >= 0) {
    CC_LONG v9 = (const char *)a2;
  }
  else {
    CC_LONG v9 = *(const char **)a2;
  }
  if (regcomp(a1, v9, 5)) {
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA13);
  }
  uint64_t v10 = secLogObjForScope("csresource");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    if (*((char *)a2 + 23) >= 0) {
      BOOL v12 = (const std::string::value_type *)a2;
    }
    else {
      BOOL v12 = *(const std::string::value_type **)a2;
    }
    int v13 = 134218754;
    int v14 = a1;
    __int16 v15 = 2080;
    int v16 = v12;
    __int16 v17 = 1024;
    int v18 = a3;
    __int16 v19 = 1024;
    int v20 = a4;
    _os_log_debug_impl(&dword_18B299000, v10, OS_LOG_TYPE_DEBUG, "%p rule %s added (weight %d, flags 0x%x)", (uint8_t *)&v13, 0x22u);
  }
  return a1;
}

void sub_18B405B30(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 63) < 0) {
    operator delete(*v2);
  }
  _Unwind_Resume(exception_object);
}

std::string::size_type Security::CodeSigning::ResourceBuilder::ResourceBuilder(std::string::size_type a1, uint64_t a2, uint64_t a3, const void *a4, char a5, uint64_t a6)
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)(a1 + 56) = 0u;
  uint64_t v10 = (CFTypeRef *)(a1 + 56);
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  int v11 = (std::string *)(a1 + 24);
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  if (a5)
  {
    uint64_t v14 = *(void *)(a6 + 8);
    uint64_t v12 = a6 + 8;
    uint64_t v13 = v14;
    if (!v14) {
      goto LABEL_12;
    }
    uint64_t v15 = v12;
    uint64_t v16 = v13;
    do
    {
      int v17 = *(_DWORD *)(v16 + 28);
      BOOL v18 = v17 < -67060;
      if (v17 >= -67060) {
        __int16 v19 = (uint64_t *)v16;
      }
      else {
        __int16 v19 = (uint64_t *)(v16 + 8);
      }
      if (!v18) {
        uint64_t v15 = v16;
      }
      uint64_t v16 = *v19;
    }
    while (*v19);
    if (v15 == v12 || *(int *)(v15 + 28) > -67060) {
LABEL_12:
    }
      uint64_t v15 = v12;
    *(unsigned char *)(a1 + 88) = v15 == v12;
    if (!v13) {
      goto LABEL_23;
    }
    uint64_t v20 = v12;
    do
    {
      int v21 = *(_DWORD *)(v13 + 28);
      BOOL v22 = v21 < -67016;
      if (v21 >= -67016) {
        std::string v23 = (uint64_t *)v13;
      }
      else {
        std::string v23 = (uint64_t *)(v13 + 8);
      }
      if (!v22) {
        uint64_t v20 = v13;
      }
      uint64_t v13 = *v23;
    }
    while (*v23);
    if (v20 == v12 || *(int *)(v20 + 28) > -67016) {
LABEL_23:
    }
      uint64_t v20 = v12;
    BOOL v24 = v20 == v12;
  }
  else
  {
    BOOL v24 = 0;
    *(unsigned char *)(a1 + 88) = 0;
  }
  *(unsigned char *)(a1 + 89) = v24;
  memset(__b, 170, sizeof(__b));
  if (*(char *)(a2 + 23) >= 0) {
    id v25 = (const char *)a2;
  }
  else {
    id v25 = *(const char **)a2;
  }
  if (!realpath_DARWIN_EXTSN(v25, __b))
  {
LABEL_130:
    long long v62 = __error();
    Security::UnixError::throwMe((Security::UnixError *)*v62);
  }
  std::string::__assign_external((std::string *)a1, __b);
  if (*(char *)(a3 + 23) < 0) {
    std::string::__init_copy_ctor_external(&__str, *(const std::string::value_type **)a3, *(void *)(a3 + 8));
  }
  else {
    std::string __str = *(std::string *)a3;
  }
  std::string::size_type size = HIBYTE(__str.__r_.__value_.__r.__words[2]);
  if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type size = __str.__r_.__value_.__l.__size_;
  }
  std::string::basic_string(&context, &__str, size - 2, 2uLL, (std::allocator<char> *)theDict);
  std::string::size_type v27 = HIBYTE(context.__r_.__value_.__r.__words[2]);
  if ((context.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type v27 = context.__r_.__value_.__l.__size_;
  }
  if (v27 != 2)
  {
    BOOL v29 = 0;
    if ((SHIBYTE(context.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_41;
    }
LABEL_46:
    operator delete(context.__r_.__value_.__l.__data_);
    if (v29) {
      goto LABEL_42;
    }
    goto LABEL_47;
  }
  p_std::string context = (std::string *)context.__r_.__value_.__r.__words[0];
  if ((context.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_std::string context = &context;
  }
  BOOL v29 = LOWORD(p_context->__r_.__value_.__l.__data_) == 11823;
  if (SHIBYTE(context.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_46;
  }
LABEL_41:
  if (v29)
  {
LABEL_42:
    std::string::size_type v30 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
    if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      std::string::size_type v30 = __str.__r_.__value_.__l.__size_;
    }
    std::string::basic_string(&v67, &__str, 0, v30 - 2, (std::allocator<char> *)&context);
    goto LABEL_62;
  }
LABEL_47:
  std::string::size_type v31 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
  if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type v31 = __str.__r_.__value_.__l.__size_;
  }
  std::string::basic_string(&context, &__str, v31 - 1, 1uLL, (std::allocator<char> *)theDict);
  std::string::size_type v32 = HIBYTE(context.__r_.__value_.__r.__words[2]);
  if ((context.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type v32 = context.__r_.__value_.__l.__size_;
  }
  if (v32 != 1)
  {
    BOOL v34 = 0;
    if ((SHIBYTE(context.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_55;
    }
LABEL_60:
    operator delete(context.__r_.__value_.__l.__data_);
    if (v34) {
      goto LABEL_56;
    }
LABEL_61:
    std::string v67 = __str;
    memset(&__str, 0, sizeof(__str));
    goto LABEL_62;
  }
  unsigned int v33 = (std::string *)context.__r_.__value_.__r.__words[0];
  if ((context.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    unsigned int v33 = &context;
  }
  BOOL v34 = v33->__r_.__value_.__s.__data_[0] == 47;
  if (SHIBYTE(context.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_60;
  }
LABEL_55:
  if (!v34) {
    goto LABEL_61;
  }
LABEL_56:
  std::string::size_type v35 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
  if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type v35 = __str.__r_.__value_.__l.__size_;
  }
  std::string::basic_string(&v67, &__str, 0, v35 - 1, (std::allocator<char> *)&context);
LABEL_62:
  if ((v67.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v36 = &v67;
  }
  else {
    uint64_t v36 = (std::string *)v67.__r_.__value_.__r.__words[0];
  }
  CFURLRef v37 = realpath_DARWIN_EXTSN((const char *)v36, __b);
  if (SHIBYTE(v67.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v67.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
  if (!v37) {
    goto LABEL_130;
  }
  std::string::__assign_external(v11, __b);
  uint64_t v38 = *(unsigned __int8 *)(a1 + 23);
  char v39 = v38;
  if ((v38 & 0x80u) == 0) {
    size_t v40 = *(unsigned __int8 *)(a1 + 23);
  }
  else {
    size_t v40 = *(void *)(a1 + 8);
  }
  uint64_t v41 = *(unsigned __int8 *)(a1 + 47);
  int v42 = (char)v41;
  if ((v41 & 0x80u) != 0) {
    uint64_t v41 = *(void *)(a1 + 32);
  }
  if (v40 == v41)
  {
    if (v42 >= 0) {
      std::string v43 = v11;
    }
    else {
      std::string v43 = (std::string *)v11->__r_.__value_.__r.__words[0];
    }
    if ((char)v38 < 0)
    {
      CFDictionaryRef v45 = *(const void **)a1;
      if (!memcmp(*(const void **)a1, v43, *(void *)(a1 + 8)))
      {
        v67.__r_.__value_.__l.__size_ = 0xAAAAAAAAAAAAAAAALL;
        goto LABEL_124;
      }
    }
    else
    {
      if (!(_BYTE)v38)
      {
        v67.__r_.__value_.__l.__size_ = 0xAAAAAAAAAAAAAAAALL;
        CFDictionaryRef v45 = (const void *)a1;
        goto LABEL_124;
      }
      std::string v44 = (unsigned __int8 *)a1;
      while (*v44 == v43->__r_.__value_.__s.__data_[0])
      {
        ++v44;
        std::string v43 = (std::string *)((char *)v43 + 1);
        if (!--v38) {
          goto LABEL_113;
        }
      }
    }
  }
  memset(&context, 170, sizeof(context));
  uint64_t v46 = &context;
  std::string::basic_string[abi:ne180100]((uint64_t)&context, v40 + 9);
  if ((context.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    uint64_t v46 = (std::string *)context.__r_.__value_.__r.__words[0];
  }
  if (v40)
  {
    if (*(char *)(a1 + 23) >= 0) {
      uint64_t v47 = (const void *)a1;
    }
    else {
      uint64_t v47 = *(const void **)a1;
    }
    memmove(v46, v47, v40);
  }
  strcpy((char *)v46 + v40, "/Contents");
  uint64_t v48 = *(unsigned __int8 *)(a1 + 47);
  if ((v48 & 0x80u) == 0) {
    uint64_t v49 = *(unsigned __int8 *)(a1 + 47);
  }
  else {
    uint64_t v49 = *(void *)(a1 + 32);
  }
  std::string::size_type v50 = HIBYTE(context.__r_.__value_.__r.__words[2]);
  int v51 = SHIBYTE(context.__r_.__value_.__r.__words[2]);
  if ((context.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type v50 = context.__r_.__value_.__l.__size_;
  }
  if (v49 == v50)
  {
    if ((context.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      int v52 = &context;
    }
    else {
      int v52 = (std::string *)context.__r_.__value_.__r.__words[0];
    }
    if ((v48 & 0x80) != 0)
    {
      BOOL v58 = memcmp(v11->__r_.__value_.__l.__data_, v52, *(void *)(a1 + 32)) != 0;
      if ((v51 & 0x80000000) == 0) {
        goto LABEL_111;
      }
    }
    else if (*(unsigned char *)(a1 + 47))
    {
      uint64_t v53 = v48 - 1;
      id v54 = v11;
      do
      {
        int v56 = v54->__r_.__value_.__s.__data_[0];
        id v54 = (std::string *)((char *)v54 + 1);
        int v55 = v56;
        int v57 = v52->__r_.__value_.__s.__data_[0];
        int v52 = (std::string *)((char *)v52 + 1);
        BOOL v58 = v55 != v57;
      }
      while (v55 == v57 && v53-- != 0);
      if ((SHIBYTE(context.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_111:
        if (!v58) {
          goto LABEL_112;
        }
LABEL_117:
        Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA2CLL);
      }
    }
    else
    {
      BOOL v58 = 0;
      if ((SHIBYTE(context.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
        goto LABEL_111;
      }
    }
  }
  else
  {
    BOOL v58 = 1;
    if ((SHIBYTE(context.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_111;
    }
  }
  operator delete(context.__r_.__value_.__l.__data_);
  if (v58) {
    goto LABEL_117;
  }
LABEL_112:
  char v39 = *(unsigned char *)(a1 + 23);
LABEL_113:
  v67.__r_.__value_.__l.__size_ = 0xAAAAAAAAAAAAAAAALL;
  CFDictionaryRef v45 = (const void *)a1;
  if (v39 < 0) {
    CFDictionaryRef v45 = *(const void **)a1;
  }
LABEL_124:
  *(_OWORD *)&v67.__r_.__value_.__l.__data_ = (unint64_t)v45;
  uint64_t v60 = fts_open(&v67.__r_.__value_.__l.__data_, 21, 0);
  *(void *)(a1 + 48) = v60;
  if (!v60)
  {
    char v63 = __error();
    Security::UnixError::throwMe((Security::UnixError *)*v63);
  }
  if (a4) {
    CFRetain(a4);
  }
  if (*v10) {
    CFRelease(*v10);
  }
  CFTypeRef *v10 = a4;
  theDict[0] = (CFDictionaryRef)0xAAAAAAAAAAAAAAAALL;
  theDict[1] = (CFDictionaryRef)0xAAAAAAAAAAAAAAAALL;
  Security::CFDictionary::CFDictionary((Security::CFDictionary *)theDict, (const __CFDictionary *)a4, (Security::MacOSError *)0xFFFEFA13);
  context.__r_.__value_.__r.__words[0] = a1;
  context.__r_.__value_.__l.__size_ = (std::string::size_type)Security::CodeSigning::ResourceBuilder::addRule;
  context.__r_.__value_.__r.__words[2] = 0;
  CFDictionaryApplyFunction(theDict[0], (CFDictionaryApplierFunction)Security::CFDictionary::Applier<Security::CodeSigning::ResourceBuilder>::apply, &context);
  Security::CFRef<__CFDictionary const*>::~CFRef((const void **)theDict);
  return a1;
}

void sub_18B40614C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  BOOL v29 = *(void **)(v25 + 64);
  if (v29)
  {
    *(void *)(v25 + 72) = v29;
    operator delete(v29);
  }
  Security::CFRef<__CFDictionary const*>::~CFRef(v27);
  if (*(char *)(v25 + 47) < 0) {
    operator delete(*v26);
  }
  if (*(char *)(v25 + 23) < 0) {
    operator delete(*(void **)v25);
  }
  _Unwind_Resume(a1);
}

void Security::CodeSigning::ResourceBuilder::Rule::~Rule(void **this)
{
  if (*((char *)this + 63) < 0) {
    operator delete(this[5]);
  }
}

void Security::CodeSigning::ResourceBuilder::~ResourceBuilder(Security::CodeSigning::ResourceBuilder *this)
{
  uint64_t v3 = (void ***)*((void *)this + 8);
  uint64_t v2 = (void ***)*((void *)this + 9);
  while (v3 != v2)
  {
    if (*v3)
    {
      Security::CodeSigning::ResourceBuilder::Rule::~Rule(*v3);
      MEMORY[0x18C12D390]();
      uint64_t v2 = (void ***)*((void *)this + 9);
    }
    ++v3;
  }
  fts_close(*((FTS **)this + 6));
  CFTypeID v4 = (void *)*((void *)this + 8);
  if (v4)
  {
    *((void *)this + 9) = v4;
    operator delete(v4);
  }
  Security::CFRef<__CFDictionary const*>::~CFRef((const void **)this + 7);
  if (*((char *)this + 47) < 0) {
    operator delete(*((void **)this + 3));
  }
  if (*((char *)this + 23) < 0) {
    operator delete(*(void **)this);
  }
}

void Security::CodeSigning::ResourceBuilder::scan(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v5 = 0;
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  unsigned int v62 = -67060;
  memset(&v83, 0, sizeof(v83));
  CFTypeRef v65 = (const void **)(a1 + 24);
  int v64 = 1;
  while (1)
  {
    uint64_t v6 = fts_read(*(FTS **)(a1 + 48));
    unint64_t v7 = v6;
    if (!v6) {
      break;
    }
    char v8 = *(unsigned char *)(a1 + 23);
    if (v8 < 0) {
      uint64_t v9 = *(void *)(a1 + 8);
    }
    else {
      uint64_t v9 = *(unsigned __int8 *)(a1 + 23);
    }
    uint64_t v10 = &v6->fts_path[v9];
    int v12 = *v10;
    int v11 = (std::string *)(v10 + 1);
    if (v12) {
      p_str = v11;
    }
    else {
      p_str = (std::string *)&v6->fts_path[v9];
    }
    memset(&__str, 0, sizeof(__str));
    uint64_t v14 = *(unsigned __int8 *)(a1 + 47);
    if ((v14 & 0x80u) == 0) {
      uint64_t v15 = *(unsigned __int8 *)(a1 + 47);
    }
    else {
      uint64_t v15 = *(void *)(a1 + 32);
    }
    if (v15 != v9) {
      goto LABEL_23;
    }
    if (v8 >= 0) {
      uint64_t v16 = (unsigned __int8 *)a1;
    }
    else {
      uint64_t v16 = *(unsigned __int8 **)a1;
    }
    if ((v14 & 0x80) != 0)
    {
      if (memcmp(*v65, v16, *(void *)(a1 + 32))) {
        goto LABEL_23;
      }
    }
    else if (*(unsigned char *)(a1 + 47))
    {
      int v17 = v65;
      while (*(unsigned __int8 *)v17 == *v16)
      {
        int v17 = (const void **)((char *)v17 + 1);
        ++v16;
        if (!--v14) {
          goto LABEL_49;
        }
      }
LABEL_23:
      BOOL v18 = (std::string *)std::string::basic_string[abi:ne180100]<0>(&v84, (char *)p_str);
      __int16 v19 = std::string::insert(v18, 0, "../", 3uLL);
      std::string::size_type v20 = v19->__r_.__value_.__r.__words[0];
      *(void *)int v85 = v19->__r_.__value_.__l.__size_;
      *(void *)&v85[7] = *(std::string::size_type *)((char *)&v19->__r_.__value_.__r.__words[1] + 7);
      char v21 = HIBYTE(v19->__r_.__value_.__r.__words[2]);
      v19->__r_.__value_.__l.__size_ = 0;
      v19->__r_.__value_.__r.__words[2] = 0;
      v19->__r_.__value_.__r.__words[0] = 0;
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__str.__r_.__value_.__l.__data_);
      }
      __str.__r_.__value_.__r.__words[0] = v20;
      __str.__r_.__value_.__l.__size_ = *(void *)v85;
      *(std::string::size_type *)((char *)&__str.__r_.__value_.__r.__words[1] + 7) = *(void *)&v85[7];
      *((unsigned char *)&__str.__r_.__value_.__s + 23) = v21;
      if (SHIBYTE(v84.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v84.__r_.__value_.__l.__data_);
      }
      std::string::basic_string(&v84, &__str, 0, 0xCuLL, (std::allocator<char> *)v85);
      std::string::size_type size = HIBYTE(v84.__r_.__value_.__r.__words[2]);
      if ((v84.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        std::string::size_type size = v84.__r_.__value_.__l.__size_;
      }
      if (size == 12)
      {
        std::string v23 = (std::string *)v84.__r_.__value_.__r.__words[0];
        if ((v84.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          std::string v23 = &v84;
        }
        std::string::size_type v24 = v23->__r_.__value_.__r.__words[0];
        int v25 = v23->__r_.__value_.__r.__words[1];
        BOOL v27 = v24 == 0x65746E6F432F2E2ELL && v25 == 796095598;
        if ((SHIBYTE(v84.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        {
LABEL_39:
          if (v27)
          {
LABEL_43:
            std::string::basic_string(&v84, &__str, 0xCuLL, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)v85);
            if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(__str.__r_.__value_.__l.__data_);
            }
            std::string __str = v84;
          }
LABEL_46:
          if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            p_str = &__str;
          }
          else {
            p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
          }
          goto LABEL_49;
        }
      }
      else
      {
        BOOL v27 = 0;
        if ((SHIBYTE(v84.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
          goto LABEL_39;
        }
      }
      operator delete(v84.__r_.__value_.__l.__data_);
      if (v27) {
        goto LABEL_43;
      }
      goto LABEL_46;
    }
LABEL_49:
    switch(v7->fts_info)
    {
      case 1u:
        long long v28 = secLogObjForScope("rdirenum");
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          std::string::size_type fts_path = (std::string::size_type)v7->fts_path;
          LODWORD(v84.__r_.__value_.__l.__data_) = 136315138;
          *(std::string::size_type *)((char *)v84.__r_.__value_.__r.__words + 4) = fts_path;
          _os_log_debug_impl(&dword_18B299000, v28, OS_LOG_TYPE_DEBUG, "entering %s", (uint8_t *)&v84, 0xCu);
        }
        ++GKBIS_Num_dirs;
        if ((v64 | v5)) {
          goto LABEL_122;
        }
        std::string::basic_string[abi:ne180100]<0>(v68, (char *)p_str);
        uint64_t Rule = Security::CodeSigning::ResourceBuilder::findRule(a1, (uint64_t)v68);
        uint64_t v30 = Rule;
        if (v69 < 0)
        {
          operator delete(v68[0]);
          if (!v30) {
            goto LABEL_121;
          }
        }
        else if (!Rule)
        {
          goto LABEL_121;
        }
        uint64_t v45 = *(unsigned int *)(v30 + 36);
        if ((v45 & 4) != 0)
        {
          if (strchr(v7->fts_name, 46))
          {
            std::string::basic_string[abi:ne180100]<0>(v66, (char *)p_str);
            (*(void (**)(uint64_t, FTSENT *, uint64_t, void **, uint64_t))(a2 + 16))(a2, v7, v45, v66, v30);
            if (v67 < 0) {
              operator delete(v66[0]);
            }
LABEL_120:
            fts_set(*(FTS **)(a1 + 48), v7, 4);
          }
LABEL_121:
          int v5 = 0;
          goto LABEL_122;
        }
        if ((v45 & 0x10) == 0) {
          goto LABEL_121;
        }
        if (!a3) {
          goto LABEL_120;
        }
        std::string::__assign_external(&v83, (const std::string::value_type *)p_str);
        uint64_t v46 = secLogObjForScope("rdirenum");
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v60 = &v83;
          if ((v83.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
            uint64_t v60 = (std::string *)v83.__r_.__value_.__r.__words[0];
          }
          LODWORD(v84.__r_.__value_.__l.__data_) = 136315138;
          *(std::string::size_type *)((char *)v84.__r_.__value_.__r.__words + 4) = (std::string::size_type)v60;
          _os_log_debug_impl(&dword_18B299000, v46, OS_LOG_TYPE_DEBUG, "entering excluded path: %s", (uint8_t *)&v84, 0xCu);
        }
        int v5 = 1;
LABEL_122:
        fts_name = v7->fts_name;
        size_t v49 = strlen(fts_name);
        if (v49 >= 6 && !strcasecmp(&fts_name[v49 - 6], ".lproj"))
        {
          int v64 = 0;
          ++GKBIS_Num_localizations;
        }
        else
        {
          int v64 = 0;
        }
LABEL_125:
        if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__str.__r_.__value_.__l.__data_);
        }
        break;
      case 4u:
        std::string::size_type v35 = secLogObjForScope("rdirenum");
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          std::string::size_type v56 = (std::string::size_type)v7->fts_path;
          LODWORD(v84.__r_.__value_.__l.__data_) = 136315138;
          *(std::string::size_type *)((char *)v84.__r_.__value_.__r.__words + 4) = v56;
          _os_log_debug_impl(&dword_18B299000, v35, OS_LOG_TYPE_DEBUG, "cannot read directory %s", (uint8_t *)&v84, 0xCu);
        }
        if (*(unsigned char *)(a1 + 88)) {
          goto LABEL_145;
        }
        goto LABEL_125;
      case 6u:
        std::string::size_type v32 = secLogObjForScope("rdirenum");
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          std::string::size_type v54 = (std::string::size_type)v7->fts_path;
          LODWORD(v84.__r_.__value_.__l.__data_) = 136315138;
          *(std::string::size_type *)((char *)v84.__r_.__value_.__r.__words + 4) = v54;
          _os_log_debug_impl(&dword_18B299000, v32, OS_LOG_TYPE_DEBUG, "leaving %s", (uint8_t *)&v84, 0xCu);
          if ((v5 & 1) == 0) {
            goto LABEL_116;
          }
        }
        else if ((v5 & 1) == 0)
        {
          goto LABEL_116;
        }
        if ((v83.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          std::string::size_type v33 = HIBYTE(v83.__r_.__value_.__r.__words[2]);
        }
        else {
          std::string::size_type v33 = v83.__r_.__value_.__l.__size_;
        }
        if (v33 == strlen((const char *)p_str)
          && ((v83.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
            ? (BOOL v34 = &v83)
            : (BOOL v34 = (std::string *)v83.__r_.__value_.__r.__words[0]),
              !memcmp(v34, p_str, v33)))
        {
          std::string::size_type v50 = secLogObjForScope("rdirenum");
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
          {
            uint32_t v59 = &v83;
            if ((v83.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
              uint32_t v59 = (std::string *)v83.__r_.__value_.__r.__words[0];
            }
            LODWORD(v84.__r_.__value_.__l.__data_) = 136315138;
            *(std::string::size_type *)((char *)v84.__r_.__value_.__r.__words + 4) = (std::string::size_type)v59;
            _os_log_debug_impl(&dword_18B299000, v50, OS_LOG_TYPE_DEBUG, "exiting excluded path: %s", (uint8_t *)&v84, 0xCu);
          }
          int v5 = 0;
          if (SHIBYTE(v83.__r_.__value_.__r.__words[2]) < 0)
          {
            *v83.__r_.__value_.__l.__data_ = 0;
            v83.__r_.__value_.__l.__size_ = 0;
          }
          else
          {
            v83.__r_.__value_.__s.__data_[0] = 0;
            *((unsigned char *)&v83.__r_.__value_.__s + 23) = 0;
          }
        }
        else
        {
          int v5 = 1;
        }
        goto LABEL_125;
      case 8u:
        uint64_t v36 = secLogObjForScope("rdirenum");
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          std::string::size_type v57 = (std::string::size_type)v7->fts_path;
          LODWORD(v84.__r_.__value_.__l.__data_) = 136315138;
          *(std::string::size_type *)((char *)v84.__r_.__value_.__r.__words + 4) = v57;
          _os_log_debug_impl(&dword_18B299000, v36, OS_LOG_TYPE_DEBUG, "file %s", (uint8_t *)&v84, 0xCu);
        }
        ++GKBIS_Num_files;
        if (!strncasecmp(v7->fts_name, "._", 2uLL)) {
          ++GKBIS_Dot_underbar_Present;
        }
        if (!strcasecmp(v7->fts_name, ".DS_Store")) {
          ++GKBIS_DS_Store_Present;
        }
        std::string::basic_string[abi:ne180100]<0>(v80, (char *)p_str);
        uint64_t v37 = Security::CodeSigning::ResourceBuilder::findRule(a1, (uint64_t)v80);
        if (v81 < 0) {
          operator delete(v80[0]);
        }
        if ((v37 == 0) | v5 & 1 || (uint64_t v38 = *(unsigned int *)(v37 + 36), (v38 & 0x12) != 0))
        {
          if (a3)
          {
            uint64_t v39 = v37 ? *(unsigned int *)(v37 + 36) : 0;
            std::string::basic_string[abi:ne180100]<0>(v76, (char *)p_str);
            (*(void (**)(uint64_t, FTSENT *, uint64_t, void *, uint64_t))(a3 + 16))(a3, v7, v39, v76, v37);
            if (v77 < 0)
            {
              std::string v44 = (void *)v76[0];
              goto LABEL_104;
            }
          }
          goto LABEL_125;
        }
        std::string::basic_string[abi:ne180100]<0>(v78, (char *)p_str);
        (*(void (**)(uint64_t, FTSENT *, uint64_t, void *, uint64_t))(a2 + 16))(a2, v7, v38, v78, v37);
        if ((v79 & 0x80000000) == 0) {
          goto LABEL_116;
        }
        uint64_t v47 = (void *)v78[0];
        goto LABEL_115;
      case 0xCu:
        size_t v40 = secLogObjForScope("rdirenum");
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        {
          std::string::size_type v58 = (std::string::size_type)v7->fts_path;
          LODWORD(v84.__r_.__value_.__l.__data_) = 136315138;
          *(std::string::size_type *)((char *)v84.__r_.__value_.__r.__words + 4) = v58;
          _os_log_debug_impl(&dword_18B299000, v40, OS_LOG_TYPE_DEBUG, "symlink %s", (uint8_t *)&v84, 0xCu);
        }
        ++GKBIS_Num_symlinks;
        if (!strcasecmp(v7->fts_name, ".DS_Store"))
        {
          int v61 = -67012;
LABEL_144:
          unsigned int v62 = v61;
LABEL_145:
          Security::MacOSError::throwMe((Security::MacOSError *)v62);
        }
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)p_str);
        uint64_t v41 = Security::CodeSigning::ResourceBuilder::findRule(a1, (uint64_t)__p);
        if (v75 < 0) {
          operator delete(__p[0]);
        }
        if ((v41 == 0) | v5 & 1 || (int v42 = *(_DWORD *)(v41 + 36), (v42 & 0x12) != 0))
        {
          if (a3)
          {
            uint64_t v43 = v41 ? *(unsigned int *)(v41 + 36) : 0;
            std::string::basic_string[abi:ne180100]<0>(v70, (char *)p_str);
            (*(void (**)(uint64_t, FTSENT *, uint64_t, void **, uint64_t))(a3 + 16))(a3, v7, v43, v70, v41);
            if (v71 < 0)
            {
              std::string v44 = v70[0];
LABEL_104:
              operator delete(v44);
            }
          }
        }
        else
        {
          std::string::basic_string[abi:ne180100]<0>(v72, (char *)p_str);
          (*(void (**)(uint64_t, FTSENT *, void, void **, uint64_t))(a2 + 16))(a2, v7, v42 & 0xFFFFFFFB, v72, v41);
          if (v73 < 0)
          {
            uint64_t v47 = v72[0];
LABEL_115:
            operator delete(v47);
          }
LABEL_116:
          int v5 = 0;
        }
        goto LABEL_125;
      default:
        std::string::size_type v31 = secLogObjForScope("rdirenum");
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          int fts_info = v7->fts_info;
          int fts_errno = v7->fts_errno;
          std::string::size_type v53 = (std::string::size_type)v7->fts_path;
          LODWORD(v84.__r_.__value_.__l.__data_) = 67109634;
          HIDWORD(v84.__r_.__value_.__r.__words[0]) = fts_info;
          LOWORD(v84.__r_.__value_.__r.__words[1]) = 1024;
          *(_DWORD *)((char *)&v84.__r_.__value_.__r.__words[1] + 2) = fts_errno;
          HIWORD(v84.__r_.__value_.__r.__words[1]) = 2080;
          v84.__r_.__value_.__r.__words[2] = v53;
          _os_log_debug_impl(&dword_18B299000, v31, OS_LOG_TYPE_DEBUG, "type %d (errno %d): %s", (uint8_t *)&v84, 0x18u);
        }
        if (!*(unsigned char *)(a1 + 89)) {
          goto LABEL_125;
        }
        int v61 = -67016;
        goto LABEL_144;
    }
  }
  if (SHIBYTE(v83.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v83.__r_.__value_.__l.__data_);
  }
}

void sub_18B406CC4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,uint64_t a33,uint64_t a34,int a35,__int16 a36,char a37,char a38,uint64_t a39,uint64_t a40,int a41,__int16 a42,char a43,char a44,uint64_t a45,uint64_t a46,int a47,__int16 a48,char a49,char a50,uint64_t a51,uint64_t a52,int a53,__int16 a54,char a55,char a56,uint64_t a57,uint64_t a58,int a59,__int16 a60,char a61,char a62)
{
  if (a26 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v62 - 169) < 0) {
    operator delete(*(void **)(v62 - 192));
  }
  if (*(char *)(v62 - 145) < 0) {
    operator delete(*(void **)(v62 - 168));
  }
  _Unwind_Resume(exception_object);
}

uint64_t Security::CodeSigning::ResourceBuilder::findRule(uint64_t a1, uint64_t a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  CFTypeID v4 = secLogObjForScope("rscan");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    BOOL v18 = (const char *)a2;
    if (*(char *)(a2 + 23) < 0) {
      BOOL v18 = *(const char **)a2;
    }
    *(_DWORD *)std::string buf = 136315138;
    std::string::size_type v20 = v18;
    _os_log_debug_impl(&dword_18B299000, v4, OS_LOG_TYPE_DEBUG, "test %s", buf, 0xCu);
  }
  int v5 = *(uint64_t **)(a1 + 64);
  if (v5 != *(uint64_t **)(a1 + 72))
  {
    uint64_t v6 = 0;
    while (1)
    {
      uint64_t v7 = *v5;
      char v8 = secLogObjForScope("rscan");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        int v11 = (const char *)(v7 + 40);
        if (*(char *)(v7 + 63) < 0) {
          int v11 = *(const char **)v11;
        }
        *(_DWORD *)std::string buf = 136315138;
        std::string::size_type v20 = v11;
        _os_log_debug_impl(&dword_18B299000, v8, OS_LOG_TYPE_DEBUG, "try %s", buf, 0xCu);
      }
      uint64_t v9 = (const char *)a2;
      if (*(char *)(a2 + 23) < 0) {
        uint64_t v9 = *(const char **)a2;
      }
      if (Security::CodeSigning::ResourceBuilder::Rule::match((const regex_t *)v7, v9))
      {
        uint64_t v10 = secLogObjForScope("rscan");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)std::string buf = 0;
          _os_log_debug_impl(&dword_18B299000, v10, OS_LOG_TYPE_DEBUG, "match", buf, 2u);
        }
        if ((*(unsigned char *)(v7 + 36) & 0x10) != 0)
        {
          uint64_t v16 = secLogObjForScope("rscan");
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)std::string buf = 0;
            _os_log_debug_impl(&dword_18B299000, v16, OS_LOG_TYPE_DEBUG, "excluded", buf, 2u);
          }
          return v7;
        }
        if (!v6 || *(_DWORD *)(v7 + 32) > *(_DWORD *)(v6 + 32)) {
          uint64_t v6 = v7;
        }
      }
      if (++v5 == *(uint64_t **)(a1 + 72)) {
        goto LABEL_20;
      }
    }
  }
  uint64_t v6 = 0;
LABEL_20:
  int v12 = secLogObjForScope("rscan");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    if (v6)
    {
      uint64_t v15 = (const char *)(v6 + 40);
      if (*(char *)(v6 + 63) < 0) {
        uint64_t v15 = *(const char **)v15;
      }
      int v13 = *(_DWORD *)(v6 + 32);
      int v14 = *(_DWORD *)(v6 + 36);
    }
    else
    {
      int v13 = 0;
      int v14 = 0;
      uint64_t v15 = "NOTHING";
    }
    *(_DWORD *)std::string buf = 136315650;
    std::string::size_type v20 = v15;
    __int16 v21 = 1024;
    int v22 = v13;
    __int16 v23 = 1024;
    int v24 = v14;
    _os_log_debug_impl(&dword_18B299000, v12, OS_LOG_TYPE_DEBUG, "choosing %s (%d,0x%x)", buf, 0x18u);
  }
  return v6;
}

uint64_t Security::CodeSigning::ResourceBuilder::Rule::match(const regex_t *this, const char *a2)
{
  int v2 = regexec(this, a2, 0, 0, 0);
  if (!v2) {
    return 1;
  }
  if (v2 != 1) {
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA13);
  }
  return 0;
}

uint64_t Security::CodeSigning::ResourceBuilder::includes(uint64_t a1, std::string *this)
{
  std::string::size_type v4 = std::string::find(this, 47, 0);
  if (v4 == -1) {
    goto LABEL_7;
  }
  std::string::basic_string(&v12, this, 0, v4, (std::allocator<char> *)&v13);
  uint64_t Rule = Security::CodeSigning::ResourceBuilder::findRule(a1, (uint64_t)&v12);
  uint64_t v6 = Rule;
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v12.__r_.__value_.__l.__data_);
    if (!v6) {
      goto LABEL_7;
    }
  }
  else if (!Rule)
  {
    goto LABEL_7;
  }
  unsigned int v7 = *(_DWORD *)(v6 + 36);
  if ((v7 & 0x10) != 0) {
    return (v7 >> 5) & 1;
  }
LABEL_7:
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&__p, this->__r_.__value_.__l.__data_, this->__r_.__value_.__l.__size_);
  }
  else {
    std::string __p = *this;
  }
  uint64_t v8 = Security::CodeSigning::ResourceBuilder::findRule(a1, (uint64_t)&__p);
  uint64_t v9 = v8;
  if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if (v8) {
      goto LABEL_12;
    }
    return 0;
  }
  operator delete(__p.__r_.__value_.__l.__data_);
  if (!v9) {
    return 0;
  }
LABEL_12:
  if ((*(_DWORD *)(v9 + 36) & 0x12) != 0) {
    return (*(_DWORD *)(v9 + 36) >> 5) & 1;
  }
  else {
    return 1;
  }
}

void sub_18B407228(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN8Security11CodeSigning12hashFileDataINS_11DynamicHashEEEmNS_12UnixPlusPlus8FileDescEPT_m_block_invoke_17939(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 32) + 24))();
}

void ___ZN8Security11CodeSigning15ResourceBuilder8hashFileEPKcNSt3__13setIjNS4_4lessIjEENS4_9allocatorIjEEEEb_block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v6 = (*(uint64_t (**)(uint64_t))(*(void *)a3 + 16))(a3);
  memset(v13, 170, sizeof(v13));
  std::vector<unsigned char>::vector(v13, v6);
  (*(void (**)(uint64_t, void *))(*(void *)a3 + 32))(a3, v13[0]);
  unsigned int v7 = *(__CFDictionary **)(a1 + 32);
  Security::CodeSigning::ResourceBuilder::hashName((Security::CodeSigning::ResourceBuilder *)__p, a2);
  Security::CFTempString::CFTempString<std::string>((CFStringRef *)&v12, (char *)__p);
  uint64_t v8 = v12;
  CFDataRef v9 = CFDataCreate(0, (const UInt8 *)v13[0], v6);
  CFDictionaryAddValue(v7, v8, v9);
  Security::CFRef<__CFData const*>::~CFRef((const void **)&v9);
  Security::CFRef<__CFString const*>::~CFRef(&v12);
  if (v11 < 0) {
    operator delete(__p[0]);
  }
  if (v13[0])
  {
    v13[1] = v13[0];
    operator delete(v13[0]);
  }
}

void sub_18B40739C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, const void *a16, void *a17, uint64_t a18)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a17)
  {
    a18 = (uint64_t)a17;
    operator delete(a17);
  }
  _Unwind_Resume(a1);
}

void *Security::CodeSigning::ResourceBuilder::hashName(Security::CodeSigning::ResourceBuilder *this, int a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (a2 == 1)
  {
    return std::string::basic_string[abi:ne180100]<0>(this, "hash");
  }
  else
  {
    memset(__str, 170, 20);
    snprintf(__str, 0x14uLL, "hash%d", a2);
    return std::string::basic_string[abi:ne180100]<0>(this, __str);
  }
}

void Security::CodeSigning::ResourceBuilder::escapeRE(std::string *a1, std::string::value_type *a2)
{
  a1->__r_.__value_.__r.__words[0] = 0;
  a1->__r_.__value_.__l.__size_ = 0;
  a1->__r_.__value_.__r.__words[2] = 0;
  uint64_t v2 = a2[23];
  int v3 = (char)v2;
  if ((v2 & 0x80u) != 0) {
    uint64_t v2 = *((void *)a2 + 1);
  }
  if (v2)
  {
    if (v3 >= 0) {
      uint64_t v6 = a2;
    }
    else {
      uint64_t v6 = *(std::string::value_type **)a2;
    }
    do
    {
      std::string::value_type v7 = *v6;
      if (memchr("\\[]{}().+*?^$|", *v6, 0xFuLL)) {
        std::string::push_back(a1, 92);
      }
      std::string::push_back(a1, v7);
      ++v6;
      uint64_t v8 = a2[23];
      if ((v8 & 0x80u) == 0) {
        CFDataRef v9 = a2;
      }
      else {
        CFDataRef v9 = *(std::string::value_type **)a2;
      }
      if ((v8 & 0x80u) != 0) {
        uint64_t v8 = *((void *)a2 + 1);
      }
    }
    while (v6 != &v9[v8]);
  }
}

void sub_18B407584(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

Security::CodeSigning::ResourceSeal *Security::CodeSigning::ResourceSeal::ResourceSeal(Security::CodeSigning::ResourceSeal *this, CFTypeRef cf)
{
  *((void *)this + 1) = 0;
  int v3 = (char *)this + 8;
  *((void *)this + 2) = 0;
  std::string::size_type v4 = (char *)this + 16;
  *(void *)this = 0;
  *((_DWORD *)this + 6) = 0;
  if (!cf) {
    goto LABEL_20;
  }
  CFTypeID v6 = CFGetTypeID(cf);
  if (v6 != CFDataGetTypeID())
  {
    CFTypeID v15 = CFGetTypeID(cf);
    if (v15 == CFDictionaryGetTypeID())
    {
      Security::CFRef<__CFArray const*>::operator=((CFTypeRef *)this, cf);
      CFDictionaryRef v14 = *(const __CFDictionary **)this;
      goto LABEL_8;
    }
LABEL_20:
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA11);
  }
  CFDictionaryRef v14 = Security::cfmake<__CFDictionary const*>((uint64_t)"{hash=%O}", v7, v8, v9, v10, v11, v12, v13, (uint64_t)cf);
  if (*(void *)this) {
    CFRelease(*(CFTypeRef *)this);
  }
  *(void *)this = v14;
LABEL_8:
  int v23 = 0;
  CFArrayRef Value = CFDictionaryGetValue(v14, @"requirement");
  CFStringRef v18 = *(const __CFString **)this;
  if (Value)
  {
    __int16 v19 = "{requirement=%SO,?optional=%B}";
    std::string::size_type v4 = v3;
LABEL_12:
    char v21 = Security::cfscan(v18, v19, v16, v4, &v23);
    goto LABEL_13;
  }
  std::string::size_type v20 = CFDictionaryGetValue((CFDictionaryRef)v18, @"symlink");
  CFStringRef v18 = *(const __CFString **)this;
  if (v20)
  {
    __int16 v19 = "{symlink=%SO,?optional=%B}";
    goto LABEL_12;
  }
  char v21 = Security::cfscan(v18, "{?optional=%B}", v16, &v23);
LABEL_13:
  if ((v21 & 1) == 0) {
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA11);
  }
  if (v23) {
    *((_DWORD *)this + 6) |= 1u;
  }
  if (*(void *)v3) {
    *((_DWORD *)this + 6) |= 4u;
  }
  return this;
}

void sub_18B407724(_Unwind_Exception *a1)
{
  Security::CFRef<__CFDictionary const*>::~CFRef(v1);
  _Unwind_Resume(a1);
}

const UInt8 *Security::CodeSigning::ResourceSeal::hash(CFDictionaryRef *this, int a2)
{
  memset(&v10, 170, sizeof(v10));
  Security::CodeSigning::ResourceBuilder::hashName((Security::CodeSigning::ResourceBuilder *)&v10, a2);
  CFDictionaryRef v3 = *this;
  if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&__p, v10.__r_.__value_.__l.__data_, v10.__r_.__value_.__l.__size_);
  }
  else {
    std::string __p = v10;
  }
  Security::CFTempString::CFTempString<std::string>((CFStringRef *)&key, (char *)&__p);
  CFArrayRef Value = CFDictionaryGetValue(v3, key);
  Security::CFRef<__CFString const*>::~CFRef((const void **)&key);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if (Value) {
      goto LABEL_9;
    }
  }
  else if (Value)
  {
    goto LABEL_9;
  }
  CFArrayRef Value = CFDictionaryGetValue(*this, @"hash");
  if (!Value) {
    goto LABEL_13;
  }
LABEL_9:
  CFTypeID v5 = CFGetTypeID(Value);
  if (v5 != CFDataGetTypeID()) {
LABEL_13:
  }
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA11);
  BytePtr = CFDataGetBytePtr((CFDataRef)Value);
  if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v10.__r_.__value_.__l.__data_);
  }
  return BytePtr;
}

void sub_18B407844(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, char a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a22 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t SecCodeSignerRemoteGetTypeID()
{
  return *(void *)(Security::ModuleNexus<Security::CodeSigning::CFObjects>::operator()() + 512);
}

void sub_18B4078A8(void *a1)
{
}

uint64_t SecCodeSignerRemoteCreate(const __CFDictionary *a1, const void *a2, int a3, void *a4)
{
  if ((a3 & 0xFFFFFC0D) != 0) {
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA02);
  }
  uint64_t v13 = (Security::SecCFObject *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v8 = Security::ModuleNexus<Security::CodeSigning::CFObjects>::operator()();
  uint64_t v10 = Security::SecCFObject::allocate((Security::SecCFObject *)0x150, *(void *)(v8 + 512), v9);
  *(void *)(v10 + 8) = 1;
  *(_DWORD *)(v10 + 16) = a3;
  *(void *)(v10 + 168) = 0;
  *(void *)(v10 + 160) = 0;
  *(_OWORD *)(v10 + 24) = 0u;
  *(_OWORD *)(v10 + 40) = 0u;
  *(_OWORD *)(v10 + 56) = 0u;
  *(_OWORD *)(v10 + 80) = 0u;
  *(_OWORD *)(v10 + 96) = 0u;
  *(_OWORD *)(v10 + 1Security::CFRef<__CFArray const*>::~CFRef((const void **)this + 12) = 0u;
  *(void *)(v10 + 152) = v10 + 160;
  *(void *)(v10 + 288) = 0;
  *(_DWORD *)(v10 + 296) = 0;
  *(_OWORD *)(v10 + 176) = 0u;
  *(_OWORD *)(v10 + 192) = 0u;
  *(_OWORD *)(v10 + 208) = 0u;
  *(_OWORD *)(v10 + 224) = 0u;
  *(void *)(v10 + 240) = 0;
  *(void *)(v10 + 256) = 0;
  *(void *)(v10 + 264) = 0;
  *(void *)(v10 + 272) = 0;
  *(void *)(v10 + 304) = 0;
  *(void *)(v10 + 3Security::CFRef<__CFArray const*>::~CFRef((const void **)this + 12) = 0;
  *(void *)uint64_t v10 = &unk_1ED84A580;
  *(void *)(v10 + 328) = 0;
  Security::CFRef<__CFArray const*>::operator=((CFTypeRef *)(v10 + 328), a2);
  Security::SecPointerBase::SecPointerBase(&v13, v10);
  Security::CodeSigning::SecCodeSigner::parameters(v13, a1);
  uint64_t v11 = Security::SecCFObject::handle((atomic_uchar *)v13, 1);
  if (!a4) {
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA03);
  }
  *a4 = v11;
  Security::SecPointerBase::~SecPointerBase((Security::SecPointerBase *)&v13);
  return 0;
}

void sub_18B407A0C(void *a1, int a2)
{
  Security::CFRef<__CFArray const*>::~CFRef(v4);
  Security::CodeSigning::SecCodeSigner::~SecCodeSigner(v3);
  Security::SecCFObject::operator delete(v7);
  switch(a2)
  {
    case 7:
      uint64_t v8 = (CFDictionaryRef *)__cxa_begin_catch(a1);
      Security::CodeSigning::CSError::cfError(v8, v2);
      goto LABEL_32;
    case 6:
      uint64_t v9 = __cxa_begin_catch(a1);
      if (v9[36] == 8) {
        int v10 = -67049;
      }
      else {
        int v10 = (*(uint64_t (**)(_DWORD *))(*(void *)v9 + 24))(v9);
      }
      if (v2)
      {
LABEL_30:
        CFErrorRef v13 = CFErrorCreate(0, (CFErrorDomain)*MEMORY[0x1E4F1D158], v10, 0);
        goto LABEL_31;
      }
LABEL_32:
      __cxa_end_catch();
      JUMPOUT(0x18B4079D0);
    case 5:
      uint64_t v11 = __cxa_begin_catch(a1);
      int v12 = (*(uint64_t (**)(void *))(*(void *)v11 + 24))(v11);
      if (!v2) {
        goto LABEL_32;
      }
      CFErrorRef v13 = CFErrorCreate(0, (CFErrorDomain)*MEMORY[0x1E4F1D158], v12, 0);
LABEL_31:
      Security::Universal *v2 = v13;
      goto LABEL_32;
  }
  if (a2 != 4)
  {
    if (a2 == 3)
    {
      int v17 = __cxa_begin_catch(a1);
      int v18 = (*(uint64_t (**)(void *))(*(void *)v17 + 24))(v17);
      if (v2) {
        Security::Universal *v2 = CFErrorCreate(0, (CFErrorDomain)*MEMORY[0x1E4F1D158], v18, 0);
      }
    }
    else
    {
      __cxa_begin_catch(a1);
      if (a2 == 2)
      {
        if (v2) {
          Security::Universal *v2 = CFErrorCreate(0, (CFErrorDomain)*MEMORY[0x1E4F1D158], -108, 0);
        }
      }
      else
      {
        Security::Syslog::notice((Security::Syslog *)"unknown exception in CSAPI", v19);
        if (v2) {
          Security::Universal *v2 = CFErrorCreate(0, (CFErrorDomain)*MEMORY[0x1E4F1D158], -67048, 0);
        }
      }
    }
    goto LABEL_32;
  }
  CFDictionaryRef v14 = __cxa_begin_catch(a1);
  unsigned int v15 = v14[36];
  if (v15 > 0x1A) {
    goto LABEL_28;
  }
  int v10 = -67033;
  int v16 = 1 << v15;
  if ((v16 & 0x800108) != 0) {
    goto LABEL_29;
  }
  if ((v16 & 0x4014000) != 0) {
    int v10 = -67032;
  }
  else {
LABEL_28:
  }
    int v10 = (*(uint64_t (**)(_DWORD *))(*(void *)v14 + 24))(v14);
LABEL_29:
  if (!v2) {
    goto LABEL_32;
  }
  goto LABEL_30;
}

void sub_18B407CC8(_Unwind_Exception *a1)
{
}

uint64_t SecCodeSignerRemoteAddSignature(uint64_t a1, Security::CodeSigning::SecStaticCode *a2, int a3, uint64_t a4)
{
  __dst[55] = *MEMORY[0x1E4F143B8];
  if (a3) {
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA02);
  }
  unint64_t v17 = 0xAAAAAAAAAAAAAAAALL;
  if (!a1
  {
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA01);
  }
  Security::SecPointerBase::SecPointerBase(&v17, (uint64_t)v6);
  uint64_t v7 = (Security::CodeSigning::SecCodeSigner *)v17;
  uint64_t v9 = (Security::CodeSigning::SecStaticCode *)Security::CodeSigning::SecStaticCode::required(a2, v8);
  Security::CodeSigning::SecStaticCode::codeDirectory(v9, 0);
  int v10 = secLogObjForScope("remotesigner");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(__dst[0]) = 134218496;
    *(void *)((char *)__dst + 4) = v7;
    WORD2(__dst[1]) = 2048;
    *(void *)((char *)&__dst[1] + 6) = v9;
    HIWORD(__dst[2]) = 2048;
    void __dst[3] = a4;
    _os_log_debug_impl(&dword_18B299000, v10, OS_LOG_TYPE_DEBUG, "%p will start remote signature from %p with block %p", (uint8_t *)__dst, 0x20u);
  }
  *((_DWORD *)v9 + 52) = 0;
  memcpy(__dst, &unk_18B41C710, 0x1B8uLL);
  Security::CodeSigning::SecCodeSigner::Signer::Signer((Security::CodeSigning::SecCodeSigner::Signer *)__dst, v7, v9);
  if (((*(uint64_t (**)(Security::CodeSigning::SecCodeSigner *))(*(void *)v7 + 80))(v7) & 1) == 0)
  {
    int v16 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)std::string buf = 0;
      _os_log_impl(&dword_18B299000, v16, OS_LOG_TYPE_DEFAULT, "Invalid signing operation, bailing.", buf, 2u);
    }
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA01);
  }
  uint64_t v11 = secLogObjForScope("remotesigner");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = *((void *)v7 + 41);
    *(_DWORD *)std::string buf = 134218754;
    __int16 v19 = v7;
    __int16 v20 = 2048;
    char v21 = v9;
    __int16 v22 = 1024;
    int v23 = 0;
    __int16 v24 = 2112;
    uint64_t v25 = v15;
    _os_log_debug_impl(&dword_18B299000, v11, OS_LOG_TYPE_DEBUG, "%p will sign %p (flags 0x%x) with certs: %@", buf, 0x26u);
  }
  int v12 = (Security::CodeSigning::SecCodeSigner *)*((void *)v7 + 41);
  CFErrorRef v13 = secLogObjForScope("signer");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)std::string buf = 138412290;
    __int16 v19 = v12;
    _os_log_debug_impl(&dword_18B299000, v13, OS_LOG_TYPE_DEBUG, "configuring remote signing with cert chain: %@", buf, 0xCu);
  }
  BYTE2(__dst[40]) = 1;
  __dst[41] = a4;
  Security::CFRef<__CFArray const*>::operator=((CFTypeRef *)&__dst[42], v12);
  Security::CodeSigning::SecCodeSigner::Signer::sign((Security::CodeSigning::SecCodeSigner::Signer *)__dst, 0);
  Security::CodeSigning::SecStaticCode::resetValidity(v9);
  Security::CodeSigning::SecCodeSigner::Signer::~Signer((Security::CodeSigning::SecCodeSigner::Signer *)__dst);
  Security::SecPointerBase::~SecPointerBase((Security::SecPointerBase *)&v17);
  return 0;
}

void sub_18B408054(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  switch(a2)
  {
    case 7:
      __int16 v19 = (CFDictionaryRef *)__cxa_begin_catch(exception_object);
      Security::CodeSigning::CSError::cfError(v19, v17);
      __cxa_end_catch();
      goto LABEL_36;
    case 6:
      __int16 v20 = __cxa_begin_catch(exception_object);
      if (v20[36] == 8) {
        int v21 = -67049;
      }
      else {
        int v21 = (*(uint64_t (**)(_DWORD *))(*(void *)v20 + 24))(v20);
      }
      if (v17) {
        void *v17 = CFErrorCreate(0, (CFErrorDomain)*MEMORY[0x1E4F1D158], v21, 0);
      }
LABEL_23:
      __cxa_end_catch();
LABEL_36:
      JUMPOUT(0x18B407EC4);
    case 5:
      __int16 v22 = __cxa_begin_catch(exception_object);
      int v23 = (*(uint64_t (**)(void *))(*(void *)v22 + 24))(v22);
      if (v17) {
        void *v17 = CFErrorCreate(0, (CFErrorDomain)*MEMORY[0x1E4F1D158], v23, 0);
      }
      goto LABEL_23;
  }
  if (a2 != 4)
  {
    if (a2 == 3)
    {
      long long v28 = __cxa_begin_catch(exception_object);
      int v29 = (*(uint64_t (**)(void *))(*(void *)v28 + 24))(v28);
      if (v17) {
        void *v17 = CFErrorCreate(0, (CFErrorDomain)*MEMORY[0x1E4F1D158], v29, 0);
      }
    }
    else
    {
      __cxa_begin_catch(exception_object);
      if (a2 == 2)
      {
        if (v17) {
          void *v17 = CFErrorCreate(0, (CFErrorDomain)*MEMORY[0x1E4F1D158], -108, 0);
        }
      }
      else
      {
        Security::Syslog::notice((Security::Syslog *)"unknown exception in CSAPI", v30);
        if (v17) {
          void *v17 = CFErrorCreate(0, (CFErrorDomain)*MEMORY[0x1E4F1D158], -67048, 0);
        }
      }
    }
    goto LABEL_23;
  }
  __int16 v24 = __cxa_begin_catch(exception_object);
  unsigned int v25 = v24[36];
  if (v25 > 0x1A) {
    goto LABEL_31;
  }
  int v26 = -67033;
  int v27 = 1 << v25;
  if ((v27 & 0x800108) != 0) {
    goto LABEL_32;
  }
  if ((v27 & 0x4014000) != 0) {
    int v26 = -67032;
  }
  else {
LABEL_31:
  }
    int v26 = (*(uint64_t (**)(_DWORD *))(*(void *)v24 + 24))(v24);
LABEL_32:
  if (v17) {
    void *v17 = CFErrorCreate(0, (CFErrorDomain)*MEMORY[0x1E4F1D158], v26, 0);
  }
  goto LABEL_23;
}

void Security::CodeSigning::LimitedAsync::~LimitedAsync(Security::CodeSigning::LimitedAsync *this)
{
  *(void *)this = &unk_1ED84A050;
  uint64_t v1 = *((void *)this + 1);
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }

  JUMPOUT(0x18C12D390);
}

{
  uint64_t v1;

  *(void *)this = &unk_1ED84A050;
  uint64_t v1 = *((void *)this + 1);
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }
}

void Security::CodeSigning::LimitedAsync::LimitedAsync(Security::CodeSigning::LimitedAsync *this)
{
  *(void *)this = &unk_1ED84A050;
  sysconf(58);
  operator new();
}

void Security::CodeSigning::LimitedAsync::perform(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x4002000000;
  int v10 = __Block_byref_object_copy__18004;
  uint64_t v11 = __Block_byref_object_dispose__18005;
  uint64_t v13 = a1;
  unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
  int v12 = &unk_1ED84AB30;
  LOBYTE(v14) = dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 8), 0) == 0;
  if (*((unsigned char *)v8 + 56))
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 0x40000000;
    v6[2] = ___ZN8Security11CodeSigning12LimitedAsync7performERNS_8Dispatch5GroupEU13block_pointerFvvE_block_invoke;
    v6[3] = &unk_1E5485B10;
    v6[4] = a3;
    v6[5] = &v7;
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 0x40000000;
    unint64_t v17 = ___ZN8Security8Dispatch5Group7enqueueEP16dispatch_queue_sU13block_pointerFvvE_block_invoke;
    int v18 = &__block_descriptor_tmp_7_16253;
    uint64_t v19 = a2;
    __int16 v20 = global_queue;
    if (!*(unsigned char *)(a2 + 72))
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 0x40000000;
      block[2] = ___ZN8Security8Dispatch23ExceptionAwareEnqueuing21enqueueWithDispatcherEU13block_pointerFvU13block_pointerFvvEES3__block_invoke;
      block[3] = &unk_1E54850D0;
      block[4] = v6;
      block[5] = a2 + 8;
      dispatch_group_async(*(dispatch_group_t *)(a2 + 88), global_queue, block);
    }
  }
  else
  {
    (*(void (**)(uint64_t))(a3 + 16))(a3);
  }
  _Block_object_dispose(&v7, 8);
  int v12 = &unk_1ED84AB30;
  if ((_BYTE)v14) {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v13 + 8));
  }
}

void sub_18B408738(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
  if (a22) {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a21 + 8));
  }
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__18004(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = &unk_1ED84AB30;
  *(void *)(result + 48) = v2;
  *(unsigned char *)(result + 56) = *(unsigned char *)(a2 + 56);
  *(unsigned char *)(a2 + 56) = 0;
  return result;
}

intptr_t __Block_byref_object_dispose__18005(intptr_t result)
{
  *(void *)(result + 40) = &unk_1ED84AB30;
  if (*(unsigned char *)(result + 56)) {
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(result + 48) + 8));
  }
  return result;
}

intptr_t ___ZN8Security11CodeSigning12LimitedAsync7performERNS_8Dispatch5GroupEU13block_pointerFvvE_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v3 = *(void *)(v1 + 48);
  char v4 = *(unsigned char *)(v1 + 56);
  *(unsigned char *)(v1 + 56) = 0;
  intptr_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (v4) {
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v3 + 8));
  }
  return result;
}

void sub_18B408864(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12)
{
  if (a12) {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a11 + 8));
  }
  _Unwind_Resume(exception_object);
}

uint64_t Security::CodeSigning::isOnRootFilesystem(Security::CodeSigning *this, const char *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  memset(&__b, 170, sizeof(__b));
  if (!statfs((const char *)this, &__b)) {
    return (BYTE1(__b.f_flags) >> 6) & 1;
  }
  uint64_t v3 = secLogObjForScope("SecError");
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  uint64_t result = 0;
  if (v4)
  {
    int v6 = *__error();
    v7[0] = 67109378;
    v7[1] = v6;
    __int16 v8 = 2080;
    uint64_t v9 = this;
    _os_log_impl(&dword_18B299000, v3, OS_LOG_TYPE_DEFAULT, "Unable to check if path is on rootfs: %d, %s", (uint8_t *)v7, 0x12u);
    return 0;
  }
  return result;
}

BOOL Security::CodeSigning::pathFileSystemUsesXattrFiles(Security::CodeSigning *this, const char *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  int v23 = -1431655766;
  *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v21 = v3;
  long long v22 = v3;
  memset(&__b, 170, sizeof(__b));
  if (!this)
  {
    uint64_t v11 = secLogObjForScope("SecError");
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v12) {
      return result;
    }
    *(_WORD *)std::string buf = 0;
    int v10 = "path is NULL";
    uint64_t v13 = v11;
    uint32_t v14 = 2;
    goto LABEL_11;
  }
  if (statfs((const char *)this, &__b))
  {
    BOOL v4 = secLogObjForScope("SecError");
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v5) {
      return result;
    }
    int v7 = *__error();
    __int16 v8 = __error();
    uint64_t v9 = strerror(*v8);
    *(_DWORD *)std::string buf = 136315650;
    uint64_t f_mntonname = (uint64_t)this;
    __int16 v27 = 1024;
    int v28 = v7;
    __int16 v29 = 2080;
    uint64_t v30 = v9;
    int v10 = "Unable to convert %s to its filesystem mount [statfs failed]: %d [%s]";
LABEL_10:
    uint64_t v13 = v4;
    uint32_t v14 = 28;
LABEL_11:
    _os_log_impl(&dword_18B299000, v13, OS_LOG_TYPE_DEFAULT, v10, buf, v14);
    return 0;
  }
  v24[2] = 0;
  v24[0] = 5;
  v24[1] = 2147614720;
  if (getattrlist(__b.f_mntonname, v24, &v21, 0x24uLL, 0))
  {
    BOOL v4 = secLogObjForScope("SecError");
    BOOL v15 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v15) {
      return result;
    }
    int v16 = *__error();
    unint64_t v17 = __error();
    int v18 = strerror(*v17);
    *(_DWORD *)std::string buf = 136315650;
    uint64_t f_mntonname = (uint64_t)__b.f_mntonname;
    __int16 v27 = 1024;
    int v28 = v16;
    __int16 v29 = 2080;
    uint64_t v30 = v18;
    int v10 = "Unable to get volume capabilities from %s: %d [%s]";
    goto LABEL_10;
  }
  if (v21 == 36)
  {
    return (BYTE9(v21) & 0x40) == 0 || (BYTE9(v22) & 0x40) == 0;
  }
  else
  {
    uint64_t v19 = secLogObjForScope("SecError");
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (v20)
    {
      *(_DWORD *)std::string buf = 134218240;
      uint64_t f_mntonname = 36;
      __int16 v27 = 1024;
      int v28 = v21;
      int v10 = "getattrlist return length incorrect, expected %lu, got %u";
      uint64_t v13 = v19;
      uint32_t v14 = 18;
      goto LABEL_11;
    }
  }
  return result;
}

uint64_t Security::CodeSigning::pathIsValidXattrFile(char *a1, const char *a2)
{
  long long v3 = a1;
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  if (a1[23] < 0)
  {
    BOOL v5 = *(const char **)a1;
    int v4 = **(unsigned __int8 **)a1;
  }
  else
  {
    int v4 = *a1;
    BOOL v5 = a1;
  }
  if (v4 != 47)
  {
    uint64_t v11 = secLogObjForScope(a2);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      return 0;
    }
    if (v3[23] < 0) {
      long long v3 = *(char **)v3;
    }
    v64.st_dev = 136315138;
    *(void *)&v64.st_mode = v3;
    BOOL v12 = "%s isn't a full path, but a relative path";
LABEL_28:
    _os_log_debug_impl(&dword_18B299000, v11, OS_LOG_TYPE_DEBUG, v12, (uint8_t *)&v64, 0xCu);
    return 0;
  }
  v6.tv_seCC_SHA1_CTX c = 0xAAAAAAAAAAAAAAAALL;
  v6.tv_nseCC_SHA1_CTX c = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v64.st_blkstd::string::size_type size = v6;
  *(timespec *)v64.st_qspare = v6;
  v64.st_birthtimespeCC_SHA1_CTX c = v6;
  *(timespec *)&v64.st_std::string::size_type size = v6;
  v64.st_mtimespeCC_SHA1_CTX c = v6;
  v64.st_ctimespeCC_SHA1_CTX c = v6;
  *(timespec *)&v64.st_uid = v6;
  v64.st_atimespeCC_SHA1_CTX c = v6;
  *(timespec *)&v64.st_dev = v6;
  if (stat(v5, &v64))
  {
    int v7 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = *__error();
      uint64_t v9 = __error();
      int v10 = strerror(*v9);
      *(_DWORD *)std::string buf = 136315650;
      *(void *)&uint8_t buf[4] = v5;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v8;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = v10;
      _os_log_impl(&dword_18B299000, v7, OS_LOG_TYPE_DEFAULT, "Unable to stat %s: %d [%s]", buf, 0x1Cu);
    }
    goto LABEL_13;
  }
  if (((__int16)v64.st_mode & 0x80000000) == 0)
  {
LABEL_13:
    uint64_t v11 = secLogObjForScope(a2);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      return 0;
    }
    if (v3[23] < 0) {
      long long v3 = *(char **)v3;
    }
    v64.st_dev = 136315138;
    *(void *)&v64.st_mode = v3;
    BOOL v12 = "%s isn't a regular file";
    goto LABEL_28;
  }
  BOOL v15 = v3;
  if (v3[23] < 0)
  {
    BOOL v15 = *(const char **)v3;
    if (!*(void *)v3)
    {
      std::string::size_type v33 = secLogObjForScope("SecError");
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_37;
      }
      LOWORD(v64.st_dev) = 0;
      int v26 = "path is NULL";
      __int16 v27 = v33;
      uint32_t v28 = 2;
      goto LABEL_36;
    }
  }
  size_t v16 = strlen(v15);
  unint64_t v17 = (char *)malloc_type_malloc(v16 + 1, 0x45AEB810uLL);
  if (!v17)
  {
    long long v22 = secLogObjForScope("SecError");
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_37;
    }
    int v23 = *__error();
    __int16 v24 = __error();
    unsigned int v25 = strerror(*v24);
    v64.st_dev = 67109378;
    *(_DWORD *)&v64.st_mode = v23;
    LOWORD(v64.st_ino) = 2080;
    *(__darwin_ino64_t *)((char *)&v64.st_ino + 2) = (__darwin_ino64_t)v25;
    int v26 = "Unable to allocate space for storing basename: %d [%s]";
    __int16 v27 = v22;
    uint32_t v28 = 18;
LABEL_36:
    _os_log_impl(&dword_18B299000, v27, OS_LOG_TYPE_DEFAULT, v26, (uint8_t *)&v64, v28);
    goto LABEL_37;
  }
  int v18 = (unsigned __int8 *)v17;
  if (!basename_r(v15, v17))
  {
    __int16 v29 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      int v30 = *__error();
      std::string::size_type v31 = __error();
      uint64_t v32 = strerror(*v31);
      v64.st_dev = 136315650;
      *(void *)&v64.st_mode = v15;
      WORD2(v64.st_ino) = 1024;
      *(_DWORD *)((char *)&v64.st_ino + 6) = v30;
      HIWORD(v64.st_uid) = 2080;
      *(void *)&v64.st_gid = v32;
      _os_log_impl(&dword_18B299000, v29, OS_LOG_TYPE_DEFAULT, "Could not get basename of %s: %d [%s]", (uint8_t *)&v64, 0x1Cu);
    }
    goto LABEL_33;
  }
  if (strlen((const char *)v18) < 3 || *v18 != 46)
  {
LABEL_33:
    free(v18);
    goto LABEL_37;
  }
  int v19 = v18[1];
  free(v18);
  if (v19 != 95)
  {
LABEL_37:
    uint64_t v11 = secLogObjForScope(a2);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      return 0;
    }
    if (v3[23] < 0) {
      long long v3 = *(char **)v3;
    }
    v64.st_dev = 136315138;
    *(void *)&v64.st_mode = v3;
    BOOL v12 = "%s doesn't match Xattr file path spec";
    goto LABEL_28;
  }
  if (v3[23] < 0)
  {
    long long v21 = *(char **)v3;
    std::string::size_type v20 = *((void *)v3 + 1);
  }
  else
  {
    std::string::size_type v20 = v3[23];
    long long v21 = v3;
  }
  while (v20)
  {
    int v34 = v21[--v20];
    if (v34 == 47)
    {
      std::string::size_type v35 = v20;
      goto LABEL_46;
    }
  }
  std::string::size_type v35 = -1;
LABEL_46:
  std::string::basic_string(&v61, (const std::string *)v3, 0, v35, (std::allocator<char> *)&v60);
  uint64_t v36 = std::string::append(&v61, "/", 1uLL);
  long long v37 = *(_OWORD *)&v36->__r_.__value_.__l.__data_;
  *(void *)&buf[16] = *((void *)&v36->__r_.__value_.__l + 2);
  *(_OWORD *)std::string buf = v37;
  v36->__r_.__value_.__l.__size_ = 0;
  v36->__r_.__value_.__r.__words[2] = 0;
  v36->__r_.__value_.__r.__words[0] = 0;
  std::string::basic_string(&v60, (const std::string *)v3, v35 + 3, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v62);
  if ((v60.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v38 = &v60;
  }
  else {
    uint64_t v38 = (std::string *)v60.__r_.__value_.__r.__words[0];
  }
  if ((v60.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(v60.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = v60.__r_.__value_.__l.__size_;
  }
  size_t v40 = std::string::append((std::string *)buf, (const std::string::value_type *)v38, size);
  long long v41 = *(_OWORD *)&v40->__r_.__value_.__l.__data_;
  *(void *)&v64.st_uid = *((void *)&v40->__r_.__value_.__l + 2);
  *(_OWORD *)&v64.st_dev = v41;
  v40->__r_.__value_.__l.__size_ = 0;
  v40->__r_.__value_.__r.__words[2] = 0;
  v40->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v60.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v60.__r_.__value_.__l.__data_);
  }
  if ((buf[23] & 0x80000000) != 0) {
    operator delete(*(void **)buf);
  }
  if (SHIBYTE(v61.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v61.__r_.__value_.__l.__data_);
  }
  if ((v64.st_gid & 0x80000000) == 0) {
    int v42 = &v64;
  }
  else {
    int v42 = *(stat **)&v64.st_dev;
  }
  if (!v42)
  {
    uint64_t v48 = secLogObjForScope("SecError");
    if (!os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
LABEL_69:
      size_t v49 = secLogObjForScope(a2);
      if (!os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
      {
LABEL_70:
        uint64_t v13 = 0;
        goto LABEL_71;
      }
      uint32_t v59 = &v64;
      if ((v64.st_gid & 0x80000000) != 0) {
        uint32_t v59 = *(stat **)&v64.st_dev;
      }
      if (v3[23] < 0) {
        long long v3 = *(char **)v3;
      }
      *(_DWORD *)std::string buf = 136315394;
      *(void *)&uint8_t buf[4] = v59;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v3;
      std::string::size_type v58 = "%s does not exist, forcing resource validation on %s";
LABEL_96:
      _os_log_debug_impl(&dword_18B299000, v49, OS_LOG_TYPE_DEBUG, v58, buf, 0x16u);
      goto LABEL_70;
    }
    *(_WORD *)std::string buf = 0;
    uint64_t v45 = "path is NULL";
    uint64_t v46 = v48;
    uint32_t v47 = 2;
LABEL_68:
    _os_log_impl(&dword_18B299000, v46, OS_LOG_TYPE_DEFAULT, v45, buf, v47);
    goto LABEL_69;
  }
  if (access((const char *)v42, 0))
  {
    if (*__error() == 2) {
      goto LABEL_69;
    }
    uint64_t v43 = secLogObjForScope("SecError");
    if (!os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_69;
    }
    int v44 = *__error();
    *(_DWORD *)std::string buf = 67109378;
    *(_DWORD *)&uint8_t buf[4] = v44;
    *(_WORD *)&uint8_t buf[8] = 2080;
    *(void *)&buf[10] = v42;
    uint64_t v45 = "Unable to check if path exists: %d, %s";
    uint64_t v46 = v43;
    uint32_t v47 = 18;
    goto LABEL_68;
  }
  if ((v64.st_gid & 0x80000000) == 0) {
    std::string::size_type v50 = &v64;
  }
  else {
    std::string::size_type v50 = *(stat **)&v64.st_dev;
  }
  if (!v50)
  {
    int v52 = secLogObjForScope("SecError");
    if (!os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_85;
    }
    *(_WORD *)std::string buf = 0;
    std::string::size_type v53 = "path is NULL";
    std::string::size_type v54 = v52;
    uint32_t v55 = 2;
LABEL_84:
    _os_log_impl(&dword_18B299000, v54, OS_LOG_TYPE_DEFAULT, v53, buf, v55);
    goto LABEL_85;
  }
  ssize_t v51 = listxattr((const char *)v50, 0, 0, 0);
  if (v51 == -1)
  {
    std::string::size_type v56 = secLogObjForScope("SecError");
    if (!os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_85;
    }
    *(_DWORD *)std::string buf = 136315138;
    *(void *)&uint8_t buf[4] = v50;
    std::string::size_type v53 = "Unable to acquire the xattr list from %s";
    std::string::size_type v54 = v56;
    uint32_t v55 = 12;
    goto LABEL_84;
  }
  if (v51 <= 0)
  {
LABEL_85:
    size_t v49 = secLogObjForScope(a2);
    if (!os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_70;
    }
    std::string::size_type v57 = &v64;
    if ((v64.st_gid & 0x80000000) != 0) {
      std::string::size_type v57 = *(stat **)&v64.st_dev;
    }
    if (v3[23] < 0) {
      long long v3 = *(char **)v3;
    }
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = v57;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v3;
    std::string::size_type v58 = "%s does not contain xattrs, forcing resource validation on %s";
    goto LABEL_96;
  }
  uint64_t v13 = 1;
LABEL_71:
  if (SHIBYTE(v64.st_gid) < 0) {
    operator delete(*(void **)&v64.st_dev);
  }
  return v13;
}

void sub_18B4093D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,uint64_t a29,void *__p,uint64_t a31,int a32,__int16 a33,char a34,char a35)
{
  if (a35 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

std::string *Security::CodeSigning::pathRemaining(std::string *a1, uint64_t a2, uint64_t *a3)
{
  long long v3 = a3;
  int v6 = *(char *)(a2 + 23);
  if (v6 < 0) {
    unint64_t v7 = *(void *)(a2 + 8);
  }
  else {
    unint64_t v7 = *(unsigned __int8 *)(a2 + 23);
  }
  unint64_t v8 = *((unsigned __int8 *)a3 + 23);
  if (*((char *)a3 + 23) < 0)
  {
    unint64_t v9 = a3[1];
    if (v7 < v9) {
      return (std::string *)std::string::basic_string[abi:ne180100]<0>(a1, (char *)&unk_18B41CA07);
    }
  }
  else
  {
    unint64_t v9 = *((unsigned __int8 *)a3 + 23);
    if (v7 < v8) {
      return (std::string *)std::string::basic_string[abi:ne180100]<0>(a1, (char *)&unk_18B41CA07);
    }
  }
  if (!v9) {
    return (std::string *)std::string::basic_string[abi:ne180100]<0>(a1, (char *)&unk_18B41CA07);
  }
  if (v6 < 0)
  {
    if (!*(void *)(a2 + 8)) {
      return (std::string *)std::string::basic_string[abi:ne180100]<0>(a1, (char *)&unk_18B41CA07);
    }
  }
  else if (!*(unsigned char *)(a2 + 23))
  {
    return (std::string *)std::string::basic_string[abi:ne180100]<0>(a1, (char *)&unk_18B41CA07);
  }
  if ((v8 & 0x80) != 0)
  {
    std::string::__init_copy_ctor_external(&v17, (const std::string::value_type *)*a3, a3[1]);
    if ((*(unsigned char *)(a2 + 23) & 0x80) == 0) {
      goto LABEL_15;
    }
LABEL_17:
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
    goto LABEL_18;
  }
  std::string v17 = *(std::string *)a3;
  if ((v6 & 0x80) != 0) {
    goto LABEL_17;
  }
LABEL_15:
  std::string __p = *(std::string *)a2;
LABEL_18:
  char isPathPrefix = Security::CodeSigning::isPathPrefix((char *)&v17, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v17.__r_.__value_.__l.__data_);
    if ((isPathPrefix & 1) == 0) {
      return (std::string *)std::string::basic_string[abi:ne180100]<0>(a1, (char *)&unk_18B41CA07);
    }
  }
  else if ((isPathPrefix & 1) == 0)
  {
    return (std::string *)std::string::basic_string[abi:ne180100]<0>(a1, (char *)&unk_18B41CA07);
  }
  if (*((char *)v3 + 23) < 0)
  {
    BOOL v12 = v3;
    long long v3 = (uint64_t *)*v3;
    std::string::size_type v11 = v12[1];
  }
  else
  {
    std::string::size_type v11 = *((unsigned __int8 *)v3 + 23);
  }
  if (*((unsigned char *)v3 + v11 - 1) == 47) {
    std::string::size_type v13 = v11;
  }
  else {
    std::string::size_type v13 = v11 + 1;
  }
  if (*(char *)(a2 + 23) < 0) {
    std::string::size_type v14 = *(void *)(a2 + 8);
  }
  else {
    std::string::size_type v14 = *(unsigned __int8 *)(a2 + 23);
  }
  if (v13 < v14) {
    return std::string::basic_string(a1, (const std::string *)a2, v13, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v18);
  }
  return (std::string *)std::string::basic_string[abi:ne180100]<0>(a1, (char *)&unk_18B41CA07);
}

void sub_18B4095B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t Security::CodeSigning::isPathPrefix(char *a1, void *__s)
{
  uint64_t v2 = __s;
  unint64_t v4 = *((unsigned __int8 *)__s + 23);
  if (*((char *)__s + 23) < 0)
  {
    BOOL v5 = (void *)*__s;
    int64_t v6 = __s[1];
  }
  else
  {
    BOOL v5 = __s;
    int64_t v6 = *((unsigned __int8 *)__s + 23);
  }
  unint64_t v7 = a1[23];
  uint64_t v9 = *(void *)a1;
  unint64_t v8 = *((void *)a1 + 1);
  if ((v7 & 0x80u) == 0) {
    int v10 = a1;
  }
  else {
    int v10 = *(char **)a1;
  }
  if ((v7 & 0x80u) == 0) {
    int64_t v11 = a1[23];
  }
  else {
    int64_t v11 = *((void *)a1 + 1);
  }
  if (!v11) {
    goto LABEL_20;
  }
  if (v6 < v11) {
    return 0;
  }
  std::string::size_type v20 = v5;
  unint64_t v21 = *((unsigned __int8 *)__s + 23);
  BOOL v12 = (char *)v5 + v6;
  int v13 = *v10;
  std::string::size_type v14 = v5;
  while (1)
  {
    int64_t v15 = v6 - v11;
    if (v15 == -1) {
      return 0;
    }
    uint64_t result = (uint64_t)memchr(v14, v13, v15 + 1);
    if (!result) {
      return result;
    }
    uint64_t v17 = result;
    uint64_t result = memcmp((const void *)result, v10, v11);
    if (!result) {
      break;
    }
    std::string::size_type v14 = (void *)(v17 + 1);
    int64_t v6 = (int64_t)&v12[-v17 - 1];
    if (v6 < v11) {
      return 0;
    }
  }
  if ((char *)v17 != v12)
  {
    unint64_t v4 = v21;
    if ((void *)v17 == v20)
    {
LABEL_20:
      if ((v4 & 0x80) != 0) {
        unint64_t v18 = v2[1];
      }
      else {
        unint64_t v18 = v4;
      }
      if (v11 == v18) {
        return 0;
      }
      if ((v7 & 0x80) != 0)
      {
        int v19 = *(unsigned __int8 *)(v9 + v8 - 1);
        unint64_t v7 = v8;
      }
      else
      {
        int v19 = a1[v7 - 1];
      }
      if (v19 == 47) {
        return 1;
      }
      if ((v4 & 0x80) != 0)
      {
        if (v2[1] <= v7) {
          goto LABEL_37;
        }
        uint64_t v2 = (void *)*v2;
      }
      else if (v7 >= v4)
      {
LABEL_37:
        std::string::__throw_out_of_range[abi:ne180100]();
      }
      return *((unsigned __int8 *)v2 + v7) == 47;
    }
  }
  return result;
}

void Security::CodeSigning::SingleDiskRep::strictValidate(char *a1, uint64_t a2, uint64_t a3, int a4)
{
  Security::CodeSigning::DiskRep::strictValidate((uint64_t)a1, a2, a3, a4);
  if ((a4 & 0x1000000) != 0)
  {
    unint64_t v8 = (unsigned int *)(*(uint64_t (**)(char *))(*(void *)a1 + 144))(a1);
    if (Security::UnixPlusPlus::FileDesc::hasExtendedAttribute((Security::UnixPlusPlus::FileDesc *)*v8, "com.apple.ResourceFork"))
    {
      uint64_t v9 = (unsigned int *)(*(uint64_t (**)(char *))(*(void *)a1 + 144))(a1);
      Security::UnixPlusPlus::FileDesc::removeAttr((Security::UnixPlusPlus::FileDesc *)*v9, "com.apple.ResourceFork");
    }
    int v10 = (unsigned int *)(*(uint64_t (**)(char *))(*(void *)a1 + 144))(a1);
    if (Security::UnixPlusPlus::FileDesc::hasExtendedAttribute((Security::UnixPlusPlus::FileDesc *)*v10, "com.apple.FinderInfo"))
    {
      int64_t v11 = (unsigned int *)(*(uint64_t (**)(char *))(*(void *)a1 + 144))(a1);
      Security::UnixPlusPlus::FileDesc::removeAttr((Security::UnixPlusPlus::FileDesc *)*v11, "com.apple.FinderInfo");
    }
  }
  if ((a4 & 0x200) != 0)
  {
    uint64_t v14 = *(void *)(a3 + 8);
    uint64_t v13 = a3 + 8;
    uint64_t v12 = v14;
    if (!v14) {
      goto LABEL_17;
    }
    uint64_t v15 = v13;
    do
    {
      int v16 = *(_DWORD *)(v12 + 28);
      BOOL v17 = v16 < -66999;
      if (v16 >= -66999) {
        unint64_t v18 = (uint64_t *)v12;
      }
      else {
        unint64_t v18 = (uint64_t *)(v12 + 8);
      }
      if (!v17) {
        uint64_t v15 = v12;
      }
      uint64_t v12 = *v18;
    }
    while (*v18);
    if (v15 == v13 || *(int *)(v15 + 28) > -66999)
    {
LABEL_17:
      int v19 = (unsigned int *)(*(uint64_t (**)(char *))(*(void *)a1 + 144))(a1);
      std::string::size_type v20 = "com.apple.ResourceFork";
      if (Security::UnixPlusPlus::FileDesc::hasExtendedAttribute((Security::UnixPlusPlus::FileDesc *)*v19, "com.apple.ResourceFork")|| (unint64_t v21 = (unsigned int *)(*(uint64_t (**)(char *))(*(void *)a1 + 144))(a1), v20 = "com.apple.FinderInfo", Security::UnixPlusPlus::FileDesc::hasExtendedAttribute((Security::UnixPlusPlus::FileDesc *)*v21, "com.apple.FinderInfo")))
      {
        __int16 v24 = a1 + 16;
        if (a1[39] < 0) {
          __int16 v24 = (void *)*v24;
        }
        CFStringRef v25 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"Disallowed xattr %s found on %s", v20, v24);
        Security::CodeSigning::CSError::throwMe((Security::CodeSigning::CSError *)0xFFFEFA49, @"SecCSResourceHasSidebandData", v25, v26);
      }
    }
  }
  if (a2)
  {
    if (bswap32(*(_DWORD *)(a2 + 8)) >> 8 >= 0x203 && (unint64_t v22 = *(void *)(a2 + 56)) != 0) {
      unint64_t v23 = bswap64(v22);
    }
    else {
      unint64_t v23 = bswap32(*(_DWORD *)(a2 + 32));
    }
    if (v23 != (*(uint64_t (**)(char *))(*(void *)a1 + 96))(a1)) {
      Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA1BLL);
    }
  }
}

void Security::CodeSigning::SingleDiskRep::recommendedIdentifier(uint64_t a1@<X0>, std::string *a2@<X8>)
{
}

void Security::CodeSigning::SingleDiskRep::flush(Security::CodeSigning::SingleDiskRep *this)
{
}

uint64_t Security::CodeSigning::SingleDiskRep::execSegLimit()
{
  return 0;
}

off_t Security::CodeSigning::SingleDiskRep::signingLimit(Security::CodeSigning::SingleDiskRep *this)
{
  uint64_t v1 = (unsigned int *)(*(uint64_t (**)(Security::CodeSigning::SingleDiskRep *))(*(void *)this + 144))(this);
  v2.tv_seCC_SHA1_CTX c = 0xAAAAAAAAAAAAAAAALL;
  v2.tv_nseCC_SHA1_CTX c = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v4.st_blkstd::string::size_type size = v2;
  *(timespec *)v4.st_qspare = v2;
  v4.st_birthtimespeCC_SHA1_CTX c = v2;
  *(timespec *)&v4.st_std::string::size_type size = v2;
  v4.st_mtimespeCC_SHA1_CTX c = v2;
  v4.st_ctimespeCC_SHA1_CTX c = v2;
  *(timespec *)&v4.st_uid = v2;
  v4.st_atimespeCC_SHA1_CTX c = v2;
  *(timespec *)&v4.st_dev = v2;
  Security::UnixPlusPlus::FileDesc::fstat((Security::UnixPlusPlus::FileDesc *)*v1, &v4);
  return v4.st_size;
}

CFURLRef Security::CodeSigning::SingleDiskRep::copyCanonicalPath(Security::CodeSigning::SingleDiskRep *this, uint64_t a2, uint64_t a3, const __CFURL *a4)
{
  int64_t v6 = (char *)*((void *)this + 2);
  stat v4 = (char *)this + 16;
  BOOL v5 = v6;
  if (v4[23] < 0) {
    stat v4 = v5;
  }
  return Security::makeCFURL((Security *)v4, 0, 0, a4);
}

CFDataRef Security::CodeSigning::SingleDiskRep::identification(Security::CodeSigning::SingleDiskRep *this)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v7.data[9] = v2;
  *(_OWORD *)&v7.data[13] = v2;
  *(_OWORD *)&v7.data[1] = v2;
  *(_OWORD *)&v7.data[5] = v2;
  *(_OWORD *)&v7.h0 = v2;
  *(_OWORD *)&v7.h4 = v2;
  CC_SHA1_Init(&v7);
  long long v3 = (unsigned int *)(*(uint64_t (**)(Security::CodeSigning::SingleDiskRep *))(*(void *)this + 144))(this);
  Security::UnixPlusPlus::FileDesc::seek((Security::UnixPlusPlus::FileDesc *)*v3, 0);
  uint64_t v4 = (*(uint64_t (**)(Security::CodeSigning::SingleDiskRep *))(*(void *)this + 144))(this);
  char v5 = *(unsigned char *)(v4 + 4);
  int v8 = *(_DWORD *)v4;
  char v9 = v5;
  *(void *)md = MEMORY[0x1E4F143A8];
  *(void *)&md[8] = 0x40000000;
  *(void *)&md[16] = ___ZN8Security11CodeSigning12hashFileDataINS_4SHA1EEEmNS_12UnixPlusPlus8FileDescEPT_m_block_invoke;
  int64_t v11 = &__block_descriptor_tmp_18107;
  uint64_t v12 = &v7;
  Security::CodeSigning::scanFileData(&v8, 0, (uint64_t)md);
  memset(md, 170, 20);
  CC_SHA1_Final(md, &v7);
  return CFDataCreate(0, md, 20);
}

uint64_t ___ZN8Security11CodeSigning12hashFileDataINS_4SHA1EEEmNS_12UnixPlusPlus8FileDescEPT_m_block_invoke(uint64_t a1, const void *a2, CC_LONG a3)
{
  return CC_SHA1_Update(*(CC_SHA1_CTX **)(a1 + 32), a2, a3);
}

Security::UnixPlusPlus::FileDesc *Security::CodeSigning::SingleDiskRep::Writer::fd(Security::CodeSigning::SingleDiskRep::Writer *this)
{
  uint64_t v1 = (Security::CodeSigning::SingleDiskRep::Writer *)((char *)this + 96);
  if (*((_DWORD *)this + 24) == -1)
  {
    uint64_t v2 = *((void *)this + 3);
    if (*(char *)(v2 + 39) < 0) {
      std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(v2 + 16), *(void *)(v2 + 24));
    }
    else {
      std::string __p = *(std::string *)(v2 + 16);
    }
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    Security::UnixPlusPlus::FileDesc::open(v1, (const char *)p_p, 2, 438);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  return v1;
}

void sub_18B409CA8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t Security::CodeSigning::Requirement::Reader::getData(Security::CodeSigning::Requirement::Reader *this, const void **a2, unint64_t *a3)
{
  uint64_t result = Security::CodeSigning::Requirement::Reader::get<unsigned int>((unsigned int *)this);
  *a3 = result;
  uint64_t v7 = *((unsigned int *)this + 2);
  if (v7 + (unint64_t)result > bswap32(*(_DWORD *)(*(void *)this + 4))) {
    Security::MacOSError::throwMe((Security::MacOSError *)0xFFFEFA14);
  }
  *a2 = (const void *)(*(void *)this + v7);
  *((_DWORD *)this + 2) = ((result - 1) & 0xFFFFFFFC) + v7 + 4;
  return result;
}

void *Security::CodeSigning::Requirement::Reader::getString(Security::CodeSigning::Requirement::Reader *this, Security::CodeSigning::Requirement::Reader *a2)
{
  size_t v6 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v7 = (void *)0xAAAAAAAAAAAAAAAALL;
  Security::CodeSigning::Requirement::Reader::getData(a2, (const void **)&v7, &v6);
  size_t v4 = v6;
  long long v3 = v7;

  return std::string::basic_string[abi:ne180100](this, v3, v4);
}

void Security::CodeSigning::CSError::~CSError(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)&unk_1ED84A5E8;
  Security::CFRef<__CFDictionary const*>::~CFRef((const void **)&this[19].__vftable);
  std::exception::~exception(this);

  JUMPOUT(0x18C12D390);
}

{
  uint64_t vars8;

  this->__vftable = (std::exception_vtbl *)&unk_1ED84A5E8;
  Security::CFRef<__CFDictionary const*>::~CFRef((const void **)&this[19].__vftable);

  std::exception::~exception(this);
}

void Security::CodeSigning::CSError::throwMe(Security::CodeSigning::CSError *this, uint64_t a2, const __CFString *a3, const void *a4)
{
  int v5 = (int)this;
  exception = (Security::CodeSigning::CSError *)__cxa_allocate_exception(0xA0uLL);
  CFDictionaryRef v14 = Security::cfmake<__CFDictionary const*>((uint64_t)"{%O=%O}", v7, v8, v9, v10, v11, v12, v13, a2);
  Security::CodeSigning::CSError::CSError(exception, v5, v14);
}

void sub_18B409ECC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void Security::CodeSigning::CSError::augment(Security::CodeSigning::CSError *this, const __CFString *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFDataRef v9 = Security::cfmake<__CFDictionary const*>((uint64_t)"{+%O,%O=%O}", (uint64_t)a2, a3, a4, a5, a6, a7, a8, *((void *)this + 19));
  uint64_t v10 = (const void *)*((void *)this + 19);
  if (v10) {
    CFRelease(v10);
  }
  *((void *)this + 19) = v9;
}

uint64_t Security::CodeSigning::CSError::cfError(CFDictionaryRef *this, __CFError **a2)
{
  if (a2)
  {
    CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F1D158];
    int v5 = (*((uint64_t (**)(CFDictionaryRef *))*this + 3))(this);
    *a2 = CFErrorCreate(0, v4, v5, this[19]);
  }
  size_t v6 = (uint64_t (*)(CFDictionaryRef *))*((void *)*this + 3);

  return v6(this);
}

CCCryptorStatus CCCrypt(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x1F40C94A8](*(void *)&op, *(void *)&alg, *(void *)&options, key, keyLength, iv, dataIn, dataInLength);
}

CCCryptorStatus CCCryptorCreate(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, CCCryptorRef *cryptorRef)
{
  return MEMORY[0x1F40C94B8](*(void *)&op, *(void *)&alg, *(void *)&options, key, keyLength, iv, cryptorRef);
}

CCCryptorStatus CCCryptorFinal(CCCryptorRef cryptorRef, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x1F40C94C8](cryptorRef, dataOut, dataOutAvailable, dataOutMoved);
}

size_t CCCryptorGetOutputLength(CCCryptorRef cryptorRef, size_t inputLength, BOOL final)
{
  return MEMORY[0x1F40C9520](cryptorRef, inputLength, final);
}

CCCryptorStatus CCCryptorRelease(CCCryptorRef cryptorRef)
{
  return MEMORY[0x1F40C9528](cryptorRef);
}

CCCryptorStatus CCCryptorUpdate(CCCryptorRef cryptorRef, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x1F40C9538](cryptorRef, dataIn, dataInLength, dataOut, dataOutAvailable, dataOutMoved);
}

uint64_t CCDigest()
{
  return MEMORY[0x1F40C9548]();
}

uint64_t CCDigestCreate()
{
  return MEMORY[0x1F40C9550]();
}

uint64_t CCDigestDestroy()
{
  return MEMORY[0x1F40C9558]();
}

uint64_t CCDigestFinal()
{
  return MEMORY[0x1F40C9560]();
}

uint64_t CCDigestOutputSize()
{
  return MEMORY[0x1F40C9570]();
}

void CCHmac(CCHmacAlgorithm algorithm, const void *key, size_t keyLength, const void *data, size_t dataLength, void *macOut)
{
}

void CCHmacFinal(CCHmacContext *ctx, void *macOut)
{
}

void CCHmacInit(CCHmacContext *ctx, CCHmacAlgorithm algorithm, const void *key, size_t keyLength)
{
}

void CCHmacUpdate(CCHmacContext *ctx, const void *data, size_t dataLength)
{
}

int CCKeyDerivationPBKDF(CCPBKDFAlgorithm algorithm, const char *password, size_t passwordLen, const uint8_t *salt, size_t saltLen, CCPseudoRandomAlgorithm prf, unsigned int rounds, uint8_t *derivedKey, size_t derivedKeyLen)
{
  return MEMORY[0x1F40C9648](*(void *)&algorithm, password, passwordLen, salt, saltLen, *(void *)&prf, *(void *)&rounds, derivedKey);
}

uint64_t CCRandomCopyBytes()
{
  return MEMORY[0x1F40C96C0]();
}

CCRNGStatus CCRandomGenerateBytes(void *bytes, size_t count)
{
  return MEMORY[0x1F40C96C8](bytes, count);
}

int CC_MD4_Final(unsigned __int8 *md, CC_MD4_CTX *c)
{
  return MEMORY[0x1F40C96F8](md, c);
}

int CC_MD4_Init(CC_MD4_CTX *c)
{
  return MEMORY[0x1F40C9700](c);
}

int CC_MD4_Update(CC_MD4_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9708](c, data, *(void *)&len);
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9710](data, *(void *)&len, md);
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

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x1F40C9738](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x1F40C9740](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9748](c, data, *(void *)&len);
}

unsigned __int8 *__cdecl CC_SHA224(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9750](data, *(void *)&len, md);
}

int CC_SHA224_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9758](md, c);
}

int CC_SHA224_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9760](c);
}

int CC_SHA224_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9768](c, data, *(void *)&len);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9770](data, *(void *)&len, md);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9778](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9780](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9788](c, data, *(void *)&len);
}

unsigned __int8 *__cdecl CC_SHA384(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9790](data, *(void *)&len, md);
}

int CC_SHA384_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x1F40C9798](md, c);
}

int CC_SHA384_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x1F40C97A0](c);
}

int CC_SHA384_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C97A8](c, data, *(void *)&len);
}

unsigned __int8 *__cdecl CC_SHA512(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C97B0](data, *(void *)&len, md);
}

int CC_SHA512_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x1F40C97B8](md, c);
}

int CC_SHA512_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x1F40C97C0](c);
}

int CC_SHA512_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C97C8](c, data, *(void *)&len);
}

uint64_t CEAcquireManagedContext()
{
  return MEMORY[0x1F417A3A0]();
}

uint64_t CEBuffer_cmp()
{
  return MEMORY[0x1F417A3A8]();
}

uint64_t CEConjureContextFromDER()
{
  return MEMORY[0x1F417A3B0]();
}

uint64_t CEDeserialize()
{
  return MEMORY[0x1F417A3B8]();
}

uint64_t CEManagedContextFromCFData()
{
  return MEMORY[0x1F417A3C0]();
}

uint64_t CEQueryContextToCFDictionary()
{
  return MEMORY[0x1F417A3C8]();
}

uint64_t CEReleaseManagedContext()
{
  return MEMORY[0x1F417A3D0]();
}

uint64_t CESerializeCFDictionary()
{
  return MEMORY[0x1F417A3D8]();
}

uint64_t CESerializeWithOptions()
{
  return MEMORY[0x1F417A3E0]();
}

uint64_t CESerializeXML()
{
  return MEMORY[0x1F417A3E8]();
}

uint64_t CESizeDeserialization()
{
  return MEMORY[0x1F417A3F0]();
}

uint64_t CESizeSerialization()
{
  return MEMORY[0x1F417A3F8]();
}

uint64_t CESizeXMLSerialization()
{
  return MEMORY[0x1F417A400]();
}

uint64_t CEValidate()
{
  return MEMORY[0x1F417A408]();
}

uint64_t CEValidateWithOptions()
{
  return MEMORY[0x1F417A410]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

CFAllocatorRef CFAllocatorCreate(CFAllocatorRef allocator, CFAllocatorContext *context)
{
  return (CFAllocatorRef)MEMORY[0x1F40D70F8](allocator, context);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

void CFAllocatorGetContext(CFAllocatorRef allocator, CFAllocatorContext *context)
{
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x1F40D7110]();
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1F40D7160](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1F40D7170](allocator, values, numValues, callBacks);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x1F40D7178](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7198](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1F40D71C8](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1F40D71D8]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

void CFArraySortValues(CFMutableArrayRef theArray, CFRange range, CFComparatorFunction comparator, void *context)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFURLRef CFBundleCopyBuiltInPlugInsURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1F40D7440](bundle);
}

CFURLRef CFBundleCopyBundleURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1F40D7450](bundle);
}

CFURLRef CFBundleCopyExecutableURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1F40D7470](bundle);
}

CFDictionaryRef CFBundleCopyInfoDictionaryForURL(CFURLRef url)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7478](url);
}

CFStringRef CFBundleCopyLocalizedString(CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName)
{
  return (CFStringRef)MEMORY[0x1F40D74A8](bundle, key, value, tableName);
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x1F40D74D0](bundle, resourceName, resourceType, subDirName);
}

CFURLRef CFBundleCopyResourcesDirectoryURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1F40D7500](bundle);
}

CFURLRef CFBundleCopySupportFilesDirectoryURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1F40D7518](bundle);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x1F40D7528](allocator, bundleURL);
}

void *__cdecl CFBundleGetFunctionPointerForName(CFBundleRef bundle, CFStringRef functionName)
{
  return (void *)MEMORY[0x1F40D7558](bundle, functionName);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1F40D7568](bundle);
}

CFDictionaryRef CFBundleGetInfoDictionary(CFBundleRef bundle)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7578](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x1F40D7598]();
}

CFTypeID CFBundleGetTypeID(void)
{
  return MEMORY[0x1F40D75C0]();
}

Boolean CFBundleIsExecutableLoaded(CFBundleRef bundle)
{
  return MEMORY[0x1F40D75E0](bundle);
}

Boolean CFBundleLoadExecutable(CFBundleRef bundle)
{
  return MEMORY[0x1F40D75E8](bundle);
}

void CFBundleUnloadExecutable(CFBundleRef bundle)
{
}

Boolean CFCalendarComposeAbsoluteTime(CFCalendarRef calendar, CFAbsoluteTime *at, const char *componentDesc, ...)
{
  return MEMORY[0x1F40D7678](calendar, at, componentDesc);
}

CFCalendarRef CFCalendarCreateWithIdentifier(CFAllocatorRef allocator, CFCalendarIdentifier identifier)
{
  return (CFCalendarRef)MEMORY[0x1F40D7690](allocator, identifier);
}

Boolean CFCalendarDecomposeAbsoluteTime(CFCalendarRef calendar, CFAbsoluteTime at, const char *componentDesc, ...)
{
  va_start(va, componentDesc);
  uint64_t v3 = va_arg(va, void);
  return MEMORY[0x1F40D7698](calendar, v3, at);
}

void CFCalendarSetTimeZone(CFCalendarRef calendar, CFTimeZoneRef tz)
{
}

CFCharacterSetRef CFCharacterSetCreateInvertedSet(CFAllocatorRef alloc, CFCharacterSetRef theSet)
{
  return (CFCharacterSetRef)MEMORY[0x1F40D7710](alloc, theSet);
}

CFCharacterSetRef CFCharacterSetCreateWithCharactersInString(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFCharacterSetRef)MEMORY[0x1F40D7738](alloc, theString);
}

CFCharacterSetRef CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet theSetIdentifier)
{
  return (CFCharacterSetRef)MEMORY[0x1F40D7740](theSetIdentifier);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x1F40D77A8](cf);
}

CFURLRef CFCopyHomeDirectoryURL(void)
{
  return (CFURLRef)MEMORY[0x1F40D77B0]();
}

CFStringRef CFCopyTypeIDDescription(CFTypeID type_id)
{
  return (CFStringRef)MEMORY[0x1F40D77D0](type_id);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1F40D77E8](allocator, bytes, length);
}

CFDataRef CFDataCreateCopy(CFAllocatorRef allocator, CFDataRef theData)
{
  return (CFDataRef)MEMORY[0x1F40D77F8](allocator, theData);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1F40D7808](allocator, capacity);
}

CFMutableDataRef CFDataCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDataRef theData)
{
  return (CFMutableDataRef)MEMORY[0x1F40D7810](allocator, capacity, theData);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1F40D7818](allocator, bytes, length, bytesDeallocator);
}

void CFDataDeleteBytes(CFMutableDataRef theData, CFRange range)
{
}

CFRange CFDataFind(CFDataRef theData, CFDataRef dataToFind, CFRange searchRange, CFDataSearchFlags compareOptions)
{
  CFIndex v4 = MEMORY[0x1F40D7828](theData, dataToFind, searchRange.location, searchRange.length, compareOptions);
  result.length = v5;
  result.location = v4;
  return result;
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

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x1F40D7858](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1F40D7860]();
}

void CFDataIncreaseLength(CFMutableDataRef theData, CFIndex extraLength)
{
}

void CFDataReplaceBytes(CFMutableDataRef theData, CFRange range, const UInt8 *newBytes, CFIndex newLength)
{
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
}

CFComparisonResult CFDateCompare(CFDateRef theDate, CFDateRef otherDate, void *context)
{
  return MEMORY[0x1F40D7888](theDate, otherDate, context);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x1F40D7898](allocator, at);
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x1F40D78B0](allocator, locale, dateStyle, timeStyle);
}

CFDateFormatterRef CFDateFormatterCreateISO8601Formatter(CFAllocatorRef allocator, CFISO8601DateFormatOptions formatOptions)
{
  return (CFDateFormatterRef)MEMORY[0x1F40D78D0](allocator, formatOptions);
}

CFStringRef CFDateFormatterCreateStringWithAbsoluteTime(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFAbsoluteTime at)
{
  return (CFStringRef)MEMORY[0x1F40D78D8](allocator, formatter, at);
}

void CFDateFormatterSetFormat(CFDateFormatterRef formatter, CFStringRef formatString)
{
}

void CFDateFormatterSetProperty(CFDateFormatterRef formatter, CFStringRef key, CFTypeRef value)
{
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  MEMORY[0x1F40D7928](theDate);
  return result;
}

CFTimeInterval CFDateGetTimeIntervalSinceDate(CFDateRef theDate, CFDateRef otherDate)
{
  MEMORY[0x1F40D7930](theDate, otherDate);
  return result;
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x1F40D7938]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1F40D7968](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7978](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7990](allocator, theDict);
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

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1F40D7A00]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x1F40D7A18](theDict, key, value);
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

CFDictionaryRef CFErrorCopyUserInfo(CFErrorRef err)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7A90](err);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x1F40D7A98](allocator, domain, code, userInfo);
}

CFErrorRef CFErrorCreateWithUserInfoKeysAndValues(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, const void *const *userInfoKeys, const void *const *userInfoValues, CFIndex numUserInfoValues)
{
  return (CFErrorRef)MEMORY[0x1F40D7AA0](allocator, domain, code, userInfoKeys, userInfoValues, numUserInfoValues);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x1F40D7AA8](err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x1F40D7AB8](err);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x1F40D7B60](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1F40D7BA0](cf);
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x1F40D7BB8]();
}

CFLocaleRef CFLocaleGetSystem(void)
{
  return (CFLocaleRef)MEMORY[0x1F40D7C38]();
}

CFTypeID CFNullGetTypeID(void)
{
  return MEMORY[0x1F40D7D68]();
}

CFComparisonResult CFNumberCompare(CFNumberRef number, CFNumberRef otherNumber, void *context)
{
  return MEMORY[0x1F40D7D78](number, otherNumber, context);
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

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE8](key, applicationID, keyExistsAndHasValidFormat);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1F40D7F18](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateFromXMLData(CFAllocatorRef allocator, CFDataRef xmlData, CFOptionFlags mutabilityOption, CFStringRef *errorString)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7F40](allocator, xmlData, mutabilityOption, errorString);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7F50](allocator, data, options, format, error);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7F58](allocator, stream, streamLength, options, format, error);
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x1F40D7FC0](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x1F40D7FF8](stream);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x1F40D81F8](theSet, value);
}

CFSetRef CFSetCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFSetCallBacks *callBacks)
{
  return (CFSetRef)MEMORY[0x1F40D8200](allocator, values, numValues, callBacks);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1F40D8210](allocator, capacity, callBacks);
}

CFMutableSetRef CFSetCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFSetRef theSet)
{
  return (CFMutableSetRef)MEMORY[0x1F40D8218](allocator, capacity, theSet);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x1F40D8220](theSet);
}

CFTypeID CFSetGetTypeID(void)
{
  return MEMORY[0x1F40D8230]();
}

const void *__cdecl CFSetGetValue(CFSetRef theSet, const void *value)
{
  return (const void *)MEMORY[0x1F40D8238](theSet, value);
}

void CFSetGetValues(CFSetRef theSet, const void **values)
{
}

void CFSetRemoveAllValues(CFMutableSetRef theSet)
{
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
}

void CFSetReplaceValue(CFMutableSetRef theSet, const void *value)
{
}

void CFSetSetValue(CFMutableSetRef theSet, const void *value)
{
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
}

void CFStringAppendCharacters(CFMutableStringRef theString, const UniChar *chars, CFIndex numChars)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFComparisonResult CFStringCompareWithOptions(CFStringRef theString1, CFStringRef theString2, CFRange rangeToCompare, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8390](theString1, theString2, rangeToCompare.location, rangeToCompare.length, compareOptions);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return (CFArrayRef)MEMORY[0x1F40D83D0](alloc, theString, separatorString);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1F40D83F0](alloc, theString);
}

CFDataRef CFStringCreateExternalRepresentation(CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return (CFDataRef)MEMORY[0x1F40D83F8](alloc, theString, *(void *)&encoding, lossByte);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8408](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8410](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1F40D8438](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithBytesNoCopy(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1F40D8440](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation, contentsDeallocator);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithCharacters(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars)
{
  return (CFStringRef)MEMORY[0x1F40D8460](alloc, chars, numChars);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1F40D8490](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x1F40D8498](alloc, formatOptions, format, arguments);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x1F40D84A8](alloc, str, range.location, range.length);
}

void CFStringDelete(CFMutableStringRef theString, CFRange range)
{
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3 = MEMORY[0x1F40D84C8](theString, stringToFind, compareOptions);
  result.length = v4;
  result.location = v3;
  return result;
}

CFIndex CFStringFindAndReplace(CFMutableStringRef theString, CFStringRef stringToFind, CFStringRef replacementString, CFRange rangeToSearch, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D84D0](theString, stringToFind, replacementString, rangeToSearch.location, rangeToSearch.length, compareOptions);
}

Boolean CFStringFindCharacterFromSet(CFStringRef theString, CFCharacterSetRef theSet, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x1F40D84D8](theString, theSet, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

Boolean CFStringFindWithOptions(CFStringRef theString, CFStringRef stringToFind, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x1F40D84E0](theString, stringToFind, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1F40D8500](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8510](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x1F40D8528](theString, idx);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1F40D8540](theString);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x1F40D8568](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8590](length, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x1F40D8600](theString, prefix);
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return MEMORY[0x1F40D8608](theString, suffix);
}

void CFStringUppercase(CFMutableStringRef theString, CFLocaleRef locale)
{
}

CFTimeZoneRef CFTimeZoneCreateWithTimeIntervalFromGMT(CFAllocatorRef allocator, CFTimeInterval ti)
{
  return (CFTimeZoneRef)MEMORY[0x1F40D8708](allocator, ti);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x1F40D8758](anURL, pathStyle);
}

Boolean CFURLCopyResourcePropertyForKey(CFURLRef url, CFStringRef key, void *propertyValueTypeRefPtr, CFErrorRef *error)
{
  return MEMORY[0x1F40D87B0](url, key, propertyValueTypeRefPtr, error);
}

CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1F40D87F8](allocator, url, pathComponent, isDirectory);
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1F40D8848](allocator, buffer, bufLen, isDirectory);
}

CFURLRef CFURLCreateWithBytes(CFAllocatorRef allocator, const UInt8 *URLBytes, CFIndex length, CFStringEncoding encoding, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1F40D8888](allocator, URLBytes, length, *(void *)&encoding, baseURL);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1F40D88A0](allocator, filePath, pathStyle, isDirectory);
}

CFURLRef CFURLCreateWithFileSystemPathRelativeToBase(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1F40D88A8](allocator, filePath, pathStyle, isDirectory, baseURL);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x1F40D8908](url, resolveAgainstBase, buffer, maxBufLen);
}

CFTypeID CFURLGetTypeID(void)
{
  return MEMORY[0x1F40D8928]();
}

CFUUIDRef CFUUIDCreateFromString(CFAllocatorRef alloc, CFStringRef uuidStr)
{
  return (CFUUIDRef)MEMORY[0x1F40D8998](alloc, uuidStr);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1 = MEMORY[0x1F40D89E8](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1F40D8A28](allocator, flags, error, dictionary, timeout);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x1F40D8A68](userNotification, responseFlags, timeout);
}

CFTypeRef IOCFUnserializeWithSize(const char *buffer, size_t bufferSize, CFAllocatorRef allocator, CFOptionFlags options, CFStringRef *errorString)
{
  return (CFTypeRef)MEMORY[0x1F40E8698](buffer, bufferSize, allocator, options, errorString);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x1F40E86C8](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1F40E8F60](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1F40E9168](*(void *)&entry, key, allocator, *(void *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x1F40E9188](*(void *)&mainPort, path);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1F40E9208](*(void *)&entry, plane, key, allocator, *(void *)&options);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x1F40E9240](*(void *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1F40E9250](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40E9268](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x1F40E9280](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

NSArray *__cdecl NSAllMapTableKeys(NSMapTable *table)
{
  return (NSArray *)MEMORY[0x1F40E6FD8](table);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

fat_arch *__cdecl NXFindBestFatArch(cpu_type_t cputype, cpu_subtype_t cpusubtype, fat_arch *fat_archs, uint32_t nfat_archs)
{
  return (fat_arch *)MEMORY[0x1F40C99C0](*(void *)&cputype, *(void *)&cpusubtype, fat_archs, *(void *)&nfat_archs);
}

const NXArchInfo *__cdecl NXGetArchInfoFromCpuType(cpu_type_t cputype, cpu_subtype_t cpusubtype)
{
  return (const NXArchInfo *)MEMORY[0x1F40C99C8](*(void *)&cputype, *(void *)&cpusubtype);
}

const NXArchInfo *__cdecl NXGetArchInfoFromName(const char *name)
{
  return (const NXArchInfo *)MEMORY[0x1F40C99D0](name);
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x1F4147190]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1F41471B0]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1F41471E0]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x1F41471F0]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1F4147220]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x1F4147230]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1F4147268]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1F4147278]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1F4147280]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1F41472A0]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1F41472A8]();
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

uint64_t _CFBundleCopyInfoPlistURL()
{
  return MEMORY[0x1F40D8BE8]();
}

uint64_t _CFBundleCreateUnique()
{
  return MEMORY[0x1F40D8C30]();
}

uint64_t _CFBundleCreateWithExecutableURLIfLooksLikeBundle()
{
  return MEMORY[0x1F40D8C38]();
}

uint64_t _CFBundleCreateWithExecutableURLIfMightBeBundle()
{
  return MEMORY[0x1F40D8C40]();
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x1F40D8D10]();
}

uint64_t _CFGetProgname()
{
  return MEMORY[0x1F40D8E00]();
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1F40D90D0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1F40D90E8]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x1F40D9438]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x1F40D9450]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::string::size_type std::string::find(const std::string *this, std::string::value_type __c, std::string::size_type __pos)
{
  return MEMORY[0x1F417E380](this, __c, __pos);
}

int std::string::compare(const std::string *this, std::string::size_type __pos1, std::string::size_type __n1, const std::string::value_type *__s)
{
  return MEMORY[0x1F417E398](this, __pos1, __n1, __s);
}

int std::string::compare(const std::string *this, std::string::size_type __pos1, std::string::size_type __n1, const std::string *__str, std::string::size_type __pos2, std::string::size_type __n2)
{
  return MEMORY[0x1F417E3A0](this, __pos1, __n1, __str, __pos2, __n2);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1F417E408](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1F417E418](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::logic_error *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E458](this, a2);
}

void std::out_of_range::~out_of_range(std::out_of_range *this)
{
}

std::exception_ptr *__cdecl std::exception_ptr::exception_ptr(std::exception_ptr *this, const std::exception_ptr *a2)
{
  return (std::exception_ptr *)MEMORY[0x1F417E4A0](this, a2);
}

void std::exception_ptr::~exception_ptr(std::exception_ptr *this)
{
}

std::exception_ptr *__cdecl std::exception_ptr::operator=(std::exception_ptr *this, const std::exception_ptr *a2)
{
  return (std::exception_ptr *)MEMORY[0x1F417E4B0](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
}

void std::string::__grow_by_and_replace(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add, const std::string::value_type *__p_new_stuff)
{
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E5C0](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E608](this, __pos, __s, __n);
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
  return MEMORY[0x1F417E860]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1F417E868]();
}

{
  return MEMORY[0x1F417E898]();
}

{
  return MEMORY[0x1F417E8A0]();
}

{
  return MEMORY[0x1F417E8B0]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1F417E978]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1F417E980]();
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

uint64_t std::operator+<char>()
{
  return MEMORY[0x1F417EEA0]();
}

std::bad_alloc *__cdecl std::bad_alloc::bad_alloc(std::bad_alloc *this)
{
  return (std::bad_alloc *)MEMORY[0x1F417EEC8](this);
}

void std::exception::~exception(std::exception *this)
{
}

std::exception_ptr std::current_exception(void)
{
  return (std::exception_ptr)MEMORY[0x1F417EF08]();
}

void std::rethrow_exception(std::exception_ptr a1)
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
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

char *__cxa_demangle(const char *lpmangled, char *lpout, size_t *lpoutlen, int *lpstatus)
{
  return (char *)MEMORY[0x1F417EF58](lpmangled, lpout, lpoutlen, lpstatus);
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

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

uint64_t __dtoa()
{
  return MEMORY[0x1F40C9B80]();
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x1F417EFA8](lpsrc, lpstype, lpdtype, s2d);
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

uint64_t __freedtoa()
{
  return MEMORY[0x1F40C9BD0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1F40C9C18](*(void *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1F40C9C28]();
}

uint64_t __sandbox_ms()
{
  return MEMORY[0x1F40C9C78]();
}

const mach_header *__cdecl _dyld_get_image_header(uint32_t image_index)
{
  return (const mach_header *)MEMORY[0x1F40C9E08](*(void *)&image_index);
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1F40C9F70](dso, description, activity, *(void *)&flags);
}

void _os_activity_initiate(void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
}

uint64_t _os_assert_log()
{
  return MEMORY[0x1F40C9F90]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1F40C9FA0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

void abort(void)
{
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1F40CA210](a1, *(void *)&a2);
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

int atoi(const char *a1)
{
  return MEMORY[0x1F40CA4A8](a1);
}

void audit_token_to_au32(audit_token_t *atoken, uid_t *auidp, uid_t *euidp, gid_t *egidp, uid_t *ruidp, gid_t *rgidp, pid_t *pidp, au_asid_t *asidp, au_tid_t *tidp)
{
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x1F40CA4F8](a1, *(void *)&a2);
}

char **__cdecl backtrace_symbols(void *const *a1, int a2)
{
  return (char **)MEMORY[0x1F40CA508](a1, *(void *)&a2);
}

char *__cdecl basename_r(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1F40CA520](a1, a2);
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1F40CA660](__count, __size);
}

uint64_t cc_clear()
{
  return MEMORY[0x1F40CA6A0]();
}

uint64_t cc_cmp_safe()
{
  return MEMORY[0x1F40CA6A8]();
}

uint64_t ccaes_cbc_decrypt_mode()
{
  return MEMORY[0x1F40CA6B0]();
}

uint64_t ccaes_ctr_crypt_mode()
{
  return MEMORY[0x1F40CA6D0]();
}

uint64_t ccaes_ecb_decrypt_mode()
{
  return MEMORY[0x1F40CA6D8]();
}

uint64_t ccaes_ecb_encrypt_mode()
{
  return MEMORY[0x1F40CA6E0]();
}

uint64_t ccaes_gcm_decrypt_mode()
{
  return MEMORY[0x1F40CA6E8]();
}

uint64_t ccaes_gcm_encrypt_mode()
{
  return MEMORY[0x1F40CA6F0]();
}

uint64_t ccansikdf_x963()
{
  return MEMORY[0x1F40CA710]();
}

uint64_t cccbc_one_shot()
{
  return MEMORY[0x1F40CA748]();
}

uint64_t cccurve25519_make_key_pair()
{
  return MEMORY[0x1F40CA7D8]();
}

uint64_t cccurve25519_make_pub_with_rng()
{
  return MEMORY[0x1F40CA7F0]();
}

uint64_t cccurve25519_with_rng()
{
  return MEMORY[0x1F40CA7F8]();
}

uint64_t cccurve448()
{
  return MEMORY[0x1F40CA800]();
}

uint64_t cccurve448_make_key_pair()
{
  return MEMORY[0x1F40CA808]();
}

uint64_t cccurve448_make_pub()
{
  return MEMORY[0x1F40CA818]();
}

uint64_t ccder_blob_decode_bitstring()
{
  return MEMORY[0x1F40CA820]();
}

uint64_t ccder_blob_decode_tag()
{
  return MEMORY[0x1F40CA840]();
}

uint64_t ccder_blob_decode_tl()
{
  return MEMORY[0x1F40CA848]();
}

uint64_t ccder_blob_decode_uint64()
{
  return MEMORY[0x1F40CA850]();
}

uint64_t ccder_blob_encode_body()
{
  return MEMORY[0x1F40CA858]();
}

uint64_t ccder_blob_encode_body_tl()
{
  return MEMORY[0x1F40CA860]();
}

uint64_t ccder_blob_encode_tl()
{
  return MEMORY[0x1F40CA878]();
}

uint64_t ccder_decode_constructed_tl()
{
  return MEMORY[0x1F40CA888]();
}

uint64_t ccder_decode_len()
{
  return MEMORY[0x1F40CA890]();
}

uint64_t ccder_decode_rsa_pub_n()
{
  return MEMORY[0x1F40CA8A8]();
}

uint64_t ccder_decode_seqii()
{
  return MEMORY[0x1F40CA8B0]();
}

uint64_t ccder_decode_sequence_tl()
{
  return MEMORY[0x1F40CA8B8]();
}

uint64_t ccder_decode_tag()
{
  return MEMORY[0x1F40CA8C0]();
}

uint64_t ccder_decode_tl()
{
  return MEMORY[0x1F40CA8C8]();
}

uint64_t ccder_decode_uint64()
{
  return MEMORY[0x1F40CA8D0]();
}

uint64_t ccder_encode_body()
{
  return MEMORY[0x1F40CA8D8]();
}

uint64_t ccder_encode_body_nocopy()
{
  return MEMORY[0x1F40CA8E0]();
}

uint64_t ccder_encode_constructed_tl()
{
  return MEMORY[0x1F40CA8E8]();
}

uint64_t ccder_encode_implicit_raw_octet_string()
{
  return MEMORY[0x1F40CA900]();
}

uint64_t ccder_encode_integer()
{
  return MEMORY[0x1F40CA908]();
}

uint64_t ccder_encode_tl()
{
  return MEMORY[0x1F40CA928]();
}

uint64_t ccder_encode_uint64()
{
  return MEMORY[0x1F40CA930]();
}

uint64_t ccder_sizeof()
{
  return MEMORY[0x1F40CA938]();
}

uint64_t ccder_sizeof_implicit_raw_octet_string()
{
  return MEMORY[0x1F40CA940]();
}

uint64_t ccder_sizeof_integer()
{
  return MEMORY[0x1F40CA950]();
}

uint64_t ccder_sizeof_len()
{
  return MEMORY[0x1F40CA958]();
}

uint64_t ccder_sizeof_raw_octet_string()
{
  return MEMORY[0x1F40CA960]();
}

uint64_t ccder_sizeof_tag()
{
  return MEMORY[0x1F40CA968]();
}

uint64_t ccder_sizeof_uint64()
{
  return MEMORY[0x1F40CA970]();
}

uint64_t ccdh_ccn_size()
{
  return MEMORY[0x1F40CA978]();
}

uint64_t ccdh_compute_shared_secret()
{
  return MEMORY[0x1F40CA980]();
}

uint64_t ccdh_generate_key()
{
  return MEMORY[0x1F40CA988]();
}

uint64_t ccdh_gp_n()
{
  return MEMORY[0x1F40CA990]();
}

uint64_t ccdh_gp_size()
{
  return MEMORY[0x1F40CA998]();
}

uint64_t ccdh_import_pub()
{
  return MEMORY[0x1F40CA9A0]();
}

uint64_t ccdh_init_gp_from_bytes()
{
  return MEMORY[0x1F40CA9A8]();
}

uint64_t ccdigest()
{
  return MEMORY[0x1F40CA9B0]();
}

uint64_t ccdigest_init()
{
  return MEMORY[0x1F40CA9B8]();
}

uint64_t ccdigest_update()
{
  return MEMORY[0x1F40CA9C0]();
}

uint64_t ccec_compact_export()
{
  return MEMORY[0x1F40CA9D0]();
}

uint64_t ccec_compact_generate_key()
{
  return MEMORY[0x1F40CA9E0]();
}

uint64_t ccec_compact_import_priv()
{
  return MEMORY[0x1F40CA9E8]();
}

uint64_t ccec_compact_import_priv_size()
{
  return MEMORY[0x1F40CA9F0]();
}

uint64_t ccec_compact_import_pub()
{
  return MEMORY[0x1F40CA9F8]();
}

uint64_t ccec_compressed_x962_export_pub()
{
  return MEMORY[0x1F40CAA10]();
}

uint64_t ccec_compressed_x962_export_pub_size()
{
  return MEMORY[0x1F40CAA18]();
}

uint64_t ccec_compressed_x962_import_pub()
{
  return MEMORY[0x1F40CAA20]();
}

uint64_t ccec_compute_key()
{
  return MEMORY[0x1F40CAA28]();
}

uint64_t ccec_cp_192()
{
  return MEMORY[0x1F40CAA30]();
}

uint64_t ccec_cp_224()
{
  return MEMORY[0x1F40CAA38]();
}

uint64_t ccec_cp_256()
{
  return MEMORY[0x1F40CAA40]();
}

uint64_t ccec_cp_384()
{
  return MEMORY[0x1F40CAA48]();
}

uint64_t ccec_cp_521()
{
  return MEMORY[0x1F40CAA50]();
}

uint64_t ccec_curve_for_length_lookup()
{
  return MEMORY[0x1F40CAA58]();
}

uint64_t ccec_der_import_priv()
{
  return MEMORY[0x1F40CAA88]();
}

uint64_t ccec_der_import_priv_keytype()
{
  return MEMORY[0x1F40CAA90]();
}

uint64_t ccec_export_pub()
{
  return MEMORY[0x1F40CAAB8]();
}

uint64_t ccec_generate_key_deterministic()
{
  return MEMORY[0x1F40CAAD8]();
}

uint64_t ccec_generate_key_fips()
{
  return MEMORY[0x1F40CAAE0]();
}

uint64_t ccec_get_cp()
{
  return MEMORY[0x1F40CAAF8]();
}

uint64_t ccec_import_pub()
{
  return MEMORY[0x1F40CAB00]();
}

uint64_t ccec_keysize_is_supported()
{
  return MEMORY[0x1F40CAB08]();
}

uint64_t ccec_rfc6637_unwrap_key()
{
  return MEMORY[0x1F40CAB38]();
}

uint64_t ccec_rfc6637_wrap_key()
{
  return MEMORY[0x1F40CAB40]();
}

uint64_t ccec_rfc6637_wrap_key_size()
{
  return MEMORY[0x1F40CAB50]();
}

uint64_t ccec_sign()
{
  return MEMORY[0x1F40CAB58]();
}

uint64_t ccec_verify()
{
  return MEMORY[0x1F40CAB78]();
}

uint64_t ccec_verify_composite()
{
  return MEMORY[0x1F40CAB80]();
}

uint64_t ccec_x963_import_priv_size()
{
  return MEMORY[0x1F40CABA0]();
}

uint64_t ccec_x963_import_pub_size()
{
  return MEMORY[0x1F40CABB0]();
}

uint64_t ccecb_context_size()
{
  return MEMORY[0x1F40CABB8]();
}

uint64_t ccecb_init()
{
  return MEMORY[0x1F40CABC0]();
}

uint64_t ccecdh_compute_shared_secret()
{
  return MEMORY[0x1F40CABD0]();
}

uint64_t ccecies_decrypt_gcm()
{
  return MEMORY[0x1F40CABD8]();
}

uint64_t ccecies_decrypt_gcm_plaintext_size()
{
  return MEMORY[0x1F40CABE8]();
}

uint64_t ccecies_encrypt_gcm()
{
  return MEMORY[0x1F40CABF8]();
}

uint64_t ccecies_encrypt_gcm_ciphertext_size()
{
  return MEMORY[0x1F40CAC00]();
}

uint64_t cced25519_make_key_pair()
{
  return MEMORY[0x1F40CAC20]();
}

uint64_t cced25519_make_pub_with_rng()
{
  return MEMORY[0x1F40CAC38]();
}

uint64_t cced25519_sign_with_rng()
{
  return MEMORY[0x1F40CAC48]();
}

uint64_t cced25519_verify()
{
  return MEMORY[0x1F40CAC50]();
}

uint64_t cced448_make_key_pair()
{
  return MEMORY[0x1F40CAC58]();
}

uint64_t cced448_make_pub()
{
  return MEMORY[0x1F40CAC60]();
}

uint64_t cced448_sign()
{
  return MEMORY[0x1F40CAC68]();
}

uint64_t cced448_verify()
{
  return MEMORY[0x1F40CAC70]();
}

uint64_t ccgcm_one_shot()
{
  return MEMORY[0x1F40CACA8]();
}

uint64_t cchkdf()
{
  return MEMORY[0x1F40CAE28]();
}

uint64_t cchmac()
{
  return MEMORY[0x1F40CAE40]();
}

uint64_t cchmac_final()
{
  return MEMORY[0x1F40CAE48]();
}

uint64_t cchmac_init()
{
  return MEMORY[0x1F40CAE50]();
}

uint64_t cchmac_update()
{
  return MEMORY[0x1F40CAE58]();
}

uint64_t cckem_decapsulate()
{
  return MEMORY[0x1F40CAEC0]();
}

uint64_t cckem_encapsulate()
{
  return MEMORY[0x1F40CAEC8]();
}

uint64_t cckem_encapsulated_key_nbytes_ctx()
{
  return MEMORY[0x1F40CAED0]();
}

uint64_t cckem_encapsulated_key_nbytes_info()
{
  return MEMORY[0x1F40CAED8]();
}

uint64_t cckem_export_privkey()
{
  return MEMORY[0x1F40CAEE0]();
}

uint64_t cckem_export_pubkey()
{
  return MEMORY[0x1F40CAEE8]();
}

uint64_t cckem_full_ctx_init()
{
  return MEMORY[0x1F40CAEF0]();
}

uint64_t cckem_generate_key()
{
  return MEMORY[0x1F40CAEF8]();
}

uint64_t cckem_import_privkey()
{
  return MEMORY[0x1F40CAF00]();
}

uint64_t cckem_import_pubkey()
{
  return MEMORY[0x1F40CAF08]();
}

uint64_t cckem_kyber1024()
{
  return MEMORY[0x1F40CAF10]();
}

uint64_t cckem_kyber768()
{
  return MEMORY[0x1F40CAF18]();
}

uint64_t cckem_privkey_nbytes_ctx()
{
  return MEMORY[0x1F40CAF20]();
}

uint64_t cckem_privkey_nbytes_info()
{
  return MEMORY[0x1F40CAF28]();
}

uint64_t cckem_pubkey_nbytes_ctx()
{
  return MEMORY[0x1F40CAF38]();
}

uint64_t cckem_pubkey_nbytes_info()
{
  return MEMORY[0x1F40CAF40]();
}

uint64_t cckem_public_ctx()
{
  return MEMORY[0x1F40CAF48]();
}

uint64_t cckem_shared_key_nbytes_ctx()
{
  return MEMORY[0x1F40CAF50]();
}

uint64_t cckem_shared_key_nbytes_info()
{
  return MEMORY[0x1F40CAF58]();
}

uint64_t cckem_sizeof_full_ctx()
{
  return MEMORY[0x1F40CAF60]();
}

uint64_t cckem_sizeof_pub_ctx()
{
  return MEMORY[0x1F40CAF68]();
}

uint64_t ccmd5_di()
{
  return MEMORY[0x1F40CAF80]();
}

uint64_t ccn_add()
{
  return MEMORY[0x1F40CAF88]();
}

uint64_t ccn_add1()
{
  return MEMORY[0x1F40CAF90]();
}

uint64_t ccn_bitlen()
{
  return MEMORY[0x1F40CAF98]();
}

uint64_t ccn_cmpn()
{
  return MEMORY[0x1F40CAFA8]();
}

uint64_t ccn_read_uint()
{
  return MEMORY[0x1F40CAFB0]();
}

uint64_t ccn_set_bit()
{
  return MEMORY[0x1F40CAFB8]();
}

uint64_t ccn_write_int()
{
  return MEMORY[0x1F40CAFC8]();
}

uint64_t ccn_write_int_size()
{
  return MEMORY[0x1F40CAFD0]();
}

uint64_t ccn_write_uint()
{
  return MEMORY[0x1F40CAFD8]();
}

uint64_t ccn_write_uint_padded()
{
  return MEMORY[0x1F40CAFE0]();
}

uint64_t ccn_write_uint_size()
{
  return MEMORY[0x1F40CAFF0]();
}

uint64_t ccn_zero()
{
  return MEMORY[0x1F40CAFF8]();
}

uint64_t ccoid_equal()
{
  return MEMORY[0x1F40CB008]();
}

uint64_t ccpbkdf2_hmac()
{
  return MEMORY[0x1F40CB010]();
}

uint64_t ccrng()
{
  return MEMORY[0x1F40CB030]();
}

uint64_t ccrsa_block_size()
{
  return MEMORY[0x1F40CB050]();
}

uint64_t ccrsa_ctx_public()
{
  return MEMORY[0x1F40CB058]();
}

uint64_t ccrsa_eme_pkcs1v15_decode()
{
  return MEMORY[0x1F40CB060]();
}

uint64_t ccrsa_eme_pkcs1v15_decode_safe()
{
  return MEMORY[0x1F40CB068]();
}

uint64_t ccrsa_eme_pkcs1v15_encode()
{
  return MEMORY[0x1F40CB070]();
}

uint64_t ccrsa_emsa_pkcs1v15_encode()
{
  return MEMORY[0x1F40CB078]();
}

uint64_t ccrsa_emsa_pkcs1v15_verify()
{
  return MEMORY[0x1F40CB080]();
}

uint64_t ccrsa_emsa_pss_decode()
{
  return MEMORY[0x1F40CB088]();
}

uint64_t ccrsa_emsa_pss_encode()
{
  return MEMORY[0x1F40CB090]();
}

uint64_t ccrsa_export_priv()
{
  return MEMORY[0x1F40CB0A0]();
}

uint64_t ccrsa_export_priv_size()
{
  return MEMORY[0x1F40CB0A8]();
}

uint64_t ccrsa_generate_fips186_key()
{
  return MEMORY[0x1F40CB0B0]();
}

uint64_t ccrsa_import_priv()
{
  return MEMORY[0x1F40CB0C0]();
}

uint64_t ccrsa_import_priv_n()
{
  return MEMORY[0x1F40CB0C8]();
}

uint64_t ccrsa_import_pub()
{
  return MEMORY[0x1F40CB0D0]();
}

uint64_t ccrsa_import_pub_n()
{
  return MEMORY[0x1F40CB0D8]();
}

uint64_t ccrsa_oaep_decode()
{
  return MEMORY[0x1F40CB0E8]();
}

uint64_t ccrsa_oaep_encode()
{
  return MEMORY[0x1F40CB0F0]();
}

uint64_t ccrsa_priv_crypt()
{
  return MEMORY[0x1F40CB0F8]();
}

uint64_t ccrsa_pub_crypt()
{
  return MEMORY[0x1F40CB100]();
}

uint64_t ccrsa_verify_pkcs1v15_allowshortsigs()
{
  return MEMORY[0x1F40CB108]();
}

uint64_t ccsha1_di()
{
  return MEMORY[0x1F40CB138]();
}

uint64_t ccsha224_di()
{
  return MEMORY[0x1F40CB140]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x1F40CB148]();
}

uint64_t ccsha384_di()
{
  return MEMORY[0x1F40CB150]();
}

uint64_t ccsha512_di()
{
  return MEMORY[0x1F40CB158]();
}

uint64_t ccwrap_auth_decrypt()
{
  return MEMORY[0x1F40CB308]();
}

uint64_t ccwrap_auth_encrypt()
{
  return MEMORY[0x1F40CB310]();
}

uint64_t ccwrap_unwrapped_size()
{
  return MEMORY[0x1F40CB318]();
}

uint64_t ccwrap_wrapped_size()
{
  return MEMORY[0x1F40CB320]();
}

uint64_t cczp_bitlen()
{
  return MEMORY[0x1F40CB330]();
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1F40CB3A0](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1F40CB400](a1);
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return MEMORY[0x1F40CB880](from, to, state, *(void *)&flags);
}

copyfile_state_t copyfile_state_alloc(void)
{
  return (copyfile_state_t)MEMORY[0x1F40CB888]();
}

int copyfile_state_free(copyfile_state_t a1)
{
  return MEMORY[0x1F40CB890](a1);
}

int copyfile_state_set(copyfile_state_t s, uint32_t flag, const void *src)
{
  return MEMORY[0x1F40CB8A0](s, *(void *)&flag, src);
}

uint64_t csops()
{
  return MEMORY[0x1F40CB8C8]();
}

uint64_t csops_audittoken()
{
  return MEMORY[0x1F40CB8D0]();
}

uint64_t csr_check()
{
  return MEMORY[0x1F40CB8D8]();
}

uint64_t der_vm_CEType_from_context()
{
  return MEMORY[0x1F417A418]();
}

uint64_t der_vm_BOOL_from_context()
{
  return MEMORY[0x1F417A420]();
}

uint64_t der_vm_context_is_valid()
{
  return MEMORY[0x1F417A428]();
}

uint64_t der_vm_data_from_context()
{
  return MEMORY[0x1F417A430]();
}

uint64_t der_vm_execute_nocopy()
{
  return MEMORY[0x1F417A438]();
}

uint64_t der_vm_integer_from_context()
{
  return MEMORY[0x1F417A440]();
}

uint64_t der_vm_iterate_b()
{
  return MEMORY[0x1F417A448]();
}

uint64_t der_vm_select_int_for_key()
{
  return MEMORY[0x1F417A450]();
}

uint64_t der_vm_string_from_context()
{
  return MEMORY[0x1F417A458]();
}

double difftime(time_t a1, time_t a2)
{
  MEMORY[0x1F40CB8F8](a1, a2);
  return result;
}

int dirfd(DIR *dirp)
{
  return MEMORY[0x1F40CB900](dirp);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

BOOL dispatch_data_apply(dispatch_data_t data, dispatch_data_applier_t applier)
{
  return MEMORY[0x1F40CBA00](data, applier);
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x1F40CBA10](buffer, size, queue, destructor);
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return MEMORY[0x1F40CBA48](data);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
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

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
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

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x1F40CBD40](when, delta);
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

int fclose(FILE *a1)
{
  return MEMORY[0x1F40CC050](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1F40CC058](*(void *)&a1, *(void *)&a2);
}

FILE *__cdecl fdopen(int a1, const char *a2)
{
  return (FILE *)MEMORY[0x1F40CC070](*(void *)&a1, a2);
}

int feof(FILE *a1)
{
  return MEMORY[0x1F40CC098](a1);
}

ssize_t fgetxattr(int fd, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1F40CC108](*(void *)&fd, name, value, size, *(void *)&position, *(void *)&options);
}

ssize_t flistxattr(int fd, char *namebuff, size_t size, int options)
{
  return MEMORY[0x1F40CC158](*(void *)&fd, namebuff, size, *(void *)&options);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x1F40CC1E8](*(void *)&a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC200](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fremovexattr(int fd, const char *name, int options)
{
  return MEMORY[0x1F40CC240](*(void *)&fd, name, *(void *)&options);
}

long double frexp(long double __x, int *__e)
{
  MEMORY[0x1F40CC248](__e, __x);
  return result;
}

int fsetxattr(int fd, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1F40CC2A8](*(void *)&fd, name, value, size, *(void *)&position, *(void *)&options);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1F40CC2B8](*(void *)&a1, a2);
}

int fts_close(FTS *a1)
{
  return MEMORY[0x1F40CC2F8](a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return (FTS *)MEMORY[0x1F40CC300](a1, *(void *)&a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return (FTSENT *)MEMORY[0x1F40CC308](a1);
}

int fts_set(FTS *a1, FTSENT *a2, int a3)
{
  return MEMORY[0x1F40CC310](a1, a2, *(void *)&a3);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1F40CC360](a1, a2, a3, a4, *(void *)&a5);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1F40CC3B0](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1F40CC3B8]();
}

int gethostuuid(uuid_t a1, const timespec *a2)
{
  return MEMORY[0x1F40CC408](a1, a2);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1F40CC4C0]();
}

tm *__cdecl gmtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1F40CC5B0](a1, a2);
}

ssize_t listxattr(const char *path, char *namebuff, size_t size, int options)
{
  return MEMORY[0x1F40CC848](path, namebuff, size, *(void *)&options);
}

long double log2(long double __x)
{
  MEMORY[0x1F40CC8A8](__x);
  return result;
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1F40CC8F8](*(void *)&a1, a2, *(void *)&a3);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CC900](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1F40CC930]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
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

void *__cdecl malloc_type_valloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCBB0](size, type_id);
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

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x1F40CCD40](__s, __smax, *(void *)&__c, __n);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1F40CCDD0](a1, a2);
}

int mkpath_np(const char *path, mode_t omode)
{
  return MEMORY[0x1F40CCE00](path, omode);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1F40CCE40](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1F40CCE88](a1, a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1F40CD058](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

int openat_authenticated_np(int a1, const char *a2, int a3, int a4)
{
  return MEMORY[0x1F40CD108](*(void *)&a1, a2, *(void *)&a3, *(void *)&a4);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1F40CD120](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_release(void *object)
{
}

void *__cdecl os_retain(void *object)
{
  return (void *)MEMORY[0x1F40CD548](object);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1F40CD558](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x1F40CD5E8]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1F40CD630]();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1F40CD650]();
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1F40CD830](*(void *)&__fd, __buf, __nbyte, a4);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1F40CDA20](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1F40CDA40](a1, a2);
}

int pthread_main_np(void)
{
  return MEMORY[0x1F40CDA68]();
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA78](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1F40CDA80](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1F40CDAC8](a1, a2);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1F40CDB70](a1, a2);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1F40CDBC0](*(void *)&__fd, __buf, __nbyte, a4);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1F40CDC50](*(void *)&a1, a2, a3);
}

int readdir_r(DIR *a1, dirent *a2, dirent **a3)
{
  return MEMORY[0x1F40CDC68](a1, a2, a3);
}

ssize_t readlink(const char *a1, char *a2, size_t a3)
{
  return MEMORY[0x1F40CDC70](a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1F40CDC98](a1, a2);
}

int regcomp(regex_t *a1, const char *a2, int a3)
{
  return MEMORY[0x1F40CDCD8](a1, a2, *(void *)&a3);
}

int regexec(const regex_t *a1, const char *a2, size_t a3, regmatch_t __pmatch[], int a5)
{
  return MEMORY[0x1F40CDCE8](a1, a2, a3, __pmatch, *(void *)&a5);
}

void regfree(regex_t *a1)
{
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return MEMORY[0x1F40CDD10](__p, __ec);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

int seteuid(uid_t a1)
{
  return MEMORY[0x1F40CDF68](*(void *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181F90](a1, *(void *)&a2, a3, *(void *)&n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x1F4181FA8](a1, *(void *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x1F4181FB0](a1, *(void *)&a2, *(void *)&a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x1F4181FB8](a1, *(void *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x1F4181FC0](a1, *(void *)&a2);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181FE8](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_busy_timeout(sqlite3 *a1, int ms)
{
  return MEMORY[0x1F4182048](a1, *(void *)&ms);
}

int sqlite3_changes(sqlite3 *a1)
{
  return MEMORY[0x1F4182050](a1);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return MEMORY[0x1F4182058](a1);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x1F4182060](a1);
}

int sqlite3_close_v2(sqlite3 *a1)
{
  return MEMORY[0x1F4182068](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1F4182070](a1, *(void *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F4182078](a1, *(void *)&iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F4182088](pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  MEMORY[0x1F4182098](a1, *(void *)&iCol);
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820A0](a1, *(void *)&iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820A8](a1, *(void *)&iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return (const char *)MEMORY[0x1F41820B0](a1, *(void *)&N);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1F41820C8](a1, *(void *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820D8](a1, *(void *)&iCol);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1F41821A8](a1, sql, callback, a4, errmsg);
}

int sqlite3_extended_result_codes(sqlite3 *a1, int onoff)
{
  return MEMORY[0x1F41821C8](a1, *(void *)&onoff);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41821D8](pStmt);
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return MEMORY[0x1F4182230](a1);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1F4182280](filename, ppDb, *(void *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1F4182290](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41822C0](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1F41823B0](a1);
}

int sqlite3_system_errno(sqlite3 *a1)
{
  return MEMORY[0x1F41823D8](a1);
}

uint64_t sslCipherSuiteGetMacSize()
{
  return MEMORY[0x1F417F158]();
}

uint64_t sslCipherSuiteGetSymmetricCipherBlockIvSize()
{
  return MEMORY[0x1F417F160]();
}

uint64_t sslCipherSuiteGetSymmetricCipherKeySize()
{
  return MEMORY[0x1F417F168]();
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CE110](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1F40CE118](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1F40CE138](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1F40CE150](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

size_t strcspn(const char *__s, const char *__charset)
{
  return MEMORY[0x1F40CE170](__s, __charset);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1F40CE178](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x1F40CE1D8](a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1F40CE208](__s1, __n);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return (char *)MEMORY[0x1F40CE210](__big, __little, __len);
}

char *__cdecl strptime(const char *a1, const char *a2, tm *a3)
{
  return (char *)MEMORY[0x1F40CE220](a1, a2, a3);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return (char *)MEMORY[0x1F40CE238](__stringp, __delim);
}

double strtod(const char *a1, char **a2)
{
  MEMORY[0x1F40CE260](a1, a2);
  return result;
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2A0](__str, __endptr, *(void *)&__base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2E0](__str, __endptr, *(void *)&__base);
}

uint64_t sysconf(int a1)
{
  return MEMORY[0x1F40CE3B8](*(void *)&a1);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1F40CE3C0](a1, *(void *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1F40CE470](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1F40CE588](a1);
}

time_t timegm(tm *const a1)
{
  return MEMORY[0x1F40CE590](a1);
}

int timingsafe_bcmp(const void *__b1, const void *__b2, size_t __len)
{
  return MEMORY[0x1F40CE598](__b1, __b2, __len);
}

uint64_t tls_cache_cleanup()
{
  return MEMORY[0x1F417F170]();
}

uint64_t tls_cache_create()
{
  return MEMORY[0x1F417F178]();
}

uint64_t tls_cache_delete_session_data()
{
  return MEMORY[0x1F417F180]();
}

uint64_t tls_cache_empty()
{
  return MEMORY[0x1F417F188]();
}

uint64_t tls_cache_load_session_data()
{
  return MEMORY[0x1F417F190]();
}

uint64_t tls_cache_save_session_data()
{
  return MEMORY[0x1F417F198]();
}

uint64_t tls_handshake_close()
{
  return MEMORY[0x1F417F1A0]();
}

uint64_t tls_handshake_continue()
{
  return MEMORY[0x1F417F1A8]();
}

uint64_t tls_handshake_create()
{
  return MEMORY[0x1F417F1B0]();
}

uint64_t tls_handshake_destroy()
{
  return MEMORY[0x1F417F1B8]();
}

uint64_t tls_handshake_get_ciphersuites()
{
  return MEMORY[0x1F417F1C0]();
}

uint64_t tls_handshake_get_max_protocol_version()
{
  return MEMORY[0x1F417F1C8]();
}

uint64_t tls_handshake_get_min_dh_group_size()
{
  return MEMORY[0x1F417F1D0]();
}

uint64_t tls_handshake_get_min_protocol_version()
{
  return MEMORY[0x1F417F1D8]();
}

uint64_t tls_handshake_get_negotiated_cipherspec()
{
  return MEMORY[0x1F417F1E0]();
}

uint64_t tls_handshake_get_negotiated_curve()
{
  return MEMORY[0x1F417F1E8]();
}

uint64_t tls_handshake_get_peer_acceptable_client_auth_type()
{
  return MEMORY[0x1F417F1F0]();
}

uint64_t tls_handshake_get_peer_acceptable_dn_list()
{
  return MEMORY[0x1F417F1F8]();
}

uint64_t tls_handshake_get_peer_alpn_data()
{
  return MEMORY[0x1F417F200]();
}

uint64_t tls_handshake_get_peer_hostname()
{
  return MEMORY[0x1F417F208]();
}

uint64_t tls_handshake_get_peer_npn_data()
{
  return MEMORY[0x1F417F210]();
}

uint64_t tls_handshake_get_peer_signature_algorithms()
{
  return MEMORY[0x1F417F218]();
}

uint64_t tls_handshake_get_server_identity_change()
{
  return MEMORY[0x1F417F220]();
}

uint64_t tls_handshake_get_session_match()
{
  return MEMORY[0x1F417F228]();
}

uint64_t tls_handshake_get_session_warning()
{
  return MEMORY[0x1F417F230]();
}

uint64_t tls_handshake_get_sni_hostname()
{
  return MEMORY[0x1F417F238]();
}

uint64_t tls_handshake_negotiate()
{
  return MEMORY[0x1F417F270]();
}

uint64_t tls_handshake_process()
{
  return MEMORY[0x1F417F278]();
}

uint64_t tls_handshake_retransmit_timer_expired()
{
  return MEMORY[0x1F417F288]();
}

uint64_t tls_handshake_send_alert()
{
  return MEMORY[0x1F417F290]();
}

uint64_t tls_handshake_set_acceptable_dn_list()
{
  return MEMORY[0x1F417F298]();
}

uint64_t tls_handshake_set_alpn_data()
{
  return MEMORY[0x1F417F2A0]();
}

uint64_t tls_handshake_set_callbacks()
{
  return MEMORY[0x1F417F2A8]();
}

uint64_t tls_handshake_set_ciphersuites()
{
  return MEMORY[0x1F417F2B0]();
}

uint64_t tls_handshake_set_client_auth()
{
  return MEMORY[0x1F417F2B8]();
}

uint64_t tls_handshake_set_config()
{
  return MEMORY[0x1F417F2C0]();
}

uint64_t tls_handshake_set_curves()
{
  return MEMORY[0x1F417F2C8]();
}

uint64_t tls_handshake_set_fallback()
{
  return MEMORY[0x1F417F2D8]();
}

uint64_t tls_handshake_set_false_start()
{
  return MEMORY[0x1F417F2E0]();
}

uint64_t tls_handshake_set_max_protocol_version()
{
  return MEMORY[0x1F417F2E8]();
}

uint64_t tls_handshake_set_min_dh_group_size()
{
  return MEMORY[0x1F417F2F0]();
}

uint64_t tls_handshake_set_min_protocol_version()
{
  return MEMORY[0x1F417F2F8]();
}

uint64_t tls_handshake_set_mtu()
{
  return MEMORY[0x1F417F300]();
}

uint64_t tls_handshake_set_ocsp_enable()
{
  return MEMORY[0x1F417F318]();
}

uint64_t tls_handshake_set_ocsp_response()
{
  return MEMORY[0x1F417F320]();
}

uint64_t tls_handshake_set_peer_trust()
{
  return MEMORY[0x1F417F330]();
}

uint64_t tls_handshake_set_psk_identity()
{
  return MEMORY[0x1F417F338]();
}

uint64_t tls_handshake_set_psk_secret()
{
  return MEMORY[0x1F417F340]();
}

uint64_t tls_handshake_set_renegotiation()
{
  return MEMORY[0x1F417F348]();
}

uint64_t tls_handshake_set_resumption()
{
  return MEMORY[0x1F417F350]();
}

uint64_t tls_handshake_set_sct_enable()
{
  return MEMORY[0x1F417F358]();
}

uint64_t tls_handshake_set_server_identity_change()
{
  return MEMORY[0x1F417F360]();
}

uint64_t tls_handshake_set_session_ticket_enabled()
{
  return MEMORY[0x1F417F368]();
}

uint64_t tls_helper_create_peer_trust()
{
  return MEMORY[0x1F417F3F0]();
}

uint64_t tls_helper_set_identity_from_array()
{
  return MEMORY[0x1F417F3F8]();
}

uint64_t tls_helper_set_peer_pubkey()
{
  return MEMORY[0x1F417F400]();
}

uint64_t tls_record_create()
{
  return MEMORY[0x1F417F380]();
}

uint64_t tls_record_decrypt()
{
  return MEMORY[0x1F417F388]();
}

uint64_t tls_record_decrypted_size()
{
  return MEMORY[0x1F417F390]();
}

uint64_t tls_record_destroy()
{
  return MEMORY[0x1F417F398]();
}

uint64_t tls_record_encrypt()
{
  return MEMORY[0x1F417F3A0]();
}

uint64_t tls_record_encrypted_size()
{
  return MEMORY[0x1F417F3A8]();
}

uint64_t tls_record_get_header_size()
{
  return MEMORY[0x1F417F3B0]();
}

uint64_t tls_record_parse_header()
{
  return MEMORY[0x1F417F3C0]();
}

uint64_t tls_record_parse_ssl2_header()
{
  return MEMORY[0x1F417F3C8]();
}

int uname(utsname *a1)
{
  return MEMORY[0x1F40CE5C8](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x1F40CE5E0](a1);
}

int unlinkat(int a1, const char *a2, int a3)
{
  return MEMORY[0x1F40CE5E8](*(void *)&a1, a2, *(void *)&a3);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1F40CE608](*(void *)&a1);
}

void uuid_generate_random(uuid_t out)
{
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x1F40CE680](a1, a2, a3);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x1F40CE6A8](*(void *)&target_task, address, size, *(void *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1F40CE6C0](*(void *)&target_task, address, size);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1F40CE790](__str, __size, __format, a4);
}

void vsyslog(int a1, const char *a2, __darwin_va_list a3)
{
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1F40CE928](*(void *)&__fd, __buf, __nbyte);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1F40CEA18](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEA30](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1F40CEA58](xarray);
}

const void *__cdecl xpc_array_get_data(xpc_object_t xarray, size_t index, size_t *length)
{
  return (const void *)MEMORY[0x1F40CEA68](xarray, index, length);
}

uint64_t xpc_array_get_pointer()
{
  return MEMORY[0x1F40CEA88]();
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x1F40CEA90](xarray, index);
}

uint64_t xpc_array_get_uint64(xpc_object_t xarray, size_t index)
{
  return MEMORY[0x1F40CEA98](xarray, index);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1F40CEAA8](xarray, index);
}

void xpc_array_set_data(xpc_object_t xarray, size_t index, const void *bytes, size_t length)
{
}

uint64_t xpc_array_set_pointer()
{
  return MEMORY[0x1F40CEAE0]();
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
}

void xpc_array_set_uint64(xpc_object_t xarray, size_t index, uint64_t value)
{
}

void xpc_array_set_value(xpc_object_t xarray, size_t index, xpc_object_t value)
{
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

uint64_t xpc_connection_copy_invalidation_reason()
{
  return MEMORY[0x1F40CEB98]();
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBA8](name, targetq);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBD0](name, targetq, flags);
}

const char *__cdecl xpc_connection_get_name(xpc_connection_t connection)
{
  return (const char *)MEMORY[0x1F40CEC18](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1F40CEC68](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

uint64_t xpc_connection_set_target_user_session_uid()
{
  return MEMORY[0x1F40CECF0]();
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1F40CED28](object);
}

uint64_t xpc_create_with_format()
{
  return MEMORY[0x1F40CED88]();
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x1F40CED90](bytes, length);
}

xpc_object_t xpc_data_create_with_dispatch_data(dispatch_data_t ddata)
{
  return (xpc_object_t)MEMORY[0x1F40CEDA0](ddata);
}

size_t xpc_data_get_bytes(xpc_object_t xdata, void *buffer, size_t off, size_t length)
{
  return MEMORY[0x1F40CEDA8](xdata, buffer, off, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1F40CEDB0](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1F40CEDC0](xdata);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1F40CEE08](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

int xpc_dictionary_dup_fd(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEE50](xdict, key);
}

uint64_t xpc_dictionary_get_audit_token()
{
  return MEMORY[0x1F40CEE78]();
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEE80](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1F40CEE98](xdict, key, length);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEEA8](xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEC8](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEF8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEF10](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
}

void xpc_dictionary_set_fd(xpc_object_t xdict, const char *key, int fd)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x1F40CF040](object1, object2);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x1F40CF190](xint);
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x1F40CF208]();
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1F40CF248](object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1F40CF290](string);
}

size_t xpc_string_get_length(xpc_object_t xstring)
{
  return MEMORY[0x1F40CF2B8](xstring);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1F40CF2C8](xstring);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1F40CF330](xuint);
}

uint64_t xpc_user_sessions_enabled()
{
  return MEMORY[0x1F40CF340]();
}

uint64_t xpc_user_sessions_get_foreground_uid()
{
  return MEMORY[0x1F40CF348]();
}